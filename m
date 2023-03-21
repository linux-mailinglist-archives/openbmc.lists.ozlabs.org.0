Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D166C29B0
	for <lists+openbmc@lfdr.de>; Tue, 21 Mar 2023 06:15:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PgfvP257Sz3cGm
	for <lists+openbmc@lfdr.de>; Tue, 21 Mar 2023 16:15:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kD92QL/m;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7eae::601; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=supreeth.venkatesh@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kD92QL/m;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pgftl67RLz3bT0
	for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2023 16:15:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtG+uTCX1ZBX/6QiSFh5M2gA6crSsYoOqLQeQG4ohJXuP6jUCDVX305LeZ1ImFvWYVSYsG+Mrmo4Hl93xx0uRxDG50hWzpSIHQJZ71Nr1iPWGcXrIx6MqxIkozfh6Vq7cQQquSEyJ6K2w8osJ1RR0S3AJ7SndSoSEHlIvirUnFNFAFiz88UNxE5KI6UUp33QIall6JjCRJjM7JfDZl8Zwjl/MTBDo7gHPbp54UWtob906y3s0gXF4l0aRdvXbqE0QgwCYpqHDyiQfErxjI9gfhaof7EpltxCQUvEaFQ5atSzLYHtg6ZE+rpN9aX6qhTSyhryFddkgjKcNLc+dZRyDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFpU000dQl+MYFG68j7u+61uvzPPeFODsyK46ovkHYE=;
 b=BNzj0jimpGxF5SxzMDSG2plCNzoV0JZTCz5wIK9J5Hv6Cylw4EuusnTqiQwFx+TErUFnOGusW9NBENPtSsS0GLsAAGl5SORZEuJGLSzrT36I0c/zR6z/ukcwuSGmzcv+whZwfNJ+GqwYkwxzSOCIu9jWLYe2ubCWpvN1XzXU0fhH3zJE9zqrfeefaBt9x35/jv5gbNWUu5IMGYvoFi/SaAwbrPKQ4uZmVR0sd3N8PjuDX5aTzl+UN8qAQcp/zw5aB3OGf1xjVrxwh1NcSNJ3s7XNF7ENtmFwbwMaPLBsR2torFH7vyP+g89eeD0VEZ9grA0OKyN7Y8ClFWED9nOoHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFpU000dQl+MYFG68j7u+61uvzPPeFODsyK46ovkHYE=;
 b=kD92QL/m+virTorKClVV5E73Rh6bR4GynAwA75qSKBMfXpH2rq94fASY6/zJ0Ls50FQNQUNKzz8DOZGiS/BrT3HYzCrF4fLPpk/5Jnw2aN8HwbryqcZ4jFNExPlqc8vhAwTcfoIHs/Z/tUMlorhgDLpCeyDCQ1y34YdvqgRFAcE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4752.namprd12.prod.outlook.com (2603:10b6:805:e9::10)
 by SA3PR12MB8804.namprd12.prod.outlook.com (2603:10b6:806:31f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 05:14:48 +0000
Received: from SN6PR12MB4752.namprd12.prod.outlook.com
 ([fe80::8465:3c53:e5fd:9028]) by SN6PR12MB4752.namprd12.prod.outlook.com
 ([fe80::8465:3c53:e5fd:9028%4]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 05:14:48 +0000
Message-ID: <07621845-19a4-0568-be0e-f556ba40b813@amd.com>
Date: Tue, 21 Mar 2023 00:14:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [RFC] BMC RAS Feature
Content-Language: en-US
To: openbmc@lists.ozlabs.org
From: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0398.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::13) To SN6PR12MB4752.namprd12.prod.outlook.com
 (2603:10b6:805:e9::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB4752:EE_|SA3PR12MB8804:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f450268-de4c-487a-b489-08db29cb314d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	MU5t5H/LdDEJVH9ouix8nxuHuTBXhWnntPwkoAVl/AigM/qbmtrCsna9+TyX4a6pMOh/dhpYF+oTNx0nzk+FD+RaUhQwY/XDNlv2XyRtFLgBfUOlM/cZ83fberCwSPlNybSeEiJPr8ctoCrHVk7s8naaCglmM+nYzIT/GihHhEM5sdoTl5zh0FYe/8Qr5nzJ6OJrQTLa9u2mKPQyk4bXd4CRjwHXMH/6xpT5zFSrLK73e6sqOG73LeueJDR4kf46LX1qMgN3Bki2c9SByVfgC3jo5rHySLKfNYvI6el1jliK4YM3wbbJYU/j0+jHVEE7RxwNzIlyAhr59kK+PakMVDs5Lgji7tnkNEPE9/4W3qjrHyBm/xUj+SLzvHPiySAeqXIqlTWWVJXNbGJJ6uFUxho385Y57xhYABL1idpoNXO6e8D9kB1EV3OvRl8EJnvS0wZPFLk+esrQ4mlfqadOSvdR0UL7FNv/1JYzgldkk5G/RSIVbt7ORvXV245aLct2ryfSz74lXcyJnsyv6mdovZA774R7PhUngPVotxsTBlit0cY1psn+7Fy/DCdiqBiGPFPyDrFOcD8duHjCE7uMhlgHKU/D0tn2KBnpyj7KEEo4u+jIbwC/3YMMLQikAL8hoyWiKB2Iqlo9VZFRE2NBkzoXVT/PUqMlmGejswd4Knkigrp1jBrLeO2VB4YkS3bS1WUhvhHjRH4Vip7KMkezTWkI0SrTVNN+xXTpVPvqQAI=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB4752.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(396003)(346002)(366004)(136003)(451199018)(44832011)(8936002)(5660300002)(41300700001)(4326008)(31696002)(86362001)(36756003)(38100700002)(2906002)(83380400001)(6506007)(31686004)(6512007)(478600001)(6666004)(186003)(6486002)(966005)(26005)(8676002)(66476007)(66556008)(66946007)(6916009)(2616005)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?aWdZem8xYWx6VWpSc09id0RiMnlUR1UwSWJTVGlzRlpSYU9HeUtpUUdFRkpn?=
 =?utf-8?B?cDczRTFIMjg3aHY0MGFHZ3ZUK0hmaEsweGk1U01CR25Eam05RnZFeHZ1cElS?=
 =?utf-8?B?cEJzb1pYWU1SQ01LRDU3d0J1OFljUHl4cGpxcjZCanErYlQ1YTFPbTJGNmNn?=
 =?utf-8?B?VWhuWVA3ZEp6ZkhMU1AwT2FKMElwTUxiZ1VKckFYRGE2T0tLWHlyS003cE0v?=
 =?utf-8?B?TWg4eWVqa2wzcmNERUYzQVhaeG5pOVcrc21ueWlYaDIxdjFZaTU2SktodURo?=
 =?utf-8?B?ZlROVHN2WHZuOGFYT3BNVXRLSGRIZWV2OUdTWkZwMmhEY0VhWDVzNjlEMkly?=
 =?utf-8?B?TWptN1JBek92dThSam9IQVgyN0ZkNW5EZFc1b3pwMzJ2dU0wOExjQ3RTRTBJ?=
 =?utf-8?B?VDRHT1I4MUpiVkNIVkdrb2JoQVZRNU9lMG4zVzhCWkhSWE1hRkMxanR6UXBi?=
 =?utf-8?B?Nys4ekUzdCt3Q25oMDQ2YzVJQ0MzZ2JTd1l2UTBaZVJ3NW1MdzFZSlFWaDJN?=
 =?utf-8?B?OG9ZbFJsNnBJOXUyakEvMjA1ZGRyK0NJRTY3M1hROFo3dWd4L29RcEsrazMw?=
 =?utf-8?B?WmljUnV3T0ppRmg0dXpRRG1RN0NMVVBiOS9mbjFBUURqRXova2ZZUUhETEtr?=
 =?utf-8?B?OUNmNVpMWWFNdmtTWTVQVDNjOGx3WGErc0hXenNmajByUXM0bmpNVkEzMktB?=
 =?utf-8?B?eFg1SEZnNzcvYmY4eVc1SGI1RW1kaUlFMVpQa1BkT2V5bDZXczJFcTk5d3V6?=
 =?utf-8?B?cVpINzNmL0E4RjNmZlYxMjVjQ1A1TVRvVWhXc1JLMXNZa3pIeHdXMEJ0M3Vs?=
 =?utf-8?B?YUhQamdSWXBNV0IweFowMTZVY1BKUVZuTTVrSkxib1pWbi9IZXl3K0Y3cVVu?=
 =?utf-8?B?ZnEzZHdwOWlOUXBNUDcwRVZsWEtTVngxRWxsVFhEdDJqL25IN3llY0Y0YmxF?=
 =?utf-8?B?YzlONktpcU03dG9CWUQwanZXNnZhRDkrNXZ5ZFhOT0JBdytUa09pU3h1NXVH?=
 =?utf-8?B?cXFJQjMrVExIM21oRmVCSXltdGZBNmNwOC9rRW8rSVhoL3pSd2tDczNSZkVU?=
 =?utf-8?B?OFp6RFRLZ2JaOFhTYjY0eENndlhuWmltdU1NM1JyajZJRnNWV2xQd3B2YnJz?=
 =?utf-8?B?N2NUK21Cc1B6TG5ZdE1zSk1keEJHWnY2V3V2cUhsazRNUHBNTnhlRWViMkJM?=
 =?utf-8?B?VVBFdTdSaVJMYmRrQmFhM3ZvQndqYnNQNmptY1Zyc3l5c0NOSXlZbXZBenI4?=
 =?utf-8?B?UkhzUDZLejFHYysyc2ZtMXpiZU51c3Y1NjcxMEJTL0dRdS9KSWw4d2o2OTBQ?=
 =?utf-8?B?ZnFWUlViWGpMT3luR2Z4MUtQYVYwSDVLck9sQTdTYzdVeU1Pd0xaOUIzVjNk?=
 =?utf-8?B?NmJVdHQrZzJkSXJpamhrMlpGRmJTa2NzbEMvVjRRa3NoNFlGOXptNFY0bTFJ?=
 =?utf-8?B?UTJOTXBJcmtEOTM5dmt4eHdTeTFKcmtTNld1SlpBZlkxR3FnMHZyNmdxRUEz?=
 =?utf-8?B?aHBRUVdqejdBYzh3b1lGTkJlV2VJLzlDYWoxajBGaGhCNkVRemhHeUYwNHlX?=
 =?utf-8?B?Z2lhWk8xbU0wQVZCTnkvVyt0bk9weWN5WWNZYk01SmU5YXRaSFdnaFcwclRk?=
 =?utf-8?B?U2xKcHNoZnFVSWRzUXh0OGh3QmxGVzVSbzVpbWFHMmRoRmNBaFdjL3FTMmdn?=
 =?utf-8?B?WlVVMi9SMHExYTZiWFB0NkZkOG12ME5MeGc4VEZwdTYxaFJ5M2hLbzVNQ0Va?=
 =?utf-8?B?RGdiWXhwZjFkOXNrNVJ5cmZLN3pwdENQd1F4VTJWcmpXeGxvK3I2RTJIMk8z?=
 =?utf-8?B?VHZZR3RnRVBTSlFLRVF2OTdEYnhDNFd6WVFHaHpSSlVOQ2U4aUxIbUxMTEhS?=
 =?utf-8?B?cXE2aUlvcFk3aXVHRVZnUDhzNUM2SXhtM1dLN0x5SUJ4dDE5dENzUmVaRUp3?=
 =?utf-8?B?eHNQL29SY3VSUVhZRG5INGRQeUFTdnZlaXRMSDhha0N1SVBuVFBjTk5Nai9O?=
 =?utf-8?B?MC9yQzVBWnpNdkpsMjh6RE4zbkNEZUR4L0NXUlpFRlk0MVBZQ3hmUTlJcGY0?=
 =?utf-8?B?TjhpclFzVlZVdDRwck5NbmVMeWN4SGlpdy9DRThoUDZMa3VKZWRpbFh6UHp3?=
 =?utf-8?Q?7VUuSYhdFVhb+jUxhcgzpnjQV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f450268-de4c-487a-b489-08db29cb314d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4752.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 05:14:48.7364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QkZDV9UUMYzC+W3qgQwjrDyyFe72K42fyS8nlSE2M4o73dUCG9d6Sx2yDNZzpV5qumA7dcZ5DMOsl3VlV9giFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8804
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
Cc: Michael Shen <gpgpgp@google.com>, ed@tanous.net, bradleyb@fuzziesquirrel.com, supreeth.venkatesh@amd.com, Abinaya.Dhandapani@amd.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks in advance for your inputs/feedback.

##Purpose

Gather feedback on the BMC RAS design so that it can be used in 
processor agnostic manner, find collaborators for refining the 
design/implementation

and request for a OpenBMC repository [preferably bmc-ras or oob-ras or 
bmc-crashdump or oob-crashdump] with the initial maintainers

Supreeth Venkatesh [Supreeth.Venkatesh@amd.com] and Abinaya Dhandapani 
[Abinaya.Dhandapani@amd.com]

### BMC RAS, Crash dump

Author:

< Supreeth Venkatesh>

< Abinaya Dhandapani>

Primary assignee:

< Supreeth Venkatesh>

< Abinaya Dhandapani>

Other contributors:

Created:

<03/20/2023>

#### Problem Description

Collection of crash data at runtime in a processor agnostic manner 
presents a challenge and an opportunity to standardize.

#### Background and References

Host processors allows an external management controller (i.e BMC)

to harvest CPU crash data over the Vendor specific interface during 
fatal errors [APML interface in case of AMD processor family]

This feature allows more efficient real-time diagnosis of hardware 
failures without waiting for Boot-Error Record Table (BERT) logs in the 
next boot cycle.

The crash data collected may be used to triage, debug, or attempt to 
reproduce the system conditions that led to the failure.

#### Requirements

 1. Collecting RAS/Crashdump shall be processor specific. Hence the use
    of virtual APIs to allow override for processor specific way of
    collecting the data.
 2. Crash data format shall be stored in common platform error record
    (CPER) format as per UEFI specification
    [https://uefi.org/specs/UEFI/2.10/].
 3. Configuration parameters of the service shall be standard with scope
    for processor specific extensions.

#### Proposed Design

When one or more processors register a fatal error condition , then an 
interrupt is generated to the host processor.

The host processor in the failed state asserts the signal to indicate to 
the BMC that a fatal hang has occurred. [APML_ALERT# in case of AMD 
processor family]

BMC RAS application listens on the event [APML_ALERT# in case of AMD 
processor family ].

Upon detection of FATAL error event , BMC will check the status register 
of the host processor [implementation defined method] to see

if the assertion is due to the fatal error.

Upon fatal error , BMC will attempt to harvest crash data from all 
processors. [via the APML interface (mailbox) in case of AMD processor 
family].

BMC will generate a single raw crashdump record and saves it in 
non-volatile location /var/lib/bmc-ras.

As per the BMC policy configuration , BMC initiates a System reset to 
recover the system from the fatal error condition.

The generated crashdump record will be in Common Platform Error Record 
(CPER) format as defined in the UEFI specification 
[https://uefi.org/specs/UEFI/2.10/].

Application has configurable number of records with the default set to 
10 records. If the number of records exceed 10, the records are rotated.

Crashdump records saved in the /var/lib/bmc-ras which can be retrieved 
via redfish interface.

Format of RAS/Crash dump record below

Sample CPER file on fatal error:

_Configuring RAS config file_

A configuration file is created in the /var/lib/bmc-ras application 
which allows the user to configure the below values

AMD specific configuration fields below. However, this can be 
_standardized_ based on the feedback.

“APML retries” – Retry count of APML mailbox command

“harvest PPIN” – If enabled , harvest PPIN and dump into the CPER file

“Harvest Microcode” – If enabled , harvest microcode and dump into the 
CPER file

“System Recovery” – Warm reset or cold reset or no reset as per User’s 
requirement.

The configuration file values can be viewed and changed via redfish 
GET/SET command.

The redfish URI to configure the BMC config file: 
https://<BMC-IP>/redfish/v1/Systems/system/LogServices/Crashdump/Actions/Oem/Crashdump.Configuration 
<https://%3cBMC-IP%3e/redfish/v1/Systems/system/LogServices/Crashdump/Actions/Oem/Crashdump.Configuration>

Sample redfish output:

curl -s -k -u root:0penBmc -H"Content-type: application/json" -X GET 
https://onyx-63dd/redfish/v1/Systems/system/LogServices/Crashdump/Actions/Oem/Crashdump.Configuration

{

   "@odata.id": 
"/redfish/v1/Systems/system/LogServices/Crashdump/Actions/Oem/Crashdump.Configuration",

   "@odata.type": "#LogService.v1_2_0.LogService",

   "apmlRetries": 10,

   "harvestPpin": true,

   "systemRecovery": 2,

   "uCodeVersion": true

}

_Dbus__interface for crashdump service_

BMC ras application is started by the systemd service com.amd.crashdump 
[This will be changed to generic service name based on the 
feedback/interest from the community].

A dbus interface is maintained which has the config file info and the 
CPER files currently in the system

Which can be downloaded via the redfish interface.

The service name , object path needs to be renamed instead of OEM 
specific names as all contributors can use the same service name and 
object path to pull the crashdata.

#### Alternatives Considered

In-band mechanisms using System Management Mode (SMM) exists.

However, out of band method to gather RAS data is processor specific.

#### Impacts

Since crash dump data is as per common platform error record (CPER) 
format as per UEFI specification [https://uefi.org/specs/UEFI/2.10/],

No security impact.

This implementation takes off the host processor workload by offloading 
the data collection process to BMC and thereby improving the system 
performance as a whole.

#### Testing

It has been tested on AMD Genoa platforms namely Onyx, Quartz, Ruby and 
Titanite.

Further testing support is appreciated.

Thanks,

Abinaya & Supreeth

