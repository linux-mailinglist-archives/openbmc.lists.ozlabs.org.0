Return-Path: <openbmc+bounces-1083-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C017CEF9EE
	for <lists+openbmc@lfdr.de>; Sat, 03 Jan 2026 02:22:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djjTz72BDz2yFW;
	Sat, 03 Jan 2026 12:22:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767217055;
	cv=none; b=ONhnaXelACus2HZiPkv/zaq2d2R10hMULot3j5bKUIdZ1Q69vptpc64kMtNC/NeFyKN2Hsg2GMjJK1e64Y/cFEg3ApDbJDl7wSrWeWDVJoJmzCYsDuZIk9mZogkBfqQvSd+qKDVMTHe1P07M/EZ7vVVybkdnQbxSInE9rzDNFsQUu1Um/mUwuyZmB7Oezv4nE6GC1iPnVTjABUxICZgm3kBjK9sAt6P2MB0PBbxiL6kxqBgxadG+5ARmOardKjiqGaoRktMKDtn03RhdMRVMX0feU1SEOl///h0wdQAUzSKBgnrUgARRlNORAWTuy2UHbnpIsdy7SvQVlIQOBzHePw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767217055; c=relaxed/relaxed;
	bh=3Rfnf2qhGGwgV00DUgX+jw89Q5Q97DzPe9bYdiAb1ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YUalhNjHpz2SX6NE3fj0VrnJ/ra6fj/vypk2q7pjXgVdf1YBFMCPXrY/CxWDD5Ty9ujK/0acUFGFm8n2xHpk2sUjLMB3ueXp3JBoBEkH+d3GuCKBQiWYEXkdpGhCDfQTx1ujhX5uFHJ9oIEjub+vjc3EEjsx81IyA7ble2RcWMaX6bIIgT2bJJqHkEwwa98Nr5QbwuE2m2F/t8WhkytBUqJ+lsg2UckpPZJ+Ic+TjH3eN7iHuMAfb2coMXVSQK3OTn9M1yPR1ASmBnF5ZE4sJ//QZRlrcfeRQ95Jyp66LOMAmRZPtJH9WajCtKgWYnMuzJ3uSX/gH8ZkP0tNk8IODQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S/myJmuv; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S/myJmuv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dhNbL5r0kz2x99
	for <openbmc@lists.ozlabs.org>; Thu, 01 Jan 2026 08:37:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 85302443BF
	for <openbmc@lists.ozlabs.org>; Wed, 31 Dec 2025 21:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F125C2BCB1
	for <openbmc@lists.ozlabs.org>; Wed, 31 Dec 2025 21:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767217047;
	bh=3Rfnf2qhGGwgV00DUgX+jw89Q5Q97DzPe9bYdiAb1ps=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=S/myJmuvkQhoJ8EppRf3vex1oHqN6qlqOFLVY9fq6nDRgajD26aH7kRPXmgv928XN
	 DF+TI78MG0UkXzZMdQuw/GlDgWSTvvxshjuoWDv9HPqT/ygN9fSm4tM6/4gtAfbWRo
	 QzgG3od32ACcdrA4U/CqlZorWWrLyM+hVKKc9JprOQAISIoIWyWLrac6n3tEKlvdbz
	 pn7SDd/cIIVAUBaCaNAtbKkHkMk4EWxb3ubqdSGLJYW7BHJG77tQL9PBBKd5n9kxil
	 vefx2gkquaNmsHtp/u9YwXN07/1/wFU4m8CwszxqBuN+8dVBrt7VZWgJ48dhsHZj/v
	 RFgKGQWveyeJQ==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-641e9422473so9139469d50.2
        for <openbmc@lists.ozlabs.org>; Wed, 31 Dec 2025 13:37:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWMM7G/36YR/BqOBzVrFF9W1+/ZPs33UIUHHaP4X3vu835e2V6lYLBEUx0j5vdJU5v6JbyT0vgg@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyN691WxjuY80e5WRVEwgcgaAhvn6bbmp2igMAzTAa3f6mRfKVS
	ki5wJt3JB9K/MBe+SEhEJ+Mtl5o3HoQ+B45vV4MpTVAgtxm+s8k1QxX5ilAgyAK9TddMXfUnw+W
	YScHkxW+5BsfqR3W1B4Y136BrQbsUkz4=
X-Google-Smtp-Source: AGHT+IHHeH8zJG7rfiI2GFfedkzIC0YK/SbYafxSnkK2MFdRLnSCHEYor5QZDiE7b0zGilhY27fuPDjyGexn5uPgcoQ=
X-Received: by 2002:a05:690c:3803:b0:78f:984b:4bb5 with SMTP id
 00721157ae682-78fb40c5f09mr590051547b3.64.1767217046540; Wed, 31 Dec 2025
 13:37:26 -0800 (PST)
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
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
 <20251211-dev-dt-warnings-all-v1-2-21b18b9ada77@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-2-21b18b9ada77@codeconstruct.com.au>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 31 Dec 2025 22:37:15 +0100
X-Gmail-Original-Message-ID: <CAD++jLmNGrDt3_w=DFnBnjEuz3LN-=uc1o9KHv1j=4gbGPoPQg@mail.gmail.com>
X-Gm-Features: AQt7F2oNijhkSY2l2xLUahhHBTqPWX5BBKamnMGV8HdX2c29O6a9KTnJl-DXNNE
Message-ID: <CAD++jLmNGrDt3_w=DFnBnjEuz3LN-=uc1o9KHv1j=4gbGPoPQg@mail.gmail.com>
Subject: Re: [PATCH RFC 02/16] pinctrl: aspeed: g5: Constrain LPC binding
 revision workaround to AST2500
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Dec 11, 2025 at 9:46=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:

> Discovering a phandle to an AST2400 or AST2600 LPC node indicates an
> error for the purpose of the AST2500 pinctrl driver.
>
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Also pretty obviously correct, can't I just apply this one?

Yours,
Linus Walleij

