Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E479340100
	for <lists+openbmc@lfdr.de>; Thu, 18 Mar 2021 09:26:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1Kqc3GDMz30L2
	for <lists+openbmc@lfdr.de>; Thu, 18 Mar 2021 19:26:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=mJHNCufP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.77.110;
 helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=mJHNCufP; 
 dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770110.outbound.protection.outlook.com [40.107.77.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1KqM2xCCz2yRW
 for <openbmc@lists.ozlabs.org>; Thu, 18 Mar 2021 19:26:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bd3r7fsyhYPOPRez9htyE0GipxxRVHpN5aB97/UXujzPQ9UnpOhZQNJGwEAWVYVPbX8Y8dGHg4KBVfTVCDo7XsaqcAHQzt+Q2QgIVcik3LKuNlfeptOY2BZiKFIy6rrcu9iApQjIz3/iJV8PVYzxwtlc49SdtEcR0YNNGbVzWzmEaGCzegX21GoHoaoH53NLlXPl7DL3VM2YNuOT+c9c9xtSKOcxd4S8prb92J9g8pGUEOwuvThiqlJCPemkXP8sIOk2r0y4cQhJF+O+4TaYTBrYGga9waLKziO1zuXd7JMtp4OApPcuu8mb355gHHCQSQ06Rgj1jRDBp3xgfHafWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1PGTDLQFH8RgXvab1jNJh1MMdzBfI9l9XlewoDf/Qxg=;
 b=WSMXML5qfNOLf7sFWyj0x3NQbYul/YsMchzVHTy1eDyHLZkyfPUOA5+gCbDIXj8AC1BFJKkyLYwfVOvhWrWsQiRZe76RJ2m/SkjVq4hn2nE5yR+qNWJxAHbhsUTRqdOaB4S4akTxUsvEL9MAF2QNNrcfNrPgEJOmg9XErq3x+zBsiWxl6RcqCs5YwfjoZB0iQa9/rK7X0/iiYBUGdrbY9nERycXSE8vM288Ec0jl9X2PZc30OHRZ/1JnpkRpF1Duez9LSDwzM4AykQHYdocB6CzmoX5a5G9rK6/CZdjO0z7S52Jf4Ml2ba2kH6qucYulKwktjzaNy709fByPxPqSmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1PGTDLQFH8RgXvab1jNJh1MMdzBfI9l9XlewoDf/Qxg=;
 b=mJHNCufPpq9leR80UEek8jSDPNkPiU1Aua2E5eICq5FfHirxLyC+Fjdk8FDcxujLcTqonnSrsWSe5KaYRXJC+B4DKgKaSA3M+MWJoCHwaFB+0X0LTWONQOMojKUHrWPBjEMh4eUQQCMRWWqf5x8LlbDGrJRDgpmLctLao/LsR5M=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 BYAPR01MB4021.prod.exchangelabs.com (2603:10b6:a03:15::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18; Thu, 18 Mar 2021 08:25:58 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::650e:6480:5f2a:4b96]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::650e:6480:5f2a:4b96%6]) with mapi id 15.20.3955.018; Thu, 18 Mar 2021
 08:25:58 +0000
Subject: Re: Where to collect information for Redfish System's Processors,
 Storage, Memory data
To: Ed Tanous <edtanous@google.com>
References: <925a9eba-db8f-fba0-7d17-db32860c44ba@os.amperecomputing.com>
 <CAH2-KxCUYzjckT7xEAtcdV4Q_2h4B7GdAcXw_TTqBA6O76Q7Ng@mail.gmail.com>
