Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C83327E48
	for <lists+openbmc@lfdr.de>; Mon,  1 Mar 2021 13:28:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dq0146q9cz3cR9
	for <lists+openbmc@lfdr.de>; Mon,  1 Mar 2021 23:28:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=FnTF098o;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.68.118;
 helo=nam04-bn3-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=FnTF098o; 
 dkim-atps=neutral
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680118.outbound.protection.outlook.com [40.107.68.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dq00k5KcNz3bPK;
 Mon,  1 Mar 2021 23:28:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fCcskCkSwBT0hbsAdfTnVs6d2fu+6/Hm5Id7FJmSeNmp4lSOFik8gtu2yl6/6XoqqitAlmDrcsXNvYjNoLMe/lDGmbyU8EwYe+246MbSy666aOGVkbq3wkkJODezz2XZcFEX4mHnHPVRHnpJBC/5F1njtFcB2396BzQ4nKIceZjVwCQReMCKGmwC7d0ee2/9uYX9D8Nwhm9sH+3rLe/hnFrB5uzpUb8bpEl7O/704kHCdmwAi1aVycbOspE+Aq8bAGQL/4bSlGOu7w9Na01phHlZslPZx5dRg+B/n0pvPBMItiLo32Ka0SZgatIKYLqU9pGAuzbPU6F2HWLEVupFGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czvQAed9q+9pq+AaXIEi8Yqxi8trRjSJI0Y/mJy9Y8c=;
 b=fJtXAfFwVVXiDmUSlBvFS13kKaDBxR4+qehLyHMCt8m3Cw97nP/P2emroECKXjOhQEXajG5w7RErNrIB0iD0g9mnWWLPeKRMynWC2JQSMEZbVhj9QnIvEicQ1H1XwenElq8QZl97m1EfYQgh+tMrlmUkTp7HHICVFFkefg2Dt2eW7tEWB0H3RigVVohi3ZUcKuK8gS1+R8DcwDisNKyO9JCctTgsLcgeCamJ6ZiQhtgIgmllcD3J5JxgvXieGGvpp2z6tf3JLU2Hla8M0PqTUyMtBQ0A9ell2ZnQ5Jd8newqeswcNzF58QUz7teUOd7ZTnAZhjZCHxlKTicqQRI53g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czvQAed9q+9pq+AaXIEi8Yqxi8trRjSJI0Y/mJy9Y8c=;
 b=FnTF098osLu8uCVMcChbf+nI883TQpTxG4emX+j4EFbz1rFkOH3qbV4fZm5urXd161Z2G0w7OpP8XRDswuuByRInUvQh0/u4iyJvrjOtdIf2dleVzowS1eS132dQrzAL6l5JhdROsYOIHyLIk0DnTHcTCy05pxKCO3AbXhQv7Nc=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none; os.amperecomputing.com;
 dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR01MB2271.prod.exchangelabs.com (2603:10b6:300:21::8) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.20; Mon, 1 Mar 2021 12:28:11 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::682c:4e20:b53d:e660]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::682c:4e20:b53d:e660%7]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 12:28:11 +0000
Subject: Re: [PATCH 3/4] hwmon: smpro: Add Ampere's Altra smpro-hwmon driver
To: Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
References: <20210225101854.13896-1-quan@os.amperecomputing.com>
 <20210225101854.13896-4-quan@os.amperecomputing.com>
 <f38fb368-1ea7-d27d-0575-bac466dc56c7@roeck-us.net>
