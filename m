Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 523D0445BB6
	for <lists+openbmc@lfdr.de>; Thu,  4 Nov 2021 22:38:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlcSf6GWBz2ynt
	for <lists+openbmc@lfdr.de>; Fri,  5 Nov 2021 08:38:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlcSN5nhyz2xDq
 for <openbmc@lists.ozlabs.org>; Fri,  5 Nov 2021 08:37:55 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="255445108"
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; d="scan'208";a="255445108"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 14:36:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; d="scan'208";a="668045036"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga005.jf.intel.com with ESMTP; 04 Nov 2021 14:36:51 -0700
Received: from [10.209.42.185] (jmbills-MOBL.amr.corp.intel.com
 [10.209.42.185])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 955D3580641
 for <openbmc@lists.ozlabs.org>; Thu,  4 Nov 2021 14:36:51 -0700 (PDT)
Message-ID: <a6be0a56-664a-9685-e058-67edb6a3e5b7@linux.intel.com>
Date: Thu, 4 Nov 2021 15:36:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [phosphor-logging] About the "Stop emitting Entry propChanged
 before ifacesAdded" change reason
Content-Language: en-US
To: openbmc@lists.ozlabs.org
References: <HK0PR03MB3089CFCA31102DE7BB551413F5BE9@HK0PR03MB3089.apcprd03.prod.outlook.com>
 <b71bb325-cf41-deab-5422-11520f85cc55@linux.ibm.com>
 <YXBPMNi5yzzEtE/R@heinlein>
 <CACWQX83=F77Rh=oGJWRd9SkhqFoik-duLGJdVpaU2E+SBgWXQQ@mail.gmail.com>
 <YYROU4ar31l9iibj@heinlein>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <YYROU4ar31l9iibj@heinlein>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 11/4/2021 3:19 PM, Patrick Williams wrote:
> On Thu, Nov 04, 2021 at 12:39:05PM -0700, Ed Tanous wrote:
>> On Wed, Oct 20, 2021 at 10:18 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>>>
>>> On Wed, Oct 20, 2021 at 10:13:06AM -0500, Matt Spinler wrote:
>>>> values, and then explicitly emits the IA signal.   Others can chime in,
>>>> but I didn't see it as proper D-Bus behavior to emit propertiesChanged
>>>> before InterfacesAdded, since in fact no property is changing after the
>>>> interface was added.
>>>
>>> Correct.  PropertiesChanged signals should not show up before InterfacesAdded.
>>
>> But they should still show up eventually (after the InterfacesAdded),
>> right?
> 
> I'm not positive what you're asking.  Does it happen or should it be done?  What
> I tried to describe is what correct behavior would look like.
> 
> My understanding is that if you don't have a service name, no signals will be
> emitted.  I don't recall where I've seen that in code before.
> 
> If you have a service name, but the object does not have an object manager in
> the path, then no InterfacesAdded signals will be emitted.  Many processes put
> this into the root, so this isn't an issue.
> 
> PropertiesChanged and InterfacesAdded are independent from a sd_bus perspective
> (and they belong to two different Interfaces anyhow).  If you call
> sd_bus_emit_properties_changed before calling sd_bus_emit_interfaces_added or
> sd_bus_emit_object_added you will still get signals emitted for the properties
> changed (I confirmed this in the systemd repo).
> 
> There is no queueing or deferring of the PropertiesChanged signals until after
> the InterfacesAdded.
> 
> To me, it does not make any sense to emit signals for PropertiesChanged prior to
> actually informing the world that the interface exists via InterfacesAdded.
> You'll end up sending out signals for properties which nobody even knows they
> exist anyhow.
> 
> It is _also_ a bad idea to send out InterfacesAdded signals before you have
> fully constructed and initialized your object.  This can cause other processes
> to act on the property information they received via the InterfacesAdded signal
> but with half-constructed / invalid property state.
> 
>> The patchset here seems to be under the impression that
>> PropertyChanged is never emitted when the object is added, which seems
>> incorrect, or at the very least is a breaking behavioral change.
>> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/48231
> 
> The PropertyChanged signal is only emitted if the property changes *after* the
> object was fully formed (by sending out its InterfacesAdded).  The
> PropertyChanged signals are not queued up from the time the object is first
> added until after InterfacesAdded is emitted, which is what it sort of sounded
> like you were implying might happen.
> 
> I'm not sure why you are saying it is breaking behavioral change, other than it
> might have use to work this way, but that way it use to work didn't make any
> sense from a dbus perspective.  This proposed change in bmcweb seems
> conceptually reasonable.
> 
I'm not sure if it's what we're talking about here with the behavioral 
change, but in sdbusplus when a new interface is initialized, by default 
it will also send a PropertiesChanged signal for newly added properties.

There is a 'skipPropertyChangedSignal' parameter that can be set to 
'true' to skip the ProperitesChanged and only send InterfacesAdded:
bool initialize(const bool skipPropertyChangedSignal = false)

https://github.com/openbmc/sdbusplus/blob/master/include/sdbusplus/asio/object_server.hpp#L740

I think there are some components that depend on the default behavior 
and only watch for PropertiesChanged rather than InterfacesAdded.
