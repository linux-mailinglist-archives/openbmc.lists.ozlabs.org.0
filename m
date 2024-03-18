Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 606EF87EDFA
	for <lists+openbmc@lfdr.de>; Mon, 18 Mar 2024 17:51:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=Ng+NzCtA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tz18w0sgNz3vkT
	for <lists+openbmc@lfdr.de>; Tue, 19 Mar 2024 03:51:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=Ng+NzCtA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:2407::701; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:2407::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tz18J5pkrz2xdh
	for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2024 03:51:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QV9HTSEMQkIVDAbVmcb2b7p8ekJ2roXBYdVdJge/2CXFLvyFLtUi3UC/PdMrfJORwtIfBjMi2zuSKmMbgVO08zqi+kUpGbLTIBml64I4Y7HkEaLwYDbIvE0NRtIOkD9L55/jwK7M1VqOvu6vQ94cvIVbNPRnYzmjQwn+kBq7pZkc8AW8SfiTBnyChs7z3Lve2KesYn1Ocxg1DF7wGVVc6BZVPTf5aTI3Bbf7kUgI3t57pIAFNt6fzE9qINTM8GkygvXNcYtUTqTYqwc/KUUk8Sz/nG6ynifY4rsuSkmioqXjIWhcbHpliLRI8OswQLJwuH0XLOkOA0P1+GrjSsguUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HE48w1eUljyjT1r0DoeIvCeFYZOogsmMvflmgdqT2/Y=;
 b=SPguZ4pQklDmczou5P640K1EYD8wfgLg5Fd+Q5Q69KgxOmrb5Nq1svFUtohadFsxh0iNh7X/ejL0StK1zZXwN8gdSdr2Gr7DepPaMmjRar4OcKr6ffbjLNXcByZAP4gTZ53oz/UbsXLQrsdhd3TxShm096z+qu3USyvGnSKqKYiUGOiJguDrdDJgbdX7gQfvNwRoGoNrjv21doTS9KGCB0k/El4OtZVsi4G5mwpHCiUv3ry9cnAYwT0sYhrmfwhBWGFqLDocHbyiN24KxJomVlMULFbhNX3/BVOmzw1S2/oJ/m3bQNoRxBzMaQERFJe1bJDVyUUPx/E799zi0cNrSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HE48w1eUljyjT1r0DoeIvCeFYZOogsmMvflmgdqT2/Y=;
 b=Ng+NzCtAyyV0TSrNxdkNIjAyvdTOWXY3DvXs4cRD8NJdredURv4qLWvy88zkjnvIiXWqYn+MNoDtMIIuR070frLikOyQaGLwIRUf1THWJyr+y7FiINUJ9su/H/PI9ZvJU6sztXlJf4jAR7HV4dpBZsBYE3H+TjgFJYFLhj5uQsM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5947.prod.exchangelabs.com (2603:10b6:5:1dd::12) by
 SA1PR01MB8251.prod.exchangelabs.com (2603:10b6:806:389::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.26; Mon, 18 Mar 2024 16:50:50 +0000
Received: from DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::b557:13cd:8a29:ae08]) by DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::b557:13cd:8a29:ae08%4]) with mapi id 15.20.7386.025; Mon, 18 Mar 2024
 16:50:49 +0000
Message-ID: <e7ae980c-8408-46e3-909d-29b3d7e1e050@amperemail.onmicrosoft.com>
Date: Mon, 18 Mar 2024 23:50:37 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: hwmon: max31790: Add
 pwmout-pin-as-tach-input property
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chanh Nguyen <chanh@os.amperecomputing.com>, Jean Delvare
 <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Justin Ledford
 <justinledford@google.com>, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Open Source Submission <patches@amperecomputing.com>
