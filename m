Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8437D1EFE33
	for <lists+openbmc@lfdr.de>; Fri,  5 Jun 2020 18:49:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dpXC5nCtzDr1g
	for <lists+openbmc@lfdr.de>; Sat,  6 Jun 2020 02:49:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=manikandan.hcl.ers.epl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nc2Ye9Lc; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dpWC3P7MzDqxG;
 Sat,  6 Jun 2020 02:48:37 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id y17so3862805plb.8;
 Fri, 05 Jun 2020 09:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pbw5wJU1HWwczwZYo4oviMNB1mxy3yxgJYJHKqTXrQA=;
 b=nc2Ye9LcD1w4CX0RwO/dE4cKFb9R1d2GTSvNpD8ogACBjlIjzVPC8s8J/uRJL25I9g
 ihiq0F0ZityxU0IKUbe1/2HleLxsU0dUJW1LTrmR1M0mx8SsRiLpriR/zmvmGi9/4gP8
 qBAXjMKZ/NcKpLXLHdUwTr48znfU2rHobYkEGMiK7Pq1dpCdsg4zBijmVFZ3Oe+9t0C9
 e3fIHswCX6CBkO9eqzgZmseO9V9kGqNSWCVc7uKxpj1UksPZyhUTn6AyUoP+x3ancV5g
 80ezpMmLTPwHxo26bOSaunm3ar8WgZl+OP8ConVeS8is/w+KP71/3QROWikOAUSMF8lz
 suGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pbw5wJU1HWwczwZYo4oviMNB1mxy3yxgJYJHKqTXrQA=;
 b=V5hOWtPd5jXRei3RDn7J89mcbZ0CGXM19LHCE9Z25WFChFG52kN8k+Vr5umRSWti9l
 F056ohjy6gABpq1+IPC9T7DjR9L6DJZXnhNWDM7HJ2yZZlS9zbgflBJvuHXL4TEC26+v
 CkteD+YbDNr1eeA2iof5w0DMacCsxex9xxFN1SLalIjH9Ed21We0X4zjYIsLzY67Z/gi
 wS5uu2MKUsFndPRNZ9YKW4nQXvEyLzsz6OnF8XVwE7v6DXlwStVdZs527diR79wgacDM
 t9uW+zHOmTOrPOiFUnqndPyjiNpyg8Dwh0FlZ3Rr9AnNA4E7l6NykrBGtlnb0fdfppI/
 X96A==
X-Gm-Message-State: AOAM530GEbv8spINxooeREUquhDOu0BPFFDeTS/RXz/+0AgF7+K1vGBX
 LkZWJmvWnZHTSo6aWq4UtL8=
X-Google-Smtp-Source: ABdhPJxUvm6j1vlRZIYmCzKzJ7DBQm4Da0XLedX8dMh5O0C4s3S9A0dJRlGrIr67Qvq9oW0Wr8qfMg==
X-Received: by 2002:a17:90b:110d:: with SMTP id
 gi13mr4154665pjb.173.1591375714396; 
 Fri, 05 Jun 2020 09:48:34 -0700 (PDT)
Received: from cnn ([2401:4900:2303:7ad4:cd72:839f:5826:c552])
 by smtp.gmail.com with ESMTPSA id b29sm123977pff.176.2020.06.05.09.48.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jun 2020 09:48:33 -0700 (PDT)
Date: Fri, 5 Jun 2020 22:18:21 +0530
From: Manikandan <manikandan.hcl.ers.epl@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, patrickw3@fb.com,
	vijaykhemka@fb.com
Subject: Re: [PATCH v2] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
Message-ID: <20200605164821.GA29990@cnn>
References: <20200529124607.GA3469@cnn>
 <49485085-7cc7-9e29-a719-98d1e184378b@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49485085-7cc7-9e29-a719-98d1e184378b@roeck-us.net>
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
 linux-kernel@vger.kernel.org, saipsdasari@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, May 29, 2020 at 10:30:16AM -0700, Guenter Roeck wrote:
