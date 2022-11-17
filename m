Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F68E62D19B
	for <lists+openbmc@lfdr.de>; Thu, 17 Nov 2022 04:25:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCQKf0QBtz3cLJ
	for <lists+openbmc@lfdr.de>; Thu, 17 Nov 2022 14:25:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=oAphoW4u;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eaa::712; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=oAphoW4u;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20712.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::712])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCQHt1B7wz3cLB;
	Thu, 17 Nov 2022 14:24:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/XLn2j1fWYOKHFlYNp9SL4y6z5HKUH8N1MxfGRGvsMLG0scSXRhlboHJdP3HOQpA+NHtK3idARpoYJ1auFAl1eC/FbTU5fCD7P4Vt6iGYZrEhuZ/Rd1mcu+94uR+8l8pMNHgTinxxVXqLcDEXvm4bEVvvLehnOaSiTjcu+oAF6i+noONAmIP8itfq6Ybw8JX3XJCVpgJgCCrVZ4Sma+48z/fVOzI6tvcvoBJqvprfeYyH67pBY2MpMOuJ7KNVpppIdlSsI3RPRKuDhwcTqKzI3BI93ffboZiRpIyalPKXqObx/xSvWy3MtbNKZQ/6ZxtktStj2P4tJ/mfXa0RT4vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0H3mSvcnxlObHJYpZD1w1bfKTfsQ095RKzPqChWCrI=;
 b=jMtMPENkf7ejPGWId14xe5xOSPrq7UtPJxVkSdbO1kfvpy8oRmXmdTYT0TrpRHwtlIMD/Znn+3L326NllmkjnTK/IMFqWOyshcuKS3CTVoiqqOWlen4BDwskHUaImFRuW2m/e07G5qUfxaQkU8HoKNqWpHFsE8CInjzOpxw6RNUjtSsWKOXGSJRKearyxw4FTGQbv5mQkVoTa6Qbs4KHoDZjWL6DP40fFf2X9JaQzZylGNpOOU0JMndTff4O1BldGm7M9TKpsZJne+6ZQyPwOlCQhh7SoRO3l1CLxQtwoGYB3/G5Vc/9FcJ5TjcspSCa1jWovZMTKquOx7VuM7sCSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0H3mSvcnxlObHJYpZD1w1bfKTfsQ095RKzPqChWCrI=;
 b=oAphoW4ucWBBCcQ1eSqXm7gY1E/rAYwrFBRsCuCKLdI15ft8TqNNdAEpKcz1U+7G6gUrBBXGpJI3rzW65kV+1R0fKh0WKuXXXRPjJ8EODME81G97UUR5ZlbnYh1E4LWs2w9me/hjCeXgI+svvWoMOkv8N08+/zPEvS/cCdGl8qc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 DM6PR01MB5050.prod.exchangelabs.com (2603:10b6:5:68::22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.16; Thu, 17 Nov 2022 03:23:49 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::df7e:7f53:a83f:a86a]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::df7e:7f53:a83f:a86a%4]) with mapi id 15.20.5813.016; Thu, 17 Nov 2022
 03:23:49 +0000
Message-ID: <8562147f-b68a-e49d-c914-c8d9d00901d6@os.amperecomputing.com>
Date: Thu, 17 Nov 2022 10:23:38 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH] ARM: dts: aspeed: mtjade,mtmitchell: Add BMC SSIF nodes
Content-Language: en-CA
To: Joel Stanley <joel@jms.id.au>
References: <20221024081115.3320584-1-quan@os.amperecomputing.com>
 <781ea7c7-b33e-f054-71eb-d760f7a01301@os.amperecomputing.com>
 <CACPK8XcCKK_o0hBA82k0CEcpbHXbHcUii3bgoGvHaGvtw2Q_Ww@mail.gmail.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <CACPK8XcCKK_o0hBA82k0CEcpbHXbHcUii3bgoGvHaGvtw2Q_Ww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|DM6PR01MB5050:EE_
