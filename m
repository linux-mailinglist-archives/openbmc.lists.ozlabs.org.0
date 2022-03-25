Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0D44E6E9E
	for <lists+openbmc@lfdr.de>; Fri, 25 Mar 2022 08:14:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPtdL2M5sz30Fs
	for <lists+openbmc@lfdr.de>; Fri, 25 Mar 2022 18:14:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=moaYhi3g;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7ea9::729;
 helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=moaYhi3g; 
 dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on20729.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::729])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPtcv0GfCz2xD4
 for <openbmc@lists.ozlabs.org>; Fri, 25 Mar 2022 18:14:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PcRireziNS3gclKefjPGdFSF45gZqP5xGIXTIHCSPM3c29CVAjqA2L32oZlD5exe+XLd84a95CRH4XFnVngDtXqld+lOqnEQA92Vqa02oAjCBySUjc0iLruITnFCu/M0j2UTf3E1+DCxz7V7mNCUZ2B2mYYQ12a8s+g7mOwwWPmleRxSAnCZjR0L7xcfuaZO5pdxTZ3a96ghMs2cU6gqdv8g9P3jJMdmmCZryIge7XLxp48QNPSrZ7PvRX2zydrxJgb+L36MzR9iMdymkLYBCOVftBs4AkaYgvZeF3vE2V5+8aEF8U52d4MaXz1EkIFCNkxcUKucvtT2f+kGKxFKug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+rHPSWDbxtPst8YSxjh0RxwE13AyBRS+LbQSI1YrTk=;
 b=Yuh/uQOB7dLCuUMCivn4sfygMW+Rms1RKtCcY6usPXKiPPpkKvUMGCmAuqz6FVw2d7YDGJ6CCMtXzlQ2QdeAaVWu0pd8mdSChZ/brEGNsJLP/dilaGAe7qUC838MLA6+DDdyyYDg5fw6cyMhj3g/GZwXuDQf6sIZB6XNlb3vKhCLbeZ1pmGZ32jTNOLubArKdxeuneW5vsU3a0oWVp7KXSreGFlif7MeL5PIBS1cnb0VoR1z4E+i1Sk0afy5caTDBSW4/H9hlmfoN8dmCO8ftYSb2Vk0HAGdmUIZS78BxSR2OwRr2ElonzEtdhJrCv1QeLhTqBVC0PbpQ1iUyR0PQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+rHPSWDbxtPst8YSxjh0RxwE13AyBRS+LbQSI1YrTk=;
 b=moaYhi3g7P35Npmw+FrlFrKPC/hqQM7/AEvIojfsLM+nFQvYQIyEe5lMZP/R3q3wvRptN2UjFOlqoE0mj/ab6amez17WMqn1z3tZNdddUrQWnTZO2o+hMDKQRc8VANfiFhSnwnlGeJKBtZ7Afk8PXZqi0RJUMPryXn1Js9fPVrY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BYAPR01MB4086.prod.exchangelabs.com (2603:10b6:a03:56::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.17; Fri, 25 Mar 2022 07:14:01 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6%7]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 07:14:01 +0000
Message-ID: <449ef91b-42b1-804e-bc52-a85249b9da77@os.amperecomputing.com>
Date: Fri, 25 Mar 2022 14:13:45 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v7 7/9] dt-bindings: mfd: Add bindings for Ampere Altra
 SMPro MFD driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>, Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thu Nguyen <thu@os.amperecomputing.com>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <20220321081355.6802-1-quan@os.amperecomputing.com>
 <20220321081355.6802-8-quan@os.amperecomputing.com>
 <766931c9-6647-19c5-24d8-9b8fb3ab58d6@kernel.org>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <766931c9-6647-19c5-24d8-9b8fb3ab58d6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0033.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::21) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc01ccf1-ee1b-45dd-a16a-08da0e2f0917
