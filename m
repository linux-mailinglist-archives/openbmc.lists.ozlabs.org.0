Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57892522DA0
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 09:49:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kyn9S2MX4z3c8B
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 17:49:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=AHRoQyxl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::431;
 helo=mail-wr1-x431.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=AHRoQyxl; dkim-atps=neutral
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kyn945FVXz2x9v
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2022 17:48:55 +1000 (AEST)
Received: by mail-wr1-x431.google.com with SMTP id x18so1779611wrc.0
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2022 00:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ij0w9hpdmFN16kKPK6bMw6TL7O2YR+Ni+AxWIEc5yJQ=;
 b=AHRoQyxlDBtxFHBJBnetIlpAFBjdr0681LcpPgMeabnqWQtB/VFCj7FglfliEHAapY
 Cwm0bCZJaI20VL8DvTCoX8qYcrPdA1b5W+3GOsm/6uvEWxIIyPzK5ORQY18tHR/m1h9t
 dmyQqd5+IspBvlawsLneUrUhfUy/K7mbV98WM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ij0w9hpdmFN16kKPK6bMw6TL7O2YR+Ni+AxWIEc5yJQ=;
 b=zqoJg8Hjg6Dvn7cjpwHaoM1sjBRYxtaBztKzP9Ylq3nwOL5KRZxLDYVUvzHmpxJlzC
 SaFG/CmJejQqDkid3lYMflJSsMzGCvT0uYAHeeBRjsezIxKQ1WblDGLws6EXeR0xM1Zz
 eve+LtliZpwvndubF+J3jdbFvlF0kqVMoI6VC5GW4lUg9Ry2Z420Xrvej61vveIm/Hd+
 xPMyMF3t6wPJrjj9oUWdH6haA4kcMasgaIbZbO3S6Oqr3Q4QLBEXsIpGt6IkrUAp9C43
 J2RBJTKuSNKDFXLawOJ/p0lH2oEvTfWM+YBYQSVIDwQzr1F9nGHskyOeFK8E0m1Ephru
 ssoQ==
X-Gm-Message-State: AOAM5329lMui1Rm1LmWruxg5xVzborp8XOMBTns1OyoCzQHh11sXONVQ
 neZPjj264+wd5Q3wBuOcBEIP3Emn77ncnZyxyWo=
X-Google-Smtp-Source: ABdhPJx26jrJuX6ubpKK7l+J23eWZjPVbjttW7fdFr15zEnx99bZy9JtUCKA5rekEIqFqSBUaaJes2eKskiLiZXC210=
X-Received: by 2002:a5d:6ac4:0:b0:20a:dd04:81da with SMTP id
 u4-20020a5d6ac4000000b0020add0481damr20805031wrw.705.1652255332778; Wed, 11
 May 2022 00:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220421083151.1887871-1-patrick.rudolph@9elements.com>
 <20220421083151.1887871-4-patrick.rudolph@9elements.com>
In-Reply-To: <20220421083151.1887871-4-patrick.rudolph@9elements.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 May 2022 07:48:40 +0000
Message-ID: <CACPK8XfRDnrhdOf1O70dwcdJ_YOjnq9+8U=QWtC6Tdt1dQtcYA@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2 3/4] arm/mach-aspeed:
 Allow to disable WDT2
To: Patrick Rudolph <patrick.rudolph@9elements.com>
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
Cc: christian.walter@9elements.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 takken@us.ibm.com, Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 21 Apr 2022 at 08:32, Patrick Rudolph
<patrick.rudolph@9elements.com> wrote:
>
> The IBM Genesis3 supports booting from second flash using WDT2, but
> there's no working code to poke the WDT2 and it takes too long for the
> kernel to load to poke the watchdog.
>
> As it's an evaluation platform disable this feature for now.
> Unselecting this Kconfig disables the WDT2 in early platform code and
> prevents 2nd firmware from being launched during normal boot.

There's a lot of negatives here. We're disabling code that disables
the watchdog that is enabled/disabled by the strapping.

Your patch is un-commenting the code that disables the watchdog.

It's then adding a Kconfig symbol to enable this code, but the Kconfig
is inverted: it defaults to true and disables the code.

I think we could make it simpler: make the Kconfig like a normal
kconfig that defaults to n. This is what you did in v1. Re-reading
that email both Zev and I asked for an explanation to justify why
there was the double negative. I think explaining what is going on as
we suggested is a better outcome than your v2.

As I said in that mail, the u-boot tree would be better off adding
code to pat the watchdog. This would solve your problem, and the
problem that others have had.

>
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> ---
>  arch/arm/mach-aspeed/ast2500/Kconfig    | 10 ++++++++++
>  arch/arm/mach-aspeed/ast2500/platform.S |  6 ++----
>  2 files changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/mach-aspeed/ast2500/Kconfig b/arch/arm/mach-aspeed/ast2500/Kconfig
> index e7ff00cdba..1882d6186e 100644
> --- a/arch/arm/mach-aspeed/ast2500/Kconfig
> +++ b/arch/arm/mach-aspeed/ast2500/Kconfig
> @@ -23,6 +23,16 @@ config DRAM_UART_TO_UART1
>         help
>           Route debug UART to TXD1/RXD1 pins.
>
> +config FIRMWARE_2ND_BOOT
> +       bool
> +       default y
> +       prompt "Keep WDT2 running to support the firmware 2nd boot"
> +       help
> +         Saying yes here let the WDT2 running (if configured by
> +         hw straps) and allows the platform to boot from 2nd
> +         SPI flash if WDT2 isn't poked withing 22 seconds.
> +         Saying no disables the WDT2 in early platform initialisation.
> +
>  source "board/aspeed/evb_ast2500/Kconfig"
>
>  endif
> diff --git a/arch/arm/mach-aspeed/ast2500/platform.S b/arch/arm/mach-aspeed/ast2500/platform.S
> index aef55c4a0a..a3961bc4f8 100644
> --- a/arch/arm/mach-aspeed/ast2500/platform.S
> +++ b/arch/arm/mach-aspeed/ast2500/platform.S
> @@ -95,7 +95,7 @@
>   *    CONFIG_DDR3_8GSTACK         // DDR3 8Gbit Stack die
>   *    CONFIG_DDR4_4GX8            // DDR4 4Gbit X8 dual part
>   * 5. Firmware 2nd boot flash
> - *    CONFIG_FIRMWARE_2ND_BOOT (Removed)
> + *    CONFIG_FIRMWARE_2ND_BOOT
>   * 6. Enable DRAM extended temperature range mode
>   *    CONFIG_DRAM_EXT_TEMP
>   * 7. Select WDT_Full mode for power up initial reset
> @@ -642,13 +642,11 @@ bypass_USB_init:
>  /******************************************************************************
>   Disable WDT2 for 2nd boot function
>   ******************************************************************************/
> -/*
> -#ifndef CONFIG_FIRMWARE_2ND_BOOT
> +#if !defined(CONFIG_FIRMWARE_2ND_BOOT)
>      ldr   r0, =0x1e78502c
>      mov   r1, #0
>      str   r1, [r0]
>  #endif
> -*/
>  /******************************************************************************
>   Disable WDT3 for SPI Address mode (3 or 4 bytes) detection function
>   ******************************************************************************/
> --
> 2.35.1
>
