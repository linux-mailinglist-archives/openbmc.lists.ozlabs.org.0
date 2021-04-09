Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66270359597
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 08:36:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGpLD2bgLz3bTT
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 16:36:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=mKveTuIk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=mKveTuIk; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGpKy3sbKz2yx3;
 Fri,  9 Apr 2021 16:35:49 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id BE0C286;
 Thu,  8 Apr 2021 23:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1617950142;
 bh=hL8ydsRBjSGH93b6DxoXiwuUEU1J17Wd5fwxzHWrkNk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mKveTuIk1LSmdqqibJKuKd4WfGGtVPH2qUmK7P0kElsfhc2lKlcw9tuMcG0DDd2wX
 xPsuYjCibyjCeDJ0A7GHT6pacWenP3xpeJwVSvL3LsCYMpYrpXhUP42V/nHUCQJ419
 guR2vdR+BBTQBLRxhVIPUmO+WorScztFE/rt3vI0=
Date: Fri, 9 Apr 2021 01:35:39 -0500
From: Zev Weiss <zev@bewilderbeest.net>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v5 3/4] drivers/tty/serial/8250: add aspeed, lpc-io-reg
 and aspeed, lpc-interrupts DT properties
Message-ID: <YG/1u/kxl12sIO0V@hatter.bewilderbeest.net>
References: <20210408011637.5361-1-zev@bewilderbeest.net>
 <20210408011637.5361-4-zev@bewilderbeest.net>
 <3eef2478-c5b8-4f14-a937-16bbe0a3e05a@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <3eef2478-c5b8-4f14-a937-16bbe0a3e05a@www.fastmail.com>
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
Cc: linux-aspeed@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Apr 09, 2021 at 12:14:54AM CDT, Andrew Jeffery wrote:
>Hi Zev,
>
>A couple of minor comments:
>
>On Thu, 8 Apr 2021, at 10:46, Zev Weiss wrote:
>> These allow describing all the Aspeed VUART attributes currently
>> available via sysfs.  aspeed,sirq
>
>aspeed,lpc-interrupts now

Ah right, thanks.

>
>> provides a replacement for the
>> deprecated aspeed,sirq-polarity-sense property.
>>
>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>> ---
>>  drivers/tty/serial/8250/8250_aspeed_vuart.c | 44 ++++++++++++++++++++-
>>  1 file changed, 43 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c
>> b/drivers/tty/serial/8250/8250_aspeed_vuart.c
>> index 8433f8dbb186..75ef006fa24b 100644
>> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
>> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
>> @@ -28,6 +28,10 @@
>>  #define ASPEED_VUART_ADDRL		0x28
>>  #define ASPEED_VUART_ADDRH		0x2c
>>
>> +#define ASPEED_VUART_DEFAULT_LPC_ADDR	0x3f8
>> +#define ASPEED_VUART_DEFAULT_SIRQ	4
>> +#define ASPEED_VUART_DEFAULT_SIRQ_POLARITY	IRQ_TYPE_LEVEL_LOW
>> +
>>  struct aspeed_vuart {
>>  	struct device		*dev;
>>  	void __iomem		*regs;
>> @@ -393,7 +397,8 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
>>  	struct aspeed_vuart *vuart;
>>  	struct device_node *np;
>>  	struct resource *res;
>> -	u32 clk, prop;
>> +	u32 clk, prop, sirq[2];
>> +	bool sirq_polarity;
>>  	int rc;
>>
>>  	np = pdev->dev.of_node;
>> @@ -501,6 +506,43 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
>>  		of_node_put(sirq_polarity_sense_args.np);
>>  	}
>>
>> +	rc = of_property_read_u32(np, "aspeed,lpc-io-reg", &prop);
>> +	if (rc < 0)
>> +		prop = ASPEED_VUART_DEFAULT_LPC_ADDR;
>> +
>> +	rc = aspeed_vuart_set_lpc_address(vuart, prop);
>> +	if (rc < 0) {
>> +		dev_err(&pdev->dev, "invalid value in aspeed,lpc-io-reg property\n");
>> +		goto err_clk_disable;
>> +	}
>> +
>> +	rc = of_property_read_u32_array(np, "aspeed,lpc-interrupts", sirq, 2);
>> +	if (rc < 0) {
>> +		sirq[0] = ASPEED_VUART_DEFAULT_SIRQ;
>> +		sirq[1] = ASPEED_VUART_DEFAULT_SIRQ_POLARITY;
>> +	}
>> +
>> +	rc = aspeed_vuart_set_sirq(vuart, sirq[0]);
>> +	if (rc < 0) {
>> +		dev_err(&pdev->dev, "invalid sirq number in aspeed,lpc-interrupts > property\n");
>> +		goto err_clk_disable;
>> +	}
>> +
>> +	switch (sirq[1]) {
>> +	case IRQ_TYPE_LEVEL_LOW:
>> +		sirq_polarity = false;
>> +		break;
>> +	case IRQ_TYPE_LEVEL_HIGH:
>> +		sirq_polarity = true;
>> +		break;
>> +	default:
>> +		dev_err(&pdev->dev, "invalid sirq polarity in aspeed,lpc-interrupts
>> property\n");
>> +		rc = -EINVAL;
>> +		goto err_clk_disable;
>> +	}
>
>A bit ugly open-coding the mapping and error handling, maybe worth a helper?
>

Yeah, that sounds reasonable -- will do.

Thanks!


Zev

