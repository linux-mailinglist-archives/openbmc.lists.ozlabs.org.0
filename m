Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A517354D879
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 04:38:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNmYs3qZ4z3f2N
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 12:38:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HhAeJlE9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jic23@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HhAeJlE9;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LL1RT1spBz3bkS
	for <openbmc@lists.ozlabs.org>; Sun, 12 Jun 2022 01:08:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3953861001;
	Sat, 11 Jun 2022 15:08:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43331C34116;
	Sat, 11 Jun 2022 15:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654960082;
	bh=EKJoSxvZYNzgGAFmHi7iG2ynvSq/HPXxuHetTKr9pBk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HhAeJlE9d10Rja9kdwI4GCHTGlTiTq7oU7PaoamRWAGpdIt+QuvcIlGnBezmOYYP2
	 pEHqdmxBs/DvwlzV6jGI6snaGa/BWHb+sgeKfMGta2ne1iyLKEgLAsrQ2ooxkvEx4b
	 fjX6mazu1WcOiDuKllQ012dJktz+He5+Av7oQqRBqlnCmhE9WyCETz0AH2tkBtKvmw
	 RZtcI6/3EvhhE6ooGI2zs6kzEWBlh0Omkf1NkdNGomu3nOxcQQGD/RRGfbi/nACeLh
	 a99U2nK3JUkuZiF1tNbUsMpOhmC0ROFpxQ+e/LRCdItjmnT5ZHi+Qhwaw53ogkD3ki
	 OIZ1e2fgNr16A==
Date: Sat, 11 Jun 2022 16:17:01 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Subject: Re: [PATCH 22/34] iio: inkern: only return error codes in
 iio_channel_get_*() APIs
Message-ID: <20220611161701.46a68837@jic23-huawei>
In-Reply-To: <20220610084545.547700-23-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	<20220610084545.547700-23-nuno.sa@analog.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 16 Jun 2022 12:05:37 +1000
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>, Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>, linux-imx@nxp.com, Olivier Moysan <olivier.moysan@foss.st.com>, Zhang Rui <rui.zhang@intel.com>, Christophe Branchereau <cbranchereau@gmail.com>, 
 Saravanan Sekar <sravanhome@gmail.com>, Michael Hennerich <Michael.Hennerich@analog.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-mediatek@lists.infradead.org, Eugen Hristev <eugen.hristev@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, Gwendal Grignou <gwendal@chromium.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Benson Leung <bleung@chromium.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Lorenzo
 Bianconi <lorenzo@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, linux-mips@vger.kernel.org, Thara Gopinath <thara.gopinath@linaro.org>, linux-renesas-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 10 Jun 2022 10:45:33 +0200
Nuno S=C3=A1 <nuno.sa@analog.com> wrote:

> APIs like of_iio_channel_get_by_name() and of_iio_channel_get_all() were
> returning a mix of NULL and error pointers being NULL the way to

pointers with NULL being the way to...

