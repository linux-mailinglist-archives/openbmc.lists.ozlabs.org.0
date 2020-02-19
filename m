Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC3D164EC0
	for <lists+openbmc@lfdr.de>; Wed, 19 Feb 2020 20:21:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48N6yg6rdjzDqM9
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 06:21:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=apparao.puli@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48N6xw6zr7zDqG0
 for <openbmc@lists.ozlabs.org>; Thu, 20 Feb 2020 06:20:36 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Feb 2020 11:19:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,461,1574150400"; d="scan'208";a="259023281"
Received: from apuli-mobl.gar.corp.intel.com (HELO [10.252.71.25])
 ([10.252.71.25])
 by fmsmga004.fm.intel.com with ESMTP; 19 Feb 2020 11:19:21 -0800
Subject: Re: Redfish EventService Implementation
To: RAJESWARAN THILLAIGOVINDAN <rajeswaran.thillaigovindan@gmail.com>,
 openbmc@lists.ozlabs.org, James Feist <james.feist@linux.intel.com>
References: <019f5263-a7b2-9cb8-4420-cb597bd29afd@gmail.com>
 <7a3d4141-ff5f-794a-6803-88a8bcfa3e02@gmail.com>
From: "Puli, Apparao" <apparao.puli@linux.intel.com>
Message-ID: <1a22b091-675c-3e1d-b57a-d44b3ba5d4e0@linux.intel.com>
Date: Thu, 20 Feb 2020 00:49:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <7a3d4141-ff5f-794a-6803-88a8bcfa3e02@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Hi,

   I am sorry for late response as this mail is buried under and got 
struck back of my mind.

As i did mentioned in EventService design document, EventLog Monitor 
service is not common across the organizations( Example: Intel uses the 
redfish event logs file and inotify mechanism for monitoring the event 
logs. Where as IBM uses d-bus event log mechanism and they can relay on 
match rules). That said challenges with ResourceType mapping will be 
different in both monitoring mechanisms. This is good point. Initially 
when i started EventService design, i thought we can have mapping in 
bmcweb for ResourceTypes with set of MessageID's for Logged events ( As 
per Intel design) but not sure that may become difficult when we expand 
supported ResourceTypes.

As per my reading from below query, You are looking at d-bus match rules 
and ResourceTypes mapping which is more specific to d-bus event 
logging(IBM way of implementing event logging). reading it from journal 
logs will give more information but that will impact the performance to 
large extent. This might be one of the reason why we (Intel) uses 
Redfish message ID while logging redfish events logs to journal(You can 
refer design document for same at 
https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md). 
In opinion, in your d-bus if you are using some kind of filter(Example 
REDFISH_MESSAGE_ID) while logging in journal logs for all events and 
figure out the way to monitor the journal logs without impacting the 
performance, that should be ok as long as match filters are satisfied 
for Redfish EventService subscriptions and supported Types(Again differs 
with implementation).

Thanks,

-Appu

On 2/10/2020 1:52 AM, RAJESWARAN THILLAIGOVINDAN wrote:
> ApparaRao.
>
> As you have shown interest in this feature and submitted the design 
> document, do you have any opinion on this? Do you see any merit in 
> using D-Bus match in bmcweb to create event logs for life cycle 
> events?  Please feel free to weigh in.
>
> Thanks,
> Rajes
>
> On 01-02-2020 02:23, RAJESWARAN THILLAIGOVINDAN wrote:
>> Hi,
>>
>> I am going through the bmcweb code for implementing Redfish 
>> EventService based on the design document 
>> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24749. This 
>> design is hooked to the journal based Redfish Event Logging. For life 
>> cycle events(ResourceAdded, ResourceRemoved, ResourceUpdated),  using 
>> D-Bus match, bmcweb can create an event log. This requires a JSON 
>> dictionary, comprising an array of Redfish Resource Name and the 
>> D-Bus path. This approach works only in case of one to one mapping of 
>> Redfish Resource Name and the D-Bus path. For propertiesChanged 
>> events, if the Redfish Resource property is not on the same D-Bus 
>> path or the Redfish Resource property name is different from the 
>> D-Bus property name, then an additional JSON dictionary to maintain 
>> this information is required. With D-Bus match alone in the bmcweb, 
>> Redfish EventService can't be fully supported. For the Message 
>> Registers and the Resource Types that are supported, the relevant 
>> OpenBMC application must create an event log in the journal using 
>> either the phosphor::logging::entry or sd_journal_send() command.
>>
>> After realizing that with D-Bus match in the bmcweb alone can't help 
>> to fully implement EventService, I prefer to avoid using D-Bus match 
>> in bmcweb. Instead, I prefer to modify the OpenBMC application that 
>> generated the event to create an event log in the journal. Do you see 
>> any advantage of using combination of D-Bus match in the bmcweb 
>> wherever it is possible and changes to OpenBMC application in other 
>> cases to create an event log ?
>>
>> Your views are highly appreciated.
>>
>> Thanks,
>> Rajes
>
