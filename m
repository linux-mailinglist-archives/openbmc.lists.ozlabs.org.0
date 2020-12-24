Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E28BF2E23AF
	for <lists+openbmc@lfdr.de>; Thu, 24 Dec 2020 03:33:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D1Yyz1JXNzDqMT
	for <lists+openbmc@lfdr.de>; Thu, 24 Dec 2020 13:33:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.94.99;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=thu@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=aElC8l3K; 
 dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2099.outbound.protection.outlook.com [40.107.94.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D1Yy56PPBzDqMT
 for <openbmc@lists.ozlabs.org>; Thu, 24 Dec 2020 13:32:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HOLb8zpQZsVZGBD5b+FcZsAp1wSguWPGtLfpaHfOeHR3+K6TNwhmdV/aHU+owAW8TaJ7Q+3u7yBfBX4Ges9zHmsE38U1HnXnNa0gGtQbhvgX681gSehDnM+j6BcODDJKGQ4EV4+xbybip6X9a8a/r0ErwPdqe3vZigFX0X95IRiQrRr9ChnGOXHUVAVied7Hb9C6rg8XE8xr9DFO6IDc16CMY2h+Z2CsdbFk3fCzrwnwMxWGRMDWpE0oHT9GTqlCRf8xNSQN9s6IdYbPIlQsHJnDZSL5hYQ+09H6DB4gZ4IoEFEtT/uYOuD4RjmaCQ/mi0plrGc5nQhJE9MrQSBkew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Daqjs62kzkzECOGdU4A24a+EbRwdp0Ht94uW7xwgiWU=;
 b=RLmwidUsxL9IlcBCMi5cUevf1zfUWXxpdqiHmxLjKDzKh+J1d60Sl9+BmQ+CUb7/cwvDVA0yIEiZzfIFtSbeHcfz1w/JIIt6ol8WolmXFvQhveFURH8gue+7vrFdQlL6lCb0RDD+cWACJJ4tkF5woQKG+DF2JLU1bm9TcqjfFIhhTOV8OSwVP7unEQoZnf8SL87mQsrhPiuafDMoUsxJCgGhKqMovjZXWFSoOhtKkAWlEdXsr/dIDSp5+HEaCtGTl0sCIF8utWxhOzuKQQY9au1TUSRm8vv5HR4GHaSpPQ7DijIn6Zhy5LAWjgBs5U4zuSseaeVGtqGgLdfVZ9NmhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Daqjs62kzkzECOGdU4A24a+EbRwdp0Ht94uW7xwgiWU=;
 b=aElC8l3KqrC/fOojniSFYLnW0Cx7nIk8Yc3rx831LahvK7W8aJEDA5dQviPALgoR4RIQj7h3PH5glXmbTPZRXAmGLVGPPWRUlWFaK5aNKW0bbn4HqbGWjaGGGPeTTmuVDvCf+beb9eyaU+Z1pE9MLvxvYVLywKoSR99eFhbm+y4=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from BYAPR01MB5144.prod.exchangelabs.com (2603:10b6:a03:7e::17) by
 BYAPR01MB4022.prod.exchangelabs.com (2603:10b6:a03:5a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27; Thu, 24 Dec 2020 02:32:22 +0000
Received: from BYAPR01MB5144.prod.exchangelabs.com
 ([fe80::bce5:72fa:12ae:a830]) by BYAPR01MB5144.prod.exchangelabs.com
 ([fe80::bce5:72fa:12ae:a830%7]) with mapi id 15.20.3676.034; Thu, 24 Dec 2020
 02:32:21 +0000
Subject: Re: Phosphor-hwmon: reduce hwmonio::retries when sensor is
 Nonfunctional.
To: Lei Yu <yulei.sh@bytedance.com>
References: <44f90a87-391d-214e-0801-62e9429b3c34@amperemail.onmicrosoft.com>
 <933d55f5-5cd5-9b41-e0e1-50c0ee43b67c@amperemail.onmicrosoft.com>
 <CAGm54UEr=jX1jHFYG37BthZ0YoVeqcAtk3NrrFXf=ki7Vfzm5A@mail.gmail.com>
From: Thu Nguyen <thu@amperemail.onmicrosoft.com>
Message-ID: <2c526c72-bcad-4751-d18b-3b07ffd12964@amperemail.onmicrosoft.com>
Date: Thu, 24 Dec 2020 09:32:14 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
In-Reply-To: <CAGm54UEr=jX1jHFYG37BthZ0YoVeqcAtk3NrrFXf=ki7Vfzm5A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2PR0302CA0013.apcprd03.prod.outlook.com
 (2603:1096:202::23) To BYAPR01MB5144.prod.exchangelabs.com
 (2603:10b6:a03:7e::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.32.113] (118.69.219.201) by
 HK2PR0302CA0013.apcprd03.prod.outlook.com (2603:1096:202::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.12 via Frontend Transport; Thu, 24 Dec 2020 02:32:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 582e2cbb-fc61-4201-ce28-08d8a7b42460
X-MS-TrafficTypeDiagnostic: BYAPR01MB4022:
X-Microsoft-Antispam-PRVS: <BYAPR01MB4022C44EDCD3307C028ADCEA90DD0@BYAPR01MB4022.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ItcsQ13d2nN7rd2gNDW7mOIjcCxs6t8ceEOGQ5ri1dosP0smy7/3ZNdVxXg37mmsf0soVzp7iBjQrDvktpE4ZAHiiKJ3rEla+ga4vo/PSKUCJUBsF58xN8K4UN8uxFj376Gn2EQkK2zmtTnw10MmtuaB8/H0OocwjuAB6lREMla6CExaQVHGjL3lz+am3xRdZWDlt5B28kvZh4eyYrQ1fwXgObwt1UB2hZ/L1GtjJOcS6E8efV3WCvz/OPTnyrQzzEk/eNj1WgPA7Pqh92QCQO0BpjGkB5/tUrqBc00Oqc8oQHHA3naO5GiGqZ1N5RnyckyCbG7GAJ7gSzT/0pPPVp3KELMeBoaQboylH+HRuZnsZ2l5/4u2RX9l1O2QYp1IpqynDQsrrbVQOguy4Vcm9uboyoad934kAx5sDrlLoH9VChnDNuPKcNe5Ai4aMQcFy/VagxHrPKtZQty7vzzd+Z6N/bomVmGRVV/99vxErmc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB5144.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(376002)(346002)(136003)(366004)(6666004)(2906002)(16526019)(8936002)(186003)(6486002)(6916009)(26005)(42882007)(4326008)(2616005)(53546011)(956004)(478600001)(19627235002)(16576012)(66476007)(83170400001)(5660300002)(8676002)(31686004)(31696002)(52116002)(316002)(83380400001)(66946007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MkY2aUdIV0p5NEdMZUNWckVxRGhiZ1N0TEZvWEdKenVQeW8vWklwdUtveDIv?=
 =?utf-8?B?YjFYUkV1ZmM2NC9VaDFIWmJGLzYyc1lUcmJCZzU0c25sOEthUWJsRzdUaEtL?=
 =?utf-8?B?bzB6OUU3M3RKaEtHM0ZiWUVKUWt6QTk5amdsengvQzEwSGFla2w5Q01JNHph?=
 =?utf-8?B?R1k2UlYySkc1N0hXMlp5SDZFZ0QvUTJHT3JhbCtianpSVENlSzNuU01aeU5B?=
 =?utf-8?B?N1Jya2RDejZBUVM2d09oZFV5NlVuV2Q2MVhoU2RyaExhTmIvTTNJRU0wQlZy?=
 =?utf-8?B?SFJvTWViN0c0Q2ZTQytxM1ZqeGlrd2tkT21lQWtGTFl3bkhkUXhpbjlxRS91?=
 =?utf-8?B?dmI0RTJhR1dLVEQzS2VLSzY4ZW94VUI3VlQ2TVBVOGpqb0FQSGN5TTZTckdC?=
 =?utf-8?B?QklydW5senp6MmJmczB5dlVzTnByMTN5cUVvdVA2b2RBTkh4aXFvWXhnbGp0?=
 =?utf-8?B?aWc1VTY4WVNUQTNWMHdBN09aV2NRdFZmbGZES3dZL05aSUVHWFFHZ2VERjBM?=
 =?utf-8?B?VGJXTks4bFN5czZ4Z3dKMFhpSGRRYlV2VmdzNHBmUUdiVTc4WDd1Ry9UNjZW?=
 =?utf-8?B?U2JLbDAxTFEwNEJaWWtOd003c2Q3K2NwYjljL0Y4VmFTS1NvODVCNWdhSHly?=
 =?utf-8?B?ek10aHAxYzZSV2VCb1dybEZPZzBLbWtFbmo5bmdYQVV5L2puOWtNWTRxRkN3?=
 =?utf-8?B?Y1RNTWJhRTgrOE41aWtKWGlwS1pqbTJvVmpqWHFyVGRhUjVkcGkxZUZHMTZ2?=
 =?utf-8?B?MlpBVkdmZDRpR29yd1cvTnBORDQ3R2dhdXE1ZnFucElkWmpIN0c4R0dKVkJO?=
 =?utf-8?B?Nmw1Zjc3Y2J1QlJUY0F6WFhIOHkzZTFRbFUzN1ZvbUhhMFlzOVk4b2ZTR1hI?=
 =?utf-8?B?V3ZxTUxKL0Jjc1NiL0F4UzgyZEtkNDlORy9yVDdXWGdaUytHOUlMdllHdWdL?=
 =?utf-8?B?UWdvbzdSY0p3bDhpbWd3MkRYS2xlQVJtQkU4OWdJUHUyRWFjSWFodGZodWMw?=
 =?utf-8?B?N1VMTTVXTkdGb2ROTGYwQWxNUXliMW1VT29RRlgrdTNkTzh3THlOeUYvR2cy?=
 =?utf-8?B?M0RlcnM4bkF1Z3NZSkJKUTVRY1JaWVpZd09ZbWJPTEJKMkxNYkkyYnRpRk90?=
 =?utf-8?B?eWhmeVN1Q0I2d25NYTQzbVVlR25VZU03K1pHVlAyUmdYSUl3MEVORXpzc09I?=
 =?utf-8?B?VXRaMS80UDRodnhlYXZDeEU3YThVME9jUEtzakpES3Z1ZTNXNEtFaU1WenVX?=
 =?utf-8?B?WUxOaXc2N2s1RCs0UERDMjJpOUhPSmxsWXZ1dWF1SmxTdXN6V3B2M3Vsclhx?=
 =?utf-8?Q?EIroKC7dHQy8lLHxqRY2FWOGI3yjeGMopn?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB5144.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2020 02:32:21.7052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-Network-Message-Id: 582e2cbb-fc61-4201-ce28-08d8a7b42460
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aWMzP3HBGW/aBG3wTavwj6RohBhmvumnJhDzPdI+ZoHg5LalvNgRr41N3ELdNKrrARuhoP6EEN0WeED6t+7kq80OrsasCkH3xtNm9ts8+gw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB4022
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/24/20 08:52, Lei Yu wrote:
> On Wed, Dec 23, 2020 at 11:33 PM Thu Nguyen
> <thu@amperemail.onmicrosoft.com> wrote:
>> On 12/16/20 14:33, Thu Nguyen wrote:
>>> Hi All,
>>>
>>>
>>> I'm working with Fan sensors on Ampere MtJade platform.
>>>
>>> In this platform, I have multiple fans which name as FAN3_1, FAN3_2,
>>> FAN4_1, FAN4_2, FAN5_1...
>>>
>>> I added the configuration for those fans in phosphor-hwmon and I also
>>> added option "--enable-update-functional-on-fail" in phosphor-hwmon
>>> build flag. I'm trying to set fan functional to false when unplug fan.
>>>
>>> Flash new image to the board, read functional of fans. The time to
>>> read dbus property is about 0.05->0.1 seconds:
>>>
>>> root@mtjade:~# time busctl get-property
>>> xyz.openbmc_project.Hwmon-1644477290.Hwmon1
>>> /xyz/openbmc_project/sensors/fan_tach/FAN4_2
>>> xyz.openbmc_project.State.Decorator.OperationalStatus Functional
>>> b true
>>>
>>> real    0m0.078s
>>> user    0m0.002s
>>> sys    0m0.032s
>>> root@mtjade:~# time busctl get-property
>>> xyz.openbmc_project.Hwmon-1644477290.Hwmon1
>>> /xyz/openbmc_project/sensors/fan_tach/FAN3_2
>>> xyz.openbmc_project.State.Decorator.OperationalStatus Functional
>>> b true
>>>
>>>
>>> real    0m0.044s
>>> user    0m0.001s
>>> sys    0m0.034s
>>>
>>> After unplug one fan (FAN4_2), I can see that fan functional of FAN4_2
>>> is set to false as expected. And functional of others fans keeps
>>> true. But the time to get dbus properties of all fans have a huge
>>> increasement event in the working fans.
>>>
>>> ~# time busctl get-property
>>> xyz.openbmc_project.Hwmon-1644477290.Hwmon1
>>> /xyz/openbmc_project/sensors/fan_tach/FAN4_2
>>> xyz.openbmc_project.State.Decorator.OperationalStatus Functional
>>> b false
>>>
>>> real    0m1.189s
>>> user    0m0.001s
>>> sys    0m0.036s
>>>
>>> ~# time busctl get-property
>>> xyz.openbmc_project.Hwmon-1644477290.Hwmon1
>>> /xyz/openbmc_project/sensors/fan_tach/FAN3_2
>>> xyz.openbmc_project.State.Decorator.OperationalStatus Functional
>>> b true
>>>
>>> real    0m3.285s
>>> user    0m0.010s
>>> sys    0m0.028s
>>>
>>> The "ipmitool sdr type 0x4" commands is also failed because this
>>> increasement.
>>>
>>> ~$ time ipmitool -I lanplus -U root -P 0penBmc -C 17 -H <BMCIP> sdr
>>> type 0x4
>>> FAN3_1           | 25h | ok  | 29.13 | 5100 RPM
>>> FAN3_2           | 28h | ok  | 29.16 | 4700 RPM
>>> FAN4_1           | 2Bh | ns  | 29.19 | No Reading
>>> FAN4_2           | 2Eh | ns  | 29.22 | No Reading
>>> FAN5_1           | 31h | ns  | 29.25 | No Reading
>>> FAN5_2           | 34h | ns  | 29.28 | No Reading
>>> FAN6_1           | 37h | ns  | 29.31 | No Reading
>>> FAN6_2           | 3Ah | ns  | 29.34 | No Reading
>>> FAN7_1           | 3Dh | ns  | 29.37 | No Reading
>>> FAN7_2           | 40h | ns  | 29.40 | No Reading
>>> FAN8_1           | 43h | ns  | 29.43 | No Reading
>>> FAN8_2           | 46h | ns  | 29.46 | No Reading
>>> PSU0_fan1        | F5h | ns  | 29.60 | No Reading
>>> PSU1_fan1        | F6h | ns  | 29.61 | No Reading
>>>
>>> real    2m43.704s
>>> user    0m0.046s
>>> sys    0m0.057s
>>>
>>> The cause of this increasement is when it failed to read one sensor
>>> phosphor-hwmon keep trying to read the sensors with the retry is 10
>>> and the 100ms delays between retry times.
>>>
>>> Should we reduce the retry for non-functional sensors?
> When a fan is unplugged, its "Present" property should be false as well.
> Maybe you could check that property and skip such fans?
>
In the sensor Dbus object, we don't have the present property. The 
present property is belong to the inventory object of the phosphor-fan.

If using present properties, we have to map the fan sensor name with the 
corresponding inventory object. We will break the generic character of 
phosphor-hwmon.

As my opinion, for hotplug supporting devices such as fans, we should 
not retry when failed to read. Because there are no difference between 
the fan sensors are failed to read or the fan sensors are unplugged with 
the fan.

Is it reasonable to retry to read the failed sensors after each 0.1 
seconds?

>>>
>>> Regards.
>>>
>>> Thu Nguyen
>> Hi All,
>>
>> Any feed back on this?
>>
>> Thu Nguyen,
>>
>

