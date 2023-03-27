Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B55C46C9B0E
	for <lists+openbmc@lfdr.de>; Mon, 27 Mar 2023 07:45:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlMGm3nP8z3cdL
	for <lists+openbmc@lfdr.de>; Mon, 27 Mar 2023 16:45:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=7DHl7uqk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eaa::71c; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=7DHl7uqk;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2071c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::71c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlKDY1MJwz3cDG;
	Mon, 27 Mar 2023 15:13:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNmqOd+Pa/l4y5LOyz2q+/TN4F9dY+zJYdwngoWeAbEVEynk+CjCl/QEbAQpiMj0z5eC5NZc5J8/0ivqn/KMRWCJ0THR4RurNrqXOwPmZWoka+PTib4bO+TIgU77w+PLdUAa2UWjg47c96DEuCPoh/cjf58oUvI+pTzMbxN7A9jEfo+L8y2STOBqnW7Dh+LPSd4UKH3KRt8vvx4BbPKLZGbQFVYzl1YJmIR5ia6vae2fQkC/ruTrmdzlKfhvzARIJHmtsFtp1dqNCMEVeGjn8iNo4vwWm1+0MDKHb219vjcSWV+YGsNMBeAYpFXNp/6K6sc5IupY4KTqksHOWyPbrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wpHvpJ1IYNc8j6UBHxZVoksVXWxseqw+K41QbokUMXo=;
 b=iq+7sBFLXCZXt387LdiI+Dtf4zhkWXSZZuzQgv5rF/+1FpFdgkpK06yLQD35eagIUuk6oPXspNsy5/xg0HRWUUkLXp5/x8lEP8WWMDXnQqKW+Cr9ycTfQRrPQoMsRJfVN0TtNfEfeCGWeXIXOqVPy26BerpDDpBYOh/Mlcx8OoCxoIclQHuMpmHHJpp2teFVWXwslsQImt5YnjgaBRe2N63TjusKPWjJnZ0FxLg7wIBjBz/KBoqOrw0jFCEQwe82NpxmiHabPb9v2JKaDB/E59zA65PkL+z98T2mPaEAeSdONbW1rpNpGWGSsMrFjXLYnh5AHQBEwPmBQvYbq+EeNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wpHvpJ1IYNc8j6UBHxZVoksVXWxseqw+K41QbokUMXo=;
 b=7DHl7uqkeq9K4nnfzJLwFOzO5wL7MnVZYSnYRRIk8M7Gutsipf/r94PF71U3zWzFujEeMANbIgcCBEXCquRbPoteuPPGvyT8iWNVovPu/GwRTjc9EZUIh4Si5bmxfQFLVOvdnNDuILRM27F1luDoMJ66DM3hu/39w0bz/DUij8c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from SN6PR01MB4973.prod.exchangelabs.com (2603:10b6:805:c4::13) by
 BYAPR01MB5112.prod.exchangelabs.com (2603:10b6:a03:1e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.16; Mon, 27 Mar 2023 04:12:52 +0000
Received: from SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::cc68:95c1:33f7:57e6]) by SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::cc68:95c1:33f7:57e6%5]) with mapi id 15.20.6222.030; Mon, 27 Mar 2023
 04:12:51 +0000
Message-ID: <df563be9-cde5-2cd5-1db0-6a1d5e100a06@amperemail.onmicrosoft.com>
Date: Mon, 27 Mar 2023 11:12:42 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] ARM: dts: aspeed: mtjade, mtmitchell: Add OCP device
 temperature sensor
