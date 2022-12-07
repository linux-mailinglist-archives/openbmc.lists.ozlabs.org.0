Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9CF6453FB
	for <lists+openbmc@lfdr.de>; Wed,  7 Dec 2022 07:28:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRnRJ0WV0z3bcM
	for <lists+openbmc@lfdr.de>; Wed,  7 Dec 2022 17:28:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=FAzBCTXF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e83::725; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=FAzBCTXF;
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on20725.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e83::725])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRnQh0YFfz3bXQ
	for <openbmc@lists.ozlabs.org>; Wed,  7 Dec 2022 17:27:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z1doXOkIcturxmy02RhH/dlh/suQG5FGgUCj0WxgR+r39cC8j7BylHDh/0o58CqczWt1dmapHHRphp+D3xjBKgxb4pYnTX/id9LJ6a+SFxpS7i+oEGvwDbJVRokCAN1gfKd2Xp6yE6/jgeRK2FzxQjYnVnx90VByITgcz+ga+lbKood5SCQltLre9sHR4mlBs9jHmPthJCjRVQ/emt+AlmO2vd2e4AlPYPH8oGB7bS04gygXVTAZFheJl2urXYuJuVI0VIPsPoCQy58UJrKpPRTyfaLwcuqu6WLEuQkYvcquuWoj0e8GJv3A1zAd/xhUvI8QPFKc9rSFlYRPEtri8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yec/oYLmL7JE55LBRmjn1xZ7bXK8wNRFtB0zjBBxRx8=;
 b=lWePmbA4OV+H9TY8ZLeTNNa/63wmYiGwcpTNc4P8DUmxHNuUUbnymHznVr6MDRd2xNOQhYinCgjTBsEzPpLT5uFLfb4PI7vCi2/TjbFf9M4vJgumvckiQn00uZhwCYCrmbAFcvCHjB5sEx3aaJKDeN19/j0N2U1xkHy1dBNlCEH+fPZ5tqizK4Dq8gZEZcWfa6qfpmV58HzfgPp184qYv9qyKG0IkaCwm5Q3UPoqKp5+1fXxnq2Xeo2Q2WbTgFnCJqC4xD53SqIWGfR8teWReFiIDOc0/KH2k43JTtagdUETNeDbaKkHHXfvca0mXZUNKfaopX2WzUPjTDuvqR4iJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yec/oYLmL7JE55LBRmjn1xZ7bXK8wNRFtB0zjBBxRx8=;
 b=FAzBCTXFT7LtmJwSbhp4QDyYl3wEFDWVURk1qnKaEdj3jbnxHUxHVCVr4BwYVwhJza34Z1pihsRrffzQL51ayAH9IrJ4+rtf8iMCFW6sBshygyKBtOXNHa4JJWnvKZ7gGA2iiYfMakFbLpQj+lSnmoz2unOKKSCCcEwSXTSg4KI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 BL0PR01MB5057.prod.exchangelabs.com (2603:10b6:208:68::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.11; Wed, 7 Dec 2022 06:27:36 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5bc2:68ec:263:8993]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5bc2:68ec:263:8993%6]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 06:27:36 +0000
Message-ID: <8306f206-2829-7829-2102-6173c526421b@os.amperecomputing.com>
Date: Wed, 7 Dec 2022 13:27:18 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] ARM: dts: aspeed: add
 Ampere's Mt. Mitchell BMC
Content-Language: en-CA
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20221107071348.3996144-1-quan@os.amperecomputing.com>
 <f934da7e-5af6-9f81-bea9-e120d022c257@os.amperecomputing.com>
