Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E60631A59
	for <lists+openbmc@lfdr.de>; Mon, 21 Nov 2022 08:34:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NFzg63GQHz3cKv
	for <lists+openbmc@lfdr.de>; Mon, 21 Nov 2022 18:34:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=bg3Qu2uf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e89::72a; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=bg3Qu2uf;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2072a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::72a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NFzfS4Bj1z30Qt
	for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2022 18:34:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uec6xrXuJ80xZzjEcvLsEXUOVffZ7uFJtDBetXy+4gGDsy0EeKaEDkNXx804Lz9b7YwmBBe8/umz/VaDqSejWZJL6KgKOK2Y8E9ZWOb+4ff3IZJ32UKeFr/Hp0jAuFkZsFAg+yuXUwB8svhYqcVRduKvhWBc9FZ9CToLK42vj9V7kqzf0YdI8gzYw5gn6KVQcIkatZhJEJIeDDl/s27T9BLNlEStLfQeqsythfJPSblnkjoRU+bJGgWn6YIrDnNu/BMHFyWcOunCwS85j2fakyvqTeP6DnFES+Y2uAJ/R3MeXT7dVVbDSeww3OAEmxYKjtEksFfys5w38xyuVhMslQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxhVXiU3uNy4DkhzZa8axfEyqSADOm0xgSfKHSoUOTs=;
 b=eVAMNq+ulztZCzGKMS+69U0N28cnbOE1ozezjgrrDS9GH84FR6DubLg6OZDpwoRvafukrTGOEqMp3cpUgLhqSYqRFrw9CzTTliJOjhQ/RXXEz96Sz9LJs6ShmWKDG20QyW/+Vr7Fw1ceW66XZcNmB9S7wflZwb8eHUixvsi5jMg6xEpmX3MgPn814G+j8tbm/7i/msk0V5KvbTnps9FxwGkTAUIxGzlf5ATJv8S7scV3/FeieJZ8r80yrFlCZPZULCBkwqHG+SUxS+c2DaMo9zBdPd87+EFwUh1GnvzvxZ27MjxvC0ufWTK9qHujkfIZDPVIxXO58UrDazxe/7LEsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxhVXiU3uNy4DkhzZa8axfEyqSADOm0xgSfKHSoUOTs=;
 b=bg3Qu2ufnf3V84juMINnFGBUQ6rHibebTRitrplk07k0zp6sQ7beGG5VBF/aeH9KVDkmTexZv1Y2jXQeqzcGWgg+Tz4mHwKdVKHZtj6MaK9cxF7Jvd8JDUB1oupEx/vQWlQtgZd9/ZfKp7zHpB6DSMrx6ybqCkqW8F8pMj6CdmE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 DM6PR01MB4569.prod.exchangelabs.com (2603:10b6:5:7c::22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.18; Mon, 21 Nov 2022 07:33:42 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::df7e:7f53:a83f:a86a]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::df7e:7f53:a83f:a86a%4]) with mapi id 15.20.5813.016; Mon, 21 Nov 2022
 07:33:40 +0000
Message-ID: <f934da7e-5af6-9f81-bea9-e120d022c257@os.amperecomputing.com>
Date: Mon, 21 Nov 2022 14:33:20 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] ARM: dts: aspeed: add
 Ampere's Mt. Mitchell BMC
