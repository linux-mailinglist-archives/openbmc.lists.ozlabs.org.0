Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA699792092
	for <lists+openbmc@lfdr.de>; Tue,  5 Sep 2023 08:36:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=hhHnaTV+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RfwkQ4vmMz3bvW
	for <lists+openbmc@lfdr.de>; Tue,  5 Sep 2023 16:35:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=hhHnaTV+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rfwjp6QCkz2xm6
	for <openbmc@lists.ozlabs.org>; Tue,  5 Sep 2023 16:35:26 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 197D81BF20D;
	Tue,  5 Sep 2023 06:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693895708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9/qNxvvIN1DMOdd6K0/v1/1he9CNJQC3OqEVPPxjBiI=;
	b=hhHnaTV+C9lUEffPJX6azGDot8g0b39Mf72fpvmqzjYRjVulOK36Qtw8pYE/39dkr9hf/7
	N0VtbZheDJYMrKAMZLVS44rlks58KDIuaXYL5yzIEp0SOW1u07DIVuZSdianwKhrbJQNEI
	eSqUi8R3zBoaHxeGxQGoisatCliJwRccgK9VCCJxWA4kHknBxnq+1cE9B1fgWk45caFQ3p
	7YYN4RACsqgIpP/8AsPk7esT1oz2t4FiEc1mo+A7wlPemtN/AcJPa2wDDgSJB13MwGLM/I
	iMGnL+t1cAM8v8azZC5Zq8kCtcA/2teK5zXyrwuRSxVy7ZmXd5XHVO2XEcwhqw==
Date: Tue, 5 Sep 2023 08:35:05 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Mia Lin <mimi05633@gmail.com>
Subject: Re: [PATCH v5 1/1] rtc: nuvoton: Compatible with NCT3015Y-R and
 NCT3018Y-R
