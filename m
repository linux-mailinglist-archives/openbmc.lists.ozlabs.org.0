Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E3B5F61F2
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 09:47:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mjk6Z36rrz30hw
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 18:47:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=uDq6+oLH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.223.138; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=uDq6+oLH;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2138.outbound.protection.outlook.com [40.107.223.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjk4s3z0kz3c4S
	for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2022 18:45:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0DQQKoThXlg+oIXneiicKnurShDpLXUwhVQDwhUxgu/IkBqDo0RFiuhUH6vJjJhrRn1DUlKsrkZtt15zvzBO76yIFvDhWhgKRMqS7TIuPkoiQa7pUT8AfPjrjub/7oyFGPozXfGVcLlLHQljXBXbx8H3eukkWAPHAw8IKY2XYvab6G75qR/PTV+8Qv2AOQDHd6+b7RUnR1ghv4Hcvg9IjCUGH9X06wM7R3w2pIvpLa/QMq1tWnaCj7GdvoM563IRrW6/0PWXx62d8xx16THJo06kPJ+EV5xefJllz90M77M0/vAVTJReW0C3kyoaHeUIRSKTLhEMeex0ORE239v1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HwNsFZOXci+Es9ZOLxhf1boDNIUHF1TUhyUPTZaT7T0=;
 b=LzhrbdY+moBdtHynTCtlTC+S29QtdFgM04wBlNcY5SERaDviq6C5r2lmHtP2wfRTwTt5si+qPe/w4h5NUF0H7naCBBXpIafrBoytMvB/pEkBDd8VOSRImGVx/HxwgTof0ZORww332c+vGs/I4ND2b/hg2/1RTbcDlB47ce8X+dfRWWm0n+M+g5VN4L0dn25vqZgcozB9HdsMB3gZ8GTjluXwylRoTaplbSo/itky4AHDCo0ONFOvXR1bNAAfyViZaGxWkwQA2soEI/0UibpYFaKYFqxGWGEfWrlvQssV05Zlf5iTLt5NsiJ5CcVwr2Br1Z1yr/t08iPbpDlM59tUsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HwNsFZOXci+Es9ZOLxhf1boDNIUHF1TUhyUPTZaT7T0=;
 b=uDq6+oLH5Sie0VStcvGJQsdRD9uCZO0W5NhBbH2ymEy/rVYy+hIPB0yjrmQTjUSNRNUJcvsGsAwuWJxiIX3l+uMZYeERIadJEMPlCQ2ULIS9MqaFu2q6U/Qk80arB12BuN3GIE8e0GR6p0P2KVuJdjVTj06KUZWkgfSFOL6nBpg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 DM8PR01MB7190.prod.exchangelabs.com (2603:10b6:8:9::23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.20; Thu, 6 Oct 2022 07:45:16 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5676.032; Thu, 6 Oct 2022
 07:45:15 +0000
Message-ID: <dfeba303-9fdc-00b9-2ec6-6433041173b9@os.amperecomputing.com>
Date: Thu, 6 Oct 2022 14:45:03 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH v9 5/9] misc: smpro-misc: Add Ampere's Altra SMpro misc
 driver
Content-Language: en-CA
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220929094321.770125-1-quan@os.amperecomputing.com>
 <20220929094321.770125-6-quan@os.amperecomputing.com>
 <YzVrpT6BD6qmu5ZG@kroah.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <YzVrpT6BD6qmu5ZG@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::11) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|DM8PR01MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bba1fd7-2ba9-468b-faf3-08daa76eb525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	lfgVGuZ3FFcbUnLrgCQ95Y5boVVncN/Ljvg07U3cS3BnB41kE/AB+QuhDrhUczWZxeUbJLNQFj8vGrKPuAZwUmCG4jK2rXLoizLi2hmUV0mG4t6rK8IShCF+FlwERiD57/KI1GqX1Vi0FAeWLIq7emsvrjDifQ5eHBvlMXtlLqjzrGcLvrKJjZpAiGRaeLKksmChmcJYJlhPAtsPoLM4cs7rUsYGPsEhLU6ctR/qPhoGV2rX5NTJWc/xme7dII7g3iw5unEHplLn+3MKNeQoW5FLqx7LJMXLUuogqs7TQE4/PnEO0iRXXgRRv6UzbgX+4VzdaI4qEXQ43NZzSTvxtfXUPs7Kt0DLMqhf4ayBbZ4CVOsh4/NgzFZulD0TxN4Q3nwEekom/jTZdRTxNKN6HeOvAAcaiQJBZaqrjkbWf3R8QDIKPOrL5yMvls53ObToVPc8Zeo3zvTmgLyQy+Bdj8MWfQNx5S7bBJiBcEcPbzBhICQYzc91Jzga0D2LzhNQh6wOJKF5V9gMOzAHtofoHRU/nIcWO8vJX7V3pluiklfy7u91x5ntLEyNkydVFs9EeTME80o1Mk3UiBXnjEThveyumqQDggUBGWd32WogZZEqa5JWHJYyHcK/5XsieSBxRFZlWEWtqa8+yYP4bUQpA2j/C6T+phd9gWzj07bQ5ahSwoFCsuUt9upvRUKg3JBxIhvitWFq0NqHWI9AVmclII5MypoZpAKNJrTkPBJN8I2wpnVRji5dOnnJ9AYfb2YahKGU1cGZzP0MRfmCEPci7imyuqTQ6SYsV+wskK/j5pA=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(366004)(346002)(39850400004)(451199015)(52116002)(53546011)(107886003)(478600001)(6512007)(6506007)(6666004)(26005)(83380400001)(186003)(2616005)(2906002)(7416002)(8936002)(54906003)(316002)(6916009)(6486002)(4326008)(8676002)(5660300002)(66476007)(66556008)(66946007)(41300700001)(86362001)(31696002)(38100700002)(38350700002)(31686004)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?SjAydXlNeDZEK0tQeklWZ0JPWU50bHN2WGpLdTMxRW92b2FrdlFNMWlia3NJ?=
 =?utf-8?B?dXVnV21EVmU2K3ZmU1FNZ2MyOTdYNGxhQUtKMERETDdiQTBoQ3d3U1VWYjBV?=
 =?utf-8?B?ZWMyTldpTnF4bXZYUlJXeGwvNmtsU21ISWNzNC9lWmdpYzlFTE1EWjlNUEQz?=
 =?utf-8?B?eXByejlBUEZ5elFrcitwaXRiZC80SmgvSlpVbDlBU2NuZFpLOVU4Qnc1WnN1?=
 =?utf-8?B?WEZjQWQ2Y21qZHF3SXJzYTgyemJaTEMwOGUwenkyRTFWVGdsREZjck1lbzRU?=
 =?utf-8?B?UVBsa3RGMjRFRTdzbTRqME92R2d6RmRnVW5KbmJFc3ZkRWFxOFAzRmlqZ29V?=
 =?utf-8?B?bDRKQ3A0N1VqZVJQbEpMOHBtT0djVmxJaVJzelBKeTh4V1Bsbm1mTjR3MkJS?=
 =?utf-8?B?L1NIWWJ3cnZVOWs5cXR2MnNLS0kxK21qRHo3UDBEWkZ0MVRjekd5ZXQwMzF0?=
 =?utf-8?B?MnhPV1pwZlRVaHFZUXlVQWRJRWZZMHk1QmVxQ0MxRjJnWkRIaVRTUC9yOEFk?=
 =?utf-8?B?bmJFNFl5cnVCSVlvbkgzQXY4QjBZR1dJN1JDbVYyZFF6MkFHbTlJRHFINi92?=
 =?utf-8?B?dnVnZVJab3ZKUkcvRzU3SWhzQzFIbGwyMU1UeklNQ21BUFkrelNmOWdocXht?=
 =?utf-8?B?WXoxaUtFTzA3UDI0V3NCVjM4N2RtNnA4a0NWTk8ydDhmSFFXUXhPVE1PTWxa?=
 =?utf-8?B?aENHL1VpWisyMWMxbHlmYWluL1QzZk9FTzhQcERsdVBVK2lWb1oyU0NpY0Zw?=
 =?utf-8?B?UmxCbVBubE9iY1RwRm5zNmNWSWRRYjY2d29qUFUwdE9UdlNZeldDSE5xWGZr?=
 =?utf-8?B?OTBsb2VhT2N4ZkthaFpDUnNtRWdVUHBzV3p2STN2SWpwdWxaQVNJSWVYSXVu?=
 =?utf-8?B?a1g1R1UvSUZtR2srSFFTWmpIcWlOb0h4c0tFNmQ1MWpvMU0yUzZ4VFdNRnY1?=
 =?utf-8?B?KzU3eDdDeWVtRml0YXo2VFMwQWx1NnB2WEs5WFVLNkZYamF4Y0REUXRlYjNa?=
 =?utf-8?B?UWhhRnN2cUFDN0Vwb0lhZkx2QkQ2dExwL2RJQ0F1MERIZ0lsU002WCt1VlNr?=
 =?utf-8?B?NFVLeDJqWXkzd2xZK1JqSkMrbGhsQ2dwMXFiNWNDbkFzVGY3dnVZaWNkSHFE?=
 =?utf-8?B?eVpzOVI1OEN0TmozREZKRVFtbXBYNUNPV1F2bFBUOWxOcDNNWUk2N3lubzND?=
 =?utf-8?B?TzZrL1JWQlZnaGl2clMyeGphNjlHbFcvU2RhcGtRNWp6WWhZOWJCNnd4amUw?=
 =?utf-8?B?eFhwVVExSUFQREI4SE8yeFIvVm5Ia25PYUhrd2dPalNFb1VxK1U4di9Gc1Jr?=
 =?utf-8?B?SGw4enlDRFBpRDRvNmNJbG94UWhLUGxSd1VPb1FMSkRhWC91NFRBMDBwa1Vn?=
 =?utf-8?B?bkhxbTdiTDhKSU9WM05YNnRQcWVjd1R5V1M1ZThVU0JUNTBIeUdnZjlWaDQ0?=
 =?utf-8?B?T0wzNm5RaHV0TU5ha3VPY0NmUGZhVmhPdHR1ZlNiU0ZOdk5YN0RWZlRKRXFV?=
 =?utf-8?B?TE1MdXNLaVI4UkNvSDYxNmMxTHhhWlFTRnVaakdZSTE1aHpGMVhKTmRCYXJ0?=
 =?utf-8?B?MU5Nb2IvTkZ4ZVVaQ3h0a1hXNTJlMmkxbXpBYkFwTGpJZWQ4QjI5Vm03WFN2?=
 =?utf-8?B?NnF2TGN0OS9aTUdGQnhBTDhaM0FkZVcvd2pDeHI2UHlSamZQdWtkQjdDOWYw?=
 =?utf-8?B?TWkrenFhellnZ1RoUFpaNjd3YlBSVDN1bktxUXdhOU8zRXJVdVNWc2JVL3hD?=
 =?utf-8?B?cGZWcUlReENpZ0l3em85R05saWdJejVPelExVlVvYmNGQ0l1Y0VSZjFPT0tJ?=
 =?utf-8?B?ak9NVFVLb2dNZFVqU0pUamNTNE5kZWFLQXVTS0pWaDdQakM5QjV1YzM0MHNU?=
 =?utf-8?B?Wk9DRXE0K0liQ0Y4M3RiNER0VURpUzhIWTQ4VGFmWGM3STJOcENOM29kSHN0?=
 =?utf-8?B?dnJObW5sZ1JYNEgycFBSQzFKZExyTHFkUnFxMlN2RVhEbnFobmFMZ3p6eWtO?=
 =?utf-8?B?THBXSE5kazRHU3k5OHRoQ3J5bStYSVd2S0oxcjNZUCtFcVRVNWtpSG1wWTJh?=
 =?utf-8?B?alpFeW1CQUVKd2xHWklZZUJTYzd5Y2pIa0Z3YWQ4NGZ3VElCTjRQVnlQeXIw?=
 =?utf-8?B?bnBHYk1PS29ZQkgzQWd3UFRnbHNZYTJmY3RheTJCaUlKQjk1ODE5bHh0cWw0?=
 =?utf-8?Q?8cfguZRHL1uuVc3oRC3oX7Y=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bba1fd7-2ba9-468b-faf3-08daa76eb525
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 07:45:15.7658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CR4WeNyf8nLq1XSs+g54z3G49isKmWow0AQcgzgtPdM5U+IPENgssofOLoq0Y991e1ElCG0SaIaoQfQH9hcHEhMduH8MpVqzdimFT6uHnpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR01MB7190
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Dragan Cvetic <dragan.cvetic@xilinx.com>, Lee Jones <lee@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, thang@os.amperecomputing.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Derek Kiernan <derek.kiernan@xilinx.com>, Open Source Submission <patches@amperecomputing.com>, Thu Nguyen <thu@os.amperecomputing.com>, Guenter Roeck <linux@roeck-us.net>, macro@orcam.me.uk
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 29/09/2022 16:55, Greg Kroah-Hartman wrote:
> On Thu, Sep 29, 2022 at 04:43:17PM +0700, Quan Nguyen wrote:
>> This commit adds driver support for accessing various information
>> reported by Ampere's SMpro co-processor such as Boot Progress and
>> other miscellaneous data.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>> Changes in v9:
>>    + Update SPDX licence                                     [Greg]
>>    + Use ATTRIBUTE_GROUPS()                                  [Greg]
>>    + Use dev_groups instead of sysfs_create_group() to avoid
>>    racing issue with user space                              [Greg]
>>    + Refactor code to avoid clever encoding issue            [Quan]
>>
>> Changes in v8:
>>    + Update wording for SMPRO_MISC in Kconfig file           [Quan]
>>    + Switch to use sysfs_emit()                              [Quan]
>>
>> Changes in v7:
>>    + Fix wrong return type of *_show/store()
>>    functions                                    [kernel robot test]
>>    + Adjust patch order to remove dependence with
>>    smpro-mfd                                            [Lee Jones]
>>
>> Changes in v6:
>>    + First introduced in v6 [Quan]
>>
>>   drivers/misc/Kconfig      |  10 +++
>>   drivers/misc/Makefile     |   1 +
>>   drivers/misc/smpro-misc.c | 145 ++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 156 insertions(+)
>>   create mode 100644 drivers/misc/smpro-misc.c
>>
>> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
>> index b9ceee949dab..9947b7892bd5 100644
>> --- a/drivers/misc/Kconfig
>> +++ b/drivers/misc/Kconfig
>> @@ -188,6 +188,16 @@ config SMPRO_ERRMON
>>   	  To compile this driver as a module, say M here. The driver will be
>>   	  called smpro-errmon.
>>   
>> +config SMPRO_MISC
>> +	tristate "Ampere Computing SMPro miscellaneous driver"
>> +	depends on MFD_SMPRO || COMPILE_TEST
>> +	help
>> +	  Say Y here to get support for the SMpro error miscellalenous function
>> +	  provided by Ampere Computing's Altra and Altra Max SoCs.
>> +
>> +	  To compile this driver as a module, say M here. The driver will be
>> +	  called smpro-misc.
>> +
>>   config CS5535_MFGPT
>>   	tristate "CS5535/CS5536 Geode Multi-Function General Purpose Timer (MFGPT) support"
>>   	depends on MFD_CS5535
>> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
>> index bbe24d4511a3..87b54a4a4422 100644
>> --- a/drivers/misc/Makefile
>> +++ b/drivers/misc/Makefile
>> @@ -24,6 +24,7 @@ obj-$(CONFIG_KGDB_TESTS)	+= kgdbts.o
>>   obj-$(CONFIG_SGI_XP)		+= sgi-xp/
>>   obj-$(CONFIG_SGI_GRU)		+= sgi-gru/
>>   obj-$(CONFIG_SMPRO_ERRMON)	+= smpro-errmon.o
>> +obj-$(CONFIG_SMPRO_MISC)	+= smpro-misc.o
>>   obj-$(CONFIG_CS5535_MFGPT)	+= cs5535-mfgpt.o
>>   obj-$(CONFIG_GEHC_ACHC)		+= gehc-achc.o
>>   obj-$(CONFIG_HP_ILO)		+= hpilo.o
>> diff --git a/drivers/misc/smpro-misc.c b/drivers/misc/smpro-misc.c
>> new file mode 100644
>> index 000000000000..6c427141e51b
>> --- /dev/null
>> +++ b/drivers/misc/smpro-misc.c
>> @@ -0,0 +1,145 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Ampere Computing SoC's SMpro Misc Driver
>> + *
>> + * Copyright (c) 2022, Ampere Computing LLC
>> + */
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +
>> +/* Boot Stage/Progress Registers */
>> +#define BOOTSTAGE	0xB0
>> +#define BOOTSTAGE_LO	0xB1
>> +#define CUR_BOOTSTAGE	0xB2
>> +#define BOOTSTAGE_HI	0xB3
>> +
>> +/* SOC State Registers */
>> +#define SOC_POWER_LIMIT		0xE5
>> +
>> +struct smpro_misc {
>> +	struct regmap *regmap;
>> +};
>> +
>> +static ssize_t boot_progress_show(struct device *dev, struct device_attribute *da, char *buf)
>> +{
>> +	struct smpro_misc *misc = dev_get_drvdata(dev);
>> +	u16 boot_progress[3] = { 0 };
>> +	u32 bootstage;
>> +	u8 boot_stage;
>> +	u8 cur_stage;
>> +	u32 reg_lo;
>> +	u32 reg;
>> +	int ret;
>> +
>> +	/* Read current boot stage */
>> +	ret = regmap_read(misc->regmap, CUR_BOOTSTAGE, &reg);
>> +	if (ret)
>> +		return ret;
>> +
>> +	cur_stage = reg & 0xff;
>> +
>> +	ret = regmap_read(misc->regmap, BOOTSTAGE, &bootstage);
>> +	if (ret)
>> +		return ret;
>> +
>> +	boot_stage = (bootstage >> 8) & 0xff;
>> +
>> +	if (boot_stage > cur_stage)
>> +		return -EINVAL;
>> +
>> +	ret = regmap_read(misc->regmap,	BOOTSTAGE_LO, &reg_lo);
>> +	if (!ret)
>> +		ret = regmap_read(misc->regmap, BOOTSTAGE_HI, &reg);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Firmware to report new boot stage next time */
>> +	if (boot_stage < cur_stage) {
>> +		ret = regmap_write(misc->regmap, BOOTSTAGE, ((bootstage & 0xff00) | 0x1));
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	boot_progress[0] = bootstage;
>> +	boot_progress[1] = swab16(reg);
>> +	boot_progress[2] = swab16(reg_lo);
>> +
>> +	return sysfs_emit(buf, "%*phN\n", (int)sizeof(boot_progress), boot_progress);
>> +}
> 
> Again, please put the Documentation/ABI/ entries in this commit so that
> we can verify they are all correct.  Putting them at the end of the
> series makes it pretty impossible to review.  Would you want to have to
> match them all up the way you sent them?
> 
Will do in next version.

Thanks,
- Quan
