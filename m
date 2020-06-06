Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7818B1F053E
	for <lists+openbmc@lfdr.de>; Sat,  6 Jun 2020 07:16:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49f75f043KzDql8
	for <lists+openbmc@lfdr.de>; Sat,  6 Jun 2020 15:16:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=manikandan.hcl.ers.epl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=B5CtDerO; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49f73r338LzDqws;
 Sat,  6 Jun 2020 15:14:31 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id n2so4496462pld.13;
 Fri, 05 Jun 2020 22:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=q60BgtvtGrRHPLaAcEEaiv4xZ548laI/X5aYFpX2neQ=;
 b=B5CtDerOsfPLGN2lppk/1BOrBofBgDJC5u3T066w80KQoSmzkQ/OwiegZPM0nCGTiL
 5y7zWpBKNiSYI0Xy4vyrECyXmPd5azycaGjWFcNUc7qBKyTc0Ro8yHRW/rtuRj/YzGEt
 3aE9odD9yop+snm/O1ZmCJ9h6xE9EGULeI1xCmAynJQf6AiLUtNuIXNzKYEkmjoLCway
 4BKSzY//y6aXC5p0QpI4y580+2iTHjj1UaOCMtaYONfOWdecP2goAmFoanjHyTVLEa7/
 lls1lPTjkeiarTE6A9tJ1Zh7ngf/1qlh7mznRXsuZe5udwZzCLuevfQOqfXQT/lvNFgp
 1bew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=q60BgtvtGrRHPLaAcEEaiv4xZ548laI/X5aYFpX2neQ=;
 b=p8z41MkBt22NMz7z2S1hDN/yrt7aGTeg8EW+QtPXA4FAG4Tcy46v3H8BMFKTYB5NF8
 diOj3IIggNnLW5hRMNLqmUDgLdIw15ZSA2iFMzskeFja8/HKRBVkwFMRp4SVql7S1iCv
 CL0r2e14bxW9PTDFBArVSkTRu9cdemArBG2lazdqFych4u0oPid1xEJHbveI7b+NT2tQ
 G3LYb9PBzz3YVtQHoQ4tdUEMQZn2ZLsf7WKiLadCasgRR4AR3S8fFrCUHObhu5a63kzj
 8FLvMJDf7UKZoz9DVgySwYK+YWv6u0GCKJp+RYkLjTRuprkii77cW1vJCEUY1Trn+Jr7
 LZNg==
X-Gm-Message-State: AOAM532BP/ErOY0ha0jAmtn9M/J6w6Z25ZX4267HglioVwQypUdJH5Az
 hpcK8PzJZh9QF0vUB3zOZjI=
X-Google-Smtp-Source: ABdhPJwDnPReVJ8rQLjory5wwua6IT6MGGbjtwK2w/RLf9WjmACptFqsdUovwfPROOo1oF1r9Uq4ig==
X-Received: by 2002:a17:902:b710:: with SMTP id
 d16mr12793410pls.28.1591420468324; 
 Fri, 05 Jun 2020 22:14:28 -0700 (PDT)
Received: from cnn ([2401:4900:2303:7ad4:cd72:839f:5826:c552])
 by smtp.gmail.com with ESMTPSA id t6sm1118370pfb.77.2020.06.05.22.14.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jun 2020 22:14:25 -0700 (PDT)
Date: Sat, 6 Jun 2020 10:43:45 +0530
From: Manikandan <manikandan.hcl.ers.epl@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
Message-ID: <20200606051345.GA1864@cnn>
References: <20200529124607.GA3469@cnn>
 <49485085-7cc7-9e29-a719-98d1e184378b@roeck-us.net>
 <20200605164821.GA29990@cnn> <20200605180451.GA201666@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200605180451.GA201666@roeck-us.net>
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
Cc: linux-hwmon@vger.kernel.org, manikandan.e@hcl.com,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, vijaykhemka@fb.com, saipsdasari@fb.com,
 patrickw3@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jun 05, 2020 at 11:04:51AM -0700, Guenter Roeck wrote:
