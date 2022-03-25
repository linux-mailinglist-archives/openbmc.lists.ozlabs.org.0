Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C74664E6EAE
	for <lists+openbmc@lfdr.de>; Fri, 25 Mar 2022 08:16:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPtfw4KkKz30Dv
	for <lists+openbmc@lfdr.de>; Fri, 25 Mar 2022 18:16:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=b9BjekcC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eaa::704;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=b9BjekcC; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20704.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::704])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPtdZ2Lvnz30CJ
 for <openbmc@lists.ozlabs.org>; Fri, 25 Mar 2022 18:14:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ide5y+2YlFKRZbQRauyWpuU4Wh//LOLCC+N45HcB6LENqD6hIDoObD/b2RFgKQDysXa/3dyLhgtmMv74fKX3cqZHgYFB01rBX+1gHkApaqx9s2wWHHe6CfoL35XdQYYtWpg207wCvrfidG2a23e7yrJUQYn7QdiBfZi+9fHsV/0Dca0wk8UDPetSxY2u6v5WAeGRnjvtNOa1Mq5Cf/J5yIAKw3PsIrUo6t7jjAx7Z7/e8rQg0kByxVqz08rUnY8AU4oCqKVPnWGOwW/sE/TSC/HFr14jyU8zhgPmvl3vCv6yHT3yj+X8V/Miypt0xS35iX8VyLonFNaQFvO166DiiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Sxn7qp6E3pTWrkcC1Q5gL6xWu/qa6aBkWl++vfAxcU=;
 b=KRDs9arCKsb+LeKnjiLuOK23b28FHGLZ3kmbCSyi2Ww5JAOsd0vbMYLvLbJ75E1/o3rMiua3Wk31LAUE35WOf681Aaf7kdONpEL4jaZdfJ8+bDX3UCsGQb/JSsfFtOs8X6Y8MCReAe8LxsIXWNkgRrnerRp04ewIUZ7E2CQJUm91LtIxvHNQ9qxAgMj2MObFmw7gAcJovG8oGSVIdAow6jC5jKHJ3kzOk1cNNjSP4td9rTvY7TdKfx6Nk+2PaFk02190B5efZRwjKBdIrLfLSdyuqYHO2OazkXPMyUi+2dcFddnUtSo8x6A3RgTQfJNeDoCp3k7ebgC3zUSexP+PWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Sxn7qp6E3pTWrkcC1Q5gL6xWu/qa6aBkWl++vfAxcU=;
 b=b9BjekcChxoqgWwvdcK+S+FqTZQa2dQIyvLisnUI8FF45wMop/djPbviYh0lS5OIianXx1KD3Fu617CRV3OILQ1P9GydbiWXALduKVBGjLQI4lLeIrVu2a54s+S4vcr/zjv+sy1EqESQYC3E9b0AnnIpY9WCE9bAohnA8R/vLkk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 MW2PR0102MB3465.prod.exchangelabs.com (2603:10b6:302:5::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.18; Fri, 25 Mar 2022 07:14:50 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6%7]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 07:14:50 +0000
