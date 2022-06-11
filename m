Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE5354D87E
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 04:40:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNmbz53bnz3fGn
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 12:39:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=l4UEIuqv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jic23@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=l4UEIuqv;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LL26w5l9Fz3bsK
	for <openbmc@lists.ozlabs.org>; Sun, 12 Jun 2022 01:38:48 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CE40060FF8;
	Sat, 11 Jun 2022 15:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 779EFC34116;
	Sat, 11 Jun 2022 15:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654961926;
	bh=MehqC0j0OTM5nbdYZxys+BnIW/puS7FSg3UX9pJ760Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=l4UEIuqvNAEFuGJ2T/MPhdiSwFo6CLPtxOq92iXlMSxqX5qJ7+Jxj6W1vlRXFBfuN
	 o/1y0ratP0tXrESSwujeYtFvJa2lFjorHg5Pt9Ify1dSpdIUbJKa9Dzo7/4PGo8c/+
	 lIQO1Y5/d4WiHtCG3BRPQ3GMeIliu4h33XYpyxpqutDYe44u4t67/nJJtlbBclVBtR
	 7xmovpuZeGv3gy47PkxlkIuz3cEZn8PjDUUPWELnYtyOHJmYpg1kC4+AaC2G2qOM+n
	 zP0ZLSJFqD2SgXnCR+3gzmUTROqMzFrxUi8CiUA7FcEbgKrNyuS0/tmH1nVJKbjl8U
	 yVdDI9vJpQqqw==
Date: Sat, 11 Jun 2022 16:47:45 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Subject: Re: [PATCH 32/34] iio: adc: stm32-adc: convert to device properties
Message-ID: <20220611164745.3e99b730@jic23-huawei>
In-Reply-To: <20220610084545.547700-33-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	<20220610084545.547700-33-nuno.sa@analog.com>
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
 Saravanan Sekar <sravanhome@gmail.com>, Michael Hennerich <Michael.Hennerich@analog.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-mediatek@lists.infradead.org, Eugen Hristev <eugen.hristev@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, Gwendal Grignou <gwendal@chromium.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Benson Leung <bleung@chromium.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, linux-mips@vger.kernel.org, Thara Gopinath <thara.gopinath@linaro.org>, linux-renesas-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@
 kernel.org>, Claudiu Beznea <claudiu.beznea@microchip

.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 10 Jun 2022 10:45:43 +0200
Nuno S=C3=A1 <nuno.sa@analog.com> wrote:

> Make the conversion to firmware agnostic device properties. As part of
> the conversion the IIO inkern interface 'of_xlate()' is also converted to
> 'fwnode_xlate()'. The goal is to completely drop 'of_xlate' and hence OF
> dependencies from IIO.
>=20
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

One trivial comment inline.=20

In general this particular refactor is complex, so I either want
eyes of those familiar with the driver and / or testing or we may want
to reduce the scope to just the fwnode_xlate() and leave the more
complex conversions for when we can get that testing done.

Let's see if we get the necessary review on this more complex patch.
I just don't want us to get stalled by trying to do too much at once!

Jonathan


