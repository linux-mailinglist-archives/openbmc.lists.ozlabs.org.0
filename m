Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B3E37BBA3
	for <lists+openbmc@lfdr.de>; Wed, 12 May 2021 13:17:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgC1f5xYkz301L
	for <lists+openbmc@lfdr.de>; Wed, 12 May 2021 21:17:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgC1R5mdrz2xvJ
 for <openbmc@lists.ozlabs.org>; Wed, 12 May 2021 21:17:14 +1000 (AEST)
IronPort-SDR: evuYE6FeNyB6pS2f9yyJHmbsGwugoUDYoDp5QhwBf//CV2UXoOYjZO98X66sTgMw705gGS7AxT
 xCZNJ/5jYRyA==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="220650296"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; d="scan'208";a="220650296"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2021 04:17:09 -0700
IronPort-SDR: ayK9algclRmiZjqdXdSNLvmz+HLvTxGDJkVHwxHkobsuiRFxRNlGlGdF44SfV8NGkdrRwGvJpZ
 /7SdWduZOJEA==
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; d="scan'208";a="622364868"
Received: from aambroze-mobl.ger.corp.intel.com (HELO [10.213.18.39])
 ([10.213.18.39])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2021 04:17:08 -0700
Subject: Re: Mapping standard D-Bus sensors to ProcessorMetrics (and other
 specific schemas)
To: Ed Tanous <ed@tanous.net>, Patrick Williams <patrick@stwcx.xyz>
References: <f9127788-7f8a-59ed-e434-0f510773d2aa@linux.intel.com>
 <YHBDIZqvHI0THFh3@heinlein>
 <3d5f8ede-3506-afac-d5bd-4bc7f3331cbc@linux.intel.com>
 <YJqaKhKlZ7BZCGA9@heinlein>
 <CACWQX82QSD=1nZAYkP=CO=-ch_YcbRXmyvLt743F-hGspTNPqw@mail.gmail.com>
From: "Ambrozewicz, Adrian" <adrian.ambrozewicz@linux.intel.com>
Message-ID: <cd3fabe8-7a8c-16bd-bc26-4287f7a1eb4d@linux.intel.com>
Date: Wed, 12 May 2021 13:17:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CACWQX82QSD=1nZAYkP=CO=-ch_YcbRXmyvLt743F-hGspTNPqw@mail.gmail.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

W dniu 5/11/2021 o 18:26, Ed Tanous pisze:
> On Tue, May 11, 2021 at 7:53 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>>
>> On Tue, Apr 27, 2021 at 01:52:51PM +0200, Ambrozewicz, Adrian wrote:
>>> W dniu 4/9/2021 o 14:05, Patrick Williams pisze:
>>>> On Wed, Apr 07, 2021 at 02:24:55PM +0200, Ambrozewicz, Adrian wrote:
>>>>
>>>> I suspect this would be the more difficult direction to go down.  There
>>>> is already enough code that looks for sensors at specific paths that
>>>> you'd have to track down and fix up.  Also, there has been some concern
>>>> by some maintainers in other cases about having information in the paths
>>>> have meaning and prefering to reduce the reliance on that.
>>>>
>>>
>>> Please see message from Ed, as he's supposedly proposing to follow that
>>> path. I don't have strong opinions on one or the other approach.
>>
>> I suspect you are not signing up to change all the existing code.  I'll
>> look at Ed's reply though.
>>

Crisis averted - paths and names dropped out from scope :)

>>> I've read the design, however one thing is not clear for me. My current
>>> understanding was that for each association there would need to exist
>>> some D-bus object at given path somewhere. Would i need my CPU inventory
>>> service to also expose separate objects for each core for my association
>>> to be 'legal', or could we represent some virtual hierarchy with no
>>> actual D-Bus object in the system?
>>
>> Yes.  You would need an inventory object for each entity you want to
>> attach sensors or metrics to.  This doesn't seem like it should really
>> be an issue.  Other people have been working on adding CPU Cores already
>> and there is the xyz.openbmc_project.Inventory.Item.CpuCore defined.
>>

Thanks for pointing that out. It seems like logical path to follow. Do 
you have some pointers to some reviews or discussion? CpuCore as of now 
is empty.

