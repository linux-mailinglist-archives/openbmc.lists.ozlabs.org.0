Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F8B51B945
	for <lists+openbmc@lfdr.de>; Thu,  5 May 2022 09:37:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kv5By6dj8z3f03
	for <lists+openbmc@lfdr.de>; Thu,  5 May 2022 17:37:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HjL+/0qW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12f;
 helo=mail-lf1-x12f.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=HjL+/0qW; dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kv59g4cDZz3cgX
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2022 17:36:38 +1000 (AEST)
Received: by mail-lf1-x12f.google.com with SMTP id t25so6079409lfg.7
 for <openbmc@lists.ozlabs.org>; Thu, 05 May 2022 00:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EvNPzmObJdLQoZe7mkFbV9lZXE5XGs6QumW7oyIXLLg=;
 b=HjL+/0qWmEWMgyiEe4e0unetPVu7pERTINMfTVtGtp3kO1zXtYJRAuyHyPv64jg1bh
 YhLUSfmqysBZuPqmB6XCgmDb2SEY5ocC4kCAPKnGm51CwF0BiD38pNcOyF4A1UoZBD7m
 amtR0IXtpKofD2GGI6cIygG6YvWki3kN90f+MFz/AkjrhMcFhggWvs700Lr13W33NalE
 et2ptnCYotWOX5aLb2Chy4K6L3v76wD2TihnEObTIIsQtnO4rCv/q9TI21gHBTNUmlHI
 7vgqOmq+Yl4hW020s6SrGYQZ+Az/+DposHcglABsHqAVxtMy21eDhHFXokAo/W2FLMUU
 BCUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EvNPzmObJdLQoZe7mkFbV9lZXE5XGs6QumW7oyIXLLg=;
 b=3pvoqVUdsybdEE9ZCcxlC1Qnve4g7daezG9POj/d3HrFk1BI7BEuiZy9uKvhEj3hJ7
 RU1Apj5T/QiXq3MzMwMq/FCOD1y8daL0mSgToWFO/IhMTMmlPuMvG6aRCt3TPtsx5DZZ
 TB+s0FKKbXQmBTWsx8vTMj5h234jllrUvXgwaXWfaJkBdIoteGN24ihfkVNt666DHdh5
 7SbALl7ZZr5cqREsO9toe4P83iPBe03d+kfKdzy0Jf3x2xRiDzpA/cyZwC7KH9lGYXC3
 FH558D0yAJ/aW9sKP/xYo+64bw2yIXAMR+sE0WjtFFX1wTMZ29WiSCH8PLpAx283hgRS
 T08A==
X-Gm-Message-State: AOAM532AN56q11rERTIH4OGqLViKTfYHaVfc0voRGx/n2DqUUi2ifSLK
 wVsohtT0JBckPMHeBwJfRsdOQ6HEIPmOy4HfWIs=
X-Google-Smtp-Source: ABdhPJzlCwN+zu+ztaxXdspnktpkbaSmCvx647Fl1CfKZFFvfCQpdiXXJZmh6tGGVGJJg0JoGRfpxnCdKl/iqzeKPdA=
X-Received: by 2002:ac2:42d0:0:b0:471:fc7b:e53a with SMTP id
 n16-20020ac242d0000000b00471fc7be53amr16112040lfl.185.1651736194069; Thu, 05
 May 2022 00:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220503094728.926-1-ctcchien@nuvoton.com>
 <20220503094728.926-4-ctcchien@nuvoton.com>
 <d09f0131-65e2-d382-27b9-29ded4f47d84@molgen.mpg.de>
In-Reply-To: <d09f0131-65e2-d382-27b9-29ded4f47d84@molgen.mpg.de>
From: Medad Young <medadyoung@gmail.com>
Date: Thu, 5 May 2022 15:36:22 +0800
Message-ID: <CAHpyw9e+d20dVM3PO0UfqvxpTnkvU541ccEa0CGLCZFgjTr8vw@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] EDAC: nuvoton: Add NPCM memory controller driver
To: Paul Menzel <pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: KWLIU@nuvoton.com, tony.luck@intel.com, rric@kernel.org,
 Benjamin Fair <benjaminfair@google.com>,
 linux-edac <linux-edac@vger.kernel.org>, KFTING <KFTING@nuvoton.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com,
 ctcchien@nuvoton.com, Tali Perry <tali.perry1@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, James Morse <james.morse@arm.com>,
 YSCHU@nuvoton.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Paul,

Paul Menzel <pmenzel@molgen.mpg.de> =E6=96=BC 2022=E5=B9=B45=E6=9C=883=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=885:58=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Dear Medad,
>
>
> Thank you for v8.
>
> Am 03.05.22 um 11:47 schrieb Medad CChien:
> > Add memory controller support for Nuvoton NPCM SoC.
> >
> > Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> > Reviewed-by: Borislav Petkov <bp@alien8.de>
> > Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
> > Reported-by: kernel test robot <lkp@intel.com>
>
> This line is confusing.

OK, I will add more description.

>
> > error:
> >     macro "edac_printk" requires 4 arguments, but only 2 given
> >
> > warnings:
> >     performing pointer arithmetic on a null pointer has undefined behav=
ior [-Wnull-pointer-arithmetic]
> >     logical not is only applied to the left hand side of this bitwise o=
perator [-Wlogical-not-parentheses]
> >     mixing declarations and code is a C99 extension [-Wdeclaration-afte=
r-statement]
> >
> > Note:
> >     you can force an ecc event by writing a string to edac sysfs node
> >     and remember to define CONFIG_EDAC_DEBUG to enable this feature
> >     example: force a correctable event on checkcode bit 0
> >     echo "CE checkcode 0" > /sys/devices/system/edac/mc/mc0/forced_ecc_=
error
>
> Shouldn=E2=80=99t this go above all the tags?

Yes, I should move this note above all the tags

>
> > ---
> >   drivers/edac/Kconfig     |   9 +
> >   drivers/edac/Makefile    |   1 +
> >   drivers/edac/npcm_edac.c | 680 ++++++++++++++++++++++++++++++++++++++=
+
> >   3 files changed, 690 insertions(+)
> >   create mode 100644 drivers/edac/npcm_edac.c
> >
> > diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
> > index 58ab63642e72..64149b524f98 100644
> > --- a/drivers/edac/Kconfig
> > +++ b/drivers/edac/Kconfig
> > @@ -539,4 +539,13 @@ config EDAC_DMC520
> >         Support for error detection and correction on the
> >         SoCs with ARM DMC-520 DRAM controller.
> >
> > +config EDAC_NPCM
> > +     tristate "Nuvoton NPCM DDR Memory Controller"
> > +     depends on (ARCH_NPCM || COMPILE_TEST)
> > +     help
> > +       Support for error detection and correction on the Nuvoton NPCM =
DDR
> > +       memory controller.
>
> Please add a blank line below.
>
> > +       First, ECC must be configured in the BootBlock header. Then, th=
is driver
> > +       will expose error counters via the EDAC kernel framework.
> > +
> >   endif # EDAC
>
> [=E2=80=A6]
> > +module_platform_driver(npcm_edac_mc_driver);
> > +
> > +MODULE_AUTHOR("Medad CChien<ctcchien@nuvoton.com>");
>
> Please add a space before the <.

OK

>
> > +MODULE_DESCRIPTION("Nuvoton NPCM EDAC Driver");
> > +MODULE_LICENSE("GPL v2");
>
>
> Kind regards,
>
> Paul

B.R.
Medad
