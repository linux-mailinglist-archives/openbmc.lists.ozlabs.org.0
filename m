Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAD155B8FD
	for <lists+openbmc@lfdr.de>; Mon, 27 Jun 2022 11:45:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWjX71ZMsz3by8
	for <lists+openbmc@lfdr.de>; Mon, 27 Jun 2022 19:45:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=JWsS3Kp5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.244.135; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=JWsS3Kp5;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2135.outbound.protection.outlook.com [40.107.244.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWjWf0tryz3bm7;
	Mon, 27 Jun 2022 19:45:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLDH6NnH+X/SOEVmyVUd8vngjC2oZq6YzEzHV2m23DvRGTAc11rWcl3I9xo74jmTWiV92gZ10BrsIHJfFGFxHm0gn4p8eWxqX9RNMekTIIQcEnJQY58LCCHLuBXLPB1DIy+FmIJdVn0zvpiYcOpqP+BcIkjkX5FtMfO6PZwJyvEqCaMERx31higqcZ54NJrNpc5rPFhqJM2uf+jSUasXd75xN0ZCL5z8+qXAWz+v9s6Zyh8yPwkSkUMZJzlPlLWGmwBdpmLvPVlvC7WtTF3B6KNiXnYSXAk1z9vJavyqmYX6/h+fqyFUFmRcvuulyLl0HaUDuZyNCJkqOUuiJ3YZYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ssCWl642QdV+EnWX5bL1Nrrc0OCUCyXLPn/H6IcLhU=;
 b=hhMOF1jXvFNGWcjk0HOSZNiBTZmqpPWhdvUlFNGAM7VzWIHp8ypLdeQre41tFzIj5FMf5SovQIlHRdUbB+cqYjEG/u8A5WSlDnBqS7XcEbwuRjqRIAKc1R9eMWhwRqwa/W7w2YsL9GI7edVPVQnEfzX53Oh03TixbY0rmj97VJ4uv2tBaPaEZGbw3SfcTaibDsBv+sCqEMqEmLOoR9WhfCYHsbc97MxZ7hCo7t8MtJIbIPPNo8aldFFmWX4Af21i9yEQhpkdY8hn/vZBXgEp8P9YLcTz4QmpOlA3KQOCGa0bnZkXOAI8gYLh/6wX3Bz96p1mzDQ6d2CX7Nyi0f+ZNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ssCWl642QdV+EnWX5bL1Nrrc0OCUCyXLPn/H6IcLhU=;
 b=JWsS3Kp5RnC6RzbkT/Y5TJeMyKZQ0RdaKtRvEftECEYeGkOmpBFQIVziNvgkC7c2+0ecKspnPTtTN8KBIwv4fuFxia59MrW96V1cpJityExJiIglW2wuF3QDDobn5Uw3NnqPVaOKCf0adL+YYFn1JdPkmJ/G0+3hVl58bzjLHAc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 DM6PR01MB5435.prod.exchangelabs.com (2603:10b6:5:17a::14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.17; Mon, 27 Jun 2022 09:44:56 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e%9]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 09:44:56 +0000
Message-ID: <624cd43b-af83-402d-86bb-68e7242da0f7@os.amperecomputing.com>
Date: Mon, 27 Jun 2022 16:44:43 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] ARM: dts: aspeed: Add device tree for Ampere's Mt.
 Mitchell BMC
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 openbmc@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Open Source Submission <patches@amperecomputing.com>
References: <20220621092120.2427152-1-quan@os.amperecomputing.com>
 <97934f38-4da5-ab9e-7089-d6e48edd5e6a@linaro.org>
 <9120c167-38c2-f8c4-e039-4202d5844639@os.amperecomputing.com>
 <aafd58d6-8705-96ee-7813-9b3bae7bb3d1@linaro.org>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <aafd58d6-8705-96ee-7813-9b3bae7bb3d1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0039.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::16) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5cd06342-ea43-454e-a5bf-08da5821b17a