>>>>> I've done some PoC implementation of ProcessorMetrics, which relies on
>>>>> new D-Bus interface with 'Mapping' property (eg. 'TemperatureCelsius' or
>>>>> 'CoreMetrics/12/UnhaltedCycles'). ProcessorMetrics node implementation
>>>>> queries D-Bus for all sensors associated with given CPU and populates
>>>>> properties if proper mapping was found.
>>>>
>>>> I'm not really grasping what the contents of this mapping property are.
>>>> Generally we want to stay away from free-form strings having programatic
>>>> uses.  Maybe if you can define these mappings as enumerations?
>>>>
>>>> What is the additional information you need besides the assocation from
>>>> a sensor to its inventory item?
>>>
>>> In given example I would like my sensor to be source of information for
>>> property defined by ProcessorMetrics schema. In the example I've used
>>> property associated with given Core, thus CoreMetrics/12/UnhaltedCycles
>>> maps directly to ProcessorMetrics sub-property. Enumerations could be
>>> not enough as we have multiple informations to represent:
>>> - association with given processor (done by ProcessorMetrics)
>>> - association with given core (could that be handled by your proposed
>>> design?)
>>> - linking to given property
>>>
>>> Would the enumeration be used for the last element, while leaving
>>> hierarchy problem to Associations?
>>
>> "UnhaltedCycles" is not a sensor, just to be clear.  IPMI might have
>> called these kinds of things sensors but we do not.  Sensors for us
>> measure physical properties.  This is just a property (or maybe a
>> "metric") but it doesn't belong in the sensors namespace or modeled with
>> a Sensor.Value.

Up to this point we've established, that sensors/metrics would be linked 
to given item by association. That leaves figuring out how to 'glue' 
together Redfish property with given D-Bus entity.

> 
> This somewhat brings up a good point, what is a "sensor" on dbus?  I
> would've assumed that these would be well represented as sensors, as
> they do measure physical properties.  I hadn't assumed that they had
> this limitation because we do have the
> /xyz/openbmc_project/utilization namespace defined already.  If we're
> going down the path of "must be physical" it would seem like
> utilization should be moved out of the sensors interface?  Or am I
> taking your statement too literally?
> 

Agreed. I suppose we should forget about 'old ways' and previous meaning 
of IPMI sensor. BTW Redfish specifies such properties as 'metrics'.

What are the limitations of Sensor.Value interface when it comes to 
representing values in ProcessorMetrics and similar schemas?

ProcessorMetrics uses such units for its metrics:
- bytes
- % (already available as 'utilization')
- MHz
- Cel (altready available as 'temperature')
- count (number of events/occurrences)

I suppose that we could just extend namespaces and units of Sensor.Value 
to cover them and call it a day. We would retain compatibility with 
existing sensors code, TelemetryService etc. (I agree with below comment 
by Ed). I am aware, that when more schemas and metric types comes this 
list will grow, but do we have other alternative?

What are your thoughts? If Sensor.Value is not the way, then how would 
we define the next interface?

> Not reusing sensor seems like it would lead to a lot of code
> duplication, as every API would now need to understand everything
> about every "publishes real time telemetry" type interface, and every
> time we add a new one, we'd (probably) have to update the code to add
> the new type.  That doesn't really seem maintainable to me for every
> type of telemetry we might want;  If a sensor isn't the right place to
> put it, how would we solve the "I want to publish all telemetry
> values" type use cases?  Maybe namespace the interface itself, so we
> can use the arg0namespace feature in match expressions?  I'm thinking
> out loud at this point...
> 
>> I don't know why the "linking to a given property" would be a dbus
>> representation.  Metric service should know which properties from dbus
>> map to some metric entity, right?  For a one-user piece of information,
>> I don't see a good reason to put this on dbus.
> 
> I think the issue here is how do you know that a specific value
> relates to say, the processor utilization, or the ram utilization, or
> the smart statistics?

Yes, this is the gap we still need to address. Perhaps idea with with an 
well defined enum is not a bad one?

Taking an example of ProcessorMetrics\CoreMetrics[]\UnhaltedCycles
We would have an D-Bus sensor with given interfaces:

xyz.openbmc_project.Association.Definitions
.Associations	{"cpucore", "all_sensors", "/xyz.../core/5"}

xyz.openbmc_project.Sensor.Value
.Unit		"Count" # new unit
.Value		123123

xyz.openbmc_project.CpuCore.Metrics # New imagined interface with enum
.Type		"UnhaltedCycles"

> 
>>
>> --
>> Patrick Williams

Thanks a lot for your input, it seems like we're going in good direction.

