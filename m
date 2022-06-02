Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B09ED53B635
	for <lists+openbmc@lfdr.de>; Thu,  2 Jun 2022 11:39:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LDLZF3lp3z3bnJ
	for <lists+openbmc@lfdr.de>; Thu,  2 Jun 2022 19:39:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=kOuXWkDN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe59::721; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=kOuXWkDN;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20721.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::721])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LDLYh6QBwz3bkZ;
	Thu,  2 Jun 2022 19:38:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dysr0h4RQopComgOC0mf5NLt8pezQMtDjo39JjG/heZf5toerQ65JIVLcA83xG94PmtaUynqH/HfsAKMm3pi1BH6poTOQTdLMBRv2bTiP4ezMyqU15sK2lhzk0+l3bSwUuNzmP90S2i++XaEpRVL3j17zUjVjH9GsX4kjtqDAk/vz4ApPvvOA3ltHOnH1FHDOApKqDW8HRnQS21PWWDAF94Np/UUN/W2d6eRhgiDB9ygzDaNYdBp6IhlOdJDstVb2/l8nHx1n4w5Kf3zcVmF7DEDo7qaHFr8OfnwXRmGhojG8Rhu0bJxrnymYrSF8k517wPBxHeeohDQjMUlj/TaYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0SqOpPTtPfGAfAlQkWR6X0KyhTaxRms5p/wcg66Cco=;
 b=IUJVkYK/PG39yrBaNCG5fu8/e6Fk557GXPFobj8gc14yK+PJux3M7MiMPyipiKPbpLPHUhtQSpeox5m5UY0llxBP3SdxFS+XkS8XyvtwCpfzqnnI0OFhyCM99k2IYDmW3WvfSnLOCPLw5bPudpAjQogHZ1eJbI2pzlJpQIXOCPUWffSc+stgO/d1Sv4jyum77pg6aUsmWIFD6DUDkJ9tu0T8CpEO36/yps2nBaPF/amNOsn8I2REsGgJitosKoSVgRLgotBaMMIBkSqGU+X5mZlzGuJD/1tyJMdRboJjozsqeT9+zKu1ZLVZC0iag3WuyKBkwUp2xYfuxvwjzp3d6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0SqOpPTtPfGAfAlQkWR6X0KyhTaxRms5p/wcg66Cco=;
 b=kOuXWkDNz3W985uG1KLJmCNdTlvZ7jjM7AY8cg3YvzawILOb3RUHwo1WNm69Gmy+X01cqEVZulAudWEv6Q54d8B7evKIrkN9Bjnmp/MjM8epykQwor6AswnlpyJeaL3+sFtH0EgLw6VjjHJUu49kwihkeviNQN/+vgLTBVNeEbQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 MW4PR01MB6500.prod.exchangelabs.com (2603:10b6:303:72::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12; Thu, 2 Jun 2022 09:38:30 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::e877:bfc6:92a5:d237]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::e877:bfc6:92a5:d237%7]) with mapi id 15.20.5314.013; Thu, 2 Jun 2022
 09:38:30 +0000
Message-ID: <052469a4-1f0b-8615-7b4e-fa16159297a2@os.amperecomputing.com>
Date: Thu, 2 Jun 2022 16:38:19 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [Openipmi-developer] [PATCH v7 1/3] ipmi: ssif_bmc: Add SSIF BMC
 driver
Content-Language: en-US
To: minyard@acm.org
References: <20220422040803.2524940-1-quan@os.amperecomputing.com>
 <20220422040803.2524940-2-quan@os.amperecomputing.com>
 <20220423015119.GE426325@minyard.net>
 <ec7b86ec-827f-da64-8fd2-eae09f802694@os.amperecomputing.com>
 <20220504120631.GE3767252@minyard.net>
 <ba084735-0781-7ca2-4d04-a70a4115729a@os.amperecomputing.com>
 <20220602003244.GK3767252@minyard.net>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <20220602003244.GK3767252@minyard.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0047.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::16)
 To SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cbea329-f3dd-4f8e-ee21-08da447ba710
