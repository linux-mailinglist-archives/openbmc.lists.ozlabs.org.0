Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC883CC381
	for <lists+openbmc@lfdr.de>; Sat, 17 Jul 2021 14:52:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GRp1J6x6mz30DN
	for <lists+openbmc@lfdr.de>; Sat, 17 Jul 2021 22:52:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=QBZZ/e28;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.92.114;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=QBZZ/e28; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2114.outbound.protection.outlook.com [40.107.92.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GRp0s5kwFz2ydK;
 Sat, 17 Jul 2021 22:52:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FzaWj/u1Gglwa/YLgTImecHAH3V0vssRSUHD/c2dZTtYRxq61W2W59e96add/DBWWmTxT60F9MHkYHZCA9t1y9uoNfwE0m9SXb7AXs0NFtSonWdF1cV88vYu/aVUnjU02UjC8JEIu2gwUev17OliDKTEarHByPn5Mhfpp8DtfKwGVwXRUKd0wuzgSZL8hGe9FkBIQ3M2Fzq0eDXM4YFFJQxxyFWdZWabKJp68x+5l00b0agG9C/qhTp3FWIEhV+H6AWg3HZgkSebf0kabQLaeJarnXNc375z2kGuixSIL253nVtzyL9tasHj/7EsDAJMpBXctzFkaCeS/ZeoiUcF4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbikGumy1RTQMYr3697LIIIU4H0ZjIt4cgCncgfyrhE=;
 b=i5TzHRfsEVGoMw37C1ugZkHZxgyUFlbZD6d9Sw7F6rwWTjdgcAKkX+ZYNZo/6Iby5YHiL4yTa76Mni/jQiZVjshlodMe8aJpOmsIYT8EeRa+MdJZB3b8EdAqoDU5la5kUKuOWHaQ2eUAc8OpC031o4OYGnPbfkvY3FQ7jNd+Ir4plpd4XTeIMeSO9a87VbPU/6MO3moFyVSU1fmOTltQJZBo73c7uHRZwxGAWaBzIo5KSJTca0J6etxv2jUUQIoFBiAdMzDUG/s9ZKOEevjKoeAgbEg2veeSDXU/v3GxWia4g8ClRxzF2uGGgF0ZHi12G1N1zIWP1loulUmAGwjTgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbikGumy1RTQMYr3697LIIIU4H0ZjIt4cgCncgfyrhE=;
 b=QBZZ/e28rI/Bla7UJny9vBg5UFA5s97zMFOb0MfYz+uhGE2wrXE42A/kT5b0SdbYeFdzKfOQE8Pxa/LISCbVKyEbY1gyeF+LnBmA7pVIvo3YxMrXKct91cCw/F/cRvz/OsUlLgQEn2RZN5aiJqz9Kr+XWzROewQwAdcNZh8kUdc=
Authentication-Results: lwn.net; dkim=none (message not signed)
 header.d=none;lwn.net; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR01MB2733.prod.exchangelabs.com (2603:10b6:300:f4::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21; Sat, 17 Jul 2021 12:52:04 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e%5]) with mapi id 15.20.4331.026; Sat, 17 Jul 2021
 12:52:04 +0000
Subject: Re: [PATCH v5 1/4] dt-bindings: mfd: Add bindings for Ampere Altra
 SMPro MFD driver
To: Rob Herring <robh@kernel.org>
References: <20210713060031.31568-1-quan@os.amperecomputing.com>
 <20210713060031.31568-2-quan@os.amperecomputing.com>
 <20210716173443.GA3643583@robh.at.kernel.org>
