Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 613E626934B
	for <lists+openbmc@lfdr.de>; Mon, 14 Sep 2020 19:28:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bqtd23sqSzDqP4
	for <lists+openbmc@lfdr.de>; Tue, 15 Sep 2020 03:28:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bqtc973V4zDqKl
 for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2020 03:28:09 +1000 (AEST)
IronPort-SDR: XpvqWEFCkfzg+3TWHAa4l9LykusCDEQfOAzQZzUXQJcxSGzKba2Jju/pWVlgnsW7E4mPKNezZm
 hE1GA1IksaEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="146863087"
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; d="scan'208";a="146863087"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 10:28:07 -0700
IronPort-SDR: y7yWu/PJR+8TWvcUkq9rdaL2v09/rt0Wif7zbGuTqLD57ad0Dgdb9Nq0ere5K7Nq1BX734tY1/
 g7cGpTXJ7Syg==
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; d="scan'208";a="338360077"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.251.128.209])
 ([10.251.128.209])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 10:28:06 -0700
Subject: Re: Read FRU of host through ipmi in Entity manager.
To: Kumar Thangavel <thangavel.k@hcl.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <HK0PR04MB2964FFC6D5EF008F106FFC13FD230@HK0PR04MB2964.apcprd04.prod.outlook.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <ed5b540a-5fb8-ca6b-34d3-c6e8b26c3b83@linux.intel.com>
Date: Mon, 14 Sep 2020 10:28:05 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <HK0PR04MB2964FFC6D5EF008F106FFC13FD230@HK0PR04MB2964.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Patrick Williams <patrickw3@fb.com>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>, "vijaykhemka@fb.com" <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/14/2020 9:55 AM, Kumar Thangavel wrote:
> Classification: *HCL Internal*
> 
> Hi All,
> 
>           We are working on the Platform which has multi host and the 
> host are FRUs.  The host and BMC communication is based on IPMB. We have 
> each host is connected in separate ipmb bus.
> 
>           Existing Entity manager has the FRU read info from EEPROM 
> (I2C)in the form of bin file.

Small correction here, FruDevice reads the fru from the eeprom, EM just 
reacts to the d-bus objects.

>           We understand that entity manager does not support ipmb based 
> host fru.
> 
>           So, we are proposing the design to support ipmb based FRU in 
> entity manager.
>           From Entity manager, we will send the generic "read host fru" 
> command request to ipmbbrige to read the host FRU.

That would be directly out of scope for entity-manager 
https://github.com/openbmc/entity-manager#explicitly-out-of-scope 
"Entity manager shall not directly participate in the detection of 
devices". It would be better to either 1. Create a new daemon that can 
parse the frus over ipmb, and have entity-manager probe that. Or 2. 
Update Fru-Device to be able to probe over ipmb.

> 
>           Then, store the host fru info in the bin file to process and 
> creating dbus objects in the entity manager.

Why is this? If you're going this route, Fru Device already has the 
ability to read the baseboard FRU from the file system, it would not be 
hard to have some daemon place the frus in some location that FruDevice 
could then process them.

> 
>           Please let us know your comments on this.
> 
> Thanks,
> 
> Kumar.
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