Message-ID: <ed4e33ea-9fbd-dfef-2747-6a60f4327a1d@os.amperecomputing.com>
Date: Fri, 25 Mar 2022 14:14:37 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v7 9/9] docs: ABI: testing: Document the Ampere Altra
 Family's SMpro sysfs interfaces
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220321081355.6802-1-quan@os.amperecomputing.com>
 <20220321081355.6802-10-quan@os.amperecomputing.com>
 <Yjg2AkYOCTi2CXc1@kroah.com>
 <8f01a63d-0d10-81ee-7398-b69e496964f8@os.amperecomputing.com>
 <YjhNbUDFUXsNkL+/@kroah.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <YjhNbUDFUXsNkL+/@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0036.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::11) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 562e3a41-5384-416c-0103-08da0e2f26a1
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3465:EE_
X-Microsoft-Antispam-PRVS: <MW2PR0102MB3465DE421920F06CF8BC1C8BF21A9@MW2PR0102MB3465.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +54Tn57nJt/M5oplHU7E9yqMn/wmBnvQGQ/XPNsHl2Wb11rQx1+FxZNCycpUCd5Wfnz2PBiWhQAdRWRsJjirAwz9Z1U/VtC9A1Bnnv28bLckWfzpIkdkrJedqXdPJK0r2rnQeve8LGG5z4mDA0EJV/VSmmuSHgHdfoy6wxLsvP6VL4UsK/Q0lE2XMdjeep4ATJlQ5cIzkIw+kKlMb25it1hcaK5VutAcPD7SK2hSCgnSRizIfp8c5ZtsASFuwz7Out1VgQwEzaE3DUW/miz0hljd3Tb4RPBhWNj1ypdvfhDvzVB+4fN5AhTPlW7KtapDv0f5p5JEuCmJFmHmL3Bw9DoblaMLfjkjTEYLzaQOKnKCGpn1QpOjmCTnxotxU0rFvtYjvsM3UprrP4963UJtDzoTYJ5ebw22kdwDHWndSJMjP/KoIcqzb/bqlut+WT4nEjuf1QGr35ssTb6GQG9K52hgr80sVIMyth2a2G36vIXWabnI0WwI3oXZAcFP5uha08cp+jzrFTIlCeImambmAwzVpu7j9oTrMaE0vMGtTg+d6PRNeR9KNPWpLRSrja2KguYEMPsAA7fEzOZKZ3ijtQBIAMryPQa1sh7v22G0N/riIje2JoWptylp7w6tsvBtekk4RSbeDT1Ub9wFW2BbhpL5pTNhlmVzA5Ee9HvnXeWmoZgXo6xRL53Ia5ypEZoM4HWzszOWF3pJZbwQxUCTbDyBvwO2PX5VLAinxc3aU2AOsRAe9gU5FrJCRYFUzYrm4cmydVrMvO1KqrxEFIFZpPBzibNoSDWNdl99wIqaKY0NVGyA3u7F8ug8U+pCWjW3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31686004)(8676002)(38100700002)(2616005)(86362001)(31696002)(53546011)(6512007)(7416002)(5660300002)(6506007)(6666004)(8936002)(52116002)(6916009)(66556008)(2906002)(38350700002)(54906003)(316002)(508600001)(66476007)(66946007)(107886003)(186003)(26005)(6486002)(4326008)(966005)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2dzNEkyWDhjenVzakxXLzNhbGdTMFJNZHFTQ2hPVXROT0VaTWZmd1FENUdt?=
 =?utf-8?B?OUpRZElVUi9FNWMyaFBsUmZZNkNQTHovS3RRWXVldVlVR2o4SXBMYWhmWWxF?=
 =?utf-8?B?ek1Gb1NTQTk0RGYrMVRlazFjSjNwbytKeWIrc3gzNU1ScWsreDJtQXFSbDJW?=
 =?utf-8?B?d3ZpUGgyQWJuZE1EVXZKZHBUR3lib2xCRFVHcVhlTU1FTEhBVGxFcWZYRTcv?=
 =?utf-8?B?Z2Y2Sk95TkJERmtvenNGMHBMOVNvd3BWR1ZGaHhzUEYxN1A4OUlXeE1ybVht?=
 =?utf-8?B?YmhrNi9PYndKaTNDc2YwS0tNSTVWa0F5QlZjWFJFMEorbWEzQTU3aDJXSTBt?=
 =?utf-8?B?SmJBVnRGbGFsVnpBRGFwTWZYdjNQbFllMWFhVXVtWVpVYWJwd3A2emErcEVK?=
 =?utf-8?B?aXpQMGpGUkxPdWRucWFRQlh2RWdhbFNBaG9kbEc0SlFsbGcyMzNXOGNKd2JM?=
 =?utf-8?B?Z1ZaNGpCUkZEbmJOLzkwMS9SZ1g1UmdES2hMWWtpUU5NOEp4cVd5Z1VMSW1s?=
 =?utf-8?B?dklPK2l0MlEyYW9xOGd6bzBKbVduMUlKZzUxZUpkZFNXb0lhS0FTd0ZYd3kz?=
 =?utf-8?B?akpMRHFyaTVkTDV4RUlWd3hadjBhY0lwZlB3WlZYUG9FMWZZbVYwNGNsdzdY?=
 =?utf-8?B?WVJXdXBwejAzZDEwY1lseDhaaUZFdU5NTE9zMm5sUWVTM0VIbEgvVmJoMUJn?=
 =?utf-8?B?ckZCU3Fkb0VSN09nYk5RNUV0WCtjQ00rVUxYck9qVDZjWHlWMi9IT3FrWHZP?=
 =?utf-8?B?b2tuck1zVS94T09ZRFRNOW9sSGJBY1U4bVVBZDRNa0c4cjZocGpuY3NnVWR1?=
 =?utf-8?B?YlZTSThuWUhZeVBNOU5HNWltN1BDckJDZ0IwcVBnZTh0MVVwUTJZd05hWm45?=
 =?utf-8?B?SzlJekx0b28rdTg5am1pQ0RJYlB2RlhMVC91dUJpbXhscm9vK2JMQllObm1z?=
 =?utf-8?B?VWZjV1BjQ1Z1Tmlzc0lEUGl0T08rTzZMOUtWU0NEM0tjQkZQcG9MWG1ycmFt?=
 =?utf-8?B?eWRnR0pYWmhJcWdXVUFVRWh6U2dxUmpOdnRaTi94cmYrZmlyTElBZi9Kak9G?=
 =?utf-8?B?YTZEdVdYQ0h0WUE1NVR2SVU4UlZ4OWxCRTJ6UWVnVmNkNzZLY0FDc2gzb3Bh?=
 =?utf-8?B?a0wxdlB4ZzB6dG1TTDlZYVJYRXY5OWhKYnp6cXFKNFRpWW5sY3pHWHJYMHd2?=
 =?utf-8?B?UDkyWjRjbzBrUUtKQ3V4STErTnN5RWdnUW9FTG9vT0VKblJXZlhIcWRSWWxk?=
 =?utf-8?B?aUE4TnoweTBodGdaVmxBTXY0a2VUMm56eld3RXB0MlhiSldFSVdsU1o4aGFR?=
 =?utf-8?B?ZVZRWHhWakgyamxTNE9HNEF3YTRHd2pJQi9oa1NNMnpzWnh0czgreFppMnds?=
 =?utf-8?B?SFNHUVo2ZFVGdFN2V2ZIU3lBRlNNVkMyakhmVVYweDg2YTBBLzQ2clY2cnNv?=
 =?utf-8?B?ZnJNdmlpRUZDVkFjLzh4VW5ZZFhGbzlPMHB1T2FNcDJzbW4xNEJranFxYXB4?=
 =?utf-8?B?anQvVVhOemlsWEhXbnlNVTlQU1Bhc1kwSENleTA1ZnBCS1p2Q29OZ3BJVHov?=
 =?utf-8?B?SWFISGU4dnQvSVVEQnAwTHNFdjlFejN0MDdmSldHS0hYV1VzbkhhdSt0aDRv?=
 =?utf-8?B?aFUra01yTm1URVlSYSt6S0VFSjJlNStHeW05cEcrZ081c25mTW96MFhCdGpG?=
 =?utf-8?B?UThMblAxeEFCVDVWeFdjbUdzSS9EWW1rUDQ4MEh6SjJDaHl0NHFvYWNUc2lQ?=
 =?utf-8?B?RmowK09UbmV5YlRiTk1mZUhwRG5CUm0vUUo1SjVyck5GZGkwYlZYVWZmcGFs?=
 =?utf-8?B?MkZRTjdmYWs4d1FTdTl4WU1JUTFyOWU0QUlEMkEyZXlFbENHblBFK05pekIx?=
 =?utf-8?B?eXFKcFBnT0VqallDTHV5ZHB2QWZHNXpuaFFQMnRJSlFhazZzeTNaaWpYYWgy?=
 =?utf-8?B?enFQZVNYdGNQd2gvc0JwN3Y4dGduR2g0WkI4ckE5TnRGTGVzL3k3NVl5Y2Rk?=
 =?utf-8?Q?VQ7oxZZqJOYWqpff0QS5Z55ZLF/Eyk=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 562e3a41-5384-416c-0103-08da0e2f26a1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 07:14:50.4577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tmo+Se+cJ5FNBqgTYoliKOn8CRQBCQAIOy6XqalJ0sflEIFTzJNaI43eKSxuC64+Zpx5Ibx8vzqMEYCsmx8xW5N2Bn2K2kcmQn56dPBrW38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3465
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
Cc: "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Phong Vo <phong@os.amperecomputing.com>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Thu Nguyen <thu@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Open Source Submission <patches@amperecomputing.com>,
 Lee Jones <lee.jones@linaro.org>, Derek Kiernan <derek.kiernan@xilinx.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 21/03/2022 17:03, Greg Kroah-Hartman wrote:
