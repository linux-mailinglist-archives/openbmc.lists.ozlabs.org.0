Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9269B88BF58
	for <lists+openbmc@lfdr.de>; Tue, 26 Mar 2024 11:27:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=PIQj02Tp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3mFb2Xqkz3vls
	for <lists+openbmc@lfdr.de>; Tue, 26 Mar 2024 21:27:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=PIQj02Tp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:2418::700; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3mF35NSFz3vfC
	for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2024 21:26:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YsZqwEzlUqJrzIitbOmcbW+k5bddbSvpESWdp10yFEIajyYUr8CymKk1X81/CXWi/IiqKuCbZf/A+sLWkTffFcOfhzB/6t7O2AwM3eY010j+IqQQfKA1Aljw37N87e4Edj2yDRY+VXeXXIOxXJUe4MJTEfc5u67i4zxl3lVXiVMeeflxz/pWhBrU7yC0J0/Z8zepiQ/PueYkoB6IHnjaBWvMjpJ83IHpHDQP1Pb8tm2AuQKmP3dW3tL+gYyH4FKnmKZKjfqwOSZOS6kCCB/txK+JmjlQaGDWXa3mqcwNWXSvBRdmVgrzLt36Hjs3srjky1inqh03NexdKCLrx26pig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YM2ke7Y57uZbVhFGImSrxWW8NEqe8lwuELwz2mDK/FU=;
 b=aVypU5ElQabzoaPySj5EMRu6k9nTexqebdUGUfdfsv/QDL+q9IKCgcWv6rjh5nE2dkAaprz65Z3K3Kc/PBqprtefCKFIMqYgj9Ppn5c4UTOmzELWaIZiW0MsoPrOC6l4kuPelJrEBoE1mBjfdENzJzDX4cNJ+81+WbHHd8PiwCEYM/60H8VHqlWbgX4RXWvgKjsAoP2EuEpW6M2hAfuuokDDbY+r/cEZeiXOjNCJFFyPCyDilun1PU/SXAC1lUKFWDWhF0NP/XdWW+glOnnkUESh4wqfX3hmRM2fSKcSRJswHSwJqtTQCiHmXiXGN32H4SgdCqMrQm4GIrHlW53UnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YM2ke7Y57uZbVhFGImSrxWW8NEqe8lwuELwz2mDK/FU=;
 b=PIQj02TpA8fO4WasIaBzMeFyiTlz7vHENjfM2/AYXHsk30nIwhADkE5CG0Vf7C4yGmtdaS+r5y1Jncbs2m7XlNH2awVnYY7kcUwJBrZ4gqOKhpk5ACOVWAixhjv8MTuq1X99yRjamFdDvRdN7RALWxD0jyo32TB745+tEa+H0GE=
Received: from DM6PR01MB5947.prod.exchangelabs.com (2603:10b6:5:1dd::12) by
 BN0PR01MB7166.prod.exchangelabs.com (2603:10b6:408:155::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.32; Tue, 26 Mar 2024 10:26:26 +0000
Received: from DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::b557:13cd:8a29:ae08]) by DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::b557:13cd:8a29:ae08%4]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 10:26:26 +0000
Message-ID: <4bf7984f-5f94-408d-8098-dead1987db62@amperemail.onmicrosoft.com>
Date: Tue, 26 Mar 2024 17:26:16 +0700
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
 <ab8b45c5-2ef0-4a87-87bf-f797954b4574@amperemail.onmicrosoft.com>
 <a224e752-d99b-45d3-b5db-761a698c347e@linaro.org>
 <21256600-d94d-4287-b22f-f22258121668@amperemail.onmicrosoft.com>
 <c3f296d2-63b0-493e-a2cd-5010dea84adb@linaro.org>