X-MS-TrafficTypeDiagnostic: DM6PR01MB5435:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	dj1lVZkCBYroVx+gO5rVhOT/ver2m+6iNkqcL8qw/n+i3omxTlKhrTuRNiILz5eAx/EfilHaySn/XSooCeBvNEsiFMuK1aX0uRKOVR3MLKtoAVFrAO60NFZwoc7ctg5ZCE5Ih0sZRmeppkagwOEfFK+To7IWEtQu1FPZjV8bPX8fWhiTeuoGLCIHAp2vLhGTXMo22SywND9JClTvs9JsV8gkWsS/hTnV8j49wTd+H4XrHWhpj2jBTLzYdzTJ5kJ3hq4NBnCIPEci02kUsBCDIXfc+vAbvpSs76zHuHAkw7Zt17ZLME4Ksk/IrGfsr6uTh+yb8ypWTzLMYYei05jY9kNRhXnJyOc5BS02PavVfEnFO0wtezD2n4Rb2iNYra2Ke0bjOInyk3Gr0YBA/zmK0CwXXmHnA/UPVz2x/1gSPgB0pDva+Oav3abCBmT1+i5OJj1L52q0GClEK0yBFEuvyfsHPyL8RTxsCmxCoJ0lJmuui8ziX0pyjP7V55CtloDjhIkEoSbhQ9zlYOMo/BwIOuu63mvjxSjMCoJy0xC9ShSTukRrvRhfAGB+j1xf/KF92nVNkODsv/hunCM7MdRJKDyVe8qciG54ggdQ9d+YHW8uWDz5zCUvhM5EbCmdMltAC1PNdGwkTOktshCoafkpc5Qk7UkWCmiXH8rVLWzxGy36Y6ro6bq10ItqVd0r9r4mS2DvPsnb9cmXTdHbZ19suX+yYAXBiKo8+aF3dpNfZDw0ttETsPU8JuJ/d4I7IxA6cxLbWuDVGJbsG1EKbm+WAW0mkruIa6lNe8uRziSpiBY/kJpXFpMPKmLv2C55YXBZK+aClg7yMYyGCw/IBcxJGzYZjNRhCGbzlZKI31Neq08=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39840400004)(346002)(376002)(136003)(366004)(7416002)(5660300002)(186003)(4744005)(4326008)(66556008)(316002)(478600001)(8936002)(6486002)(26005)(2616005)(41300700001)(6512007)(107886003)(2906002)(83380400001)(6666004)(38100700002)(54906003)(52116002)(6506007)(86362001)(53546011)(31686004)(921005)(110136005)(38350700002)(8676002)(66946007)(66476007)(31696002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?ZmxOU3Nwby9zQ0pxUUl0emQzeEZKRVl4YjNIRkVRU2xPcU44YWVuUnBCMk5C?=
 =?utf-8?B?TWczbFJzMmN6T3lRcHExSGVFdVRxbHQvYzhmTllDMXRGWVN5cTJ5Slh1YWo3?=
 =?utf-8?B?c2RudkJ0b0taeXBORERjN0NsbmZING5kVlVJeDRQNERXa09VUzA1eVBGMDJ5?=
 =?utf-8?B?MkZaZHhvOWEydUIzaytVb1gyeDdrWXVRR0FxTHZyYS9CL3BGeSttVHFITEJu?=
 =?utf-8?B?SlFkcTN4U2ZRaG9vTWdqcS93bHFHSXFUaVBWRHJPQ0NhS3hUbU1zb0ZmanNY?=
 =?utf-8?B?Rlp2TUh2enE3bTAwUG11Y0t6c0dLdG4xaUw4NWYzK2pNRTlmNlAxdjV5Qi82?=
 =?utf-8?B?QWpMK2g3TE1kbGRqd2hlM3RrdWNpdmdFMjVZaUswaEN6ODcxeXgrR1dUV3Ev?=
 =?utf-8?B?VmxXMkhKNmFmT2NYanpIcWlPVWVlMzlTYlQ0aTdMZWp3ZWpVbE53TlAzdnBx?=
 =?utf-8?B?QitaVklyZ0dzR05sSWFTZzVxdVNlTjlCOFdzcEZBNHdUR1ZLUmtBZXdrVTh4?=
 =?utf-8?B?ZS9oejR2K2h0ZFg1RWgzRmp3akRwNDU5T3JDQWlmd1A2eE9STHhsQXZCc3N4?=
 =?utf-8?B?eEJ5czIwc1lNYmVmbDdJeEZBRjVuL3VENzA1NkxqdnRTZ25acmNVdDFGZ0Zo?=
 =?utf-8?B?Q2lsbGFTYnVUalJKOHdRcDdwME5BMUlqbXk2akt1S053UVd3azBVWjRrNkJK?=
 =?utf-8?B?NkFVc3JGdnlRRmlQYkdiNklvRWVrZXowU251OUxVSHVMTmpoOWF1S0FwMTgx?=
 =?utf-8?B?cTlwNlZINmdybWg2UHRRODNHQ0dUeFVmQmFISUF4VWc1bWhjRDFWZ1A3cTRB?=
 =?utf-8?B?TWdhcGh4S1hGQmVFaStJYXpzTjVBSjAraEU4SGk2ZXVlc3dxc201ZHpDdU1S?=
 =?utf-8?B?NlppT2oweVJ2NnJ3enJodnNHeXVGSE45aTdPanJJdEVHTjlEcytyN0I4UnpM?=
 =?utf-8?B?ZnNYbmszNVVDUGhtQzNqbUsxMnhKeTdtQXgwMlE5dmp2K3F6dzE0NXd5VytJ?=
 =?utf-8?B?ZlVtRTBMbzRlRWo0cGpGNzZKYTE3R3pvbnV3N3RuLy9yRkI1dklqdzN5eW0w?=
 =?utf-8?B?eFFkTk5CRnZyUnVTRGRacW9mcFBpcHJzSHNENmlKeGNaL2xZQmVsUUY3cDF6?=
 =?utf-8?B?Mi83TVZjQ1Rja1ByV3hIQUlkWkludmp6ZmdPS3k5eGw5b0hTb2U1UWxMdFpo?=
 =?utf-8?B?a2FpY3F3OTAreCtjcU8wSHkxTDFiUjVkUlVaUkF1WlVuOXN3YWMvVnJSa2ta?=
 =?utf-8?B?bVgxK0FueWhNUENhOVVBUEhQc1l1STdER2lwbXU1RkJZV3h5TkZCTVNBVmRT?=
 =?utf-8?B?NDd2VHlrY2VIb2pubU1XdVQxczBrK0RwU05CMDg1ckpQbVhHWkJEa3dVaVE0?=
 =?utf-8?B?cldGb3RKV3VHZHAvT0VKUUZlVU9YOHVPNUpRYTY2dVBRaHpINExOdU50OXZQ?=
 =?utf-8?B?VmRNeHhVSktWMExPbWVYMzFrOFN6V1RwSlgzQzFtS1Yza3htVTM4WmVoSWJo?=
 =?utf-8?B?ZFlJOUVLRzRjZ1RWZGh4YnRMZWdvNlBsL25vK3cxc1E1UC9rZS9rbm8rd2ls?=
 =?utf-8?B?VExLNGN5c1dFb0NUcHhra3lMYzhiL2RuK0llcldVd2RPcnBkWnV3NkN6bEZH?=
 =?utf-8?B?cHZ6blJGZUQwcTdmbjVjRWR4K1VkY29Pb0ZBY2V5MUNTNFRHUWxKUGF4YUpM?=
 =?utf-8?B?T0o0cFNYcnYxVXdEeUNGL3NEOHBhaDAzY3ovUlJpczk0MXdoSnBEK01tS0ZH?=
 =?utf-8?B?V0o3VzlsRjNIT2ZERVpMQUoxNVdXeHhtUEtPSlJBT0xBMURYeFh1bnBoWkdL?=
 =?utf-8?B?b3l6UDY4U2s2MEZOQlFlUHV1aXBHd011TTdlcDhTcnJGLzJlem1Tc005SEtM?=
 =?utf-8?B?c0hsQXVuRHQ5blRMU052dVg1U25URHhRZkJWdm1MVHgvRHBWQU8vL1BzUUtP?=
 =?utf-8?B?L296dXMyV2VwdGZIV2xUazNjekJaYURrbGFKdGhPYWRLelpGa09QbHBGMDY0?=
 =?utf-8?B?dk1BZi9FR0hCckFNM0JSSktzakNqK0JKNTVCcHEzM1FnK0tOTUM5VzNWTFZq?=
 =?utf-8?B?VE1lUmMwWnI4R05lQ3FhTjMwRStGc2ZUU0ZyNFZZeG5oMG9MZUdnWEViUDRr?=
 =?utf-8?B?NlFqUG0rTnpIbWU5a0NoODZyK3hUbjJrWmdNYXdNdXprd2Fjc2k4NHVPaUtW?=
 =?utf-8?Q?ZwMqSSOkkiD10VHi5D81qRs=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd06342-ea43-454e-a5bf-08da5821b17a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 09:44:56.4566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: scddqReLQ/Id1q9V52OAC3Zvs/1afIc+1JtpvGrcE51G86i4kQABdHtPxxRgE8U7FE+TZdAmd1OZ1cKfmxDDJ83nGcjqoYGL9c37Iq9Qo2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5435
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
Cc: "Thang Q . Nguyen" <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 27/06/2022 16:35, Krzysztof Kozlowski wrote:
> On 27/06/2022 11:32, Quan Nguyen wrote:
>>>> +
>>>> +	ltc2497_reg: ltc2497_regulator {
>>>
>>> No underscores in node name, no specific names (Devicetree spec requires
>>> generic), so ltc2497 has to go. You could add some more specific
>>> prefix/suffix to describe the function.
>>>
>> This is to monitor peripheral voltage so it would be updated to:
> 
> But it is a regulator, not a voltage monitor, so the node name could be:
> regulator-0
> regulator-voltage-mon
> voltage-mon-regulator
> 
Yes, I think I would pick the voltage-mon-regulator:

            voltage_mon_reg: voltage-mon-monitor {

>>
>>            voltage_monitor: voltage-monitor {
>>
>>>> +		compatible = "regulator-fixed";
>>>> +		regulator-name = "ltc2497_reg";
>>>> +		regulator-min-microvolt = <3300000>;
>>>> +		regulator-max-microvolt = <3300000>;
>>>> +		regulator-always-on;
>>>> +	};
>>>> +
> 
> 
Thanks a lot for the quick suggestion.
- Quan

