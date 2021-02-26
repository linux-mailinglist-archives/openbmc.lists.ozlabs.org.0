Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE61325F0B
	for <lists+openbmc@lfdr.de>; Fri, 26 Feb 2021 09:31:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dn2v0124Sz3cZx
	for <lists+openbmc@lfdr.de>; Fri, 26 Feb 2021 19:31:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=veP2th8n;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32d;
 helo=mail-wm1-x32d.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=veP2th8n; dkim-atps=neutral
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dn2tj6Wkzz30KP
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2021 19:31:23 +1100 (AEDT)
Received: by mail-wm1-x32d.google.com with SMTP id k66so7025647wmf.1
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2021 00:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=6d55hczQ7yC4fvKZlIJyccsSIieP5h08F8ol4aHjDSk=;
 b=veP2th8n5/TCGhbAfadppIk6moovuPbnwz7txyIrcjYmTIlvQzaCm4g5KjCoHrQXKH
 NUBVtOlP1i059ojGBq/mkxtq6yEH6qB76l8PmIzWjMTrEJzVCQCEed/BbLN9ioQSJb4P
 u6bijGkY8Iq6GlEY3eqFpWBSyq0rT/htytRoRZKhg8VuaBg3vJgIoHT8yKnbNe3D27fi
 lwX/YIPHXcEd9aqCqW+e38UGEfPetvDMUVvvUfkDAlBbCchQEnljAgP+1IT3ovHNsbfh
 hh0KEGn6ex6Fbwa/8tyvYqS3uQ45Oi9EzBiLGP15g2st4h338LSrA1M4aJCmZYEzWocj
 IwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6d55hczQ7yC4fvKZlIJyccsSIieP5h08F8ol4aHjDSk=;
 b=r8zo9EA3bFGaEH+zwOTNm/A5XWVcvrsYvranMN+uuvNbRWu/bV41i3rix9n9qM/3p/
 DZp0sTfygc9vEHnxrGn+pZ6a8xwHdIjkzzN9whBxO0EgbGA9oAeHEzRiNSR7iurAK0Dx
 CkRkEZwguDNPGpyw4vImZqqRWZdaPrAAgD9kwXFyOCFKFgKg3N7EyQwfTkpLFqkvbzzz
 Q7EhUWRBJatoCqm0Hp7snD7oP7lyC8JmAXppOzeNJ23HW6TdP2/KFB1sVrcr7tQCLGUI
 bBkZRMngeh+RyRw2o2FOsS/mZZMxh0xZJ40vpGVLJ9Y0ss2OFr9IKbqQnrQgcwV7GhGr
 /0Fw==
X-Gm-Message-State: AOAM533ylpB3Hv343Vs8/LMQjE9EyTqgY2ud8NY4Lbb3dfLJl7gidu8/
 28D8PHILyO3fTqwhy5Sxeq+REQ==
X-Google-Smtp-Source: ABdhPJyNNPBJL8zVQ1bzYzDTc8Boiu+FQOindWJ9jhjeB/7vXL8rqC5WnS5NurawlXFFVEQ8EzTLXw==
X-Received: by 2002:a05:600c:4c17:: with SMTP id
 d23mr1638944wmp.116.1614328276858; 
 Fri, 26 Feb 2021 00:31:16 -0800 (PST)
Received: from dell ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w13sm13617941wre.2.2021.02.26.00.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 00:31:16 -0800 (PST)
Date: Fri, 26 Feb 2021 08:31:14 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH 2/4] mfd: simple-mfd-i2c: Adds Ampere's Altra SMpro support
Message-ID: <20210226083114.GE641347@dell>
References: <20210225101854.13896-1-quan@os.amperecomputing.com>
 <20210225101854.13896-3-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210225101854.13896-3-quan@os.amperecomputing.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, linux-aspeed@lists.ozlabs.org,
 Jonathan Corbet <corbet@lwn.net>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>,
 Open Source Submission <patches@amperecomputing.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 25 Feb 2021, Quan Nguyen wrote:

> Adds an MFD driver for SMpro found on the Mt.Jade hardware reference
> platform with Ampere's Altra processor family.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
>  drivers/mfd/Kconfig          | 10 ++++++++++
>  drivers/mfd/simple-mfd-i2c.c | 15 +++++++++++++--
>  2 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index b74efa469e90..5414371bdea1 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -77,6 +77,16 @@ config MFD_AS3711
>  	help
>  	  Support for the AS3711 PMIC from AMS
>  
> +config MFD_SMPRO
> +	tristate "Ampere Computing MFD SMpro core driver"
> +	select MFD_SIMPLE_MFD_I2C

Nice to see another user here.

> +	help
> +	  Say yes here to enable SMpro driver support for Ampere's Altra
> +	  processor family.
> +
> +	  Ampere's Altra SMpro exposes an I2C regmap interface that can
> +	  be accessed by child devices.
> +
>  config MFD_AS3722
>  	tristate "ams AS3722 Power Management IC"
>  	select MFD_CORE
> diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
> index 87f684cff9a1..0459a9fbd3f5 100644
> --- a/drivers/mfd/simple-mfd-i2c.c
> +++ b/drivers/mfd/simple-mfd-i2c.c
> @@ -21,14 +21,24 @@ static const struct regmap_config simple_regmap_config = {
>  	.val_bits = 8,
>  };
>  
> +static const struct regmap_config simple_word_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 16,
> +};
> +
>  static int simple_mfd_i2c_probe(struct i2c_client *i2c)
>  {
>  	const struct regmap_config *config;
>  	struct regmap *regmap;
>  
>  	config = device_get_match_data(&i2c->dev);
> -	if (!config)
> -		config = &simple_regmap_config;
> +	if (!config) {
> +		if (of_device_is_compatible(i2c->dev.of_node,
> +						"ampere,ac01-smpro"))

Could you use 'struct of_device_id's .data attribute instead please?

> +			config = &simple_word_regmap_config;
> +		else
> +			config = &simple_regmap_config;
> +	}
>  
>  	regmap = devm_regmap_init_i2c(i2c, config);
>  	if (IS_ERR(regmap))
> @@ -39,6 +49,7 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
>  
>  static const struct of_device_id simple_mfd_i2c_of_match[] = {
>  	{ .compatible = "kontron,sl28cpld" },
> +	{ .compatible = "ampere,ac01-smpro" },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, simple_mfd_i2c_of_match);

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
