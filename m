Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EFE65BC38
	for <lists+openbmc@lfdr.de>; Tue,  3 Jan 2023 09:29:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NmQrd6MLYz3c2W
	for <lists+openbmc@lfdr.de>; Tue,  3 Jan 2023 19:29:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=sQGxAHIb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.244.138; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=sQGxAHIb;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2138.outbound.protection.outlook.com [40.107.244.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NmQr00ydkz3bZk
	for <openbmc@lists.ozlabs.org>; Tue,  3 Jan 2023 19:29:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S40gBKc8hJByJSKstI2+puRTywqSWHtTSNk3Us9lWXp3Iy12xL5pSt/gDor38RprHFREiHCVEUpFm2JR3ZSUDRrzkx5Xwqumc8P0sqryA/BwuQhwvT+xGjbDMxL25AlokYjwaSbfRSZ4Y/plDikwax1jMKcbQhrI9C9VqMKF13If4pvlIqWosBU0R2fi73LPdyTMa0wuz2EFJ3UbW+jxMhaP6cZKeGFeTku4CrF1U7tzjGl34we16SMZCY6Ou09Exrne20if9MQBRqimM+5eqhkKkOnxAr8M+MOgKBZz54aSyFMuvH46itYW9EUfdFbFmEeYIkCZV8Ai/aGA6ZPi5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3E3WjOJ3W6i8OhJnnF7X89BksUZXiCXb9ZlCkSp1bI=;
 b=KESx6Nv/tF7fvxV2ldq/oX+Juo9EDxfkJGEhFq3IhkMUAGFWZ6WqbHCwZLf0I2F9SCxY6wNbsYMqLznfzLgrHLcOyrMzsDxM8q0Cr7NGgDWgRmw/zWT4kZPv3yMgIC1xZeATIe36VkJlCBL0mRIuz+feGeto8AiWJd9PqFTbO8TN5aCyTX341mIS4LXPPBE+1BfDVtF49NWR7CWZhL14qwB9U3HiSEb9FEWE2mfSs+R/nYGFZo6bpXlUiLCIqbNXIb3fOthSbMWtu/KY2tvx0/PzdXrXjyQn3Vq6TizvANRABlaTx7zJ9z6SoOiQigTlXsmBsVrfofok+x4VQdt2Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3E3WjOJ3W6i8OhJnnF7X89BksUZXiCXb9ZlCkSp1bI=;
 b=sQGxAHIb3eMxO1qLUqbW3Cuax9yRaZ1b41Y8bKpzo2O+yrlCgx+QLgC72mIlDcKWnzKPUeF7VGjar9S9SRC6NNbaLLI7xTq8rpi2y9n6muF8C8Ok/x9C9uJ39SvuqSfUuvD5RqRmHcdKM8glJ/u4yRiHe2KCGZPT2cb7ToZAXZg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 SN6PR01MB4751.prod.exchangelabs.com (2603:10b6:805:d9::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Tue, 3 Jan 2023 08:28:40 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::bf6:8038:9fe8:1588]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::bf6:8038:9fe8:1588%7]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 08:28:40 +0000
Message-ID: <d1bed86c-b0f2-1743-26d7-0fc71705d2f1@os.amperecomputing.com>
Date: Tue, 3 Jan 2023 15:28:26 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2] ARM: dts: aspeed: add
 Ampere's Mt. Mitchell BMC