From: Thang Nguyen <thang@os.amperecomputing.com>
Message-ID: <1cd3b4fb-a729-52cf-e03e-1cb3b4a1bbf8@os.amperecomputing.com>
Date: Thu, 18 Mar 2021 15:25:49 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
In-Reply-To: <CAH2-KxCUYzjckT7xEAtcdV4Q_2h4B7GdAcXw_TTqBA6O76Q7Ng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2P15301CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::20) To BYAPR01MB4678.prod.exchangelabs.com
 (2603:10b6:a03:88::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from HCM-FVFX4014HV2J.local (118.69.219.201) by
 HK2P15301CA0010.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.2 via Frontend Transport; Thu, 18 Mar 2021 08:25:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fef9bf6f-8e00-49d8-156a-08d8e9e774d6
X-MS-TrafficTypeDiagnostic: BYAPR01MB4021:
X-Microsoft-Antispam-PRVS: <BYAPR01MB4021A22FAF4818A63917A60B8D699@BYAPR01MB4021.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fZMM9WWkkNKoaDha9/8GxRUub5PWytP3shzAwy3dG2G8gesYKDQTJAMBHBI89jYBx399mgy+VhoJopoIA8YVR69aF72e4LhU8SIuYG6h3/bF/XcrXsS6ta+zMhdeT4PQhbgGlj5ikpSRkrYPvcd4mtAwhzM8DDC9WzUFeENpsO3FDhbWUF8HJNV4CKgDcsJXupEHRnt4OwDtB3CWv9D1lw4uwZHaTv8IMRVRXoo8NnrXEpHbF/yF6NusVsc518Ot4GicTwOrCNwsKJ/RcKtGmyIFpWIegxqL0d0NyLUjp1F/HaRY/jGe5mEZLIAtn27Yd8xL/jFrEhgHqqXof8AUVR9fHsp5PbZa2aQ/abG77PUIuBd+rHr851Fw0FIvskMS2HC0VLkvfqCF/EpeiAS0EnNK6Um0juC1BYmetHIQTE8Bv9NDwNWpRqo2+c5DcnU2XgcswcKHvOnzaAN3D38niIfC41cyXP3zKhBQ3g3wEEMV/4BuGpcRayb6XMLGwD2h5qb63p39SNsumAaDnlfE412ArzJnZcJ/IBsKzqArqOHNf68wf5gPDCKJeNjXFJGiSAhtgU/cgPpd18aAk8jYgzOzlhwUbk9zGb6OXFKdmBkvZebPLQhgZnnOMjEMf3C3Mrv0JzDCngW+BNrdEGng/wg7yoJGzyIza9X8UV1Nm+w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(346002)(136003)(376002)(366004)(31686004)(86362001)(6512007)(6916009)(8936002)(66476007)(186003)(66556008)(2616005)(956004)(16526019)(52116002)(53546011)(6506007)(19627235002)(316002)(478600001)(26005)(66946007)(8676002)(83380400001)(6486002)(31696002)(6666004)(4326008)(5660300002)(38100700001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TVRpMnJQQllaZG5PdWtaWXU3OUFRdVMxN2RaTkplTWRPZnJ2RUlUSnJSd3J0?=
 =?utf-8?B?TU4wN0xGNVdISkEyOVJuTHYwVW0xVmJENXMvbG84UzBNSmxuZm10eE5oSUZJ?=
 =?utf-8?B?cXVNMCtJeVYxRUlURzJxeUM2U1MxMmErS1Jncmw2SXpYbnpUYnRFU1MxY1d4?=
 =?utf-8?B?blhESll4bHhReFh0T3ViY0dlc3NMU3lKS3NTaUtFQ0JjNjM3cHdzcmYrZUxj?=
 =?utf-8?B?cDQyOGRiaE5URENVVkgyOVNnZ0xNZnlPQTZUR2gwQ05zMGJQYmlXRmlyYlBH?=
 =?utf-8?B?TGh6NWdCOGk5amZxeklQYlpnNG80ZUIyaTFEUDNueUJSUnZYcUtzSzk1cTZ6?=
 =?utf-8?B?eWlWN21IZHpJR0EzanNERnprWU1qaTEzZ0oxZlB6d0taUHhjdEpWSU10TWU0?=
 =?utf-8?B?bHVNdjhESWRPT2dBZzh6TmFmb1hZKzdHZzg1dFdvWHV1SFNqQ2tpM2V4dXdY?=
 =?utf-8?B?bXFnRjRyVVl5SDV1b0Ixa3FEcDlFMHdETDVoSWlJUzhFRW9MZDZpRkthL0VB?=
 =?utf-8?B?N0VRSlFTYjIyVkJGVm00WEZlcmVYZUlOaTZIVEQzMDRZRVBQekRMczczUElP?=
 =?utf-8?B?S2pEVzE0MVhRTmdMYzdJODhuaURPcVAxbnp5Ky9KQVpWNU1LelJiRWJ3T1pL?=
 =?utf-8?B?YjJpU3RrNTVqOTlYbU16Um1LQndYMEZ6L3FNQkFWdG1idzdMcC9ubGgvOFcv?=
 =?utf-8?B?RzFrdmMwSzVqZFRBMC8yMXViejkvZmVTVzFDQ2E5eWRHSDduZ1VFMExvRXdF?=
 =?utf-8?B?MUhObkcyMkdzdWhMOWQ2bWlRVmVrRHhSZzhaTkFveXo0Nm5USFlvN0Eyd0s3?=
 =?utf-8?B?aW9Kc3hpeGNYSmVpOGdNV3MwUHhSdUV0dnpQem1oNUk2ZFViRDV5d3VxSTk2?=
 =?utf-8?B?RTl3TTVMcEh6S202b241cGNsdktNTWRmR2F6RSsvMnMzVzVDcE9MUlY4NENV?=
 =?utf-8?B?d3NIQURRdW9xbVVNaWJjVy83SVh4UE5BZGNIZEF6VWdEVHhKaUxtWTFFMWM3?=
 =?utf-8?B?UkJWcEYrTTRvYU14QVNnVmN3SFNjQWRxaFZjeDVLU1RBODJHOXg3VFdqeTJW?=
 =?utf-8?B?Tk9kT2swenpKcnJYRGd1bFhnaU45d2xqRzRxdmZPVm5DUDMrUHZLVEpvRU8z?=
 =?utf-8?B?cldBOWUvR1Rjdkw2M1BwemtxcW13UWx4RTA0VlJCdkJjR3BBeWViYWd3SEkz?=
 =?utf-8?B?VmZrSXJJWEJPdEZIdGNORzA3N2Q2eklmT2lDb0F3dGhQU0NFUURYUUdXaVR5?=
 =?utf-8?B?ZGprVkJjY2J3b1NzL0R2WldYNHVPTjFKRElmWE8xSjRmZkVRV1ZZRDZldmVW?=
 =?utf-8?B?djRlWStQUkVjaDBLSW9nR1h3TGhaZDZQbHN3bFl1WGRzbk5rT2xDcGZpTjJt?=
 =?utf-8?B?d3lvSmYrYjNHSTB1RlkxelNwUzlNNWtVdVdEWW1FVXQ5VDhib3RmdjQzc3lh?=
 =?utf-8?B?S2tTRHZQZWdaUFphUXZ6a0p0bVVMcEFMc3pMN2xjdHBMN2FKSCtLWFAwbzJu?=
 =?utf-8?B?bldQMCtWakVtTW9ab09iTGx0UDFyQ2RGQjEyUjA4YldCNGhoWTBuQ0NWaDJK?=
 =?utf-8?B?WCtkWlduTzFYQjNMK3pMalFKaUQwNHdIblUwUnN4NWdUTkthOGVuT2lZNGFv?=
 =?utf-8?B?WkpONVhKVTZYMjNpbWxwa0N4bFNBQTcwUGhnRkZ0ZFVZSlZXZjhucWh4WWo0?=
 =?utf-8?B?SXA0R29UZ0dLVWR2T05WVzlFSGZ5MmJrNmVkZkREVzdiRmtaQUs3bGQ4NThF?=
 =?utf-8?Q?MZfnJNrHLbv8GjpD+5sLS7eHQt14EDH/8LJo5oH?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fef9bf6f-8e00-49d8-156a-08d8e9e774d6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 08:25:58.3377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5iSbuZbzY5Dw2IQCfHTjzsb+Z2u0y3uCTlIp5yZzySadPrrX8yUiuK09JDUjZ121m5zrI66J3Az2iGDOf1zsverURlQsYgiZiyGpGuNHuAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB4021
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


On 18/03/2021 02:45, Ed Tanous wrote:
> On Tue, Mar 16, 2021 at 3:22 AM Thang Nguyen
> <thang@os.amperecomputing.com> wrote:
>> Hi,
>>
>> I am looking for how to support Redfish System schema which information
>> from Host:
>>
>> - Processors: redfish/v1/Systems/system/Processors
>>
>> - Storage: redfish/v1/Systems/system/Storage
>>
>> - Memory: redfish/v1/Systems/system/Memory
>>
>> I looked into the bmcweb repository at redfish-core/lib/memory.hpp and
>> redfish-core/lib/pcie.hpp but just see doGet() function to read data
>> from dbus to report via Redfish. There is no doPost() function to post
>> codes to Redfish.
> Today, there's no way to do this sort of Redfish POST/PATCH for normal
> BIOS use cases.  I'm working on a design doc for how to add this (via
> redfish host interface) to bmcweb.  If you have any ideas here for how
> this should work, or requirements for what you're trying to do,
> please, share.

I checked on the Redfish Schema Supplement document and saw attributes 
from the Memory, Pcie, ... schema are read-only. It means no POST/PATCH 
action is supported now.

How's about suggesting on supporting POST/PATCH action with the needed 
information change to read-write? UEFI will then collect data and send 
Redfish commands via the Redfish Host Interface.

>
>> My questions are:
>>
>> 1. How can Host BIOS collect information and send to BMC so that BMC can
>> report via Redfish? via in-band Redfish?
>>
>> 2. If the information is not from BIOS, how can BMC collect information?
>> What recipes/repositories are used to collect information?
>>
>>
>> Thanks,
>>
>> Thang Q. Nguyen -
>>
