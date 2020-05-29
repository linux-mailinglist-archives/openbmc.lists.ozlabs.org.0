Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CCE1E7AAD
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 12:34:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YLXy3pvpzDqfS
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 20:34:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YLXF0BsCzDqZL
 for <openbmc@lists.ozlabs.org>; Fri, 29 May 2020 20:34:03 +1000 (AEST)
IronPort-SDR: j5gHFSp/UfZlWq/T/f0Pb+7SBNWzEINuNipoddHb8Zj3HuqiaGImlytAksnxkknBIPKZIYGawf
 Ek9vN7hABDpQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2020 03:34:00 -0700
IronPort-SDR: B8Se0I9fo50oQndPl0Lpo7xm/thFXsNFmIZ5tCZ6KMbewx/iIXeiBahydqoWJ6hzcAE3jB/Ij9
 I1EkK24LAJ5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,448,1583222400"; d="scan'208";a="267525007"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.252.89.33])
 ([10.252.89.33])
 by orsmga003.jf.intel.com with ESMTP; 29 May 2020 03:33:57 -0700
Subject: Re: D-Bus interface to provide data to entity manager
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>,
 Patrick Williams <patrick@stwcx.xyz>
References: <7d8ba039-377f-c567-6a3d-5a18c4789df2@linux.vnet.ibm.com>
 <5fc67500-b0f4-c964-fc9a-d3f5346e47ab@linux.vnet.ibm.com>
 <20200528120331.GC17541@heinlein>
 <0942393e-4475-5249-4918-4125e85ec554@linux.vnet.ibm.com>
 <17ad5a3d-e69b-0005-4bc3-950e590093bb@linux.intel.com>
 <20200528180555.GA1717@patrickw3-mbp.lan.stwcx.xyz>
 <fac63254-305a-fea2-36ba-a23597688da8@linux.vnet.ibm.com>
 <7e184454-b406-fc81-33e5-e03882743a95@linux.intel.com>
 <197ba71c-7b0a-d575-5370-bd43e741e9c6@linux.vnet.ibm.com>
 <f3d0be87-4415-b98c-c410-5c32afde3e09@linux.intel.com>
 <8d6bac73-21c7-4c4c-6fd3-630095399375@linux.vnet.ibm.com>
 <dde772cc-a7ef-e507-02f7-0e1bdb0ac0cb@linux.vnet.ibm.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <66b344ab-64d6-9191-c2aa-8f708343fcf4@linux.intel.com>
Date: Fri, 29 May 2020 16:03:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <dde772cc-a7ef-e507-02f7-0e1bdb0ac0cb@linux.vnet.ibm.com>
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


