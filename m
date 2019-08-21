Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AECFD97774
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 12:44:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46D4643DBfzDr63
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 20:44:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d43; helo=mail-io1-xd43.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="T1To62xz"; 
 dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D45B4txpzDr2h
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 20:43:25 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id l7so3546185ioj.6
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 03:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=21mfaxXpzzpcpjFxLsuOaE64M3Kk3ik/0tTAJe54ZzM=;
 b=T1To62xzjvEzr+9ni5+lpN2/GgC8rIsJ+fA7ZZG22Eib4BoVxDScW9e1mqvuWFc3Tt
 8/TUJ1PcvRC7h0FtQJP7KCPLUXakXY8sZjMnMC0HoAZW9AQs+9cNJGiHbPMyuhWALN3H
 AxKQvPM3cJdyFLqk78GlGCjS/fnp+HKZJGVZXAll95v7op+6lFP2nBem63fteWtn1G7M
 vuRBZ9F2DPrCF2YviqYUCo3rGBb4dVeV9CydJ1Q8Wlhx5gXzgDauAp2ItU0qeCdKdJBn
 30n9Ndn3jEBd3+f8rRS+NDForNpmmj3Wgbmiox77JD4ghaAdl7k/ZPakI46yskWOw1Tv
 66gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=21mfaxXpzzpcpjFxLsuOaE64M3Kk3ik/0tTAJe54ZzM=;
 b=TOkakXArVhKN0Vo+a4q5G5KreHx3aBkUoJ4HwwS2xXuTr1kysovI+Yi2GomTr+D1oN
 xhJi6JmTMtC/ts3I6xEA//+nVORNgw0oATVlHehaJVZeLrwizry6R/4qSzgDmp7d7Zci
 KJpYKGD2SveDkI5bFY8Byngq11A3ik11WdPyOHtAubNy/KlgY6WyvDWbF3tezvq551Jz
 Rdm0TQySzzwW/uS2wMDLfSmVsLSNQ5ogVcaG2a/AUtp8VCA7wU3GyO8+agUIIBrKS/1W
 3gnvECemVrRk08o8MIvXpQYT1k7dXNg4ORP3VKV1Ie9ANmREJtS59l7K4slOwKV7UcHe
 3ODg==
X-Gm-Message-State: APjAAAUIYFJJX/xehHy6ulWpRhJF/LaBvsndirT5umyFyaA0KLoEqnLh
 kijk0TJgDMTBdpSmkukuD7o1He7xumkjzb/4cg==
X-Google-Smtp-Source: APXvYqwW95LjpMO9piBiCEl4iZLPGgAKcSDCHDXwI9uuYqLMnZH3/UMptPpMLWSQk2fEzw/SOVaaxgRnFzC+JtGR5cg=
X-Received: by 2002:a05:6638:303:: with SMTP id
 w3mr8829447jap.103.1566384202422; 
 Wed, 21 Aug 2019 03:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190729170354.202374-1-avifishman70@gmail.com>
 <744188a1-d11a-7edc-79cd-e3c7dbcf6e86@linaro.org>
In-Reply-To: <744188a1-d11a-7edc-79cd-e3c7dbcf6e86@linaro.org>
From: Avi Fishman <avifishman70@gmail.com>
Date: Wed, 21 Aug 2019 13:42:27 +0300
Message-ID: <CAKKbWA72VX4LnLM0on2=bj787J53GUwkh6PTU2+0fvP+gPu+Xg@mail.gmail.com>
Subject: Re: [PATCH] [v5] clocksource/drivers/npcm: fix GENMASK and timer
 operation
To: Daniel Lezcano <daniel.lezcano@linaro.org>
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
Cc: Benjamin Fair <benjaminfair@google.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks Daniel,

It seems more clear now :)

Good to know about the need for Fixes tag.

On Wed, Aug 21, 2019 at 1:11 PM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On 29/07/2019 19:03, Avi Fishman wrote:
> > NPCM7XX_Tx_OPER GENMASK bits where wrong,
> > Since NPCM7XX_REG_TICR0 register reset value of those bits was 0,
> > it did not cause an issue.
> > in npcm7xx_timer_oneshot() the original NPCM7XX_REG_TCSR0 register was
> > read again after masking it with ~NPCM7XX_Tx_OPER so the masking didn't
> > take effect.
> >
> > npcm7xx_timer_periodic() was not wrong but it wrote to NPCM7XX_REG_TICR=
0
> > in a middle of read modify write to NPCM7XX_REG_TCSR0 which is
> > confusing.
> > npcm7xx_timer_oneshot() did wrong calculation
> >
> > Signed-off-by: Avi Fishman <avifishman70@gmail.com>
>
> I've applied the patch and massaged the changelog [1].
>
> Let me know if you disagree with it.
>
> Please, in the future take care of adding the Fixes tag.
>
> Thanks
>
>   -- Daniel
>
> [1]
> https://git.linaro.org/people/daniel.lezcano/linux.git/commit/?h=3Dclocke=
vents/next&id=3Da5f6679fc81e42fcbef0184770d8a3b04c0f153e
>
> > ---
> >  drivers/clocksource/timer-npcm7xx.c | 9 +++------
> >  1 file changed, 3 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/clocksource/timer-npcm7xx.c b/drivers/clocksource/=
timer-npcm7xx.c
> > index 8a30da7f083b..9780ffd8010e 100644
> > --- a/drivers/clocksource/timer-npcm7xx.c
> > +++ b/drivers/clocksource/timer-npcm7xx.c
> > @@ -32,7 +32,7 @@
> >  #define NPCM7XX_Tx_INTEN             BIT(29)
> >  #define NPCM7XX_Tx_COUNTEN           BIT(30)
> >  #define NPCM7XX_Tx_ONESHOT           0x0
> > -#define NPCM7XX_Tx_OPER                      GENMASK(27, 3)
> > +#define NPCM7XX_Tx_OPER                      GENMASK(28, 27)
> >  #define NPCM7XX_Tx_MIN_PRESCALE              0x1
> >  #define NPCM7XX_Tx_TDR_MASK_BITS     24
> >  #define NPCM7XX_Tx_MAX_CNT           0xFFFFFF
> > @@ -84,8 +84,6 @@ static int npcm7xx_timer_oneshot(struct clock_event_d=
evice *evt)
> >
> >       val =3D readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
> >       val &=3D ~NPCM7XX_Tx_OPER;
> > -
> > -     val =3D readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
> >       val |=3D NPCM7XX_START_ONESHOT_Tx;
> >       writel(val, timer_of_base(to) + NPCM7XX_REG_TCSR0);
> >
> > @@ -97,12 +95,11 @@ static int npcm7xx_timer_periodic(struct clock_even=
t_device *evt)
> >       struct timer_of *to =3D to_timer_of(evt);
> >       u32 val;
> >
> > +     writel(timer_of_period(to), timer_of_base(to) + NPCM7XX_REG_TICR0=
);
> > +
> >       val =3D readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
> >       val &=3D ~NPCM7XX_Tx_OPER;
> > -
> > -     writel(timer_of_period(to), timer_of_base(to) + NPCM7XX_REG_TICR0=
);
> >       val |=3D NPCM7XX_START_PERIODIC_Tx;
> > -
> >       writel(val, timer_of_base(to) + NPCM7XX_REG_TCSR0);
> >
> >       return 0;
> >
>
>
> --
>  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for A=
RM SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
>


--=20
Regards,
Avi
