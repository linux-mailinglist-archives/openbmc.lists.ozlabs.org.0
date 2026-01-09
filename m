Return-Path: <openbmc+bounces-1126-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83154D0C9DC
	for <lists+openbmc@lfdr.de>; Sat, 10 Jan 2026 01:28:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnzxm091Vz2yFp;
	Sat, 10 Jan 2026 11:27:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767952597;
	cv=none; b=U+RqsmFNQK99buYfZXfY6Cuu3eeMwTLF0s1m1RAKExUQ9tZqPfL5hiqW/EyHpYIiOtmsCyDZmQ+T8/EwkP9UYme5aZInD7WXKc1+DnK2wzQWGeX026Synkg0LtYkxjZfeWXIXtREypz4b6pV5cI69htGzWBJ8+/1xh3qLHTVkBrPhH/wVJGeYhaLc7OOQcxKEaxWVC/dDi9iXvv/CpWz6IsdKwpuPJsPN9i6Ijafgpom9netx8OcbAl4uk52LiTKC7zrugIMY1Gez4dBjA7ed+pXLkUL9R431uX4wsj9xxbvzOsuRpsc55Cs6BPXu9JKBTnzXEnLUJBG9Frzk4gvLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767952597; c=relaxed/relaxed;
	bh=DSyNbAvOTaUzouhjCtVk/rpg715I1crhI66xNFxS4AA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nhad7wb0Tn8a8yFDwmbfDaxvhKj7xCKwnDdrMvvJK98y8IIdFPdvbYV7hmheuiasJvugh6APJMZ5liZdxpN75CHn4uh0FPraNhi8SXFHghICSl9DxPLvwGlrrDoa9CQWZT5+8MjDu93xGUfrk3uqqxfKcxyhUugUXK6U62EMcCXwfCf5oCyhGsjyBdgJq9T+K0fqe56oHruQpJTT3H2aUbAUvAEnBQGqUHjs87HPz0LRwytkYD4uFSjCydgtjCGmIGAfV6NHOn1eTA45F0idKt7ZqgDs8wz6IKa9QUiuEpFbnZARPS6Sr8SZuyxClQlYB5dzxMO1CBLprf4NAzb17g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rjH/mdA2; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rjH/mdA2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnccN4PwFz2xP8
	for <openbmc@lists.ozlabs.org>; Fri, 09 Jan 2026 20:56:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CFCAE60166
	for <openbmc@lists.ozlabs.org>; Fri,  9 Jan 2026 09:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88373C19422
	for <openbmc@lists.ozlabs.org>; Fri,  9 Jan 2026 09:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767952563;
	bh=DSyNbAvOTaUzouhjCtVk/rpg715I1crhI66xNFxS4AA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rjH/mdA2srq8znT1uGJDItvQmegEyur3byLKEWO8jTkQlz1Ot2IvCPDxqu41XWSbh
	 Mc5/Ad5wfK69UN5idior2Z7GZG3H3CRIvvJn1yBBZZX9j6HG/akUN/xB6SSAPfoDRD
	 AirTojGgb0B2LPUPI70QcpD+6KPXkM7VLRwllEIXXWPsgKqN599GxGfwFCqs4tj8lS
	 6eog5dJO0zHjCVnFH1SsofRdorO3fIgfkA+T3G8yurYjwUq0pUH9V7x7qCbK7BNFPt
	 vAjHvTXb2f1uNyhGWTGs9oy9Q0PIckP74QX1w3QZZ7Zhkr6zYCBmQyXQ8LhkpDJNU5
	 1BCueP/70yj7g==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79018a412edso43009077b3.0
        for <openbmc@lists.ozlabs.org>; Fri, 09 Jan 2026 01:56:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXSXFN8Mhtw+u5MFsjyjCEn9KXEmLe4gYdIrMXLRZtTA2yY/TFSWkuh/2EFU845gyZY+OIcxDKj@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzXS3SA8/RYMiZQlORMFQlx5C3xTU4JaL4o1Ky9oYD0cErBFykU
	aIkZTvV1ZQslDPPR7GIkjStNB8cOl3xXJBC3lIdSASHNP5m3CPMcKiDce8v5000LqoPaUGPG9Ci
	Oj5WhXLRuEz9SNi3H63rLc80Y1Y/QY1s=
X-Google-Smtp-Source: AGHT+IFgkGc+9WHxgyU0wVu1UsG1ytYJawwgRqc9XY8l1kbWk/e0y0zH/hKYorgli16modqWGQavb0cGATDvK51xbew=
X-Received: by 2002:a05:690e:1486:b0:644:60d9:7524 with SMTP id
 956f58d0204a3-64716c42c66mr7824043d50.86.1767952562943; Fri, 09 Jan 2026
 01:56:02 -0800 (PST)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20260109-axiado-ax3000-cadence-gpio-support-v2-0-fc1e28edf68a@axiado.com>
 <20260109-axiado-ax3000-cadence-gpio-support-v2-1-fc1e28edf68a@axiado.com>
In-Reply-To: <20260109-axiado-ax3000-cadence-gpio-support-v2-1-fc1e28edf68a@axiado.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 9 Jan 2026 10:55:51 +0100
X-Gmail-Original-Message-ID: <CAD++jLn6yp7rej10rLu2rXU5Tyr-U9AXr92qXha-MX382DNKrQ@mail.gmail.com>
X-Gm-Features: AZwV_QjOJWf6ERPWnlhe66TBqMc29KxRESN5EqmejvusCRWoi1K95_C9T7bF664
Message-ID: <CAD++jLn6yp7rej10rLu2rXU5Tyr-U9AXr92qXha-MX382DNKrQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: cadence: Add quirk for Axiado AX3000 platform
To: Swark Yang <syang@axiado.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, Tzu-Hao Wei <twei@axiado.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jan 9, 2026 at 10:26=E2=80=AFAM Swark Yang <syang@axiado.com> wrote=
:

> On the Axiado AX3000 platform, pinmux and pin configuration (such as
> direction and output enable) are configured by the hardware/firmware
> at boot time before Linux boots.
>
> To prevent conflicts, introduce a platform-specific quirk triggered by
> the "axiado,ax3000-gpio" compatible string.
>
> When this quirk is active, the driver will skip its default
> initialization of pinmux configuration and direction settings during
> probe.
>
> Co-developed-by: Tzu-Hao Wei <twei@axiado.com>
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
> Signed-off-by: Swark Yang <syang@axiado.com>

Yes, exactly like this!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

