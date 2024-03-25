Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDF48899EE
	for <lists+openbmc@lfdr.de>; Mon, 25 Mar 2024 11:19:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=ZrOcexrx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V387F0rVYz3cDd
	for <lists+openbmc@lfdr.de>; Mon, 25 Mar 2024 21:19:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=ZrOcexrx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:2417::700; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V386f1pKxz2yPq
	for <openbmc@lists.ozlabs.org>; Mon, 25 Mar 2024 21:19:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8u4h0cQk4AJAg9bD3bhp0pzLplAp6GJdQZKMB5fcZM3skwFDmEaY54rwu59m7cKrvQ3EAzUMvdpineYBCnU0Xm+qHLFaHKBL4Ou4R9leahVpogf4AMorEZrfa7n3R+KoUCFTNbmGXNPaHoAzu/ML35/MmQvLP9KxMUQfCpWLpJ2ItvugjUbC4OCdsbJye2kalZ+VvEUCj8C9/4qwr9sXDnfk1CNgC7st3e0M+uyM+FsJNkrg7a1aaHH/vX3uR/fuW3XI43UXKHZLs44YloMSVwh+Mr2xMjeThf8wksg31fzBhmsxylHxmYaL6ZLJyP0YVf/2jm6ECcxsH/jv41NRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJRO/w5AKnMAzTyB+Oc9aHl7C+tNjOIlKHm3brRnHWQ=;
 b=nNZPGGiG6KVRrQAkrVgdv3m/oBK/NVWlXlQg8MBD/XVi5OHVzo36zVY8kEPGyf5wBM0MvhvsLVYldSS6hnI+QjxpjpP9OkPE3ZSLp0pIwmHxktg4jkw+yUysg3SE39cWJN/dayCH4IrklT8kL+gFEf4Qwpf7j5fKjZBcwl753CjJvtadCed0dnThPEM5WtHMeKLqK8ImZ6pMMcDn2hG0nLYRE0567Djb+c73BVER6/0gnq/Jpz+Z2j7K8M5SirTAVKluxnXCSBm71XOGMmlQW2liLOMPcI+czXTQRIfJLRcK9nwjoBtDdppWSoQabbGSM35psDgGP4tAAoee6oiwIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJRO/w5AKnMAzTyB+Oc9aHl7C+tNjOIlKHm3brRnHWQ=;
 b=ZrOcexrxiY1xROrGq5GC0R8Df2kI1/dkuCp3Xu+nfyvVZpPQlXrObFhjSBMvVZ6tc971WP/6BFJx5qmUFIMHSyGZ0J2PvMQXyLnmRp3Bd1FUVhVUemmKl6KeOHw+cnf9s38Lde08hB7gRMzKJUyjyhfQf8ORgj9T/dow0fbjH0A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5947.prod.exchangelabs.com (2603:10b6:5:1dd::12) by
 SJ0PR01MB7238.prod.exchangelabs.com (2603:10b6:a03:3f7::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.31; Mon, 25 Mar 2024 10:18:41 +0000
Received: from DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::b557:13cd:8a29:ae08]) by DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::b557:13cd:8a29:ae08%4]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 10:18:40 +0000
Message-ID: <642c4474-1b14-4095-b080-e467dc0230ba@amperemail.onmicrosoft.com>
Date: Mon, 25 Mar 2024 17:18:25 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] ARM: dts: aspeed: Add
 Ampere's BMC platform (AST2600)
Content-Language: en-US
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Chanh Nguyen <chanh@os.amperecomputing.com>, u-boot@lists.denx.de,
 Albert Aribaud <albert.u.boot@aribaud.net>, Joel Stanley <joel@jms.id.au>,
 Zev Weiss <zev@bewilderbeest.net>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
 Patrick Rudolph <patrick.rudolph@9elements.com>,
 Dylan Hung <dylan_hung@aspeedtech.com>,
 Graeme Gregory <quic_ggregory@quicinc.com>,
 Eddie James <eajames@linux.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Open Source Submission <patches@amperecomputing.com>
