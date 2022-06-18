Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A95551225
	for <lists+openbmc@lfdr.de>; Mon, 20 Jun 2022 10:07:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRMh80s5dz3cBm
	for <lists+openbmc@lfdr.de>; Mon, 20 Jun 2022 18:07:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AHFj/HFo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jic23@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AHFj/HFo;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LQHXf2nLnz30Dp
	for <openbmc@lists.ozlabs.org>; Sat, 18 Jun 2022 23:57:22 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0EA6860B1E;
	Sat, 18 Jun 2022 13:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1EE2C3411A;
	Sat, 18 Jun 2022 13:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655560638;
	bh=lRorEWc2KTi7z7ymOlOmHg76zQDyaFrAFstUtz9SnBg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AHFj/HFoFUUH94y50WWJJ41Nc0+xVyu0BnPz6ynMPeCuA7tW1khpFHcZOcygfpS66
	 1PJdLDzuD9XLdoajYWLREwRAil3c82vDUZ1NpmJkmEvfQh8et0/u/ebN3adQ5YS49E
	 8rFcodb3jxfyoQyunzWPPKvsaeSLocaZU+cQic/JV8F9tZOPKEeTIt8kcRe5ZukkUq
	 tC8mkXxl1GHz/gJLiyIVLfWHvitlR6Yvz5/CJvrG8iSMlMnfArAYkQhVYGdY+V8m14
	 j2OCBtwYS9BuyltkfUIfF1QkJE3GHgLcO5pM1rV3UdWaNJotY41oTuDuq5mtMGUnRq
	 zduVJofRh6Ktw==
Date: Sat, 18 Jun 2022 15:06:24 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>
Subject: Re: [PATCH 22/34] iio: inkern: only return error codes in
 iio_channel_get_*() APIs
Message-ID: <20220618150624.1bfc8914@jic23-huawei>
In-Reply-To: <35e7c36c9ecbdc67698b413cf867cf19442ccfa9.camel@gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	<20220610084545.547700-23-nuno.sa@analog.com>
	<20220611161701.46a68837@jic23-huawei>
	<35e7c36c9ecbdc67698b413cf867cf19442ccfa9.camel@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 20 Jun 2022 18:05:43 +1000
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Paul Cercueil <paul@crapouillou.net>, Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>, Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>, linux-imx@nxp.com, Olivier Moysan <olivier.moysan@foss.st.com>, Zhang Rui <rui.zhang@intel.com>, Christophe Branchereau <cbranchereau@gmai
 l.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Saravanan Sekar <sravanhome@gmail.com>, Michael Hennerich <Michael.Hennerich@analog.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-mediatek@lists.infradead.org, Eugen Hristev <eugen.hristev@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, Gwendal Grignou <gwendal@chromium.org>, Tali Perry <tali.perry1@gmail.com>, Benson Leung <bleung@chromium.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, linux-mips@vger.kernel.org, Thara Gopinath <thara.gopinath@linaro.org>, linux-renesas-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Cai Huoqing <
 cai.huoqing@linux.dev>, Shawn Guo <shawnguo@kernel.or

g>, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 13 Jun 2022 09:06:49 +0200
Nuno S=C3=A1 <noname.nuno@gmail.com> wrote:

> On Sat, 2022-06-11 at 16:17 +0100, Jonathan Cameron wrote:
> > On Fri, 10 Jun 2022 10:45:33 +0200
> > Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
> >  =20
> > > APIs like of_iio_channel_get_by_name() and of_iio_channel_get_all()
> > > were
> > > returning a mix of NULL and error pointers being NULL the way to =20
> >=20
> > pointers with NULL being the way to...
> >  =20
> > > "notify" that we should do a "system" lookup for channels. This
> > > make
> > > it very confusing and prone to errors as commit dbbccf7c20bf
> > > ("iio: inkern: fix return value in
> > > devm_of_iio_channel_get_by_name()")
> > > proves. On top of this, patterns like 'if (channel !=3D NULL) return
> > > channel'
> > > were being used where channel could actually be an error code which
> > > makes the code hard to read.
> > >=20
> > > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> > > ---
> > > =C2=A0drivers/iio/inkern.c | 24 +++++++++++-------------
> > > =C2=A01 file changed, 11 insertions(+), 13 deletions(-)
> > >=20
> > > diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
> > > index 87fd2a0d44f2..31d9c122199a 100644
> > > --- a/drivers/iio/inkern.c
> > > +++ b/drivers/iio/inkern.c
> > > @@ -214,7 +214,7 @@ static struct iio_channel
> > > *of_iio_channel_get(struct device_node *np, int index)
> > > =C2=A0struct iio_channel *of_iio_channel_get_by_name(struct device_no=
de
> > > *np,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *name)
> > > =C2=A0{
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct iio_channel *chan =
=3D NULL;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct iio_channel *chan;
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Walk up the tree o=
f devices looking for a matching iio
> > > channel */
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0while (np) {
> > > @@ -231,11 +231,11 @@ struct iio_channel
> > > *of_iio_channel_get_by_name(struct device_node *np,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 name);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0chan =3D of_iio_channel_get(np, index);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!IS_ERR(chan) || PTR_ERR(chan) =3D=3D -
> > > EPROBE_DEFER)
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bre=
ak; =20
> >=20
> > This original behaviour is 'interesting'. If we get a error like -
> > ENOMEM
> > we should return it rather than carry on.=C2=A0 Do we have enough
> > knowledge
> > of possible errors here to be more explicit on when we keep looking
> > up
> > the tree?=C2=A0 I think we can get -ENOENT from
> > of_parse_phandle_with_args()
> >=20
> > That raises an interesting question on whether -ENODEV is the right
> > response
> > for the previously NULL case or is -ENOENT more consistent with other
> > of_ functions?=C2=A0 No device could be thought of as being the case th=
at
> > needs
> > to defer (in hope it turns up later) whereas no entry means it will
> > never
> > succeed. =20
>=20
> From what I could see, of_parse_phandle_with_args() either returns=C2=A0
> -EINVAL or -ENOENT. We also have the internal of_iio_channel_get()
> which can return -ENOMEM. So I guess we should only continue looking if
> we get -ENOENT?
>=20
> To be clear, do you still prefer to explicitly return -ENODEV in the
> previous NULL cases or should we honor the return code from=20
> of_parse_phandle_with_args() and just return chans (and thus ENOENT)?
You've looked at this more than me, so whilst I think -ENOENT is probably
slightly more consistent I'll go with whatever you conclude is the
best option.  Maybe add a small amount of description on what you chose
and why to the relevant patch descriptions.

Thanks,

Jonathan


>=20
> - Nuno S=C3=A1

