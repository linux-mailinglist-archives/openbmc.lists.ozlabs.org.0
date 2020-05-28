Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3051E67A3
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 18:43:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Xtn15SrCzDqb0
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 02:43:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Xtlp1RJ6zDqZD
 for <openbmc@lists.ozlabs.org>; Fri, 29 May 2020 02:42:28 +1000 (AEST)
IronPort-SDR: 7v3DjIT9Vhfb+gMxH9M9KNaWWmejjHplswwgOh6faBdgO3fQ5cn4pe3oI5KcjNKzHw4t7fgW7x
 o9CcL/lVC/rA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2020 09:42:24 -0700
IronPort-SDR: P/3HYWpC2yOvfZCtX3jCHPOASWXYaHHsl9t7FUoxm44wyiF1I1ZEOuh99SCIdGD0RWi+2/kxRF
 CMETRmivI2Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,445,1583222400"; d="scan'208";a="285223502"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.251.53.138])
 ([10.251.53.138])
 by orsmga002.jf.intel.com with ESMTP; 28 May 2020 09:42:20 -0700
Subject: Re: D-Bus interface to provide data to entity manager
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>,
 Patrick Williams <patrick@stwcx.xyz>
References: <7d8ba039-377f-c567-6a3d-5a18c4789df2@linux.vnet.ibm.com>
 <5fc67500-b0f4-c964-fc9a-d3f5346e47ab@linux.vnet.ibm.com>
 <20200528120331.GC17541@heinlein>
 <0942393e-4475-5249-4918-4125e85ec554@linux.vnet.ibm.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <17ad5a3d-e69b-0005-4bc3-950e590093bb@linux.intel.com>
Date: Thu, 28 May 2020 22:12:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <0942393e-4475-5249-4918-4125e85ec554@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "Bhat, Sumanth" <sumanth.bhat@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 5/28/2020 5:54 PM, Deepak Kodihalli wrote:
> On 28/05/20 5:33 pm, Patrick Williams wrote:
>> On Tue, May 26, 2020 at 06:26:27PM +0530, Deepak Kodihalli wrote:
>>> On 19/05/20 9:10 am, Deepak Kodihalli wrote:
>>> To do a) above, there are 3 options:
>>>
>>> 1) Propose a D-Bus interface in phosphor-dbus-interfaces. This was [2]
>>> in my original email above. The concern raised by Patrick here is that
>>> this interface is very specific to a protocol (PLDM in this case),
>>> whereas the phosphor D-Bus interfaces are mostly abstract and protocol
>>> agnostic.
>>>
>>> In my opinion, PLDM is also a data model, so PLDM specific D-Bus
>>> interfaces can enable two apps that are PLDM aware (for eg a PLDM
>>> requester app talking to the PLDM daemon) to talk to each other. I do
>>> see other protocol specific D-Bus interfaces as well (for eg related to
>>> SMBIOS). So I don't really understand the concern. The protocol 
>>> specific
>>> interfaces do not preclude other abstract interfaces.
>>
>> After thinking about it for a bit, I think this is my preference with
>> the design caveat that these are only consumed by processes which are
>> "FRU-to-Inventory" transformers.  I would suggest putting these
>> interfaces under the 'Inventory/' namespace somewhere to hopefully make
>> this clearer.
>>
>> We have two implementations of these "FRU-to-Inventory" transformers: EM
>> and PIM.  Both of them have a form of dbus backdoor in order to get the
>> information they need to create the Inventory objects they host.  PIM 
>> uses
>> `Inventory/Manager`[1] and EM uses an undocumented `FruDevice` interface
>> between it and 'fru-device'.  Both of these implementations do
>> processing on the data they get (though, very minimal in the case of
>> PIM) and create `Inventory/Item`s as a result.
>>
>> What I am worried about, and Richard seconded in his response, is the
>> details of PLDM (or any other protocol) starting to leak into other
>> processes.  We don't want people to notice that there is some piece of
>> information that isn't currently exposed via Inventory but happens to be
>> available in PLDM and start coding towards consuming it.  Hence, my
>> request that the design document the caveat I listed above.  We want to
>> limit the scope of applications that need to understand specific
>> protocols.
>>
>> My suggestion would be to put these new proposed PLDM interfaces under
>> `Inventory/Source/PLDM`.  Anything under `Source` becomes one of these
>> "FRU-to-Inventory" transformational interfaces.
>
[Richard]:

Patrick / Deepak

Why do we need to have 2 different interfaces to represent the same 
information for FRU-to-inventory transformational (say ProductName). 
This will make inventory manager to be updated for every FRU producer?. 
Many of the properties are common, and we can form a common interface 
for that, and rest can be maintained in it's specific interface. I 
understand that current FRU to Entity-manager interface seems to be 
private, but we must make a common interface to represent like Product 
Name, PartNumer, Serial Number etc. (instead of maintaining it in 
different interface saying IPMI / PLDM Source, with different types). 
How about?

Inventory/Source/General/Fru  (Maintain common things here Product Name. 
This can be used by Inventory manager to advertise it (instead of 
searching it in multiple interfaces/properties))

Inventory/Source/PLDM   (Maintain PLDM specific stuff's here, say SKU, 
Engineering change level, IANA etc).

Inventory/Source/IPMI (Maintain IPMI FRU specific here)

Regards,

Richard

> Makes sense to me. This makes the intent clearer. I've updated my 
> commit on Gerrit. Please re-review.
>
> Thanks,
> Deepak
>
>> 1. 
>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Inventory/Manager.interface.yaml
>
