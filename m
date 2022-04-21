Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7189F50EE86
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 04:09:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnQL82rKWz2xfC
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 12:09:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=LPd+HGU6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=9elements.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=patrick.rudolph@9elements.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256
 header.s=google header.b=LPd+HGU6; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkWDd15CTz2xtQ
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2022 18:39:27 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id iq10so575757pjb.0
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2022 01:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iyVX01vepZ3mG22nb4pIjiT7SLAj+4KY2LGS4f5/uvk=;
 b=LPd+HGU6TOt9ja6czacNcqYyM28LjZfQu4U3KKDTbxeDheI8t5/i+P5sk4AwQ5L3oa
 ZGsZqiqpelIUIl7h/4dQUVKByddSVF8QGhnvBMih1N0VqH20rzAfytxwomRzSDnrEI74
 xTqbSMyDqVOS4zzlEEl81jsKxAXkNxLo/0Za0HR8w4WlbW5dnuhQ3oaFVx9e51KRGvVa
 CvCBxcj2KkhlPoNGrIayX5FDSF6lsnVHtDpPpkUPDBKhHV/phM+QqYoti6+yvmtC29ly
 YaBZfp/x7Hh93tpYV+5OC/2GIag0zWro6v1/SMjE+/0H1np4nRoSSXlwTmKSuIxvabMY
 XhHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iyVX01vepZ3mG22nb4pIjiT7SLAj+4KY2LGS4f5/uvk=;
 b=0Tx2UYcScH3ogitn4/5uLDyVV8dxw5u22ZhcQtGj72LFXAHXOMVHOcNme5xA8U6ofR
 ushdwz9BQ7lfCo9Jd4wmFOuy9qiDesSiuSNdjrj6Vf7qG9J3NiDcokqPrKqrOKrkAX6F
 r2/t8K3I2fWoSYBqb2M6fjYsvTRKbWL6ByRzJRuz15SU4LdnLGyBmMsZCCWJmcO8LEXD
 aXN97pOOLubV6iOFia7UT99FS/nRfR7g0NrIwkFQb5Ec808SPrgz/nizKFBE2FbT6UJR
 mVJmd+jtRLCq0YmhtLE6rxJuxwG8JcyhyUYdDOTlmMj911LqqvP/a12Dl94y2XM7SDSI
 L9Iw==
X-Gm-Message-State: AOAM533cmX1BZzDdKksSuwwEtKb/QZDeyfSoIxHOCi4TDRItXXcAH5C7
 GUN4txromRqIJYCKyGPs+mcatfkAxOC8Kpmc3tUmPw==
X-Google-Smtp-Source: ABdhPJyKIY0EaU7iclW/36yPCE12oy0XzAs215pNMpuxDTWBRMSNjM/bLX+W507SDmqk8Hy61RvyqyWp1JUXndIqOJ0=
X-Received: by 2002:a17:902:ef45:b0:156:1858:71fc with SMTP id
 e5-20020a170902ef4500b00156185871fcmr24427710plx.23.1650530363907; Thu, 21
 Apr 2022 01:39:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220420102502.1791566-1-patrick.rudolph@9elements.com>
 <20220420102502.1791566-3-patrick.rudolph@9elements.com>
 <20220421054232.GC11809@packtop>
 <CACPK8Xd_WizczUpAbFg+oRZZJ9y2C5_67YXGzSXg84cY=2=wyQ@mail.gmail.com>
In-Reply-To: <CACPK8Xd_WizczUpAbFg+oRZZJ9y2C5_67YXGzSXg84cY=2=wyQ@mail.gmail.com>
From: Patrick Rudolph <patrick.rudolph@9elements.com>
Date: Thu, 21 Apr 2022 10:39:13 +0200
Message-ID: <CALNFmy15DzYeRDAb3GE2k4KvaFQSUO55TY_+5wEeXHrktWGqQw@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 3/4] arm/mach-aspeed: Allow
 to disable WDT2
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 26 Apr 2022 12:05:01 +1000
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
 Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,
I enabled the DCACHE which seems to make it boot a bit faster.
As this is a evaluation platform and the successor is not using AST2500 any=
 more
so no further investigation had been done.

I've reworked the description and removed the double negation.

Regards,
Patrick Rudolph
B.Sc. Electrical Engineering
System Firmware Developer

9elements GmbH, Kortumstra=C3=9Fe 19-21, 44787 Bochum, Germany
Email: patrick.rudolph@9elements.com
Phone:  +49 234 68 94 188

Sitz der Gesellschaft: Bochum
Handelsregister: Amtsgericht Bochum, HRB 17519
Gesch=C3=A4ftsf=C3=BChrung: Sebastian Deutsch, Eray Basar