> ---
>  drivers/iio/adc/stm32-adc.c | 128 ++++++++++++++++++++----------------
>  1 file changed, 70 insertions(+), 58 deletions(-)
>=20
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index a68ecbda6480..87acef31ace1 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -21,11 +21,11 @@
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/nvmem-consumer.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> -#include <linux/of.h>
> -#include <linux/of_device.h>
> +#include <linux/property.h>
> =20
>  #include "stm32-adc-core.h"
> =20
> @@ -1524,8 +1524,8 @@ static int stm32_adc_update_scan_mode(struct iio_de=
v *indio_dev,
>  	return ret;
>  }
> =20
> -static int stm32_adc_of_xlate(struct iio_dev *indio_dev,
> -			      const struct of_phandle_args *iiospec)
> +static int stm32_adc_fwnode_xlate(struct iio_dev *indio_dev,
> +				  const struct fwnode_reference_args *iiospec)
>  {
>  	int i;
> =20
> @@ -1579,7 +1579,7 @@ static const struct iio_info stm32_adc_iio_info =3D=
 {
>  	.hwfifo_set_watermark =3D stm32_adc_set_watermark,
>  	.update_scan_mode =3D stm32_adc_update_scan_mode,
>  	.debugfs_reg_access =3D stm32_adc_debugfs_reg_access,
> -	.of_xlate =3D stm32_adc_of_xlate,
> +	.fwnode_xlate =3D stm32_adc_fwnode_xlate,
>  };
> =20
>  static unsigned int stm32_adc_dma_residue(struct stm32_adc *adc)
> @@ -1776,14 +1776,14 @@ static const struct iio_chan_spec_ext_info stm32_=
adc_ext_info[] =3D {
>  	{},
>  };
> =20
> -static int stm32_adc_of_get_resolution(struct iio_dev *indio_dev)
> +static int stm32_adc_fw_get_resolution(struct iio_dev *indio_dev)
>  {
> -	struct device_node *node =3D indio_dev->dev.of_node;
> +	struct device *dev =3D &indio_dev->dev;
>  	struct stm32_adc *adc =3D iio_priv(indio_dev);
>  	unsigned int i;
>  	u32 res;
> =20
> -	if (of_property_read_u32(node, "assigned-resolution-bits", &res))
> +	if (device_property_read_u32(dev, "assigned-resolution-bits", &res))
>  		res =3D adc->cfg->adc_info->resolutions[0];
> =20
>  	for (i =3D 0; i < adc->cfg->adc_info->num_res; i++)
> @@ -1867,11 +1867,11 @@ static void stm32_adc_chan_init_one(struct iio_de=
v *indio_dev,
> =20
>  static int stm32_adc_get_legacy_chan_count(struct iio_dev *indio_dev, st=
ruct stm32_adc *adc)
>  {
> -	struct device_node *node =3D indio_dev->dev.of_node;
> +	struct device *dev =3D &indio_dev->dev;
>  	const struct stm32_adc_info *adc_info =3D adc->cfg->adc_info;
>  	int num_channels =3D 0, ret;
> =20
> -	ret =3D of_property_count_u32_elems(node, "st,adc-channels");
> +	ret =3D device_property_count_u32(dev, "st,adc-channels");
>  	if (ret > adc_info->max_channels) {
>  		dev_err(&indio_dev->dev, "Bad st,adc-channels?\n");
>  		return -EINVAL;
> @@ -1879,18 +1879,17 @@ static int stm32_adc_get_legacy_chan_count(struct=
 iio_dev *indio_dev, struct stm
>  		num_channels +=3D ret;
>  	}
> =20
> -	ret =3D of_property_count_elems_of_size(node, "st,adc-diff-channels",
> -					      sizeof(struct stm32_adc_diff_channel));
> -	if (ret > adc_info->max_channels) {
> +	ret =3D device_property_count_u32(dev, "st,adc-diff-channels");
> +	if ((ret / 2) > adc_info->max_channels) {
hmm. The magic '2' that is introduced here kind of looses some of the meani=
ng
that existed for the *_count_elems_of_size()

Perhaps introduce a define or a comment on why it is 2?

>  		dev_err(&indio_dev->dev, "Bad st,adc-diff-channels?\n");
>  		return -EINVAL;
> -	} else if (ret > 0) {
> -		adc->num_diff =3D ret;
> -		num_channels +=3D ret;
> +	} else if ((ret / 2) > 0) {
> +		adc->num_diff =3D ret / 2;
> +		num_channels +=3D ret / 2;
>  	}
> =20
>  	/* Optional sample time is provided either for each, or all channels */
> -	ret =3D of_property_count_u32_elems(node, "st,min-sample-time-nsecs");
> +	ret =3D device_property_count_u32(dev, "st,min-sample-time-nsecs");
>  	if (ret > 1 && ret !=3D num_channels) {
>  		dev_err(&indio_dev->dev, "Invalid st,min-sample-time-nsecs\n");
>  		return -EINVAL;
> @@ -1901,21 +1900,20 @@ static int stm32_adc_get_legacy_chan_count(struct=
 iio_dev *indio_dev, struct stm
> =20
>  static int stm32_adc_legacy_chan_init(struct iio_dev *indio_dev,
>  				      struct stm32_adc *adc,
> -				      struct iio_chan_spec *channels)
> +				      struct iio_chan_spec *channels,
> +				      int nchans)
>  {
> -	struct device_node *node =3D indio_dev->dev.of_node;
>  	const struct stm32_adc_info *adc_info =3D adc->cfg->adc_info;
>  	struct stm32_adc_diff_channel diff[STM32_ADC_CH_MAX];
> +	struct device *dev =3D &indio_dev->dev;
>  	u32 num_diff =3D adc->num_diff;
>  	int size =3D num_diff * sizeof(*diff) / sizeof(u32);
> -	int scan_index =3D 0, val, ret, i;
> -	struct property *prop;
> -	const __be32 *cur;
> -	u32 smp =3D 0;
> +	int scan_index =3D 0, ret, i;
> +	u32 smp =3D 0, nsmps, smps[STM32_ADC_CH_MAX], chans[STM32_ADC_CH_MAX];
> =20
>  	if (num_diff) {
> -		ret =3D of_property_read_u32_array(node, "st,adc-diff-channels",
> -						 (u32 *)diff, size);
> +		ret =3D device_property_read_u32_array(dev, "st,adc-diff-channels",
> +						     (u32 *)diff, size);
>  		if (ret) {
>  			dev_err(&indio_dev->dev, "Failed to get diff channels %d\n", ret);
>  			return ret;
> @@ -1936,32 +1934,51 @@ static int stm32_adc_legacy_chan_init(struct iio_=
dev *indio_dev,
>  		}
>  	}
> =20
> -	of_property_for_each_u32(node, "st,adc-channels", prop, cur, val) {
> -		if (val >=3D adc_info->max_channels) {
> -			dev_err(&indio_dev->dev, "Invalid channel %d\n", val);
> +	ret =3D device_property_read_u32_array(dev, "st,adc-channels", chans,
> +					     nchans);
> +	if (ret)
> +		return ret;
> +
> +	for (i =3D 0; i < nchans; i++) {
> +		if (chans[i] >=3D adc_info->max_channels) {
> +			dev_err(&indio_dev->dev, "Invalid channel %d\n",
> +				chans[i]);
>  			return -EINVAL;
>  		}
> =20
>  		/* Channel can't be configured both as single-ended & diff */
>  		for (i =3D 0; i < num_diff; i++) {
> -			if (val =3D=3D diff[i].vinp) {
> -				dev_err(&indio_dev->dev, "channel %d misconfigured\n",	val);
> +			if (chans[i] =3D=3D diff[i].vinp) {
> +				dev_err(&indio_dev->dev, "channel %d misconfigured\n",	chans[i]);
>  				return -EINVAL;
>  			}
>  		}
> -		stm32_adc_chan_init_one(indio_dev, &channels[scan_index], val,
> -					0, scan_index, false);
> +		stm32_adc_chan_init_one(indio_dev, &channels[scan_index],
> +					chans[i], 0, scan_index, false);
>  		scan_index++;
>  	}
> =20
> +	nsmps =3D device_property_count_u32(dev, "st,min-sample-time-nsecs");
> +	if (nsmps) {
> +		if (nsmps >=3D nchans)
> +			nsmps =3D nchans;
> +
> +		ret =3D device_property_read_u32_array(dev, "st,min-sample-time-nsecs",
> +						     smps, nsmps);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	for (i =3D 0; i < scan_index; i++) {
>  		/*
> -		 * Using of_property_read_u32_index(), smp value will only be
> -		 * modified if valid u32 value can be decoded. This allows to
> -		 * get either no value, 1 shared value for all indexes, or one
> -		 * value per channel.
> +		 * This check is used with the above logic so that smp value
> +		 * will only be modified if valid u32 value can be decoded. This
> +		 * allows to get either no value, 1 shared value for all indexes,
> +		 * or one value per channel. The point is to have the same
> +		 * behavior as 'of_property_read_u32_index()'.
>  		 */
> -		of_property_read_u32_index(node, "st,min-sample-time-nsecs", i, &smp);
> +		if (i < nsmps)
> +			smp =3D smps[i];
> =20
>  		/* Prepare sampling time settings */
>  		stm32_adc_smpr_init(adc, channels[i].channel, smp);
> @@ -2004,22 +2021,21 @@ static int stm32_adc_generic_chan_init(struct iio=
_dev *indio_dev,
>  				       struct stm32_adc *adc,
>  				       struct iio_chan_spec *channels)
>  {
> -	struct device_node *node =3D indio_dev->dev.of_node;
>  	const struct stm32_adc_info *adc_info =3D adc->cfg->adc_info;
> -	struct device_node *child;
> +	struct fwnode_handle *child;
>  	const char *name;
>  	int val, scan_index =3D 0, ret;
>  	bool differential;
>  	u32 vin[2];
> =20
> -	for_each_available_child_of_node(node, child) {
> -		ret =3D of_property_read_u32(child, "reg", &val);
> +	device_for_each_child_node(&indio_dev->dev, child) {
> +		ret =3D fwnode_property_read_u32(child, "reg", &val);
>  		if (ret) {
>  			dev_err(&indio_dev->dev, "Missing channel index %d\n", ret);
>  			goto err;
>  		}
> =20
> -		ret =3D of_property_read_string(child, "label", &name);
> +		ret =3D fwnode_property_read_string(child, "label", &name);
>  		/* label is optional */
>  		if (!ret) {
>  			if (strlen(name) >=3D STM32_ADC_CH_SZ) {
> @@ -2044,7 +2060,7 @@ static int stm32_adc_generic_chan_init(struct iio_d=
ev *indio_dev,
>  		}
> =20
>  		differential =3D false;
> -		ret =3D of_property_read_u32_array(child, "diff-channels", vin, 2);
> +		ret =3D fwnode_property_read_u32_array(child, "diff-channels", vin, 2);
>  		/* diff-channels is optional */
>  		if (!ret) {
>  			differential =3D true;
> @@ -2061,7 +2077,7 @@ static int stm32_adc_generic_chan_init(struct iio_d=
ev *indio_dev,
>  		stm32_adc_chan_init_one(indio_dev, &channels[scan_index], val,
>  					vin[1], scan_index, differential);
> =20
> -		ret =3D of_property_read_u32(child, "st,min-sample-time-ns", &val);
> +		ret =3D fwnode_property_read_u32(child, "st,min-sample-time-ns", &val);
>  		/* st,min-sample-time-ns is optional */
>  		if (!ret) {
>  			stm32_adc_smpr_init(adc, channels[scan_index].channel, val);
> @@ -2079,14 +2095,13 @@ static int stm32_adc_generic_chan_init(struct iio=
_dev *indio_dev,
>  	return scan_index;
> =20
>  err:
> -	of_node_put(child);
> +	fwnode_handle_put(child);
> =20
>  	return ret;
>  }
> =20
> -static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timest=
amping)
> +static int stm32_adc_chan_fw_init(struct iio_dev *indio_dev, bool timest=
amping)
>  {
> -	struct device_node *node =3D indio_dev->dev.of_node;
>  	struct stm32_adc *adc =3D iio_priv(indio_dev);
>  	const struct stm32_adc_info *adc_info =3D adc->cfg->adc_info;
>  	struct iio_chan_spec *channels;
> @@ -2096,7 +2111,7 @@ static int stm32_adc_chan_of_init(struct iio_dev *i=
ndio_dev, bool timestamping)
>  	for (i =3D 0; i < STM32_ADC_INT_CH_NB; i++)
>  		adc->int_ch[i] =3D STM32_ADC_INT_CH_NONE;
> =20
> -	num_channels =3D of_get_available_child_count(node);
> +	num_channels =3D device_get_child_node_count(&indio_dev->dev);
>  	/* If no channels have been found, fallback to channels legacy properti=
es. */
>  	if (!num_channels) {
>  		legacy =3D true;
> @@ -2127,7 +2142,8 @@ static int stm32_adc_chan_of_init(struct iio_dev *i=
ndio_dev, bool timestamping)
>  		return -ENOMEM;
> =20
>  	if (legacy)
> -		ret =3D stm32_adc_legacy_chan_init(indio_dev, adc, channels);
> +		ret =3D stm32_adc_legacy_chan_init(indio_dev, adc, channels,
> +						 num_channels);
>  	else
>  		ret =3D stm32_adc_generic_chan_init(indio_dev, adc, channels);
>  	if (ret < 0)
> @@ -2209,9 +2225,6 @@ static int stm32_adc_probe(struct platform_device *=
pdev)
>  	bool timestamping =3D false;
>  	int ret;
> =20
> -	if (!pdev->dev.of_node)
> -		return -ENODEV;
> -
>  	indio_dev =3D devm_iio_device_alloc(&pdev->dev, sizeof(*adc));
>  	if (!indio_dev)
>  		return -ENOMEM;
> @@ -2220,17 +2233,16 @@ static int stm32_adc_probe(struct platform_device=
 *pdev)
>  	adc->common =3D dev_get_drvdata(pdev->dev.parent);
>  	spin_lock_init(&adc->lock);
>  	init_completion(&adc->completion);
> -	adc->cfg =3D (const struct stm32_adc_cfg *)
> -		of_match_device(dev->driver->of_match_table, dev)->data;
> +	adc->cfg =3D device_get_match_data(dev);
> =20
>  	indio_dev->name =3D dev_name(&pdev->dev);
> -	indio_dev->dev.of_node =3D pdev->dev.of_node;
> +	device_set_node(&indio_dev->dev, dev_fwnode(&pdev->dev));
>  	indio_dev->info =3D &stm32_adc_iio_info;
>  	indio_dev->modes =3D INDIO_DIRECT_MODE | INDIO_HARDWARE_TRIGGERED;
> =20
>  	platform_set_drvdata(pdev, indio_dev);
> =20
> -	ret =3D of_property_read_u32(pdev->dev.of_node, "reg", &adc->offset);
> +	ret =3D device_property_read_u32(dev, "reg", &adc->offset);
>  	if (ret !=3D 0) {
>  		dev_err(&pdev->dev, "missing reg property\n");
>  		return -EINVAL;
> @@ -2259,7 +2271,7 @@ static int stm32_adc_probe(struct platform_device *=
pdev)
>  		}
>  	}
> =20
> -	ret =3D stm32_adc_of_get_resolution(indio_dev);
> +	ret =3D stm32_adc_fw_get_resolution(indio_dev);
>  	if (ret < 0)
>  		return ret;
> =20
> @@ -2276,7 +2288,7 @@ static int stm32_adc_probe(struct platform_device *=
pdev)
>  		timestamping =3D true;
>  	}
> =20
> -	ret =3D stm32_adc_chan_of_init(indio_dev, timestamping);
> +	ret =3D stm32_adc_chan_fw_init(indio_dev, timestamping);
>  	if (ret < 0)
>  		goto err_dma_disable;
> =20

