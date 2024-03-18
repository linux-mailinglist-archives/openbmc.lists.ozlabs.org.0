Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FD787E660
	for <lists+openbmc@lfdr.de>; Mon, 18 Mar 2024 10:52:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=8DBEDTIp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TyqsT2VvSz3c9N
	for <lists+openbmc@lfdr.de>; Mon, 18 Mar 2024 20:52:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=8DBEDTIp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:2416::700; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tyqry4JVZz3020
	for <openbmc@lists.ozlabs.org>; Mon, 18 Mar 2024 20:52:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jAUUUfs2qAlRx10bYMmDyXcgNfYVvB8n7H6G9HkHfA1+se1qoZVqm06fmCzm9ECIpPQ3d2ZrXPF4apMmVWcop/ktpU1Sa53yDGLPCcFVJs4PR1XCLgR6TmZlRDyB0SuZhUhDPYBBTibmN0w1AnQ64tFY+02kMRemvP9yrtEkIpHeWS2K+KMEBY7JLX/lmmPdPTrAfmSjj4a8JpBrrjf6D3BNHzo2Jz6WMg6bgUkMwSMkXZKKKAVUZt6i4qt67GAZiYYrstnJk16gDZ8AN1xyLqM0n0OSArEEjoxunktZrOFK6kKvTmEw8aqWTe5URA43ZF/ZoJhFAE87Ix5vtvcE7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WoK+xJSZpP7i2J8ROnc7f3400BG2gRVtkASGq/4rIJI=;
 b=Y0IyQpK514wnNId0ZMumFHHBzxi8TRFiYqHv16gRJnqXwwOpePcROe/kRpvnwfonFVBfH0akwu10Y3aAJIRGQnnpmlpjFNHpywX0nvwkZVQ3vt1+WNN4QMlrjvXd404VDFqMKQAerJC+8aQpAM7QK7vXqrDnoxRh1AjYI1HQO6EXw0eL+xaI+I4kAOD3YImmjlH/cDDff8jo/hmHcoVo8WOETaFMzbQ5BDdGrYDRGNHYdDpeb+5HZQ2BokGaQ9Tef3dvoMOVPUzXjH9Ra1Iu+kctPVXnsA+baM2RNk/ODZHjiGskuUIkeFBVw+MZaBI43vbxPcdmDFUqZ80UIMc79g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WoK+xJSZpP7i2J8ROnc7f3400BG2gRVtkASGq/4rIJI=;
 b=8DBEDTIps7W+CGlX1txNDZOFxFtgY/XtuYAH8T7LhkADl0NKf9cxB57dsZbPSprvFOdl46c9b4k+TZi1PKISOnlSnxOjlzSqgWVIoR/aGxspRIsi7P0ewWExJBmgTi5i0tyX9MrWqU/5V7pVmFYg75p53JscFhY1JujgzH39pgY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5947.prod.exchangelabs.com (2603:10b6:5:1dd::12) by
 SA0PR01MB6473.prod.exchangelabs.com (2603:10b6:806:ec::8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.23; Mon, 18 Mar 2024 09:51:58 +0000
Received: from DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::b557:13cd:8a29:ae08]) by DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::b557:13cd:8a29:ae08%4]) with mapi id 15.20.7386.025; Mon, 18 Mar 2024
 09:51:58 +0000