In-Reply-To: <f934da7e-5af6-9f81-bea9-e120d022c257@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0124.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::28) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|BL0PR01MB5057:EE_
X-MS-Office365-Filtering-Correlation-Id: f8da2b74-fe9e-4f76-0e99-08dad81c20eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	62QIBG3DJ6f9TANaOOcs4DUQrjUbbEhZnuMXUH6z5VcXnFsymeTRWZCssEEXs/VmMaVjtN4HfzzKoVqq159OlW2aT7UdI8r78fOIDeUEkdfhY4PTF0m1L3MXvlVFW0nDRVWxsHJXdy+6QJQuU+ebu3geKMPXwBLCrNc16uXxzxeHyI5RWXybOW7A44TuICkwWXgAhsnG2lXvksgDxzxtG+bIIXen0oqn9lM4ny7gLDYPyfx0AsCZDVs5CjDj+bq8u8phAqNZgUKcxqhIY9Vir91rhBpH9iBtnQ91bjqJ6Hlxw3pZyUvPNTPo05wGGnsqWEV4S3GLo9yEOt+SWkCs0K6RIh8dOzVDoZaq+z8HptyBOqFlDzonUUT+obSVx70ha6xWRC6vRsAm5QlLg2ClTTLcJ3dN2SdwOcEj991oYFfAzdsipBQHIn/P+1o0Zs+GGqird7yGZqe67KjowullD8xxKwfGEV1CHoccCHeYDnTvJyeur8M/uCH/DBEeWoOhf2wQyt3EhoZYHP+1XypGqgVf1QHPjuvRQ9A5mblqEfxKOIM/+lGNoD89WS8us8WcbW1PruUXNaRlbRXqH19gVRkkSdtM+XlX0s8+MmYC2lUpD++8H0dEOUQlAq4vJOQ9ZbqMTvF7v55DOde3rnkcDWFqi/iOY/WsYznp+h34z6nZyBRwWuNoqRHm0Lh2KmEeWLZ3uuQdIDkq891BmB5OKowChYwORkPHxS/leQcFJus=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(346002)(396003)(39850400004)(451199015)(31686004)(31696002)(6506007)(86362001)(478600001)(53546011)(6486002)(52116002)(26005)(38350700002)(2616005)(38100700002)(83380400001)(186003)(8936002)(4326008)(5660300002)(41300700001)(8676002)(107886003)(6666004)(66946007)(66556008)(316002)(2906002)(6512007)(66476007)(54906003)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?ZzI4ZVhyRXR6VUVZYjJNZDBpMWlxZzlDdk1qczNraDV4UVFLSVhoRkwwVGxq?=
 =?utf-8?B?eUtITDNuOXVuM2FvM1lpcENmMjNRVVQ1SUFGc3lMenB4THFkNHVzanp3dlRV?=
 =?utf-8?B?cXNwT0Vzck9ZZDFPbkFqNXJaS3pxSkE1ZjM5Mmdydk9wVTdLaG9HZUxuRTB2?=
 =?utf-8?B?K3krd2Z5UDlPMnVsdXVtSmpYMHBNN2Mxc0toRWhyVFB0dWsxcGc1dGJDdGwx?=
 =?utf-8?B?WlNLTGE0eVFDQlJSOXRkRDFzaG5vNG1KSHM0cnpMK0xjVVI1R1RVRXJWWXRt?=
 =?utf-8?B?ZEIxaFdSM1lXbGZZbUJnZWp6cFo2VDI5TDJRbUNjSnMydG0wV0tZSHpwNGxJ?=
 =?utf-8?B?T2FJdGUrVm1jNGZqU052eXVRYmlYOGVicHUyZkxTNDZ6aVVQdGhaZU13eWNV?=
 =?utf-8?B?QWQ3Z0RTbmhicUh2L0xEcUZKZ2duTVR1YzJ3bHYzd2I0SlhNN2M3UUwvTklt?=
 =?utf-8?B?M2FqdyswelR4cnpQajhzR2YvaGhoRHZFRWlyYUt1d3FTcVNhUXpEQ2phS3JE?=
 =?utf-8?B?cVBxRDB6dmZWTkR2czd0bzhPZ0RmNkFsdlZnNGNpUmo5NkhLSDRPREZ2eDNH?=
 =?utf-8?B?SDZQV1JwRFF6UnZzRzN3UUUzM3BpSTNFNzIrZllNay9IT1dZUWN5cCtPdGRn?=
 =?utf-8?B?UFZQTUt2NnU3TEMzeWtZemhRQjlhZUdyUEUzRXJrb0hIRkdmUlBFK2NHblZD?=
 =?utf-8?B?YVUwUmFQZ25tcE52aWNEV29iSUZwcnhma2Myei85TTc3VUdSWUpTbnBzWWk1?=
 =?utf-8?B?NzB5NzUzbDBydi9mc0EreVE1NUsreWdINDJER2xHZlU4K3hLQjZNeFY5MDJW?=
 =?utf-8?B?UkMyU25VS0E1dWVaUHBmODhCL3N2bEhPRm5IQ2lubW02bTVVUHJKb3Nib2FX?=
 =?utf-8?B?WEtSb3VnZW02UlRBRFdySElKb2dFbm10bURybFMzbGsxeElBbThDU1gvdkdz?=
 =?utf-8?B?KzNSSkRXc2ZPOHFlN25ZQmVmcGZIZFIxU1p6TlFvR0tqMUFKc0NpcThvMllK?=
 =?utf-8?B?L0hWbU5oK004SjlmVE1kbGc0UzdPOWowd0FGbXJFRGswbWVaZVk4MVNWZjda?=
 =?utf-8?B?RXhTOGNsL2FackV6K2QyMW5PMVBJY2l4Y215blgxbUdYTFRtbkNuYXNVSytn?=
 =?utf-8?B?cmx3REdsRFdrMVloeUQ5MVNXTjVJMXh0OXRxVHYzZjVIeEp3TjVpZ3FPVEJM?=
 =?utf-8?B?MEdrMEhCcVFmSlRvWXBCS1JIeG1IMHJnN3h3NnFycnZMN2tqd3dzT1EyRG4z?=
 =?utf-8?B?UEV3eFZFcVVTcnlFY1ljMTJnY3l2QklnbEZPMkJpUXNzdGRoaHpTbjM3eFZx?=
 =?utf-8?B?Q0JGcFZPQk5qZW5xazVaaFZ3Z0lxNitydHZzWE92eFEyazVkdHZzbk96L1ZO?=
 =?utf-8?B?dTBwdTR5NGQxM0x0VUgzRmN4andCWVJ0TkNoZElIRGlzZDQ2YTJGTjEvZzha?=
 =?utf-8?B?em9iUmpZZjlDZWVta2pFMDJZNFNKeGk4UDM0VVpSdHJQbDJBM0RVa2UwYXBH?=
 =?utf-8?B?aHVqYXdOQS9hVXV0L1ZlMmlDTXpYUktkbEE2TytIaFJyTThqdHlmblUxQWlB?=
 =?utf-8?B?Zk8weFFQMEh5VlB5R3p5Zi9vKzBkbXhxUHViV2xCV3ZhTVIrWGlOTGtVRVhV?=
 =?utf-8?B?UW44aVBlRHhDb1pTd29YQTNlaWVRdW9Lc296dXFoT0NBMmcrR1NUV0hyWXNN?=
 =?utf-8?B?WUJtN25WOGdwdWdLaG9vbkl3YmF6WkRZcUtkSE9paVY0aU9vT2xvc3F6Nko1?=
 =?utf-8?B?bzZERjNqUTVaRkhYWnBoOGg3dWpyWG9sMEJ5M3cwUjEwWEtKeFpjSUFNSWp0?=
 =?utf-8?B?YitmNXNzSWRHZU51djFwaGZyc0ZjYmFWT2c0MXJjQkFpZnlabFFLbkUvMTZ4?=
 =?utf-8?B?Z01vbE50bnZnaXFuekJ0NTU0MTNYc3hNLzRDWldBUVkxUlY0MUZ1V2p1cWFY?=
 =?utf-8?B?NEdWdlJoYkJpV0tZbTNta0krdCtuYysyK1hxNmZkdkM0Q00yV0g2YUE0QnVi?=
 =?utf-8?B?VnhaZVk2eTNJWkVONkdaNitxZU5PRXJJL2tGNE9wZmhCZUFvREpWUXl2Tkgv?=
 =?utf-8?B?eE1PU0QyaDB5NEJGR01zc1M3cTlXVnduSFFnSXp2b05PUUZhV2RxZUI2WVVQ?=
 =?utf-8?B?NlFtTS8xalpESHB3UUFuRjZWaENmZlp2cVF1UTdEdi81N2N1R3hjR2JHdlln?=
 =?utf-8?Q?d2hyDf1fMS0njpY9bPOv4qY=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8da2b74-fe9e-4f76-0e99-08dad81c20eb
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 06:27:36.5566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tmQL9XlS7JRjIblA6tXr1Ni694iUNiYSm0eVDxXdssGxwODTBJJpH2WKKrxHctho72F1KxwgjT/J0m8SQ77gPqoElxGVR11Y83vu/kGCJyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB5057
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

Dear maintainers,

Just for a another gentle ping on the patch.

Thanks
- Quan

On 21/11/2022 14:33, Quan Nguyen wrote:
> Just a gentle ping on the patch.
> Thanks
> - Quan
> 
> On 07/11/2022 14:13, Quan Nguyen wrote:
>> Add initial device tree for Aspeed AST2600-based Mt. Mitchell
>> BMC found on AmpereOne's reference platform.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
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
>> index 0000000000..69ed0c5fbc
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
>> +    pinctrl-0 = <    &pinctrl_mdio1_default &pinctrl_mdio2_default
>> +            &pinctrl_mdio3_default &pinctrl_mdio4_default>;
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
