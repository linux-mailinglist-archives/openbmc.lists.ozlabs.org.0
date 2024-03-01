Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 674DD86EADE
	for <lists+openbmc@lfdr.de>; Fri,  1 Mar 2024 22:03:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=r6vOrQSt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TmgXf027gz3vc8
	for <lists+openbmc@lfdr.de>; Sat,  2 Mar 2024 08:02:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=r6vOrQSt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2415::601; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=supreeth.venkatesh@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2415::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TmgX474vHz2xQ8;
	Sat,  2 Mar 2024 08:02:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ge1Qpm96ThAFQKeQZ6u7vM8l3KCqrhEHjvYD/WO8mj31p0LEZ++Ds36pD6tS4spnVW2l8dzyZOkFMsBKwdlY2WZ3RlSeUuXtwrpNGFKepky6/CETuroZV6s1HdETPA6qSIYDasGYmAd9bFu//xwbU5sa4/EmRk3egm9W+Ivs2dJxYKHo3RnKE/ds9opMod+f3ReAfAzwtRKWC8ctTMlJ/yqYZXSrYiLRuw56OzMCoiZLap6Nf2FIu45+nEcvq1NhJAkuZ4XN+MXhH5k0lEm5c29VTp77tntI0g14lqOh/6iBAPn7qwnIBewlbzxLrYdOEhFFd2MLj0d+x+7l9g8daQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w22bDhtkyKXcx2ZlUJ8+JTUwhs96yvBqYmrx0LPU14A=;
 b=koiof9DR828Vz5FzM3qHw6q6/BktSmLZM/8DsR4evN9lcZURr5VQYYEUPkv5kF937Rr5VYZc+5UFwI8WYyql7Kjmm29GTQvdSnU1j1G+4ppqqJmPOHQ5iACWrxhlRXeOGJiG2Cl9voWm1lbheTHiuTgGW8xmAOlQQtKs91La0Ul8N7GwT76E4sASwJRz+djxsP16EgcB/a5m+Bp2WVUTWDfg40VwIJrMIdD+jhuG9WAu4YJQUDzqxWzFzaOCXMgEzVkNWFw/X+NilEUYoFuinkkRGBMo2GMJCZzId4yEfGSmJNZCDJ+kpesXl23CRR3/hETw0r2xptv+xI9tsBRv+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w22bDhtkyKXcx2ZlUJ8+JTUwhs96yvBqYmrx0LPU14A=;
 b=r6vOrQSt6thWraNGQoQ4yHxj5DX8iZ2K1/gHX4WcHvKoLkUqhvi8yvukktErwUKLe3XnaDra50DPia5FqhVFoOFirncTzLvjaiATVHHwZ/UB/fMGURZfYma5YyPhcC92/wG2+XPk4TYOmCIUt1vgWt/Ju+W5DZ6x/05+N20YZ1Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4752.namprd12.prod.outlook.com (2603:10b6:805:e9::10)
 by MW6PR12MB8758.namprd12.prod.outlook.com (2603:10b6:303:23d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.34; Fri, 1 Mar
 2024 21:02:07 +0000
Received: from SN6PR12MB4752.namprd12.prod.outlook.com
 ([fe80::80ac:576:f125:1d72]) by SN6PR12MB4752.namprd12.prod.outlook.com
 ([fe80::80ac:576:f125:1d72%5]) with mapi id 15.20.7316.039; Fri, 1 Mar 2024
 21:02:07 +0000
Message-ID: <023f6f6c-dadd-4933-ac2c-15dfe77bd90e@amd.com>
Date: Fri, 1 Mar 2024 15:02:05 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] ARM:dts:aspeed: Initial device tree for AMD Onyx
 Platform
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Supreeth Venkatesh <supreeth.venkatesh@amd.com>, joel@jms.id.au,
 andrew@aj.id.au, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, robh+dt@kernel.org
References: <20240110033543.799919-1-supreeth.venkatesh@amd.com>
 <d4fe8b55-a1ea-4ce7-89ac-ce17e8ff4e45@amd.com>
 <dda6c22e-8f35-4c18-9fea-6a6295dee3a1@linaro.org>
