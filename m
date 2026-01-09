Return-Path: <openbmc+bounces-1125-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF33D0C9D6
	for <lists+openbmc@lfdr.de>; Sat, 10 Jan 2026 01:27:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnzxG3vN6z2yFq;
	Sat, 10 Jan 2026 11:27:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767965687;
	cv=none; b=htVoCJjPA9CGGTjcMMeQ5maHc5Q9QBmo9jg7DXTKskwPTF418FJtplnsuiuaNgXDAn8kAqwqTbBr/eoJc/VZwmXjerP4ssj8dzTh6kxQUROZADeNn8Y2fthF8MQlkoOeYKLcRLrgEv3WsPAVkYk/O9jPOCTp/VJC+QqRyPAFEkB4D+Ik4YZSj5t/APwxPt0Kj5heFSVEwUOonB7Deko+hveHvlrfdwcS02rTue17LOzK6hmNhXb6U0WN1t/F3xhig2X07zJ75Vjnarun8qRSQuQJqknRLs2U5SvlQ/5fzRj86SPauvyEDmShmhtqb7nZmtiaBsAw4QsQU9eKz89wvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767965687; c=relaxed/relaxed;
	bh=qWzvjygcuLwzEIaEHIXEz9SaaWzpXF20ANBBtTSJsrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=moA5lntgD4swkwDIZTSsiqX0bUqMzHh4MtppP7pqekq2TysF9bbWNwC+4dGxSRJPMhNW4MFNrUhXWroKWXlPGHteq+VPDJAHOz6paMGhUmmdhe7v1jsAm3Ls7vcvxFm3XZElB4jZxMOS7XR8ZAOmSsmfcTGla/SuIzBJFM73qzi74qjM8/TwHnKx7k4+6x4UJSjFZk8+Ig/Ry2jzfjd/rz4fTTjYg3l6WXmTP2frZn0FkF9WA1lqOF0XX58eykFhINRJlPORQUCmv/UzEmpaLuHH679TDdBsR0vHLIKro8GJxGRFSKTrbf98JNzzyOyROmcXdiXOimhKTnaOOrkWYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pXlvPg28; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pXlvPg28;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnjS64T1mz2xc8
	for <openbmc@lists.ozlabs.org>; Sat, 10 Jan 2026 00:34:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 43AB460130
	for <openbmc@lists.ozlabs.org>; Fri,  9 Jan 2026 13:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFDA9C4CEF1
	for <openbmc@lists.ozlabs.org>; Fri,  9 Jan 2026 13:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767965654;
	bh=qWzvjygcuLwzEIaEHIXEz9SaaWzpXF20ANBBtTSJsrI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pXlvPg28ROYATVopjWOzBg5vR6kEbc/rx+T7qI0QvP2SRipywjvuMEbt9KtaaxSYT
	 xe41Bh4rKblR4UC3fgonuJIUAP1Scoti7w7lySstIJj1IljhPDfFwqgyMSZ5hkLhkV
	 hDwAKsaAklZBG6nfOBwnm/d727a3L+w3tVOlc3+2qmrFxxXMG9NSreOu1PRx0ID/T5
	 Sk06jar9d7TVaM5zvynCh40hUwRb9JggexRF+5nrKi96yMZ7+CqICc69PeGzLkg8zg
	 xqItjYKcEsy1nJZ42n/xGyGJudNUYjzO3ZEDujQGxtFPI33Kj01chsyagXJ1g1FxNG
	 AfDuGE1XUDtzQ==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-78fc4425b6bso43988997b3.1
        for <openbmc@lists.ozlabs.org>; Fri, 09 Jan 2026 05:34:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWhwTSCEr96m3ahdbYEy8s7h0VwaPUm854HjYZPhxPFkSHUkKiVw/qZN0QZ0EYtTX4tq4G2KCsG@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwWqCP3KVr5vMyOva0rMIKGE2Oqv1ZZF/7xQLopfGj3c9VmzFA8
	rVFIn2ybnmIkdfqC02fQXgd1nKTDFS3F0rIs5jpSs2Auwzfihpd44NsjQK1gyx7YS0K4ZVbnjQQ
	nprToeJESVBrRv++mX6X81RPppJMVvOg=
X-Google-Smtp-Source: AGHT+IFesI9TgGv8pGaGDvBFA25rqPyYSWQ/7ybS7ei3jmEtj0pUiPwxVn1yVv3/z2opC7z47lsPIXjgx7XM38IPl5Y=
X-Received: by 2002:a05:690e:118e:b0:640:d31d:6ed4 with SMTP id
 956f58d0204a3-64716c67b91mr8452143d50.51.1767965653394; Fri, 09 Jan 2026
 05:34:13 -0800 (PST)
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
Date: Fri, 9 Jan 2026 14:34:02 +0100
X-Gmail-Original-Message-ID: <CAD++jLk=9P3SaPgeuD46O_-D5xTKXiefRKenq2w8HVcv5rUdxw@mail.gmail.com>
X-Gm-Features: AZwV_QjuVx1piuHcehHbUq1Xzc5Kt25GKCC_RKdVxx8gfqJ7sqje1Z1f8fkkuKU
Message-ID: <CAD++jLk=9P3SaPgeuD46O_-D5xTKXiefRKenq2w8HVcv5rUdxw@mail.gmail.com>
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

Patch applied for Linux 7.0!

Yours,
Linus Walleij