Message-ID: <202309050635059ecd17a2@mail.local>
References: <20230905060341.5632-1-mimi05633@gmail.com>
 <20230905060341.5632-2-mimi05633@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905060341.5632-2-mimi05633@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
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
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it, mylin1@nuvoton.com, benjaminfair@google.com, KWLIU@nuvoton.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, KFLIN@nuvoton.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 05/09/2023 14:03:41+0800, Mia Lin wrote:
> The NCT3015Y-R and NCT3018Y-R use the same datasheet
>     but have different topologies as follows.
> - Topology (Only 1st i2c can set TWO bit and HF bit)
>   In NCT3015Y-R,
>     rtc 1st i2c is connected to a host CPU
>     rtc 2nd i2c is connected to a BMC
>   In NCT3018Y-R,
>     rtc 1st i2c is connected to a BMC
>     rtc 2nd i2c is connected to a host CPU
> In order to be compatible with NCT3015Y-R and NCT3018Y-R,
> - In probe,
>   If part number is NCT3018Y-R, only set HF bit to 24-Hour format.
>   Else, do nothing
> - In set_time,
>   If part number is NCT3018Y-R && TWO bit is 0,
>      change TWO bit to 1, and restore TWO bit after updating time.
> - Refine error messages to pinpoint the correct location.
> 
> Signed-off-by: Mia Lin <mimi05633@gmail.com>
> ---
>  drivers/rtc/rtc-nct3018y.c | 87 ++++++++++++++++++++++++++++----------
>  1 file changed, 64 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
> index a4e3f924837e..9ec20f241e15 100644
> --- a/drivers/rtc/rtc-nct3018y.c
> +++ b/drivers/rtc/rtc-nct3018y.c
> @@ -23,6 +23,7 @@
>  #define NCT3018Y_REG_CTRL	0x0A /* timer control */
>  #define NCT3018Y_REG_ST		0x0B /* status */
>  #define NCT3018Y_REG_CLKO	0x0C /* clock out */
> +#define NCT3018Y_REG_PART	0x21 /* part info */
>  
>  #define NCT3018Y_BIT_AF		BIT(7)
>  #define NCT3018Y_BIT_ST		BIT(7)
> @@ -37,6 +38,7 @@
>  #define NCT3018Y_REG_BAT_MASK		0x07
>  #define NCT3018Y_REG_CLKO_F_MASK	0x03 /* frequenc mask */
>  #define NCT3018Y_REG_CLKO_CKE		0x80 /* clock out enabled */
> +#define NCT3018Y_REG_PART_NCT3018Y	0x02
>  
>  struct nct3018y {
>  	struct rtc_device *rtc;
> @@ -46,6 +48,8 @@ struct nct3018y {
>  #endif
>  };
>  
> +static int part_num;
> +

This must be part of struct nct3018y.

>  static int nct3018y_set_alarm_mode(struct i2c_client *client, bool on)
>  {
>  	int err, flags;
> @@ -55,7 +59,7 @@ static int nct3018y_set_alarm_mode(struct i2c_client *client, bool on)
>  	flags =  i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
>  	if (flags < 0) {
>  		dev_dbg(&client->dev,
> -			"Failed to read NCT3018Y_REG_CTRL\n");
> +			"%s: Failed to read ctrl reg.\n", __func__);

If you really insist on this change, what about:

#define pr_fmt(fmt) "%s: " fmt, __func__

>  		return flags;
>  	}
>  
> @@ -67,21 +71,21 @@ static int nct3018y_set_alarm_mode(struct i2c_client *client, bool on)
>  	flags |= NCT3018Y_BIT_CIE;
>  	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
>  	if (err < 0) {
> -		dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL\n");
> +		dev_dbg(&client->dev, "%s: Unable to write ctrl reg.\n", __func__);
>  		return err;
>  	}
>  
>  	flags =  i2c_smbus_read_byte_data(client, NCT3018Y_REG_ST);
>  	if (flags < 0) {
>  		dev_dbg(&client->dev,
> -			"Failed to read NCT3018Y_REG_ST\n");
> +			"%s: Failed to read status reg.\n", __func__);
>  		return flags;
>  	}
>  
>  	flags &= ~(NCT3018Y_BIT_AF);
>  	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_ST, flags);
>  	if (err < 0) {
> -		dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_ST\n");
> +		dev_dbg(&client->dev, "%s: Unable to write status reg.\n", __func__);
>  		return err;
>  	}
>  
> @@ -155,7 +159,7 @@ static int nct3018y_rtc_read_time(struct device *dev, struct rtc_time *tm)
>  		return err;
>  
>  	if (!buf[0]) {
> -		dev_dbg(&client->dev, " voltage <=1.7, date/time is not reliable.\n");
> +		dev_dbg(&client->dev, "%s: voltage <=1.7, date/time is not reliable.\n", __func__);
>  		return -EINVAL;
>  	}
>  
> @@ -178,26 +182,44 @@ static int nct3018y_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
>  	unsigned char buf[4] = {0};
> -	int err;
> +	int err, flags;
> +	int restore_flags = 0;
> +
> +	flags = i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
> +	if (flags < 0) {
> +		dev_dbg(&client->dev, "%s: Failed to read ctrl reg.\n", __func__);
> +		return flags;
> +	}
> +
> +	/* Check and set TWO bit */
> +	if ((part_num & NCT3018Y_REG_PART_NCT3018Y) && !(flags & NCT3018Y_BIT_TWO)) {
> +		restore_flags = 1;
> +		flags |= NCT3018Y_BIT_TWO;
> +		err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
> +		if (err < 0) {
> +			dev_dbg(&client->dev, "%s: Unable to write ctrl reg.\n", __func__);
> +			return err;
> +		}
> +	}
>  
>  	buf[0] = bin2bcd(tm->tm_sec);
>  	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_SC, buf[0]);
>  	if (err < 0) {
> -		dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_SC\n");
> +		dev_dbg(&client->dev, "%s: Unable to write seconds reg.\n", __func__);
>  		return err;
>  	}
>  
>  	buf[0] = bin2bcd(tm->tm_min);
>  	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_MN, buf[0]);
>  	if (err < 0) {
> -		dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_MN\n");
> +		dev_dbg(&client->dev, "%s: Unable to write minutes reg.\n", __func__);
>  		return err;
>  	}
>  
>  	buf[0] = bin2bcd(tm->tm_hour);
>  	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_HR, buf[0]);
>  	if (err < 0) {
> -		dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_HR\n");
> +		dev_dbg(&client->dev, "%s: Unable to write hour reg.\n", __func__);
>  		return err;
>  	}
>  
> @@ -208,10 +230,22 @@ static int nct3018y_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  	err = i2c_smbus_write_i2c_block_data(client, NCT3018Y_REG_DW,
>  					     sizeof(buf), buf);
>  	if (err < 0) {
> -		dev_dbg(&client->dev, "Unable to write for day and mon and year\n");
> +		dev_dbg(&client->dev, "%s: Unable to write for day and mon and year.\n", __func__);
>  		return -EIO;
>  	}
>  
> +	/* Restore TWO bit */
> +	if (restore_flags) {
> +		if (part_num & NCT3018Y_REG_PART_NCT3018Y)
> +			flags &= ~NCT3018Y_BIT_TWO;
> +
> +		err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
> +		if (err < 0) {
> +			dev_dbg(&client->dev, "%s: Unable to write ctrl reg.\n", __func__);
> +			return err;
> +		}
> +	}
> +
>  	return err;
>  }
>  
> @@ -224,7 +258,7 @@ static int nct3018y_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *tm)
>  	err = i2c_smbus_read_i2c_block_data(client, NCT3018Y_REG_SCA,
>  					    sizeof(buf), buf);
>  	if (err < 0) {
> -		dev_dbg(&client->dev, "Unable to read date\n");
> +		dev_dbg(&client->dev, "%s: Unable to read date.\n", __func__);
>  		return -EIO;
>  	}
>  
> @@ -257,19 +291,19 @@ static int nct3018y_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *tm)
>  
>  	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_SCA, bin2bcd(tm->time.tm_sec));
>  	if (err < 0) {
> -		dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_SCA\n");
> +		dev_dbg(&client->dev, "%s: Unable to write seconds alarm reg.\n", __func__);
>  		return err;
>  	}
>  
>  	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_MNA, bin2bcd(tm->time.tm_min));
>  	if (err < 0) {
> -		dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_MNA\n");
> +		dev_dbg(&client->dev, "%s: Unable to write minutes alarm reg.\n", __func__);
>  		return err;
>  	}
>  
>  	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_HRA, bin2bcd(tm->time.tm_hour));
>  	if (err < 0) {
> -		dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_HRA\n");
> +		dev_dbg(&client->dev, "%s: Unable to write hour alarm reg.\n", __func__);
>  		return err;
>  	}
>  
> @@ -473,23 +507,29 @@ static int nct3018y_probe(struct i2c_client *client)
>  
>  	flags = i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
>  	if (flags < 0) {
> -		dev_dbg(&client->dev, "%s: read error\n", __func__);
> +		dev_dbg(&client->dev, "%s: Failed to read ctrl reg.\n", __func__);
>  		return flags;
>  	} else if (flags & NCT3018Y_BIT_TWO) {
> -		dev_dbg(&client->dev, "%s: NCT3018Y_BIT_TWO is set\n", __func__);
> +		dev_dbg(&client->dev, "%s: TWO bit is set.\n", __func__);
>  	}
>  
> -	flags = NCT3018Y_BIT_TWO;
> -	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
> -	if (err < 0) {
> -		dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL\n");
> -		return err;
> +	part_num = i2c_smbus_read_byte_data(client, NCT3018Y_REG_PART);
> +	if (part_num < 0) {
> +		dev_dbg(&client->dev, "%s: Failed to read part info reg.\n", __func__);
> +		return part_num;
> +	} else if (part_num & NCT3018Y_REG_PART_NCT3018Y) {
> +		flags = NCT3018Y_BIT_HF;
> +		err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
> +		if (err < 0) {
> +			dev_dbg(&client->dev, "%s: Unable to write ctrl reg.\n", __func__);
> +			return err;
> +		}
>  	}
>  
>  	flags = 0;
>  	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_ST, flags);
>  	if (err < 0) {
> -		dev_dbg(&client->dev, "%s: write error\n", __func__);
> +		dev_dbg(&client->dev, "%s: Failed to clear status reg.\n", __func__);
>  		return err;
>  	}
>  
> @@ -507,7 +547,8 @@ static int nct3018y_probe(struct i2c_client *client)
>  						IRQF_ONESHOT | IRQF_TRIGGER_FALLING,
>  						"nct3018y", client);
>  		if (err) {
> -			dev_dbg(&client->dev, "unable to request IRQ %d\n", client->irq);
> +			dev_dbg(&client->dev, "%s: Unable to request IRQ %d.\n",
> +				__func__, client->irq);
>  			return err;
>  		}
>  	} else {
> -- 
> 2.17.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
