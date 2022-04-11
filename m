Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 383A44FB56C
	for <lists+openbmc@lfdr.de>; Mon, 11 Apr 2022 09:57:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcLmB27Zdz2ynj
	for <lists+openbmc@lfdr.de>; Mon, 11 Apr 2022 17:56:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cnsb0XDP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132;
 helo=mail-lf1-x132.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=cnsb0XDP; dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcLlm11L9z2xWg
 for <openbmc@lists.ozlabs.org>; Mon, 11 Apr 2022 17:56:34 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id y32so25118527lfa.6
 for <openbmc@lists.ozlabs.org>; Mon, 11 Apr 2022 00:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QSB6c+wqSkjWB7X1hlshGuzqfkl/JFQbMqvRhf61Ikk=;
 b=cnsb0XDPevnl+CdN2zl7O4FihnoMRRdgozseneDM7/l9auwEHLXVI+XexLoq1sdoZe
 B/LF+GY9t4eykkHFU5vXsK+2gJI5VKXcqwP/qGxcFcgLr0TZssOrEfzLxwTGDRKlYiDo
 w+5z5Oa2PG/5S0y0S5fA70fM94+5HxpKcUakfDAIxX1SHuHx99Pz5/SGPpCcQPx/vsmv
 SNSMEM9p1ImfIPXz40dEjEM1ng9l+3SLEO3NJRVBPdzvFLkM/ZPvDIM/qd0hD2kii+cg
 dK4oX6+55xEiilJf/Rf8dmzR8bf8HdcHElV+3d3HcDd/ZWWl3KHIP+dXTWf4u3SVMQgv
 r5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QSB6c+wqSkjWB7X1hlshGuzqfkl/JFQbMqvRhf61Ikk=;
 b=kBr8yRAZKzFFOrCizy3JDWYQVoMPn5OvvqI+cr30S4OE9FhwWmEwCHNDiMf4Rsg/mD
 p1cmh/g5F2/xJsAut3JkPYKpq1GQ/nnU9aT+X6EEObkEzB8OUUIVyOExo/3feykCkZnO
 bjLLlEmIu6m1iUkTydDMwzXR6toqUZcK+8O9s5QxdwX2uFsSap5kGi0KXIxZAh8al+yz
 2vdk8cEXeG8Bf2BUTrFo07OLWbhSktAhAWcZJNmJjAc2wSww8k0A9PfR5//N71xUEhpd
 eZ1pi0eAKP9lAJi95xOt40IY1pIINDH3CCo9GwzcLQ1SGa/P3RWyy13nnC9eY0Omy9/H
 NZRg==
X-Gm-Message-State: AOAM530uyO6N2fqWYLjMAArGEQdTf70fzDi09BUsAXmLfkj84L5tTSIY
 8Hj6/ZOvvIdRjbXgsqG3jT8kHw1Ar49KndznthY=
X-Google-Smtp-Source: ABdhPJyoSa5YN1edYG0/ySQxYWx6ytJWo+VEosBgI6Mj0Js0n5VKDL2SjoMGrj9+CzPh3R7W7GBQqmhK3OHSZFL/piM=
X-Received: by 2002:a05:6512:3191:b0:45d:cb50:f575 with SMTP id
 i17-20020a056512319100b0045dcb50f575mr20776471lfe.48.1649663788912; Mon, 11
 Apr 2022 00:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220322030152.19018-1-ctcchien@nuvoton.com>
 <20220322030152.19018-2-ctcchien@nuvoton.com>
 <c73bf178-f5bd-01c6-209d-051706112877@molgen.mpg.de>
In-Reply-To: <c73bf178-f5bd-01c6-209d-051706112877@molgen.mpg.de>
From: Medad Young <medadyoung@gmail.com>
Date: Mon, 11 Apr 2022 15:56:17 +0800
Message-ID: <CAHpyw9ckLUNe8biEFSjHBndG_WD-7O-QsHO8Rr0eoXbROH0dUQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] ARM: dts: nuvoton: Add memory controller node
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

thanks for your comments

Paul Menzel <pmenzel@molgen.mpg.de> =E6=96=BC 2022=E5=B9=B44=E6=9C=889=E6=
=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=881:57=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Dear Medad,
>
>
> Thank you for the patch.
>
> Am 22.03.22 um 04:01 schrieb Medad CChien:
> > ECC must be configured in the BootBlock header.
>
> bootblock
>
> I search for *bootblock* in Linux and the git commit messages, and does
> not seem to be a common term. Is that term used in the datasheet?

Yes, bootblock is a bootloader of our SOC

>
> > Then, you can read error counts via
> > the EDAC kernel framework.
>
> Please reflow for 75 characters per line. (Also, there is no need to
> break lines after a sentence, unless 75 characters are reached or a new
> paragraph starts.)
>
> Tested on what board?

I tested this on Nuvoton's BMC board

>
> > Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
>
> Out of curiosity, is the first C in CChien the letter of your middle
> name, or the last name really spelled with two capital letters in the
> beginning?

this is a special last name in chinese.
my last name does really spell with two capitak letters in the begining.

>
> > ---
> >   arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 7 +++++++
> >   1 file changed, 7 insertions(+)
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
>
> Is f0824000 from some datasheet?
>
> > +                     interrupts =3D <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> > +                     status =3D "disabled";
> > +             };
> > +
> >               rstc: rstc@f0801000 {
> >                       compatible =3D "nuvoton,npcm750-reset";
> >                       reg =3D <0xf0801000 0x70>;
>
>
> Kind regards,
>
> Paul

B.R.
Medad
