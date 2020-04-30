Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C751C08F5
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 23:15:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Cp7X21c1zDqqY
	for <lists+openbmc@lfdr.de>; Fri,  1 May 2020 07:15:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Cp6X27rszDqnr
 for <openbmc@lists.ozlabs.org>; Fri,  1 May 2020 07:14:25 +1000 (AEST)
IronPort-SDR: L8PZzsigPVJ1xVLaaMIqpJolgDW/YpPYEz5BOapQX1XMFN1thZaxM3hDbal8D9++8AP4Wfs2MK
 R1HkEOrvsnsg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2020 14:14:23 -0700
IronPort-SDR: h65ma4Lx89foq0HWcBivvO1eYvy55bA3Ge3B6iFPUyjS84AWMJDILjcFt4/xqXvVGaqGa51uL1
 ZorL6v1IHsog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,337,1583222400"; d="scan'208";a="405548733"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga004.jf.intel.com with ESMTP; 30 Apr 2020 14:14:23 -0700
Received: from [10.251.68.156] (jmbills-mobl.amr.corp.intel.com
 [10.251.68.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 093E8580613
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 14:14:21 -0700 (PDT)
Subject: Re: [EXTERNAL] how to get pci config space
To: openbmc@lists.ozlabs.org
References: <584F7181-73DB-4090-93D7-87E0E7408F20@fuzziesquirrel.com>
 <DM6PR21MB1388CB8A990972BA09EB5163C8500@DM6PR21MB1388.namprd21.prod.outlook.com>
 <3718EF06-C5DE-4D3D-B2B1-548FEF5A1919@fuzziesquirrel.com>
 <DM6PR21MB138892F44E5B77CCE63F83D4C8530@DM6PR21MB1388.namprd21.prod.outlook.com>
 <D37CC7FB-0199-47A5-930A-B9BBFF02F0D8@fuzziesquirrel.com>
 <DM6PR21MB138859ED52E4D8B7B1B634FEC8520@DM6PR21MB1388.namprd21.prod.outlook.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <187e72f2-3ecb-2693-4467-3da3752efde8@linux.intel.com>
Date: Thu, 30 Apr 2020 14:14:17 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <DM6PR21MB138859ED52E4D8B7B1B634FEC8520@DM6PR21MB1388.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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



On 12/19/2019 12:45 AM, Neeraj Ladkani wrote:
> It depends on requirements like in our use case, our PCIe devices are fixed so we can preprogram a array in JSON file to include all PCI functions from a device but for someone else for example OEM who is selling the servers, it not possible to predict all PCI device can be connected on PCIe slot so we can let system firmware send this information or do RdPCIRd via PECI.

Sorry for not replying earlier.  I had some legal questions that I was 
waiting to be resolved.

Intel has a downstream solution that uses PECI to get the PCIe 
information onto D-Bus which is then published to Redfish.  I can now 
share what we have upstream if there is interest.

If so, I guess I'd need a new 'peci-pcie' repo to check into?

Thanks,
-Jason>
> I am not aware of any standards on "Implementation". I have seen typical implementations where system firmware sends post PCIe data ( exact schema) to BMC using redfish and BMC produces this data over redfish ( just act like passthrough).
> 
> Neeraj
> 
> -----Original Message-----
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
> Sent: Wednesday, December 18, 2019 4:35 AM
> To: Neeraj Ladkani <neladk@microsoft.com>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Subject: Re: [EXTERNAL] how to get pci config space
> 
> Thanks Neeraj
> 
>> On Dec 18, 2019, at 2:18 AM, Neeraj Ladkani <neladk@microsoft.com> wrote:
>>
>> IMO, we only need DeviceID and VendorID fields from PCIe Config space
> 
> This would probably meet my need to dynamically tune fan control parameters.  Is it possible to populate instances of the pciedevice schema based on devid and vendorid alone?
> 
>> and we can let system firmware send this information during boot
> 
> This is how it works on Power systems before OpenBMC, but we have a custom protocol with a proprietary implementation.  The purpose of my note was to find out if there are typical implementations or even standards out there for doing this.
> 
>> or preprogram the information to BMC using EntityManager.
> 
> Can you elaborate on how this would work?  Given the number of pcie devices out there this seems like it would be hard to do it this way without a huge database of some kind on the bmc?
> 
>> Regarding BMC-CPU(via PECI), BMC needs to send PECI command to CPU. CPU should support RdPCICfg as supported PECI command and thus respond with data.
> 
> Ok - that sounds like its all in hardware.  But above it sounded like you suggest we skip RdPCICfg and instead let system firmware push this information down to the BMC - do I have it right?  If so why do you prefer that mechanism?
> 
> thx!
> 
> -brad
> 
