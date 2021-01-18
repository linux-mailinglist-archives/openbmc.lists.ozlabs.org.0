Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2562FA352
	for <lists+openbmc@lfdr.de>; Mon, 18 Jan 2021 15:42:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DKDyc3ySCzDr2q
	for <lists+openbmc@lfdr.de>; Tue, 19 Jan 2021 01:42:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12c;
 helo=mail-lf1-x12c.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gNacpnhb; dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DKDxT6Bs7zDqNN
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jan 2021 01:41:14 +1100 (AEDT)
Received: by mail-lf1-x12c.google.com with SMTP id u25so24419385lfc.2
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jan 2021 06:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SIhA1mF+BYpThO8i2Iyz2DMFBxR5yWu2mUjR9REROfY=;
 b=gNacpnhbFHkDpwBHhaGHWGA3LLhitKbhOUvUv/KRjimoxCcZNhsr6Iy5M8mOD1mXHz
 JlxWIIy2UpK9eLy8n8+Gp27vMZmN4N45DTJei4m1JmW9MOEIw95Ulnl5+A8EZoUYORGU
 1mqaj0OvgSStl+z0KxXy/mrNovipqXAXiu8avgzEDcm9DBV4bkktBi40QJ9MOwPlxLBr
 cNtph0/TrpFgh77VSjqh2IA42rLousGy4TGLGxZS9asRN/ql4iq7+sX/MLfJ9AcZjU3H
 HzlS7EGiPCCdkzcHgLohe3dcavIWUpJiTHFnArqtsSmhE0iLhDyt3mn+GY6nubCfL+9e
 u8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SIhA1mF+BYpThO8i2Iyz2DMFBxR5yWu2mUjR9REROfY=;
 b=sTF1J8HEwu3ZOQy6GvX4v7Fl3zeEs26CZdfxO59UsSUg0au0HbzTSYJ686QesUDisP
 C5/ndhdmPsasG6KUaLM0je5RgoNtblC2iZiTZy1lu6VaaEJ09WEH4sXjygm8WoXPAeqQ
 cxYz9AwOrrrTkU9TjkIJ2rysE7OSUW78POwzkE2RqQgjVSGyn5DFylZsiSXhuT/iibtl
 ONim5W/IhQIw5hOSBJIUZnqHiKPbvG9bzJXMIn9PlxHiL7kaWD8CVYrVYMUGlfc9qJ06
 gMyV0VN6eNK/Sbsxcq83/9xi/yYuTvb3H0na/LofwdKd3Q0vrAgmDBbarK8fey4QaGmY
 SESw==
X-Gm-Message-State: AOAM532XMWx6etk6l/z1srm8zgr0FSc7LnTiNSI/nwKhO76MOdBXOcdL
 kcBWaxjrlMbBFBCDVMMrEeXj45gvpToAUixV4ExP7w==
X-Google-Smtp-Source: ABdhPJwqmgpPf8hJv9vGP5zEfW/r8eJtUSojunYR0APxeBQ1zFaQZN2Yp8arPP/uXr5O1AhiV5/uXYk3DE/AChKvJ9I=
X-Received: by 2002:a05:6512:3f3:: with SMTP id
 n19mr11634965lfq.586.1610980869125; 
 Mon, 18 Jan 2021 06:41:09 -0800 (PST)
MIME-Version: 1.0
References: <20210113223808.31626-1-hongweiz@ami.com>
 <20210113223808.31626-2-hongweiz@ami.com>
In-Reply-To: <20210113223808.31626-2-hongweiz@ami.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Jan 2021 15:40:57 +0100
Message-ID: <CACRpkdYpPkCvoEHH6Nu1LPv24JwRWANRTiwVa9cvjZaJeaa02Q@mail.gmail.com>
Subject: Re: [PATCH, v1 1/1] gpio: aspeed: Add gpio base address reading
To: Hongwei Zhang <hongweiz@ami.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jan 13, 2021 at 11:38 PM Hongwei Zhang <hongweiz@ami.com> wrote:

> Add gpio base address reading in the driver; in old code, it just
> returns -1 to gpio->chip.base.
>
> Fixes: 7ee2d5b4d4340353 ("ARM: dts: nuvoton: Add Fii Kudo system")
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>

NAK, sorry.

We never allow the device tree to specify this.

First, it is a Linux-only base so it would have to be a
"linux,..." property.

Even if it is a Linux-only property, it is a bad idea.

Only people using sysfs should have any need to specify global
GPIO numbers. Don't use sysfs. Use the GPIO character device
instead. See further:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpio/TODO

Yours,
Linus Walleij
