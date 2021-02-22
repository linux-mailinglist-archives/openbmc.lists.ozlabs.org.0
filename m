Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6301A321A48
	for <lists+openbmc@lfdr.de>; Mon, 22 Feb 2021 15:25:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dkkwz3CwFz3cHn
	for <lists+openbmc@lfdr.de>; Tue, 23 Feb 2021 01:25:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=fvokkzxs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d32;
 helo=mail-io1-xd32.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=fvokkzxs; dkim-atps=neutral
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dkkwk4h3wz30Gs
 for <openbmc@lists.ozlabs.org>; Tue, 23 Feb 2021 01:25:07 +1100 (AEDT)
Received: by mail-io1-xd32.google.com with SMTP id f20so13351287ioo.10
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2021 06:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=juvEdxvqKlsBbe0kNmOCQgwG0HjLQ/hRQBwpyDMYnmo=;
 b=fvokkzxsdTHfIYUj61qfUuDxsLNfBMQKlqji7FgUeScjfAdis8TZOyzE7TEXwpKx7S
 oohO19+xYOg827rtjrhEe+FmUkmkUXg2xJRD32Zh3IyQUuSKDl9rHdGgCj412zT/Cryn
 UhMvCHEI4Ppfyyj92dn8/yMYVd8jFQ+phi1j3M2k1oRzoUneP2BvnKReu564bvg+Nkph
 CppDfFxt4RhnWMOgMsvsMq0k7dos70k6wqRunZGGOY7bMNX69oGx8DhSsKbClRHNBmNm
 Gmy1Y0till1TQQc6pp6QQJbHoYb3RHyF6ncYD8BOIV7Tp7bOM5TOI3mUom3bPQI0cYua
 LE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=juvEdxvqKlsBbe0kNmOCQgwG0HjLQ/hRQBwpyDMYnmo=;
 b=RGnwz5r1tynGqRFIQDhC7RHpcc401a++Wk3C2jOua61zIlhwW9oc3Pf1/ZIrjgcWRK
 iHHv7wejm5tjpCW1uznR7KjC6S5erFA+PqCUAtGj4QTce/AeRq6Y9njYcEMWuY7C7Ohq
 au7+9LBhFOvfzSKjOW0hElaXtUXHj8kBAlzLJWoc0Z8N61p83ga69tpCrVmwz8Tot2ne
 oEksVZV4h61XCdE3CVrhfCW9FWhMJbryI+CiCOS2x6PxUCa0KHQ4M3Je34W49a99tN/Q
 5qq6IC4JOi4KHxx+L0RytfXjXTWhfcIXz1l6H/PGi+/uPLPq4CUQByODt3kEPWcssyzM
 NKFg==
X-Gm-Message-State: AOAM530j4+4IHee5NiYVCS6rhJWcvoW+y6jeLKkC5PjBrHQDWqwyM2Oo
 FVtcFEPecXfYnLNtmVNBp9uxCJF17d/P5GtpLubG7A==
X-Google-Smtp-Source: ABdhPJy3M+h35T2uzDveX/x0hkvGAVdKHe5fATxRFSSA9XpiGViMrALwDqQ4Rf85oWU9lEbPKG0zBz8idgOhmIOL3jg=
X-Received: by 2002:a5d:8490:: with SMTP id t16mr15471280iom.91.1614003901803; 
 Mon, 22 Feb 2021 06:25:01 -0800 (PST)
MIME-Version: 1.0
References: <20210218122546.3546582-1-gmouse@google.com>
 <CADKL2t6P4gaSUZEFgk7y+TNBRw0Lhf8mXTxzLdbe3FhGs0WH+w@mail.gmail.com>
 <CAP6Zq1jf4-XAhLQxqNx3LM7-YzDr8zaVPb-jznn8o=frxTotdQ@mail.gmail.com>
 <CADVsX89F6Tc0Zk6uB3CKRK0F8j_E+sVGHVb9FMAkHDQqJ+KBAQ@mail.gmail.com>
 <CAKKbWA7WL80C9h9xPcBNAHn-1=NBK9dh2Nqa1hO21hbdLEUbTw@mail.gmail.com>
 <KL1PR0302MB255112AE01C81FEA63472A6293819@KL1PR0302MB2551.apcprd03.prod.outlook.com>
