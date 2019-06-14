Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0DD46868
	for <lists+openbmc@lfdr.de>; Fri, 14 Jun 2019 21:56:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QWZ62djwzDrfW
	for <lists+openbmc@lfdr.de>; Sat, 15 Jun 2019 05:55:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QWYY06WczDrdd
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jun 2019 05:55:21 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jun 2019 12:55:19 -0700
X-ExtLoop1: 1
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by orsmga001.jf.intel.com with ESMTP; 14 Jun 2019 12:55:18 -0700
Subject: Re: Platform Inventory for redfish
To: Neeraj Ladkani <neladk@microsoft.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <BL0PR2101MB0932DF0B72012340CADF3E90C8EE0@BL0PR2101MB0932.namprd21.prod.outlook.com>
 <131e8559-b80d-076e-8870-8c419d416596@intel.com>
 <BL0PR2101MB09324B77299D04601CF25C41C8EE0@BL0PR2101MB0932.namprd21.prod.outlook.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <6bc178ca-6192-6682-c70e-303e2e032037@intel.com>
Date: Fri, 14 Jun 2019 12:55:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <BL0PR2101MB09324B77299D04601CF25C41C8EE0@BL0PR2101MB0932.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/14/19 11:59 AM, Neeraj Ladkani wrote:
> Thanks Ed,
> 
> 1. How does BMC reads SMBIOS tables as they are managed by HOST? 

BIOS generally writes them on first boot or change using IPMI.

> 2. PCIe devices are usually not powered on stand by rails so if BMC need to enable/disable sensors based on certain PCIe card, it would need to wait till the platform is powered. This creates a lot of problems specially if we are building platform SKUs using a common building block.
In general, the FRU devices to identify the PCIe card tend to be
available on the 3.3 Aux rail, which is before the platform is powered.
With that said, devices that don't handle this behavior are covered by
the implementation, and a dc rail state change will trigger a rescan.

> 3. I think we need of a feature where we can specify platform inventory in JSON file that get picked up by "probe" .. for example to detect a M.2 .. we could use something like this...
The current implementation can detect M.2 drives, although we hit some
troubles with the MCTP implementation, so there are no configs as of yet.

> 
> {
>             "BehindSwitch": false,
I'm assuming this refers to "behind a mux".  In general this is already
handled, and the scanning will instantiate the correct mux devices in
the kernel, at which point a user of this would just need to point at
the correct bus, which is available via a symlink structure to get to
teh /dev/i2c-X device on the system.

>             "DeviceClass": "MassStorageController",
In entity manager this field is called "Type"

>             "DeviceName": "PM983",
In entity manager this field is called "Name"

>             "Id": 6,
Not really clear what this is doing.

>             "PhysicalLocation": {
>                 "LocationOrdinalValue": 5,
>                 "LocationType": "Slot"
>             },
This is currently managed by the slot naming convention in the
PCA95XXMux device type.  Naming a leg as "M2_Slot5" would give you the
behavior that you're trying to emulate.


>             "SMBusCount": 1Not really clear what the "count" would allow you to do.
>             "SMBusInfo": [
The problem with what you've declared here is that this assumes that the
complete smbus topology can be known for a given system.  This
assumption falls down when a PCIe add in card can implement a mux, or an
optional midplane board implements a mux.

An example of one such card is here:
https://github.com/openbmc/entity-manager/blob/15c49902cf030a91a5b4bd325d185ee74b760359/configurations/AXX2PRTHDHD.json#L13

This card gives access to the MiniSASHD ports through its own mux.
Given that it's a standard add in card that could be installed in any
system, now every system that's currently supported would need to add
its smbus topology to the tree.

>                 {
>                     "BusNumber": 6,
>                     "DeviceType": "NVME",
>                     "Id": 1,
>                     "MultiMaster": false,
>                     "MuxCount": 2,
>                     "MuxInfo": [
>                         {
>                             "Channel": 1,
>                             "Id": 1,
>                             "SlaveAddr": "0xE2"
>                         },
>                         {
>                             "Channel": 0,
>                             "Id": 2,
>                             "SlaveAddr": "0xE6"
>                         }
>                     ],
>                     "Protocol": "CSI",
I've never heard of a BMC using the MIPI CSI protocol to get to
anything, but it could certainly be added.
It's also not really clear why the smbus MUXes would be underneath the
mass storage controller.  It seems like they would be separate.
>                     "SlaveAddr": "0xD4"
>                 }
>             ],
>             "SlotType": "FullLength"
>         },
> 

I would recommend taking a look at the implementation that's there
today.  You seem to have just covered a number of features that already
exist (like mux declaration and topology management) but changed them
into your own schema.  That's fine if there are changes to be made to
make things work.  Currently the implementation does the following steps:
1. FruDevice scans for valid FRU devices
2. Baseboard entity gets instantiated via the FRU that's found.
2a. This may or may not instantiate MUX devices (if the baseboard
supports them) or simply label some of the lanes as "slot" lanes.  After
this step is complete, there will be named symlinks if the board
possesses M.2 Slots.
3. Frudevice rescans behind the mux, being careful to not duplicate
devices that exist ahead of the MUX. One of the legs it sees is the M.2
leg, which contains a drive with an NVMe-MI compliant FRU.
4. EntityManager instantiates a copy of the "drive" which may be a
specific drive model, or a general purpose "NVMEDevice" entity.
5. Other system services can trigger the appropriate sensor scanning,
log monitoring, and other services as needed.


