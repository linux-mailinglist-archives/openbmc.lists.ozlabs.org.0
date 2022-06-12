Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 599E854D886
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 04:41:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNmdD1ZxCz3fS5
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 12:41:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.51; helo=mail-qv1-f51.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LLhmC3fcNz30Lk
	for <openbmc@lists.ozlabs.org>; Mon, 13 Jun 2022 03:39:54 +1000 (AEST)
Received: by mail-qv1-f51.google.com with SMTP id h18so2981774qvj.11
        for <openbmc@lists.ozlabs.org>; Sun, 12 Jun 2022 10:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xNhFuNm1nmnzKrxqQuO4XyzP0cAuS/p9Ps9ar4/pkNA=;
        b=uHsHOGOYp96LXIYE2OznxoIHX1Gt7vPajX7U/A0j36kRDoclb1ciYj1xEWZy44DYoE
         6jo9OTEKLigFjy8un6V/LxLShRF8q9XvUd0GJRwo2Or5RieLlEoShE8tGSGYMRqZ7knW
         h+F6iVQC8NkJlG+IYSVLiTdarGtsSh92OZJ9RwV1rXNe5GNjliagKoBVDAeh/+LkDx3y
         cOU1M6uU+ZQ1OI0b4YZMUlNbLP456PkkfqHU+vTcksa0hvCUze+9yTNZ9LPGHFIGRitV
         drmlBEuRLbhfF+e4916FWesTXqmNeWDov/WTX2FnotJ7UCZDJlHyePYS/Dk8xEntSmed
         kA8g==
X-Gm-Message-State: AOAM530OdG6YcUMksR0YzfmJcGC8C+ER/tQ98CchBHd6d/Yo7uS1y/KH
	hsXWWqyghg4DAF79k7eaH00QVElsAxU=
X-Google-Smtp-Source: ABdhPJywOTDHULpugM+1n0qw+YHQL/Vg0fdXGQyPRyK8O8UiEbp8ppEq391Kj8B4tihCqe6V0kRKMA==
X-Received: by 2002:a05:6214:1ccf:b0:461:b48b:29e4 with SMTP id g15-20020a0562141ccf00b00461b48b29e4mr96675358qvd.5.1655055590648;
        Sun, 12 Jun 2022 10:39:50 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id e13-20020ac8490d000000b0030507988207sm3380903qtq.3.2022.06.12.10.39.48
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jun 2022 10:39:49 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-3137316bb69so31421487b3.10
        for <openbmc@lists.ozlabs.org>; Sun, 12 Jun 2022 10:39:48 -0700 (PDT)
X-Received: by 2002:a81:4811:0:b0:30c:8021:4690 with SMTP id
 v17-20020a814811000000b0030c80214690mr60597100ywa.47.1655055588159; Sun, 12
 Jun 2022 10:39:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com> <20220610084545.547700-35-nuno.sa@analog.com>
 <YqNo6U8r80aNFzUr@spruce> <d083dd2c7e9e6eefb32124648a06799a9ebe8dfd.camel@gmail.com>
In-Reply-To: <d083dd2c7e9e6eefb32124648a06799a9ebe8dfd.camel@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 12 Jun 2022 19:39:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtLQOo2fiTHA-CBgWZE0hbPVUzv77sKrf_Qz8oHp7bkA@mail.gmail.com>
Message-ID: <CAMuHMdXtLQOo2fiTHA-CBgWZE0hbPVUzv77sKrf_Qz8oHp7bkA@mail.gmail.com>
Subject: Re: [PATCH 34/34] iio: inkern: fix coding style warnings
To: =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 16 Jun 2022 12:05:36 +1000
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, Paul Cercueil <paul@crapouillou.net>, Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>, Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Olivier Moysan <olivier.moysan@foss.st.com>, Zhang Rui <rui.zhang@intel.com>, Christophe Brancherea
 u <cbranchereau@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Tali Perry <tali.perry1@gmail.com>, Saravanan Sekar <sravanhome@gmail.com>, Michael Hennerich <Michael.Hennerich@analog.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-mediatek@lists.infradead.org, Eugen Hristev <eugen.hristev@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, Gwendal Grignou <gwendal@chromium.org>, Joe Simmons-Talbott <joetalbott@gmail.com>, Benson Leung <bleung@chromium.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Thara Gopinath <thara.gopinath@linaro.or
 g>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>

, Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, Jonathan Cameron <jic23@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Nuno,

On Fri, Jun 10, 2022 at 9:52 PM Nuno S=C3=A1 <noname.nuno@gmail.com> wrote:
> On Fri, 2022-06-10 at 11:53 -0400, Joe Simmons-Talbott wrote:
> > On Fri, Jun 10, 2022 at 10:45:45AM +0200, Nuno S=C3=A1 wrote:
> > > Just cosmetics. No functional change intended...
> > >
> > > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> > > --- a/drivers/iio/inkern.c
> > > +++ b/drivers/iio/inkern.c
> > > @@ -45,13 +45,13 @@ int iio_map_array_register(struct iio_dev
> > > *indio_dev, struct iio_map *maps)
> > >         int i =3D 0, ret =3D 0;
> > >         struct iio_map_internal *mapi;
> > >
> > > -       if (maps =3D=3D NULL)
> > > +       if (!maps)
> > >                 return 0;
> > >
> > >         mutex_lock(&iio_map_list_lock);
> > > -       while (maps[i].consumer_dev_name !=3D NULL) {
> > > +       while (!maps[i].consumer_dev_name) {
> >
> > Shouldn't this be?:
> > while (maps[i].consumer_dev_name) {
>
> Ups... Nice catch! I was probably in bot mode already.

When making a change with no functional change intended, it is always
a good idea to compare the generated assembler before/after.  I.e.

    make drivers/iio/inkern.s
    mv drivers/iio/inkern.s drivers/iio/inkern.s.orig
    [make your change]
    make drivers/iio/inkern.s
    diff -u drivers/iio/inkern.s{.orig,}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
