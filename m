Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 571EC3600D7
	for <lists+openbmc@lfdr.de>; Thu, 15 Apr 2021 06:14:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLQvj2Y5Jz3bSt
	for <lists+openbmc@lfdr.de>; Thu, 15 Apr 2021 14:14:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=bQoEV40D;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.244.135;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=bQoEV40D; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2135.outbound.protection.outlook.com [40.107.244.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLQvM1tgfz300x;
 Thu, 15 Apr 2021 14:13:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JrKU6vN37iiaBx7jDHHGBVF7gSr4ihe5O3U5s21jz6UhkR7VSe2UJRK1mStKrbU1qEwdZXjvqwHiyNqkBpMDk2dgteCNUdWjAmafLPB3AQ1PhuXuU6x7gxUQaRHferCDzUtgpKwupIYdgAaQP/g4Oj+YWlG4GxAk1sSN3J0oiqh/3Z6m/QCgLjAF9BwEOlqe2Prc40uKLEMxLKLyR1W3T7styTyBun7jvzsmmrs5FVswjg/CWImtt8kE5qa2apQxLa0M5oydBGF0meEQZW3bF06GAoOzneNe/u9qN4wattDYWl7x7UEZLgsnJgsGvrizZCHvGamIXZoclxAEHfifqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PaVK9do43a91jtMEzqBRUOaSahKxp/rTicesDZbbxNY=;
 b=kaxZnUtEmxA/QUF9iNL41mJOs1M7GHH9d432v0scYwNsy1TEkTjvhTJR2Lt0ogpTadPegQRflslEokDc9Et9m0zwYLyOpNBnkYSki0p/T1xAgl75tpVl3t0HYREUK59epB3fCPwEXlUpKbMNETYKQBr7twSOHWaEKtgoVWegAgTrSfX+SMA7crMyvmJC3u4sIIsg92xVkxdqfQngU6j6N3zdJtmmIK4LRgsb397RLywHe4QB99wn5k60FlpD863rudjNznVoyH7kAVrJ28s4fXDHG9QwhvCSBYKZNywyozcGO9HIFDBFfN1qNH3RzwdGBDdStP8NOS7rpsfoswN2YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PaVK9do43a91jtMEzqBRUOaSahKxp/rTicesDZbbxNY=;
 b=bQoEV40DVFPPiilSo41PsOMcwSvQWBr3G2qZEjv8JUXY5/rjp9+4cRFxrBl3LvODD+Bo/myPWjt/r74s8hCVBk+gjtnxFaz5qLnfHWH65Y4mizweibBlgIAifUiYeq9yDOgUx/JqwzqurizU+TJhQE8d6SCVfn2Q3bv8FE3ntnI=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none; os.amperecomputing.com;
 dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 CO2PR01MB2071.prod.exchangelabs.com (2603:10b6:102:b::17) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.21; Thu, 15 Apr 2021 04:13:42 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4042.018; Thu, 15 Apr 2021
 04:13:42 +0000
Subject: Re: [PATCH v3 3/4] hwmon: smpro: Add Ampere's Altra smpro-hwmon driver
To: Guenter Roeck <linux@roeck-us.net>
References: <20210409031332.21919-1-quan@os.amperecomputing.com>
 <20210409031332.21919-4-quan@os.amperecomputing.com>
 <20210414123349.GA18905@roeck-us.net>
From: Quan Nguyen <quan@os.amperecomputing.com>
Message-ID: <6a620f7c-af06-61db-feec-66814fdbae7e@os.amperecomputing.com>
Date: Thu, 15 Apr 2021 11:13:22 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
In-Reply-To: <20210414123349.GA18905@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: SG2PR06CA0211.apcprd06.prod.outlook.com
 (2603:1096:4:68::19) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.32.245] (118.69.219.201) by
 SG2PR06CA0211.apcprd06.prod.outlook.com (2603:1096:4:68::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Thu, 15 Apr 2021 04:13:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b410591-a1d9-47a2-1d48-08d8ffc4da28
X-MS-TrafficTypeDiagnostic: CO2PR01MB2071:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO2PR01MB2071A31E8377FA4318770FEEF24D9@CO2PR01MB2071.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W/qOQncqL7BSK8fIe6xxmPxyhOnvGDnMZvp0xvglRyO64CC/KVVwG8haZ5ojphbZqawUGzWOg95TEbUxuFNNuWwhrs8r94T95RGkIryA/imcJW9w0I/CudzO1Gs+JWnZUt2ohhgGUUetl19UQiHYPOch2KjaXiDBHb6TZGwTERfY0e3UQ6WtXsUlA6Dn2t5u1HGi1x4VuBEAbQj1ElTEqV+2A+yTjDh4xRw8LGwQhz0mUKIeDfFC2+hvaveGd2Rur1C2jFMW16t5st6qHB+zLG8gzCo0i7LE1dW6x7trGFlL1FnNf0QtlOxZs9qHy6WzLKdDSsHG0hc1g7xiKmbm7EAfnKsuJqnCX0isTCzIfiGDzuLzEeK+qcN5CB8G8P+q/JGPsTHVSnbL4HeFrQFN7oPKgk4WXX+P2ilzG/fTjwh4ilgx8qyEWAsVFYttb9eDjeI2xILRuvXAZfSfJ+0kE0o26mtdKmtHpCaSC+AlWxRdSF7sqH66kcK4MlIN1q5d9BoP6qCfysm+cOH/DjCE5KP5TYQyEP+mZDEeZSn6yNn0fo+w1uvKnaS4Tve2hjVljUsm5ynvCbaQqUuj3tlPdv6aYMLenIrt8C3okqKQeu9B+as0un+3Uz9NWFBDptaJlKwXXUe5+nH+TOMTZ/jKYU+jfElKQnMh9MZLPhq6o7U2v9iHT0H8PWyjntUd00hnsEfGlXLAXaahgvy2yxJiog==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(39850400004)(366004)(346002)(186003)(956004)(6666004)(16526019)(30864003)(53546011)(2616005)(38100700002)(16576012)(54906003)(478600001)(38350700002)(83380400001)(316002)(26005)(31696002)(5660300002)(8936002)(7416002)(52116002)(66476007)(86362001)(66556008)(4326008)(6916009)(31686004)(66946007)(6486002)(107886003)(8676002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cEJBN1VHbGZjV3RuTndndWx1U0srbTdhanoxenlBQTE0Z2RhL29NSkkwVHh4?=
 =?utf-8?B?bnJUTVp0WEtJaUdWVGR5REpxanlHZDFHRlZOL0NPQ3pzTHZDUU5kS25VazF0?=
 =?utf-8?B?cjVsbzZuUkwzbERtYTBjSVRFTDIrYy9rcktHNlRvRTRtV2dKSlZ5bjlmQXY0?=
 =?utf-8?B?cERzOG1uaDgvcjZpSVc1QWI2cWxzNVNhZ3JKdFNGRFF0cWRrNFZXSW4yZGpp?=
 =?utf-8?B?RkxGcllQcStXZk1zSTQ0SlJDbDFVSFA4Z1ErMHNudE8wODFrQkpobkFoaWtQ?=
 =?utf-8?B?QVVhRGk3akFJdUtySkdhNEVRR0tub0VEU1RSaDBacXBZWUJxdEs3QnZ3QTNw?=
 =?utf-8?B?eG9Nbk56VlBYK0trT1FTTVJFQ25RK1R5Nno2R2tGb04yZE5oZnVVT0l1RWtQ?=
 =?utf-8?B?NnBtblBneHFTVS82ekVxMSt3WXFUbVlYb1dHQTF1SWhLeCtudjVhcm9jWU1n?=
 =?utf-8?B?bUJwY1ZvRFc0NHNIaFVjSVhhU3VzckNTWG1FN01DN1IzdTh0RUYvN1NDRWhX?=
 =?utf-8?B?Z3VsOCtqaThucVVIMGE5WjF5T0dIZEc0V2xKVGd6K2g4ZVRuUkZVVUxtbTlB?=
 =?utf-8?B?V2VGTHI1YWgrQ0E5RnV2WEdFZEU0RDYrWkJ0TnFkYTI1TGQwL3hoWHBldlZB?=
 =?utf-8?B?VkxIK2lwamdCdHhaS293bDhkZ2VKbnhRL1lrYXFobU1NbGt3UDIyUjc4dkR1?=
 =?utf-8?B?Q0VnYTU5c0d5YldwRTNqNWpOUUd5ZzU1TnNFWVhXV0I0d044eFRIcEczbkJ3?=
 =?utf-8?B?Mndldld3RENreGU4T0t2b09mOVhuZVZCeWZ3ckdLL2d2aXNNQXI3eDFDcHNN?=
 =?utf-8?B?akdFVXpaTEcwN0l0N3dDTlRsWWZlWG1NT05kZ2U5VTNSVjJHSExjaWxlNkl1?=
 =?utf-8?B?bnVXSng4YVd3a2FKMWdzb2R1WVg2enVaS1RmVDJqNml2dDlMNVo0OHg2SmNk?=
 =?utf-8?B?VGVRampWSEl0UVVDMHJyT2VucWI3QUsxaVE4bGd1bS8vUVcwWUcyL3hoVGVU?=
 =?utf-8?B?RkhlNDR6dE1sRU5YSFBBNjR0OC8vTkNmNUNiVENGSXBmL2NQMTlmYWxOMXlI?=
 =?utf-8?B?a2pQVWMxMWRDNHZrRlg1Z0RDK1VsVFFIa0pldVk4V3g5b29NZkJLUlYrc2Nu?=
 =?utf-8?B?V3RKV3RVTUtKN3RsQzVLbXlibnpVc280bE5ZeWlhanR6SS93RHcxRnZFcVVO?=
 =?utf-8?B?Zm1hSkljTGl4dGRZcDhMVTNZK3ROSlJoZkhJYm1Va1paR3FtRU56cERjdU5n?=
 =?utf-8?B?R0tNM3NqeTBNWWRJd2cxR2ZlNG1kaFNFTllyUHlyZlhlbDd2RmE0dkZYQ0dJ?=
 =?utf-8?B?UGU5NUkyV25YeXF6UG4zWFZrZ0pRVDRTdUtsTTBXblkrMFdhaS90dk9OSHcw?=
 =?utf-8?B?ZWlMQlZ6SnZXdWFxSzJCZ2tPckd2bWx4K2swQ0l3N1kzYTN6WjZOZkxCQk9m?=
 =?utf-8?B?dnBLQWIwY216V005c2dUb1RGT3I2cGFpYndiWnBjR2hYTzJXQzZNWktpSm5J?=
 =?utf-8?B?OWMzS3orbE9oWVN5NWwzWXJtVUJKWFJrODQ3cXE1bS9xVW84eVdiM24zNHh2?=
 =?utf-8?B?QXJjNmh3RExkREtQSkQ4UzRBdDd6dzhzTEdmeGwwVUplVFhhYko0VjdUNHQr?=
 =?utf-8?B?V0Zkbmtzb3dzMW9GcDV1Q2U0NXpnTEJaRUZKd2pKbkg2WVpmL2NHVDFNSjVx?=
 =?utf-8?B?NThGN0FoZnlDSytwVmVVaGo3Rjkya1VSYUJ2Sm43VjFsRVZES3FVaFhpSnNT?=
 =?utf-8?Q?FB3q3wgmq84cY7CtvllC6XhlZzTd8WTxkngwKoi?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b410591-a1d9-47a2-1d48-08d8ffc4da28
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 04:13:41.8236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xEccVKLvZJIqxGBOImwotLEpFeSVvnB7uLIRc2uODWusVJE/97W6FLO1fOWkMFl+oHQWr8a+mCnFN+znYM2OJ55m4rsv5XtKk6GKT9pvr3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR01MB2071
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, linux-aspeed@lists.ozlabs.org,
 Jonathan Corbet <corbet@lwn.net>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>,
 Open Source Submission <patches@amperecomputing.com>,
 Lee Jones <lee.jones@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 14/04/2021 19:33, Guenter Roeck wrote:
> On Fri, Apr 09, 2021 at 10:13:31AM +0700, Quan Nguyen wrote:
>> This commit adds support for Ampere SMpro hwmon driver. This driver
>> supports accessing various CPU sensors provided by the SMpro co-processor
>> including temperature, power, voltages, and current.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
> 
> Change log goes here. You are making it difficult to review your patches.
> 
Will add changelog here in next version.

>>   drivers/hwmon/Kconfig       |   8 +
>>   drivers/hwmon/Makefile      |   1 +
>>   drivers/hwmon/smpro-hwmon.c | 491 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 500 insertions(+)
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
>> index 000000000000..a3389fcbad82
>> --- /dev/null
>> +++ b/drivers/hwmon/smpro-hwmon.c
>> @@ -0,0 +1,491 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Ampere Computing SoC's SMPro Hardware Monitoring Driver
>> + *
>> + * Copyright (c) 2021, Ampere Computing LLC
>> + */
>> +#include <linux/bitfield.h>
>> +#include <linux/bitops.h>
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
>> +#define MANUFACTURER_ID_REG	0x02
>> +#define AMPERE_MANUFACTURER_ID	0xCD3A
>> +
>> +/* Logical Power Sensor Registers */
>> +#define SOC_TEMP		0x00
>> +#define SOC_VRD_TEMP		0x01
>> +#define DIMM_VRD_TEMP		0x02
>> +#define CORE_VRD_TEMP		0x03
>> +#define CH0_DIMM_TEMP		0x04
>> +#define CH1_DIMM_TEMP		0x05
>> +#define CH2_DIMM_TEMP		0x06
>> +#define CH3_DIMM_TEMP		0x07
>> +#define CH4_DIMM_TEMP		0x08
>> +#define CH5_DIMM_TEMP		0x09
>> +#define CH6_DIMM_TEMP		0x0A
>> +#define CH7_DIMM_TEMP		0x0B
>> +#define RCA_VRD_TEMP		0x0C
>> +
>> +#define CORE_VRD_PWR		0x10
>> +#define SOC_PWR			0x11
>> +#define DIMM_VRD1_PWR		0x12
>> +#define DIMM_VRD2_PWR		0x13
>> +#define CORE_VRD_PWR_MW		0x16
>> +#define SOC_PWR_MW		0x17
>> +#define DIMM_VRD1_PWR_MW	0x18
>> +#define DIMM_VRD2_PWR_MW	0x19
>> +#define RCA_VRD_PWR		0x1A
>> +#define RCA_VRD_PWR_MW		0x1B
>> +
>> +#define MEM_HOT_THRESHOLD	0x22
>> +#define SOC_VR_HOT_THRESHOLD	0x23
>> +#define CORE_VRD_VOLT		0x24
>> +#define SOC_VRD_VOLT		0x25
>> +#define DIMM_VRD1_VOLT		0x26
>> +#define DIMM_VRD2_VOLT		0x27
>> +#define RCA_VRD_VOLT		0x28
>> +
>> +#define CORE_VRD_CURR		0x29
>> +#define SOC_VRD_CURR		0x2A
>> +#define DIMM_VRD1_CURR		0x2B
>> +#define DIMM_VRD2_CURR		0x2C
>> +#define RCA_VRD_CURR		0x2D
>> +
>> +struct smpro_hwmon {
>> +	struct regmap *regmap;
>> +	u32 offset;
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
>> +		.reg = SOC_TEMP,
>> +		.label = "temp1 SoC"
>> +	},
>> +	{
>> +		.reg = SOC_VRD_TEMP,
>> +		.reg_ext = SOC_VR_HOT_THRESHOLD,
>> +		.label = "temp2 SoC VRD"
>> +	},
>> +	{
>> +		.reg = DIMM_VRD_TEMP,
>> +		.label = "temp3 DIMM VRD"
>> +	},
>> +	{
>> +		.reg = CORE_VRD_TEMP,
>> +		.label = "temp4 CORE VRD"
>> +	},
>> +	{
>> +		.reg = CH0_DIMM_TEMP,
>> +		.reg_ext = MEM_HOT_THRESHOLD,
>> +		.label = "temp5 CH0 DIMM"
>> +	},
>> +	{
>> +		.reg = CH1_DIMM_TEMP,
>> +		.reg_ext = MEM_HOT_THRESHOLD,
>> +		.label = "temp6 CH1 DIMM"
>> +	},
>> +	{
>> +		.reg = CH2_DIMM_TEMP,
>> +		.reg_ext = MEM_HOT_THRESHOLD,
>> +		.label = "temp7 CH2 DIMM"
>> +	},
>> +	{
>> +		.reg = CH3_DIMM_TEMP,
>> +		.reg_ext = MEM_HOT_THRESHOLD,
>> +		.label = "temp8 CH3 DIMM"
>> +	},
>> +	{
>> +		.reg = CH4_DIMM_TEMP,
>> +		.reg_ext = MEM_HOT_THRESHOLD,
>> +		.label = "temp9 CH4 DIMM"
>> +	},
>> +	{
>> +		.reg = CH5_DIMM_TEMP,
>> +		.reg_ext = MEM_HOT_THRESHOLD,
>> +		.label = "temp10 CH5 DIMM"
>> +	},
>> +	{
>> +		.reg = CH6_DIMM_TEMP,
>> +		.reg_ext = MEM_HOT_THRESHOLD,
>> +		.label = "temp11 CH6 DIMM"
>> +	},
>> +	{
>> +		.reg = CH7_DIMM_TEMP,
>> +		.reg_ext = MEM_HOT_THRESHOLD,
>> +		.label = "temp12 CH7 DIMM"
>> +	},
>> +	{
>> +		.reg = RCA_VRD_TEMP,
>> +		.label = "temp13 RCA VRD"
>> +	},
>> +};
>> +
>> +static const struct smpro_sensor voltage[] = {
>> +	{
>> +		.reg = CORE_VRD_VOLT,
>> +		.label = "vout0 CORE VRD"
>> +	},
>> +	{
>> +		.reg = SOC_VRD_VOLT,
>> +		.label = "vout1 SoC VRD"
>> +	},
>> +	{
>> +		.reg = DIMM_VRD1_VOLT,
>> +		.label = "vout2 DIMM VRD1"
>> +	},
>> +	{
>> +		.reg = DIMM_VRD2_VOLT,
>> +		.label = "vout3 DIMM VRD2"
>> +	},
>> +	{
>> +		.reg = RCA_VRD_VOLT,
>> +		.label = "vout4 RCA VRD"
>> +	},
>> +};
>> +
>> +static const struct smpro_sensor curr_sensor[] = {
>> +	{
>> +		.reg = CORE_VRD_CURR,
>> +		.label = "iout1 CORE VRD"
>> +	},
>> +	{
>> +		.reg = SOC_VRD_CURR,
>> +		.label = "iout2 SoC VRD"
>> +	},
>> +	{
>> +		.reg = DIMM_VRD1_CURR,
>> +		.label = "iout3 DIMM VRD1"
>> +	},
>> +	{
>> +		.reg = DIMM_VRD2_CURR,
>> +		.label = "iout4 DIMM VRD2"
>> +	},
>> +	{
>> +		.reg = RCA_VRD_CURR,
>> +		.label = "iout5 RCA VRD"
>> +	},
>> +};
>> +
>> +static const struct smpro_sensor power[] = {
>> +	{
>> +		.reg = CORE_VRD_PWR,
>> +		.reg_ext = CORE_VRD_PWR_MW,
>> +		.label = "power1 CORE VRD"
>> +	},
>> +	{
>> +		.reg = SOC_PWR,
>> +		.reg_ext = SOC_PWR_MW,
>> +		.label = "power2 SoC"
>> +	},
>> +	{
>> +		.reg = DIMM_VRD1_PWR,
>> +		.reg_ext = DIMM_VRD1_PWR_MW,
>> +		.label = "power3 DIMM VRD1"
>> +	},
>> +	{
>> +		.reg = DIMM_VRD2_PWR,
>> +		.reg_ext = DIMM_VRD2_PWR_MW,
>> +		.label = "power4 DIMM VRD2"
>> +	},
>> +	{
>> +		.reg = RCA_VRD_PWR,
>> +		.reg_ext = RCA_VRD_PWR_MW,
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
>> +		ret = regmap_read(hwmon->regmap, hwmon->offset + temperature[channel].reg, &value);
>> +		if (ret)
>> +			return ret;
>> +		break;
>> +	case hwmon_temp_crit:
>> +		ret = regmap_read(hwmon->regmap,
>> +				  hwmon->offset + temperature[channel].reg_ext, &value);
>> +		if (ret)
>> +			return ret;
>> +		break;
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +
>> +	*val = sign_extend32(value, 8) * 1000;
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
>> +		ret = regmap_read(hwmon->regmap, hwmon->offset + voltage[channel].reg, &value);
>> +		if (ret < 0)
>> +			return ret;
>> +		/* 15-bit value in 1mV */
>> +		*val = value & 0x7fff;
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
>> +		ret = regmap_read(hwmon->regmap, hwmon->offset + curr_sensor[channel].reg, &value);
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
>> +		ret = regmap_read(hwmon->regmap, hwmon->offset + power[channel].reg, &val);
>> +		if (ret)
>> +			return ret;
>> +
>> +		ret = regmap_read(hwmon->regmap, hwmon->offset + power[channel].reg_ext, &val_mw);
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
>> +			break;
>> +		}
>> +		break;
>> +
>> +	case hwmon_in:
>> +		switch (attr) {
>> +		case hwmon_in_label:
>> +			*str = voltage[channel].label;
>> +			return 0;
>> +		default:
>> +			break;
>> +		}
>> +		break;
>> +
>> +	case hwmon_curr:
>> +		switch (attr) {
>> +		case hwmon_curr_label:
>> +			*str = curr_sensor[channel].label;
>> +			return 0;
>> +		default:
>> +			break;
>> +		}
>> +		break;
>> +
>> +	case hwmon_power:
>> +		switch (attr) {
>> +		case hwmon_power_label:
>> +			*str = power[channel].label;
>> +			return 0;
>> +		default:
>> +			break;
>> +		}
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +
>> +	return -EOPNOTSUPP;
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
>> +			ret = regmap_read(hwmon->regmap,
>> +					  hwmon->offset + temperature[channel].reg, &value);
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
>> +	.read_string = smpro_read_string,
>> +};
>> +
>> +static const struct hwmon_chip_info smpro_chip_info = {
>> +	.ops = &smpro_hwmon_ops,
>> +	.info = smpro_info,
>> +};
>> +
>> +static int smpro_hwmon_probe(struct platform_device *pdev)
>> +{
>> +	struct smpro_hwmon *hwmon;
>> +	struct device *hwmon_dev;
>> +	unsigned int val;
>> +	int ret;
>> +
>> +	hwmon = devm_kzalloc(&pdev->dev, sizeof(struct smpro_hwmon), GFP_KERNEL);
>> +	if (!hwmon)
>> +		return -ENOMEM;
>> +
>> +	hwmon->regmap = dev_get_regmap(pdev->dev.parent, NULL);
>> +	if (!hwmon->regmap)
>> +		return -ENODEV;
>> +
>> +	ret = device_property_read_u32(&pdev->dev, "reg", &hwmon->offset);
>> +	if (ret)
>> +		return -EINVAL;
>> +
>> +	/* Check for valid ID */
>> +	ret = regmap_read(hwmon->regmap, MANUFACTURER_ID_REG, &val);
>> +	if (ret)
>> +		return -EPROBE_DEFER;
> 
> This is unacceptable. regmap_read() could return various errors.
> An error here might mean that the chip is simply not there, or that
> there is some other problem with, say, the i2c controller driver.
> The function might, for all we know, even return -ENOMEM.
> 
> If this is supposed to mean that the chip is not yet ready, some other
> and more specific solution will be needed. -EPROBE_DEFER means that
> some other driver needs to be loaded first, not "chip is not ready,
> try again later".
> 
> Thanks,
> Guenter
> 

Thanks to this clarification and will return regmap_read() return value, 
ie: "return ret" in next version.

>> +
>> +	if (val != AMPERE_MANUFACTURER_ID)
>> +		return -ENODEV;
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

