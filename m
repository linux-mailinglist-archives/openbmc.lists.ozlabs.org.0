Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D934074CB
	for <lists+openbmc@lfdr.de>; Sat, 11 Sep 2021 05:09:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5yPv5tk7z2yZp
	for <lists+openbmc@lfdr.de>; Sat, 11 Sep 2021 13:09:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=LRR9K/Hy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e88::72c;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=thu@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=LRR9K/Hy; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2072c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::72c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5yPM6f1jz2xY1
 for <openbmc@lists.ozlabs.org>; Sat, 11 Sep 2021 13:08:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fOfiedIlzZItL2pYs9IPyOe2qL4CvZ0NVD9O9CxaryHUTL42sYwrXgF7cYeSuRXhzsRXctqOa/Yk8cSUNZfHsIsqnGqRNWRdN6PUXujB+IU0VMxoE9CJwR2ZdUkKaY7dNUwfimiv5d9dI7x1o0yDGGrTjioxIf72u7Xh85uG+D9eSC8rsUoqRmgLBk71dBmTumw5ouOUMX8ofcj8isqrYT9PDt14eTkhDSHoVkniOFcrSE7MQY8RrTbINJph6i3jOVvZXgdYuLsVqTsJox1pvbNdN6KPvAIxfm2shVLpXZzvqdFSRKeIqIpGFl9tk4GkTeyWoXdfFveqPMsaKbauig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=uv5SaqkpvzrT2F7o8vzA5M8bm2U1l3gzDK25Q507P6s=;
 b=ZOdVifwqPKfDRWbYQ6zcZewFkl4hRFcGQcdetQgQNR7wSAqR1gEs+KAJWEDuOzzknDnOTL+lF+pgmINvhSITmltB+z2XzBUeYSFjsnaIi02/ztD/N5BloOkEms1XjmCPLrCsE1k0U+zwonWFfhpRwmuYuJQq78+EwgUPrIVEjkkdYqmOGtpuUB+FmG15LUXmPi4uBxY8DuCRRWEJGV9lekpQU+ah5VMbmHi9MsojtweuIVys3OGRg6pCRsXe+tH6GSTJSoGyoGg6wHxhUAVUEKvF//5fVocgaP3Zhlrkl24IpyqaCdVvCttTL3Ea90z+K2nd6MthHwQbrK5wua3Lmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uv5SaqkpvzrT2F7o8vzA5M8bm2U1l3gzDK25Q507P6s=;
 b=LRR9K/HyZBYKvGRzkPOidnHgG5YzRBXEPMoGMH8KnXW2FAcHaovn+HzMpCPGnWsD0RKOeY5ntn6qYQb0/SdutG5Gk8SE3ZNieCfML72J+fgFIWmukMEpt4pUF6OX0JIjwLGMGyLMqqFW9dDS335PIAXKnhlfV4GkXceLasCj6Xg=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5145.prod.exchangelabs.com (2603:10b6:5:56::16) by
 DM6PR01MB4554.prod.exchangelabs.com (2603:10b6:5:7e::31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.17; Sat, 11 Sep 2021 03:08:13 +0000
Received: from DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::bc35:5371:a238:b08b]) by DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::bc35:5371:a238:b08b%3]) with mapi id 15.20.4500.017; Sat, 11 Sep 2021
 03:08:07 +0000
Subject: Re: Implement OEM mechanism to handle
 xyz.openbmc_project.Condition.HostFirmware interface
To: Andrew Geissler <geissonator@gmail.com>
References: <53e204da-0c8b-d161-a065-a6195550d7f7@amperemail.onmicrosoft.com>
 <3909e9e3-0a58-e542-a004-89278438997d@amperemail.onmicrosoft.com>
 <07A6A378-47F6-4805-ABFD-D216F4D4C8FE@gmail.com>
 <5429fce9-d715-51a1-5e8d-61b3bd434a23@amperemail.onmicrosoft.com>
 <9990E419-23C1-4288-9D1A-07A1AA40C502@gmail.com>
