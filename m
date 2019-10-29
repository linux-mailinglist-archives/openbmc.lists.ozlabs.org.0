Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC585E8EDA
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 18:59:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472fVx14X1zF3CH
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 04:59:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LHLQiTkt"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472fV42CFgzF32G
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 04:59:05 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id k7so8021477pll.1
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 10:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ybgQ3xxOtnHrMdmxLDaCHSf4VZkFrp6QGcI7f82TvvI=;
 b=LHLQiTktejquX3OwvW4bD1CFWKVJn3uBZwdOtUaU05fmIAPlMx+6UzkiwYZW8qrPuw
 ObhWAA/S1ZXx4gV/70Q56X/F0uHNGi3M0ZvJ8iNMxg14w0mVuOmlqyMjXHrmXZlDspYG
 BbyuOdrOiRgcjmMcBlV9nYL4dk8f6pZyh9bHD6c43ooKvTmrqmfQrWwhS5VhJCpuxicn
 lc+csQGCEgFUVI4PzQaX6jH3og+dPv0p45GwaED6/5rhkOa7WzznO1AvchVnuhxEfPNG
 2OS1f89/yr9qz68CqO3Dl4W6DmaJ1fx17ME5E2Qig73+t584wsYxxC5omgOEYNVjGct0
 AhvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ybgQ3xxOtnHrMdmxLDaCHSf4VZkFrp6QGcI7f82TvvI=;
 b=Gngw1ed5BR7YSZlUtHlVyrAHup9Rxx2Gmi3jGpkk22wGEBzqm5u/IQ93r5rmtBAJrt
 VF5UOzNL1fXA6aWtmsUZggUmOFGlCPI9YQUua5+6kOHciY68rHWSgNAZi8SX/V/P8t+4
 ZmTluzy65fwd1+KyYzTNCS07RZjvbMod22V04YdyGA63OsEzeyJZoLMCjmCSzusoFkAs
 kMSM2Bs7gc1XK4xQDfdegT5dKzKJ1mp8Wc6f9wLfsoQf0TtOmjSy/gLWLXXCc+niMt5x
 4pApammFIbuxxMGVgKPX0lPW34U1yjKGjAnDJJhiOM3y49qqQTHKDDL0FFjnCOPSVnor
 OspQ==
X-Gm-Message-State: APjAAAVSqJ9jwy/igvrT/OxVk7Xmjx2lMWH/zD2gwFqvCH37p1gdF2Ip
 mWv3QklPK4RCFUHqsfJkShY=
X-Google-Smtp-Source: APXvYqz8NV//PFsfGPLoVBhwx5FtQJauquM/nyxZ0Aa3be3CvF0amdiZ0ehxvSaWrg0Piv/eJJsbNw==
X-Received: by 2002:a17:902:4a:: with SMTP id 68mr5492446pla.8.1572371941962; 
 Tue, 29 Oct 2019 10:59:01 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 ([2620:10d:c090:200::1:3a3e])
 by smtp.gmail.com with ESMTPSA id i16sm14508161pfa.184.2019.10.29.10.59.01
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 29 Oct 2019 10:59:01 -0700 (PDT)
Date: Tue, 29 Oct 2019 10:58:59 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 2/3] hwmon: (pmbus) add BEL PFE3000 power supply driver
Message-ID: <20191029175858.GB26890@taoren-ubuntu-R90MNF91>
References: <20191028234904.12441-1-rentao.bupt@gmail.com>
 <20191028234904.12441-3-rentao.bupt@gmail.com>
 <20191029125048.GA32552@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191029125048.GA32552@roeck-us.net>
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
 linux-doc@vger.kernel.org, taoren@fb.com, openbmc@lists.ozlabs.org,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Oct 29, 2019 at 05:50:48AM -0700, Guenter Roeck wrote:
> On Mon, Oct 28, 2019 at 04:49:03PM -0700, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > Add the driver to support BEL PFE3000 which is 3000 Wat AC to DC power
> 
> which is a ...
> 
> Watt

My bad.. I just moved to a new machine and didn't notice import errors
printed by checkpatch.pl: it might be the reason why the error is not
detected by checkpach.pl.
Thanks for pointing it out, will fix it in v2.
 
