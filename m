Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E834D574C
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 02:22:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KF7Sk698Fz2yV7
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 12:21:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=bfXiwVit;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=roeck-us.net (client-ip=192.185.48.84;
 helo=gateway23.websitewelcome.com; envelope-from=linux@roeck-us.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256
 header.s=default header.b=bfXiwVit; dkim-atps=neutral
X-Greylist: delayed 1280 seconds by postgrey-1.36 at boromir;
 Fri, 11 Mar 2022 12:21:33 AEDT
Received: from gateway23.websitewelcome.com (gateway23.websitewelcome.com
 [192.185.48.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KF7SF3KsTz2y6K
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 12:21:33 +1100 (AEDT)
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
 by gateway23.websitewelcome.com (Postfix) with ESMTP id 3AA6E4C76
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2022 19:00:10 -0600 (CST)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
 by cmsmtp with SMTP
 id STdantxZt9AGSSTdan8Bw5; Thu, 10 Mar 2022 19:00:10 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YrYcmX1/YLKPFplyGX4juPlh6LZE8D01pZWFuhgPaPo=; b=bfXiwVit+FdkOiMo8rqatyjIx5
 Hj+itje0sHNCV089kohxPRKB7bSSNrl3ChZ/+Mi8vVmUl7MKyJNdLxUDx/qSqIXzfYHK8EBACrmuQ
 ubvMIz3c3SdJuC5onEYF6cOzSuEBewaqTwz4+oqH8ta+DuKKGk9BZDuW/yWskAcpJNb3wA+BTSAkz
 BKKn0ha2ou57FBO9SFksMjms5ebQEp54rSVId7eBqMq647syMiFIIbSLdCViRLwC+3i1UvxNMj1Ie
 k2fyl1rYlbLOXi+rUIbQnYR3403exhCZSMX0S1jwCluUoiPaPSdYUssldDpyVjYdSyZ+9G8Kaoz4Q
 7UdPFSlw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:54240)
 by bh-25.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@roeck-us.net>)
 id 1nSTdZ-001lMl-KX; Fri, 11 Mar 2022 01:00:09 +0000
Message-ID: <3602c1b2-1335-0663-c96a-c524c555ccc9@roeck-us.net>
Date: Thu, 10 Mar 2022 17:00:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] hwmon: (pmbus/ibm-cffps) Add clear_faults debugfs entry
Content-Language: en-US
To: Brandon Wyman <bjwyman@gmail.com>, Joel Stanley <joel@jms.id.au>,
 openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>,
 Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220311001858.4166205-1-bjwyman@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220311001858.4166205-1-bjwyman@gmail.com>
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
X-Exim-ID: 1nSTdZ-001lMl-KX
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 [108.223.40.66]:54240
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

On 3/10/22 16:18, Brandon Wyman wrote:
> Add a clear_faults write-only debugfs entry for the ibm-cffps device
> driver.
> 

This does not explain _why_ this would be needed.

Guenter

> Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
> ---
>   drivers/hwmon/pmbus/ibm-cffps.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
> index e3294a1a54bb..fca2642a8ed4 100644
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

