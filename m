Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3AA62B3BC
	for <lists+openbmc@lfdr.de>; Wed, 16 Nov 2022 08:07:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NBvJM47ltz2xJF
	for <lists+openbmc@lfdr.de>; Wed, 16 Nov 2022 18:07:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=KGmpN2TP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eaa::70b; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=KGmpN2TP;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2070b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::70b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NBvHf0SCkz3bnZ;
	Wed, 16 Nov 2022 18:07:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELVl6r3D0/wrlf6BvJAfYrYzq0EbMIw0Jf/5nLRoOlJEkgnpdPCY5MSsso7mO1+f+BSzcku4BndWfIqsMqZq/sUIEnAOaG2XUyhJp5GcZhMqVcC2nhTNu+6s4yGWS8tbDB5TFksyByZIHQq/jk5LzwkdoEUkpZ7qVdjkvDH5BpCi8WxkpwjT+8npudOnmnNqUys7Jce2JM3arJC5pB63Eiq7pu2zyBE3msIML3oIEIF26WX/PhrU4EjDSoraAEJGUGfQVqFrb0JU0+aWPCqQRqLN96a388N/D4pdvZYBW6UjIDukkLiKeTbPxSHJDv+crLuSgXYlGNl54I20VNpUKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9JUK9aY8CiuK2kMBhBNtx8GnfwwnKpscKeN0bZ/gy0=;
 b=ghEAx5gcoRsAI0NA1XQ3okDBBiud6uAhdBbtyqH+xfa06U4XKwhq2wQ6fp6tpbD/nYJbMA0UvvKMJkxmT/LM5RIAgUWIuG6qGL2O5AXk7yzl9dNKMRn01KChZb9w4aCl+u9ZNjN38DPE+evzVO1Yw+eTc3ZPa1U9lNJX+WeUz2OgSp16rJJN7xGHjUkqu/a703ocSaOS2y5s83DcqOocnNGnksdFJ8BYQDFHGCfgKuvMPLtv+RGZ/kmbND5rvHLMoVErwiomf2frD8xBdfLiB1WpQGs8Zzi8myptkWC5v4MUAl5RkRASCRn9Py0exlGZZ4fojJunzvlSprn0x9KUmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9JUK9aY8CiuK2kMBhBNtx8GnfwwnKpscKeN0bZ/gy0=;
 b=KGmpN2TPrXYtR5vEMgenRN9X2GP2zssA+IY8mk3KpHuEghmRaUPQn2Dk3YbnoX6jj/4aX8Qf4CSdFtL1eUKPQcIR267c+OmigNbyE7hnBJ3ySfCrWiGOWB+S47SzMRK4pNPFoSBasWFKEV+OSxCpuh6GPiwOW5P4W146659pCzM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 BN7PR01MB3922.prod.exchangelabs.com (2603:10b6:406:8b::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.17; Wed, 16 Nov 2022 07:06:41 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::df7e:7f53:a83f:a86a]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::df7e:7f53:a83f:a86a%4]) with mapi id 15.20.5813.016; Wed, 16 Nov 2022
 07:06:41 +0000
