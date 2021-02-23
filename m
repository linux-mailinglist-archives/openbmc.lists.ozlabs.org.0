Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C20E0322B48
	for <lists+openbmc@lfdr.de>; Tue, 23 Feb 2021 14:15:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DlKKH4Cjwz3cLL
	for <lists+openbmc@lfdr.de>; Wed, 24 Feb 2021 00:14:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=pYs6unvS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132;
 helo=mail-lf1-x132.google.com; envelope-from=avifishman70@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pYs6unvS; dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DlKK33TSCz30Qx
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2021 00:14:44 +1100 (AEDT)
Received: by mail-lf1-x132.google.com with SMTP id z11so11077930lfb.9
 for <openbmc@lists.ozlabs.org>; Tue, 23 Feb 2021 05:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a49cPfQ6OU4LG8CF96Hqvxni48z/Zab/m/tPpyPYbDg=;
 b=pYs6unvSm6CdRKPGFo1+KI2cxwmIAiq1BP2xNexRmr7RzViTWOCXeOhZch7bgKjWJ4
 BeWoQ62/D3w75p6x5OuI8ylFfUxUypdtbHfMgNYPXtkM1gRp8EuYrug+cyYw2RMW2OOI
 nEAthwUP0gH3H3OpfnHX42bdkdbpIT6VICz7X7OVcTdMRfVJag6pFDF2C2Pw22zK8Oj/
 uUzH4+RzuSsT3hv4OQ4qWtBnOlIapwjXnxpinAImAtxidj5OItmQHqdWIxGV20ToCzmf
 K3bhjjbA1fe0KeKzN1pxEjKlh3WTQThWrhhDjt0SC7DfpvWHBFqMmlQk1LLzi24GBieo
 Bsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a49cPfQ6OU4LG8CF96Hqvxni48z/Zab/m/tPpyPYbDg=;
 b=dFRYOn4xFQRlVb6p3w8pOyOUNGCXlNGKbUiXDtVhC73MYxFt1Mul5MFk5uHuuW1JBV
 +QTgjds1sou9KEckdzcGXlhuywSsWlMAOOs3cOblTnQ5ok7Cboo8bxUvA6raMNiCtojC
 ia3NNqrMMhT2/Wh8IUmRnAepehogbOvz2qcsoVnPCL9ENBio2/fGhpE+hetu42Rj8u+i
 4lYZz9brMos4Vdu2qVefNmNfqvWctbfa0kfYWf9z25JrAObwsarPoDUURj5yz9Jf2HbJ
 EeUZX96kXqiYecz/KXwdDGjemMrpuYLZkytD1v4MVGwO/8Ar8lPVa9VnrkRDO7JwDPbP
 9s1g==
X-Gm-Message-State: AOAM5317vFRQ65p/REFWsXUlWAIWU8/46lG+vBpYnatwM2u4h5zWao7U
 ECqQ5sSnLronoQIafXFfiP5koA+MTYZNgnJivQ==
X-Google-Smtp-Source: ABdhPJykDe2lOM73VIAMhpf9Met61c/x5ktsrX+rHIXqDXZna1kTXnsPKGUUF6B3DEXfkFADqAk2btSPLvvnUS2L7Fg=
X-Received: by 2002:a05:6512:39c3:: with SMTP id
 k3mr16220706lfu.501.1614086077401; 
 Tue, 23 Feb 2021 05:14:37 -0800 (PST)
MIME-Version: 1.0
References: <20210218122546.3546582-1-gmouse@google.com>
 <CADKL2t6P4gaSUZEFgk7y+TNBRw0Lhf8mXTxzLdbe3FhGs0WH+w@mail.gmail.com>
 <CAP6Zq1jf4-XAhLQxqNx3LM7-YzDr8zaVPb-jznn8o=frxTotdQ@mail.gmail.com>
 <CADVsX89F6Tc0Zk6uB3CKRK0F8j_E+sVGHVb9FMAkHDQqJ+KBAQ@mail.gmail.com>
 <CAKKbWA7WL80C9h9xPcBNAHn-1=NBK9dh2Nqa1hO21hbdLEUbTw@mail.gmail.com>
 <KL1PR0302MB255112AE01C81FEA63472A6293819@KL1PR0302MB2551.apcprd03.prod.outlook.com>
 <CADVsX88Sk2PVomM6o4qeTk3EmDSXnDjFC6nixUt2Jn6dU7jOLQ@mail.gmail.com>