X-MS-TrafficTypeDiagnostic: MW4PR01MB6500:EE_
X-Microsoft-Antispam-PRVS: 	<MW4PR01MB6500BA66DFA975A5BBB7C814F2DE9@MW4PR01MB6500.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	lGFHyzomHBF+YzqpU3JvdXr4+3afFwAhDBIxxs6SbcJ/Og+s3BnHdFE6Gk/HfNBtUJnbbohHvOKS1Ok6MhNnt/Q4WA5Mv05ZjlCzW/+lj42o3K4AC3S3+0vIj6UjNcUnclQzcpf/gkXV16hGZpwckNcC9108p/lle4WO6V5QxnbTmlNU2MGbPY5wCNh7zDTwIOlc/qqlATbclrQpoqNGm7ZMjRZ8zIMKjWLsOP49DERb84LH9V+zFq1vGVBiwYw4whz/4nSh9A6/uQygezYKvHbiNQ48XJ/9dyk/CTO3uN2A/frc1z5qmTdJaXiMUW8w1gYYgmZzbV+Xd8JStr2rbvGdrxFPSZllaH+GtlEtE58jzZ406xWWXVxcJjqCZHZcZ364RMjXjayJsi9xsSx6MYq+ykNw9oT3+xR9xq4MPJnulLuYhGlmgeNRoGD0NoQx/42ri4HLb3iJ2W2TyKVMJMoOUegLlGKlS1jwJ1KBn8o0PxAnoh5yeT6bwDfqJdWT6oZxqjhXxupo/h/jIQwXGaBadj976vSzl4YrtWLnQ7NAVqLITJ96sDlApyh+tPaTsYIZ4xBq78Mi4HwQUmYtmMjm3CvfE9TgueqH1c/4LrXRut7mtuENzYsRbb67caGad0qHPwLp0iaobqqa5W+cm06XRV011bxXivqhGsg2Pjzsc70UE49vibsCCH+hRbKEd/batzYC3pAJCm2/lat7GDj4KNU+LpKlnhqJXbVS4Hu66IEY8LM61ElpWTEL/e2z
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(7416002)(2616005)(66476007)(8936002)(83380400001)(6486002)(5660300002)(508600001)(2906002)(26005)(8676002)(4326008)(6506007)(66556008)(6916009)(66946007)(54906003)(38350700002)(38100700002)(52116002)(31686004)(53546011)(31696002)(86362001)(6666004)(316002)(6512007)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?NEJmYS8wak5aYzBWQVcrdHJNYnk2bE40RndPTmF2TnZMa0xjL1kwcTJaUzhO?=
 =?utf-8?B?Q2g3QmQ4N3Fhb0c4bjlKUUpxT1ZPNWI4ZDRxa3daMDdESWE1Y3RqemZQVmZp?=
 =?utf-8?B?R1FFUUhKK3VLR1VXNXVKMkd5c1Y3Vk9zNnh5NS9RbFBnOWNoQXhWWGNHTzVa?=
 =?utf-8?B?dmZJNk9lZkVsM2w5b2V2cExpOGEwaFBHVzhJaFV1SHkxejQraDBKZ3ZNZzJx?=
 =?utf-8?B?ZjlsKytDbVEwenRUUEg5ZTJyckx4MDR1RWlZcGJoOW11Q0x0OFhTVnAyZ2ZJ?=
 =?utf-8?B?RGZYdHNEVkRRR1dkNzZBSUpaS1ZrbkRUVVliaFRCaDUzYlVneE9JNkZUdmdp?=
 =?utf-8?B?SnY3NnNWR3QrWG9ja0RaUGNNZS9PeFdMZFdDODdGS0JZZ2xQVThzMHZRTmFE?=
 =?utf-8?B?SFAvTE5NTWtXRW5PZnRBT1puTVB3UHpqNU5ZRFdFY2hRZjcxOFBCNU1tdjBv?=
 =?utf-8?B?ZHZac05PL0QwVnBHSE4rSXdiUnpaNHZlc2thQXJnbkY3ODJqTy9GVWthelE4?=
 =?utf-8?B?dmtmWjd5N2JrUkxLNC90QithdmM4R2E2WnJGYXM3amFNTHFzOW40Vk82Mi9v?=
 =?utf-8?B?a1FtRzNyekhleDQzRGtYT2d5Mys5aG8yNisyb1dWYVZhbGVMcUlCeE1KNTBs?=
 =?utf-8?B?Smd1V0VRTUlJa0xRZjhSdTVtUDFWbjNMYm54SjVTVW43UFdRd0s0WGR1bUtH?=
 =?utf-8?B?RGJ4TjRDMTJqR1dvaTMzTU1UNjYvaGl2SmdoNVRDTHFUcTRYWGlBbWhaOGwx?=
 =?utf-8?B?UUlTekx0a3FhdGhhbGloUzQ1WDE2Nk5sWGYwTnpndm42WDcrT2NXMGkrUTZq?=
 =?utf-8?B?YlBYQ3VGZDYreFhmMkpPbWU0dkc2US9nTzNlWFpOd21mV2hjeWVpMGxyQUV5?=
 =?utf-8?B?MUVyWFBWWGFGVnJoN0VDSXVqRldQZUZXejFHRFdadDJpcVF5MHl4aitmbmg0?=
 =?utf-8?B?a1JETXdNWWM3R3gxMG9VeHJwM2dsWGN3ZU1NNFNFcGZ4azhDZVYyNzBmeTBv?=
 =?utf-8?B?cnhxL2pJOTFHOG5rTURzNVFPYXd1TG5OZjEya01LVStEaDljVFYwWjE5QnNG?=
 =?utf-8?B?WmVrYTZaeFVSM1kvZHQvWVRLSTBycEp5NmtpRU9qL2wvcW5zTzl4UHM4dXpx?=
 =?utf-8?B?YlRBRkZ5aEZqL2Y1L2Z1SnllUnpCU08wSEdsVE15WWhaMWo4NElqcTBwV0Z1?=
 =?utf-8?B?SjdGTVB0Mzd4YnVteVpMUWhSTzRqUnhMZ0EveHZlcWRvSmVhZ01kVmZEL09N?=
 =?utf-8?B?L2k5VzhzaWtLRWF6c0JvanZtQUlSVWtQSXNOdGVmcEJ2YnBuMEtUeXEycmxB?=
 =?utf-8?B?bCtPZUtOWDA4di83SHk5WENzelY2NUJLVjVvR3lORDdmOHVZcjZkbXF3dllF?=
 =?utf-8?B?NXR1NlJyaHpoT2s5NnBhK2RnUmIwY201VXZ1L3YyVzFXUzB5MEl1V3dkSC9H?=
 =?utf-8?B?SURpaGdZeFNTaGVuNWZsdWMzNG9ZbTFpbjZUalZnYTFBMGJkT3dkYzJYMGJn?=
 =?utf-8?B?eTJsZHFERWJ1Q2R0T2swc05IcFZHSlgyeDJXS0tzTCtMVzF6TThkNjVwaG1m?=
 =?utf-8?B?TmlwRE1aZzlQRjBiOStlWi94bW5NbUVHamVoOEtWRkhhemVBT0FNVEJtSFF5?=
 =?utf-8?B?ZzJEZmRUcTlEYURGOVpXZFdadmRRODBabkhZancwek80Mkw0NitwdlpSWHNw?=
 =?utf-8?B?MW9sZnRUQncrT1FRVnNsTWVvdS95MnpNa0tIZUV6S0pMWHA0UTZJSkVwWVJx?=
 =?utf-8?B?Uy9LZ3EzNTg5eHNLM2M0VldBZjF5QzlBb2pFaXdCNG85TGkxM2YweFIrZy9C?=
 =?utf-8?B?cUJ3M2d2K05NeVJ5R0prRXF1T3lUdVIxK1MvZFpSUnV5Qi9UZTloSC9TcHoz?=
 =?utf-8?B?QUtxODBmT3FaQTJiMTdJM1BVQStGUzRhaUpPVFFVdElXdGpBekJLbGl2Rk11?=
 =?utf-8?B?Z3NZTU1JS0FoY1VpcGZsdC9RU2x5QjNiWnNadGlRbEI0NUFTQUdicmQ2bUFa?=
 =?utf-8?B?RlgySHRpOEtaNFVyTDZ3VjNueDdwQTdjdk95VXZNeGZqSXJmMkJFVnd0L0Fu?=
 =?utf-8?B?WW05ZCt3aHJFUXNxbkhucmxvSVBnMENkM25DcURpYjRFa1g5Q1VCcG1BL1VC?=
 =?utf-8?B?QjJKSDhtSm1UUkE0dmFwTTZOVTJidm9ZNzNKQmcwU2dEZ0pUNHh5RXhBNDRD?=
 =?utf-8?B?bEkxQVd3TFpPYmZFdmlSaHNENTdrekJteU5JV0tXQ1NrQ1pNcldwSG42NGJl?=
 =?utf-8?B?WjRabERpNGdoQ0l4MVFmbUIzcXRaMzM5TU9EeTlDNnZHSWttMXpnRjFCdGFM?=
 =?utf-8?B?UjRCenlRM1lUZzFzOTlhemMxYlducmw2OFNrcGRzVDJnMzNRQjB3endlcjIr?=
 =?utf-8?Q?2BY+LlHjEBgniDnqIg8BPPLGa/hGIf/hPaMxq?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cbea329-f3dd-4f8e-ee21-08da447ba710
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 09:38:30.6854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4MVnFJAaGUvXzI0DNakhwdhN9dUunj8PmY4MNXkckCZvdbc9p2t0a+2BbNss/01P69NAZ4ccuMGOsA0dJoA/Cna0/EJ2b5aM3U7xGWHYXTc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6500
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, openipmi-developer@lists.sourceforge.net, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 02/06/2022 07:32, Corey Minyard wrote:
> On Wed, Jun 01, 2022 at 03:23:11PM +0700, Quan Nguyen wrote:
>> On 04/05/2022 19:06, Corey Minyard wrote:
>>> On Wed, May 04, 2022 at 01:45:03PM +0700, Quan Nguyen via Openipmi-developer wrote:
>>>>>
>>>>> I seem to remember mentioning this before, but there is no reason to
>>>>> pack the structures below.
>>>>>
>>>>
>>>> The packed structure is because we want to pick the len directly from user
>>>> space without worry about the padding byte.
>>>>
>>>> As we plan not to use the .h file in next version, I still would like to use
>>>> packed structure internally inside ssif_bmc.c file.
>>>
>>> Packed doesn't matter for the userspace API.  If you look at other
>>> structures in the userspace API, they are not packed, either.  The
>>> compiler will do the right thing on both ends.
>>>
>>>>
>>>>> And second, the following is a userspace API structures, so it needs to
>>>>> be in its own file in include/uapi/linux, along with any supporting
>>>>> things that users will need to use.  And your userspace code should be
>>>>> using that file.
>>>>>
>>>>
>>>> Meantime, I'd like not to use .h as I see there is no demand for sharing the
>>>> data structure between kernel and user space yet. But we may do it in the
>>>> future.
>>>
>>> If you have a userspace API, it needs to be in include/uapi/linux.
>>> You may not be the only user of this code.  In fact, you probably won't
>>> be.  You need to have a .h with the structures in it, you don't want the
>>> same structure in two places if you can help it.
>>>
>>
>> Dear Corey,
>>
>> Is it OK to push the structure definition into the
>> include/uapi/linux/ipmi_bmc.h ?
>>
>> Or should it need to be in separate new header file in uapi/linux ?
> 
> I think a different file, like ipmi_ssif_bmc, to match the file and
> operation.  Unless you need the things in ipmi_bmc.h, which I don't
> think is the case.
> 

Thanks Corey,
Will add ipmi_ssif_bmc as you suggested.

-- Quan