Message-ID: <ab8b45c5-2ef0-4a87-87bf-f797954b4574@amperemail.onmicrosoft.com>
Date: Mon, 18 Mar 2024 16:51:46 +0700
User-Agent: Mozilla Thunderbird
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
Subject: Re: [PATCH 1/3] dt-bindings: hwmon: Add maxim max31790 driver
 bindings
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
Content-Language: en-US
In-Reply-To: <6fb70adb-aa85-4b9c-b093-afa4ec7ed056@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::13) To DM6PR01MB5947.prod.exchangelabs.com
 (2603:10b6:5:1dd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB5947:EE_|SA0PR01MB6473:EE_
X-MS-Office365-Filtering-Correlation-Id: 688e077c-0db0-46e5-b900-08dc47310d6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	08exW8Mm9W2mGL19aMQzBUMC2e+ilzr4IFA5FSMsPbhJJWCXH+sa+O2i0lOyUk/a65TpdB6sHCtMH4aFvhuIW9Uyrtsgs6/Lk/MJmLvu1Q9tLVHqaI2lSZp3cp7/vSYkHv6p2cQ8IqrgaFeLBbQmPbrOLk/FASAGb2DNcnYltQOftCrM+mZFx8xv1p2HNgvUlDxYXinoKaNNkrCexZ/1wg93tWjYBqnmOKc6spCw861O7Z0ErIhRT9OkSfgm0BvdfPHxrprufl3r0khEQ9M4PsN3/O20oh0lBgRSOLkhXPJOr9WgXCkibDFr7PRqSRsNP6XFhOAsLwRQsJFzP9Swyt3GVxxI2qbXMWV1UZ5VXlxOhhbsMKrI1xrY9X0PMpTZNassm/kDnRZCCMzwtUqs62UbjI8QqVZVBqDKaNeN7JIZAZERd9RXBX1GhoGqxlpOj75NO5GBkygO1s+/H1nQpGLBr+g+Xoib5SAksoimQx61mnH+IfG8K4Xf+6sQjhXegsPocRHk86o1iWwg29MBzFNrCVcA14e9N4iuXH9E1PDI8kwfpFBtETDCFB7F95FcYBe+lS/D21OyY0U2cwUOGp1NRTmYTzjMsn5bnw5YDCKgA9rWzwIx00fwpca3rOHu9l4RYA96w0ZixW4dsPDNTA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB5947.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(376005)(366007)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?WjBCVGJrbStIbzJXRUUydlNjRElSQ2NSVy85cGtBKzE1RWVlNXRyd3orbTMx?=
 =?utf-8?B?dTZiYWd4S29HTzVleFJsdm5uazRVSFR2Sm9FK2sxQjZaMi9Gb2o4OUcwdGph?=
 =?utf-8?B?Y3QvNDFZOXk3TWpBSjBiUktNVStOL2FKckxTVHFmMDlHcmRYQ2krRHhVNHR5?=
 =?utf-8?B?Nkh1NWx3bXQ3UmR1K2JmR3lvRStEKzZDaXhVTmxjVkZFSWVMRklLSndFd2xt?=
 =?utf-8?B?QWxPdUlkVHZsZlY5L3J3UXZRVHVYbGJnZ1JHS1NWQlhTL1pMUFl0S2xzVVpa?=
 =?utf-8?B?a2xPMWlWVHM2Q0F2ZG9iMHR0MUpiSVJ1OUhQMS9WR1dTbFB3MHlZTXhuSnFs?=
 =?utf-8?B?bG9WaEg5cUF2cTFjZnFzc0ZVcGxsVmZHaXRIK1AySzF0ZndjM3M2cTFDMUhw?=
 =?utf-8?B?ckJnRjlVQTUramF2T2s3U1Rud2IxNDVNamFTVGFYcUJMcDg3N24rSGRjZXAr?=
 =?utf-8?B?MXdZODhVeDdPb004TmNweFJ4NzFRZk5uS09UaktGQXNnWWFNUVlvcUFkU3NC?=
 =?utf-8?B?cUJxSXhQdGpyalgxS1RISG5VdUpUdlorYnFLSlFvalJQeVhUclNydnM2Wksv?=
 =?utf-8?B?UEhqUGZqSG12bEp5UW55MHUrNmErK3Z5MkEvcktoNVVOdjlnYWxLbzk3cGYw?=
 =?utf-8?B?eis0MldoTVJTR0VBV05VZS8zclNQMzFjRUlOeEVCNnlHcThrK3krcTR3VFlW?=
 =?utf-8?B?MVA3YzQzcnkwM0JDNDRLTVF5UUttb090WFNMV2gvZy9EVkE3NnAzcDQ4VEVs?=
 =?utf-8?B?SWptV0UwcEpVdmkxS3VpWU9nQm15aFhXblliZ1pmT08walFQNzZpSCswWXZ6?=
 =?utf-8?B?d2NLbTg4WU1QQUFLVmRjQlpmOTVSbWpiSFZDN3JQdkZDMDkyR0M3SzlBc2VF?=
 =?utf-8?B?c2NTZzdNVVQ5b2FwQmQvYi9xV2lhTlRrSVhqVEpJaGx3cVdRUkNiMWhiYmpP?=
 =?utf-8?B?VUUySzVBUWhPSGhMK0xvMjBxUUJDR2tzcDZzdHcxM0U3Rjl1eFcyOUhPZlN3?=
 =?utf-8?B?MmFKQ2JvVHl3bjZaNzBWSnAzMUpUTmd0cXc0VmZkMGFJR0QvaG8xMEJscE9H?=
 =?utf-8?B?NHhWdVBkdHpHR0FjeTNydlY2MUlWYjBsbjhxVi94ZXprNUd2RTdyMzFDVDlj?=
 =?utf-8?B?S0p0Qy82SVJXYVFiWHVFTGZ4dERqWE50eDhyV2tyeFFKbWU5VEVETUFzRjAw?=
 =?utf-8?B?Q2hDOFFSSWJWcHJYYmZWRXZzVUcrYlMwV0pudGswakJiODJpRGM1WFdyT0hV?=
 =?utf-8?B?SFl1RW5xemJIY2Q4QWVyN3k0K0UzUm1WVENQQS9GcFhlOTdwdFQ0d3cxdG5v?=
 =?utf-8?B?OWdaVUlkTTlPdlJiOS9EWE5tUXNBQkkvL2pGSG5UdmgzZUhWOVg3cDZaZ0gr?=
 =?utf-8?B?RlZiRlVhZTVsWS9yeUNlQm5zc0N4Ui9aQnVyVHU1OTRRdk91czhqN0k5dktl?=
 =?utf-8?B?NmNNRUZuRFdzUWpuUXBjQ2JwOEFmTTBleXhRZTY4RUVQTkJRRXI0SktUTCty?=
 =?utf-8?B?eVZpdWU3UW1DMWNVUFNkQjVtSGRwZnk4ZEJCSVdmK0FzSTYzaEFKZ2tjNytQ?=
 =?utf-8?B?SW5obmJESnp6eGlCdjNDVkI5QnNHUllMRmM5U3A5WTV4U0VYbXMzck9ab1pK?=
 =?utf-8?B?TXIzL0FlSEpnbFRoZEZwOUYvL1RUN3VDTld5Um03eDBDTVJsSmhDKy8zcmJY?=
 =?utf-8?B?b3hMbG1VYm04Nk1tN1V5RUpOQUp3VVdqcWZNS2o1R3BjTHRsREgva2JjK0Y0?=
 =?utf-8?B?TGFXMmUrdEdKVm5DNnpORW52aGRZL1V2bzYzS2g4Vm5WU0l3OENHSkk2WVdr?=
 =?utf-8?B?NEpsRCtrYlVGM0grWUZ5YWUrbTh4TVlIYlhnT3RiNEdCUU5nZDlJenB4K2Vz?=
 =?utf-8?B?SmgzenJPYXJ1S1V5Sm02MkFhZW9OVHVYOGYza3luaUVNTkNjSko4NW1lWk5m?=
 =?utf-8?B?OEtvWGRPTkdpeHgvcURQdE5jQTcraEtnQW0xV01ORUdNL2wrbUc3dW92cmU0?=
 =?utf-8?B?Snh0M0tBVnhCTGZROEZzWjBoaGI2MEcyN3FkM3VpQkFWMFR3d3lHemJYazQ2?=
 =?utf-8?B?RlJoQkZ5WW9yUjkxNFlEMFBvOCtFenFDanpxbk9TZDA5QXgybzBpZEdTT1o0?=
 =?utf-8?B?b0dUaUJ6TVdnZm9pSkR3Z1hOMXVxTmZQU1hZd282ektqSi9pMm8wU2xWVVVK?=
 =?utf-8?Q?7x2mGcXh3FUHVGx7s7zSy9I=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 688e077c-0db0-46e5-b900-08dc47310d6f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5947.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 09:51:58.5510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJQasXtzwVfSFSuleFuKCOHbfVMCmaucZeVZ6bOSyxWMKRYLsU72alxkogHVbpexeriyyUnP6AE6lmMjTk+oeTf9UuYj7HK+zETLGEKK+kH6mdXXhY12A2F3Bu/MI7v/
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
Cc: Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 11/03/2024 23:55, Krzysztof Kozlowski wrote:
> On 11/03/2024 12:13, Chanh Nguyen wrote:
>> Add a device tree bindings for max31790 device.
> 
> Subject: drop "driver", bindings are about hardware.
> 

Yes, I'll drop "driver" at v2 updating.

> It does not look like you tested the bindings, at least after quick
> look. Please run `make dt_binding_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).
> Maybe you need to update your dtschema and yamllint.
> 


I tested the binding, I didn't see any warning/error log. Please review 
my logs as below

=> make dt_binding_check DT_SCHEMA_FILES=/hwmon/max31790.yaml
make[1]: Entering directory '/DISK4T/work/community/linux/out'
   DTEX    Documentation/devicetree/bindings/hwmon/max31790.example.dts
   DTC_CHK Documentation/devicetree/bindings/hwmon/max31790.example.dtb
make[1]: Leaving directory '/DISK4T/work/community/linux/out'

>>
>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>> ---
>>   .../devicetree/bindings/hwmon/max31790.yaml   | 44 +++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/hwmon/max31790.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/max31790.yaml b/Documentation/devicetree/bindings/hwmon/max31790.yaml
>> new file mode 100644
>> index 000000000000..5a93e6bdebda
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/max31790.yaml
> 
> Filename like compatible.

Yes, I'll update that in v2

> 
>> @@ -0,0 +1,44 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/hwmon/max31790.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: The Maxim MAX31790 Fan Controller
>> +
>> +maintainers:
>> +  - Jean Delvare <jdelvare@suse.com>
>> +  - Guenter Roeck <linux@roeck-us.net>
> 
> You should have here someone responsible for hardware, not subsystem
> maintainers.
> 

Hi Krzysztof,
I checked the history of the drivers/hwmon/max31790.c and see Guenter 
Roeck <linux@roeck-us.net> as an important maintainer. I saw many 
commits from him. So, I add him to maintainer list.

>> +
>> +description: >
>> +  The MAX31790 controls the speeds of up to six fans using six
>> +  independent PWM outputs. The desired fan speeds (or PWM duty cycles)
>> +  are written through the I2C interface.
>> +
>> +  Datasheets:
>> +    https://datasheets.maximintegrated.com/en/ds/MAX31790.pdf
>> +
>> +properties:
>> +  compatible:
>> +    const: maxim,max31790
>> +
>> +  reg:
>> +    maxItems: 1
> 
> That's weirdly empty.
> 

Hi Krzysztof,
I have not yet understood your comment here. Please help give more 
details for my missing! Thank Krzysztof!
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
> 
> You miss allOf: with $ref to fan controller schema.
> 

Thank Krzysztof,
I'll add the allOf at v2.

>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c {
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +
>> +      max31790@20 {
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 

I suggest some node names, such as "i2c-fan" or "fan-controller" . Can 
you please share your ideas with me!

> 
> Best regards,
> Krzysztof
> 
