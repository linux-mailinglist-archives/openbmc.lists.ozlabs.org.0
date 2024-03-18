Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D4987E680
	for <lists+openbmc@lfdr.de>; Mon, 18 Mar 2024 10:55:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=gPqycIN4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tyqww1PT4z3dTs
	for <lists+openbmc@lfdr.de>; Mon, 18 Mar 2024 20:55:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=gPqycIN4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:2417::701; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TyqwP4SpQz3bpt
	for <openbmc@lists.ozlabs.org>; Mon, 18 Mar 2024 20:55:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5L6KrmfyOTaXp4ZLuXSKOIoDonFP36hUaq/szkZ5O/FkB9sVrO+SKEBv5nSIsE0uVcETzoXNKBthzEXpBw5KFefVWQCb1nPUchmSOvb+PZKNjPQnYVt6ybBWbWdLSlVP8vppnY/s/Ygux3fxmimFJNiwBLflChIv789ORDilM7NhymioI2Ry5i+ikPhvMNtEyCP4r5xc4JHDIG9Y7e2txUgIrUKN+Aqt6gTLt2y/LFZSImZNNPPVW5jjOBuqaEh/8qsOIplPSJ7dV9sTlrDzE9R0qZ/mFhZ6URTwx4RBtJLQqG4Y1VzSwPhYLsMX20vsgRXibeXS/V5sjjd0vH4FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCEls9z8YPNhiNU3HQ9bxt8ajLbLpt0iaEtdf4LWGdM=;
 b=igOIHvGV2wmK6ZqsA+5H3UDNFj4vsVFQ9m75rGMUmVY3R/X5N3tPBSU2E+eZS/8l7KGkhtVu9pv5vPLdG2DsnuQaJ0ZKYnZu+24DVFBbAD/hut9u4rxF7YqkvH3ynnz3RSHmXpIPjAs287WMpVFfrZgo0rjYr7c2kWbfCafTIeZsDxTuU/WyZ2vX1162IqIqU/drt6XhJQCIs6lUZ6uJ9wUsfl6c6M6SU364T7QPAiZOVzAgraVj44qc8zXM00vHw/lxYLEjCJck65ZeJsLoFuLdBdMGSf7jtqCG85gNxptJk/U1e0VjhDbN9nRrf+UgCFE3/uc++g0BDLXAGd9sxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCEls9z8YPNhiNU3HQ9bxt8ajLbLpt0iaEtdf4LWGdM=;
 b=gPqycIN4Kk3YyYj/zsqG4hDGvW/kdLfIHeFo38RVIusH/zD6DYSaXj7su8suZihM7kk7hbm031PjoUFD/ycgmr6C4l4JqiFJuFxCSTjw/m0HZi2Xgk7IxT8i+AdO4J1e9We3QHU1bRwiL0aXKaGslxKYWBTKCw3ahzyZYeQF7HQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5947.prod.exchangelabs.com (2603:10b6:5:1dd::12) by
 SA0PR01MB6473.prod.exchangelabs.com (2603:10b6:806:ec::8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.23; Mon, 18 Mar 2024 09:54:58 +0000
Received: from DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::b557:13cd:8a29:ae08]) by DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::b557:13cd:8a29:ae08%4]) with mapi id 15.20.7386.025; Mon, 18 Mar 2024
 09:54:58 +0000
Message-ID: <e4a48c97-dd95-4ef5-8895-84f6f0e76355@amperemail.onmicrosoft.com>
Date: Mon, 18 Mar 2024 16:54:52 +0700
User-Agent: Mozilla Thunderbird
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
Subject: Re: [PATCH 3/3] dt-bindings: hwmon: max31790: Add
 pwmout-pin-as-tach-input property
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Chanh Nguyen <chanh@os.amperecomputing.com>
References: <20240311111347.23067-1-chanh@os.amperecomputing.com>
 <20240311111347.23067-4-chanh@os.amperecomputing.com>
 <20240311173438.GA1451467-robh@kernel.org>
 <43f62612-bd16-4d66-b1ee-26932f6ab2f7@roeck-us.net>
