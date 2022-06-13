Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5271B54D889
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 04:42:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNmgH1YNvz3035
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 12:42:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lgYBehJw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f32; helo=mail-qv1-xf32.google.com; envelope-from=noname.nuno@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lgYBehJw;
	dkim-atps=neutral
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LM31L5lZ6z2xX6
	for <openbmc@lists.ozlabs.org>; Mon, 13 Jun 2022 17:22:30 +1000 (AEST)
Received: by mail-qv1-xf32.google.com with SMTP id q104so3791138qvq.8
        for <openbmc@lists.ozlabs.org>; Mon, 13 Jun 2022 00:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=t8GkcF/AscIjmYX1Ft+2LOWOMCGcc3ou443uyI/gHgM=;
        b=lgYBehJwnc7p76Sp7QYODbs+eJsn9x/aAZca0AhE5KDXVc2emmsRxjtpfkhG0ym3jF
         +YmyjmCo8KwGowRdjt9uIvuUoTlmDmEhKvtAV4CSG4hTEjA91HAM5qlNsrTQS1SRX91R
         LFvp/Mktzkcb1CVjqHCgBxNr9WvYpOAxf+96MGlGzCOnNiSwu1/E0KM1WiGropKJpSPJ
         I1FGxJQBE5G5ow1BWz+8k8tlsSYxFVWF+sox/Wak2AzR/lG0tAdRt9KAZDThpdGND1Zh
         2o8Dtj8SUUB+OwaZDXw05iMGYlfFzStAu7j7cL8cCzdwPXdi8qQXd8eBti7wRpJI/O1K
         B+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=t8GkcF/AscIjmYX1Ft+2LOWOMCGcc3ou443uyI/gHgM=;
        b=2qGZqXvniP3YVRwcM4232rQuAyPC5Dtthq3YruJx1ztdDyYhxNoDQmC8W6DEqGXiBS
         /77SRPgarCNuzbOuCydmSPtjBNiW8RelNmsQUi38lGK/g3SDR8BLm7LJgQCQxW9V3ppp
         wtdfEezjKyLnJq4dq/F29Geut02aoh6EEk2qiCP3qJIunyadM43qv+QBgiFwpmC60vB1
         YS/EcbZd8hIko4Hf1EKw0yz8bkxCFCNy1PvBpMaPxWX0N1Y0AmSYXJjpdSuI11eGQFBl
         tGEdZ4YRVcVtHKfoEI2IQJd/APy3fXZyxjJI4GoPBHJIy7e0COStRaMGfyxqS9KFhO/t
         DALA==
X-Gm-Message-State: AOAM533W40cauEO5D2rXK4+rh4le3f6GPz0MIcRtZoOxsJugGNDnwpj8
	R+2yBebPrlmBbDeYgs9JWw4=
X-Google-Smtp-Source: ABdhPJzJwQGuL0izMZeZrCmNmnxm8u/ohN3iHcmN+Ftx1/l43JyjW+szv6Fscr1wrYk++4pmje2xJg==
X-Received: by 2002:ad4:5b81:0:b0:465:ded8:780 with SMTP id 1-20020ad45b81000000b00465ded80780mr45550533qvp.119.1655104947222;
        Mon, 13 Jun 2022 00:22:27 -0700 (PDT)
Received: from p200300f6ef062c0090c03b551078f99d.dip0.t-ipconnect.de (p200300f6ef062c0090c03b551078f99d.dip0.t-ipconnect.de. [2003:f6:ef06:2c00:90c0:3b55:1078:f99d])
        by smtp.gmail.com with ESMTPSA id y6-20020a05622a004600b002f9399ccefasm4637163qtw.34.2022.06.13.00.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 00:22:26 -0700 (PDT)
Message-ID: <d1d465f2e828642f30bc8a2bdd49e89fdfed7caf.camel@gmail.com>
Subject: Re: [PATCH 34/34] iio: inkern: fix coding style warnings
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jun 2022 09:23:16 +0200
In-Reply-To: <CAMuHMdXtLQOo2fiTHA-CBgWZE0hbPVUzv77sKrf_Qz8oHp7bkA@mail.gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	 <20220610084545.547700-35-nuno.sa@analog.com> <YqNo6U8r80aNFzUr@spruce>
	 <d083dd2c7e9e6eefb32124648a06799a9ebe8dfd.camel@gmail.com>
	 <CAMuHMdXtLQOo2fiTHA-CBgWZE0hbPVUzv77sKrf_Qz8oHp7bkA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 
MIME-Version: 1.0
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Paul Cercueil <paul@crapouillou.net>, Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>, Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Olivier Moysan <olivier.moysan@foss.st.com>, Zhang Rui <rui.zhang@intel.com>, Christophe Brancher
 eau <cbranchereau@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Tali Perry <tali.perry1@gmail.com>, Saravanan Sekar <sravanhome@gmail.com>, Michael Hennerich <Michael.Hennerich@analog.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-mediatek@lists.infradead.org, Eugen Hristev <eugen.hristev@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, Gwendal Grignou <gwendal@chromium.org>, Joe Simmons-Talbott <joetalbott@gmail.com>, Benson Leung <bleung@chromium.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Thara Gopinath <thara.gopinath@linaro.
 org>, Linux-Renesas <linux-renesas-soc@vger.kernel.or

g>, Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, Jonathan Cameron <jic23@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, 2022-06-12 at 19:39 +0200, Geert Uytterhoeven wrote:
> Hi Nuno,
>=20
> On Fri, Jun 10, 2022 at 9:52 PM Nuno S=C3=A1 <noname.nuno@gmail.com>
> wrote:
> > On Fri, 2022-06-10 at 11:53 -0400, Joe Simmons-Talbott wrote:
> > > On Fri, Jun 10, 2022 at 10:45:45AM +0200, Nuno S=C3=A1 wrote:
> > > > Just cosmetics. No functional change intended...
> > > >=20
> > > > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
>=20
> > > > --- a/drivers/iio/inkern.c
> > > > +++ b/drivers/iio/inkern.c
> > > > @@ -45,13 +45,13 @@ int iio_map_array_register(struct iio_dev
> > > > *indio_dev, struct iio_map *maps)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int i =3D 0, ret =3D 0;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct iio_map_internal =
*mapi;
> > > >=20
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (maps =3D=3D NULL)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!maps)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_lock(&iio_map_list=
_lock);
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while (maps[i].consumer_dev_n=
ame !=3D NULL) {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while (!maps[i].consumer_dev_=
name) {
> > >=20
> > > Shouldn't this be?:
> > > while (maps[i].consumer_dev_name) {
> >=20
> > Ups... Nice catch! I was probably in bot mode already.
>=20
> When making a change with no functional change intended, it is always
> a good idea to compare the generated assembler before/after.=C2=A0 I.e.
>=20
> =C2=A0=C2=A0=C2=A0 make drivers/iio/inkern.s
> =C2=A0=C2=A0=C2=A0 mv drivers/iio/inkern.s drivers/iio/inkern.s.orig
> =C2=A0=C2=A0=C2=A0 [make your change]
> =C2=A0=C2=A0=C2=A0 make drivers/iio/inkern.s
> =C2=A0=C2=A0=C2=A0 diff -u drivers/iio/inkern.s{.orig,}
>=20

Ah thx... That's indeed a good idea!

- Nuno S=C3=A1




