Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CFACCB581E
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 00:40:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Xyjq1cyfzF3yN
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 08:40:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Xyj95byJzF33g
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 08:39:40 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Sep 2019 15:39:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,518,1559545200"; d="scan'208";a="198844551"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by orsmga002.jf.intel.com with ESMTP; 17 Sep 2019 15:39:38 -0700
Subject: Re: Updating BMC GUI Front End Framework
To: Gunnar Mills <gmills@linux.vnet.ibm.com>,
 Derick Montague <Derick.Montague@ibm.com>, kuiying.wang@intel.com
References: <959CAFA1E282D14FB901BE9A7BF4E7724E5253FB@shsmsx102.ccr.corp.intel.com>
 <OFBF5B996D.FFFAE8E7-ON00258478.00712980-00258478.007222FC@notes.na.collabserv.com>
 <cfc33111-4e2c-e46d-a4eb-4231168a9931@linux.vnet.ibm.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <c4161dca-1575-23bc-2386-dee3cf5a6d54@intel.com>
Date: Tue, 17 Sep 2019 15:39:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cfc33111-4e2c-e46d-a4eb-4231168a9931@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
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
Cc: openbmc@lists.ozlabs.org, deg.sse.openbmc@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/17/19 3:13 PM, Gunnar Mills wrote:
> 
>>     2. The sizes of the libraries: Vue is about 80KB, much smaller
>>     than Angular (500+KB), React(100KB).
>>

I have no idea where these numbers are coming from, but we need to pump
the brakes a little.  Any framework we pick is going to require some
non-standard modules, and be run through webpack minification and
compression, which will significantly swing the result as we've seen
with other modules we've tried to compare apples to apples.

Rather than try to compare frameworks in a vacuum, I'd rather state that
the "new" framework must be the same size or smaller than the existing
for the same functionality.  If it's larger, why even upgrade given how
precious flash space is to us?


> I think some of the savings of Vue/React would be negated by the plugins
> we would need but agree this is a benefit.
> 
>>
>>     3. It is already used by big internet company like Gitlab/Alibaba.
>>
> Google and Wix are some companies using Angular.
> Facebook, Uber, Instagram, and Paypal, are some companies using React.

All of the above is irrelevant.  I'm fairly certain Gitlab, Alibaba,
Google, and Wix don't build BMCs (or embedded platforms) using those
frameworks, so I'm not really sure why we're name dropping here.

Lets pick the one that works best for the BMC.

>>      
>>
>> Just adding a consensus of the 3 responders so far. Anyone else have
>> any feedback on the future front-end framework for the GUI?
> 
> I think any of these frameworks would work. I would like to see more
> discussion on this, specially around what benefits we are trying to gain.
> 

Completely agree.  I'm really worried we jumped directly to a new
framework and complete rewrite.  Maybe that's where we'll end up, but
I'd like to get some more concrete answers to why we would consider
rewriting the webui from scratch.  Using something "modern" is not a
good reason.  Security isn't a great reason, as that's largely outside
the webui framework.

IMHO good reasons include:
1. Reducing the code size (both in binary and in LOC checked in)
2. Reducing the number of bugs present, by introducing more robust concepts.
3. Increasing load time and run time performance of the webui.
4. Reducing the jankiness/brittleness of the build system (yes, I'll
take the blame for this) by replacing the frameworks with something more
standard that yocto already understands.
