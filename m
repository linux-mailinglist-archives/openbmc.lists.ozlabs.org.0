Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB69A1349C6
	for <lists+openbmc@lfdr.de>; Wed,  8 Jan 2020 18:49:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tGw76zsSzDqMW
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 04:49:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tGsL5wPbzDqVl
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jan 2020 04:47:01 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2020 09:46:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,410,1571727600"; d="scan'208";a="271889101"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Jan 2020 09:46:58 -0800
Subject: Re: Configuring device with I2C mux
To: Alex Qiu <xqiu@google.com>, Milton Miller II <miltonm@us.ibm.com>
References: <CAA_a9xKmRHHx=vXvwTaO+0PRtFjLWQUAL1WnJH8XGBBzvExt2A@mail.gmail.com>
 <OF100509F8.6ECF782D-ON002584E9.004AC321-002584E9.0050DF26@notes.na.collabserv.com>
 <CAA_a9xJQsSjrcjq+=+uoPe4KCkUjWTgEp_cG-0E2FczP=PtBUg@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <d1069c71-108f-d5e0-f2fa-4af1048386e2@linux.intel.com>
Date: Wed, 8 Jan 2020 09:46:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAA_a9xJQsSjrcjq+=+uoPe4KCkUjWTgEp_cG-0E2FczP=PtBUg@mail.gmail.com>
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Kais Belgaied <belgaied@google.com>, Devjit Gopalpur <devjitg@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 1/8/20 9:25 AM, Alex Qiu wrote:
> Hi Milton,
> 
> Yes, the child buses are traceable in the sysfs, but actually my 
> question is, does entity-manager supports tracing child buses through 
> the sysfs? If it does, how shall I write the JSON config to take 
> advantage of this feature?
> 
> For example, we have a I2C device sitting at the same level as the mux, 
> configured as {"Address": "0x40", "Bus": "$bus"}, and now I don't find 
> the way to add or subtract a certain number to $bus to find a child bus. 
> Do we have a feature with syntax like {"Address": "0x50", "Bus": 
> "$bus.mux.0x70.channel.1"} to configure devices on child buses, with mux 
> sitting on 0x70 of the parent bus?

Do you have a device sitting behind the mux? Generally in most our 
situations we have another FRU behind the mux, and we can use "$bus" to 
describe this.

Second option is you can name the mux channels, like this: 
https://github.com/openbmc/entity-manager/blob/01542d2af1b1f45335cc8813fffcd3ed07f22989/configurations/WFT%20Baseboard.json#L1023

And then in /dev/ you'll get symlinks like this:

root@intel-obmc:~# ls -al /dev/i2c-mux/M2_Mux/
drwxr-xr-x    2 root     root            80 Jan  1 00:01 .
drwxr-xr-x    9 root     root           180 Jan  1 00:01 ..
lrwxrwxrwx    1 root     root            11 Jan  1 00:01 M2Slot1 -> 
/dev/i2c-14
lrwxrwxrwx    1 root     root            11 Jan  1 00:01 M2Slot2 -> 
/dev/i2c-15

-James


