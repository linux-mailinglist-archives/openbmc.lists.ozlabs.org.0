Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF70B231C1D
	for <lists+openbmc@lfdr.de>; Wed, 29 Jul 2020 11:31:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGpFN1k12zDqvx
	for <lists+openbmc@lfdr.de>; Wed, 29 Jul 2020 19:31:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=suryakanth.sekar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGpDS6GtKzDqsX
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 19:30:15 +1000 (AEST)
IronPort-SDR: xstyvk/WPZf3AYQ2nBIhSMLX/UGmO6mhBQbfjo++mBC9wUzyCzXDxm39DHd38paQ6tb3aFQ4nU
 R0zVVgRmJdcQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9696"; a="139401417"
X-IronPort-AV: E=Sophos;i="5.75,409,1589266800"; d="scan'208";a="139401417"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2020 02:30:10 -0700
IronPort-SDR: c0CfPCCmkaLd92Eva14swSNH+Fdv/gx7WOeMYj5ZXGltyOQbml9CsgAvB1O/N/pld4ZsZHqxOv
 vcyjOrXWPHug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,409,1589266800"; d="scan'208";a="304167985"
Received: from hbahadur-mobl.gar.corp.intel.com (HELO [10.252.162.180])
 ([10.252.162.180])
 by orsmga002.jf.intel.com with ESMTP; 29 Jul 2020 02:30:08 -0700
Subject: Re: Question about OpenBMC Remote BIOS configuration proposal
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>,
 "Chang, Abner (HPS SW/FW Technologist)" <abner.chang@hpe.com>
References: <CS1PR8401MB11440816B91B39DAD21E3CB2FF760@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
 <687ea1e8-4abf-cc90-6777-a56a2416b08b@linux.vnet.ibm.com>
From: "Sekar, Suryakanth" <suryakanth.sekar@linux.intel.com>
Message-ID: <d10754e5-83b8-79fd-f407-de3d5f353ad0@linux.intel.com>
Date: Wed, 29 Jul 2020 15:00:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <687ea1e8-4abf-cc90-6777-a56a2416b08b@linux.vnet.ibm.com>
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
Cc: "Garrett, Mike \(HPE Server Firmware\)" <mike.garrett@hpe.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Wu,
 Frank \(ISS Firmware\)" <frank.l.wu@hpe.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Sorry, I was Out of Office  few days and busy in other priority.

Abner,

we are supporting Intel uses  OEM IPMI command , IBM  uses  PLDM method 
is transfer data from BIOS to the BMC.

In Intel, we are using (Intel prop) XML format which contain all needed 
info  from BIOS to the BMC.

Let me know whats requirement. we can discuss the same.

This BIOS config -setting   should be generic.


Thanks

Suryakanth.S


On 7/23/2020 2:51 PM, Deepak Kodihalli wrote:
> On 23/07/20 2:04 pm, Chang, Abner (HPS SW/FW Technologist) wrote:
>> Hi Sekar,
>> This is Abner Chang from HPE Server BIOS team, our team is also 
>> working on UEFI/EDK2 Redfish open source solution (just FYI the POC 
>> code is almost done).
>>
>> I read through the Remote BIOS configuration proposal and would like 
>> to see if we still have chance to make some changes on it to reduce 
>> the efforts on both BMC and BIOS. Also get rid of using PLDM BIOS 
>> control/Configuration methodology because we can find the equivalent 
>> method if use Redfish service.
>
> The design describes PLDM as one of the alternatives, but it is not 
> the only. The design talks about inband IPMI as well. In other words, 
> the design doesn't mandate what inband communication protocol BIOS and 
> BMC should use. On certain IBM systems, this protocol is PLDM.
>
> Regards,
> Deepak
>
