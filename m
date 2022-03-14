Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 281BB4D79FF
	for <lists+openbmc@lfdr.de>; Mon, 14 Mar 2022 05:57:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KH46N4VZsz30Fn
	for <lists+openbmc@lfdr.de>; Mon, 14 Mar 2022 15:57:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=r/H41ZX1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=roeck-us.net (client-ip=192.185.149.101;
 helo=gateway34.websitewelcome.com; envelope-from=linux@roeck-us.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256
 header.s=default header.b=r/H41ZX1; dkim-atps=neutral
X-Greylist: delayed 1221 seconds by postgrey-1.36 at boromir;
 Mon, 14 Mar 2022 15:57:22 AEDT
Received: from gateway34.websitewelcome.com (gateway34.websitewelcome.com
 [192.185.149.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KH45t2HxBz2xMQ
 for <openbmc@lists.ozlabs.org>; Mon, 14 Mar 2022 15:57:22 +1100 (AEDT)
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
 by gateway34.websitewelcome.com (Postfix) with ESMTP id E1B3237D6A0
 for <openbmc@lists.ozlabs.org>; Sun, 13 Mar 2022 23:36:57 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
 by cmsmtp with SMTP
 id TcS1n0Z66XvvJTcS1nFkRh; Sun, 13 Mar 2022 23:36:57 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TPMJ1EhsFnNaIQ2r4ew3lUN+ygZdnSd9hmHS3o56OHo=; b=r/H41ZX15ieWhGnDNOloEgnOv5
 CRQpcovtgeun9GkyVBYU/12GwMCTjSbyC99rFwU4HTV/+QJcZoIvo75GcyUHZ43gYLOQfVrf9PuIi
 OyxRhcfaJRJNnnt8UjG9InJFGHANH2dgvWAprJDiw3tYTgl+Qji0ohMKwx2z8XHSFj4tMJiyC1Qev
 o69URwaUIsA7P8RUVVxQmvN/Kmuayd8bsLmalPJY6+35Uli9q+msHOtvOUpgClTsDbgLRsv7aeX7z
 FpkW0SQMJ2gNH7tKtqhuhIlZ28vLka64fjCV96pafmb+eZ8ymCQelfnU4xXktoTzML1gVGd0d06Rn
 h8vSMOvg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:54246)
 by bh-25.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@roeck-us.net>)
 id 1nTcS1-001k4n-59; Mon, 14 Mar 2022 04:36:57 +0000
Message-ID: <fa8b2d9f-e5c9-73f4-3916-84e370748687@roeck-us.net>
Date: Sun, 13 Mar 2022 21:36:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] hwmon: (pmbus/ibm-cffps) Add clear_faults debugfs entry
Content-Language: en-US
To: Brandon Wyman <bjwyman@gmail.com>, Joel Stanley <joel@jms.id.au>,
 openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>,
 Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220311181014.3448936-1-bjwyman@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220311181014.3448936-1-bjwyman@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nTcS1-001k4n-59
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 [108.223.40.66]:54246
X-Source-Auth: linux@roeck-us.net
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/11/22 10:10, Brandon Wyman wrote:
> Add a clear_faults write-only debugfs entry for the ibm-cffps device
> driver.
> 
> Certain IBM power supplies require clearing some latched faults in order
> to indicate that the fault has indeed been observed/noticed.
> 

That is insufficient, sorry. Please provide the affected power supplies as
well as the affected faults, and confirm that the problem still exists
in v5.17-rc6 or later kernels - or, more specifically, in any kernel which
includes commit 35f165f08950 ("hwmon: (pmbus) Clear pmbus fault/warning
bits after read").

Thanks,
Guenter

> Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
> ---
> V1 -> V2: Explain why this change is needed
> 
>   drivers/hwmon/pmbus/ibm-cffps.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
> index e3294a1a54bb..3f02dde02a4b 100644
> --- a/drivers/hwmon/pmbus/ibm-cffps.c
> +++ b/drivers/hwmon/pmbus/ibm-cffps.c
> @@ -67,6 +67,7 @@ enum {
>   	CFFPS_DEBUGFS_CCIN,
>   	CFFPS_DEBUGFS_FW,
>   	CFFPS_DEBUGFS_ON_OFF_CONFIG,
> +	CFFPS_DEBUGFS_CLEAR_FAULTS,
>   	CFFPS_DEBUGFS_NUM_ENTRIES
>   };
>   
> @@ -274,6 +275,13 @@ static ssize_t ibm_cffps_debugfs_write(struct file *file,
>   		if (rc)
>   			return rc;
>   
> +		rc = 1;
> +		break;
> +	case CFFPS_DEBUGFS_CLEAR_FAULTS:
> +		rc = i2c_smbus_write_byte(psu->client, PMBUS_CLEAR_FAULTS);
> +		if (rc < 0)
> +			return rc;
> +
>   		rc = 1;
>   		break;
>   	default:
> @@ -607,6 +615,9 @@ static int ibm_cffps_probe(struct i2c_client *client)
>   	debugfs_create_file("on_off_config", 0644, ibm_cffps_dir,
>   			    &psu->debugfs_entries[CFFPS_DEBUGFS_ON_OFF_CONFIG],
>   			    &ibm_cffps_fops);
> +	debugfs_create_file("clear_faults", 0200, ibm_cffps_dir,
> +			    &psu->debugfs_entries[CFFPS_DEBUGFS_CLEAR_FAULTS],
> +			    &ibm_cffps_fops);
>   
>   	return 0;
>   }