> On 5/29/20 5:46 AM, Manikandan Elumalai wrote:
> > The adm1278 temperature sysfs attribute need it for one of the openbmc platform . 
> > This functionality is not enabled by default, so PMON_CONFIG needs to be modified in order to enable it.
> > 
> > Signed-off-by   : Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
> 
> This is not valid.
> 
> > 
> > v2:
> >    - Add Signed-off-by.
> >    - Removed ADM1278_TEMP1_EN check.
> 
> checkpatch reports:
> 
> > ---WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
> #14:
> The adm1278 temperature sysfs attribute need it for one of the openbmc platform .
> 
> CHECK: Alignment should match open parenthesis
> #45: FILE: drivers/hwmon/pmbus/adm1275.c:679:
> +		ret = i2c_smbus_write_byte_data(client,
> +					ADM1275_PMON_CONFIG,
> 
> WARNING: suspect code indent for conditional statements (16, 16)
> #47: FILE: drivers/hwmon/pmbus/adm1275.c:681:
> +		if (ret < 0) {
> +		dev_err(&client->dev,
> 
> ERROR: Missing Signed-off-by: line(s)
> 
> total: 1 errors, 2 warnings, 1 checks, 33 lines checked
> 
> Please follow published guidelines when submitting patches.
> 
> >  drivers/hwmon/pmbus/adm1275.c | 21 +++++++++++++++++----
> >  1 file changed, 17 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
> > index 5caa37fb..ab5fceb 100644
> > --- a/drivers/hwmon/pmbus/adm1275.c
> > +++ b/drivers/hwmon/pmbus/adm1275.c
> > @@ -666,7 +666,23 @@ static int adm1275_probe(struct i2c_client *client,
> >  		tindex = 3;
> >  
> >  		info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
> > -			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
> > +			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> > +			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
> > +
> > +		config = i2c_smbus_read_byte_data(client, ADM1275_PMON_CONFIG);
> > +		if (config < 0)
> > +			return config;
> > +
> > +		/* Enable TEMP1 by default */
> > +		config |= ADM1278_TEMP1_EN;
> > +		ret = i2c_smbus_write_byte_data(client,
> > +					ADM1275_PMON_CONFIG,
> > +					config);
> > +		if (ret < 0) {
> > +		dev_err(&client->dev,
> > +			"Failed to enable temperature config\n");
> > +		return -ENODEV;
> > +		}
> 
> This can be handled in a single operation, together with ADM1278_VOUT_EN
> below. There is no need for two separate write operations.
>
        Thanks for review Guenter, Patrick and Vijay.
        Sorry for delay response. 
        I have made changes to write ADM1278_VOUT_EN and ADM1278_TEMP1_EN in single
        operation and tested in platfrom .
        The changes given for quick look and will help if any misunderstand.

	--- a/drivers/hwmon/pmbus/adm1275.c
	+++ b/drivers/hwmon/pmbus/adm1275.c
	@@ -666,11 +666,11 @@ static int adm1275_probe(struct i2c_client *client,
 		tindex = 3;
 
 		info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
	-			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
	+			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | 
        +			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
 
 		/* Enable VOUT if not enabled (it is disabled by default) */
 		if (!(config & ADM1278_VOUT_EN)) {
	-			config |= ADM1278_VOUT_EN;
	+			config |= (ADM1278_VOUT_EN | ADM1278_TEMP1_EN);
 			ret = i2c_smbus_write_byte_data(client,
 							ADM1275_PMON_CONFIG,
 							config);
	@@ -680,10 +680,6 @@ static int adm1275_probe(struct i2c_client *client,
 				return -ENODEV;
 			}
 		}
	-
	-		if (config & ADM1278_TEMP1_EN)
	-			info->func[0] |=
	-				PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
 		if (config & ADM1278_VIN_EN)
 			info->func[0] |= PMBUS_HAVE_VIN;
 		break; 
> Guenter
> 
> > 
> >  		/* Enable VOUT if not enabled (it is disabled by default) */
> >  		if (!(config & ADM1278_VOUT_EN)) {
> > @@ -681,9 +697,6 @@ static int adm1275_probe(struct i2c_client *client,
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
