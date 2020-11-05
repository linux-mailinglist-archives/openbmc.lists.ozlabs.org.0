Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 509E02A81D2
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 16:05:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRmz54Xc1zDr58
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 02:05:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::144;
 helo=mail-lf1-x144.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HsiXs0VE; dkim-atps=neutral
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRmJl27rmzDqw2
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2020 01:35:15 +1100 (AEDT)
Received: by mail-lf1-x144.google.com with SMTP id i6so2633596lfd.1
 for <openbmc@lists.ozlabs.org>; Thu, 05 Nov 2020 06:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z309JsXWECO0iyDgtcmyju8F+C6v3OJkibkVpUPfi34=;
 b=HsiXs0VEUiEakbq3EXNQB/5+Q3y+7iqJsjnPA/Kth42Zs/uHRmD5ehYw+sWkcRqdRx
 L5FwizhETXi5cQBx+5LZ2BYMCgD7y341SmxGtQ0lyOipTVgC3nWqfSF4VYBzE0EmnSOH
 x17U3045IcT1LhWp3h/DtNF5qBJWlLCVS97E3FwUFhegzvIAyoa27/NhndNMO6Ohy7/i
 clz0AfYWo+OvOakT64KFovD6uvi+EXrJdBp2HAUUEui5OnJ9nwmNyCY1liq3bxrFqM2f
 wn7XubM0JOg3DfICI0O1voKT6Rms9hSTr0UR13OODY+xroSdkZ/bSDlOBZ/XfgZZ9P5x
 4MYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z309JsXWECO0iyDgtcmyju8F+C6v3OJkibkVpUPfi34=;
 b=D5Xyd+oaDMHoczw3dpjujNHJDZfAnc1jPKoIA1AdBv1uP9Dt6zVAt7ehVYBRTGdwMM
 4XHCHHLsWJeuG2+qjumIQhMF2tl+MyCF2NldbHfdSet2JAWOJOfiwqHoLn2WbdiJvBzu
 5MFd5ZYR2uRNvuLbKUlZ9LxGNmYxj6MP5LK565/mRcWx7T/QKWrTiMZLXgc8DtDIceXS
 Tm11hb8ZdNBAXIpoO836bW/+2D4SdQaIGOxZvVeXh0bvlnib1l/tC79mFTZ0CRg0AgL3
 ypHp0Joq2ECFC6iDY91SiHeFUYtVszPfpIGDQnIzCtgVWD2Z9yu/G/nibOI5bp31eyql
 Rn3A==
X-Gm-Message-State: AOAM532S+Skhh5XvQMpcu7cp/Ns8Nfy2PrRk0IaXWlpIoOfCqGoPazbv
 45F4bTpoNslboYhrBTAOz94RA0p1pU5H5pSvXpokDw==
X-Google-Smtp-Source: ABdhPJwi4+FDtHZuNaZ2D07E95crUVSI4V31HmhkquL7JVxvR4IkomX9YeN0u5y/BL+pxjnLsc2vjrD0BOna3+dEwDk=
X-Received: by 2002:a05:6512:322d:: with SMTP id
 f13mr1037730lfe.571.1604586909849; 
 Thu, 05 Nov 2020 06:35:09 -0800 (PST)
MIME-Version: 1.0
References: <20201027084417.10137-1-billy_tsai@aspeedtech.com>
 <20201030055450.29613-1-billy_tsai@aspeedtech.com>
In-Reply-To: <20201030055450.29613-1-billy_tsai@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Nov 2020 15:34:59 +0100
Message-ID: <CACRpkdY+oOWoEVEn8ECckYkUcDUJw2Ts4JMAu0bCbVxs3WNvZg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: aspeed: Fix GPI only function problem.
To: Billy Tsai <billy_tsai@aspeedtech.com>
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
Cc: BMC-SW@aspeedtech.com, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Oct 30, 2020 at 6:55 AM Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> Some gpio pin at aspeed soc is input only and the prefix name of these
> pin is "GPI" only.
> This patch fine-tune the condition of GPIO check from "GPIO" to "GPI"
> and it will fix the usage error of banks D and E in the AST2400/AST2500
> and banks T and U in the AST2600.
>
> Fixes: 4d3d0e4272d8 ("pinctrl: Add core support for Aspeed SoCs")
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Thanks Billy, patch applied for fixes!

Yours,
Linus Walleij
