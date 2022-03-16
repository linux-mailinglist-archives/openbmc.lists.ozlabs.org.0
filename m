Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C33E4DB9D8
	for <lists+openbmc@lfdr.de>; Wed, 16 Mar 2022 22:00:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJjN06xfGz30NB
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 08:00:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=kZCvQUup;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=roeck-us.net (client-ip=192.185.49.219;
 helo=gateway23.websitewelcome.com; envelope-from=linux@roeck-us.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256
 header.s=default header.b=kZCvQUup; dkim-atps=neutral
X-Greylist: delayed 1499 seconds by postgrey-1.36 at boromir;
 Thu, 17 Mar 2022 07:59:52 AEDT
Received: from gateway23.websitewelcome.com (gateway23.websitewelcome.com
 [192.185.49.219])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJjMX3kmqz3088
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 07:59:52 +1100 (AEDT)
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
 by gateway23.websitewelcome.com (Postfix) with ESMTP id 8AF8111D89
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2022 15:12:01 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
 by cmsmtp with SMTP
 id Ua01nNz4ndx86Ua01nHfFV; Wed, 16 Mar 2022 15:12:01 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tgGDz0arRuPsKFZcF95+McsnxVvuF34elrSQDilLy6M=; b=kZCvQUupt1LN8jucSGsOFqkUH+
 54NPNCu4PZ7Fzh6dw8pKdfiUKkm6oQilGnoOH6K+h8zSdnEBoQguwDKkRj+KTPBBVt1DtK92kgQ7+
 TGK7ud9mr6W9Q+D2+G/4xSrEnUa8vIgXNICPlW8wDVMlOaR239/L4G2c87rd4tKrmQOas+UMyBh12
 aeYyKy2Li6+PiXw6wgl6VjuGsnXK7hEKsmJNfHMPQ9RDR0vfJALk2heRBTx4tdx8jXSSSjdz8BHus
 5udkttlxlOF7Y40FxEH6jSFu2iZwnRjdktepHQ8WCZevA1WedSaQnGdgsehYLrBRjoFg1zuYff2Hk
 FID1UFQg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:54306)
 by bh-25.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@roeck-us.net>)
 id 1nUa00-000Zgt-Tk; Wed, 16 Mar 2022 20:12:00 +0000
Message-ID: <582086fe-1cc3-d161-a866-f4726d04a254@roeck-us.net>
Date: Wed, 16 Mar 2022 13:11:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Brandon Wyman <bjwyman@gmail.com>
References: <20220311181014.3448936-1-bjwyman@gmail.com>
 <fa8b2d9f-e5c9-73f4-3916-84e370748687@roeck-us.net>
 <CAK_vbW2S07+S8+PrQnBLjvXYnLBXU06FHBvfM2zaT6RYx9HO+g@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2] hwmon: (pmbus/ibm-cffps) Add clear_faults debugfs entry
In-Reply-To: <CAK_vbW2S07+S8+PrQnBLjvXYnLBXU06FHBvfM2zaT6RYx9HO+g@mail.gmail.com>
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
X-Exim-ID: 1nUa00-000Zgt-Tk
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 [108.223.40.66]:54306
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/16/22 13:03, Brandon Wyman wrote:
> On Sun, Mar 13, 2022 at 11:36 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 3/11/22 10:10, Brandon Wyman wrote:
>>> Add a clear_faults write-only debugfs entry for the ibm-cffps device
>>> driver.
>>>
>>> Certain IBM power supplies require clearing some latched faults in order
>>> to indicate that the fault has indeed been observed/noticed.
>>>
>>
>> That is insufficient, sorry. Please provide the affected power supplies as
>> well as the affected faults, and confirm that the problem still exists
>> in v5.17-rc6 or later kernels - or, more specifically, in any kernel which
>> includes commit 35f165f08950 ("hwmon: (pmbus) Clear pmbus fault/warning
>> bits after read").
>>
>> Thanks,
>> Guenter
> 
> Sorry for the delay in responding. I did some testing with commit
> 35f165f08950. I could not get that code to send the CLEAR_FAULTS
> command to the power supplies.
> 
> I can update the commit message to be more specific about which power
> supplies need this CLEAR_FAULTS sent, and which faults. It is observed
> with the 1600W power supplies (2B1E model). The faults that latch are
> the VIN_UV and INPUT faults in the STATUS_WORD. The corresponding
> STATUS_INPUT fault bits are VIN_UV_FAULT and Unit is Off.
> 

The point is that the respective fault bits should be reset when the
corresponding alarm attributes are read. This isn't about executing
a CLEAR_FAULTS command, but about selectively resetting fault bits
while ensuring that faults are reported at least once. Executing
CLEAR_FAULTS is a big hammer.

With the patch I pointed to in place, input (and other) faults should
be reset after the corresponding alarm attributes are read, assuming
that the condition no longer exists. If that does not happen, we should
fix the problem instead of deploying the big hammer.

Thanks,
Guenter

>>
>>> Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
>>> ---
>>> V1 -> V2: Explain why this change is needed
>>>
>>>    drivers/hwmon/pmbus/ibm-cffps.c | 11 +++++++++++
>>>    1 file changed, 11 insertions(+)
>>>
>>> diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
>>> index e3294a1a54bb..3f02dde02a4b 100644
>>> --- a/drivers/hwmon/pmbus/ibm-cffps.c
>>> +++ b/drivers/hwmon/pmbus/ibm-cffps.c
>>> @@ -67,6 +67,7 @@ enum {
>>>        CFFPS_DEBUGFS_CCIN,
>>>        CFFPS_DEBUGFS_FW,
>>>        CFFPS_DEBUGFS_ON_OFF_CONFIG,
>>> +     CFFPS_DEBUGFS_CLEAR_FAULTS,
>>>        CFFPS_DEBUGFS_NUM_ENTRIES
>>>    };
>>>
>>> @@ -274,6 +275,13 @@ static ssize_t ibm_cffps_debugfs_write(struct file *file,
>>>                if (rc)
>>>                        return rc;
>>>
>>> +             rc = 1;
>>> +             break;
>>> +     case CFFPS_DEBUGFS_CLEAR_FAULTS:
>>> +             rc = i2c_smbus_write_byte(psu->client, PMBUS_CLEAR_FAULTS);
>>> +             if (rc < 0)
>>> +                     return rc;
>>> +
>>>                rc = 1;
>>>                break;
>>>        default:
>>> @@ -607,6 +615,9 @@ static int ibm_cffps_probe(struct i2c_client *client)
>>>        debugfs_create_file("on_off_config", 0644, ibm_cffps_dir,
>>>                            &psu->debugfs_entries[CFFPS_DEBUGFS_ON_OFF_CONFIG],
>>>                            &ibm_cffps_fops);
>>> +     debugfs_create_file("clear_faults", 0200, ibm_cffps_dir,
>>> +                         &psu->debugfs_entries[CFFPS_DEBUGFS_CLEAR_FAULTS],
>>> +                         &ibm_cffps_fops);
>>>
>>>        return 0;
>>>    }
>>

