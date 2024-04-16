Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DB78A62A1
	for <lists+openbmc@lfdr.de>; Tue, 16 Apr 2024 06:54:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=NtfbO6kx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJWsP42Yzz3dSM
	for <lists+openbmc@lfdr.de>; Tue, 16 Apr 2024 14:54:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=NtfbO6kx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:2416::700; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJWrt5L3Vz3d36
	for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2024 14:53:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWpbD/LoHA8E68QRGJv6EgFGMFg/uoEzKTQcB9EIpy6zbRJaPYUJyMJbjXz6KBD++sDIGPZw1FI5eKUq1EryVA0P0XPMtDOVz+MFeAp24d4RGe9Nrw95wYvgvthZflD+6F/1Ocg9UnznFIXIxSHh6ciXbQdkLDgyzeo83NeYhRWrhEmqZ6Kk82J5QvGvjEKW9mU5okwSMAXglrUMwbYlwHRVSE49nkzGNm91zbQPSolPf/YYwLvFo14MKR9YIsSru46BlKoGJ4shHggAOe6td/0vfkXRu6y0AtqgcemQeyFdMztM4udrgY4k27BPjfDe6YJYcyU+vZutbkAUs+sgAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFC+o19vnPmICcPBAaWJMd5FI+HCTkR4zp2/S/q7qm8=;
 b=FB0uReHh+UBFfhjnVm/YiqCpigLSP1x5Z+DOYL7bIwKNsJGQqTOhmUudxUIQQlOesEjo6iyHIol31q/LxoCcuhh3xIoaV8pvAF3PXzHJZTZmtgaqEQTyTLytv2a5rc/mK7vYGZZhcNodrBfMnWPGB7Z+6dEbx11wUpr/QV8tSECZZPK6muNmlWArqzLs5UjiEF7Vx3CCabUXFfpzMZHOBLZQoWbsTA3uqDDoR0e19AeVo8BDNtBOgSB69ak1ZFlqSLS8r7CVZTLE98xSD2fANhanFm9+dI7xvQJ6RzE+xEvj5XpGmfjFGP0XOOcycSvodN03fFsqEwfqR5Xkadk0bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFC+o19vnPmICcPBAaWJMd5FI+HCTkR4zp2/S/q7qm8=;
 b=NtfbO6kxvn+/3VPal0V3NMjfj4NWxLDwhS7nisYUMr5AmKCfLdGOlNeEOVcpI8FX6tonxGoSN5opumbZMUVfMkYbKsVke5VheAHMQUjiOGgNHrZic6LmR7ZUUoIpUX/MOYY5ISupdcn8hI9uCCFvM8lIxOaLuY6onAXWQIAOJhc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5947.prod.exchangelabs.com (2603:10b6:5:1dd::12) by
 SJ0PR01MB8182.prod.exchangelabs.com (2603:10b6:a03:4e6::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.50; Tue, 16 Apr 2024 04:53:11 +0000
Received: from DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::b557:13cd:8a29:ae08]) by DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::b557:13cd:8a29:ae08%4]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 04:53:11 +0000
Message-ID: <065243cc-09cf-4087-8842-bd4394fb324f@amperemail.onmicrosoft.com>
Date: Tue, 16 Apr 2024 11:52:58 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] dt-bindings: hwmon: max31790: Add
 maxim,pwmout-pin-as-tach-input property
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
References: <20240414042246.8681-1-chanh@os.amperecomputing.com>
 <20240414042246.8681-4-chanh@os.amperecomputing.com>
 <13b195e6-cbbd-4f74-a6fa-d874cb4aaa45@linaro.org>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <13b195e6-cbbd-4f74-a6fa-d874cb4aaa45@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY8PR19CA0001.namprd19.prod.outlook.com
 (2603:10b6:930:44::22) To DM6PR01MB5947.prod.exchangelabs.com
 (2603:10b6:5:1dd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB5947:EE_|SJ0PR01MB8182:EE_
X-MS-Office365-Filtering-Correlation-Id: 46423229-9995-4785-a908-08dc5dd11e1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	CQTkD0vxQMh7yuIue4gRsI5fyZs7GCF07iRP2TyyUIVQbywGc4RfMzYwH2o9N9tHEW7N0RF/9o/sx6Zr8K+PoXkgdM3/usdmzqtZDSEUf55OkGgwqmYWZ9/LY35OTKj5Jel9pnccKqCAIaLETiMoGi3ECsEzh9X2RDORbJVXoU0AWIOXi9jswn2lu7ZVpJhWv72ezDk+23WaSnUnu4C6KaLwcEsk/crH26Okp1FuT+DUQVZORO8gGdCbBm6fviAU96swKldYWktG0tXv37KKARH/ApW//rqwW40qPA8TykGn8hwavFRtY8+Sg8fVFiK9Hp/ZuceTlXiq5Omq2XXGmRZE8/EZmDXNEmKXYpw3MRLx5dz3mCX1lwPnKCDTbKZr5hokPlmBCCH7gnTMNcFttzCJpeisBeKsm4ZP5lbTwKDDg79fyGw+Cggnca7iy5roMKRuLcCHo7PK4A2CHNDAhWuX6x+qzqQ12FzkqsThKOWdE1jq+VSrp1qI5T2kmJ3+L6Lhur2TKqWwMCwDbLqfbZYLvpegpjUCmuOLgdqYgMNar4F4x+6z0+rXH77vs7EKLF4z85NDCbqFHqnTVoRvZewxVKEJ/IU6UTPXZN93EmGzckmrVHFPm/si4J6OQsdUqcDsBYsFSuWgFBHLaIzeqWysTHh3OWUL91T7ie9oxG8HcCSksTr37KWOtG0iC+B73QyIoCqOmR/Ilrj6jkOk7w==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB5947.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(366007)(376005)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Si9DWGhEVno5OXZ1NE9VelRxUGhGenBuWDF3ckl4cnU5MDFwKzNVbmEwNEx4?=
 =?utf-8?B?NnYvVHB5U0EyRnhlNEREaXRXVDRTNXBNTWFKWU9LOTFBV3FBdUNzL0ZqSDVh?=
 =?utf-8?B?N2pxK2doRUtWYnhwZ3BlSkNRVm5RNHVpWWpmRmxPc25YSDliUmZiRThKaExM?=
 =?utf-8?B?SFZrcXFkR01TaXFkU1FjaVJtQWwrY0trcGFrTDRONWxTeEhTQyszdFdsLzVh?=
 =?utf-8?B?WktNY0VGZnZTdkxNQUdURUE5MCtERWE2cU43N3RZcC8vYndzTCtOYU1IRzdG?=
 =?utf-8?B?TGJFU0pJNjBmSy96YW1BZHM1bEdEcnBCeTR1K2hyZ2dqVzFBRnpSOXNYY1B6?=
 =?utf-8?B?ZDFSZDU4ZlVibCt3NDdFM0VBVWJjNS9WVDh3amh2RTFIN1NNeWpudU4rZDV4?=
 =?utf-8?B?WDdTdzRwNWNBdlgrblJBTnZJSk9MeUdrcC9YcE1Ba3NtSXA0SmNjRzlYOHJl?=
 =?utf-8?B?QlZhVDBDZHVmdXhGb3RLRG5ISlFzYkgwZlluR1RjeFdjTDNOMFlaaDRUdzNm?=
 =?utf-8?B?TEhxMnM5UzVld1hGYVdkR1gzbzBTUjRoS1JvOTlReC80ZUVxdDlLRmxFdjY4?=
 =?utf-8?B?elN3VXlqNGFWYVY1TG9IdlUvOE43WDZnTFhEUnJYUjdLRHBWMGhrMW5Nck5r?=
 =?utf-8?B?Z2FBZ0xwZ1BoUU1nbS9iN2hCbGR4VkVGRFFKYUpwdFdNWnM4T1NLOEhzOXNF?=
 =?utf-8?B?NlBHb2JJb1dqWk1keG5MVVM4RVdSbmYvNk9qZURyQzB4MFFwUDZzL0FhTU1i?=
 =?utf-8?B?QzQvNEdQMGFtcVQ4QUpMbTNFLzl5eU5mZXRxeFM5Q3N0S0hRWDBlamFuSjc5?=
 =?utf-8?B?Q3U5S21OQTZmeVg4bmc2WXVPZmdxbjhCY1RiaU1nUVNpSGVjUEdHc3FNMjBl?=
 =?utf-8?B?b3R0ME1tWVBaZHpZQmp0QnNUN3MyQ3oxUC95NWNpWkxGcncvZHBqa0p5L3hE?=
 =?utf-8?B?aXF0RUN1dWJCdVZOaGgwTlZWeDZxRUZtdHhUaThHSnpVUkdEWVdVZmF6ekVu?=
 =?utf-8?B?ZjhNTWxjWkZGVTdSYm5mb1REUWlVdkkwTGl2UXhKdnNoSzhxNVA0Q1VRVWtM?=
 =?utf-8?B?V2lkb2VxUXlsZjRwOWp1NHRvWWc2SUcxRzhRQ3JXb3VBUlFIaFBOc0FaU1ZZ?=
 =?utf-8?B?Slk1bFIyZ2Y5cG5SWnArdEpKME5TV1VMNngxVFEzSmtQOFdoYkljeTVRcHFU?=
 =?utf-8?B?RE4yc3Q2WDlxUlVFUElCaCtkUDlRZzBxdFAyVGwwMFAvckFwd3FlY0ZNNHFz?=
 =?utf-8?B?QUNMQU51SEJvTjZXSnllMEErM2dibWsySGp4RXJ5VnBiNnBpZm12VVJKeEVQ?=
 =?utf-8?B?b0hXQUQ1emNaV2RJUVVrTE9WNkZ0dmNRS1hwWUl0amY3R3hlZk5NbC9VV0R0?=
 =?utf-8?B?Qi9rNFFUd0c1VVhqMVgxNkJaL2ZVWkovZ1JPdmZZR1BvTFkrUkR2MDB6UUIy?=
 =?utf-8?B?bjNuMzBJcW5nbkRVWUU3MERhcTdwdDZqY0gvaXdzK25EYkhJcXFNSnlrdkdV?=
 =?utf-8?B?T3p2VUUwblVvY3dDNk9kSWt4cHBZc1FNVjRzZU91U21ZSzJkZTFodTU1RDR5?=
 =?utf-8?B?TndpRmxza1NVUkZjZFE0d3pJUTVVOHplSGY5akdYK1N1dklNRmppTm5QTU9r?=
 =?utf-8?B?L3pMY2VJT09RNlp3dHJGKzFFb2JpYTNEMlRqQWZvUGttWkpUa0FTdWNqOFgw?=
 =?utf-8?B?V2VuVllhUXpxVS9EbEVYWVZKem8xRi8zY3FFdW5vdndBQitkSlUyVSsyYWtm?=
 =?utf-8?B?ZGljMHhIZlpiN3Avd2g4a0FkejJPa0Y2TVd4K1FWaUNjeWRkOFc1b3NDQm9P?=
 =?utf-8?B?N2d1QVpKQmpvd1hJRlk4YTVIMThJM3IrbnBBanJjSUlqeks3TmxpQUNqQ2JS?=
 =?utf-8?B?Y2lYRktPbTFVMFhhbHhNdHBlSTJwVkU3YkFnckp5RHNUVkFweWJpdjBsTmNI?=
 =?utf-8?B?bSs5UGxSQi8xa3QyT2xjU2UycHVMTVNRUHZCa2U1TmhYN0tiWFJQSUxrRGZL?=
 =?utf-8?B?VXRyZ2gwRHJBTnN0NU5yWkYva2JzQ1NQNG1FeFJMK0Vid2VDelJnSytyWGVD?=
 =?utf-8?B?aFQzQTdyViswSlg1L1kxZVorQXdMbzJhVWFsVkZJS1NpcUZFWVdydkVsbGZP?=
 =?utf-8?B?TzZTd093THJJR3pDZHE5c1JWQmpNZzlrNFhTUTVCdFhpd3NEaE9lQkpvNlJ1?=
 =?utf-8?Q?l9RtCINBemgcO9wD4+NcHlc=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46423229-9995-4785-a908-08dc5dd11e1d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5947.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 04:53:11.5978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VWtZadn1zTS95l6PMaZqudrSYQ6IHY684CzmbqQ0+3KaRedBwNPZSXopkom3L9vwJHZhSjTDlvtwKFK0c7E+SO7rP6hSTFVntR9ik0EHzPoO8uUeAU+zjhcvsexdHqZm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB8182
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



On 14/04/2024 13:07, Krzysztof Kozlowski wrote:
> On 14/04/2024 06:22, Chanh Nguyen wrote:
>> The max31790 supports six pins, which are dedicated PWM outputs. Any of the
>> six PWM outputs can also be configured to serve as tachometer inputs,
>> allowing for up to 12 tachometer fans to be monitored.
>>
>> Add a new vendor-specific property, 'maxim,pwmout-pin-as-tach-input',
>> to allow PWMOUT to become a TACH input.
>>
>> An array of six integers responds to six PWM channels for configuring
>> the PWM to TACH mode. When set to 0, the associated PWMOUT produces
>> a PWM waveform for control of fan speed. When set to 1, PWMOUT becomes
>> a TACH input.
>>
>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>> ---
>> Changes in v2:
>>   - Update the vendor property name to "maxim,pwmout-pin-as-tach-input"   [Rob]
>>   - Update commit message                                                 [Krzysztof]
> 
> Please put binding before its user.
> 

Hi Krzysztof, I'll drop this [Path 3/3] in the patch series v3.

My patch series will only be two patches. They are "dt-bindings: hwmon: 
Add maxim max31790" and "hwmon: (max31790): Support config PWM output 
becomes TACH"

>> ---
>>   .../devicetree/bindings/hwmon/maxim,max31790.yaml     | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
>> index a561e5a3e9e4..2d4f50bc7c41 100644
>> --- a/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
>> +++ b/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
>> @@ -30,6 +30,16 @@ properties:
>>     resets:
>>       maxItems: 1
>>   
>> +  maxim,pwmout-pin-as-tach-input:
>> +    description: |
>> +      An array of six integers responds to six PWM channels for
>> +      configuring the pwm to tach mode.
>> +      When set to 0, the associated PWMOUT produces a PWM waveform for
>> +      control of fan speed. When set to 1, PWMOUT becomes a TACH input
>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>> +    maxItems: 6
>> +    minItems: 6
> 
> tach-ch solves your case. You define which inputs should be used for tach.
> 

Agree Krzysztof. I'll use the tach-ch property from the fan-common.yaml 
to solve my case. So I will not need to define a new vendor property as 
"maxim,pwmout-pin-as-tach-input". I'll drop this [Path 3/3] in the patch 
series v3.


> Best regards,
> Krzysztof
> 
