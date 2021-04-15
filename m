Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9ABA3600E1
	for <lists+openbmc@lfdr.de>; Thu, 15 Apr 2021 06:17:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLQzT3ZQ7z3bTN
	for <lists+openbmc@lfdr.de>; Thu, 15 Apr 2021 14:17:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=BXElYUSu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.70.122;
 helo=nam04-sn1-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=BXElYUSu; 
 dkim-atps=neutral
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700122.outbound.protection.outlook.com [40.107.70.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLQzB0GNdz2xZW;
 Thu, 15 Apr 2021 14:17:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrL4BQoac9GG120jh6eKuScffxXAkS9mSqapTOWhZCsaiRzND5TYkKqdPh8PSc+XKZVLYt21JQy72pkD2CvfG1UL6F/wkcXsxoOpucSdPXikpZMibWYEd64aKZSVJKKdL2lUV1O0/v4BDZ7Z4qsSNkAz3070HNgXdkLVeaj86maBBVIgbYFTsoKgmky+BKnzOi7CPc+UgQlnxBIbSx2Eq6bUraeIsIy8pwWLs1tzWvFGN/+Rb8mrVscesKbr+qCaMtI9xfZk6Xz+xnnFcQuTVIxbrluyOrzhDo1Oqqv/YspLIZ5++IS5qoq4nhEZMY0EQST7QAMGionQ9uyDH1uGEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/MrkLEkMYHeBEXLcefreZph85vgCVVMWhg5Ff1I3SI=;
 b=hi6qhTjoy1xL4dfNBKYKKhq8OLvhglZ/rdDK9me5aypkubfyj77MPfjNyGyJlyhKvUbR7wKsJ4xZ19austnAHDD56imD5fBAZ3ELNr/jfqlvSBFYODnpAwwUZDdfhllGSFnvrstRNgHQkMHx6o0Pg5Xpai06Wz/aj2/kS6BKxERHNWxDrU0PNHi/SRfyGF3byJaMtYjwDM64xh08RMqM2StcOcbP2vAO2dOT6JB9rRUNTOrJ6vCjdlsvfiqIg/KvkngEkR0yDBRr9D3geGqL2/oF/WzlhPtT5HVoAKjzksG2HfxhEz7iSzyugUT5kK+JEg6be5j2SMFo3I+Eps38gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/MrkLEkMYHeBEXLcefreZph85vgCVVMWhg5Ff1I3SI=;
 b=BXElYUSuxBKQrsCYLid4BxpF91hZpelc8ByFYykTMf2ozSCdaqDrypV2Lh0pFJgWU0WBDO6ovF4Om0mTKq71TSKmRU2yCT2n56N6v4R8rU9F8+6Iyaf6bLlV4VDqSTDYMlTIWoLIR3wiX9evptczXrM8E6LeT4CexTWWoG50mZ0=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none; os.amperecomputing.com;
 dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 CO1PR01MB6582.prod.exchangelabs.com (2603:10b6:303:f2::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16; Thu, 15 Apr 2021 04:17:03 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4042.018; Thu, 15 Apr 2021
 04:17:03 +0000
Subject: Re: [PATCH v3 2/4] mfd: simple-mfd-i2c: Adds Ampere's Altra SMpro
 support
To: Guenter Roeck <linux@roeck-us.net>
References: <20210409031332.21919-1-quan@os.amperecomputing.com>
 <20210409031332.21919-3-quan@os.amperecomputing.com>
 <20210414122130.GA113503@roeck-us.net>
From: Quan Nguyen <quan@os.amperecomputing.com>
Message-ID: <94a8cf49-2de2-ead5-8134-d18a90a6ad57@os.amperecomputing.com>
Date: Thu, 15 Apr 2021 11:15:48 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
In-Reply-To: <20210414122130.GA113503@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: SG2PR01CA0124.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::28) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.32.245] (118.69.219.201) by
 SG2PR01CA0124.apcprd01.prod.exchangelabs.com (2603:1096:4:40::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Thu, 15 Apr 2021 04:16:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a3571b2-3acd-41ea-730a-08d8ffc55280
X-MS-TrafficTypeDiagnostic: CO1PR01MB6582:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR01MB65827F1C11A227AD444E1AA2F24D9@CO1PR01MB6582.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b4kvNUyTlGohnZV6uLjsdNQkwf8hpSszj76+aTuzIoC0fo3+LANRJ69EVH7DKe828a+NkwKe5kjx2ghM1ApL0pJgPHDb1ec2pL0b0Pm3IiolhaGYUZADSybk0qhXyDffk2fZe/dT/8L/3NqPWT3eLbVwfdNMimdjjtbuRjeAw/FQ8XPF05BEDhW6/l44gU2X/dIc9DUbUQYrpBRDlBkoB6FymAh9skFkTcGoOez/wIcGl0AvE2OKdtiLgqZOAoVEhoj/ouK1oWOaf61CLM3m6dslkVE+ajaNArCwWSnrLeXko/yDteDclTy+zwXlx3nf1jPfnkjz3VyYcg/6pC3vRg0wnaCX5sN8w9T9Mu/7UJ1ql5ppNOg0/v010C2XOvjRS5cFGRa1XxXi2wffCjXDnnYGOvpiMHs1qAroB9CvIrDqNWMRlmB7HRpPC8+VfgyjnxKNkM35Vt5K2bxijaEEMbBV9qSpTevHnZG6g4SOTL296JmDTKll86eSJVMAcvhg/r5HY2XqpISv9jjMYS+owLSAEhhy0QU5WuBLuONwoPVVnfcXnOfhWd1X9DOyM5HKpe+BdxDd8Ev9mV7rPa3auo/Rr37xEmJGkexGeyJnITUUwqzEInjCJHpjzMBHfgAluUml1dRnNN6C70E6Ry3bpAsynmJRN4iI583j7TAruhKzy06b9ItNRHc4ulpN33ox
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39850400004)(136003)(376002)(396003)(54906003)(2906002)(83380400001)(4326008)(53546011)(6666004)(8936002)(8676002)(31686004)(38100700002)(38350700002)(107886003)(316002)(16576012)(6916009)(31696002)(26005)(66946007)(16526019)(186003)(66556008)(478600001)(52116002)(66476007)(7416002)(2616005)(5660300002)(6486002)(86362001)(956004)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?enpDejNJZFd0NUFSQnVpMUxWeTRwblptZWtFQURqYzJpZVNub2lmTGQrNXh0?=
 =?utf-8?B?NXJzZXllZnowMDZUc29IUTYrWVZFQ2NtVE4ydG9oSDdWcy9lN3pEUC9aMzU0?=
 =?utf-8?B?Z3RxRkVQVENkc0lWRVhpaEdhQy95MjI5MGY1VTJKNHV6YThwZ1dDeTFScHVl?=
 =?utf-8?B?ODBqdXVLS0RWMzVGSjcxNG9BMVp4OGJ1K2VHWmhheEVRZWIvTEtPR3gwS3hP?=
 =?utf-8?B?WldaNCtTVWs1SnFTZndqTTlXK0VhS3RNaFpGcytyUnExZWpXaUplWWsvUWxh?=
 =?utf-8?B?RXdlNHdpa1o4S0R2eEJ1Um5rbVdZV3dBSlBuOE9IRG5xc2xKTXFLTXZtVG5k?=
 =?utf-8?B?Ykk2WC9Vc0NIMCtiTzQ0WE91dWxwWXJ4dEpxMkY1T2Q1b0RFUGtVOUk4cWhJ?=
 =?utf-8?B?VlFrcEtTMVJTSXQ5V0NyNVcwZ0JtL1hpcU5pRVJSYkN4K3JqeGFtNHpTQlRW?=
 =?utf-8?B?UkFYYlNZbTdzTFF5aXpsc2NRYzE0SjdWRE1yT0hvRHN4M25XWHFVQUpxTDdz?=
 =?utf-8?B?S3JPOGc0UFBBTEwxSWhvU2tBckxUY1Yzdk5RRklqZzVrdVBkSTBDd2tzYXl3?=
 =?utf-8?B?MHE2cHlQQ09vdU5IZC9TUU1xdnYyL3lscXZqS0J1UTlqaFd4dFE1OVNUdTR0?=
 =?utf-8?B?Mlc0MVJHUXdtTlZjQ3A0azVETGVqSDlwNEhkZGlJVVI4TUZFUHBwT0hlZW1q?=
 =?utf-8?B?VXQxWSsweGtKS09BSEZQVEpXMXMyWEVBTzM5MnRBZUFHVFZ6RWY0Y2ZwUmhL?=
 =?utf-8?B?QjhZcStvOU9xcnJLbXo0aEZNU25lNlNlUHp6eWJycWZhTDZZRXcxUG5nRUM1?=
 =?utf-8?B?SGVEM21EUzZiQWlva29BL2Znb09kOVVTbEVxeC9Zeml6eGxtdHhmK1NCSzd1?=
 =?utf-8?B?TnJNWWIwTXBNOHNhQ3dHTEJ2RVFVd0I4SXZ5TVNxTWNVYlVDTERlRm1kYlJk?=
 =?utf-8?B?a1JWMjhIWXJaRjV2d294dFQ0cU16U29VRDh5VVptb2ZlMFhKK3JaTlN2VHd3?=
 =?utf-8?B?b3llMkI4OWdvMW1GMlZ1S2dPNUhWMisyYkUyVDcrR3pJNFpidGFYTFZ2eFBu?=
 =?utf-8?B?Mk1HNHMzSE1aSlZlNFBWNlVoYzBQWmw2T2ZZejc2a1ZDVGQ0UVNWaWlPY1Ju?=
 =?utf-8?B?WlduaE1ZUGN0cE5rcHNtZlkwbzFJbU5BMDQvOEN6SU0rMENTam1ZVER3c2g2?=
 =?utf-8?B?MlI1TDgrc1JkVTN5RDBxSytDMHBXYjBmL0d5ckpkM3ozdnlWK2dUTjRLcC9K?=
 =?utf-8?B?aXA1REYxaURoSENMbnpPaW0yWmJSUW93dDM0SjQwSnEzU3dlbGVvdXpzWlZl?=
 =?utf-8?B?OFhOOHdCNHBJNmk0dGU3L2JpZ3BPWUVZNHZKWEc2WGtEZWNlUGRMOVFqZysw?=
 =?utf-8?B?cFhocEhsbFhybE53enZFVXY1NXNpOFUwNnowT3J6WHoyUWpCYzhFa3hUMDNI?=
 =?utf-8?B?SDR5L1lVV1BpQnJPb3pJZ3RGNnIzemhrbFA2S1g3dFNmeEhWSVhody85N2Jw?=
 =?utf-8?B?QzlVNXlQV3A0TTRtQlZCNC9Ld2JBTDJwZ25NaFRqZjhudFQzajJ6cVB0SXpq?=
 =?utf-8?B?cFNEdDVWRGV6M0lrZnVON3R3bitOSGVjbGRoNEY1VVBMY3RsUG9RL2FrZnVN?=
 =?utf-8?B?dkVwSmo1RnVzMElUN29TaEVUYWh0ZzQ1eTB3bHlIK094bko3amtDaUszaTZP?=
 =?utf-8?B?VHQ2YVdrTHVqbUpxaU9iVEUwR2hoR3k1NzIxSVZiMWJoM3dTNUplK2RRN09p?=
 =?utf-8?Q?R4kZqGsLxp8TgObM5DTyMzOPtLp846fXN6ox1bO?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a3571b2-3acd-41ea-730a-08d8ffc55280
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 04:17:03.4303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SEQkOtVwjPH4kyzo1URo54MbBeanfqAWdMpj1yx8FQnhUrMcYQt4R+g7z/crAtVxywVNf0A665qsoXhwSJxvjLEoUzyhZa4IeykZOA329SM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB6582
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

