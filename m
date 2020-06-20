Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 556CF202188
	for <lists+openbmc@lfdr.de>; Sat, 20 Jun 2020 06:54:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pjxj41D7zDrVN
	for <lists+openbmc@lfdr.de>; Sat, 20 Jun 2020 14:54:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=manikandan.hcl.ers.epl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ltRuvf85; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pjx34pZZzDrV2;
 Sat, 20 Jun 2020 14:53:27 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id k2so5065269pjs.2;
 Fri, 19 Jun 2020 21:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=B7PIoTTOQyQgldJxXHjqhoJs7L5DCLB/7zFJYw2RHwI=;
 b=ltRuvf85ePzLXPA9VJ7V52Hj80K5bpNurQVyNrzWkeVO0bo0OhMMEhaBrHqpvdb/LV
 JdzzJiTuoQX104tXyFlUSq+AwHMXl49PRs4M9LTkbfu1mzYsVEstZwp4KBPl9YRc+nVv
 /Kcett2NEDZx1XZmPGE3BdH46Ft+ZfBSaj+3jC7sUlIzFaamOi/k50WtHsYiqJ9KAuHc
 fupBha5xjahlcHwNMsVb9hnrSwovy/n5JiiUoAbkwrOfo8+jeLWlntSPzsxQNrc5FxW/
 ZVUBwn6sPFEnkFFyi0d1vKZFTmwxv6fJdajBOk09lV47uw7S7+I1FB3IM6OfrrW/b4bv
 hKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=B7PIoTTOQyQgldJxXHjqhoJs7L5DCLB/7zFJYw2RHwI=;
 b=osqTeYQrU2XeW67jUklOFrPO+e+khurWXlIuhrlmT3A+RAc9W8+GzI/XLpL0HWyGbx
 zmUaIizGTL7qQ7VfradQ1Tsw7EhEnBOXjxU2qLsuH699jnXeOTzhBmKojR+hjfFQUmWT
 RKwbZBirdICwK1tk+5Sb5avSVuAJ3qIdHfELOo/kbDUFSnyZV6JtY8bHymgLGmZr4XHk
 A+bARrAEGKSP0hXW3Ih4TNwrnFokpPe+FOCggx38sao/GcPHd9KCYml3SllDjimwUR0A
 8nFiQ2PGEyYWtv/lUEOWEmRclEHjjA//LwoQOnkUTvFU+DoWEHGKCjPk4WNsWvw8rzw1
 VPag==
X-Gm-Message-State: AOAM530kOJVqorVD+hIsF0t3mWj1gRECtJDYMI9Pa9jr+v0fXTnyj+Bl
 FnjzpvLY8uJsgAW+g8gQrSM=
X-Google-Smtp-Source: ABdhPJx60JlTio6X5TeMTvbcHmjWmItMTHId0bmJ1mg3mZWmcXZueo/W2SKBXPD8HoWn6WQSgHKJFQ==
X-Received: by 2002:a17:90a:260e:: with SMTP id
 l14mr6952700pje.76.1592628803420; 
 Fri, 19 Jun 2020 21:53:23 -0700 (PDT)
Received: from cnn ([112.133.236.114])
 by smtp.gmail.com with ESMTPSA id y81sm7445212pfb.33.2020.06.19.21.53.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jun 2020 21:53:22 -0700 (PDT)
Date: Sat, 20 Jun 2020 10:23:15 +0530
From: Manikandan <manikandan.hcl.ers.epl@gmail.com>
To: miltonm@us.ibm.com
Subject: Re: Linux-aspeed Digest, Vol 37, Issue 25
Message-ID: <20200620045315.GA27844@cnn>
References: <mailman.1431.1592592073.26230.linux-aspeed@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mailman.1431.1592592073.26230.linux-aspeed@lists.ozlabs.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
 patrickw3@fb.com, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Jun 20, 2020 at 04:41:13AM +1000, linux-aspeed-request@lists.ozlabs.org wrote:
