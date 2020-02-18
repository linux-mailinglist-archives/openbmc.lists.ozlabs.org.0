Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E3250162409
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 10:57:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MGVJ23pzzDqVk
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 20:57:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=suryakanth.sekar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MGSz5H2BzDqTy
 for <openbmc@lists.ozlabs.org>; Tue, 18 Feb 2020 20:56:01 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2020 01:55:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,456,1574150400"; d="scan'208";a="235487011"
Received: from ssekar-mobl1.gar.corp.intel.com (HELO [10.66.114.123])
 ([10.66.114.123])
 by orsmga003.jf.intel.com with ESMTP; 18 Feb 2020 01:55:55 -0800
Subject: Re: FW: Exposing BIOS attributes to a remote management console
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org, 
 "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
References: <7622d97a-13f2-8c38-6ae8-9325923c3c83@linux.vnet.ibm.com>
 <48777ea3-0af2-4725-9304-64ae4edb71d9@email.android.com>
 <1504A9E7C77EF44697F386AD61B16260152FEBA5@BGSMSX105.gar.corp.intel.com>
 <a54b4da5-b7a9-423e-a01e-720808ae748c@linux.intel.com>
 <a5fbffed-c3c9-9c41-a066-bf2f65cc648a@linux.vnet.ibm.com>
From: "Sekar, Suryakanth" <suryakanth.sekar@linux.intel.com>
Message-ID: <ed6c7b3f-b514-fc3f-6de0-989d5ff8f13b@linux.intel.com>
Date: Tue, 18 Feb 2020 15:25:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <a5fbffed-c3c9-9c41-a066-bf2f65cc648a@linux.vnet.ibm.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


Hi Deepak,

[Deepak]-->  I'll look out for the design doc from you. Can you share 
now what aspects that document would cover - redfish/in-band/D-Bus 
implementation - all of this? Is Intel planning on writing code for 
these areas soon? We're planning on implementing the PLDM BIOS spec for 
the same purpose. Some PLDM BIOS code's out there on openbmc/pldm already.

Yes, we need to support all interface -IPMI/ MCTP/ Redfish Host interface.

[surya]--> Cover IPMI based implementation. we defined some OEM 
commands  under review.

https://gerrit.openbmc-project.xyz/c/openbmc/intel-ipmi-oem/+/16246


[Deepak]-->  Are you targeting specific implementation areas here? By 
knowing that, we can collaborate better.

[surya] -->We are working on IPMI command based in OOB daemon and 
generating Attribute Registry for Redfish. you can implement the PLDM 
based in OOB daemon and BIOS configuration WebGUI.

Please review the design and interface. Once its done. we will request  
Brad to create separate recipe  repository for OOB daemon.

Please let me know any query or concern.

Thanks

Suryakanth.S


On 2/11/2020 2:22 PM, Deepak Kodihalli wrote:
> On 10/02/20 4:19 pm, Sekar, Suryakanth wrote:
>> Hi Deepak,
>>
>> OOB BIOS high level config design doc is in progress. I will send for 
>> review soon.
>
>
> Hi Surya,
>
> Thanks for responding. I'm glad that we have the same understanding on 
> this topic.
>
> I'll look out for the design doc from you. Can you share now what 
> aspects that document would cover - redfish/in-band/D-Bus 
> implementation - all of this? Is Intel planning on writing code for 
> these areas soon? We're planning on implementing the PLDM BIOS spec 
> for the same purpose. Some PLDM BIOS code's out there on openbmc/pldm 
> already.
>
>> Yes, we need to support all interface -IPMI/ MCTP/ Redfish Host 
>> interface.

[surya]--> Cover IPMI based implementation. we defined some OEM 
commands  under review.

https://gerrit.openbmc-project.xyz/c/openbmc/intel-ipmi-oem/+/16246

