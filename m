Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B90E21FF97
	for <lists+openbmc@lfdr.de>; Tue, 14 Jul 2020 23:09:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5tSb52RJzDqXQ
	for <lists+openbmc@lfdr.de>; Wed, 15 Jul 2020 07:09:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5tRh3BF2zDqG9
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jul 2020 07:09:02 +1000 (AEST)
IronPort-SDR: tWnGfTJfi9gIoWERf2uxOW71QM36JCK+vh97/9PiCVxDpU5AQBLl5JdrpZ6Rprw8Jlxx+p2ojH
 4lWMGzBFphCQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="213806091"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="213806091"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 14:08:59 -0700
IronPort-SDR: AuFqAQfKdJQSL+GpLmlzBD4dQQ4cUFF03Gc/wKBqyv8NcxB1SPj1GCZIZosHTIc+L+swDUEJEt
 brWK1VBqOPcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="299673373"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.254.179.82])
 ([10.254.179.82])
 by orsmga002.jf.intel.com with ESMTP; 14 Jul 2020 14:08:59 -0700
Subject: Re: Redfish EventService Implementation
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org,
 "Jason >> Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "Puli, Apparao" <apparao.puli@linux.intel.com>
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
 <b62c0b2d-55fb-ffc7-5e29-2716f665f86d@linux.intel.com>
 <09cf469e-ddc3-1206-efeb-54dd59a334d5@linux.vnet.ibm.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <9f44403a-3852-4b41-2a68-89dc84d30a23@linux.intel.com>
Date: Tue, 14 Jul 2020 14:08:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <09cf469e-ddc3-1206-efeb-54dd59a334d5@linux.vnet.ibm.com>
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

On 7/12/2020 11:32 PM, Ratan Gupta wrote:
> Hi James,
> 
> As you asked for the examples in the 
> thread(https://lists.ozlabs.org/pipermail/openbmc/2020-June/022125.html), I 
> have created the mapping at the following location.
> 
> https://gist.github.com/ratagupt/0aa4da098a60d49af90a7e4a6ea6d5f2

Thanks for the examples.

> 
> 1) Map1: Mapping between redfish resources to Dbus resources

How does this work when the mapping isn't 1:1 vs D-Bus? Most of the time 
the enums to not match the d-bus enum, or take multiple d-bus interface 
to distinguish what the value should be. Also how does this work for 
discovered things, like multiple chassis?


> 2) Map2: Mapping between redfish resource types to the ineterested Dbus 
> interfaces
> 3) Map3: Mapping between Dbus resources to redfish resources
> 
> 
> I tried to cover the following scenario in the above mapping.
> 
> * Redfish resource is mapped to multiple Dbus Resources
> * Redfish Property is mapped to single Dbus property
> * Redfish Property(complex property) is mapped to multiple dbus property.
> * Same type of Redfish Resources are mapped to different Dbus Resources
> * Redfish node url having multiple regex : Yet to take a look on this.
> >
> Flow would be like as below
> 
> => In bmcweb each Redfish node represents to a Redfish Resource.
> => Each node will be having it's own mapping between Redfish properties 
> and the Dbus Resources.
> 
> => Some code on bmcweb will walkthrough on each node during startup , 
> get this mapping from each node and generate
>     two mappings
>     1) Reverse mapping (Dbus Resource to Redfish Resource)(MAP3) and
>     2) mapping between Resource Types to the interested Dbus 
> interfaces(MAP2)
> 
> => To start with we will support few resource types and then scale it up 
> as needed.

I think we need an idea of what the final solution will look like for 
more complicated properties, or we'll be creating something that isn't 
future proof.

> 
> => Map2 would be used when the Redfish client subscribe for the 
> ResourceType to get the Dbus mappings.
> 
> => Map3 would be used when the Dbus signal gets generated and need the 
> Redfish mappings.

Why can't these be the same mapping? I think having 3 different maps 
makes this very confusing. I also think this is attempting to generalize 
the problem too early. If you look at the Redfish code to determine some 
of the more complicated properties, sometimes it takes quite a bit of 
logic. That logic also would possibly be nice to reuse. Maybe we can 
take your idea of a match with a callback to some of the already 
existing property parsing? Obviously it would need some cleaning up, but 
I could see something with a map of schemas/properties to function 
pointers for property parsing.

> 
> => Once we have all thsese mapping gets generated and loaded into the 
> memory, bmcweb would start listening
>     for the interfaces listed in map2.

Why aren't these compiled in? I don't see why they need to be loaded, 
could just be in code. Also, they shouldn't be added as matches until 
there is a subscriber, or we'll add many unneeded matches.

> 
> => Once any Dbus signal gets generated map3 would be used to get the 
> Redfish mapping.
> 
> Please let me know if you have any concerns with this approach.
> 
> Ratan
