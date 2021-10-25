Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8378F43A584
	for <lists+openbmc@lfdr.de>; Mon, 25 Oct 2021 23:09:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdSHh31S2z2yNp
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 08:09:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdSHQ0bSmz2xDJ
 for <openbmc@lists.ozlabs.org>; Tue, 26 Oct 2021 08:08:48 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10148"; a="253294478"
X-IronPort-AV: E=Sophos;i="5.87,181,1631602800"; d="scan'208";a="253294478"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 14:07:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,181,1631602800"; d="scan'208";a="554354999"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 25 Oct 2021 14:07:45 -0700
Received: from [10.212.134.70] (jmbills-MOBL.amr.corp.intel.com
 [10.212.134.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3E849580AF7
 for <openbmc@lists.ozlabs.org>; Mon, 25 Oct 2021 14:07:45 -0700 (PDT)
Message-ID: <a9ae1f74-e48e-f266-7e88-5b2ad27cf7fe@linux.intel.com>
Date: Mon, 25 Oct 2021 15:07:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [phosphor-sel-logger] How to add a journal entry manually
Content-Language: en-US
To: openbmc@lists.ozlabs.org
References: <DM6PR08MB5514939D6512525765C3EE23DC839@DM6PR08MB5514.namprd08.prod.outlook.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <DM6PR08MB5514939D6512525765C3EE23DC839@DM6PR08MB5514.namprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 10/25/2021 5:02 AM, Chris Chen (TPI) wrote:
> Hi all,
> 
> I for now have added rsyslog and phosphor-sel-logger packages to build 
> the image, then I could see the xyz.openbmc_project.Logging.IPMI through 
> the busctl command after the system runs up.
> 
>  From this link, 
> https://lists.ozlabs.org/pipermail/openbmc/2019-October/018640.html 
> <https://lists.ozlabs.org/pipermail/openbmc/2019-October/018640.html>, I 
> understand that I should be able to add a journal entry that has the 
> IPMI SEL MESSAGE_ID: "b370836ccf2f4850ac5bee185b77893a" to test the 
> feature, but I don't know to give the correct parameters to the method 
> call, IpmiSelAdd, as below,
> 
> ~# busctl call xyz.openbmc_project.Logging.IPMI 
> /xyz/openbmc_project/Logging/IPMI xyz.openbmc_project.Logging.IPMI 
> IpmiSelAdd xxx
> 
> Could someone help me out on this? Thank you.
You can find the implementation for IpmiSelAdd, here: 
https://github.com/openbmc/phosphor-sel-logger/blob/master/src/sel_logger.cpp#L270.

"IpmiSelAdd", [](const std::string& message, const std::string& path,
                     const std::vector<uint8_t>& selData,
                     const bool& assert, const uint16_t& genId)

Where
message = the string to set as the MESSAGE in the journal
path = the D-Bus path to the sensor that logged the event
selData = the raw bytes of the IPMI SEL entry
assert = the event direction of the SEL event
genId = the Generator ID for the SEL event

The busctl format is 'ssaybq', so a sample command is
busctl call xyz.openbmc_project.Logging.IPMI 
/xyz/openbmc_project/Logging/IPMI xyz.openbmc_project.Logging.IPMI 
IpmiSelAdd ssaybq "helloworld" "/xyz/openbmc_project/Test" 3 16 32 64 
true 0x81

This should add an IPMI message to the journal that is picked up by 
rsyslog and sent to /var/log/ipmi_sel like this:

root@intel-obmc:~# cat /var/log/ipmi_sel
2021-08-20T01:16:48.747428+00:00 1,2,102040,81,/xyz/openbmc_project/Test,1


> 
> Regards,
> 
> Chris Chen.
> 
> Legal Disclaimer :
> The information contained in this message may be privileged and 
> confidential.
> It is intended to be read only by the individual or entity to whom it is 
> addressed
> or by their designee. If the reader of this message is not the intended 
> recipient,
> you are on notice that any distribution of this message, in any form,
> is strictly prohibited. If you have received this message in error,
> please immediately notify the sender and delete or destroy any copy of 
> this message!
