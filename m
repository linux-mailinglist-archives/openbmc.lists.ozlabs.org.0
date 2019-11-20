Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBF4104265
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 18:47:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47J9Bt249qzDqst
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2019 04:47:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47J9BF2729zDqkX
 for <openbmc@lists.ozlabs.org>; Thu, 21 Nov 2019 04:47:15 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2019 09:47:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,222,1571727600"; d="scan'208";a="237824649"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga002.fm.intel.com with ESMTP; 20 Nov 2019 09:47:11 -0800
Subject: Re: Redfish OpenBMC OEM
To: Joseph Reynolds <jrey@linux.ibm.com>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <bec7abfa-8a69-3c8b-7985-dccb80d5c674@linux.vnet.ibm.com>
 <dcfd49c5-48a1-12aa-2f1e-56aef6232cfc@linux.ibm.com>
 <0967abf5-7eb4-8b72-2fe7-d8d4a95ca856@linux.intel.com>
 <5e21e041-aa40-f1a1-e4eb-9aed63db368a@linux.ibm.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <b2654349-f0bf-b341-5736-618dfa2c1fa9@linux.intel.com>
Date: Wed, 20 Nov 2019 09:47:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <5e21e041-aa40-f1a1-e4eb-9aed63db368a@linux.ibm.com>
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
Cc: jason.m.bills@linux.intel.com, apparao.puli@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/20/19 7:57 AM, Joseph Reynolds wrote:
> On 11/19/19 1:04 PM, James Feist wrote:
>> On 11/19/19 10:03 AM, Joseph Reynolds wrote:
>>> On 11/19/19 10:23 AM, Gunnar Mills wrote:
>>>> Hi All,
>>>>
>>>> The process seems a little light for adding OpenBMC OEM Redfish 
>>>> properties and schemas. Can we establish a little more stringent 
>>>> process for adding these? Can we try to upstream these to the 
>>>> Redfish standard first before they are added as OpenBMC OEM? Do we 
>>>> need a design template or someway to collaborate before the OpenBMC 
>>>> OEM schema or properties are added? Are we okay if pretty 
>>>> architectural-specific or company-specific properties and schemas 
>>>> are under the "OpenBMC" OEM namespace?
>>>>
>>>
>>> I suggest getting started with a survey of what the project has. 
>>> Given that we have Redfish Oem.OpenBMC Properties, we should document 
>>> them (suggest: docs/designs/Redfish-Oem-Resources.md and using a 
>>> format similar to the Redfish spec).  Doing so will help:
>>> - users know what to expect from the interfaces,
>>> - developers to understand the interface, and
>>> - the OpenBMC community to help move these fields into the Redfish spec.
>>>
>>> The proposed Redfish-Oem-Resources document would serve as a good 
>>> focal point for collaboration within OpenBMC as to how we want to 
>>> extend the Redfish spec.
>>
>> There is already schema checked in for everything Oem, refer 
>> https://github.com/openbmc/bmcweb/tree/master/static/redfish/v1/schema
>>
>> OemAccountService
>> OemComputerSystem
>> OemManager
>>
>> Redfish uses schema to define these things, I'd rather continue using 
>> the schema files instead of creating a new document that could become 
>> out of date quickly.
>>
> 
> James, thanks for that reference.  You're way ahead of me.
> 
> Would the bmcweb/static/redfish/v1/schema directory be an adequate focal 
> point for collaboration?  I think so:
>   - Is it complete?  Does it list all of the OpenBMC Oem resources? Or 
> (contrarywise) does OpenBMC have Oem resources which are not represented 
> in that collection?

To the best of my knowledge it is complete, as we require the validator 
to be ran, and the validator would not pass without these schema.

>   - It seems like it is easy to search.
>   - It would be easy to identify proposed changes to files in this 
> directory during a gerrit review.
> 
> Gunnar, does that begin to address your concern?
> 
> - Joseph
> 
>>
>>>
>>> Reference:
>>> Oem Resources are described in the Redfish spec (DSP0266) in the Data 
>>> model chapter under multiple section such as OEM Resources and 
>>> Resource extensibility.
>>>
>>> It seems to me that "OpenBMC" should be used for common elements and 
>>> "company name" (such as "OpenPower" or "IBM") used when appropriate. 
>>> Once again, the OpenBMC community needs to have a focus in this area 
>>> to sort this out.  IMHO, having a document like 
>>> Redfish-Oem-Resources.md would help.
>>>
>>>
>>>> I think a majority of the OEM properties in the "OpenBMC" OEM 
>>>> currently are things Redfish would take. I would like to see us 
>>>> engage Redfish first.
>>>
>>> Agreed.  I understand this statement to mean that we should try to 
>>> upstream new Resources into the Redfish spec first, before we accept 
>>> them as Oem.OpenBMC resources.  Also, we should try to upstream the 
>>> existing OpenBMC resources into Redfish.
>>>
>>> I think having a Redfish-Oem-Resources document would help provide 
>>> focus to that effort.
>>>
>>> - Joseph
>>>
>>>>
>>>> Some examples:
>>>> FirmwareProvisioningStatus, 
>>>> https://github.com/openbmc/bmcweb/commit/a6349918ad2c88533c6d09bb876812375a19f2c4 
>>>>
>>>>
>>>> FanZones, 
>>>> https://github.com/openbmc/bmcweb/blob/a6349918ad2c88533c6d09bb876812375a19f2c4/static/redfish/v1/JsonSchemas/OemManager/index.json#L248 
>>>>
>>>>
>>>> Thanks,
>>>> Gunnar
>>>>
>>>
> 
