Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F168F5BF
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 22:28:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468dML15ljzDr7K
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 06:28:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468dLc4kB1zDr7J
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 06:28:07 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Aug 2019 13:28:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,389,1559545200"; d="scan'208";a="260921277"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga001.jf.intel.com with ESMTP; 15 Aug 2019 13:28:03 -0700
Subject: Re: adding notion of "hints" to FruDevice
To: Patrick Venture <venture@google.com>
References: <CAO=notw5RG7f2QxiccqE9xrKY2ERxYG-Lba_uJc8N5E=wu6TVQ@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <39b7d0ea-a926-d7ff-6755-cbb7074686ef@linux.intel.com>
Date: Thu, 15 Aug 2019 13:28:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAO=notw5RG7f2QxiccqE9xrKY2ERxYG-Lba_uJc8N5E=wu6TVQ@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/10/19 7:53 AM, Patrick Venture wrote:
> James;
> 
> One difficulty we've run into is the 16-bit address detection can be
> flaky.  It's not known yet whether there's some underlying i2c issue
> on the board or with the i2c driver that could be leading to the
> flakiness, but to get around it I've been forced to add hints to
> FruDevice locally.  Effectively, it's a lookup that says, if this is
> the bus and address, it's 16-bit.  Sort of a way to say, if something
> is in the PE slot (which we know the buses for) then we know it's
> 16-bit.  It's just an idea of been playing with to get a couple things
> working, and I was curious if the notion had larger appeal?
> 
> the production-ized idea would be, optional hint json configuration
> that does a priority search:
> devices
> addresses
> buses
> 
> So it'd search if there was a device match, then search for an address
> match, then a bus match, otherwise fall back without a hint to the
> dynamic attempt.
> 
> It's certainly not a perfect solution.  It requires the system
> programmer to enforce that certain cards are only placed in certain
> slots -- but it is _optional_...

Any reason to not just try one, if it fails, try the other type of 
scanning? I think that's what the intent of the detection was. To scan 
the header, if it's a valid header, continue, else try the other scan 
mode. We could put a configuration option in the cmakelists too if we 
wanted to allow trying 8 bit or 16 bit first.

-James


> 
> Patrick
> 
