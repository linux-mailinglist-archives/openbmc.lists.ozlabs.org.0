Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AFC22CEAE
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 21:32:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCzqh2jgwzF1Sl
	for <lists+openbmc@lfdr.de>; Sat, 25 Jul 2020 05:32:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=nam11-bn8-obe.outbound.protection.outlook.com
 (client-ip=40.107.236.77; helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=supreeth.venkatesh@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-amdcloud-onmicrosoft-com header.b=OaWqmroL; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCzpn4LkszDsN0;
 Sat, 25 Jul 2020 05:31:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QeTOf+ggIV+6wXAH9MjYrxR0lNoHidHU08EPXc48agZQIW4g67FEk0XJSu1345aywp8K3WOoIiycYQySPLs54UfU8X9beXlEu/gICjj667F++3KabiMuQcqBNjbvGDblcYbIdJlzshQPq7hqDw27bV/oZvoEVn4qGQLp24PLQe+cCM6Lvp3Uvv8atOxwzRZ1h9yhxqqaNPNg1f+UyUduQKtcmFl/CtmzOP7mMnQcCZW2lclamAbdVTPdPSRdKdtDVEld1PkbFSwlIT+QYXQVUSKM7d30r8AkUL5JA6B8eg1M+F24X7LyCB4Eak5WQM5saurPmVo8dNtm0w1OisBxhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBBjIusdRVgpTSrMK0nMZoMim80nwDVLuexox8fZR8w=;
 b=IZzqK3qaVdzi2/2fUpBXxc9Jxj7uWWWURXTFOZp3zaz28W0uUekLdeFyR67CFbJwr2i8r9SCxm+MRBLlIYkXooyHCXAcaHdU/+d7AzSDSs0PoaaTQzn1GpBIaMDcjXhoZkZ/RjDxh5MWAUDCFiWHy1eBR7jc4bxdND6Z/DyhtvRgEDp9rx8bd1rzSxtwifg3aG7H8/76p7oTaxnlp6pVtQRIbF+yqGNgi7fu1GdgEdXHh4eOu9ruuWWUwyvX467AGq8WTCXUQlEecJqb/bZa57vP8+CDKyPXtwNOSuXqmaHwffCKaB9fUUnNpv3Vy7qrIqgakNCGgWBkZGy/dJhDNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBBjIusdRVgpTSrMK0nMZoMim80nwDVLuexox8fZR8w=;
 b=OaWqmroL4P2ZMbWBHKHfMbYn9k0sAiyQbkLEJ++juOwqJBTidezDRrsCRMOqJBKkDEuMdPDPCmnB19r37n6i//jrO/G5bD4l2gDYGCzQ8Ew19wIjl5v1pCuN5VD0YH/CK06zWa46TQpC5sk5m1XxadWNxipzJE4S1DDAY0VV6yE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2542.namprd12.prod.outlook.com (2603:10b6:802:26::28)
 by SA0PR12MB4525.namprd12.prod.outlook.com (2603:10b6:806:92::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Fri, 24 Jul
 2020 19:31:39 +0000
Received: from SN1PR12MB2542.namprd12.prod.outlook.com
 ([fe80::7d62:9500:521b:40a4]) by SN1PR12MB2542.namprd12.prod.outlook.com
 ([fe80::7d62:9500:521b:40a4%6]) with mapi id 15.20.3216.023; Fri, 24 Jul 2020
 19:31:39 +0000
Subject: Re: [PATCH v2 1/1] ARM:dts:aspeed: Initial device tree for AMD
 EthanolX
To: Joel Stanley <joel@jms.id.au>
References: <20200722215506.5984-1-supreeth.venkatesh@amd.com>
 <CACPK8XeAr+Y1ySCa4DXeoHU-39eS2g38QOSgvbMk-VmbPk4cVA@mail.gmail.com>
From: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
Message-ID: <1038e552-7659-a093-33f6-238d3985b65a@amd.com>
Date: Fri, 24 Jul 2020 14:31:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CACPK8XeAr+Y1ySCa4DXeoHU-39eS2g38QOSgvbMk-VmbPk4cVA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM5PR19CA0018.namprd19.prod.outlook.com
 (2603:10b6:3:151::28) To SN1PR12MB2542.namprd12.prod.outlook.com
 (2603:10b6:802:26::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.236.108.111] (165.204.78.1) by
 DM5PR19CA0018.namprd19.prod.outlook.com (2603:10b6:3:151::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.23 via Frontend Transport; Fri, 24 Jul 2020 19:31:38 +0000
X-Originating-IP: [165.204.78.1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 607d8ca3-ca8d-4a00-efe6-08d830083004
X-MS-TrafficTypeDiagnostic: SA0PR12MB4525:
X-Microsoft-Antispam-PRVS: <SA0PR12MB45252B64241A2EEBB371619796770@SA0PR12MB4525.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BEj1EzvyIsQsGTqgZ9DsT2axpXjGVyiHgTj3npArgNH48e47hBzozK17Pyf3rT6E7EK9S75bQikooGY/qCq77l/0ZcVPj1SPs2+smMR9stdS5C8iQh03a+bkVQtYMk6pVhUS97DKEvKNnncopmXgpX0vCEWEVkWtYZazy9bSgYBOzRg0tJMJeJNQKAdgJS2u8Vh19VWVcody2QiYdg5l6RWFP6q1daQN/2TX8WZVBwolb2EZmUHcfcNqGVtZ9s3H7bNRPAx00O9ICXhbCYeavK+kDFdhZOyDuxXUm657FPMSSPdaWZQz6UfEFosJ5k60JbEU/EWyASmfM6EXhbFlU7D9tnyX9/e+duBjxcjVCHd8ZrDLLhyPiOjry8qHuavV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2542.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39860400002)(366004)(376002)(136003)(396003)(4326008)(16526019)(31696002)(186003)(2906002)(52116002)(26005)(86362001)(5660300002)(53546011)(54906003)(8936002)(66556008)(83380400001)(36756003)(16576012)(956004)(6486002)(478600001)(8676002)(66476007)(66946007)(2616005)(31686004)(6916009)(316002)(44832011)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: gqS2CsxH+v3grJ9GmCtZ69cTrcLIVLQnmaDUyDbd9lN7n1SyOi0YM+jQHgg8LfqQZvG+pWbSI5v6ayTTPO5tepXhMfFWpSHILnk7qCvucv71/M3ymZKEZ5yxJ++RCiF59e0quZ4g8fUIc7ceWXJesj6f7FVf+PWIqrftT44dj8MxpWyVeOwjm6L5zg+2t1VelMVF1hPlsxF1Y6C4R3zNWGDf8mLCAf/vXfFsF+mKDuCn0urCTx/szFVY5q3Nli2mix0Ke2I4uBpDjlbTXtEtvGmGWbDZ5IVuHR0wvzuk13SSKpMjyhxHSV9G4LKKgz7z2Jtla3e3ooq9k2P0zsq8AuesN0ZDD+rpkaJcN/x6iz6Qh7XrTFoCzmbI81/NbDVD+TiTDiu53t8XgjfMsjweCy2q4ThF9s7hYGbBPiecoJfJNZhX7+ZcL+Ypfhkn4G79trf2ds5U8gEOe+z6TGlmcCya2Vee1Zq1t1dbOm6ZEG0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 607d8ca3-ca8d-4a00-efe6-08d830083004
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2542.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2020 19:31:39.8165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PWiPkCR2dxVgHqfogxCcjNwPvcd87ufBEX9jOUdrnDumX9HuMbghOtvcetiXSsyrb7cNBc9rz/Ws+0+HxIpthA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4525
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 7/23/20 2:23 AM, Joel Stanley wrote:
> [CAUTION: External Email]
> 
> On Wed, 22 Jul 2020 at 21:55, Supreeth Venkatesh
> <supreeth.venkatesh@amd.com> wrote:
>>
>> Initial introduction of AMD EthanolX platform equipped with an
>> Aspeed ast2500 BMC manufactured by AMD.
>>
>> AMD EthanolX platform is an AMD customer reference board with an
>> Aspeed ast2500 BMC manufactured by AMD.
>> This adds AMD EthanolX device tree file including the flash layout
>> used by EthanolX BMC machines.
>>
>> This also adds an entry of AMD EthanolX device tree file in Makefile.
>>
>> Signed-off-by: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
>> ---
>> Changes since v1:
>> * Addressed review comment regarding SPDX License Identifier
>> * Added I2c0 and I2c1 which cater to AMD's APML Interface
>> ---
>>  arch/arm/boot/dts/Makefile                    |   1 +
>>  arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 221 ++++++++++++++++++
>>  2 files changed, 222 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index d6dfdf73e66b..55ed881d2ebc 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -1281,6 +1281,7 @@ dtb-$(CONFIG_ARCH_ZX) += zx296702-ad1.dtb
>>  dtb-$(CONFIG_ARCH_ASPEED) += \
>>         aspeed-ast2500-evb.dtb \
>>         aspeed-ast2600-evb.dtb \
>> +       aspeed-bmc-amd-ethanolx.dtb \
>>         aspeed-bmc-arm-centriq2400-rep.dtb \
>>         aspeed-bmc-arm-stardragon4800-rep2.dtb \
>>         aspeed-bmc-facebook-cmm.dtb \
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
>> new file mode 100644
>> index 000000000000..3d67fa31a3ab
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
>> @@ -0,0 +1,221 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// Copyright (c) 2020 AMD Inc.
>> +// Author: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
>> +/dts-v1/;
>> +
>> +#include "aspeed-g5.dtsi"
>> +#include <dt-bindings/gpio/aspeed-gpio.h>
>> +
>> +/ {
>> +       model = "AMD EthanolX BMC";
>> +       compatible = "amd,ethanolx-bmc", "aspeed,ast2500";
>> +
>> +       memory@80000000 {
>> +               reg = <0x80000000 0x20000000>;
>> +       };
>> +       aliases {
>> +               serial0 = &uart1;
>> +               serial4 = &uart5;
>> +       };
>> +       chosen {
>> +               stdout-path = &uart5;
>> +               bootargs = "console=ttyS4,115200 earlyprintk";
>> +       };
>> +       leds {
>> +               compatible = "gpio-leds";
>> +
>> +               fault {
>> +                       gpios = <&gpio ASPEED_GPIO(A, 2) GPIO_ACTIVE_LOW>;
>> +               };
>> +
>> +               identify {
>> +                       gpios = <&gpio ASPEED_GPIO(A, 3) GPIO_ACTIVE_LOW>;
>> +               };
>> +       };
>> +       iio-hwmon {
>> +               compatible = "iio-hwmon";
>> +               io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>, <&adc 4>;
>> +       };
>> +};
>> +
>> +&fmc {
>> +       status = "okay";
>> +       flash@0 {
>> +               status = "okay";
>> +               m25p,fast-read;
>> +               #include "openbmc-flash-layout.dtsi"
>> +       };
>> +};
>> +
>> +
>> +&mac0 {
>> +       status = "okay";
>> +
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_rmii1_default>;
>> +       clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
>> +                <&syscon ASPEED_CLK_MAC1RCLK>;
>> +       clock-names = "MACCLK", "RCLK";
>> +};
>> +
>> +&uart1 {
>> +       //Host Console
>> +       status = "okay";
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_txd1_default
>> +                    &pinctrl_rxd1_default>;
>> +};
>> +
>> +&uart5 {
>> +       //BMC Console
>> +       status = "okay";
>> +};
>> +
>> +&adc {
>> +       status = "okay";
>> +
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_adc0_default
>> +                    &pinctrl_adc1_default
>> +                    &pinctrl_adc2_default
>> +                    &pinctrl_adc3_default
>> +                    &pinctrl_adc4_default>;
>> +};
>> +
>> +//APML for P0
>> +&i2c0 {
>> +       reg = <0x80 0x40>;
>> +       status = "okay";
>> +};
>> +
>> +//APML for P1
>> +&i2c1 {
>> +       reg = <0xc0 0x40>;
> 
> This is unusual. i2c1 is at 0x80; this will clash with i2c2.
> 
> Note that the i2c naming in linux counts from zero, whereas the ASPEED
> docs count from 1. So if your board layout has I2C1, you actually want
> i2c2 in the device tree.
Thanks for catching this. Patch v3 sent.

> 
>> +       status = "okay";
>> +};
>> +
>> +// Thermal Sensors
>> +&i2c7 {
>> +       status = "okay";
>> +
>> +       lm75a@48 {
>> +               compatible = "national,lm75a";
>> +               reg = <0x48>;
>> +       };
>> +
>> +       lm75a@49 {
>> +               compatible = "national,lm75a";
>> +               reg = <0x49>;
>> +       };
>> +
>> +       lm75a@4a {
>> +               compatible = "national,lm75a";
>> +               reg = <0x4a>;
>> +       };
>> +
>> +       lm75a@4b {
>> +               compatible = "national,lm75a";
>> +               reg = <0x4b>;
>> +       };
>> +
>> +       lm75a@4c {
>> +               compatible = "national,lm75a";
>> +               reg = <0x4c>;
>> +       };
>> +
>> +       lm75a@4d {
>> +               compatible = "national,lm75a";
>> +               reg = <0x4d>;
>> +       };
>> +
>> +       lm75a@4e {
>> +               compatible = "national,lm75a";
>> +               reg = <0x4e>;
>> +       };
>> +
>> +       lm75a@4f {
>> +               compatible = "national,lm75a";
>> +               reg = <0x4f>;
>> +       };
>> +};
>> +
>> +&kcs1 {
>> +       status = "okay";
>> +       kcs_addr = <0x60>;
>> +};
>> +
>> +&kcs2 {
>> +       status = "okay";
>> +       kcs_addr = <0x62>;
>> +};
>> +
>> +&kcs4 {
>> +       status = "okay";
>> +       kcs_addr = <0x97DE>;
>> +};
>> +
>> +&lpc_snoop {
>> +       status = "okay";
>> +       snoop-ports = <0x80>;
>> +};
>> +
>> +&lpc_ctrl {
>> +       //Enable lpc clock
>> +       status = "okay";
>> +};
>> +
>> +&pwm_tacho {
>> +       status = "okay";
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_pwm0_default
>> +       &pinctrl_pwm1_default
>> +       &pinctrl_pwm2_default
>> +       &pinctrl_pwm3_default
>> +       &pinctrl_pwm4_default
>> +       &pinctrl_pwm5_default
>> +       &pinctrl_pwm6_default
>> +       &pinctrl_pwm7_default>;
>> +
>> +       fan@0 {
>> +               reg = <0x00>;
>> +               aspeed,fan-tach-ch = /bits/ 8 <0x00>;
>> +       };
>> +
>> +       fan@1 {
>> +               reg = <0x01>;
>> +               aspeed,fan-tach-ch = /bits/ 8 <0x01>;
>> +       };
>> +
>> +       fan@2 {
>> +               reg = <0x02>;
>> +               aspeed,fan-tach-ch = /bits/ 8 <0x02>;
>> +       };
>> +
>> +       fan@3 {
>> +               reg = <0x03>;
>> +               aspeed,fan-tach-ch = /bits/ 8 <0x03>;
>> +       };
>> +
>> +       fan@4 {
>> +               reg = <0x04>;
>> +               aspeed,fan-tach-ch = /bits/ 8 <0x04>;
>> +       };
>> +
>> +       fan@5 {
>> +               reg = <0x05>;
>> +               aspeed,fan-tach-ch = /bits/ 8 <0x05>;
>> +       };
>> +
>> +       fan@6 {
>> +               reg = <0x06>;
>> +               aspeed,fan-tach-ch = /bits/ 8 <0x06>;
>> +       };
>> +
>> +       fan@7 {
>> +               reg = <0x07>;
>> +               aspeed,fan-tach-ch = /bits/ 8 <0x07>;
>> +       };
>> +};
>> +
>> +
>> +
>> --
>> 2.17.1
>>
