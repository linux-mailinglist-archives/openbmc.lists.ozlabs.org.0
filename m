Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C1E932847
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 16:24:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YlEnGY45;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNhD51r5cz3fRN
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2024 00:24:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YlEnGY45;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1130; helo=mail-yw1-x1130.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNhCY3JF3z30Vk
	for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2024 00:24:24 +1000 (AEST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-65faa0614dbso31945487b3.2
        for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2024 07:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721139862; x=1721744662; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IloAEevb9j/jeRb0W1UmR0i732zAODizdCFxqOWvxSA=;
        b=YlEnGY45sptf/ryObffukCbExcWa35jBsBI+/FJYZ8kuLhp9ADdgENZpXQhz6Valh5
         HU94PuNc1imSE5eDGkouIpsyVEBhwoyFa6J+o8ytzzdo3akKmYcHowNo5npU5FNiRou/
         aB8Gu69sgC5kNUMoinQMs5NvPmZFGjNLU1bsN772WsmVuqmZpAzhqeNwrHhrhwjE217o
         cKMh8beswlanICDV73Rj2QlDdsAIph6iv7lCT+c0CJ4urcHz73Oewe4RFpjj93YfTEr1
         9pxPBxyKf7YTFpb5Qr/4DM3Z4KsZOQPSYKuQu6Au3ifn3qC8yielKnxk3Dl9tgEwdiry
         DRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721139862; x=1721744662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IloAEevb9j/jeRb0W1UmR0i732zAODizdCFxqOWvxSA=;
        b=Hp76yIgRiGaDGuNgd9Hzv/+H903knGWZBtth7GeMTNQTBd59ydmg19YcpvvlpIbWGP
         MfG/ZfvjB1olLBsrRhHh2Zk5iBM8RIEnbkQ0Fa3amJGt6xAL6cBIVKqTY8ASP8vuEYWK
         2hR6Cpz/j3/PniQ7M8ik9f6xw2aSznMoM31vGXkDMPnBg+6PD2ppZrnuCJkNesm266+n
         kCowaxIR/4JEQ9VzaB59pQHI85q9L9V/MrYsmHMUQy8bTSug6jdiomw4mOVoHVDMr+j3
         p55bzr7aoVYGlFUZCQUjXxfuKWWscn95cZzacLDdps5RBQWSl0HcFmpgHN9q/npRKEdi
         TRNA==
X-Forwarded-Encrypted: i=1; AJvYcCXud1MVUptjgyjfGbZmXI36yVj4grJ272cLSybBdYg6nMAeHis0qb/WrffM8tMW8LUj9u/lov+F5I6Mxr1Gqsn6tRZDeUk30lQ=
X-Gm-Message-State: AOJu0YxKgfz6cOBGlTKRQZueZlfRv7DJmsDtOl8yhDdrkkx6QypjEAjE
	tQqd4mx3smFMoNtvlYcU7i8cTlFAztngUACYADkhYZED+18GjEIzVRNnVH3NQJzwQOX6MlfBrp+
	BLpHws9H2AUagG9Wc2ax4EBrxTW0=
X-Google-Smtp-Source: AGHT+IF45F4/cjaTHhqZQI1M7kkXoOzONUc/n2JH/TE3b2V5uGdk0Ign5R7+DjG+ypwkKUTt2WfJP6BJa8GLui80V64=
X-Received: by 2002:a05:690c:ecf:b0:650:4542:56e6 with SMTP id
 00721157ae682-66381abfa0dmr28480317b3.48.1721139862151; Tue, 16 Jul 2024
 07:24:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240711193749.2397471-1-tmaimon77@gmail.com> <20240711193749.2397471-5-tmaimon77@gmail.com>
 <ZpFrslx57m62SEsg@probook>
In-Reply-To: <ZpFrslx57m62SEsg@probook>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 16 Jul 2024 17:24:11 +0300
Message-ID: <CAP6Zq1gYSiXFhtA0HAaoSLD7Lz-9nuoy-cUn+qvh0BLev_ifVg@mail.gmail.com>
Subject: Re: [PATCH v1 4/7] pinctrl: nuvoton: npcm8xx: remove unused smb4den
 pin, group, function
To: =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>
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
Cc: benjaminfair@google.com, linux-gpio@vger.kernel.org, avifishman70@gmail.com, venture@google.com, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, joel@jms.id.au, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

It does not exist, do you suggest modifying the "unused" to "not exist"?

Thanks,

Tomer

On Fri, 12 Jul 2024 at 20:45, J. Neusch=C3=A4fer <j.neuschaefer@gmx.net> wr=
ote:
>
> On Thu, Jul 11, 2024 at 10:37:46PM +0300, Tomer Maimon wrote:
> > Remove unused smb4den pin, group and function on the Nuvoton NPCM8XX BM=
C
> > SoC.
>
> Does "unused" mean that they are just unused in current board designs,
> or does the hardware functionality actually not exist?
>
> Best regards, J
>
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctr=
l/nuvoton/pinctrl-npcm8xx.c
> > index f342aec3f6ca..396bd07e7c74 100644
> > --- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
> > +++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
> > @@ -438,7 +438,6 @@ static const int smb4_pins[]  =3D { 28, 29 };
> >  static const int smb4b_pins[] =3D { 18, 19 };
> >  static const int smb4c_pins[] =3D { 20, 21 };
> >  static const int smb4d_pins[] =3D { 22, 23 };
> > -static const int smb4den_pins[] =3D { 17 };
> >  static const int smb5_pins[]  =3D { 26, 27 };
> >  static const int smb5b_pins[] =3D { 13, 12 };
> >  static const int smb5c_pins[] =3D { 15, 14 };
> > @@ -700,7 +699,6 @@ struct npcm8xx_pingroup {
> >       NPCM8XX_GRP(smb4b), \
> >       NPCM8XX_GRP(smb4c), \
> >       NPCM8XX_GRP(smb4d), \
> > -     NPCM8XX_GRP(smb4den), \
> >       NPCM8XX_GRP(smb5), \
> >       NPCM8XX_GRP(smb5b), \
> >       NPCM8XX_GRP(smb5c), \
> > @@ -949,7 +947,6 @@ NPCM8XX_SFUNC(smb4);
> >  NPCM8XX_SFUNC(smb4b);
> >  NPCM8XX_SFUNC(smb4c);
> >  NPCM8XX_SFUNC(smb4d);
> > -NPCM8XX_SFUNC(smb4den);
> >  NPCM8XX_SFUNC(smb5);
> >  NPCM8XX_SFUNC(smb5b);
> >  NPCM8XX_SFUNC(smb5c);
> > @@ -1173,7 +1170,6 @@ static struct npcm8xx_func npcm8xx_funcs[] =3D {
> >       NPCM8XX_MKFUNC(smb4b),
> >       NPCM8XX_MKFUNC(smb4c),
> >       NPCM8XX_MKFUNC(smb4d),
> > -     NPCM8XX_MKFUNC(smb4den),
> >       NPCM8XX_MKFUNC(smb5),
> >       NPCM8XX_MKFUNC(smb5b),
> >       NPCM8XX_MKFUNC(smb5c),
> > @@ -1348,7 +1344,7 @@ static const struct npcm8xx_pincfg pincfg[] =3D {
> >       NPCM8XX_PINCFG(14,      gspi, MFSEL1, 24,       smb5c, I2CSEGSEL,=
 20,   none, NONE, 0,          none, NONE, 0,          none, NONE, 0,      =
    SLEW),
> >       NPCM8XX_PINCFG(15,      gspi, MFSEL1, 24,       smb5c, I2CSEGSEL,=
 20,   none, NONE, 0,          none, NONE, 0,          none, NONE, 0,      =
    SLEW),
> >       NPCM8XX_PINCFG(16,      lkgpo0, FLOCKR1, 0,     smb7b, I2CSEGSEL,=
 27,   tp_gpio2b, MFSEL7, 10,  none, NONE, 0,          none, NONE, 0,      =
    SLEW),
> > -     NPCM8XX_PINCFG(17,      pspi, MFSEL3, 13,       cp1gpio5, MFSEL6,=
 7,    smb4den, I2CSEGSEL, 23, none, NONE, 0,          none, NONE, 0,      =
    SLEW),
> > +     NPCM8XX_PINCFG(17,      pspi, MFSEL3, 13,       cp1gpio5, MFSEL6,=
 7,    none, NONE, 0,          none, NONE, 0,          none, NONE, 0,      =
    SLEW),
> >       NPCM8XX_PINCFG(18,      pspi, MFSEL3, 13,       smb4b, I2CSEGSEL,=
 14,   none, NONE, 0,          none, NONE, 0,          none, NONE, 0,      =
    SLEW),
> >       NPCM8XX_PINCFG(19,      pspi, MFSEL3, 13,       smb4b, I2CSEGSEL,=
 14,   none, NONE, 0,          none, NONE, 0,          none, NONE, 0,      =
    SLEW),
> >       NPCM8XX_PINCFG(20,      hgpio0, MFSEL2, 24,     smb15, MFSEL3, 8,=
       smb4c, I2CSEGSEL, 15,   none, NONE, 0,          none, NONE, 0,      =
    SLEW),
> > --
> > 2.34.1
> >
