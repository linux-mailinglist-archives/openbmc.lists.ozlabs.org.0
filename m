Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF1D2160F6
	for <lists+openbmc@lfdr.de>; Mon,  6 Jul 2020 23:31:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0zJs0nykzDqdX
	for <lists+openbmc@lfdr.de>; Tue,  7 Jul 2020 07:31:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0zHx0nsZzDqc9
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jul 2020 07:30:20 +1000 (AEST)
IronPort-SDR: HZmTSAGw1xwkOs+BENzMMQvKQwUIUvBwRjTUapFPUhW73rY9l2e/F4cKeWfSdBfR7mHXI7d+bD
 2b8Bqih+x63Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9674"; a="165577993"
X-IronPort-AV: E=Sophos;i="5.75,321,1589266800"; d="scan'208";a="165577993"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2020 14:30:18 -0700
IronPort-SDR: 7BNCs1quIPHft3LS1N5BJIZF+qPjtT1ybhhsFielIvvTKqdYfVJzFGzhkk3BArbQdLAHg5nzJz
 MPiOuIX/Qh0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,321,1589266800"; d="scan'208";a="315298594"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 06 Jul 2020 14:30:17 -0700
Received: from [10.251.158.177] (jmbills-mobl.amr.corp.intel.com
 [10.251.158.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id E71CE580428
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jul 2020 14:30:16 -0700 (PDT)
Subject: Re: Redfish EventService Implementation
To: openbmc@lists.ozlabs.org
References: <019f5263-a7b2-9cb8-4420-cb597bd29afd@gmail.com>
 <b80d18b2bc2766d58158e9c93f05201e87b445cd.camel@fuzziesquirrel.com>
 <c31b2941-dc48-349a-68cf-c5292ccfc621@linux.intel.com>
 <1d2ad757-826d-1993-b88a-e92010b984ed@linux.vnet.ibm.com>
 <05ec7793-2efa-42da-ef56-94cc1477d2bb@linux.intel.com>
 <20200616152428.GA4618@heinlein>
 <7e16df1c-38b0-d488-dbbf-75fe9ac818ab@linux.intel.com>
 <68f31493-6db6-8e8e-8486-e03c14685abe@linux.vnet.ibm.com>
 <20200617204516.GE4618@heinlein>
 <fde794a3-58f9-f332-fd3b-3cfcc116f239@linux.vnet.ibm.com>
 <20ab2d6a-00d8-edc6-a18a-c98d93c6cb3c@linux.vnet.ibm.com>
 <477bd1782b6c5f9cfea6f6340ecd207a9c01fb20.camel@fuzziesquirrel.com>
 <6fc4c66e-4a0a-1c59-3f77-a6fcff29b97e@linux.intel.com>
 <ee2b81be-0aff-022f-e5a7-9f0f874c1f20@linux.vnet.ibm.com>
 <8e342c33-25c8-5586-cbd4-e8662fcac6b5@linux.intel.com>
 <5b2ab3f9-4e98-b9c3-128b-9eb161ea52f9@linux.vnet.ibm.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <b62c0b2d-55fb-ffc7-5e29-2716f665f86d@linux.intel.com>
Date: Mon, 6 Jul 2020 14:30:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5b2ab3f9-4e98-b9c3-128b-9eb161ea52f9@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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



On 7/3/2020 3:15 AM, Ratan Gupta wrote:
>>>> I think I'm still a little confused at the scope.  My understanding 
>>>> was that this initial design for EventService was only for 
>>>> monitoring event messages and not resources in general. It seems 
>>>> like it may not make sense to try to use the same tools and approach 
>>>> for both message monitoring and resource monitoring? Do we need to 
>>>> treat them separately for now to simplify the discussion?
>>> Jason, When you say event messages? What do you mean, Do you mean to 
>>> say "/redfish/v1/Systems/system/Logservices/eventlog"? >
>>> If yes then this should also go as Resource Event, When ever any log 
>>> entry gets created under System Log 
>>> (/redfish/v1/Systems/system/Logservices/eventlog/entries), BMC would 
>>> notify to the Redfish client saying that "ResourceCreated" with the 
>>> URL of the Resource.
>> Yes, new entries under 
>> "/redfish/v1/Systems/system/Logservices/eventlog", but I thought you 
>> could register for specific MessageIDs, so it's not just a generic 
>> "new resource" event like others would be.
> 
> Can we register for MessageID? I thought client can register for whole 
> registry not a specific Message ID.
> 
I don't really know.  I thought that's what the current implementation 
allowed, but I don't know for sure if it can or should.

>>
>>
>>>
>>> After receiving this event Redfish client will do a GET request on 
>>> the URL(retrieved as part of event) to get the content of the log.
>>>
>>> This will become generic infra for all types of events.
>> What I'm saying is I don't know if there is a good generic solution to 
>> cover both the EventLog and all other resources.  I believe the 
>> current EventService implementation was designed only for EventLog and 
>> may not work well for generic resource events.
> 
> Can you get me the example payload for EventLog which is going to be 
> sent with the current design? I am not sure how the eventlog and other 
> resources are different.
> 
This is based on the assumption that for a LogService, you can register 
for a MessageId.  If this is not possible, then they might be treated 
the same.

> For eventLogs also we have the associated D-bus 
> objects(/xyz/openbmc_project/logging,/xyz/openbmc_project/dump etc)
> 
For Intel platforms, we don't use /xyz/openbmc_project/logging, so we 
don't have D-Bus objects associated with each EventLog LogEntry.  We use 
rsyslog to create a file that contains many LogEntries.

However, as an unrelated side-thought: linking logging to 
/xyz/openbmc_project/dump made me wonder if there is a possible solution 
to the logging issue if we treat /xyz/openbmc_project/logging like 
/xyz/openbmc_project/dump and place a pointer to the log in the D-Bus 
object instead of the log itself?

>>
>>>
>>> I would be coming up with few design approaches and downside with 
>>> each approach to take it to conclusion.
>> Thanks!  What I'm proposing is that we clarify or possibly separate 
>> the discussions about EventLog vs. generic resources to avoid 
>> confusion and come up with the right solutions for each.
>>
>>>
>>> Ratan
>>>