References: <20240311111347.23067-1-chanh@os.amperecomputing.com>
 <20240311111347.23067-4-chanh@os.amperecomputing.com>
 <9d1207f1-4941-4f2a-99d6-371f5b4709f5@linaro.org>
 <f281d2b1-54ff-4e5a-83b9-5b05f18c40fb@amperemail.onmicrosoft.com>
 <7252305b-4c7c-4cec-8ef1-8bf96293b469@linaro.org>
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <7252305b-4c7c-4cec-8ef1-8bf96293b469@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:610:1f1::28) To DM6PR01MB5947.prod.exchangelabs.com
 (2603:10b6:5:1dd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB5947:EE_|SA1PR01MB8251:EE_
X-MS-Office365-Filtering-Correlation-Id: 505d79d1-8c4c-4e6d-6806-08dc476b90c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	+hx+Dv0yjN/GwkXH9EfLZ1a5NwdbNNTIZ9370LFYxv7eYAvo5zV6QQUt+70RPoF7Z64QlwPz2KAl3kAHSpZv9pTPQfoSUWJ6SkFy5uJThjxuLKNKnVTgFU1wkH8G96tcUbPtdg3ubc2tcT33ixhu4pND91jsaCehcrVSlKwrttSN4HvqfoNOnV1V1s7x3Nmz+/RLMHYTGbaLmFmn7lACrTJSLPg3vMRu8so84RsDKxrliYX9BLTYOFVMCA3Qt+X51BQ5zTqTEYGXyZGwyTwTiCBhELhKvHlt5B8DZ7a6BQqpXNXjGCsT6zmhJvAPF9tQgxCL9UTV3kmYzfB5UH+w812ONmekwzwNDYlQHfIRX0fxsTfTboMASRBwRpPLTdsmVaqCYdiqXpw4zjKXKJ29fAtDAzrwizHmJO2p1C1ZV8kl46bxfj/DXCuU0L7CDk/29UKbgU54keH1EyTZiDiaXqpULYUmHTSyx93ak526ocuhpgI4MwxKuHyCwOxJisHiOVh4uSYQuAaCycdAmbwXmBhnslpX9XfvjBeD0bHkInfSa4yRtWEhpF/ELlkB6Titzg5UG3BqTGYftfX2q01DQbM2KJz5qkvUuwRZlCPAQUQ9sQYFIWrvCWqUIqt4qCpWQk/WtGK/3hg52n06+VKFWIS7IWNYVcXqv1ujoW4fSHMcHCuITInWxjGZBtfP9sP6mk7hHRy/DQxUMgBi44hIeg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB5947.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(7416005)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?c0RGV2ZvQ001eWR1aDJGS3JwSkFvNlhTbUJUcGVIMVZmZXhUMlJWcnNmQncw?=
 =?utf-8?B?SitTR1JFb0NiMVg0ckpPR1ZOY1RiUFFOVzNxSytLcFNvdm13VWpLendtVGNW?=
 =?utf-8?B?TTFUUlZLcjZyL1BiTnFFb3dyUSt2bWl3UXp4c1lxNm9pblpwMlg0elNpcUNK?=
 =?utf-8?B?cUdJNHdXSy9HUlNsUmhSNjZYOXJrTTk3eXp1OWc3Q1g3L1J6VHRPQlVWY1BT?=
 =?utf-8?B?OFV5UXdhOGgva2s2bmtSbDdJVUJMd1pXN3A3VUU1NzJkWUJWaHUrcnZZV0Nw?=
 =?utf-8?B?c2k4RHRIdGs1NzhwQWh2aGRmbG5sQ3RsWFZmbmdhZHN6U1dYd3hXVjFncTFy?=
 =?utf-8?B?ck4wRFhqeVNCTFhuT1g2OE5WL3p4bi9FSU5YR2R2KzdHOTU0b0NSYTV6YVZ2?=
 =?utf-8?B?OUk1RTZqRXMrbDBHZHRoTHJhTFRScXkwSkdiWGZDaklxZGlRRDc1Zmc3V0FJ?=
 =?utf-8?B?SGIxckdpVkd2dXZFUVhob2dtK0VPUktQVk1zUkpOdzVwL1ZsZ1pjSG5wM3pH?=
 =?utf-8?B?VUNRRkJNOG1lZVVJd3dGWkZ4aU5iMGhNZktKeElyTW5oSGs1SXhKSUVtZzlj?=
 =?utf-8?B?ZDFKMmdzYzhOVVIwNGFWWjgyTWY0Z2l1SmV5TFRRaEFrRjBtMHJzNm9pbytI?=
 =?utf-8?B?VnVZL25JeFRYUVRmYnNUdm5qUC9MMFJzeStTN1FyMU05TXNHOUk5ZUFhVHVm?=
 =?utf-8?B?YmVnWXhqVUlDdnlHblBOSC9NQWEvYmlLUzRqOUdLR2hOSUt5NTBVVCsrMkho?=
 =?utf-8?B?ZkZIYmw5NXVmb2JjSytjMDViM3RMQ1N3MjBGa3JFQ2tKYUFrZWFMNHVlSUYw?=
 =?utf-8?B?RkRhZzA4U24zQUNMNG1nbVllVStCenVXOG5XNWY2L2g1SGNVMHFUMDN6QUxa?=
 =?utf-8?B?QkgyaDk4VHlEeXVhZllwWGJTMlBHbkNwYXg1Y0hKNkpvdEpzK3ZhR3V3dUZI?=
 =?utf-8?B?SW9KemFIaWFOc255b2h5NlZ0Vmk4cG5vVmR2MVJLanlhNW9XdU1aZFl2QWMz?=
 =?utf-8?B?S1RrNmRTMVJzSDBBZ0x0aWREMGQrNjkyTlNzQ0QwVEY4VGVpRDZGeGVoTlJs?=
 =?utf-8?B?THk0Sm5QTzMrZitza2hVSFZ0dTQrdE5WMkc0UW85STlScHZHcXNiRjJIQmRG?=
 =?utf-8?B?ZUlodTBuTmJyYWdvZzZaRzFXM29HU0VzZVZIaWpIaG5SRGRoTlBib2dCN3hq?=
 =?utf-8?B?OGQyZG5oYWZLYWpId051ZUg0VVVIVWFJTVlobi9mYXhZNlJlTFdqMGMyeXp2?=
 =?utf-8?B?ZUFpcmNUODdzdEkyN1N4Z0NqSlRHVzhJdGRiZlZGcnVBaFFFSlFrWDJ0MUNP?=
 =?utf-8?B?OHF6eHdOdjFCK090bjdaQkV0WUk0Q0F1N1A1bC8yTGRPSFZaRm4yOEthb21F?=
 =?utf-8?B?VSs4dGFIMjJUR09KSnVxd0dybVh0MlRoWVM1MmIyTXZFaURRYUxGMmFHb3VO?=
 =?utf-8?B?S3pPVUdRRVpNakNPQzJEaGkrcTRUZTU3aVhJTXhjVVRsdHhjK3djNjVRWC9M?=
 =?utf-8?B?MmZKYlBVa0hiUjM4aDBTeWtISnE2WmJpbDVOTDUrVlNhamlTQmZycHdacDdQ?=
 =?utf-8?B?bEJiM1dmTVJVWGdvL01uT2xPdGJRMDFIbXBwMDN2Skxnd0VISWRGUDNoYUxC?=
 =?utf-8?B?YmFPc2NTM1ZNVXNBamh2MHF3L1BEYk5aU3dacUZmcW1EOW80bjBhaFlGU05H?=
 =?utf-8?B?YUp0VzdmVmRsL0VnKzJnckJnUjZrR1JrSXkxTGpJeFVYby9Pdndqb3JXOW10?=
 =?utf-8?B?cEFLMlpUVkpVSDZ1MEZLQjhiVzVBVVJUTnlSbFVNZHY0a01hZUVTUHRjSGlF?=
 =?utf-8?B?Y25FV1duelBqVUozRkRKdDhCbzcwYlJHSENUNUdtVVZVaXpzRnBucG1QVTRo?=
 =?utf-8?B?QjVrbndXUGRTeWt0S0VZaUQvMTFUOTdiUlNaSFpDWmdyRTRoaVo3TW9oZHNm?=
 =?utf-8?B?aG4vWDMvdGcrVDIxTUJSWm52WklwZ2hQQnprL1FzNWxJU2tNeWtUNVF4ME04?=
 =?utf-8?B?VWZHL2FJdFVNb2xQNGZsSTFuZWNZM1pKZDIvRUVTdllCRFpCYVAvSTV1U0E5?=
 =?utf-8?B?QlBEa3crVnFyVjRMbFA5aGV2VmRObGxDaFVOQklCZVY0bHFtL0IyM1YrdXdQ?=
 =?utf-8?B?cVF3M01BSk1JeFNrWDJBcEJBVWFPalBhN216UGNwRXMwNW1EZTUwWUdUc3Bu?=
 =?utf-8?Q?GGENGJHs2jXTz6dSGrdBYrI=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 505d79d1-8c4c-4e6d-6806-08dc476b90c4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5947.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 16:50:49.8441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +yl9N8Mht5+P49FyQTaNaahitdq/sh74CYs5iTGSXQKH0G6Az4J5zLtog5tmj4l7yi9mknIIkgu0mZfvSLqRiWWzG66aDe/AUT99nbhbR2DT+7py77+LeATODNwXFOU8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB8251
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
Cc: Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 18/03/2024 17:02, Krzysztof Kozlowski wrote:
> On 18/03/2024 10:48, Chanh Nguyen wrote:
>>
>>
>> On 11/03/2024 23:56, Krzysztof Kozlowski wrote:
>>> On 11/03/2024 12:13, Chanh Nguyen wrote:
>>>> Add pwmout-pin-as-tach-input property.
>>>
>>> Why is this split from original binding? This does not make much
>>> sense... Add complete hardware description.
>>>
>>
>> Ok Krzysztof, I will merg the "[PATCH 1/3] dt-bindings: hwmon: Add maxim
>> max31790 driver bindings" commit and "[PATCH 3/3] dt-bindings: hwmon:
>> max31790: Add pwmout-pin-as-tach-input property" commit.
> 
> Later I checked your driver code and this explains a bit. However first
> patch should explain that instead. The split is fine, but just lack of
> rationale is confusing.
> 

Thank Krzysztof. I'll try to explain in detail each patch in v2.

> 
>>
>>>>
>>>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/hwmon/max31790.yaml | 11 +++++++++++
>>>>    1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/hwmon/max31790.yaml b/Documentation/devicetree/bindings/hwmon/max31790.yaml
>>>> index 5a93e6bdebda..447cac17053a 100644
>>>> --- a/Documentation/devicetree/bindings/hwmon/max31790.yaml
>>>> +++ b/Documentation/devicetree/bindings/hwmon/max31790.yaml
>>>> @@ -25,6 +25,16 @@ properties:
>>>>      reg:
>>>>        maxItems: 1
>>>>    
>>>> +  pwmout-pin-as-tach-input:
>>>> +    description: |
>>>> +      An array of six integers responds to six PWM channels for
>>>> +      configuring the pwm to tach mode.
>>>> +      When set to 0, the associated PWMOUT produces a PWM waveform for
>>>> +      control of fan speed. When set to 1, PWMOUT becomes a TACH input
>>>
>>> No vendor prefix, so generic property... but where is it defined?
>>>
>>
>> Thank Krzysztof! It is not generic property, I'll add the vendor prefix.
>>
>> I'll update the "pwmout-pin-as-tach-input" to
>> "maxim,pwmout-pin-as-tach-input" at v2.
> 
> Except that you should really look into common properties and use them.
> Or explain why do you need new property?
> 
> Best regards,
> Krzysztof
> 

I'm also discussing with Rob Herring that on patch 3/3, I checked in the 
Documentation/devicetree/bindings/hwmon/fan-common.yaml. I found the 
tach-ch property, but it seems to define the tach channel used for the 
fan. It does not match my purpose. I want to configure the PWM-OUT pin 
to become a TACH-IN pin. I wonder if I can use the tach-ch property for 
my purpose.
