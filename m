Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA61384E38C
	for <lists+openbmc@lfdr.de>; Thu,  8 Feb 2024 15:58:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wal73oxa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TW0V051Ghz3cBW
	for <lists+openbmc@lfdr.de>; Fri,  9 Feb 2024 01:58:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wal73oxa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:200a::600; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=supreeth.venkatesh@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TW0TL15ZMz3bnm;
	Fri,  9 Feb 2024 01:57:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ocXLsCo3fbRr1cPqTusqcNiZsz7Aej/5988rehnVQcfkfmWYBOmEopira2uwJzzrlREuxEDAk2WxTzvOO4P9lsMdKGM5Tj4K0NmAFxiH0GFlY7lT7Wx1LuPLa5ON4ZxXBhCb0yeMjVAopZHTPF98qOCguzpp7vAJsUfQ5X3lbfm3M8Pwc1iJ0bCURy7nVzfeLIUTAMjvRDqMT1SCsRRFJTOx24/aMHo3vPQCZL5mM7jvWAw/68PlKfsLRdmb1cCCgpjVYWZ97kzwQLfRP1SKHBISOQ/JG8IIgn1bLSYs8vmC8VBlgu6s4k6IXerMI/pHLMX+Ernl67SZh/6/RT/Djg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nsqVsWIMo6VHQIN4XA7nG5x4HJlZeUF6TpOxQyitxSQ=;
 b=QyXsYOGypPT7hCpXM9xFSRmcFUWlNSSJKzKvI7W1BeIgV0yhm2CqLkeMaEQ+FknTIWf9GRITkmhWGDqK0q/aEjlKrf7+VwcKYpirxdVjOCi+4ZhrNUlbiCr9Iz2yAdW6gyt0yNGVLJlxzBnDXy5q+xjv/44fNd/hXVOiM5qtIZ8iDSarcVo8cNl0/oG6UUy/DF3BEnK1w3I9AGLhJ/RFYIpdoCwriXuZOxl2QjbVZofqGAXkc2eD79sQfHmG/UbB2ltYAnYsZ00W61eBqJaJectaFxExHdOdlvFJzATqyRqAcESZhuhY+HUQhEZqU6eTDRoMehlNdRLhzfPTRCvPtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nsqVsWIMo6VHQIN4XA7nG5x4HJlZeUF6TpOxQyitxSQ=;
 b=wal73oxaVRxKf4ZwtRg0aqtDbKA4ybGrl0RrTSgM5W2bBYhyIgHVl3P2A981My3ZP40bceokdV9bDZFr44mZNDmc84RgKhdJrwmiJ12xvd5555gkwH3f3Y6udL9dyugOkKT55aUULPFWKth5V46ZADHJ8x1SEBEklF5ptrkEpCY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4752.namprd12.prod.outlook.com (2603:10b6:805:e9::10)
 by DM4PR12MB8500.namprd12.prod.outlook.com (2603:10b6:8:190::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.14; Thu, 8 Feb
 2024 14:57:18 +0000
Received: from SN6PR12MB4752.namprd12.prod.outlook.com
 ([fe80::f1ca:c26f:a79c:ac36]) by SN6PR12MB4752.namprd12.prod.outlook.com
 ([fe80::f1ca:c26f:a79c:ac36%7]) with mapi id 15.20.7270.012; Thu, 8 Feb 2024
 14:57:18 +0000
Message-ID: <d4fe8b55-a1ea-4ce7-89ac-ce17e8ff4e45@amd.com>
Date: Thu, 8 Feb 2024 08:57:16 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] ARM:dts:aspeed: Initial device tree for AMD Onyx
 Platform
Content-Language: en-US
To: Supreeth Venkatesh <supreeth.venkatesh@amd.com>, joel@jms.id.au,
 andrew@aj.id.au, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, robh+dt@kernel.org