On 14/04/2021 19:21, Guenter Roeck wrote:
> On Fri, Apr 09, 2021 at 10:13:30AM +0700, Quan Nguyen wrote:
>> Adds an MFD driver for SMpro found on the Mt.Jade hardware reference
>> platform with Ampere's Altra processor family.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> Reported-by: kernel test robot <lkp@intel.com>
>> ---
>>   drivers/mfd/Kconfig          | 10 ++++++++++
>>   drivers/mfd/simple-mfd-i2c.c |  6 ++++++
>>   2 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>> index d07e8cf93286..f7a6460f7aa0 100644
>> --- a/drivers/mfd/Kconfig
>> +++ b/drivers/mfd/Kconfig
>> @@ -77,6 +77,16 @@ config MFD_AS3711
>>   	help
>>   	  Support for the AS3711 PMIC from AMS
>>   
>> +config MFD_SMPRO
>> +	tristate "Ampere Computing MFD SMpro core driver"
>> +	select MFD_SIMPLE_MFD_I2C
> 
> This is missing "depends on I2C".
> 
Thanks Guenter to help pointing this out.
This fixes the issue reported by kernel test robot. Will include this in 
next version.

>> +	help
>> +	  Say yes here to enable SMpro driver support for Ampere's Altra
>> +	  processor family.
>> +
>> +	  Ampere's Altra SMpro exposes an I2C regmap interface that can
>> +	  be accessed by child devices.
>> +
>>   config MFD_AS3722
>>   	tristate "ams AS3722 Power Management IC"
>>   	select MFD_CORE
>> diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
>> index 87f684cff9a1..9a44655f5592 100644
>> --- a/drivers/mfd/simple-mfd-i2c.c
>> +++ b/drivers/mfd/simple-mfd-i2c.c
>> @@ -21,6 +21,11 @@ static const struct regmap_config simple_regmap_config = {
>>   	.val_bits = 8,
>>   };
>>   
>> +static const struct regmap_config simple_word_regmap_config = {
>> +	.reg_bits = 8,
>> +	.val_bits = 16,
>> +};
>> +
>>   static int simple_mfd_i2c_probe(struct i2c_client *i2c)
>>   {
>>   	const struct regmap_config *config;
>> @@ -39,6 +44,7 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
>>   
>>   static const struct of_device_id simple_mfd_i2c_of_match[] = {
>>   	{ .compatible = "kontron,sl28cpld" },
>> +	{ .compatible = "ampere,smpro", .data = &simple_word_regmap_config },
>>   	{}
>>   };
>>   MODULE_DEVICE_TABLE(of, simple_mfd_i2c_of_match);