To: Chanh Nguyen <chanh@os.amperecomputing.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20230218171002.8725-1-chanh@os.amperecomputing.com>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <20230218171002.8725-1-chanh@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0133.apcprd02.prod.outlook.com
 (2603:1096:4:188::18) To SN6PR01MB4973.prod.exchangelabs.com
 (2603:10b6:805:c4::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4973:EE_|BYAPR01MB5112:EE_
X-MS-Office365-Filtering-Correlation-Id: 772d2f0f-6154-4da8-ca14-08db2e798815
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	G7vCxrswFubwZ558RA+KCnCBV83cTapSL8yjYrkzHkUnuANzzAjAXROtlI8GNzK4nOX6Vgr65eUpd5dxvq9+4dajwhnvPLmXKO4P94oXegXu0Q9Z6+/QV5M5CmlI7mcuR94AgApqyRv2UpemBKNXWk74WCehR84kVoU9vULa3L7GwrLmWWCNWhcw6h3+UInxzVIL85lfzlX21tzAWcWH3ZfTiEc4Tyggrl05MqdkFMhcXlrfgSTteDYkY7crRTvQidYGhGq8D6DfkKx5nTMDFPki+BIveTy+HeOZrPu55FtCz4Jyq8LgdgqNDDULlnSxHcHXvsWYBuk98qx0ytgAl/IlWYwvJLi3+yzjA3l5RLAcvUt7PD/BPlZemG8BscWGCc8B0et8NlgItIat9iDUMTzXKIgndUvpftOftiSAuoTIPij/jI4eUSq5Y8i4w742owSe4GKCbMnmAGWoShWzUnLyXz+ukjtcV1JKVLHEhUzNYx5BD1PGkEuqsk4VkqaX6s8X4RpMzX0DJkpD8Ud3w4jhvuQBp3WwQBXVJ1UqJjNg5q846hY/bQuQ3ILC8aZOZelXT6CAWFx8UaiPgIxBzqo2fksO8/kO0xulMIwNyFx90VW/w5ds445Y7reCAFLeh/QptHOMvxesSUnEhGQSCw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR01MB4973.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(136003)(396003)(346002)(39840400004)(451199021)(83380400001)(42882007)(2616005)(66476007)(66946007)(66556008)(8676002)(6486002)(478600001)(53546011)(6512007)(6506007)(26005)(186003)(110136005)(316002)(6666004)(2906002)(83170400001)(31696002)(41300700001)(38100700002)(5660300002)(8936002)(921005)(31686004)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?cG80eHluVzc2S0JkdFFPVUEvY2YxTlliUm5UOEJ3dVZyN0FwS0V3SEJTSmxC?=
 =?utf-8?B?VzRPRVdGRUNVbG9iSUFLekpISldHYUxLMzlZQ1ZBajYwemlnd0J3ZENCZFBj?=
 =?utf-8?B?bmdsVVlBWnIxLzdIKzk5dkd5MEhUcFJ1T0JPZnZid0o1OE0rZUM3bU1ZRUx4?=
 =?utf-8?B?bGYxcWtwUFJJcWhPc0xLd1Jmb1BLUzdWSXpVbmJPdjBRZU1VN2ZnQkh0VGRX?=
 =?utf-8?B?L0dNVmZ2djNBVDlzcU1ldFcrbm10WGpSaU9hd3JIbUNGM010SGdaTVAwbEVL?=
 =?utf-8?B?cGJaWVd2a3BYUC9ka1ZFcTQzeUJzVVFnUkxaRXJHbVZMK2VyblBaQjdRa2tC?=
 =?utf-8?B?bGxPNzNnZmVXb2c2Q3NTTmdDWmVGeDgrZ09MMlBMMGorSStMMTBPTnpsV3FZ?=
 =?utf-8?B?M05KNG10bFZXem0rZjlFYzZROVo5c0FuOWwwM3VNYU1WT0l6NnNjZEsvY1ll?=
 =?utf-8?B?VkJPR2lpYXdwNFUxVVdPekxGcUMvNGxkK2pLVW1RQ2dHNVlKbFNsL2RxYWZS?=
 =?utf-8?B?K2VCWS9RVkk4cVVSeFRWK0xlaSs0WVkwTDJSWlpTSllUS2cvWFpuSHhON2Rr?=
 =?utf-8?B?UHpGaDFJUVBqdzk1bjZXT3JUTXRCdmt1RWdVWk1FWXZKNjlSZ2NEaEx5T1Vj?=
 =?utf-8?B?NGlkMWtiZi9LSU1OUWxBVXY4cEx5c1g5UnFqbTMrTUYySDZqek0zbThocUdX?=
 =?utf-8?B?WVVqNHdsUEUrQ1pjQzhHNDRtemduUFdkRERiYncyYnpiaGtzdTJMd0xrSnBa?=
 =?utf-8?B?Y3ZyTXVneGtnTlc1aTJVVnNiK0lhbVpNUjAzZUhlNlNSd0srbXB4N3NzbTFR?=
 =?utf-8?B?Z0hZYXlOVmlPRXBPcWRkek8vUTY2QUR5OGQyYWhmcS9IMUZLNlBGN0l0RS8y?=
 =?utf-8?B?QmE5c2hjcElHK2owRzVVQmE3SW1nTjBGeTRzZWFjNlZuZVR3L0VGN1NUL3Nq?=
 =?utf-8?B?ekh4TVMyeXBhSkFYeUtPRDFxS245QjdSWmtUdlVGTXR1Q2RPRmRWb1g5NzZw?=
 =?utf-8?B?Sm5JYVZGMVY4NzV0OUN0RVNDeGoxZk1aaGNvSVFJR0wvL0Z0Qi9NWE40Tksr?=
 =?utf-8?B?Z3hTdGQ3S2V2WVpjOW12NEdZR21raE0yT2RlRXlmaXJmM1ZvTjlidVQ5dExx?=
 =?utf-8?B?WmdzbHorNXJvSzl2aHdNa3hCbWJPcDI4VmF2WGVXMmJkWXRML2IzOU1kd2Jp?=
 =?utf-8?B?OXJscWh5azc0bytMK3Y2VHcvZjVocisyeFBLRVkray9HcmRQdDdUb2ZualJQ?=
 =?utf-8?B?dlpUUW1FSk5oNmowcmlDYXoyajF0K0JHM0xLYnZWMnlOckhjMVUrcVZYMVdO?=
 =?utf-8?B?R0ZYNFRpZHBtbnUrZnNGa2hMT2cxZHFVUkdwY29OclM5K05BOXplWTBvSzM1?=
 =?utf-8?B?TnBFMk02MTJwbkFSaXZ3aks1c3pqbEZ1MHk4Q25FU2EvRUgwd3RLeXdDaGtB?=
 =?utf-8?B?SHhFSm9IUFJ2Tmxna0hGRVhOM0NUVkljcVlhalJEU1QrUTkrRG14VkI1cE1z?=
 =?utf-8?B?a293R0lLUmFwSEdJenF0ZzA4QklYYWtOTDV1b1ZhNmxmRHFlUUFIRURZUWxS?=
 =?utf-8?B?dWJJMXNwUFpSa29TVHpMSi91cFErQUF6QXZJUzNpczVWa2ozR2x1Nkw1Mk1K?=
 =?utf-8?B?SkRJcnJYTFk1aDN3aWpsamJXdzBzUFNNQlMwZlVTWWV2RmI0a1Q5bi9jRWl5?=
 =?utf-8?B?RlJucW9TQy9HL01EVGJRZ2hCOEpCaVFQMDgwZ3AybGdNc0M2N004RDh0NUlm?=
 =?utf-8?B?Vzd2d0JSc3owbXhFUU9zNW1vSDA5RzdVdjQ3SUR5ZUNwUnJ4aW56RExFMnpk?=
 =?utf-8?B?SW5CLzE1ZWF5Q05abmlTdFZGSTBKa3BpSjc1djZsQWovaEE1VXNXVUNiMW9P?=
 =?utf-8?B?b21mRkIzYU5qTEtMN0htLzREQ1RQd2dDdVRoK1ptU2JFNmorSjVYL01QS0Zi?=
 =?utf-8?B?SzBDUWYzQzUvMW9GWlRTZllqYUpjc1ZLZ2Y4WmFLZUk2V2JkMXFzSE5aNFB1?=
 =?utf-8?B?QXhJeTB6Y3ZKbHRkK3BKcVptQ2JXdHd0bXN6akQ0bkdHWVMzSXU3cGFWZDhE?=
 =?utf-8?B?WGpzWW5NMnB6VWFmVEZvaXlTTEc3WjM3TkdNRXVSOE5hR0JXMytxc2xad1Ft?=
 =?utf-8?B?dE8wUk9WTzJWaWh2ZnQwNEx5djAweTJ2cVdhcTNmTjg1YVRVeXhwd2l4M1hF?=
 =?utf-8?Q?gqphdBpRomWhh/Mp5Q1P2rA=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 772d2f0f-6154-4da8-ca14-08db2e798815
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4973.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 04:12:51.5829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ERYTaf7UxnG6zhfjflzePxLTywM8a4/2sxU9RAwxyOOXZJ/sGPrXtaEnNb7ex/61ukNpYZNvWxm4egZO8MlxPU60Wcpg4vaj13tQTt9SJMFv6cG9pfq1Dki1PUMYN2jF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB5112
X-Mailman-Approved-At: Mon, 27 Mar 2023 16:44:52 +1100
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

Dear reviewers,

Just a gentle ping for the patch.

Thanks,
- Chanh

On 19/02/2023 00:10, Chanh Nguyen wrote:
> Define an I2C alias port from I2C Switch 0x70 at I2C5.
> Add the OCP device temperature sensor via I2C alias port
> as a tmp421 sensor.
> 
> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> ---
>   .../arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 16 ++++++++++
>   .../boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 29 +++++++++++++++++++
>   2 files changed, 45 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> index 0a51d2e32fab..b93339ed61c0 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> @@ -49,6 +49,11 @@
>   		 */
>   		i2c80 = &nvme_m2_0;
>   		i2c81 = &nvme_m2_1;
> +
> +		/*
> +		 *  i2c bus 82 assigned to OCP slot
> +		 */
> +		i2c82 = &ocpslot;
>   	};
>   
>   	chosen {
> @@ -420,6 +425,17 @@
>   		reg = <0x70>;
>   		i2c-mux-idle-disconnect;
>   
> +		ocpslot: i2c@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x0>;
> +
> +			ocp_temp: temperature-sensor@1f {
> +				compatible = "ti,tmp421";
> +				reg = <0x1f>;
> +			};
> +		};
> +
>   		nvmeslot_0_7: i2c@3 {
>   			#address-cells = <1>;
>   			#size-cells = <0>;
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> index 4b91600eaf62..c832b8ae5999 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> @@ -10,6 +10,14 @@
>   	model = "Ampere Mt.Mitchell BMC";
>   	compatible = "ampere,mtmitchell-bmc", "aspeed,ast2600";
>   
> +	aliases {
> +		/*
> +		 *  i2c bus 30-31 assigned to OCP slot 0-1
> +		 */
> +		i2c30 = &ocpslot_0;
> +		i2c31 = &ocpslot_1;
> +	};
> +
>   	chosen {
>   		stdout-path = &uart5;
>   	};
> @@ -424,6 +432,27 @@
>   		#size-cells = <0>;
>   		reg = <0x70>;
>   		i2c-mux-idle-disconnect;
> +
> +		ocpslot_0: i2c@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x0>;
> +
> +			ocpslot_0_temp: temperature-sensor@1f {
> +				compatible = "ti,tmp421";
> +				reg = <0x1f>;
> +			};
> +		};
> +		ocpslot_1: i2c@1 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x1>;
> +
> +			ocpslot_1_temp: temperature-sensor@1f {
> +				compatible = "ti,tmp421";
> +				reg = <0x1f>;
> +			};
> +		};
>   	};
>   };
>   
