Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7873C6D62
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 11:27:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GPFfD5Rnfz305k
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 19:27:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=C1RfiLdW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.223.131;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=C1RfiLdW; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2131.outbound.protection.outlook.com [40.107.223.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GPFdq5qkDz2yMG;
 Tue, 13 Jul 2021 19:27:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfYluToJT3AvN6+AZ/vdSoytkx35vowbqhaCYzdshlq8tEy8aprCSj6Z3xExje9tOdw+x7lYWeNoZwf1Ovf84U/Kp3gd9QNsJdAynOvv+dA975OpqERXLcNmeeRFGCuCWP9BlfFzmIgb8PUmL8jq/EK77jIB812ZTQx5xRLBIRSmHNVoauTLHTiwzWuhrKAL/jLJdL4CPgChASMA/oscgQQGr5gq5i1s0EmwZ68kPXpTK9XraAkPi+e9HSbddWpxslkOXTbrqVeAg9TKnj1+uoAOmjgLqAQC7Tm7UhiLVjE0pAEVUwsDyTC/Dcvkd18qEGo82Mf6RE7tVlytP7cSnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGlpFBhKMsQgVUUbUf9lcf3FZCgIjz36gI7xanRWoRw=;
 b=GWKqKcij+saQGF5eQzEOsCTdZfmE4Xp00ZPalt6KX79OlzNUNm64OHmMAlqT50JTvtOAQnBitJPkFa1eIv5OyOVwGOqlLoj5qA5eNyXH1/vsQwqbFv09RPe+JiipjFDfOJr5Yaxytmd6qG+zuTRRhswOu8WwE7PX8epn+OoVtWrrbn8v+ZLsJTRdCItPlhbXT787jQfsawRsJFtNwwRGnF1yvCz9iaNzFLrZ2jg+qJAu2J6x6DopYBDynPd66tcGwEP9dqKBHJcewAI2f6Y6Vg9Bt0dq92Vk4St0p9ANkyo0cJdENNTenz4lFB6K9LaF1hLmM1ppqkQ81r+TqpVk2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGlpFBhKMsQgVUUbUf9lcf3FZCgIjz36gI7xanRWoRw=;
 b=C1RfiLdWsx7tZuZ3FsIQy2nVRn5/Vyf42YjxjmEAqGBd4QJuKw+V43lO8BwqGHA5VLa66xV7LoT+Z2/pmZNGm4oCrHFx2PVRzXerrjAXNb2aZoHpttkuBw/pwY9rPHA5hrzTqdK8tTE9TaRozJTMirlYAg9epamDHogaQR1tYcs=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none; os.amperecomputing.com;
 dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR01MB2464.prod.exchangelabs.com (2603:10b6:300:40::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19; Tue, 13 Jul 2021 09:26:51 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 09:26:50 +0000
Subject: Re: [PATCH v5 2/4] mfd: smpro-mfd: Adds Ampere's Altra SMpro MFD
 driver
To: Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
References: <20210713060031.31568-1-quan@os.amperecomputing.com>
 <20210713060031.31568-3-quan@os.amperecomputing.com>
 <4e251a34-5c0f-da9d-e471-517c1d581fa4@roeck-us.net>
From: Quan Nguyen <quan@os.amperecomputing.com>
Message-ID: <95a7f95b-445c-359b-69b9-facfb3a3cc1a@os.amperecomputing.com>
Date: Tue, 13 Jul 2021 16:26:39 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
In-Reply-To: <4e251a34-5c0f-da9d-e471-517c1d581fa4@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HK2PR04CA0047.apcprd04.prod.outlook.com
 (2603:1096:202:14::15) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2402:800:623c:5af9:f5a9:dac2:3878:4e29]
 (2402:800:623c:5af9:f5a9:dac2:3878:4e29) by
 HK2PR04CA0047.apcprd04.prod.outlook.com (2603:1096:202:14::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.21 via Frontend Transport; Tue, 13 Jul 2021 09:26:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce71b8fc-27fe-4b7a-a382-08d945e05805
X-MS-TrafficTypeDiagnostic: MWHPR01MB2464:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR01MB2464C5EE6B6EDFD22B0B3A9EF2149@MWHPR01MB2464.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yCqXsvXt3GjQwzsk0PYikVhpyu06zTwL9sn04jSYDtR+SSyFslrb/xCRMdqDauG4vlp7XxVgFPAYVaL3X1bqUuRKPIHsCUG7gZkUQqUojxd7NB3Un5VqB5oNPUXyq+gebGofuNRTR7ByLPjRcWjF2XkQT5ngKM5pDKY5jVCZ4ifQlXRZG3sy65VirIQHT2eF0X0s2qlbG428fW+6hpa2i2JoGMptYd4RW6ccCu5uwYm2dvhCq85izKyofa6SIOCKGjpBrJxLST/hILZGdBY5cSyPw2A0Qrbl3AjQC7quRWtgTlt6woT7y3xJhp81kyZT7VXK02uyCJ6Eh9q2yg/3UZaniY77Fnrp1Ccw2YAeGDshT7kWKRuC85gdgYyYFbJd47WTz3Ztz9LD28VhamBc4zhrnSimuQ+D0Ao2V2jXX1Y0rnfxdbcAKsBAoSk4kxOeXY/42/3PeHj65wgAMM1HCELrfIlupJapr8PCmPyp5uGflzA4ZmdInZnAYE4iRPA/plpMR/MWna6SJ7eIsSC+nRXDnDZ0oSi+u8XRQ5wJZ7nqYKFMWECzvazFlpusQlsF+j4c/JcDwbBlwNRiuyz+BZVAlJJ5WCLJZSIbj/f/DybNOQHWMg+70WJ5bDQZ4dlaMq7IbjvzVNsXQk2fSK09vNINtDIrFbNG9IkaxTWEFnAQ/eP51X+FtEP0ldCX/4Cs7FPwFwYEyGBf9wXgBvbShZMXB/heW6Ruh82QW2S8JNOAxbD30s+BpYJsHPzsIu8s
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(346002)(39830400003)(136003)(8676002)(66946007)(186003)(921005)(107886003)(2906002)(110136005)(7416002)(66556008)(54906003)(6486002)(52116002)(316002)(8936002)(38100700002)(66476007)(83380400001)(4326008)(31696002)(478600001)(6666004)(31686004)(53546011)(2616005)(86362001)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXZnL2M0STVqVVJsZ0VXVGdoWGd0eno4dHRPeUlRR3NyRlBQVWJLekVKTk9H?=
 =?utf-8?B?UkxyTXFIRXFCVUNlRy9CVksyNEtVeWxnSXJDelRwRUtoK04vVzVpUzMxTDl5?=
 =?utf-8?B?TGJDSysrOEt4UW9YbWF6UlloODdkOGQyd0N0UFpYQ0dRTzZKekRKc2ZLZXJX?=
 =?utf-8?B?dktISFEvMHJDMmJvMjk1a2pwV2FyZzJSK3A3bEF6ZmdiZFA1UDVtdFp2a2t2?=
 =?utf-8?B?TEhjZ0w1cjY4WmxEYjB3alowLytKaTlPK1Y0bHhOMmY3OEcrVlZTTE1McFdY?=
 =?utf-8?B?ZmxodG93RmZkTmRCYVhUdEI4S1pnNE9MQk9pR3lRQU9ic0V6M2VUVG5LQm9L?=
 =?utf-8?B?d2tDeTdOVVVINGpDWllZOVErZk5BaTJoclRVc1FDa1crUWZ2SlE2SjFmazhx?=
 =?utf-8?B?U3lYMTMyT0lnbko5bHBiZE9neGRTeGRYcDl2Y21QdHpUVzQrOWhvVWJJT2ow?=
 =?utf-8?B?YkU1N3pGTy9WUmZhZE5KT3I0QXZDakhoSzFJVHl5dWwxUExDQUozM1prY3dj?=
 =?utf-8?B?VkJiY2dSbGJuL2VvRGlqdkhXQkMvZ1VmRFBUZ1FmNTd6d3VKS0UvY0hEQnM2?=
 =?utf-8?B?alNmRndlcGd2azVNUUU2QUZ3VjliVDdHTlM3VW12MUNSQjYvVXIzL1k3OEtG?=
 =?utf-8?B?Q3hqQklscUNLemdEYlZwbndPU1lCVG5JZFhadHA0aitqWmxid3VyU1JkbTlG?=
 =?utf-8?B?SEREVG5uTHNvUHBSZXJ1V281TUJXblVmVFhMNXBnZWdYOUhkZWhoR2pMRlUy?=
 =?utf-8?B?NUFiUWdMSTZBV0M5NDFRQ2tQYlhKU0NRNHorQytDOG5FRzQ1U2VubllJN0Va?=
 =?utf-8?B?OW81SXpaV3FkRlNMSE1uUVZmdDVDTkVyeVBaMjByN3ZwM3htc1Ixb0V2OG43?=
 =?utf-8?B?YnVsYjRDZWtpeS9qRGlCYVozMzdPaEgxMElBM1BKK0poQnpYdm9Ld0hpSlhD?=
 =?utf-8?B?WG96TUZpY0FnUExaNHZ3TktCdWdpbkplNHRBNElYSVd4NEJkcTJKak1YNmNP?=
 =?utf-8?B?c3JXNlcvdlhLOFNLNUkwREcxS3Q5RjRNRmE5eDd3Vm5zcUMrQUhsTlIzd216?=
 =?utf-8?B?OVg4N0NkcSt2bUU4dVdkZFNVNXFvZlA2TlpRSklubzJ0ckFsdFcvRS9WMU1K?=
 =?utf-8?B?WkRFcHB2VEtUeThmNWw0VkZ1cFNyYXdUbWxKbS9nRFFBSlhEWW80TDNtOHFM?=
 =?utf-8?B?NTAwSmtZYkFVVHZINVMzM1d6OHRoNG8rdU52dWtBRURyNkM1a24rek1kQmFG?=
 =?utf-8?B?VU9lOHJxVzFiWU1GOGNPcTRIcTFIZTh1WWlyRFBMdzJxWFdHNXpDcXovaGdE?=
 =?utf-8?B?dVVGUk9INVY4bEJxemJud2pmTWlDTDhFaUN5SVlPTi9VMG9FbFE5c1dtTUVR?=
 =?utf-8?B?cTFETjd4ZEFtRlZjckZZSDR2ZXkranZDM0hDTWlXc1B4dWMvbUQxRlZEUnRQ?=
 =?utf-8?B?am5nVTU2RXVYdDZpaDNSR09pLzZFV1hjRHA0TldPa0JkQXpWeEd5U3g4Uk9O?=
 =?utf-8?B?eEZzQjd1TUtpVUJYaWpISXZVbVR2RjFpeTVJb0E5MWQ2YmFiUzNMVGVnSHRs?=
 =?utf-8?B?SHhOZXpLYXJ4dGFIbmNLdXJ0RFVSK0hDVkU3cTk2R2JYbzk1K2huSWN5Q3Ir?=
 =?utf-8?B?amNIekNjNFNXNDhwQjZseUgvTTh3SE0yZUtsUFBLYmRkOUFIOUpXWnNLSTJ5?=
 =?utf-8?B?MENONTJhVXVIV2RpY1RXMnV4S0piQys3K3FJY3NGTVJkNkpSbDhVUEdNZTNy?=
 =?utf-8?B?KzIwcUs4dzZ6L3J1UzF6NzlTK3NHekZiSHQyNDd6MldQc2NHYkxHcEt3eDZG?=
 =?utf-8?B?a0R0OG1HL283Y0s4YXk2MnliUVBvdXBNU0ovbzNiL3FYV2ZjRXRhdDRRVlhu?=
 =?utf-8?Q?wYBgoSvjfSn+a?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce71b8fc-27fe-4b7a-a382-08d945e05805
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 09:26:50.4589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kRAAccS0q11ba5i6uW/lbIKMJZtvUp9OljCzW7kOC17MSncqhyGZ2CuTRKl96t4r+yj/mjCP0h9YU5LIOsKmu3Jt24Pw+U1McSNhxxvnxvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB2464
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

On 13/07/2021 16:11, Guenter Roeck wrote:
> On 7/12/21 11:00 PM, Quan Nguyen wrote:
>> Adds Multi-function devices driver for SMpro co-processor found on the
>> Mt.Jade hardware reference platform with Ampere's Altra processor family.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> 
> Maybe that has been discussed, but is there anything else besides
> hardware monitoring connected to this i2c interface, and are there
> more child drivers coming ? I don't find the BMC Interface Specification
> mentioned in the documentation patch, but the hardware specification
> seems to suggest that the i2c bus is dedicated for hardware monitoring.
> If there is no other child driver, an mfd driver would not make sense.
>Thanks for the comment.

Yes, there are more child drivers coming, one is to provide error 
monitoring and the other to provide other miscellaneous features.
The child drivers used the register map exposed by this mfd driver.

-Quan

> Thanks,
> Guenter
> 
>> ---
>> Changes in v5:
>>    + Dropped the use of simple-mfd-i2c driver [Quan]
>>    + Introduced drivers/mfd/smpro-mfd.c driver to instantiate
>>    sub-devices. This is to avoid DT nodes without resource issue [Quan]
>>    + Revised commit message [Quan]
>>
>> Changes in v4:
>>    + Add "depends on I2C" to fix build issue found by kernel test
>>    robot [Guenter]
>>
>> Changes in v3:
>>    + None
>>
>> Changes in v2:
>>    + Used 'struct of_device_id's .data attribute [Lee Jones]
>>
>>   drivers/mfd/Kconfig     | 12 +++++++
>>   drivers/mfd/Makefile    |  1 +
>>   drivers/mfd/smpro-mfd.c | 74 +++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 87 insertions(+)
>>   create mode 100644 drivers/mfd/smpro-mfd.c
>>
>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>> index 6a3fd2d75f96..25e502cca32f 100644
>> --- a/drivers/mfd/Kconfig
>> +++ b/drivers/mfd/Kconfig
>> @@ -77,6 +77,18 @@ config MFD_AS3711
>>       help
>>         Support for the AS3711 PMIC from AMS
>> +config MFD_SMPRO
>> +    tristate "Ampere Computing MFD SMpro core driver"
>> +    depends on I2C
>> +    select MFD_CORE
>> +    select REGMAP_I2C
>> +    help
>> +      Say yes here to enable SMpro driver support for Ampere's Altra
>> +      processor family.
>> +
>> +      Ampere's Altra SMpro exposes an I2C regmap interface that can
>> +      be accessed by child devices.
>> +
>>   config MFD_AS3722
>>       tristate "ams AS3722 Power Management IC"
>>       select MFD_CORE
>> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
>> index 8116c19d5fd4..046fd36de85a 100644
>> --- a/drivers/mfd/Makefile
>> +++ b/drivers/mfd/Makefile
>> @@ -268,6 +268,7 @@ obj-$(CONFIG_MFD_QCOM_PM8008)    += qcom-pm8008.o
>>   obj-$(CONFIG_SGI_MFD_IOC3)    += ioc3.o
>>   obj-$(CONFIG_MFD_SIMPLE_MFD_I2C)    += simple-mfd-i2c.o
>> +obj-$(CONFIG_MFD_SMPRO)        += smpro-mfd.o
>>   obj-$(CONFIG_MFD_INTEL_M10_BMC)   += intel-m10-bmc.o
>>   obj-$(CONFIG_MFD_ATC260X)    += atc260x-core.o
>> diff --git a/drivers/mfd/smpro-mfd.c b/drivers/mfd/smpro-mfd.c
>> new file mode 100644
>> index 000000000000..b0cd3c248507
>> --- /dev/null
>> +++ b/drivers/mfd/smpro-mfd.c
>> @@ -0,0 +1,74 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Ampere Altra Family SMPro MFD - I2C
>> + *
>> + * Copyright (c) 2021, Ampere Computing LLC
>> + *
>> + * Author: Quan Nguyen <quan@os.amperecomputing..com>
>> + */
>> +
>> +#include <linux/i2c.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/mfd/core.h>
>> +#include <linux/regmap.h>
>> +
>> +/* Identification Registers */
>> +#define MANUFACTURER_ID_REG     0x02
>> +#define AMPERE_MANUFACTURER_ID  0xCD3A
>> +
>> +static const struct regmap_config simple_word_regmap_config = {
>> +    .reg_bits = 8,
>> +    .val_bits = 16,
>> +};
>> +
>> +static const struct mfd_cell smpro_devs[] = {
>> +    MFD_CELL_NAME("smpro-hwmon"),
>> +};
>> +
>> +static int smpro_mfd_probe(struct i2c_client *i2c)
>> +{
>> +    const struct regmap_config *config;
>> +    struct regmap *regmap;
>> +    unsigned int val;
>> +    int ret;
>> +
>> +    config = device_get_match_data(&i2c->dev);
>> +    if (!config)
>> +        config = &simple_word_regmap_config;
>> +
>> +    regmap = devm_regmap_init_i2c(i2c, config);
>> +    if (IS_ERR(regmap))
>> +        return PTR_ERR(regmap);
>> +
>> +    /* Check for valid ID */
>> +    ret = regmap_read(regmap, MANUFACTURER_ID_REG, &val);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (val != AMPERE_MANUFACTURER_ID)
>> +        return -ENODEV;
>> +
>> +    return devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO,
>> +                    smpro_devs, ARRAY_SIZE(smpro_devs), NULL, 0, NULL);
>> +}
>> +
>> +static const struct of_device_id smpro_mfd_of_match[] = {
>> +    { .compatible = "ampere,smpro", .data = 
>> &simple_word_regmap_config },
>> +    {}
>> +};
>> +MODULE_DEVICE_TABLE(of, smpro_mfd_of_match);
>> +
>> +static struct i2c_driver smpro_mfd_driver = {
>> +    .probe_new = smpro_mfd_probe,
>> +    .driver = {
>> +        .name = "smpro-mfd-i2c",
>> +        .of_match_table = smpro_mfd_of_match,
>> +    },
>> +};
>> +module_i2c_driver(smpro_mfd_driver);
>> +
>> +MODULE_AUTHOR("Quan Nguyen <quan@os.amperecomputing.com>");
>> +MODULE_DESCRIPTION("SMPRO MFD - I2C driver");
>> +MODULE_LICENSE("GPL v2");
>>
> 

