Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E67205425
	for <lists+openbmc@lfdr.de>; Tue, 23 Jun 2020 16:09:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rp6d0mBXzDqTF
	for <lists+openbmc@lfdr.de>; Wed, 24 Jun 2020 00:08:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EuAFCMQ2; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rp4h3gkrzDqSY;
 Wed, 24 Jun 2020 00:07:15 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id cm23so1548750pjb.5;
 Tue, 23 Jun 2020 07:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cttTzLCbCwpPg7ZMsejcbzGgViOl4PIxIz/Vo6n6yx8=;
 b=EuAFCMQ2IYPM4zt/5UM3gO/o0wbS3vB78wogrigM17bZXuhr7nDHnuDrsUkkVCSJI0
 KINJG+io/pgFAvybGQ5Bm4yrjCjDi1nVvYTiqEmoheG9wNFEDjZseJivoXgqY+8vSogg
 RA9vrnSWi0+F8zYHR6dRGykUgnqHxEaNklvupYkm4crnYNSQ9SKK7m19C+z8QrnCb6PO
 AnxMZnNUD8Guenmp4tSEPhuP0F9aB1mCVRnGX699Ep7bohjP9NmAcGQIcvj743rA1cVk
 BHALYs0va2SMbRPmaY0DaG8TeGv28XfRRkp28JeK5NaTpXIns8Wdi24XY4XmlQJ1XCEo
 L+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=cttTzLCbCwpPg7ZMsejcbzGgViOl4PIxIz/Vo6n6yx8=;
 b=ivVmQcTE2VRe+2Jn1DCbajvOK8itHlDaxPdFuzO511H7kCnw0MXQDZkVN2bRkGH4zt
 +kpCnbWP2WwOdGrH4tYkzS8S035Ok6R+SkYWqikTdoEAtkuLUsPb9AwLFdSirygxzldM
 2w1twEpQ+csrJ67HnicyExsLUoZ0nz2K6knOkJ5x/0k/V47thNNgt+Bt6EaPjLdwbFz0
 U8X/eULjRR4tdaCCRf1EOLuYO2bobb+FTnbvncy3CaCnKMr4Kr/7P7OxuDWrYv40BXgn
 VJK+ziC0KH5zhIl8FnzrakVZWqT56MENsR6AtdV9p1dyEoIr/greIvoT18EGCUKrViPP
 8tlQ==
X-Gm-Message-State: AOAM530QI4xP+BdFq7NfXJ46VYGEniURW85Pg/Al28OCTYQzJT3docGN
 J+Z9msaR5/aEUNG8Aol/3cI=
X-Google-Smtp-Source: ABdhPJxVTbxY5KpaXYKS85YawQwpDMsPr7j/LysIzR4sGztdbV4yNnW1jHt0dWbN0eIRFNJdkWUmig==
X-Received: by 2002:a17:902:ac8f:: with SMTP id
 h15mr15563105plr.238.1592921232496; 
 Tue, 23 Jun 2020 07:07:12 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id n8sm14688537pgi.18.2020.06.23.07.07.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Jun 2020 07:07:11 -0700 (PDT)
Date: Tue, 23 Jun 2020 07:07:11 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
Subject: Re: [PATCH v6] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
Message-ID: <20200623140711.GA208792@roeck-us.net>
References: <20200622153727.GA9347@cnn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622153727.GA9347@cnn>
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
 linux-kernel@vger.kernel.org, vijaykhemka@fb.com, saipsdasari@fb.com,
 patrickw3@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jun 22, 2020 at 09:07:27PM +0530, Manikandan Elumalai wrote:
> The adm1278 temp attribute need it for openbmc platform .
> This feature not enabled by default, so PMON_CONFIG needs to enable it.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>

Applied.

Thanks,
Guenter

> ---
> v5 -> v6: 
> add Reported-by in commit log
> align commit and change log as per guidelines.
> v4 -> v5: 
> align commit and change log. 
> v3 -> v4: 
> kernel test robot CI warning
> v2 -> v3: 
> fix invalid signed-off.
> removed checkpath warnings.
> write ADM1278_TEMP1_EN and ADM1278_VOUT_EN conf in single line operation.
> v1 -> v2: 
> add Signed-off-by.
> removed ADM1278_TEMP1_EN check.
> 
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
