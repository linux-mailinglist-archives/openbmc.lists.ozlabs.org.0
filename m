Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6727120427D
	for <lists+openbmc@lfdr.de>; Mon, 22 Jun 2020 23:17:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rMgJ5VPxzDqXr
	for <lists+openbmc@lfdr.de>; Tue, 23 Jun 2020 07:17:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rMfd1fnLzDqV4
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jun 2020 07:16:39 +1000 (AEST)
IronPort-SDR: jbdJyRh1g4wfonLiJCXH7tjQFNhKKpr1cvUn/E7IaLq7UK7/8905QYOAgBJFGfEcJosF6COqpM
 NOV1dCxT8+FA==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="145382967"
X-IronPort-AV: E=Sophos;i="5.75,268,1589266800"; d="scan'208";a="145382967"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2020 14:16:35 -0700
IronPort-SDR: /LlOqsGGUZmIAh8fuFs34HVTriGlAIMWn3RpHCZWFz6riGYdS9fSn0kGKlrws4oc5EUPf/VXjl
 07GvY9uoVpfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,268,1589266800"; d="scan'208";a="318896891"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.212.201.166])
 ([10.212.201.166])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Jun 2020 14:16:35 -0700
Subject: Re: Message registries continuation
To: Matt Spinler <mspinler@linux.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <74794819-3b3c-0c39-30e0-b2ca6c46d9fb@linux.ibm.com>
 <85015a54-0de6-42e2-bd56-732c7f0a420d@linux.intel.com>
 <bf459022-2ff9-e596-6c7d-25717a0efe43@linux.ibm.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <5d7fba06-b5fd-2fce-d05e-7f2b99069a2e@linux.intel.com>
Date: Mon, 22 Jun 2020 14:16:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <bf459022-2ff9-e596-6c7d-25717a0efe43@linux.ibm.com>
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
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/22/2020 1:46 PM, Matt Spinler wrote:
> Hi James,
> 
> Something I forgot below - when building up our event logs, I have about 
> a dozen fields (mostly OEM)
> that I have to get from the OpenBMC event log's corresponding PEL (IBM's 
> enterprise log format).
> 
> PELs aren't on D-Bus for a few reasons, such as they can be several KB 
> in size and consist of several
> dozen discrete fields, so that rules out bmcweb getting them that way.

Would doing something like having the fields in the journal with a link 
to a file work? See this design for more info: 
https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md

> 
> I do have a shared library that has the PEL APIs I need (PELs themselves 
> are in files). Is it OK if I
> just link in that library as needed when a USE_PELs or whatever option 
> is set?
> Alternatively, I could also dlopen it I suppose.

There's another thread over here 
https://lists.ozlabs.org/pipermail/openbmc/2020-June/022082.html 
happening right now discussing types of logging. As we already have 2 
forms of logging supported, I'm a little hesitant to the idea of a third 
without at least some formal direction of what we want logging to look 
like as a project. More so as we add advanced features on top of 
logging, it makes it more difficult to support different methods.

> 
> Just trying to avoid a surprise during review.
> 
> Thanks
> 