References: <20240110033543.799919-1-supreeth.venkatesh@amd.com>
From: Supreeth Venkatesh <supvenka@amd.com>
In-Reply-To: <20240110033543.799919-1-supreeth.venkatesh@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR08CA0043.namprd08.prod.outlook.com
 (2603:10b6:5:1e0::17) To SN6PR12MB4752.namprd12.prod.outlook.com
 (2603:10b6:805:e9::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB4752:EE_|DM4PR12MB8500:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fe4f774-1fca-475a-03a8-08dc28b63ee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	AoBB82IliSgfl7NeGNUtq5h3Ui2mwzxO6AtwjcTX0iDZAcNzfx993FR0sKw4MQvT7zvPLq+wxNDGvs9PjuSBB9iA02ZxNe+A9TAzJP9sn7wuP+hbBlFbzjYXSngCPwiDq5N5+uOFDFL/fISKnlw8Uv7c9MRQHUY/xEVEu9uxcVWcj+To5JcFAWAfoTk4MlMUASTT/nYuDmjppAOZNAVJ1aV7e3CgR1hpNBgR5dIEo1jCFTXtpBtK1i59csgSbuNVk5TBM9a4ONvUzs2O9sDYQTwIgg1DKYDzg9+vjS+jRLxasJtWbbb6udbJ/k8NbKWehIs7+Td7gJoEWZrM00R7NLNgxD+9FBsS2PVWVtqx/7VDasWTBLmFUi8PkRsJEIyN5QRBDRwTV/0lOOaCIGWeVpC16LIVNRcWFr8exdalTDXhXduClvD17lUfhnNa/KobDgqNZEJ5oBnm3VStJpYwUKSxB44EKCob352fVKvV8BG0Ssp8trHNX3h7PxRUOl7ztJcWS1tHb35g96ML5FvWNeP+vNc4PMXWok8hAxRB2czHk7bSRRXioiZ8IjC5w5XY
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB4752.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(39860400002)(346002)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(41300700001)(36756003)(6512007)(6506007)(2616005)(66476007)(478600001)(31686004)(66946007)(2906002)(26005)(5660300002)(31696002)(8676002)(83380400001)(38100700002)(316002)(8936002)(66556008)(6486002)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?SnFUYTRQMVZzRzF0ckdkMVRJcnQ5NU5rVjJTZTh0QkRmQ1hNUGdtZzgxR0Z6?=
 =?utf-8?B?TjgzOXJEbEIxL3hkdGhXWXlCVTZNTjZ1TUFRWVg4aGtBNDlOVXd2eUpJTW5o?=
 =?utf-8?B?WTNQNWE4Sml0T3BqMXo4aHdEZ0p1ZHpZdTljRG5LK3NxYnBEOFR0MGZhdWoz?=
 =?utf-8?B?SUlzSXg3clE0alJ5bFFxSGYxLzFOOGJGZHR0czR4WEwrQm5SUGZaMUVXU0E3?=
 =?utf-8?B?Vkt6VkhBK2RjejZVdGQzL1h1MDlMaTRtU3AzRC9hNjZoYzZjL25aM2JXei9a?=
 =?utf-8?B?Zkg0UXQxRERGTkR5WU10ODY4RHVxTmVZQmE3Z1ZDcUI1OUFncDlGWVQwRHNO?=
 =?utf-8?B?c212RU1wZHhNM2NEMXpvNXRITm96bk5DUFB0TWhvRGNjWnVZUDFCV282Si9T?=
 =?utf-8?B?WXAzcGwza1plWFZFdWhvcFdDYlVFU0hDbnFJWWlvcUNVL0wrNFJMeHJ5MnBU?=
 =?utf-8?B?eTJyRTMvVy9tRmt0UjMxb0tHcGk0Q1hpTXB5cjZIRXpJWi83aGFpejZoT3Vx?=
 =?utf-8?B?d1RHUE5vSHBKanBPRUV1OStVNURQVXdCREF2NG1OeVdzdzNXY3VxK2JoeHhX?=
 =?utf-8?B?ekxhMUpaVTI4SFp1RlNhOVRRWFROR2t5V1Z6czQ5bENodllhMU1uN05USHYw?=
 =?utf-8?B?NEdEbG1RdmUrbnlwd2tSVVBBSFFWM25GMEhEb05NZzNKSmJBaVZtaTNOM3Fx?=
 =?utf-8?B?RFRJR1F2dmZDVmg0RWo2d014N1FvajM5NGpHNkpteVpFQkVVd1hZNEV6emVT?=
 =?utf-8?B?aUlqTDg3djJNeTdOYVBqT0dZYXhyYXNRZ21xM1BvTnVlTDdEaXZIVHlsSTU4?=
 =?utf-8?B?UkYvZzFkNDl4ek9VaUduREw5T2pVMTBBUEdXL2N4V0V3WXpQZmxWUEpOR0ZY?=
 =?utf-8?B?RTJIZlJ5T29RVDlXZGx4KzZNQUFHVVB1RHRYMGZJNjFNV2NvUlZWNVdQdTdn?=
 =?utf-8?B?ejR3YVhycHN1Y0RmTnhXSWNaSTVyeHZuWVQ5WEw1VnJKa2d6UmZsenZ4K2Rk?=
 =?utf-8?B?dExaM2dieGx0NEtOa0tGQVdJRS9NelVuTlR0NnNuWlhsUGFjSFd5VUpaUzhj?=
 =?utf-8?B?QjRMQ3RIbE4vWFBqY01NTFBIU3JNbHo1U3FRVUlyenFwMkxTSTVPSXZ3cTdx?=
 =?utf-8?B?djM4ck53VzdLMncwWlM4VzlvdDR1c01SQk5Hb1hsU0ErdlorenpvcmdhNGRE?=
 =?utf-8?B?cjlZWkdXdHZXSHlwcWpWL1d2d01kMGVqM1UwNlg2aGgvR0loOEo5Ty9nbDdW?=
 =?utf-8?B?RE8wb3VRU1NUOTdLVmluaGRKV2ppQng5bmQzWkpZMVZvU3N6WHN2VWNxazJk?=
 =?utf-8?B?MndTS09XNG9ZdEpYWW1wbDlFSDVwam5YUkJWQVpwUkM5SnA4WTJIYzVBbjZF?=
 =?utf-8?B?cGFkcVFYL2FPSlk5emlnTHpQSDlsbWNXdHpuM1o2UnJKdFlXd1VJVTZmUFRy?=
 =?utf-8?B?bThqY09ZUEN4M0Z2a1UvQ3dkWnV6OUFneUZaVGczVHVTbmJlSTVLQStDRE9B?=
 =?utf-8?B?LzBnbHFGbXZkNUFXVHRwNGZLak1vTFlVOWt3dWxENlYydGhxUG0zLzJGMHRQ?=
 =?utf-8?B?MFZ6dDJVZVVZbzRaZEU3QlJqdTZ5NUtleWhCeVVMeGFVSTBMU1plWUhhc1FQ?=
 =?utf-8?B?TWNHSnFlSmErdnBzOWFQTWRIbXdsbld2QzMrL0prNFRBSFgxMTBxU0VtbU1I?=
 =?utf-8?B?NEFpdmEwZ3haQTFvOGZMN2NzY1JncUp1WFNRVGQ4Tis0S3h5NEtwcS9VSDJW?=
 =?utf-8?B?dlJuajVGd20zNG5LKzNVdUk4Ync4RTJ5SW1xYjZsTmVxODhUQWhsRG9IZkda?=
 =?utf-8?B?alQxdkVBYjFZR1ZaWit4N291bEI2WHVVSE5HL1R3bGMzdHJmTUt0K3ovS2Vl?=
 =?utf-8?B?Qm9JRTZFc2MzZUNZNWdyaXJnVEM0NkRZQmdnZWFiVm9DWXJQQ2xpWEJuU3I4?=
 =?utf-8?B?UEZHL20xWWpwRzNWQzdDMWdVbXc0NlViUFBJKzFUVWRrZnllZW91SDR1cTB2?=
 =?utf-8?B?d3BRcUVtWElCTk1WR2d1c3pZUFMySWptNDV4N2pDdk9jeHhwS3pUcHBzNVBj?=
 =?utf-8?B?dEpGNzRkNE1TWlhZbE51d2tVNXJoMGZlcEN5WWs4WXFtdzhBNHdNNWlNbXo0?=
 =?utf-8?Q?VQMZL4ceLhngPFsVL4LbRjONR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe4f774-1fca-475a-03a8-08dc28b63ee5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4752.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 14:57:18.5474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MmsH3I+brArDbs2IKkzxcHkdaysq+MYKVV8+QUvZULtx/5+vNBavERtWswIfK+It7tFsCUIWdfWOqVKNun18HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8500
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

This patch is pending for a month now.

Can DT maintainers please help review this and provide feedback?

On 1/9/24 21:35, Supreeth Venkatesh wrote:
> This patch adds initial device tree and makefile updates for
> AMD Onyx platform.
>
> AMD Onyx platform is an AMD customer reference board with an Aspeed
> ast2600 BMC manufactured by AMD.
> It describes I2c devices, Fans, Kcs devices, Uarts, Mac, LEDs, etc.
> present on AMD Onyx platform.
>
> Signed-off-by: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
> ---
>   arch/arm/boot/dts/aspeed/Makefile             |  1 +
>   .../boot/dts/aspeed/aspeed-bmc-amd-onyx.dts   | 98 +++++++++++++++++++
>   2 files changed, 99 insertions(+)
>   create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts
>
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
> index fb9cc95f1b60..2b27d377aae2 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>   	aspeed-ast2600-evb.dtb \
>   	aspeed-bmc-amd-daytonax.dtb \
>   	aspeed-bmc-amd-ethanolx.dtb \
> +	aspeed-bmc-amd-onyx.dtb \
>   	aspeed-bmc-ampere-mtjade.dtb \
>   	aspeed-bmc-ampere-mtmitchell.dtb \
>   	aspeed-bmc-arm-stardragon4800-rep2.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts
> new file mode 100644
> index 000000000000..a7056cd29553
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright (c) 2021 - 2024 AMD Inc.
> +// Author: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
> +
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +       model = "AMD Onyx BMC";
> +       compatible = "amd,onyx-bmc", "aspeed,ast2600";
> +
> +       aliases {
> +               serial0 = &uart1;
> +               serial4 = &uart5;
> +      };
> +
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "console=ttyS4,115200 earlyprintk vmalloc=512MB";
> +       };
> +
> +       memory@80000000 {
> +               device_type = "memory";
> +               reg = <0x80000000 0x80000000>;
> +       };
> +
> +};
> +
> +&mdio0 {
> +       status = "okay";
> +
> +       ethphy0: ethernet-phy@0 {
> +               compatible = "ethernet-phy-ieee802.3-c22";
> +               reg = <0>;
> +       };
> +};
> +
> +&mac3 {
> +       status = "okay";
> +       phy-mode = "rgmii";
> +       phy-handle = <&ethphy0>;
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii4_default>;
> +};
> +
> +
> +
> +&fmc {
> +       status = "okay";
> +       flash@0 {
> +               compatible = "jedec,spi-nor";
> +               status = "okay";
> +               #include "openbmc-flash-layout-128.dtsi"
> +       };
> +};
> +
> +//Host Console
> +&uart1 {
> +       status = "okay";
> +};
> +
> +//BMC Console
> +&uart5 {
> +       status = "okay";
> +};
> +
> +&gpio0 {
> +        gpio-line-names =
> +        /*A0-A7*/       "","","","","","","","",
> +        /*B0-B7*/       "","","","","MON_POST_COMPLETE","P0_PRESENT_L","","",
> +        /*C0-C7*/       "","","","","","","","",
> +        /*D0-D7*/       "","","","","","","","",
> +        /*E0-E7*/       "","","","","","","","",
> +        /*F0-F7*/       "","","","","","","","",
> +        /*G0-G7*/       "","","","","","","","",
> +        /*H0-H7*/       "","ASSERT_WARM_RST_BTN_L","ASSERT_SOC_RST_BTN_L","","","","","",
> +        /*I0-I7*/       "","","","","","","","P0_I3C_APML_ALERT_L",
> +        /*J0-J7*/       "","","","","","","","",
> +        /*K0-K7*/       "","","","","","","","",
> +        /*L0-L7*/       "","","","","","","","",
> +        /*M0-M7*/       "","","","","","","","",
> +        /*N0-N7*/       "","","","","","","PSP_SOFT_FUSE_NOTIFY","ASSERT_BMC_READY",
> +        /*O0-O7*/       "","","HDT_SEL","HDT_XTRIG5","HDT_XTRIG6","JTAG_TRST_N","","",
> +        /*P0-P7*/       "MON_RST_BTN_L","ASSERT_RST_BTN_L","MON_PWR_BTN_L","ASSERT_PWR_BTN_L","HPM_FPGA_LOCKOUT","ASSERT_NMI_BTN_L","MON_PWR_GOOD","",
> +        /*Q0-Q7*/       "","","HDT_DBREQ_L","","BIOS_SPD_MUX_CTRL_RELEASED_L","","","",
> +        /*R0-R7*/       "","","","","","","","",
> +        /*S0-S7*/       "","","","","","","P0_DIMM_AF_ERROR","P0_DIMM_GL_ERROR",
> +        /*T0-T7*/       "","","","","","","","",
> +        /*U0-U7*/       "","","","","","","","",
> +        /*V0-V7*/       "","","","","","","","",
> +        /*W0-W7*/       "","","","","","","","",
> +        /*X0-X7*/       "","","","","","","","",
> +        /*Y0-Y7*/       "","","","","","","","",
> +        /*Z0-Z7*/       "","","","","","","","";
> +};
