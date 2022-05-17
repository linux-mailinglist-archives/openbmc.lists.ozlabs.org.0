Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D889D52ABC4
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 21:16:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2m7r4Yc0z3cBv
	for <lists+openbmc@lfdr.de>; Wed, 18 May 2022 05:16:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=mZhCx+j7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::240;
 helo=mslow1.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mZhCx+j7; dkim-atps=neutral
X-Greylist: delayed 262 seconds by postgrey-1.36 at boromir;
 Wed, 18 May 2022 05:16:18 AEST
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::240])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2m7Q45NNz3bxp
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2022 05:16:18 +1000 (AEST)
Received: from relay4-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::224])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id A76B3D1E14
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 19:12:01 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B27C9E0002;
 Tue, 17 May 2022 19:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652814699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ciEKtKEnvkzKNJAoGK/KViClHXdcfgsk/r2fvYOSpW8=;
 b=mZhCx+j7HMRQdtj/5a15tLiPL7E2wleLExmHwLqW3pNrKAfOq2bUnRcirswusQI7RyrGWf
 ltgfHRme4zIZRNhMn/5Es9NBU9cbu2jFQuH5c8Jso+JWz1FEsKrOeZeOW/5Fan3ApuOomt
 5nQkH0n70lfEOGmwJKO1Xn0pkh0Kqy8/Qrt52TJpGKyMAp8R8D5KlqhcBSMjuohSu56hBk
 2bYinKSoGgoWRZL41FP+FLtQDJt7ohARUbB8Qznwt+Ot1klO8BWMbrYF2rpZLP77AVNXaA
 nWeb9qyiyTLCxCo5RJDbmNDzYMxoigRbY2djyRFhLTFK91rtVWmbd3cmK1yIkQ==
Date: Tue, 17 May 2022 21:11:37 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Medad CChien <medadyoung@gmail.com>
Subject: Re: [PATCH v2 3/3] RTC: nuvoton: Add NCT3018Y real time clock driver
Message-ID: <YoPzaSc/8BBVWWsB@mail.local>
References: <20220517092927.19537-1-ctcchien@nuvoton.com>
 <20220517092927.19537-4-ctcchien@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517092927.19537-4-ctcchien@nuvoton.com>
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
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it, YSCHU@nuvoton.com,
 tmaimon77@gmail.com, KWLIU@nuvoton.com, avifishman70@gmail.com,
 venture@google.com, openbmc@lists.ozlabs.org, KFTING@nuvoton.com,
 JJLIU0@nuvoton.com, ctcchien@nuvoton.com, tali.perry1@gmail.com,
 devicetree@vger.kernel.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

Thank you for your submission. There are a bunch of checkpatch --strict issues,
please fix them.

On 17/05/2022 17:29:26+0800, Medad CChien wrote:
> Add real time clock support for NCT3018Y.

Is the NCT3018Y an SoC or a discrete RTC?

> 
> Fix the following warnings and errors:
> error:
>    drivers/rtc/rtc-nct3018y.c:513:39: warning: format '%d' expects argument of type 'int', but argument 5 has type 'long unsigned int'
>    drivers/rtc/rtc-nct3018y.c:513:39: warning: format '%d' expects argument of type 'int', but argument 5 has type 'long unsigned int'
> warnings:
>    drivers/rtc/rtc-nct3018y.c:192:26: warning: unused variable 'nct3018y'
>    drivers/rtc/rtc-nct3018y.c:513:39: warning: format '%d' expects argument of type 'int', but argument 5 has type 'long unsigned int'
> Reported-by: kernel test robot <lkp@intel.com>
> 

This part doesn't belong in the commit message as the patch introducing
the issue will never be upstream

> Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> ---
>  drivers/rtc/Kconfig        |  10 +
>  drivers/rtc/Makefile       |   1 +
>  drivers/rtc/rtc-nct3018y.c | 592 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 603 insertions(+)
>  create mode 100644 drivers/rtc/rtc-nct3018y.c
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index d85a3c31347c..d83d31c76443 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -383,6 +383,16 @@ config RTC_DRV_MAX77686
>  	  This driver can also be built as a module. If so, the module
>  	  will be called rtc-max77686.
>  
> +config RTC_DRV_NCT3018Y
> +	tristate "Nuvoton Real Time Clock"