> 
> Thank you!
> 
> - Alex Qiu
> 
> 
> On Wed, Jan 8, 2020 at 6:43 AM Milton Miller II <miltonm@us.ibm.com 
> <mailto:miltonm@us.ibm.com>> wrote:
> 
>     About 01/07/2020 07:14PM in some timezone, Alex Qiu wrote:
>      >Hi folks,
>      >
>      >We have a JSON file configuring I2C devices of a PCIe card which has
>      >an 8-channel I2C mux for entity-manager. After we properly configure
>      >the mux of the card, we get 8 new I2C buses in sysfs; however, we
>      >don't find an arithmetic way to describe the relationship between the
>      >new buses and their parent buses.
>      >
>      >For example, we have a mux on physical BMC I2C bus i2c-8 spawning a
>      >couple of child buses including i2c-24 and i2c-26, which are the
>      >buses for each PCIe card. The mux on i2c-24 PCIe card spawned 8 buses
>      >from i2c-70 to i2c-77, and the mux on i2c-26 PCIe card spawned ones
>      >from i2c-62 to i2c-69. We have I2C devices on i2c-76 and i2c-68 needs
>      >to be configured together with the PCIe card on i2c-24 and i2c-26
>      >separately.
>      >
>      >How do we implement this in the JSON file? If that's not possible to
>      >do it in JSON merely, what's the suggested approach to implement this
>      >feature? Device tree? Implement code in entity-manager to walk
>      >through the I2C sysfs?
> 
> 
>     I would expect the i2c buses provied by the mux to appear in sysfs
>     under the hierarchy of the parent bus.  Explore the sysfs directory
>     structure, I'm making this up, but I've now peeked at i2c-mux.c and
>     have a better chance getting reality.
> 
> 
>     /sys/bus/i2c/devices/i2c-8 -> /sys/devices/platform/ahb-432000/i2c-8
> 
>     /sys/bus/i2c/devices/i2c-24 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-24
>     /sys/bus/i2c/devices/i2c-24 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-25
>     /sys/bus/i2c/devices/i2c-24 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-26
> 
>     /sys/bus/i2c/devices/i2c-62 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-62
>     /sys/bus/i2c/devices/i2c-63 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-63
>     /sys/bus/i2c/devices/i2c-64 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-64
>     /sys/bus/i2c/devices/i2c-65 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-65
>     /sys/bus/i2c/devices/i2c-66 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-66
>     /sys/bus/i2c/devices/i2c-67 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-67
>     /sys/bus/i2c/devices/i2c-68 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-68
>     /sys/bus/i2c/devices/i2c-69 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-69
>     /sys/bus/i2c/devices/i2c-70 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-70
>     /sys/bus/i2c/devices/i2c-71 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-71
>     /sys/bus/i2c/devices/i2c-72 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-72
>     /sys/bus/i2c/devices/i2c-73 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-73
>     /sys/bus/i2c/devices/i2c-74 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-74
>     /sys/bus/i2c/devices/i2c-75 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-75
>     /sys/bus/i2c/devices/i2c-76 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-76
>     /sys/bus/i2c/devices/i2c-77 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-77
> 
>     /sys/bus/i2c/devices/i2c-24/mux_device ->
>     /sys/devices/platform/ahb-432000/i2c-8/8-52
>     /sys/bus/i2c/devices/i2c-25/mux_device ->
>     /sys/devices/platform/ahb-432000/i2c-8/8-52
>     /sys/bus/i2c/devices/i2c-26/mux_device ->
>     /sys/devices/platform/ahb-432000/i2c-8/8-52
> 
>     /sys/bus/i2c/devices/8-52/channel-0 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-24
>     /sys/bus/i2c/devices/8-52/channel-1 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-25
>     /sys/bus/i2c/devices/8-52/channel-2 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-26
> 
>     /sys/bus/i2c/devices/24-52/channel-0 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-62
>     /sys/bus/i2c/devices/24-52/channel-1 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-63
>     /sys/bus/i2c/devices/24-52/channel-2 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-64
>     /sys/bus/i2c/devices/24-52/channel-3 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-65
>     /sys/bus/i2c/devices/24-52/channel-4 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-66
>     /sys/bus/i2c/devices/24-52/channel-5 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-67
>     /sys/bus/i2c/devices/24-52/channel-6 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-68
>     /sys/bus/i2c/devices/24-52/channel-7 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-69
>     /sys/bus/i2c/devices/26-52/channel-0 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-70
>     /sys/bus/i2c/devices/26-52/channel-1 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-71
>     /sys/bus/i2c/devices/26-52/channel-2 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-72
>     /sys/bus/i2c/devices/26-52/channel-3 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-73
>     /sys/bus/i2c/devices/26-52/channel-4 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-74
>     /sys/bus/i2c/devices/26-52/channel-5 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-75
>     /sys/bus/i2c/devices/26-52/channel-6 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-76
>     /sys/bus/i2c/devices/26-52/channel-7 ->
>     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-77
> 
>     The child bus will have a symlink "mux_device" pointing to the mux.
>     The mux device node will have n symlinks "channel-1" where 1 is
>     the channel id.
> 
>     Hmm, there is no apparent code to put a "mux_channel" attribute in
>     the adapter node.  The adapter name attribute does include the channel
>     id, but its long descriptive text.  Regardless, you should be able to
>     find the buses from the mux channel-3 symlinks.
> 
>     Note: I haven't looked at the JSON to see how much it will change once
>     your find the bus.  I'm guessing you will have to generate it by taking
>     a template and substituting the bus numbers you find to make the slots
>     common, alhtough you could just go from the 8-52/channel-3 symlink to
>     the adapter bus (the device name will still have the bus number in it).
> 
>     I hope this helps you,
> 
>     milton
> 
