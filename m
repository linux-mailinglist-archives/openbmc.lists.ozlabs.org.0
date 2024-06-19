Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AFD90E952
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2024 13:24:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JRDPPZO8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W41Vr51K1z3dBZ
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2024 21:24:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JRDPPZO8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W41V96tq6z30Vg;
	Wed, 19 Jun 2024 21:24:17 +1000 (AEST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2ec002caeb3so84243871fa.2;
        Wed, 19 Jun 2024 04:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718796255; x=1719401055; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4AhLMVJiVMssdXrymxDZSsXEoYz8lpEaRocGgJePhUg=;
        b=JRDPPZO8fKbA+iSj8NnXDBmBY8y7InIK+krQ6/jQQx72bo6+/GteRKK5vhJBCEBurF
         SikD5QkdZH+JoJ6Sle4BWrPWjWzOUPwXX5OG4ThAWboNNZdgnWibVgRqS0EXrbyQQzwD
         iB/Ov/23Kkcfm5BxgB5dn85viB65MHq0tsZVahaf0VWKLbS6dDT5BzgRfUY1PcMJbaDC
         C4eO6rRntBHVDS1dAUn9aK+FlTI8Wo1aAAVPjTK/flyPz0YoZ/MS6cEk1qTVsgYpS5OA
         lpBtQy9Uq4jcmKtlvpusT2M/x2wmvKLGs37aIWCOZwNlTbPctS31kQG0HRXFbPC9V3w/
         WAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718796255; x=1719401055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4AhLMVJiVMssdXrymxDZSsXEoYz8lpEaRocGgJePhUg=;
        b=oFn7dJ185cfDVDjlr7iEMMw5gGBFPOYIYjl9MqDoQKA0cb87mHHga1QUUSna1SyZny
         H1aa4YtF58os1fYeyuH873dOWu8woVA2NRF10JxoxXCAuszHYqc9uX38k5XG9NYeoPKS
         NCclcVQJE9tp/wTKLWEJhqn7/dzjLgz3Mqql277ov22tGStX+w4NkCUqs+sAKYe+CnCg
         tLCqJ75Jce5/N7CbHY6A3/5P4qZECvLs0gj+UGB3Zn7xizPLFr3fRKcTCRXTNaCr/z6H
         /gW6sx+II9fenXYUKrvH0sjarKgQNNMB6BnpDIyVitzykoLQevLTzmuSAnAvBYiSzu/G
         MfZw==
X-Forwarded-Encrypted: i=1; AJvYcCUWarVrErS7WR7bGPo0gOe4s0aAnChjIHLHrJucm36dqeatCo2RNnMe4RhOBmqJGkDlHQl11LgNfZOYXAD6VJn9Gyw1odqbg+c5tqu3Xo7j7dpaq/IWFx9JI14XgL5Nz8PFfWaDV8Nd
X-Gm-Message-State: AOJu0Ywg402Wn4v+u9YPAc3wHOw6XeemJk/DeLLiw5njboKk1uGlZ4iQ
	4ptyNx+M8bbNRwMKwTeRZDIYleLHTs9HtVDundESnLvpub7vWw1fzP9GeRqX/zYsFtEqLUL0jUv
	UPS7T9wdNtqp9VRRtkDiWMAD3J+M7iK1o
X-Google-Smtp-Source: AGHT+IEQww8Sc0Jg4gCddWh2kVTEqz+WZu5WTjkaJSzaRVJjX7JNi6gjqMvrxWj14/018FjLROHZoPp/GakSEWmq+uw=
X-Received: by 2002:a2e:9b08:0:b0:2ec:21f3:b67b with SMTP id
 38308e7fff4ca-2ec3cfd6744mr15635501fa.37.1718796255250; Wed, 19 Jun 2024
 04:24:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240613080725.2531580-1-potin.lai.pt@gmail.com> <946f44526e3016f595bfe463cf0a7f5b4eaa084a.camel@codeconstruct.com.au>
In-Reply-To: <946f44526e3016f595bfe463cf0a7f5b4eaa084a.camel@codeconstruct.com.au>
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Wed, 19 Jun 2024 19:24:03 +0800
Message-ID: <CAGfYmwVJvyEJ6sbvr=_OqNkiRSDBXn2uqMr28gN949NZd=5dcA@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: aspeed-g6: Add NCSI pin group config
To: Andrew Jeffery <andrew@codeconstruct.com.au>
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
Cc: linux-aspeed@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, Joel Stanley <joel@jms.id.au>, Potin Lai <potin.lai@quantatw.com>, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jun 17, 2024 at 3:33=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Thu, 2024-06-13 at 16:07 +0800, Potin Lai wrote:
> > In the NCSI pin table, the reference clock output pin (RMIIXRCLKO) is n=
ot
> > needed on the management controller side.
> >
> > To optimize pin usage, add new NCSI pin groupis that excludes RMIIXRCLK=
O,
> > reducing the number of required pins.
>
> Hmm, I'm not convinced this is specific to NCSI (and it's an
> unfortunate mistake on my part), but we do need to call the groups
> something different than RMII[34]. Did you have any other suggestions?
>
I don't have better name for now.
In ast2600 data sheet, it also mentioned "RMII" & "NCSI" together most
of the time, is it ok to use "NCSI" as a new group name?

