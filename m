Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5214DD483
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 06:54:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKYB83v5Tz30Cm
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 16:54:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=2bqIbxx7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=roeck-us.net (client-ip=192.185.143.33;
 helo=gateway31.websitewelcome.com; envelope-from=linux@roeck-us.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256
 header.s=default header.b=2bqIbxx7; dkim-atps=neutral
X-Greylist: delayed 1338 seconds by postgrey-1.36 at boromir;
 Fri, 18 Mar 2022 16:54:13 AEDT
Received: from gateway31.websitewelcome.com (gateway31.websitewelcome.com
 [192.185.143.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKY9d5vPCz2ynj
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 16:54:13 +1100 (AEDT)
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway31.websitewelcome.com (Postfix) with ESMTP id 8D3F65D438
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 00:31:51 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
 by cmsmtp with SMTP
 id V5DLnI3z7RnrrV5DLnkKZK; Fri, 18 Mar 2022 00:31:51 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nHjdoFFbTloWbSbcTB9Xd34hQqBVAfoUskKY6xI1CyI=; b=2bqIbxx7e306+T8LJxWfDkxoYc
 w3cumUWMA3SAP46t8b0qOMPbYPHfC4hBJ7EDHLxF/OmFeL17WTO9yqB1exvoVb6wvFaFjiQHbduz4
 PTpbxVn3q+XvcH9OaK0tWBFSHIOKuz6lV7UD6N3Hkky0sErv/l8EuEOBxiKBV6kK7b9SdVViHovuN
 qnJo2FF8NWNEDbCBMdtaWcFDShg6mHpHtRyH8zhGyBSO+a6o6SH5Y83NcJyDtTg+AEQAWwLxi+V6P
 HNUJ76elTgs03NEPvqMrdHdkYFHi4MbSEafi7Oa2Yrj22ymSYT5EDMZjWEbRyR4xq+NCqS8NDDd1M
 EciZt6Ag==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:57536 helo=localhost)
 by bh-25.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@roeck-us.net>)
 id 1nV5DK-001Put-W5; Fri, 18 Mar 2022 05:31:51 +0000
Date: Thu, 17 Mar 2022 22:31:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Brandon Wyman <bjwyman@gmail.com>
Subject: Re: [PATCH] hwmon: (pmbus) Add Vin unit off handling
Message-ID: <20220318053149.GA3333429@roeck-us.net>
References: <20220317232123.2103592-1-bjwyman@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317232123.2103592-1-bjwyman@gmail.com>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nV5DK-001Put-W5
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost)
 [108.223.40.66]:57536
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 5
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
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
 linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Mar 17, 2022 at 11:21:23PM +0000, Brandon Wyman wrote:
> If there is an input undervoltage fault, reported in STATUS_INPUT
> command response, there is quite likely a "Unit Off For Insufficient
> Input Voltage" condition as well.
> 
> Add a constant for bit 3 of STATUS_INPUT. Update the Vin limit
> attributes to include both bits in the mask for clearing faults.
> 
> If an input undervoltage fault occurs, causing a unit off for
> insufficient input voltage, but the unit is off bit is not cleared, the
> STATUS_WORD will not be updated to clear the input fault condition.
> Including the unit is off bit (bit 3) allows for the input fault
> condition to completely clear.
> 
> Signed-off-by: Brandon Wyman <bjwyman@gmail.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/pmbus.h      | 1 +
>  drivers/hwmon/pmbus/pmbus_core.c | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index e0aa8aa46d8c..ef3a8ecde4df 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -319,6 +319,7 @@ enum pmbus_fan_mode { percent = 0, rpm };
>  /*
>   * STATUS_VOUT, STATUS_INPUT
>   */
> +#define PB_VOLTAGE_VIN_OFF		BIT(3)
>  #define PB_VOLTAGE_UV_FAULT		BIT(4)
>  #define PB_VOLTAGE_UV_WARNING		BIT(5)
>  #define PB_VOLTAGE_OV_WARNING		BIT(6)
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index ac2fbee1ba9c..a0d899dc81f0 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -1373,7 +1373,7 @@ static const struct pmbus_limit_attr vin_limit_attrs[] = {
>  		.reg = PMBUS_VIN_UV_FAULT_LIMIT,
>  		.attr = "lcrit",
>  		.alarm = "lcrit_alarm",
> -		.sbit = PB_VOLTAGE_UV_FAULT,
> +		.sbit = (PB_VOLTAGE_UV_FAULT | PB_VOLTAGE_VIN_OFF),
>  	}, {
>  		.reg = PMBUS_VIN_OV_WARN_LIMIT,
>  		.attr = "max",