In-Reply-To: <CADVsX88Sk2PVomM6o4qeTk3EmDSXnDjFC6nixUt2Jn6dU7jOLQ@mail.gmail.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Tue, 23 Feb 2021 15:14:13 +0200
Message-ID: <CAKKbWA7EfZg5uGMsu+q1E_ui=s1eVHiyKDgN4bijk3DVTgFbOQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nuvoton: Fix flash layout
To: Anton Kachalov <gmouse@google.com>
Content-Type: multipart/mixed; boundary="00000000000047de3605bc00b359"
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 IS20 Ofer Eilon <ofer.eilon@nuvoton.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000047de3605bc00b359
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Anton,

At runtime do you get into the code inside npcmx50_sdhci.c, but it
doesn't work well or not access at all?
Can you check those registers (BootBlock should set them for you):
sd1irv1 at address 0xf0800054 value =3D 0xf5c80f80
sd1irv2 at address 0xf0800058 value =3D 0x52001132
sd2irv1 at address 0xf08000b4 value =3D 0xfdc80f80
sd2irv2 at address 0xf08000b8 value =3D 0x52003132

Also try to use attached file.

Thanks,
Avi

On Mon, Feb 22, 2021 at 4:25 PM Anton Kachalov <gmouse@google.com> wrote:
>
> Ofer,
>
> The oldest version from igps doesn't work as well as the latest
> version from u-boot github.
>
> The only version that works for me is in software deliverables:
>
> https://github.com/Nuvoton-Israel/nuvoton-info/tree/master/npcm7xx-poleg/=
evaluation-board/sw_deliverables/npcm7xx_v2.3
>
> On Mon, 22 Feb 2021 at 15:10, IS20 Ofer Eilon <ofer.eilon@nuvoton.com> wr=
ote:
> >
> > Hi Avi,
> >
> > It seems an old version of uboot  u-boot_2019.01.7.5.bin  from igps bel=
ow:
> >
> > > https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
ithub.com%2FNuvoton-Israel%2Figps%2Ftree%2Fmaster%2FImageGeneration%2Fversi=
ons&amp;data=3D04%7C01%7Cofer.eilon%40nuvoton.com%7Ce56881b8491d42e5ee4c08d=
8d71bacd4%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C637495861162860437%7=
CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi=
LCJXVCI6Mn0%3D%7C1000&amp;sdata=3D0%2BNzEv%2FSX9QTg0XumchRrU61uGbZ3CZXrtspX=
u2560I%3D&amp;reserved=3D0
> >
> > Please use latest from uboot.bin github.
> >
> > Regards,
> > Ofer
> >
> >
> > -----Original Message-----
> > From: Avi Fishman <avifishman70@gmail.com>
> > Sent: Monday, February 22, 2021 12:21 PM
> > To: Anton Kachalov <gmouse@google.com>
> > Cc: Tomer Maimon <tmaimon77@gmail.com>; Benjamin Fair <benjaminfair@goo=
gle.com>; Tali Perry <tali.perry1@gmail.com>; Patrick Venture <venture@goog=
le.com>; Nancy Yuen <yuenn@google.com>; Rob Herring <robh+dt@kernel.org>; O=
penBMC Maillist <openbmc@lists.ozlabs.org>; devicetree <devicetree@vger.ker=
nel.org>; Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; IS20 Of=
er Eilon <ofer.eilon@nuvoton.com>
> > Subject: Re: [PATCH] ARM: dts: nuvoton: Fix flash layout
> >
> > Ofer,
> >
> > Can you check why u-boot doesn't work with SD cards?
> >
> > On Mon, Feb 22, 2021 at 11:27 AM Anton Kachalov <gmouse@google.com> wro=
te:
> > >
> > > Hi, Tom.
> > >
> > > Yes, I'm using it for testing on real hardware.
> > >
> > > BTW. Recent u-boot doesn't work with SD cards. The card doesn't
> > > detect. The last working version was this one:
> > >
> > > https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
ith
> > > ub.com%2FNuvoton-Israel%2Fnuvoton-info%2Ftree%2Fmaster%2Fnpcm7xx-pole=
g
> > > %2Fevaluation-board%2Fsw_deliverables%2Fnpcm7xx_v2.3&amp;data=3D04%7C=
01%
> > > 7Cofer.eilon%40nuvoton.com%7Ce56881b8491d42e5ee4c08d8d71bacd4%7Ca3f24=
9
> > > 31d4034b4a94f17d83ac638e07%7C0%7C0%7C637495861162860437%7CUnknown%7CT=
W
> > > FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI=
6
> > > Mn0%3D%7C1000&amp;sdata=3Df4t41g3CQaFTQNfwwNVBrIwQScndIGcfRTms0yrTn5o=
%3D
> > > &amp;reserved=3D0
> > >
> > > However, u-boot from igps repo:
> > >
> > > https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
ith
> > > ub.com%2FNuvoton-Israel%2Figps%2Ftree%2Fmaster%2FImageGeneration%2Fve=
r
> > > sions&amp;data=3D04%7C01%7Cofer.eilon%40nuvoton.com%7Ce56881b8491d42e=
5ee
> > > 4c08d8d71bacd4%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C637495861=
1
> > > 62860437%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi=
L
> > > CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D0%2BNzEv%2FSX9QTg0Xu=
mch
> > > RrU61uGbZ3CZXrtspXu2560I%3D&amp;reserved=3D0
> > >
> > > Has issues too. It doesn't allow me to read more than 4k bytes once a=
t
> > > a time. Thus, to flash the stuff I have manually read chunks from the
> > > SD-card: fat load doesn't work at all and I write that data in raw
> > > partition.
> > >
> > > On Sun, 21 Feb 2021 at 17:40, Tomer Maimon <tmaimon77@gmail.com> wrot=
e:
> > > >
> > > > Hi Benjamin and Anton,
> > > >
> > > > Sorry for the late reply,
> > > >
> > > > The EVB FIU0-CS0 partitioning is used for testing the EVB and this =
is why it is different than the OpenBMC flash layout.
> > > >
> > > >
> > > >
> > > > Are you using the NPCM7XX EVB for OpenBMC? if yes we can consider t=
o modify the flash partition to OpenBMC use.
> > > >
> > > >
> > > > On Thu, 18 Feb 2021 at 19:11, Benjamin Fair <benjaminfair@google.co=
m> wrote:
> > > >>
> > > >> On Thu, 18 Feb 2021 at 04:42, <gmouse@google.com> wrote:
> > > >> >
> > > >> > From: "Anton D. Kachalov" <gmouse@google.com>
> > > >> >
> > > >> > This change satisfy OpenBMC requirements for flash layout.
> > > >> >
> > > >> > Signed-off-by: Anton D. Kachalov <gmouse@google.com>
> > > >> > ---
> > > >> >  arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 28
> > > >> > +++++++----------------
> > > >> >  1 file changed, 8 insertions(+), 20 deletions(-)
> > > >> >
> > > >> > diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> > > >> > b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> > > >> > index bd1eb6ee380f..741c1fee8552 100644
> > > >> > --- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> > > >> > +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> > > >> > @@ -182,8 +182,8 @@ bbuboot2@80000 {
> > > >> >                                 reg =3D <0x0080000 0x80000>;
> > > >> >                                 read-only;
> > > >> >                                 };
> > > >> > -                       envparam@100000 {
> > > >> > -                               label =3D "env-param";
> > > >> > +                       ubootenv@100000 {
> > > >> > +                               label =3D "u-boot-env";
> > > >> >                                 reg =3D <0x0100000 0x40000>;
> > > >> >                                 read-only;
> > > >> >                                 }; @@ -195,25 +195,13 @@
> > > >> > kernel@200000 {
> > > >> >                                 label =3D "kernel";
> > > >> >                                 reg =3D <0x0200000 0x400000>;
> > > >> >                                 };
> > > >> > -                       rootfs@600000 {
> > > >> > -                               label =3D "rootfs";
> > > >> > -                               reg =3D <0x0600000 0x700000>;
> > > >> > +                       rofs@780000 {
> > > >> > +                               label =3D "rofs";
> > > >> > +                               reg =3D <0x0780000 0x1680000>;
> > > >> >                                 };
> > > >> > -                       spare1@D00000 {
> > > >> > -                               label =3D "spare1";
> > > >> > -                               reg =3D <0x0D00000 0x200000>;
> > > >> > -                               };
> > > >> > -                       spare2@0F00000 {
> > > >> > -                               label =3D "spare2";
> > > >> > -                               reg =3D <0x0F00000 0x200000>;
> > > >> > -                               };
> > > >> > -                       spare3@1100000 {
> > > >> > -                               label =3D "spare3";
> > > >> > -                               reg =3D <0x1100000 0x200000>;
> > > >> > -                               };
> > > >> > -                       spare4@1300000 {
> > > >> > -                               label =3D "spare4";
> > > >> > -                               reg =3D <0x1300000 0x0>;
> > > >> > +                       rwfs@1e00000 {
> > > >> > +                               label =3D "rwfs";
> > > >> > +                               reg =3D <0x1e00000 0x200000>;
> > > >> >                         };
> > > >>
> > > >> I recommend just including the openbmc-flash-layout.dtsi file here
> > > >> instead since that contains the common flash layout for most
> > > >> OpenBMC systems.
> > > >>
> > > > Good solution,
> > > > Do you mean nuvoton-openbmc-flash-layout?
> > > >>
> > > >> >                 };
> > > >> >         };
> > > >> > --
> > > >> > 2.30.0.478.g8a0d178c01-goog
> > > >> >
> > > >
> > > >
> > > > Thanks,
> > > >
> > > > Tomer
> >
> >
> >
> > --
> > Regards,
> > Avi
> > ________________________________
> > ________________________________
> >  The privileged confidential information contained in this email is int=
ended for use only by the addressees as indicated by the original sender of=
 this email. If you are not the addressee indicated in this email or are no=
t responsible for delivery of the email to such a person, please kindly rep=
ly to the sender indicating this fact and delete all copies of it from your=
 computer and network server immediately. Your cooperation is highly apprec=
iated. It is advised that any unauthorized use of confidential information =
of Nuvoton is strictly prohibited; and any information in this email irrele=
vant to the official business of Nuvoton shall be deemed as neither given n=
or endorsed by Nuvoton.



--=20
Regards,
Avi

--00000000000047de3605bc00b359
Content-Type: application/octet-stream; name="npcmx50_sdhci.c"
Content-Disposition: attachment; filename="npcmx50_sdhci.c"
Content-Transfer-Encoding: base64
Content-ID: <f_kli13jx10>
X-Attachment-Id: f_kli13jx10

LyoKICpjb3B5cmlnaHQgKGMpIDIwMTcgTnV2b3RvbiBUZWNobm9sb2d5IENvcnAuCiAqCiAqIFNl
ZSBmaWxlIENSRURJVFMgZm9yIGxpc3Qgb2YgcGVvcGxlIHdobyBjb250cmlidXRlZCB0byB0aGlz
CiAqIHByb2plY3QuCiAqCiAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2Fu
IHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICogbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0
aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMKICogcHVibGlzaGVkIGJ5IHRoZSBGcmVl
IFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2YKICogdGhlIExpY2Vuc2Us
IG9yIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCiAqCiAqIFRoaXMgcHJvZ3Jh
bSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAogKiBi
dXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50
eSBvZgogKiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBP
U0UuIFNlZSB0aGUKICogR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWls
cy4KICoKICogWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVy
YWwgUHVibGljIExpY2Vuc2UKICogYWxvbmcgd2l0aCB0aGlzIHByb2dyYW07IGlmIG5vdCwgd3Jp
dGUgdG8gdGhlIEZyZWUgU29mdHdhcmUKICogRm91bmRhdGlvbiwgSW5jLiwgNTkgVGVtcGxlIFBs
YWNlLCBTdWl0ZSAzMzAsIEJvc3RvbiwKICogTUEgMDIxMTEtMTMwNyBVU0EKICovCgojaW5jbHVk
ZSA8Y29tbW9uLmg+CiNpbmNsdWRlIDxkbS5oPgojaW5jbHVkZSA8c2RoY2kuaD4KI2luY2x1ZGUg
PGNsay5oPgojaW5jbHVkZSA8YXNtL2FyY2gvY3B1Lmg+CiNpbmNsdWRlIDxhc20vYXJjaC9nY3Iu
aD4KI2luY2x1ZGUgPGFzbS9hcmNoL2Nsb2NrLmg+CgojZGVmaW5lIE5QQ01YNTBfU0QgICAgICAg
ICAgMAojZGVmaW5lIE5QQ01YNTBfRU1NQyAgICAgICAgMQoKI2lmZGVmIENPTkZJR19ETV9NTUMK
c3RydWN0IG5wY214NTBfc2RoY2lfcGxhdCB7CglzdHJ1Y3QgbW1jX2NvbmZpZyBjZmc7CglzdHJ1
Y3QgbW1jIG1tYzsKfTsKCkRFQ0xBUkVfR0xPQkFMX0RBVEFfUFRSOwojZW5kaWYKCiNpZmRlZiBD
T05GSUdfRE1fTU1DCnN0YXRpYyBpbnQgbnBjbXg1MF9zZGhjaV9wcm9iZShzdHJ1Y3QgdWRldmlj
ZSAqZGV2KQp7CglzdHJ1Y3QgbnBjbXg1MF9zZGhjaV9wbGF0ICpwbGF0ID0gZGV2X2dldF9wbGF0
ZGF0YShkZXYpOwoJc3RydWN0IG1tY191Y2xhc3NfcHJpdiAqdXByaXYgPSBkZXZfZ2V0X3VjbGFz
c19wcml2KGRldik7CglzdHJ1Y3Qgc2RoY2lfaG9zdCAqaG9zdCA9IGRldl9nZXRfcHJpdihkZXYp
OwoJaW50IHJldDsKCglob3N0LT52b2x0YWdlcyA9IE1NQ19WRERfMzJfMzMgfCBNTUNfVkREXzMz
XzM0IHwgTU1DX1ZERF8xNjVfMTk1OwoKCWlmIChob3N0LT5pbmRleCA9PSBOUENNWDUwX1NEKQoJ
ewoJCXVuc2lnbmVkIGludCBzdGF0dXM7CgoJCXNkaGNpX3dyaXRlYihob3N0LCBTREhDSV9DVFJM
X0NEX1RFU1RfSU5TIHwgU0RIQ0lfQ1RSTF9DRF9URVNULAoJCQlTREhDSV9IT1NUX0NPTlRST0wp
OwoKCQlzdGF0dXMgPSBzZGhjaV9yZWFkbChob3N0LCBTREhDSV9QUkVTRU5UX1NUQVRFKTsKCQl3
aGlsZSAoKCEoc3RhdHVzICYgU0RIQ0lfQ0FSRF9QUkVTRU5UKSkgfHwKCQkgICAgKCEoc3RhdHVz
ICYgU0RIQ0lfQ0FSRF9TVEFURV9TVEFCTEUpKSB8fAoJCSAgICAoIShzdGF0dXMgJiBTREhDSV9D
QVJEX0RFVEVDVF9QSU5fTEVWRUwpKSkKCQkJc3RhdHVzID0gc2RoY2lfcmVhZGwoaG9zdCwgU0RI
Q0lfUFJFU0VOVF9TVEFURSk7Cgl9CgoJaG9zdC0+dmVyc2lvbiA9IHNkaGNpX3JlYWR3KGhvc3Qs
IFNESENJX0hPU1RfVkVSU0lPTik7CglpZiAoaG9zdC0+YnVzX3dpZHRoID09IDQpCgkJaG9zdC0+
aG9zdF9jYXBzIHw9IE1NQ19NT0RFXzRCSVQ7CgoJaWYgKGhvc3QtPmJ1c193aWR0aCA9PSA4KQoJ
CWhvc3QtPmhvc3RfY2FwcyB8PSBNTUNfTU9ERV84QklUOwoKCXJldCA9IHNkaGNpX3NldHVwX2Nm
ZygmcGxhdC0+Y2ZnLCBob3N0LCBob3N0LT5jbG9jaywgNDAwMDAwKTsKCWlmIChyZXQpCgkJcmV0
dXJuIHJldDsKCglob3N0LT5tbWMgPSAmcGxhdC0+bW1jOwoJaG9zdC0+bW1jLT5wcml2ID0gaG9z
dDsKCWhvc3QtPm1tYy0+ZGV2ID0gZGV2OwoJdXByaXYtPm1tYyA9IGhvc3QtPm1tYzsKCglob3N0
LT5jbG9jayA9IDA7CgoJcmV0dXJuIHNkaGNpX3Byb2JlKGRldik7Cn0KCnN0YXRpYyBpbnQgbnBj
bXg1MF9vZmRhdGFfdG9fcGxhdGRhdGEoc3RydWN0IHVkZXZpY2UgKmRldikKewoJc3RydWN0IHNk
aGNpX2hvc3QgKmhvc3QgPSBkZXZfZ2V0X3ByaXYoZGV2KTsKCglob3N0LT5uYW1lID0gc3RyZHVw
KGRldi0+bmFtZSk7Cglob3N0LT5pb2FkZHIgPSAodm9pZCAqKWRldl9yZWFkX2FkZHIoZGV2KTsK
CWhvc3QtPmJ1c193aWR0aCA9IGZkdGRlY19nZXRfaW50KGdkLT5mZHRfYmxvYiwgZGV2X29mX29m
ZnNldChkZXYpLAoJCQkiYnVzLXdpZHRoIiwgNCk7Cglob3N0LT5pbmRleCA9IGZkdGRlY19nZXRf
dWludChnZC0+ZmR0X2Jsb2IsIGRldl9vZl9vZmZzZXQoZGV2KSwgImluZGV4IiwgMCk7Cglob3N0
LT5jbG9jayA9IGZkdGRlY19nZXRfdWludChnZC0+ZmR0X2Jsb2IsIGRldl9vZl9vZmZzZXQoZGV2
KSwKCQkJImNsb2NrLWZyZXF1ZW5jeSIsIDQwMDAwMCk7CgoJaWYgKGhvc3QtPmlvYWRkciA9PSAo
dm9pZCAqKUZEVF9BRERSX1RfTk9ORSkKCQlyZXR1cm4gLUVJTlZBTDsKCglyZXR1cm4gMDsKfQoK
c3RhdGljIGludCBucGNteDUwX3NkaGNpX2JpbmQoc3RydWN0IHVkZXZpY2UgKmRldikKewoJc3Ry
dWN0IG5wY214NTBfc2RoY2lfcGxhdCAqcGxhdCA9IGRldl9nZXRfcGxhdGRhdGEoZGV2KTsKCXJl
dHVybiBzZGhjaV9iaW5kKGRldiwgJnBsYXQtPm1tYywgJnBsYXQtPmNmZyk7Cn0KCnN0YXRpYyBp
bnQgbnBjbXg1MF9zZGhjaV9yZW1vdmUoc3RydWN0IHVkZXZpY2UgKmRldikKewoJcmV0dXJuIDA7
Cn0KCnN0YXRpYyBjb25zdCBzdHJ1Y3QgdWRldmljZV9pZCBucGNteDUwX21tY19pZHNbXSA9IHsK
CXsgLmNvbXBhdGlibGUgPSAibnV2b3RvbixucGNteDUwLXNkaGNpLVNEIiB9LAoJeyAuY29tcGF0
aWJsZSA9ICJudXZvdG9uLG5wY214NTAtc2RoY2ktZU1NQyJ9LAoJeyB9Cn07CgpVX0JPT1RfRFJJ
VkVSKG5wY214NTBfc2RjX2RydikgPSB7CgkubmFtZSAgICAgICAgICAgPSAibnBjbXg1MF9zZGhj
aSIsCgkuaWQgICAgICAgICAgICAgPSBVQ0xBU1NfTU1DLAoJLm9mX21hdGNoICAgICAgID0gbnBj
bXg1MF9tbWNfaWRzLAoJLm9mZGF0YV90b19wbGF0ZGF0YSA9IG5wY214NTBfb2ZkYXRhX3RvX3Bs
YXRkYXRhLAoJLm9wcyAgICAgICAgICAgID0gJnNkaGNpX29wcywKCS5iaW5kICAgICAgICAgICA9
IG5wY214NTBfc2RoY2lfYmluZCwKCS5wcm9iZSAgICAgICAgICA9IG5wY214NTBfc2RoY2lfcHJv
YmUsCgkucmVtb3ZlICAgICAgICAgPSBucGNteDUwX3NkaGNpX3JlbW92ZSwKCS5wcml2X2F1dG9f
YWxsb2Nfc2l6ZSA9IHNpemVvZihzdHJ1Y3Qgc2RoY2lfaG9zdCksCgkucGxhdGRhdGFfYXV0b19h
bGxvY19zaXplID0gc2l6ZW9mKHN0cnVjdCBucGNteDUwX3NkaGNpX3BsYXQpLAp9OwojZW5kaWYK
--00000000000047de3605bc00b359--