This definitively needs a better description

> +	depends on OF
> +	help
> +	   If you say yes here you get support for the Nuvoton NCT3018Y RTC
> +	   module.
> +
> +	   This driver can also be built as a module, if so, the module will
> +	   be called "rtc-nct3018y".
> +
>  config RTC_DRV_RK808
>  	tristate "Rockchip RK805/RK808/RK809/RK817/RK818 RTC"
>  	depends on MFD_RK808
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index e92f3e943245..d3c100e43d1f 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -112,6 +112,7 @@ obj-$(CONFIG_RTC_DRV_MV)	+= rtc-mv.o
>  obj-$(CONFIG_RTC_DRV_MXC)	+= rtc-mxc.o
>  obj-$(CONFIG_RTC_DRV_MXC_V2)	+= rtc-mxc_v2.o
>  obj-$(CONFIG_RTC_DRV_GAMECUBE)	+= rtc-gamecube.o
> +obj-$(CONFIG_RTC_DRV_NCT3018Y)	+= rtc-nct3018y.o
>  obj-$(CONFIG_RTC_DRV_NTXEC)	+= rtc-ntxec.o
>  obj-$(CONFIG_RTC_DRV_OMAP)	+= rtc-omap.o
>  obj-$(CONFIG_RTC_DRV_OPAL)	+= rtc-opal.o
> diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
> new file mode 100644
> index 000000000000..4b2e66be8064
> --- /dev/null
> +++ b/drivers/rtc/rtc-nct3018y.c
> @@ -0,0 +1,592 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2022 Nuvoton Technology Corporation
> +
> +#include <linux/bcd.h>
> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/rtc.h>
> +#include <linux/slab.h>
> +
> +#define NCT3018Y_REG_SC		0x00 /* seconds */
> +#define NCT3018Y_REG_SCA	0x01 /* alarm */
> +#define NCT3018Y_REG_MN		0x02
> +#define NCT3018Y_REG_MNA	0x03 /* alarm */
> +#define NCT3018Y_REG_HR		0x04
> +#define NCT3018Y_REG_HRA	0x05 /* alarm */
> +#define NCT3018Y_REG_DW		0x06
> +#define NCT3018Y_REG_DM		0x07
> +#define NCT3018Y_REG_MO		0x08
> +#define NCT3018Y_REG_YR		0x09
> +#define NCT3018Y_REG_CTRL	0x0A /* timer control */
> +#define NCT3018Y_REG_ST		0x0B /* status */
> +#define NCT3018Y_REG_CLKO	0x0C /* clock out */
> +
> +#define NCT3018Y_BIT_AF		BIT(7)
> +#define NCT3018Y_BIT_ST		BIT(7)
> +#define NCT3018Y_BIT_DM		BIT(6)
> +#define NCT3018Y_BIT_HF		BIT(5)
> +#define NCT3018Y_BIT_DSM	BIT(4)
> +#define NCT3018Y_BIT_AIE	BIT(3)
> +#define NCT3018Y_BIT_OFIE	BIT(2)
> +#define NCT3018Y_BIT_CIE	BIT(1)
> +#define NCT3018Y_BIT_TWO	BIT(0)
> +
> +#define NCT3018Y_REG_CLKO_F_MASK	0x03 /* frequenc mask */
> +#define NCT3018Y_REG_CLKO_CKE		0x80 /* clock out enabled */
> +
> +static struct i2c_driver nct3018y_driver;

I prefer we avoid this forward declaration.