From: Thu Nguyen <thu@amperemail.onmicrosoft.com>
Message-ID: <2c0e3f43-f861-8300-7743-03ba47be0955@amperemail.onmicrosoft.com>
Date: Sat, 11 Sep 2021 10:07:58 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <9990E419-23C1-4288-9D1A-07A1AA40C502@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: SG2PR01CA0156.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::36) To DM6PR01MB5145.prod.exchangelabs.com
 (2603:10b6:5:56::16)
MIME-Version: 1.0
Received: from [IPv6:2402:800:6344:7414:dc8e:9ff7:86d5:d863]
 (2402:800:6344:7414:dc8e:9ff7:86d5:d863) by
 SG2PR01CA0156.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Sat, 11 Sep 2021 03:08:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce64e670-4303-47dc-0a2d-08d974d160da
X-MS-TrafficTypeDiagnostic: DM6PR01MB4554:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR01MB4554F287BA48887BDECAAF2A90D79@DM6PR01MB4554.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z4qMZQNcQmzu3CwPMAD0qJGE67Q8WOu5vcWS6T9U8mLbhp5BDVmQI+5tHNmq/3h/bX2xKojxR22s8uVtfrbF0LrxCsdjMk5katXaIA+Q7cRNbcFb5GuzIVaxCfV2u62T4uchFTSPMK09qGxnurWBxXGnDQm3L2x1RbBMotuLE15916Te7lFczDOLGYaSKT5MgYkWcMYEVp/NyvGDjAEOzNjDRxOw8L5z7U7ja9At2QSZblXQo6xnUVmqCcGR7kmzT1EYNJUeZ2bV/2CigmrJMfrItP0OusBU9NvFrlf/G/5h5VCW8Gp9MeEOyXjrYLG1Ao9VhJ8wgvVZQCfi1bLAR8eKO6eZy7YsFIIvh8tcaKI1g86mZySqBFlAF3PaeEH2wSQKrPg23Ivjb1SwjMgeoUOXrAvXWQYnWoZZwYWitdgaCm0d2imp103F2DiaAOLqDpVxtYsbHJtHPUHZjU8+5UeUA2zohYeAIaoeoKj6/4WVMIPof3d5LV3SS0B0iN9D/8byWfIPbT8qge2FAVHoy8HoaGR9o32MXwn2uS6/W0aU7ANn0tzKaHAc99Q4Q0jNJD4Njfb55mkQqjvwHeXLS4jCmZRdCZZoSQUAcXaEeQAlPQf/2bckHcYI05RwTn3/JdLoF6e1F18bo6bamLg3G9wA/fqBUIlHpIcnKyiX4XZe7QgOC9u9ntvV37nBQXAplB0meeyu48A1SMvNhKYCQLVOMvvsFH6+bQ9qQOfzi7+bw6ayfAbhnNXZb4/xcx9RpxQRtD8ZKMzct6KiSRuJGfftRAG2XelQ3c+m7eS68ViuHX03dyw/pXEwddTQqnKA0hsxzhh7PZ8zUVAoaT+KBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR01MB5145.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(366004)(136003)(396003)(346002)(376002)(52116002)(5660300002)(42882007)(83170400001)(8676002)(478600001)(66476007)(66946007)(6666004)(6486002)(4326008)(31686004)(186003)(6916009)(31696002)(53546011)(66556008)(83380400001)(2616005)(38100700002)(8936002)(316002)(966005)(2906002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDN1VG9LQTh0cUlld2RqVEdvaFNjb2lzcmxhMzBxRGhITDM1ckk4ODdQZzZD?=
 =?utf-8?B?TzNGK1JiODdoZ042V2l6Yi9uemtDQ092MEE0UE5nMVlTeUN2L1Q1K3BiVzVm?=
 =?utf-8?B?NVBJNXkvRDkzYlE2UDRqUXdJQlhYaFNuN3V6VmJxYWl0aFQwT01JbGgyejZW?=
 =?utf-8?B?OG5kbnhGQUliODNrVWJGb3R1UWxWR0E4MEppR2RuWUw1cEFUUEludHZLcnBw?=
 =?utf-8?B?YXZyUVJGNmVJeFh2MEhvQWw2MHNqSmRXZjBPeXJlR29Qa09ZV1hzeTE0bXgv?=
 =?utf-8?B?dlcvRUpncUoxYlNndElwRHVvbDM4M01NYTgvSTRTem5mTWFtb1Z5dkVhSlVU?=
 =?utf-8?B?YnhNWFA2VEZrOE9UM1BOZ2tJOWVvWW9iMUV4c1pweHBKeXdRYjFkLy9wT3pl?=
 =?utf-8?B?K3pQOHJCQXRKc0l4a25rWktEbUJhb3NBOVQ0VDFWYVUvalJpL1pONWV0ZXlN?=
 =?utf-8?B?QjBFVTg4c29uckM5eUQyN3lFelRpV0REQXl6TWw0Y0RPOTNDR2kzZks3NjJu?=
 =?utf-8?B?NmRsam1tcFZiU0ZZdnlRNWxPYUdKbHllTHkzV1QrS3IzSmU0K2wvU1gyR3Ra?=
 =?utf-8?B?SWtTY0xqOVNKUllrYThPWHF6WlZGZWVTWmxEeTJWenp2OGk3R2x4UzA0WHpC?=
 =?utf-8?B?eml6VXR5VnFuVURWZHRqRm05MGxoR2FwNjJWWTVwZGpybVNXek9tWW43Syty?=
 =?utf-8?B?dnhKdnk1dE4wVEk1cVNLT2oyaGg3M3YyTmlCWmZsVzFsZWFDbFFWd2RUcTZS?=
 =?utf-8?B?U0RMVjlUeU43SUV0eEplMW9LMG1udU9tRlBOYitTM0JJbVpYd2VPQkFFSTB5?=
 =?utf-8?B?WmxVS2lubHJjQnB1Sk1TcHk1bTNzMUxrZ0NBeVp5L2ZyVnRseTVHWks4bU1P?=
 =?utf-8?B?eGhDajV5QlVtVU1BRXN1ZC9kR1l2N3NlY2RJR29JM2RaOHJFbUZ6cEltc0VK?=
 =?utf-8?B?ZFJuWFNXTHhnMHZUbldMbmROMlVvNFAzMjY5WG02Y3oxbE9vMHJkaDZLK0t2?=
 =?utf-8?B?TG9sZE9BL1RIbTBDbGR2c0dia1FNTStTRGhTamxBU0FENDI1UXdTQmN1Qlhj?=
 =?utf-8?B?Vm1EaG9kTWxKY2pGVVpYQ3NSR0NPTzAyMG9hZCtpbVFvK3BmU0hCdnU2ZFFv?=
 =?utf-8?B?L0R4aElWbERGcWwrWWNUTVN1RCtpekd0WU1vT0M5VzIvczlsSmFnb1VBODJa?=
 =?utf-8?B?c04zT3dXSkdINTFKSkJsN0xqUzlSblUyclRHMTJDelp5ZlpydlJlbmI3WEs0?=
 =?utf-8?B?RHgwZCtrMVVCbzVFS3V2QlB1UzJEak1Eb3BRajVoNERzc05nVlJ0dGgvOHo3?=
 =?utf-8?B?cXF1YWt3MTM4d0hLYm51bHlWc1FodDZBbER6L0JHOGN4Z3ZWdlJZY0N5S1Jk?=
 =?utf-8?B?bENQYWh4WXVuRWNtV0tXSHhjMHpkeENOZkRMMWJ4VWhMOHEyVmRidzk3Mmhu?=
 =?utf-8?B?R3AzeXQxaVpMaFlkb1pwbHd2emhOMll3aitkOEFmNEkwRnNsQmRuWmhTR0hj?=
 =?utf-8?B?MjlHN1pwSzJFWU1PbmwydE5WOVZOU1l5T1ltYmo5VnF3RnJJd3Z0aDJSc21L?=
 =?utf-8?B?bWwxcXlWTWIrVU5oZTh3WUd2WEUzZEs5Njk1NWNIVGlINC92ay9wRmxwRmxq?=
 =?utf-8?B?dXFhd2ZFM1J5aUNTNzVFc3ppbzBHL0NmQm9BZ2JBbU02MVpZamI0YkRXcHFm?=
 =?utf-8?B?VU5qdEFFTVVhS01rZXBvR0R3MTVQL01FQlVnemxJNGRndDR1M1hWamNlaTh6?=
 =?utf-8?B?WFZ1bGozSFZtVjJrR2Q0M0RFQ001Mi9aYU4rcjNienMvNHdSSjBhbHVBenN2?=
 =?utf-8?B?VUp3NkR0QkVKS1hCM25hV1VWYTlpSmVpYkhLZEk4aERpdVYwaGhNSW9rUmM0?=
 =?utf-8?Q?Ps0A248wj4bgv?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce64e670-4303-47dc-0a2d-08d974d160da
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5145.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2021 03:08:07.2764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mHhWLRipUfOthR0p6/TdEgKmNQ10XdCrTrivh1pGQxf9QuQtPmn4xt/9b1YxELEihtV1Y20YWVl95a61SSvIu0N2DUParV3pQJ+6gLSKdJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4554
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
Cc: openbmc@lists.ozlabs.org, Thang Nguyen <thang@amperemail.onmicrosoft.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

Please see my comments.

Thanks.

Thu Nguyen.

On 11/09/2021 04:57, Andrew Geissler wrote:
>
>> On Sep 10, 2021, at 6:34 AM, Thu Nguyen <thu@amperemail.onmicrosoft.com> wrote:
>>
>> Hi Andrew,
>>
>>
>> Please see my comments:
>>
>>
>> Thanks.
>>
>> Thu Nguyen.
>>
>> On 09/09/2021 22:42, Andrew Geissler wrote:
>>>> On Sep 8, 2021, at 8:54 PM, Thang Nguyen <thang@amperemail.onmicrosoft.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> Let me explain more detail about our cases:
>>>>
>>>> - Our system uses a GPIO called FW_BOOT_OK to detect if the Host is currently ON or OFF. The Host firmware set this GPIO when the first core initialized.
>>>>
>>>> - We have no problem in Host State with power control. But the problem is in the case of BMC rebooted while the Host is ON.
>>>>
>>>> - Before the commit https://github.com/openbmc/phosphor-state-manager/commit/0d1c3f1f9329c853677f0581287afef83eeea0f0, phosphor-reset-host-check@.service  is used to check and update Host State in case of BMC rebooted. But after that commit, the service file was removed. This makes no target service to update the Host State and the host check is fail at https://github.com/openbmc/phosphor-state-manager/blob/0a675215d6a6d2eb13e030ba0f618a4691de58d4/host_check.cpp#L109.
>>>>
>>>> We would like to ask for your idea on how should we implement for the Host check when BMC is rebooted?
>>> Hi Thang. Yeah, the reason for moving the logic directly into phosphor-host-state
>>> is we had a window where the host state would say off (default) even when the
>>> host was actually on. The other service would run and update it to the correct
>>> value but there was a window where external clients would see an incorrect
>>> state. So since we don’t want to report an invalid state, I needed the logic
>>> within the app itself on startup.
>>>
>>> I think you’re on the right path here. The design is to implement the
>>> xyz.openbmc_project.Condition.HostFirmware object and support the read
>>> of the CurrentFirmwareCondition property. Based on your GPIO state, you’d
>>> respond accordingly to the read. That way the state-manager code will just
>>> work as-is.
>>>
>>> On where to put this code… So far we’ve put it in the area that is doing the logic,
>>> like PLDM and IPMI. Since this is really just a GPIO read, I’m not sure the best
>>> place. I’d be interested if anyone on the list has some thoughts. Could host it
>>> outside of openbmc and just pull in via a recipe.
>>>
>>> I’d entertain a subdirectory in phosphor-state-manager with this small
>>> app (to host the interface you’ll want a c++ app) and service to run it.
>>> We could just enable it via a meson/compile flag. It seems like it could
>>> be fairly generic and something that other system owners could utilize.
>> So you mean we can add the code in subdirectory in phosphor-state-manager code.
> Yes
>
>> And the code have to generic enough to be reused in others systems and should include compile flag to enable/disable it.
> Yes. We’ll just treat it as a sub-package within the state-manager bitbake recipe
> and users can pull it in if they want it.
>
>> This code will response the host state base on the GPIO pins status.
>>
>>> Please take a look at https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md
>>> We’d want the GPIO utilized here to have a standard name so others
>>> could potentially make use of this logic.
>> In the specs, I don't see any sections mention about the host GPIOs.
> I was hoping you could name the GPIO’s in the dts so they could be generic
> and then others who want to make use of your function could just use the
> same names in their dts.
>
> So you’d make a proposed change to that document. A new “Host Status”
> section. Something like host0-status, host1-status, …

If we use the dts definition, we will be limited by the number of GPIO 
pins which are used to

identify the host state and also their polarities.

Because the GPIOs polarities are depended on the platform which designed 
by hardware team.

We can't ask them to fix the GPIOs polarities, I think.

>
> Then ideally we could avoid the need for the json file below and the code
> just looks for the GPIO’s using libgpiod. Although if they really can have
> different polarities, that may be an issue.
>
Yes. That is why I suggest the GPIOs setting.
>> So I think I will use the GPIO configuration file host_gpios.json with below format.
>>
>> {
>>    "host_state":{
>>      "host_0":[
>>        {
>>          "KEY": 48,
>>          "Polarity": "High"
>>        },
>>        {
>>          "KEY": 49,
>>          "Polarity": "Low"
>>        }
>>      ],
>>      "host_1":[
>>        {
>>          "KEY": 202,
>>          "Polarity": "Low"
>>        },
>>        {
>>          "KEY": 203,
>>          "Polarity": "High"
>>        }
>>      ]
>>    }
>> }
>>
>> The host_state fields will contain the GPIO settings to verify the running state of the hosts.
>>
>> I will support multi-host setting. For each host, I will also support identify the host state thru one or some GPIO pin status.
>>
>>> Andrew
>>>
>>>> Thanks,
>>>>
>>>> Thang Q. Nguyen
>>>>
>>>> On 08/09/2021 20:19, Thu Nguyen wrote:
>>>>> Dear Geissonator,
>>>>>
>>>>>
>>>>> After commit https://github.com/openbmc/phosphor-state-manager/commit/0d1c3f1f9329c853677f0581287afef83eeea0f0
>>>>>
>>>>> when BMC boots up, phosphor-host-state directly checks  the host state thru interface xyz.openbmc_project.Condition.HostFirmware.
>>>>>
>>>>> It does not check the existing of /run/openbmc/host@%d-on as before.
>>>>>
>>>>>
>>>>> I plan to implement "oem mechanism" to handle the interface xyz.openbmc_project.Condition.HostFirmware.
>>>>>
>>>>> Which will use the GPIO interface to update the host state. I researched the code handle this interface in phosphor-host-ipmi and pldm.
>>>>>
>>>>> I wonder which repo should I upstream the code? Currently, we don't have any OEM repo in github to upstream the code.
>>>>>
>>>>> Do you have any idea to handle interface in bash scripts?
>>>>>
>>>>>
>>>>> Regards.
>>>>>
>>>>> Thu Nguyen.
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