Content-Language: en-CA
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Zev Weiss <zweiss@equinix.com>
References: <20221208065738.814805-1-quan@os.amperecomputing.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <20221208065738.814805-1-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:3:18::31) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|SN6PR01MB4751:EE_
X-MS-Office365-Filtering-Correlation-Id: a0a851df-88cf-4a93-6783-08daed648438
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	vWJtL6yPOIE9MZULzM9P+Ao83Dpw7UyK/aRdlRSP/B70MH4242bkEESr/JqmvSoRX91PVNCiev/kwKaH9DiPRD+VyaQn4ve2i9w6Lxk1YnrMGpwVkvRqvlHuLQ9oYv1LlZWB7ACcV/20/y4Xx+suqzA1ab0HsvBkc/iY4YVVUfNcDuFfS/vFmEJHJ8sQa/YRQ/fcLraBHOvyNlWQEo/yBAdGs2KZsrzEuzMxAbRnGHTNTcgY+tEbKWENXlX9i0COF4t0iic67sdP4FK4wJivScUJa/VZ72LA9g/PyXyF9DScGb6U/K43jfSbonYx8uWHfA5HtKdjau7h1oiRioYsqgsWppuclJlETzAD9rLYyFTE+zGoMPUcZqwAHSqSNOQzSa4c6Z+dTZdDyFr/K7GB9Wmt4R7QTxycbeKJqAy7z8lu2aiDh64mjmVfV2R/LCxa9gmc/OY+NEqVl8RS2FPl2sC7Y4Yvgo/W500/PkNchyAMCCWfYCRQRJxqGc2nTrHxSFTWFYL5U8Uaw2zi2yUAnumVrVYxj/AT00bLzrGXpc+pJu6J2oO3qq2FxptQ0D9FAenUOm78CWm36nzE6VvzZsNBfmXysuuZKuzbTdPvs7cVoY84yIjTCwLa+PfwGOLtgEcODL4QD6TuV0fWnOTNjvRa67mYha3LmMrL2mwv0hqgLzv7M8QsRK1GE4OC+buetgWe7hktgy7Py2lkY0QTMbtThp65wDAFXftpawuE6JQrsbSRvJNGoCwv66QagKrS
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(136003)(346002)(39850400004)(376002)(451199015)(83380400001)(2616005)(86362001)(31696002)(38350700002)(38100700002)(316002)(110136005)(54906003)(5660300002)(4326008)(8936002)(6666004)(2906002)(41300700001)(66946007)(66556008)(8676002)(66476007)(53546011)(26005)(186003)(6486002)(478600001)(107886003)(31686004)(6512007)(52116002)(6506007)(22166006)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?MGlvQlk3K3BOR2d6VzdZY1ZhWmQzRDJvelR3RW9OMTNvUjdwSTBqVnVXNU5O?=
 =?utf-8?B?eXRWQU9kcjZhTnRBTWQrRldPamNDVGFuN1ZnclVSTWhqTWpTcUxIMWJKUlVj?=
 =?utf-8?B?ekZmMEc2bjlqSmVKSTg4M0tmN1NvM2VUcC83VkRmNFFUcFJJcTZEUC9mY1pV?=
 =?utf-8?B?eXkySVphYnpsSWthSjZEVlZ4YitvcDVub3d2djFubkczelpFWno5em50U2FY?=
 =?utf-8?B?T3EwbmdoeWppLzcxQURicVd4dllWMWl4OStFeVY1SkNia2I3Qld3OUZiMjho?=
 =?utf-8?B?dlhoaHJLQXB2VWUzY1NQZjFydnh3eUVucmFqSytRbk1GbUFZVUtuMnUzY2Q0?=
 =?utf-8?B?dGZWNXMzYk9yeXJWZjRvaXJiM1d5VlBma3YybXFvdThlTklDRmRVSjZtY1hX?=
 =?utf-8?B?azdGdDN5L0h6WFZ4ejl6UnFucGhiTnpMRzJxaGhXK3llcGU3QXpUa0pZM2Fa?=
 =?utf-8?B?Z0Q5Q0hHeUl0cVJiaTF6TWQwSmZFQVM5M1IwbFFzSGltNWFOTW41ck96Tnph?=
 =?utf-8?B?a1p5Y2xJc083OXlzY3NycFZ5WC9mUml0VzNKTmVNdEZ1WEtBem9LV3haTXFU?=
 =?utf-8?B?QTlyU1lDcnhBTys4ajhhR3F3SWZIUEZzRHhka1B3YXhCQlpPKzJncEhQZDhZ?=
 =?utf-8?B?RVR5RWdzQk5NWlZiaWpKYjJpVEV1a1F1SjJyM3QzaERMSlFtb1BUbW11WE0z?=
 =?utf-8?B?Z01PMFdPNEY3eThUVy9lMlltZFhyQUtWeS9rdm9ETHNra1R3ZTNqcjZQRks2?=
 =?utf-8?B?eVg1UTBGTXpTVDhncDNUSEY2blpuQjZla2NrM1lXeUdkekxFSjdOanI4WkJo?=
 =?utf-8?B?MUkrbUhMZHU1UnI4N0dkQXNiVDNOeWtjR2s4ZCtlUUZTQzc2WTAvQzY3cDF0?=
 =?utf-8?B?UkYvSlVjSW53T2NURWFpa20zdDlndmNDNGowaTVZTTA4WnZSSitEUENKTytI?=
 =?utf-8?B?bmhhRzFPWG40dkYrNGFiN2p3U25zSDFyb2RCaXZsSzFjUGFreXlWK3FUdzZ1?=
 =?utf-8?B?NVVMS0hERVp2VGgwVmhZcUhWRnQ3eDNDTEdpSVdWeHV2RTNmUVRpRUswUHU0?=
 =?utf-8?B?MFBqTlZ5eFVLazU2cWRaQ3pNWWVTTDRVano5QW5XS005Mld1clFKOW8vMzhL?=
 =?utf-8?B?YUpId2JZcENDSGkvNFIrUnRWbGYyWWlUVC9hWlZ4VTB0ZDcwcjFoZ3RJZVVx?=
 =?utf-8?B?LzdLdlh0OTM1TUtNZERpTDUvbGkvaHgrY01ZQkxKLzlVQ2dLTXNmNERpOXJO?=
 =?utf-8?B?YnRPd0ZoQU1zYjJTcXZGRmQ0NHB2RUQ4REFxaStCOFZOSVlBRjBBbzAyMEFC?=
 =?utf-8?B?cmk3dXlLdFZISnBveUg4bHJXWFY1QXU2KzlrUWFxTGIrVHRvLzkvZC85MGFh?=
 =?utf-8?B?cWdjZ1EwdUFDS1lhZ0VCdXJ6aXhnZkViL1c2VFNvejRMbmN0Y0UyeDJGKytE?=
 =?utf-8?B?VVpud0ljbzZSWWFjUEJnSzNLUzRmQkNMcmxCY2dSOFpkanVXS1dqc24yeEhl?=
 =?utf-8?B?Q1hiejJKMkM5ZkQ3VHpTTVZFdy9DRmJQK0xxTjA0azhzRkdxWTBNVnN6RmZa?=
 =?utf-8?B?UDc1QkRSMVcyRFE3dE5MK0pNRk1aMVgyQkdweVdiOE9tR202R0w3RlA4ak91?=
 =?utf-8?B?OGdwK05uTi9JV2lvUEdKWEpwOG5vZVdWQWhEYzd3TXBiQkFwbWRyNmtRQTZV?=
 =?utf-8?B?VXZPWVZMYUZ4OUVVOE93d0JFMVgybStueGMzM2JwUlF1U3hhY0FqYWFlVTNx?=
 =?utf-8?B?anY5YitMeUM5TFVMc1ZLTmtHZmd3TDQwRmc5OWNmQ0xKT2JvT3BiOFNhNGU2?=
 =?utf-8?B?ejc1YlZtYSswYUE4aGNvT1kzK2xVRlVsMHVKVjlvZkdxVERyMHo2bTBLcC9D?=
 =?utf-8?B?Nm9jYVVyK3hleVVzRm1yc0lyY1h0dlp1ajlDa28zWDdtcTluTkl6b0JNL1FY?=
 =?utf-8?B?a3hEandrb2FtS01Nb1JLR2dIc2trWklZN295TWNodTZIOUViWlpTMnNpcEcr?=
 =?utf-8?B?V3NtNHQrbU41ZXlUa0d2SVNTWUI2enFvdlZDWTdVRmxJeVY2ZkxjR2FJSDZl?=
 =?utf-8?B?R0g5U2t1ekJxRkxNdGoyZDRPR05RY1l2S0FEUXdUYUdVRnFiYTZMSGd0Y0FH?=
 =?utf-8?B?YmxiVlNzVUdqb1hyTG9YczBpUmw2aFdpU1ZhbnJiVzZNNzNDamsvY29uRkdY?=
 =?utf-8?Q?q8024WN/jGOoo76TsGFDb90=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0a851df-88cf-4a93-6783-08daed648438
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 08:28:40.6833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 08dsAeKQXOJljHhwAsxBSZ1Sz6T5cg7mzW+6gT+yHni8gVncDSTjyIkp7RAsTxlvBjp++dFa693eSRy9SF79EMeOhmQleH78b+LkOfQJOFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4751
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
Thank you and Happy New Year,
- Quan

On 08/12/2022 13:57, Quan Nguyen wrote:
> Add initial device tree for Aspeed AST2600-based Mt. Mitchell
> BMC found on AmpereOne's reference platform.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> Reviewed-by: Zev Weiss <zweiss@equinix.com>
> ---
> v2:
> - Fix tab issue                                        [Zev Weiss]
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
> index 0000000000..ad95be43da
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
> +	pinctrl-0 = <&pinctrl_mdio1_default &pinctrl_mdio2_default
> +		     &pinctrl_mdio3_default &pinctrl_mdio4_default>;
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
