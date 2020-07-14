Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FE121FFC4
	for <lists+openbmc@lfdr.de>; Tue, 14 Jul 2020 23:14:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5tYW6909zDqbG
	for <lists+openbmc@lfdr.de>; Wed, 15 Jul 2020 07:14:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5tTx2w1ZzDqc4
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jul 2020 07:11:00 +1000 (AEST)
IronPort-SDR: 2jrXqu/W9+2jIb8Sts4Fn8p6BP2B/Gok+X4xGeTBTWc75jLuHBDSwnghIAQ3TmW7kaCkpTJroD
 sCPIVNUrZvXw==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150446173"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150446173"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 14:10:57 -0700
IronPort-SDR: BETz50KcLzxI7BMFHfhKT86/FM3hz9T/H1QUzANJFJ7xxTP9nTO+p39T/M1nAyiEnfLY6GhC/W
 jwp4N/YsUnUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="299673689"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.254.179.82])
 ([10.254.179.82])
 by orsmga002.jf.intel.com with ESMTP; 14 Jul 2020 14:10:57 -0700
Subject: Re: Redfish HealthRollup/LED question
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>, vishwa@linux.vnet.ibm.com
References: <56aeaf07-beb1-22ca-ab54-aa984ea82bf1@linux.vnet.ibm.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <a372f939-e33f-db57-5b46-09b7f8e569ff@linux.intel.com>
Date: Tue, 14 Jul 2020 14:10:57 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <56aeaf07-beb1-22ca-ab54-aa984ea82bf1@linux.vnet.ibm.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 7/14/2020 4:44 AM, Deepak Kodihalli wrote:
> Hi James/Gunnar,
> 
> On IBM platforms, a fault indicator LED associated with a FRU can 
> indicate the "Health Rollup" status of the FRU. For eg a CPU can be 
> healthy, but something contained within (eg a core) may be broken, so 
> the LED will be turned on. I think the Redfish HealthRollup property is 
> conceptually similar.
> 
> Question is - do you see a problem if we add code in bmcweb that sets 
> the HealthRollup property for a FRU if an associated LED is turned on? I 
> believe this is aligned with 
> https://github.com/openbmc/docs/blob/master/designs/redfish-health-rolllup.md 
> (no new D-Bus objects/interfaces being added, etc). On IBM platforms, a 
> D-Bus association might exist between the FRU and the LED, and setting 
> the HealthRollup property will be based on this. If the said association 
> is missing on other platforms, the code will not do anything.

What changes does this require? I believe this is how the health roll up 
functions today.

> 
> Thanks,
> Deepak