> > supply. The chip has 8 pages.
> 
> FWIW, that is a bit misleading here. It isn't really 8 pages. I would suggest
> to drop that comment (or, if you insist, at least add "two of which are
> reserved").

I will remove the part in patch v2.

> > 
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > ---
> >  drivers/hwmon/pmbus/bel-pfe.c | 65 ++++++++++++++++++++++++++++++++++-
> >  1 file changed, 64 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/hwmon/pmbus/bel-pfe.c b/drivers/hwmon/pmbus/bel-pfe.c
> > index 117f9af21bf3..7b6c90b056c9 100644
> > --- a/drivers/hwmon/pmbus/bel-pfe.c
> > +++ b/drivers/hwmon/pmbus/bel-pfe.c
> > @@ -10,9 +10,21 @@
> >  #include <linux/init.h>
> >  #include <linux/err.h>
> >  #include <linux/i2c.h>
> > +#include <linux/pmbus.h>
> > +
> >  #include "pmbus.h"
> >  
> > -enum chips {pfe1100};
> > +enum chips {pfe1100, pfe3000};
> > +
> > +/*
> > + * Disable status check for pfe3000 devices, because some devices report
> > + * communication error (invalid command) for VOUT_MODE command (0x20)
> > + * although correct VOUT_MODE (0x16) is returned: it leads to incorrect
> > + * exponent in linear mode.
> > + */
> > +static struct pmbus_platform_data pfe3000_plat_data = {
> > +	.flags = PMBUS_SKIP_STATUS_CHECK,
> > +};
> >  
> >  static struct pmbus_driver_info pfe_driver_info[] = {
> >  	[pfe1100] = {
> > @@ -34,6 +46,45 @@ static struct pmbus_driver_info pfe_driver_info[] = {
> >  			   PMBUS_HAVE_STATUS_TEMP |
> >  			   PMBUS_HAVE_FAN12,
> >  	},
> > +
> > +	[pfe3000] = {
> > +		.pages = 8,
> > +		.format[PSC_VOLTAGE_IN] = linear,
> > +		.format[PSC_VOLTAGE_OUT] = linear,
> > +		.format[PSC_CURRENT_IN] = linear,
> > +		.format[PSC_CURRENT_OUT] = linear,
> > +		.format[PSC_POWER] = linear,
> > +		.format[PSC_TEMPERATURE] = linear,
> > +		.format[PSC_FAN] = linear,
> > +
> > +		/* Page 0: V1. */
> > +		.func[0] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> > +			   PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> > +			   PMBUS_HAVE_POUT | PMBUS_HAVE_FAN12 |
> > +			   PMBUS_HAVE_VIN | PMBUS_HAVE_IIN |
> > +			   PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
> > +			   PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 |
> > +			   PMBUS_HAVE_TEMP3 | PMBUS_HAVE_STATUS_TEMP |
> > +			   PMBUS_HAVE_VCAP,
> > +
> > +		/* Page 1: Vsb. */
> > +		.func[1] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> > +			   PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> > +			   PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
> > +			   PMBUS_HAVE_POUT,
> > +
> > +		/*
> > +		 * Page 2: V1 Ishare.
> > +		 * Page 4: V1 Cathode.
> > +		 * Page 5: Vsb Cathode.
> > +		 * Page 6: V1 Sense.
> > +		 * Page 3 and 7 are reserved.
> 
> If page 7 is reserved, and doesn't have any attributes, it doesn't really
> make sense to claim support for 8 pages above. I would suugest to make it 7.

Will set total pages to 7 in patch v2.
 
> > +		 */
> > +		.func[2] = PMBUS_HAVE_VOUT,
> > +		.func[4] = PMBUS_HAVE_VOUT,
> > +		.func[5] = PMBUS_HAVE_VOUT,
> > +		.func[6] = PMBUS_HAVE_VOUT,
> > +	},
> >  };
> >  
> >  static int pfe_pmbus_probe(struct i2c_client *client,
> > @@ -42,11 +93,23 @@ static int pfe_pmbus_probe(struct i2c_client *client,
> >  	int model;
> >  
> >  	model = (int)id->driver_data;
> > +
> > +	/*
> > +	 * PFE3000-12-069RA devices may not stay in page 0 during device
> > +	 * probe which leads to probe failure (read status word failed).
> > +	 * So let's set the device to page 0 at the beginning.
> > +	 */
> > +	if (model == pfe3000) {
> > +		client->dev.platform_data = &pfe3000_plat_data;
> > +		i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
> > +	}
> > +
> >  	return pmbus_do_probe(client, id, &pfe_driver_info[model]);
> >  }
> >  
> >  static const struct i2c_device_id pfe_device_id[] = {
> >  	{"pfe1100", pfe1100},
> > +	{"pfe3000", pfe3000},
> >  	{}
> >  };
> >  
