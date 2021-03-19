Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 975393412A4
	for <lists+openbmc@lfdr.de>; Fri, 19 Mar 2021 03:14:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1nWz3n4Wz2y8H
	for <lists+openbmc@lfdr.de>; Fri, 19 Mar 2021 13:14:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=QERw2wxW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.68.114;
 helo=nam04-bn3-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=QERw2wxW; 
 dkim-atps=neutral
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680114.outbound.protection.outlook.com [40.107.68.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1nWj55blz309d
 for <openbmc@lists.ozlabs.org>; Fri, 19 Mar 2021 13:14:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AjnJPPw7EtA2c/FGnxg60P1mzvXC9l+rb9iU/SVUjQtJgsZ7yuyBhsHGzPKbwWhxRd96U3FhkaCiKzx+rpO6wScDZLZuy09sPimKRq4oQFg5pJS5rVW83O1Zj9o1jBgAZ6E1quKCBLPZwfwQ0XxOFocLZiRXfOOt7OFqurohyq4hbzlbTlOn3Ot+ATL/pCj0qUDQKozMzN5sv5e4PfyV9v4mz17dj87AmMxFyTMt8B6ObfNad0TcxGMViy5ht8JNPvbZITUWIXnIrs2+8Ijtnaq2fBDOQ+moQBnR9g5OKwkpxGMAZ9pW5rVluKBzUnZt7ps5sxaWoZkXn/vbmzqDKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1koxgsI0DpcUGOLo2TEGKimwcW6uj+G8sz42Q2bxTb0=;
 b=joEeWPsR+7O4GbP1xUv0rEieKaISkcdIYs5Sx7YnImCLNiMCfZz6RCAQI3A1TE8EOMbRYuck2uEb2yNcpSnshZ1JKWqT4wstIYcxuH+w5rhIhD78GMmIkPoMdXIHGNlszZqYyY3k0FWMLIGOzlBPfU8jTa7yDPuZuuJbpwh/X49Ay64flXMarzeofiEpz8TbOdrqESnLH16N4U1MaQbRFHDmrTZdQXcw35yiW1jCNllEp7+XyoCteXMssmru7AmuY0lDCZiw1WE8fCApDmfXOSbt1MbE/rCjUdNDOAz2lK/YzxQt771i9ZohBp+NLucUBNNyy/NoNkJiMY35VEWn9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1koxgsI0DpcUGOLo2TEGKimwcW6uj+G8sz42Q2bxTb0=;
 b=QERw2wxWuI2cSXDxlGdsZNAOfKCeVzyLMa0CZ2y9DAXDDMCEpUIwp+KXvYKyL462EF9kVM8j0DsG5gYBG4pCxFXpAa5qHtOnmIo0ojg77cjkK3ncrbXzM51p8SAAitsVC9UjAgSygxyZHlNk1Opq1fgY3mE/mZmaAQSlNwcwSZE=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 BYAPR01MB5447.prod.exchangelabs.com (2603:10b6:a03:120::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32; Fri, 19 Mar 2021 02:13:59 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::650e:6480:5f2a:4b96]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::650e:6480:5f2a:4b96%6]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 02:13:59 +0000
Subject: Re: Where to collect information for Redfish System's Processors,
 Storage, Memory data
To: Ed Tanous <edtanous@google.com>
References: <925a9eba-db8f-fba0-7d17-db32860c44ba@os.amperecomputing.com>
 <CAH2-KxCUYzjckT7xEAtcdV4Q_2h4B7GdAcXw_TTqBA6O76Q7Ng@mail.gmail.com>
 <1cd3b4fb-a729-52cf-e03e-1cb3b4a1bbf8@os.amperecomputing.com>
 <CAH2-KxDv8jgFP8gRQgGkKruUk-scUOr5Mja6NkTgO4ODGGnmvA@mail.gmail.com>