References: <20240319072137.16695-1-chanh@os.amperecomputing.com>
 <2a55a4544f3c1c9b31ecf5232a8d8409a87a6f2a.camel@codeconstruct.com.au>
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <2a55a4544f3c1c9b31ecf5232a8d8409a87a6f2a.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN7PR06CA0056.namprd06.prod.outlook.com
 (2603:10b6:408:34::33) To DM6PR01MB5947.prod.exchangelabs.com
 (2603:10b6:5:1dd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB5947:EE_|SJ0PR01MB7238:EE_
X-MS-Office365-Filtering-Correlation-Id: e97ac55d-8755-4efc-2b9e-08dc4cb4f132
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	5fvNCpiTnFsDrc+b3uxhu+S/LnvGP7+FdN+O5kh/fHKq+OrmvoEF0iJmTdhJBaneTcg/VpJMbfrf8yd7snI2126omZmWbVIcGwcuVece2bbB1qOud8O6EmMBAcQla9SK4H96ZdPA7vK6YvWuL4Dhh4yIllWZKQ1Tl9DbNv4j9dM+iFCpP4BD7whCmPtPxgvRO0yw7L53yr1wk2YT1xHWU6BUOZdSkCDPV/fhfB8V+XaL0l4XKq+mU9ZOA2UoMQWhgmatqZp3vOKzdT2oxg0OoUukFxlG6n+XRt9kku3GdNhHLaO0BNNQZpVphrkxCvaYPR7SfbdkXu2Z/TW5fObpKaJMF0KA3+dinbMzH2VV23OLg3XI4loNMjGAiCuugyERhtQeAKjRB1VyTrXAtkWRwnitw+G53TqV2sX47xxPDX5JSqPaTsm9zTXcHd2bbUCDcDGxDEmLIOEYvWLehoGBhKqUWStHnFglvDJ/f/Ygcn0Ih2FS4IDQNzmpFl4GoZEGlV9PuxhjPLX14RfGvFQoScDDichMefE06YXaZPN/6WBu9QbU26HcOc+vrzzFqhJD7PaUDuzXFempz7XRMXBMFcpUQoLa7q3vS8fasQNAJsORayRHvWNE7gKKfpAY6A+Cao9bu1n0yNhCOOYWCPSgn0v9M9u/obgncZzgUve8gVto0A6+ZKBusGUgcRyDJ7cqgSO57D4nkBgUvKc7yqNAtw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB5947.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(366007)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?aXprZTVoR0RpYXlKM1FtdEtpWVBkM3hIUlBNcndlRTZqYVVoUUFZQ3RwVFhZ?=
 =?utf-8?B?dEtMWjhZOUdCMEdVdGp4aXZqM3RCa1BOdjVYQStDTFZJWlRSQUFneGN0T2Qz?=
 =?utf-8?B?ZDlid1ZhakRza3pyQ2E2VWxwSU84MHFPc1F3aXdsUUxneVJsNXZKVEU0aFZV?=
 =?utf-8?B?WTRSbjUxTy9aVk5BbFZGanRIMWl6WnJGTE9jemlqTm15Q2JBdGp2OTljRVYw?=
 =?utf-8?B?NTVQWHR1Q1RtN2JLVUdzRTNCVUpqTitiMkVXNVNiVUZFQ2NIanJ5V1hmdkJ3?=
 =?utf-8?B?VXZIK2Z2NjdKV0JqUUg4L203NFpJbW5nMU9JeVFaTkwzY1Q4L2tPaW91MTZ6?=
 =?utf-8?B?MGtidU9PVHBEVnJOQ0JzY21VSXk3TEVCL0ltM1pHNS9qRk9menJsTmRQR2Y5?=
 =?utf-8?B?a1NGbWtQK3hYbUx2UzBZQ3Bwd3VyaXp1V3hOOFZBMzluRkdjMllJYWJKYjFs?=
 =?utf-8?B?U0NrMzExYzBOaWwzaCs4bzJwd1VTcmtueWVwT1c3R1hveE9DaytZRVNnNlBM?=
 =?utf-8?B?aXRlS1RkQS9ESldaQ1VsUlBMUFFnMkxDbGV2L1VENkg2S2QvMmNSYWRIMTcv?=
 =?utf-8?B?dlJQOU50OTMyTWpZMVZDT29hSjY2VkJPaXc0SEdwODNnM0NYRWZkVExvQnZB?=
 =?utf-8?B?TTlHVmxHN1EzQjNNT3pZZDlpVHQrT1FvcUk1SnUwMmwyNnd0eExUQzViSVBT?=
 =?utf-8?B?cGNFaFk3T3ZpMlRJWk44RW1QbmNrM0VHMFhUcXdKTGVGUWNzdzMzRHoydjA1?=
 =?utf-8?B?NmtEdUxzRlpaN3l2MzgxTGY1RWNMU1o5M1JPcnFuUUNhalRiSGVjODUrZHpC?=
 =?utf-8?B?US9kYWxOL3BZYlRGVC8wQlFLZ0lMdkFuK0o3Ujd4Yi9ucE1KakFvQ1g2dGpx?=
 =?utf-8?B?R1BSc3g1d1loZnBCQnFFVW01WUl3TWxNVU9abVJVNnBLeFhJVWhqNzhHeW5o?=
 =?utf-8?B?b2ZIYU1vMW03TDRaV3FXMEVBRzB1cEd0Yk54L295ODI3SjNDcXYyU2I2YjhL?=
 =?utf-8?B?dkdnQzYzNG92enFzclF2R2E1SEVnVEpYRjhkNDc3dlhwSnFDenQzc0xkUSt5?=
 =?utf-8?B?eW9YemdCRk5EM1dER3p6RXREV1pUMnViYUo4ODhZeU9yMkJ5bU9oSERoTTVN?=
 =?utf-8?B?cndBMjJObzBmNGRuejZUazlESlp0VmdXd3Q0RDBveGN4Tlc3UklkdWp5RFpU?=
 =?utf-8?B?M1RLdUNDL2lUamFiZXdUV0U4TWZzVWVyR2t3MkpJMTk2cmQ1SUJEZTRJWU9r?=
 =?utf-8?B?RE9JdTV4M2RKZTlWeGdZNzJvdkw4VEVwNUR4WnRCanpmalBPL0tJeHNSa055?=
 =?utf-8?B?cnQyWVAydUF4S2k4M3FBak0rQzY1b1g1R3hRVjF4UEttVDRaRmg5eHd2MjNw?=
 =?utf-8?B?NFRXUWNYWEhrQ24vRy9sTWp0K2c1VWJDdkkvcDZFdU5aREtsWWg5YmIyK0xi?=
 =?utf-8?B?NVdQN3h5M2J4MEVwL0NaU0E5U0hxQXpDSEV3eDJvU1pwQ01wUGhXcXFObWdW?=
 =?utf-8?B?MjJic0RRYTVVZk5PV3lxQ1Nla1FoU1NNN0U2NVFUVkxtcXMvWFdBemhMV2Y2?=
 =?utf-8?B?TnkvUEhjU05wYXh4dE5nSFZrQzlTaFNIaEdrVnNlcGZ0K3p2VWN1L2RsMkpO?=
 =?utf-8?B?Mm01NW5HMU5NNWdkLzRWWm5zSjZNdldFWFU2bklhWGpsYktQT3pJS1ZlaGFp?=
 =?utf-8?B?Q3V0SDNJNGZmSHo0V2Fuc0NDWnI3aHN3RmJoZUVOTE4rUDhaQks4ZzJYN25D?=
 =?utf-8?B?RkJEeTFQY0FzMlJSR2puTllHT1FHM0lyYjFrQkQveUpia3U0V0JvbFZPNmFL?=
 =?utf-8?B?VXlTa3JVdU5HaTdoVDEzd1BmVFBYNE1aRytpazMzbndxb2FPWkRMVll5K0cv?=
 =?utf-8?B?cU43WTF2dGZhejV5a3hrSTJDa1RldDFybkFDOERETzNoaXh1eS9wcTNtY3Nr?=
 =?utf-8?B?N054bjdJdVBDQVBlTmhYTi9aZnFhcm50TmJDSm9WSStqc3hIRkIrNnB4NVo4?=
 =?utf-8?B?aFFoWDJGTVpaUGpCR3lvTmQrRUNSeHNUNGlqbm03cnBaWmZVTnNha0FCL1VP?=
 =?utf-8?B?TW9vS3ZyYnRZTFkvbjBXUDJXQitUTk9wZzRpenJtOHZUcU9lNllkdlZVdExI?=
 =?utf-8?B?NS91OWtnSDVNV2pPcGtRVHpKTE9zL1pBU3M4eW5vN1ZDSzRtWVpoS1BLbnNr?=
 =?utf-8?Q?hA9cRD9ShYDuEl0QrUwLrTs=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e97ac55d-8755-4efc-2b9e-08dc4cb4f132
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5947.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 10:18:40.8120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CWBYEdeOykND0souNYfvfM4px3D05jer9KxYYZbf6UsAfq331WX6Qj0YkBFBTKlep2LprxFH+fVS59ATJjgJ9Jp0g+9opQhcndwCwroPSW4X/Vjx4mB09/OtuxgWNYmi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB7238
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
Cc: Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 25/03/2024 12:32, Andrew Jeffery wrote:
> Hi Chanh,
> 
> On Tue, 2024-03-19 at 14:21 +0700, Chanh Nguyen wrote:
>> Add the initial version of the device tree for the Ampere BMC
>> platform, which is equipped with the Aspeed AST2600 BMC SoC.
>>
>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>> ---
>>   arch/arm/dts/Makefile           |   1 +
>>   arch/arm/dts/ast2600-ampere.dts | 113 ++++++++++++++++++++++++++++++++
>>   2 files changed, 114 insertions(+)
>>   create mode 100644 arch/arm/dts/ast2600-ampere.dts
>>
>> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
>> index 37675a3277..3642d59c89 100755
>> --- a/arch/arm/dts/Makefile
>> +++ b/arch/arm/dts/Makefile
>> @@ -691,6 +691,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>   	ast2600-greatlakes.dtb \
>>   	ast2600-intel.dtb \
>>   	ast2600-ncsi.dtb \
>> +	ast2600-ampere.dtb \
>>   	ast2600-p10bmc.dtb \
>>   	ast2600-pfr.dtb \
>>   	ast2600-qcom-dc-scm-v1.dtb \
> 
> Given this hunk and the tags in the `[PATCH]` prefix of the mail
> subject you've based this change on OpenBMC's fork of u-boot, which is
> heavily (out of date, and) inspired by Aspeed's SDK tree. I've applied
> this to OpenBMC's fork for now.
> 

Thank Andrew! I saw my patch on the OpenBMC's fork.

> However, you've sent this to the upstream list. You will need to rework
> your patch on top of mainline u-boot if you want it accepted there, and
> follow all the usual documentation on how to submit patches to the u-
> boot project (e.g. you should not be including `u-boot v2019.04-aspeed-
> openbmc` in the patch subject prefix in upstream submissions).
> 
> Andrew

Sorry all! It is my mistake. I just want to send this to OpenBMC's fork, 
but I used the upstream mail list.
