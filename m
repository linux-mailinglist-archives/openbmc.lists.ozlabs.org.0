Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B70201987
	for <lists+openbmc@lfdr.de>; Fri, 19 Jun 2020 19:36:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pQvM0wL0zDqjc
	for <lists+openbmc@lfdr.de>; Sat, 20 Jun 2020 03:35:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HWs0f5DT; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pNHz1XbzzDqB2;
 Sat, 20 Jun 2020 01:38:38 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id y18so4068796plr.4;
 Fri, 19 Jun 2020 08:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=30oGrPF+Hf+5fkIfi8X9FX6JFyI5zPvG3i5GYaL/ATM=;
 b=HWs0f5DTlCe6wHSZpD0Kx7AlT2503FFuRMQCa52JL282WLeUj2vXNmK8TQkzIwv8Kp
 vwanqqR3iyR6IyftI0dVCMwlfh7vd0xBu9LZjOChvzKnDrpyupvb6O5PdGPYUNu0q26F
 XUgIKRC9GSHJyD0FcRzyFFCiDCIjuG1mb+SUWAGIvDHubTxWeXM3l+drjzE/DSBuC3Wp
 Shx0/aWeKApDjKJkPijjilf0AXi0ExE0n5H5mNoriUzq+HSvHDpSfnPNhfGRL8izRiFJ
 3DDQvree2SB+ScvFIv+0LFwfDQmAXtzvr/Ipf2cS0TKv0X8r6mht2D16CtYIIZ54JOJh
 0Qqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=30oGrPF+Hf+5fkIfi8X9FX6JFyI5zPvG3i5GYaL/ATM=;
 b=OJ5TuBf4alNeLJEyVdASgyydZ6A4O3WGcdyjl3urI/Ran9aRoqjxdsGeGzM8JRqdKS
 O9uh9AOd7sK2Ucyybb0My9HclR3GnXNOQ7a52vDHRMy+425k+lIKBN8MasYIrK53SeVt
 Cqsu9NdNAxPQwmtmwmO+iY5ZFasxia74AKoszrLBsCgoltsUzqJ4vEBzrfWGQ5V+EuSR
 PlZYwd9jyxYAS5UeZ2kFvw0x+8z7YtS8qMxEaUnztpIVAr0vlzXVEVBSmSqqw+zXJz3s
 XCmx2cPSrNd8UyhYaXP5MHbvAZBF1KErq9C0DribUT/krSajP+sNZLfu4mksSQklmufO
 wkWw==
X-Gm-Message-State: AOAM5304xcP7XcF5x+riP4ovZc5brwYijqyjG715+qs8lEIFD3OzEn/O
 oAZvxfKl8CgCo+1v/Hwcdwc=
X-Google-Smtp-Source: ABdhPJwNrLmfds9PVZ5VRHfJd3aIUKqd9W9ZW/0qWo/rH6dJ+grD/00L85ejW7y9jsBMojLxMKA0aQ==
X-Received: by 2002:a17:90a:a58b:: with SMTP id
 b11mr4251156pjq.107.1592581114582; 
 Fri, 19 Jun 2020 08:38:34 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id m14sm5511417pgt.6.2020.06.19.08.38.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 19 Jun 2020 08:38:33 -0700 (PDT)
Date: Fri, 19 Jun 2020 08:38:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
Subject: Re: [PATCH v4] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
Message-ID: <20200619153832.GA57109@roeck-us.net>
References: <20200619144853.GA18271@cnn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200619144853.GA18271@cnn>
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 manikandan.e@hcl.com, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, patrickw3@fb.com, saipsdasari@fb.com,
 vijaykhemka@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jun 19, 2020 at 08:18:53PM +0530, Manikandan Elumalai wrote:
> The adm1278 temp attribute need it for openbmc platform .
> This feature not enabled by default, so PMON_CONFIG needs to enable it.
> 
> v4:
> ---
> Reported-by: kernel test robot <lkp@intel.com>
> v3:
> ----
> fix invalid signed-off.
> removed checkpath warnings.
> write ADM1278_TEMP1_EN and ADM1278_VOUT_EN conf in single line operation.
> v2:
> ----
> add Signed-off-by.
> removed ADM1278_TEMP1_EN check.
> 
> Signed-off-by: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>

The problem is that this is after '---', meaning it is considered a comment.
The Signed-off-by: tag needs to be located before the first '---'.
The change log should not be part of the commit log and follow '---'.

Guenter

> ---
>  drivers/hwmon/pmbus/adm1275.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
> index 5caa37fb..d4e1925 100644
> --- a/drivers/hwmon/pmbus/adm1275.c
> +++ b/drivers/hwmon/pmbus/adm1275.c
> @@ -666,11 +666,12 @@ static int adm1275_probe(struct i2c_client *client,
>  		tindex = 3;
>  
>  		info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
> -			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
> +			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
>  
> -		/* Enable VOUT if not enabled (it is disabled by default) */
> -		if (!(config & ADM1278_VOUT_EN)) {
> -			config |= ADM1278_VOUT_EN;
> +		/* Enable VOUT & TEMP1 if not enabled (disabled by default) */
> +		if ((config & (ADM1278_VOUT_EN | ADM1278_TEMP1_EN)) != (ADM1278_VOUT_EN | ADM1278_TEMP1_EN)) {
> +			config |= ADM1278_VOUT_EN | ADM1278_TEMP1_EN;
>  			ret = i2c_smbus_write_byte_data(client,
>  							ADM1275_PMON_CONFIG,
>  							config);
> @@ -681,9 +682,6 @@ static int adm1275_probe(struct i2c_client *client,
>  			}
>  		}
>  
> -		if (config & ADM1278_TEMP1_EN)
> -			info->func[0] |=
> -				PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
>  		if (config & ADM1278_VIN_EN)
>  			info->func[0] |= PMBUS_HAVE_VIN;
>  		break;
> -- 
> 2.7.4
> 
