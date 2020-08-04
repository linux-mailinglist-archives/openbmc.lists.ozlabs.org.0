Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7308C23C08C
	for <lists+openbmc@lfdr.de>; Tue,  4 Aug 2020 22:09:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLm7K2xRYzDqC3
	for <lists+openbmc@lfdr.de>; Wed,  5 Aug 2020 06:09:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLm3l4TXrzDqC3
 for <openbmc@lists.ozlabs.org>; Wed,  5 Aug 2020 06:06:26 +1000 (AEST)
IronPort-SDR: B5M351V/nEcO+SSKBIyE1euqAps4Xh9Mo4enUMRJulkZZBE1YUUGaMjMsppeNbtbTfynPVCJWZ
 tgTRjroWlImQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9703"; a="153564208"
X-IronPort-AV: E=Sophos;i="5.75,434,1589266800"; d="scan'208";a="153564208"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2020 13:06:19 -0700
IronPort-SDR: 65EXMKuE/glpBaQphG1ZuNLQESYKZXAeMsB77/wjeoMvypgSucJehTh5nzH0JO7L5UBKJL5tFk
 FoagYIo7NLsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,434,1589266800"; d="scan'208";a="492580124"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 04 Aug 2020 13:06:19 -0700
Received: from [10.213.170.246] (jmbills-mobl.amr.corp.intel.com
 [10.213.170.246])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id E8A545802A4
 for <openbmc@lists.ozlabs.org>; Tue,  4 Aug 2020 13:06:18 -0700 (PDT)
Subject: Re: Redfish Mapped Commands
To: openbmc@lists.ozlabs.org
References: <SG2PR04MB30935D495AA522C5C4742004E14A0@SG2PR04MB3093.apcprd04.prod.outlook.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <adda0f71-217c-70e9-4dd6-d7300a018e48@linux.intel.com>
Date: Tue, 4 Aug 2020 13:06:18 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <SG2PR04MB30935D495AA522C5C4742004E14A0@SG2PR04MB3093.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
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



On 8/4/2020 7:53 AM, Jayashree D wrote:
> Hi All,
> 
> I am about to test redfish commands for the following features.
> 
> Can anyone point me the related redfish commands for those features?
> 
> 1. We are using X86 power control, is there any compatible commands in 
> redfish to test?
 From the system resource (/redfish/v1/Systems/system), you can find the 
ComputerSystem.Reset action which can be used to initiate resets:
     "Actions": {
         "#ComputerSystem.Reset": {
             "@Redfish.ActionInfo": 
"/redfish/v1/Systems/system/ResetActionInfo",
             "target": 
"/redfish/v1/Systems/system/Actions/ComputerSystem.Reset"
         }
     },

The allowable values for ResetType are here: 
/redfish/v1/Systems/system/ResetActionInfo.

> 
> 2. FRU information.
> 
> 3. obmc-console-client to connect the host.
> 
> 4. To set, start and stop the fan speed controller.
> 
> 5. Host Logger.
If you mean the event log, it is here: 
/redfish/v1/Systems/system/LogServices/EventLog.

> 
> 6. LED
> 
> 7. BIOS Upgrade
> 
> 8. Settings Manager
> 
> Thanks,
> 
> Regards,
> 
> Jayashree
> 
> ::DISCLAIMER::
> ------------------------------------------------------------------------
> The contents of this e-mail and any attachment(s) are confidential and 
> intended for the named recipient(s) only. E-mail transmission is not 
> guaranteed to be secure or error-free as information could be 
> intercepted, corrupted, lost, destroyed, arrive late or incomplete, or 
> may contain viruses in transmission. The e mail and its contents (with 
> or without referred errors) shall therefore not attach any liability on 
> the originator or HCL or its affiliates. Views or opinions, if any, 
> presented in this email are solely those of the author and may not 
> necessarily reflect the views or opinions of HCL or its affiliates. Any 
> form of reproduction, dissemination, copying, disclosure, modification, 
> distribution and / or publication of this message without the prior 
> written consent of authorized representative of HCL is strictly 
> prohibited. If you have received this email in error please delete it 
> and notify the sender immediately. Before opening any email and/or 
> attachments, please check them for viruses and other defects.
> ------------------------------------------------------------------------
