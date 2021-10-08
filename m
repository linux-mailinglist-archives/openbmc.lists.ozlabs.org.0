Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7DA426C94
	for <lists+openbmc@lfdr.de>; Fri,  8 Oct 2021 16:13:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQqsY1tHqz2xZ2
	for <lists+openbmc@lfdr.de>; Sat,  9 Oct 2021 01:13:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kLrvKJ4a;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::229;
 helo=mail-oi1-x229.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=kLrvKJ4a; dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQqs61MvKz2yx9
 for <openbmc@lists.ozlabs.org>; Sat,  9 Oct 2021 01:12:42 +1100 (AEDT)
Received: by mail-oi1-x229.google.com with SMTP id n63so13901562oif.7
 for <openbmc@lists.ozlabs.org>; Fri, 08 Oct 2021 07:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ec0UXnetl/cUzojliEKcqLDXOEMlqclKc/XRj4PNyXE=;
 b=kLrvKJ4aHZsTuO6lSocllGqMoHF5q/Tep3znQkD8Dx28796e+XZMG9mLO4Z9SEK8qM
 FsKe1gasVsBcasVNBeC+fvzi+5ljEzEwhyS4aQXdQ64mk941AhpqFs4X8T2Z1kGlqJ22
 NsHoST6THQvLjbZ+yQ9JScRRYx5PwUxDzmNAx4eqr4yhuTp2W9JVIaHuvgsehQIZwrKQ
 f4jYXhJNEJLCMh0g+DjPoEc0FzmnXThQr/Skulq2/iOXF2it9Pwp4XBxzbVSVIgG4ZGj
 Cka55QYrE4tOUqRYkCCbZM0KaxOIIwTqgO3BaimLABEHIJQrzb4NeUDilpaW0p8MEtlY
 1KSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=ec0UXnetl/cUzojliEKcqLDXOEMlqclKc/XRj4PNyXE=;
 b=n7maQtLB/BMu6A/Avo5EL1ehkh2Goa+qFJPt90kVcwGMProzpOc97aD1q6aX3UF6rN
 VJVcjGJnL+4WXdT/OU3XGo3utzXwpp8ByEnJ3tGa/+Hu5U/QWX7b29IrCPkzPowAVL2I
 bfBtD1M0ppX/KN/OEVPjXqWdgfLgJMvQcsdsllijl93y8YZfmlKk/8Al9zCl3dlMFw8Q
 YD90V8bYsxC9VzEviMMIzAcWpbHgDB1ZLNgRDBfCa8hoH1fCXE3kYLcjXH3ZIXDhalUI
 2uIb+IUVnUbBvuPyWkEiElxTfLxYx4+9rttLsxMhN0TolPRhDyATt4tdhJku/3AFW0VD
 fCpA==
X-Gm-Message-State: AOAM532VojxRQ8cJb1BNHd3ys0Ae3FtBnxUAgaODG1IeERsENqoD30Yg
 lPH2NeviX+YnFaApUUX0AuTxiaGGKO4=
X-Google-Smtp-Source: ABdhPJzOVTiNEosUQAjVv9QO0iXxPxGaeT/gqUshzEInrFSgqW3WwgCltkFL+EjuofaqHQf7o7y0Ug==
X-Received: by 2002:a05:6808:1992:: with SMTP id
 bj18mr16600754oib.125.1633702357758; 
 Fri, 08 Oct 2021 07:12:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d10sm514639ooj.24.2021.10.08.07.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 07:12:37 -0700 (PDT)
Date: Fri, 8 Oct 2021 07:12:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Brandon Wyman <bjwyman@gmail.com>
Subject: Re: [PATCH 2/2] hwmon: (pmbus/ibm-cffps) Use MFR_ID to choose version
Message-ID: <20211008141235.GA2044602@roeck-us.net>
References: <20211004144339.2634330-1-bjwyman@gmail.com>
 <20211004144339.2634330-2-bjwyman@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211004144339.2634330-2-bjwyman@gmail.com>
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
 openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 04, 2021 at 02:43:39PM +0000, Brandon Wyman wrote:
> There are multiple power supplies that will indicate
> CFFPS_CCIN_VERSION_1, use the manufacturer ID to determine if it should
> be treated as version cffps1 or version cffps2.
> 
> Signed-off-by: Brandon Wyman <bjwyman@gmail.com>

Applied, after fixing continnuation line alignments.

Guenter

> ---
>  drivers/hwmon/pmbus/ibm-cffps.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
> index 2ee47cbbb665..292c87331f2b 100644
> --- a/drivers/hwmon/pmbus/ibm-cffps.c
> +++ b/drivers/hwmon/pmbus/ibm-cffps.c
> @@ -502,16 +502,29 @@ static int ibm_cffps_probe(struct i2c_client *client)
>  		u16 ccin_revision = 0;
>  		u16 ccin_version = CFFPS_CCIN_VERSION_1;
>  		int ccin = i2c_smbus_read_word_swapped(client, CFFPS_CCIN_CMD);
> +		char mfg_id[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
>  
>  		if (ccin > 0) {
>  			ccin_revision = FIELD_GET(CFFPS_CCIN_REVISION, ccin);
>  			ccin_version = FIELD_GET(CFFPS_CCIN_VERSION, ccin);
>  		}
>  
> +		rc = i2c_smbus_read_block_data(client, PMBUS_MFR_ID,
> +				mfg_id);
> +		if (rc < 0) {
> +			dev_err(&client->dev,
> +					"Failed to read Manufacturer ID\n");
> +			return rc;
> +		}
> +
>  		switch (ccin_version) {
>  		default:
>  		case CFFPS_CCIN_VERSION_1:
> -			vs = cffps1;
> +			if ((strncmp(mfg_id, "ACBE", 4) == 0) ||
> +					(strncmp(mfg_id, "ARTE", 4) == 0))
> +				vs = cffps1;
> +			else
> +				vs = cffps2;
>  			break;
>  		case CFFPS_CCIN_VERSION_2:
>  			vs = cffps2;
