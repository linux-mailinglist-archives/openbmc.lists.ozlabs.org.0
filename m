Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1AE3FBDE9
	for <lists+openbmc@lfdr.de>; Mon, 30 Aug 2021 23:08:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gz2wN5pfGz2yJn
	for <lists+openbmc@lfdr.de>; Tue, 31 Aug 2021 07:08:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ne5M+gmN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d34;
 helo=mail-io1-xd34.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ne5M+gmN; dkim-atps=neutral
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gz2w21qyYz2xvG
 for <openbmc@lists.ozlabs.org>; Tue, 31 Aug 2021 07:07:45 +1000 (AEST)
Received: by mail-io1-xd34.google.com with SMTP id g9so21880229ioq.11
 for <openbmc@lists.ozlabs.org>; Mon, 30 Aug 2021 14:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=g5yL003HMqaHRo5YL2Nf3KKbD13P3l8kcGs2AKGZYpU=;
 b=ne5M+gmNn5PcZlSCwY8qx+B1r3x/aMhF5+tk4L36/MsSzTr3CGARYRr1tsJgJGpXpW
 NjrWiOWa3A+DGrGCqvqOLVY/639iQIP1X9ErnP8XVLWtrIgyK7skDbttJ3Uz2prvdccC
 Ji/vbZ7cfy8AtUCdPUJwqFNWbCotzkaEqRRnDhxYW+UlCzRw+xheESBu6APh+4IShKrl
 g5l3SGieySjJB6INSaP6K36wQz+iupSrfvzsY08t36TJj8NzZ/TtpeWc+sOv8BrH702/
 fpDOvw0ek826WbTCxeIy1VLr2TCrPGLb8pkspCNOK1zHNNUzKr+iMownqMZo3P1s087w
 tFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=g5yL003HMqaHRo5YL2Nf3KKbD13P3l8kcGs2AKGZYpU=;
 b=cS8U1wsJLQ2JTUScAw3Uao0O3bQJr4Irf5Hub9HedDwEc9mrv2tE25FJLeai+4Ij2n
 nzTwWadsLW9o+rKouXMHNL59y4ZxBTV9PqAgs2gzB9A8EzK60cTlmxerrUBmHh6kITha
 0TpFCMQegNaQMjquV6NFqD0UlM9BNNisWaS6UlT9DzEXDNsOIxH5WIwrXPuZBpWxJ8yj
 lkCrzV2nUabAKMcjZ+p77FI0tCBWak1TbT58RjfXGrBVe8uQTjCSdmG+TRqDJLGysS0R
 n0X3KUjZHg3B7qFPCDsdYlCxmagN11rIxbPA/432tI4GnP58irvx1ESAruhGIwglXBVX
 9m0g==
X-Gm-Message-State: AOAM533if90Etfs5AT9t+gEc7CCd+9ZEbPm1kU4d7RbANLH7oVFktdWW
 +4UMroY0LJrVwzik2KCQYX8=
X-Google-Smtp-Source: ABdhPJyY/fXXZi//wASNXGJl8Ch8FW63ZZ4b1Fkl9cJohC1YS/+m4kBZW8Neyxb8M3NZi0WOr/bjQw==
X-Received: by 2002:a05:6638:d85:: with SMTP id l5mr342434jaj.2.1630357662375; 
 Mon, 30 Aug 2021 14:07:42 -0700 (PDT)
Received: from [192.168.4.31] (199-48-94-117.rochmnaa.metronetinc.net.
 [199.48.94.117])
 by smtp.gmail.com with ESMTPSA id b10sm8947921ils.13.2021.08.30.14.07.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 14:07:41 -0700 (PDT)
Subject: Re: [PATCH] hwmon: (pmbus/ibm-cffps) Do not swap max_power_out
To: Eddie James <eajames@linux.ibm.com>, Guenter Roeck <linux@roeck-us.net>
References: <20210827230433.3596370-1-bjwyman@gmail.com>
 <20210828155250.GA820265@roeck-us.net>
 <e9de99d88fb9e2e34552806fa47efa488332325c.camel@linux.ibm.com>
From: Brandon Wyman <bjwyman@gmail.com>
Message-ID: <cac545d4-3840-898c-4950-8262fea9e2ab@gmail.com>
Date: Mon, 30 Aug 2021 16:07:41 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e9de99d88fb9e2e34552806fa47efa488332325c.camel@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org,
 Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 2021-08-30 08:50, Eddie James wrote:
> On Sat, 2021-08-28 at 08:52 -0700, Guenter Roeck wrote:
>> On Fri, Aug 27, 2021 at 11:04:33PM +0000, Brandon Wyman wrote:
>>> The bytes for max_power_out from the ibm-cffps devices do not need
>>> to be
>>> swapped.
>>>
>>> Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
>> Eddie, can you confirm this ?
> This can't be true for all the power supplies supported by this driver,
> no. I think we need to check the version first. Brandon, I tested this
> on witherspoon (which is psu version 1) and get 3148 watts. If it's not
> swapped, that would be 19468 watts...
>
> Thanks,
> Eddie
I had tested this on a variety of systems with a variety of different 
power supplies, but I did *NOT* test this on the Witherspoon power supplies.

This apparently requires a bit more thought to figure out how to handle 
the other types and also not get Witherspoon wrong.

Thanks for checking Eddie.

>> Thanks,
>> Guenter
>>
>>> ---
>>>   drivers/hwmon/pmbus/ibm-cffps.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/hwmon/pmbus/ibm-cffps.c
>>> b/drivers/hwmon/pmbus/ibm-cffps.c
>>> index df712ce4b164..29b77f192c9e 100644
>>> --- a/drivers/hwmon/pmbus/ibm-cffps.c
>>> +++ b/drivers/hwmon/pmbus/ibm-cffps.c
>>> @@ -171,7 +171,7 @@ static ssize_t ibm_cffps_debugfs_read(struct
>>> file *file, char __user *buf,
>>>   		cmd = CFFPS_SN_CMD;
>>>   		break;
>>>   	case CFFPS_DEBUGFS_MAX_POWER_OUT:
>>> -		rc = i2c_smbus_read_word_swapped(psu->client,
>>> +		rc = i2c_smbus_read_word_data(psu->client,
>>>   						 CFFPS_MAX_POWER_OUT_CM
>>> D);
>>>   		if (rc < 0)
>>>   			return rc;
>>> -- 
>>> 2.25.1
>>>
