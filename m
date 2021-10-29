Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8C043F8FE
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 10:34:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgbLz0rgBz2yfr
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 19:34:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=wA2tP0WH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=wA2tP0WH; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgbLW6B5tz2xvw
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 19:33:55 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id AB84A46117;
 Fri, 29 Oct 2021 08:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1635496428; x=1637310829; bh=886K21iDpauHtSCeaUCqis5/i
 p4sbpLIIlgqq0WXqgE=; b=wA2tP0WHIxr1OOG68lpolo40Qu5IYmyICEwtwobjr
 jRgh3tGQayJvXbN24cv9bdAuAhl6B4mVbEOd69CC6vSOC7nx14DZ9WZc1hX20BoU
 51qR8qAXgtG33f06mqDxF5B2NhxHVtKm8ZuHnMOIvbg2Dm1PPGVFWC5utFREiVm6
 fU=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xbuzaEeVWnw2; Fri, 29 Oct 2021 11:33:48 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 5916C45EF2;
 Fri, 29 Oct 2021 11:33:48 +0300 (MSK)
Received: from [10.199.10.105] (10.199.10.105) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 29
 Oct 2021 11:33:46 +0300
Message-ID: <8c73fd80b5e4672e7dcac777cd5d46bc5d6bf0e1.camel@yadro.com>
Subject: Re: [entity-manager] Question about temperature sensor stops update
From: Andrei Kartashev <a.kartashev@yadro.com>
To: "Chris Chen (TPI)" <Chris.Chen3@flex.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Date: Fri, 29 Oct 2021 11:33:38 +0300
In-Reply-To: <DM6PR08MB5514480BAD48B0B200646011DC879@DM6PR08MB5514.namprd08.prod.outlook.com>
References: <DM6PR08MB5514480BAD48B0B200646011DC879@DM6PR08MB5514.namprd08.prod.outlook.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.10.105]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
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

Hello,

I didn't catch, what is your problem. As I see from the logs,
everything is fine: temp sensors instantiated, dbus objects created,
readings present. What's wrong?

As for FruDevice: yes, it's kind of weird behaviour: it exposes not
only actual FRU devices but also other I2C devices. You can introspect
that objects and see that they exposes
xyz.openbmc_project.Inventory.Item.I2CDevice interface instead of
xyz.openbmc_project.FruDevice

On Fri, 2021-10-29 at 08:02 +0000, Chris Chen (TPI) wrote:FruDevice
> Hi everyone,
>  
> Actually, I have 2 questions as below:
>    1. I got understood from others on the mailing list, that I don't
> have to declare EEPROM or temp sensors on the I2C bus node in my dts,
> and it should be fine even I did it at the beginning. So I tried to
> remove this declaration in dts, then the sensor value I got is fixed,
> no update. Can someone help to take look at why it is?
>              Here are some logs that appeared automatically after the
> system booted up.  It looks like that entity-manager works fine. And
> the commands I used to check value.
>              =======================================
>              [   23.713596] lm75 6-0049: hwmon1: sensor 'tmp75'
>              [   23.718894] i2c i2c-6: new_device: Instantiated
> device tmp75 at 0x49
>              [   23.728520] lm75 6-004c: hwmon2: sensor 'tmp75'
>              [   23.733779] i2c i2c-6: new_device: Instantiated
> device tmp75 at 0x4c
>             [   23.743707] lm75 6-004d: hwmon3: sensor 'tmp75'
>             [   23.749042] i2c i2c-6: new_device: Instantiated device
> tmp75 at 0x4d
>  
>              # busctl introspect xyz.openbmc_project.HwmonTempSensor
> /xyz/openbmc_project/sensors/temperature/DIMM_P1_EFGH
>              xyz.openbmc_project.Sensor.Value                    
>  interface -         -                                        -
>              .MaxValue                                            
> property  d         127                                      emits-
> change
>              .MinValue                                            
> property  d         -128                                     emits-
> change
>              .Unit                                                
> property  s         "xyz.openbmc_project.Sensor.Value.Uni... emits-
> change
>              .Value                                              
>  property  d        40.187                                   emits-
> change writable
>  
>              # cat /sys/bus/i2c/devices/6-
> 004d/hwmon/hwmon3/temp1_input
>             40187
>             =======================================
>    1. From my understanding, there is "detection daemon" which scans
> I2C bus looking for EEPROMs with IPMI FRU data. However, I found all
> devices on the I2C buses would be listed, not only Fru devices, when
> I used the command below. Is this correct?
>             # busctl tree xyz.openbmc_project.FruDevice
>             `-/xyz
>               `-/xyz/openbmc_project
>                 `-/xyz/openbmc_project/FruDevice
>                   |-/xyz/openbmc_project/FruDevice/0_80
>                   |-/xyz/openbmc_project/FruDevice/0_88
>                   |-/xyz/openbmc_project/FruDevice/2_108
>                   |-/xyz/openbmc_project/FruDevice/2_112
>                   |-/xyz/openbmc_project/FruDevice/2_68
>                   |-/xyz/openbmc_project/FruDevice/2_72
>                   |-/xyz/openbmc_project/FruDevice/3_22
>                   |-/xyz/openbmc_project/FruDevice/3_50
>                   |-/xyz/openbmc_project/FruDevice/4_56
>                   |-/xyz/openbmc_project/FruDevice/5_48
>                   |-/xyz/openbmc_project/FruDevice/5_81
>                   |-/xyz/openbmc_project/FruDevice/6_73
>                   |-/xyz/openbmc_project/FruDevice/6_76
>                   |-/xyz/openbmc_project/FruDevice/6_77
>                   |-/xyz/openbmc_project/FruDevice/7_80
>                   |-/xyz/openbmc_project/FruDevice/7_88
>                   |-/xyz/openbmc_project/FruDevice/8_101
>                    `-/xyz/openbmc_project/FruDevice/hudsonbay    ß
> this is the probe name we define in JSON configuration
>  
> Thanks.
>  
> Regards,
> Chris Chen
> Legal Disclaimer :
> The information contained in this message may be privileged and
> confidential. 
> It is intended to be read only by the individual or entity to whom it
> is addressed 
> or by their designee. If the reader of this message is not the
> intended recipient, 
> is strictly prohibited. If you have received this message in error, 
> please immediately notify the sender and delete or destroy any copy
> of this message!

-- 
Best regards,
Andrei Kartashev