> On Fri, Jun 05, 2020 at 10:18:21PM +0530, Manikandan wrote:
> > On Fri, May 29, 2020 at 10:30:16AM -0700, Guenter Roeck wrote:
> > > On 5/29/20 5:46 AM, Manikandan Elumalai wrote:
> > > > The adm1278 temperature sysfs attribute need it for one of the openbmc platform . 
> > > > This functionality is not enabled by default, so PMON_CONFIG needs to be modified in order to enable it.
> > > > 
> > > > Signed-off-by   : Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
> > > 
> > > This is not valid.
> > > 
> > > > 
> > > > v2:
> > > >    - Add Signed-off-by.
> > > >    - Removed ADM1278_TEMP1_EN check.
> > > 
> > > checkpatch reports:
> > > 
> > > > ---WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
> > > #14:
> > > The adm1278 temperature sysfs attribute need it for one of the openbmc platform .
> > > 
> > > CHECK: Alignment should match open parenthesis
> > > #45: FILE: drivers/hwmon/pmbus/adm1275.c:679:
> > > +		ret = i2c_smbus_write_byte_data(client,
> > > +					ADM1275_PMON_CONFIG,
> > > 
> > > WARNING: suspect code indent for conditional statements (16, 16)
> > > #47: FILE: drivers/hwmon/pmbus/adm1275.c:681:
> > > +		if (ret < 0) {
> > > +		dev_err(&client->dev,
> > > 
> > > ERROR: Missing Signed-off-by: line(s)
> > > 
> > > total: 1 errors, 2 warnings, 1 checks, 33 lines checked
> > > 
> > > Please follow published guidelines when submitting patches.
> > > 
> > > >  drivers/hwmon/pmbus/adm1275.c | 21 +++++++++++++++++----
> > > >  1 file changed, 17 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
> > > > index 5caa37fb..ab5fceb 100644
> > > > --- a/drivers/hwmon/pmbus/adm1275.c
> > > > +++ b/drivers/hwmon/pmbus/adm1275.c
> > > > @@ -666,7 +666,23 @@ static int adm1275_probe(struct i2c_client *client,
> > > >  		tindex = 3;
> > > >  
> > > >  		info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
> > > > -			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
> > > > +			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> > > > +			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
> > > > +
> > > > +		config = i2c_smbus_read_byte_data(client, ADM1275_PMON_CONFIG);
> > > > +		if (config < 0)
> > > > +			return config;
> > > > +
> > > > +		/* Enable TEMP1 by default */
> > > > +		config |= ADM1278_TEMP1_EN;
> > > > +		ret = i2c_smbus_write_byte_data(client,
> > > > +					ADM1275_PMON_CONFIG,
> > > > +					config);
> > > > +		if (ret < 0) {
> > > > +		dev_err(&client->dev,
> > > > +			"Failed to enable temperature config\n");
> > > > +		return -ENODEV;
> > > > +		}
> > > 
> > > This can be handled in a single operation, together with ADM1278_VOUT_EN
> > > below. There is no need for two separate write operations.
> > >
> >         Thanks for review Guenter, Patrick and Vijay.
> >         Sorry for delay response. 
> >         I have made changes to write ADM1278_VOUT_EN and ADM1278_TEMP1_EN in single
> >         operation and tested in platfrom .
> >         The changes given for quick look and will help if any misunderstand.
> > 
> > 	--- a/drivers/hwmon/pmbus/adm1275.c
> > 	+++ b/drivers/hwmon/pmbus/adm1275.c
> > 	@@ -666,11 +666,11 @@ static int adm1275_probe(struct i2c_client *client,
> >  		tindex = 3;
> >  
> >  		info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
> > 	-			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
> > 	+			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | 
> >         +			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
> >  
> >  		/* Enable VOUT if not enabled (it is disabled by default) */
> >  		if (!(config & ADM1278_VOUT_EN)) {
> 
> 		if (config & (ADM1278_VOUT_EN | ADM1278_TEMP1_EN) !=
> 						ADM1278_VOUT_EN | ADM1278_TEMP1_EN)
> 
> > 	-			config |= ADM1278_VOUT_EN;
> > 	+			config |= (ADM1278_VOUT_EN | ADM1278_TEMP1_EN);
> 
> ( ) is unnecessary here.

        Thanks for quick review Guenter. I will submit all changes in v3.
> 
> >  			ret = i2c_smbus_write_byte_data(client,
> >  							ADM1275_PMON_CONFIG,
> >  							config);
> > 	@@ -680,10 +680,6 @@ static int adm1275_probe(struct i2c_client *client,
> >  				return -ENODEV;
> >  			}
> >  		}
> > 	-
> > 	-		if (config & ADM1278_TEMP1_EN)
> > 	-			info->func[0] |=
> > 	-				PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
> >  		if (config & ADM1278_VIN_EN)
> >  			info->func[0] |= PMBUS_HAVE_VIN;
> >  		break; 
> > > Guenter
> > > 
> > > > 
> > > >  		/* Enable VOUT if not enabled (it is disabled by default) */
> > > >  		if (!(config & ADM1278_VOUT_EN)) {
> > > > @@ -681,9 +697,6 @@ static int adm1275_probe(struct i2c_client *client,
> > > >  			}
> > > >  		}
> > > >  
> > > > -		if (config & ADM1278_TEMP1_EN)
> > > > -			info->func[0] |=
> > > > -				PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
> > > >  		if (config & ADM1278_VIN_EN)
> > > >  			info->func[0] |= PMBUS_HAVE_VIN;
> > > >  		break;
> > > > 
> > > 