Datenschutzhinweise nach Art. 13 DSGVO

On Thu, Apr 21, 2022 at 7:55 AM Joel Stanley <joel@jms.id.au> wrote:
>
> On Thu, 21 Apr 2022 at 05:42, Zev Weiss <zweiss@equinix.com> wrote:
> >
> > On Wed, Apr 20, 2022 at 03:25:01AM PDT, Patrick Rudolph wrote:
> > >There's no working code to poke the WDT2 and it takes too long for the
> > >kernel to load to poke the watchdog. Selecting this Kconfig disables
> > >the WDT2 and prevents 2nd firmware from being launched during normal b=
oot.
> > >
> >
> > I seem to recall Lei Yu (CCed) hitting problems with watchdog timeouts =
a
> > little while back, which I think ended up being due to caches being
> > disabled for some reason...have you done any measurements to try to
> > determine what's causing it to take so long?
>
> Yes. Some work is required in this area:
>
>  - re-enable the dcache for the 2500. It works fine, and speeds up boot.
>
>  - pat the watchdog so it doesn't expire when loading, or sitting at
> the command prompt
>
> An alternative is to disable the watchdog as we've done here. I'd lean
> towards leaving it running (as then if there's a hang, the system will
> reobot and try again).
>
> >
> > >Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> > >---
> > > arch/arm/mach-aspeed/ast2500/Kconfig    | 6 ++++++
> > > arch/arm/mach-aspeed/ast2500/platform.S | 6 ++----
> > > 2 files changed, 8 insertions(+), 4 deletions(-)
> > >
> > >diff --git a/arch/arm/mach-aspeed/ast2500/Kconfig b/arch/arm/mach-aspe=
ed/ast2500/Kconfig
> > >index 232117b43c..a9d880e557 100644
> > >--- a/arch/arm/mach-aspeed/ast2500/Kconfig
> > >+++ b/arch/arm/mach-aspeed/ast2500/Kconfig
> > >@@ -33,6 +33,12 @@ config DRAM_UART_TO_UART1
> > >       help
> > >         Route debug UART to TXD1/RXD1 pins.
> > >
> > >+config FIRMWARE_DISABLE_2ND_BOOT
> > >+      bool
> > >+      prompt "Do not disable WDT2 for 2nd boot function"
> > >+      help
> > >+        Do not disable WDT2 for 2nd boot function.
> >
> > This seems a bit confusing -- for one thing, the config symbol name and
> > the prompt/help text sound like opposites (one says "disable", the
> > others say "do not disable").  A slightly more detailed explanation
> > might be good.
>
> +1, can you explain why you renamed the option when adding it to kconfig?
>
> >
> > >+
> > > source "board/aspeed/evb_ast2500/Kconfig"
> > > source "board/ibm/genesis3/Kconfig"
> > >
> > >diff --git a/arch/arm/mach-aspeed/ast2500/platform.S b/arch/arm/mach-a=
speed/ast2500/platform.S
> > >index aef55c4a0a..3eb9ee9419 100644
> > >--- a/arch/arm/mach-aspeed/ast2500/platform.S
> > >+++ b/arch/arm/mach-aspeed/ast2500/platform.S
> > >@@ -95,7 +95,7 @@
> > >  *    CONFIG_DDR3_8GSTACK         // DDR3 8Gbit Stack die
> > >  *    CONFIG_DDR4_4GX8            // DDR4 4Gbit X8 dual part
> > >  * 5. Firmware 2nd boot flash
> > >- *    CONFIG_FIRMWARE_2ND_BOOT (Removed)
> > >+ *    CONFIG_FIRMWARE_DISABLE_2ND_BOOT
> > >  * 6. Enable DRAM extended temperature range mode
> > >  *    CONFIG_DRAM_EXT_TEMP
> > >  * 7. Select WDT_Full mode for power up initial reset
> > >@@ -642,13 +642,11 @@ bypass_USB_init:
> > > /********************************************************************=
**********
> > >  Disable WDT2 for 2nd boot function
> > >  ********************************************************************=
**********/
> > >-/*
> > >-#ifndef CONFIG_FIRMWARE_2ND_BOOT
> > >+#if CONFIG_FIRMWARE_DISABLE_2ND_BOOT
> > >     ldr   r0, =3D0x1e78502c
> > >     mov   r1, #0
> > >     str   r1, [r0]
> > > #endif
> > >-*/
> > > /********************************************************************=
**********
> > >  Disable WDT3 for SPI Address mode (3 or 4 bytes) detection function
> > >  ********************************************************************=
**********/
> > >--
> > >2.35.1
> > >
