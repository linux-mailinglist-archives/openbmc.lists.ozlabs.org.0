Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FF33C7A4F
	for <lists+openbmc@lfdr.de>; Wed, 14 Jul 2021 01:46:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GPcj92q0Jz305v
	for <lists+openbmc@lfdr.de>; Wed, 14 Jul 2021 09:46:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=O3T1u/cX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.96.95;
 helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=O3T1u/cX; 
 dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2095.outbound.protection.outlook.com [40.107.96.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GPchj5vYhz2yNx;
 Wed, 14 Jul 2021 09:45:56 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2OqNF7quFK8QopLcPoJoF8ZDOydI26KH6AlkSCOVcRqrl0fBH3bvFWPAcWmDFfmZTO1H4bySb5Rib/Ysz/3wpnFAGETdYvFQYpcB6B+LLXx4ASkNNDKpF4KqjGncPILFyMT+u/4HFbbJy+DLgUrhW5DTRi1a9XKXD893Dlui3G1nO/ufvZ9jKdYLa/snHL8OtYIIK7JXAzSmnuzyvXfnuXY/X7rLsdxXRKq+XxnwAFB1BdHvyJhJbgsgJbHKFiRZeFqqqFzTHjeGf2A/YUrCwAScYVb65++6CII2et1kY1L3eOid1udqtItYQWODiqkMndSdUmAgj68acjMq97RLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqh4O+6dGoGObXhcH8jQI4U5SPZTym2plutmGTBHQJc=;
 b=MLhHSDyWTf8Qd2lvzJQCo2UA6PvE/mY3zybzAMjOMdoraBcDBj+/iK0H+SLiB/LLaRduqmiW28UG+kIDxL+k5u2wx/Rg67oaa+YYjTualmRYkUhs9Xhgj89cNOv0s7gVsJRgNJZB+UoTdhfi5wkLWO2eLFTf5lCRPZ0z0Xu4Fc+siukQ6T4icTvERzr14UoxO5RTZ+O0ddqXZujfEtO6MohO5a5km0QzwWbZ5Go395ZT8oyzZxY+VFhtWvrp//ajXCXKGHl6JeHcyQfys2ZRaFvO4u+iEjJ57zIBIzaC9yM+mc456+GlIGu+Eqf9PGX/mrVs6vCKi3cJ76d61/Vesw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqh4O+6dGoGObXhcH8jQI4U5SPZTym2plutmGTBHQJc=;
 b=O3T1u/cX534q7URmEnhTQH2w/ZVGyAC5phpVpPm/4/QUuNXeNPCjx7JzzBENn62rstXArVDnHEmlvt+LZ2EpBD3EfNSw1l5d4NwqjcedLndH7LnJ9Zfd2bPNj1X6PTOO/0vhyg5TWE8yUJX8eaRq9JuHiBfX5cdQY7XDiBmRoy0=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none; os.amperecomputing.com;
 dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR01MB3294.prod.exchangelabs.com (2603:10b6:300:fc::8) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.23; Tue, 13 Jul 2021 23:45:34 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 23:45:34 +0000
Subject: Re: [PATCH v5 3/4] hwmon: smpro: Add Ampere's Altra smpro-hwmon driver
To: Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
References: <20210713060031.31568-1-quan@os.amperecomputing.com>
 <20210713060031.31568-4-quan@os.amperecomputing.com>
 <7c16c294-ad96-8b68-df35-1201cc627d3d@roeck-us.net>
From: Quan Nguyen <quan@os.amperecomputing.com>
Message-ID: <5b11d66f-a6ff-b072-67cf-051fb6bb3f5a@os.amperecomputing.com>
Date: Wed, 14 Jul 2021 06:45:22 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
In-Reply-To: <7c16c294-ad96-8b68-df35-1201cc627d3d@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HK2PR02CA0156.apcprd02.prod.outlook.com
 (2603:1096:201:1f::16) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2402:800:623c:5af9:f5a9:dac2:3878:4e29]
 (2402:800:623c:5af9:f5a9:dac2:3878:4e29) by
 HK2PR02CA0156.apcprd02.prod.outlook.com (2603:1096:201:1f::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Tue, 13 Jul 2021 23:45:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 917dcbd9-95a4-4bce-0112-08d946584ebd
X-MS-TrafficTypeDiagnostic: MWHPR01MB3294:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR01MB329499CC6A57C29F0D29565DF2149@MWHPR01MB3294.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oWIdEGsS8d2LNMOLN6xax7zrJScRPxquwDera4qeVmr8fSkoerPmd5m0jgTgRJH+E+3haJ4p/K5TlnzgbjzDOHlkYLgIi17fSHNfiddZOIc/BkhlmZeZQCfYh+kkMFP1GsCD2EWWFli5Lb07jy+rHRr3RnEi/QyF/V/hEeMTgt/X7aGJbfBdWdmyorsBAF2dbqcGB/rYOZKUj7cYY2tMoUxQKjpENBgR0xkC7aG/FtRvuenWboLoaQqJ+hVO6kdET9KE8UpH/QBDYmXlwuyBLwPQR/LXLoRZDvSvcnRntSOmYo1R9gWkP2KYiJTD+5F1nl+/ehoeh2tim9/UirW65lXT28oLthiZjUgV8TTOMKPbFJqhF/fa1zPFlnTNQJn1OjU25/zdaVlmVtYVJpgGXfQtQPSJ8cnWKYDT+boN7GNiOQ6BtWzM2IgNfoDu2BF1H0lLd991HooIiejhem443LYq+gs+MZ1i+HvkQ6XbdYtTSY4ycQdLV9HOvomXJyp4qhS5dzQmsrWA5VW/kbaXDrsRbzHk8LSjU20ty23IVxXi/r+Yn4kQnNyBEJUX5d0QFYhdbWQ9PR6kJa243nZEPa3u+WSRUkvaKit+GrSueB2yFEFHXzzRI3sD0BIcIX8BReCytFCS5TPOqlLIWdR+EJ7w72bsUYY5B+GDlrMmzRP7l7veSO7exnXb51c/LiDNCx2VkGwJOkMkogwtm0t9zD+xENBtERmY/puKNe82APnV1a2+y0MxcsG5LzdAsa85
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39850400004)(366004)(376002)(346002)(38100700002)(52116002)(66946007)(66476007)(54906003)(6666004)(66556008)(186003)(107886003)(6486002)(7416002)(316002)(110136005)(31686004)(2616005)(5660300002)(53546011)(4326008)(8936002)(30864003)(31696002)(2906002)(83380400001)(478600001)(921005)(86362001)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXE0VUVYREZ1SjQ5RUFBcnhPbFFKSWJpVEgrTHFmZklXYUdnRUhLMmtVL0Fj?=
 =?utf-8?B?TzJDYlFrL0ErM3pLTHRyWmRCQllZVStaNmtYR2NadGdHUHJhbHFEbXVxY1FY?=
 =?utf-8?B?dzBDU2RZSFdmbCtNVkYvYzFVNXMrbG5naXJzYm1rWTFoUk9IK0FEWk9kdk1p?=
 =?utf-8?B?VnJxOVk0K2J2czJBRUljejIvSkVScjMyN0pSdmNURytyQm1HK2ltNVhWMXdX?=
 =?utf-8?B?MWt2dzBDTFkzMDZrVXhub0FVVEJXUGlKKzJEOUczUUZUbXZjc01zS3RuSlRV?=
 =?utf-8?B?K2hNV2VDTHdWTllIK3VJY1lTRys1eDVPTWlxbHBTd3FDUlRsVGJaLzBoSmFF?=
 =?utf-8?B?ZnJDL3BIdGNoYUY5dm5pL1lqSUkvN1Nway9Ib1I0VnIxTHZWLzJ5cTNtTzNU?=
 =?utf-8?B?OXpHSkt2WDhuekhCTEVCNTgzUmVZekNNaUtaWHV0UEtYcHluMnFybVl6STBJ?=
 =?utf-8?B?WkQzR3pCMnNmS1c5T2tWbi9GeG9PTndvWW9DdXZmR3VQZlZoZmZDQ01SclJ4?=
 =?utf-8?B?d1JZTkZpQW0vaGtTRDRPNGI0MzcxVlFIYVFOR2QzaE0vZGlVMG9acFRqOS9S?=
 =?utf-8?B?T20rVTFiV21WZHhlVE13YjYzRVJ1bkdlbWZEcW9DN1Rqa0FjT3FqdmM4bWtm?=
 =?utf-8?B?NEcyTzhNMXk1MW1SU0hxUnBNMGUvL2packlZZjlyaFQ2aHhEY0JyUEYrMCtx?=
 =?utf-8?B?bU1aMkNRVmVNYyt0b0E4d1ZNVGxBWFhCSzNTYkxSS21LOHo0QkdudkNueWNQ?=
 =?utf-8?B?ejRwTHJuaGcrZXNqSFJNMWxJK0hZS0dMbWljcEphNEs0cDRtRkxkVWdQa09r?=
 =?utf-8?B?WGp1NHNKckpSWHcrUTZNY2E3RDVhek5YWWpWTCsvbGhDSU91aEFyWk5KUUdi?=
 =?utf-8?B?UEk0eUVnbGpxTkhFVE9FbFU2enhMWjFxZlhlamZtc2lNNTd2bDdxMEJzVWo1?=
 =?utf-8?B?bmtKakExWmlkUEdrbUVnL2x5SWdkbU1LZExZQWhGcHk5ckVDR0kvd0plYUdu?=
 =?utf-8?B?d0lGd1ZYc0hMSzBUOWtuMk5Vd09GZDh5am1qdkg5WDBHV3Z0YkV2QjdaampN?=
 =?utf-8?B?MGcrY2kxOXFJSUpGSU9taGh1NlZ5enNCRDVNMlczNVFBODRVUHMxbDI0dUJC?=
 =?utf-8?B?V3kvM2duMHpBckMwdU42RVJKR0VBQ0Y5OThDdTUwY2wwMWw2WDJMT3dyc2J5?=
 =?utf-8?B?SGMyRDBDaWFIc2pVT1BBdmY4L0RkV2pMSFJEOXFtYStJNjhQTVdRakkwTjZQ?=
 =?utf-8?B?bXpYY3Q2TUVyVUxNV0YxQjhDU3JNY3o2OVFyNEQxdElBd1lMeTJLRHNxQ2pT?=
 =?utf-8?B?L0M4WVpPV2pLT3lVNWRUVkxVY0l2MlE4T24xN29PTzBSNE1aT1l3Z2gyanF1?=
 =?utf-8?B?ZC9HUHd5SXBnWDE5N2lqSTVSK0dmWlgxOWNlUkNqVTJJZUJaOTZUOUFRMTF0?=
 =?utf-8?B?WUZDQldjTHg4SFRpaCtTbzU3alJsVFpSUjdHV1Yzbk5mcDlhRllMbW5rNmxh?=
 =?utf-8?B?RkZ1VDJrNE9OQ3E2NzM4RDM0VnRQQ2djYU5aK1A4N2xVanI2ZFBKRjlSVG5k?=
 =?utf-8?B?TnJUNmxia2hBWkd5SVpBVUovbVdwNmRhSERMUWsxa3NEbGFJc1NsTzRURUlU?=
 =?utf-8?B?OUFxK2pXdDMwODdWU2FVRlAxS2dUQnF2VitNVWx0WWR2U3VzczNvb2JrSU5w?=
 =?utf-8?B?WjJRNnFMUTQ4TkhLUmVybG56LytyM0I4Z0xHMkdabW9BQ3hhN0pkSnNJK0t4?=
 =?utf-8?B?Y3VwTmhJejFuODFuTXlxS1lLcW5vQmJ4LzJkS3dVNFlzYUZRVnEwMzlCNTcw?=
 =?utf-8?B?T0l4SnhvamV2cXkxWmwwWjVqbjM3bmMvMVNPZzVReDYweGlhTnJKMElPNEFv?=
 =?utf-8?Q?HBvfoe1sHGa9N?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 917dcbd9-95a4-4bce-0112-08d946584ebd
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 23:45:34.5749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xXXCcQVGq4c5YHSsG17pLcU8UHX66uqJETU8/S4wCPk6D2yvNGuqCvHmnw32Kzx1mhBe5rdhhT9TDyHnuSrlvttiJrXtzPPjwdM6Za0Spu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB3294
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

