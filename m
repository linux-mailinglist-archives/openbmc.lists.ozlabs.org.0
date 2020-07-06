Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E589216158
	for <lists+openbmc@lfdr.de>; Tue,  7 Jul 2020 00:14:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B10GZ5Q5LzDqf9
	for <lists+openbmc@lfdr.de>; Tue,  7 Jul 2020 08:14:14 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B10Fq27lTzDqMg
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jul 2020 08:13:34 +1000 (AEST)
IronPort-SDR: R50FFA1CY3zM4EQmAKvbC3muH6EI67FcACZ8mq5n9Hz8EMDjFhoAV71lJl/pcG4Zt/vlq0tsai
 F2qRo0R51p+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9674"; a="149021411"
X-IronPort-AV: E=Sophos;i="5.75,321,1589266800"; d="scan'208";a="149021411"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2020 15:13:31 -0700
IronPort-SDR: Maht9NXVdAC+/EkdzbU7v9BgGvxclXwhILluw+5bd600oh29GimKtQTB23MQ9KOJ3dbrRSTP3/
 VdM2Fe/7W1lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,321,1589266800"; d="scan'208";a="314086111"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 06 Jul 2020 15:13:31 -0700
Received: from [10.251.158.177] (jmbills-mobl.amr.corp.intel.com
 [10.251.158.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id E54465805A3;
 Mon,  6 Jul 2020 15:13:30 -0700 (PDT)
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, john.leung@intel.com
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: Redfish Processor Command
Message-ID: <16576aa9-ae11-82b7-8f31-88f82684d703@linux.intel.com>
Date: Mon, 6 Jul 2020 15:13:30 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
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

Hi All,

Intel processors have an interface called PECI that allows commands to 
be sent to the processor from the BMC, and we currently provide a 
Redfish OEM action to send PECI commands to the processor.

We proposed to the DMTF to add a standard command action to the Redfish 
Processor resource for this purpose, and their suggestion was to just 
keep it as an OEM action.

We're now trying to figure out the right way to handle this capability 
in OpenBMC.  Would anyone else have use of a generic processor command 
action in our OpenBMC Redfish implementation?

Thanks!
-Jason
