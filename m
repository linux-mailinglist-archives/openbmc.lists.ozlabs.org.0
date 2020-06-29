Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A4920CFB4
	for <lists+openbmc@lfdr.de>; Mon, 29 Jun 2020 17:34:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wWkd260vzDqWv
	for <lists+openbmc@lfdr.de>; Tue, 30 Jun 2020 01:34:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wWjM3X5czDqVp
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jun 2020 01:33:25 +1000 (AEST)
IronPort-SDR: sRsmRTwzi93P1g6InUl0ECcpgVYnEqXbO/8z4Qbg0SgfMLRLlcGrHWH+MomVdgz06YlPqO+Ynq
 3WKD1cBFtEbw==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="207497335"
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; d="scan'208";a="207497335"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2020 08:33:22 -0700
IronPort-SDR: JYc85UTvF6X8X+ZxFilTamaqdgbETPn2m4MjnHUB6Ft9tkEvOEXQcuEI2pKjMp1M0D2YOAu9BT
 P6wXOEDU776Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; d="scan'208";a="277113483"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga003.jf.intel.com with ESMTP; 29 Jun 2020 08:33:22 -0700
Received: from [10.251.4.88] (jmbills-mobl.amr.corp.intel.com [10.251.4.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 1A81B58027C
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jun 2020 08:33:22 -0700 (PDT)
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
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <8e342c33-25c8-5586-cbd4-e8662fcac6b5@linux.intel.com>
Date: Mon, 29 Jun 2020 08:33:21 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ee2b81be-0aff-022f-e5a7-9f0f874c1f20@linux.vnet.ibm.com>
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



On 6/29/2020 1:07 AM, Ratan Gupta wrote:
> 
> On 6/26/20 12:25 AM, Bills, Jason M wrote:
>>
>>
>> On 6/25/2020 10:26 AM, Brad Bishop wrote:
>>> One idea floating around to address these is inventing a journal
>>> metadata scheme that is management interface agnostic.  I understand the
>>> motivation behind that - it is much simpler for an application to slide
>>> a single journal entry into the journal with all the metadata needed to
>>> generate events, than it is for an application to snoop multiple signals
>>> off dbus and pull events out of that.
>>>
>>> But I wonder if inventing a management interface agnostic scheme for
>>> adding events to the journal is really just inventing a new data model
>>> for how we represent things in a server - e.g. are we just working
>>> around our dbus data model?  Maybe we should fix it instead, so that it
>>> isn't so difficult for applications to use it?  With that said I don't
>>> know how to do this and I could use more concrete details on which areas
>>> of the data model make it hard to consume signals.  Does anyone have any
>>> ideas or examples?
>>>
>>
>> On this, I think we may want to separate logging vs. eventing both in 
>> this feature discussion and in the tools we want to use.
>>
>> When we were talking about logging, I think the journal made sense 
>> since it is designed for logging and has benefits around that usage. 
>> However, I agree that it doesn't seem like the right tool for sending 
>> and receiving events and signals and that D-Bus sounds like the right 
>> tool for that.
>>
>> I think I'm still a little confused at the scope.  My understanding 
>> was that this initial design for EventService was only for monitoring 
>> event messages and not resources in general. It seems like it may not 
>> make sense to try to use the same tools and approach for both message 
>> monitoring and resource monitoring? Do we need to treat them 
>> separately for now to simplify the discussion?
> Jason, When you say event messages? What do you mean, Do you mean to say 
> "/redfish/v1/Systems/system/Logservices/eventlog"? >
> If yes then this should also go as Resource Event, When ever any log 
> entry gets created under System Log 
> (/redfish/v1/Systems/system/Logservices/eventlog/entries), BMC would 
> notify to the Redfish client saying that "ResourceCreated" with the URL 
> of the Resource.
Yes, new entries under 
"/redfish/v1/Systems/system/Logservices/eventlog", but I thought you 
could register for specific MessageIDs, so it's not just a generic "new 
resource" event like others would be.

> 
> After receiving this event Redfish client will do a GET request on the 
> URL(retrieved as part of event) to get the content of the log.
> 
> This will become generic infra for all types of events.
What I'm saying is I don't know if there is a good generic solution to 
cover both the EventLog and all other resources.  I believe the current 
EventService implementation was designed only for EventLog and may not 
work well for generic resource events.

> 
> I would be coming up with few design approaches and downside with each 
> approach to take it to conclusion.
Thanks!  What I'm proposing is that we clarify or possibly separate the 
discussions about EventLog vs. generic resources to avoid confusion and 
come up with the right solutions for each.

> 
> Ratan
> 