Content-Language: en-CA
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20221107071348.3996144-1-quan@os.amperecomputing.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <20221107071348.3996144-1-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::6) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|DM6PR01MB4569:EE_
X-MS-Office365-Filtering-Correlation-Id: 687b1a89-ca98-416b-cd1d-08dacb92b4ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	PVDjwO2/AsTfzpyYzCxZ73GbQfwVCdlD81Wq/55aijJAY2+tYG28TVXGRIGOCYASK7qHfepWPBkg26o7qqacYDNBjmViFAi+EOGK5EcLEp0wdk2q+UPuqQRyFXMQqgcJmbnctbosCpuZsek8EsdLZef0m1JdJ1oUbmQJ6nJSDWMqY8QO4ubD3FP65i4dQBn5MXD5jrZm/hoRypSHTOOMdeYobGIBhOzQrlyZIDJU5NCQnLWa2SQXABGHgZ6UVTr7WhVHyg+1SlcLhrUG0mHNPbR09fWTJxNFeazyKeW9ISdfzvJXcSiVhILpAA+ZYSsS22OU66oNFIPHXBakOlSTK12DqvpJMgSAf445wqN7IlBuaJEBz4qcVrXEnmNu4ntcK6VXTxuhKeou5r8huOXISSkUMWvXPbbSjtfykEwy6gRCE8jOa7KQsl2G5ewSJv+T61TZzlAenVtE7cUwrMfC0LEDS5jaaxS5LfG36HvS/Bof9EETL0yEo8nHUpIXB3PQR6CYofiWTwfYPA/ZwJBLje9NpOPw2vqfgTKcMpwBP0ilKR5miACf7Iz+J4WpmV7aYCdFeBWvoT97YW/om8g7Oht9dp+xGRDQXFT1QB+GpvAm7ZuYhdwpCMQPu7NisB+mow/Izz/seW+mBDR9c5Rul0lxxKgORLxoGmJ8PQl4QsOJOfFNO5q36hfk7oTujuu7+wjkZzVnP5RnqEJIN8ePJg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39840400004)(136003)(366004)(396003)(346002)(376002)(451199015)(186003)(6506007)(66946007)(83380400001)(66556008)(26005)(8676002)(66476007)(316002)(6512007)(2906002)(478600001)(41300700001)(5660300002)(6486002)(2616005)(6666004)(8936002)(107886003)(4326008)(38100700002)(31696002)(38350700002)(86362001)(54906003)(53546011)(31686004)(52116002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?V2hBK0czVHRsbWFOTFpCK2VFWUVJUStIN3diT01aanZ5SkVDL1M5TCtlMFh2?=
 =?utf-8?B?Z1F5OHM2RkMxMTN1Yy83Z2hQQnNUV2htQXR0WkxkaGVzTHArL2w5R3pRNFAw?=
 =?utf-8?B?T2ZPcldYVCs3RkZpTk9KRk9uQ3I3QkIyY3gweGhuUWxmR2ErY3UySjBWc3lF?=
 =?utf-8?B?WVU5aGVPSDkva0FpL3pzTkR5Mis2M2tIWHZoZzhIbkMySkNpZ0xaeTRpMFla?=
 =?utf-8?B?bXZNMmVXeUJ0aVNBaFlnZEZyQU55S2p0Z0R6UUprQ2NIQ3h6R2ZGYTZ4MGNo?=
 =?utf-8?B?NHBFN2t5UWR1SmlRejFBZDlWNGthR25ydlBZVFEzL1huTUIzcXRxTmUwSDB1?=
 =?utf-8?B?ZDdOOEpUakJ6TStkZzNEb2xlWlBjOVVzVjdDcHYxUURoM3ZUa2NpZXkwR3FW?=
 =?utf-8?B?U1d5Yjcxc1VyeHZQdXFOR1J2Sm01ZWJDSy9DS1kwVGFPa2wxNWcvWCtoOTc4?=
 =?utf-8?B?U3lqbzFWTmxvRko4c0JYemlla0ZwTXdqRGcxSXlRWGQzS2JMWHllbkJRc2Ji?=
 =?utf-8?B?ek1EckMzcFNWRVliMzRHeG40ZmJPN2JwSVRoT0JqQll5QkhZS0hwc3V6d1lJ?=
 =?utf-8?B?RVNUbVZoaXQyZjA4UEZHUGhsSEdobmZCTnE2MERTS01mK2RzM01HTWQyTHFx?=
 =?utf-8?B?Sm5nVWdkWnliVGozT3lXcjYvaFV5dEZiMlRveUVTemRFWEhWK0tINElDa2dZ?=
 =?utf-8?B?d29QeC8rYUpKUnNib28ybUNCRTdFWmo0amJNdmQ1SXBKUjEwWkpMc3pCNjY0?=
 =?utf-8?B?R2dwRkpoVTl5UjNKQkZ6cFBya3VONnY4MlR4SHZLT1hRR1lUNjZqWEcvL3NF?=
 =?utf-8?B?eWZPU3NWZmd1NnMzWDFVQXBhd3NpQ05kdm9OcEFnUGxQR2VERVdpTzNXT3BO?=
 =?utf-8?B?US9xWVl4TGpsWGY3TlV4ZkVNeitRTUJJQm1GMnRSWXg2NTAwdzQ1NzBSMXNr?=
 =?utf-8?B?YmZjTkxsUzl5VUpvbUVSYm9mcm9QSE52dDlaMUYzYmhYb1IvK2ovajR4OUZu?=
 =?utf-8?B?RFltNmJvb0dxRGpZbUFMUG90bDEzRDR4NVJCVWtkYkx0RFk5VkdZdy9LVUlu?=
 =?utf-8?B?aVZ5Nkw5djVmYUk0Q1dDZldFODEzeGNvV2JPQ0dDWjRpdnBkbVdWeU5HTm5s?=
 =?utf-8?B?QWFQQUkybEFlWFE5ZVB0MmVXSVoxclNHTThQR1lzQ3VjeGFuZ2tUSWR4Y0Yz?=
 =?utf-8?B?K3BacTBlZW5xZTdSQmRxdy8ydUhabkhJWjBteXUzaUpad096aDBLeWMwYkNi?=
 =?utf-8?B?K3JvaCtuZ04vRFZ6YjJicjhCVWMyN1VGQjY3RHVVaDFZdmJRdTRrdzRnam4v?=
 =?utf-8?B?VjBDWmtiM1hzK1gxbWdtMTBOcThzOTBiMUtuclgvWlFCak9keWNTVFYxNlQ5?=
 =?utf-8?B?Z0p2SDNiY1RpYzVZSFFvZTIwdUpLemZCZ0NCTUtUOXltVVFhdWtwRDRhUHIx?=
 =?utf-8?B?ckVrVThtb0JGRFNUd21kY05ZV3MzZE10a1Zkb3JkQ1RXRzBWVFFTeHczOTM1?=
 =?utf-8?B?OEdlZXJUWlFtVGNkeHh6TUcwN2VIYk5Oby81US9yK1FoeXBXR1RWOEF4WDNp?=
 =?utf-8?B?WVdNbldpK1ZJSG5ZUjJuZ3JXWFZUZUZVZE4yY1FZL1Bmc01uWXAxVzdwZ2FK?=
 =?utf-8?B?K05MOW1NN25EdjF6QjgzVjZKZVVEeHExVFNHUXRIWHVXZ2FMc3UvMjRmYi9U?=
 =?utf-8?B?K1NnODZOS2c3VkdaTVBnemwrSGRwSjlWV3p5ZmhmcWVCNHc4R3k5MTRSSTg0?=
 =?utf-8?B?TEZsQU0vVjEySG9XR1pxa0lhdWdFZ3BsQnNsclBoSlgzU2xCMTlISklmVjRw?=
 =?utf-8?B?ZVpiSk1Ja3lBZUUweGg5SWtySkg5ZEF5blkxN3ZvVEFyRkRMbmljWWJpMi9p?=
 =?utf-8?B?ck5paWVJRHMzSDVVa1lRd0JsSWJCbEZCMXc0cUhydytncng0Z3hDanEzZVRH?=
 =?utf-8?B?MWEvcW9tWE5RSDBUVXpOZ2tJRnEwQXNVcTAxMzJsSXVYd2M4bU9DZTFmS2pP?=
 =?utf-8?B?QWNaSHMvTUpGK2NjYUsrYytBQXQ1ejRsZUdSeGNVSTJmOTd6WjhWSWs5M21B?=
 =?utf-8?B?S1Ywd3Z2MzdlSWU0aFowbmZLdTVYZUl1UEwrNVdFT3VvazM5QnBrZm9DUnhB?=
 =?utf-8?B?bnpjZEZwRUpxeXJOazJ0Y1N3bDJmV0pRMWdQd3hUSXB6VSsybDlvRFhudkRK?=
 =?utf-8?Q?sGDINoKjNrWz8rA44zZ/yx8=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 687b1a89-ca98-416b-cd1d-08dacb92b4ab
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 07:33:40.3651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XfVGsTB8UjY9FA4b82QzI+Jxuy9kPnSeYH24subQszYHp9oQwy+zUqYMEi0GWqmKARVWaNkM4CizfatiDc7NUXIgnOu2gmMnbt158ixa658=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4569
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
Cc: Open Source Submission <patches@amperecomputing.com>, Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Just a gentle ping on the patch.
Thanks
- Quan

On 07/11/2022 14:13, Quan Nguyen wrote:
> Add initial device tree for Aspeed AST2600-based Mt. Mitchell
> BMC found on AmpereOne's reference platform.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
>   arch/arm/dts/Makefile               |   1 +
>   arch/arm/dts/ast2600-mtmitchell.dts | 114 ++++++++++++++++++++++++++++
>   2 files changed, 115 insertions(+)
>   create mode 100644 arch/arm/dts/ast2600-mtmitchell.dts
> 
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index 6c34b83336..b6f9df21fc 100755
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -687,6 +687,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>   	ast2600-dcscm.dtb \
>   	ast2600-fpga.dtb \
>   	ast2600-intel.dtb \
> +	ast2600-mtmitchell.dtb \
>   	ast2600-ncsi.dtb \
>   	ast2600-p10bmc.dtb \
>   	ast2600-pfr.dtb \
> diff --git a/arch/arm/dts/ast2600-mtmitchell.dts b/arch/arm/dts/ast2600-mtmitchell.dts
> new file mode 100644
> index 0000000000..69ed0c5fbc
> --- /dev/null
> +++ b/arch/arm/dts/ast2600-mtmitchell.dts
> @@ -0,0 +1,114 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) 2022, Ampere Computing LLC
> +
> +/dts-v1/;
> +
> +#include "ast2600-u-boot.dtsi"
> +
> +/ {
> +	model = "Ampere Mt.Mitchell BMC";
> +	compatible = "ampere,mtmitchell-bmc", "aspeed,ast2600";
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
> +	pinctrl-0 = <	&pinctrl_mdio1_default &pinctrl_mdio2_default
> +			&pinctrl_mdio3_default &pinctrl_mdio4_default>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	ethphy0: ethernet-phy@0 {
> +		reg = <0>;
> +	};
> +};
> +
> +&mac0 {
> +	status = "okay";
> +	phy-mode = "rgmii-rxid";
> +	phy-handle = <&ethphy0>;
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
> +		compatible = "spi-flash", "sst,w25q256";
> +		status = "okay";
> +		spi-max-frequency = <50000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +	};
> +
> +	flash@1 {
> +		compatible = "spi-flash", "sst,w25q256";
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
