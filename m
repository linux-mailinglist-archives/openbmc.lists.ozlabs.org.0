Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACBB714D75
	for <lists+openbmc@lfdr.de>; Mon, 29 May 2023 17:53:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVKnD3Njjz3fCb
	for <lists+openbmc@lfdr.de>; Tue, 30 May 2023 01:53:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Mjj5Ugct;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Mjj5Ugct;
	dkim-atps=neutral
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVKmh2g6fz2xH6
	for <openbmc@lists.ozlabs.org>; Tue, 30 May 2023 01:52:51 +1000 (AEST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2af2696fd1cso35740041fa.2
        for <openbmc@lists.ozlabs.org>; Mon, 29 May 2023 08:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685375564; x=1687967564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGEKNlVjba3Uxjbme8b9RXxIe58f3YvDlezq/+8zxTI=;
        b=Mjj5UgctfezMCHltzHW+A8T5x5/3dFb2dzNasfCyGbtOikmZvng/0XBFxq+uXYE/FY
         t6l3BHE+27xIy++ICtp63addI+J79hwzn9bwR19674sk57FXhmiKyPx6OWLuTTOaij4Z
         X5lumtOqj/JWTUjEujNKKgVE4eoiLWeJiafazpmY/LiF/Vxcelg6tRJZOhcpOptzwS2s
         KizfpfxMqxskhm2Q8DevdKApUT0fMSws9sWE162eWkKflZT0XPRKSMtAC8F6NU2Pxioy
         tPhZJEVXYtGGE+qRPRtJ2he+drqgMzbohVXSCnJD3svkS9XPXb+E95Hi1t4Ch6W2g4D8
         aFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685375564; x=1687967564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dGEKNlVjba3Uxjbme8b9RXxIe58f3YvDlezq/+8zxTI=;
        b=J9mrYG0YTBfEbXbJxd7IUDAYHwTedZwCzrqHAt8+i9i2HnjBy9LA9pBssvB756kpTN
         qUy5PmZGqkVqcvxpIS+QU15YviHv15hSwSbmOKuR1fSBRYTZdpBmoX0lm2GVWun3mpLP
         IB+m/32zyfjKBC8DjJBWA9MKRuHNs1yDreYz2gC/hkLqs/bB9TUXKARKVMC4iqjjEVu4
         YnJ5riBncfhJJ8RrB82ZO3qbPuuPzojJy6AEUtQSY6pmhL2WuoaaEoyBy2gtkwPTe0mQ
         hRUEHeMK3oCFG4jsqU4wHs7cgjtYXpyktJWZUTfqFAyrGhpmUwEV56F81wSLoddcf6WE
         jPJg==
X-Gm-Message-State: AC+VfDwd35WUJ0xaesYFzwVmGNJ34uWZJ/cZvN6QbSVZ+zVBDK7SK7TV
	4xtgHsc6avkEyvVK7iZOzzQCZQx9GvzmQn5RyIs=
X-Google-Smtp-Source: ACHHUZ44ENjVnVGMqNdRd/W6tQ7x2nto8cf2mXLOOpYHKQnav8XqY4+w3zejqGP55+7gAu7B5aymdVDL1+GPnAzA5tI=
X-Received: by 2002:a2e:84c1:0:b0:2a7:748c:1eef with SMTP id
 q1-20020a2e84c1000000b002a7748c1eefmr4039767ljh.38.1685375563857; Mon, 29 May
 2023 08:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230521143202.155399-1-tmaimon77@gmail.com> <20230521143202.155399-2-tmaimon77@gmail.com>
 <0e72c35f-5d9d-45a7-5f85-3971b8029106@wanadoo.fr> <CAP6Zq1jOSKpzFvto1LMs=JftLK0fxrrg+73Sh34GunuLfcAfEA@mail.gmail.com>
 <fa7a8bc4-d1a1-3b1a-8b9e-618681d281dd@wanadoo.fr>
In-Reply-To: <fa7a8bc4-d1a1-3b1a-8b9e-618681d281dd@wanadoo.fr>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 29 May 2023 18:52:32 +0300
Message-ID: <CAP6Zq1gb8zJc=2QwNbes-AXP25thKsEVJ11pQfX24eWN62zDMQ@mail.gmail.com>
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

On Mon, 22 May 2023 at 20:36, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Le 22/05/2023 =C3=A0 14:56, Tomer Maimon a =C3=A9crit :
> > Hi Christophe,
> >
> > Thanks for your comments
> >
>
> [...]
>
> >>> +static struct clk_hw *
> >>> +npcm8xx_clk_register_pll(struct device *dev, void __iomem *pllcon,
> >>> +                      const char *name, const struct clk_parent_data=
 *parent,
> >>> +                      unsigned long flags)
> >>> +{
> >>> +     struct npcm8xx_clk_pll *pll;
> >>> +     struct clk_init_data init =3D {};
> >>> +     int ret;
> >>> +
> >>> +     pll =3D kzalloc(sizeof(*pll), GFP_KERNEL);
> >>
> >> Everything looks devm_()'ed in this driver, except this kzalloc.
> >> Except the one below, there is no kfree to free this memory, and no
> >> .remove() function.
> > Also  clk_hw_register_divider_parent_data doesn't use devm_
> > about free the pll, we use it, return at the end of the function.
> > about adding remove, we had a dissection about it in V4, since the
> > clock is a service driver it shouldn't be removed.
> > https://patchwork.kernel.org/project/linux-watchdog/patch/2022062113142=
4.162355-7-tmaimon77@gmail.com/
>
> LoL.
> At least, I'm consistent :).
>
> Just to make it clear, what I mean about kfree() is not to add one here,
> but either:
>     - to use devm_kzalloc() here, to avoid a leak, should loading the
> driver fails      OR
>     - have some kfree() where needed (at least in the error handling
> path of the probe, if the remove function makes no point)
O.K. Thanks for your clarification.
>
> CJ

Best regards,

Tomer
