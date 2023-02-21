Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FFA6A0224
	for <lists+openbmc@lfdr.de>; Thu, 23 Feb 2023 05:55:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMggf6LB7z3cFT
	for <lists+openbmc@lfdr.de>; Thu, 23 Feb 2023 15:55:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=RVrhafs2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eaa::712; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=RVrhafs2;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20712.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::712])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLWCD26wCz2ym7;
	Tue, 21 Feb 2023 18:29:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tto2bts6o5ms8gYu+8e+7YVvBqjBEOsZGFGU3v9Prl0B9auzJadiAeKOXQfQ6wMaxxy6JaOJmZuyTjLBt5ctH5uRgDLjZcS2VVh2xrV0cxaVS1wvMtMo1htMBHh8ZNpMdKKbDXra9oG0IiXofmlttg9kdQJ7fAyoWvFwXHGU8wWtpoUnofKYiPTEM5UUq8aJkwfUuGhf0wbtlsa/Z1bWUZWuTsFAt7xfznTpsmqrd2QBRvCLzeNTUlVuOBcLeSClXvzprixt98xlgZTccWl56KjVCAWkF7/Sq0xDwo249ypzZKpQmYF9Y6YWhsc4Yv6y70Dowbnv0Hhe885Xq9tmWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2Qu/wSNXeuPm9/bHol5AssrAA5SL7zdnI3Smsyfy1A=;
 b=Ir7j9k9Pgo6G5azTjOoDnVHKLXM/aNi4e0iWn/6Ml+cCjt0On4tSiLlH7RLUfFY7Ij4you6oum5Rh7hfq0qWVrXZpUYvjU5Ogc7fK8NYpWXetLLCxifqyeRFqUqLuVpBWCFPJMnw6PQvpPVnmDkpKA+4djn7NTJxwrrsvlaXzci/eOF9PuJg6d5Iuaxl92xbUO4PIopTEpBWnP1yN0V04ag+z8Rrli5IsqvRKGEtu8gtsiEBcHADoVy99eOU1vAc04l4Crvu9uG9El5Ap6/i5dhqHngL/2PuX8GhjZ5pEWdHyqOYKTPWo7ROIbX4HXNoksX7tGN4/tUxwTzbwNGz1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2Qu/wSNXeuPm9/bHol5AssrAA5SL7zdnI3Smsyfy1A=;
 b=RVrhafs2pGUzutu/+O0P8myL4dyDiud1BIJ8ZgnxnD7eHkwBIbieWJ+L0MmciF5JLJBvajfULeZo/8KKIO93at/t+Z11p+xdbND7pss9oaAOMKK/PhDO2OB5jgpLZpLZvxyPaAJlqTENc49Tu6oUhieagALf2jvWyFIyjmyYtEw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from SN6PR01MB4973.prod.exchangelabs.com (2603:10b6:805:c4::13) by
 CH2PR01MB6104.prod.exchangelabs.com (2603:10b6:610:16::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.21; Tue, 21 Feb 2023 07:29:32 +0000
Received: from SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::a807:4f38:56ee:b079]) by SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::a807:4f38:56ee:b079%4]) with mapi id 15.20.6111.019; Tue, 21 Feb 2023
 07:29:32 +0000
