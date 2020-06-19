Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 34762201DEF
	for <lists+openbmc@lfdr.de>; Sat, 20 Jun 2020 00:19:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pYBp3ppxzDrVN
	for <lists+openbmc@lfdr.de>; Sat, 20 Jun 2020 08:19:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pYB26q4PzDqC8
 for <openbmc@lists.ozlabs.org>; Sat, 20 Jun 2020 08:19:06 +1000 (AEST)
IronPort-SDR: 8t5i2n7k7LQpTWib/LsWf+1JXYviL92mjJm5amfpRKRV47sPJgzOKXhuiv1tHJfYaYMEV7Hu3d
 nr0Y7xMSxl9Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9657"; a="143069531"
X-IronPort-AV: E=Sophos;i="5.75,256,1589266800"; d="scan'208";a="143069531"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2020 15:19:03 -0700
IronPort-SDR: nEaWM1R8DQsP0vh/gzR2EWFUXgtRHd29EwfdYsCZ4MlRYVRs0V+0eDxDydue2R0rFkqcVeAJmg
 U7I5+IPXkQRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,256,1589266800"; d="scan'208";a="310306558"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 19 Jun 2020 15:19:03 -0700
Received: from [10.213.174.95] (jmbills-mobl.amr.corp.intel.com
 [10.213.174.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C70AE580515
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jun 2020 15:19:02 -0700 (PDT)
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
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <24353c42-dbcc-f950-1b75-c7ba3383b992@linux.intel.com>
Date: Fri, 19 Jun 2020 15:19:02 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fde794a3-58f9-f332-fd3b-3cfcc116f239@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
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



On 6/19/2020 6:26 AM, Ratan Gupta wrote:
> 
> On 6/18/20 2:15 AM, Patrick Williams wrote:
>> On Wed, Jun 17, 2020 at 05:38:47PM +0530, Ratan Gupta wrote:
>>> Hi James,Pattrick.
>>>
>>>>> Can't we do this already today by defining a simple errors/metadata file
>>>>> in phosphor-dbus-interfaces and calling 'logging::report<...>' on it?
>>>>> This will create a record on dbus in phosphor-logging.
>>>>>
>>>> I think the original concern was with supporting on the order of
>>>> 10,000 log entries, having this on d-bus seemed impractical. Also the
>>>> free log rotation the journal provides is useful. Now modifying the
>>>> logging::report<...> to conditionally log to the journal seems realistic.
>>> My intention was not to re-implement the logging, my intention was to
>>> extend/use the existing design which we already have it below.
>>>
>>> https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md
>>>
>>> I was trying not to bring the Redfish specific stuff in each individual
>>> repo, instead each transport can listen for
>>> Dbus events and write to the journal which goes to their app specific file.
>> Good.  This wasn't clear from the earlier email.  Thanks.
>>
>>
>>> As we are in agreement that we want to use the journal for persistence
>>> and log rotate feature.
>> I'm not convinced there is agreement on this.  There has been
>> disagreement about even using the journal for phosphor-logging use since
>> the beginning and I suspect there would be less agreement on another
>> application using it as its own IPC mechanism.
>>
>> Just because a hammer can be used to insert a nail into a board doesn't
>> mean you use it insert any pointy thing into a flat thing.  [ Just
>> because the journal provides log rotation and persistance doesn't mean
>> you should use it for every feature needing log rotation and
>> persistance. ]
>>
>>
>>> ***** As per the Redfish one of the requirement is we need the log for
>>> most of the Dbus Property update/interface added as they
>>> are mapped to some Redfish Resource and the bmcweb has to send the
>>> Resource updated/modified signal to the
>>> Redfish client. ******
> 
> Jaosn: You asked the following query in other thread /*"Why do we want 
> to log on D-Bus property updates?  This seems like it will be too noisy 
> for the EventLog*"/
> 
> Eg: Client is interested for an event when ever there is any user 
> add/delete or network configuration change or there is a log entry 
> resource gets created,To handle this request the flow would be
My understanding is for the first iteration we are only providing 
notifications for event messages.  So, if it isn't in the message 
registry, then you cannot register for that event?

It seems like the full resource change event notification will be a 
major feature and should probably get a dedicated design.

> 
> Redfish Client subscribe for "ResourceType" eg: 
> "EthernetService,AccountService,LogService"  with subordinate resources 
> property as truewhich means the Client is looking for updates on the 
> subscribed resources and the subordinates resource, These redfish 
> resources(EthernetInterface, IP address, ManagerAccount, AccountService) 
> would be mapped to some D-bus Resources, hence some application/bmcweb  
> would monitor the Dbus signals on the interested Dbus objects and send 
> the Redfish event to the subscribed client.
> 
> Apparo: Please correct me if I am missing something.
> 
>> I don't know Redfish well, so bear with me if there is something obvious
>> I'm missing.  But, the first part of this "requirement" doesn't seem to
>> follow from the second part of the "requirement" to me.
>>
>> Sending a signal of a property changing to the Redfish clients is
>> straight-forwawrd; Redfish should subscribe to all the appropriate
>> dbus-events.  I don't understand how this implies any sort of logging.
>> Where does the logging part of this requirement come from?
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24749/16/designs/redfish-eventservice.md#474
> 
> While I am reading the redfish 
> spec(https://www.dmtf.org/sites/default/files/standards/documents/DSP0266_1.11.0.pdf) 
> , it is not clear that the events need to be persisted.I will ask in the 
> DMTF for the persistence of the events.
> 
>>> We have two options:
>>>       1) Each transport interface listens for the Dbus signals and write
>>> it to their app specific file.
>>>       2) Each openbmc repo must use log::report for each D-bus property
>>> update/ interface added.
>> #2 is absolutely unworkable on the surface to me.  log::report is to
>> create a error entry (xyz.openbmc_project.Logging.Entry), which creates
>> a dbus-object, which would cause log::report to be called, which creates
>> a dbus-object, which ...
>>
>> Even if what you meant was something like logging::log<info>, this seems
>> pretty heavy.  I'm not sure this is something that can be inserted into
>> sdbusplus, especially for the ASIO-based object servers, because in many
>> cases applications register their own callback.  For the sdbus++
>> generated server bindings we could squeeze it in.  But, what you're
>> proposing here is essentially a "journal-as-dbus-monitor".  We'd
>> certainly need to make some measurements on how many kB/s worth of
>> journal entries this would create because I suspect we could end up
>> burning out a NAND flash with as many writes as that would induce.
> I would respond on the same once my query gets answered from DMTF.
> If my query gets answered yes then we have to write on flash but let's
> wait for it,
