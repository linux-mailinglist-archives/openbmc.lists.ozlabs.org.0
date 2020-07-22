Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7892022A0F2
	for <lists+openbmc@lfdr.de>; Wed, 22 Jul 2020 22:52:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBnhG2DPrzDr2w
	for <lists+openbmc@lfdr.de>; Thu, 23 Jul 2020 06:51:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=nam10-mw2-obe.outbound.protection.outlook.com
 (client-ip=40.107.94.85; helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=supreeth.venkatesh@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-amdcloud-onmicrosoft-com header.b=DQy9GnJr; 
 dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBng94j0mzDqvn;
 Thu, 23 Jul 2020 06:50:59 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Se+W0IZPUc0N26y0674tx5ELGOs81HEY8Pxx+AHMRHMGXO6Ha8LqH4PHvswVK0nJ7QAIdEVz5eRRjEdOttzbTQ6oieNekKdIpM8uk7og15+LnC4YIYsGQaE67YWsBIfHhdd9Y1mp0NqHFXRdLYrVfTGQZoOT52X1NXZsVJV5AeHWT6spYMeuDytIepf9AthvVxbjVUTcufcuQCN0tIz+Ekbjf+mXh2mq0a0RU53gU7gwUxZHeQtZMM07rm+hCEEM08pNtpzBHXhSxmoAWV7NEPKbRdbpWHpIwdHD4E8DLq1+dvT4OuWqwxCz4N2RgARkVqz7VwNWWaacoblGxLkAuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6EO0HLubZy1uIG8n3A2KHEjE/7NlD5ikjA0GYgvMDo=;
 b=RtEYOpLaB3CzIHgwyI2296JNhM2ejgR2gBCrKksN/WnMerIQ++MwTBLJ/SRJF7YRbbI85CvrUt8fg1UDchM0i3DahWzDMpAZ5vJsyUbtxfScslDI84Ew33ZYQbEM84AZlKvOee3nLUnXKDog5/mTbRBY7cbmMtZDH41sLjVcr3UPJrwgUjOY93KTWTWZF00/EF3QEXOl6lMFvOuxQ277mEXk7A23wcmbT5MxRL7FWKm8TswnR48uXlFkqYOEL2pwNTwOxH0eRfXs5aBlSDGAiHeCLddEtSbTRREwIt62/6X1tobeoQgvoZdmetM/bzFrlDFD59JfRzititjRBiQoeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6EO0HLubZy1uIG8n3A2KHEjE/7NlD5ikjA0GYgvMDo=;
 b=DQy9GnJrxtoUa75GZxpb5ohTQRmKPv/QL6hO6XMW1woDGNtfmKS6tWqIIdKe8ETq4E/cJgGKblISwn8xlSDa/em9bEDkgoFB8vH1MyYTSQM3OOT4PYV5FS8tToq03o03sN4VnD9I7SpjhCxK2VP8IIIgzYeT6ZEdNrq4tK5oPLk=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4582.namprd12.prod.outlook.com (2603:10b6:208:26b::18)
 by MN2PR12MB4128.namprd12.prod.outlook.com (2603:10b6:208:1dd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Wed, 22 Jul
 2020 20:50:53 +0000
Received: from MN2PR12MB4582.namprd12.prod.outlook.com
 ([fe80::7d2d:b00b:bac4:a66b]) by MN2PR12MB4582.namprd12.prod.outlook.com
 ([fe80::7d2d:b00b:bac4:a66b%7]) with mapi id 15.20.3195.026; Wed, 22 Jul 2020
 20:50:53 +0000
Subject: Re: [PATCH 1/1] ARM:dts:aspeed: Initial device tree for AMD EthanolX
To: Joel Stanley <joel@jms.id.au>
References: <20200720160147.22339-1-supreeth.venkatesh@amd.com>
 <CACPK8XfBPb85uXyYiphD9uEUG6a+acAzEMAsfaenT3t0jqUWNw@mail.gmail.com>
From: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
Message-ID: <1671be30-83b3-9468-418f-1dda7881b032@amd.com>
Date: Wed, 22 Jul 2020 15:50:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CACPK8XfBPb85uXyYiphD9uEUG6a+acAzEMAsfaenT3t0jqUWNw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR01CA0036.prod.exchangelabs.com (2603:10b6:805:b6::49)
 To MN2PR12MB4582.namprd12.prod.outlook.com
 (2603:10b6:208:26b::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.236.108.111] (165.204.78.1) by
 SN6PR01CA0036.prod.exchangelabs.com (2603:10b6:805:b6::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.22 via Frontend Transport; Wed, 22 Jul 2020 20:50:52 +0000
X-Originating-IP: [165.204.78.1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 79e2739e-953d-411d-9ad4-08d82e80ec58
X-MS-TrafficTypeDiagnostic: MN2PR12MB4128:
X-Microsoft-Antispam-PRVS: <MN2PR12MB412871C42BD49C16B47D82B296790@MN2PR12MB4128.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jMbOhXwUg0A/wlq8Qgoyze6TT50NH0OetdXiUQEK3KYlv1/HEmlM4u88hAjeOPFwx+zy/Snjz/nxryDD48WIKdj9jcwaWNGN2pQpJbb2Yv9tRBcQxXkjmnE784UYv7XPQdHjwGwteqaUtkeh1tRVfXPEIzsxIZng2+EUfvvvc7Eq7DWS1eVm9sc1N1oi9XoJGnBAi5uowcW93yCqlZQezyVlTKpZsnRoJmnHRwobPZ5BMaZUYxlCh+GO1gWM32MXebom4RBJAMCOolo+6OFDXXQf4lUUy15Dpo+00vAgWtSh92ZXDIKGXe6WsHBrdSPgUxgm+5CwM9PyRrM5bNRWTaEUEL25ovv4f67NntLi/yaVWnIKphxemm+Dn4lr3zLeIkq5Hfg6SlmltZXhFjxWqayOZbrjj5oUU/cW1pL5T08Fk0zt45uR4uogW3OOiNPlqHQ9lryFt7oKefzZZ6kScQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4582.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(31696002)(66946007)(66476007)(45080400002)(66556008)(86362001)(5660300002)(478600001)(6916009)(54906003)(53546011)(8936002)(52116002)(316002)(16576012)(2906002)(36756003)(6486002)(26005)(8676002)(186003)(16526019)(44832011)(4326008)(966005)(83380400001)(2616005)(956004)(31686004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: YHVQuR7Ci+m3PQQOqwfIDOlQCGvXAOTPSGt/ivDzGAe1jBrYWtUOdrHdjtn4n8m6AlsIuwcD+cTNxSNwMkmecjkiPcKK1gkNjTlGLAelQY6udn+yvUOceAnUKweB2bR77q/n4tiM0/oH6Dot5DTSg73Ya9212xsqK9v0IieEFL/YT0KFuUC2CNJKcsc8W0iWexI5JPvTKwNht1zESSTjnagJA1quyuEt7S0hAGOWFPJ9oknhIqgZHOlRJbICNw8Wo025bwU22xOebl+NNptEtJw14/9h7D8SNmrQ+TVyx6UfbE4HwbHD/HdhBq8b4GQmdZwUBse2d5nriBdosrmQO06fLX7VG95nqdT2L2BzK+wFh5FuPS4kNnfn4K0FBLa6KbJAzsE4wxMzNFoUAZFQa2/7fKBvvbKyldbz8hVikY3iN0S1y7g9phlUzx11o0U3Nu1qobdG7YDym/NEsxVGxpYqfG7pVFi2BQGMu8cE5e8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e2739e-953d-411d-9ad4-08d82e80ec58
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4582.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2020 20:50:53.0588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bA2okDj7fDRUeDoJPUkLu5s9Lee9TIHecXC9Kvm6B13JS17nPVqlZc9tmaHEbHZWEZFKQ8QsIJN1ADvPloq7wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4128
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

Hi Joel

On 7/22/20 12:57 AM, Joel Stanley wrote:
> [CAUTION: External Email]
> 
> On Mon, 20 Jul 2020 at 16:02, Supreeth Venkatesh
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
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
Thanks for reviewing it.

> 
> Looks good. One question about the licence.
> 
> 
>> +++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
>> @@ -0,0 +1,209 @@
>> +// SPDX-License-Identifier: Apache-2.0
>> +// Copyright (c) 2020 AMD Inc.
> 
> Can you have a read of the licence rules and add a preferred licence.
> The rules are here:
> 
>  https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.kernel.org%2Fdoc%2Fhtml%2Flatest%2Fprocess%2Flicense-rules.html&amp;data=02%7C01%7Csupreeth.venkatesh%40amd.com%7C24e9c801e7e84cb2dd9008d82e042e60%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637309942787036878&amp;sdata=yHUh9uKH%2BYLpLI%2BPFVTJO%2FdXfQpRtSa2t3Hg5r3MGrI%3D&amp;reserved=0
> 
> This very hacky one liner will give you an idea of common licences
> used by device trees:
> 
> $ git grep -h SPDX -- arch/arm/boot/dts/ | cut -c3- |sort -b | uniq -c
> | sort -hr
>     579  SPDX-License-Identifier: GPL-2.0
>     305  SPDX-License-Identifier: GPL-2.0-only
>     222  SPDX-License-Identifier: GPL-2.0-or-later
>     188  SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>      91  SPDX-License-Identifier: GPL-2.0+
>      72  SPDX-License-Identifier: (GPL-2.0 OR MIT)
>      57  SPDX-License-Identifier: GPL-2.0+ OR MIT
>      46  SPDX-License-Identifier: GPL-2.0-or-later OR MIT
>      38  SPDX-License-Identifier: GPL-2.0 OR X11
>      29  SPDX-License-Identifier: GPL-2.0 OR MIT
>      19  SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>      16  SPDX-License-Identifier: GPL-2.0-only */
>       6  SPDX-License-Identifier: ISC
>       5  SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
>       4  SPDX-License-Identifier: (GPL-2.0+ OR X11)
>       4  SPDX-License-Identifier: (GPL-2.0 or MIT)
>       4  SPDX-License-Identifier: GPL-2.0 */
>       3  SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
>       2  SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause) */
>       2  SPDX-License-Identifier: GPL-2.0-or-later */
>       2  SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
>       2  SPDX-License-Identifier: (GPL-2.0+)
>       2  SPDX-License-Identifier: (GPL-2.0)
>       2 SPDX-License-Identifier: GPL-2.0
>       1  SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
>       1  SPDX-License-Identifier:  GPL-2.0+
>       1 SPDX-License-Identifier: GPL-2.0+
>       1   SPDX-License-Identifier: BSD-3-Clause
> 
I will modify in v2 of the patch and send it out.

> 
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
