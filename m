Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A756D1FD352
	for <lists+openbmc@lfdr.de>; Wed, 17 Jun 2020 19:20:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nBfC0MbBzDr0w
	for <lists+openbmc@lfdr.de>; Thu, 18 Jun 2020 03:20:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nBdW4HGrzDqHL
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jun 2020 03:19:39 +1000 (AEST)
IronPort-SDR: jpFiyTSeASyWzB2k02/PgI8Ai/V8YK6UFgLzaQKsje7FnIt2kYoIhhFVdLHoMry4K9hzcupDrl
 gKkwM7UMu5UQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2020 10:19:36 -0700
IronPort-SDR: jTN6a1Fz7ZlnFqXldD1r32fi3QDXr5gH4PeUEw6G1u+eUSPM+Vss0HJGCyhkXp7IkCDk53tp8v
 aXKGtq+XF+lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,523,1583222400"; d="scan'208";a="299370476"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 17 Jun 2020 10:19:36 -0700
Received: from [10.251.15.133] (jmbills-mobl.amr.corp.intel.com
 [10.251.15.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 1214C5800B9
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jun 2020 10:19:36 -0700 (PDT)
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
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <97353a7d-38f8-9fd4-bbe7-2c75746302c1@linux.intel.com>
Date: Wed, 17 Jun 2020 10:19:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <68f31493-6db6-8e8e-8486-e03c14685abe@linux.vnet.ibm.com>
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



On 6/17/2020 5:08 AM, Ratan Gupta wrote:
> Hi James,Pattrick.
> 
> Thanks for giving the feedback
> 
> On 6/16/20 9:41 PM, James Feist wrote:
>> On 6/16/2020 8:24 AM, Patrick Williams wrote:
>>> On Mon, Jun 15, 2020 at 02:42:11PM -0700, James Feist wrote:
>>>> On 6/15/2020 5:50 AM, Ratan Gupta wrote:
>>>>>       eg:
>>>>>           sd_journal_send("MESSAGE=%s", "Account Modified",
>>>>>               "PRIORITY=%i", LOG_INFO, "REDFISH_MESSAGE_ID=%s",
>>>>> "REDFISH_RESOURCE_PATH=/redfish/v1/AccountService/accounts/<id>",
>>>>>               "REDFISH_RESOURCE_TYPE=ComputerSystem"
>>>>> "REDFISH_REGISTRY_PREFIX=Task/Base/Resource/Oem",
>>>>>               "REDFISH_MESSAGE_ARGS=%s", "Off", NULL);
>>>>
>>>> If we're going to go down the path of re-implementing logging, I think
>>>> the goal should be to stop logging things in the Journal that are
>>>> Redfish specific, and instead log them in some generic format that
>>>> phosphor logging controls the map. Right now we are bifurcated because
>>>> the dbus-event-logs, SEL, PEL, and Redfish are all using different
>>>> methods of logging, that play to their own set of rules.
>>>
>>> Absolutely agree with you here.  There is zero reason that applications
>>> should start logging specially formed messages with REDFISH_* meta-data.
>>> We shouldn't have any applications explicitly know about Redfish except
>>> the Redfish providers themselves.  This is no different from IPMI, PLDM,
>>> or any other external interface.
>>>
>>> The kind of information presented here as being interesting to expose
>>> via Redfish is equally as interesting to me to be able to add to one of
>>> our 'FFDC dumps', which could be used for security / forensic work.
>>>
>>>> Most repos use
>>>> phosphor-logging, so instead of creating yet another daemon, if we 
>>>> added
>>>> support to create a 'System Level' or 'External User' log that has
>>>> predefined dictionaries of required and optional keys, something like
>>>> phosphor-dbus-interfaces, we might be able to drop some of these
>>>> transport specific logs, and have the transports based on the same
>>>> database (the journal). Then each transport could filter these based on
>>>> journal entry type, and transform them into the correct log for that
>>>> transport. I think adding more Redfish specifics into the logs hinders
>>>> those who do not want Redfish in their systems.
>>>
>>> Can't we do this already today by defining a simple errors/metadata file
>>> in phosphor-dbus-interfaces and calling 'logging::report<...>' on it?
>>> This will create a record on dbus in phosphor-logging.
>>>
>> I think the original concern was with supporting on the order of 
>> 10,000 log entries, having this on d-bus seemed impractical. Also the 
>> free log rotation the journal provides is useful. Now modifying the 
>> logging::report<...> to conditionally log to the journal seems realistic.
> My intention was not to re-implement the logging, my intention was to 
> extend/use the existing design which we already have it below.
> 
> https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md 
> 
> 
> I was trying not to bring the Redfish specific stuff in each individual 
> repo, instead each transport can listen for
> Dbus events and write to the journal which goes to their app specific file.
> 
> Your point is valid that we would be polluting the journal if each and 
> every transport start writing as per their needs.
> 
> ***** As per the Redfish one of the requirement is we need the log for 
> most of the Dbus Property update/interface added as they
> are mapped to some Redfish Resource and the bmcweb has to send the 
> Resource updated/modified signal to the
> Redfish client. ******
Why do we want to log on D-Bus property updates?  This seems like it 
will be too noisy for the EventLog.

> 
> As we are in agreement that we want to use the journal for persistence 
> and log rotate feature.
> 
> We have two options:
>      1) Each transport interface listens for the Dbus signals and write 
> it to their app specific file.
>      2) Each openbmc repo must use log::report for each D-bus property 
> update/ interface added.
>         To make this happen, we need the following
>          * common message format which can be used by the all other 
> application (SEL,Redfish) etc.
>          * Transport application will read this common message from the 
> journal and use it as per their needs.
> 
> Option no 2:   It is ideal solution but that requires good amount of 
> work as
>               either each and every D-bus repo  should write to the 
> journal for any property update/interface added.
>                       or
>               Should SDbusplus do this as each and every application 
> uses the sdbusplus framework to manage the dbus objects
> 
> Please let me know your thoughts.
> 
> Ratan
> 
