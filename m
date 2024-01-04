Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC778823B65
	for <lists+openbmc@lfdr.de>; Thu,  4 Jan 2024 05:21:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=kfwCaZk+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T5D124G9yz3btj
	for <lists+openbmc@lfdr.de>; Thu,  4 Jan 2024 15:21:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=kfwCaZk+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:2416::701; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T5D0Q5cLLz30h8
	for <openbmc@lists.ozlabs.org>; Thu,  4 Jan 2024 15:20:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b3YktHvLM3BaMw64JsldkogqDhmdmicL2V4N49I8slf/zscLcYNnjT7o/ft5Ul0M6FXIUuYJee8kcWZwVfmdSSYxrtMc11AIgs7fL/q3hIL8h4c64HxitIxADeTOv4njBQHH96eDq/CT2tBGJIAavsGCuM6ZPgpRsGrFVqCy3wB7ztT/h3lYPeDuo/ne9RyJm+SN2iKQ3Sh1qbvEBPSSufqStbpzGEQkOlwT+NDTJBGmBp8lDQJfUsQBwa6HeEm/yG/RATaavwiuV2hg8poprhMEhPHJf+Lf/wtThheQVba0mvdMVy6VnPU6rBRDaot9SjXPUCq4IMEKShF90Z9aMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DG++W+X7JYBmRCosr63cML1NrpiHSOOg/31b5XFeo3I=;
 b=bDLYmJfYI6RbDStuW8bOpVSMBytyhtpq6vcGW+7sEK3q46ekUFSgx3x/prEPLCIlL8f/tQWz8L93aV5OXFMwoiht0GZNr6Z1WbiMkhBj8vATPvQOTz+f1QSxyqSc9Y3e9ODQJZHI1MC5qeDqA+AYD6/HQf0bxTAiOzuraIQOpFKubudZk8Yi5YxB2Uf/x/ZK0Bs3njroCOHpJiKFD/atCa6JJFvPvhMOG2Mr9Cdbr78W/G6ZGQ1lKPJ3SBGzIiU35Rbv1M54zShwSlIrS6o/zMPPFJeKUfEnDy9OrGoY7frga+lzsS9RJpdQWFd29eKlVA9IhTrcHCHoexH3ub8uJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DG++W+X7JYBmRCosr63cML1NrpiHSOOg/31b5XFeo3I=;
 b=kfwCaZk+r1fJS/AKZqLB1LPTt6gwrQa9JBT5wzAGUOZscpoogqPUO37dEXEWna5IiRz5xoEB7ifJ2yV3xLhKL2myxb47qPV3f3XY/rUs0YxOu0ZbToDEridVo8KLaRAeuxZ/fJVEKrinuBuSyxI5HB6JytEAahhduQ7oVPPEM5E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from CO1PR01MB7355.prod.exchangelabs.com (2603:10b6:303:15a::21) by
 CH0PR01MB7080.prod.exchangelabs.com (2603:10b6:610:10d::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.13; Thu, 4 Jan 2024 04:20:10 +0000
Received: from CO1PR01MB7355.prod.exchangelabs.com
 ([fe80::d990:5395:4b82:6aae]) by CO1PR01MB7355.prod.exchangelabs.com
 ([fe80::d990:5395:4b82:6aae%4]) with mapi id 15.20.7159.013; Thu, 4 Jan 2024
 04:20:10 +0000
Message-ID: <24160a1f-bb5c-440a-82a0-75bc2199b3a8@amperemail.onmicrosoft.com>
Date: Thu, 4 Jan 2024 11:19:58 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] ARM: dts: aspeed: Add
 Ampere's BMC platform (AST2600)
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
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <20231210042508.16187-1-chanh@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR04CA0056.namprd04.prod.outlook.com
 (2603:10b6:610:77::31) To CO1PR01MB7355.prod.exchangelabs.com
 (2603:10b6:303:15a::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR01MB7355:EE_|CH0PR01MB7080:EE_
X-MS-Office365-Filtering-Correlation-Id: ae570c9e-2db9-46db-174e-08dc0cdc709d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	7YuY7Wu29BktkDXDZ0F/bCJxxLoIEqzJUsZ2sn8oEdvJzAfnCBCetypUUuLgdkM1mlsYJTXQ15Yjsczgpo9ACoc6dbnwC1hls79ITPXXeOydvVSoB9+HLVTqTKioAxhzhukQTCG2jUG7X3ZyAJss+ZjFiZsUZMdFAfmiFfgGVIHDEdOccl8lYRwW7pFbzKqNMGCIbkm6bc26nX6LzTsfLcxprWvpDh8c2skzXy7Wi81PchvQBy9FvCBlP8U26sREc9jUBYZ6GMIzkkPG9M3q5gIm6ShaMB79AGN2s3yI5yk66ctqI518V4lEfB5jkL3/j9G6bMNBYhdc6ZL5YEiVsgHnKp2fq5lQrZR9Rd+jl/i1y9iZbWjAq3LE4sGDtlERXn6v25ZXv5AMQ49E8GP/vplnGH26rNE0G7mQZlAuDnKhCN7aUlnqmzDUJmYODYTYQIrZgbQKdfoPltx7qK5kbk0bmMIeuNyaUtNG40B2LHVGbt84jpY2fcniim488r54smWNRPE3pGilf+7cUZBi4SCSLS85DctLfE15RcuB6dsU4A/7RFBRET0oL5aJ7qUTEjsgW24NPwSpFFjz0Q76390KtWwkBKcUj8dVMvahQdLeODJ2JLN3fFZotSqcsKAHbEq5NhSocWi0QRCet/81RA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR01MB7355.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(376002)(39850400004)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(2906002)(38100700002)(7416002)(5660300002)(83170400001)(42882007)(921011)(26005)(6486002)(107886003)(478600001)(2616005)(66556008)(83380400001)(66946007)(66476007)(41300700001)(31686004)(6506007)(6512007)(6666004)(8676002)(8936002)(53546011)(4326008)(31696002)(110136005)(54906003)(316002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?cjVBT2VTbnk3V2JGSG1aWFNaY3ZDK2NuRTlSTnZvWGZ3YXhid0pEaEdPc2R0?=
 =?utf-8?B?SDZYZDRXYm5iR0RlTlRDTWRRNkFSRlZHemVrM3JReUNPalBkQ1U3bTNQR0FN?=
 =?utf-8?B?T28yamU0OWVYK05FRGswY09ObFhpNkN3SG5ySnNybjN3UDhSQlJCSENwT2xB?=
 =?utf-8?B?eHY2aVJLU05ERlAxRkZZTWJiVXdEeTAwSTNFZStMSW85ZjIyWEl6T2NHOERh?=
 =?utf-8?B?S0diSk9oTFBDSnNEU0pBdDRBbGpVUUVsMlhsYVc1UG55VDhwd3NaOTNkdTdl?=
 =?utf-8?B?VnhpOUhWZVdMQWxqekszTFpxU0FqZWd3OFJiYTZPQXJtVjZMQ1NmbHpSZWh0?=
 =?utf-8?B?MjFCU09aU1ZHUnQ1Sk9DUXIzRUNManhPUXdPVFh2SnNqaTVzM1RxOFNUSzdX?=
 =?utf-8?B?UjRPb0hpQXR2Z2pEYzM1cE02cDRaaDY1UlpMMm5ERmpScklaTzAxU3VRUFJp?=
 =?utf-8?B?UzlZbGlnaGZob0tNekcrcG9JYkZqYjVQaVMweFZVQlJDM2txUEtCc2VScjlV?=
 =?utf-8?B?TmpTOU1KeEVyOW5nVlViZ2pXM0hvYjh5c050dG5qRCs4RlAwOUpZVk9vNXZO?=
 =?utf-8?B?S1BraUQ4Uks5cDNUWEtzbnY1c0JYQURSaGhUU1lKRVFGaTlSbGl4SXhXeHJt?=
 =?utf-8?B?eTVzV0FVZE9lSzFzNmpEU1p1TDV4UTNpVXh3VU1SY1RLMmNaZXF2MVYwNy9Q?=
 =?utf-8?B?SSt2NVNHekl5V1lycEtGbDF6K09hWERqMi9GalBKSDM4UEtMTnRHdGVHeFVE?=
 =?utf-8?B?SVFEMUQzRWpRZlNDdkY2aVFaREwyeVE0Q3BMaE52Z3VZYzkyM2tiNVZHNDZ2?=
 =?utf-8?B?dWUwcnppK3VoOGI1R2NvbUpjd0YxcTlyaFBxbkx0RGQ4WGttNVhnZ216aE1k?=
 =?utf-8?B?QktTZlhJTHBna0pUN2svdVNUcjFVTjVOVjZnTFg2WXd1aVoxY2JVSmkrY0dH?=
 =?utf-8?B?R2w0eWM2aEpjckRVcnp4dW92RW45UmRqZFFPQTkzZzhYdUtBVUluWFJNNTl6?=
 =?utf-8?B?T2lUN2FUanZkZlZEa0RPUkJFcW5LUVVHdUs2UklmWkk5RHExTWhSMUpFSHFm?=
 =?utf-8?B?MkFuUk5LV1FDZFg5Ylk5NmJpY1Y3MlRFdGxubmxzQXplNW16Z2xGbTZvYlVv?=
 =?utf-8?B?MllLSEtBWHBCYjZPc2RlanpPY0svYThVQ1dpWnZsdzVxRzVXbnVGV1doemtC?=
 =?utf-8?B?R010NXdGak41VG5FR09yRHNXOUxTY1NrRUxkRWJDcm1PNHJwOXhWcWlyNWMv?=
 =?utf-8?B?eHo0cGhpcjhhVzJxY25qT3RVQ3hVL1JxTUVGSCswd3VXTVBaYVVrOE9LTmNv?=
 =?utf-8?B?aVpuVEhobTVJRjU4bFB1aHFEZ21jSzZLZDh2NzV0V05jaTdhc1NNOExjUTJU?=
 =?utf-8?B?RXZFeG5CbnJxQVFFOG5YMU9PUDNoRnZJaDNuUzZBUDliN3ZuV1FLTVU3d2Nh?=
 =?utf-8?B?NUp1ZXV5cmc3SGtIdldWUk5QVXhQcW5lcGNJeGhMUkZQNGZzOVF0RTVxSkNm?=
 =?utf-8?B?L21QTisxVks4cWtUc1ZrMVVkR1FJbGpKODUwcVpvMHAwK3dpd0xKb01iRWVm?=
 =?utf-8?B?WDZ6dmFYckNIdVhVYmJWQkhqWUpDck1qcUhqdGFXNG5Ldm5FZzlCbVYrckNR?=
 =?utf-8?B?REVQSkdxODhJWmVBQm0vMlV0b3Y0TnZKUXBCbTRTUzdOek5qU25VVkhBdFdW?=
 =?utf-8?B?cEdOalNZZTd6L3JBektiOWtPL0JzNnQvdTU1aWd0ejNKTStrV1hUQW1oQWZS?=
 =?utf-8?B?Tmk3YkhvYVBQY2lLWVVya2FZWm0yell1elNRZFhzTmw4dGdtdjV4WktlOVN1?=
 =?utf-8?B?QXNOSERCM2w4blZDYkhrcVZ6S2VjajA2OWZ3NXRncUEydi8vVkc3a3RVem8x?=
 =?utf-8?B?TkFPdXI4dy9ONlBZd0RURW9zT29iZVdFN1J2V2VUUHhyc2d1UkpwT1UzVHlM?=
 =?utf-8?B?aitzSm5Bd1dWVlIxd1drNHNQT2QvajRUUnZJVG1INUNoZXNHZkRYdzZFdkx3?=
 =?utf-8?B?dEIvU3JoR0lNWVRYQ3gzN21pc0Y1Vy9HOXdQOWd0V0JGQ1lDRGIzeXFoeEhU?=
 =?utf-8?B?aUxWcnp2U2lidUV1dGxNY3E1SzdvdHI3ZnQrMGE3SU5CNk5GUVBBak42ZXRv?=
 =?utf-8?B?VHYzOWxPdjhHRGsvSEw1K1Nvc3A2Vm9JNnJXYVVvOTlLcnRyOGFLL1RGbG9Z?=
 =?utf-8?Q?l7Ipz52PE/3cj+wd7r7WKCU=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae570c9e-2db9-46db-174e-08dc0cdc709d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR01MB7355.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 04:20:10.2654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DZ70LythjZzI5QTaf2Lwqth589jW6OVjZw00Y6MFYMMoLvIiJKgP6unlGQgDRaf4a0aAkGI2NduUMbzUIJkYnQpFquh53wCWbZ7IAh5ncpHVYzA053aIu9IlWbK4pNF1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR01MB7080
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

Dear maintainers,

Just a gentle ping on the patch.
I’m eagerly awaiting your response. Please share with me your comments 
if you need to update anything.

Best Regards,
Chanh Nguyen

On 10/12/2023 11:25, Chanh Nguyen wrote:
> Add the initial version of the device tree for the Ampere BMC
> platform, which is equipped with the Aspeed AST2600 BMC SoC.
> 
> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> ---
>   arch/arm/dts/Makefile           |   1 +
>   arch/arm/dts/ast2600-ampere.dts | 113 ++++++++++++++++++++++++++++++++
>   2 files changed, 114 insertions(+)
>   create mode 100644 arch/arm/dts/ast2600-ampere.dts
> 
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index 37675a3277..3642d59c89 100755
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -691,6 +691,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>   	ast2600-greatlakes.dtb \
>   	ast2600-intel.dtb \
>   	ast2600-ncsi.dtb \
> +	ast2600-ampere.dtb \
>   	ast2600-p10bmc.dtb \
>   	ast2600-pfr.dtb \
>   	ast2600-qcom-dc-scm-v1.dtb \
> diff --git a/arch/arm/dts/ast2600-ampere.dts b/arch/arm/dts/ast2600-ampere.dts
> new file mode 100644
> index 0000000000..63088703a7
> --- /dev/null
> +++ b/arch/arm/dts/ast2600-ampere.dts
> @@ -0,0 +1,113 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright (c) 2022, Ampere Computing LLC
> +/dts-v1/;
> +
> +#include "ast2600-u-boot.dtsi"
> +
> +/ {
> +	model = "AST2600 Ampere BMC";
> +	compatible = "aspeed,ast2600-ampere", "aspeed,ast2600";
> +
> +	memory {
> +		device_type = "memory";
> +		reg = <0x80000000 0x40000000>;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart5;
> +	};
> +
> +	aliases {
> +		spi0 = &fmc;
> +		ethernet0 = &mac0;
> +	};
> +
> +	cpus {
> +		cpu@0 {
> +			clock-frequency = <800000000>;
> +		};
> +		cpu@1 {
> +			clock-frequency = <800000000>;
> +		};
> +	};
> +};
> +
> +&uart5 {
> +	u-boot,dm-pre-reloc;
> +	status = "okay";
> +};
> +
> +&sdrammc {
> +	clock-frequency = <400000000>;
> +};
> +
> +&wdt1 {
> +	status = "okay";
> +};
> +
> +&wdt2 {
> +	status = "okay";
> +};
> +
> +&wdt3 {
> +	status = "okay";
> +};
> +
> +&mdio {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_mdio1_default>;
> +
> +};
> +
> +&mac0 {
> +	status = "okay";
> +	phy-mode = "rgmii-rxid";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii1_default>;
> +};
> +
> +&fmc {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_fmcquad_default>;
> +
> +	flash@0 {
> +		status = "okay";
> +		spi-max-frequency = <50000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +	};
> +
> +	flash@1 {
> +		status = "okay";
> +		spi-max-frequency = <50000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +	};
> +};
> +
> +&scu {
> +	mac0-clk-delay = <0x10 0x0a
> +			  0x10 0x10
> +			  0x10 0x10>;
> +};
> +
> +&hace {
> +	u-boot,dm-pre-reloc;
> +	status = "okay";
> +};
> +
> +&acry {
> +	u-boot,dm-pre-reloc;
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	status = "okay";
> +};
> +
> +&i2c14 {
> +	status = "okay";
> +};
