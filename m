Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25907379DA0
	for <lists+openbmc@lfdr.de>; Tue, 11 May 2021 05:24:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfNZG0bnhz301q
	for <lists+openbmc@lfdr.de>; Tue, 11 May 2021 13:24:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=p/+8Pi+T;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.102.113;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=p/+8Pi+T; 
 dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2113.outbound.protection.outlook.com [40.107.102.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfNYx4kkJz2xYf
 for <openbmc@lists.ozlabs.org>; Tue, 11 May 2021 13:24:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TByaiHEZPOTL3jLNuLc6xNrz4s2/AUxhjbQK15pkUzT6D1hjkVH2rhOCaYNiXXujN2sDmE/t5l/P0Q5shWGg56G0Vqtm30IrGNhMlVpA8LQDEEE308wIvrt/2Bb1jS0TfhbECWdg7BVWfDF54xc4oLYDgJwcSe5UK5l6IATM1KSYMTToWpNEBaW514XAv/H862EINDcRQ7GXQM1eAgVn0eDKB3NbKY9W0aT2m6V/EWx+G88Ydvd4Eekkf2G9CSNZzGAaWvIJHLJGJTEGMV7iKgtdFaMM6ip/abbc9+OypBE/RQ86q36+fGERD7cNvVTHCTKvAV7fRy2Jry8OElxLbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+iHkFBmTcd/F9yrukjjd2UR6SSMzT8Odpa3fSNt7dc0=;
 b=N6XoYqTcwrcWfPVPh9pqlVRDGt13PNk+coLb0oB3wqcXWpedhuyR+sodhTtEhxAonP44pV/6YFUquTu3PzcvFSW3gy1oaeRR37hRmUpIWgxEXWhPGJgkIBQWSrAxNqOG30BglsOx0oRKH6D9tNOJEfhSdxQkeJf+T0ig6+dZXT7WWh2pfonOim9C+5nqlMtxV5CD8RSFxcVEXXl7LIpI6TeqgvHtRuQR8q31JK4V3eqBCprH8/EG/jCFbkd+2mzkliLUx/D+Ohd98p4ACtPANmNCQaladnq7/pgHo2JRDUmhgof0F4MUAjrtRMIaTKQZOusvSBcnscVCG2FiCtQfog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+iHkFBmTcd/F9yrukjjd2UR6SSMzT8Odpa3fSNt7dc0=;
 b=p/+8Pi+TJYEvxMfOnQXE1jNGKuoK90S8b4frQSIFgl0FQ2A4Wyoya+zppiFxfOmspn4QtwGLkqNbS/pqbjNcddUs8Tj5DPgez3qxv1NbISnl5jd3WqRgged6haNW/wQN5/WDKB+7pT6y3TOZZ5YiB4BoWYKD2kP5wg4Gx209LlU=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 BY3PR01MB6676.prod.exchangelabs.com (2603:10b6:a03:36c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.29; Tue, 11 May 2021 03:23:57 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::b5ad:a41e:d884:41d6]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::b5ad:a41e:d884:41d6%7]) with mapi id 15.20.4108.031; Tue, 11 May 2021
 03:23:57 +0000
Subject: Re: How to add Redfish EventLog using commands
To: openbmc@lists.ozlabs.org
References: <11e4ee9d-d19c-dd79-aedd-8104a7ad081b@os.amperecomputing.com>
 <CACWQX81-6+PTTzFe6o5d6wvF99ELn-KTL8Or53fGXkKkKaUUEA@mail.gmail.com>
 <b952c2d9-a35b-b802-0942-ffb05a1cd3d5@linux.intel.com>
