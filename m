Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF531F3F69
	for <lists+openbmc@lfdr.de>; Tue,  9 Jun 2020 17:32:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hDdL3lmVzDqcQ
	for <lists+openbmc@lfdr.de>; Wed, 10 Jun 2020 01:32:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=manikandan.hcl.ers.epl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=P/TEF7aN; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hDVs2qJdzDqZn;
 Wed, 10 Jun 2020 01:26:44 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id s10so10499999pgm.0;
 Tue, 09 Jun 2020 08:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1K8sHcdXpjGKgr+77VdsdCZesRB4PdV8M1C3oEj3EnQ=;
 b=P/TEF7aNarddaQFetGCGJZLD2+MyTqV4fT79+cJ8t0B3IEVLhh7nKcDtCsrUfeX8Db
 zJiY5zKKgTUYl0y5bOBw8b+uXC5Zh+IfgsZD6BN7lpUX7Zi8tOxT7R50u/0tKNu+9zCw
 a9udRVnJhGw2dQ/RJnmjuM/kQp23E6JsTT7zdSpXZ69nZbfd95IllHtpd+zEKHIWlJR8
 hrjKCn8ekVNsUzebAxVGh4mA0d86bjhY6puqwMJDqTxj9BQvhPLZdfekNUtScUrIetCo
 DJKdoXH2vuWFrp/wsx31FmalCiVIjq3MjqHdMa+TCosyXXD3aWNbdAxK76sL4yRCVIOF
 1Q9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1K8sHcdXpjGKgr+77VdsdCZesRB4PdV8M1C3oEj3EnQ=;
 b=IFn+G6+4Ib7f0eguk1eKJqg9K1wXNTkqhzsJudhGJtzYSQsUkcX4486RI5BeQHKPBD
 TglrJktwTnr3QzZz0j3W9luE4B78BMPw2s2B3FehWGBq7901NpwbGM11BUSbg14LSo5S
 dFSq1URRy6Mx5nfpv583cordyC9hM9oYL5m04cQg8ThRw2VOn6AWF8L8es8ZMn0ZnwhY
 1Eh/ENomn/ob8nCsTwySrs+BYLvs8G7YSUvrvSuoNUNq2AiPG0rRA9p4AhDVA2p1RILP
 VFNj8kWOeFpl4f2FZ7FEGxI6FqFPyRB1I3E5KYUb8qYjb0DlJXAH2A3tF3qs5aH5Dyzz
 RD1w==
X-Gm-Message-State: AOAM530tPjA018fUH8anqN7Wc6jQUuOPUPHvRQme2ZI6ILCbm4cAtQPX
 uydjTPWqswO2LlF9rVFc5bw=
X-Google-Smtp-Source: ABdhPJwBOJKozhohl5aBI+nYCONer+CHeapbzC/Y9xaA7btNB5oPiCLPbKzm0Q50DpdY6Ml9tBw0nw==
X-Received: by 2002:a62:fc92:: with SMTP id e140mr13037081pfh.33.1591716400545; 
 Tue, 09 Jun 2020 08:26:40 -0700 (PDT)
Received: from cnn ([2409:4072:6412:6b70:cd72:839f:5826:c552])
 by smtp.gmail.com with ESMTPSA id y9sm3116403pjy.56.2020.06.09.08.26.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 08:26:39 -0700 (PDT)
Date: Tue, 9 Jun 2020 20:56:28 +0530
From: Manikandan <manikandan.hcl.ers.epl@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
Message-ID: <20200609152628.GB8833@cnn>
References: <20200608104349.GA10918@cnn>
 <23597b7b-de89-2911-092e-f3e1ad4884f5@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23597b7b-de89-2911-092e-f3e1ad4884f5@roeck-us.net>
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

On Mon, Jun 08, 2020 at 06:49:45AM -0700, Guenter Roeck wrote:
> On 6/8/20 3:43 AM, Manikandan Elumalai wrote:
> > The adm1278 temp attribute need it for openbmc platform .
> > This feature not enabled by default, so PMON_CONFIG needs to enable it.
> > 
> > v3:
> > ----
> > fix invalid signed-off.
> > removed checkpath warnings.
> > write ADM1278_TEMP1_EN and ADM1278_VOUT_EN conf in single line operation.
> > 
> > v2:
> > ----
> > add Signed-off-by.
> > removed ADM1278_TEMP1_EN check.
> > 
> > Signed-off-by: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
> > ---
> >  drivers/hwmon/pmbus/adm1275.c | 10 ++++------
> >  1 file changed, 4 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
> > index 5caa37fb..4782e31 100644
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
> > +		/* Enable VOUT & TEMP1 if not enabled (disabled by default) */
> >  		if (!(config & ADM1278_VOUT_EN)) {
> 
> This if statement needs to be
> 		if (config & (ADM1278_VOUT_EN | ADM1278_TEMP1_EN) != ADM1278_VOUT_EN | ADM1278_TEMP1_EN)
>
          Hi Guenter,

             The below warning shown by checkpatch after changes,

                  WARNING: line over 80 characters
                   #38: FILE: drivers/hwmon/pmbus/adm1275.c:672:
                   + if (config & (ADM1278_VOUT_EN | ADM1278_TEMP1_EN) != ADM1278_VOUT_EN | ADM1278_TEMP1_EN) {
 
                   total: 0 errors, 1 warnings, 24 lines checked

              I didn't see any if() condition made as two line in the driver . Is this acceptable warning ?

         Thanks
         Mani.E
> > -			config |= ADM1278_VOUT_EN;
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
