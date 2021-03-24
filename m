Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5C43480D6
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 19:43:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5HFH0JPjz30J0
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 05:43:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 65 seconds by postgrey-1.36 at boromir;
 Thu, 25 Mar 2021 05:43:38 AEDT
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5HF61Lpdz30G3
 for <openbmc@lists.ozlabs.org>; Thu, 25 Mar 2021 05:43:38 +1100 (AEDT)
IronPort-SDR: yLuibutHhXmhdwNMjGM6sZ0L+G6CLZyg1GwlreAMQpe8UrcafNU7uWBsFK6wWwK0ySzFDPmuz3
 t0Bs1F83SXgg==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="252123459"
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; d="scan'208";a="252123459"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 11:42:27 -0700
IronPort-SDR: bW8SWKHf08FFt16+M+TYMNisYpqzjYU2ZcjaJKEU8DIa/51Fk6XWaWkZnoZDEDxtTYoRD8UqC6
 q8yuboQQP+qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; d="scan'208";a="593473741"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga005.jf.intel.com with ESMTP; 24 Mar 2021 11:42:27 -0700
Received: from [10.212.205.18] (jmbills-MOBL.amr.corp.intel.com
 [10.212.205.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 5F42A580718
 for <openbmc@lists.ozlabs.org>; Wed, 24 Mar 2021 11:42:27 -0700 (PDT)
Subject: Re: Question of Redfish PCIe
To: openbmc@lists.ozlabs.org
References: <HK0PR04MB3299350D35DE18CA5AA040CDE4639@HK0PR04MB3299.apcprd04.prod.outlook.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <694424cf-d7e9-f18f-9ba8-9595fbd702d1@linux.intel.com>
Date: Wed, 24 Mar 2021 11:42:25 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <HK0PR04MB3299350D35DE18CA5AA040CDE4639@HK0PR04MB3299.apcprd04.prod.outlook.com>
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



On 3/24/2021 1:45 AM, Spencer Ku (¥j¥@·ì) wrote:
> Hi All,
> 
> We are interested in how to get PCIe relative info via redfish, like 
> PCIeDevice, PCIeSlot and so on.
> 
> In my opinion, package ¡§peci-pcie¡¨ is used to collect the PCIe info and 
> filled them into the PCIe D-bus, after that the bmcweb can get relative 
> info through the D-bus.
> 
> Then I look into the gerrit¡¦s active patches and find that the D-bus 
> interface is changed, and here are some example:
> 
> Original interface implement by peci-pcie:
> 
> xyz.openbmc_project.PCIe.Device
> 
> Current interface used in the patches:
> 
> xyz.openbmc_project.Inventory.Item.PCIeDevice
> 
> xyz.openbmc_project.Inventory.Item.PCIeSlot
> 
> Does it means that peci-pcie will be updated to cover the D-bus changes 
> or I need to add the D-bus by myself under the 
> xyz.openbmc_project.Inventory.Item?
Yes, if there is now an official phosphor-dbus-interface for PCIe 
Devices that bmcweb will start using, then peci-pcie will need to be 
updated to use that interface.

When that change merges into bmcweb, I'll plan to push an update to 
peci-pcie
> 
> Just want to know the current status of redfish PCIe, thanks!
> 
> Sincerely,
> 
> Spencer Ku
> 
