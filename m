Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B831EFF9D
	for <lists+openbmc@lfdr.de>; Fri,  5 Jun 2020 20:05:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49drDC4scfzDr0w
	for <lists+openbmc@lfdr.de>; Sat,  6 Jun 2020 04:05:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=X12vqK2P; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49drCG36CbzDr0x;
 Sat,  6 Jun 2020 04:04:56 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id s23so4011358pfh.7;
 Fri, 05 Jun 2020 11:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Gl4m6hVinnfFSKepS1HCmQPY0u24GAicu5wcvYMKZIw=;
 b=X12vqK2PGSjxkksfrv2pFiM4EphDGJtMVGEYh8JCcpK34XvZXmzF76euZWI7GBZc4Y
 6YF41JWbC8tjp2fB7ZNZQFWGcNb1XAkjTy+syWo66mQc56ZLazixBXle6Ab3j8GImT6r
 +fCufvtPbAMzBzzq64/8u66R10CrSeBuoyrqx5QASpKH0DI6vBAy589edsq3PUEBhxR0
 FHCOWrE4EFE+84b1zWV3mAei+AVsSMjzoR/+FuQRjAMBXXB4huFzlrPVdzb67xy1CzxD
 j/a1MscIATO6nxxl1EhYVmoOU/dchXkbofvSEce3z11okM0IxQNYejDdhgLVVwxhaMXT
 XHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Gl4m6hVinnfFSKepS1HCmQPY0u24GAicu5wcvYMKZIw=;
 b=uVuDnLXj0LJIg4N3pse1jKmv8gG47Tw83Q9jcZ6v1F0wsBpYvOlY83p/wLGG9hyjeN
 1BQz7thUcIqgbuy26vIRUnvT6D/woNp4t5zYjLhcC/9N6OGmjozpTnM4fQQ4X7dRoKBc
 gNDva6zpvKxd0GkUYnyME++Wgs4xVia0z70wZPEFwgWPoBx0laodSqM6FELWxWzLZebR
 mlpuH8ZeoUN7FUxuUoYV6/JeU9N1mU7top4R5eKihbNehjLVnLSQngT3Ne0Ri7wlhXf0
 nF6Mkbs2ie/IRDJnufaSCOYXKb8ZBD2Ep8F5YSn2c8S6iPnY0AcZhRdUFBCI3ePsXa5s
 BlmQ==
X-Gm-Message-State: AOAM532Fz0k2kL5PiQ2imRyrfIjHjfaqq973vTW/0CdUeA6Ce1AIsrPR
 4GcXzWo6lbfRtJTq6OVzRJI=
X-Google-Smtp-Source: ABdhPJwgCcoTPGG55GUhS7/TIb6qAwSriEDk4pDmFHrsijuGGztrWxmW8DC9Zd1TgTmFAi0ScK2aGw==
X-Received: by 2002:a63:3814:: with SMTP id f20mr10440957pga.266.1591380293630; 
 Fri, 05 Jun 2020 11:04:53 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id m24sm33379pgd.69.2020.06.05.11.04.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 05 Jun 2020 11:04:52 -0700 (PDT)
Date: Fri, 5 Jun 2020 11:04:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Manikandan <manikandan.hcl.ers.epl@gmail.com>
Subject: Re: [PATCH v2] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
Message-ID: <20200605180451.GA201666@roeck-us.net>
References: <20200529124607.GA3469@cnn>
 <49485085-7cc7-9e29-a719-98d1e184378b@roeck-us.net>
 <20200605164821.GA29990@cnn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200605164821.GA29990@cnn>
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
Cc: linux-hwmon@vger.kernel.org, manikandan.e@hcl.com,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, vijaykhemka@fb.com, saipsdasari@fb.com,
 patrickw3@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jun 05, 2020 at 10:18:21PM +0530, Manikandan wrote:
