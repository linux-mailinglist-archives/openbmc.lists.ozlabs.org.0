Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B865E36E7C
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 10:23:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KJbB5kkHzDqWp
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 18:23:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=franhsutw@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nz8m2YnW"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KJZ84p29zDqf3
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jun 2019 18:22:56 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id p1so632620plo.2
 for <openbmc@lists.ozlabs.org>; Thu, 06 Jun 2019 01:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=i6ff852csDVeCl+ed2F8JStCQnUeQWLSuAR45XhM0kY=;
 b=Nz8m2YnW8rGJr01pXnXFZHVDBt6vPt+e2dDthZo5padmWgYG8bhaaptGqrAo50D9PF
 TXrHkfOMWIysHKtd1kX1ufdEtUllaiUY2hqTeC7FJvUizN2k8wtNW3/m41Pd7QynW10f
 s3dmQ9wPB6uB6q5hfLWG7LNqZR2/6x2vPMYhm+MYreNGZkcVjSaXhSOZje5vYOQne0Ay
 feRlibMz4LcufwAVn5ZPscRnPQ/RZUDya5dN6tBAyUY9vuJWuW6yf2bdc33k1MVu1+Q1
 VLPafA8A3tTIXDSAgifkIcTe0apZ1BQNFTcPXGIEllURPiLrj4jzA01Hb98ySXEpAVwb
 1YxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:content-language
 :thread-index;
 bh=i6ff852csDVeCl+ed2F8JStCQnUeQWLSuAR45XhM0kY=;
 b=OR6wgU39Anm6reF2dEjBcydy0ngDPKM74luE/ZC7okCN/bteEO4yt2o+TPR9feP+9p
 WlIHr+uKLRtwPpqyaNLTUosicbWalU3eYtE+2suMhNQOGwbnT2Ys8saU5/TVYoaMObVX
 Jyt3vYL6jF0E2Q+uIuqPtTPW+ByW0NFMawlAb4wiIWj1I8ezhUhFEHgOL6CbxBm2sVq/
 1z7/X9yjXp4YfvF3pHmLuvnipCbISiQVJ7yf26riti7jnSsNkmjIHmY7dSeZKT2J+SpZ
 +N9apCYH31MTqqjSM2lGLqnFeOvTZaXBSLIK4/g0DpizimQRbBfSboogaP58YOD5aGfM
 XOYQ==
X-Gm-Message-State: APjAAAXxt2kNKeQiVwwhNxtA5OFjCbP5pB6yxam+E1WOB33aoAnVK5a5
 1hVCE4ZYo3Fb1sgrYSHJPwQ=
X-Google-Smtp-Source: APXvYqxEhfflAgq7LGcpIkDXIB9DLlCWAqE4KLJjY/z1ARZCU9cePNDXU7dYzfh6mjH15nJGG/1trg==
X-Received: by 2002:a17:902:1126:: with SMTP id
 d35mr49581471pla.82.1559809372075; 
 Thu, 06 Jun 2019 01:22:52 -0700 (PDT)
