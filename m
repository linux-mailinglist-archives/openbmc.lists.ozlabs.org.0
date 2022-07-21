Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1DC57C26D
	for <lists+openbmc@lfdr.de>; Thu, 21 Jul 2022 04:47:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LpH6J6lF1z3c7s
	for <lists+openbmc@lfdr.de>; Thu, 21 Jul 2022 12:47:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Kc8uZrfN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eab::707; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Kc8uZrfN;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20707.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::707])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpH5n32Fvz2yxF;
	Thu, 21 Jul 2022 12:46:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SyWU5pPAFv5Xl8Cm/PMouD/iEty4oCpFaoEwnuMGXSBR4+lhbuUO853J4GVb1khVDu/I1HouPEnJlM1DClh4/D3Gjd46qvS7FugBC9U541i0xqt7vv6rq7uzqGmIcDGCIdZGGoWYLRa+xRpIdEUeC/Lc/5VSVJlYm8tb2w4Bq7yq8DFGx6X4CtYvealXb4foz8NsrSG3FHjsYQLQfF8Z/Dv1f5Ayn13FmCmAa01laUstmO/sUZ7JzTyPERzmIqAwVs9aA+Rc2w1GwbnUDXMariwg6/Sad7Vlnh4QGdITf8QZIJeNdDEafxanWMXv12wExKaFOlvP1LgLIsfKrmsneA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uyk7zFcJPwv8UJK+/6SJhuJznSKY4hWn0sZ69jpxb8c=;
 b=nl680NJ9986WOX2wpm1U+hXMyWyimD2XWmSmelcThmX6sA/YXRZujoBXrKB9ETgg+rzR1YhIxxlWeeLzS7K0zvkxe1cSkOgUm++mHbMWaHq1GrROy0dVRYRHI5s68NOtz1var2fYJubYPgjxiVJWDYUTMa+nPicfb9t3E4Bm4IqRj646hhYNUKVuITqASVXZjHQTioMds+lVddF/oT7EFiudjB/mEM0WMUH8z3yKR3Diga67sTJsT9GrMU7UJKcZ0yzDFM9SDUJTTfIOpsqmu8atdBjEQg3u+bzb5HzXIK4ZLJ6Az4SUo7tk7QnOq986Fq8eDzZOxmHbY4xKbhXTHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uyk7zFcJPwv8UJK+/6SJhuJznSKY4hWn0sZ69jpxb8c=;
 b=Kc8uZrfNQEDmcofcX5xBDZIhg2wn/6kwOv1DubGvUTo94Mvhn0RnUMSSysvFA9Gozc+XusYtdxR0/BtbkdoCjf3s9DgBhN/AmRpVenN+9Vh0rtdm7h3ClIO6lQ5We1qhy8Kk1q0XfI7/1S6rFlpAT5O7HfJMp7nQmaBQ5LERP/M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 DM5PR01MB2668.prod.exchangelabs.com (2603:10b6:3:f3::10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.18; Thu, 21 Jul 2022 02:46:27 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e%9]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 02:46:27 +0000
Message-ID: <878f9889-0255-96d8-77c8-19b0542932f4@os.amperecomputing.com>
Date: Thu, 21 Jul 2022 09:46:10 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.2
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add device tree for Ampere's Mt.
 Mitchell BMC
Content-Language: en-CA
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 openbmc@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Open Source Submission <patches@amperecomputing.com>
References: <20220720085230.3801945-1-quan@os.amperecomputing.com>
 <20220720085230.3801945-3-quan@os.amperecomputing.com>
 <ab78f85c-dd0a-9176-103f-8e4abe01b8f9@linaro.org>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <ab78f85c-dd0a-9176-103f-8e4abe01b8f9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:3:17::15) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ef0cb55-be58-445c-9d3a-08da6ac3351e