Message-ID: <8980c1b2-e7ae-e1b4-9f22-ac374bead4ef@amperemail.onmicrosoft.com>
Date: Tue, 21 Feb 2023 14:29:20 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH] ARM: dts: aspeed: mtmitchell: Enable NCSI
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chanh Nguyen <chanh@os.amperecomputing.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20230217102122.16547-1-chanh@os.amperecomputing.com>
 <c594a426-9ad3-1f67-8261-4d2d68272870@linaro.org>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <c594a426-9ad3-1f67-8261-4d2d68272870@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::15) To SN6PR01MB4973.prod.exchangelabs.com
 (2603:10b6:805:c4::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4973:EE_|CH2PR01MB6104:EE_
X-MS-Office365-Filtering-Correlation-Id: db852e33-9d9e-45f8-7e7b-08db13dd5f7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	QSqk23sAP4sKlkP0fgC7Z9Ui24ov7x3z8hvdSSCV9BNwlXcTSQOkrcoAtWsOX/rOFpiSi5dwtvHYzgfP7qslhnV2Ft7YEGlMZHdvRGuIFf97EHwFGWvJPKbu4c9RhZftpw1T3H1kS84bidPZbYQ24BAq0RRMtmoA9n6EFF6/9JjYELPEPCPOizDvVGnaGlWy+uy4SpXL4aoEh/ecKEH+iG6eaAUY/OB1Mes1GQSI+eIAypnJsOp0k3AjCp+luZEYYnjV4uOyj9XUWDQKaWPH2/0rdi8ZrmyLn0O0bD/lxEe3ne1jl6mE6BkOuYhX2hSEEtR8nyLmw1BZlIZmxeSZqvKNyEVk9iecXTERGdGIuD75dTICT+rtX2PZBLYoRMtrsUKZTvoQJyDO0jTwsyQW0wFxfmYtIKkCMMhAdLzbiKb7JAdr2NRG13pC6iV6lV4w07C4JkVmiwD7QOcNnGaNVChZjp+Xu5arNuFS01jVuUbrgfgvv6i5gK6zUCLVotGqJPxanILs0YIqCe2vMOYRt8ADYq1jFb4oaZZmglKedpaBzcyZlHlhxh+gZlBh3//KxzufpN6CnrBAGVlqJOzX3CQvWEXYeTUcvf1XXwjP2qHKUtKgDBEmc5jB8A/82O1QKniNydIEReLq21O5HKuQE+7HxEPCXwz9gVfe2UH4V7M=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR01MB4973.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(396003)(136003)(366004)(39850400004)(451199018)(31686004)(38100700002)(2906002)(8936002)(5660300002)(7416002)(186003)(6512007)(26005)(83380400001)(41300700001)(83170400001)(42882007)(2616005)(921005)(66556008)(66946007)(66476007)(8676002)(966005)(6486002)(6506007)(478600001)(6666004)(31696002)(110136005)(316002)(53546011)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?TzN5aG9QdUdFVVVTd0FNZzRSUGNwdHlYUUlqZXpFbHlyeG1FckUzRTZ0Ymlv?=
 =?utf-8?B?c0RvdStwYmVCN2E4UjhObWNHUE12dHNuR0tTMDdUQ3BCbGdZRUJNSklHYWR3?=
 =?utf-8?B?VjdPUGRQaENtRlUvTHprTjEwREMrMDlTWU9vTEJhc1dyWEtCc0h5RjYxZlNy?=
 =?utf-8?B?Vm1pUFpFY2hyY3RnaHU1MTIzUnZIeTk5enNRZm1GL0NKVWFnUmN2V210c3lj?=
 =?utf-8?B?ZGhuMC9lTG5Ob3RVR0hyaGlrUmVydjkxaU1iQnhrcS9CTklKM1pwRGlGUFNT?=
 =?utf-8?B?Q2dKMDNJek40REFOK3ZwcWg5ZEhVeDRmYzlPaE8zREZRektZb3RVN25YSlZH?=
 =?utf-8?B?TUNRWHJTNlgyREpObUZ4ZUZUZGhPdHVnSHNWdGlaQXYwVG5TRitKSDFSWUEz?=
 =?utf-8?B?QzdnbWttZ21YMjhta00yWkIyVUhWaFY0TGx5VCtVYk5NTUs4QWtEcXZJR3Rx?=
 =?utf-8?B?S05FOWVSWjBRUUFuaDZxdWhCeVRNRFFTZDhDbmZySlMvOXFPRkF3L3RoRkk4?=
 =?utf-8?B?NWE5K1REeDhKVjFINUdkVWVDZXJnNnhlNmJpdFpPaTdCZ3kvTWk5WDRlanF6?=
 =?utf-8?B?dmNtbkJQdHhTUFpZaU1Gamlsc2doMUZUWG1ZSFo3a1RVSEhhSWszMUVZUEVN?=
 =?utf-8?B?NXQzVmtPOTdSRVlURU82a3lEZEN2YW5mdFdnNnRKck9pVU9QS2JTWCtHc1NZ?=
 =?utf-8?B?MUZjVXNudlZDamFpeUhGb3lYWnB1QlljYjErdHJBbXYvUlBkVHBXWjZ3R1V3?=
 =?utf-8?B?cHZNWG9yK1lsdVpwNyt4VFJoYXZqeVEwWjdQdnV3S291MFRxTWE5QXgvYXhl?=
 =?utf-8?B?N3FoeHBMV0tReHBraXFwZ2diREU1TWkxUFhtSjFoMDRMek1PeVNLMGQ3QjdG?=
 =?utf-8?B?dWIzSmRvNWxIVTlRV1VzNUg0WjM2VHE0bVJ6SUptWmxXR29yOSttZE01SFIy?=
 =?utf-8?B?Ni9hTzl3anYzMWhRMFVNeFVIRjlqWkdyc2M3WGdvL3h2S2JtVkFCRmkwS2Jz?=
 =?utf-8?B?YWNmcXIxYXdnakNXUERTQ3QwZHc5bVc1RnhRek1qZDJvMXI3MTZoeFNpTmgx?=
 =?utf-8?B?N2lwNFYrSk11enF6WGNTRHA2K0xuVSt1VnJFNmZodmxpREg3TDE5Q29WZTN6?=
 =?utf-8?B?bjJmZis5ajJ3d21pZUJWMU8wbnZmMG95aWg1MmNmTzBjR3kvODJWUUE2N05q?=
 =?utf-8?B?WDNGa05GcUNIWFpIUVYwekpZc3d4aFdqaGE0cFI0Mm9GbGRXYXd6dlVJbzBR?=
 =?utf-8?B?ZXRxbnMzdzArRnpZS0VMRGNzK3AyU1hCZXYyL2FpSHd6NEtMNjRuNTd4OUl5?=
 =?utf-8?B?WEZtUlg2dUVWenFBYTZqekk1Q0FsR0FhRFhIUkpjK1BsV1Qzd1NLMHFvMCs5?=
 =?utf-8?B?L2tjY1R0V1V6Vm1WRCt1bHgxSkcreTZpRjNUazRpVVBwemlpblpBZ29OS0c1?=
 =?utf-8?B?ekJYbkJWcmNRUi85VVNmeGFVNGM3cmhMaW4wOXJjTkkySUtGUGRPLzVod1V1?=
 =?utf-8?B?TThpcXZZV0lnZXRnMWRBUkJWc0lSM3FvbDUzOHoxYlBFMkhvbSt0VmNGTGQw?=
 =?utf-8?B?R3FiNjlnNFBCaC85cTd1UUNRWGJlSVFwK0tGVWdMTEtFMnppK1dRelUrTUw3?=
 =?utf-8?B?OEpja1g5djU3QURGU0szaXdTcUJ5TDgvWGQ0dURkaDkvcEJ5aVd3endpMXZw?=
 =?utf-8?B?cldUN3lvcmZGeXFFUDRrSmY4dTFZejhQYnRWcGdxUjFnSnBrbXBsWHkyTmpF?=
 =?utf-8?B?NFNxajJxM3czNkYxZ1h3VHhZS2JOVDh5cWlxTnF1S3NtQkhUd1FrQld4d0Na?=
 =?utf-8?B?Vm1peTBRWDNPQXhiYVRZLzN3dWQ2ZURsUjZ0Uk5tZ2YwdG95ZUtnWDdKK0J1?=
 =?utf-8?B?OGdYdVZOR2x5eDJpUDdQUWdSZlBNWVpRY2J2bm44NVVpUGN4L3NsOTdMdzdQ?=
 =?utf-8?B?a0dUN2ltU0ZDd2ZYVlVLdlFvOVhZSUg1RXd3dW85VXJucjB2UUw4NlhrVzYz?=
 =?utf-8?B?QnZZWjVickN5YmZoR3dhQ3Q1bXJQaEs5dHdFQU55c0ZUNVVKR2FMUGE3NVFU?=
 =?utf-8?B?bnVERThFMTc0eE02cWRiZFozalN4aE1DZE4wSWpEejBFZDVya1l5cFhzM0tw?=
 =?utf-8?B?eGg3dFJNbjNVMHh3d0dkRUZIemphVGc1b0tJY05FWlFWMFh6dWFaM2pwQ0ZP?=
 =?utf-8?Q?helyH4psQVH6RyVjQKK1oN0=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db852e33-9d9e-45f8-7e7b-08db13dd5f7d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4973.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 07:29:31.8191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ww6ApubmUyxncIFFRRcibLgv5A8laMLKIYRiX2KnGgCcfcP7lhBK/Q0YqyqwI3LhPHxV4dFjZZFPcjTL5g46SlIM7p0guYiLqK05BlXPe0pp/z/wo10n9OQ0A8ltqu1I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR01MB6104
X-Mailman-Approved-At: Thu, 23 Feb 2023 15:54:41 +1100
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



On 17/02/2023 18:32, Krzysztof Kozlowski wrote:
> On 17/02/2023 11:21, Chanh Nguyen wrote:
>> Support the mac3 (RGMII4) as an NC-SI stack instead of an MDIO PHY.
>>
>> The OCP slot #0 and OCP slot #1 use a common the BMC_NCSI signal,
>> so we use only one of them at the same time. The OCP slot #0 will
>> be enabled by PCA9539's setting by default.
>>
>> Also, enable the OCP Auxiliary Power during booting.
>>
>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>> ---
>>   .../boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 37 ++++++++++++++++++-
>>   1 file changed, 36 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
>> index 4b91600eaf62..e8a6b1f08d6a 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
>> @@ -251,6 +251,14 @@
>>   	pinctrl-0 = <&pinctrl_rgmii1_default>;
>>   };
>>   
>> +&mac3 {
>> +	status = "okay";
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_rmii4_default>;
>> +	clock-names = "MACCLK", "RCLK";
>> +	use-ncsi;
>> +};
>> +
>>   &fmc {
>>   	status = "okay";
>>   	flash@0 {
>> @@ -439,6 +447,26 @@
>>   	status = "okay";
>>   };
>>   
>> +&i2c8 {
>> +	status = "okay";
>> +
>> +	pca9539@77 {
> 
> Node names should be generic, so I believe this is "gpio".
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 
> Best regards,
> Krzysztof
> 

Thank Krzysztof,

The PCA9539APW is a GPIO expander via I2C. For a generic name, I think 
the "gpio" is suitable.
