Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1AF1E474A
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 17:27:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XF7V213bzDqP0
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 01:27:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XF615TPgzDqBN
 for <openbmc@lists.ozlabs.org>; Thu, 28 May 2020 01:26:00 +1000 (AEST)
IronPort-SDR: PQb3+Cvk0CIw2doYEAg/hQ7T9cRCz9dHNuAF3vMHQpm26AKAoOG4sBwcz9Wgz3ykTL8D0tf4OX
 rjW6lThfvN6g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2020 08:25:43 -0700
IronPort-SDR: V99f8SUfpY7otmYhP1l4pfF7Lez0jm+/KzRP9a/tQUL6kYY09pzwdhnC+pyKJStGdx5PQpT8FP
 2nOwzqfjkVJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,441,1583222400"; d="scan'208";a="284837566"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.252.89.209])
 ([10.252.89.209])
 by orsmga002.jf.intel.com with ESMTP; 27 May 2020 08:25:40 -0700
Subject: Re: D-Bus interface to provide data to entity manager
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 James Feist <james.feist@linux.intel.com>,
 "Bhat, Sumanth" <sumanth.bhat@intel.com>,
 Patrick Williams <patrick@stwcx.xyz>
References: <7d8ba039-377f-c567-6a3d-5a18c4789df2@linux.vnet.ibm.com>
 <5fc67500-b0f4-c964-fc9a-d3f5346e47ab@linux.vnet.ibm.com>
 <0a9b8934-a3be-aaa0-90c0-134f286df951@linux.intel.com>
 <c2872079-ffba-1788-69b5-50350e21f1a3@linux.vnet.ibm.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <55702d05-66c0-275e-880b-06e6c7c1203e@linux.intel.com>
Date: Wed, 27 May 2020 20:55:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <c2872079-ffba-1788-69b5-50350e21f1a3@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 5/27/2020 7:28 PM, Deepak Kodihalli wrote:
> On 27/05/20 7:20 pm, Thomaiyar, Richard Marian wrote:
>> I always view D-Bus interface as a specification / API which can work 
>> with different producers / consumers (correct me, if that's not what 
>> we intend with D-Bus interface here). Problem with Option 1 is, it 
>> will end up in having multiple producers exposing different 
>> interface, and thereby consumers(user interface facing applications) 
>> of D-Bus must be aware about all the D-Bus interfaces and always 
>> requires change.
>>
>> Consider, we want to expose ChassisType, then irrespective of PLDM 
>> FRU / IPMI FRU / Proprietary FRU, Consumer applications must read it 
>> in the same manner. Having different interface / property types, 
>> requires update in both the end. PLDM FRU / IPMI FRU can be in common 
>> form (except few nit's /OEM's). We need to make sure it is 
>> represented in that angle. As of today phosphor-dbus-interfaces 
>> doesn't have FRU interface, but it has inventory related interfaces 
>> (exposed by Entity-Manager), which is what Redfish uses (i.e. 
>> Indirectly the FruDevice exposed interface is hidden by 
>> Entity-manager, and inventory interface exposed by entity-manager is 
>> used).
>>
>> As of today, entity-manager doesn't add Inventory interface 
>> automatically for Add-on cards (which doesn't have any json 
>> configuration), but needs exposure (say PLDM based Add on card 
>> devices will be of this type), but shouldn't be hard to add it anyway.
>>
>> Now the question is do we want to expose FRU as a separate interafce 
>> to be used in User facing application, or shall we just use Inventory 
>> based interface itself ?If inventory itself can be used, then let's 
>> go ahead and add more fields to those if missing anything / correct 
>> the same accordingly.
>>
>> James, Deepak, Patrick - your thoughts ?
>
> I guess there is a difference between FRU and inventory. If inventory 
> interfaces could be used directly, why wouldn't the FruDevice or PLDM 
> apps directly host inventory objects, why even use EM?
>
[Richard]: Inventory.Decorator is used in Redfish. i.e. Today Frudevice 
& it's interface exposed is consumed by Entity-Manager alone & Entity 
manager exposes all the needed configuration along with 
Inventory.Decorator.Asset interface. (As you stated, inventory does more 
than what FRU has to expose, but i am trying to see can we use 
Inventory.Decorator itself to expose these needed FRU information?). 
James F ? (Maintainer of both EM & bmcweb)

Current Behavior:

Say - Baseboard fru information is exposed by FruDevice, and Entity 
Manager exposes the sensor or any configuration required for platform A 
or Platform B (based on fru device data). Entity-manager also expose 
Inventory interface which hides the manufacturer name exposed by FRU, 
but exposes the it as Manufacturer in the Inventory interface and 
Redfish uses this).

In case of exposing the PLDM FRU

Option 1:

If we need to rely on PLDM FRU, then Entity-Manager will probe the 
FruDevice data exposed by PLDM FRU daemon, and expose the inventory 
(both for sensor configuration and decorator Asset), we don't change any 
upper layer application. We can follow the same design for the PLDM FRU 
daemon.

Note: Currently, it doesn't have a mechanism to expose all the FRU 
devices as Inventory.Decorator interface automatically when there is no 
json configuration for it in EM. This needs to be fixed (say for PLDM 
based Add-on card).

Option 2:

Define new FRU interface (common for both PLDM, IPMI etc.), similar to 
inventory and this itself will be used by both Entity-manager & user 
level interface application (say Redfish).

(Problem with option 2 is it requires changes in Currenr behavior, and 
redfish etc, may need to update it's code to use the common FRU 
interface rather than inventory.Decorator).

Regards,

Richard

> I believe these apps (FruDevice, PLDM daemon) operate at a per FRU 
> level, and rely on something like EM to make one or more inventory 
> objects based on the FRU data. So that was my option 2, a generic FRU 
> properties interface. I'm just not sure at the moment the 
> impact/interest of doing something like that and then aligning 
> FruDevice and EM to the same.
>
> Thanks,
> Deepak
>
>>
>> regards,
>>
>> Richard
