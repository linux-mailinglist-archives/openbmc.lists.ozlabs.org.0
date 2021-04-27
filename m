Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FC836C55F
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 13:39:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FV0Cf4L3kz302f
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 21:39:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FV0CQ3n64z2xfk
 for <openbmc@lists.ozlabs.org>; Tue, 27 Apr 2021 21:38:57 +1000 (AEST)
IronPort-SDR: cZhdR3pDrr6TY5qN311v8poITkXWm8qnkLjpXb/bZnBNuMgprWWM1yOENBJajEgk05lP1zrhcj
 rRH9aadYEtUA==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="217199900"
X-IronPort-AV: E=Sophos;i="5.82,254,1613462400"; d="scan'208";a="217199900"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 04:38:53 -0700
IronPort-SDR: YoSVsPPBemD3N53qtN8C4twGbF5s+/Og7Bzje6GLL8vXIa81zMFniyP5WYPk5T67J6Dqz7pcAa
 ZmKI0QXXd5VQ==
X-IronPort-AV: E=Sophos;i="5.82,254,1613462400"; d="scan'208";a="465458337"
Received: from aambroze-mobl.ger.corp.intel.com (HELO [10.213.24.207])
 ([10.213.24.207])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 04:38:51 -0700
From: "Ambrozewicz, Adrian" <adrian.ambrozewicz@linux.intel.com>
Subject: Re: Mapping standard D-Bus sensors to ProcessorMetrics (and other
 specific schemas)
To: Ed Tanous <ed@tanous.net>
References: <f9127788-7f8a-59ed-e434-0f510773d2aa@linux.intel.com>
 <CACWQX83XMxm5UW1pwyqpdaqVtfvWRWMyuTbmjuZvm+7y1PXYqg@mail.gmail.com>
Message-ID: <431289e9-85bc-26c6-4b14-f273415ac3c8@linux.intel.com>
Date: Tue, 27 Apr 2021 13:38:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CACWQX83XMxm5UW1pwyqpdaqVtfvWRWMyuTbmjuZvm+7y1PXYqg@mail.gmail.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

W dniu 4/9/2021 o 17:27, Ed Tanous pisze:
> On Wed, Apr 7, 2021 at 5:26 AM Ambrozewicz, Adrian
> <adrian.ambrozewicz@linux.intel.com> wrote:
>>
>> Hi,
>>
>> Currently bmcweb exposes sensors as part of Chassis subnodes in Sensors,
>> Power and Thermal schemas. All of them lists sensors as arrays of
>> generic properties distinguished by Id/Name etc. On the other hand - for
>> well-defined metrics Redfish specifies concrete schemas like
>> ProcessorMetrics and MemoryMetrics. They define designated Redfish
>> properties with given name and value type.
>>
>> I'm starting to explore ways to implement these schemas in bmcweb, while
>> retaining interoperability with TelemetryService. This requirement
>> implicates, that source of these properties should implement
>> xyz.openbmc_project.Sensor.Value interface and comply with OpenBMC D-Bus
>> sensors architecture, which enforces predefined paths and units for
>> various types of sensors.
>>
>> Question of extending xyz.openbmc_project.Sensor.Value interface (so it
>> allows for more types or nested paths, if necessary) is something  I
>> know should be considered, but seems like more or less straightforward
>> to address.
>
> I'm not following this statement.  From my perspective, this is
> something we've already solved at a dbus level.  To attach a "sensor"
> to a given inventory item, set up the association back to said
> inventory item.  Today, we only connect things to Redfish "Chassis",
> because that's currently the only node with sensors, but that's
> certainly easy to change and there's nothing about the API that
> prevents doing that.
>
That is correct. Technically we have all the pieces to integrate sensor 
with Redfish in general (Associations, standard sensor types and APIs). 
Challenge lies below.

> Beyond that, because MemoryMetrics and ProcessorMetrics schemas call
> out specific sensor names, I suspect we need to come up with a well
> defined set of names;  If you want to populate MemoryMetrics, you
> would expose sensors, with associations back to the dimm in question,
> and have a sensor called, say,
> /xyz/openbmc_project/remaining_block_percentage, and map that to the
> RemainingSpareBlockPercentage property.
>
Is the path you've provided just a shortcut for full D-bus sensor path, 
or do you have something else in mind? I will assume the former.

D-Bus sensor path is composed of : 
/xyz/openbmc_project/{namespace/type}/{name}. Do you propose to encode 
sensor name in such a way, that bmcweb (and IPMI,PLDM, whatever) would 
be able to identify exact meaning of the value if they need to? Bear in 
mind that we have several issues to consider here:
- multiple items (eg. Processors) exposing the same data, names would 
need to be unique in that regard
- certain properties are singular (CPU-wide) while other are buried down 
the hierarchy (mentioned UnhaltedCycles of Core#12).

This would lead to names like: 
/xyz/openbmc_project/sensors/counter/cpu1_core12_unhaltedcycles .

Don't get me wrong - this seems like quite flexible approach, however it 
lacks standardization. If I understood response form Patrick correctly - 
there is urge to avoid storing information in D-Bus path. Do you think 
that would be acceptable to introduce this logic (name-encoding) in bmcweb?

>>
>> There is bigger issue I see now - mapping D-Bus sensors to concrete
>> Redfish properties. Mapping sensors at inventory level is sorted out
>> with use of xyz.openbmc_project.Association.Definitions interface.
>> However - I don't see (or know of) any method to link given D-Bus sensor
>> with it's designated place in Redfish schema.
>
> This is by design.  Dbus should largely have no reliance on any
> specific protocol, and we shouldn't be building interfaces that
> require daemons pushing data on the bus to have any knowledge of
> Redfish, IPMI, PLDM, or protocol of next year.  This generally means
> that some dbus->redfish transforms are not as efficient or clean as
> they could be, but it keeps that logic quarantined into bmcweb.  I
> suspect bmcweb will need logic to translate redfish URI + property
> name to dbus path, and this logic will be non-trivial.
>
Point taken - mapping data (in whatever form it will be available) 
should be generic and domain agnostic.

>> I've done some PoC implementation of ProcessorMetrics, which relies on
>> new D-Bus interface with 'Mapping' property (eg. 'TemperatureCelsius' or
>> 'CoreMetrics/12/UnhaltedCycles'). ProcessorMetrics node implementation
>> queries D-Bus for all sensors associated with given CPU and populates
>> properties if proper mapping was found.
>
> Do you have a pointer to it?  It'd be good to see the code you're  > thinking of.
>
Code itself is boilerplate D-Bus sensor service with one extra property. 
New property contains data encoded in the string, which you already 
proposed to be part of the name. Should you have need to work on some 
shared code to work out PoC in the flesh - let me know.

> With that said, I would be against this approach.  This would require
> clients to hardcode in, say, BlocksWritten, as a mapping, which means
> that as we have more than just redfish, now each client needs to
> hardcode the Redfish representation, the PLDM representation, and the
> IPMI representation of the same data.  That seems messy.
>
>>
>> Is my PoC approach described above feasible for OpenBMC? What are your
>> thoughts? I would like to start a discussion and hear your proposals
>> about possible alternatives.
>>
>> Regards,
>> Adrian