Content-Language: en-US
In-Reply-To: <c3f296d2-63b0-493e-a2cd-5010dea84adb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0189.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::15) To DM6PR01MB5947.prod.exchangelabs.com
 (2603:10b6:5:1dd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB5947:EE_|BN0PR01MB7166:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	+SmfEDC1OD+hnYIe4uHz1rzuLuue3dCRIuWua5iHi23lSpmlO0vcOccFLEJL2TwgWyw3VjfNQ1MaLv6YXlnVaPLcHLRjoVK64BMzdkXKYrfeSJQ/Q6+dyhKxfQTr7AAyAfVvb0sqSON0jYOQAAj8hN2wbb3wOZ+Hp5x9WyQrKPdcjBHEGtU5nBuNq3HZANII1HlMJmm4L1RrRG7SATelwuHzzy+Bm1XXCY3giub/1MT+JYDetMGnfYuOMvEFi585BnZAkN5gfwt2UkQrLNvsoUUi3apnyg76wb+HvlQGFlICh96j285szM2ZPFqXAeumqilQULW+dhRS9/MFHxbwmLpx1MqVYEsOkSS7QzJxQ3MwhzxhpgVO8kCg7okLIX1ikS+3AGdyGcB8mDYzuLvcnLJyGkGxiYJBN0qvFLjHSwiwN6Ghu5I3dCOCofuS1fO1FQhGTCT5KeCJyydjezGlAKKOfNoc7pOWqyJKskxqQm/AGrGJzNNuULNe4iYtGVYu9L+tLheSmldNeWpbH3FxqEAZZcuH+RFfJX4z8q18i7cWIKL/60iE8qqJ4lCx7uELbdNeNpiBmESlv/apvbumaGK/kI2h/G2483v8GJ3YdcdGf1SDnzmkibxkwuE1etxapCCHl7qMPZhHW1sBcbA8vQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB5947.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(376005)(1800799015)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?ZHpPYVNWYitzaTlyVFNFcnBxWThEc3U1KzNKOFIwZGlGY0xMZmRHdytTZzl3?=
 =?utf-8?B?ZW5mM3EzOG1wSEs5RUcxdHl6NGk1RzVaOTZBdko5OVJDRTVBd040SGp2K21H?=
 =?utf-8?B?LzJ0RHNMQ094cHc2eFU5MVRUanNGSWYwVmY5UkFyRWU3dWQ2amJhdktCckox?=
 =?utf-8?B?KzhUVUsxOWVOMk9HNUhSWkU3SkdhNTdVRVNjRURvcDVJRS9Ra2hwWXlvVDFM?=
 =?utf-8?B?WEVCUGt1bm9aRitXK3lnOFlUbHl5UzJzcWh6UDRkcWxhTUZwdlBCVExZQzEw?=
 =?utf-8?B?bW4yRXNsN01ITGdzVTRCZzBDNVNoeURvYVNqbjBwdlBwTVhtQjJEUkdJNHA3?=
 =?utf-8?B?NXNGQXM2eHY2OUtDQ3FhbVRlbEJqVnZ6dnpZR291b2NWdWlaVHhuR0VHemZD?=
 =?utf-8?B?ZGFVRkVTQWNNU2k3U3krNTgxdXI1UUNzeXdqVEQvcTJ3ZGpCdlFtazlyVHlK?=
 =?utf-8?B?ZW9OdS9XV3JxZ3E2QVhFWTBlczlucFVqUEx5eThKNEh2aHlIVXVNVFdYVXVD?=
 =?utf-8?B?Z1JNUXIxZW5OSmY4NkFaUmU2dHA4aXlyRkxwV3B6MDNqazloZXVmbTNUU0hv?=
 =?utf-8?B?SVMzQTZxUHZyWWdKT3FwcUlUUGJTT1NNV1FYNVRYajdab096SDgxMTE3YzNK?=
 =?utf-8?B?Vy9iU25yRVhuZGtiakNwOXI2anEwc0xSVms4aDhCa0Y3WjVMaHY2VUswMC9S?=
 =?utf-8?B?bVdzUkpZK0ZhYzZZdTVIb0YrU1dsaUNOWUxpYjVUWllJdjZPalA5RkZkTlpw?=
 =?utf-8?B?UEkwdnVQSDU5aVBuNGhPRFpUZTBOZEFaZkxOdTBFeUYvYVNqckgzS0sxK0pZ?=
 =?utf-8?B?eVBwa2xKbXNtWFRVdytoeGw1SnlrOUpHZ1Q0blJQMDZrSUVVN0p0Z1FFTGkr?=
 =?utf-8?B?NEIzUm5PdlpETEh0ekJrZnlFak9DYjFPbGQzeFdkMDZGVHRTcnlCVHBhdUZm?=
 =?utf-8?B?aFdNOENIWkZYcDd0R2RmUEpTNXNjU2R5dzRmczQzV01xT0NSV1p5MFYzVk5u?=
 =?utf-8?B?NjZKYS93TnY1Wlp1SGlwSGxPUXVXYm1wMk5wUnJVTk1yL05jTlJKanU3OHFT?=
 =?utf-8?B?ZVRIZ2tKcGZrQUk0dVJBMGVkazZTbXJWV1RXMTJaRjNSTWh2Qkt4V2JoWjg1?=
 =?utf-8?B?V3l5OHFtK2dwQmxFcGMvRCtKOXpsaEZHWndLMG9XOFRHbEQyUGZ0Q0dqTHQ3?=
 =?utf-8?B?Qkd5S1JJcmRHekdCVmFkZE54YXJRaE9XN1lnQ2hzODQwTTZCT0wyYVptMXg0?=
 =?utf-8?B?eGliZFlOMHBQdk9wZk1xM2M3ekNvK0NUU21iM2UvS1VNUis1eDJVWjJHSk94?=
 =?utf-8?B?THpJMlBGV2FSV05XQWQraWJhblhUclFYYTluMVg1Q3NHOGRQd1hZaDlENldW?=
 =?utf-8?B?OXJ3ZDBQalBYMFNRT3hrVG12TXdQK1Y1NStEY2NUeFQ5TWZGRGJVelRpUTJG?=
 =?utf-8?B?OU5seDJVS1ZhVktEVVlsUGZhVnUydVBRdjQ2cG0rN1NJRTdNNlRudkova3pS?=
 =?utf-8?B?YldoS2VFMmgwbE1Va0xzbGo2WEl6QlcvVklsT2dJOHZUbzdDOStBZTNTcS9i?=
 =?utf-8?B?US9rNEcvTU1ZUkowQndPTVNLTk9uVFJkaHZBbFR0MnV4ckxHUkhNcEJ2VStl?=
 =?utf-8?B?anhrNlhOZkFyZG12YWUwSERMUkUzN2lqTnR6d2xISzZuQlkzR1J0aDMzTTV4?=
 =?utf-8?B?NCttL2dYYnhWeFVJZjhZUkwxUUZyeThSMVdqWXZvVmh3R0xUQkhha29PSlFa?=
 =?utf-8?B?V2lnWnVFWmJKVWdYaVVqZmRCRmM0Wnp6bGo5RTlKeUxLZGEzZlZVaXlMTTN3?=
 =?utf-8?B?VzBhbEdZMW1vRjBXdVc2Tll3YUpDSXlwTm8zK3NxT1E4Z3NnVlMzWlpCMlVL?=
 =?utf-8?B?OEhxWWdkZlR4dlkzY082c2FsaUM4NWxQMW1rcWFrRjAxdHdRMERIUVlvOXA0?=
 =?utf-8?B?RllUZ2l0NFJBcW1JOFpzMGZMZGJ2MVFWUGtsRlRoU0FZcGt0c0RXNkNMOGlx?=
 =?utf-8?B?L2Mzd1NqM3RmUVFvb3AyN1JXWmtkREJ3blBiS0RyTC9YL0ZaZXFhZ1EyYjhP?=
 =?utf-8?B?WW45cXNMSFE2KytXQ24xSHJ3Y3hhVGIyY1V5OXd2Z0JGS1I0b2N3Z2NWbEJh?=
 =?utf-8?B?RWYrVmpqVkpQcVBrZm9aYTZIQjFZK1VpVWZRY3BkM0tCbFJabk9QVmZXTndB?=
 =?utf-8?Q?lXdpajiT0bwF6sKaKyeL/O4=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e8bc4c-63a5-4cab-f907-08dc4d7f30f8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5947.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 10:26:26.3707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wQChrqjp+0nmW36BQmtZTxhPBJlstBRd/GgJ5LptLOeGqHvCfEx+HZf7Ax6m++sPq8UqY/DQX0kxMGStFPjPLxSCVaJ3gQTjNHMJrAI54UBOAHYaKXyaYUv6UnXljnwn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR01MB7166
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



On 25/03/2024 15:32, Krzysztof Kozlowski wrote:
> On 22/03/2024 10:53, Chanh Nguyen wrote:
>>>>>
>>>>
>>>> Hi Krzysztof,
>>>> I have not yet understood your comment here. Please help give more
>>>> details for my missing! Thank Krzysztof!
>>>
>>> I expect many more properties of a fan controller. Resources (clocks,
>>> PWMs, supplies) and FAN specific properties.
>>>
>>
>> Hi Krzysztof,
>>
>> I'm creating a base binding document for the max31790 driver. I'm basing
>> it on the drivers/hwmon/max31790.c. Currently, the max31790.c driver has
> 
> Binding should be based on device (e.g. its datasheet), not the driver.
> 

Thank Krzysztof,
I'm reading the writing-bindings.rst and I got it for now. I'll make 
complete binding in patch v2.

I am very pleased to hear your comments.

>> not yet implemented other properties, such as clocks, fan-supply, pwms,
>> etc. So I just introduced the "compatible" and "reg" properties.
>>
>> In the near future, if any other properties are necessary, I think we
>> will implement them in drivers/hwmon/max31790.c then update this binding
>> document.
> 
> Please instead read:
> Documentation/devicetree/bindings/writing-bindings.rst
> 
>>
>> I look at other binding documents, I also see something similar. They
>> just introduce the "compatible" and "reg" properties.
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/hwmon/adi,max31760.yaml
> 
> Maybe these devices are similar, maybe not. This should not be excuse to
> come with really incomplete binding.
> 
> ...
> 
>> I think "fan-controller" is a good node name. Do you think so?
>>
> 
> Yes.
> 
> Best regards,
> Krzysztof
> 