In-Reply-To: <KL1PR0302MB255112AE01C81FEA63472A6293819@KL1PR0302MB2551.apcprd03.prod.outlook.com>
From: Anton Kachalov <gmouse@google.com>
Date: Mon, 22 Feb 2021 15:24:49 +0100
Message-ID: <CADVsX88Sk2PVomM6o4qeTk3EmDSXnDjFC6nixUt2Jn6dU7jOLQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nuvoton: Fix flash layout
To: IS20 Ofer Eilon <ofer.eilon@nuvoton.com>
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
Cc: devicetree <devicetree@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Ofer,

The oldest version from igps doesn't work as well as the latest
version from u-boot github.

The only version that works for me is in software deliverables:

https://github.com/Nuvoton-Israel/nuvoton-info/tree/master/npcm7xx-poleg/ev=
aluation-board/sw_deliverables/npcm7xx_v2.3

On Mon, 22 Feb 2021 at 15:10, IS20 Ofer Eilon <ofer.eilon@nuvoton.com> wrot=
e:
>
> Hi Avi,
>
> It seems an old version of uboot  u-boot_2019.01.7.5.bin  from igps below=
:
>
> > https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
hub.com%2FNuvoton-Israel%2Figps%2Ftree%2Fmaster%2FImageGeneration%2Fversion=
s&amp;data=3D04%7C01%7Cofer.eilon%40nuvoton.com%7Ce56881b8491d42e5ee4c08d8d=
71bacd4%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C637495861162860437%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C1000&amp;sdata=3D0%2BNzEv%2FSX9QTg0XumchRrU61uGbZ3CZXrtspXu2=
560I%3D&amp;reserved=3D0
>
> Please use latest from uboot.bin github.
>
> Regards,
> Ofer
>
>
> -----Original Message-----
> From: Avi Fishman <avifishman70@gmail.com>
> Sent: Monday, February 22, 2021 12:21 PM
> To: Anton Kachalov <gmouse@google.com>
> Cc: Tomer Maimon <tmaimon77@gmail.com>; Benjamin Fair <benjaminfair@googl=
e.com>; Tali Perry <tali.perry1@gmail.com>; Patrick Venture <venture@google=
.com>; Nancy Yuen <yuenn@google.com>; Rob Herring <robh+dt@kernel.org>; Ope=
nBMC Maillist <openbmc@lists.ozlabs.org>; devicetree <devicetree@vger.kerne=
l.org>; Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; IS20 Ofer=
 Eilon <ofer.eilon@nuvoton.com>
> Subject: Re: [PATCH] ARM: dts: nuvoton: Fix flash layout
>
> Ofer,
>
> Can you check why u-boot doesn't work with SD cards?
>
> On Mon, Feb 22, 2021 at 11:27 AM Anton Kachalov <gmouse@google.com> wrote=
:
> >
> > Hi, Tom.
> >
> > Yes, I'm using it for testing on real hardware.
> >
> > BTW. Recent u-boot doesn't work with SD cards. The card doesn't
> > detect. The last working version was this one:
> >
> > https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
h
> > ub.com%2FNuvoton-Israel%2Fnuvoton-info%2Ftree%2Fmaster%2Fnpcm7xx-poleg
> > %2Fevaluation-board%2Fsw_deliverables%2Fnpcm7xx_v2.3&amp;data=3D04%7C01=
%
> > 7Cofer.eilon%40nuvoton.com%7Ce56881b8491d42e5ee4c08d8d71bacd4%7Ca3f249
> > 31d4034b4a94f17d83ac638e07%7C0%7C0%7C637495861162860437%7CUnknown%7CTW
> > FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6
> > Mn0%3D%7C1000&amp;sdata=3Df4t41g3CQaFTQNfwwNVBrIwQScndIGcfRTms0yrTn5o%3=
D
> > &amp;reserved=3D0
> >
> > However, u-boot from igps repo:
> >
> > https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
h
> > ub.com%2FNuvoton-Israel%2Figps%2Ftree%2Fmaster%2FImageGeneration%2Fver
> > sions&amp;data=3D04%7C01%7Cofer.eilon%40nuvoton.com%7Ce56881b8491d42e5e=
e
> > 4c08d8d71bacd4%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C6374958611
> > 62860437%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL
> > CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D0%2BNzEv%2FSX9QTg0Xumc=
h
> > RrU61uGbZ3CZXrtspXu2560I%3D&amp;reserved=3D0
> >
> > Has issues too. It doesn't allow me to read more than 4k bytes once at
> > a time. Thus, to flash the stuff I have manually read chunks from the
> > SD-card: fat load doesn't work at all and I write that data in raw
> > partition.
> >
> > On Sun, 21 Feb 2021 at 17:40, Tomer Maimon <tmaimon77@gmail.com> wrote:
> > >
> > > Hi Benjamin and Anton,
> > >
> > > Sorry for the late reply,
> > >
> > > The EVB FIU0-CS0 partitioning is used for testing the EVB and this is=
 why it is different than the OpenBMC flash layout.
