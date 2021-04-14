Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 502A735F366
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 14:21:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FL1my13x7z30Gj
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 22:21:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=eqLzLdr9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32e;
 helo=mail-ot1-x32e.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eqLzLdr9; dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FL1mg1hw9z2yRW;
 Wed, 14 Apr 2021 22:21:37 +1000 (AEST)
Received: by mail-ot1-x32e.google.com with SMTP id
 v19-20020a0568300913b029028423b78c2dso10515701ott.8; 
 Wed, 14 Apr 2021 05:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=02BMsB15iI+PWQUPoeumqyghFPOPvXSDGERlBfTrle0=;
 b=eqLzLdr9Pjk3+/8iLROe0LWoHNgDJdbtV2No1HXQDTNvqcRqUrQgDcV3hCGtuqXghv
 XLK7ZJPiR0Y1xcr69vSjt2tXkhSzFk0Tho5f6L1ztMDaN9UhrjCP0LA8+Jhc/mgpMF2r
 x4qs9jXapleWSHFcPbWx7OD0fLNiuRivrpoTLDYBtTwUXH8yYcDOA1xq8n5feqJXfqXR
 GgOBeNNjT27Sg+f418+WU5RA6mplCs7zUU5E9C6EwIyiYewhsWwGJWsRq5ixE45W6K5w
 VyDBKlU5E03+/YVpmkIeDJlxm+CzNsDSyDkH0VSeIzPHC5SyyULbZdMI7SCKi+A+Aggw
 m1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=02BMsB15iI+PWQUPoeumqyghFPOPvXSDGERlBfTrle0=;
 b=kiDh8ztS9d3n3/urQF3l1kmgoSvnz9NuKlfqe1AvkiowZB/Y9zt0OVHexvmQ555m2Z
 vMdBL34wxY8rxoKUiSCCEfA6huZFVoby5JGvG9zMb4msF4CfsPf668lEFOqi74UBG0rD
 SWfWCvhX3TAylcPoYCMeO9BGpibdOaNJqPk9crE05dRwimhg85YFfQDcnK5TT8sGkQT4
 M4wRPhExhTz0CGR9HXID+0NHT1YQS0JddkytK1uUhJNtEmdbE7zezxIDAyvTfE3TuZFr
 wh3REgSFXsThFOuoBzlIhwUmmVcljM7lkix097X5lCSv9a1IIMRaFJq7ZEqzDPzHsqun
 UosA==
X-Gm-Message-State: AOAM531cBabDkcZA45WNJ4d7+UeRGi/ajN+VVXfiAy/9bgrkyWO/M7WF
 C0YZ/cvnUCwP5BcNS8Q98A4=
X-Google-Smtp-Source: ABdhPJyaEkd7Bdabm6n+YdK3vbAc6GAFpNYwFaWwjPJxTyGPjj2SXBEQeNBvahJJ9wQDTSEEHyw3aQ==
X-Received: by 2002:a9d:4613:: with SMTP id y19mr4685326ote.262.1618402892746; 
 Wed, 14 Apr 2021 05:21:32 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id m127sm3495702oib.32.2021.04.14.05.21.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 14 Apr 2021 05:21:32 -0700 (PDT)
Date: Wed, 14 Apr 2021 05:21:30 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v3 2/4] mfd: simple-mfd-i2c: Adds Ampere's Altra SMpro
 support
Message-ID: <20210414122130.GA113503@roeck-us.net>
References: <20210409031332.21919-1-quan@os.amperecomputing.com>
 <20210409031332.21919-3-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409031332.21919-3-quan@os.amperecomputing.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
 Lee Jones <lee.jones@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Apr 09, 2021 at 10:13:30AM +0700, Quan Nguyen wrote:
> Adds an MFD driver for SMpro found on the Mt.Jade hardware reference
> platform with Ampere's Altra processor family.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  drivers/mfd/Kconfig          | 10 ++++++++++
>  drivers/mfd/simple-mfd-i2c.c |  6 ++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index d07e8cf93286..f7a6460f7aa0 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -77,6 +77,16 @@ config MFD_AS3711
>  	help
>  	  Support for the AS3711 PMIC from AMS
>  
> +config MFD_SMPRO
> +	tristate "Ampere Computing MFD SMpro core driver"
> +	select MFD_SIMPLE_MFD_I2C

This is missing "depends on I2C".

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
> index 87f684cff9a1..9a44655f5592 100644
> --- a/drivers/mfd/simple-mfd-i2c.c
> +++ b/drivers/mfd/simple-mfd-i2c.c
> @@ -21,6 +21,11 @@ static const struct regmap_config simple_regmap_config = {
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
> @@ -39,6 +44,7 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
>  
>  static const struct of_device_id simple_mfd_i2c_of_match[] = {
>  	{ .compatible = "kontron,sl28cpld" },
> +	{ .compatible = "ampere,smpro", .data = &simple_word_regmap_config },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, simple_mfd_i2c_of_match);
