Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4EB321405
	for <lists+openbmc@lfdr.de>; Mon, 22 Feb 2021 11:22:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DkdXM685Qz3cLc
	for <lists+openbmc@lfdr.de>; Mon, 22 Feb 2021 21:22:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=m+tnZAIM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22c;
 helo=mail-lj1-x22c.google.com; envelope-from=avifishman70@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=m+tnZAIM; dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DkdX60XB3z30Ll
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2021 21:21:56 +1100 (AEDT)
Received: by mail-lj1-x22c.google.com with SMTP id r23so56432532ljh.1
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2021 02:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L6ozJjneRabHXv2bJQnWDUhKBZTUbxonhN/ndy66ScQ=;
 b=m+tnZAIMAohvoUNMEHfgprl8itqN+gc/cVZzermBq/PG/4fJW2AowK93jm5xJO8X2H
 jVLLMFpBO1zKDUe1e1cRWlCr1Ojv+yDbc6AwOinwpSc8qdTQyOZk4j7HWju6rSkTD3sr
 a/06PwQWJHTrtUILTfVoMYp7OVSCxLkdpLjI+1NirpEUa3gC1HMfnxky8QwmgXh99kSl
 1msRyhgS3WUUf5iRmHrlResp/VK/nst+BUMSOxXGlFMF2CFj8IeIRm0V/2GupJjMqqwt
 FTywReA7ItnA1GjPi35eZv+6ePI8dcgZGDUFyW3xZ7LIYYsBXznJE86uCYI33SpHKFzj
 FcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L6ozJjneRabHXv2bJQnWDUhKBZTUbxonhN/ndy66ScQ=;
 b=Z0UqeN2F6sjEXysAGEJNIR1yRV0bM1JMmuej3xM24VwbRk/eMBeMpU/R8IvpFi9mk9
 VdnjEqGJ6j3Mq96hglEz7A8ZoWYkbyd3S21u05N5MxdAMU3/idbsXajgJm/AmVdEi8+6
 n4PXwRLbB8KME4Jm4coU2R5ErA2py0jeNDto2oz2ANOJLombuMRcqsQSIUAviS9TmtfD
 4eFZ0s+/6iPqMBbxW7yCBu5Dw04kNEra7Lu4F3E209llPZbc96hQu1h3b/0JlbLSTfgw
 YT+ivMGrw5h8fKvKY0wMbDvddZBGJAp+XYTzMKdn/gWddFgJ6n0pZl+kZxN8R/BlZkr1
 6Q1g==
X-Gm-Message-State: AOAM530Uzp5vlNs4dSop9EVKOBzTSaBlkPCiyZPfX8U3vWyk5YOCCNu5
 zqadFvQ5/WyffsrCyUTT0fNm+sWYLx5+Y+GmDQ==
X-Google-Smtp-Source: ABdhPJzsEEWoLbBg5I0ftLDK0NHbzwQj/KQ0OcV4niW5UWFXWW4CI7QgmovSbKlfYZntoJvksNQz52A6rERxlvHd8C8=
X-Received: by 2002:a2e:95ce:: with SMTP id y14mr9431022ljh.80.1613989308331; 
 Mon, 22 Feb 2021 02:21:48 -0800 (PST)
MIME-Version: 1.0
References: <20210218122546.3546582-1-gmouse@google.com>
 <CADKL2t6P4gaSUZEFgk7y+TNBRw0Lhf8mXTxzLdbe3FhGs0WH+w@mail.gmail.com>
 <CAP6Zq1jf4-XAhLQxqNx3LM7-YzDr8zaVPb-jznn8o=frxTotdQ@mail.gmail.com>
 <CADVsX89F6Tc0Zk6uB3CKRK0F8j_E+sVGHVb9FMAkHDQqJ+KBAQ@mail.gmail.com>
In-Reply-To: <CADVsX89F6Tc0Zk6uB3CKRK0F8j_E+sVGHVb9FMAkHDQqJ+KBAQ@mail.gmail.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Mon, 22 Feb 2021 12:21:24 +0200
Message-ID: <CAKKbWA7WL80C9h9xPcBNAHn-1=NBK9dh2Nqa1hO21hbdLEUbTw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nuvoton: Fix flash layout
To: Anton Kachalov <gmouse@google.com>
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
Cc: devicetree <devicetree@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>,
 ofer.eilon@nuvoton.com, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Ofer,

Can you check why u-boot doesn't work with SD cards?