>>
>> If BIOS is not booted at all. BMC wont have any attribute info. It 
>> will be empty in BMC side.
>>
>> BIOS must provide BIOS OOB capability via KCS interface in early boot 
>> stage.
>> Like supported proprietary BIOS attribute file format or PLDM support 
>> via MCTP  or
>> Redfish BIOS attribute registry format to the BMC.
>>
>> BIOS must send the master BIOS attributes file(Intel properitary - 
>> XML type 0)
>> via KCS interface or all attributes details via Bios configuration 
>> PLDM via MCTP or
>> Redfish host interface during first boot.
>>
>> BIOS must collect the new attribute values from BMC and update the 
>> same in BIOS
>>
>> BIOS must send the updated master attributes file to the BMC and once 
>> its updated in BIOS
>>
>> and reset the system to reflect the BIOS configuration.
>>
>> OOB daemon in BMC  must maintain and collect the  attribute registry 
>> file from MCTP/ IPMI/ Redfish interface.
>
> All this sounds good to me.
>
>> Convert the proprietary XML format/ PLDM data  into BIOS attribute 
>> Registry format &
>> must support the below following dbus method.
>>
>> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/18242 
>>
>>
>> Validate the BIOS input data or User attribute value.
>>
>> MCTP / Redfish host interface / IPMI must communicate with OOB daemon 
>> in BMC via D bus
>
> Are you targeting specific implementation areas here? By knowing that, 
> we can collaborate better.

[surya] -->We are working on IPMI command based in OOB daemon and 
generating Attribute Registry for Redfish. you can implement the PLDM 
based in OOB daemon and BIOS configuration WebGUI.

Please review the design and interface. Once its done. we will request  
Brad to create separate recipe  repository for OOB daemon.

Please let me know any query or concern.


>
>
>> Thanks
>>
>> Suryakanth.S
>
> Regards,
> Deepak
>
>>
>>
>>> ---------- Forwarded message ----------
>>> From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com 
>>> <mailto:dkodihal@linux.vnet.ibm.com>>
>>> Date: Feb 8, 2020 1:59 PM
>>> Subject: Exposing BIOS attributes to a remote management console
>>> To: openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>
>>> Cc:
>>>
>>> Hi,
>>>
>>> To enable remote updates (via a remote management console that talks to
>>> the BMC) to the host firmware's BIOS settings table on IBM systems,
>>> we're thinking of the following flow:
>>>
>>> a) The host firmware sends down a BIOS settings table to the BMC using
>>> PLDM [1].
>>> b) The BMC uses phosphor-settingsd [2] as the backend to store BIOS
>>> attributes on D-Bus.
>>> c) Bmcweb implements the Redfish BIOS schema [3] to enable remote
>>> reads/writes on the BIOS attributes.
>>>
>>> However, c) is a problem because one needs to write YAML files [4] for
>>> the BMC to determine what D-Bus objects to make corresponding to the
>>> BIOS attributes. This requires a unique D-Bus interface *per* BIOS
>>> attribute. This means the BMC must have prior knowledge about the BIOS
>>> attributes.
>>>
>>> I don't think that's the right way to go about this for two reasons. 
>>> One
>>> - this creates a lockstep dependency on the host firmware when the BIOS
>>> settings table needs to be updated, and two - I think the OpenBMC
>>> implementation of this must be able to receive (via PLDM/IPMI/other
>>> standard in-band means) a set of BIOS attributes from different BIOS
>>> firmware stacks dynamically and expose them for out of band updates,
>>> without having prior/build-time knowledge of those attributes. So I
>>> think this calls for a different kind of D-Bus interface/infrastructure
>>> than what the phosphor-settingsd app relies on. Something that enables
>>> the BMC to add to D-Bus a BIOS attribute dynamically, knowing it's 
>>> name,
>>> type and default value.
>>>
>>> Any thoughts on this flow? I'm also curious to know if the Redfish BIOS
>>> schema/attribute registry model requires the BMC to have prior 
>>> knowledge
>>> about the system BIOS attributes to update the registry. This wasn't
>>> obvious to me from a quick read of the schema.
>>>
>>> Thanks,
>>> Deepak
>>>
>>> [1]
>>> https://www.dmtf.org/sites/default/files/standards/documents/DSP0247_1.0.0.pdf 
>>>
>>> [2] https://github.com/openbmc/phosphor-settingsd
>>> [3] https://redfish.dmtf.org/schemas/v1/Bios.v1_1_0.json
>>> [4]
>>> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-phosphor/settings/phosphor-settings-defaults/defaults.yaml 
>>>
>>>
>
