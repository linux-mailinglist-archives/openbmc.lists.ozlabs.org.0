Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE6A46C970
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 01:41:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7yz13lRvz2ywb
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 11:41:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=AascMbPs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=AascMbPs; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7yyb53sfz2yfd
 for <openbmc@lists.ozlabs.org>; Wed,  8 Dec 2021 11:41:11 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-184-96.tukw.qwest.net
 [174.21.184.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 55EC913C;
 Tue,  7 Dec 2021 16:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1638924067;
 bh=s6ABec3cQrCcwPwEvvQilvY6nhXEAAn1Z6NWqTy6sz0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AascMbPsQDB9NcwR0tS32+ZQuxnkbYy7eC8g/a1ysYKFM9OO8D1vjBsGt7n8N+eRC
 N1MqH+iN/LQeiNztVbPSH843kHSOcucQxVctbvoIgBPtW8GJzyhsuFhsrjIRW2WZIp
 ru3PUKGWqQ2QR5HwwbL29x3D9A6WAliPtpHlweu4=
Date: Tue, 7 Dec 2021 16:41:02 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 1/2] hwmon: (pmbus) Add Delta AHE-50DC fan control
 module driver
Message-ID: <Ya//HhC8a1DmQQAx@hatter.bewilderbeest.net>
References: <20211207071521.543-1-zev@bewilderbeest.net>
 <20211207071521.543-2-zev@bewilderbeest.net>
 <20211207175015.GA772416@roeck-us.net>
 <Ya+0YDWIRBQFnEDb@hatter.bewilderbeest.net>
 <f30241ad-f3c4-ee78-22f3-405401615b61@roeck-us.net>
 <Ya/X46owU78iVbSO@hatter.bewilderbeest.net>
 <abc2e3bc-3806-dbd3-840c-e19154bc0587@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abc2e3bc-3806-dbd3-840c-e19154bc0587@roeck-us.net>
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

On Tue, Dec 07, 2021 at 03:15:18PM PST, Guenter Roeck wrote:
>On 12/7/21 1:53 PM, Zev Weiss wrote:
>>On Tue, Dec 07, 2021 at 11:44:01AM PST, Guenter Roeck wrote:
>>>On 12/7/21 11:22 AM, Zev Weiss wrote:
>>>>On Tue, Dec 07, 2021 at 09:50:15AM PST, Guenter Roeck wrote:
>>>>>On Mon, Dec 06, 2021 at 11:15:20PM -0800, Zev Weiss wrote:
>>>>>>This device is an integrated module of the Delta AHE-50DC Open19 power
>>>>>>shelf.  For lack of proper documentation, this driver has been developed
>>>>>>referencing an existing (GPL) driver that was included in a code release
>>>>>>from LinkedIn [1].  It provides four fan speeds, four temperatures, and
>>>>>>one voltage reading, as well as a handful of warning and fault
>>>>>>indicators.
>>>>>>
>>>>>>[1] https://github.com/linkedin/o19-bmc-firmware/blob/master/meta-openbmc/meta-linkedin/meta-deltapower/recipes-kernel/fancontrol-mod/files/fancontrol.c
>>>>>>
>>>>>
>>>>>Hmm, that reference isn't really accurate anymore. I think it would be
>>>>>better to just say that the device was found to be PMBus compliant.
>>>>
>>>>Sure, will do.
>>>>
>>>
>>>Makes me wonder: How do you know that the referenced driver is for Delta AHE-50DC ?
>>
>>We'd been waiting for the source code for the software it ships with for a while, and were finally provided with that repo; everything I've observed from the factory software is consistent with the code in that driver.  A sampling:
>>
>
>I assume you mean "Delta AHE-50DC" when you refer to "it".
>

Yes.

>[ ... ]
>>>Can you check this with real hardware, by any chance ?
>>>
>>
>>If you mean running that code on it, yes -- here's the userspace utility that invokes that library routine:
>>
>>     root@bmc-oob:~# fan-util.sh
>>     fan1 speed: 7860 RPM
>>     fan2 speed: 7860 RPM
>>     fan3 speed: 7620 RPM
>>     fan4 speed: 7560 RPM
>>     temperature1: 29.20 C
>>     temperature2: 27.80 C
>>     temperature3: 28.50 C
>>     temperature4: 30.20 C
>>     vin_undervolt_fault: no
>>     overtemperature_warning: no
>>     fan_fault: no
>>     fan_warning: no
>>     fan_status: ok
>>
>
>That doesn't really tell me anything in the context of the driver you submitted.
>Would it be possible to install your driver and provide the output from the
>"sensors" command ? It should match the information from the proprietary
>driver/tool.
>

Thanks, in doing so I realized I'd neglected to prevent reads from 
unsupported registers in the read_word_data function, which was leading 
to the driver producing sysfs files for meaningless sensor limits that 
the device doesn't actually support.  With that fix (which I'll include 
in v4):

     root@ahe-50dc:~# /tmp/sensors 'ahe50dc_fan-*'
     ahe50dc_fan-i2c-28-30
     Adapter: i2c-8-mux (chan_id 0)
     vin:          12.29 V  
     fan1:        7680 RPM
     fan2:        7860 RPM
     fan3:        7680 RPM
     fan4:        7380 RPM
     temp1:        +27.8 C  
     temp2:        +23.4 C  
     temp3:        +25.3 C  
     temp4:        +24.5 C  



Zev

