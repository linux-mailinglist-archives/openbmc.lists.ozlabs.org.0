Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6826806B8
	for <lists+openbmc@lfdr.de>; Mon, 30 Jan 2023 08:47:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P50dS0Pgnz3cGm
	for <lists+openbmc@lfdr.de>; Mon, 30 Jan 2023 18:47:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=CCwOK00i;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.92.116; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=CCwOK00i;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2116.outbound.protection.outlook.com [40.107.92.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P50cp2fvrz3bW6
	for <openbmc@lists.ozlabs.org>; Mon, 30 Jan 2023 18:46:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOgzrWGhsIPigA00fX5/UrWWKuH4a1BW316krYEgd2y1hzWBpMYM5JwBe9YH+z1GF14oifm52ZrHKVA0RYWd+cCoAWKzJCr7n84lSKCn8eeqOH5luUj6Utojnq4eF4V6kVkBAJLFi5NR4ea+CSVepZ2+8TgbGZMeWrroS0wD3qq1g+kYhlLBXwK/AT0dJkg7MryrgtyJy61jlqrbC1Eh0D2rwjgmefmlydpI9PucU00qJ8qxkzLpu/OxTwLmebD3MoONzWKmu+rwDomc8+xIOshUpjMr+8HZ7sqq+OZMObJfWEKi4Skt/7ImnjCyG/AOFlqupxg5/kTmcaadIL9awg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vda2CUsptO5bgbjXloP9/ErNOpebSx5R2L6uyLnr6YA=;
 b=ElrWc7q/OECPVESoJA7KO2cB71wfjwHcc2MRvVBRqfL30TmAcWeREUssXTvCY6C2nipl98C+o3OjomS5P/e+ClIxu7ADqpEm4xPsYsngOhnQNYibzP/kTM2O7Nm4utg1srore6NstP1Tqb5t/h6X+bLYJ694LPlm8XQ+4IPws8eKmCZHOJmDmnglHDbSY47/TFuZv7FfXbwqnPhztDxJjaq/2AZ5qH14YFzDTTVfAVamekgvnLCeo8sa6InfUZpfS1giyGZ5TYfd4QxjJYQcQMXF6J926ZVL8miYOPDj3xZVfmhyxf7IIVJ5TiOzcuNS71raOcKm9ZAODXEzms4Exg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vda2CUsptO5bgbjXloP9/ErNOpebSx5R2L6uyLnr6YA=;
 b=CCwOK00iPeOjLU9pyTW7jj+GwiQAfAw8YkwQRs9dc2GEOfG+nlq0lvqbvRjIP7nAauQBf2u65ZA2AfSsS2T4Z/p3KkM/YPBoiAO8sKKVUwTQsvR3j5G8M9HA/MdMczfK+9MMpBYxcvB2viXu42H0L6Du0CYL2GZ2WM5qHSPZRWo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 BL0PR01MB4035.prod.exchangelabs.com (2603:10b6:208:4d::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.36; Mon, 30 Jan 2023 07:46:24 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::bf6:8038:9fe8:1588]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::bf6:8038:9fe8:1588%4]) with mapi id 15.20.6043.022; Mon, 30 Jan 2023
 07:46:24 +0000
Message-ID: <059e6f95-ceca-1e1d-d3ee-7e65f627abc8@os.amperecomputing.com>
Date: Mon, 30 Jan 2023 14:46:07 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2] ARM: dts: aspeed: add
 Ampere's Mt. Mitchell BMC
Content-Language: en-CA
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Zev Weiss <zweiss@equinix.com>
References: <20221208065738.814805-1-quan@os.amperecomputing.com>
 <d1bed86c-b0f2-1743-26d7-0fc71705d2f1@os.amperecomputing.com>