Best regards,
Potin
> >
> > Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> > ---
> >  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinct=
rl/aspeed/pinctrl-aspeed-g6.c
> > index 7938741136a2c..31e4e0b342a00 100644
> > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> > @@ -249,7 +249,9 @@ PIN_DECL_2(E26, GPIOD3, RGMII3RXD3, RMII3RXER);
> >
> >  FUNC_GROUP_DECL(RGMII3, H24, J22, H22, H23, G22, F22, G23, G24, F23, F=
26, F25,
> >               E26);
> > -FUNC_GROUP_DECL(RMII3, H24, J22, H22, H23, G23, F23, F26, F25, E26);
> > +GROUP_DECL(RMII3, H24, J22, H22, H23, G23, F23, F26, F25, E26);
> > +GROUP_DECL(NCSI3, J22, H22, H23, G23, F23, F26, F25, E26);
> > +FUNC_DECL_2(RMII3, RMII3, NCSI3);
> >
> >  #define F24 28
> >  SIG_EXPR_LIST_DECL_SESG(F24, NCTS3, NCTS3, SIG_DESC_SET(SCU410, 28));
> > @@ -355,7 +357,9 @@ FUNC_GROUP_DECL(NRTS4, B24);
> >
> >  FUNC_GROUP_DECL(RGMII4, F24, E23, E24, E25, D26, D24, C25, C26, C24, B=
26, B25,
> >               B24);
> > -FUNC_GROUP_DECL(RMII4, F24, E23, E24, E25, C25, C24, B26, B25, B24);
> > +GROUP_DECL(RMII4, F24, E23, E24, E25, C25, C24, B26, B25, B24);
> > +GROUP_DECL(NCSI4, E23, E24, E25, C25, C24, B26, B25, B24);
> > +FUNC_DECL_2(RMII4, RMII4, NCSI4);
> >
> >  #define D22 40
> >  SIG_EXPR_LIST_DECL_SESG(D22, SD1CLK, SD1, SIG_DESC_SET(SCU414, 8));
> > @@ -1976,6 +1980,8 @@ static const struct aspeed_pin_group aspeed_g6_gr=
oups[] =3D {
> >       ASPEED_PINCTRL_GROUP(MDIO2),
> >       ASPEED_PINCTRL_GROUP(MDIO3),
> >       ASPEED_PINCTRL_GROUP(MDIO4),
> > +     ASPEED_PINCTRL_GROUP(NCSI3),
> > +     ASPEED_PINCTRL_GROUP(NCSI4),
>
> You will need to update the binding document as well. I've poked Linus
> W about a series I sent that re-formats the binding function and group
> lists - it would be nice if you rework the patch on top of that:
>
> https://lore.kernel.org/lkml/5bf8e1dddd2b958a102e7b1b9f9c080a34f9deff.cam=
el@codeconstruct.com.au/
>
> Cheers,
>
> Andrew