> "notify" that we should do a "system" lookup for channels. This make
> it very confusing and prone to errors as commit dbbccf7c20bf
> ("iio: inkern: fix return value in devm_of_iio_channel_get_by_name()")
> proves. On top of this, patterns like 'if (channel !=3D NULL) return chan=
nel'
> were being used where channel could actually be an error code which
> makes the code hard to read.
>=20
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> ---
>  drivers/iio/inkern.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
> index 87fd2a0d44f2..31d9c122199a 100644
> --- a/drivers/iio/inkern.c
> +++ b/drivers/iio/inkern.c
> @@ -214,7 +214,7 @@ static struct iio_channel *of_iio_channel_get(struct =
device_node *np, int index)
>  struct iio_channel *of_iio_channel_get_by_name(struct device_node *np,
>  					       const char *name)
>  {
> -	struct iio_channel *chan =3D NULL;
> +	struct iio_channel *chan;
> =20
>  	/* Walk up the tree of devices looking for a matching iio channel */
>  	while (np) {
> @@ -231,11 +231,11 @@ struct iio_channel *of_iio_channel_get_by_name(stru=
ct device_node *np,
>  							 name);
>  		chan =3D of_iio_channel_get(np, index);
>  		if (!IS_ERR(chan) || PTR_ERR(chan) =3D=3D -EPROBE_DEFER)
> -			break;

This original behaviour is 'interesting'. If we get a error like -ENOMEM
we should return it rather than carry on.  Do we have enough knowledge
of possible errors here to be more explicit on when we keep looking up
the tree?  I think we can get -ENOENT from of_parse_phandle_with_args()

That raises an interesting question on whether -ENODEV is the right response
for the previously NULL case or is -ENOENT more consistent with other
of_ functions?  No device could be thought of as being the case that needs
to defer (in hope it turns up later) whereas no entry means it will never
succeed.

> -		else if (name && index >=3D 0) {
> +			return chan;
> +		if (name && index >=3D 0) {
>  			pr_err("ERROR: could not get IIO channel %pOF:%s(%i)\n",
>  				np, name ? name : "", index);
> -			return NULL;
> +			return chan;
>  		}
> =20
>  		/*
> @@ -245,10 +245,10 @@ struct iio_channel *of_iio_channel_get_by_name(stru=
ct device_node *np,
>  		 */
>  		np =3D np->parent;
>  		if (np && !of_get_property(np, "io-channel-ranges", NULL))
> -			return NULL;
> +			return chan;
>  	}
> =20
> -	return chan;
> +	return ERR_PTR(-ENODEV);
>  }
>  EXPORT_SYMBOL_GPL(of_iio_channel_get_by_name);
> =20
> @@ -267,8 +267,8 @@ static struct iio_channel *of_iio_channel_get_all(str=
uct device *dev)
>  			break;
>  	} while (++nummaps);
> =20
> -	if (nummaps =3D=3D 0)	/* no error, return NULL to search map table */
> -		return NULL;
> +	if (nummaps =3D=3D 0)	/* return -ENODEV to search map table */
> +		return ERR_PTR(-ENODEV);
> =20
>  	/* NULL terminated array to save passing size */
>  	chans =3D kcalloc(nummaps + 1, sizeof(*chans), GFP_KERNEL);
> @@ -295,7 +295,7 @@ static struct iio_channel *of_iio_channel_get_all(str=
uct device *dev)
> =20
>  static inline struct iio_channel *of_iio_channel_get_all(struct device *=
dev)
>  {
> -	return NULL;
> +	return ERR_PTR(-ENODEV);
>  }
> =20
>  #endif /* CONFIG_OF */
> @@ -362,7 +362,7 @@ struct iio_channel *iio_channel_get(struct device *de=
v,
>  	if (dev) {
>  		channel =3D of_iio_channel_get_by_name(dev->of_node,
>  						     channel_name);
> -		if (channel !=3D NULL)
> +		if (!IS_ERR(channel) || PTR_ERR(channel) =3D=3D -EPROBE_DEFER)
>  			return channel;
>  	}
> =20
> @@ -412,8 +412,6 @@ struct iio_channel *devm_of_iio_channel_get_by_name(s=
truct device *dev,
>  	channel =3D of_iio_channel_get_by_name(np, channel_name);
>  	if (IS_ERR(channel))
>  		return channel;
> -	if (!channel)
> -		return ERR_PTR(-ENODEV);
> =20
>  	ret =3D devm_add_action_or_reset(dev, devm_iio_channel_free, channel);
>  	if (ret)
> @@ -436,7 +434,7 @@ struct iio_channel *iio_channel_get_all(struct device=
 *dev)
>  		return ERR_PTR(-EINVAL);
> =20
>  	chans =3D of_iio_channel_get_all(dev);
> -	if (chans)
> +	if (!IS_ERR(chans) || PTR_ERR(chans) =3D=3D -EPROBE_DEFER)

Hmm. We only want to carry on if the error is -ENODEV.  Anything else
should be reported up the stack.

That might be the only error left, but I think we should be explicit.

>  		return chans;
> =20
>  	name =3D dev_name(dev);

