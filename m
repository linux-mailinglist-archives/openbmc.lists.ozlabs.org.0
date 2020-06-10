Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EFB1F55C9
	for <lists+openbmc@lfdr.de>; Wed, 10 Jun 2020 15:29:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hns73v4gzDqmh
	for <lists+openbmc@lfdr.de>; Wed, 10 Jun 2020 23:29:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fEclRi9m; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hnr83hrNzDq9W;
 Wed, 10 Jun 2020 23:28:40 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id 10so1105302pfx.8;
 Wed, 10 Jun 2020 06:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5nPSs393bGASphPtnT357hjeVtfaWOHC4CaGSirIQ0k=;
 b=fEclRi9mXpZuNWCDGq3LGoLC69Zoh084aXEwqnhiUGzCy4Lveyjg5c3uHKbynX46QB
 /gPuG7HGhPtt3mFPHVuDj3DA005B7sHn0a+P2bygYpxaTgovINLQirbxyA7KMk+kmtEx
 0283ouBpmFZceDWliw8qkg/SQu7I91p+NVGbjK/l8fc2KG681YRY58RySnhFxPWqUvht
 6HfBwK0em+Guf8WDnxSsCEBXCIUigPxa8gKJuN/LeGC3h31Wr9/loSkugEo4w50eQe97
 6GpxoFjooLBWhdFIFHRRZid79h+TcbC2bOU8cpYtG2ctGb9ufBPZiVBhYvX09F2LFK7U
 qI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=5nPSs393bGASphPtnT357hjeVtfaWOHC4CaGSirIQ0k=;
 b=OEelhB8PLqeDj/L41BEqstOLQ66+Y/vkk1lkMFqUk1jGhkf6YHiTwqp3kxrjjS7Kcx
 UDExg2whGKS4d6Iw6v99GV8483Y98wduZ+pOELeKfLdC5JUTpnxeKIqulJx1wFHuFzwr
 fVTwLucjT2JPHNpVe0rDMoqXVEK9Ohq6+DqYk838St54tdzZDKEiNofRLywmqgIZbG/7
 IWgj6dY8e5H++6z9YwpqNzkn1jh67V5mnP/4D4Mp0Zx/VzPtxYXwQNaeuh+FJwSSLIZr
 yLM+mnrFwvrnYmVYrf7N7Z42M1yejZRJvgVL6b7toyL2GwmQR59Qh+Cj7gUZEd24jvdp
 BMAw==
X-Gm-Message-State: AOAM531bQPFqxG+NAVzKMtKxw+u0HynSzNxLlTXTEk8DXgoh7RvbpNw7
 lNIJhRyVOg4XLJDr17qnUKY=
X-Google-Smtp-Source: ABdhPJzZ/n/c5toEAWjdwCntIeRgVObVWoTwUoxNq25z0L3JlP1IwlRK5hoW1zpdPOdgFcDzIos5rA==
X-Received: by 2002:aa7:8387:: with SMTP id u7mr2816888pfm.90.1591795715320;
 Wed, 10 Jun 2020 06:28:35 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id c12sm1505576pgm.73.2020.06.10.06.28.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Jun 2020 06:28:34 -0700 (PDT)
Date: Wed, 10 Jun 2020 06:28:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
Subject: Re: [PATCH v4] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
Message-ID: <20200610132833.GA237017@roeck-us.net>
References: <20200610082611.GA14266@cnn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200610082611.GA14266@cnn>
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
 linux-kernel@vger.kernel.org, patrickw3@fb.com, saipsdasari@fb.com,
 vijaykhemka@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jun 10, 2020 at 01:56:11PM +0530, Manikandan Elumalai wrote:
> The adm1278 temp attribute need it for openbmc platform .
> This feature not enabled by default, so PMON_CONFIG needs to enable it.
> 
> v4:
> Reported-by: kernel test robot <lkp@intel.com>
> ---
> changes in conditional check to enable vout & temp1 by default.
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

Applied (and I fixed the problem reported by 0-day, so no need to resend).

Thanks,
Guenter

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
> +		if (config & (ADM1278_VOUT_EN | ADM1278_TEMP1_EN) != ADM1278_VOUT_EN | ADM1278_TEMP1_EN) {
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