> > >
> > >
> > >
> > > Are you using the NPCM7XX EVB for OpenBMC? if yes we can consider to =
modify the flash partition to OpenBMC use.
> > >
> > >
> > > On Thu, 18 Feb 2021 at 19:11, Benjamin Fair <benjaminfair@google.com>=
 wrote:
> > >>
> > >> On Thu, 18 Feb 2021 at 04:42, <gmouse@google.com> wrote:
> > >> >
> > >> > From: "Anton D. Kachalov" <gmouse@google.com>
> > >> >
> > >> > This change satisfy OpenBMC requirements for flash layout.
> > >> >
> > >> > Signed-off-by: Anton D. Kachalov <gmouse@google.com>
> > >> > ---
> > >> >  arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 28
> > >> > +++++++----------------
> > >> >  1 file changed, 8 insertions(+), 20 deletions(-)
> > >> >
> > >> > diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> > >> > b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> > >> > index bd1eb6ee380f..741c1fee8552 100644
> > >> > --- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> > >> > +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> > >> > @@ -182,8 +182,8 @@ bbuboot2@80000 {
> > >> >                                 reg =3D <0x0080000 0x80000>;
> > >> >                                 read-only;
> > >> >                                 };
> > >> > -                       envparam@100000 {
> > >> > -                               label =3D "env-param";
> > >> > +                       ubootenv@100000 {
> > >> > +                               label =3D "u-boot-env";
> > >> >                                 reg =3D <0x0100000 0x40000>;
> > >> >                                 read-only;
> > >> >                                 }; @@ -195,25 +195,13 @@
> > >> > kernel@200000 {
> > >> >                                 label =3D "kernel";
> > >> >                                 reg =3D <0x0200000 0x400000>;
> > >> >                                 };
> > >> > -                       rootfs@600000 {
> > >> > -                               label =3D "rootfs";
> > >> > -                               reg =3D <0x0600000 0x700000>;
> > >> > +                       rofs@780000 {
> > >> > +                               label =3D "rofs";
> > >> > +                               reg =3D <0x0780000 0x1680000>;
> > >> >                                 };
> > >> > -                       spare1@D00000 {
> > >> > -                               label =3D "spare1";
> > >> > -                               reg =3D <0x0D00000 0x200000>;
> > >> > -                               };
> > >> > -                       spare2@0F00000 {
> > >> > -                               label =3D "spare2";
> > >> > -                               reg =3D <0x0F00000 0x200000>;
> > >> > -                               };
> > >> > -                       spare3@1100000 {
> > >> > -                               label =3D "spare3";
> > >> > -                               reg =3D <0x1100000 0x200000>;
> > >> > -                               };
> > >> > -                       spare4@1300000 {
> > >> > -                               label =3D "spare4";
> > >> > -                               reg =3D <0x1300000 0x0>;
> > >> > +                       rwfs@1e00000 {
> > >> > +                               label =3D "rwfs";
> > >> > +                               reg =3D <0x1e00000 0x200000>;
> > >> >                         };
> > >>
> > >> I recommend just including the openbmc-flash-layout.dtsi file here
> > >> instead since that contains the common flash layout for most
> > >> OpenBMC systems.
> > >>
> > > Good solution,
> > > Do you mean nuvoton-openbmc-flash-layout?
> > >>
> > >> >                 };
> > >> >         };
> > >> > --
> > >> > 2.30.0.478.g8a0d178c01-goog
> > >> >
> > >
> > >
> > > Thanks,
> > >
> > > Tomer
>
>
>
> --
> Regards,
> Avi
> ________________________________
> ________________________________
>  The privileged confidential information contained in this email is inten=
ded for use only by the addressees as indicated by the original sender of t=
his email. If you are not the addressee indicated in this email or are not =
responsible for delivery of the email to such a person, please kindly reply=
 to the sender indicating this fact and delete all copies of it from your c=
omputer and network server immediately. Your cooperation is highly apprecia=
ted. It is advised that any unauthorized use of confidential information of=
 Nuvoton is strictly prohibited; and any information in this email irreleva=
nt to the official business of Nuvoton shall be deemed as neither given nor=
 endorsed by Nuvoton.