On 5/29/2020 4:00 PM, Deepak Kodihalli wrote:
> On 29/05/20 3:49 pm, Deepak Kodihalli wrote:
>> On 29/05/20 2:33 pm, Thomaiyar, Richard Marian wrote:
>>>
>>> On 5/29/2020 1:01 PM, Deepak Kodihalli wrote:
>>>> On 29/05/20 12:47 pm, Thomaiyar, Richard Marian wrote:
>>>>>
>>>>> On 5/29/2020 10:39 AM, Deepak Kodihalli wrote:
>>>>>> On 28/05/20 11:35 pm, Patrick Williams wrote:
>>>>>>> On Thu, May 28, 2020 at 10:12:19PM +0530, Thomaiyar, Richard 
>>>>>>> Marian wrote:
>>>>>>>>
>>>>>>>> On 5/28/2020 5:54 PM, Deepak Kodihalli wrote:
>>>>>>>>> On 28/05/20 5:33 pm, Patrick Williams wrote:
>>>>>>>
>>>>>>>> Why do we need to have 2 different interfaces to represent the 
>>>>>>>> same
>>>>>>>> information for FRU-to-inventory transformational (say 
>>>>>>>> ProductName). This
>>>>>>>> will make inventory manager to be updated for every FRU 
>>>>>>>> producer?. Many of
>>>>>>>> the properties are common, and we can form a common interface 
>>>>>>>> for that, and
>>>>>>>> rest can be maintained in it's specific interface. I understand 
>>>>>>>> that current
>>>>>>>> FRU to Entity-manager interface seems to be private, but we 
>>>>>>>> must make a
>>>>>>>> common interface to represent like Product Name, PartNumer, 
>>>>>>>> Serial Number
>>>>>>>> etc. (instead of maintaining it in different interface saying 
>>>>>>>> IPMI / PLDM
>>>>>>>> Source, with different types). How about?
>>>>>>
>>>>>> Richard, I have concerns with this approach. Like I mentioned in 
>>>>>> one my earlier emails, and Patrick also alludes to below, if you 
>>>>>> try to make this common (event if it's for a subset of the 
>>>>>> properties) then you basically arrive at the existing phosphor 
>>>>>> Inventory interfaces (eg Inventory.Decorator.Asset).
>>>>>>
>>>>>> My question in my earlier mail was, if you do such a thing, then 
>>>>>> why do you even need inventory producers? FruDevice and PLDM 
>>>>>> could have hosted inventory on their own. If they still rely on 
>>>>>> the inventory producers (EM and PIM) with this "common interface" 
>>>>>> approach, then it's basically re-implementation/duplications of 
>>>>>> the (Inventory.Decorator.Asset like) interface by two processes.
>>>>
>>>> Richard, what is your thought on the re-implementation/duplication 
>>>> concern above? I'm not sure if you answered that and I missed.
>>> [Richard]: FRU Consumers must be aware about each and every Format 
>>> specifically, even though it conveys same meaning.
>>
>> I agree with that, but my question was about FRU producers.
>>
>>
>>>>> [Richard]: Basically FRU information (either IPMI/PLDM) is needed 
>>>>> for the inventory producers to expose configuration, which FRU 
>>>>> will not have. Say, based on FRU Product name, either we will 
>>>>> expose 4 temp sensor / 2 (Now along with this one, we need to 
>>>>> inform the product name through Inventory.Decorator.Asset). Now 
>>>>> from Redfish point of it, Inventory.Decorator is what it uses. 
>>>>> This is what i was asking with 2 options in earlier mail (whether 
>>>>> to change or stick with it (recommended)).
>>>>
>>>>>>
>>>>>> The idea is for apps like FruDevice and PLDM, which are aware of 
>>>>>> a specific FRU format, to host data in *that* format, to be 
>>>>>> consumed *solely* by inventory producers (like EM and PIM).
>>>>>>
>>>>> [Richard]: Yes, but it doesn't need to expose those in that format?
>>>>
>>>> Why not?
>>> [Richard]: What's the advantage in keeping it in that format itself?
>>
>> The advantage I see is basically what you said on the next line.
>>
>>> This is used only by EM / PIM, and not by redfish directly right? 
>>> Where the intelligence must reside in the producer or consumer (With 
>>> producer, consumers can be in common form)
>>
>>>>> Say Manufacturer Name, it doesn't mater whether it is coming from 
>>>>> PLDM FRU / IPMI FRU. Say we have a special handling for a 
>>>>> particular manufacture / product, then irrespective of inventory 
>>>>> producers both can handle the same.
>>>>
>>>> This is what the Inventory.Decorator.Asset interface is for.
>>> [Richard]: Yes, That is exposed by EM / PIM in our case. Why EM / 
>>> PIM must rely on 2 different stuff, for common things is the 
>>> question here.
>>>>
>>>>> If we have 2 different interface, then inventory producer may need 
>>>>> to be aware about both and probe it accordingly.
>>>>
>>>> No, the "FRU" properties producer needs to be concerned only about 
>>>> the format it understands.
>>>
>>> [Richard]: FRU property producer must know the format and produce 
>>> the interface with data (in common form as much as possible). E.g. 
>>> IPMI FRU Producer (say xyz.openbmc_project.FruDevice service) will 
>>> read device A FRU, and expose the Manufacturer name (It can read the 
>>> EEPROM content and decode it as per the IPMI FRU format, but the 
>>> data it produces is Manufacturer name). Simiarly PLDM FRU Producer 
>>> (say xyz.openbmc_project.PLDM.FruDevice service) will read the data 
>>> using PLDM FRU commands, and expose the Manufacturer name. Now why 
>>> this 2 service need to have 2 different interface(one from 
>>> Inventory.Source.PLDM & another from Inventory.Source.IPMI, to 
>>> expose the Manufacturer name. ? Why Entity manager / PIM need to 
>>> read the same information from 2 different interface and expose it 
>>> in Inventory.Decorator.Asset. (It can do it with same interface).
>>
>> What is that interface?
>
>
> @Richard - to elaborate further - on Gerrit you suggest moving things 
> like Serial Number and Part Number to Inventory.Decorator.Asset. 
> However, note that these are already present in 
> Inventory.Decorator.Asset. Hence the question - why do want FruDevice, 
> PLDM, EM, PIM to all implement Inventory.Decorator.Asset?
[Richard]:  No. What i meant was to use Inventory.Source.Common for 
serial Number, part number etc (Fru to Inventory) and inventory producer 
will use the inventory.Decorator.Asset for redfish exposure.
>
>
>>> What Entity manager / PIM needs to do is using Object Mapper query 
>>> all the FruDevices (IPMI / PLDM FRU), and accordingly expose the 
>>> Inventory
>>>>> FRU producers code must be written in such a way that for these 
>>>>> common properties it does the necessary conversion (Say make 
>>>>> manufacturer as string, irrespective of any format it read 
>>>>> through). Note: Specific stuff, we need to create a separate 
>>>>> interface (as phosphor-dbus-interface at present doesn't support 
>>>>> dynamic property addition/deletion). (Tomorrow, if we have any 
>>>>> other proprietary way of producing FRU data, we can still work 
>>>>> with this approach, with less or no change for other layers).
>>>>>
>>>>>> Also note that (as James pointed out in his email), the IPMI FRU 
>>>>>> format distinguishes Board/Chassis/Product areas. PLDM FRU format 
>>>>>> does not. So there are differences. If a new FRU format is 
>>>>>> introduced, then yes we would expect a new interface to show up 
>>>>>> under Inventory/Source/<FruFormat>
>>>>> [Richard]: Fru producers should do this conversion.
>>>>
>>>> I'm of the opinion that the inventory producer (like EM and PIM) 
>>>> should perform this conversion. Consider 
>>>> https://github.com/openbmc/entity-manager/blob/master/configurations/Intel%20Front%20Panel.json#L55 
>>>> for example. I don't think it's up to the FruDevice/PLDM kind of 
>>>> apps to decide that this is actually a Panel. You can design it 
>>>> that way, but like I said above that means the config knowledge 
>>>> moves into these apps, which I don't think we should head towards, 
>>>> since then every FRU producer app needs to do this. This is why we 
>>>> have apps like EM.
>>> [Richard]: Exactly. What we need to make sure is create abstraction 
>>> between Entity manager and FRU Producers as much as possible. FRU 
>>> Producer responsibility is to read the FRU in decode the FRU data as 
>>> per the spec and expose it in common form which Entity-manager / PIM 
>>> will rely on.
>>
>> I don't see why the abstraction is necessary. There already is 
>> abstraction in terms of the phosphor interfaces.
>>
>>>>> Say Chassis Type (Irrespective of what area it comes from it is 
>>>>> same). PLDM FRU mostly represents the product as a whole, but 
>>>>> technically we can point it to all the needed using the Fru Record 
>>>>> set to the Entity type mapping in the PDR record. Accordingly it 
>>>>> needs to be exposed.
>>>>>>
>>>>>>
>>>>>>> Yes, I am in favor of common interfaces for this where ever 
>>>>>>> possible.
>>>>>>>
>>>>>>> Is there someone that knows the existing FruDevice 
>>>>>>> implementation well
>>>>>>> enough that can be included in this work to propose common 
>>>>>>> interfaces
>>>>>>> where it is appropriate?
>>>>>>>
>>>>>>>> Inventory/Source/General/Fru (Maintain common things here 
>>>>>>>> Product Name.
>>>>>>>> This can be used by Inventory manager to advertise it (instead 
>>>>>>>> of searching
>>>>>>>> it in multiple interfaces/properties))
>>>>>>>
>>>>>>> Minor tweak here of 'Source/Common'?  When we have an existing 
>>>>>>> Inventory
>>>>>>> interface for this information should we mimic what is already in
>>>>>>> Inventory?  At some point are we trying to be too common that we're
>>>>>>> effectively reimplementing Inventory instances under a different 
>>>>>>> name?
>>>>>>>
>>>>> [Richard]: Yes, currently, FRU to inventory and inventory to upper 
>>>>> layer is what used. If we want to change it, we need to go with 
>>>>> differnt option of using FRU to upper layer, but many of existing 
>>>>> code will require change.
>>>>
>>>>
>>>>> Regards,
>>>>>
>>>>> Richard
>>>>>
>>>>
>>
>
