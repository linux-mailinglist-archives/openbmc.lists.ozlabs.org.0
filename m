Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2092056C2
	for <lists+openbmc@lfdr.de>; Tue, 23 Jun 2020 18:05:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rrjS6WMCzDqLg
	for <lists+openbmc@lfdr.de>; Wed, 24 Jun 2020 02:05:48 +1000 (AEST)
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
 header.s=20161025 header.b=Djp5eFF2; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rrhZ2C1SzDqGW;
 Wed, 24 Jun 2020 02:05:01 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id i4so1749425pjd.0;
 Tue, 23 Jun 2020 09:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=do86B9M5tGDDUUM7bCWck23OCEcGEf6z7sPQe5ReWXM=;
 b=Djp5eFF2KkXJL5N4FbrLUF77gAhDcV09R7NzL5ZiUZr7l493GiFUA9Jc9AJumWB0JL
 ob3ddMttwYvBHNdejMqGHn4zkWNutODfSMB1EYsuy7gK0ctmTFc2MucxUSEHeAx0FXRo
 Kc1JsWyaBntbk3noEF/ZwfLnuWgOuxuAjUAJ3u2kdl9BDCczgLdYM1cAMaf1mGZVTDJR
 1AZ/IpnFSy2MIaiM9hm44WqPnMmLUBPcaxrGp/M09wKoBVJ70nzZx3c9GzJPM6aiFMBt
 2uKdTE+BtxVANIedKeQAVxL8ZgHHg5iw/HM72G98bbBmF0Oas6EoWDZUEfPaByY66sGa
 waeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=do86B9M5tGDDUUM7bCWck23OCEcGEf6z7sPQe5ReWXM=;
 b=KC6KaDAuY5s8ufyKXlV93CV5fdlhVOAQ82leS3AQSTw2gZIt6e2MNo+/+KgKgkuvqW
 6tPhoYtVe8qGC+ev+1c9Qkivdh8rhbVxftK0rplObY9Ek1viFtd39+7lDA5pkptVWfZ4
 N/Afoh13iYu5DXlIwLoP7664euqVxhdWSAHeRlUivJb3elUYYuqCvxK/4/q51Uq0yy7i
 vayV5oNcvN0ABujqWzGKNJyFczdvm/Iz0fL5lPGXGfeVDmDG1ObfeRCYuOeuULDp1QmH
 GEvDjFYBJq7ASQbbRlzqPs4S6YcPLNVvg0JHBr6KP29l3d1vSrrU9iB9QwhMU/nKhuYO
 tzfg==
X-Gm-Message-State: AOAM532eRHyLyClZup3P5JVU6y71KVDKsPgW+7OSQCoQtWrerHbGNQ5w
 D49ENGZrggYOooL/EzAuOVo=
X-Google-Smtp-Source: ABdhPJyYsFWWdMFAKz+pYWcsYlvkUt6KuY+lCjjy9egaWFdNP/Yb85qwbsEGoOOjI/3ToguBhuO5zQ==
X-Received: by 2002:a17:902:326:: with SMTP id
 35mr24612675pld.301.1592928297950; 
 Tue, 23 Jun 2020 09:04:57 -0700 (PDT)
Received: from cnn ([112.133.236.83])
 by smtp.gmail.com with ESMTPSA id 25sm17287060pfi.7.2020.06.23.09.04.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Jun 2020 09:04:54 -0700 (PDT)
Date: Tue, 23 Jun 2020 21:34:44 +0530
From: Manikandan <manikandan.hcl.ers.epl@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v6] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
Message-ID: <20200623160444.GA8945@cnn>
References: <20200622153727.GA9347@cnn> <20200623140711.GA208792@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623140711.GA208792@roeck-us.net>
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
 patrickw3@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jun 23, 2020 at 07:07:11AM -0700, Guenter Roeck wrote:
> On Mon, Jun 22, 2020 at 09:07:27PM +0530, Manikandan Elumalai wrote:
> > The adm1278 temp attribute need it for openbmc platform .
> > This feature not enabled by default, so PMON_CONFIG needs to enable it.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
> 
> Applied.

    Thanks Guenter.
> 
> Thanks,
> Guenter
> 
> > ---
> > v5 -> v6: 
> > add Reported-by in commit log
> > align commit and change log as per guidelines.
> > v4 -> v5: 
> > align commit and change log. 
> > v3 -> v4: 
> > kernel test robot CI warning
> > v2 -> v3: 
> > fix invalid signed-off.
> > removed checkpath warnings.
> > write ADM1278_TEMP1_EN and ADM1278_VOUT_EN conf in single line operation.
> > v1 -> v2: 
> > add Signed-off-by.
> > removed ADM1278_TEMP1_EN check.
> > 
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
