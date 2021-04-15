Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF0A36097D
	for <lists+openbmc@lfdr.de>; Thu, 15 Apr 2021 14:34:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLf0X5NWyz3bqT
	for <lists+openbmc@lfdr.de>; Thu, 15 Apr 2021 22:34:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=hJ7RnpQB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.100.93;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=hJ7RnpQB; 
 dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2093.outbound.protection.outlook.com [40.107.100.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLf0B0Xrvz309k;
 Thu, 15 Apr 2021 22:33:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7SP8flmIj2nZhPEb5Bkse7vLTOFMMImrqaW1jPbRFbewIZpaEjrMP3+iyYADS8Y1sqBpoDmcrhbQSauLONXKZ/EMUt6BBn17XB5A9OtBNh+BDHVRaTq4SY1mxJPc55d5qMfkp5umnzyOOMlKi3JVgSYED6qMFLEE5iT1QgE1OChid/m3G4B3IeniLT3vBRFsykbQKyCB0Y3BDMQHdnQLLkkaWiUgQbVPg8UwpkXn1OMcKFBdMphvF33fZkFH4wN4XDeZNSvxQ4/2Grh0s11DFp/zMdUgKHy7v0i7QhLWwDCYA61N68cxR4QOCHk9rL3K6ZgYDiNG6T6pLy9wr+uiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DW4Kka2qupOM46QdWkRL/vvANFhn0m466i6Irwcq+PE=;
 b=gPhd/Dt4dxUcjIqfbw3GjV1nnWDz/LjegGt/3/tymnERcTnd47dncnB+UWoc8Clis+HhMiRoc62TU9N5Ds8WRHVgsSA8WsyjgRzM1I338L51DX4sPENlivvu6jHa8pVX9oLW5EWP1mEqly+RngMFCeeDIxjxhH9PLUv7Xukd/RSm4kD1qbjpLVPbc9Eq1l2l8nP2oKC6lugdDnXonP6kKXfUaVpu7fDg/LaAyYiDQT3IXRnHi3K4JWjI9/oeM+YQYulTc393Qfn1Q/PyiTGHO83F7/qbnCyuN3ZhGKTJFK7PPD/q5C7EEeIgl9dSgd1lzbF7WxG3FQVhJRMtnN+Fxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DW4Kka2qupOM46QdWkRL/vvANFhn0m466i6Irwcq+PE=;
 b=hJ7RnpQB+DZeuQvu32a4krLMpyc8HDEFcyL4iPYnUHZfp2iRCmX0kNFwPVduaOUAswXU6RiEax//Hd+RPHnEEK4LMKu4pRCOoWia6oEJnQ4NGuksMn7/paEoIiVfSufEBL0dAVgkQj9viDgUoTR5ALCoi7ihF4wW+3MQ7V+/4RM=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none; os.amperecomputing.com;
 dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR0101MB2944.prod.exchangelabs.com (2603:10b6:301:33::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.21; Thu, 15 Apr 2021 12:33:36 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4042.018; Thu, 15 Apr 2021
 12:33:35 +0000
Subject: Re: [PATCH v3 1/4] dt-bindings: mfd: Add bindings for Ampere Altra
 SMPro drivers
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Rob Herring <robh@kernel.org>
References: <20210409031332.21919-1-quan@os.amperecomputing.com>
 <20210409031332.21919-2-quan@os.amperecomputing.com>
 <20210413134906.GA1538655@robh.at.kernel.org>
 <8eb27308-03e3-1a90-28a3-d8b3ad720cc4@os.amperecomputing.com>
Message-ID: <3f227d50-1f4a-d5d4-eba1-dab1322c45d9@os.amperecomputing.com>
Date: Thu, 15 Apr 2021 19:33:12 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
In-Reply-To: <8eb27308-03e3-1a90-28a3-d8b3ad720cc4@os.amperecomputing.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: SG2PR04CA0179.apcprd04.prod.outlook.com
 (2603:1096:4:14::17) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.32.245] (118.69.219.201) by
 SG2PR04CA0179.apcprd04.prod.outlook.com (2603:1096:4:14::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Thu, 15 Apr 2021 12:33:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 452505ce-79c6-42f4-d258-08d9000aafcf
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2944:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR0101MB294429BA0D2CEFA6A019AB36F24D9@MWHPR0101MB2944.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SiJjrV6CXB5nO9BG+4hyMZmCpocPnIkE3FiR6SllHbicIjeRNfvDY7XCHjGAzgnOUg9lRsqMI2g4bWaNvEt5MzUqgNLGRsetsGtPkyCzMEYpoqiD4YNVO0TlXggmoV3z2cFHux0CLY6GiM89I3DPI7hPD+z2zed2MgDExDeF9NFCZ96sogPBL0H6Y+hKe8PkM27XAuNWwp9crYdQQvs5997seBPHKtVPBydGwGwRBolGWHRLPQNyw1lJc6cGiPHcEXthFAyqmCKGi3dYU1g+GwEHewf9hxA4WI+pr1vjtxS3SPflYDWa/GFx+9tTiAsfKvDv3nFA9FpGxoJbnuSWYcP8bz+n61na8XJwUpkSHY9XA9+1jt7MFW1URZ9prCUVlmKrAqJ2sUDQPfCSvZIlAEGyDpJY2aDgDv85kYpSPQgg8BhY2yHLXxUo7sQPaIQ1+f1pRbTjnXOrUkk5oMBezeX4mryuO1w8AntI1mA84hnQ4o+uGRgtb5mqugBCmb0f2GskNTZfRFxtL6Ze9XsZsgtEwuKHAuo2lwsxTiIA3jKUFM3iAyGcKXHrbSLfh+x+n8aTRp9EPTmWVRNGFzWN6Cu3AFztcp9tGS70Kc5jVFnFNyei73ik4bHqgObCnF2FIDF2LXO63DROazu4dWiDmEHCHvDJCJjvfchPWvckY5sAzPrTE5pMJYTjzyz/f5sp2zzSeYX/pXIarji2ROkwh0OS5kmuMJ59yeSP5AfjC0UQq3ZdltPtGVEP+hP5t9UcX9uLszjqkheuJFkktyWgQYI2s3FpUOYfGqHPMCTfh14=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39850400004)(376002)(396003)(346002)(366004)(6916009)(53546011)(478600001)(966005)(107886003)(83380400001)(4326008)(316002)(54906003)(186003)(26005)(2906002)(16526019)(16576012)(31696002)(86362001)(6666004)(956004)(2616005)(66946007)(5660300002)(7416002)(8936002)(52116002)(38350700002)(66476007)(66556008)(38100700002)(8676002)(31686004)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OGw2eGhlcmFoLzhsVy9vVVJoVi8wYXZoQVhhRlFxVFlSRTdNMk1zQTdNalI4?=
 =?utf-8?B?QWJjL2ZLUWszMGxxUFU1Tml5OEFRSGNSUktuNXpkbGt2ciswT1pFMDFiQ3Ez?=
 =?utf-8?B?bGdvRVpwZ1l6Uk9ydmc4RFFIZnNpbUJSL1pGSHNRbmNxQUJYc2xDSy9WTm5E?=
 =?utf-8?B?aEpOdkpYRDFTR0NtcURJUm84STlsRUVFZnNsMnYrTmo0eTQwY0tzbW5QaGZn?=
 =?utf-8?B?Y2JVSU1tL0NZb3RyTUs2dktOU0pUYm1xVk5CeExmUEYyOWk0Z1RZd21Hdk0w?=
 =?utf-8?B?amZ3YzhWdjc5S0Nncm9kQXlMQ0lsR3cyVEpQWUFqQmV2dWI3eEhkU0xodXUr?=
 =?utf-8?B?YlZxNVNhWU9FQ0hxUmNRWmdYWTkyYXRLMTh2OVE1ODdaRzFuTTBtR1BBTkND?=
 =?utf-8?B?U0hxZ1NySUhRaGM5MlhibzJyRHNLVHVSTTF3NkRiYlorbmRKaXI3RzRsa0Q0?=
 =?utf-8?B?UjJudWpIRDBiNHBDT1hEUUZUTVl0cHZCcE9mb1IrczlsRWhRb2t2N1dQSVRY?=
 =?utf-8?B?YWZlZlZGRGRxZWM3aVdpSzI5Tmc0RXJhR1lkRjRWSE5lODNaMXhzTGZhS3hj?=
 =?utf-8?B?WmNGZk9GYm5XcFlkeEJhaVF3aXJpTWwxcW0vTkxIQTltNDVnVnUxeFYycjlW?=
 =?utf-8?B?bGpkc3JvNWR2WWVRbTJWSWZ4Y1hvOUN4cWFNd2xhbFZEd0VydEZPbjd5Q291?=
 =?utf-8?B?R0lvQTZnQ0dXbHNIMTl6Z2ZOL21GSGlNOTVmTExDdzNGaGoxdFJidkhzNTRB?=
 =?utf-8?B?OTZ3V1BqWDVacXlXeGZnaU9TTUdDOXpvL1VlS2ZldW85a1JrOWw4RHR0T2Ex?=
 =?utf-8?B?MnI4aUhlV2RkSG5wbjJWMm9UMDRoMHQ4ek5zQXNiT1ZlTUdwbXpjVlhQTHFl?=
 =?utf-8?B?OTkrSThoRnUrTkoxc2JuSHlzTEUyd082aGRGTlFYemdENW15VFJnSWpWYXFX?=
 =?utf-8?B?NUdqUDJNMFNKc1kra0NDRzhGMWQwWnFLTXVPZ0I4ZXMrMmEyZTFHQk9mV3pz?=
 =?utf-8?B?OFRIbU1MbWlNdzI2ZXg4S1NWSEhLT3NQbHhJS0RzNk92R0s3MHllaGYwL0RS?=
 =?utf-8?B?V1RhcG8yTTV3bXNWWmNYNHhid29TRy9rdjREeFFEdUZKQVdsVnJ5Mi9vZThx?=
 =?utf-8?B?alFoS2tJaGlOVXo1M3U4bWdmcTVCdkY0L2FlYVAvRHN6N0dSeVk5Y0l2Tlpu?=
 =?utf-8?B?R3BKV1hyc2lvQ3c5NmJBcVdtVDEvR0VwVm1pTkFFR0UxSXAvaDJDeEc4ZS82?=
 =?utf-8?B?ZXA2MWhGQ1J6bkY4NXIrN2ZFbytTbGVlRTJCbW05cTNoSzhWem1GZzdIRG9x?=
 =?utf-8?B?YlBERlN2ZElBM1NVZ0RocnljU3p3UUtaMXZuc3VWRk5LYlJCMms5bXFLTE5P?=
 =?utf-8?B?NStUOVU5MDc4OVRyNjdOakM3Q0lTYVFJUDF4SG13cVY1dmRTaFM0WFlBenFG?=
 =?utf-8?B?WjBhNDFYVG5WSHJjbGxzV3pKWnZJQmhQdlEzYy9QVzEydXFOVE1XK2lqeCs4?=
 =?utf-8?B?MXk3dnQvaCtqSHNsUFJaYy90YmdoZDMxQWdSOWFJanhFU2JERGlXQ0FsSnA5?=
 =?utf-8?B?dS82aHRHS2tZSkNpdi9FMldXVDQ5SzBQYWpTZ1NoWW1KL0dhdW5Bc0J2eG54?=
 =?utf-8?B?ZEFWNjlWRjBOSnhiMUpueHlUT3lBdUlmS1pjR3NXL081TThXUWZrVHdWZDBT?=
 =?utf-8?B?ZFpDR0lqeTA5RHgxSTgvMSt2Z0tSa2ZXMzRkWmdldVhVNElBM25jbHFvQ25w?=
 =?utf-8?Q?N043bZq/lmZqh7yU6DN8yDeCrcBADJSYQrIf4x2?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 452505ce-79c6-42f4-d258-08d9000aafcf
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 12:33:35.5077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WNChd4EKGW3FV2olipOcjL0zNea0T9bRTiko0EQAkt4RjlNtRX0O67SFeYvrgiGkZPZ/ZbAagzyUwWNG+d3w8BB4fLQjEHRHyuCgP/kQTBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2944
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, linux-aspeed@lists.ozlabs.org,
 Jonathan Corbet <corbet@lwn.net>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>,
 Open Source Submission <patches@amperecomputing.com>,
 Lee Jones <lee.jones@linaro.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 14/04/2021 15:28, Quan Nguyen wrote:
> On 13/04/2021 20:49, Rob Herring wrote:
>> On Fri, Apr 09, 2021 at 10:13:29AM +0700, Quan Nguyen wrote:
>>> Adds device tree bindings for SMPro drivers found on the Mt.Jade 
>>> hardware
>>> reference platform with Ampere's Altra Processor family.
>>>
>>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>>> ---
>>>   .../bindings/hwmon/ampere,ac01-hwmon.yaml     |  28 +++++
>>>   .../devicetree/bindings/mfd/ampere,smpro.yaml | 105 ++++++++++++++++++
>>>   2 files changed, 133 insertions(+)
>>>   create mode 100644 
>>> Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml
>>>   create mode 100644 
>>> Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml 
>>> b/Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml
>>> new file mode 100644
>>> index 000000000000..fbf7ec754160
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml
>>> @@ -0,0 +1,28 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/hwmon/ampere,ac01-hwmon.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Hardware monitoring driver for the Ampere Altra SMPro
>>> +
>>> +maintainers:
>>> +  - Quan Nguyen <quan@os.amperecomputing.com>
>>> +
>>> +description: |
>>> +  This module is part of the Ampere Altra SMPro multi-function 
>>> device. For more
>>> +  details see ../mfd/ampere,smpro.yaml.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - ampere,ac01-hwmon
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +
>>> +additionalProperties: false
>>> diff --git a/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml 
>>> b/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
>>> new file mode 100644
>>> index 000000000000..5613c420869e
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
>>> @@ -0,0 +1,105 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/mfd/ampere,smpro.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Ampere Altra SMPro firmware driver
>>> +
>>> +maintainers:
>>> +  - Quan Nguyen <quan@os.amperecomputing.com>
>>> +
>>> +description: |
>>> +  Ampere Altra SMPro firmware may contain different blocks like 
>>> hardware
>>> +  monitoring, error monitoring and other miscellaneous features.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - ampere,smpro
>>
>> Again, not very specific. There's only 1 version of 'smpro' h/w or
>> firmware? Are the firmware version and features discoverable? If not,
>> you need to be more specific (or better yet, make them discoverable).
>>
> Hi Rob,
> 
> So far, there's nothing to guarantee this is the only version of SMPro 
> and neither firmware version nor features that are discoverable.
> 
> In fact, it was "ampere,ac01-smpro" specifically in my v1. But this is 
> the "ampere,smpro" in arch/arm/boot/dts/nuvoton-npcm730-kudo.dts, that 
> is why it got changed to "ampere,smpro" to avoid changes in that dts file.
> 
> I'm thinking about change it back to "ampere,ac01-smpro" in next version 
> to make this compatible string more specific.
> 

Hi Rob, I have a second thought on this.

What MFD SMPro driver does is only to expose the register map for child 
drivers to use. Child drivers are capable to handle the specific details 
among SMPro version if necessary. Hence, even though we address the 
SMPro specific here (ie: by using specific compatible string), 
eventually, regardless of any version the SMPro might be, the MFD SMPro 
driver still just to expose the register map for its child drivers.

So, if that makes sense, I'd like to keep the "ampere,smpro" as 
compatible string.

- Quan

>>> +
>>> +  reg:
>>> +    description:
>>> +      I2C device address.
>>> +    maxItems: 1
>>> +
>>> +  "#address-cells":
>>> +    const: 1
>>> +
>>> +  "#size-cells":
>>> +    const: 0
>>> +
>>> +patternProperties:
>>> +  "^hwmon(@[0-9a-f]+)?$":
>>> +    $ref: ../hwmon/ampere,ac01-hwmon.yaml
>>> +
>>> +  "^misc(@[0-9a-f]+)?$":
>>
>> You don't need these child nodes in DT if there are no resources
>> associated with them. The parent driver can instantiate all the
>> sub-functions.
>>
> 
>  From v3, there is a "reg" property introduced for the child driver, 
> especially for the misc driver. This is unavoidable because other 
> properties might be introduced in future for other misc features.
> 
>>> +    type: object
>>> +    description: |
>>> +      This module is part of the Ampere Altra SMPro multi-function 
>>> device
>>> +      to support miscellaneous features
>>> +    properties:
>>> +      compatible:
>>> +        enum:
>>> +          - ampere,ac01-misc
>>> +      reg:
>>> +        maxItems: 1
>>> +
>>> +    required:
>>> +      - compatible
>>> +      - reg
>>> +
>>> +  "^errmon(@[0-9a-f]+)?$":
>>> +    type: object
>>> +    description: |
>>> +      This module is part of the Ampere Altra SMPro multi-function 
>>> device
>>> +      that supports error monitoring feature.
>>> +
>>> +    properties:
>>> +      compatible:
>>> +        enum:
>>> +          - ampere,ac01-errmon
>>> +      reg:
>>> +        maxItems: 1
>>> +
>>> +    required:
>>> +      - compatible
>>> +      - reg
>>> +
>>> +required:
>>> +  - "#address-cells"
>>> +  - "#size-cells"
>>> +  - compatible
>>> +  - reg
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    i2c {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +
>>> +        smpro@4f {
>>> +            compatible = "ampere,smpro";
>>> +            reg = <0x4f>;
>>> +            #address-cells = <1>;
>>> +            #size-cells = <0>;
>>> +
>>> +            hwmon@10 {
>>> +                compatible = "ampere,ac01-hwmon";
>>> +                reg = <0x10>;
>>> +            };
>>> +
>>> +            misc@b0 {
>>> +                compatible = "ampere,ac01-misc";
>>> +                reg = <0xb0>;
>>> +            };
>>> +
>>> +            errmon@80 {
>>> +                compatible = "ampere,ac01-errmon";
>>> +                reg = <0x80>;
>>> +            };
>>> +
>>> +        };
>>> +    };
>>> -- 
>>> 2.28.0
>>>
> 