X-MS-TrafficTypeDiagnostic: BYAPR01MB4086:EE_
X-Microsoft-Antispam-PRVS: <BYAPR01MB40867984BF603875945DFBAFF21A9@BYAPR01MB4086.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kSgnyV24Ww5K1JmLvmrCL9Cjv4OmmNeR/bLhs9rQ2B077DmgPzhSQJV4CS2D9vSNI5LPugf0FgdUiByJ7EGbq9NfxGZDY+b5aH8IXkWgm4QNWuV8tblr4xGHc5Tw1i3LbHSlQjyHz2gpZwKI3E+TV84pQQ0gXb2ISYm5nJ9S65OhmKTkFYqV2wioI6F8J8yuXzgfVf9OKKU8ixkdygrlbLu8ij2rAO+EfCZ8FAWrG1DbjSuRi8JAQjLoYqG3kqmOSpATmZhoh2s8hUUDicqPgzyV+hwJ7KOyIoUXmCHHYMDHprYcQfcMIRtgygNxWk4Gj1hM/E0l0O9ieQtQs/1CaF8Mg/o7jW1eJKazIqdkxuQsd/IiaiPpwa0U4gfK5/BslWBGPQ0aS+AHOX7TkcEna4pSTdTKG3TDN3jbZ9GRwjGqP+aYPwforz5vd5nt5NpUZhtapXa/bVtUD2Fd5NuTPZ37ZsHdgOiazBdulPfkA/AZw2DrSpLovV4EzzIMjDT3sNDgVvFAlsuMqGpMdJUeh1pG5L5epOHbBOxeg0dXwOhgBJbMBlj/iea96WXPpg/O7CmhDRoFFm8FRQpeiHYM0fbc775vFcv02VL/MgP54mMwH/YOVMJoIgoHZLH8PxinFv5zobpEQLlnZZLcWz33LI4sp/ewbBwjfPMJHAmunOXV3SZvIn4TOcFAZSqaK6V7w6iABNepQ+8iMAJfvP/97Weg7wGZf0aXI8NHrLM3ub28iV/EvHh2xUzBJliAt5TDTHsq5GxDZNM3RPDoJLvjfe3lFdCl+ZOS1f/5GDjvtc/dWKA6Pp1wVlHT1dAn59Dq00rm+//NDbN/+zFABkDy3PtgLfuaTdGH21CBpAp8hROzulOF5Bd6QZQhMZwqjXO/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(8936002)(186003)(316002)(54906003)(2616005)(5660300002)(4326008)(7416002)(110136005)(38100700002)(38350700002)(31696002)(31686004)(66946007)(52116002)(53546011)(6486002)(107886003)(6512007)(66476007)(8676002)(66556008)(83380400001)(86362001)(966005)(921005)(2906002)(6666004)(508600001)(6506007)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0t5dS81K0FITWtZK0xMbXlza2FtRnNPdDQwZlNCQWx6ZHE5SUR0M0lKQTB6?=
 =?utf-8?B?c3FlaTFubVF5bm1DS2Y3R0ZIVC8yYlduUllYVW9zVUFHSmF3T3JOSDk2Q1A4?=
 =?utf-8?B?U2VJK2NNWTdUY0oxZFZlelRQSWk5RmYwRHFUWm5nTXpGSURSYjF1UGRLUndo?=
 =?utf-8?B?U21pZ1BwTnVWZkhxUDcycGJVUHIrRE9UUnE2N3ArdythMTFXbmNlTjFwQU9G?=
 =?utf-8?B?V3JBdDVWMEN4VHE3MStLd1pYaXVJTlhUUWhqaVFuNTF6UDM0ZmtRNlJkYXRn?=
 =?utf-8?B?QlF1dHJlcG9wUUJWamYrVzZLWXhBU0hHeitERXVlNDUwNmd5VEJ3c2VFWkgx?=
 =?utf-8?B?Zm5LLzVGWE9PRzRxWStocUdwS2Q2eUdhZnJUdTBTSjRQbk5FSGpDaEdCOWE3?=
 =?utf-8?B?VU02V3ppZk1obndjYTVRZk5TdnZaNE53bStPVEpkYU81dlZIeVVQMldBUzd6?=
 =?utf-8?B?ZjNqTXZEczVKSlFQVXZCanQ5RlEwK1g5d2M1TXF1NDlrNE9VRWxkcVk3RitZ?=
 =?utf-8?B?UEFZK2c3QU9pd0pKTmpyYjB6MXVGWUl2dEx5VHphWHhuOTZVc2NPSFcrSHFV?=
 =?utf-8?B?TTZadVNjY2ZJbG1IaFJGYWZKQ0RzY0hCRUpnVXN4ZkZPU3BsK0xzWThHRi9L?=
 =?utf-8?B?WU9ZQURucEtEbUxPeCtnRjZoRWwrVmxVOTdMOE1IdWVqRmZLOU9Ca3JRdFR1?=
 =?utf-8?B?SG5GdFIyd09LNU10SDRob3BnRXVwdkNHUlBTaldWR1EzOWFIMEQyNnNyamh3?=
 =?utf-8?B?bDBvUTg3QW9TcDhlNU5CKy9VN09laVZXajMwU0J2U0o1UGhnanFSOE8yRVFl?=
 =?utf-8?B?V015L3Nmckt0K21BUjhHbExFMjd0aUh6cktXK0ZDa05ranVCaUJlRUtCYUx3?=
 =?utf-8?B?ZC9CWU5LSjUyT05SOVBJa2kvNkVJVWVpU0VJckdKMDRQVHNLOWQyWEFsL2hz?=
 =?utf-8?B?Z0xCWGlOSlRPM2g4c3ZvVVo2d1JoWml0NTFFTi9NTjV4MmxUTm9OWlI5UHJP?=
 =?utf-8?B?REgyZ1UyOTFWQTZPeVUzM281c2ZoRGgvdU12KzdVaHN5RTZDd1FhREd4WS9t?=
 =?utf-8?B?VTdTTFYxWUg1SmovcCtJVXp1aGExY2RQblN4M0N2T2ROcXVxcGFBT3pqR2Zv?=
 =?utf-8?B?M2Vra05vWHF6WGVVazYxc2VITmxVUHI3Q3B5ck9iV0JLVE8rV1E5endQLzJH?=
 =?utf-8?B?dGZYMThmMHJrL3YyWmF0cDk0Y1F3ekZHRjlhK2J5NmRTOWI1OGRTSnVza1l2?=
 =?utf-8?B?V3JSM053TjJNZTllYXpZbDBlUzM4NDFYSDZvQ1hYZHEwMExjbmpXdnRINHhC?=
 =?utf-8?B?ZCtKMmFXRHgva0ZEdHl0djR1bjhEUWEvTWZ0THdobTRsckNRNnhIUHp5MjZI?=
 =?utf-8?B?M1NBbU1sZWI1eW1rSXFQbkpuYUMxZnJER3VlSmU1SnZiQlVRRHZ3eCtNYlJV?=
 =?utf-8?B?NEJEZ0xvWGhobGh0dXdNVitSbEU5NEp6dDNnWG1ScndTeTdtVlc0bUpkRkZT?=
 =?utf-8?B?ei9mZytzdmFpdG9TN1U2Tk01S24yUUhNSEZWU0VaSnE2SWFxV2MyMk1KSko1?=
 =?utf-8?B?dGY1bDlwR2djSnkzY3pxVGF2RWo4RWVJWWJXSUhRZUVkVi9FL2huUmo2cU5a?=
 =?utf-8?B?bzlIVktJSTFRYzdJNTNFSkg2MythU3NBdFJuOTNpaWN0MU81QUg0SEREWUtI?=
 =?utf-8?B?UC91VFJEbis4eCsxd1FYdU9LcFRwcGxrSzlpVWl1QmhqNVFQOWk4bW1SYlNR?=
 =?utf-8?B?NXgvbXJXWGlTRTNCV3d1dUJ5M2VBM3hxcnBSQ2xET2xUcC9ISWVQS0JvVHJY?=
 =?utf-8?B?bklNK082WkVxS3BBSWk5WjRTdUlvNmRNdnBkMktmV3ZYTElxKzVBMXR5ZWps?=
 =?utf-8?B?UHNWL0J5U0ZsSyt6aVREU1U5U3oyZFB3UVU2SGJneFBGRmxLRjZORzRPMWxL?=
 =?utf-8?B?ekd6c3RNdi9Hd1d4NUw4c25lQUhsTEpsTmFJdWYrbVdrRStqOUpxL2FieHJI?=
 =?utf-8?Q?go0oiFKO578pSBPTvn2oaW2s1opYtI=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc01ccf1-ee1b-45dd-a16a-08da0e2f0917
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 07:14:01.3748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hoDioqU6lvEyc5KBK+BlXwF0gkK/Lb2VjDF7gLMjsv3m3I1tD7VEQPOkMyeFDxEmsQ0AOrASl0BOfvoo0TT1OJbt7RyI52UYJOlgploZEHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB4086
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 21/03/2022 17:08, Krzysztof Kozlowski wrote:
> On 21/03/2022 09:13, Quan Nguyen wrote:
>> Adds device tree bindings for SMPro MFD driver found on the Mt.Jade
>> hardware reference platform with Ampere's Altra Processor family.
>>
>> The SMpro co-processor on Ampere Altra processor family is to monitor
>> and report various data included hwmon-related info, RAS errors, and
>> other miscellaneous information.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>> Changes in v7:
>>    + None
>>
>> Changes in v6:
>>    + None
>>
>>   .../devicetree/bindings/mfd/ampere,smpro.yaml | 48 +++++++++++++++++++
>>   1 file changed, 48 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml b/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
>> new file mode 100644
>> index 000000000000..c29d975c1bc3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
>> @@ -0,0 +1,48 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mfd/ampere,smpro.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Ampere Altra SMPro firmware driver
>> +
>> +maintainers:
>> +  - Quan Nguyen <quan@os.amperecomputing.com>
>> +
>> +description: |
>> +  Ampere Altra SMPro firmware may contain different blocks like hardware
>> +  monitoring, error monitoring and other miscellaneous features.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ampere,smpro
>> +
>> +  reg:
>> +    description:
>> +      I2C device address.
>> +    maxItems: 1
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
> 
> Why do you need address/size cells? Is the binding not complete? The
> commit description does not mention such case.
> 

Thanks Krzysztof for the comment.
The address/size cells are indeed not used. The child drivers are 
instantiated by the parent MFD and there is no child nodes in DT. This 
part will be removed in my next version.

- Quan
