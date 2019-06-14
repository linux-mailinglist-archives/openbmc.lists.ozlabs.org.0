Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C701446748
	for <lists+openbmc@lfdr.de>; Fri, 14 Jun 2019 20:17:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QTNN2pX8zDrhn
	for <lists+openbmc@lfdr.de>; Sat, 15 Jun 2019 04:17:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QTMm5NS3zDrgF
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jun 2019 04:16:51 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jun 2019 11:16:48 -0700
X-ExtLoop1: 1
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by orsmga001.jf.intel.com with ESMTP; 14 Jun 2019 11:16:48 -0700
Subject: Re: Platform Inventory for redfish
To: Neeraj Ladkani <neladk@microsoft.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <BL0PR2101MB0932DF0B72012340CADF3E90C8EE0@BL0PR2101MB0932.namprd21.prod.outlook.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <131e8559-b80d-076e-8870-8c419d416596@intel.com>
Date: Fri, 14 Jun 2019 11:16:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <BL0PR2101MB0932DF0B72012340CADF3E90C8EE0@BL0PR2101MB0932.namprd21.prod.outlook.com>
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

On 6/13/19 8:48 PM, Neeraj Ladkani wrote:
> HI All, 
> 
> How does we manage platform inventory like CPU, memory and PCIe devices since BMC may not always have presence pins for all components.  For IPMI , we have SDRs that can be programmed with correct SKU configurations. I am wondering what is solution for redfish (except BIOS sending inventory on USB ethernet using redfish).
This varies widely dependent on the architecture.  I can answer the
specifics for x86 servers and systems using entity-manager, but in
short, whatever exists in Dbus with the correct interfaces is populated
in Redfish.

> 
> Platform inventory includes 
> 
> 1. Number of host CPUs and type of CPUs

This is managed over a combination of PECI and SMBIOS/MDR tables.  PECI
can interrogate the CPU directly.  SMBIOS has more detailed information.

> 2. Number of memory and types of memory 
Same answer as CPU.  PECI allows us to get inventory counts, presence,
and temperatures.  SMBIOS allows us to get more detailed information on
types, timings, and inventory information.

> 3. IO expander cards 
This is done over Smbus.  On Wolf Pass, we use the FruDevice application
here, which scans all busses for valid FRUs.
https://github.com/openbmc/entity-manager/blob/master/src/FruDevice.cpp

> 4. SMBUS devices on PCI cards 

Same answer as IO expanders.  We check for a valid FRU, once we find it,
we check to see if it's a card we understand the topology of, by
instantiating an instance of a config file like this:
https://github.com/openbmc/entity-manager/blob/master/configurations/AXX1P100HSSI_AIC.json

Most cards key off the product name field in the board section, but
there are ways to key off of other fields as well.

At the end of the day the "probe" statement in entity manager is just a
dbus match, so if your platform has a different way to identifying a
"card is present" just make that data available on dbus, and add an
appropriate match to entity manager.

> 
> Thanks
> Neeraj
> 
