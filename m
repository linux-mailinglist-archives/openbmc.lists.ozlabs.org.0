Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8168D36C5A3
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 13:54:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FV0Y13HDlz2yxk
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 21:54:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 65 seconds by postgrey-1.36 at boromir;
 Tue, 27 Apr 2021 21:54:03 AEST
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FV0Xq3sSwz2xYx
 for <openbmc@lists.ozlabs.org>; Tue, 27 Apr 2021 21:54:02 +1000 (AEST)
IronPort-SDR: +q/aAIPz12TTkalrnrSQ/fD6d5vmcexefzVGo+IHcOe9zn0m8JY6IN1gQzqSiq/wZHkIwfGNod
 WOrFlf0xOM2Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="196046476"
X-IronPort-AV: E=Sophos;i="5.82,254,1613462400"; d="scan'208";a="196046476"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 04:52:56 -0700
IronPort-SDR: o4HvMlfx2E/WXkLXbgKsA88A680j6vD6Exp65Ia4isRF+7QlqPK/NIpj4OfN0G4cHW9G+fiRzY
 xYrtq0YHbxtg==
X-IronPort-AV: E=Sophos;i="5.82,254,1613462400"; d="scan'208";a="465461850"
Received: from aambroze-mobl.ger.corp.intel.com (HELO [10.213.24.207])
 ([10.213.24.207])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 04:52:54 -0700
Subject: Re: Mapping standard D-Bus sensors to ProcessorMetrics (and other
 specific schemas)
To: Patrick Williams <patrick@stwcx.xyz>
References: <f9127788-7f8a-59ed-e434-0f510773d2aa@linux.intel.com>
 <YHBDIZqvHI0THFh3@heinlein>
From: "Ambrozewicz, Adrian" <adrian.ambrozewicz@linux.intel.com>
Message-ID: <3d5f8ede-3506-afac-d5bd-4bc7f3331cbc@linux.intel.com>
Date: Tue, 27 Apr 2021 13:52:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YHBDIZqvHI0THFh3@heinlein>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

W dniu 4/9/2021 o 14:05, Patrick Williams pisze:
> On Wed, Apr 07, 2021 at 02:24:55PM +0200, Ambrozewicz, Adrian wrote:
>> Question of extending xyz.openbmc_project.Sensor.Value interface (so it
>> allows for more types or nested paths, if necessary) is something  I
>> know should be considered, but seems like more or less straightforward
>> to address.
> 
> I suspect this would be the more difficult direction to go down.  There
> is already enough code that looks for sensors at specific paths that
> you'd have to track down and fix up.  Also, there has been some concern
> by some maintainers in other cases about having information in the paths
> have meaning and prefering to reduce the reliance on that.
> 

Please see message from Ed, as he's supposedly proposing to follow that 
path. I don't have strong opinions on one or the other approach.

>> There is bigger issue I see now - mapping D-Bus sensors to concrete
>> Redfish properties. Mapping sensors at inventory level is sorted out
>> with use of xyz.openbmc_project.Association.Definitions interface.
>> However - I don't see (or know of) any method to link given D-Bus sensor
>> with it's designated place in Redfish schema.
> 
> I think associations are the right approach to link sensors with
> inventory items.  There is a design document underway to define some of
> those assocations for inventory items and it seems like your needs
> should be an extension to that.
> 
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/41468/4/architecture/dbus-inventory.md
> 
Thanks for the link. I linked my sensor to concrete CPU with 
Association, similarly to already existing bmcweb Processors node 
implementation. Will your extension be able to provide even 'deeper' 
associations? For ProcessorMetrics we would need to map for CPU_X\Core_Y.

I've read the design, however one thing is not clear for me. My current 
understanding was that for each association there would need to exist 
some D-bus object at given path somewhere. Would i need my CPU inventory 
service to also expose separate objects for each core for my association 
to be 'legal', or could we represent some virtual hierarchy with no 
actual D-Bus object in the system?

>> I've done some PoC implementation of ProcessorMetrics, which relies on
>> new D-Bus interface with 'Mapping' property (eg. 'TemperatureCelsius' or
>> 'CoreMetrics/12/UnhaltedCycles'). ProcessorMetrics node implementation
>> queries D-Bus for all sensors associated with given CPU and populates
>> properties if proper mapping was found.
> 
> I'm not really grasping what the contents of this mapping property are.
> Generally we want to stay away from free-form strings having programatic
> uses.  Maybe if you can define these mappings as enumerations?
> 
> What is the additional information you need besides the assocation from
> a sensor to its inventory item?
> 

In given example I would like my sensor to be source of information for 
property defined by ProcessorMetrics schema. In the example I've used 
property associated with given Core, thus CoreMetrics/12/UnhaltedCycles 
maps directly to ProcessorMetrics sub-property. Enumerations could be 
not enough as we have multiple informations to represent:
- association with given processor (done by ProcessorMetrics)
- association with given core (could that be handled by your proposed 
design?)
- linking to given property

Would the enumeration be used for the last element, while leaving 
hierarchy problem to Associations?