Received: from FranNI7 (220-135-135-179.HINET-IP.hinet.net. [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id
 u2sm1191719pjv.30.2019.06.06.01.22.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Jun 2019 01:22:51 -0700 (PDT)
From: franhsutw@gmail.com
X-Google-Original-From: <FranHsuTW@gmail.com>
To: "'Joel Stanley'" <joel@jms.id.au>
References: <20190605133625.991-1-Fran.Hsu@quantatw.com>
 <CACPK8Xf64=0SdFd9NSt+7F32fH4ndrezx2cHXQwjh0S70vaOYQ@mail.gmail.com>
In-Reply-To: <CACPK8Xf64=0SdFd9NSt+7F32fH4ndrezx2cHXQwjh0S70vaOYQ@mail.gmail.com>
Subject: RE: [PATCH dev-5.1 v6 1/4] ARM: dts: nuvoton: Add NPCM730 common
 device tree include file.
Date: Thu, 6 Jun 2019 16:22:29 +0800
Message-ID: <043701d51c41$0917bbe0$1b4733a0$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-tw
Thread-Index: AQJO7lJV805gGzT+BuFfLHiV3ZBGvwKzU3wNpYUKTFA=
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
Cc: 'OpenBMC Maillist' <openbmc@lists.ozlabs.org>,
 'Fran Hsu' <Fran.Hsu@quantatw.com>, 'Benjamin Fair' <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,
	Thanks, I will update the new patch to fix the warning message issue soon.

Fran

> -----Original Message-----
> From: Joel Stanley <joel@jms.id.au>
> Sent: Thursday, June 6, 2019 10:05 AM
> To: Fran Hsu <franhsutw@gmail.com>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>; Benjamin Fair
> <benjaminfair@google.com>; Fran Hsu <Fran.Hsu@quantatw.com>
> Subject: Re: [PATCH dev-5.1 v6 1/4] ARM: dts: nuvoton: Add NPCM730 common
> device tree include file.
> 
> Hi Fran,
> 
> On Wed, 5 Jun 2019 at 13:38, Fran Hsu <franhsutw@gmail.com> wrote:
> >
> > Quanta GSJ BMC uses the Nuvoton NPCM730 BMC soc.
> > This file describes the common setting of NPCM730 soc.
> 
> Please base your series on top of the dev-5.1 tree. The latest commit as of
> today is a17b8ac585d7faa27799f425fa4326c7a1e7ae71.
> 
> Many of the changes in this series have already bee merged.
> 
> Cheers,
> 
> Joel
> 
> >
> > Signed-off-by: Fran Hsu <Fran.Hsu@quantatw.com>
> > ---
> >  arch/arm/boot/dts/nuvoton-npcm730.dtsi | 57
> > ++++++++++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/nuvoton-npcm730.dtsi
> >
> > diff --git a/arch/arm/boot/dts/nuvoton-npcm730.dtsi
> > b/arch/arm/boot/dts/nuvoton-npcm730.dtsi
> > new file mode 100644
> > index 000000000000..20e13489b993
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nuvoton-npcm730.dtsi
> > @@ -0,0 +1,57 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +// Copyright (c) 2018 Nuvoton Technology tomer.maimon@nuvoton.com //
> > +Copyright 2018 Google, Inc.
> > +
> > +#include "nuvoton-common-npcm7xx.dtsi"
> > +
> > +/ {
> > +       #address-cells = <1>;
> > +       #size-cells = <1>;
> > +       interrupt-parent = <&gic>;
> > +
> > +       cpus {
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +               enable-method = "nuvoton,npcm750-smp";
> > +
> > +               cpu@0 {
> > +                       device_type = "cpu";
> > +                       compatible = "arm,cortex-a9";
> > +                       clocks = <&clk NPCM7XX_CLK_CPU>;
> > +                       clock-names = "clk_cpu";
> > +                       reg = <0>;
> > +                       next-level-cache = <&l2>;
> > +               };
> > +
> > +               cpu@1 {
> > +                       device_type = "cpu";
> > +                       compatible = "arm,cortex-a9";
> > +                       clocks = <&clk NPCM7XX_CLK_CPU>;
> > +                       clock-names = "clk_cpu";
> > +                       reg = <1>;
> > +                       next-level-cache = <&l2>;
> > +               };
> > +       };
> > +
> > +       soc {
> > +               timer@3fe600 {
> > +                       compatible = "arm,cortex-a9-twd-timer";
> > +                       reg = <0x3fe600 0x20>;
> > +                       interrupts = <GIC_PPI 13
> (GIC_CPU_MASK_SIMPLE(2) |
> > +
> IRQ_TYPE_LEVEL_HIGH)>;
> > +                       clocks = <&clk NPCM7XX_CLK_AHB>;
> > +               };
> > +       };
> > +
> > +       ahb {
> > +               udc9:udc@f0839000 {
> > +                       compatible = "nuvoton,npcm750-udc";
> > +                       reg = <0xf0839000 0x1000
> > +                              0xfffd0000 0x800>;
> > +                       interrupts = <GIC_SPI 60
> IRQ_TYPE_LEVEL_HIGH>;
> > +                       status = "disabled";
> > +                       clocks = <&clk NPCM7XX_CLK_SU>;
> > +                       clock-names = "clk_usb_bridge";
> > +               };
> > +       };
> > +};
> > --
> > 2.21.0
> >