> +
> +struct nct3018y {
> +	struct rtc_device *rtc;
> +	struct i2c_client *client;
> +	struct gpio_desc *wakeup_host;
> +#ifdef CONFIG_COMMON_CLK
> +	struct clk_hw		clkout_hw;
> +#endif
> +};
> +
> +static int nct3018y_read_block_data(struct i2c_client *client,
> +				    unsigned char reg, unsigned char length, unsigned char *buf)
> +{
> +	struct i2c_msg msgs[] = {
> +		{/* setup read ptr */
> +			.addr = client->addr,
> +			.len = 1,
> +			.buf = &reg,
> +		},
> +		{
> +			.addr = client->addr,
> +			.flags = I2C_M_RD,
> +			.len = length,
> +			.buf = buf
> +		},
> +	};
> +
> +	if ((i2c_transfer(client->adapter, msgs, 2)) != 2) {
> +		dev_err(&client->dev, "%s: read error\n", __func__);

Please cut down on the error messages most of them will never be useful
but will take some space. Also, you should probably use regmap instead
of rolling your own function.

> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static int nct3018y_write_block_data(struct i2c_client *client,
> +				     unsigned char reg, unsigned char length,
> +				     unsigned char *buf)
> +{
> +	int i, err;
> +
> +	for (i = 0; i < length; i++) {
> +		unsigned char data[2] = { reg + i, buf[i] };
> +
> +		err = i2c_master_send(client, data, sizeof(data));
> +		if (err != sizeof(data)) {
> +			dev_err(&client->dev, "%s: err=%d addr=%02x, data=%02x\n", __func__,
> +				err, data[0], data[1]);
> +			return -EIO;
> +		}

Are you sure you need to send data byte per byte?

> +	}
> +
> +	return 0;
> +}
> +
> +static int nct3018y_set_alarm_mode(struct i2c_client *client, bool on)
> +{
> +	unsigned char buf;
> +	int err;
> +
> +	dev_dbg(&client->dev, "%s:on:%d\n", __func__, on);
> +	err = nct3018y_read_block_data(client, NCT3018Y_REG_CTRL, 1, &buf);
> +	if (err < 0)
> +		return err;
> +
> +	if (on)
> +		buf |= NCT3018Y_BIT_AIE;
> +	else
> +		buf &= ~NCT3018Y_BIT_AIE;
> +
> +	buf |= NCT3018Y_BIT_CIE;
> +	err = nct3018y_write_block_data(client, NCT3018Y_REG_CTRL, 1, &buf);
> +	if (err < 0) {
> +		dev_err(&client->dev, "%s: write NCT3018Y_REG_ST error\n", __func__);
> +		return -EIO;
> +	}
> +
> +	err = nct3018y_read_block_data(client, NCT3018Y_REG_ST, 1, &buf);
> +	if (err < 0)
> +		return err;
> +
> +	buf &= ~(NCT3018Y_BIT_AF);
> +	err = nct3018y_write_block_data(client, NCT3018Y_REG_ST, 1, &buf);
> +	if (err < 0) {
> +		dev_err(&client->dev, "%s: write NCT3018Y_REG_ST error\n", __func__);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static int nct3018y_get_alarm_mode(struct i2c_client *client, unsigned char *alarm_enable,
> +				  unsigned char *alarm_flag)
> +{
> +	unsigned char buf;
> +	int err;
> +
> +	if (alarm_enable) {
> +		dev_dbg(&client->dev, "%s:NCT3018Y_REG_CTRL\n", __func__);
> +		err = nct3018y_read_block_data(client, NCT3018Y_REG_CTRL, 1, &buf);
> +		if (err)
> +			return err;
> +		*alarm_enable = buf & NCT3018Y_BIT_AIE;
> +	}
> +
> +	if (alarm_flag) {
> +		dev_dbg(&client->dev, "%s:NCT3018Y_REG_ST\n", __func__);
> +		err = nct3018y_read_block_data(client, NCT3018Y_REG_ST, 1, &buf);
> +		if (err)
> +			return err;
> +		*alarm_flag = buf & NCT3018Y_BIT_AF;
> +	}
> +
> +	dev_dbg(&client->dev, "%s:alarm_enable:%x alarm_flag:%x\n",
> +		__func__, *alarm_enable, *alarm_flag);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t nct3018y_irq(int irq, void *dev_id)
> +{
> +	struct nct3018y *nct3018y = i2c_get_clientdata(dev_id);
> +	struct i2c_client *client = nct3018y->client;
> +	int err;
> +	unsigned char alarm_flag;
> +	unsigned char alarm_enable;
> +
> +	dev_dbg(&client->dev, "%s:irq:%d\n", __func__, irq);
> +	err = nct3018y_get_alarm_mode(nct3018y->client, &alarm_enable, &alarm_flag);
> +	if (err)
> +		return IRQ_NONE;
> +
> +	if (alarm_flag) {
> +		dev_dbg(&client->dev, "%s:alarm flag:%x\n",
> +			__func__, alarm_flag);
> +		rtc_update_irq(nct3018y->rtc, 1, RTC_IRQF | RTC_AF);
> +		nct3018y_set_alarm_mode(nct3018y->client, 1);

Doesn't that rearm the alarm? I would expect the opposite here.

> +		dev_dbg(&client->dev, "%s:IRQ_HANDLED\n", __func__);
> +		return IRQ_HANDLED;
> +	}
> +
> +	return IRQ_NONE;
> +}
> +
> +/*
> + * In the routines that deal directly with the nct3018y hardware, we use
> + * rtc_time -- month 0-11, hour 0-23, yr = calendar year-epoch.
> + */
> +static int nct3018y_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	unsigned char buf[10];
> +	int err;
> +
> +	err = nct3018y_read_block_data(client, NCT3018Y_REG_ST, 1, buf);
> +	if (err)
> +		return err;
> +
> +	if (!buf[0]) {
> +		dev_err(&client->dev, " voltage <=1.7, date/time is not reliable.\n");

This error message is not actually useful, implement the RTC_VL_READ
ioctl instead.

> +		return -EINVAL;
> +	}
> +
> +	err = nct3018y_read_block_data(client, NCT3018Y_REG_SC, 10, buf);
> +	if (err)
> +		return err;
> +
> +	tm->tm_sec = bcd2bin(buf[0] & 0x7F);
> +	tm->tm_min = bcd2bin(buf[2] & 0x7F);
> +	tm->tm_hour = bcd2bin(buf[4] & 0x3F); /* rtc hr 0-24 */

This comment is not accurate, as shown by the comment on top of the
function. I would prefer no comment in that case.

> +	tm->tm_wday = buf[6] & 0x07;
> +	tm->tm_mday = bcd2bin(buf[7] & 0x3F);
> +	tm->tm_mon = bcd2bin(buf[8] & 0x1F) - 1 ; /* rtc mn 1-12 */
> +	tm->tm_year = bcd2bin(buf[9]) + 100;
> +
> +	dev_dbg(&client->dev, "%s:s=%d, m=%d, hr=%d, md=%d, m=%d, yr=%d, wd=%d\n",
> +		__func__, tm->tm_sec, tm->tm_min, tm->tm_hour, tm->tm_mday, tm->tm_mon,
> +		tm->tm_year, tm->tm_wday);
> +
> +	return 0;
> +}
> +
> +static int nct3018y_rtc_set_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	unsigned char buf[10] = {0};
> +	int err;
> +
> +	dev_dbg(&client->dev, "%s:s=%d, m=%d, hr=%d, md=%d, m=%d, yr=%d, wd=%d\n",
> +		__func__, tm->tm_sec, tm->tm_min, tm->tm_hour, tm->tm_mday, tm->tm_mon,
> +		tm->tm_year, tm->tm_wday);
> +
> +	err = nct3018y_read_block_data(client, NCT3018Y_REG_CTRL, 1, buf);
> +	if (err)
> +		return err;
> +
> +	if (!(buf[0] & NCT3018Y_BIT_TWO)) {
> +		dev_err(&client->dev,
> +			" TWO is not set.\n");

This is not useful, what is TWO?

> +		return -EINVAL;
> +	}
> +
> +	/* hours, minutes and seconds */
> +	buf[NCT3018Y_REG_SC] = bin2bcd(tm->tm_sec);
> +	buf[NCT3018Y_REG_MN] = bin2bcd(tm->tm_min);
> +	buf[NCT3018Y_REG_HR] = bin2bcd(tm->tm_hour);
> +	buf[NCT3018Y_REG_DW] = tm->tm_wday & 0x07;
> +	buf[NCT3018Y_REG_DM] = bin2bcd(tm->tm_mday);
> +
> +	/* month, 1 - 12 */
> +	buf[NCT3018Y_REG_MO] = bin2bcd(tm->tm_mon+1);
> +
> +	/* year and century */

Were is the century?

> +	buf[NCT3018Y_REG_YR] = bin2bcd(tm->tm_year - 100);
> +
> +	return nct3018y_write_block_data(client, NCT3018Y_REG_SC, 10, buf);
> +}
> +
> +static int nct3018y_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *tm)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	unsigned char buf[5];
> +	int err;
> +
> +	err = nct3018y_read_block_data(client, NCT3018Y_REG_SCA, 5, buf);
> +	if (err)
> +		return err;
> +
> +	dev_dbg(&client->dev, "%s: raw data is sec=%02x, min=%02x hr=%02x\n",
> +		__func__, buf[0], buf[2], buf[4]);
> +
> +	tm->time.tm_sec = bcd2bin(buf[0] & 0x7F);
> +	tm->time.tm_min = bcd2bin(buf[2] & 0x7F);
> +	tm->time.tm_hour = bcd2bin(buf[4] & 0x3F);
> +
> +	err = nct3018y_get_alarm_mode(client, &tm->enabled, &tm->pending);
> +	if (err < 0)
> +		return err;
> +
> +	dev_dbg(&client->dev, "%s:s=%d m=%d, hr=%d, enabled=%d, pending=%d\n",
> +		__func__, tm->time.tm_sec, tm->time.tm_min,
> +		tm->time.tm_hour, tm->enabled, tm->pending);
> +
> +	return 0;
> +}
> +
> +static int nct3018y_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *tm)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	unsigned char buf[3];
> +	int err;
> +
> +	dev_dbg(dev, "%s, sec=%d, min=%d hour=%d tm->enabled:%d\n",
> +		__func__, tm->time.tm_sec, tm->time.tm_min, tm->time.tm_hour,
> +		tm->enabled);
> +
> +	buf[0] = bin2bcd(tm->time.tm_sec);
> +	buf[1] = bin2bcd(tm->time.tm_min);
> +	buf[2] = bin2bcd(tm->time.tm_hour);
> +
> +	err = nct3018y_write_block_data(client, NCT3018Y_REG_SCA, 1, buf);
> +	if (err)
> +		return err;


