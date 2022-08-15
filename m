Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D23592988
	for <lists+openbmc@lfdr.de>; Mon, 15 Aug 2022 08:21:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M5kgp25gBz3bXg
	for <lists+openbmc@lfdr.de>; Mon, 15 Aug 2022 16:21:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Wpgu6C+j;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.223.139; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Wpgu6C+j;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2139.outbound.protection.outlook.com [40.107.223.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M5kgG0yPVz2xHD;
	Mon, 15 Aug 2022 16:20:56 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ScVtBFY4rDhE0G/Ko5qhIT4BN0KGLuIrTEdT0z6gpzIcT9gMNlUUSByQfWovBESr6/qmk7CyVfYW35znySK4UTJ6qfk8bDp1KiIm/Yijym8lElk3ktxF6wP2R18L1XOBKBSgQVKnvwCIi0E1MZwk+6eaQuvxn6rqMHe3A+kkC3ebJIcZs695qDz9o6Tau3rSU3KkxP0hU2iO8l2olzLgeMCgujlPEkUY3DhqyVtafo3vLA+LFhO5bDCb4glwk2GJEfeZJi6JDXxVXxRI/QRGKcz15m10D6sVC6+3QwPwjb65Tj4+6fJzQO9lTSKf5dpnFuZQbco0v33qPyMpQ5efNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvlro7lpafflAldyNEaYwBTcN/dmGifvMzpofGCWJug=;
 b=BOOQbwXl7ZbfthdHgr5/rVcerl8WRVAe0eWgQHrO2CbzMrpdFKBNk4IiFmpMZYUdn86qU/3bygYwQYaefyTml6HTGwNDUrz4Odv0sUf7T36A7s3ogDkr+dDzyfrxLBqdg9QDVZqGvQ0Z7NuM5GkzQFvIc2BNNVbPnQA7TbIF2VlP9/fmifWEjJli0Kg2W71CdrAOZeQp7e066EYT+hWKdFEZ2+WH7Jo9c/0MGMTsTbxm4CN9+mSLDPRxyf40EQ9pkGP4urKdDFtCKrUE8jRbDG6vBfTMswxCG2Xyas/Nl1RIkWet/BT+bpgZEQ/TFMW3qWxTQcnkEPjmwwx6usS6Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvlro7lpafflAldyNEaYwBTcN/dmGifvMzpofGCWJug=;
 b=Wpgu6C+j1Xl7vJ6ttOLcuDuT8NtrxWQc70n+s6UbbErtqPncAF0aseSsxA8lhyOGrwOaO74qpyUmeIJbKyDSrokkGCGFc8imgNW5knnqfXULA1d9qN8/JpI+UvHUUceIyy22c+oRtnkmrZkPozvfAOms3MAHcxqG/wW+a5ivfc4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 CO1PR01MB6757.prod.exchangelabs.com (2603:10b6:303:d6::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.14; Mon, 15 Aug 2022 06:20:37 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::2c79:3341:5ae5:7d26]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::2c79:3341:5ae5:7d26%9]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 06:20:37 +0000
Message-ID: <82b66694-5df0-2458-30a8-656bd1e14bc3@os.amperecomputing.com>
Date: Mon, 15 Aug 2022 13:20:27 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add device tree for Ampere's Mt.
 Mitchell BMC
To: Andrew Jeffery <andrew@aj.id.au>
References: <20220720085230.3801945-1-quan@os.amperecomputing.com>
 <20220720085230.3801945-3-quan@os.amperecomputing.com>
 <5848e2d7-33e1-4093-b70f-b52ef9068083@www.fastmail.com>
Content-Language: en-CA
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <5848e2d7-33e1-4093-b70f-b52ef9068083@www.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::22)
 To SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c77d42c-4b92-4100-f909-08da7e8644fc