> On Mon, Mar 21, 2022 at 04:46:36PM +0700, Quan Nguyen wrote:
>>
>>
>> On 21/03/2022 15:23, Greg Kroah-Hartman wrote:
>>> On Mon, Mar 21, 2022 at 03:13:55PM +0700, Quan Nguyen wrote:
>>>> Add documentation for the Ampere(R)'s Altra(R) SMpro sysfs interfaces
>>>>
>>>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>>>> ---
>>>> Changes in v7:
>>>>     + First introduce in v7     [Greg]
>>>>
>>>>    .../sysfs-bus-platform-devices-ampere-smpro   | 133 ++++++++++++++++++
>>>>    1 file changed, 133 insertions(+)
>>>>    create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
>>>>
>>>> diff --git a/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
>>>> new file mode 100644
>>>> index 000000000000..9bfd8d6d0f71
>>>> --- /dev/null
>>>> +++ b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
>>>> @@ -0,0 +1,133 @@
>>>> +What:		/sys/bus/platform/devices/smpro-errmon.*/errors_[core|mem|pcie|other]_[ce|ue]
>>>
>>> Please split this out as one entry per file.
>>>
>>
>> These sysfs share same format of HW errors (the 48-byte Arm vendor specific
>> HW error record) but for separate HW domains: Core, PCIe, Mem... etc
>>
>>>> +KernelVersion:	5.14
>>>
>>> 5.14 is a long time ago.
>>>
>>>> +Contact:	quan@os.amperecomputing.com
>>>> +Description:
>>>> +		(RO) Contains the 48-byte Ampere (Vendor-Specific) Error Record, see [1]
>>>> +		printed in hex format as below:
>>>> +
>>>> +		AA BB CCCC DDDDDDDD DDDDDDDDDDDDDDDD DDDDDDDDDDDDDDDD \
>>>> +		   DDDDDDDDDDDDDDDD DDDDDDDDDDDDDDDD DDDDDDDDDDDDDDDD
>>>> +		Where:
>>>> +		  AA       : Error Type
>>>> +		  BB       : Subtype
>>>> +		  CCCC     : Instance
>>>> +		  DDD...DDD: Similar to the Arm RAS standard error record
>>>
>>> No, this is not a valid sysfs file, sorry.  This should just be one
>>> value per file.
>>>
>>
>> This 48-byte value is unable to separate into smaller values because it
>> contain all information necessary to indicate a single HW error as per ARM
>> RAS supplement document [1]. The format is to make it read-able other than a
>> single 48-byte hex value.
>>
>> [1] https://developer.arm.com/documentation/ddi0587/latest/
> 
> Just export the 48 byte hex value and make userspace split it up if it
> wants to do so.  Don't do things in the kernel that can be done in
> userspace.
> 

Thanks Greg for the suggestion,
Will do this in my next version.

Thanks,
- Quan