X-MS-TrafficTypeDiagnostic: DM5PR01MB2668:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Al3xa+uT/8SWPw2oEOLYPyo0WDJ2tNXeeBIMbRKi0MHYJ2Z/Gt32eYP/so5ZE0TnQ5JWyvURLtfx6UHzys8efr8+DyK0NmvA5Gg1mVkPjAgDRXPe3CSqgcFV+eg0zkVyoiGKWYqeif5HeBxeaS5LDx3GMtXOSavWr7gV5SU3lwQgmSFmk/PSgZvVsiX/5hAJ/y5VUoe4LQ/9XoZjU2tsVTUQFImK6PLR1h1kBSr8kn2tWVM6VHMSXv8R6267cnMDMcls64qBuOwV2ct2B+5RfGAmHcYnZS0+Wmewg7KFji6jNYWtB3hM0WR7cR2t1z7QOy4iObk9LLds2V7NUkzFJxLKjZFiKK6fA4PiAw49BQbA8Z3RJejkQGuKA0nzLVXNEezCvqr8d40Xm/CIMPbtSxlUI0yIs3fcxOHKY0jWsMOqI+tbXc/zxLBFmTeoTaMIXvrq/02y9+1qqm1GJh63H24gXNhrEje+q8N7JyIrxX9mjb0+FkrK2sKNfi/wTtzoDQOgCoSt+ANL7BUMG2U9EXLqYfPXzW5N9FXB1bSNyFEndoRIefw5Bfju3A2gG9St2Tqx7swMswzZhaIzikUBoAxw9EOYoXxzj38vFTDCAzGHegv/X8+WlEI6XMWU+iV0KpZs0bCLsELMn4gHx3nXD4xD7SBg/i9mndEGdlzBShmBbxOHDu6wspFhtBrGwEsQiDFfwhvWpIgyZ0ywcKBfgWwoljRyB/11wg9/nKbhI24ZFnUguoRb37acQuH/TtG9LfJMImQv0g5K84COLeWFFx8Z9DV7WQ9wtEg18CDwZFsigvLFwkXCJQOuaIW36t/5qlvJbBlhEGwELkkHBdKGADXi+T6tywHcyCLVB32CYCc=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(396003)(136003)(366004)(346002)(376002)(7416002)(8676002)(8936002)(5660300002)(4326008)(66946007)(66556008)(66476007)(2906002)(83380400001)(86362001)(38350700002)(38100700002)(6486002)(921005)(6506007)(6512007)(316002)(107886003)(2616005)(110136005)(52116002)(66574015)(478600001)(26005)(186003)(41300700001)(31686004)(31696002)(53546011)(6666004)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?L0drSUtidmQ5U3ZzYjVmektmZmE1UXZHNjlCOVoxL000Rk1VQkV4QlFLbkNP?=
 =?utf-8?B?TWdkSDVIb1VrY0NpL2t5V1FFRzJCTU9McmxHZkh2LzdOeFhaRGpja2JPc0Y2?=
 =?utf-8?B?eHU1RTdlaVhja1VBNk8wTUFmekZ4ZFFXTXNkOWRPdHMwYVVOejBEOGVLRURQ?=
 =?utf-8?B?MXhvMHpmSyt5encxWjh3Z242SzM1OFBDOTZmc2NSNm1JbEhVT2ZEQU1IejNk?=
 =?utf-8?B?WFpORGFlOWFGUmpCWUIwREY2cFlVQUlFTktGbHppcDYzVkZsdGV5WWtVN2VS?=
 =?utf-8?B?MmlXdmwwYzdITEFOUm5QMHdlUlBkZGhKWERLRTZlbHpMRllJaEU0WnhjSkZZ?=
 =?utf-8?B?bEtlUnVpLzdsY05iWG80N0xKMWx4eWhENEVmWnVRb3ljR3YyUFJiTDdYaURa?=
 =?utf-8?B?bHE5U0ZlMkFObms4aUZjUEhzdm5KTzY2ZEJYTlIvMWUxV29TQ3haSm1IME9S?=
 =?utf-8?B?dDM1aURnbFdqKzA5Q01nU3VhcWs4R2lpbEcrSU42MWg5K1hHbUV5cWVEcjNW?=
 =?utf-8?B?OVhkdlN5eUNqK2ZNMnFtck5TMWJwSEZlRjJOZy9NM0RQWm9vMitzdjl2cUtr?=
 =?utf-8?B?QjFjRkppcHIyRDdISHpvVHFac0g3UG0vNHdWVEkrL015cW9jdi9hWitQalBN?=
 =?utf-8?B?RjVZdmRTZUxMWEtic05jVHU4Kzd3c1NaaVRVUW1qdnlIVmw1Y3pKcVFqaEsw?=
 =?utf-8?B?MDVXSHRJLzVIRDVUaW5OaEZ0ZTZscWV1VDBoS0laQlhFRjFQQ0g1SUtiQnRp?=
 =?utf-8?B?aVJqeW9VOEFldi9TU3J5MWpERVJSRENYZVdKU2NOQm9ZcnFXaWk0dXNSK3RP?=
 =?utf-8?B?dVhPbWhlNDg1QnhoRzJGc2N4V2RabnBuck9NZCtFYkJBMkg4STJadTNuQVdO?=
 =?utf-8?B?WFYzeEVQc0Ixa1QvQXpFcG5iSEtpdU5mZHh0TmRnNWtWRXo2eWY4eWRWL1NR?=
 =?utf-8?B?djdScGNLbEhwT1BFbWpXOVdMcmxpTHJuTlZScXRReE0veWJYajdWdWVCdmtE?=
 =?utf-8?B?WVdZem0yek4ra3VBRjd5WUxWdDFzcU1ja1YxR2lwWlNrc3JQS2Q5NVQ4TnZJ?=
 =?utf-8?B?WnNPenFVWVRJUlFOaTdheWhES1VsMHc2N1ZOZ2VhRGhCc2xYNlhQcjZMV2g2?=
 =?utf-8?B?YkRmUkFVNTRlY3FMUTcydHhTNzR3czNoOWtYMHVrZDRNQ2ozNmtTYWpHMEJD?=
 =?utf-8?B?TUpxNkM2SkpTakx4b2pGaTRGMXhNS2VPU1dNRjdFY1BZZUcwRkt4SmwySFQ2?=
 =?utf-8?B?NFB2U09Fb3Z1cWEwblIyVGd3OGpPNXJpczdEU2JycktGYWNiOE5nS0lnZEFI?=
 =?utf-8?B?ZmpGdWJDODZuOW9UWU9kU002VFdONDBnQkk0K2xWR25vd2t0UXI1SmlMYWw3?=
 =?utf-8?B?VzNUdXJjajA1dWF2QmZGOGpiYjRja0xnWTVyaVpXSERpd0lLVUpPd29FZkRR?=
 =?utf-8?B?TXFlSkVMSG8rZDhPUU5JR3VBVUZOa2twZGF6ZGZkL0NSL2diQXlFUVVBcmZR?=
 =?utf-8?B?RjRxcXRXTERxUzM2Slh6ZmJzV0wyZlRCRXk4R2Y5SDhBVE5hUnJvWnRiNkg2?=
 =?utf-8?B?a2JJRGVNUTJ4SjhrOHBPb2FlRDdUOFlLL2hRWUZkL1ZVUUs5L01xNjI2Z04w?=
 =?utf-8?B?VksrSEV1VWpuVlJWRXFNeHIwOVRFY2VZM2Q4TXVzSmxPZWRoUXkrTGFIKzJn?=
 =?utf-8?B?d2kraUFEeFhSSE12MmUrMnlmc0xVUFFMZlptcFFEY3VpSmxUWmk5Nll3dVRH?=
 =?utf-8?B?aHpwdURsK1N4R3lLTEwyekFXalp1Z1hZc3FwR2lSbWE4TUdZbHZ5U3FOQWdF?=
 =?utf-8?B?aDAxaG50Y2UrYURiNG9tVHYxaHVTKzMrYkJSVU95WWVwT0I0UGtwYXJZNEsw?=
 =?utf-8?B?UWdMSG4ycnZyOHZGWlVNYXVTTUFFMTYwUVg1L1k4RVFBbjdndnNubmJrV0Q2?=
 =?utf-8?B?MHlYRXRFRWhlYTBaOVhwK0lJOGhvWHA3MlpYMmYvdVE3Uk1BY0N3OFA5Nldz?=
 =?utf-8?B?MFdQeVlFdkh2cVB6ZEdIRGt3REJWNzUxMVlzK3pDSTNwSzFYUVpYMjZ2Rmhs?=
 =?utf-8?B?TitKVWNHU0EvZUVXcklpcHFOU3BRV2JrNmhpR1NLc0c5bFZQNTNCdG1WVVls?=
 =?utf-8?B?NWREWFhCNXBWaW9oMENpNEJyRWJNYjc4Q2Z6N3ZOQXlMbG50U2YzNkV1THAx?=
 =?utf-8?Q?zsTK1u66DIOOsJex+e0riSo=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef0cb55-be58-445c-9d3a-08da6ac3351e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 02:46:27.3555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCHY19RCpVpK6q/DHbT5gi9NXagbndByBRukwjJ/fxI1410a+MPKsCc8jL2PXRcohA/HRSDO8l0D9vXRffdPMChYDDwgiNr7C8SoBhvFw+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR01MB2668
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
Cc: thang@os.amperecomputing.com, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 20/07/2022 17:36, Krzysztof Kozlowski wrote:
> On 20/07/2022 10:52, Quan Nguyen wrote:
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
> 
> (...)
> 
>> +
>> +&i2c3 {
>> +	status = "okay";
>> +};
>> +
>> +&i2c4 {
>> +	status = "okay";
>> +
>> +	adc_i2c: adc-i2c@16 {
> 
> Node name: just "adc"
> 

Thanks, will fix.

>> +		compatible = "lltc,ltc2497";
>> +		reg = <0x16>;
>> +		vref-supply = <&voltage_mon_reg>;
>> +		#io-channel-cells = <1>;
>> +		status = "okay";
> 
> Isn't this new node? Why do you need status here?
> 
Thanks for the comment. The drivers/iio/adc/ltc2497.c does not check for 
the status indeed. Will remove it.

>> +	 };
>> +
>> +	eeprom@50 {
>> +		compatible = "atmel,24c64";
>> +		reg = <0x50>;
>> +		pagesize = <32>;
>> +	};
>> +
> 
> (...)
> 
>> +
>> +&gpio1 {
>> +	gpio-line-names =
>> +	/*18A0-18A7*/	"","","","","","","","",
>> +	/*18B0-18B7*/	"","","","","emmc-rst-n","","s0-soc-pgood","",
>> +	/*18C0-18C7*/	"uart1-mode0","uart1-mode1","uart2-mode0","uart2-mode1",
>> +			"uart3-mode0","uart3-mode1","uart4-mode0","uart4-mode1",
>> +	/*18D0-18D7*/	"","","","","","","","",
>> +	/*18E0-18E3*/	"","","","";
>> +};
>> +
> 
> You have a trailing line error.
> 
> 
Thanks, will fix
- Quan