Writing byte per byte opens a huge window for a race condition here.

> +
> +	err = nct3018y_write_block_data(client, NCT3018Y_REG_MNA, 1, buf+1);
> +	if (err)
> +		return err;
> +
> +	err = nct3018y_write_block_data(client, NCT3018Y_REG_HRA, 1, buf+2);
> +	if (err)
> +		return err;
> +
> +	return nct3018y_set_alarm_mode(client, tm->enabled);
> +}
> +
> +static int nct3018y_irq_enable(struct device *dev, unsigned int enabled)
> +{
> +	dev_dbg(dev, "%s: alarm enable=%d\n", __func__, enabled);
> +
> +	return nct3018y_set_alarm_mode(to_i2c_client(dev), enabled);
> +}
> +
> +#ifdef CONFIG_COMMON_CLK
> +/*
> + * Handling of the clkout
> + */
> +
> +#define clkout_hw_to_nct3018y(_hw) container_of(_hw, struct nct3018y, clkout_hw)
> +
> +static const int clkout_rates[] = {
> +	32768,
> +	1024,
> +	32,
> +	1,
> +};
> +
> +static unsigned long nct3018y_clkout_recalc_rate(struct clk_hw *hw,
> +						 unsigned long parent_rate)
> +{
> +	struct nct3018y *nct3018y = clkout_hw_to_nct3018y(hw);
> +	struct i2c_client *client = nct3018y->client;
> +	unsigned char buf;
> +	int ret = nct3018y_read_block_data(client, NCT3018Y_REG_CLKO, 1, &buf);
> +
> +	if (ret < 0)
> +		return 0;
> +
> +	buf &= NCT3018Y_REG_CLKO_F_MASK;
> +	return clkout_rates[buf];
> +}
> +
> +static long nct3018y_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
> +				       unsigned long *prate)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(clkout_rates); i++)
> +		if (clkout_rates[i] <= rate)
> +			return clkout_rates[i];
> +
> +	return 0;
> +}
> +
> +static int nct3018y_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
> +				   unsigned long parent_rate)
> +{
> +	struct nct3018y *nct3018y = clkout_hw_to_nct3018y(hw);
> +	struct i2c_client *client = nct3018y->client;
> +	unsigned char buf;
> +	int ret = nct3018y_read_block_data(client, NCT3018Y_REG_CLKO, 1, &buf);
> +	int i;
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	for (i = 0; i < ARRAY_SIZE(clkout_rates); i++)
> +		if (clkout_rates[i] == rate) {
> +			buf &= ~NCT3018Y_REG_CLKO_F_MASK;
> +			buf |= i;
> +			ret = nct3018y_write_block_data(client, NCT3018Y_REG_CLKO, 1, &buf);
> +			return ret;
> +		}
> +
> +	return -EINVAL;
> +}
> +
> +static int nct3018y_clkout_control(struct clk_hw *hw, bool enable)
> +{
> +	struct nct3018y *nct3018y = clkout_hw_to_nct3018y(hw);
> +	struct i2c_client *client = nct3018y->client;
> +	unsigned char buf;
> +	int ret = nct3018y_read_block_data(client, NCT3018Y_REG_CLKO, 1, &buf);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	if (enable)
> +		buf |= NCT3018Y_REG_CLKO_CKE;
> +	else
> +		buf &= ~NCT3018Y_REG_CLKO_CKE;
> +
> +	ret = nct3018y_write_block_data(client, NCT3018Y_REG_CLKO, 1, &buf);
> +	return ret;
> +}
> +
> +static int nct3018y_clkout_prepare(struct clk_hw *hw)
> +{
> +	return nct3018y_clkout_control(hw, 1);
> +}
> +
> +static void nct3018y_clkout_unprepare(struct clk_hw *hw)
> +{
> +	nct3018y_clkout_control(hw, 0);
> +}
> +
> +static int nct3018y_clkout_is_prepared(struct clk_hw *hw)
> +{
> +	struct nct3018y *nct3018y = clkout_hw_to_nct3018y(hw);
> +	struct i2c_client *client = nct3018y->client;
> +	unsigned char buf;
> +	int ret = nct3018y_read_block_data(client, NCT3018Y_REG_CLKO, 1, &buf);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	return buf & NCT3018Y_REG_CLKO_CKE;
> +}
> +
> +static const struct clk_ops nct3018y_clkout_ops = {
> +	.prepare = nct3018y_clkout_prepare,
> +	.unprepare = nct3018y_clkout_unprepare,
> +	.is_prepared = nct3018y_clkout_is_prepared,
> +	.recalc_rate = nct3018y_clkout_recalc_rate,
> +	.round_rate = nct3018y_clkout_round_rate,
> +	.set_rate = nct3018y_clkout_set_rate,
> +};
> +
> +static struct clk *nct3018y_clkout_register_clk(struct nct3018y *nct3018y)
> +{
> +	struct i2c_client *client = nct3018y->client;
> +	struct device_node *node = client->dev.of_node;
> +	struct clk *clk;
> +	struct clk_init_data init;
> +	int ret;
> +	unsigned char buf;
> +
> +	/* disable the clkout output */
> +	buf = 0;
> +	ret = nct3018y_write_block_data(client, NCT3018Y_REG_CLKO, 1, &buf);
> +	if (ret < 0)
> +		return ERR_PTR(ret);
> +
> +	init.name = "nct3018y-clkout";
> +	init.ops = &nct3018y_clkout_ops;
> +	init.flags = 0;
> +	init.parent_names = NULL;
> +	init.num_parents = 0;
> +	nct3018y->clkout_hw.init = &init;
> +
> +	/* optional override of the clockname */
> +	of_property_read_string(node, "clock-output-names", &init.name);
> +
> +	/* register the clock */
> +	clk = devm_clk_register(&client->dev, &nct3018y->clkout_hw);
> +
> +	if (!IS_ERR(clk))
> +		of_clk_add_provider(node, of_clk_src_simple_get, clk);
> +
> +	return clk;
> +}
> +#endif
> +
> +static const struct rtc_class_ops nct3018y_rtc_ops = {
> +	.read_time	= nct3018y_rtc_read_time,
> +	.set_time	= nct3018y_rtc_set_time,
> +	.read_alarm	= nct3018y_rtc_read_alarm,
> +	.set_alarm	= nct3018y_rtc_set_alarm,
> +	.alarm_irq_enable = nct3018y_irq_enable,
> +};
> +
> +static int nct3018y_probe(struct i2c_client *client,
> +			  const struct i2c_device_id *id)
> +{
> +	struct nct3018y *nct3018y;
> +	int err;
> +	unsigned char buf;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> +		dev_err(&client->dev, "%s: ENODEV\n", __func__);
> +		return -ENODEV;
> +	}
> +
> +	nct3018y = devm_kzalloc(&client->dev, sizeof(struct nct3018y),
> +				GFP_KERNEL);
> +	if (!nct3018y)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, nct3018y);
> +	nct3018y->client = client;
> +	device_set_wakeup_capable(&client->dev, 1);
> +
> +	err = nct3018y_read_block_data(client, NCT3018Y_REG_CTRL, 1, &buf);
> +	if (err < 0) {
> +		dev_err(&client->dev, "%s: read error\n", __func__);
> +		return err;
> +	} else if (buf & NCT3018Y_BIT_TWO) {
> +		dev_dbg(&client->dev, "%s: NCT3018Y_BIT_TWO is :%ld\n",
> +			__func__, buf & NCT3018Y_BIT_TWO);
> +	}
> +
> +	buf = 0 | NCT3018Y_BIT_TWO;

