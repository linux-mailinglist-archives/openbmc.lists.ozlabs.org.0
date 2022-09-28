Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA735ED379
	for <lists+openbmc@lfdr.de>; Wed, 28 Sep 2022 05:27:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mchl24yZQz3bd3
	for <lists+openbmc@lfdr.de>; Wed, 28 Sep 2022 13:27:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=vES2Rldl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.243.110; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=vES2Rldl;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2110.outbound.protection.outlook.com [40.107.243.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MchkT1pyyz2xsD;
	Wed, 28 Sep 2022 13:27:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i8QZ7qW5KH6Vzkp0ze0d8rghGo7LjYhwZlUbB6VSFRFenOqWDN3aLGw/duiNEXrtFaDMSSre4Pz2GiAhsmS5WTpjJsCqzWNOsKJAE89R2P+esrQuWR/vDhYbPglz+kErsXJ9sk+IuqMzfKNbT0zBqNKjQXQLuJLHPcxcWwxjYOqRA5nAyGpZ3k6ARiCoNDYjulfFwzEXLxtdxWEqNSxZqv5qDE1H8OoRNjDOTn5mmEO5lycd73s5iVSRoltjLKs6qIMQnmxDzKj/xMPxCpSIwl+2pRRvbwMi63e7c8a1zISkEFJ9RITVnO7AEdsC8/eZDY7xDZsDVexCSoTrDdkYXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Wg3hkNIZCBSOWrR/USBGQ8c0rGPgO9h/XPhN5AExVE=;
 b=Uw97McpQB7EvhYM6Nt3oeci7cVjUiwAUsdANtwREyb50XBANVw+cefzXq1io+BZjh3k7iluzSWWWaL3sr1qj4a6ZsUtsQQgOLHWBQ4OkYsmD2CKqOGTwTzPTMQdIdI0ZAJgPkVGB6u+GzxMgcLhQbtqK/UBWdzn9RQHHOxBO2WqYrlcbPUkAC77+UoDNyydJmGmQ7TSf85P11HQxnho70Ob9NYCMLNkT49ZV6hEc+NyzpVOry5yK2PH7PVK8fhER5TystCs6PFDuP9HlF9IzZQ4CMg5IoZTvmrScoqEK0Hr4tssmTAhuINnWDOii2kz3HJC7tCWgvikm9tv6zHWJnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Wg3hkNIZCBSOWrR/USBGQ8c0rGPgO9h/XPhN5AExVE=;
 b=vES2Rldl0Glba1cqVazoeDmNH+Nv3JHVpyrMUIzp7JnBq3lpeo6jq15ZuqiGfb3KFNqum+O052CtGvJaCZJU3ipeZ5Godvzdj7pVqiCzAoe0mqE7JTreqq/NGIn0hvFq6BUccaG1fcWMDxgaH8qgclLq8fQwo4V4k+u7pWi6F+U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 DM5PR01MB2731.prod.exchangelabs.com (2603:10b6:3:ff::11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.19; Wed, 28 Sep 2022 03:26:50 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 03:26:49 +0000
Message-ID: <0550e082-03e3-d02b-460b-0d09eb0b1cee@os.amperecomputing.com>
Date: Wed, 28 Sep 2022 10:26:39 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH v3 RESEND 2/2] ARM: dts: aspeed: Add device tree for
 Ampere's Mt. Mitchell BMC
Content-Language: en-CA
To: Joel Stanley <joel@jms.id.au>
References: <20220926075848.206918-1-quan@os.amperecomputing.com>
 <20220926075848.206918-3-quan@os.amperecomputing.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <20220926075848.206918-3-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::18) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|DM5PR01MB2731:EE_