From: Thang Nguyen <thang@os.amperecomputing.com>
Message-ID: <a1063850-c42c-ccbc-e3b1-34211f6e766a@os.amperecomputing.com>
Date: Fri, 19 Mar 2021 09:13:48 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
In-Reply-To: <CAH2-KxDv8jgFP8gRQgGkKruUk-scUOr5Mja6NkTgO4ODGGnmvA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HKAPR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:203:d0::15) To BYAPR01MB4678.prod.exchangelabs.com
 (2603:10b6:a03:88::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from HCM-FVFX4014HV2J.local (118.69.219.201) by
 HKAPR04CA0005.apcprd04.prod.outlook.com (2603:1096:203:d0::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 02:13:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0c6178e-88f5-4c36-671e-08d8ea7ca846
X-MS-TrafficTypeDiagnostic: BYAPR01MB5447:
X-Microsoft-Antispam-PRVS: <BYAPR01MB544701CA8DFE18F2B6E655778D689@BYAPR01MB5447.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S+DTMEo0KOA4YnJqiyQLAAQmAfpqcFpc0Toj/9stTjXmOSwJ7xMAFTI4g2sm334TsWNyx8b2XCDijGjiQHok4gdtL6B8UDWlDG8tHQvb4vJ6TKPAYle/MEedYi3kd+kju/6T9CMVYkxalTTOwFHccv89gxgMDdFwuozuBzvLE3BgKJfBmkAnnYAXv+IvsxyJa0u2PLA4OVWn0zjNfGG4fFe8A3IOIeMwxXMtymBNoJVM3zPZGz+MOmoGb1D2Q+3SyIqFAX/oSFTR28Hlji2dGAYahsyJ5Trn2upOpS8peoWCGi+at/J7JQ5LnrWLNXZTQg66LDLj290F9bx5ONZz+OCf2S77BEKaLOHtuLb6wJOWB2RyM4yDXV7yEjJOSPrqCWNQwyRIeTuf9l0zJ4Ttjrj69/xBUn8gyncTWV4leCXERyt3VEgAKcFV64TTi56jLRefilK8vagC9utk3xgS5uSFz0NBtS/TiK7rFyIuiko1wcpJdG0qzwXTmQf8WH/YabJgAgfABhkLVK4ieUsz31bCIHoryNg3jfqR0I+/kilSLeFamzQ9V+O6j5gtWVh5nDMyvKOjIb36i66fT19hwg1vBRHvkC+BsKl0NShWEl7Fr0iqgReECNX3RrAgLvDAAIhDa1Qjk/I2EQUAyPEMZaF4Jt0ZbRCGErawARy/v4q63K56pN5Np8a7A18KMiAI/VyN4QmUQVS9fW/kRwOZMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39850400004)(366004)(136003)(376002)(346002)(5660300002)(8936002)(66476007)(66946007)(2616005)(186003)(16526019)(52116002)(38100700001)(316002)(6486002)(6666004)(86362001)(31696002)(26005)(66556008)(478600001)(6506007)(83380400001)(4326008)(956004)(6916009)(6512007)(19627235002)(53546011)(8676002)(2906002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RjdGZG5oSERtemhjdEd2Z2pIbDRVZHl3YXpTL1FXZDZyalJKM1dyWkhieTBj?=
 =?utf-8?B?VzF2a0dhK3ZwMFZQR1YxbTFsanZLZDd4VnBjRVZjVVN6c3ZrN2JzMWw2Zksy?=
 =?utf-8?B?dUpZSVM0WVpCbHNkMy9WdGhTRmpsTW0zb2RXZVA4ZjBhM0JSVFl6UmdqR0Jt?=
 =?utf-8?B?dzUzR0dMRXZXZDFJVnNJMWl2RVM4T3BtaXNreVFpNU5KTmM3YTVORVJWWHNq?=
 =?utf-8?B?SVVNbU1NbklPTFBtL0F1VFluUHoxdnFBM1VBT3ppVjVwVE81RUs1UDR4OTdk?=
 =?utf-8?B?NFFuMU1Vc2lNSVp2ZVRyTzBheW41eTh1TlNwSjZzajJTT3d5NHMwdml1UXNn?=
 =?utf-8?B?a3k1emJKRHBUcEliYXVqalJtbzZYUlZyNHFYZ2F0MUdKVnZzZHBTVkNrem9R?=
 =?utf-8?B?bmIxOW4zRlZEc0ExTHVZcWc0bHdMbEQzT21qSGVMb0hTSExKRm9mVVpiaVJo?=
 =?utf-8?B?KzlkQ0RBOFZQeVFIaThMVHp6NnV3WDdrd1lVUmkrOGMzUTdJUmVLbzJuNm1B?=
 =?utf-8?B?QXlxK1ErUEdacGc2Ly9aSFFROFM3VE53QlB1aGNlNE5QdDF0RFNQMTAza3Ew?=
 =?utf-8?B?UXlpcitheVVQTCsrVWFkZzNHTk1iNm03TUNvTkZvSS9vRlU5Wm5XNExrWE13?=
 =?utf-8?B?OW1IWU4yekxJSTQ3dm5RRno4d2kvZXpoQjVZUFN1elg1NnpySkJyUG4zVHNt?=
 =?utf-8?B?VWJPb281VFk2US8rK1F4azRLU1oxMnFUMXlJcFh5NlBIZS8xYmtYQlJYbmNM?=
 =?utf-8?B?V0l6a2kzbGtDUzFyb2IxaGZtVXpnTEhDbCs2dTY5RVdqVmhmTEpSdFN4cG9I?=
 =?utf-8?B?REVXSHhSVi9Nc01HVHJVY2JlT2VlQTFOSmNvSkV3USt6cks3RTl1NTluekZv?=
 =?utf-8?B?dXRENUoxZE1CWG5pdUU3amdUVXdBU0IvbkJPaHpXa211M1pFQjNSa3U1NU1m?=
 =?utf-8?B?NUpPZjhJZzJiYVc4NFduMXhyTVhMQUwyWlRaWU80dFNJc1NtNWRhUVpFYTBr?=
 =?utf-8?B?bngrTXVCaVdjWUdKQ1p4aTNFajIrNUxVMXdRQTI2Rkl6UExHdHlaOVFuekZG?=
 =?utf-8?B?WGU4cXZFdWZubFpWZGpGNDJOcm0rZGptY2tDOGdMNmo4Z0hNcWZhTU40WTlU?=
 =?utf-8?B?SlFHY2FBT0RhRFl6TkprWGw2R0lzZC9sdi9tZEwrSVlqZTRKSmJ3YzJSSWFi?=
 =?utf-8?B?Yll5RE54RDlpUGYzbENuY1VyaEN5b0MwU2txMkU2dmlXcTgvU3NBZVBTN2FP?=
 =?utf-8?B?RUZQbDRMTit5dlcwUkx0V3NFM2pRYU9WOW5ZWVZoQ1B3ZVgwcDVTdkxFSXdH?=
 =?utf-8?B?MzNRSlR3cUxLcDM0WjJ5SHIwcC9IZU5tcFQ4WTZMVUZiZEpPcFRWNW1uOHM4?=
 =?utf-8?B?eGszcDJwSVRNRFJXS3Q4enVIb1hTOU5zblpEQmEzeXdtNGNpb2FPYkxJSDZ6?=
 =?utf-8?B?b2lqUWhMeDNQc1FGTDREOW85WSt5b29lK3pVaVh2enJNUXoxTGVXc2xMclFT?=
 =?utf-8?B?Ym9KaHNqMktJUzc5NHdSNG1CQlcwT2p5enpzZnhhQVJlV08zZG95Z0JhTGd4?=
 =?utf-8?B?MWpBUmRzZU9EcmZOU2c4YjIxK1JCNHJJa0MzUzFOdGRsNW90SzZNQ2Uyc2R2?=
 =?utf-8?B?QlJERmY4NVpxNmlmcytvVjFZZWpQanJvZHh4a29FN01hM0FiWWdnWnFmOVlz?=
 =?utf-8?B?VXprR0ppcUZuQWFvWWtDNnlyN0liZHlBZmpodDJlQ0drRW1Wemc5TFlUYzJB?=
 =?utf-8?Q?6+prlq4aqT8kmsEVxtLcAs14nOuZKyk0DmFnTzl?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c6178e-88f5-4c36-671e-08d8ea7ca846
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 02:13:59.4154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DztWhhC9F2cZNJDHIbIj7LSCA78lVDWiV3xl4r9rKcgtneFCmL7ehHorrAoV9ejlyB3BS4DbcG47TbQy/v5Nufg17wG/CiuGTqMshOvlv6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB5447
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 18/03/2021 23:07, Ed Tanous wrote:
> On Thu, Mar 18, 2021 at 1:26 AM Thang Nguyen
> <thang@os.amperecomputing.com> wrote:
>>
>> On 18/03/2021 02:45, Ed Tanous wrote:
>>> On Tue, Mar 16, 2021 at 3:22 AM Thang Nguyen
>>> <thang@os.amperecomputing.com> wrote:
>>>> Hi,
>>>>
>>>> I am looking for how to support Redfish System schema which information
>>>> from Host:
>>>>
>>>> - Processors: redfish/v1/Systems/system/Processors
>>>>
>>>> - Storage: redfish/v1/Systems/system/Storage
>>>>
>>>> - Memory: redfish/v1/Systems/system/Memory
>>>>
>>>> I looked into the bmcweb repository at redfish-core/lib/memory.hpp and
>>>> redfish-core/lib/pcie.hpp but just see doGet() function to read data
>>>> from dbus to report via Redfish. There is no doPost() function to post
>>>> codes to Redfish.
>>> Today, there's no way to do this sort of Redfish POST/PATCH for normal
>>> BIOS use cases.  I'm working on a design doc for how to add this (via
>>> redfish host interface) to bmcweb.  If you have any ideas here for how
>>> this should work, or requirements for what you're trying to do,
>>> please, share.
>> I checked on the Redfish Schema Supplement document and saw attributes
>> from the Memory, Pcie, ... schema are read-only. It means no POST/PATCH
>> action is supported now.
>>
>> How's about suggesting on supporting POST/PATCH action with the needed
>> information change to read-write? UEFI will then collect data and send
>> Redfish commands via the Redfish Host Interface.
>
> That's effectively what I'm hoping to propose.  ar ethe Memory and
> PCIe schemas the only things you need?

I think the following information should be sent from UEFI: CPU 
(information in SMBIOS type 4)), Memory, PCIE, Storage (SSD/NVMe, HDD, 
...) and firmware information (information in SMBIOS Type 0).

I see in some hardware designs, there are I2C connections from BMC to 
DIMM SPD and PCIE slots. I wonder if we can have alternative way to read 
DIMM SPD and PCIE devices information.

>
>>>> My questions are:
>>>>
>>>> 1. How can Host BIOS collect information and send to BMC so that BMC can
>>>> report via Redfish? via in-band Redfish?
>>>>
>>>> 2. If the information is not from BIOS, how can BMC collect information?
>>>> What recipes/repositories are used to collect information?
>>>>
>>>>
>>>> Thanks,
>>>>
>>>> Thang Q. Nguyen -
>>>>