This seems weird

> +	err = nct3018y_write_block_data(client, NCT3018Y_REG_CTRL, 1, &buf);
> +	if (err < 0) {
> +		dev_err(&client->dev, "%s: write fail, so ReadOnly\n", __func__);
> +	} else {
> +		buf = 0;
> +		err = nct3018y_write_block_data(client, NCT3018Y_REG_ST, 1, &buf);
> +		if (err < 0) {
> +			dev_err(&client->dev, "%s: write error\n", __func__);
> +			return err;
> +		}
> +	}
> +
> +	nct3018y->rtc = devm_rtc_allocate_device(&client->dev);
> +	if (IS_ERR(nct3018y->rtc))
> +		return PTR_ERR(nct3018y->rtc);
> +
> +	nct3018y->rtc->ops = &nct3018y_rtc_ops;
> +	nct3018y->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
> +	nct3018y->rtc->range_max = RTC_TIMESTAMP_END_2099;
> +	nct3018y->rtc->set_start_time = true;

Do you have a good reason to set set_start_time here?

> +
> +	nct3018y->wakeup_host = devm_gpiod_get(&client->dev, "host-wakeup", GPIOD_IN);
> +	if (IS_ERR(nct3018y->wakeup_host)) {
> +		err = PTR_ERR(nct3018y->wakeup_host);
> +		dev_err(&client->dev, "could not get host wakeup gpio: %d", err);
> +		return err;
> +	}
> +	client->irq = gpiod_to_irq(nct3018y->wakeup_host);

