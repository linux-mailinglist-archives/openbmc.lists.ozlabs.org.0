Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D72550166
	for <lists+openbmc@lfdr.de>; Sat, 18 Jun 2022 02:35:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPxkq0dHSz3cGf
	for <lists+openbmc@lfdr.de>; Sat, 18 Jun 2022 10:34:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector1 header.b=LAttdVjX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=foss.st.com (client-ip=185.132.182.106; helo=mx07-00178001.pphosted.com; envelope-from=prvs=21672002c7=fabrice.gasnier@foss.st.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector1 header.b=LAttdVjX;
	dkim-atps=neutral
X-Greylist: delayed 2671 seconds by postgrey-1.36 at boromir; Sat, 18 Jun 2022 02:52:44 AEST
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPlTS2MbSz3084
	for <openbmc@lists.ozlabs.org>; Sat, 18 Jun 2022 02:52:38 +1000 (AEST)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25HD2D4h027682;
	Fri, 17 Jun 2022 17:59:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=F8ZlprZcEA0IdQfoERzQKZmzhv3x747ABVMdW/D2/Qk=;
 b=LAttdVjX2WVLH9ToVlCA6fFzXv+vSFkAY4VAXA35jr1NHusfPMve1a2fNUAdryKXRzUM
 wXeR6QriEffZLA+A7pR3x6xh/TBESKeAi1CFqvlWDrnzZwIqCAGsWMWCREK6fdQF/Shx
 oA+/wz4pisHSZeXblekpXpbldqaGaZrC85xKtXx+R+nOQ5jBCQeF2AkPCoUkkM5FLT7x
 9TbzTLkolhIn7qDTZ0QVtSNGwEYGYyXSDO1DtAtqWp72Y9ty+IRCl5C6z9gMpq7X6Ugb
 ThkkES9/iPUXIARYl5n0JAjkLA/3MeQMy5Ydn97JTg95+H/iwhtv/qa8CmO6xB8BsUSJ Mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gqd187hvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jun 2022 17:59:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5DCD710002A;
	Fri, 17 Jun 2022 17:58:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2A1DD231500;
	Fri, 17 Jun 2022 17:58:56 +0200 (CEST)
Received: from [10.252.21.28] (10.75.127.49) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 17 Jun
 2022 17:58:52 +0200
Message-ID: <5a292a46-71d0-a078-f92f-158deb58a764@foss.st.com>
Date: Fri, 17 Jun 2022 17:58:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 32/34] iio: adc: stm32-adc: convert to device properties
Content-Language: en-US
To: Jonathan Cameron <jic23@kernel.org>,
        =?UTF-8?Q?Nuno_S=c3=a1?=
	<nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
 <20220610084545.547700-33-nuno.sa@analog.com>
 <20220611164745.3e99b730@jic23-huawei>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20220611164745.3e99b730@jic23-huawei>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-17_10,2022-06-17_01,2022-02-23_01
X-Mailman-Approved-At: Sat, 18 Jun 2022 10:31:55 +1000
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>, "Rafael
 J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>, Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>, linux-imx@nxp.com, Olivier Moysan <olivier.moysan@foss.st.com>, Zhang Rui <rui.zhang@intel.com>, Christophe Branchereau <cbranchereau@gmail.com>, Saravanan Sekar <sravanhome@gmail.com>, Michael Hennerich <Michael.Hennerich@analog.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer
 @pengutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-mediatek@lists.infradead.org, Eugen Hristev <eugen.hristev@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, Gwendal Grignou <gwendal@chromium.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Benson Leung <bleung@chromium.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, linux-mips@vger.kernel.org, Thara Gopinath <thara.gopinath@linaro.org>, linux-renesas-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/11/22 17:47, Jonathan Cameron wrote:
