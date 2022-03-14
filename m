Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B21E54D7A68
	for <lists+openbmc@lfdr.de>; Mon, 14 Mar 2022 06:33:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KH4vL50NSz2yy3
	for <lists+openbmc@lfdr.de>; Mon, 14 Mar 2022 16:33:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NfkG+SyI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::232;
 helo=mail-lj1-x232.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=NfkG+SyI; dkim-atps=neutral
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KH4ty4f2Pz2xDY
 for <openbmc@lists.ozlabs.org>; Mon, 14 Mar 2022 16:32:56 +1100 (AEDT)
Received: by mail-lj1-x232.google.com with SMTP id z26so20209939lji.8
 for <openbmc@lists.ozlabs.org>; Sun, 13 Mar 2022 22:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Bg2tizYqINxLaPAUtFWgOMe6U6P8VVtNtHhthzp+bNk=;
 b=NfkG+SyIm8tCL/zOPwO1KnVTPxiHAE3v9/ysLSapqVw7bkxmxOhB2gmvGoQj1D55wT
 yP9JUSKVbEKu1IcCLpsl4a+l/rLJ1YZzTI4MOUwTJZjsZEMlpQ4FDi1/k74Ny59szLHe
 4GnDZcPErTJ6simgZ2+qeplpmZJQ3FoRm034iGgtalMdQC6mZ5G3p509KKto2DlrjNAs
 /HemlPuaWhrk7KnKhasu3Fi8CpJMQQoX4+wK6rTItWoHpum3eLd+MefoRUIOwnYtRhFI
 rixVSeJvqDJoMYq53sw+LBv/EFOcKZPnWCcrUsAGEzWGDheT2jBgW17SNFhWP5yE9QcV
 YYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Bg2tizYqINxLaPAUtFWgOMe6U6P8VVtNtHhthzp+bNk=;
 b=KaY9C8cPm4p3R3Wu6Rxxh/njGTTf4fBviklYEJgpolPpqVKtSbiN1X2Oqy3nFT2ZiD
 XPGXXXH6stmLNv51B0WEnEjOYv0AQTL0FTEtzfbtmO6pNI+S5YrxIbI3ehabOZL7uP3W
 GC3f9d0UzlUsIIPVqYWbQtYE+h44EaQJtRm8SpTjQC1j5PLNl2ufwTbE63nidoAm+fal
 zy043Riw03qPE+YYZgStntIRKcKlAcGFupx9RuO3GeakM8GWj9yw2oU+haNBrKF+4faH
 oPnDlNVZ33gctgRhXEIRFvWOe0iwWVKy9rK4VQxJv2VEKLLJgyyQmO5WW1qZgj5UgSKt
 BVzg==
X-Gm-Message-State: AOAM531dt+ntgu09GC964UOdflHhpstOvsWhuCZOMKaL+hdw2CsSILjZ
 wLHQ9p5C7s2hcrzJ0AGCZ/u4Hp+vsoolg8OM+H8=
X-Google-Smtp-Source: ABdhPJw99wXJ7VBc1ldLK6Gm+PgQRmnPgXWSIBgfH6KHHKs1ZlA6/QsEtlHm/AWU4bJ5LyqvuX0idpMKmQT55Ln8Vd0=
X-Received: by 2002:a2e:5009:0:b0:247:d738:3e8e with SMTP id
 e9-20020a2e5009000000b00247d7383e8emr13197832ljb.281.1647235972025; Sun, 13
 Mar 2022 22:32:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220311014245.4612-1-ctcchien@nuvoton.com>
 <20220311014245.4612-4-ctcchien@nuvoton.com>
 <1f5e1e49-4ab0-5e06-fa8f-2a11b0fd1df9@canonical.com>
In-Reply-To: <1f5e1e49-4ab0-5e06-fa8f-2a11b0fd1df9@canonical.com>
From: Medad Young <medadyoung@gmail.com>
Date: Mon, 14 Mar 2022 13:32:40 +0800
Message-ID: <CAHpyw9dHau348qJB6g+fCcKqWByUsRHAGwb_mdUg=hjhW+xNsw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] EDAC: nuvoton: Add NPCM memory controller driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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

Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> =E6=96=BC 2022=E5=
=B9=B43=E6=9C=8811=E6=97=A5
=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=885:15=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On 11/03/2022 02:42, Medad CChien wrote:
> > Add support for Nuvoton NPCM SoC.
> >
> > Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> > ---
> >  drivers/edac/Kconfig     |   9 +
> >  drivers/edac/Makefile    |   1 +
> >  drivers/edac/npcm_edac.c | 714 +++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 724 insertions(+)
> >  create mode 100644 drivers/edac/npcm_edac.c
> >
> > diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
> > index 58ab63642e72..757e1d160640 100644
> > --- a/drivers/edac/Kconfig
> > +++ b/drivers/edac/Kconfig
> > @@ -539,4 +539,13 @@ config EDAC_DMC520
> >         Support for error detection and correction on the
> >         SoCs with ARM DMC-520 DRAM controller.
> >
> > +config EDAC_NPCM
> > +     tristate "Nuvoton NPCM DDR Memory Controller"
> > +     depends on ARCH_NPCM
>
> || COMPILE_TEST
> (and test if it compiles)
>
> (...)
>
> > +
> > +MODULE_DEVICE_TABLE(of, npcm_edac_of_match);
> > +
> > +static int npcm_edac_mc_probe(struct platform_device *pdev)
> > +{
> > +     const struct npcm_edac_platform_data *npcm_chip;
> > +     struct device *dev =3D &pdev->dev;
> > +     struct edac_mc_layer layers[1];
> > +     const struct of_device_id *id;
> > +     struct priv_data *priv_data;
> > +     struct mem_ctl_info *mci;
> > +     struct resource *res;
> > +     void __iomem *reg;
> > +     int ret =3D -ENODEV;
> > +     int irq;
> > +
> > +     id =3D of_match_device(npcm_edac_of_match, &pdev->dev);
> > +     if (!id)
> > +             return -ENODEV;
>
> Why do you need it? How such case is even possible?
this driver is used for two nuvoton SOCs, one is NPCM845 and the other
is NPCM750

>
> > +
> > +     npcm_chip =3D of_device_get_match_data(&pdev->dev);
> > +     if (!npcm_chip)
> > +             return -ENODEV;
>
> I wonder, how is it possible to have here NULL?
>
> Best regards,
> Krzysztof