On 13/07/2021 22:28, Guenter Roeck wrote:
> On 7/12/21 11:00 PM, Quan Nguyen wrote:
>> This commit adds support for Ampere SMpro hwmon driver. This driver
>> supports accessing various CPU sensors provided by the SMpro co-processor
>> including temperature, power, voltages, and current.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> 
> For my reference:
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
Thanks for the review.
- Quan

>> ---
>> Changes in v5:
>>    + Drop ManufacturerID checking when probe as it was checked during
>>    smpro-mfd probing [Quan]
>>    + Drop the use of register offset [Quan]
>>    + Removed the use of compatible string as it is instantiated by
>>    smpro-mfd driver [Quan]
>>    + Thanks Guenter for the Reviewed-by in last version, but it was
>>    not added because there's some changes in this version. Really
>>    appreciate if you could help again, thank you.
>>
>> Changes in v4:
>>    + Returned regmap_read() error code [Guenter]
>>
>> Changes in v3:
>>    + Handled negative temperature value [Guenter]
>>    + Returned -ENODEV if Manufacturer ID is wrong [Guenter]
>>    + Refactored smpro_read_string() and smpro_temp_read() [Guenter]
>>    + Removed smpro_write() function [Guenter]
>>    + Added minor refactor changes [Quan]
>>
>> Changes in v2:
>>    + Removed "virtual" sensors [Guenter]
>>    + Reported SOC_TDP as "Socket TDP" using max attributes [Guenter]
>>    + Corrected return error code when host is turn off [Guenter]
>>    + Reported MEM HOT Threshold for all DIMMs as temp*_crit [Guenter]
>>    + Removed license info as SPDX-License-Identifier existed [Guenter]
>>    + Added is_visible() support [Guenter]
>>    + Used HWMON_CHANNEL_INFO() macro and LABEL attributes [Guenter]
>>    + Made is_valid_id() return boolean [Guenter]
>>    + Returned -EPROBE_DEFER when smpro reg inaccessible [Guenter]
>>    + Removed unnecessary error message when dev register fail [Guenter]
>>    + Removed Socket TDP sensor [Quan]
>>    + Included sensor type and channel in labels [Quan]
>>    + Refactorized code to fix checkpatch.pl --strict complaint [Quan]
>>
>>   drivers/hwmon/Kconfig       |   8 +
>>   drivers/hwmon/Makefile      |   1 +
>>   drivers/hwmon/smpro-hwmon.c | 463 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 472 insertions(+)
>>   create mode 100644 drivers/hwmon/smpro-hwmon.c
>>
>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>> index e3675377bc5d..903c5ef79a5a 100644
>> --- a/drivers/hwmon/Kconfig
>> +++ b/drivers/hwmon/Kconfig
>> @@ -67,6 +67,14 @@ config SENSORS_ABITUGURU3
>>         This driver can also be built as a module. If so, the module
>>         will be called abituguru3.
>> +config SENSORS_SMPRO
>> +    tristate "Ampere's Altra SMpro hardware monitoring driver"
>> +    depends on MFD_SMPRO
>> +    help
>> +      If you say yes here you get support for the thermal, voltage,
>> +      current and power sensors of Ampere's Altra processor family SoC
>> +      with SMpro co-processor.
>> +
>>   config SENSORS_AD7314
>>       tristate "Analog Devices AD7314 and compatibles"
>>       depends on SPI
>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>> index d712c61c1f5e..9de5cd9911b0 100644
>> --- a/drivers/hwmon/Makefile
>> +++ b/drivers/hwmon/Makefile
>> @@ -175,6 +175,7 @@ obj-$(CONFIG_SENSORS_SHT4x)    += sht4x.o
>>   obj-$(CONFIG_SENSORS_SHTC1)    += shtc1.o
>>   obj-$(CONFIG_SENSORS_SIS5595)    += sis5595.o
>>   obj-$(CONFIG_SENSORS_SMM665)    += smm665.o
>> +obj-$(CONFIG_SENSORS_SMPRO)    += smpro-hwmon.o
>>   obj-$(CONFIG_SENSORS_SMSC47B397)+= smsc47b397.o
>>   obj-$(CONFIG_SENSORS_SMSC47M1)    += smsc47m1.o
>>   obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
>> diff --git a/drivers/hwmon/smpro-hwmon.c b/drivers/hwmon/smpro-hwmon.c
>> new file mode 100644
>> index 000000000000..b01ceea33ddd
>> --- /dev/null
>> +++ b/drivers/hwmon/smpro-hwmon.c
>> @@ -0,0 +1,463 @@
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
>> +/* Logical Power Sensor Registers */
>> +#define SOC_TEMP        0x10
>> +#define SOC_VRD_TEMP        0x11
>> +#define DIMM_VRD_TEMP        0x12
>> +#define CORE_VRD_TEMP        0x13
>> +#define CH0_DIMM_TEMP        0x14
>> +#define CH1_DIMM_TEMP        0x15
>> +#define CH2_DIMM_TEMP        0x16
>> +#define CH3_DIMM_TEMP        0x17
>> +#define CH4_DIMM_TEMP        0x18
>> +#define CH5_DIMM_TEMP        0x19
>> +#define CH6_DIMM_TEMP        0x1A
>> +#define CH7_DIMM_TEMP        0x1B
>> +#define RCA_VRD_TEMP        0x1C
>> +
>> +#define CORE_VRD_PWR        0x20
>> +#define SOC_PWR            0x21
>> +#define DIMM_VRD1_PWR        0x22
>> +#define DIMM_VRD2_PWR        0x23
>> +#define CORE_VRD_PWR_MW        0x26
>> +#define SOC_PWR_MW        0x27
>> +#define DIMM_VRD1_PWR_MW    0x28
>> +#define DIMM_VRD2_PWR_MW    0x29
>> +#define RCA_VRD_PWR        0x2A
>> +#define RCA_VRD_PWR_MW        0x2B
>> +
>> +#define MEM_HOT_THRESHOLD    0x32
>> +#define SOC_VR_HOT_THRESHOLD    0x33
>> +#define CORE_VRD_VOLT        0x34
>> +#define SOC_VRD_VOLT        0x35
>> +#define DIMM_VRD1_VOLT        0x36
>> +#define DIMM_VRD2_VOLT        0x37
>> +#define RCA_VRD_VOLT        0x38
>> +
>> +#define CORE_VRD_CURR        0x39
>> +#define SOC_VRD_CURR        0x3A
>> +#define DIMM_VRD1_CURR        0x3B
>> +#define DIMM_VRD2_CURR        0x3C
>> +#define RCA_VRD_CURR        0x3D
>> +
>> +struct smpro_hwmon {
>> +    struct regmap *regmap;
>> +};
>> +
>> +struct smpro_sensor {
>> +    const u8 reg;
>> +    const u8 reg_ext;
>> +    const char *label;
>> +};
>> +
>> +static const struct smpro_sensor temperature[] = {
>> +    {
>> +        .reg = SOC_TEMP,
>> +        .label = "temp1 SoC"
>> +    },
>> +    {
>> +        .reg = SOC_VRD_TEMP,
>> +        .reg_ext = SOC_VR_HOT_THRESHOLD,
>> +        .label = "temp2 SoC VRD"
>> +    },
>> +    {
>> +        .reg = DIMM_VRD_TEMP,
>> +        .label = "temp3 DIMM VRD"
>> +    },
>> +    {
>> +        .reg = CORE_VRD_TEMP,
>> +        .label = "temp4 CORE VRD"
>> +    },
>> +    {
>> +        .reg = CH0_DIMM_TEMP,
>> +        .reg_ext = MEM_HOT_THRESHOLD,
>> +        .label = "temp5 CH0 DIMM"
>> +    },
>> +    {
>> +        .reg = CH1_DIMM_TEMP,
>> +        .reg_ext = MEM_HOT_THRESHOLD,
>> +        .label = "temp6 CH1 DIMM"
>> +    },
>> +    {
>> +        .reg = CH2_DIMM_TEMP,
>> +        .reg_ext = MEM_HOT_THRESHOLD,
>> +        .label = "temp7 CH2 DIMM"
>> +    },
>> +    {
>> +        .reg = CH3_DIMM_TEMP,
>> +        .reg_ext = MEM_HOT_THRESHOLD,
>> +        .label = "temp8 CH3 DIMM"
>> +    },
>> +    {
>> +        .reg = CH4_DIMM_TEMP,
>> +        .reg_ext = MEM_HOT_THRESHOLD,
>> +        .label = "temp9 CH4 DIMM"
>> +    },
>> +    {
>> +        .reg = CH5_DIMM_TEMP,
>> +        .reg_ext = MEM_HOT_THRESHOLD,
>> +        .label = "temp10 CH5 DIMM"
>> +    },
>> +    {
>> +        .reg = CH6_DIMM_TEMP,
>> +        .reg_ext = MEM_HOT_THRESHOLD,
>> +        .label = "temp11 CH6 DIMM"
>> +    },
>> +    {
>> +        .reg = CH7_DIMM_TEMP,
>> +        .reg_ext = MEM_HOT_THRESHOLD,
>> +        .label = "temp12 CH7 DIMM"
>> +    },
>> +    {
>> +        .reg = RCA_VRD_TEMP,
>> +        .label = "temp13 RCA VRD"
>> +    },
>> +};
>> +
>> +static const struct smpro_sensor voltage[] = {
>> +    {
>> +        .reg = CORE_VRD_VOLT,
>> +        .label = "vout0 CORE VRD"
>> +    },
>> +    {
>> +        .reg = SOC_VRD_VOLT,
>> +        .label = "vout1 SoC VRD"
>> +    },
>> +    {
>> +        .reg = DIMM_VRD1_VOLT,
>> +        .label = "vout2 DIMM VRD1"
>> +    },
>> +    {
>> +        .reg = DIMM_VRD2_VOLT,
>> +        .label = "vout3 DIMM VRD2"
>> +    },
>> +    {
>> +        .reg = RCA_VRD_VOLT,
>> +        .label = "vout4 RCA VRD"
>> +    },
>> +};
>> +
>> +static const struct smpro_sensor curr_sensor[] = {
>> +    {
>> +        .reg = CORE_VRD_CURR,
>> +        .label = "iout1 CORE VRD"
>> +    },
>> +    {
>> +        .reg = SOC_VRD_CURR,
>> +        .label = "iout2 SoC VRD"
>> +    },
>> +    {
>> +        .reg = DIMM_VRD1_CURR,
>> +        .label = "iout3 DIMM VRD1"
>> +    },
>> +    {
>> +        .reg = DIMM_VRD2_CURR,
>> +        .label = "iout4 DIMM VRD2"
>> +    },
>> +    {
>> +        .reg = RCA_VRD_CURR,
>> +        .label = "iout5 RCA VRD"
>> +    },
>> +};
>> +
>> +static const struct smpro_sensor power[] = {
>> +    {
>> +        .reg = CORE_VRD_PWR,
>> +        .reg_ext = CORE_VRD_PWR_MW,
>> +        .label = "power1 CORE VRD"
>> +    },
>> +    {
>> +        .reg = SOC_PWR,
>> +        .reg_ext = SOC_PWR_MW,
>> +        .label = "power2 SoC"
>> +    },
>> +    {
>> +        .reg = DIMM_VRD1_PWR,
>> +        .reg_ext = DIMM_VRD1_PWR_MW,
>> +        .label = "power3 DIMM VRD1"
>> +    },
>> +    {
>> +        .reg = DIMM_VRD2_PWR,
>> +        .reg_ext = DIMM_VRD2_PWR_MW,
>> +        .label = "power4 DIMM VRD2"
>> +    },
>> +    {
>> +        .reg = RCA_VRD_PWR,
>> +        .reg_ext = RCA_VRD_PWR_MW,
>> +        .label = "power5 RCA VRD"
>> +    },
>> +};
>> +
>> +static int smpro_read_temp(struct device *dev, u32 attr, int channel, 
>> long *val)
>> +{
>> +    struct smpro_hwmon *hwmon = dev_get_drvdata(dev);
>> +    unsigned int value;
>> +    int ret;
>> +
>> +    switch (attr) {
>> +    case hwmon_temp_input:
>> +        ret = regmap_read(hwmon->regmap, temperature[channel].reg, 
>> &value);
>> +        if (ret)
>> +            return ret;
>> +        break;
>> +    case hwmon_temp_crit:
>> +        ret = regmap_read(hwmon->regmap, 
>> temperature[channel].reg_ext, &value);
>> +        if (ret)
>> +            return ret;
>> +        break;
>> +    default:
>> +        return -EOPNOTSUPP;
>> +    }
>> +
>> +    *val = sign_extend32(value, 8) * 1000;
>> +    return 0;
>> +}
>> +
>> +static int smpro_read_in(struct device *dev, u32 attr, int channel, 
>> long *val)
>> +{
>> +    struct smpro_hwmon *hwmon = dev_get_drvdata(dev);
>> +    unsigned int value;
>> +    int ret;
>> +
>> +    switch (attr) {
>> +    case hwmon_in_input:
>> +        ret = regmap_read(hwmon->regmap, voltage[channel].reg, &value);
>> +        if (ret < 0)
>> +            return ret;
>> +        /* 15-bit value in 1mV */
>> +        *val = value & 0x7fff;
>> +        return 0;
>> +    default:
>> +        return -EOPNOTSUPP;
>> +    }
>> +}
>> +
>> +static int smpro_read_curr(struct device *dev, u32 attr, int channel, 
>> long *val)
>> +{
>> +    struct smpro_hwmon *hwmon = dev_get_drvdata(dev);
>> +    unsigned int value;
>> +    int ret;
>> +
>> +    switch (attr) {
>> +    case hwmon_curr_input:
>> +        ret = regmap_read(hwmon->regmap, curr_sensor[channel].reg, 
>> &value);
>> +        if (ret < 0)
>> +            return ret;
>> +        /* Scale reported by the hardware is 1mA */
>> +        *val = value & 0x7fff;
>> +        return 0;
>> +    default:
>> +        return -EOPNOTSUPP;
>> +    }
>> +}
>> +
>> +static int smpro_read_power(struct device *dev, u32 attr, int 
>> channel, long *val_pwr)
>> +{
>> +    struct smpro_hwmon *hwmon = dev_get_drvdata(dev);
>> +    unsigned int val = 0, val_mw = 0;
>> +    int ret;
>> +
>> +    switch (attr) {
>> +    case hwmon_power_input:
>> +        ret = regmap_read(hwmon->regmap, power[channel].reg, &val);
>> +        if (ret)
>> +            return ret;
>> +
>> +        ret = regmap_read(hwmon->regmap, power[channel].reg_ext, 
>> &val_mw);
>> +        if (ret)
>> +            return ret;
>> +
>> +        *val_pwr = val * 1000000 + val_mw * 1000;
>> +        return 0;
>> +
>> +    default:
>> +        return -EOPNOTSUPP;
>> +    }
>> +}
>> +
>> +static int smpro_read(struct device *dev, enum hwmon_sensor_types type,
>> +              u32 attr, int channel, long *val)
>> +{
>> +    switch (type) {
>> +    case hwmon_temp:
>> +        return smpro_read_temp(dev, attr, channel, val);
>> +    case hwmon_in:
>> +        return smpro_read_in(dev, attr, channel, val);
>> +    case hwmon_power:
>> +        return smpro_read_power(dev, attr, channel, val);
>> +    case hwmon_curr:
>> +        return smpro_read_curr(dev, attr, channel, val);
>> +    default:
>> +        return -EOPNOTSUPP;
>> +    }
>> +}
>> +
>> +static int smpro_read_string(struct device *dev, enum 
>> hwmon_sensor_types type,
>> +                 u32 attr, int channel, const char **str)
>> +{
>> +    switch (type) {
>> +    case hwmon_temp:
>> +        switch (attr) {
>> +        case hwmon_temp_label:
>> +            *str = temperature[channel].label;
>> +            return 0;
>> +        default:
>> +            break;
>> +        }
>> +        break;
>> +
>> +    case hwmon_in:
>> +        switch (attr) {
>> +        case hwmon_in_label:
>> +            *str = voltage[channel].label;
>> +            return 0;
>> +        default:
>> +            break;
>> +        }
>> +        break;
>> +
>> +    case hwmon_curr:
>> +        switch (attr) {
>> +        case hwmon_curr_label:
>> +            *str = curr_sensor[channel].label;
>> +            return 0;
>> +        default:
>> +            break;
>> +        }
>> +        break;
>> +
>> +    case hwmon_power:
>> +        switch (attr) {
>> +        case hwmon_power_label:
>> +            *str = power[channel].label;
>> +            return 0;
>> +        default:
>> +            break;
>> +        }
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +
>> +    return -EOPNOTSUPP;
>> +}
>> +
>> +static umode_t smpro_is_visible(const void *data, enum 
>> hwmon_sensor_types type,
>> +                u32 attr, int channel)
>> +{
>> +    const struct smpro_hwmon *hwmon = data;
>> +    unsigned int value;
>> +    int ret;
>> +
>> +    switch (type) {
>> +    case hwmon_temp:
>> +        switch (attr) {
>> +        case hwmon_temp_input:
>> +        case hwmon_temp_label:
>> +        case hwmon_temp_crit:
>> +            ret = regmap_read(hwmon->regmap, 
>> temperature[channel].reg, &value);
>> +            if (ret || value == 0xFFFF)
>> +                return 0;
>> +        break;
>> +        }
>> +    default:
>> +        break;
>> +    }
>> +
>> +    return 0444;
>> +}
>> +
>> +static const struct hwmon_channel_info *smpro_info[] = {
>> +    HWMON_CHANNEL_INFO(temp,
>> +               HWMON_T_INPUT | HWMON_T_LABEL,
>> +               HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
>> +               HWMON_T_INPUT | HWMON_T_LABEL,
>> +               HWMON_T_INPUT | HWMON_T_LABEL,
>> +               HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
>> +               HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
>> +               HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
>> +               HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
>> +               HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
>> +               HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
>> +               HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
>> +               HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
>> +               HWMON_T_INPUT | HWMON_T_LABEL),
>> +    HWMON_CHANNEL_INFO(in,
>> +               HWMON_I_INPUT | HWMON_I_LABEL,
>> +               HWMON_I_INPUT | HWMON_I_LABEL,
>> +               HWMON_I_INPUT | HWMON_I_LABEL,
>> +               HWMON_I_INPUT | HWMON_I_LABEL,
>> +               HWMON_I_INPUT | HWMON_I_LABEL),
>> +    HWMON_CHANNEL_INFO(power,
>> +               HWMON_P_INPUT | HWMON_P_LABEL,
>> +               HWMON_P_INPUT | HWMON_P_LABEL,
>> +               HWMON_P_INPUT | HWMON_P_LABEL,
>> +               HWMON_P_INPUT | HWMON_P_LABEL,
>> +               HWMON_P_INPUT | HWMON_P_LABEL),
>> +    HWMON_CHANNEL_INFO(curr,
>> +               HWMON_C_INPUT | HWMON_C_LABEL,
>> +               HWMON_C_INPUT | HWMON_C_LABEL,
>> +               HWMON_C_INPUT | HWMON_C_LABEL,
>> +               HWMON_C_INPUT | HWMON_C_LABEL,
>> +               HWMON_C_INPUT | HWMON_C_LABEL),
>> +    NULL
>> +};
>> +
>> +static const struct hwmon_ops smpro_hwmon_ops = {
>> +    .is_visible = smpro_is_visible,
>> +    .read = smpro_read,
>> +    .read_string = smpro_read_string,
>> +};
>> +
>> +static const struct hwmon_chip_info smpro_chip_info = {
>> +    .ops = &smpro_hwmon_ops,
>> +    .info = smpro_info,
>> +};
>> +
>> +static int smpro_hwmon_probe(struct platform_device *pdev)
>> +{
>> +    struct smpro_hwmon *hwmon;
>> +    struct device *hwmon_dev;
>> +
>> +    hwmon = devm_kzalloc(&pdev->dev, sizeof(struct smpro_hwmon), 
>> GFP_KERNEL);
>> +    if (!hwmon)
>> +        return -ENOMEM;
>> +
>> +    hwmon->regmap = dev_get_regmap(pdev->dev.parent, NULL);
>> +    if (!hwmon->regmap)
>> +        return -ENODEV;
>> +
>> +    hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev, 
>> "smpro_hwmon",
>> +                             hwmon, &smpro_chip_info, NULL);
>> +
>> +    return PTR_ERR_OR_ZERO(hwmon_dev);
>> +}
>> +
>> +static struct platform_driver smpro_hwmon_driver = {
>> +    .probe        = smpro_hwmon_probe,
>> +    .driver = {
>> +        .name    = "smpro-hwmon",
>> +    },
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

