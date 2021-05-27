Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B768039326F
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 17:28:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrWtv5Lqgz305q
	for <lists+openbmc@lfdr.de>; Fri, 28 May 2021 01:28:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 63 seconds by postgrey-1.36 at boromir;
 Fri, 28 May 2021 01:28:41 AEST
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrWtd71lDz2yjL
 for <openbmc@lists.ozlabs.org>; Fri, 28 May 2021 01:28:41 +1000 (AEST)
IronPort-SDR: bhw7ipYxcIzaW6udquvKHQrbGVUR4ZrWO60pOGBOzkblqYCf66fXvmAR/rHbdCh+uBwipmfSGG
 /G7cEtW7JEYw==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="263961152"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="263961152"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 08:27:26 -0700
IronPort-SDR: XYcqwtXHUciCkql71EXnYHt3dvc+G/Oivj9KYnWzusxSl66bm4LxjE5+wVcxbhttKIwKbmBGvj
 boxJs2AgnduQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="548002628"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga001.fm.intel.com with ESMTP; 27 May 2021 08:27:22 -0700
Received: from [10.212.151.81] (jmbills-MOBL.amr.corp.intel.com
 [10.212.151.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id B429E5807BA
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 08:27:22 -0700 (PDT)
Subject: Re: Implement PCIeType Property
To: openbmc@lists.ozlabs.org
References: <HK0PR04MB329955B4A773802B019E1477E4239@HK0PR04MB3299.apcprd04.prod.outlook.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <7703a5cf-a967-a256-71e4-be3f2d7fa411@linux.intel.com>
Date: Thu, 27 May 2021 08:27:22 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <HK0PR04MB329955B4A773802B019E1477E4239@HK0PR04MB3299.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=big5; format=flowed
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



On 5/27/2021 12:09 AM, Spencer Ku (¥j¥@·ì) wrote:
> Hi All,
>    We would like to implement PCIeInterface "PCIeType" property on both peci-pcie and bmcweb, then I find the PR which implement inventory properties like SparePartNumber, Model, PartNumber, SerialNumber for PCIe devices in bmcweb: https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/40051
> 
> I think we modify similar part of bmcweb, but I am not sure does it will implement "PCIeType" property in the future. So could we implement "PCIeType" property first since the PR status is WIP?
> 
> About the implement method, for peci-pcie part, first we use peci command to get the pointer of capability in PCI configure space. Then go through capability structure to find capability ID in 3rd capability structure. If the ID is PCI Express, then get the link speed in link status register. Finally, set the PCIeType property to D-Bus after translating (under /xyz/openbmc_project/PCIe/<str>) . >
> And for bmcweb part, we will create PCIeInterface {"PCIeType"} level (under /redfish/v1/Systems/system/PCIeDevices/<str>/ ) and fill the info from D-bus.
> 
> On the other hand, we also interested about how to get PartNumber and SerialNumber information? I already try to get from FRU over I2C but I cannot mapping the info between FRU and peci-pcie, or is it can easily get by peci-pcie? Any comments and suggestions are welcome!
peci-pcie currently can only get information that is available over PCI. 
  If these new fields come from somewhere other than PCI, it could be 
difficult to add them.

If these new fields all come from the FRU, then we should already have 
that data in other applications, so we shouldn't need to get it in a PCI 
application.

It may be good to discuss the design a bit for 
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/40051.  For 
example, I think FruDevice already has the FRU information for the PCIe 
devices.  Does the PCI application need to communicate with FruDevice 
and expose the same information again in the PCIe inventory on D-Bus? 
Or, should bmcweb directly look for the FruDevice to populate these new 
fields?
> 
> Please let us know if there's any issue, thank you!
> 
> Sincerely,
> Spencer Ku
> 