On Mon, Feb 22, 2021 at 11:27 AM Anton Kachalov <gmouse@google.com> wrote:
>
> Hi, Tom.
>
> Yes, I'm using it for testing on real hardware.
>
> BTW. Recent u-boot doesn't work with SD cards. The card doesn't
> detect. The last working version was this one:
>
> https://github.com/Nuvoton-Israel/nuvoton-info/tree/master/npcm7xx-poleg/evaluation-board/sw_deliverables/npcm7xx_v2.3
>
> However, u-boot from igps repo:
>
> https://github.com/Nuvoton-Israel/igps/tree/master/ImageGeneration/versions
>
> Has issues too. It doesn't allow me to read more than 4k bytes once at
> a time. Thus, to flash the stuff I have manually read chunks from the
> SD-card: fat load doesn't work at all and I write that data in raw
> partition.
>
> On Sun, 21 Feb 2021 at 17:40, Tomer Maimon <tmaimon77@gmail.com> wrote:
> >
> > Hi Benjamin and Anton,
> >
> > Sorry for the late reply,
> >
> > The EVB FIU0-CS0 partitioning is used for testing the EVB and this is why it is different than the OpenBMC flash layout.
> >
> >
> >
> > Are you using the NPCM7XX EVB for OpenBMC? if yes we can consider to modify the flash partition to OpenBMC use.
> >
> >
> > On Thu, 18 Feb 2021 at 19:11, Benjamin Fair <benjaminfair@google.com> wrote:
> >>
> >> On Thu, 18 Feb 2021 at 04:42, <gmouse@google.com> wrote:
> >> >
> >> > From: "Anton D. Kachalov" <gmouse@google.com>
> >> >
> >> > This change satisfy OpenBMC requirements for flash layout.
> >> >
> >> > Signed-off-by: Anton D. Kachalov <gmouse@google.com>
> >> > ---
> >> >  arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 28 +++++++----------------
> >> >  1 file changed, 8 insertions(+), 20 deletions(-)
> >> >
> >> > diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> >> > index bd1eb6ee380f..741c1fee8552 100644
> >> > --- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> >> > +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> >> > @@ -182,8 +182,8 @@ bbuboot2@80000 {
> >> >                                 reg = <0x0080000 0x80000>;
> >> >                                 read-only;
> >> >                                 };
> >> > -                       envparam@100000 {
> >> > -                               label = "env-param";
> >> > +                       ubootenv@100000 {
> >> > +                               label = "u-boot-env";
> >> >                                 reg = <0x0100000 0x40000>;
> >> >                                 read-only;
> >> >                                 };
> >> > @@ -195,25 +195,13 @@ kernel@200000 {
> >> >                                 label = "kernel";
> >> >                                 reg = <0x0200000 0x400000>;
> >> >                                 };
> >> > -                       rootfs@600000 {
> >> > -                               label = "rootfs";
> >> > -                               reg = <0x0600000 0x700000>;
> >> > +                       rofs@780000 {
> >> > +                               label = "rofs";
> >> > +                               reg = <0x0780000 0x1680000>;
> >> >                                 };
> >> > -                       spare1@D00000 {
> >> > -                               label = "spare1";
> >> > -                               reg = <0x0D00000 0x200000>;
> >> > -                               };
> >> > -                       spare2@0F00000 {
> >> > -                               label = "spare2";
> >> > -                               reg = <0x0F00000 0x200000>;
> >> > -                               };
> >> > -                       spare3@1100000 {
> >> > -                               label = "spare3";
> >> > -                               reg = <0x1100000 0x200000>;
> >> > -                               };
> >> > -                       spare4@1300000 {
> >> > -                               label = "spare4";
> >> > -                               reg = <0x1300000 0x0>;
> >> > +                       rwfs@1e00000 {
> >> > +                               label = "rwfs";
> >> > +                               reg = <0x1e00000 0x200000>;
> >> >                         };
> >>
> >> I recommend just including the openbmc-flash-layout.dtsi file here
> >> instead since that contains the common flash layout for most OpenBMC
> >> systems.
> >>
> > Good solution,
> > Do you mean nuvoton-openbmc-flash-layout?
> >>
> >> >                 };
> >> >         };
> >> > --
> >> > 2.30.0.478.g8a0d178c01-goog
> >> >
> >
> >
> > Thanks,
> >
> > Tomer



-- 
Regards,
Avi