From: Quan Nguyen <quan@os.amperecomputing.com>
Message-ID: <d582c22f-d268-223b-7df4-eae3fdadd8cc@os.amperecomputing.com>
Date: Mon, 1 Mar 2021 19:28:00 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
In-Reply-To: <f38fb368-1ea7-d27d-0575-bac466dc56c7@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HKAPR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:203:d0::20) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.33.120] (118.69.219.201) by
 HKAPR04CA0010.apcprd04.prod.outlook.com (2603:1096:203:d0::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.20 via Frontend Transport; Mon, 1 Mar 2021 12:28:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3f1ff69-9b0d-4f9e-68ba-08d8dcad79ef
X-MS-TrafficTypeDiagnostic: MWHPR01MB2271:
X-MS-Exchange-MinimumUrlDomainAge: gnu.org#9229
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR01MB22711AA43D38391C1AE46B7EF29A9@MWHPR01MB2271.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u+hiWygsRKYXYCJ7O3he5ZHr3LiSH4QbVNbp0xWOFIk3Mb15da0+SQGnCoZyLdWncs6JBvSZaGth5zZY5X8EBtvvZXzXj80g6H50nmmTf+p9DhMY6fGd+OfJ+5mW6adhJWmfyKfMmXhJ2nr2IJHFahBVUWxXXXOXXJGnTPgV5MqSzdLCLGTdp7qKYn75BhqXKNI8+f4yDYJOSidNQeT2de53/GDm8nDhE2If2VfpmFwkqVrV3NzepTGbyHo/QWhu3ILHXdwU/4lmo59hHWmfDbOXtn0gYQ5cqZB7H/vRYUSevxkFTsSW6BKhlJ9XyxiT7i0vjLrS8y8a/0Q7rcq2/aP4QVlHqFxg9T2LGS6MUSi/FOLcvNKqvzzsClOBigFLHB+HhkaugKouchYhvbeqG7/4IM4hkusWPAgiDvit7ZfGDWvq05QRo76mczYniM+gRaAKnE0PPeD5NRkozlcD+rX3NpR5hJYfXKD4cqWGMkVguETmlFM6uPwzpb4nSQ16f8EZdjvSC9FO7SV3AiwgVj/bgS8+uTFBZCL7eGJc8gtoO85sBLJiDaTkFfcQiMyZP1CIP045hhJVIurOecbuO2oANKELrNDf0xHG980tSaw2t3TfJDaXsj7bghgZUaF8zqpHYF9UmcH4j7So/HIwj9xbLutgnF4/SCXAq9eIsXf1owuo+Jcj7E6D/SGGTW2z3Qy/xf+OJjZhI/e1uDufD8XPQX82Vuusfg22SOuVp4Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39830400003)(53546011)(6666004)(4326008)(30864003)(478600001)(7416002)(31686004)(31696002)(83380400001)(26005)(16576012)(5660300002)(186003)(54906003)(8676002)(110136005)(316002)(16526019)(6486002)(8936002)(107886003)(66946007)(86362001)(921005)(2616005)(52116002)(956004)(2906002)(66476007)(66556008)(2004002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RzRkT3dmTlJ5aEg1OEVHYWFGYys3dUlpWjhQSEpUaUV6QVI3K3RPQVhpdUJY?=
 =?utf-8?B?cDQ4OXRIeFJ6bVNOTVJGaGJuaXRXZU9Sakg3N2lNMVErOTNIay84QnFrWFh3?=
 =?utf-8?B?NnVTZWVLMmVKVDVxb0xqaE41OVkzZllvcHczUldDRFdoRW9HSk5xaVFGK3U5?=
 =?utf-8?B?S1QzUVZhcDBnaVdsWmt2a2xyU2JwZnE4LzlCSHp5OUo5VGZyY0dPK05JTnhF?=
 =?utf-8?B?anpiamUzWWxNM0JQSndxbGc5RXU2bEtqZHlFSFBEeURBS1JLbGFwWHRTUWUw?=
 =?utf-8?B?OUYxdUx6akYrUnhyUnhmU2R5YU9HU2RrdHE3SFJJQUtGU2txUHZhK2s4UWpk?=
 =?utf-8?B?ekk1UHQxc2JSMGgvdjdiRXFFWGhSWE9ZVjMzQzYyMUpodHJ5TGdGbmtvekhN?=
 =?utf-8?B?NGZXWFVWNEJLMFh0YlRwUVBWYndwOW5QYU91NjVLT0piN3FtcXdLZ3BjQTJP?=
 =?utf-8?B?Y3Y0ZEFIUG4yNGc5QjhVT3FkVzYyaGhYYWZPTTNlNm9kdVB3T2lXWDdXenVU?=
 =?utf-8?B?RGNXS2ZQbjJseHd4YjFMSForRUZvc2tBOXl2NGQrTllxSWJUUEFrYVY4NlNJ?=
 =?utf-8?B?Wk1GY1NTZWczTzRaUmJKMmJlN2FWY1BnV3hxTlFZWGRGTnN3WkMxeDIyNU9Z?=
 =?utf-8?B?ZkNjUFJuZlBMSElmQmxxeFYxMzVTS0dCdGE0VGJLYXEzTU5VMWh3bG5UVTA1?=
 =?utf-8?B?TEw2aGNRbS9sYS9FQXpkUEFaQVVNUnZmSFlpQ1lsQmF1RlF2M2ZlbmdVUFZa?=
 =?utf-8?B?Z1paclUvRFo1bE1STEVKZVpBZnlaSDRmZjZrUzVpVVI1cmV6cGsxU21hM2xI?=
 =?utf-8?B?dlkzQk55ODlZa2RRR01mSzJZUXRhRFY1VVBheUxHUWJjbmVWR1UxY1BUelFj?=
 =?utf-8?B?YVIwTmdiMGJvaThsWFkwVDVueDZGNEtGRUtwak1hQ3orUUNmd1pJTTFwdVhv?=
 =?utf-8?B?b2J4Q3g0L3E3cmVJNytnTXU0NlV0QmpHTjZFVEk5aSsvNWhFUDlHR0k2anNx?=
 =?utf-8?B?bjh2dDRHcFdRTCt0Z1lQR2UvMlVjUjMvQXIrbGdua1NLK0NORzJDZnZ6ZjZD?=
 =?utf-8?B?MjdCMVVXRkNPeE9RRGpZTHE5eXNhV0V1aTlMZHJTRTloTEF5amZlUTlwWjNX?=
 =?utf-8?B?N0piMDhldDF6dUdKajNWRVdwUFhuKzRrWTdPK0JlbWR6R01XQnFNcy9rbDM1?=
 =?utf-8?B?VVJTMzlpQVdYeVBUdU5jVFFhMjFuRTArWlB0bDM5MFZhVmhUR2FnYWtNU1hY?=
 =?utf-8?B?MUI3Nmt3SjRwZTc3SHJNSkFPZVJ1M25IbCtqbUtoWEVwb2xqSnFwMXA1MlRK?=
 =?utf-8?B?T3JVUThPeFoxWVhDclV0RWVUamxRazg2aW9yZ0tRUDVud3YzNDlRb3hoOXZV?=
 =?utf-8?B?MVJnK2h4WllXU1VxZ0Y5MXBTeGZmb1kvc2Nzc2dtMzJ5d01jL29iUWtta0FJ?=
 =?utf-8?B?aU1BbjBQbS9qalk1cHF5cDZqWTdWV09nV3llQ3JOYmdGTkREL1F5NytjTjJj?=
 =?utf-8?B?N24va2Iydkg4ZWh0ZlpUODB5UFVGMU42cVdGNlpoanNEcGpNZ1JaOGg0TjQv?=
 =?utf-8?B?aG9QbTk0MVlvZTExcE1IeHYwS2VONkpmeGl3TkZzUkNobmgvS0UwOU8wZmRG?=
 =?utf-8?B?djJta0pEVW1FcC9nLzYyb2ZER1VBalYzT0lzNjhaOHhmdmp5bWRQeG1hMVBp?=
 =?utf-8?B?QTZFMlNNT2gydmwwdTJYR01DdXJjM2JxNEtwVHIxV3BCbXVSMnJ6d0lMNENx?=
 =?utf-8?Q?RzFwcY7Sx9CZ2PiEXGueb4P43bz94Q6rMM8WZ8K?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3f1ff69-9b0d-4f9e-68ba-08d8dcad79ef
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 12:28:11.1518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WWReWYOgu15DAonVHthLmSkWSLUztU3h0F//ROMlREIQxAtOl+geeHQGOSusG5Adx1mD0ZDfthRv2p0FQUVAIGkVyb3jb25RmetpZmenwhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB2271
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 25/02/2021 23:08, Guenter Roeck wrote:
> On 2/25/21 2:18 AM, Quan Nguyen wrote:
>> This commit adds support for Ampere SMpro hwmon driver. This driver
>> supports accessing various CPU sensors provided by the SMpro co-processor
>> including temperature, power, voltages, and current.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>>   drivers/hwmon/Kconfig       |   8 +
>>   drivers/hwmon/Makefile      |   1 +
>>   drivers/hwmon/smpro-hwmon.c | 620 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 629 insertions(+)
>>   create mode 100644 drivers/hwmon/smpro-hwmon.c
>>
>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>> index 54f04e61fb83..7b0458bf903c 100644
>> --- a/drivers/hwmon/Kconfig
>> +++ b/drivers/hwmon/Kconfig
>> @@ -67,6 +67,14 @@ config SENSORS_ABITUGURU3
>>   	  This driver can also be built as a module. If so, the module
>>   	  will be called abituguru3.
>>   
>> +config SENSORS_SMPRO
>> +	tristate "Ampere's Altra SMpro hardware monitoring driver"
>> +	depends on MFD_SMPRO
>> +	help
>> +	  If you say yes here you get support for the thermal, voltage,
>> +	  current and power sensors of Ampere's Altra processor family SoC
>> +	  with SMpro co-processor.
>> +
>>   config SENSORS_AD7314
>>   	tristate "Analog Devices AD7314 and compatibles"
>>   	depends on SPI
>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>> index fe38e8a5c979..ac0892540abb 100644
>> --- a/drivers/hwmon/Makefile
>> +++ b/drivers/hwmon/Makefile
>> @@ -173,6 +173,7 @@ obj-$(CONFIG_SENSORS_SHT3x)	+= sht3x.o
>>   obj-$(CONFIG_SENSORS_SHTC1)	+= shtc1.o
>>   obj-$(CONFIG_SENSORS_SIS5595)	+= sis5595.o
>>   obj-$(CONFIG_SENSORS_SMM665)	+= smm665.o
>> +obj-$(CONFIG_SENSORS_SMPRO)	+= smpro-hwmon.o
>>   obj-$(CONFIG_SENSORS_SMSC47B397)+= smsc47b397.o
>>   obj-$(CONFIG_SENSORS_SMSC47M1)	+= smsc47m1.o
>>   obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
>> diff --git a/drivers/hwmon/smpro-hwmon.c b/drivers/hwmon/smpro-hwmon.c
>> new file mode 100644
>> index 000000000000..d70764ffc78f
>> --- /dev/null
>> +++ b/drivers/hwmon/smpro-hwmon.c
>> @@ -0,0 +1,620 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Ampere Computing SoC's SMPro Hardware Monitoring Driver
>> + *
>> + * Copyright (c) 2021, Ampere Computing LLC
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License as
>> + * published by the Free Software Foundation; either version 2 of
>> + * the License, or (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
> 
> Repeating the text of GPL is not necessary. This is what
> SPDX-License-Identifier is for.
> 
Thanks Guenter,
Wil fix this in next version.

>> + */
>> +#include <linux/bitfield.h>
>> +#include <linux/hwmon.h>
>> +#include <linux/hwmon-sysfs.h>
>> +#include <linux/kernel.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/property.h>
>> +#include <linux/regmap.h>
>> +
>> +/* Identification Registers */
>> +#define MANUFACTURER_ID_REG		0x02
>> +#define AMPERE_MANUFACTURER_ID		0xCD3A
>> +
>> +/* Capability Registers  */
>> +#define SOC_TDP_REG			0x0E
> 
> This is used to report power. What does it actually report ?
> If it is the design power, it should not be reported as power,
> but possibly as maximum SOC power.
> 
> If so, and if other limit registers are reported as actual values,
> please change to report as limits.
> 
>> +
>> +/* Logical Power Sensor Registers */
>> +#define SOC_TEMP_REG			0x10
>> +#define SOC_VRD_TEMP_REG		0x11
>> +#define DIMM_VRD_TEMP_REG		0x12
>> +#define CORE_VRD_TEMP_REG		0x13
>> +#define CH0_DIMM_TEMP_REG		0x14
>> +#define CH1_DIMM_TEMP_REG		0x15
>> +#define CH2_DIMM_TEMP_REG		0x16
>> +#define CH3_DIMM_TEMP_REG		0x17
>> +#define CH4_DIMM_TEMP_REG		0x18
>> +#define CH5_DIMM_TEMP_REG		0x19
>> +#define CH6_DIMM_TEMP_REG		0x1A
>> +#define CH7_DIMM_TEMP_REG		0x1B
>> +#define RCA_VRD_TEMP_REG		0x1C
>> +
>> +#define CORE_VRD_PWR_REG		0x20
>> +#define SOC_PWR_REG			0x21
>> +#define DIMM_VRD1_PWR_REG		0x22
>> +#define DIMM_VRD2_PWR_REG		0x23
>> +#define CORE_VRD_PWR_MW_REG		0x26
>> +#define SOC_PWR_MW_REG			0x27
>> +#define DIMM_VRD1_PWR_MW_REG		0x28
>> +#define DIMM_VRD2_PWR_MW_REG		0x29
>> +#define RCA_VRD_PWR_REG			0x2A
>> +#define RCA_VRD_PWR_MW_REG		0x2B
>> +
>> +#define MEM_HOT_THRESHOLD_REG		0x32
>> +#define SOC_VR_HOT_THRESHOLD_REG	0x33
> 
> Apparently there _are_ more limit registers.
> Please implement those as limit attributes.
>
Will change in next version

>> +#define CORE_VRD_VOLT_REG		0x34
>> +#define SOC_VRD_VOLT_REG		0x35
>> +#define DIMM_VRD1_VOLT_REG		0x36
>> +#define DIMM_VRD2_VOLT_REG		0x37
>> +#define RCA_VRD_VOLT_REG		0x38
>> +
>> +#define CORE_VRD_CURR_REG		0x39
>> +#define SOC_VRD_CURR_REG		0x3A
>> +#define DIMM_VRD1_CURR_REG		0x3B
>> +#define DIMM_VRD2_CURR_REG		0x3C
>> +#define RCA_VRD_CURR_REG		0x3D
>> +
>> +/* Add for DIMM group */
>> +#define DIMM_GROUP_DUMMY_REG		0xFF
>> +
>> +struct smpro_hwmon {
>> +	struct regmap *regmap;
>> +};
>> +
>> +static const u8 temp_regs[] = {
>> +	SOC_TEMP_REG,
>> +	SOC_VRD_TEMP_REG,
>> +	DIMM_VRD_TEMP_REG,
>> +	CORE_VRD_TEMP_REG,
>> +	/* reserved for DIMM G0 */
>> +	DIMM_GROUP_DUMMY_REG,
>> +	CH0_DIMM_TEMP_REG,
>> +	CH1_DIMM_TEMP_REG,
>> +	CH2_DIMM_TEMP_REG,
>> +	CH3_DIMM_TEMP_REG,
>> +	/* reserved for DIMM G1 */
>> +	DIMM_GROUP_DUMMY_REG,
>> +	CH4_DIMM_TEMP_REG,
>> +	CH5_DIMM_TEMP_REG,
>> +	CH6_DIMM_TEMP_REG,
>> +	CH7_DIMM_TEMP_REG,
>> +	MEM_HOT_THRESHOLD_REG,
>> +	SOC_VR_HOT_THRESHOLD_REG,
>> +	RCA_VRD_TEMP_REG,
>> +};
>> +
>> +static const u8 volt_regs[] = {
>> +	CORE_VRD_VOLT_REG,
>> +	SOC_VRD_VOLT_REG,
>> +	DIMM_VRD1_VOLT_REG,
>> +	DIMM_VRD2_VOLT_REG,
>> +	/* vrd1 has higher priority than vrd2 using vrd1 as output for ddr */
> 
> What is the point of this comment ?
> 
>> +	DIMM_VRD1_VOLT_REG,
> 
> That doesn't make sense. It appears that DIMM VRD1
> is reported as DIMM VRD1 _and_ as DIMM VRD. I don't know
> what this is supposed to accomplish, but no. Please remove
> all instances of "virtual" attributes.
> 
Yes, will try to remove "virtual" attr in next version.

>> +	RCA_VRD_VOLT_REG,
>> +};
>> +
>> +static const u8 curr_regs[] = {
>> +	CORE_VRD_CURR_REG,
>> +	SOC_VRD_CURR_REG,
>> +	DIMM_VRD1_CURR_REG,
>> +	DIMM_VRD2_CURR_REG,
>> +	RCA_VRD_CURR_REG,
>> +};
>> +
>> +enum pwr_regs {
>> +	CORE_VRD_PWR,
>> +	SOC_PWR,
>> +	DIMM_VRD1_PWR,
>> +	DIMM_VRD2_PWR,
>> +	CPU_VRD_PWR,
>> +	DIMM_VRD_PWR,
>> +	RCA_VRD_PWR,
>> +	SOC_TDP_PWR,
>> +};
> 
> Add empty line. And run checkpatch - it would have told you.
> 
Thanks, will fix this.

>> +static const char * const label[] = {
>> +	"SoC",
>> +	"SoC VRD",
>> +	"DIMM VRD",
>> +	"DIMM VRD1",
>> +	"DIMM VRD2",
>> +	"CORE VRD",
>> +	"CH0 DIMM",
>> +	"CH1 DIMM",
>> +	"CH2 DIMM",
>> +	"CH3 DIMM",
>> +	"CH4 DIMM",
>> +	"CH5 DIMM",
>> +	"CH6 DIMM",
>> +	"CH7 DIMM",
>> +	"MEM HOT",
>> +	"SoC VR HOT",
>> +	"CPU VRD",
>> +	"RCA VRD",
>> +	"SOC TDP",
>> +	"DIMM G0",
>> +	"DIMM G1",
>> +};
>> +
>> +static int smpro_read_temp(struct device *dev, u32 attr, int channel,
>> +				long *val)
> 
> This looks suspicious, and indeed, checkpatch states:
> 
> total: 0 errors, 2 warnings, 31 checks, 641 lines checked
> 
> Besides, the line length limit is now 100 columns.
> 
Thanks, let me check this.
>> +{
>> +	struct smpro_hwmon *hwmon = dev_get_drvdata(dev);
>> +	unsigned int t_max = 0xffffffff;
>> +	unsigned int value;
>> +	s32 i;
>> +	int ret;
>> +
>> +	switch (attr) {
>> +	case hwmon_temp_input:
>> +		if (temp_regs[channel] == DIMM_GROUP_DUMMY_REG) {
>> +			for (i = 1; i <= 4; i++) {
>> +				ret = regmap_read(hwmon->regmap,
>> +						temp_regs[channel + i], &value);
>> +				if (ret)
>> +					return ret;
>> +				/* continue if invalid */
>> +				if (value == 0xffff)
>> +					continue;
>> +
>> +				value &= 0x1ff; /* 9-bit value */
>> +				if (t_max != 0xffffffff)
>> +					t_max = (value > t_max) ? value : t_max;
>> +				else
>> +					t_max = value;
>> +			}
> 
> This needs explanation. Why not return four different sensor values ?
> Otherwise, why four different registers to read data for a single sensor ?
> 
> But ... no, wait, it looks like this is used to report the maximum
> of the subsequent four DIMMs. No, this is unacceptable. If this
> "channel" does not exist, but the index/channel is for some reason
> needed, report it as not visible using the is_visible callback.
> 
>> +
>> +			if (t_max == 0xffffffff)
>> +				return -1;
> 
> Valid error codes, please. -1 translates to -EPERM. However,
> it looks like this may suggest that the DIMMs are not populated.
> If so, mask affected channels using the is_visible callback.
> 
Yes, you are right, this is to report the max temp among DIMMs.
We will drop it as it is "virtual" attr.
>> +
>> +			*val = t_max * 1000;
>> +		} else {
>> +			ret = regmap_read(hwmon->regmap,
>> +					temp_regs[channel], &value);
>> +			if (ret)
>> +				return ret;
>> +			*val = (value & 0x1ff) * 1000;
> 
> Above code suggests that a value of 0xffff might be reported,
> which micht suggest an unpopulated sensor (eg an unpouplated DIMM).
> The driver should not blindly report 255 Dgrees C in that situation,
> but instead mark the sensor as invisible.
> 
> The same applies to all other sensors.
> 
Thanks,
The value of 0xffff indeed indicate that the sensor is not available and 
should be marked as invisible attr.

>> +		}
>> +		break;
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +	return 0;
>> +}
>> +
>> +static int smpro_read_in(struct device *dev, u32 attr, int channel,
>> +				long *val)
>> +{
>> +	struct smpro_hwmon *hwmon = dev_get_drvdata(dev);
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	switch (attr) {
>> +	case hwmon_in_input:
>> +		ret = regmap_read(hwmon->regmap, volt_regs[channel], &value);
>> +		if (ret < 0)
>> +			return ret;
>> +		*val = value & 0x7fff; /* 15-bit value */
> 
> Scale reported by the hardware is 1mV ? Justw wondering;
> a brief comment might make sense.
> 
Will add comment to clarify this.

>> +		return 0;
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +}
>> +
>> +static int smpro_read_curr(struct device *dev, u32 attr, int channel,
>> +				long *val)
>> +{
>> +	struct smpro_hwmon *hwmon = dev_get_drvdata(dev);
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	switch (attr) {
>> +	case hwmon_curr_input:
>> +		ret = regmap_read(hwmon->regmap, curr_regs[channel], &value);
>> +		if (ret < 0)
>> +			return ret;
>> +		*val = value & 0x7fff; /* 15-bit value */
>> +		return 0;
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +}
>> +
>> +static int smpro_read_power(struct device *dev, u32 attr, int channel,
>> +				long *val_pwr)
>> +{
>> +	struct smpro_hwmon *hwmon = dev_get_drvdata(dev);
>> +	unsigned int val2, val2_mw;
>> +	unsigned int val, val_mw;
>> +	int ret;
>> +
>> +	switch (attr) {
>> +	case hwmon_power_input:
>> +		switch (channel) {
>> +		case CORE_VRD_PWR:
>> +			ret = regmap_read(hwmon->regmap,
>> +					CORE_VRD_PWR_REG, &val);
>> +			if (!ret)
>> +				ret = regmap_read(hwmon->regmap,
>> +						CORE_VRD_PWR_MW_REG, &val_mw);
>> +			if (ret)
>> +				return ret;
> 
> Please handle errors directly.
> 
> 			ret = regmap_read();
> 			if (ret)
> 				return ret;
> 			ret = regmap_read()
> 			if (ret)
> 				return ret;
> 
> Same everywhere below.
> 
Will change them

>> +			break;
>> +		case SOC_PWR:
>> +			ret = regmap_read(hwmon->regmap,
>> +					SOC_PWR_REG, &val);
>> +			if (!ret)
>> +				ret = regmap_read(hwmon->regmap,
>> +						SOC_PWR_MW_REG, &val_mw);
>> +			if (ret)
>> +				return ret;
>> +			break;
>> +		case DIMM_VRD1_PWR:
>> +			ret = regmap_read(hwmon->regmap,
>> +					DIMM_VRD1_PWR_REG, &val);
>> +			if (!ret)
>> +				ret = regmap_read(hwmon->regmap,
>> +						DIMM_VRD1_PWR_MW_REG, &val_mw);
>> +			if (ret)
>> +				return ret;
>> +			break;
>> +		case DIMM_VRD2_PWR:
>> +			ret = regmap_read(hwmon->regmap,
>> +					DIMM_VRD2_PWR_REG, &val);
>> +			if (!ret)
>> +				ret = regmap_read(hwmon->regmap,
>> +						DIMM_VRD2_PWR_MW_REG, &val_mw);
>> +			if (ret)
>> +				return ret;
>> +			break;
>> +		case RCA_VRD_PWR:
>> +			ret = regmap_read(hwmon->regmap,
>> +					RCA_VRD_PWR_REG, &val);
>> +			if (!ret)
>> +				ret = regmap_read(hwmon->regmap,
>> +						RCA_VRD_PWR_MW_REG, &val_mw);
>> +			if (ret)
>> +				return ret;
>> +			break;
>> +		case SOC_TDP_PWR:
>> +			ret = regmap_read(hwmon->regmap,
>> +					SOC_TDP_REG, &val);
>> +			if (ret)
>> +				return ret;
>> +			break;
>> +		case CPU_VRD_PWR:
>> +			ret = regmap_read(hwmon->regmap,
>> +					CORE_VRD_PWR_REG, &val);
>> +			if (!ret)
>> +				ret = regmap_read(hwmon->regmap,
>> +						CORE_VRD_PWR_MW_REG, &val_mw);
>> +			if (!ret)
>> +				ret = regmap_read(hwmon->regmap,
>> +						SOC_PWR_REG, &val2);
>> +			if (!ret)
>> +				ret = regmap_read(hwmon->regmap,
>> +						SOC_PWR_MW_REG, &val2_mw);
>> +			if (ret)
>> +				return ret;
>> +			break;
>> +		case DIMM_VRD_PWR:
>> +			ret = regmap_read(hwmon->regmap,
>> +					DIMM_VRD1_PWR_REG, &val);
>> +			if (!ret)
>> +				ret = regmap_read(hwmon->regmap,
>> +						DIMM_VRD1_PWR_MW_REG, &val_mw);
>> +			if (!ret)
>> +				ret = regmap_read(hwmon->regmap,
>> +						DIMM_VRD2_PWR_REG, &val2);
>> +			if (!ret)
>> +				ret = regmap_read(hwmon->regmap,
>> +						DIMM_VRD2_PWR_MW_REG, &val2_mw);
>> +			if (ret)
>> +				return ret;
>> +			break;
> 
> Ah, there are more "virtual" atributes. Again, please remove all those.
> If userspace w ants to group attributes in whatever way it wants to, fine,
> but that is not a kernel concern.
> 
> Besides, what if a DIMM is unpopulated ?
> 
>> +		default:
>> +			return -EOPNOTSUPP;
>> +		}
>> +		/* Set to 0 if invalid */
>> +		if (val_mw == 0xffff)
>> +			val_mw = 0;
>> +		if (val2_mw == 0xffff)
>> +			val2_mw = 0;
>> +
> 
> Does this indicate a temporary or a permanent problem ?
> If it means that the sensor is not populated, it should be
> handled in is_visible. Also, what about val / val2 ?
> 
This means that the sensor is not populated and will be handled in 
is_visible() in next version.

>> +		*val_pwr = (val + val2) * 1000000 + (val_mw + val2_mw) * 1000;
>> +		return 0;
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +}
>> +
>> +static int smpro_read(struct device *dev, enum hwmon_sensor_types type,
>> +				u32 attr, int channel, long *val)
>> +{
>> +	switch (type) {
>> +	case hwmon_temp:
>> +		return smpro_read_temp(dev, attr, channel, val);
>> +	case hwmon_in:
>> +		return smpro_read_in(dev, attr, channel, val);
>> +	case hwmon_power:
>> +		return smpro_read_power(dev, attr, channel, val);
>> +	case hwmon_curr:
>> +		return smpro_read_curr(dev, attr, channel, val);
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +}
>> +
>> +static int smpro_write(struct device *dev, enum hwmon_sensor_types type,
>> +				u32 attr, int channel, long val)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> +
>> +static umode_t smpro_is_visible(const void *data,
>> +				enum hwmon_sensor_types type,
>> +				u32 attr, int channel)
>> +{
>> +	return 0444;
>> +}
>> +
>> +static ssize_t show_label(struct device *dev, struct device_attribute *devattr,
>> +				char *buf)
>> +{
>> +	int index = to_sensor_dev_attr(devattr)->index;
>> +
>> +	return sprintf(buf, "%s\n", label[index]);
>> +}
>> +
>> +static const u32 smpro_temp_config[] = {
>> +	HWMON_T_INPUT,
>> +	HWMON_T_INPUT,
>> +	HWMON_T_INPUT,
>> +	HWMON_T_INPUT,
>> +	HWMON_T_INPUT,
>> +	HWMON_T_INPUT,
>> +	HWMON_T_INPUT,
>> +	HWMON_T_INPUT,
>> +	HWMON_T_INPUT,
>> +	HWMON_T_INPUT,
>> +	HWMON_T_INPUT,
>> +	HWMON_T_INPUT,
>> +	HWMON_T_INPUT,
>> +	HWMON_T_INPUT,
>> +	HWMON_T_INPUT,
>> +	HWMON_T_INPUT,
>> +	HWMON_T_INPUT,
>> +	0
>> +};
>> +
>> +static const struct hwmon_channel_info smpro_temp = {
>> +	.type = hwmon_temp,
>> +	.config = smpro_temp_config,
>> +};
>> +
>> +static const u32 smpro_in_config[] = {
>> +	HWMON_I_INPUT,
>> +	HWMON_I_INPUT,
>> +	HWMON_I_INPUT,
>> +	HWMON_I_INPUT,
>> +	HWMON_I_INPUT,
>> +	HWMON_I_INPUT,
>> +	0
>> +};
>> +
>> +static const struct hwmon_channel_info smpro_in = {
>> +	.type = hwmon_in,
>> +	.config = smpro_in_config,
>> +};
>> +
>> +static const u32 smpro_curr_config[] = {
>> +	HWMON_C_INPUT,
>> +	HWMON_C_INPUT,
>> +	HWMON_C_INPUT,
>> +	HWMON_C_INPUT,
>> +	HWMON_C_INPUT,
>> +	0
>> +};
>> +
>> +static const struct hwmon_channel_info smpro_curr = {
>> +	.type = hwmon_curr,
>> +	.config = smpro_curr_config,
>> +};
>> +
>> +static const u32 smpro_power_config[] = {
>> +	HWMON_P_INPUT,
>> +	HWMON_P_INPUT,
>> +	HWMON_P_INPUT,
>> +	HWMON_P_INPUT,
>> +	HWMON_P_INPUT,
>> +	HWMON_P_INPUT,
>> +	HWMON_P_INPUT,
>> +	HWMON_P_INPUT,
>> +	0
>> +};
>> +
>> +static const struct hwmon_channel_info smpro_power = {
>> +	.type = hwmon_power,
>> +	.config = smpro_power_config,
>> +};
>> +
>> +static const struct hwmon_channel_info *smpro_info[] = {
>> +	&smpro_temp,
>> +	&smpro_in,
>> +	&smpro_power,
>> +	&smpro_curr,
>> +	NULL
>> +};
>> +
> 
> The above can all be polulated with HWMON_CHANNEL_INFO().
> 
Will try this in next version.

>> +static const struct hwmon_ops smpro_hwmon_ops = {
>> +	.is_visible = smpro_is_visible,
>> +	.read = smpro_read,
>> +	.write = smpro_write,
>> +};
>> +
>> +static const struct hwmon_chip_info smpro_chip_info = {
>> +	.ops = &smpro_hwmon_ops,
>> +	.info = smpro_info,
>> +};
>> +
>> +static SENSOR_DEVICE_ATTR(temp1_label, 0444, show_label, NULL, 0);
>> +static SENSOR_DEVICE_ATTR(temp2_label, 0444, show_label, NULL, 1);
>> +static SENSOR_DEVICE_ATTR(temp3_label, 0444, show_label, NULL, 2);
>> +static SENSOR_DEVICE_ATTR(temp4_label, 0444, show_label, NULL, 5);
>> +static SENSOR_DEVICE_ATTR(temp5_label, 0444, show_label, NULL, 19);
>> +static SENSOR_DEVICE_ATTR(temp6_label, 0444, show_label, NULL, 6);
>> +static SENSOR_DEVICE_ATTR(temp7_label, 0444, show_label, NULL, 7);
>> +static SENSOR_DEVICE_ATTR(temp8_label, 0444, show_label, NULL, 8);
>> +static SENSOR_DEVICE_ATTR(temp9_label, 0444, show_label, NULL, 9);
>> +static SENSOR_DEVICE_ATTR(temp10_label, 0444, show_label, NULL, 20);
>> +static SENSOR_DEVICE_ATTR(temp11_label, 0444, show_label, NULL, 10);
>> +static SENSOR_DEVICE_ATTR(temp12_label, 0444, show_label, NULL, 11);
>> +static SENSOR_DEVICE_ATTR(temp13_label, 0444, show_label, NULL, 12);
>> +static SENSOR_DEVICE_ATTR(temp14_label, 0444, show_label, NULL, 13);
>> +static SENSOR_DEVICE_ATTR(temp15_label, 0444, show_label, NULL, 14);
>> +static SENSOR_DEVICE_ATTR(temp16_label, 0444, show_label, NULL, 15);
>> +static SENSOR_DEVICE_ATTR(temp17_label, 0444, show_label, NULL, 17);
>> +
>> +static SENSOR_DEVICE_ATTR(in0_label, 0444, show_label, NULL, 5);
>> +static SENSOR_DEVICE_ATTR(in1_label, 0444, show_label, NULL, 1);
>> +static SENSOR_DEVICE_ATTR(in2_label, 0444, show_label, NULL, 3);
>> +static SENSOR_DEVICE_ATTR(in3_label, 0444, show_label, NULL, 4);
>> +static SENSOR_DEVICE_ATTR(in4_label, 0444, show_label, NULL, 2);
>> +static SENSOR_DEVICE_ATTR(in5_label, 0444, show_label, NULL, 17);
>> +
>> +static SENSOR_DEVICE_ATTR(power1_label, 0444, show_label, NULL, 5);
>> +static SENSOR_DEVICE_ATTR(power2_label, 0444, show_label, NULL, 0);
>> +static SENSOR_DEVICE_ATTR(power3_label, 0444, show_label, NULL, 3);
>> +static SENSOR_DEVICE_ATTR(power4_label, 0444, show_label, NULL, 4);
>> +static SENSOR_DEVICE_ATTR(power5_label, 0444, show_label, NULL, 16);
>> +static SENSOR_DEVICE_ATTR(power6_label, 0444, show_label, NULL, 2);
>> +static SENSOR_DEVICE_ATTR(power7_label, 0444, show_label, NULL, 17);
>> +static SENSOR_DEVICE_ATTR(power8_label, 0444, show_label, NULL, 18);
>> +
>> +static SENSOR_DEVICE_ATTR(curr1_label, 0444, show_label, NULL, 5);
>> +static SENSOR_DEVICE_ATTR(curr2_label, 0444, show_label, NULL, 1);
>> +static SENSOR_DEVICE_ATTR(curr3_label, 0444, show_label, NULL, 3);
>> +static SENSOR_DEVICE_ATTR(curr4_label, 0444, show_label, NULL, 4);
>> +static SENSOR_DEVICE_ATTR(curr5_label, 0444, show_label, NULL, 17);
>> +
>> +static struct attribute *smpro_attrs[] = {
>> +	&sensor_dev_attr_temp1_label.dev_attr.attr,
>> +	&sensor_dev_attr_temp2_label.dev_attr.attr,
>> +	&sensor_dev_attr_temp3_label.dev_attr.attr,
>> +	&sensor_dev_attr_temp4_label.dev_attr.attr,
>> +	&sensor_dev_attr_temp5_label.dev_attr.attr,
>> +	&sensor_dev_attr_temp6_label.dev_attr.attr,
>> +	&sensor_dev_attr_temp7_label.dev_attr.attr,
>> +	&sensor_dev_attr_temp8_label.dev_attr.attr,
>> +	&sensor_dev_attr_temp9_label.dev_attr.attr,
>> +	&sensor_dev_attr_temp10_label.dev_attr.attr,
>> +	&sensor_dev_attr_temp11_label.dev_attr.attr,
>> +	&sensor_dev_attr_temp12_label.dev_attr.attr,
>> +	&sensor_dev_attr_temp13_label.dev_attr.attr,
>> +	&sensor_dev_attr_temp14_label.dev_attr.attr,
>> +	&sensor_dev_attr_temp15_label.dev_attr.attr,
>> +	&sensor_dev_attr_temp16_label.dev_attr.attr,
>> +	&sensor_dev_attr_temp17_label.dev_attr.attr,
>> +
>> +	&sensor_dev_attr_in0_label.dev_attr.attr,
>> +	&sensor_dev_attr_in1_label.dev_attr.attr,
>> +	&sensor_dev_attr_in2_label.dev_attr.attr,
>> +	&sensor_dev_attr_in3_label.dev_attr.attr,
>> +	&sensor_dev_attr_in4_label.dev_attr.attr,
>> +	&sensor_dev_attr_in5_label.dev_attr.attr,
>> +
>> +	&sensor_dev_attr_curr1_label.dev_attr.attr,
>> +	&sensor_dev_attr_curr2_label.dev_attr.attr,
>> +	&sensor_dev_attr_curr3_label.dev_attr.attr,
>> +	&sensor_dev_attr_curr4_label.dev_attr.attr,
>> +	&sensor_dev_attr_curr5_label.dev_attr.attr,
>> +
>> +	&sensor_dev_attr_power1_label.dev_attr.attr,
>> +	&sensor_dev_attr_power2_label.dev_attr.attr,
>> +	&sensor_dev_attr_power3_label.dev_attr.attr,
>> +	&sensor_dev_attr_power4_label.dev_attr.attr,
>> +	&sensor_dev_attr_power5_label.dev_attr.attr,
>> +	&sensor_dev_attr_power6_label.dev_attr.attr,
>> +	&sensor_dev_attr_power7_label.dev_attr.attr,
>> +	&sensor_dev_attr_power8_label.dev_attr.attr,
>> +
>> +	NULL
>> +};
>> +ATTRIBUTE_GROUPS(smpro);
>> +
> 
> This can be done with LABEL attributes (HWMON_T_LABEL etc).
> 
Thanks, will try this next time.

>> +static int is_valid_id(struct regmap *regmap)
> 
> bool
> 
>> +{
>> +	unsigned int val;
>> +	int ret;
>> +
>> +	ret = regmap_read(regmap, MANUFACTURER_ID_REG, &val);
>> +
>> +	return  (ret || (val != AMPERE_MANUFACTURER_ID)) ? 0 : 1;
>> +}
>> +
>> +static int smpro_hwmon_probe(struct platform_device *pdev)
>> +{
>> +	struct smpro_hwmon *hwmon;
>> +	struct device *hwmon_dev;
>> +
>> +	hwmon = devm_kzalloc(&pdev->dev, sizeof(struct smpro_hwmon),
>> +			GFP_KERNEL);
>> +	if (!hwmon)
>> +		return -ENOMEM;
>> +
>> +	hwmon->regmap = dev_get_regmap(pdev->dev.parent, NULL);
>> +	if (!hwmon->regmap)
>> +		return -ENODEV;
>> +
>> +	/* Check for valid ID */
>> +	if (!is_valid_id(hwmon->regmap))
>> +		dev_warn(&pdev->dev, "Hmmh, SMPro not ready yet\n");
> 
> This does not appear appropriate. It should be either -EPROBE_DEFER
> or -ENODEV.
> 

Will re-check

>> +
>> +	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
>> +			"smpro_hwmon", hwmon,
>> +			&smpro_chip_info, smpro_groups);
>> +	if (IS_ERR(hwmon_dev))
>> +		dev_err(&pdev->dev, "failed to register as hwmon device");
> 
> Unnecessary error message. It is either -EINVAL, which would
> always be the case, or -ENOMEM, which is already reported.
> 
Will drop this message in next version.

>> +
>> +	return PTR_ERR_OR_ZERO(hwmon_dev);
>> +}
>> +
>> +static const struct of_device_id smpro_hwmon_of_match[] = {
>> +	{ .compatible = "ampere,ac01-hwmon" },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, smpro_hwmon_of_match);
>> +
>> +static struct platform_driver smpro_hwmon_driver = {
>> +	.probe		= smpro_hwmon_probe,
>> +	.driver = {
>> +		.name	= "smpro-hwmon",
>> +		.of_match_table = smpro_hwmon_of_match,
>> +	},
>> +};
>> +
>> +module_platform_driver(smpro_hwmon_driver);
>> +
>> +MODULE_AUTHOR("Thu Nguyen <thu@os.amperecomputing.com>");
>> +MODULE_AUTHOR("Quan Nguyen <quan@os.amperecomputing.com>");
>> +MODULE_DESCRIPTION("Ampere Altra SMPro hwmon driver");
>> +MODULE_LICENSE("GPL");
>>
> 

