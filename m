Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCFC3565A4
	for <lists+openbmc@lfdr.de>; Wed,  7 Apr 2021 09:42:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFbvq4C09z30Fc
	for <lists+openbmc@lfdr.de>; Wed,  7 Apr 2021 17:42:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=aKQI9bS0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.220.130;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=aKQI9bS0; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2130.outbound.protection.outlook.com [40.107.220.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFbvV1WDPz2yYx;
 Wed,  7 Apr 2021 17:42:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4Xq2kx8Ogz6Nq/Dp3JcJ00UQloPD7dYk2p4xq9LJI7bPPTimFcOdduUaseYt1WA+TUjmb6pbMAeA2+f5lm0kmzaFW0u/B2yUBGmM3L8P9O7C1leVaQusTWpnN5XyEY7VNC7PfNuHzU3E+iwij5/XpWZpKikz88UDF3j5avFzUwH0r41AtvN1RXXlDBZBPaH5zM2Pi5digWX7WAx5KJqX6P+j8DLOGmMpA/zFLND0lb3Wm5rm4m+q3bve/9oBN7qX79DSMJaN3RvmjyZ3W9cEthQSh24m1LqQnfbj5LGx/D+7ZUMMugQlkzBnq3+i8dwcG9NTANHILaUK/H/LqB+tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIGOq+dl5G4/qXIsa8Ah81DBmDLkKB6FbALIUbDhBac=;
 b=bDHxmBlv8FSXzmBPnrqy4/vf6OfWgPxq4htMRrHuFh30R+bQC7CqE1rjeRq6EVkUUH+Cs3xNSFVLdCz3B+R2IDDdPyDpuc13s/gVuZa9t/iikOWt4uMD0rqqRkTZIqyMtElS0BNTZaU4n0hcQvPttH0EQh9lpTY221E8FVzS9VurHgnbne/p3CpOOWurzaY90wuUte2ISY7K0l2/NfI2JsJu6GPrEIsn+b7eGeHWnkCUJC8vRT9Er7Yf7NAAlRpUVza1UK1XBw89EErlvAEn7/8TXhcBwvRRaNFtHdyIYMBFtA3zCPWuhpmBGriMyjzmLMEAWjNwiTIhejQD72RZDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIGOq+dl5G4/qXIsa8Ah81DBmDLkKB6FbALIUbDhBac=;
 b=aKQI9bS0UqFpCUFL4EfTbv5UAqUrrqdUpnMPeXh02V+LdOEGIvJ/WfrPmq6bHca9rnYhmuyUAqhNS4kbivqF73k5LjXEBCrAIkloOcLKmblCi2x5w5INZ8i3uymKx6UP58ZuBBc73lkrZIVdbflYgFd8NXfFPI9FPtQ5nbApEr8=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none; os.amperecomputing.com;
 dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW4PR01MB6466.prod.exchangelabs.com (2603:10b6:303:78::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.27; Wed, 7 Apr 2021 07:42:04 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4020.016; Wed, 7 Apr 2021
 07:42:02 +0000
Subject: Re: [PATCH v2 3/4] hwmon: smpro: Add Ampere's Altra smpro-hwmon driver
To: Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
References: <20210329015238.19474-1-quan@os.amperecomputing.com>
 <20210329015238.19474-4-quan@os.amperecomputing.com>
 <bac92db0-3ef6-1615-0e92-aabd54fd0580@roeck-us.net>
From: Quan Nguyen <quan@os.amperecomputing.com>
Message-ID: <136d036c-1d10-cecd-abcb-d206a0c6fa51@os.amperecomputing.com>
Date: Wed, 7 Apr 2021 14:41:49 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
In-Reply-To: <bac92db0-3ef6-1615-0e92-aabd54fd0580@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HKAPR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:203:d0::13) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.33.17] (118.69.219.201) by
 HKAPR04CA0003.apcprd04.prod.outlook.com (2603:1096:203:d0::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 07:41:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ac248b1-8fde-420f-a67a-08d8f998a1ac
X-MS-TrafficTypeDiagnostic: MW4PR01MB6466:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW4PR01MB646638B2A1AB4AB32BC34961F2759@MW4PR01MB6466.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aJerB4+VPCEnV9GW3PO3PCSIiI3kIlYpODIEx7WHBEa8UZ4uHtTWr+LVncbXOiya6s/5khoxMYyGhFomOlkuP16KiysNRyA8W8XIHaMXXIllpoYrS+03zfACCMT4vlEFVtPO8u2F0rA3OitIjjeKjpmCEQWttp/G396IyZijSnJ8QkO/e/9v9FNxpN/11EsIqqZ53+l6U5hadx4d8EdvR1+ii9hoDymgbDCAmGq+MNYxQq0R57ozJE1tczHo7dUlCW7rnCxW/KBCbYwAc+JNSnU0u9biMMGp1tVlsX87iL53lRtrtMdocfrQ/xa70+jp9Khf85BxmmAtJkC5wMVgI++5e34M2N7+AQGpgZNLA29MoF29RopXnE0Wo3WAJl4YQmLlX9c6fzAnng9JTBxIajVwhc83nZAlpVardoQWvsv6sMHCxSXj9tYlsa6+m/BqcSeQKP/AJPLMQzDqJLzAuQTT6lbyg8D+bJn0m5Pb6NDAHEj19ColTs7Jur5kwQB52seFZwuia5cCOLD6yL5mJAc3EGuqjOny6nbWKqKYT7DH6Fib5xIWqpdLCYgX6+SmkmbsVS1SJ7zqiSww0ObyphKcZTumaQDAuRwAUM6mw9vvyhORyNoH1BAlwynVNI3Xb0UnJlrD9I1izOi45Nj9u2n2BLVZEoEDCVb2olXlHs5fHdFwvVZppyMv7DZLg7dsD13ZmgRYywo/Du+FTtu5xw/hsTeo2FWZLDn3bmehyxSg+H7V1P6CROSgYKE5AMNyrH3EDwjNRAB6VxinzCy7Mw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39840400004)(396003)(136003)(7416002)(31686004)(83380400001)(66946007)(921005)(66556008)(956004)(2616005)(52116002)(66476007)(38100700001)(38350700001)(31696002)(107886003)(4326008)(6486002)(53546011)(6666004)(26005)(316002)(2906002)(110136005)(16526019)(16576012)(186003)(478600001)(5660300002)(86362001)(8676002)(54906003)(8936002)(30864003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YWxqYlFGMS9IUDZWVU5zL0F0QU1BbG5hN2JpbUZVdTd2STBGSG9HN2xvaGts?=
 =?utf-8?B?MWJZYSsxRFBiZHBXRGNJNExyTzZFRkJ4WFdmU1QwQkZiUGp0NGFEeVQ4Q1Ni?=
 =?utf-8?B?d0dOS210RHFZYjIyS1JmcFhyd3cxMW5yL3cySk56emVheDlzc25KRHZnYTVE?=
 =?utf-8?B?YmxmOWpVU3ZqZHE2RTJ4R0EyN2Y2TGtyeVlabVBHbWZ6N1dKNWlqMzlnV3hw?=
 =?utf-8?B?NElRejJQSHFLVmpVYm5LdGpNalpyR0Y4eEVWR1Vod3FrUVI4Qm8vRi9qYzB3?=
 =?utf-8?B?MmptdEl3OS94TmlLQ2NKQjFITFBnRnFLQm5wei93Z3dMZEcrRXl0VlZIRHlT?=
 =?utf-8?B?RUhhd0RBT0x3aEY3cTdkdmpHem5VV1JwRlVNVjUzUnhuYm9hQ2YyN3kwK0xJ?=
 =?utf-8?B?UXJoVjg1MUVxd3Q4eTZ2ZkJ2YkREclJ3b0hXQnZFajI1dklmQ0g1eHlyYmdR?=
 =?utf-8?B?VSt1dXVVN3pHbG5ocEo1K2U1NmJxR2lVeHZHN09mYTF3K1dXNnRyS28vLzdp?=
 =?utf-8?B?ZThqeXRUdTBUeUZ5OG1Ra1oxMlNUVFhmTHhsNlZMczJrSHZzRDRvcUhkUS8y?=
 =?utf-8?B?S25oVWYwUmRvbjdHNzhyUEhxRDRYTlJUOHdGZlQvUnZPTGF4NnhRa1p2b2dR?=
 =?utf-8?B?Ymk2ZXVQN3JBbGNQTE9pU3JEV0VkUkZzelhjcVRYZi8xOVJtQy96MFBUUTQy?=
 =?utf-8?B?NjdRVVdvdUMrdjhDMFhpWldGSjhzdUdoQXprZG1yVlp3N2t1ZGFENlArcUtp?=
 =?utf-8?B?S2pnYlZTbWdPUGwyRHRieUMyejNMOTlNREJNSU93MkhSV2pLbGhpbGRMKzdN?=
 =?utf-8?B?NWZVUUlZZzZ1aTdwMnBaMjF3Z215Qko1dC96ODBYdS94OWQxRFZpUGFCUFpa?=
 =?utf-8?B?RWRlSDVrWWxGcFpSQi92bVBla2RoL0xST253ajU4RnFmS01Yem9CVmVma1M3?=
 =?utf-8?B?UnFuTzlsb2FwbDdiMmxTdU9BVE9jMUlDTXkzbm5QRWpXLzVSYkhxWXFjUWlY?=
 =?utf-8?B?WkRoWlFpbVJjVUdkUk1BQm9xby9iVTNYbkJ3aHNDVUw5dW1rWHdUNCtHUTk4?=
 =?utf-8?B?ZllwRGRUelV3dGFpRGpQWnp4Y1lDamNhMkdRYTJoRmZiRmhNSEIwWmQ5RXkr?=
 =?utf-8?B?YTNqMGplTlowc2UyVUNiMGxaMmt1Y3NoTTJ6My92QmNZaWxPb0ltL3dYRXdL?=
 =?utf-8?B?UFNQTDFMeWFOZHlRVVhUd1hhS1N1bkRWa3NlOHo4dnA2RkRDeWgrTjBaQ0JS?=
 =?utf-8?B?ankvbEdpdTBiMThKdys2cTk0K1o2QUxSK2hDN1dEUzBweGUyaTFQVExtQkRG?=
 =?utf-8?B?MDQzRjNLak5ta2hYSWFaZlRENDNHdnZzY1RESGRXSnJ3TUhzbDlHQWtxUVZa?=
 =?utf-8?B?SWVZdUFQRlp3RGp3cmdKNGdvNGdsK1RrQXlaSjRWYitJd1RacXpobzNUNzNl?=
 =?utf-8?B?S3lwdDVadUZneG1kSFp6SnJqbnY0bHErdi9wbzRPR21UNEVnTnN6RHhvSVZt?=
 =?utf-8?B?elcrMW0vS2s4RGVlTHIxenNTdllKbU85cHo1RTRoYkRHYjdURjBzUXpUNDhm?=
 =?utf-8?B?L2xQYWQ3Q3Y0aHQ3cVBSUjhkdlZ1czhoaWNDNmlPTHl0cXV2RjJ1cGc4WUhv?=
 =?utf-8?B?SlNGbld6M2xacDV3N0w0ZlNldml5MUlsSEttRm1WZSs4NTk4TjhzUndiczZ2?=
 =?utf-8?B?ZWpseGFSVlErMFJJWFZvdWJWZmJVOHRFeWlJSEtjRmsrQVRYMnY4SG1DTEw4?=
 =?utf-8?Q?W13POMULu1ZSYFhLr9j8tBiQzkBVE2YeiUw1orh?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ac248b1-8fde-420f-a67a-08d8f998a1ac
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 07:42:01.9614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ASMLK9nFsve5BDHvUcAgT58YZ3WcaZucl9bZRKWe/Imtrdsd6+JY+Z40apd2NV/kvWUVqWjSdhcm3mApLIsqTx6dSR7IA4uQHQsDdWssXCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6466
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

On 30/03/2021 08:43, Guenter Roeck wrote:
> On 3/28/21 6:52 PM, Quan Nguyen wrote:
>> This commit adds support for Ampere SMpro hwmon driver. This driver
>> supports accessing various CPU sensors provided by the SMpro co-processor
>> including temperature, power, voltages, and current.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>>   drivers/hwmon/Kconfig       |   8 +
>>   drivers/hwmon/Makefile      |   1 +
>>   drivers/hwmon/smpro-hwmon.c | 494 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 503 insertions(+)
>>   create mode 100644 drivers/hwmon/smpro-hwmon.c
>>
>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>> index 0ddc974b102e..ba4b5a911baf 100644
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
>> index 59e78bc212cf..b25391f9c651 100644
>> --- a/drivers/hwmon/Makefile
>> +++ b/drivers/hwmon/Makefile
>> @@ -174,6 +174,7 @@ obj-$(CONFIG_SENSORS_SHT3x)	+= sht3x.o
>>   obj-$(CONFIG_SENSORS_SHTC1)	+= shtc1.o
>>   obj-$(CONFIG_SENSORS_SIS5595)	+= sis5595.o
>>   obj-$(CONFIG_SENSORS_SMM665)	+= smm665.o
>> +obj-$(CONFIG_SENSORS_SMPRO)	+= smpro-hwmon.o
>>   obj-$(CONFIG_SENSORS_SMSC47B397)+= smsc47b397.o
>>   obj-$(CONFIG_SENSORS_SMSC47M1)	+= smsc47m1.o
>>   obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
>> diff --git a/drivers/hwmon/smpro-hwmon.c b/drivers/hwmon/smpro-hwmon.c
>> new file mode 100644
>> index 000000000000..4277736ebc6e
>> --- /dev/null
>> +++ b/drivers/hwmon/smpro-hwmon.c
>> @@ -0,0 +1,494 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Ampere Computing SoC's SMPro Hardware Monitoring Driver
>> + *
>> + * Copyright (c) 2021, Ampere Computing LLC
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
>> +struct smpro_hwmon {
>> +	struct regmap *regmap;
>> +};
>> +
>> +struct smpro_sensor {
>> +	const u8 reg;
>> +	const u8 reg_ext;
>> +	const char *label;
>> +};
>> +
>> +static const struct smpro_sensor temperature[] = {
>> +	{
>> +		.reg = SOC_TEMP_REG,
>> +		.label = "temp1 SoC"
>> +	},
>> +	{
>> +		.reg = SOC_VRD_TEMP_REG,
>> +		.label = "temp2 SoC VRD"
>> +	},
>> +	{
>> +		.reg = DIMM_VRD_TEMP_REG,
>> +		.label = "temp3 DIMM VRD"
>> +	},
>> +	{
>> +		.reg = CORE_VRD_TEMP_REG,
>> +		.label = "temp4 CORE VRD"
>> +	},
>> +	{
>> +		.reg = CH0_DIMM_TEMP_REG,
>> +		.label = "temp5 CH0 DIMM"
>> +	},
>> +	{
>> +		.reg = CH1_DIMM_TEMP_REG,
>> +		.label = "temp6 CH1 DIMM"
>> +	},
>> +	{
>> +		.reg = CH2_DIMM_TEMP_REG,
>> +		.label = "temp7 CH2 DIMM"
>> +	},
>> +	{
>> +		.reg = CH3_DIMM_TEMP_REG,
>> +		.label = "temp8 CH3 DIMM"
>> +	},
>> +	{
>> +		.reg = CH4_DIMM_TEMP_REG,
>> +		.label = "temp9 CH4 DIMM"
>> +	},
>> +	{
>> +		.reg = CH5_DIMM_TEMP_REG,
>> +		.label = "temp10 CH5 DIMM"
>> +	},
>> +	{
>> +		.reg = CH6_DIMM_TEMP_REG,
>> +		.label = "temp11 CH6 DIMM"
>> +	},
>> +	{
>> +		.reg = CH7_DIMM_TEMP_REG,
>> +		.label = "temp12 CH7 DIMM"
>> +	},
>> +	{
>> +		.reg = RCA_VRD_TEMP_REG,
>> +		.label = "temp13 RCA VRD"
>> +	},
>> +};
>> +
>> +static const struct smpro_sensor voltage[] = {
>> +	{
>> +		.reg = CORE_VRD_VOLT_REG,
>> +		.label = "vout0 CORE VRD"
>> +	},
>> +	{
>> +		.reg = SOC_VRD_VOLT_REG,
>> +		.label = "vout1 SoC VRD"
>> +	},
>> +	{
>> +		.reg = DIMM_VRD1_VOLT_REG,
>> +		.label = "vout2 DIMM VRD1"
>> +	},
>> +	{
>> +		.reg = DIMM_VRD2_VOLT_REG,
>> +		.label = "vout3 DIMM VRD2"
>> +	},
>> +	{
>> +		.reg = RCA_VRD_VOLT_REG,
>> +		.label = "vout4 RCA VRD"
>> +	},
>> +};
>> +
>> +static const struct smpro_sensor curr_sensor[] = {
>> +	{
>> +		.reg = CORE_VRD_CURR_REG,
>> +		.label = "iout1 CORE VRD"
>> +	},
>> +	{
>> +		.reg = SOC_VRD_CURR_REG,
>> +		.label = "iout2 SoC VRD"
>> +	},
>> +	{
>> +		.reg = DIMM_VRD1_CURR_REG,
>> +		.label = "iout3 DIMM VRD1"
>> +	},
>> +	{
>> +		.reg = DIMM_VRD2_CURR_REG,
>> +		.label = "iout4 DIMM VRD2"
>> +	},
>> +	{
>> +		.reg = RCA_VRD_CURR_REG,
>> +		.label = "iout5 RCA VRD"
>> +	},
>> +};
>> +
>> +static const struct smpro_sensor power[] = {
>> +	{
>> +		.reg = CORE_VRD_PWR_REG,
>> +		.reg_ext = CORE_VRD_PWR_MW_REG,
>> +		.label = "power1 CORE VRD"
>> +	},
>> +	{
>> +		.reg = SOC_PWR_REG,
>> +		.reg_ext = SOC_PWR_MW_REG,
>> +		.label = "power2 SoC"
>> +	},
>> +	{
>> +		.reg = DIMM_VRD1_PWR_REG,
>> +		.reg_ext = DIMM_VRD1_PWR_MW_REG,
>> +		.label = "power3 DIMM VRD1"
>> +	},
>> +	{
>> +		.reg = DIMM_VRD2_PWR_REG,
>> +		.reg_ext = DIMM_VRD2_PWR_MW_REG,
>> +		.label = "power4 DIMM VRD2"
>> +	},
>> +	{
>> +		.reg = RCA_VRD_PWR_REG,
>> +		.reg_ext = RCA_VRD_PWR_MW_REG,
>> +		.label = "power5 RCA VRD"
>> +	},
>> +};
>> +
>> +static int smpro_read_temp(struct device *dev, u32 attr, int channel, long *val)
>> +{
>> +	struct smpro_hwmon *hwmon = dev_get_drvdata(dev);
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	switch (attr) {
>> +	case hwmon_temp_input:
>> +		ret = regmap_read(hwmon->regmap,
>> +				  temperature[channel].reg, &value);
>> +		if (ret)
>> +			return ret;
>> +		*val = (value & 0x1ff) * 1000;
>> +		break;
>> +	case hwmon_temp_crit:
>> +		if (temperature[channel].reg == SOC_VRD_TEMP_REG) {
>> +			ret = regmap_read(hwmon->regmap, SOC_VR_HOT_THRESHOLD_REG, &value);
>> +			if (ret)
>> +				return ret;
>> +			*val = (value & 0x1ff) * 1000;
>> +		} else {
>> +			/* Report same MEM HOT threshold across DIMM channels */
>> +			ret = regmap_read(hwmon->regmap, MEM_HOT_THRESHOLD_REG, &value);
>> +			if (ret)
>> +				return ret;
>> +			*val = (value & 0x1ff) * 1000;
>> +		}
> 
> To avoid code duplication:
> 
> 		reg = temperature[channel].reg == SOC_VRD_TEMP_REG ? SOC_VR_HOT_THRESHOLD_REG : MEM_HOT_THRESHOLD_REG;
> 		ret = regmap_read(hwmon->regmap, reg, &value);
> 		if (ret)
> 			return ret;
> 
> But then why don't you just use reg_ext to store SOC_VR_HOT_THRESHOLD_REG
> or MEM_HOT_THRESHOLD_REG ? It is already available, after all, and with it
> the code could be simplified to
> 
> 		ret = regmap_read(hwmon->regmap, temperature[channel].reg_ext, &value);
> 		if (ret)
> 			return ret;
> 
Thank you for the comment.

Will change code follow this suggestion, will include in next version

> I don't have a datasheet, but I do wonder what is in bit 9..15. Any idea ?
> Main question is if there is a sign bit, as theoretic as it may be.
> 
The original intention was to use this as 9-bit 2-complement value 
follow LM75, but the fact is that the operation temperature is 0-125 C 
degree, so we simply use it as-is.

>> +		break;
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +	return 0;
>> +}
>> +
>> +static int smpro_read_in(struct device *dev, u32 attr, int channel, long *val)
>> +{
>> +	struct smpro_hwmon *hwmon = dev_get_drvdata(dev);
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	switch (attr) {
>> +	case hwmon_in_input:
>> +		ret = regmap_read(hwmon->regmap, voltage[channel].reg, &value);
>> +		if (ret < 0)
>> +			return ret;
>> +		/* Scale reported by the hardware is 1mV */
>> +		*val = value & 0x7fff;
> 
> What is in bit 15 ?
> 
This is 15-bit voltage in mV so the bit 15 (0-15) is unused.

>> +		return 0;
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +}
>> +
>> +static int smpro_read_curr(struct device *dev, u32 attr, int channel, long *val)
>> +{
>> +	struct smpro_hwmon *hwmon = dev_get_drvdata(dev);
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	switch (attr) {
>> +	case hwmon_curr_input:
>> +		ret = regmap_read(hwmon->regmap, curr_sensor[channel].reg, &value);
>> +		if (ret < 0)
>> +			return ret;
>> +		/* Scale reported by the hardware is 1mA */
>> +		*val = value & 0x7fff;
>> +		return 0;
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +}
>> +
>> +static int smpro_read_power(struct device *dev, u32 attr, int channel, long *val_pwr)
>> +{
>> +	struct smpro_hwmon *hwmon = dev_get_drvdata(dev);
>> +	unsigned int val = 0, val_mw = 0;
>> +	int ret;
>> +
>> +	switch (attr) {
>> +	case hwmon_power_input:
>> +		ret = regmap_read(hwmon->regmap, power[channel].reg, &val);
>> +		if (ret)
>> +			return ret;
>> +
>> +		ret = regmap_read(hwmon->regmap, power[channel].reg_ext, &val_mw);
>> +		if (ret)
>> +			return ret;
>> +
>> +		*val_pwr = val * 1000000 + val_mw * 1000;
>> +		return 0;
>> +
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +}
>> +
>> +static int smpro_read(struct device *dev, enum hwmon_sensor_types type,
>> +		      u32 attr, int channel, long *val)
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
>> +		       u32 attr, int channel, long val)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
> 
> There are no writeable attributes, thus the write function is not needed.
> 
Agree, will remove in next version

>> +
>> +static int smpro_read_string(struct device *dev, enum hwmon_sensor_types type,
>> +			     u32 attr, int channel, const char **str)
>> +{
>> +	switch (type) {
>> +	case hwmon_temp:
>> +		switch (attr) {
>> +		case hwmon_temp_label:
>> +			*str = temperature[channel].label;
>> +			return 0;
>> +		default:
>> +			return -EOPNOTSUPP;
>> +		}
>> +		break;
>> +
>> +	case hwmon_in:
>> +		switch (attr) {
>> +		case hwmon_in_label:
>> +			*str = voltage[channel].label;
>> +			return 0;
>> +		default:
>> +			return -EOPNOTSUPP;
>> +		}
>> +		break;
>> +
>> +	case hwmon_curr:
>> +		switch (attr) {
>> +		case hwmon_curr_label:
>> +			*str = curr_sensor[channel].label;
>> +			return 0;
>> +		default:
>> +			return -EOPNOTSUPP;
>> +		}
>> +		break;
>> +
>> +	case hwmon_power:
>> +		switch (attr) {
>> +		case hwmon_power_label:
>> +			*str = power[channel].label;
>> +			return 0;
>> +		default:
>> +			return -EOPNOTSUPP;
>> +		}
>> +		break;
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +
>> +	return -EOPNOTSUPP;
> 
> If you are returning -ENOPSUPP by default, might as well replace
> all the same returns above with break;
> 
Yes, will fix as you suggested. Will include in next version

>> +}
>> +
>> +static umode_t smpro_is_visible(const void *data, enum hwmon_sensor_types type,
>> +				u32 attr, int channel)
>> +{
>> +	const struct smpro_hwmon *hwmon = data;
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	switch (type) {
>> +	case hwmon_temp:
>> +		switch (attr) {
>> +		case hwmon_temp_input:
>> +		case hwmon_temp_label:
>> +		case hwmon_temp_crit:
>> +			ret = regmap_read(hwmon->regmap, temperature[channel].reg, &value);
>> +			if (ret || value == 0xFFFF)
>> +				return 0;
>> +		break;
>> +		}
>> +	default:
>> +		break;
>> +	}
>> +
>> +	return 0444;
>> +}
>> +
>> +static const struct hwmon_channel_info *smpro_info[] = {
>> +	HWMON_CHANNEL_INFO(temp,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL),
>> +	HWMON_CHANNEL_INFO(in,
>> +			   HWMON_I_INPUT | HWMON_I_LABEL,
>> +			   HWMON_I_INPUT | HWMON_I_LABEL,
>> +			   HWMON_I_INPUT | HWMON_I_LABEL,
>> +			   HWMON_I_INPUT | HWMON_I_LABEL,
>> +			   HWMON_I_INPUT | HWMON_I_LABEL),
>> +	HWMON_CHANNEL_INFO(power,
>> +			   HWMON_P_INPUT | HWMON_P_LABEL,
>> +			   HWMON_P_INPUT | HWMON_P_LABEL,
>> +			   HWMON_P_INPUT | HWMON_P_LABEL,
>> +			   HWMON_P_INPUT | HWMON_P_LABEL,
>> +			   HWMON_P_INPUT | HWMON_P_LABEL),
>> +	HWMON_CHANNEL_INFO(curr,
>> +			   HWMON_C_INPUT | HWMON_C_LABEL,
>> +			   HWMON_C_INPUT | HWMON_C_LABEL,
>> +			   HWMON_C_INPUT | HWMON_C_LABEL,
>> +			   HWMON_C_INPUT | HWMON_C_LABEL,
>> +			   HWMON_C_INPUT | HWMON_C_LABEL),
>> +	NULL
>> +};
>> +
>> +static const struct hwmon_ops smpro_hwmon_ops = {
>> +	.is_visible = smpro_is_visible,
>> +	.read = smpro_read,
>> +	.write = smpro_write,
>> +	.read_string = smpro_read_string,
>> +};
>> +
>> +static const struct hwmon_chip_info smpro_chip_info = {
>> +	.ops = &smpro_hwmon_ops,
>> +	.info = smpro_info,
>> +};
>> +
>> +static bool is_valid_id(struct regmap *regmap)
>> +{
>> +	unsigned int val;
>> +	int ret;
>> +
>> +	ret = regmap_read(regmap, MANUFACTURER_ID_REG, &val);
>> +
>> +	return  (ret || (val != AMPERE_MANUFACTURER_ID)) ? false : true;
> 
> I am quite concerned about this: The calling code will translate it to
> -EPROBE_DEFER even if the manufacturer ID is wrong. It should return
> -ENODEV in that case. There should be a better means to determine if the
> controller is not available at all, or not yet.
> 
Yes, I agree

Will fix in next version:
   + if the regmap_read return error, return -EPROBE_DEFER
   + if manufacturer ID is wrong, return -ENODEV

>> +}
>> +
>> +static int smpro_hwmon_probe(struct platform_device *pdev)
>> +{
>> +	struct smpro_hwmon *hwmon;
>> +	struct device *hwmon_dev;
>> +
>> +	hwmon = devm_kzalloc(&pdev->dev, sizeof(struct smpro_hwmon), GFP_KERNEL);
>> +	if (!hwmon)
>> +		return -ENOMEM;
>> +
>> +	hwmon->regmap = dev_get_regmap(pdev->dev.parent, NULL);
>> +	if (!hwmon->regmap)
>> +		return -ENODEV;
>> +
>> +	/* Check for valid ID */
>> +	if (!is_valid_id(hwmon->regmap))
>> +		return -EPROBE_DEFER;
>> +
>> +	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev, "smpro_hwmon",
>> +							 hwmon, &smpro_chip_info, NULL);
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
>> +MODULE_LICENSE("GPL v2");
>>
> 