From: Quan Nguyen <quan@os.amperecomputing.com>
Message-ID: <ece6e0ec-4566-0371-be57-89a69d425683@os.amperecomputing.com>
Date: Sat, 17 Jul 2021 19:51:52 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
In-Reply-To: <20210716173443.GA3643583@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR03CA0059.apcprd03.prod.outlook.com
 (2603:1096:202:17::29) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2402:800:623c:a5ad:55f4:5d0e:4366:3aa5]
 (2402:800:623c:a5ad:55f4:5d0e:4366:3aa5) by
 HK2PR03CA0059.apcprd03.prod.outlook.com (2603:1096:202:17::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.8 via Frontend Transport; Sat, 17 Jul 2021 12:51:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d614883d-cfee-4c61-d911-08d94921ad14
X-MS-TrafficTypeDiagnostic: MWHPR01MB2733:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR01MB2733E217B7A1A33B4AE0EAB1F2109@MWHPR01MB2733.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b2c/+JDDmP0FqlnR+CMzw0YEGUUc8PqJgWsiLdXn4TSsZa4MJN7NpVY5Fsb/i9h1Ksoz6ajhPpUrePQIWUQtDRMCg0t++pR83g4Kt8C54ucsiSBUqux6ldU/hE/AmUN3lZ5Yoh+cj8SBNVB+iHJpiuCQs1vkkq00I+fuN46F0qhTV/ABlNser0QWwAivLhxnEKbBlkeVDHa6DJPgh6OYimy/Cz9K0734YaiXrKU9Es4GR/q0Ej4fn4cBdfc79hOoqRNupH/6HQNdMTxiZVEdEdPtfdLVcQaN2+KBo1yfZOIuFTKz9lvqMqGBzu/8TgNt98rQD9i10GTtxNm7AQLkl3EWRj1O2qGW3ZtoqUXk/XzMI0i+GFD8A8meCKd0Vt0qY7MhCjvrHtrANc9bTrejPtBPKs/ZIQ8LgQ8v82aV/1hAnr7+qVCOPJOicB6rqwaI3dsyTnlZUc27Mm2l9OkDSJ1sC7fKCxE+0KqP5NqNyBGA6e64Q88j1ghCM9yG9aH4+VHT13JibKYZnjH153OuoSEO9FHqQ7YVAUxFyvnfqQ9hj2+NvyfKEgZvb6cApZJVgzWns418zQgDPXI4b9IoqPkK0TMt7iNRDKCMVLrk7/1SwwRPXV3KUOeIIfvkchJofPrI0DBgHbDpykEpIKtBigRH4hmldS6A09rJb4VPXaffAPprnaDCKID3PMrB9utz0uPVWURCB8jFiKklGwNbSQuSqE5gmZG2LfFPF/eqIgY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(136003)(366004)(39850400004)(478600001)(31696002)(7416002)(6916009)(5660300002)(4326008)(2616005)(6486002)(31686004)(6666004)(66556008)(66476007)(52116002)(66946007)(38100700002)(8936002)(8676002)(54906003)(53546011)(86362001)(316002)(83380400001)(186003)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnZkL24rSTlaMlR1eVBMc291VE1QZ1NsZU1lOEIyOHlDdkhGOHpnNnZ1MFBY?=
 =?utf-8?B?aFF4dm82ME52M2xNTmszaUx2NndmM3dFYXZ0aDE5WW1ZMHZsamh0QnIrZWFO?=
 =?utf-8?B?ek5yemhyVHFqcW43WnoyTU4razZ4d3NjNmZmeGM0Q0lJSXA0azJrUVM1U3VU?=
 =?utf-8?B?QUJML2xKWmJKNmZpZGw4ZWZnUkZScDA1M1VzZmROZjdGTEN5RnFwMDhhZzhJ?=
 =?utf-8?B?ZG1CUmh6MmNobk1XbmhIbUpaOGJtVW9KNHQ5MFB0QnIrNW9aZ0hwbHJyaGtz?=
 =?utf-8?B?TGUxNzREWVEvcFN4eS9hSWVMTEpuZHlHTXVBWlVrTFhWZnNTWjRYMFdFRkVL?=
 =?utf-8?B?Wk4wUnA5a2RHWklHSHlEZ1lBSUJWSC9OZ0pHc0JMZW1HRHBXUGY3dVNaYWhC?=
 =?utf-8?B?M2NGV3hBL0RnMVI4MEtjQlgzUnJwVm9qaWVZWTVZUGZjaEdXc3FZZVBnMVBn?=
 =?utf-8?B?T1Z6TnVaKzBYZzZobkU4MGplcUNrb2Z6ZEl1SlFPQS9JTXUreHk4VUcrQ1k3?=
 =?utf-8?B?N1k3K3lKMVNZNk5OTnpIS1JyVWwxREl4cVE1bTYvbVJDQS9CZ2tvaHNuZUVX?=
 =?utf-8?B?dVBqY0d3ZW96Tk1wWnEwQVQwKzlwckRaNThxT0ljU2tzVWw2NzZuZnBic1Rp?=
 =?utf-8?B?cEFCKzNJKzdmWDdvZUJZdEZOSTZySExjaGxKSi9XQTcrdUo2WWQ3QkhFeWJI?=
 =?utf-8?B?YjgrYUhIYTJVclZDeDZURlBwOUFqM1NaVHZVQjlqaGR1WXNPSWtlL1NWSXpY?=
 =?utf-8?B?YjNnTWhjQXF4eHR6aFd2MDhrMW8wYXhJYmJZSy80REs1cExWaC9Yc2k4NVJn?=
 =?utf-8?B?K3VkODJibUFJRnBWMUg3bHdrNW1qUEJrTUF5REVXZXRndFlUU25ibS9OVXV6?=
 =?utf-8?B?d1JjL2c3NU95UEM3SW83elFaclJUZnZidzUrT2RYNHBKdmxqcFQ5QmpBS2Mv?=
 =?utf-8?B?SlNOTERKK0JYZXpTMnRnemFNbnBwa3BtQm9mb3F5dDVkRnBvQ2RNZTFvQ2tO?=
 =?utf-8?B?SzZxZS8rTTlaa25TQzF2b2lMNkFWMVIvNjQ5ZEpVYzJYZHYrRTkyR0NJdHRH?=
 =?utf-8?B?cjhvc2U4Z2UzdWFNNW5YZW85NzBsYTM3a0N6dWN4WnZ3WHhneWw2VlN3QzA0?=
 =?utf-8?B?MFltY3hiR0tZYzZpUk9aRmlkek5VSzFuTFoyaXBtWnNjRk1xelNxSnpNRlBs?=
 =?utf-8?B?ZS94ZnpScUJTditaZDMzRlRNNHNubjc4UUhTU0xpRGtmaDJsMkRMb1RGT3gv?=
 =?utf-8?B?ZGg3U05oYnViWlRzNzFtL2FIVno3M1dCVVRnZkVNOXUyLzl3bnEvanhqMG9t?=
 =?utf-8?B?L0ZjN1JqbGV1d0FoU0dBOHhNa3VCTERaNXFMOW1SL2dsSHNOcHY2YUMzb0Np?=
 =?utf-8?B?ajhOMThrRTBkWGVMVkFxVlNyM0Q4b21vd3Z2RXJJVlpubjB6bGtjdEhkS2sv?=
 =?utf-8?B?aTdnYnl6cXFHVGovaGt5NTNvbE5abXhUb0hLM2t0U1RkQ1ZnaVBvNkgwUnkr?=
 =?utf-8?B?aURuMU9jVG5EbjlJNXlGSnhwakZ5b3ViWUQvTkdHdVJYeWRqM3RGbSt1ZWpY?=
 =?utf-8?B?WjZvdkpUU20yMUNVSWFnZDAvWktDRDhEbU94M1JBcTBseXJlMkRRUHRVakZT?=
 =?utf-8?B?cXdUY21jNjgzdGVUL0JRQk01TVZIWVh1aWMyb2QwMlh2eC9TSHJBbFc1ZXJE?=
 =?utf-8?B?SmRTb3VzajNDWjNSRU9Ua0lkQ0hmVTRzMWZLVUlhQXZQcU5OalJ3R3o2Ykhm?=
 =?utf-8?B?Y29vM2RPM0hVd0VRRkF2Q3U2MDlCNWdQVkZERzd2S1l5M1ZDSlI0Zm16STZq?=
 =?utf-8?B?dEZCUnVRRTdVRmRGeHM2YWNpMS9idHZVeFJCdjM4YzZJajZjUTBOSXcyNk1t?=
 =?utf-8?Q?ULvKyIQzezxaw?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d614883d-cfee-4c61-d911-08d94921ad14
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2021 12:52:04.2645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cg/HBBIPf9JvNJsakvwHrIJ57xrb8KD0c/pBXadIIAou1sjkcwFu1NZeAudDzXYO4ZOLb11Xqha6WyYtHMUzmj11UEdHlWIxqGTTHfxvmtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB2733
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
 linux-doc@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
 Jonathan Corbet <corbet@lwn.net>, openbmc@lists.ozlabs.org,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>,
 Rob Herring <robh+dt@kernel.org>,
 Open Source Submission <patches@amperecomputing.com>,
 Lee Jones <lee.jones@linaro.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 17/07/2021 00:34, Rob Herring wrote:
> On Tue, 13 Jul 2021 13:00:28 +0700, Quan Nguyen wrote:
>> Adds device tree bindings for SMPro MFD driver found on the Mt.Jade
>> hardware reference platform with Ampere's Altra Processor family.
>>
>> The SMpro co-processor on Ampere Altra processor family is to monitor
>> and report various data included hwmon-related info, RAS errors, and
>> other miscellaneous information.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>> Changes in v5:
>>    + Dropped ../bindings/hwmon/ampere,ac01-hwmon.yaml file [Quan]
>>    + Removed patternProperties section and child DT nodes in example
>>    section [Quan]
>>    + Revised commit message [Quan]
>>
>> Changes in v4:
>>    + Revised the commit message to clarify how the specific info will
>>      be handled commented by Rob.
>>
>> Changes in v3:
>>    + Supported list of compatible string [Rob]
>>    + Introduced reg property in DT to specify reg offset [Rob]
>>    + Updated description and other minor changes in yaml file [Rob]
>>
>> Changes in v2:
>>    + Changed "ampere,ac01-smpro" to "ampere,smpro" [Quan]
>>
>>   .../devicetree/bindings/mfd/ampere,smpro.yaml | 52 +++++++++++++++++++
>>   1 file changed, 52 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
>>
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
>

Thanks Rob for the review.
- Quan