X-MS-Office365-Filtering-Correlation-Id: 2618f036-a2ea-415c-1e9f-08daa1014772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	jO6gsL46lrIUb4IGeC0SgQG0qWjS3HlzfW6WUB5Y26CbEk2gfjEbisjE0BVlowAQa/LZb+E38QvpCLQ0R29z0Nl0QWqYEakqtPrDaCAdsF9YSNsyzSeLVBBfuL+dlaKkp1Il5eAWDBSDnbqOgrMFsFd6KOj63po5y8PALmpaxgoDm3BkinKSA6zDVG80OwKF1/3UDPP4OKPEPf6cDkZmuI73ZffZgISng4LiwDqLPhr2TQJJ8DmGG909pMW2uz2V3UB3jCRTx8BJe9qSGjLFXznsco3/WXNHsEHNYR2uScCVENCICaOrtDSJePiQinUDXvGWL4yhx/NsOZ7Fiw4TDUSCy/mOMPinUbczUhJ28cDgL9i8j2YfzsDk+ynjBdxmykDZDRDNGHv36YkCIJZMmK3KbUfCESF5XxyLACTzsvzjuAvX6EJL54lyPOsrOTIWCUqejctbQ0IsEzLo90RMCbDPn0jOtBFHTnbT30liWIGRdwe7MMBCMvBXl2OdQRVHonPsD65e2MoDKFcracgYULYAqYbFX2FkqHM+Dqs2LkNC7IOqs0+UH0hQ34xRDYWIwr4msPe2YcWFUXr+ihDbKndQTL/9Zl6Z6by4hVQGJVa+AMiy6b30NSF4fkLIU6UGcOgBEwye2ebdn9FExRVV8DGI1cFc8qMOFkFv/2fg+oZwfNQjYt47iiyvR152TVgu1DRSUm0Anawzm9dUMEGN0cuAVHK6XXXDgEn3ccy0p403/jMFLpuMkJgapDltglHpUlR7uyRzY4GBAxMcAyElHmNL051WA+tf9qvXtKxo5Jq6KxXZa+ob/0tfNax21MhDQ9dTjt2sOCz/uaj4gPOHD7+o+/TM7+o3o5LimyXccTFHXMgKoHO1a/XxvP32Ir4A
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(396003)(366004)(346002)(136003)(376002)(451199015)(5660300002)(30864003)(83380400001)(38100700002)(41300700001)(38350700002)(6512007)(66476007)(66574015)(6666004)(2906002)(52116002)(53546011)(8936002)(7416002)(31686004)(54906003)(6506007)(26005)(8676002)(66556008)(186003)(2616005)(4326008)(6486002)(66946007)(316002)(6916009)(478600001)(31696002)(86362001)(449214003)(43740500002)(414714003)(473944003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?azdUb0dDekRkTHJHNGFOTnJVV1hhR3R5RytHUXBFUXNFZ1VSWDBtckdXdnAx?=
 =?utf-8?B?c3lUQzZUMmJ0bnZJSUpRVktTQ3hNWTFOc05EKzh1SjFwVlNYcDNVSzgzYWxw?=
 =?utf-8?B?MGx2TEZxb2dFSkhnaGJTVCtLRG91ZFQ3bkxWTlFtZGovcXppb0hlcEFPQldz?=
 =?utf-8?B?aVpEUlBzN3orOVV1YncwZ0kxemcvc0Z6MFM0QXdpZTRTeENGYjQzZ29QS2w3?=
 =?utf-8?B?Z0dKYU51Zk9DUEIvdmR4TTdtTytMSGYyYkNFRTFtS2pEOWtXNWlrTHBHeUty?=
 =?utf-8?B?Y2FURFJtemZ1a0kwdm9QdnZVQ2xwaCtCVkZxZ2g5ejRHYlExUmcvVHFOZWti?=
 =?utf-8?B?SWNyNzU3ODdqaWhrN05iRGhOSlJhMHVEZnk3RHR3VXl1a3ZXV3pPNkhFMEkx?=
 =?utf-8?B?UVlBeXRRa1VRZGpUSjRIZmM3Qk82Y29aVExzUldGMnkwVUNtcGMwbGNKWDhu?=
 =?utf-8?B?MzdaL1g4UW5QZ21USCtQeDZUdEFGc2M0cnV4OHpiSTkxME1JZEFsb0NLcnN2?=
 =?utf-8?B?dm5sQVhHR0V5a3ZqWDFQMy9Qa2NUczZXNzhrUVIvNFFWcW5BQzE0R2pZN1l0?=
 =?utf-8?B?SVBqUTFmMHdtRE16U2JneWVkQm9KL2NDcXFranYzUVZSREw4TTNEdDM2a21x?=
 =?utf-8?B?NWNPUEE4RzN1WkN5QkFCbFhzNUxkMEZWMXBpbmxvczR0Ymk2UGZRMDc4YUxr?=
 =?utf-8?B?YmZiRm0yNlQwSmpLbmF1SmF5MlRjUmtDcVBWT3ExOVcySlNjdWlpanA1bkIy?=
 =?utf-8?B?TEMyN2tzSHJlMlhZSjZsSjhRbzlLMmdON0pXeXpRV2VYMkJTcVdqOTlDVEtY?=
 =?utf-8?B?Ky8zTHFlbitQU0d3cVlWdzhoOTJmc2g1dXpKTjJiSVJITGM5YXY3WWJhZFlC?=
 =?utf-8?B?L0crZ0hieWQ2TG5UQ1RjOUxSazh2YkIzL0FCazNtZHBWQXN6UVdpMnQ5TXJL?=
 =?utf-8?B?RXRWakF2NEg2SFMwUnFTZ0pCWHR1MEJuN25xR3M3QllaSnpROVMxNHVJOEU0?=
 =?utf-8?B?Q3gwMEdYeC83Vk15REVUaVJFamdaOUxIUGJRM0FreVN4SVpYWkF3S2xRckdl?=
 =?utf-8?B?UG5VN0xUcmQ2RjRIeC9Ea2RmL2hWUHJ0LzFOQ1BsdUdrR2pCM0xBVXZpNGNq?=
 =?utf-8?B?dC83ZGpvZ0VSdVZqSmE3WEVXQ1pRaytnZEcwcUFQQVZxL1U1Z0dqK3MycEc4?=
 =?utf-8?B?R1JNRVZyRTZmU283a1dOZTVPcTA4V3V2VGlSWjJ3VGlNK1J3MC9zQzQ2dWdj?=
 =?utf-8?B?UzJLandIR281RWdWdkVZMEtEOGhQZk1vYjZjRm9ib2VtUXdWclA5N0xCdFBR?=
 =?utf-8?B?YzBORVZoMW05MDB4c1V1M05mRm9KMkRFVkVzU0lxNUtyMTJkYXRTZ2RGeW0r?=
 =?utf-8?B?WnJEZmRHUjkwMTYwTTFNcUg1dDlmWEw3dmo3VGg1WnVJN3VLcGgvV2xZb1cr?=
 =?utf-8?B?eFRxOEl2czNZS29NR0pLMFgxSmt0K1dJejA2SWFScC96RTVRbnByNXlmWkFY?=
 =?utf-8?B?dHB5bm1aelRDTWYzUlRteDVCb1FtM2x5RG9sNWgybGhSRnhraWtFTG9ORjJI?=
 =?utf-8?B?eVF5M1UreWlveXl6dGkweXE4TDkvT1NrMjdXWDdHT0FCbHI5eDA5SzRBV3dF?=
 =?utf-8?B?aUV2ODZyckZNOTRhMi9BOVFWY1F0T3NjR2ZXVGhqb0pxL2xVTGxlWENHUTlh?=
 =?utf-8?B?eGlPYUJhS1kwbzcxZ1llR2RYTnp0alNrVi9yeFYrdkZkakErYldNY2FsV0I3?=
 =?utf-8?B?NHFzV2sxSnA0aDNTZFI4Z05QbVlpRkFraGNrOFREMUZER3FSbnpQZk4zVDlx?=
 =?utf-8?B?UHo5NWdqTVF1NVRKZWlvZkhpN0hOQTB4T3JDNG16OFZlWWNFdzRpYjdBak5O?=
 =?utf-8?B?MkJ0ci9WSS9jb21BTmJ4eDFuQ2Z6aWZoSjRNRkhPK3BSakt5YVdyNm5vUGo5?=
 =?utf-8?B?dmpIWStMMDV3blBLT2FPTnk5YUM5YjlwY2RRQ2RRaWhhUkd0TTJ3RUQrSHM2?=
 =?utf-8?B?ajluUGZWUDlDYVFlV3J5aWxDcFplWmdlS29adURUY3hGZFFEOXpwWWpKVkNu?=
 =?utf-8?B?MnJ4Q2lQdGVmS29GSmtNcmxLckl1M1R3cWpta0NNRDRCZXJiclNBbzExdk1a?=
 =?utf-8?B?K2pibnJheGhrYjA2SDRpcDQwK1ZLcS9mUDNrTEtUTkF4U3FBcERQTWJQbk0r?=
 =?utf-8?Q?6rsT/srclLROOs7F2SsnoFw=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2618f036-a2ea-415c-1e9f-08daa1014772
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 03:26:49.6735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nlNvE8cJ3gGP+yXqU/cbZA4PwlRAgjayWQzAoILf7CypYFc3iLPn4xvH5UmCVCipBHxMbY/STdPh2Ts+4b5NF5Txui5lJGhGc/o97iS96DU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR01MB2731
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, thang@os.amperecomputing.com, Phong Vo <phong@os.amperecomputing.com>, linux-kernel@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Olof Johansson <olof@lixom.net>, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Joel

Thank you for queuing the patch. Could possibly you pick it to openbmc 
dev-5.15 branch as well?

Thank you,
- Quan

On 26/09/2022 14:58, Quan Nguyen wrote:
> The Mt. Mitchell BMC is an ASPEED AST2600-based BMC for the Mt. Mitchell
> hardware reference platform with AmpereOne(TM) processor.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> Signed-off-by: Phong Vo <phong@os.amperecomputing.com>
> Signed-off-by: Thang Q. Nguyen <thang@os.amperecomputing.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---
> v3 :
>    + Fix adc-i2c node to generic "adc" node                [Krzysztof]
>    + Remove unused status property in adc node             [Krzysztof]
>    + Remove trailing blank line at the end of file         [Krzysztof]
>    + Remove the wrong comment on vga_memory nodes             [Andrew]
>    + Remove gpio-keys                                         [Andrew]
>    + Remove the line-name for bmc-debug-mode, eth-phy-rst-n,
>      eth-phy-int-n, bmc-salt12-s0-ssif-n, fpga-program-b,
>      bmc-uart-cts1, bmc-spi-fm-boot-abr-pd, emmc-rst-n gpios  [Andrew]
>    + Update line-name for hs-csout-prochot, s1-spi-auth-fail-n  [Quan]
>    + Add line-name [s0|s1]-heartbeat                            [Quan]
> 
> v2 :
>    + Remove bootargs                                       [Krzysztof]
>    + Fix gpio-keys nodes name to conform with device tree binding
>    documents                                               [Krzysztof]
>    + Fix some nodes to use generic name                    [Krzysztof]
>    + Remove unnecessary blank line                         [Krzysztof]
>    + Fix typo "LTC" to "LLC" in license info and corrected license
>    info to GPL-2.0-only
> 
>   arch/arm/boot/dts/Makefile                    |   1 +
>   .../boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 546 ++++++++++++++++++
>   2 files changed, 547 insertions(+)
>   create mode 100644 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 1a718157d1a6..177fc02e5c6e 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1582,6 +1582,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>   	aspeed-ast2600-evb.dtb \
>   	aspeed-bmc-amd-ethanolx.dtb \
>   	aspeed-bmc-ampere-mtjade.dtb \
> +	aspeed-bmc-ampere-mtmitchell.dtb \
>   	aspeed-bmc-arm-stardragon4800-rep2.dtb \
>   	aspeed-bmc-asrock-e3c246d4i.dtb \
>   	aspeed-bmc-asrock-romed8hm3.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> new file mode 100644
> index 000000000000..606cd4be245a
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> @@ -0,0 +1,546 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) 2022, Ampere Computing LLC
> +
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +	model = "Ampere Mt.Mitchell BMC";
> +	compatible = "ampere,mtmitchell-bmc", "aspeed,ast2600";
> +
> +	chosen {
> +		stdout-path = &uart5;
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x80000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		gfx_memory: framebuffer {
> +			size = <0x01000000>;
> +			alignment = <0x01000000>;
> +			compatible = "shared-dma-pool";
> +			reusable;
> +		};
> +
> +		video_engine_memory: video {
> +			size = <0x04000000>;
> +			alignment = <0x01000000>;
> +			compatible = "shared-dma-pool";
> +			reusable;
> +		};
> +
> +		vga_memory: region@bf000000 {
> +			no-map;
> +			compatible = "shared-dma-pool";
> +			reg = <0xbf000000 0x01000000>;  /* 16M */
> +		};
> +	};
> +
> +	voltage_mon_reg: voltage-mon-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "ltc2497_reg";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	gpioI5mux: mux-controller {
> +		compatible = "gpio-mux";
> +		#mux-control-cells = <0>;
> +		mux-gpios = <&gpio0 ASPEED_GPIO(I, 5) GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	adc0mux: adc0mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc0 0>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	adc1mux: adc1mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc0 1>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	adc2mux: adc2mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc0 2>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	adc3mux: adc3mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc0 3>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	adc4mux: adc4mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc0 4>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	adc5mux: adc5mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc0 5>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	adc6mux: adc6mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc0 6>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	adc7mux: adc7mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc0 7>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	adc8mux: adc8mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc1 0>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	adc9mux: adc9mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc1 1>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	adc10mux: adc10mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc1 2>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	adc11mux: adc11mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc1 3>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	adc12mux: adc12mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc1 4>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	adc13mux: adc13mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc1 5>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	adc14mux: adc14mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc1 6>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	adc15mux: adc15mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc1 7>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	iio-hwmon {
> +		compatible = "iio-hwmon";
> +		io-channels = <&adc0mux 0>, <&adc0mux 1>,
> +			<&adc1mux 0>, <&adc1mux 1>,
> +			<&adc2mux 0>, <&adc2mux 1>,
> +			<&adc3mux 0>, <&adc3mux 1>,
> +			<&adc4mux 0>, <&adc4mux 1>,
> +			<&adc5mux 0>, <&adc5mux 1>,
> +			<&adc6mux 0>, <&adc6mux 1>,
> +			<&adc7mux 0>, <&adc7mux 1>,
> +			<&adc8mux 0>, <&adc8mux 1>,
> +			<&adc9mux 0>, <&adc9mux 1>,
> +			<&adc10mux 0>, <&adc10mux 1>,
> +			<&adc11mux 0>, <&adc11mux 1>,
> +			<&adc12mux 0>, <&adc12mux 1>,
> +			<&adc13mux 0>, <&adc13mux 1>,
> +			<&adc14mux 0>, <&adc14mux 1>,
> +			<&adc15mux 0>, <&adc15mux 1>,
> +			<&adc_i2c 0>, <&adc_i2c 1>,
> +			<&adc_i2c 2>, <&adc_i2c 3>,
> +			<&adc_i2c 4>, <&adc_i2c 5>,
> +			<&adc_i2c 6>, <&adc_i2c 7>,
> +			<&adc_i2c 8>, <&adc_i2c 9>,
> +			<&adc_i2c 10>, <&adc_i2c 11>,
> +			<&adc_i2c 12>, <&adc_i2c 13>,
> +			<&adc_i2c 14>, <&adc_i2c 15>;
> +	};
> +};
> +
> +&mdio0 {
> +	status = "okay";
> +
> +	ethphy0: ethernet-phy@0 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0>;
> +	};
> +};
> +
> +&mac0 {
> +	status = "okay";
> +
> +	phy-mode = "rgmii";
> +	phy-handle = <&ethphy0>;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii1_default>;
> +};
> +
> +&fmc {
> +	status = "okay";
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "bmc";
> +		spi-max-frequency = <50000000>;
> +#include "openbmc-flash-layout-64.dtsi"
> +	};
> +
> +	flash@1 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "alt-bmc";
> +		spi-max-frequency = <50000000>;
> +#include "openbmc-flash-layout-64-alt.dtsi"
> +	};
> +};
> +
> +&spi1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_spi1_default>;
> +
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "pnor";
> +		spi-max-frequency = <20000000>;
> +	};
> +};
> +
> +&uart1 {
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	status = "okay";
> +};
> +
> +&uart3 {
> +	status = "okay";
> +};
> +
> +&uart4 {
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +
> +	temperature-sensor@2e {
> +		compatible = "adi,adt7490";
> +		reg = <0x2e>;
> +	};
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +
> +	psu@58 {
> +		compatible = "pmbus";
> +		reg = <0x58>;
> +	};
> +
> +	psu@59 {
> +		compatible = "pmbus";
> +		reg = <0x59>;
> +	};
> +};
> +
> +&i2c3 {
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	status = "okay";
> +
> +	adc_i2c: adc@16 {
> +		compatible = "lltc,ltc2497";
> +		reg = <0x16>;
> +		vref-supply = <&voltage_mon_reg>;
> +		#io-channel-cells = <1>;
> +	 };
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c64";
> +		reg = <0x50>;
> +		pagesize = <32>;
> +	};
> +
> +	i2c-mux@70 {
> +		compatible = "nxp,pca9545";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x70>;
> +		i2c-mux-idle-disconnect;
> +
> +		i2c4_bus70_chn0: i2c@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x0>;
> +
> +			outlet_temp1: temperature-sensor@48 {
> +				compatible = "ti,tmp75";
> +				reg = <0x48>;
> +			};
> +			psu1_inlet_temp2: temperature-sensor@49 {
> +				compatible = "ti,tmp75";
> +				reg = <0x49>;
> +			};
> +		};
> +
> +		i2c4_bus70_chn1: i2c@1 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x1>;
> +
> +			pcie_zone_temp1: temperature-sensor@48 {
> +				compatible = "ti,tmp75";
> +				reg = <0x48>;
> +			};
> +			psu0_inlet_temp2: temperature-sensor@49 {
> +				compatible = "ti,tmp75";
> +				reg = <0x49>;
> +			};
> +		};
> +
> +		i2c4_bus70_chn2: i2c@2 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x2>;
> +
> +			pcie_zone_temp2: temperature-sensor@48 {
> +				compatible = "ti,tmp75";
> +				reg = <0x48>;
> +			};
> +			outlet_temp2: temperature-sensor@49 {
> +				compatible = "ti,tmp75";
> +				reg = <0x49>;
> +			};
> +		};
> +
> +		i2c4_bus70_chn3: i2c@3 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x3>;
> +
> +			mb_inlet_temp1: temperature-sensor@7c {
> +				compatible = "microchip,emc1413";
> +				reg = <0x7c>;
> +			};
> +			mb_inlet_temp2: temperature-sensor@4c {
> +				compatible = "microchip,emc1413";
> +				reg = <0x4c>;
> +			};
> +		};
> +	};
> +};
> +
> +&i2c5 {
> +	status = "okay";
> +
> +	i2c-mux@70 {
> +		compatible = "nxp,pca9548";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x70>;
> +		i2c-mux-idle-disconnect;
> +	};
> +};
> +
> +&i2c6 {
> +	status = "okay";
> +	rtc@51 {
> +		compatible = "nxp,pcf85063a";
> +		reg = <0x51>;
> +	};
> +};
> +
> +&i2c7 {
> +	status = "okay";
> +};
> +
> +&i2c9 {
> +	status = "okay";
> +};
> +
> +&i2c11 {
> +	status = "okay";
> +};
> +
> +&i2c14 {
> +	status = "okay";
> +	eeprom@50 {
> +		compatible = "atmel,24c64";
> +		reg = <0x50>;
> +		pagesize = <32>;
> +	};
> +
> +	bmc_ast2600_cpu: temperature-sensor@35 {
> +		compatible = "ti,tmp175";
> +		reg = <0x35>;
> +	};
> +};
> +
> +&adc0 {
> +	ref_voltage = <2500>;
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
> +		&pinctrl_adc2_default &pinctrl_adc3_default
> +		&pinctrl_adc4_default &pinctrl_adc5_default
> +		&pinctrl_adc6_default &pinctrl_adc7_default>;
> +};
> +
> +&adc1 {
> +	ref_voltage = <2500>;
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
> +		&pinctrl_adc10_default &pinctrl_adc11_default
> +		&pinctrl_adc12_default &pinctrl_adc13_default
> +		&pinctrl_adc14_default &pinctrl_adc15_default>;
> +};
> +
> +&vhub {
> +	status = "okay";
> +};
> +
> +&video {
> +	status = "okay";
> +	memory-region = <&video_engine_memory>;
> +};
> +
> +&gpio0 {
> +	gpio-line-names =
> +	/*A0-A7*/	"","","","","","i2c2-reset-n","i2c6-reset-n","i2c4-reset-n",
> +	/*B0-B7*/	"","","","","host0-sysreset-n","host0-pmin-n","","",
> +	/*C0-C7*/	"s0-vrd-fault-n","s1-vrd-fault-n","","",
> +			"irq-n","","vrd-sel","spd-sel",
> +	/*D0-D7*/	"presence-ps0","presence-ps1","hsc-12vmain-alt2-n","ext-high-temp-n",
> +			"","bmc-ncsi-txen","","",
> +	/*E0-E7*/	"","","clk50m-bmc-ncsi","","","","","",
> +	/*F0-F7*/	"s0-pcp-oc-warn-n","s1-pcp-oc-warn-n","power-chassis-control",
> +			"cpu-bios-recover","s0-heartbeat","hs-csout-prochot",
> +			"s0-vr-hot-n","s1-vr-hot-n",
> +	/*G0-G7*/	"","","hsc-12vmain-alt1-n","","","","","",
> +	/*H0-H7*/	"","","wd-disable-n","power-chassis-good","","","","",
> +	/*I0-I7*/	"","","","","","adc-sw","power-button","rtc-battery-voltage-read-enable",
> +	/*J0-J7*/	"","","","","","","","",
> +	/*K0-K7*/	"","","","","","","","",
> +	/*L0-L7*/	"","","","","","","","",
> +	/*M0-M7*/	"","s0-ddr-save","soc-spi-nor-access","presence-cpu0",
> +			"s0-rtc-lock","","","",
> +	/*N0-N7*/	"hpm-fw-recovery","hpm-stby-rst-n","jtag-sel-s0","led-sw-hb",
> +			"jtag-dbgr-prsnt-n","s1-heartbeat","","",
> +	/*O0-O7*/	"","","","","","","","",
> +	/*P0-P7*/	"ps0-ac-loss-n","ps1-ac-loss-n","","",
> +			"led-fault","cpld-user-mode","jtag-srst-n","led-bmc-hb",
> +	/*Q0-Q7*/	"","","","","","","","",
> +	/*R0-R7*/	"","","","","","","","",
> +	/*S0-S7*/	"","","identify-button","led-identify",
> +			"s1-ddr-save","spi-nor-access","sys-pgood","presence-cpu1",
> +	/*T0-T7*/	"","","","","","","","",
> +	/*U0-U7*/	"","","","","","","","",
> +	/*V0-V7*/	"s0-hightemp-n","s0-fault-alert","s0-sys-auth-failure-n",
> +			"host0-reboot-ack-n","host0-ready","host0-shd-req-n",
> +			"host0-shd-ack-n","s0-overtemp-n",
> +	/*W0-W7*/	"ocp-aux-pwren","ocp-main-pwren","ocp-pgood","",
> +			"bmc-ok","bmc-ready","spi0-program-sel","spi0-backup-sel",
> +	/*X0-X7*/	"i2c-backup-sel","s1-fault-alert","s1-fw-boot-ok",
> +			"s1-hightemp-n","s0-spi-auth-fail-n","s1-sys-auth-failure-n",
> +			"s1-overtemp-n","s1-spi-auth-fail-n",
> +	/*Y0-Y7*/	"","","","","","","","host0-special-boot",
> +	/*Z0-Z7*/	"reset-button","ps0-pgood","ps1-pgood","","","","","";
> +};
> +
> +&gpio1 {
> +	gpio-line-names =
> +	/*18A0-18A7*/	"","","","","","","","",
> +	/*18B0-18B7*/	"","","","","","","s0-soc-pgood","",
> +	/*18C0-18C7*/	"uart1-mode0","uart1-mode1","uart2-mode0","uart2-mode1",
> +			"uart3-mode0","uart3-mode1","uart4-mode0","uart4-mode1",
> +	/*18D0-18D7*/	"","","","","","","","",
> +	/*18E0-18E3*/	"","","","";
> +};
