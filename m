Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D85538869C4
	for <lists+openbmc@lfdr.de>; Fri, 22 Mar 2024 10:54:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=QNQvcl/r;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1HjV44DCz3vXH
	for <lists+openbmc@lfdr.de>; Fri, 22 Mar 2024 20:54:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=QNQvcl/r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:2405::700; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:2405::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1Hhx0ZFwz3dfg
	for <openbmc@lists.ozlabs.org>; Fri, 22 Mar 2024 20:53:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YT5Mx2J2qPiJt8ogPsgDnzyPbERJ2M3usc7/xBrXcLH5losKmYwTj/gOt1syhF+CM1cIbTNj7g1b0XUiqGVe5kqdAGeGVPsWrvd2/VPSaiIj8exZn0fJtF0DDff3/FhUiA6F9Mm7EKxdtLdiVsCHMunWGbQwzzEBG5R5mMbYF2mqXXMekQEIcPxyKvYuqOyQdpPS21jXBQf9jOsZuIMJ22aX0hEhKWAG2YPeeAJLgBMb0Gbui3pD6/zV3pOp/HWOpHA85WBcRyFBHhBTgcK0PJFSmt08dZLd3hAke1DAk2waz3bkzxafpKsDic7Dg+EeC23NQPXJrWHuO+qIQBKeOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0H7NitF17piND1xkvkM0wQqIck0PKS20irKLz1MvAQo=;
 b=oI4FkvXxrV6Fq8zz+XVvqOg3Qqlk5+DYxCn1qAoUTtbloB76zQoIJRcIfyUuE4GlRiwC+FECd6TAADh0MEo6YDYlKfRfWzlqTrUNHI6SPt3BtOejhpi7qTWZvPR+miARhwsV9Wk4WxPIpaRf7sWu4lShAVq2E59j4U11y7wM5dfUjQuFvTWiw0UtdFpkxxHcE2tOMpopPC+UAfm9hH8q/VjtPSpDhpU8Udps8yg7IbLD2FcKFaxqDlGNcCsc2FiCMLBhJwxJ+vUAgIQ+UbVFXCkYIETlNVmzPEjw9FAJj1HYJ+7Sy0KZCqZbhQtaULTQrjgESdpvgWaHm8GnzC2agQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0H7NitF17piND1xkvkM0wQqIck0PKS20irKLz1MvAQo=;
 b=QNQvcl/rOAroOomuEhFTLbF+BE8Gd4OxS9krS/cxieKLinvH6dZ/qsteneINS5QCY60PcYXKJkuTlrcx/0eAV6XGaYtJZxVzjTk1qwBCBYPgmg533GtIMFv5twkONzlOC2CfqeAuERVqRFPWBxQ5dTN3pM/APLfgFTu41Rw9H4A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5947.prod.exchangelabs.com (2603:10b6:5:1dd::12) by
 MW4PR01MB6129.prod.exchangelabs.com (2603:10b6:303:77::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.15; Fri, 22 Mar 2024 09:53:39 +0000
Received: from DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::b557:13cd:8a29:ae08]) by DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::b557:13cd:8a29:ae08%4]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 09:53:38 +0000
Message-ID: <21256600-d94d-4287-b22f-f22258121668@amperemail.onmicrosoft.com>
Date: Fri, 22 Mar 2024 16:53:28 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: hwmon: Add maxim max31790 driver
 bindings
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
 <20240311111347.23067-2-chanh@os.amperecomputing.com>
 <6fb70adb-aa85-4b9c-b093-afa4ec7ed056@linaro.org>
 <ab8b45c5-2ef0-4a87-87bf-f797954b4574@amperemail.onmicrosoft.com>
 <a224e752-d99b-45d3-b5db-761a698c347e@linaro.org>
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <a224e752-d99b-45d3-b5db-761a698c347e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0117.apcprd02.prod.outlook.com
 (2603:1096:4:92::33) To DM6PR01MB5947.prod.exchangelabs.com
 (2603:10b6:5:1dd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB5947:EE_|MW4PR01MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: 44a47a26-8412-42f8-8d3a-08dc4a55f29e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	jKkAW8OVhvAEez6TIN1o3eMCTiXoAw5dT+GmoMkriH3A07Nx6N09bmP1REH0P8r5LewGo8mGc5bplY5mlrZA/N+wbciHi5YYnRh5WEz3sR6Wi818ZsJRO9d1HOHrYh/9iDNBs4Gf6OtUfStErZHULg1hoYSvGlWt6AB83gzl8xoB+72mGhQl/0NQ0X3eKoxFwySF2ahTOSKWoGJ/KGHPgoj1G7zB38RDSxHH+mt1GhTKswOawrB5A6rsZEAlF+ReO4Bu2UWj8AlOr2HzskC7+S/Z12lnl8L+JTQ1x7Bzu8xog6cc+Rnq9hW39aZk7kTrqR0YcDhuwKO2oTvGs/0gz9pnilUA3gRWEQzfMElF/aMW6GGgEt7jZj4SRcnF1xCwzuA+4vJx29SfScSEBwmfzTsJCMceR6mgRqRLWIFLEEhnXszBHDl1VqedZLZRprrDztZ8CV9L81zevzvNk21xEBSh1KeDMNdj9urbZ4D4Rd72LM2ad8RwvVDFkhk0b1jddiL6Y8MYynCks0Ex3Yp8yaRgwGJ2Z/iQ62zng4Ay72PPGq8wwaIfs5nEsCWne3pVRvoYBdrwzrRPGuy7DDwulYL3Zcf9h5kj7WjHOEinoSg3iOe9WMYPraUJLInuH5bWw+853df8P2/qSbYfYIMChw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB5947.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(7416005)(366007)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Q2dUYlZrcFVib2ZPQ0hRbTRwNnAwQUxpNWt4QUQ5c0dqRyswUkt2TENtQ0N1?=
 =?utf-8?B?dWMyb3RvSFN0bnE1aFNHTnJIQXFDdmh5OE04T0E2VUNySUZDbGE2UHRST2FS?=
 =?utf-8?B?dEJBQk0wbmRoa0JTNUZ6a2tTWStoamRSRzVlR3hmUy8rejUyZWthUjVIWTho?=
 =?utf-8?B?STZQZ3pHQ1NqdklndHNRMFhKSGkrc29XTTFuWGNrVWt0NlpjWHdMUTlkd21C?=
 =?utf-8?B?Nm9DemlBWHRzNEJGb2k4eG5PTm9SemRBbHJlWHFuSk1KRDNqM1U5YWZBUVd3?=
 =?utf-8?B?LzVWc2FhUWlVNmtrdGhTS00xQ245Yyt2K2x2RW1BTUdOV09kbjFVS2pVcmlK?=
 =?utf-8?B?LzdsWHV3Zm16eXF0WHdyaWtLWTNTQzI5Slk0bWtHVlhzdDV5WlFWQm9BMWo3?=
 =?utf-8?B?RHYrVk1uZXpHRXBWUDlkNWpXSk5EbHR6V3hVdXp2OTJwOEc5eTJsanZGeGVE?=
 =?utf-8?B?SVN4QmI2amY3VndzZWtJanlCTjlKZ2dIMHozMU9UWlBFRy9yTGN2Zko5QzF6?=
 =?utf-8?B?NTZGTlk4NFJtc0hMUEczWmxhWW04akFVVUVmbE1iQ3NDYUZKZC9XOXdwbVF1?=
 =?utf-8?B?Y1EyUVVJQndWMW9TQXh4VVMvZ2srdjcyUXdyTU12clNSWlV5ejNHSERFekJJ?=
 =?utf-8?B?OUQwamtTVGppTkJTWWw0Wnl0Ri9hR1dTUzdEbnhzanIvTmlHOVhQenJUbFd6?=
 =?utf-8?B?bUpJU1ErOHhZYXI4RWszOWg5RDZ2dmtqRkVyeHhMTHI2Szh3NHdjVGdEOVRN?=
 =?utf-8?B?NU1ja21NQm1nTWFFSG42blQxeVV2clNRRi82akp6eDRYcG1YdVg1eWI3a1o1?=
 =?utf-8?B?WTJiL3ZrM1NaN2poOUZkM1VmMEFMQjhORFhFVzhnVi8wdVhMV1A4ZmtlcFBF?=
 =?utf-8?B?ck9FQkk4OW4zMjlKd0l4WFpuVllmd0Jvc29RcnhiSVpUaTFOZmM3R05INUR4?=
 =?utf-8?B?Y0xHdlVPWldIMUVmWDYybXplN09EdUV2QXZENVdnZ3B1aTM3Z2RseUVNd3B5?=
 =?utf-8?B?QzdnSno0RmdEbjRxZms1QnVPUXJTQ0dnbXplY3cxdWZ5NlRkVTZSbnc2TER3?=
 =?utf-8?B?SlBLL3pHdmQ5U0l5VGdSUTVQU1RSbVovZU5hczlySjEzT0lzc0Y3RzNSVWhB?=
 =?utf-8?B?blM5SktOVHR4S21VZlIxR25lMGxJcDZDZmxySkpuZDV6dzhLSFlZNmJsVndq?=
 =?utf-8?B?N1p2WVliUmhtcHg3ZmZYdXZ6ZmZDWnNyUHlYbjkrOEFJWnVoVEV3NFJTQ3BM?=
 =?utf-8?B?aHVSd1FnZ0hvdHZTNmZvYTIxQXpWUFhYR3ludENKYWNlRSsxamJCZkVnaWNz?=
 =?utf-8?B?Y3RYTzFmQm54MFZtV0hUZkc5ak0wd2t5TStQR0Z4Q05KMU5XWlVOc0FqOEND?=
 =?utf-8?B?NS9vQW0wSEp3TlJHeHJRbVNucnJoN1BBWXNIeEx5dStEb0RZSFgwRC9Xb0V4?=
 =?utf-8?B?U2FnNmRjaERjN2pDbitwcnoxc1plWkE5Z2hzcElUV2JtUTNGMXQ4VnRlUmcy?=
 =?utf-8?B?dXpRRGVPRE5JOXpYWnJBT3p5UDEwaVJLMFQ2dTJzMUpubkJuT01nMDBQcFlD?=
 =?utf-8?B?dGJlU2VLbEtIa3phK05mYUdqbnk2ZFU4MWlsMmUva0pYNkNzdm9GRVAzQnEx?=
 =?utf-8?B?S0lvdFNjcStmTS84T2ZGNUhSS3RUYW9kRXR6L2U2SDV4QlQralFmUnFmeDJr?=
 =?utf-8?B?aFVOVlF6U0lLaG4yTi95ZHhkSlZHeEZDRGZTamVGUVF2WXY2T2xTaWR0Ly9x?=
 =?utf-8?B?aC9YTFhXdVppNjF3VVFteHIzT0VKQ01WUVpnYmJWdU5mU1hFQXJraW5LSnRj?=
 =?utf-8?B?Vjh2UFVEVFZWeXJ1ZTZMSHZNUmxYMnVDbVlWV1lyMEJGQWIvYkIvMEMvc08v?=
 =?utf-8?B?SWRydnU4a0IwV1FET3BnSFR2LzdBTFFuTmk2YmRnUGJhcFNzRnlGVSt4dVJY?=
 =?utf-8?B?YmgxSTRsWnBVUDBPVUQ3Yy91SXRBWDJUbXpCVk1lWjNLTkVpbmNyK0kzTUdh?=
 =?utf-8?B?bnNDbDJ5K1pyQWc3eDBmK2wycy90dW1XK3JrRy95QVNpMWZ4MURsTTNVbVRt?=
 =?utf-8?B?VmdkNExGNDBFdmdBeVNudmtoQ0xybHNyNzdMcXY3bys4TjYrWnNOaGEzV29o?=
 =?utf-8?B?V1dIYWtVYlpXMFVHeXppOUFyQ0VuR0V0Qk9lemdVMFBzMGhLMVB4MVNMN2Nr?=
 =?utf-8?Q?SbVVhXBh38v9XsW7kefgFjc=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a47a26-8412-42f8-8d3a-08dc4a55f29e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5947.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 09:53:38.6376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a4pkiwUNXc9TlDYog3ejAwkKZcHohafIbP+eNy3nG83xoK3iW9Pqcht0NvCkcIQJz+KMk38Sm6X9HbdVY1lZ6o5JsVlyXzrEIJvwpn1juYI/gBD5xnHk0cYCJQRzQ9cb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6129
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



On 18/03/2024 17:00, Krzysztof Kozlowski wrote:
> On 18/03/2024 10:51, Chanh Nguyen wrote:
>>
>>> It does not look like you tested the bindings, at least after quick
>>> look. Please run `make dt_binding_check` (see
>>> Documentation/devicetree/bindings/writing-schema.rst for instructions).
>>> Maybe you need to update your dtschema and yamllint.
>>>
>>
>>
>> I tested the binding, I didn't see any warning/error log. Please review
>> my logs as below
> 
> Hm, I don't remember what brought my attention to possible error. Maybe
> I mistyped my template.
> 
>>
>> => make dt_binding_check DT_SCHEMA_FILES=/hwmon/max31790.yaml
>> make[1]: Entering directory '/DISK4T/work/community/linux/out'
>>     DTEX    Documentation/devicetree/bindings/hwmon/max31790.example.dts
>>     DTC_CHK Documentation/devicetree/bindings/hwmon/max31790.example.dtb
>> make[1]: Leaving directory '/DISK4T/work/community/linux/out'
>>
>>>>
>>>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>>>> ---
>>>>    .../devicetree/bindings/hwmon/max31790.yaml   | 44 +++++++++++++++++++
>>>>    1 file changed, 44 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/hwmon/max31790.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/hwmon/max31790.yaml b/Documentation/devicetree/bindings/hwmon/max31790.yaml
>>>> new file mode 100644
>>>> index 000000000000..5a93e6bdebda
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/hwmon/max31790.yaml
>>>
>>> Filename like compatible.
>>
>> Yes, I'll update that in v2
>>
>>>
>>>> @@ -0,0 +1,44 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/hwmon/max31790.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: The Maxim MAX31790 Fan Controller
>>>> +
>>>> +maintainers:
>>>> +  - Jean Delvare <jdelvare@suse.com>
>>>> +  - Guenter Roeck <linux@roeck-us.net>
>>>
>>> You should have here someone responsible for hardware, not subsystem
>>> maintainers.
>>>
>>
>> Hi Krzysztof,
>> I checked the history of the drivers/hwmon/max31790.c and see Guenter
>> Roeck <linux@roeck-us.net> as an important maintainer. I saw many
>> commits from him. So, I add him to maintainer list.
> 
> OK
> 
>>
>>>> +
>>>> +description: >
>>>> +  The MAX31790 controls the speeds of up to six fans using six
>>>> +  independent PWM outputs. The desired fan speeds (or PWM duty cycles)
>>>> +  are written through the I2C interface.
>>>> +
>>>> +  Datasheets:
>>>> +    https://datasheets.maximintegrated.com/en/ds/MAX31790.pdf
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: maxim,max31790
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>
>>> That's weirdly empty.
>>>
>>
>> Hi Krzysztof,
>> I have not yet understood your comment here. Please help give more
>> details for my missing! Thank Krzysztof!
> 
> I expect many more properties of a fan controller. Resources (clocks,
> PWMs, supplies) and FAN specific properties.
> 

Hi Krzysztof,

I'm creating a base binding document for the max31790 driver. I'm basing 
it on the drivers/hwmon/max31790.c. Currently, the max31790.c driver has 
not yet implemented other properties, such as clocks, fan-supply, pwms, 
etc. So I just introduced the "compatible" and "reg" properties.

In the near future, if any other properties are necessary, I think we 
will implement them in drivers/hwmon/max31790.c then update this binding 
document.

I look at other binding documents, I also see something similar. They 
just introduce the "compatible" and "reg" properties.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/hwmon/adi,max31760.yaml 


https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/hwmon/adt7475.yaml

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/hwmon/adi,ad741x.yaml

This is only my view. It's a pleasure to hear your advice. Thanks!


> 
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +
>>>
>>> You miss allOf: with $ref to fan controller schema.
>>>
>>
>> Thank Krzysztof,
>> I'll add the allOf at v2.
>>
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    i2c {
>>>> +      #address-cells = <1>;
>>>> +      #size-cells = <0>;
>>>> +
>>>> +      max31790@20 {
>>>
>>> Node names should be generic. See also an explanation and list of
>>> examples (not exhaustive) in DT specification:
>>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>>>
>>
>> I suggest some node names, such as "i2c-fan" or "fan-controller" . Can
>> you please share your ideas with me!
> 
> Look at recent commits and patches for similar type of a device.
> 

Hi Krzysztof,

I checked on recent commits and found something of a similar type.

adi,max31760.yaml
         fan-controller@50 {
             reg = <0x50>;
             compatible = "adi,max31760";
         };

hpe,gxp-fan-ctrl.yaml
     fan-controller@1000c00 {
       compatible = "hpe,gxp-fan-ctrl";
       reg = <0x1000c00 0x200>, <0xd1000000 0xff>, <0x80200000 0x100000>;
       reg-names = "base", "pl", "fn2";
     };


adi,axi-fan-control.yaml
         axi_fan_control: axi-fan-control@80000000 {
             compatible = "adi,axi-fan-control-1.00.a";
             reg = <0x0 0x80000000 0x10000>;
             clocks = <&clk 71>;
             interrupts = <0 110 0>;
             pulses-per-revolution = <2>;
         };

I think "fan-controller" is a good node name. Do you think so?

> Best regards,
> Krzysztof
> 
