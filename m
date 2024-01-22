Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1478359A1
	for <lists+openbmc@lfdr.de>; Mon, 22 Jan 2024 04:09:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=njCmqqNp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TJFYj1G2Wz3bqW
	for <lists+openbmc@lfdr.de>; Mon, 22 Jan 2024 14:09:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=njCmqqNp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e88::72f; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2072f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::72f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TJFY73gMTz2xcs
	for <openbmc@lists.ozlabs.org>; Mon, 22 Jan 2024 14:08:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dweKZZvSCrExmJW7sQo34qiudiEKosIMFm2qN8FpYVyZU01rRPe+YM76dfeq+sqzuHLSHn/uc56aEIUhXNn+EgPxZ5fwuYkELknOY5uVc15h0aS/MQWBuAkqNYppD/qkD1o7/jknjdGLjxYT8wMjx8Jg1uzO0nFDYIDImXccOsWps1PsaJWEBd0gISDf1RHWRExFKtzRqAgKIgDuYWZhZGr2+mRz0FksqqT2xJ94m0p3mi5jbXSYXdJ30G0kaJYfvqV1wKyGrfnsEIYrNBjXpM+i6e+pXpIDZ2I9t6yl7HfuXT8VYn2QSPIUeANtzFkFIR/jchL0zrAN3fxg6J7ejQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FeoYIniOy2jummAv2xcdVyj7aeqXU2P15p5zQ1C0Bh0=;
 b=YjjGWAcj1FqdJOe2BAS3H5HlhEbQ+ROE9d8WEO9HfTZapNpLXI+F0gf5PxJJnBRnkkBsxPFcEj/T4ZW3LlqexbJeiV+7SMdy6TVCNQ/Y2LJZ/xGRw9TvNcgVqBb+ONq6J5AxyguzlFch0zvyvC48x1wtrhVEwR2Mw6N3PnLzqY+/9WFkxFcr+FJSG5oY3/XuKu+iwnqqPP0Vtu5cqES6sze2eLPMeGOUx0s9sgOt/8ErPvc7axxaYXmy/iMgcvmYufh3YTDOUI9ALwkyw3/qcbShWnERF1aissa4EVMBraoh1pfY3+peJCTAo+9xPoypS8FcewVQvYWtWSj/zoqsng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FeoYIniOy2jummAv2xcdVyj7aeqXU2P15p5zQ1C0Bh0=;
 b=njCmqqNpCA4inl/9rWCGEklu/uxQ7j6cFnzSzyitjYa4P/+K0WwtWqLUh94W9wk5nHZ1rqOmpBs96q/pHvAHkk1BnO494wN7dBTYQvMhDKByQA/SRpJiabAmZso8ks/Qztk63Jp6vI0E2eaXId9cteNB0PvtMB4AtkgUegZ/fEs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from CO1PR01MB7355.prod.exchangelabs.com (2603:10b6:303:15a::21) by
 BL3PR01MB6820.prod.exchangelabs.com (2603:10b6:208:33f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.34; Mon, 22 Jan 2024 03:08:13 +0000
Received: from CO1PR01MB7355.prod.exchangelabs.com
 ([fe80::2613:1ce:18f1:2a85]) by CO1PR01MB7355.prod.exchangelabs.com
 ([fe80::2613:1ce:18f1:2a85%6]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 03:08:13 +0000
Message-ID: <604bf528-e23a-4ea2-8280-9a6da7e8964a@amperemail.onmicrosoft.com>
Date: Mon, 22 Jan 2024 10:08:04 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] ARM: dts: aspeed: Add
 Ampere's BMC platform (AST2600)
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
To: Chanh Nguyen <chanh@os.amperecomputing.com>, u-boot@lists.denx.de,
 Albert Aribaud <albert.u.boot@aribaud.net>, Joel Stanley <joel@jms.id.au>,
 Zev Weiss <zev@bewilderbeest.net>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
 Patrick Rudolph <patrick.rudolph@9elements.com>,
 Dylan Hung <dylan_hung@aspeedtech.com>,
 Graeme Gregory <quic_ggregory@quicinc.com>,
 Eddie James <eajames@linux.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <20231210042508.16187-1-chanh@os.amperecomputing.com>
 <24160a1f-bb5c-440a-82a0-75bc2199b3a8@amperemail.onmicrosoft.com>
Content-Language: en-US
In-Reply-To: <24160a1f-bb5c-440a-82a0-75bc2199b3a8@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0012.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::8) To CO1PR01MB7355.prod.exchangelabs.com
 (2603:10b6:303:15a::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR01MB7355:EE_|BL3PR01MB6820:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ee3bfcb-3ce0-4c3d-670e-08dc1af75ea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	foBPPH93M81dcfb6dZhE9T0pXG/euQ4Nr24UnJzIB52q5R58Z+YG6CgFwTKLmMheaQCk1e7Os5oTHH2ww/vvjzINOweqTvXGZJ9IVnwKO1Teq3SBItGCVkLxD+H0swdqCW4eGeFdckAM3V3Oux75dyOMWPyAW2zfuI7aamJitqOpHaYJn+2+BUP0LhkLoPCAg007IiNMnXbdAaOQucUCgB3IbX27xya2Zu7YI+jgMimDLv+dLTGJowJNW4B4ogm28saGkWeyLCwOqyaJX+DW2pi+1DvLjjdGxfuZnjLdlEA/konoCU8ReVJSsPon4GP2qY2HZETgD1B8AHu2aY8K0xgtQyE5YmqbtVhGf+EmciRXgTZsYCbWAhZC9QGOJBz8mA3wRSTIDp7+PCpYzVFsRVZ/ak+q2/LUMoNmYthU1I0niumgeeDVmSrvTplQI12+E5FaW5Q52Ogb34oAQaqJaBubSw90q00c1PqZ/K581Nu9POrJniUNk7b3OkDrL5s3E4E/JvjBB5ALcc/9Vh79Pe6wzk6Ggli8jGyCLFRcPPR+LTgriMDa0h/q4fAtBuRdcFmgcQcQk35zalmUXBuHXzRqxq6PxAGN3XjoVH97EtowKidTU4c7h5tBR+095FtN2C7c2pA4cd0WuKflPXWElQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR01MB7355.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(39840400004)(396003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(31686004)(6512007)(6506007)(6666004)(107886003)(26005)(53546011)(2616005)(42882007)(38100700002)(31696002)(83170400001)(8936002)(41300700001)(8676002)(4326008)(6486002)(2906002)(83380400001)(5660300002)(7416002)(921011)(316002)(478600001)(66476007)(66556008)(110136005)(54906003)(66946007)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?UkhyNXU5cGVac1lpK0ZQaGtoRTI1M29RWXdqN0s1YzB3NmRLZGc4V1VmNmJ0?=
 =?utf-8?B?ZHlpUVJ5Q3JUS3I2TG9yaEE1TG1jMElyNUVybm1yWkFxdDlIWUNuN0FWY1Q3?=
 =?utf-8?B?aHRvZTJRT0Eyblo4NjlnSVFHNnlETk1mUEFOUElzVHlWaUpkaDRXekJyOW1Y?=
 =?utf-8?B?OFVwSHBBTlZnVTVMQk9LelBKN3Z3dWdNeklNMVY0OWNmRXVCakhvdUNaeTBu?=
 =?utf-8?B?Z1Y3NHcrS0NoUmw1Z2NjVTdZL0xkZ1cyY2ZZN1RYU0E2d2V4MkFIRXJUbXhY?=
 =?utf-8?B?eEVFZUEweDFtZEsvWEx3enhyZTMzS0dwNDJDeUc4dlFVUEl1bVhmOHoyTWVu?=
 =?utf-8?B?SnZyMHpPd1N3Sm9QYlFWSWU4djRMYStmMExzeDJGdWFWekorWUIyZGxjWFd0?=
 =?utf-8?B?OUg4UWkreHBGQmpEdVg3bExxMmRvRmNUSWRlYkFUU2F1OWxxOElDdDh0K1Ir?=
 =?utf-8?B?MWNKcTlZVnhiYk9yc3U4eEVyTVhSS3RrdkxHdVIzM2hING9zeVovc2p4RjZr?=
 =?utf-8?B?NTVMRjZxbXZVMFVxdnp6L2k4VVBrVWh3ekxLYmRNc2MwWGRRZWdqWTU0ZUZz?=
 =?utf-8?B?ZUZBRmdVMXJSK0NoWVJFckFuYnVBeUl2cFJVTERNdnp0TWQrekZYQUNTbEVM?=
 =?utf-8?B?OEVDTnhpeGVlV1MwNTlCcUhweUU4LzRCZFF1ZGFSQnQ3WE4xdDVMTGlONEty?=
 =?utf-8?B?ZDR1ZDhWbzlySW9yNzZwdGdYR2JFYy9FYlhQN3B0Sy9qS3JwSzlHZnlqZE1Y?=
 =?utf-8?B?dnNsSklDVklFNmxnTkk5eThmRHJvNGlERDdkZW82bHJEL0NzTzlwMzc5QkJX?=
 =?utf-8?B?SHJLR3MxMDVIeUFzL0hnNDRjU1F0NHdRZFRoWUdIaVJsWmlxbTRQVnZ6SHRs?=
 =?utf-8?B?Q25uTnlZSFZYRmZNNy9WbVNMTnBCR0dZK1pWRlBvKzZzZW9oNUtXZ0xFcTM5?=
 =?utf-8?B?WlA3M2Rtc3gvYnBhQjFHbDlMZ2xZRFNFaW9WNm85eGNpS1VEakZVenIxTDE0?=
 =?utf-8?B?WG5IVlRmb2gyNGY5dWNxL2RGQytOR0E5YVZhUFBIc3ZHUEo4YjFDQUM4MDlE?=
 =?utf-8?B?dDM5aUtVVWI1TmdCUk44TG5CdXJpaGttb1hzcnRTYVBEUHFVK3NoNkpUM2pk?=
 =?utf-8?B?ajNFdkhhOFFWMXJuUFVwUFY5U2V0dFVObFhnQlJISFhBN01VcWFhbWFWZXdp?=
 =?utf-8?B?ZmhTVFlkZGtDVytqZEdFUjZzZ3RHM3E5SkxoWXRJaG9GSkF0ZEt2K1Nja2lX?=
 =?utf-8?B?eGlGL0lRd0FVVkdlSWRTTm9zQ1ZLQjc5a2V2UjZvNEhaNlVzNEo1UTZFdk9o?=
 =?utf-8?B?UFpQYmlDTFhURHpjTkllRFVMdEpDaXNPUFlpNFBZemJ3eTRPb2JzMkpnNDY5?=
 =?utf-8?B?K0thanhaOTNmUlFtb21XRlNoOG5ZTU9COWhyMlVJbmw1VG15YXIwY0I4Y0Rv?=
 =?utf-8?B?dHRvUkg1Myt2WnpJRENhSGFjYUxXc01pNWhIK0NNQnErVmdYQy9qZW5NZVZG?=
 =?utf-8?B?dWNzaGdWQ1RhWkVBbmI4QXR0MW9HbEVBNFRESFcyQkIzTW1FNVlPbjZjYnNN?=
 =?utf-8?B?K2IwQ2xaTUJHOVJ0SWg4MnFGeXBvWU15Mkk0VGYwc081UXVqbXZkdnpOMzEw?=
 =?utf-8?B?VkxzMlQ5VDhHZGFKOWJIZ2d5b0RmSFRRQ0dxTStzM0d3ZjkzTFltMmhHSWJi?=
 =?utf-8?B?QmMrYlVSeHVackFsT2R1dHRJVnpTekdxUXd3M3hZZkdMUjc3MDhDWnZSYWtT?=
 =?utf-8?B?bnVObEVmeDlxYnQ2U2QvSTZzR2FqdVF0alZsYUk0M3dpRy9LZVBaSnRJMFht?=
 =?utf-8?B?SEk1NTJpYm82SVRrZDJUY2QwaXNLbTY3SkpvZWR5TGdkN3U3TFluTE5Oa1Jq?=
 =?utf-8?B?cmVBaUxEUnhubmp3UEZaTDBJWnVPQ1hGbTZhcDUwRVBaaldQS3N1QklYSTB0?=
 =?utf-8?B?cng5c2xtTUtQb3d4U0JSdW85UGJPT0NVemM5eU1pekhHTGlVd09vempWU2No?=
 =?utf-8?B?a3R4TE5qWEdHZXFiaWk0U1lDZCttODYxbVN2cTk0YWpSRFUwT1RKNTNONkZq?=
 =?utf-8?B?TGJJNjRJZzRoeWJVRWcyNkRRYXNoWDlvbTMxZ1JDRmF0TlZqYWVRTVBWOWx5?=
 =?utf-8?B?a0hpdDJybUZYNW55aGZEMjgrRGxUNGJMSHZoUHBURGpONThSam56R1ptQ2h3?=
 =?utf-8?Q?uE4S6eCADNNp6viD2onAOaw=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee3bfcb-3ce0-4c3d-670e-08dc1af75ea9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR01MB7355.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 03:08:13.0237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LECGZXqVrUAhOiQQQpoKK973XQzgYKxWnpA3TNUdyoBQxdBB3PiuVl46ZWxiVA46wrIs+XnNpMe8SddaZTgsQItB7MDJwEe6qVFhR2s1HDKg/TvZe5gla5aLEWtBuy2C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR01MB6820
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

Dear all,

I'm looking forward to seeing your feedback on my patch. Please share 
your comments with me!

Thank you very much,
Chanh Ng

On 04/01/2024 11:19, Chanh Nguyen wrote:
> Dear maintainers,
> 
> Just a gentle ping on the patch.
> I’m eagerly awaiting your response. Please share with me your comments 
> if you need to update anything.
> 
> Best Regards,
> Chanh Nguyen
> 
> On 10/12/2023 11:25, Chanh Nguyen wrote:
>> Add the initial version of the device tree for the Ampere BMC
>> platform, which is equipped with the Aspeed AST2600 BMC SoC.
>>
>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>> ---
>>   arch/arm/dts/Makefile           |   1 +
>>   arch/arm/dts/ast2600-ampere.dts | 113 ++++++++++++++++++++++++++++++++
>>   2 files changed, 114 insertions(+)
>>   create mode 100644 arch/arm/dts/ast2600-ampere.dts
>>
>> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
>> index 37675a3277..3642d59c89 100755
>> --- a/arch/arm/dts/Makefile
>> +++ b/arch/arm/dts/Makefile
>> @@ -691,6 +691,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>       ast2600-greatlakes.dtb \
>>       ast2600-intel.dtb \
>>       ast2600-ncsi.dtb \
>> +    ast2600-ampere.dtb \
>>       ast2600-p10bmc.dtb \
>>       ast2600-pfr.dtb \
>>       ast2600-qcom-dc-scm-v1.dtb \
>> diff --git a/arch/arm/dts/ast2600-ampere.dts 
>> b/arch/arm/dts/ast2600-ampere.dts
>> new file mode 100644
>> index 0000000000..63088703a7
>> --- /dev/null
>> +++ b/arch/arm/dts/ast2600-ampere.dts
>> @@ -0,0 +1,113 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +// Copyright (c) 2022, Ampere Computing LLC
>> +/dts-v1/;
>> +
>> +#include "ast2600-u-boot.dtsi"
>> +
>> +/ {
>> +    model = "AST2600 Ampere BMC";
>> +    compatible = "aspeed,ast2600-ampere", "aspeed,ast2600";
>> +
>> +    memory {
>> +        device_type = "memory";
>> +        reg = <0x80000000 0x40000000>;
>> +    };
>> +
>> +    chosen {
>> +        stdout-path = &uart5;
>> +    };
>> +
>> +    aliases {
>> +        spi0 = &fmc;
>> +        ethernet0 = &mac0;
>> +    };
>> +
>> +    cpus {
>> +        cpu@0 {
>> +            clock-frequency = <800000000>;
>> +        };
>> +        cpu@1 {
>> +            clock-frequency = <800000000>;
>> +        };
>> +    };
>> +};
>> +
>> +&uart5 {
>> +    u-boot,dm-pre-reloc;
>> +    status = "okay";
>> +};
>> +
>> +&sdrammc {
>> +    clock-frequency = <400000000>;
>> +};
>> +
>> +&wdt1 {
>> +    status = "okay";
>> +};
>> +
>> +&wdt2 {
>> +    status = "okay";
>> +};
>> +
>> +&wdt3 {
>> +    status = "okay";
>> +};
>> +
>> +&mdio {
>> +    status = "okay";
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&pinctrl_mdio1_default>;
>> +
>> +};
>> +
>> +&mac0 {
>> +    status = "okay";
>> +    phy-mode = "rgmii-rxid";
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&pinctrl_rgmii1_default>;
>> +};
>> +
>> +&fmc {
>> +    status = "okay";
>> +
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&pinctrl_fmcquad_default>;
>> +
>> +    flash@0 {
>> +        status = "okay";
>> +        spi-max-frequency = <50000000>;
>> +        spi-tx-bus-width = <4>;
>> +        spi-rx-bus-width = <4>;
>> +    };
>> +
>> +    flash@1 {
>> +        status = "okay";
>> +        spi-max-frequency = <50000000>;
>> +        spi-tx-bus-width = <4>;
>> +        spi-rx-bus-width = <4>;
>> +    };
>> +};
>> +
>> +&scu {
>> +    mac0-clk-delay = <0x10 0x0a
>> +              0x10 0x10
>> +              0x10 0x10>;
>> +};
>> +
>> +&hace {
>> +    u-boot,dm-pre-reloc;
>> +    status = "okay";
>> +};
>> +
>> +&acry {
>> +    u-boot,dm-pre-reloc;
>> +    status = "okay";
>> +};
>> +
>> +&i2c4 {
>> +    status = "okay";
>> +};
>> +
>> +&i2c14 {
>> +    status = "okay";
>> +};