From: Thang Nguyen <thang@os.amperecomputing.com>
Message-ID: <c1175795-0824-4603-e5d3-28b56595efdc@os.amperecomputing.com>
Date: Tue, 11 May 2021 10:23:50 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
In-Reply-To: <b952c2d9-a35b-b802-0942-ffb05a1cd3d5@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK0PR03CA0105.apcprd03.prod.outlook.com
 (2603:1096:203:b0::21) To BYAPR01MB4678.prod.exchangelabs.com
 (2603:10b6:a03:88::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from HCM-FVFX4014HV2J.local (118.69.219.201) by
 HK0PR03CA0105.apcprd03.prod.outlook.com (2603:1096:203:b0::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 11 May 2021 03:23:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d46b662a-f7ce-4e09-4656-08d9142c3681
X-MS-TrafficTypeDiagnostic: BY3PR01MB6676:
X-Microsoft-Antispam-PRVS: <BY3PR01MB667654CA19986E36368FAA568D539@BY3PR01MB6676.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Hagypr50a+hsOtHAG5ja6yHDMLi2NjJXkLGtDkwDBWY/Q4QSa9LHXsKw2p4wkppwoWxece+0s0rHjVJH6YuTWnuAD9QNVy5U/44EfaEsSTpmb4N8L5lEHdiR6mcy+4I/PrCAxYPuEgoObmjqyPojBzTZIf0DMVBM6HMFmmHgUJwojsRxd16rsfChKuDR7wHDNbwDkgMnybtI/NRTlPmcprKsbg+FfJYnt1lKMc0HnVNyjiMmUl8/8nu/XRuT32Bcx/Wd3mUF6xkBVwdnfMImRF1npluIf6pajV9kND7QzLQk6I7zQ4Dt+O4jtpdPqeR/dAuFquUlu/Vo/Ez8/RHpm9ml88qh/Lddgg0cUG7n5CNcDJuarikYUwE0OJJx9WqerJJ9SUFVdSh+cUvXG/h/7kNFPhJCk8O7kpogRPXyLe99hNqv7WzoOYAKehuRu+7MVoINtGdOcrjwAAgeJ70BZycLlrgxdbjp+ftLhq7kB8j4xDqchcBpRnqB7N8bK8D8tE9lPis5/XQJMg/eWk1LBefMIdNROB/gAdGXo0GCntWxgYtsMSz4FESnvtdHQaNg6JRJAovDfJWYPbaICtHrXbnlXdkzB8HtQ7t6Q5vEdaYjSBDWG7Nbi2DzTkZzGuBHrVH80ty63K66j21OykeINORKdKAWMfNnrwLhOWdUw0uuJR2/4mJxwG3T5pCH/QLWQysRX8OliwIADXEFlL8xz13vMOwilzNtNRW5qOmwyntXNsG5w4YkrQVIRj3cd9suQgAP1ETKBPfylUrA3nFvCUea70J93RUinBXm1VU9xSHBN2RjREpy2gNXiMPqVsjCf3ayLIe1NclWawVTdEyBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(376002)(39840400004)(396003)(26005)(966005)(8936002)(66946007)(2616005)(5660300002)(83380400001)(31696002)(478600001)(316002)(6512007)(8676002)(52116002)(6486002)(2906002)(16526019)(186003)(31686004)(6916009)(86362001)(53546011)(6506007)(38100700002)(6666004)(66476007)(38350700002)(956004)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MmFyNGVleGtrTkhIamhOc2pxOGF3RlR0YitHSDRzODh4cHNmTGg2U3ZqemhJ?=
 =?utf-8?B?anVuVDEyZ2s5ZWE4MXNSM2hTbXo3TjNnQ3lSUmlUOWZaL0YzNVFLR3JhVm9W?=
 =?utf-8?B?UXIzVXMzYmdhRzVOSDlXa0FWajlQK3VwL1MrcWExYUQ1Z2VVRDNKdXVPb2h5?=
 =?utf-8?B?ZHB3ejVEenc4MDE2UStCWFIzcHNRcGtUeXFtL2lCNm82cDFHWVUwRXdnQUd3?=
 =?utf-8?B?WDNKUVFSaGMxZUN0QndoZythMU9XWUI4VXQxVWpVMG44QUoxZTd1QS82STNp?=
 =?utf-8?B?Z3lYYWMyend3SzVQcmRFWDFsYjBsREhXdjF4cVRwZThUcHpIZXBPL1VlV1Fz?=
 =?utf-8?B?NG1iVWJCbXl1WlU3WjhUTFAvdmVpZ3IwZVU5M1Rab2UwTXRacGNMeDhOOWlN?=
 =?utf-8?B?THNzU0VjZENzd0VMTXc3TEtEN1ZkWkhqMDF1V3YzQTIwSEYzVGtmQi9FSzN4?=
 =?utf-8?B?RHc2bmhLakl3dU93dzN1V1ZzKzA5Y1EwWEc1Ni8vQ2lheFJQWGFtaXMvWkdU?=
 =?utf-8?B?Sm1zL2JCeE5oa1RhVWp0V0pNWkxTWnVUa28yaUM5RERTN2cvM0grSk9XTUxT?=
 =?utf-8?B?YWR4UnJSMWlQMFZuS0ZGeVlFb0F4WDVOYURUTzJVdTlnUWZBNXZHWS8yY0xD?=
 =?utf-8?B?NzVaaDNHZEpENngzb1NRbStYNzZ2RFcrVWt0VkhrUG14U05jblBYUEdaVXB0?=
 =?utf-8?B?ZzI4Nm43THo1d0dzTXBvMGptLzJDM0hJWDNHMXZwMUR0Lzg3cGRlcnZPZE16?=
 =?utf-8?B?QjBhYXRCV2x0QjhtN1d6N2d0Z0kyNld4RW8yMVIzKzU3em9XSTNQQ1hBS20w?=
 =?utf-8?B?Q0l0a1E3RDFjWExJQXE0VW1QaFBVNit6MFA4bVlXbERHMDZHWURBMS9hdGVq?=
 =?utf-8?B?dWZnZ2NqTVdqdlRXdXplTi9YTk5Jc0RsaitCODA5a3BpZTZBVkZZSkdjTUQv?=
 =?utf-8?B?V1JpNXJZSEd4WmIyd1hldDFvOG5PLzRFVm5scEdCa013NVFONEdHRmZhR0M3?=
 =?utf-8?B?cHQvNnZ3d0xSbkJ4RDEwSy85d2hHMEhhb0lRc2ZhTm1sMDZxYjBmeDl3d3hP?=
 =?utf-8?B?WUJWdnNiQUVCU0t0dXlWa0xwV2J5VzRkUTBpdi9sbzU1WG5nM2M3MjJlaXVp?=
 =?utf-8?B?aEdzZEIxdjA2T3FoUzRPWDZuVHphS2o5bmYvVXJjb2VWSTJXWUpRbHNUZWF0?=
 =?utf-8?B?TlFwdUsvc3krY0tzVW5aTktVdjFPZGdKWkRXd3RqbTNPOW4wL1BaSTF6V25O?=
 =?utf-8?B?ZmhaSHNXTnNQbmszTjE3ZDR5VmMvdVFWZ0NZbllMRXBsOUlpSnVzZ054TEt5?=
 =?utf-8?B?RmxvZ2RjeThHNGpyZHZOTjdZaDN2L01QL3FaSDlIUzRGSFBuZ1JBQUJOS2VF?=
 =?utf-8?B?ZTBRa0pEKzZweE4rSDkveTRZNWc3ZXlEbjhPWXhhYldkUWFtY0NqZkpUVkJ3?=
 =?utf-8?B?NnloMUN2Y3c5MmovMlBwYmpDZHZ0MDN1eUxqMElabkFmL2p1WVJmUnBELzkv?=
 =?utf-8?B?S3M3WDNOK3dZWCs0bFdkZFpEZVBsN3ZBcFdKREJvTzBRM29aT0hvTWw0bnNt?=
 =?utf-8?B?cFkzRElCUXI5RHhrVnRrenpvS2xkUU1oR1lPN1c2SEhSTHVmWmdNMDF4TFdG?=
 =?utf-8?B?aWF3Zlpyai9sajY0azU5ekJXc2t1Z1IwRHlLUXY5UHlFWm5mWXJOSUZYbG1W?=
 =?utf-8?B?NjNENVhkVU5xRERYNjgzWFUyQnBXcTFGM0dNeDRCWGJhVVRYbHB5QzExSSsx?=
 =?utf-8?Q?qL6SMqpFtd4xXBsPqsc7ha1WdrBboktFMuMeaOe?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d46b662a-f7ce-4e09-4656-08d9142c3681
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2021 03:23:57.6943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1LWEKz/S6/5t4i7IWuE7bCSMgq1I9z6dICmyEFJimuwP8/ceL0lsGI9CSTfLywD+gkfAacutVOuhP8CY87gl7Te0htmxV9QdZ6g/0IReK+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR01MB6676
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 05/05/2021 06:14, Bills, Jason M wrote:
>
>
> On 5/4/2021 1:01 PM, Ed Tanous wrote:
>> On Tue, May 4, 2021 at 2:54 AM Thang Nguyen
>> <thang@os.amperecomputing.com> wrote:
>>>
>>> Hi,
>>>
>>> I am looking for the mechanism to add events to Redfish EventLog. I
>>> checked on the Redfish EventService design
>>> (https://github.com/openbmc/docs/blob/master/designs/redfish-eventservice.md) 
>>>
>>> and it seems only has C++ functional calls (sd_journal_send(),
>>> phosphor::logging::log(), ...) but not user commands that can be 
>>> used in
>>> the shell script.
>>
>> This kind of logging and handling would imply that your script has
>> outlived what should realistically be put in a bash script, and should
>> be rewritten in something compiled (probably c++).  Redfish logs
>> require string and variable manipulation that is generally not well
>> defined in bash scripts.
>>
>>>
>>> There are many use cases for adding EventLogs:
>>>
>>> 1. Use phosphor-gpio-monitor to monitor signals like power/reset,
>>> button, ... and log the event
>>
>> Considering that Redfish event log is for high level things, I suspect
>> this isn't a great fit.  power/reset would be handled within whatever
>> state system you're using (phosphor-state-manager or
>> x86-power-control), right?
>>
>>>
>>> 2. Use phosphor-gpio-monitor to check if the Host boot fail, control 
>>> the
>>> mux to switch to other boot devices, along with logging events.
>>
>> This seems like something that shouldn't be done from bash;
>>
>>>
>>> 3. Check device presences (from /sys interfaces) and log events, ...
>>
>> Redfish itself should have no knowledge of specific linux interfaces,
>> or linux at all.  Dependent on the actual /sys device you're looking
>> for, there's probably already daemons that expose those types of
>> events.  Without going into more specifics, I'm not sure this is
>> advised.
>>
>>>
>>>
>>> I checked on existing repositories like phosphor-sel-logger,
>>> dbus-sensors, ... and they only support events for their features (like
>>> power dc on/off, sensor threshold, inventory data added/removed, ...)
>>> and the Redfish events added in C++.
>>
>> Which is I think the right design choice.
>>
>>>
>>> I can have a C++ codes to just support options to add different 
>>> EventLog
>>> data with parameters. But it can't be inside meta- folder so need a
>>> repository for it.
>>
>> For what it's worth, the bash scripts shouldn't be going in the meta
>> repo either.
>>
>>> I think it's not worth for creating a new repo just
>>> to support an application with dozen like of codes to just add 
>>> EventLog.
>>
>> Disagree about whether it's worth it.  WIth that said, depending on
>> what you're trying to do, there's likely already a repo for the
>> feature you're trying to implement.
>>
>>>
>>> Do you have any idea of any existing repo support adding Redfish
>>> EventLog from script/command line or any repo that we can extend to
>>> support such command?
> I completely agree with Ed on making sure it's the right thing to do 
> before doing it, but I wanted to share the tool we use in case it's 
> helpful.
>
> For journal-based logging we use 'logger-systemd --journald' in some 
> of our scripts to add Redfish event messages to the journal: 
> https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-common/recipes-core/fw-update/files/fwupd.sh#L33 
>
Thanks Bills for your information. This approach works for me. However, 
need to rebuild logger-systemd as it is not ready in OpenBMC. Any chance 
for OpenBMC support logger-systemd by default?
>
>>>
>>>
>>> Best Regards,
>>>
>>> Thang Q. Nguyen -
>>>
