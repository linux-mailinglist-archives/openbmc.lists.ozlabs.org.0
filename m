Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C01A452C908
	for <lists+openbmc@lfdr.de>; Thu, 19 May 2022 02:56:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3WdT5P6Dz3c8s
	for <lists+openbmc@lfdr.de>; Thu, 19 May 2022 10:56:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hp3N9QMK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::236;
 helo=mail-lj1-x236.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hp3N9QMK; dkim-atps=neutral
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3Wd646DKz3bZs
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2022 10:56:10 +1000 (AEST)
Received: by mail-lj1-x236.google.com with SMTP id bx33so4427843ljb.12
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2022 17:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=P/A63fdObVK1kzszX4o2zU+y2vARpab4MsV04+m6s4U=;
 b=hp3N9QMKgrTlSBUboc3w51NUmHyBG4nsmCUhx73K1tr0DWGeN0n3vWlZxAKnC19K9+
 xchUETOjGDjBHCKeJ2SZU+n5kOalPxfxheWKH/sjiYwdWqwbxG7nlYGHIajjMCPNO4rL
 vxCt2+PPEJ2ydejgr0Zf0DdzYZjAAAmqxAq0FU2E+++d+AxVIAN7PMdvmSGWJh7AXg+w
 0tV+CApwyyN44zJCihhdW4TS8Vagy9gn9Gg/5zW3X/yLC9qIxpX2btHVZ0N0SY0xg5rC
 1mOMgjaernRWL38xx2hzVgf5/XwDqG07hAsJqc3Rw8kN5EbUTER2krgUEpLNyvXVgieJ
 Kopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P/A63fdObVK1kzszX4o2zU+y2vARpab4MsV04+m6s4U=;
 b=kro83UZh5KpZTxY8YIC2kw0KfHGk8WfV0zi1psbY56Wd3iffnfHAjgiJk9eNw/fEpB
 Z7SY0rt593j9tBWxkwDmi3OcJO4NY6Zo6tevno8dGZDlKWAwLBSHMqFKe8exhtcJOHPA
 xRSH4FufbH2GXE4JFecIBn7+AuP59MPVcNxg7+wlpqsQodCECibl1c7RT+tLiJcQoVi4
 llf098xdXyqF0i9sJXl4WEAErOUghE82YVxvo0G/MmlatocU8Ty70CrBRVWcDtoJzuuF
 PwMvg4sdsdpRnArA+QMBZZkTBRLlQSei7Rei3f5/G/+CgVeIT+baSPCTHOa3FaaY2scJ
 L9Tw==
X-Gm-Message-State: AOAM530nK1bewDxgeYkvpPtGrkqwtFSQCfcH5LfBp9afc9LqYRfZJmfI
 aTOoQhyQcfSLDyqkpmF80PFOpq9cZMDhU5SRIpU=
X-Google-Smtp-Source: ABdhPJzzyBkkT9UcKeYwb2L46w/9p77j44udrFncFopXIIcNuuiPxeLDTWQt2NkOHcPGayjRR8/c17VPkT2d6Uwr6Os=
X-Received: by 2002:a05:651c:1247:b0:253:caad:4ee2 with SMTP id
 h7-20020a05651c124700b00253caad4ee2mr1121134ljh.281.1652921765326; Wed, 18
 May 2022 17:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220510031056.1657-1-ctcchien@nuvoton.com>
 <20220510031056.1657-2-ctcchien@nuvoton.com>
 <YoUwe6Tj4Uh6ukc8@zn.tnic>
In-Reply-To: <YoUwe6Tj4Uh6ukc8@zn.tnic>
From: Medad Young <medadyoung@gmail.com>
Date: Thu, 19 May 2022 08:55:53 +0800
Message-ID: <CAHpyw9fjThEP4NuU08aNJ_raHpq9-j9KgBb8YuZ_shXTjhm3JA@mail.gmail.com>
Subject: Re: [PATCH v9 1/3] ARM: dts: nuvoton: Add memory controller node
To: Borislav Petkov <bp@alien8.de>
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
 James Morse <james.morse@arm.com>, YSCHU@nuvoton.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Borislav,

Borislav Petkov <bp@alien8.de> =E6=96=BC 2022=E5=B9=B45=E6=9C=8819=E6=97=A5=
 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=881:44=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, May 10, 2022 at 11:10:54AM +0800, Medad CChien wrote:
> > ECC must be configured in the BootBlock header.
> > Then, you can read error counts via the EDAC kernel framework.
> >
> > Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> > ---
> >  arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/b=
oot/dts/nuvoton-common-npcm7xx.dtsi
> > index 3696980a3da1..ba542b26941e 100644
> > --- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> > +++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> > @@ -106,6 +106,13 @@
> >               interrupt-parent =3D <&gic>;
> >               ranges;
> >
> > +             mc: memory-controller@f0824000 {
> > +                     compatible =3D "nuvoton,npcm750-memory-controller=
";
> > +                     reg =3D <0x0 0xf0824000 0x0 0x1000>;
> > +                     interrupts =3D <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> > +                     status =3D "disabled";
> > +             };
> > +
> >               rstc: rstc@f0801000 {
> >                       compatible =3D "nuvoton,npcm750-reset";
> >                       reg =3D <0xf0801000 0x70>;
> > --
>
> Please integrate scripts/checkpatch.pl into your patch creation
> workflow. Some of the warnings/errors *actually* make sense.
>
> In this case:
>
> WARNING: DT compatible string "nuvoton,npcm750-memory-controller" appears=
 un-documented -- check ./Documentation/devicetree/bindings/
> #35: FILE: arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi:110:
> +                       compatible =3D "nuvoton,npcm750-memory-controller=
";
>
> For that I'm guessing patch 2 needs to go first in the series.
>
> In any case, the first two need an ACK from devicetree folks.
>
> WARNING: From:/Signed-off-by: email address mismatch: 'From: Medad CChien=
 <medadyoung@gmail.com>' !=3D 'Signed-off-by: Medad CChien <ctcchien@nuvoto=
n.com>'
>
> For this one I wasn't sure so I had to ask: I guess it kinda makes sense
> to have the From: be the same as your SOB email. I.e., make sure the
> right authorship and SOB is maintained even when sending from machines
> with broken email setups.
>
> And that you can fix very easily: just add in your .git/config:
>
> [user]
>         name =3D Medad CChien
>         email =3D ctcchien@nuvoton.com
>
> and git would use that as the author and also slap a From: at the
> beginning of the patch with the correct name and email address.
>

OK, I got it.

> HTH.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
