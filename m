Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F241F5727
	for <lists+openbmc@lfdr.de>; Wed, 10 Jun 2020 16:57:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hqps74lgzDqly
	for <lists+openbmc@lfdr.de>; Thu, 11 Jun 2020 00:57:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=manikandan.hcl.ers.epl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sPb6shlw; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hqjT5xj6zDqY4;
 Thu, 11 Jun 2020 00:53:01 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id x11so1043096plv.9;
 Wed, 10 Jun 2020 07:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=W5XkcC7KeYS10PiOng4uQLLTra/keU9RDeMCG9b6HTE=;
 b=sPb6shlw/GMM34jCjyI+1IyQl4hjR/gFWJT6F1W1mWxRRFErqnyy4lHrqQqDvzki4D
 HWjwpt79BKVEZlT/4vlA7Ly8ojfKRPU6RcNA7BxoWt2xC7fX+vMKkINKQDJNT8iOzA8a
 /acoLzDyGF/oRQShetdsDD2X7jOGGZ+SD68udu7rqFtnh6G4NrKf/fgQM26zjjpykRxt
 7n/nBGjtNaBwkIu+I1M4EutJwtWZ/Tah9TQybU2I1181c3LgNk/ctC1FggbDvtMeDGcG
 lptWQfeoGMvUS6Czd/p2Dn/C3dtUjqPuy7TUtwUZoiwlkJ3+XivdFUxQjNa9sOEE/fvE
 Fo9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=W5XkcC7KeYS10PiOng4uQLLTra/keU9RDeMCG9b6HTE=;
 b=s11F9P9jg1ELQtt69n1eon38kpMFYHhdCf5SLobndoOL12a4pBUGi2RrDIXuZw0aK5
 ZilyNoqNPxgEW2fFpG5jj3A7qayxMouDJwrHATgFUQqvKRKsKsxfdC+YgQvRR5hjN1tu
 RQIeyiEuzpWyjaBc40zOf+xe1CR4Z8h4QE2qe37uPlofij/J2mYbJWJe8KVDRByDLVpY
 UNQsRIcC9qaeGF3hyFMrd6toyrkDl4LybvqS8tZO36+4WeEyiobNYMPRq2aAjkzgOYxG
 sSMohn6e0dx9ANBFfPsJSidZRJb7pKDOP4fQ7Bs6XUMoo5Za0J0FOUoVIRkwht3laTJ4
 g0lw==
X-Gm-Message-State: AOAM53386XAGMNqAHZ6HIyqm9u0zDVV6MmBZyU3KyUNN5BrEIamvQsnk
 Ok82SFH6joYNvjtgGU4feFc=
X-Google-Smtp-Source: ABdhPJyKgwdIOuUz7O0lHPIz41Jqpk6jni0GZnkqI+vYAHow4N0nEvag/EnBCXAmZff942QnsJ46Vg==
X-Received: by 2002:a17:90b:1087:: with SMTP id
 gj7mr3513264pjb.124.1591800777042; 
 Wed, 10 Jun 2020 07:52:57 -0700 (PDT)
Received: from cnn ([2402:3a80:464:d8d9:cd72:839f:5826:c552])
 by smtp.gmail.com with ESMTPSA id a5sm203465pfi.41.2020.06.10.07.52.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jun 2020 07:52:56 -0700 (PDT)
Date: Wed, 10 Jun 2020 20:22:50 +0530
From: Manikandan <manikandan.hcl.ers.epl@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
Message-ID: <20200610145250.GA25183@cnn>
References: <20200610082611.GA14266@cnn> <20200610132833.GA237017@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200610132833.GA237017@roeck-us.net>
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
 linux-kernel@vger.kernel.org, patrickw3@fb.com, saipsdasari@fb.com,
 vijaykhemka@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jun 10, 2020 at 06:28:33AM -0700, Guenter Roeck wrote:
> On Wed, Jun 10, 2020 at 01:56:11PM +0530, Manikandan Elumalai wrote:
> > The adm1278 temp attribute need it for openbmc platform .
> > This feature not enabled by default, so PMON_CONFIG needs to enable it.
> > 
> > v4:
> > Reported-by: kernel test robot <lkp@intel.com>
> > ---
> > changes in conditional check to enable vout & temp1 by default.
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
> Applied (and I fixed the problem reported by 0-day, so no need to resend).
>                  Thank you  Guenter. 
> Thanks,
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
> > +		if (config & (ADM1278_VOUT_EN | ADM1278_TEMP1_EN) != ADM1278_VOUT_EN | ADM1278_TEMP1_EN) {
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
