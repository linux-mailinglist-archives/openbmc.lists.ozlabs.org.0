Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8144397A67
	for <lists+openbmc@lfdr.de>; Tue,  1 Jun 2021 21:05:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FvhSW1Rlxz303Q
	for <lists+openbmc@lfdr.de>; Wed,  2 Jun 2021 05:05:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FvhSH0kjXz2yYG
 for <openbmc@lists.ozlabs.org>; Wed,  2 Jun 2021 05:05:17 +1000 (AEST)
IronPort-SDR: h0yglNcCrb3DE5/apxbAfOqfEOPcBYwHvjVVX+3vZgq7OBYtwsn8tk1UdxcWsTIrF0+Fc6s/BI
 o4JP/m4Vkjyw==
X-IronPort-AV: E=McAfee;i="6200,9189,10002"; a="200603082"
X-IronPort-AV: E=Sophos;i="5.83,240,1616482800"; d="scan'208";a="200603082"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 12:05:13 -0700
IronPort-SDR: y36ij73jjueHro478f7pL0aeytFgcbIyZfNH8cASt+Jeem20XN6tercr4NyCZ6rzZg2ZjRdSRS
 94MqQeAProIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,240,1616482800"; d="scan'208";a="411343087"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga007.fm.intel.com with ESMTP; 01 Jun 2021 12:05:13 -0700
Received: from [10.209.114.223] (jmbills-MOBL.amr.corp.intel.com
 [10.209.114.223])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 19A7C5805EE
 for <openbmc@lists.ozlabs.org>; Tue,  1 Jun 2021 12:05:13 -0700 (PDT)
Subject: Re: SEL Event logs in Redfish
To: openbmc@lists.ozlabs.org
References: <SG2PR04MB30931F4EAC5DC1D4E968631EE1229@SG2PR04MB3093.apcprd04.prod.outlook.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <85157600-4832-42bd-8f4d-87757153b732@linux.intel.com>
Date: Tue, 1 Jun 2021 12:05:12 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <SG2PR04MB30931F4EAC5DC1D4E968631EE1229@SG2PR04MB3093.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 5/28/2021 1:58 AM, Jayashree D wrote:
> Classification: Public
> 
> Hi Jason,
> 
> In journalctl log, I found that the sensor value is crossed the threshold value.
> But when I tried in Redfish API, I am not able to see any logs, whether anything I am missing here ?
> Could you please provide suggestions on this .
Unfortunately, we ran into trouble trying to persist the journal to 
flash, so we have one additional layer where rsyslog watches for any 
journal entries that have a "REDFISH_MESSAGE_ID" metadata and logs them 
to '/var/log/redfish' where bmcweb pulls them for the Redfish EventLog.

https://github.com/openbmc/openbmc/blob/master/meta-intel-openbmc/meta-common/recipes-extended/rsyslog/rsyslog/rsyslog.conf#L66

If you have the journal event, I'd check if you have 'var/log/redfish' 
populated with that event.  If not, you may need to add the above config 
to rsyslog to create it and that will hopefully fix the event in Redfish.

Thanks,
-Jason
> 
> root@tiogapass:~# journalctl | grep adc
> Jan 01 00:13:46 tiogapass adcsensor[298]: Sensor _MB_P5V low threshold 4.52 assert: value 4.51 raw data 1337
> 
> curl -k -H "X-Auth-Token: $token" -X GET https://${bmc}/redfish/v1/Systems/system/LogServices/EventLog/Entries
> {
>    "@odata.id": "/redfish/v1/Systems/system/LogServices/EventLog/Entries",
>    "@odata.type": "#LogEntryCollection.LogEntryCollection",
>    "Description": "Collection of System Event Log Entries",
>    "Members": [],
>    "Members@odata.count": 0,
>    "Name": "System Event Log Entries"
> }
> 
> Thanks,
> Jayashree
> 
> On 5/24/2021 8:15 AM, Bruce Mitchell wrote:
>> On 5/24/2021 06:41, Jayashree D wrote:
>>>
>>> Hi Team,
>>>
>>> I need some clarification on SEL Logs.
>>> In SEL Event logs, when the error is injected manually , I can able
>>> to see the error logs in "ipmitool sel list" command.
>>> Whether it will also reflect in Redfish API ?
> I am mostly familiar with the journal-bases SEL logging.  In that case, phosphor-sel-logger will detect the error and log it to both IPMI SEL and Redfish at the same time:
> https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fopenbmc%2Fphosphor-sel-logger%2Fblob%2Fmaster%2Finclude%2Fthreshold_event_monitor.hpp%23L272&amp;data=04%7C01%7Cjayashree-d%40hcl.com%7C1e6f287fb3d24d154be508d91f11ef7d%7C189de737c93a4f5a8b686f4ca9941912%7C0%7C0%7C637574984193449537%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=8JHAtQ7FBZSDtVoM3b0MGi2OhBQDNB16j0Pko0jg7p8%3D&amp;reserved=0.
> 
> It may also depend on how you are manually injecting the error.
> 
>>>
>>> Could you please help me in this.
>>>
>>> Thanks,
>>> Jayashree
>>>
>>> ::DISCLAIMER::
>>> ________________________________
>>> The contents of this e-mail and any attachment(s) are confidential
>>> and intended for the named recipient(s) only. E-mail transmission is
>>> not guaranteed to be secure or error-free as information could be
>>> intercepted, corrupted, lost, destroyed, arrive late or incomplete,
>>> or may contain viruses in transmission. The e mail and its contents
>>> (with or without referred errors) shall therefore not attach any
>>> liability on the originator or HCL or its affiliates. Views or
>>> opinions, if any, presented in this email are solely those of the
>>> author and may not necessarily reflect the views or opinions of HCL or its affiliates.
>>> Any form of reproduction, dissemination, copying, disclosure,
>>> modification, distribution and / or publication of this message
>>> without the prior written consent of authorized representative of HCL
>>> is strictly prohibited. If you have received this email in error
>>> please delete it and notify the sender immediately. Before opening
>>> any email and/or attachments, please check them for viruses and other
>>> defects.
>>> ________________________________
>>>
>>
>> Hi Jayashree,
>>
>> I suggest you connect with Jason Bills on SEL.
>>
>>
> 
> 