> On Fri, 10 Jun 2022 10:45:43 +0200
> Nuno Sá <nuno.sa@analog.com> wrote:
> 
>> Make the conversion to firmware agnostic device properties. As part of
>> the conversion the IIO inkern interface 'of_xlate()' is also converted to
>> 'fwnode_xlate()'. The goal is to completely drop 'of_xlate' and hence OF
>> dependencies from IIO.
>>
>> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> 
> One trivial comment inline. 
> 
> In general this particular refactor is complex, so I either want
> eyes of those familiar with the driver and / or testing or we may want
> to reduce the scope to just the fwnode_xlate() and leave the more
> complex conversions for when we can get that testing done.
> 
> Let's see if we get the necessary review on this more complex patch.
> I just don't want us to get stalled by trying to do too much at once!
> 
> Jonathan
> 
> 
>> ---
>>  drivers/iio/adc/stm32-adc.c | 128 ++++++++++++++++++++----------------
>>  1 file changed, 70 insertions(+), 58 deletions(-)
>>
>> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
>> index a68ecbda6480..87acef31ace1 100644
>> --- a/drivers/iio/adc/stm32-adc.c
>> +++ b/drivers/iio/adc/stm32-adc.c
>> @@ -21,11 +21,11 @@
>>  #include <linux/io.h>
>>  #include <linux/iopoll.h>
>>  #include <linux/module.h>
>> +#include <linux/mod_devicetable.h>
>>  #include <linux/nvmem-consumer.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/pm_runtime.h>
>> -#include <linux/of.h>
>> -#include <linux/of_device.h>
>> +#include <linux/property.h>
>>  
>>  #include "stm32-adc-core.h"
>>  
>> @@ -1524,8 +1524,8 @@ static int stm32_adc_update_scan_mode(struct iio_dev *indio_dev,
>>  	return ret;
>>  }
>>  
>> -static int stm32_adc_of_xlate(struct iio_dev *indio_dev,
>> -			      const struct of_phandle_args *iiospec)
>> +static int stm32_adc_fwnode_xlate(struct iio_dev *indio_dev,
>> +				  const struct fwnode_reference_args *iiospec)
>>  {
>>  	int i;
>>  
>> @@ -1579,7 +1579,7 @@ static const struct iio_info stm32_adc_iio_info = {
>>  	.hwfifo_set_watermark = stm32_adc_set_watermark,
>>  	.update_scan_mode = stm32_adc_update_scan_mode,
>>  	.debugfs_reg_access = stm32_adc_debugfs_reg_access,
>> -	.of_xlate = stm32_adc_of_xlate,
>> +	.fwnode_xlate = stm32_adc_fwnode_xlate,
>>  };
>>  
>>  static unsigned int stm32_adc_dma_residue(struct stm32_adc *adc)
>> @@ -1776,14 +1776,14 @@ static const struct iio_chan_spec_ext_info stm32_adc_ext_info[] = {
>>  	{},
>>  };
>>  
>> -static int stm32_adc_of_get_resolution(struct iio_dev *indio_dev)
>> +static int stm32_adc_fw_get_resolution(struct iio_dev *indio_dev)
>>  {
>> -	struct device_node *node = indio_dev->dev.of_node;
>> +	struct device *dev = &indio_dev->dev;
>>  	struct stm32_adc *adc = iio_priv(indio_dev);
>>  	unsigned int i;
>>  	u32 res;
>>  
>> -	if (of_property_read_u32(node, "assigned-resolution-bits", &res))
>> +	if (device_property_read_u32(dev, "assigned-resolution-bits", &res))
>>  		res = adc->cfg->adc_info->resolutions[0];
>>  
>>  	for (i = 0; i < adc->cfg->adc_info->num_res; i++)
>> @@ -1867,11 +1867,11 @@ static void stm32_adc_chan_init_one(struct iio_dev *indio_dev,
>>  
>>  static int stm32_adc_get_legacy_chan_count(struct iio_dev *indio_dev, struct stm32_adc *adc)
>>  {
>> -	struct device_node *node = indio_dev->dev.of_node;
>> +	struct device *dev = &indio_dev->dev;
>>  	const struct stm32_adc_info *adc_info = adc->cfg->adc_info;
>>  	int num_channels = 0, ret;
>>  
>> -	ret = of_property_count_u32_elems(node, "st,adc-channels");
>> +	ret = device_property_count_u32(dev, "st,adc-channels");
>>  	if (ret > adc_info->max_channels) {
>>  		dev_err(&indio_dev->dev, "Bad st,adc-channels?\n");
>>  		return -EINVAL;
>> @@ -1879,18 +1879,17 @@ static int stm32_adc_get_legacy_chan_count(struct iio_dev *indio_dev, struct stm
>>  		num_channels += ret;
>>  	}
>>  
>> -	ret = of_property_count_elems_of_size(node, "st,adc-diff-channels",
>> -					      sizeof(struct stm32_adc_diff_channel));
>> -	if (ret > adc_info->max_channels) {
>> +	ret = device_property_count_u32(dev, "st,adc-diff-channels");
>> +	if ((ret / 2) > adc_info->max_channels) {
> hmm. The magic '2' that is introduced here kind of looses some of the meaning
> that existed for the *_count_elems_of_size()
> 
> Perhaps introduce a define or a comment on why it is 2?

Hi Nuno,

Thanks for your patch, please find some remarks below.

First, I agree with Jonathan here. (Just suggesting) Would it be
possible to keep a reference to the target struct to ease long term
maintenance ? I'm thinking of:
sizeof(struct stm32_adc_diff_channel) / sizeof(u32).
Or possibly a better approach...

> 
>>  		dev_err(&indio_dev->dev, "Bad st,adc-diff-channels?\n");
>>  		return -EINVAL;
>> -	} else if (ret > 0) {
>> -		adc->num_diff = ret;
>> -		num_channels += ret;
>> +	} else if ((ret / 2) > 0) {
>> +		adc->num_diff = ret / 2;
>> +		num_channels += ret / 2;
>>  	}
>>  
>>  	/* Optional sample time is provided either for each, or all channels */
>> -	ret = of_property_count_u32_elems(node, "st,min-sample-time-nsecs");
>> +	ret = device_property_count_u32(dev, "st,min-sample-time-nsecs");
>>  	if (ret > 1 && ret != num_channels) {
>>  		dev_err(&indio_dev->dev, "Invalid st,min-sample-time-nsecs\n");
>>  		return -EINVAL;
>> @@ -1901,21 +1900,20 @@ static int stm32_adc_get_legacy_chan_count(struct iio_dev *indio_dev, struct stm
>>  
>>  static int stm32_adc_legacy_chan_init(struct iio_dev *indio_dev,
>>  				      struct stm32_adc *adc,
>> -				      struct iio_chan_spec *channels)
>> +				      struct iio_chan_spec *channels,
>> +				      int nchans)
>>  {
>> -	struct device_node *node = indio_dev->dev.of_node;
>>  	const struct stm32_adc_info *adc_info = adc->cfg->adc_info;
>>  	struct stm32_adc_diff_channel diff[STM32_ADC_CH_MAX];
>> +	struct device *dev = &indio_dev->dev;
>>  	u32 num_diff = adc->num_diff;
>>  	int size = num_diff * sizeof(*diff) / sizeof(u32);
>> -	int scan_index = 0, val, ret, i;
>> -	struct property *prop;
>> -	const __be32 *cur;
>> -	u32 smp = 0;
>> +	int scan_index = 0, ret, i;
>> +	u32 smp = 0, nsmps, smps[STM32_ADC_CH_MAX], chans[STM32_ADC_CH_MAX];
>>  
>>  	if (num_diff) {
>> -		ret = of_property_read_u32_array(node, "st,adc-diff-channels",
>> -						 (u32 *)diff, size);
>> +		ret = device_property_read_u32_array(dev, "st,adc-diff-channels",
>> +						     (u32 *)diff, size);
>>  		if (ret) {
>>  			dev_err(&indio_dev->dev, "Failed to get diff channels %d\n", ret);
>>  			return ret;
>> @@ -1936,32 +1934,51 @@ static int stm32_adc_legacy_chan_init(struct iio_dev *indio_dev,
>>  		}
>>  	}
>>  
>> -	of_property_for_each_u32(node, "st,adc-channels", prop, cur, val) {
>> -		if (val >= adc_info->max_channels) {
>> -			dev_err(&indio_dev->dev, "Invalid channel %d\n", val);
>> +	ret = device_property_read_u32_array(dev, "st,adc-channels", chans,
>> +					     nchans);
>> +	if (ret)
>> +		return ret;
>> +
>> +	for (i = 0; i < nchans; i++) {

Shouldn't use 'i' variable as is.

I tested at my end. There's a bug around here, as the same variable 'i'
is used already in next for loop. It creates an endless loop, that ends
up in incrementing scan_index indefinitely until some oops occurs.

I fixed that locally for quick testing by using another variable.

Isn't there a helper to achive this (e.g. like of_property_for_each_u32) ?

>> +		if (chans[i] >= adc_info->max_channels) {
>> +			dev_err(&indio_dev->dev, "Invalid channel %d\n",
>> +				chans[i]);
>>  			return -EINVAL;
>>  		}
>>  
>>  		/* Channel can't be configured both as single-ended & diff */
>>  		for (i = 0; i < num_diff; i++) {
>> -			if (val == diff[i].vinp) {
>> -				dev_err(&indio_dev->dev, "channel %d misconfigured\n",	val);
>> +			if (chans[i] == diff[i].vinp) {
>> +				dev_err(&indio_dev->dev, "channel %d misconfigured\n",	chans[i]);
>>  				return -EINVAL;
>>  			}
>>  		}
>> -		stm32_adc_chan_init_one(indio_dev, &channels[scan_index], val,
>> -					0, scan_index, false);
>> +		stm32_adc_chan_init_one(indio_dev, &channels[scan_index],
>> +					chans[i], 0, scan_index, false);
>>  		scan_index++;
>>  	}
>>  
>> +	nsmps = device_property_count_u32(dev, "st,min-sample-time-nsecs");
>> +	if (nsmps) {
>> +		if (nsmps >= nchans)

nit: if (nsmps > nchans)

>> +			nsmps = nchans;

There's a bit of redundancy in checking nsmps,
"st,min-sample-time-nsecs" is already sanitized in
stm32_adc_get_legacy_chan_count():

/* Optional sample time is provided either for each, or all channels */
ret = device_property_count_u32(dev, "st,min-sample-time-nsecs");
if (ret > 1 && ret != num_channels) {
	dev_err(...

So just sharing my thoughts here:
- Maybe this could be dropped ?
  (Thinking loudly) The earliest this gets sanitized, the less un-needed
initialisations happen before failing?
- Or the earlier check could be moved here ?

I've no strong opinion.

>> +
>> +		ret = device_property_read_u32_array(dev, "st,min-sample-time-nsecs",
>> +						     smps, nsmps);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>>  	for (i = 0; i < scan_index; i++) {
>>  		/*
>> -		 * Using of_property_read_u32_index(), smp value will only be
>> -		 * modified if valid u32 value can be decoded. This allows to
>> -		 * get either no value, 1 shared value for all indexes, or one
>> -		 * value per channel.
>> +		 * This check is used with the above logic so that smp value
>> +		 * will only be modified if valid u32 value can be decoded. This
>> +		 * allows to get either no value, 1 shared value for all indexes,
>> +		 * or one value per channel. The point is to have the same
>> +		 * behavior as 'of_property_read_u32_index()'.
>>  		 */
>> -		of_property_read_u32_index(node, "st,min-sample-time-nsecs", i, &smp);
>> +		if (i < nsmps)
>> +			smp = smps[i];

Minor remark, I'm wondering if using a switch (nsmps) {.. case} or
similar would help to improve understandabilty / readability ?

Best Regards,
Fabrice

>>  
>>  		/* Prepare sampling time settings */
>>  		stm32_adc_smpr_init(adc, channels[i].channel, smp);
>> @@ -2004,22 +2021,21 @@ static int stm32_adc_generic_chan_init(struct iio_dev *indio_dev,
>>  				       struct stm32_adc *adc,
>>  				       struct iio_chan_spec *channels)
>>  {
>> -	struct device_node *node = indio_dev->dev.of_node;
>>  	const struct stm32_adc_info *adc_info = adc->cfg->adc_info;
>> -	struct device_node *child;
>> +	struct fwnode_handle *child;
>>  	const char *name;
>>  	int val, scan_index = 0, ret;
>>  	bool differential;
>>  	u32 vin[2];
>>  
>> -	for_each_available_child_of_node(node, child) {
>> -		ret = of_property_read_u32(child, "reg", &val);
>> +	device_for_each_child_node(&indio_dev->dev, child) {
>> +		ret = fwnode_property_read_u32(child, "reg", &val);
>>  		if (ret) {
>>  			dev_err(&indio_dev->dev, "Missing channel index %d\n", ret);
>>  			goto err;
>>  		}
>>  
>> -		ret = of_property_read_string(child, "label", &name);
>> +		ret = fwnode_property_read_string(child, "label", &name);
>>  		/* label is optional */
>>  		if (!ret) {
>>  			if (strlen(name) >= STM32_ADC_CH_SZ) {
>> @@ -2044,7 +2060,7 @@ static int stm32_adc_generic_chan_init(struct iio_dev *indio_dev,
>>  		}
>>  
>>  		differential = false;
>> -		ret = of_property_read_u32_array(child, "diff-channels", vin, 2);
>> +		ret = fwnode_property_read_u32_array(child, "diff-channels", vin, 2);
>>  		/* diff-channels is optional */
>>  		if (!ret) {
>>  			differential = true;
>> @@ -2061,7 +2077,7 @@ static int stm32_adc_generic_chan_init(struct iio_dev *indio_dev,
>>  		stm32_adc_chan_init_one(indio_dev, &channels[scan_index], val,
>>  					vin[1], scan_index, differential);
>>  
>> -		ret = of_property_read_u32(child, "st,min-sample-time-ns", &val);
>> +		ret = fwnode_property_read_u32(child, "st,min-sample-time-ns", &val);
>>  		/* st,min-sample-time-ns is optional */
>>  		if (!ret) {
>>  			stm32_adc_smpr_init(adc, channels[scan_index].channel, val);
>> @@ -2079,14 +2095,13 @@ static int stm32_adc_generic_chan_init(struct iio_dev *indio_dev,
>>  	return scan_index;
>>  
>>  err:
>> -	of_node_put(child);
>> +	fwnode_handle_put(child);
>>  
>>  	return ret;
>>  }
>>  
>> -static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timestamping)
>> +static int stm32_adc_chan_fw_init(struct iio_dev *indio_dev, bool timestamping)
>>  {
>> -	struct device_node *node = indio_dev->dev.of_node;
>>  	struct stm32_adc *adc = iio_priv(indio_dev);
>>  	const struct stm32_adc_info *adc_info = adc->cfg->adc_info;
>>  	struct iio_chan_spec *channels;
>> @@ -2096,7 +2111,7 @@ static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timestamping)
>>  	for (i = 0; i < STM32_ADC_INT_CH_NB; i++)
>>  		adc->int_ch[i] = STM32_ADC_INT_CH_NONE;
>>  
>> -	num_channels = of_get_available_child_count(node);
>> +	num_channels = device_get_child_node_count(&indio_dev->dev);
>>  	/* If no channels have been found, fallback to channels legacy properties. */
>>  	if (!num_channels) {
>>  		legacy = true;
>> @@ -2127,7 +2142,8 @@ static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timestamping)
>>  		return -ENOMEM;
>>  
>>  	if (legacy)
>> -		ret = stm32_adc_legacy_chan_init(indio_dev, adc, channels);
>> +		ret = stm32_adc_legacy_chan_init(indio_dev, adc, channels,
>> +						 num_channels);
>>  	else
>>  		ret = stm32_adc_generic_chan_init(indio_dev, adc, channels);
>>  	if (ret < 0)
>> @@ -2209,9 +2225,6 @@ static int stm32_adc_probe(struct platform_device *pdev)
>>  	bool timestamping = false;
>>  	int ret;
>>  
>> -	if (!pdev->dev.of_node)
>> -		return -ENODEV;
>> -
>>  	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*adc));
>>  	if (!indio_dev)
>>  		return -ENOMEM;
>> @@ -2220,17 +2233,16 @@ static int stm32_adc_probe(struct platform_device *pdev)
>>  	adc->common = dev_get_drvdata(pdev->dev.parent);
>>  	spin_lock_init(&adc->lock);
>>  	init_completion(&adc->completion);
>> -	adc->cfg = (const struct stm32_adc_cfg *)
>> -		of_match_device(dev->driver->of_match_table, dev)->data;
>> +	adc->cfg = device_get_match_data(dev);
>>  
>>  	indio_dev->name = dev_name(&pdev->dev);
>> -	indio_dev->dev.of_node = pdev->dev.of_node;
>> +	device_set_node(&indio_dev->dev, dev_fwnode(&pdev->dev));
>>  	indio_dev->info = &stm32_adc_iio_info;
>>  	indio_dev->modes = INDIO_DIRECT_MODE | INDIO_HARDWARE_TRIGGERED;
>>  
>>  	platform_set_drvdata(pdev, indio_dev);
>>  
>> -	ret = of_property_read_u32(pdev->dev.of_node, "reg", &adc->offset);
>> +	ret = device_property_read_u32(dev, "reg", &adc->offset);
>>  	if (ret != 0) {
>>  		dev_err(&pdev->dev, "missing reg property\n");
>>  		return -EINVAL;
>> @@ -2259,7 +2271,7 @@ static int stm32_adc_probe(struct platform_device *pdev)
>>  		}
>>  	}
>>  
>> -	ret = stm32_adc_of_get_resolution(indio_dev);
>> +	ret = stm32_adc_fw_get_resolution(indio_dev);
>>  	if (ret < 0)
>>  		return ret;
>>  
>> @@ -2276,7 +2288,7 @@ static int stm32_adc_probe(struct platform_device *pdev)
>>  		timestamping = true;
>>  	}
>>  
>> -	ret = stm32_adc_chan_of_init(indio_dev, timestamping);
>> +	ret = stm32_adc_chan_fw_init(indio_dev, timestamping);
>>  	if (ret < 0)
>>  		goto err_dma_disable;
>>  
> 