Message-ID: <781ea7c7-b33e-f054-71eb-d760f7a01301@os.amperecomputing.com>
Date: Wed, 16 Nov 2022 14:06:22 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH] ARM: dts: aspeed: mtjade,mtmitchell: Add BMC SSIF nodes
Content-Language: en-CA
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Open Source Submission <patches@amperecomputing.com>
References: <20221024081115.3320584-1-quan@os.amperecomputing.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <20221024081115.3320584-1-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:4:188::16) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|BN7PR01MB3922:EE_
X-MS-Office365-Filtering-Correlation-Id: 599d35de-ec15-4408-487f-08dac7a11b94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	PUPB2CmrFhoVQ+NuLrSDMqZFDjUGJKoNzXws/Tda9ZGswFLxG968b7iKvpm8XsNd4exQZm7r37cNLBY+A3DOapJioNa9EYb6yjLNfTfUK6Yi/A1FzLxo5PC/HuAv8H0E5Kqk8RNt+Md8iT+YQDvNjg4ZsHxTfcBLMHrw8fZKbmQ175ARh9LfFA0Bg1DbUQRunhWiiswBtv045x2qZsa8I4jKAsqTxganL4GuBLkIOWNygYW6AXqzs3V9ujRFFsz/2oRkYamiA4DUPDOMK62qE1NNzkDprFBcHz967m+Mkg9r1BSlDq4CtjwdxGVk0faMccwz1uu7d0yezxaxZiE7nlyRdTjbvzmEvCC72MMubZifNb0aDLJy9ivWY50jxJYEl6Oox+dMUWYYWduP/bCj347lelSrP218M9BEe1d+QsHR6QkxVFvJlsX6km+mh7BEPAw/ZeiUztvHoBSCklinhNHGwMKjl+ni5metdrIm5YKdcyNVFvoBhrI446XwgSyraWskC5J1iSxvu43642yAx2aP3eMwDtM6q0NONkNl5cmBfmvOS4yfbR6HID04AmdIvKFQzjL1LonWCw/Mx/psxee/n+nZIs8DqTD4UnDNq4xnKMl4jb+Jc5aHJ/mYUutc4kwImJXJGvMZVOm829Sot33TOL6yYykFXIJ3X9rsp0gSluh7r0mnkLZotyQVdP1sWOWeigyh5xr90Gz2eC4bJBFsL4YFg2QsEoApBH/Y/+fERUBaBYg+PbbSumVZxETYnselJm12UH1qX7fIfIfxKCi5zzxC2Rhb6RYKgCLMDCE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(346002)(39850400004)(396003)(451199015)(38350700002)(66946007)(66556008)(66476007)(31696002)(4326008)(86362001)(6486002)(6506007)(5660300002)(6666004)(8936002)(478600001)(41300700001)(107886003)(38100700002)(316002)(110136005)(8676002)(52116002)(6512007)(53546011)(2616005)(2906002)(26005)(186003)(31686004)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?cFQ1SXNsOTVJNTdzdFZqUzcrT0RuSjVtWUxSR2xiQ2FTWW5CRkZKWWt1V2JT?=
 =?utf-8?B?N2tvWm1rVllLb2U1b3pFRWpwczh5dGZNVlRHaGRXODlYMG96RkRvaEpJQmFY?=
 =?utf-8?B?K3pHMlBLL1U4dTA5ZUhWeERGMm9Od1N1ZUVZbm9PWjREUXZUYk1ZeFZzQ01y?=
 =?utf-8?B?SWptNGJZSzVoS1JrT2hSK04wYzVZekVBNVB5bjgxcWpQVEl2eDB6dEt5MXo4?=
 =?utf-8?B?RGx2UzVsak1sNEtlYTN2VWRKVDE4YklIaHkvOEZiYjZPMG1tN3BZaTFhZHZL?=
 =?utf-8?B?bzROdDRzOUZHbXMxWFAzSzNJc1pIUTRjaGd2YVAvY2pua1ordlZMOCt5Slhz?=
 =?utf-8?B?K3ZQb0tGK3JNNGsrZ3ppbGdGeGh5bmZOYTZXa29ZbHJYdWgreG5CTlRERmlu?=
 =?utf-8?B?aS9mMlBPU2RlSHppcm5YRnlhZ3p3NjJ6VUNKMmNlTWN6WUpLa3B2ZnNHeFUv?=
 =?utf-8?B?b0l2UFR3elZMSmRVa1F0b0xjTG90eTkyMFN2aWduM000MnNGR2YxanNoTUxZ?=
 =?utf-8?B?bks4OGFCR3hqbGJoZG1vMEUyclAxZXdmMWFoZTk2UVZ4NDJaOGRsdHE0NXEz?=
 =?utf-8?B?b1pmdEZTK2JTWGlNQTlFL1VMYUUwQXFjY0tSUi9RQ1Y5YzRBQloxRW9PeXcx?=
 =?utf-8?B?Ymg5QTVLZmw1ZHQrS1JyZjI0RTB4ZFlsenN3RnpRckFiV1Iyei9aZjFRWDd3?=
 =?utf-8?B?MWx2Z0RtdHBQMGFEb1hWbjJqc1loK0pZSUJLRFZVOU1mMlRmK0tDdFU0OW10?=
 =?utf-8?B?TlBkS21yTEZTUlhsRWpCVFlzSnFwOWVvU0duMkZwdHJGUlg2S0VqNGpXSDNv?=
 =?utf-8?B?dmJOVmkvUEFqK0NmeGxTUDljWU1YbU45SHRwS3BaVTJWYitQclZ1MmVBcmo3?=
 =?utf-8?B?OFBLeGtSSnZyY2FCRjh4UVRxR2M4ODEvMmRWWmdOaDJxc3lLeXc3aE51SFJl?=
 =?utf-8?B?S2V3TnNOVk82SElqVmZWZ1A0cE1jc1lDc0ZjS3FhTkZlVlhCbXcwRmlSdWFo?=
 =?utf-8?B?aTVZZ1ZTSEE0Rll3MHRiLzgwb0VpaXc0cWdxMjVFdnNmdElGSTcvUysyTDVx?=
 =?utf-8?B?RjV6QmF3TXNGNm5nbjY4Q0swOUxZVU1aOHJ3cDRaSlpyVERHL0traEhnOWhZ?=
 =?utf-8?B?bjVDQ01OYjBhNkNURVB5TjA5TzNxQW9hUVRYNTlqOWxkZUZaMWI1ZDh3allp?=
 =?utf-8?B?STZVdUprQW9CWmVvLzFMVFJqNll2b0RxQzQ5NHYrZFZnZk5KalE3VWd5bG5a?=
 =?utf-8?B?UmlVbUt0ZzJvcWdYQy9BL2VFZnl6ZDBudkM1SFFVT05CbEQ5bkl2bHhmWVdm?=
 =?utf-8?B?TldlUzhOaisyMFpLQmhxWnF6WjFqVmRPMHJSUTAxLzkxTlZMZE5TQkcwbDBt?=
 =?utf-8?B?RXJ5UHJ6emY4MzFlaTJkUzJIWUo4Uzc2N0JGQmdLUzk0NGRvNXNOOFVCeGRP?=
 =?utf-8?B?dVdXUk03dUlMOUFmbERkUTRrNHdpK1ZCOUZIeWZaWFNQVXZodU5sN2ZFM1VB?=
 =?utf-8?B?SzVkYTYxVm1XdnNYdXBuc1lBYnlSbE9qYWkxcldRZmpKYmIrRmI4TXl5S3lj?=
 =?utf-8?B?QzBQVUNwMWlQNTlVMDBZd2Q2NHVaQ2hZdXo5cXFzelRxRUs1dkNVYUxXUzVZ?=
 =?utf-8?B?M2YzR3U0U1BxV09uWXU0VllaOXBLUmxGdTI4UzFYSmhyVHFpbU1ibDcvbVpY?=
 =?utf-8?B?dU5DelI2bzBlR1k5a3NXUVF5ckk3VDljYkdSbkIra1NzRDJ0MmFxMnBLNXhV?=
 =?utf-8?B?VjhSdldnKzV3ZlM0V3NFUGdDL1k2UVp3b0RWSzl0eDM0RCtudytDSFRKRmxs?=
 =?utf-8?B?RU0wZFY3QzV0QnFGaC9sR0Evak5PVnhaRndSajhiSGVvWWlqRzRZUFhhK0Z4?=
 =?utf-8?B?d2pQd2dQcGNJSmQxdHN0eTZRN2czNlc1aWRRaG80N2V4Ymt4NWJQdWJkYjhH?=
 =?utf-8?B?M2dMdDFsbXc4WEtNTkZPZi83eXFXbWdXckk3c1FmWHdvWkVJa3A5cUdLSnlt?=
 =?utf-8?B?ZDluU2Y0UGFTeEVFNjZTZDM0TGZkc3ZYcXk0NzVSUEVraHVzUjdLVGtQcXhU?=
 =?utf-8?B?elFOUnQrZXBnUTdtV0F6b243YWRFcHhEZytNcmJpTzg5aHhWTnUwMktneEZv?=
 =?utf-8?B?NFRCU2MxTUs0dFZ1cnNLZWdNZmlxazNsM3I1WHR4clpqYUE2L3NySEFOT2Rv?=
 =?utf-8?Q?Kc3RPRuGm1qZo7IfeRCubcE=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 599d35de-ec15-4408-487f-08dac7a11b94
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 07:06:41.1315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LC5i6vMLmlczIPUIvzqpkcWeAOM8afVp000cw7sohRrf/K+sDtPwRtoMjC9uKsZxuvi9++D4FoU6BpqK6ek8ONyvXWsYj8/mp7ty2Bn8brg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR01MB3922
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, thang@os.amperecomputing.com, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


Just a gentle ping about this patch.

Thanks and best regards,
- Quan

On 24/10/2022 15:11, Quan Nguyen wrote:
> Add BMC SSIF node to support IPMI in-band communication.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
>   arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts     | 4 ++++
>   arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 4 ++++
>   2 files changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> index d127cbcc7998..353359822d7b 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> @@ -342,6 +342,10 @@ &mac1 {
>   
>   &i2c0 {
>   	status = "okay";
> +	ssif-bmc@10 {
> +		compatible = "ssif-bmc";
> +		reg = <0x10>;
> +	};
>   };
>   
>   &i2c1 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> index 606cd4be245a..4b91600eaf62 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> @@ -445,6 +445,10 @@ &i2c9 {
>   
>   &i2c11 {
>   	status = "okay";
> +	ssif-bmc@10 {
> +		compatible = "ssif-bmc";
> +		reg = <0x10>;
> +	};
>   };
>   
>   &i2c14 {