From: Supreeth Venkatesh <supvenka@amd.com>
In-Reply-To: <dda6c22e-8f35-4c18-9fea-6a6295dee3a1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0109.namprd13.prod.outlook.com
 (2603:10b6:806:24::24) To SN6PR12MB4752.namprd12.prod.outlook.com
 (2603:10b6:805:e9::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB4752:EE_|MW6PR12MB8758:EE_
X-MS-Office365-Filtering-Correlation-Id: 71459798-a8f5-4df3-dffc-08dc3a32daee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	qQSwXg8hD2OPvTEfj5Rc86PWBAtkTj3S1rkoKdc8v14Y+TuNasRBrYs2pzJk+ilgdHJ2ntvgX/jbUsRw+e4c5lV4anmEA8AVOA9OPThm3xsW5dkfz5qrW1p0e1JjFN8q9c3pHMvDE0SDBn20Z3r+1RVQ7my26fa6xXnrDynstO2l+2Xy04I2vYGV+fUm78JocDzwOS7y/oUYUXWFO1qq1SemLDxHiXbZ4iit7OaYo97K8sLgDvgNbZh5DJ4P5mpBeUGDJUkUOMSkKYAD+SaJdf95aRnD9Seg0niLlH1lFaAod7CBbMucaQuTYmLlUa66j9iMtwCvUIcLIGzEiFs8hkrgpjV67qPFMfAIlo1kpg8YD+ZPWJCjB1Gsz4Lhm2e+4Py6tebkEB2lVfK9CtkuZL6GrRfrEv+IMo4Gs+3/Pt/qqbu/A8w4uwMzj7++JrA7gkP2ma6e0kMoT5HOmTtX5bmzJ16NJC+3F5EGK4bquMfXSauysfZ5Ne4WYpmfy9IkmBM35WkpTuh1+lrR0Lartw2gH8Gqa6jpLvLb5MpPXE7u3kS5A8XCxD2GisEBPtIEyeg9hatPaLI94Iq5cMcWuEVJ+nC3BHFBZne+mIQtHMbQXbHlG/qXtl8Y4+c6dj8YcCsW58BMEMRzI7kMtoafIC1TPVq7c+4gH8k2qgrp80pkZxCd8gjMadDap3d211d4y+fdfaN3bSX4mYYfViyr5A==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB4752.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?dzd6OHRyL1JsNGgxMllsbXVUQUFTQy9NTEdjcVVpWVVxVzFBckNFLzFTK0tk?=
 =?utf-8?B?RDVUMnJQam83M2U5dlh5b1djWjFQWkN6aStyQkVrTXlIWmUzTjNZTHJLeEZs?=
 =?utf-8?B?S2d6NGQ3dDZEN0dadC9Uc25yMUNHa1FmQ3d2QWUvR3U2YkhRVGtiT29wa0lB?=
 =?utf-8?B?Y0Q5L0VnT3pjZ3loK1MrRWRhamVSaFkxY0VVN3YwaGhJMEdodUl6MXBVZGQ4?=
 =?utf-8?B?dDdqWnAyYU5kYk9PWnhCOW05YlNXMDVSdnhyTkJKdUJJSU9QNGprbWlLK3ZY?=
 =?utf-8?B?Q3VsVjZPekFGUmx2ZDVSUnlCOCtteWFwR1czeWZwV05wTEJ3U1BGa01WTlBm?=
 =?utf-8?B?MzRHN1AzaFYyQzF3aE1PN3pQU0ltWGZTaGpOTnBndWpZY25vR2U3cEV0Rksr?=
 =?utf-8?B?VWFlcHNDYUI1eG45V2dYUk80UWs5cnRJRGR1OG1BTWtoWmFFZE4vWjNtY3Rh?=
 =?utf-8?B?ZGRMSVNMam5ScXdBaUROWGVRVlBGMFRkVGNTKytBUmZBVVZXd0kwamNocFk1?=
 =?utf-8?B?K0F6NFltUW1sM0YrT0RMdkIwS0NNWW94MENmWTVHZGN1U0tFVTYrWjdIUEEv?=
 =?utf-8?B?bEZ3eUlmNnB5RC9VelpNMkdGNmhaczFWSUk4c282R0RNUUFIejFISWRyOE5l?=
 =?utf-8?B?WUM1cDJoQWZmQy9mSGUwV0NuR1pOQWwycHlzdXFjL2RoTVM2TUNvZUM3NVZE?=
 =?utf-8?B?b3VKN2RYanpHNWdVMU9KOXh3YjI0Q1BiWHhlRXRFL2Y2Yi8wOXN1QVk1N3Zr?=
 =?utf-8?B?d3JKdkhYOFFsQ0dJWnRNemZYaWdGV0hVVjBvV0RJK0VyWENEVCt0eEVJUEcv?=
 =?utf-8?B?WHBGc3o5WEYvbEQxU2E2TXZTemVHM2gwNS9uM0crb0lxSVNWMW5wWnRiUzFP?=
 =?utf-8?B?TWVCaWE3NXlLeVphQ1VxamszTURKeWFpaFRNK0dGRW9mU3QxQXJuWGlTNnFO?=
 =?utf-8?B?TzBJUlR3ek41L05MWDI5L0xUMTh3QTExZUh1Kzd0VnIzS0JjRk1XL0J1R2tr?=
 =?utf-8?B?RzdLTkRvQWRORlFmUG9QamJ2ZDdUZ3Rkd3hKdXpZQ1FCNEljSXR2RWw5R1V0?=
 =?utf-8?B?ZlcvN1FQcUhGSE9ib0VybFA1QlUyc0Z6eTBkVG43UUdqdkhWZkNheGFHMGwz?=
 =?utf-8?B?em5YMUtXWEcvMSt2eUM2Nnh1eTVQbkJQcmlYQ09va1l2bTV5NTgyZVdqYjhU?=
 =?utf-8?B?czVnL0dQSThTTnovQjlhcG9jbW5aUTFuYzVsZTVSZURrQ2tMcGl6V0RySUZt?=
 =?utf-8?B?WWF6bDhscDYzaXU3WmZxSjlNdThaOUkvb1VLQjExb2t1bTNaakxQOXdDblBy?=
 =?utf-8?B?dVErRzFsa2JKbExPM2FTRWNTYnVyRHNEQ0tYUHFpRm90b0ovOUNQa0ZQcVBM?=
 =?utf-8?B?b1hYKzczVjVxK0NoYlp0d1FvNEt2VmFERUYzTk9ia2FmbGNEMktONGJSb2hQ?=
 =?utf-8?B?dlgvVmJab0lkMVFGcGMwQTFrUVpHS1FYKzRjYmgxazFUVlBWZnYrQjBrb3Nr?=
 =?utf-8?B?QXRJU1dONkVoaUpFdXlXWmtBcjFsSUQrZDJQUDFhaTdzWlNLMitJVDlHM3Rj?=
 =?utf-8?B?eHp3RnZNMXJ6a2loblFod2VobWtTd3V4S3g4bEhVVjN2OU9xN2pMTWJnZkZo?=
 =?utf-8?B?R3NiOWtJT2RlY0w0ZlNKM3owSjlmYUwwSWt4aXMyU0dCV0psTFFrUzFPZjVF?=
 =?utf-8?B?M0xQTk5wUHJCdGVQNkE0U2xoWlVEWm9WSDd1R01LN0x0b0VUZDVsZndFeXMy?=
 =?utf-8?B?QWVmWUhCUUk0dGtSNFdldEczbUNtUjVNL3RMYWhrUHkwZVhESDZ6VjF4ZjI5?=
 =?utf-8?B?RVMyWTJuU1lMblhIcDBWZTA2cXFIeW4xM3VjZkd2d093TFFVdlV6RGhUcGFQ?=
 =?utf-8?B?Q2o2L1JWVHVzTFBXdFBRS0xhTkQ3aHh3WFhWaXhRODV5ZFRlNlhuVy91SVhF?=
 =?utf-8?B?ZkFpVUdWU2hkbURXb282M3ZjM0hoaGlIYmpNaFpibEdscitXUFlKUXFvdS8w?=
 =?utf-8?B?a011N01sTENzd1J0NnZOclo0c3FkNEpNS21kUjhLVnZyV1gwQjQ1dGZtZ2ly?=
 =?utf-8?B?U0dLSkV4YmUxS1hJRDhyNGJrUzJuRVFWa0ZpcndYMWlRclJkM2diS3NLaG9U?=
 =?utf-8?Q?1H/CqqgNuWLIC+KZ9fXHnU9Q/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71459798-a8f5-4df3-dffc-08dc3a32daee
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4752.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 21:02:07.6759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/RgR4jmW4z7CzqPIgjWvfaQ+ikqipJKLlxrW+bV08ca2uUOwsFezZ+3OOInHkHwnTmIjeCHHrq0I6k4F0VePg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8758
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 2/9/24 06:38, Krzysztof Kozlowski wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On 08/02/2024 15:57, Supreeth Venkatesh wrote:
>> This patch is pending for a month now.
>>
>> Can DT maintainers please help review this and provide feedback?
> I don't have the original patch in my inbox anymore, so probably you
> should resend. Anyway quick look points to obvious issues (comments below).
>
>> On 1/9/24 21:35, Supreeth Venkatesh wrote:
>>> This patch adds initial device tree and makefile updates for
>>> AMD Onyx platform.
>>>
>>> AMD Onyx platform is an AMD customer reference board with an Aspeed
>>> ast2600 BMC manufactured by AMD.
>>> It describes I2c devices, Fans, Kcs devices, Uarts, Mac, LEDs, etc.
>>> present on AMD Onyx platform.
>>>
>>> Signed-off-by: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
>>> ---
>>>    arch/arm/boot/dts/aspeed/Makefile             |  1 +
>>>    .../boot/dts/aspeed/aspeed-bmc-amd-onyx.dts   | 98 +++++++++++++++++++
>>>    2 files changed, 99 insertions(+)
>>>    create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts
>>>
>>> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
>>> index fb9cc95f1b60..2b27d377aae2 100644
>>> --- a/arch/arm/boot/dts/aspeed/Makefile
>>> +++ b/arch/arm/boot/dts/aspeed/Makefile
>>> @@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>>       aspeed-ast2600-evb.dtb \
>>>       aspeed-bmc-amd-daytonax.dtb \
>>>       aspeed-bmc-amd-ethanolx.dtb \
>>> +    aspeed-bmc-amd-onyx.dtb \
>>>       aspeed-bmc-ampere-mtjade.dtb \
>>>       aspeed-bmc-ampere-mtmitchell.dtb \
>>>       aspeed-bmc-arm-stardragon4800-rep2.dtb \
>>> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts
>>> new file mode 100644
>>> index 000000000000..a7056cd29553
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts
>>> @@ -0,0 +1,98 @@
>>> +// SPDX-License-Identifier: GPL-2.0+
>>> +// Copyright (c) 2021 - 2024 AMD Inc.
>>> +// Author: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
>>> +
>>> +/dts-v1/;
>>> +
>>> +#include "aspeed-g6.dtsi"
>>> +#include <dt-bindings/gpio/aspeed-gpio.h>
>>> +
>>> +/ {
>>> +       model = "AMD Onyx BMC";
>>> +       compatible = "amd,onyx-bmc", "aspeed,ast2600";
> Undocumented compatibles.
This is a new device tree file.
>
> Please run scripts/checkpatch.pl and fix reported warnings. Some
> warnings can be ignored, but the code here looks like it needs a fix.
> Feel free to get in touch if the warning is not clear.
>
Will do.
>>> +
>>> +       aliases {
>>> +               serial0 = &uart1;
>>> +               serial4 = &uart5;
>>> +      };
>>> +
>>> +       chosen {
>>> +               stdout-path = &uart5;
>>> +               bootargs = "console=ttyS4,115200 earlyprintk vmalloc=512MB";
> earlyprintk is debugging, not for mainline, so drop.
>
> Console should be encoded in stdout-path.
>
> vmalloc looks like OS tuning, so also not suitable for mainline DTS.
>
Thanks. Will remove vmalloc. However, I will check whether existing 
device trees for BMCs to check

whether existing DTs have earlyprintk.

>>> +       };
>>> +
>>> +       memory@80000000 {
>>> +               device_type = "memory";
>>> +               reg = <0x80000000 0x80000000>;
>>> +       };
>>> +
> Drop redundant blank lines.
ACK.
>
>>> +};
>>> +
>>> +&mdio0 {
>>> +       status = "okay";
>>> +
>>> +       ethphy0: ethernet-phy@0 {
>>> +               compatible = "ethernet-phy-ieee802.3-c22";
>>> +               reg = <0>;
>>> +       };
>>> +};
>>> +
>>> +&mac3 {
>>> +       status = "okay";
>>> +       phy-mode = "rgmii";
>>> +       phy-handle = <&ethphy0>;
>>> +
>>> +       pinctrl-names = "default";
>>> +       pinctrl-0 = <&pinctrl_rgmii4_default>;
>>> +};
>>> +
>>> +>> +
> Drop redundant blank lines. You can open existing, recent DTS from
> maintained platforms like Qcom or TI and look there at coding style.
ACK.
>
>
>
> Best regards,
> Krzysztof
>
