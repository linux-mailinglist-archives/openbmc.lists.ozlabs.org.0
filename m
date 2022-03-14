Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 881724D7A21
	for <lists+openbmc@lfdr.de>; Mon, 14 Mar 2022 06:23:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KH4gT3c8dz30Fn
	for <lists+openbmc@lfdr.de>; Mon, 14 Mar 2022 16:23:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NAiU65hC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22e;
 helo=mail-lj1-x22e.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=NAiU65hC; dkim-atps=neutral
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KH4g215YTz2xCW
 for <openbmc@lists.ozlabs.org>; Mon, 14 Mar 2022 16:22:37 +1100 (AEDT)
Received: by mail-lj1-x22e.google.com with SMTP id s25so20218463lji.5
 for <openbmc@lists.ozlabs.org>; Sun, 13 Mar 2022 22:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nbtSRVVGN9+RW0bywIMfiM4Hm879DO3M3rRCioh4tYQ=;
 b=NAiU65hC0RdlCLNvMHA6EpX6WuG1OWLd6FapI0qT+0lKExVONOE/rIQb0+3xcyJkAa
 z5iCeLlTWEynD+D7MnLrcagjOqNEPXn0GpMxTu3hskeyRL78MCrXgSx9nc1EPY6Wz0d5
 76gvib3waCrlOEfs6bVRH2G6zlsa1wRjmRp5+vwBY6qEDDjbNVvaxjVtQyctK2uU1cCG
 EfZDJ7LtZZPb/tYAuUBuqdPQAOsgXXhXfsWEw5MenlVKGDRzq3XiDn5QM2vIh9jT/DKm
 zPtTkKup3Zfj4oC+ayDWrOPCMMeloEwjIPlhm8Lt6JUImhvXi9tVgaL5BQvz5al04JwU
 /0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nbtSRVVGN9+RW0bywIMfiM4Hm879DO3M3rRCioh4tYQ=;
 b=K6+fzY623pu86A4PmyC6n0iGeSVwkcaHQ6eBlcx8t4DwDL6CGhp2kK/0c6HqnlYxZg
 xaMPoxNKZsEFNCBRO70pnC7YMPrtEVpEzOcYkXWxAC74pU7vpbI36WdyuaucQ3EknyV2
 UUY1XhxZ416vM5qebFcPpxsjVWwcMPRZg9wrJlrHq6DVz00Ong6g0rN7wHU1y2C8u2+C
 FV+fHUTNucBk7NwY78LP71lSDtn2nbVTrNn4ZQT3QqL+TgmnSopbwAlIedP40BiX+GrD
 aiTlObWvPGNML12Jtrdvjg839Yg31XsDH43/imJY7MqhSWrzBRvyRm7r0A9Vq1uLvSmZ
 xYlg==
X-Gm-Message-State: AOAM532IPK4HL959N2NBKLknj6oshL/41TgLnwBpIqDN2FW5W3dlpJIK
 vmvSNCVOwSBrR7+nwOAjYJz01t4KWUjTujXLlIY=
X-Google-Smtp-Source: ABdhPJwvNQd3kXdudgrucu3kBp5FeLLKmBLeW5rm4ea83FVn+wM7tBsNQTBq6mKZ39OAcunmGGzS7AxL8r9kikQOvR8=
X-Received: by 2002:a2e:5009:0:b0:247:d738:3e8e with SMTP id
 e9-20020a2e5009000000b00247d7383e8emr13180918ljb.281.1647235346612; Sun, 13
 Mar 2022 22:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220311014245.4612-1-ctcchien@nuvoton.com>
 <20220311014245.4612-2-ctcchien@nuvoton.com>
 <YiwGFmbXw0qwM9mx@latitude>
In-Reply-To: <YiwGFmbXw0qwM9mx@latitude>
From: Medad Young <medadyoung@gmail.com>
Date: Mon, 14 Mar 2022 13:22:15 +0800
Message-ID: <CAHpyw9dmFdnmOEr9L=H5BMYsh7bV9JWCfnpNA=zVg2OdLD9AOQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] ARM: dts: nuvoton: Add new device node
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
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
 Benjamin Fair <benjaminfair@google.com>, linux-edac@vger.kernel.org,
 KFTING <KFTING@nuvoton.com>, avifishman70@gmail.com,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, ctcchien@nuvoton.com, tali.perry1@gmail.com,
 devicetree@vger.kernel.org, robh+dt@kernel.org, bp@alien8.de,
 james.morse@arm.com, YSCHU@nuvoton.com, mchehab@kernel.org,
 linux-kernel@vger.kernel.org, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

OK, I will check it.
thanks for your comment

B.R.
Medad

Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net> =E6=96=BC 2022=E5=B9=B43=
=E6=9C=8812=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=8810:31=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> >Subject: [PATCH v3 1/3] ARM: dts: nuvoton: Add new device node
>
> To make it more obvious what this patch is about, I suggest something lik=
e:
>
> [PATCH v3 1/3] ARM: dts: nuvoton: Add memory controller node
>
>
> This arguably makes the next line in the commit message redundant,
> but there is other useful information that can be added there, if you
> like, such as how the kernel is going to use the memory controller.
>
>
> Best regards,
> Jonathan
>
> On Fri, Mar 11, 2022 at 09:42:43AM +0800, Medad CChien wrote:
> >  Add NPCM memory controller device node
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
> > 2.17.1
> >
