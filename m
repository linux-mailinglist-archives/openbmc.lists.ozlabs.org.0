Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 204711E84C8
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 19:31:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YWnM1c4XzDqjp
	for <lists+openbmc@lfdr.de>; Sat, 30 May 2020 03:31:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=L6RagwOn; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YWmZ4Ty0zDqf9;
 Sat, 30 May 2020 03:30:21 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id bg4so1425190plb.3;
 Fri, 29 May 2020 10:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dNC62Fp+vHRzfZ9HpoFGuvs+TLS5VQcLR5KjG2JpKpI=;
 b=L6RagwOn8yu9YUv3jRZKUekT2X3fEvfu+9HneUl/nZSDzuj8HZBD0FAAHFRoS+Og8p
 jDyx75IZQvBB2ReH8wWSgWO10Y0B5hwaqJDtH5UZ7n+hk8Hm9HwlZxy8993tOMzn5s3Z
 3plQcIJ1MeD/cdh16KPmCVi4qrnfuTF3lPlqp/4j38WC/xWZRq95Z2kaA1moNYb4rhVm
 dU7GQwHYIXnBTLkH4s/7jyjjC2TF0VBTUDg0ElJgQhStkIap1wLUQLS8vFp7W3x5Ags6
 QEedu6f9Zz8mSBQ/RpHJaUv/RTFa0oCPIZ1Nb935+KVjDrex0DwJ2AcrPNTbb23XwHmZ
 I2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=dNC62Fp+vHRzfZ9HpoFGuvs+TLS5VQcLR5KjG2JpKpI=;
 b=Onxv5Ix27+Vj8uByAfAe9Ob9FcqAsC9bTY0J8yEPxUa8tUSbsDJMEhtxUv3O3v2Mqz
 smJy2wmi4yk8RxJ44jy6UreH+jbJIK57FMYIeFm6I049emR1tyKWG9yz5fQfCmqsiXws
 UTf9zP+Hjfns1oXXcVh/KYYp0CHWQ/0F/kJ4GLQEyt57K6ogHcxhpTal8wDtgvo+vawJ
 WRwjKXM6W0uyqS6QsW+cdyohl++AwIzchG8qKZcEqibXKfap0PcEvUlYl79F6ge5T4a+
 FFzeqFxZhx6nEqAwRjNqQl41vg5Os3OlNNLYDUVlC/y+g08i9OHHWN66Wb5McEOlPiyW
 sTHw==
X-Gm-Message-State: AOAM5325BvK/EN9mCrx+9SeGaqy3iWaTnR/pES51SSnL+vUkaIFXZCO7
 nh9l4AkeDcUmB7Z5b1BRN8k=
X-Google-Smtp-Source: ABdhPJwvEPiMCyec0sDJOdvdJCD5v0MpfKaQ4COVZxEyWPbyhVUyhd6wN1pAtQZob6dNvAuDE25vqA==
X-Received: by 2002:a17:90a:de97:: with SMTP id
 n23mr10245546pjv.164.1590773419440; 
 Fri, 29 May 2020 10:30:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 e5sm7561217pfe.121.2020.05.29.10.30.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2020 10:30:18 -0700 (PDT)
Subject: Re: [PATCH v2] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
To: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>,
 linux-hwmon@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20200529124607.GA3469@cnn>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <49485085-7cc7-9e29-a719-98d1e184378b@roeck-us.net>
Date: Fri, 29 May 2020 10:30:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200529124607.GA3469@cnn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: manikandan.e@hcl.com, saipsdasari@fb.com, patrickw3@fb.com,
 vijaykhemka@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/29/20 5:46 AM, Manikandan Elumalai wrote:
> The adm1278 temperature sysfs attribute need it for one of the openbmc platform . 
> This functionality is not enabled by default, so PMON_CONFIG needs to be modified in order to enable it.
> 
> Signed-off-by   : Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>

This is not valid.

> 
> v2:
>    - Add Signed-off-by.
>    - Removed ADM1278_TEMP1_EN check.

checkpatch reports:

> ---WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#14:
The adm1278 temperature sysfs attribute need it for one of the openbmc platform .

CHECK: Alignment should match open parenthesis
#45: FILE: drivers/hwmon/pmbus/adm1275.c:679:
+		ret = i2c_smbus_write_byte_data(client,
+					ADM1275_PMON_CONFIG,

WARNING: suspect code indent for conditional statements (16, 16)
#47: FILE: drivers/hwmon/pmbus/adm1275.c:681:
+		if (ret < 0) {
+		dev_err(&client->dev,

ERROR: Missing Signed-off-by: line(s)

total: 1 errors, 2 warnings, 1 checks, 33 lines checked

Please follow published guidelines when submitting patches.

>  drivers/hwmon/pmbus/adm1275.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
> index 5caa37fb..ab5fceb 100644
> --- a/drivers/hwmon/pmbus/adm1275.c
> +++ b/drivers/hwmon/pmbus/adm1275.c
> @@ -666,7 +666,23 @@ static int adm1275_probe(struct i2c_client *client,
>  		tindex = 3;
>  
>  		info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
> -			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
> +			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
> +
> +		config = i2c_smbus_read_byte_data(client, ADM1275_PMON_CONFIG);
> +		if (config < 0)
> +			return config;
> +
> +		/* Enable TEMP1 by default */
> +		config |= ADM1278_TEMP1_EN;
> +		ret = i2c_smbus_write_byte_data(client,
> +					ADM1275_PMON_CONFIG,
> +					config);
> +		if (ret < 0) {
> +		dev_err(&client->dev,
> +			"Failed to enable temperature config\n");
> +		return -ENODEV;
> +		}

This can be handled in a single operation, together with ADM1278_VOUT_EN
below. There is no need for two separate write operations.

Guenter

> 
>  		/* Enable VOUT if not enabled (it is disabled by default) */
>  		if (!(config & ADM1278_VOUT_EN)) {
> @@ -681,9 +697,6 @@ static int adm1275_probe(struct i2c_client *client,
>  			}
>  		}
>  
> -		if (config & ADM1278_TEMP1_EN)
> -			info->func[0] |=
> -				PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
>  		if (config & ADM1278_VIN_EN)
>  			info->func[0] |= PMBUS_HAVE_VIN;
>  		break;
> 