I don't get why you need that instead of using client->irq directly
which is already parsed by the i2c core for you.

> +
> +	dev_dbg(&client->dev, "%s: client->irq:%d\n", __func__, client->irq);
> +
> +	if (client->irq > 0) {
> +		err = devm_request_threaded_irq(&client->dev, client->irq,
> +				NULL, nct3018y_irq,
> +				IRQF_ONESHOT | IRQF_TRIGGER_FALLING,
> +				nct3018y_driver.driver.name, client);
> +		if (err) {
> +			dev_err(&client->dev, "unable to request IRQ %d\n", client->irq);
> +			return err;
> +		}
> +	}
> +
> +	err = devm_rtc_register_device(nct3018y->rtc);
> +	if (err)
> +		return err;
> +

By reordering this part, you could simply return
devm_rtc_register_device().

> +#ifdef CONFIG_COMMON_CLK
> +	/* register clk in common clk framework */
> +	nct3018y_clkout_register_clk(nct3018y);
> +#endif
> +
> +	return 0;
> +}
> +
> +static const struct i2c_device_id nct3018y_id[] = {
> +	{ "nct3018y", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, nct3018y_id);
> +
> +
> +static const struct of_device_id nct3018y_of_match[] = {
> +	{ .compatible = "nuvoton,nct3018y" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, nct3018y_of_match);
> +
> +static struct i2c_driver nct3018y_driver = {
> +	.driver		= {
> +		.name	= "rtc-nct3018y",
> +		.of_match_table = of_match_ptr(nct3018y_of_match),
> +	},
> +	.probe		= nct3018y_probe,
> +	.id_table	= nct3018y_id,
> +};
> +
> +module_i2c_driver(nct3018y_driver);
> +
> +MODULE_AUTHOR("Medad CChien <ctcchien@nuvoton.com>");
> +MODULE_DESCRIPTION("Nuvoton NCT3018Y RTC driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.17.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