X-MS-TrafficTypeDiagnostic: CO1PR01MB6757:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	K3paCTiEQom4Ww5lv/DNm/3F4kSDRCSm62sXYrLjJyBDk3F5BvRz0lL6tMO1Yhb09p+QXHFPKzyRPj8mjVigpivqRK7PbVxt/vwZZk4OBZFU/eDAn3ktoTfFAsgnFMSqC6TcXl1Bjvr9CtG0Z99RMoNye//46KyzzpRYJYD7ZwxTEiNuRsuzCyoKBIZtinGYpdkQnX9OV6O/CorZ1ZwqzwPyKam5XQNbPRwKbRaoKARCkjFxnGSvEl63TMr2PmkvyxmJxHVsG7XysFJZPQiYh2YT/EnhtFccZV3NpdLZZ+zfiQe5DQ05ghKvNYZS37xbTyjbc9GjghjR6thRXABrNHgCp+5fH37uE3ISEG2yXWzJGmPJtst3AIi2taUnn/Kg+sGDuAA1PEq2KapC394qawTA+vY46wVzVFZ/z+EbujlsoVAbCoKezwbbIM8hAvpOFghLw1ZA4blJt1/x0YrU/UoDTrZZYYjZ2nnxuVO7xooF3Yqf7IXds/vdw2K9ilH+/ztqci/K/42LYjMDy6CYr9XIZtA4fI/CfMFgOLXmwtLPrS9IshACf9HPLeOfDcpVSs1aAKzAHmilXJ2oXXSGb0JtBZh/wJTvzjrGvu6DF6W5cgR/Rd9PEELWAwHjo4t62k1GK9bfNLMuKDO1qXkSRxPoG3zRorEqYkhZRcrgFMttogHTUncmBMxgWaQHlFWY2Pp+UyUScy/OKhe7CjyJCprTN1uIUm/I2bXf4n7wMxV7PPlkiiZ/PcYxgmNtPy4q3D5zZS+4o+zD9xXt5mAmC73iPUr9VbJzHRN8nianfdM98PH8Up9SHwLjCkXH3R50XYDgAP1tOtX70IVH1K8cAjGZk23pKi/s8adApoEMQGpjXav/NXHDVLzQ6FUgHF5tYSebemw8sNgFDTB7BtMZs4KfwjB6sOtqekLij+qx2OKH7d4vD1qOCptI0ikYke+D
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39840400004)(376002)(346002)(366004)(136003)(66556008)(4326008)(8676002)(66476007)(316002)(6916009)(54906003)(5660300002)(7416002)(30864003)(8936002)(2906002)(38350700002)(66946007)(38100700002)(31696002)(86362001)(478600001)(6506007)(52116002)(53546011)(6666004)(41300700001)(966005)(6486002)(83380400001)(6512007)(2616005)(26005)(66574015)(186003)(31686004)(449214003)(43740500002)(473944003)(414714003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?dkJSNy9BMW51RVlDclp2RHhRbkVaZ014VmVZVEYxOVphWUhjK1Axay96TDQw?=
 =?utf-8?B?cTBvTStlbitENFduVk1ZN3lKaFlFVUg5WS8vZ0dSb3JlQlJwYVZYNDk5VFI2?=
 =?utf-8?B?N21pRkRVUmRrNWdXNnB6OW00Y2hVZW4yNjRwNy9ML1ZOTDJud0VWZmQ4VDFM?=
 =?utf-8?B?dnA5UGpnK0VaZndkRHNiUmpRTTVnOHNsNUoxUDZ6b283T0NZbHNpaVNIMWND?=
 =?utf-8?B?OXBQZGVabjk4QkxZZjdkZEQvSjVaRlNQZEdzcC9hQXY3Y01SbDR1UFJUUE9n?=
 =?utf-8?B?eEcxSWlsT3JUbzBncVZxSFFYWVpEc084T3pJZU9Rbk1rL1RoWFhDZjZ3RG9m?=
 =?utf-8?B?S2Zma0VrNnhxUzFHZSthQW1lRVN0QytvbE1obkdUV3F0TVpMdW14RDRzUEp1?=
 =?utf-8?B?bi9CL05EblVadHpETm1hcUJrVHRhZG4vb3Q3UkFwNDZUclRhTDFmR3U5SUlR?=
 =?utf-8?B?aVlOM3BVeW1odmpGN3FXNXZxN2hHTDNtUzRoRCtoT0VvQk1TeXBsODN3SWU4?=
 =?utf-8?B?V05WcS96R0VCc2lPYUhDUm13QnZoa3FnWThmSkhHbE1OWVp4RldCSWRTWkNG?=
 =?utf-8?B?RU5HS0ZaVFlhR2NTbytrc1A2MTc1NWFrM3JXcERRYWtjaTNUK25MLzRlV0R0?=
 =?utf-8?B?TWFtNlBObTNVRC82aFdvOFFjN05rbHFob2swVjhYWHU4aTFVT3YrQ0x4SkRo?=
 =?utf-8?B?enVyVTVjNDYyd0wxU3BsM0xScDFMcE5pUXFDYUs0cEhSWjhSbkNqc0hUWWtW?=
 =?utf-8?B?QXRsSDFFUldOeFhSQ3lLK3J2OHd3NENHb3lwV3U3N2JDSmdjNzRkMTVTSERH?=
 =?utf-8?B?NWdsM2tyWTBaNFRJQmFGMVY0cU1MMEJFZnh3R0ZiR3Vmak50bGE1TFBtYVFN?=
 =?utf-8?B?elNxbUhoV1c0TlVKc0VaczVnazhkS0kvRm4xdVhicTUzUXFOMFVDSEpIWU80?=
 =?utf-8?B?OHJabDFNMi84WnUxZU1wUW00d3A5Y3lKQkgybk9XUFJVSStHbnAyT2ZyQ0lZ?=
 =?utf-8?B?WUtTa3Y2YlljRnVsUjVWTHFLZ2l4VkRCdklmZVdFUXZrNHhRZlk5bHQ5WFlW?=
 =?utf-8?B?TTN5akZUcnlGcktabUxJSzVQTkc3L3hCMHpSVG9LZXdiRy9iTlFLOGYwVnJN?=
 =?utf-8?B?dEM0NEhkWnZsQSs0RjExb1QrUDhoZkxVZ0VZVlZ2UzRzNzFRQ2FaZWFBc2VN?=
 =?utf-8?B?ZjJhQXErMlJBRVJaV09VTkhKL045dW5ZOFMxYXZGSHI3R2xJSzkyejI4blcy?=
 =?utf-8?B?Skc2clFDbm9qZE5zaVVWaXNyK3d0Tld0UmhTc0F5OUZxd28yeUJDSEFmZFVo?=
 =?utf-8?B?d2xSVWFabDBZaTI2dXJpZUE3MURKNUV6Z0ZGK1JUc0d2eTJTSUlNV2FqS3ov?=
 =?utf-8?B?UmZwenFlZ2Iyd2lNZ2ZjWld4cnRjN1gvM2dvUVNoM0dFRjYwRVZPbzhmRS9t?=
 =?utf-8?B?VGxrSFhwTkc4OVN0bnVNSHkxbzcvdVNmbmVEeXBQYlN2T1JNSk9IWFQ4Y1FN?=
 =?utf-8?B?Z0pmLytKdFdjTklVdE9INnlrYmN2NEhkRzM0alRqNWovWnllQTFIUkM5RTdq?=
 =?utf-8?B?aGFra0tyaGtCa25zTTltSjVhK0U3RERSTHBzUmc0UjN2ZTZpdHl0WW1hMjEv?=
 =?utf-8?B?cHV4ZHFUVWwwL05DN0tta0ZOVDh4U09EUGZXR3poZCtUVC9OOGFiYmp0Ny9x?=
 =?utf-8?B?WEhWc1hTSDU1MlI1VTdZMUhhem1hK2ZJYmNnUlNBUEdUdk1sNVA0Z2NZRXNV?=
 =?utf-8?B?MG82WTJWaVFUdlFjcFBGTkhsMWFZMUZBMGoyWU5PajZPaHBTb1FSaTdGaTBF?=
 =?utf-8?B?dU9qMWFYc2NyQWpzaW42ZXYveHJaWUthVGpmWGREMmF4aHozbXR6MXJ0UENy?=
 =?utf-8?B?UUtiTTNHbjhoMFhxYzNwSjF5dzRhOVNraXdpZC9ZZkxNbi9paEpKV1I5UnFz?=
 =?utf-8?B?aFZuM1pBR05jTGd0czZLSjZXUWpVbzEwVjE0VzB6VGJnQkh2NXE2cStsNGoy?=
 =?utf-8?B?TXBEWHVET1hxSWpyTzFOMVY5aFREN3ZpMDlleWNPK2ljQko1TjVkSGM1by84?=
 =?utf-8?B?bVJCQi9KZGQ0Ny80cis1K3k3UXNIc1Q5dS94Wlg4bHBsQmFDUVRMQ3hkeTlo?=
 =?utf-8?B?Z2ZibldvWStMQUlIRHI1SnVSQ1MyajVDZkRIc0c4R01PWHk2V0dndDV4YSs3?=
 =?utf-8?Q?lkkeNxMNicLsjyxCDLpMpr0=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c77d42c-4b92-4100-f909-08da7e8644fc
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 06:20:37.8243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPtKbOrNfGWqX3ThfX/6VmHue4oWe4ujqSpi2HR9PzpzU7YWiCar5dvnzyKVeaYAKGlhZfvhPF5LAXrOOWbF83TYj3m59JcuPUERyjf6Hcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB6757
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Olof Johansson <olof@lixom.net>, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks Andrew for the review.

On 21/07/2022 09:02, Andrew Jeffery wrote:
> Hello,
> 
> On Wed, 20 Jul 2022, at 18:22, Quan Nguyen wrote:
>> The Mt. Mitchell BMC is an ASPEED AST2600-based BMC for the Mt. Mitchell
>> hardware reference platform with AmpereOne(TM) processor.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> Signed-off-by: Phong Vo <phong@os.amperecomputing.com>
>> Signed-off-by: Thang Q. Nguyen <thang@os.amperecomputing.com>
>> ---
>> v2 :
>>    + Remove bootargs                                       [Krzysztof]
>>    + Fix gpio-keys nodes name to conform with device tree binding
>>    documents                                               [Krzysztof]
>>    + Fix some nodes to use generic name                    [Krzysztof]
>>    + Remove unnecessary blank line                         [Krzysztof]
>>    + Fix typo "LTC" to "LLC" in license info and corrected license
>>    info to GPL-2.0-only
>>
>>   arch/arm/boot/dts/Makefile                    |   1 +
>>   .../boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 577 ++++++++++++++++++
>>   2 files changed, 578 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index f9484f5ef126..ecb9dafb8f1a 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -1573,6 +1573,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>   	aspeed-ast2600-evb.dtb \
>>   	aspeed-bmc-amd-ethanolx.dtb \
>>   	aspeed-bmc-ampere-mtjade.dtb \
>> +	aspeed-bmc-ampere-mtmitchell.dtb \
>>   	aspeed-bmc-arm-centriq2400-rep.dtb \
>>   	aspeed-bmc-arm-stardragon4800-rep2.dtb \
>>   	aspeed-bmc-asrock-e3c246d4i.dtb \
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
>> b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
>> new file mode 100644
>> index 000000000000..2e68f5264bb1
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
>> @@ -0,0 +1,577 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Copyright (c) 2022, Ampere Computing LLC
>> +
>> +/dts-v1/;
>> +
>> +#include "aspeed-g6.dtsi"
>> +#include <dt-bindings/gpio/aspeed-gpio.h>
>> +
>> +/ {
>> +	model = "Ampere Mt.Mitchell BMC";
>> +	compatible = "ampere,mtmitchell-bmc", "aspeed,ast2600";
>> +
>> +	chosen {
>> +		stdout-path = &uart5;
>> +	};
>> +
>> +	memory@80000000 {
>> +		device_type = "memory";
>> +		reg = <0x80000000 0x80000000>;
> 
> This is 2GB of memory
> 
>> +	};
>> +
>> +	reserved-memory {
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ranges;
>> +
>> +		gfx_memory: framebuffer {
>> +			size = <0x01000000>;
>> +			alignment = <0x01000000>;
>> +			compatible = "shared-dma-pool";
>> +			reusable;
>> +		};
>> +
>> +		video_engine_memory: video {
>> +			size = <0x04000000>;
>> +			alignment = <0x01000000>;
>> +			compatible = "shared-dma-pool";
>> +			reusable;
>> +		};
>> +
>> +		/* 1GB memory */
> 
> But you say 1GB of memory here
> 

Thank you for the review.

This comment will be removed in next version.

>> +		vga_memory: region@bf000000 {
>> +			no-map;
>> +			compatible = "shared-dma-pool";
>> +			reg = <0xbf000000 0x01000000>;  /* 16M */
> 
> And this makes sense for 1GB.
> 
> So I think your memory node has the wrong length in reg?
> 
>> +		};
>> +	};
>> +
>> +	gpio-keys {
>> +		compatible = "gpio-keys";
>> +
>> +		s0-overtemp-event {
>> +			label = "S0_OVERTEMP";
>> +			gpios = <&gpio0 ASPEED_GPIO(V, 7) GPIO_ACTIVE_LOW>;
>> +			linux,code = <ASPEED_GPIO(V, 7)>;
>> +		};
>> +
>> +		s0-hightemp-event {
>> +			label = "S0_HIGHTEMP";
>> +			gpios = <&gpio0 ASPEED_GPIO(V, 0) GPIO_ACTIVE_LOW>;
>> +			linux,code = <ASPEED_GPIO(V, 0)>;
>> +		};
>> +
>> +		s1-overtemp-event {
>> +			label = "S1_OVERTEMP";
>> +			gpios = <&gpio0 ASPEED_GPIO(X, 6) GPIO_ACTIVE_LOW>;
>> +			linux,code = <ASPEED_GPIO(X, 6)>;
>> +		};
>> +
>> +		s1-hightemp-event {
>> +			label = "S1_HIGHTEMP";
>> +			gpios = <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_LOW>;
>> +			linux,code = <ASPEED_GPIO(X, 3)>;
>> +		};
>> +	};
> 
> I really want us to stop using GPIO keys and just poll the GPIO in userspace if necessary.
> 
> The discussion here might help, eventually:
> 
> https://gerrit.openbmc.org/c/openbmc/dbus-sensors/+/54740
> 

Will remove them in next version.

BTW, We are testing with phosphor-multi-gpio-monitor daemon but facing 
issue as there is only one target (we are interesting on both RASING and 
FALLING edge of the gpio) and no extra information passed to the target 
to indicate whether it is on RAISING or FALLING edge of the gpio line.

>> +
>> +	voltage_mon_reg: voltage-mon-regulator {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "ltc2497_reg";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		regulator-always-on;
>> +	};
>> +
>> +	gpioI5mux: mux-controller {
>> +		compatible = "gpio-mux";
>> +		#mux-control-cells = <0>;
>> +		mux-gpios = <&gpio0 ASPEED_GPIO(I, 5) GPIO_ACTIVE_HIGH>;
>> +	};
>> +
>> +	adc0mux: adc0mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc0 0>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	adc1mux: adc1mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc0 1>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	adc2mux: adc2mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc0 2>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	adc3mux: adc3mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc0 3>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	adc4mux: adc4mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc0 4>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	adc5mux: adc5mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc0 5>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	adc6mux: adc6mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc0 6>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	adc7mux: adc7mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc0 7>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	adc8mux: adc8mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc1 0>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	adc9mux: adc9mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc1 1>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	adc10mux: adc10mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc1 2>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	adc11mux: adc11mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc1 3>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	adc12mux: adc12mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc1 4>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	adc13mux: adc13mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc1 5>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	adc14mux: adc14mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc1 6>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	adc15mux: adc15mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc1 7>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	iio-hwmon {
>> +		compatible = "iio-hwmon";
>> +		io-channels = <&adc0mux 0>, <&adc0mux 1>,
>> +			<&adc1mux 0>, <&adc1mux 1>,
>> +			<&adc2mux 0>, <&adc2mux 1>,
>> +			<&adc3mux 0>, <&adc3mux 1>,
>> +			<&adc4mux 0>, <&adc4mux 1>,
>> +			<&adc5mux 0>, <&adc5mux 1>,
>> +			<&adc6mux 0>, <&adc6mux 1>,
>> +			<&adc7mux 0>, <&adc7mux 1>,
>> +			<&adc8mux 0>, <&adc8mux 1>,
>> +			<&adc9mux 0>, <&adc9mux 1>,
>> +			<&adc10mux 0>, <&adc10mux 1>,
>> +			<&adc11mux 0>, <&adc11mux 1>,
>> +			<&adc12mux 0>, <&adc12mux 1>,
>> +			<&adc13mux 0>, <&adc13mux 1>,
>> +			<&adc14mux 0>, <&adc14mux 1>,
>> +			<&adc15mux 0>, <&adc15mux 1>,
>> +			<&adc_i2c 0>, <&adc_i2c 1>,
>> +			<&adc_i2c 2>, <&adc_i2c 3>,
>> +			<&adc_i2c 4>, <&adc_i2c 5>,
>> +			<&adc_i2c 6>, <&adc_i2c 7>,
>> +			<&adc_i2c 8>, <&adc_i2c 9>,
>> +			<&adc_i2c 10>, <&adc_i2c 11>,
>> +			<&adc_i2c 12>, <&adc_i2c 13>,
>> +			<&adc_i2c 14>, <&adc_i2c 15>;
>> +	};
>> +};
>> +
>> +&mdio0 {
>> +	status = "okay";
>> +
>> +	ethphy0: ethernet-phy@0 {
>> +		compatible = "ethernet-phy-ieee802.3-c22";
>> +		reg = <0>;
>> +	};
>> +};
>> +
>> +&mac0 {
>> +	status = "okay";
>> +
>> +	phy-mode = "rgmii";
>> +	phy-handle = <&ethphy0>;
>> +
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_rgmii1_default>;
>> +};
>> +
>> +&fmc {
>> +	status = "okay";
>> +	flash@0 {
>> +		status = "okay";
>> +		m25p,fast-read;
>> +		label = "bmc";
>> +		spi-max-frequency = <50000000>;
>> +#include "openbmc-flash-layout-64.dtsi"
>> +	};
>> +
>> +	flash@1 {
>> +		status = "okay";
>> +		m25p,fast-read;
>> +		label = "alt-bmc";
>> +		spi-max-frequency = <50000000>;
>> +#include "openbmc-flash-layout-64-alt.dtsi"
>> +	};
>> +};
>> +
>> +&spi1 {
>> +	status = "okay";
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_spi1_default>;
>> +
>> +	flash@0 {
>> +		status = "okay";
>> +		m25p,fast-read;
>> +		label = "pnor";
>> +		spi-max-frequency = <20000000>;
>> +	};
>> +};
>> +
>> +&uart1 {
>> +	status = "okay";
>> +};
>> +
>> +&uart2 {
>> +	status = "okay";
>> +};
>> +
>> +&uart3 {
>> +	status = "okay";
>> +};
>> +
>> +&uart4 {
>> +	status = "okay";
>> +};
>> +
>> +&i2c0 {
>> +	status = "okay";
>> +
>> +	temperature-sensor@2e {
>> +		compatible = "adi,adt7490";
>> +		reg = <0x2e>;
>> +	};
>> +};
>> +
>> +&i2c1 {
>> +	status = "okay";
>> +};
>> +
>> +&i2c2 {
>> +	status = "okay";
>> +
>> +	psu@58 {
>> +		compatible = "pmbus";
>> +		reg = <0x58>;
>> +	};
>> +
>> +	psu@59 {
>> +		compatible = "pmbus";
>> +		reg = <0x59>;
>> +	};
>> +};
>> +
>> +&i2c3 {
>> +	status = "okay";
>> +};
>> +
>> +&i2c4 {
>> +	status = "okay";
>> +
>> +	adc_i2c: adc-i2c@16 {
>> +		compatible = "lltc,ltc2497";
>> +		reg = <0x16>;
>> +		vref-supply = <&voltage_mon_reg>;
>> +		#io-channel-cells = <1>;
>> +		status = "okay";
>> +	 };
>> +
>> +	eeprom@50 {
>> +		compatible = "atmel,24c64";
>> +		reg = <0x50>;
>> +		pagesize = <32>;
>> +	};
>> +
>> +	i2c-mux@70 {
>> +		compatible = "nxp,pca9545";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		reg = <0x70>;
>> +		i2c-mux-idle-disconnect;
>> +
>> +		i2c4_bus70_chn0: i2c@0 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0x0>;
>> +
>> +			outlet_temp1: temperature-sensor@48 {
>> +				compatible = "ti,tmp75";
>> +				reg = <0x48>;
>> +			};
>> +			psu1_inlet_temp2: temperature-sensor@49 {
>> +				compatible = "ti,tmp75";
>> +				reg = <0x49>;
>> +			};
>> +		};
>> +
>> +		i2c4_bus70_chn1: i2c@1 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0x1>;
>> +
>> +			pcie_zone_temp1: temperature-sensor@48 {
>> +				compatible = "ti,tmp75";
>> +				reg = <0x48>;
>> +			};
>> +			psu0_inlet_temp2: temperature-sensor@49 {
>> +				compatible = "ti,tmp75";
>> +				reg = <0x49>;
>> +			};
>> +		};
>> +
>> +		i2c4_bus70_chn2: i2c@2 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0x2>;
>> +
>> +			pcie_zone_temp2: temperature-sensor@48 {
>> +				compatible = "ti,tmp75";
>> +				reg = <0x48>;
>> +			};
>> +			outlet_temp2: temperature-sensor@49 {
>> +				compatible = "ti,tmp75";
>> +				reg = <0x49>;
>> +			};
>> +		};
>> +
>> +		i2c4_bus70_chn3: i2c@3 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0x3>;
>> +
>> +			mb_inlet_temp1: temperature-sensor@7c {
>> +				compatible = "microchip,emc1413";
>> +				reg = <0x7c>;
>> +			};
>> +			mb_inlet_temp2: temperature-sensor@4c {
>> +				compatible = "microchip,emc1413";
>> +				reg = <0x4c>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&i2c5 {
>> +	status = "okay";
>> +
>> +	i2c-mux@70 {
>> +		compatible = "nxp,pca9548";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		reg = <0x70>;
>> +		i2c-mux-idle-disconnect;
>> +	};
>> +};
>> +
>> +&i2c6 {
>> +	status = "okay";
>> +	rtc@51 {
>> +		compatible = "nxp,pcf85063a";
>> +		reg = <0x51>;
>> +	};
>> +};
>> +
>> +&i2c7 {
>> +	status = "okay";
>> +};
>> +
>> +&i2c9 {
>> +	status = "okay";
>> +};
>> +
>> +&i2c11 {
>> +	status = "okay";
>> +};
>> +
>> +&i2c14 {
>> +	status = "okay";
>> +	eeprom@50 {
>> +		compatible = "atmel,24c64";
>> +		reg = <0x50>;
>> +		pagesize = <32>;
>> +	};
>> +
>> +	bmc_ast2600_cpu: temperature-sensor@35 {
>> +		compatible = "ti,tmp175";
>> +		reg = <0x35>;
>> +	};
>> +};
>> +
>> +&adc0 {
>> +	ref_voltage = <2500>;
>> +	status = "okay";
>> +
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
>> +		&pinctrl_adc2_default &pinctrl_adc3_default
>> +		&pinctrl_adc4_default &pinctrl_adc5_default
>> +		&pinctrl_adc6_default &pinctrl_adc7_default>;
>> +};
>> +
>> +&adc1 {
>> +	ref_voltage = <2500>;
>> +	status = "okay";
>> +
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
>> +		&pinctrl_adc10_default &pinctrl_adc11_default
>> +		&pinctrl_adc12_default &pinctrl_adc13_default
>> +		&pinctrl_adc14_default &pinctrl_adc15_default>;
>> +};
>> +
>> +&vhub {
>> +	status = "okay";
>> +};
>> +
>> +&video {
>> +	status = "okay";
>> +	memory-region = <&video_engine_memory>;
>> +};
>> +
>> +&gpio0 {
>> +	gpio-line-names =
>> +	/*A0-A7*/	"","","","","","i2c2-reset-n","i2c6-reset-n","i2c4-reset-n",
>> +	/*B0-B7*/	"","","","","host0-sysreset-n","host0-pmin-n","","",
>> +	/*C0-C7*/	"s0-vrd-fault-n","s1-vrd-fault-n","bmc-debug-mode","",
> 
> Mildly interested in the functionality of "bmc-debug-mode" :)
> 

This gpio will be removed in next version.

>> +			"irq-n","","vrd-sel","spd-sel",
>> +	/*D0-D7*/	"presence-ps0","presence-ps1","hsc-12vmain-alt2-n","ext-high-temp-n",
>> +			"","bmc-ncsi-txen","","",
> 
> Is "bmc-ncsi-txen" something that should be associated with the MAC?
> 
>> +	/*E0-E7*/	"eth-phy-rst-n","eth-phy-int-n","clk50m-bmc-ncsi","","","","","",
> 
> Same question for eth-phy-rst-n and eth-phy-int-n.
> 
These two gpios will be removed in next version as well

>> +	/*F0-F7*/	"s0-pcp-oc-warn-n","s1-pcp-oc-warn-n","power-chassis-control",
>> +			"cpu-bios-recover","cpld-done","hs-scout-proc-hot",
>> +			"s0-vr-hot-n","s1-vr-hot-n",
>> +	/*G0-G7*/	"","","hsc-12vmain-alt1-n","bmc-salt12-s0-ssif-n","","","","",
>> +	/*H0-H7*/	"","fpga-program-b","wd-disable-n","power-chassis-good","","","","",
>> +	/*I0-I7*/	"","","","","","adc-sw","power-button","rtc-battery-voltage-read-enable",
>> +	/*J0-J7*/	"","","","","","","","",
>> +	/*K0-K7*/	"","","","","","","","",
>> +	/*L0-L7*/	"","","","","","","","",
>> +	/*M0-M7*/	"bmc-uart-cts1","s0-ddr-save","soc-spi-nor-access","presence-cpu0",
>> +			"s0-rtc-lock","","","",
> 
> Why isn't "bmc-uart-cts1" muxed into the associated UART? Why is it a GPIO?
> 
Will remove in next version

>> +	/*N0-N7*/	"hpm-fw-recovery","hpm-stby-rst-n","jtag-sel-s0","led-sw-hb",
>> +			"jtag-dbgr-prsnt-n","","","",
>> +	/*O0-O7*/	"","","","","","","","",
>> +	/*P0-P7*/	"ps0-ac-loss-n","ps1-ac-loss-n","","",
>> +			"led-fault","cpld-user-mode","jtag-srst-n","led-bmc-hb",
>> +	/*Q0-Q7*/	"","","","","","","","",
>> +	/*R0-R7*/	"","","","","","","","",
>> +	/*S0-S7*/	"","","identify-button","led-identify",
>> +			"s1-ddr-save","spi-nor-access","sys-pgood","presence-cpu1",
>> +	/*T0-T7*/	"","","","","","","","",
>> +	/*U0-U7*/	"","","","","","","","",
>> +	/*V0-V7*/	"s0-hightemp-n","s0-fault-alert","s0-sys-auth-failure-n",
>> +			"host0-reboot-ack-n","host0-ready","host0-shd-req-n",
>> +			"host0-shd-ack-n","s0-overtemp-n",
>> +	/*W0-W7*/	"ocp-aux-pwren","ocp-main-pwren","ocp-pgood","",
>> +			"bmc-ok","bmc-ready","spi0-program-sel","spi0-backup-sel",
>> +	/*X0-X7*/	"i2c-backup-sel","s1-fault-alert","s1-fw-boot-ok",
>> +			"s1-hightemp-n","s0-spi-auth-fail-n","s1-sys-auth-failure-n",
>> +			"s1-overtemp-n","cpld-s1-spi-auth-fail-n",
>> +	/*Y0-Y7*/	"","","","","","","bmc-spi-fm-boot-abr-pd","host0-special-boot",
>> +	/*Z0-Z7*/	"reset-button","ps0-pgood","ps1-pgood","","","","","";
>> +};
>> +
>> +&gpio1 {
>> +	gpio-line-names =
>> +	/*18A0-18A7*/	"","","","","","","","",
>> +	/*18B0-18B7*/	"","","","","emmc-rst-n","","s0-soc-pgood","",
> 
> "emmc-rst-n" should be specified as part of mmc-pwrseq-emmc, right?
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/mmc/mmc-pwrseq-emmc.yaml?h=v5.19-rc7
> 

Agree, this pin should be part of mmc-pwrseq-emmc and will be removed in 
next version.

Thanks a lot for the comment.
- Quan