> Send Linux-aspeed mailing list submissions to
> 	linux-aspeed@lists.ozlabs.org
> 
> To subscribe or unsubscribe via the World Wide Web, visit
> 	https://lists.ozlabs.org/listinfo/linux-aspeed
> or, via email, send a message with subject or body 'help' to
> 	linux-aspeed-request@lists.ozlabs.org
> 
> You can reach the person managing the list at
> 	linux-aspeed-owner@lists.ozlabs.org
> 
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of Linux-aspeed digest..."
> 
> 
> Today's Topics:
> 
>    1. [PATCH v4] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
>       (Manikandan Elumalai)
>    2. Re: [PATCH v4] hwmon:(adm1275) Enable adm1278
>       ADM1278_TEMP1_EN (Guenter Roeck)
>    3. [PATCH v4] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
>       (Manikandan Elumalai)
>    4. Re:  [PATCH v4] hwmon:(adm1275) Enable adm1278
>       ADM1278_TEMP1_EN (Milton Miller II)
>    5. Re: [PATCH v4] hwmon:(adm1275) Enable adm1278
>       ADM1278_TEMP1_EN (Guenter Roeck)
> 
> 
> ----------------------------------------------------------------------
> 
> Message: 1
> Date: Fri, 19 Jun 2020 20:18:53 +0530
> From: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
> To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare
> 	<jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
> 	linux-kernel@vger.kernel.org
> Cc: saipsdasari@fb.com, patrickw3@fb.com, vijaykhemka@fb.com,
> 	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
> 	manikandan.e@hcl.com
> Subject: [PATCH v4] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
> Message-ID: <20200619144853.GA18271@cnn>
> Content-Type: text/plain; charset=us-ascii
> 
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
> 
> 
> ------------------------------
> 
> Message: 2
> Date: Fri, 19 Jun 2020 08:38:32 -0700
> From: Guenter Roeck <linux@roeck-us.net>
> To: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
> Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
> 	linux-kernel@vger.kernel.org, saipsdasari@fb.com, patrickw3@fb.com,
> 	vijaykhemka@fb.com, linux-aspeed@lists.ozlabs.org,
> 	openbmc@lists.ozlabs.org, manikandan.e@hcl.com
> Subject: Re: [PATCH v4] hwmon:(adm1275) Enable adm1278
> 	ADM1278_TEMP1_EN
> Message-ID: <20200619153832.GA57109@roeck-us.net>
> Content-Type: text/plain; charset=us-ascii
> 
> On Fri, Jun 19, 2020 at 08:18:53PM +0530, Manikandan Elumalai wrote:
> > The adm1278 temp attribute need it for openbmc platform .
> > This feature not enabled by default, so PMON_CONFIG needs to enable it.
> > 
> > v4:
> > ---
> > Reported-by: kernel test robot <lkp@intel.com>
> > v3:
> > ----
> > fix invalid signed-off.
> > removed checkpath warnings.
> > write ADM1278_TEMP1_EN and ADM1278_VOUT_EN conf in single line operation.
> > v2:
> > ----
> > add Signed-off-by.
> > removed ADM1278_TEMP1_EN check.
> > 
> > Signed-off-by: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
> 
> The problem is that this is after '---', meaning it is considered a comment.
> The Signed-off-by: tag needs to be located before the first '---'.
> The change log should not be part of the commit log and follow '---'.
> 
> Guenter
> 
> > ---
> >  drivers/hwmon/pmbus/adm1275.c | 12 +++++-------
> >  1 file changed, 5 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
> > index 5caa37fb..d4e1925 100644
> > --- a/drivers/hwmon/pmbus/adm1275.c
> > +++ b/drivers/hwmon/pmbus/adm1275.c
> > @@ -666,11 +666,12 @@ static int adm1275_probe(struct i2c_client *client,
> >  		tindex = 3;
> >  
> >  		info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
> > -			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
> > +			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> > +			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
> >  
> > -		/* Enable VOUT if not enabled (it is disabled by default) */
> > -		if (!(config & ADM1278_VOUT_EN)) {
> > -			config |= ADM1278_VOUT_EN;
> > +		/* Enable VOUT & TEMP1 if not enabled (disabled by default) */
> > +		if ((config & (ADM1278_VOUT_EN | ADM1278_TEMP1_EN)) != (ADM1278_VOUT_EN | ADM1278_TEMP1_EN)) {
> > +			config |= ADM1278_VOUT_EN | ADM1278_TEMP1_EN;
> >  			ret = i2c_smbus_write_byte_data(client,
> >  							ADM1275_PMON_CONFIG,
> >  							config);
> > @@ -681,9 +682,6 @@ static int adm1275_probe(struct i2c_client *client,
> >  			}
> >  		}
> >  
> > -		if (config & ADM1278_TEMP1_EN)
> > -			info->func[0] |=
> > -				PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
> >  		if (config & ADM1278_VIN_EN)
> >  			info->func[0] |= PMBUS_HAVE_VIN;
> >  		break;
> > -- 
> > 2.7.4
> > 
> 
> 
> ------------------------------
> 
> Message: 3
> Date: Fri, 19 Jun 2020 22:21:54 +0530
> From: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
> To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare
> 	<jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
> 	linux-kernel@vger.kernel.org
> Cc: saipsdasari@fb.com, patrickw3@fb.com, vijaykhemka@fb.com,
> 	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
> 	manikandan.e@hcl.com
> Subject: [PATCH v4] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
> Message-ID: <20200619165154.GA20461@cnn>
> Content-Type: text/plain; charset=us-ascii
> 
> The adm1278 temp attribute need it for openbmc platform .
> This feature not enabled by default, so PMON_CONFIG needs to enable it.
> 
> Signed-off-by: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
> ---
> ---    v4 -Reported-by: kernel test robot <lkp@intel.com>
> ---    v3 -fix invalid signed-off.
> ---       -removed checkpath warnings.
> ---       -write ADM1278_TEMP1_EN and ADM1278_VOUT_EN conf in single line operation.
> ---    v2 -add Signed-off-by.
> ---       -removed ADM1278_TEMP1_EN check.
> ---
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
> 
> 
> ------------------------------
> 
> Message: 4
> Date: Fri, 19 Jun 2020 18:09:55 +0000
> From: "Milton Miller II" <miltonm@us.ibm.com>
> To: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>, Jean Delvare
> 	<jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
> 	linux-kernel@vger.kernel.org, manikandan.e@hcl.com,
> 	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
> 	vijaykhemka@fb.com, saipsdasari@fb.com, patrickw3@fb.com
> Subject: Re:  [PATCH v4] hwmon:(adm1275) Enable adm1278
> 	ADM1278_TEMP1_EN
> Message-ID:
> 	<OFB20C104E.283BBF6D-ON0025858C.0062CC5B-0025858C.0063C8F2@notes.na.collabserv.com>
> 	
> Content-Type: text/plain; charset=UTF-8
> 
> On : 06/19/2020 abiout 12:46PM in some timezone,  Manikandan Elumalai  wrote:
> 
> >The adm1278 temp attribute need it for openbmc platform .
> >This feature not enabled by default, so PMON_CONFIG needs to enable
> >it.
> >
> >Signed-off-by: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
> >---
> >---    v4 -Reported-by: kernel test robot <lkp@intel.com>
> 
> Thie above tag should be Adjacent to the Signed-off-by.

     Thanks for review Milton.I will update new patch v6.
> 
> >---    v3 -fix invalid signed-off.
> >---       -removed checkpath warnings.
> >---       -write ADM1278_TEMP1_EN and ADM1278_VOUT_EN conf in single
> >line operation.
> >---    v2 -add Signed-off-by.
> >---       -removed ADM1278_TEMP1_EN check.
> >---
> 
> The canonical format is to have a line of 3 dashes then the trailing changelog 
> 
  will do.
> Please read the documentation at 
> 
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#the-canonical-patch-format
> 
> milton
> 
> 
> 
> ------------------------------
> 
> Message: 5
> Date: Fri, 19 Jun 2020 11:41:03 -0700
> From: Guenter Roeck <linux@roeck-us.net>
> To: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>, Jean
> 	Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
> 	linux-kernel@vger.kernel.org
> Cc: saipsdasari@fb.com, patrickw3@fb.com, vijaykhemka@fb.com,
> 	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
> 	manikandan.e@hcl.com
> Subject: Re: [PATCH v4] hwmon:(adm1275) Enable adm1278
> 	ADM1278_TEMP1_EN
> Message-ID: <fa65b6de-b7ea-894b-7fd1-47676cc3c705@roeck-us.net>
> Content-Type: text/plain; charset=utf-8
> 
> On 6/19/20 9:51 AM, Manikandan Elumalai wrote:
> > The adm1278 temp attribute need it for openbmc platform .
> > This feature not enabled by default, so PMON_CONFIG needs to enable it.
> > 
> > Signed-off-by: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
> 
> In addition to the other comment - please never send a new version of a patch
> with the same sequence number. There are now two different versions of this patch,
> both tagged "v4".
> 
> Guenter
> 
> > ---
> > ---    v4 -Reported-by: kernel test robot <lkp@intel.com>
> > ---    v3 -fix invalid signed-off.
> > ---       -removed checkpath warnings.
> > ---       -write ADM1278_TEMP1_EN and ADM1278_VOUT_EN conf in single line operation.
> > ---    v2 -add Signed-off-by.
> > ---       -removed ADM1278_TEMP1_EN check.
> > ---
> > ---
> >  drivers/hwmon/pmbus/adm1275.c | 12 +++++-------
> >  1 file changed, 5 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
> > index 5caa37fb..d4e1925 100644
> > --- a/drivers/hwmon/pmbus/adm1275.c
> > +++ b/drivers/hwmon/pmbus/adm1275.c
> > @@ -666,11 +666,12 @@ static int adm1275_probe(struct i2c_client *client,
> >  		tindex = 3;
> >  
> >  		info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
> > -			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
> > +			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> > +			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
> >  
> > -		/* Enable VOUT if not enabled (it is disabled by default) */
> > -		if (!(config & ADM1278_VOUT_EN)) {
> > -			config |= ADM1278_VOUT_EN;
> > +		/* Enable VOUT & TEMP1 if not enabled (disabled by default) */
> > +		if ((config & (ADM1278_VOUT_EN | ADM1278_TEMP1_EN)) != (ADM1278_VOUT_EN | ADM1278_TEMP1_EN)) {
> > +			config |= ADM1278_VOUT_EN | ADM1278_TEMP1_EN;
> >  			ret = i2c_smbus_write_byte_data(client,
> >  							ADM1275_PMON_CONFIG,
> >  							config);
> > @@ -681,9 +682,6 @@ static int adm1275_probe(struct i2c_client *client,
> >  			}
> >  		}
> >  
> > -		if (config & ADM1278_TEMP1_EN)
> > -			info->func[0] |=
> > -				PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
> >  		if (config & ADM1278_VIN_EN)
> >  			info->func[0] |= PMBUS_HAVE_VIN;
> >  		break;
> > 
> 
> 
> 
> ------------------------------
> 
> Subject: Digest Footer
> 
> _______________________________________________
> Linux-aspeed mailing list
> Linux-aspeed@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/linux-aspeed
> 
> 
> ------------------------------
> 
> End of Linux-aspeed Digest, Vol 37, Issue 25
> ********************************************