Content-Language: en-US
In-Reply-To: <43f62612-bd16-4d66-b1ee-26932f6ab2f7@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::13) To DM6PR01MB5947.prod.exchangelabs.com
 (2603:10b6:5:1dd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB5947:EE_|SA0PR01MB6473:EE_
X-MS-Office365-Filtering-Correlation-Id: cb936daa-fe48-4e88-1a01-08dc47317897
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	eokvQDN/dEGKvTNqJsfiW5kV0QiHb1HxzsdaTiwVjwi1+CKUo8A+JrswIGvquZ/+gj1QwlP7U0piviWalUbpI3hLASkgfrfxZjXJFKtpstHYTKc912T+kg8nvGkkMZRWqURcVydHyiSn9grcPzAHVUE7b9yfqOGHIRiG0oU5ZfexPW+9NMzISx4gaHqT4k2uwDMUy6dUUsmUzVYeraokojdwiMCCGfcMdrhlJXCMj0zCONJKgQE9uAW1ewbtjLAd3Ic7B2FOPj9K9MZNTRMakhlN/6v2XfauSrMVDrirmXyCZ1B8568iStWO2h6WztZYK1HsmGkaNVRXx+KOQsMoZwVYjHOhb8EIPvS45EHMyjkPXEOr6OJnNNYD6VvDPK3GarLphDixI4joQ/p5QOtjHNCGjoEOz55xOs6S9Zjve6+O+2gprKKgefN5LkNM2nbh75rP6wg3fKeHlbgWA5pZhiWqEjCeWVun/KzPxwEcukTiJpTYpXFhvFkMI8Vfuxq6T4f4eKUzlkCX8YzzttWAW4vggZxD3t5Cl1NUVmSFvStzubQ6Q2P90pqvRp11k4fx8XkXpYSIK1GZ5DrRG5lDHuN2UmkTJmsfqBspSzr44BXNl0k89yqzikz/aWTbZIzabMjKzeZLCJKMYmevLx/4GhV4rYKVd9KHYyLhrkphIYo=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB5947.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?ZmxSa0RYZkpVVkRDczUvaFByd3BwaU96blduaS9iMUJMRC91MEVhTUZNWERJ?=
 =?utf-8?B?cnFDaStkeXpsQTJER25VbTdGNDEvMVllVUhGOSs4dStQNnJFM0wxZTI1T3ZJ?=
 =?utf-8?B?djYvU285NmU0Y1RjWFVNZFVvQ3NkMlNxdlF4T3hHZWhDRmZuRjdDYWFmeHFm?=
 =?utf-8?B?eXFGbExPdno0ZDVGcmJBK3p2K0Z6b0JDZXdiNVZZVDJHaXVaZDVBUlZmTnY0?=
 =?utf-8?B?QnZNSm1tU1FMTzN3RC9iYklnSmlYSUN4ZTBqOW9ERGlDSWRwQ0tkbVlob1Ja?=
 =?utf-8?B?R1dtaEpIbVI4Vy8vU3BUUE45TldKOHlPV0djYzZpRXJrMVh3YkkvVDZtd1Uz?=
 =?utf-8?B?ZU51S2VyeittZ0tZcE14K1FhcGMzR1ZFM2lRTXVlSUcvU0srTFQxMGhvQlpY?=
 =?utf-8?B?MER4cSs5cWhBUGE2RWgwRzhvQjhOblo5N3hrYlJGYk1JcFdZTnJUN29iVGh6?=
 =?utf-8?B?d2NoeUdsSUtuczRKZXVVZ3lLUEljNnd5R3NINlBaaEFkNXlxeVkvaDRYWDQ1?=
 =?utf-8?B?WEllSWpaYUI0NGFKQVBLQTZkdk1WV0JhYXRjN21OWHR4eklZc0dlRE8va2lG?=
 =?utf-8?B?YVRWdnR2c2t0aTdodmE3SlZUZy82dHN0T2FGL1hFNnh4WGxNOUtQZy9OVUxo?=
 =?utf-8?B?bnpPOHR3VkZRMzBmcTJPcktydDRqOXcvM0RiTEFyY0prQ0FwWVJ5eVZmSDho?=
 =?utf-8?B?aDF1L0Ftc0cxaHJFa3QvUnp4aGgrTGF6cStCeldYU2RWQkg2enVnaEhXY3h4?=
 =?utf-8?B?Um42blRZbFp3SkVBUXdOSW9ER2dZNzBVYnZGeis5QUh2Tk1xUEo5YTc5UnQv?=
 =?utf-8?B?TjRSY2RlNjZVZnJBelF5T0JHa3FVaHpnR0dNVFo0WmpyR041Wm5DZzZLdUlx?=
 =?utf-8?B?REl4MHlidTZxY3hWOTlZSVZkRVJNNTZzU2VXamFwWVB0Q0hRNEUvNEZHQ1FF?=
 =?utf-8?B?QkhJSmxxVDM0bG4vNm9rWEFSUTc1cXhobFdBdGl1YXd0NVN3N0pFU1h1aTFh?=
 =?utf-8?B?Nk9ZM1pNUjM0REYvN2R4aHJhT25Wd29tZ05uN3BLTmVXbTFHRUpHM2NLc1ZO?=
 =?utf-8?B?V01uSy9Fb0M2b3ROaXBTTHF0SFdtUWV3ZmtBS1pLYkdpckpzTDczT3J0alpZ?=
 =?utf-8?B?ZE9xYngxZ0FKRWtzbXYwNVhpckJ1R0RSakZLeG5vVzBaaWRmL2xMaFo3cXIy?=
 =?utf-8?B?ZWtvMmhHbTJzNC9qczQ4Y0Nsb25NenQ1YnVYMXV0Q3dmMTBLOWNmVUFMTTFF?=
 =?utf-8?B?U1pUZ2FZOUFyWWl3SmxuUnNZREN1b2NQdmVKbGJyQ2cxZ2tMUUw2b2JhVXgr?=
 =?utf-8?B?cUxKRXk4K2xnbG5xRXlpVS9ZN2txR2RBL1hUL1hRMmdxVFdKaDBBVkhmb1JP?=
 =?utf-8?B?VEZVamFNSCt6dEIwUnB1NVNPQ1dKamMrQmZKaEtyaWhwY3JYL1lmcVdVdWZy?=
 =?utf-8?B?bXJPeXg5ZUVBZzJzWFZXV2E1d3llVFJQTC9QNmNMMjB6K0xGL1VXY2pZYUdT?=
 =?utf-8?B?amtiQ0dmUkhMMXM2anczakJDb0czbW1iTGVDMEErNGtOWkpORGt2WXlqYzAy?=
 =?utf-8?B?Rm1GMWNKNW01TksyNVVQMkNHck8zYUFkN0Z5ZDNzSCtHamlTWFBxOEozRkkw?=
 =?utf-8?B?ZURtUktSVVU3b2JEUVZuMnpBZHN4T3FuclVpWlBKUElRUTdXbGdWbTRnL3Zz?=
 =?utf-8?B?RGNoaU4vSEk4V3VQNms0Tk4xOGM3c2gwWjFFRTlzeDZEcXpmZ3pWV0ZJTU00?=
 =?utf-8?B?eDQvVEZ3SlU4M1pqbkRZNC8zanJqM3AyS3VmM2t4Z2JiTXBGVVJrT3JVWGlj?=
 =?utf-8?B?VHdDaGdsN3dDWnF6MkI1NGV3ZHpETEU3SHhIcCt6UjZteHBHRy9OblpQZ2E1?=
 =?utf-8?B?ejNBeTMxNmxYRFBrTjVNbm9VYThEeGdrUGJnQ29UeTRDOG91RUh2SSs1Z0V5?=
 =?utf-8?B?VEFtTzNrR0RvTkhxODJZRURWYWxHOVZIZTcwMmVCdkQ5cWVCanBaUjVKS2da?=
 =?utf-8?B?OW5MK204Z3pYVTY0enE2SHRRb09YTzFBVHd1bnVCRGFQSndHczJNSVlUdkdj?=
 =?utf-8?B?eU9DZkdRVlNFN2wrNnU3WUpRT1VaMmtGTXRBcjFIZ2xiRXNzbmhYRXhVYW12?=
 =?utf-8?B?WDlTQ0NmY20xVUVzZVIrL1hCUHhhQ2N1ZFR2bnlkNXJPZUhmUlBUazB0QkZJ?=
 =?utf-8?Q?XtlK5gTKlQMKlf6dOzlqMgo=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb936daa-fe48-4e88-1a01-08dc47317897
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5947.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 09:54:58.3222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+JV/do8pXV3DfgCKSKXnVuqy+3MMSPJPSHrYTvWgkt9XjHmHBQU6Yd6FR+YcoWCOjGuc3Zx6cPnz4bod2r00WMXrgwLfzYaFgeWY6G3waLE6VwcjMEue7r3xyWZwE/+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6473
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Justin Ledford <justinledford@google.com>, Quan Nguyen <quan@os.amperecomputing.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Open Source Submission <patches@amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 12/03/2024 00:52, Guenter Roeck wrote:
> On 3/11/24 10:34, Rob Herring wrote:
>> On Mon, Mar 11, 2024 at 06:13:47PM +0700, Chanh Nguyen wrote:
>>> Add pwmout-pin-as-tach-input property.
>>>
>>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>>> ---
>>>   Documentation/devicetree/bindings/hwmon/max31790.yaml | 11 +++++++++++
>>>   1 file changed, 11 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/hwmon/max31790.yaml 
>>> b/Documentation/devicetree/bindings/hwmon/max31790.yaml
>>> index 5a93e6bdebda..447cac17053a 100644
>>> --- a/Documentation/devicetree/bindings/hwmon/max31790.yaml
>>> +++ b/Documentation/devicetree/bindings/hwmon/max31790.yaml
>>> @@ -25,6 +25,16 @@ properties:
>>>     reg:
>>>       maxItems: 1
>>> +  pwmout-pin-as-tach-input:
>>> +    description: |
>>> +      An array of six integers responds to six PWM channels for
>>> +      configuring the pwm to tach mode.
>>> +      When set to 0, the associated PWMOUT produces a PWM waveform for
>>> +      control of fan speed. When set to 1, PWMOUT becomes a TACH input
>>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>>> +    maxItems: 6
>>> +    minItems: 6
>>
>> Seems incomplete. For example, fan tachs have different number of
>> pulses per revolution, don't you need to know that too?
>>
> 
> Per Documentation/ABI/testing/sysfs-class-hwmon:
> 
> What:           /sys/class/hwmon/hwmonX/fanY_pulses
> Description:
>                  Number of tachometer pulses per fan revolution.
> 
>                  Integer value, typically between 1 and 4.
> 
>                  RW
> 
>                  This value is a characteristic of the fan connected to the
>                  device's input, so it has to be set in accordance with 
> the fan
>                  model.
> 
>                  Should only be created if the chip has a register to 
> configure
>                  the number of pulses. In the absence of such a register 
> (and
>                  thus attribute) the value assumed by all devices is 2 
> pulses
>                  per fan revolution.
> 
> We only expect the property (and attribute) to exist if the controller
> supports it.
> 
> Guenter
> 

Hi Guenter and Rob,
Most general-purpose brushless DC fans produce two tachometer pulses per 
revolution. My fan devices also produce two tachometer pulses per 
revolution.

In max31790.c, I saw the formula that is used to calculate TACH Count 
Registers, which defines the pulses per revolution as 2

	#define RPM_TO_REG(rpm, sr)             ((60 * (sr) * 8192) / ((rpm) * 2))

Do you think we should support the pulses-per-revolution property in 
this case?