In-Reply-To: <d1bed86c-b0f2-1743-26d7-0fc71705d2f1@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::10) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|BL0PR01MB4035:EE_
X-MS-Office365-Filtering-Correlation-Id: 636c5fd9-d20b-46b6-e682-08db02961629
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	kc3GgK/E3sHtwLYZ0zhn+atHNLgYFdUo/fqz4jb88qUApc0XA8l+Fvy1a+dfBRVpLG56a9JDIBhti99AMjHAHXz1OZ2ztTyfQsaFSiLDw/6FNtjwoNXDXOls2w8l1pmvHCFq30KOGEtkuGK9Kine+kdKDsI5qXqD2LYVaZ5c2PPWZPb+PSt8pPyRwRXg7O4Pb8eb/lCFawl5OrIS+f6EoN3noSI/8VV30uQojArFTT8qc0kopYHdMzuJQujD64Ua1jNmm5igdO3UcQephVa4Q4QveGvqDcurikx6ATcuDRPZQbsdvhy7LgQ/vwjnBRaiKE8QG03N3Jttwr2gHToIdIbgcNpQxc4HDrcT08CQNZGXHDfMi/MLmrWUczm6fXAzV/j8RmNK9wajUJnJ5bduWjd0sBOBe+nOeEuZytN/884eckBGMCvCVCC72a0fqiPQEh/ZySvqsIHR0XmxAdezUNDXAU3RXzSvuDmnjVA67/EbGDScZE9p2rUGD9bbTpWr9GQd8yvXPSNuXWOCPUk4vAVuDPK9bjXgglhmW0p8HtdviMC/IM7H1uNr6tMoj4Mm0tdqHqjrp01xrTkMbB1kE46oVgceLT51mjmCQWSfU0PRppi0bxSXl8+RBXcbJOVSzrZQQSpmndaSo34Ke1FgGKHPTiJNmVyEvRPlQ/MAf2N9pS5INC4WTxC3ZHopKdUmqe2w91q20RVvMm9AFZM8+hgc3eLy94buxeVPdmsho40=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(366004)(136003)(376002)(39840400004)(451199018)(31686004)(83380400001)(54906003)(110136005)(26005)(6512007)(186003)(316002)(2906002)(38100700002)(38350700002)(6486002)(478600001)(66476007)(66556008)(8676002)(66946007)(86362001)(31696002)(6666004)(107886003)(53546011)(52116002)(2616005)(6506007)(41300700001)(4326008)(5660300002)(8936002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?N1lOdGMrdndtR3NPcXhPVmZrWHZhQU9SbmhwaUcyNGYzZ1g0N0R4cDhYYy8x?=
 =?utf-8?B?S09JREJxN3diSEJ2di9xNGQvRDJVckdkVGhXZGpvOVZ4dzN6RE5xV3U3NnpO?=
 =?utf-8?B?TElXaWt0UzhnZk9lcXlwSWxTQUJQQlJ6VW11OGtVKzNkNndTOThZSEI3ekJn?=
 =?utf-8?B?M3dnWXBBVjhNN2MzMUVqbmp2a3ZyQ01Sa2Q0V2pRRmg0alBleU1yRkN3WldZ?=
 =?utf-8?B?ODBTQkZ1RWMxS3lsVGEvUHhLY29IcE8wL3Uxc0pQT1VzQnZhN3lVbjUwZGZ1?=
 =?utf-8?B?amJUOGNGaUg2djNDeUtkTHZxK1VDeHJldlM3ZVFZVDcrdXJha0RQeHdKaFFC?=
 =?utf-8?B?T01zeGVWM0ZzY1EyQlZtTitNckpVMUpGQk9oSVU1RXk2ZkphdGc5ek9YbTFJ?=
 =?utf-8?B?cEY5Mm5mTldicndkWXk1ZHJMWElZS0tmZW1Bdm03SDk0VmJGZERiaTJBaSs4?=
 =?utf-8?B?SW9nSzREeUJPcFVJaEVqOHZVNG1vS0Q2ek1KWWNrSjNGWTJxUzZEcFhSdGk4?=
 =?utf-8?B?cTVYT0VHWk5jbVJYc2ZuRUJEdGp2RUREaGhidWl1RVRMdjNOVDhCOTI1T29a?=
 =?utf-8?B?SFFHK2hzMEZrb0N2Rm5EREtWS2kvQ2wwVW9DbkNYVUFPWElWNXVYQWQ1a0lS?=
 =?utf-8?B?Y1NOeUJtalJscmc1bkswN0pKWlNaODFQbmIzZWVMbHhPWDM3NjRrS1RYbTU2?=
 =?utf-8?B?RkdmMkJnaG1KL1BPcDFna3kyT1F4eVdGTlI3Z0pTb1Yzejh2cmllTkpFclRZ?=
 =?utf-8?B?c2FaUnJaUC9mY1NkOE9RVWh0WEJ3d010ZE9HTFZJOXNjdEhqTmZ0eHJkRWxV?=
 =?utf-8?B?SllOMlU5bmxBdEF1V0lUYmtPcHVWRWJXVU1zMm5MTDE2MEMzbkIvaGVDYVhQ?=
 =?utf-8?B?UEQ3UjBoQkV3b1VObGxUUkxFdFpzM2RLcklYQnRiTWFURU9SZHJSRTcwSXBy?=
 =?utf-8?B?elVYdE5vVDNXYUhsS2pHekpxbWlYaDB5SEZCcGlUYWtFNjUycmtBWnorRHVC?=
 =?utf-8?B?SVNGaGlDMWRuRkdXZWNmSzNOenNjcnNXUE9KRm1YNzBCYWxNZU9EWTMxSDZJ?=
 =?utf-8?B?K240UjdTRFJMOTNQNVZmTlljZlBCRmR4Wms4TmNlZWEyWTFOQWExZjd3VmIw?=
 =?utf-8?B?M0dMMm1OQnJ1YVlWVnNWbG1FL2Zrenp1ZlJFa0RSd1hOcER0RWV4K3pBVG9J?=
 =?utf-8?B?ejYzZk5QVWFYTER3MWdtM01aMFdOaCtlaGpYNC9kM29mbHhFZ2pwUCtYM0pX?=
 =?utf-8?B?SmxzRmlFVm1zQTdiMGtJOTZtcHlWMFJyR2FENThiMVFVTm1kTVU2c1NCay9h?=
 =?utf-8?B?TUlqeTBBTTZZd0RIT3JyYU1VMkFneUs0NWVXK0x5UjFRYXFkV1pPY2RXWkxR?=
 =?utf-8?B?YzdScEczdWIxZ1c4VDhXOXcxVFdxQ0Yxc2JCdkdVZDNteWxhYXdWV2REZjNr?=
 =?utf-8?B?TXczUGxBVFBLRkMzWVJVK2g4cGdrZWlXNDVkN3A4L056S01mR0t2OXVvcThB?=
 =?utf-8?B?UGpXa1JBejZSZThYYXhFTGQvTjVNMEk5UW1aTGtOSTBEZkNnb0lNV1FUV2FX?=
 =?utf-8?B?NGVYS1NjengzTGoyS3gvNXU4cGRROXR6bFdvS2RpT3oxRHBVenRvTHM4bkpi?=
 =?utf-8?B?cXNVV1FmSGRLalRXZkFJRXhKd2VLdzVuTkNMUS9zNTZmYzhqcWhqbzQrbFN3?=
 =?utf-8?B?Vk83Qm5lUndvU2ZNcHBKWG5qcU9hZDRPZUFiR3FWcDd0ai9iaHBQd0N1bHpQ?=
 =?utf-8?B?eGhOTkZhMVhJa3pVb0hpTmJxSk0xcDh3elFzV3Jzdm9aTDUyS0V4SXIzLzBr?=
 =?utf-8?B?a29CR0xiTjFWVVNCNit2YXdkS1RzSTZMV01aZUl0UFFLaXJDQkNnUU9XeWlk?=
 =?utf-8?B?aXZJQk95dDMvT1RqZ2dqZE9mNzBNUW4wbW5GMGJWY1pacC8yWmJOSFh3TnA1?=
 =?utf-8?B?dFFqQUJ2LzljVnh5L3pVY216aG1DaEczVlRPdlB1UytvRXlLSmVwNmFTUmUx?=
 =?utf-8?B?aDhpd2lCcXBjU0NDSkJDTnVLWE5TQ3U3MzNteXJ1WExKSVBxQnEzeHhiWDdn?=
 =?utf-8?B?ekxvZ0NuSHpUencwSXNTMkh4VStqMlNZdE5XTWlOeS9CZFpTeVZuVzJCUFFW?=
 =?utf-8?B?UXF4NU1mOW9ZZXRVZzdZTUZZSkU4Q2h3K2E5N1FtMlNNNVovMnBySnVld29s?=
 =?utf-8?Q?HivG0Ob1bpK685o7Bfh5D3o=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 636c5fd9-d20b-46b6-e682-08db02961629
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 07:46:24.7171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VB4h00xOUt1nS9YA/6oP1aNuIUQ7ZPevTaNtkucm875GNUhT0WaXltQvFsRziNHPZ14KGILUyYHSt1Dy5tb2OFYbKFr8Yy4/IhksEW8FCW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4035
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

Dear reviewers,

Thank you a lot for the reviews and comments so far on the patch.
In fact, I'm still scratching my head and confused if this patch still 
needs some improvement or I just need to wait for it to get merged?

Thank you,
- Quan

On 03/01/2023 15:28, Quan Nguyen wrote:
> Just a gentle ping on the patch.
> Thank you and Happy New Year,
> - Quan
> 
> On 08/12/2022 13:57, Quan Nguyen wrote:
>> Add initial device tree for Aspeed AST2600-based Mt. Mitchell
>> BMC found on AmpereOne's reference platform.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> Reviewed-by: Zev Weiss <zweiss@equinix.com>
>> ---
>> v2:
>> - Fix tab issue                                        [Zev Weiss]
>> ---
>>   arch/arm/dts/Makefile               |   1 +
>>   arch/arm/dts/ast2600-mtmitchell.dts | 114 ++++++++++++++++++++++++++++
>>   2 files changed, 115 insertions(+)
>>   create mode 100644 arch/arm/dts/ast2600-mtmitchell.dts
>>
>> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
>> index 6c34b83336..b6f9df21fc 100755
>> --- a/arch/arm/dts/Makefile
>> +++ b/arch/arm/dts/Makefile
>> @@ -687,6 +687,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>       ast2600-dcscm.dtb \
>>       ast2600-fpga.dtb \
>>       ast2600-intel.dtb \
>> +    ast2600-mtmitchell.dtb \
>>       ast2600-ncsi.dtb \
>>       ast2600-p10bmc.dtb \
>>       ast2600-pfr.dtb \
>> diff --git a/arch/arm/dts/ast2600-mtmitchell.dts 
>> b/arch/arm/dts/ast2600-mtmitchell.dts
>> new file mode 100644
>> index 0000000000..ad95be43da
>> --- /dev/null
>> +++ b/arch/arm/dts/ast2600-mtmitchell.dts
>> @@ -0,0 +1,114 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Copyright (c) 2022, Ampere Computing LLC
>> +
>> +/dts-v1/;
>> +
>> +#include "ast2600-u-boot.dtsi"
>> +
>> +/ {
>> +    model = "Ampere Mt.Mitchell BMC";
>> +    compatible = "ampere,mtmitchell-bmc", "aspeed,ast2600";
>> +
>> +    memory {
>> +        device_type = "memory";
>> +        reg = <0x80000000 0x40000000>;
>> +    };
>> +
>> +    chosen {
>> +        stdout-path = &uart5;
>> +    };
>> +
>> +    aliases {
>> +        spi0 = &fmc;
>> +        ethernet0 = &mac0;
>> +    };
>> +
>> +    cpus {
>> +        cpu@0 {
>> +            clock-frequency = <800000000>;
>> +        };
>> +        cpu@1 {
>> +            clock-frequency = <800000000>;
>> +        };
>> +    };
>> +};
>> +
>> +&uart5 {
>> +    u-boot,dm-pre-reloc;
>> +    status = "okay";
>> +};
>> +
>> +&sdrammc {
>> +    clock-frequency = <400000000>;
>> +};
>> +
>> +&wdt1 {
>> +    status = "okay";
>> +};
>> +
>> +&wdt2 {
>> +    status = "okay";
>> +};
>> +
>> +&wdt3 {
>> +    status = "okay";
>> +};
>> +
>> +&mdio {
>> +    status = "okay";
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&pinctrl_mdio1_default &pinctrl_mdio2_default
>> +             &pinctrl_mdio3_default &pinctrl_mdio4_default>;
>> +    #address-cells = <1>;
>> +    #size-cells = <0>;
>> +    ethphy0: ethernet-phy@0 {
>> +        reg = <0>;
>> +    };
>> +};
>> +
>> +&mac0 {
>> +    status = "okay";
>> +    phy-mode = "rgmii-rxid";
>> +    phy-handle = <&ethphy0>;
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&pinctrl_rgmii1_default>;
>> +};
>> +
>> +&fmc {
>> +    status = "okay";
>> +
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&pinctrl_fmcquad_default>;
>> +
>> +    flash@0 {
>> +        compatible = "spi-flash", "sst,w25q256";
>> +        status = "okay";
>> +        spi-max-frequency = <50000000>;
>> +        spi-tx-bus-width = <4>;
>> +        spi-rx-bus-width = <4>;
>> +    };
>> +
>> +    flash@1 {
>> +        compatible = "spi-flash", "sst,w25q256";
>> +        status = "okay";
>> +        spi-max-frequency = <50000000>;
>> +        spi-tx-bus-width = <4>;
>> +        spi-rx-bus-width = <4>;
>> +    };
>> +};
>> +
>> +&scu {
>> +    mac0-clk-delay = <0x10 0x0a
>> +              0x10 0x10
>> +              0x10 0x10>;
>> +};
>> +
>> +&hace {
>> +    u-boot,dm-pre-reloc;
>> +    status = "okay";
>> +};
>> +
>> +&acry {
>> +    u-boot,dm-pre-reloc;
>> +    status = "okay";
>> +};
