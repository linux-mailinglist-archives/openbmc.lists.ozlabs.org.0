Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E5D6C3523
	for <lists+openbmc@lfdr.de>; Tue, 21 Mar 2023 16:08:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pgw3f2fBRz3cfh
	for <lists+openbmc@lfdr.de>; Wed, 22 Mar 2023 02:08:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=vDh0+OlL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7e89::60d; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=supreeth.venkatesh@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=vDh0+OlL;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pgw305j25z3cGk
	for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2023 02:08:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DviQWsOeGy8FbiV8L504MuwhKhFMjTAe+U/G0wdXzac2RxFdOSedmEgPDotDa4HD65RxrW4mJ5azZopiURfMVvFo3qYfyOQbjZtEBsz8GulTzZg8PS38s/haqeKhjxhPbLzqpg+N7DUN+YT+llxYcnbZ0vosaox0DVbPSXI8OF46neib2IQ/J+P88Oob29Liq6IfZnqoPm5OxyZb4oHhauze4sddxydy2soRC9fr8k0VyZgdOKcYRBoRrE3exfU0d65acv6s9KJXIRxD2f81esKYeeErOd+aoI6M300a31BUP8S9SdK953biKlPRBJ5sc1BOlHAcjaB615n8c5t5dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMKrzOWAzntJQ5AMyYs+Ujct0/M0EvFmb8sqiNFuA2E=;
 b=KIZPRhb7h/ucocjvwtFabGXYiVRMWd6Up7h/BAlKiwd/DvMGeBrrCPp09nSbL7KanL7ZkwbsEyBpe3F47jo/ZgrBZFYVMGHLKyt8luJ1zbsDmXRaRWToKUCquYwte0K56SBhM+Ve+ACw348U5teZ21BPCDEcvQiOGvDrWKpfqX0DX3fecIdhnB9yjjM4BMUaVhZXubYooPtQPmM1Z6nEgkGif6n0UN4rhC8Z4JiB7S/70gAxVo6xnFpRjFqQMnhtP7GcstfIABfId1zAb6A3yYwUSm50OsZtyK98k4BIyf/Fx69+3a3bPBG4GV7tt3dckBI6/H+MOHCkXoLQqmCbhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMKrzOWAzntJQ5AMyYs+Ujct0/M0EvFmb8sqiNFuA2E=;
 b=vDh0+OlL9g+Kj+Wg5smGW3ZBiUjhkvT1/05tB66jCceyxyIRsgIImrsoBOXiRR8oC7/VCKfIW7Gd3AsKgGep0hoQVJ2SOUr+N7BYAWroos5zJheTI31TpbW0Y8Hs7PeQJdelmJyWUASFeH9jm4/XZJvpbdi1LABV+F48K6sumaA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4752.namprd12.prod.outlook.com (2603:10b6:805:e9::10)
 by CYYPR12MB8962.namprd12.prod.outlook.com (2603:10b6:930:c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 15:07:46 +0000
Received: from SN6PR12MB4752.namprd12.prod.outlook.com
 ([fe80::8465:3c53:e5fd:9028]) by SN6PR12MB4752.namprd12.prod.outlook.com
 ([fe80::8465:3c53:e5fd:9028%4]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 15:07:46 +0000
Message-ID: <255d7c9a-ce17-bbe1-7312-990d0221cf36@amd.com>
Date: Tue, 21 Mar 2023 10:07:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC] BMC RAS Feature
To: Patrick Williams <patrick@stwcx.xyz>
References: <07621845-19a4-0568-be0e-f556ba40b813@amd.com>
 <ZBmJpxTnEVVpfsz2@heinlein.taila677.ts.net>
Content-Language: en-US
From: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
In-Reply-To: <ZBmJpxTnEVVpfsz2@heinlein.taila677.ts.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0352.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::27) To SN6PR12MB4752.namprd12.prod.outlook.com
 (2603:10b6:805:e9::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB4752:EE_|CYYPR12MB8962:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ada3eea-4802-4637-8130-08db2a1e0771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	K+qtlQgxiXCA0tRwZWDOAyd5F6XE/587BZCpbQsXS7UUjNeqdc/6UlfF3WWP/s2bNrnHhp3+8XZNwikWOexpbKST+55dANNHaTbu7R6HElU2IlMgHqMEgtTGm0sCJVQca3xaAK7bVHgE0do1ivc//9h5p1rNlHR08GwqbsC9vivzzQiRDmT5BV693im8f9AYIqkb6T41JndeGg+X62eiIb3h7WdH5ZAm2sbCnJxv+Aqp7qJWM1acA79pZm/MroRJREW8Omak4aDOrmuUD5zAE9LV2VN5KR5WTgh6vGXD6V5c7trzRTDc06Q7H69Qxb5Dpjixrz2TQvAuCO5U2OfhB/e9xh4fbX/3/Fk93VfL2xxNWjc1RhmfOKJHLvXYAndWohxOjppa90nhx9Rco3g9jecTgBlIRw9u8zsCW9cgUF1EezDe+IF0cgWfEdewEoTWyFLxA/SJto3MYd9o2Kge53vVUWSe4T+iI6SmnfAJb/lPrOxNzgCIQ13QcB0ZFDr76RCzFCeqhA2WS1dMj9xej3S7C7nvn4+V3CGuIuCYZRY2KBQkjwnr7pB8ShrW6gHV2oHuMe+WNaLvENn13CBl8FfrvkheuJnfoQpmXg1nbdzbMP0t6KtM/c02ABtDDKU34amlMJ5lC9XViG9pcd5YGP5b7ulQBkbyNfCcMOCbwIelH5EbPE0clzcSirO9pMFv+RsuBaMp2nT+ts//kKK9kZt8Wn7+3XIe8bmmEpI7GtU=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB4752.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(451199018)(31686004)(2906002)(38100700002)(478600001)(26005)(2616005)(316002)(53546011)(186003)(86362001)(31696002)(36756003)(19627235002)(6666004)(41300700001)(6486002)(66556008)(6916009)(5660300002)(66946007)(4326008)(8676002)(66476007)(6512007)(6506007)(8936002)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?M2daMTMxMTV0dU5HZG9wTnVkOWNCTWdMWkljL2NkSUxWVytERjhFQVBNUGc4?=
 =?utf-8?B?Z1g5Skd4VUZpUlNpV0Vzd2RNYjhveUVNelVmaWhaQW50ZEc5QWMxTGo4aExa?=
 =?utf-8?B?eGhqZ1ZKS0RMTDBLb3NMbGNaTlZuWUpYMGlPRmlldU1HZ1BTMXAvZ3c3TEx5?=
 =?utf-8?B?UUw2SU9semlMTG5xVit2aTQ1QjVpdjN1VXpMTmNMUWhEZnYwUndKYS9yUVU2?=
 =?utf-8?B?SWE2cTZlWFUyS1BzYUxqRUlVaTc5UkdaTUlwekxGZjVhQ1VUV2ZsQ3dRclJo?=
 =?utf-8?B?RmdaVDRTQ0xGbTBpaTlJMm1IdzBlZG9tcyt3T0NGVjdFYXlseGZGam9ZVnJ6?=
 =?utf-8?B?dUdQZkQxWVlDS1kyejY4VXVwVGVpMHJXbU0rdmZCV3YxNTlZeU12a01WRnRu?=
 =?utf-8?B?ZmRLdGdwaVNmTnhSYnhvRjlrWitRcTRkTlpMSVBRRlhXRG1ibEFDTUhEVGRi?=
 =?utf-8?B?dGVobnJBUWpmVlliYVMyeFN5M2VzUis5ekJRNE1vUnBuM2FqYkdpN2lVZ1g0?=
 =?utf-8?B?QkxyMGMvR1V2Z2V4a0pzVzR6a01qQlV0MndKUVl1SU1tT09QVHpKREhhdm8v?=
 =?utf-8?B?N3R2REdHUEZhSkhJTVE0ZnRucFk0L2pOY0l6U3djczRvY2ZjdTE4cUs2aEts?=
 =?utf-8?B?cmdzNU4wRGY2OHJKRmVET2VrVFhWbEpUVnZrRFBWYnpRUmdEeXFjUFlzNThX?=
 =?utf-8?B?eTBpLzZWaXFQbjFVcXY3OWd5dmlEZWpRS2k3T3pvaFpJVjB0Nmxydi92OXRC?=
 =?utf-8?B?QVZBQmpqbDl6Zit3b3owd2pLK3pORGt3dFphVjJTNmUxaTJDTHR0ZjU2ZkZs?=
 =?utf-8?B?ZjNuRDU4SXphcTRxaFJlYjFXVlluN2tqaTBkalFRTXV5aE1qYmJ5QlRHd2s1?=
 =?utf-8?B?cit4TnBvUVVkSmVvUVRLcEorZTdlS3B3bE1VRUFGWmFtM1FQcFJRcks0MWV1?=
 =?utf-8?B?bVdRYXkyN0FjU0ZtdStuaUVNQmx1WWgzS1ViSDlGTStURmx5bzRCQ0M4dVdX?=
 =?utf-8?B?dGdNWjRaLzk5ajBOcUw1THhPcHFaZzhIZnQ3U0g5elpqbzhIS2RMZTArbTNF?=
 =?utf-8?B?UkZDUUUvUysycFQ2bjFpeERRODNvQWZDeVNWMTMwOWRGYmgzYnozNnJTaWhX?=
 =?utf-8?B?S0VzekxpM0FXeTFReVJPRWtHZkpkQ1JXUnpya2RZZ0hnb1YxWmgzTkFKQVN3?=
 =?utf-8?B?NjVTU3pZRGc2dmpXbWJBdmR2TkFtdHBUN2lwcjV2ZUlyWm9CYlllVjNwZVNU?=
 =?utf-8?B?MlFuUGFySU9qWFN4UTViaVU5OHI1K2xjU0w2Uit4Um9UcDlHUlZsSEtONCtr?=
 =?utf-8?B?NzkxNlEvdWFINDYrUjFlTkg4djNyNzFJSlpNb21tM2ZMVXo1N08velpIM3J0?=
 =?utf-8?B?dDdZT0d4aDBYOFpUcnM4QkJVNTdWQTlpVWl1Z21mY3NrMzhHdnR2NGhOK2xG?=
 =?utf-8?B?d0ZKQUk2bVU2QnpFZ0swWlZycXNGeG5iS3R2ZjA2ZU1HMlpLN1Y1Z0gzcEpH?=
 =?utf-8?B?TDdadkJlR1k5UENlNGQwRzVFNW95TFVWTk1YaU0xcWZNeDc0VXNiazlvZG1k?=
 =?utf-8?B?dkxDYjE4NVBIZXJIaTQxcnVuSmJ4bXc1OHFidG9uYVVJRXhCK1paSEhqeUZU?=
 =?utf-8?B?M3FFd0hrZW9TOXlSK1RocWRQay9hdFdLd1VybUhxQmthK29OVjZTYVZtR0Fm?=
 =?utf-8?B?dk1QZVllRnpmYlFSeGhha3huZ2hrNVNKTkVYTDBNYlN5TkJZY2xnSnpFMHh4?=
 =?utf-8?B?MWlvNnQ5cXVVaDZiT0x6WllnNmhUL3FTSldKS2Jkb2NySHNORUdiQ21EdEE0?=
 =?utf-8?B?THY2U0dtd2J3bHpsVG5VbUdWTmNPZ2NZcnNZZWsrYkptUW1rMkk4V2FNa3gv?=
 =?utf-8?B?bEEreGdPUW9LbE9mTW1BTUtaaExCQTcweXozaVgvdFFBUVNpVVRWcGplQlM0?=
 =?utf-8?B?cmN3NytqV3pKdGxTd2VwbDJBMUd6Sk9RN2UyQXdvVDlBeW1wREY5empzWEhT?=
 =?utf-8?B?Q01XSVlXZnJXTHhKUEtQYzdQWE9wTzF6MXdHSWp0ZlJiaVBUY2t6bFhJN2lt?=
 =?utf-8?B?OGkzSENqM05yQk13OWk2QU9EU1BYYTFqZ2dsdWgvaytZejJNWk5nVDhlOWJk?=
 =?utf-8?Q?YPYVkWRh2bjMK9MjAsd3JaD1G?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ada3eea-4802-4637-8130-08db2a1e0771
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4752.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 15:07:46.6884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vgBKQFkveqaVfUdn92fuZNIIoJallELbCvVjzSfvpINKb8B385/XvZX4NFrHY68DIA0BJ902B/OxQPWq5TjyvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8962
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
Cc: openbmc@lists.ozlabs.org, bradleyb@fuzziesquirrel.com, Abinaya.Dhandapani@amd.com, Michael Shen <gpgpgp@google.com>, ed@tanous.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 3/21/23 05:40, Patrick Williams wrote:
> On Tue, Mar 21, 2023 at 12:14:45AM -0500, Supreeth Venkatesh wrote:
>
>> #### Alternatives Considered
>>
>> In-band mechanisms using System Management Mode (SMM) exists.
>>
>> However, out of band method to gather RAS data is processor specific.
>>
> How does this compare with existing implementations in
> phosphor-debug-collector.
Thanks for your feedback. See below.
> I believe there was some attempt to extend
> P-D-C previously to handle Intel's crashdump behavior.
Intel's crashdump interface uses com.intel.crashdump.
We have implemented com.amd.crashdump based on that reference. However, 
can this be made generic?

PoC below:

busctl tree com.amd.crashdump

└─/com
   └─/com/amd
     └─/com/amd/crashdump
       ├─/com/amd/crashdump/0
       ├─/com/amd/crashdump/1
       ├─/com/amd/crashdump/2
       ├─/com/amd/crashdump/3
       ├─/com/amd/crashdump/4
       ├─/com/amd/crashdump/5
       ├─/com/amd/crashdump/6
       ├─/com/amd/crashdump/7
       ├─/com/amd/crashdump/8
       └─/com/amd/crashdump/9

> The repository
> currently handles IBM's processors, I think, or maybe that is covered by
> openpower-debug-collector.
>
> In any case, I think you should look at the existing D-Bus interfaces
> (and associated Redfish implementation) of these repositories and
> determine if you can use those approaches (or document why now).
I could not find an existing D-Bus interface for RAS in 
xyz/openbmc_project/.
It would be helpful if you could point me to it.
There are references to com.intel.crashdump in bmcweb code, but the 
interface itself does not exist in yaml/com/intel/
we can add com.amd.crashdump as a start or even come up with a new 
generic Dbus interface.
As far as Redfish implementation is concerned, we are following the 
specification.
redfish/v1/Systems/system/LogServices/Crashdump schema is being used.

{

"@odata.id": "/redfish/v1/Systems/system/LogServices/Crashdump/Entries",
"@odata.type": "#LogEntryCollection.LogEntryCollection",
"Description": "Collection of Crashdump Entries",
"Members":
  [
{"@odata.id": "/redfish/v1/Systems/system/LogServices/Crashdump/Entries/0",
"@odata.type": "#LogEntry.v1_7_0.LogEntry",
"AdditionalDataURI": 
"/redfish/v1/Systems/system/LogServices/Crashdump/Entries/0/ras-error0.cper",
"Created": "1970-1-1T0:4:12Z",
"DiagnosticDataType": "OEM",
"EntryType": "Oem",
"Id": "0",
"Name": "CPU Crashdump",
"OEMDiagnosticDataType": "APMLCrashdump"
},
{"@odata.id": "/redfish/v1/Systems/system/LogServices/Crashdump/Entries/1",
"@odata.type": "#LogEntry.v1_7_0.LogEntry",
"AdditionalDataURI": 
"/redfish/v1/Systems/system/LogServices/Crashdump/Entries/1/ras-error1.cper",
"Created": "1970-1-1T0:4:12Z",
"DiagnosticDataType": "OEM",
"EntryType": "Oem",
"Id": "1",
"Name": "CPU Crashdump",
"OEMDiagnosticDataType": "APMLCrashdump"
},
],
"Members@odata.count": 2,
"Name": "Open BMC Crashdump Entries"}
>
