Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0B250970E
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 07:55:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkRbN56Nhz2ypZ
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 15:55:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=fjtgiHph;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d;
 helo=mail-qk1-x72d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=fjtgiHph; dkim-atps=neutral
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkRb13YZNz2xBV
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2022 15:55:09 +1000 (AEST)
Received: by mail-qk1-x72d.google.com with SMTP id d19so2897160qko.3
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2022 22:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0aP8loP2tK0/7LRUMZ2S4jyu4wcNaZuRcPC7tM6bQCg=;
 b=fjtgiHphPrcs+hlkAaflH2+vkbT2VYfqY7faNTjjFyJhio/rB/0Yrs86i159htwvkN
 exI5nnIGkaTihDqfvjiFZa59kwplxWUjpfMhTnf768EIJZZ0BvATZIUZa+a+cgyjbNLp
 cXTkTvymgrTeWSDqdWWP8SEt1G9SEpn0BNQZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0aP8loP2tK0/7LRUMZ2S4jyu4wcNaZuRcPC7tM6bQCg=;
 b=7n8ySUi21FAHsX7Yq4wBW2MummUc1IHKjytHNsQxvJbpI46BQOJ7lv4eAKimEj9OFT
 cc9SQX5HsovyrGvN+l6WU+HzWK31uN1Zh4Sh+zfwCl+zxSj58ZQhCTk369gLUZwaOISy
 N5KmatAQckSiefVYsaY6UN4VamPET7sO9gzC0PX8vePipTf5eo76AhcGPDFXehTBp4hM
 YwmHP2znmufdUSwp7VvVdND1e+E2EhI5LZ4VhnJQJGNkEpNL1nwIroS/LMZ58w1Ww1Ko
 du9GUOMxNxc2jijvqE7s5MglLT+6iOXOf9xIrLNjsTnpj1dKE4Mo6yPiDYsB+QOcunWs
 UcfA==
X-Gm-Message-State: AOAM531UJxnVDxm2tnE6nJsbQLDKl5nIj2mSd64JUJGh+iYCF+Uqr/AX
 INPCR2S5IQCYWTYIJKwMeV05Wi6npK0q7IM4GFA=
X-Google-Smtp-Source: ABdhPJzBBere5LzmEGv+eqzWHoz+tDVIlyuV0LS63Au1LcMeq6XJstWlEKrnRTgh+fpi8REaiyP9vVikNvXOShgFVdo=
X-Received: by 2002:a05:620a:1375:b0:69e:5deb:eb5e with SMTP id
 d21-20020a05620a137500b0069e5debeb5emr14754932qkl.53.1650520505773; Wed, 20
 Apr 2022 22:55:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220420102502.1791566-1-patrick.rudolph@9elements.com>
 <20220420102502.1791566-3-patrick.rudolph@9elements.com>
 <20220421054232.GC11809@packtop>
In-Reply-To: <20220421054232.GC11809@packtop>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 21 Apr 2022 05:54:53 +0000
Message-ID: <CACPK8Xd_WizczUpAbFg+oRZZJ9y2C5_67YXGzSXg84cY=2=wyQ@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 3/4] arm/mach-aspeed: Allow
 to disable WDT2
To: Zev Weiss <zweiss@equinix.com>
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
Cc: "christian.walter@9elements.com" <christian.walter@9elements.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Lei Yu <yulei.sh@bytedance.com>, "takken@us.ibm.com" <takken@us.ibm.com>,
 Patrick Rudolph <patrick.rudolph@9elements.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 21 Apr 2022 at 05:42, Zev Weiss <zweiss@equinix.com> wrote:
>
> On Wed, Apr 20, 2022 at 03:25:01AM PDT, Patrick Rudolph wrote:
> >There's no working code to poke the WDT2 and it takes too long for the
> >kernel to load to poke the watchdog. Selecting this Kconfig disables
> >the WDT2 and prevents 2nd firmware from being launched during normal boot.
> >
>
> I seem to recall Lei Yu (CCed) hitting problems with watchdog timeouts a
> little while back, which I think ended up being due to caches being
> disabled for some reason...have you done any measurements to try to
> determine what's causing it to take so long?

Yes. Some work is required in this area:

 - re-enable the dcache for the 2500. It works fine, and speeds up boot.

 - pat the watchdog so it doesn't expire when loading, or sitting at
the command prompt

An alternative is to disable the watchdog as we've done here. I'd lean
towards leaving it running (as then if there's a hang, the system will
reobot and try again).

>
> >Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> >---
> > arch/arm/mach-aspeed/ast2500/Kconfig    | 6 ++++++
> > arch/arm/mach-aspeed/ast2500/platform.S | 6 ++----
> > 2 files changed, 8 insertions(+), 4 deletions(-)
> >
> >diff --git a/arch/arm/mach-aspeed/ast2500/Kconfig b/arch/arm/mach-aspeed/ast2500/Kconfig
> >index 232117b43c..a9d880e557 100644
> >--- a/arch/arm/mach-aspeed/ast2500/Kconfig
> >+++ b/arch/arm/mach-aspeed/ast2500/Kconfig
> >@@ -33,6 +33,12 @@ config DRAM_UART_TO_UART1
> >       help
> >         Route debug UART to TXD1/RXD1 pins.
> >
> >+config FIRMWARE_DISABLE_2ND_BOOT
> >+      bool
> >+      prompt "Do not disable WDT2 for 2nd boot function"
> >+      help
> >+        Do not disable WDT2 for 2nd boot function.
>
> This seems a bit confusing -- for one thing, the config symbol name and
> the prompt/help text sound like opposites (one says "disable", the
> others say "do not disable").  A slightly more detailed explanation
> might be good.

+1, can you explain why you renamed the option when adding it to kconfig?

>
> >+
> > source "board/aspeed/evb_ast2500/Kconfig"
> > source "board/ibm/genesis3/Kconfig"
> >
> >diff --git a/arch/arm/mach-aspeed/ast2500/platform.S b/arch/arm/mach-aspeed/ast2500/platform.S
> >index aef55c4a0a..3eb9ee9419 100644
> >--- a/arch/arm/mach-aspeed/ast2500/platform.S
> >+++ b/arch/arm/mach-aspeed/ast2500/platform.S
> >@@ -95,7 +95,7 @@
> >  *    CONFIG_DDR3_8GSTACK         // DDR3 8Gbit Stack die
> >  *    CONFIG_DDR4_4GX8            // DDR4 4Gbit X8 dual part
> >  * 5. Firmware 2nd boot flash
> >- *    CONFIG_FIRMWARE_2ND_BOOT (Removed)
> >+ *    CONFIG_FIRMWARE_DISABLE_2ND_BOOT
> >  * 6. Enable DRAM extended temperature range mode
> >  *    CONFIG_DRAM_EXT_TEMP
> >  * 7. Select WDT_Full mode for power up initial reset
> >@@ -642,13 +642,11 @@ bypass_USB_init:
> > /******************************************************************************
> >  Disable WDT2 for 2nd boot function
> >  ******************************************************************************/
> >-/*
> >-#ifndef CONFIG_FIRMWARE_2ND_BOOT
> >+#if CONFIG_FIRMWARE_DISABLE_2ND_BOOT
> >     ldr   r0, =0x1e78502c
> >     mov   r1, #0
> >     str   r1, [r0]
> > #endif
> >-*/
> > /******************************************************************************
> >  Disable WDT3 for SPI Address mode (3 or 4 bytes) detection function
> >  ******************************************************************************/
> >--
> >2.35.1
> >
