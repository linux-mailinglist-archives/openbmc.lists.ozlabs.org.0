Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBBE78633A
	for <lists+openbmc@lfdr.de>; Thu, 24 Aug 2023 00:13:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=jfxTzDI1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWL8Q30CZz3c92
	for <lists+openbmc@lfdr.de>; Thu, 24 Aug 2023 08:13:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=jfxTzDI1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::229; helo=relay9-d.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWL7m6Pxbz2yVS
	for <openbmc@lists.ozlabs.org>; Thu, 24 Aug 2023 08:13:08 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7DD63FF803;
	Wed, 23 Aug 2023 22:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692828769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uzRJm47GV3ZxZ9JfsOAXY5oqbwPNNdB91XFC7KDvxvw=;
	b=jfxTzDI1DokQqoONSKdQC0GW63736/5v2d+zLi1k9hMLkXLN+oP+BZt6vUoHBJNPhlCrCP
	IPY6gC+7awEoMO6c5dr10eVf4S6bFv7tFyheeFqmmARuK/RI1Kt5ohZEB39mVYRsuaKtXj
	OGA3gRVpJ9kji4UwjE7EapWh3vSZvuyl4Z/kLwj7prLmTMI8O+gby2f+fdF3RVg8Hyow8F
	yLudVZ+8JQp9o/uPhwya1V9ipC/DYavWAzT7uHP4R/GSXyVTiTBKvYzjo+W6XTrgVJuNLv
	I86S/Y2wPGdzkz+68ir7GTzDcxQIYCoghldbt7tgtJ5/mxjYNNakVbjzp1S50A==
Date: Thu, 24 Aug 2023 00:12:43 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Mia Lin <mimi05633@gmail.com>
Subject: Re: [PATCH v4 1/1] rtc: nuvoton: Compatible with NCT3015Y-R and
 NCT3018Y-R
Message-ID: <2023082322124382cfd168@mail.local>
References: <20230816012540.18464-1-mimi05633@gmail.com>
 <20230816012540.18464-2-mimi05633@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230816012540.18464-2-mimi05633@gmail.com>
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

Hello,

On 16/08/2023 09:25:40+0800, Mia Lin wrote:
> -	dev_dbg(&client->dev, "%s:alarm_enable:%x alarm_flag:%x\n",
> -		__func__, *alarm_enable, *alarm_flag);
> +	if (alarm_enable && alarm_flag)

I don't really see the point of conditionally displaying this debug
message.

> +		dev_dbg(&client->dev, "%s: alarm_enable=%x, alarm_flag=%x.\n",
> +			__func__, *alarm_enable, *alarm_flag);
>  
>  	return 0;
>  }
> @@ -123,17 +124,17 @@ static irqreturn_t nct3018y_irq(int irq, void *dev_id)
>  	unsigned char alarm_flag;
>  	unsigned char alarm_enable;
>  
> -	dev_dbg(&client->dev, "%s:irq:%d\n", __func__, irq);
> +	dev_dbg(&client->dev, "%s: irq=%d.\n", __func__, irq);

You have many of those changes where you only add a space, I feel like
this is a matter of taste and this makes it more difficult than
necessary to read your patch.

>  	err = nct3018y_get_alarm_mode(nct3018y->client, &alarm_enable, &alarm_flag);
>  	if (err)
>  		return IRQ_NONE;
>  
>  	if (alarm_flag) {
> -		dev_dbg(&client->dev, "%s:alarm flag:%x\n",
> +		dev_dbg(&client->dev, "%s: alarm flag=%x.\n",
>  			__func__, alarm_flag);
>  		rtc_update_irq(nct3018y->rtc, 1, RTC_IRQF | RTC_AF);
>  		nct3018y_set_alarm_mode(nct3018y->client, 0);
> -		dev_dbg(&client->dev, "%s:IRQ_HANDLED\n", __func__);
> +		dev_dbg(&client->dev, "%s: IRQ_HANDLED.\n", __func__);
>  		return IRQ_HANDLED;
>  	}
>  
> @@ -155,7 +156,7 @@ static int nct3018y_rtc_read_time(struct device *dev, struct rtc_time *tm)
>  		return err;
>  
>  	if (!buf[0]) {
> -		dev_dbg(&client->dev, " voltage <=1.7, date/time is not reliable.\n");
> +		dev_dbg(&client->dev, "%s: voltage <=1.7, date/time is not reliable.\n", __func__);
>  		return -EINVAL;
>  	}
>  
> @@ -178,26 +179,50 @@ static int nct3018y_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
>  	unsigned char buf[4] = {0};
> -	int err;
> +	int err, part_num, flags;
> +	int restore_flags = 0;
> +
> +	part_num = i2c_smbus_read_byte_data(client, NCT3018Y_REG_PART);

Do you really have to check the part number every time you set the time?
I don't expect it to change once read in probe.

> +	if (part_num < 0) {
> +		dev_dbg(&client->dev, "%s: Failed to read part info reg.\n", __func__);
> +		return part_num;
> +	}
> +

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