> On Fri, May 29, 2020 at 10:30:16AM -0700, Guenter Roeck wrote:
> > On 5/29/20 5:46 AM, Manikandan Elumalai wrote:
> > > The adm1278 temperature sysfs attribute need it for one of the openbmc platform . 
> > > This functionality is not enabled by default, so PMON_CONFIG needs to be modified in order to enable it.
> > > 
> > > Signed-off-by   : Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
> > 
> > This is not valid.
> > 
> > > 
> > > v2:
> > >    - Add Signed-off-by.
> > >    - Removed ADM1278_TEMP1_EN check.
> > 
> > checkpatch reports:
> > 
> > > ---WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
> > #14:
> > The adm1278 temperature sysfs attribute need it for one of the openbmc platform .
> > 
> > CHECK: Alignment should match open parenthesis
> > #45: FILE: drivers/hwmon/pmbus/adm1275.c:679:
> > +		ret = i2c_smbus_write_byte_data(client,
> > +					ADM1275_PMON_CONFIG,
> > 
> > WARNING: suspect code indent for conditional statements (16, 16)
> > #47: FILE: drivers/hwmon/pmbus/adm1275.c:681:
> > +		if (ret < 0) {
> > +		dev_err(&client->dev,
> > 
> > ERROR: Missing Signed-off-by: line(s)
> > 
> > total: 1 errors, 2 warnings, 1 checks, 33 lines checked
> > 
> > Please follow published guidelines when submitting patches.
> > 
> > >  drivers/hwmon/pmbus/adm1275.c | 21 +++++++++++++++++----
> > >  1 file changed, 17 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
> > > index 5caa37fb..ab5fceb 100644
> > > --- a/drivers/hwmon/pmbus/adm1275.c
> > > +++ b/drivers/hwmon/pmbus/adm1275.c
> > > @@ -666,7 +666,23 @@ static int adm1275_probe(struct i2c_client *client,
> > >  		tindex = 3;
> > >  
> > >  		info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
> > > -			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
> > > +			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> > > +			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
> > > +
> > > +		config = i2c_smbus_read_byte_data(client, ADM1275_PMON_CONFIG);
> > > +		if (config < 0)
> > > +			return config;
> > > +
> > > +		/* Enable TEMP1 by default */
> > > +		config |= ADM1278_TEMP1_EN;
> > > +		ret = i2c_smbus_write_byte_data(client,
> > > +					ADM1275_PMON_CONFIG,
> > > +					config);
> > > +		if (ret < 0) {
> > > +		dev_err(&client->dev,
> > > +			"Failed to enable temperature config\n");
> > > +		return -ENODEV;
> > > +		}
> > 
> > This can be handled in a single operation, together with ADM1278_VOUT_EN
> > below. There is no need for two separate write operations.
> >
>         Thanks for review Guenter, Patrick and Vijay.
>         Sorry for delay response. 
>         I have made changes to write ADM1278_VOUT_EN and ADM1278_TEMP1_EN in single
>         operation and tested in platfrom .
>         The changes given for quick look and will help if any misunderstand.
> 
> 	--- a/drivers/hwmon/pmbus/adm1275.c
> 	+++ b/drivers/hwmon/pmbus/adm1275.c
> 	@@ -666,11 +666,11 @@ static int adm1275_probe(struct i2c_client *client,
>  		tindex = 3;
>  
>  		info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
> 	-			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
> 	+			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | 
>         +			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
>  
>  		/* Enable VOUT if not enabled (it is disabled by default) */
>  		if (!(config & ADM1278_VOUT_EN)) {

		if (config & (ADM1278_VOUT_EN | ADM1278_TEMP1_EN) !=
						ADM1278_VOUT_EN | ADM1278_TEMP1_EN)

> 	-			config |= ADM1278_VOUT_EN;
> 	+			config |= (ADM1278_VOUT_EN | ADM1278_TEMP1_EN);

( ) is unnecessary here.

>  			ret = i2c_smbus_write_byte_data(client,
>  							ADM1275_PMON_CONFIG,
>  							config);
> 	@@ -680,10 +680,6 @@ static int adm1275_probe(struct i2c_client *client,
>  				return -ENODEV;
>  			}
>  		}
> 	-
> 	-		if (config & ADM1278_TEMP1_EN)
> 	-			info->func[0] |=
> 	-				PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
>  		if (config & ADM1278_VIN_EN)
>  			info->func[0] |= PMBUS_HAVE_VIN;
>  		break; 
> > Guenter
> > 
> > > 
> > >  		/* Enable VOUT if not enabled (it is disabled by default) */
> > >  		if (!(config & ADM1278_VOUT_EN)) {
> > > @@ -681,9 +697,6 @@ static int adm1275_probe(struct i2c_client *client,
> > >  			}
> > >  		}
> > >  
> > > -		if (config & ADM1278_TEMP1_EN)
> > > -			info->func[0] |=
> > > -				PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
> > >  		if (config & ADM1278_VIN_EN)
> > >  			info->func[0] |= PMBUS_HAVE_VIN;
> > >  		break;
> > > 
> > 
