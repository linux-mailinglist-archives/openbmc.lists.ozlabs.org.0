Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F2A7196EC
	for <lists+openbmc@lfdr.de>; Thu,  1 Jun 2023 11:28:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QX15X5VMfz3dt1
	for <lists+openbmc@lfdr.de>; Thu,  1 Jun 2023 19:28:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bcFdQRt/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bcFdQRt/;
	dkim-atps=neutral
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QX1505pgPz3cfJ
	for <openbmc@lists.ozlabs.org>; Thu,  1 Jun 2023 19:27:48 +1000 (AEST)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2af28303127so8236841fa.3
        for <openbmc@lists.ozlabs.org>; Thu, 01 Jun 2023 02:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685611665; x=1688203665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZirR1WPIJZVNOLvDsPuKt8AD0CB88Nj04n86hhjg6i4=;
        b=bcFdQRt/Wb1QEUUyH/8czxy/qX1tuWNPn16ZkMi/qptS5kWAuWYaxBeIGNmgDz3qbz
         Qg3nQQF/fIkfE4R/n3S8sPvSdn8f2rZ9gT7wLyHP0BY8lgkrkr1CEf9AkVG3YImKSxB/
         Xyf4Jm0advOdKas6jyQj0AVOnHrCR4IqWiX7XB84QGN4SuwKlF6CjMyo1vuJij2L7zmt
         +ICG3wAEYxmG5/ueQIt09FTvsJYZkSzpJir3cIODfnIThrSxNiNwm9zpnX1L6V7EgK+F
         dNheodiIBH5pwSBPyYWcsLnZBfMAU28wm7rgdSZzGXYQ7gdO1asBwYe+5YnYSTcN4Aca
         oC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685611665; x=1688203665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZirR1WPIJZVNOLvDsPuKt8AD0CB88Nj04n86hhjg6i4=;
        b=ifkpzy/2O4qvILYnItgQ9zb3NaPmCB5rGfx71WVWOSXMKvfVRa71NpQJPD3ndBoLTt
         VDdUUhqc49Rx/akG4D+z/1DhTrFrqvjQdsyWK2Zw3CpR79JLPvFPYmI6MoXe2o8usYhF
         TWExpHGpg7ebPkwOWu0TvUvGUZ9boWXySvWKstw93m9EkNGjf5/KYZeztVNIo9dlbTXB
         IKDTTJmwX5ZsjzO58Sv8O8Q+0F3hrpaSuD8yuI4bv88Cbff8KBI1AF0NPA6EtNMDLDxB
         tFmfdPQtIGZy3pD/bMA/JbAtJu6DQwUaajvl2R6j2ehxcnvMOJKsmKUnEw7tWsS+WWb1
         h01w==
X-Gm-Message-State: AC+VfDyE8/rZRoIACVhukcRElShg9pygtrftv2d2RRYymV1snNqKf9JU
	t9pRPGH0Wuayf0/HqZ/SpGlC4XtQ+/1USP+yEkA=
X-Google-Smtp-Source: ACHHUZ7/Ek8dsYRsbGXaINIgFwouECA0acE7aYF3Bt0x3Z5Dc3mGC3JPbOqKTKJ/13SDDQujvXDk1qAnt2/UY7Q7zu0=
X-Received: by 2002:a2e:7215:0:b0:2b0:4c72:98ff with SMTP id
 n21-20020a2e7215000000b002b04c7298ffmr4131381ljc.7.1685611665030; Thu, 01 Jun
 2023 02:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230521143202.155399-1-tmaimon77@gmail.com> <20230521143202.155399-2-tmaimon77@gmail.com>
 <0e72c35f-5d9d-45a7-5f85-3971b8029106@wanadoo.fr> <CAP6Zq1jOSKpzFvto1LMs=JftLK0fxrrg+73Sh34GunuLfcAfEA@mail.gmail.com>
 <fa7a8bc4-d1a1-3b1a-8b9e-618681d281dd@wanadoo.fr> <CAP6Zq1gb8zJc=2QwNbes-AXP25thKsEVJ11pQfX24eWN62zDMQ@mail.gmail.com>
In-Reply-To: <CAP6Zq1gb8zJc=2QwNbes-AXP25thKsEVJ11pQfX24eWN62zDMQ@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 1 Jun 2023 12:27:33 +0300
Message-ID: <CAP6Zq1g00SVfPjfQLsgz3V+vU4VHq_MYFcoy0Um46NDZZ9iY_w@mail.gmail.com>
Subject: Re: [PATCH v16 1/1] clk: npcm8xx: add clock controller
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
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
Cc: benjaminfair@google.com, sboyd@kernel.org, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, avifishman70@gmail.com, joel@jms.id.au, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Stephen,

Kind reminder regarding the patch, appreciate your comments.

Thanks,

Tomer

On Mon, 29 May 2023 at 18:52, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> On Mon, 22 May 2023 at 20:36, Christophe JAILLET
> <christophe.jaillet@wanadoo.fr> wrote:
> >
> > Le 22/05/2023 =C3=A0 14:56, Tomer Maimon a =C3=A9crit :
> > > Hi Christophe,
> > >
> > > Thanks for your comments
> > >
> >
> > [...]
> >
> > >>> +static struct clk_hw *
> > >>> +npcm8xx_clk_register_pll(struct device *dev, void __iomem *pllcon,
> > >>> +                      const char *name, const struct clk_parent_da=
ta *parent,
> > >>> +                      unsigned long flags)
> > >>> +{
> > >>> +     struct npcm8xx_clk_pll *pll;
> > >>> +     struct clk_init_data init =3D {};
> > >>> +     int ret;
> > >>> +
> > >>> +     pll =3D kzalloc(sizeof(*pll), GFP_KERNEL);
> > >>
> > >> Everything looks devm_()'ed in this driver, except this kzalloc.
> > >> Except the one below, there is no kfree to free this memory, and no
> > >> .remove() function.
> > > Also  clk_hw_register_divider_parent_data doesn't use devm_
> > > about free the pll, we use it, return at the end of the function.
> > > about adding remove, we had a dissection about it in V4, since the
> > > clock is a service driver it shouldn't be removed.
> > > https://patchwork.kernel.org/project/linux-watchdog/patch/20220621131=
424.162355-7-tmaimon77@gmail.com/
> >
> > LoL.
> > At least, I'm consistent :).
> >
> > Just to make it clear, what I mean about kfree() is not to add one here=
,
> > but either:
> >     - to use devm_kzalloc() here, to avoid a leak, should loading the
> > driver fails      OR
> >     - have some kfree() where needed (at least in the error handling
> > path of the probe, if the remove function makes no point)
> O.K. Thanks for your clarification.
> >
> > CJ
>
> Best regards,
>
> Tomer