X-MS-Office365-Filtering-Correlation-Id: 12a3b9ce-2c56-43ff-13f8-08dac84b247f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	7gtorwebTpL5/WLFcyOzJK2c/xhG54vm42SCzFYLfWYK4amgORR34VCz2CeDd8O/qXBKZFrvCWb4JTug4NX5aMYvk3rkhiUp/7GxlwHrGK1+vtkvf67nXjJzJrNeGu/SqmlPdh3YTMKG5BH4aqWNN8fs+WJ/GmnW+USjPC6Sear5G+DOzG0BEhKCQNdKh/b84duArogEOPZe7HEMwIiml9dfbgXR77cNPFnJ2FyRP15pf4oGVsB+Y1GVdx5aW7xCLFrC9n7VZmkHGO+W3/PxARXzLk/sbrnlbvZP+sRDqQNAhfR1ZfdTlV+U2AFNacQQIwnFTtpcKPTQNa+fakhQAb77uYqiUd+2ZSaxvK9SjS5/uaCTWj9160gWvpR3P8fdfA3QtNO7Sdj6scaegs4+XVlaN2vBuXhKfxQiAOEmrs9LbnzYFdmy4OD2kyQx5mO+hawDJ6eANLsTwi88NKHD3c+GMA9kiI2Q/j2TNxlAsX1qNs6aKE9MbMGvZR6wuXoNhWsSAhsmjozADYcjRKGOae1v9oDnRcOqx7B4mEitwdVUI2FWLf59yN6mGz66ZnbQAem1+P4nnMROhr1u6/reEX8UGNuqfMTE2ZI/LJhA1UhHjttksDY5SQ8PRNGQBzcLrbDptPFXl09VYKdeOj8PCOMLA/PHrgpZiyM1tQXl6lP5Qy3TAJbgKJ6aa8LFgVprssCC4C2bIytCOwxHF2c3BoObNdZdgSltwq+LMLDGsqg+6/QF2KsEZr/tZNal2VciVg7J79q8aRvpyEynBvh+hytghD/TAc7ljtMG14Wn1cg=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(346002)(136003)(396003)(39850400004)(451199015)(478600001)(107886003)(6916009)(316002)(6666004)(6486002)(41300700001)(66946007)(4326008)(8676002)(66476007)(66556008)(2616005)(186003)(8936002)(5660300002)(2906002)(26005)(6512007)(6506007)(38350700002)(52116002)(54906003)(31686004)(38100700002)(53546011)(31696002)(86362001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?dm9rK3dyZ3J0a0wwS2daRldwaW9jUzVYbGQvM2hUNmR6cWtqTkxpVXVwcFNV?=
 =?utf-8?B?SFR1Q2NJTjhBQnNvR0NDb2phRVA3RndIY01NZzRXcFZWd1FEaGdmMXI4aytB?=
 =?utf-8?B?ZDFDQjhkV1VURzhtRkNHYkRvK3Jlc0E5QnVBdDJUbStKLzZPTUpXQXd3SjZ0?=
 =?utf-8?B?MzRJbDg4RXhGSFVwaERBRVNzZlh0WElRYzM5TjdiS0Z3MzVKNU1NZTFBbUpq?=
 =?utf-8?B?SmozMUhPZEhQbFVSMFY2YmRVYW81RVdYNkNoSkMrd0Z6SVMyWEhRQnQ0VDZQ?=
 =?utf-8?B?MnhlZ3RsSVVXeVF1ODhZdng2ZWlOSGZLUjNiNEdRak8vbmtiaTJ2TWJCR1NU?=
 =?utf-8?B?SVZhZUI2TFAwYnNGZm9NRXZoWkM0anArZENQcnlBWGtneWNtYVBBRy80Znky?=
 =?utf-8?B?RURyanFwUE85UDRlbXBDVnZHTXlDd0lmamdwTmF6cGE1VUUxMWtBeWNlODRJ?=
 =?utf-8?B?MFA3R20wYVQzOC94ZGdDRnRWMVBycTFLYWdZejg4aHhPK0srU2VzVG9RQlMr?=
 =?utf-8?B?b1hLc2F1bHg3MENqSUtyejNSeXBaaEtQYjhFODJIQ1NqU0oxM2hyN3EraGRX?=
 =?utf-8?B?elljeGUzZnlKZ0ZQSnpmZFdIQ2ZmZlVHSGtQU01nTE45QkhpM2IvRytBbklw?=
 =?utf-8?B?SnhxWlVYQUo2bzRla2YzMG81SzNYOGNxRjZ6emNDazA1Wkp6S3ZiMHRNcmNr?=
 =?utf-8?B?Myt5dk90bWlEemRsMFdoa3l0N05RL0RQZkQxeUVlVGRKazVYUFRhdEZzTVVC?=
 =?utf-8?B?VFFmcjFKUUdUTDUzMDZ0MGMyaEs4R3RrZERpYWxndFFuNFQ0Zk9nWVhiL0N0?=
 =?utf-8?B?Q2ErUjRzdTJIdGM2TFh3SXNQSm1NZ1BmR1dKVGVkRzlpWFBCZkJDemJxMHFi?=
 =?utf-8?B?YkRFbWpSaC9naURwQnJURnVsbkZlL2xnUndHUGpIWTFMckc4blN6ZmM2WEhV?=
 =?utf-8?B?Yk9sOURySE43WE5GWkJHK3pGckp3UjZTblBmajlhWW1ESnRhd2Nrdk96Lzky?=
 =?utf-8?B?RmhHM2E1N1plbXpLYW9aWGxCS0JiMGFmeTYyUE9CSUJzOXcxblkva1ErY25G?=
 =?utf-8?B?YzZTRGhPdm1vVjdXY0VZcTFiajcvbnBNR2xWcnBvd1MxU0g3ajFxdEVIdDY1?=
 =?utf-8?B?ZzBZREd6bFd6OWpZV2FETS90ZVJ4UHU2bjlucytMeTRPVFprbksyZlh2SWk2?=
 =?utf-8?B?VERmRG5XcG1IZCsxVkdESmo3Z0djM25GQkxiS21sUGYwQ1U5eFFCTkFiTEJO?=
 =?utf-8?B?YXNwdzBMYXhpa0tmdnQ1NXI2V0VJQU9GT05mTkh4b21EWVJ0d25LTTZMRUo2?=
 =?utf-8?B?alQyNlIrMXZ6bTVSS2JkZXVFckZCcXpmNzQrblhnTC8yOTZNQ2QyRmhxNnRu?=
 =?utf-8?B?TjR0M281eVNxZVRmYTh4TE1JNlRnL1BJbzB0S0dHQWgrbXNMbGpHNUJGdFVo?=
 =?utf-8?B?QXRPcW1ZNlR3bWR5cFdtTm1CbEd2dkMvZXFvR2N4VG1pZk8reFVESzVsUWw1?=
 =?utf-8?B?NmxDM2dFU3pVeFNTTVY1VnZxTGoyWHJueWt3MVp5b1oyU0Q1UFYyOFEzSHNG?=
 =?utf-8?B?SHg4U0RXcUZINDRyY0JWaWVyaUxTMk56VHBJbnhrdHFLc3NtYWlVQWRjRGdN?=
 =?utf-8?B?M2dlOGZMNmVGbmZ6MDhWenZhd1Q5OVNaVjVCMjBiUGZEYXpHYW4yVHh0czJz?=
 =?utf-8?B?VVN1VHc0V1E0OGpuR1FUV0d1b2g3ekkrOFhIamJRaWZ1Y3Y1WkZqMVNiKzJX?=
 =?utf-8?B?UTM5NUxra29ndy8yc3NEN1dBWHV5dEVZUFIwUXQ4aXZ6SjdqR0VXQ1dPRTJM?=
 =?utf-8?B?cE9zSnd6R05KZXpBcFNUbkJmS3RCeXN3REZYM051cHY1OGgwcGk2TnFjelRp?=
 =?utf-8?B?WXhYRHpVd2l3cU04ZTFOd21uVXhJTUgwSDJNM2xQeEF1RmhrYW1XeXI4cTJQ?=
 =?utf-8?B?Sm9wdklZRVBKNzg4OXM5Zk9XVmFRVlpBK0Zoc05rWTlwSlNNSXNzK0hkc2ZO?=
 =?utf-8?B?U1J5VzJEMWpEN2xBZFBPZnh2dHpLTFRLOFAwallaOHY4NWZ5dXNWRW85OTZz?=
 =?utf-8?B?THBaSExNQTlnbklWcktEcEZPMG1PTWhPY0lESFJNSTU5WEY4N2pYNVdsbnVW?=
 =?utf-8?B?Nm02WXB2aUtncW1IMjcySGlJdGxpK0pUQXR1ZTBKbHlReVNsaTNSbmkrZWpB?=
 =?utf-8?Q?Iw6yej4QR9el0HnMAUTGCIA=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a3b9ce-2c56-43ff-13f8-08dac84b247f
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 03:23:49.1912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4szbR3crtL/vMui4MheLEGj3JxWzBR/WxXiA6TOpe36FgfUDI6ASgBAR8vMhe4aLoYsMGwOH+tZf6HdprjouRK9VVwz1qRJrqtDEYMdwROo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5050
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, thang@os.amperecomputing.com, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 17/11/2022 10:01, Joel Stanley wrote:
> On Wed, 16 Nov 2022 at 07:06, Quan Nguyen <quan@os.amperecomputing.com> wrote:
>>
>>
>> Just a gentle ping about this patch.
>>
>> Thanks and best regards,
>> - Quan
>>
>> On 24/10/2022 15:11, Quan Nguyen wrote:
>>> Add BMC SSIF node to support IPMI in-band communication.
>>>
>>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> 
> Applied, thanks.
> 

Thanks Joel.
- Quan

> 
>>> ---
>>>    arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts     | 4 ++++
>>>    arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 4 ++++
>>>    2 files changed, 8 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
>>> index d127cbcc7998..353359822d7b 100644
>>> --- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
>>> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
>>> @@ -342,6 +342,10 @@ &mac1 {
>>>
>>>    &i2c0 {
>>>        status = "okay";
>>> +     ssif-bmc@10 {
>>> +             compatible = "ssif-bmc";
>>> +             reg = <0x10>;
>>> +     };
>>>    };
>>>
>>>    &i2c1 {
>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
>>> index 606cd4be245a..4b91600eaf62 100644
>>> --- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
>>> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
>>> @@ -445,6 +445,10 @@ &i2c9 {
>>>
>>>    &i2c11 {
>>>        status = "okay";
>>> +     ssif-bmc@10 {
>>> +             compatible = "ssif-bmc";
>>> +             reg = <0x10>;
>>> +     };
>>>    };
>>>
>>>    &i2c14 {
