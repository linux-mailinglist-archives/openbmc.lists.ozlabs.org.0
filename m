Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC9160BDB7
	for <lists+openbmc@lfdr.de>; Tue, 25 Oct 2022 00:45:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mx9Bp4R5Lz3bjL
	for <lists+openbmc@lfdr.de>; Tue, 25 Oct 2022 09:45:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vnji15pD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vnji15pD;
	dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mx9BB1yCKz3045
	for <openbmc@lists.ozlabs.org>; Tue, 25 Oct 2022 09:44:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666651490; x=1698187490;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IG1AWgT9gezUBN9/bKsQhTaoHNWshNU4WnW0NnXmn3A=;
  b=Vnji15pDRNpKmiCjWkjw5Pku7rXF39ng/LpkR4kJmM68I3RO31MRI/Xj
   SaV02T+14wqkTk49BQTUiWYG3PaAqmqj7Cu74RLiXLwY9WQ27Oq7w00eT
   WBHmOEHg0eTe6BcRniRgAI7cWAflM8SCMHKzdSoN/0TbfVUAoZPehNs4A
   eCYcUBKq0I2J/MmMnzwVlTDFNm+7lGlO3gYQn8SVr1iVq1puhP9KLggxJ
   vzN9iupM4RctK+cgItJlHLB1KwO+SLcf+YflKGmsOf9iZ9J8Je/yi4iGr
   MZEuH3SX55ExUOo4pyR6bnCz9tpACimhJ0CtG1+cm0XWsXsrnsJpM799I
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="294939851"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; 
   d="scan'208";a="294939851"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2022 15:44:45 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="662589294"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; 
   d="scan'208";a="662589294"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com) ([10.243.48.71])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2022 15:44:45 -0700
Date: Mon, 24 Oct 2022 15:44:37 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: Adding support for custom SEL records
Message-ID: <Y1cVVd2hTbsAxYlr@mauery.jf.intel.com>
References: <CAGm54UFshn7RpFMhpoJrMVHh9ONibDQ0DKoUokaG0q7V4Qi5VQ@mail.gmail.com>
 <e91a28c961288e3ead27cff19dfc9f03907f4405.camel@fuzziesquirrel.com>
 <CAGm54UE55N3JW0CUYb9piRopBcz35+Q2H66row-fDBf1VEGo+w@mail.gmail.com>
 <b96c24c0a1e5779c66a8882b6eec9883f9bd5e00.camel@fuzziesquirrel.com>
 <5994636c-b32a-0b8a-5873-a73390318fe3@linux.intel.com>
 <Y1L9vCFMvm8alJMC@heinlein.stwcx.org.github.beta.tailscale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Y1L9vCFMvm8alJMC@heinlein.stwcx.org.github.beta.tailscale.net>
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
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 21-Oct-2022 03:14 PM, Patrick Williams wrote:
>On Wed, Oct 19, 2022 at 09:50:47AM -0600, Bills, Jason M wrote:
>
>> Intel had a requirement to support storing at least 4000 log entries.
>> At the time, we were able to get about 400 entries on D-Bus before D-Bus
>> performance became unusable.
>>
>> That was before dbus-broker, so it could perhaps be better today.
>
>I was surprised that there would be much performance impact to dbus as a
>whole because there should not be any impact to the bus because one
>process decided to host a bunch of objects.  I can understand _that_
>process becoming slower if there are algorithmic problems with it.

I suspect that it was a combination of the switch to dbus-broker in 
addition to rewriting the mapper, which made the number of SEL entries 
phosphor-logging is capable of handling go up from what it was before.

>I did an experiment on an AST2600 system where I modified phosphor-logging
>to support 20k log entries and then created 10k of them.
>
>```
>$ cat meta-facebook/recipes-phosphor/logging/phosphor-logging_%.bbappend
>FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
>
>EXTRA_OEMESON += "-Derror_cap=20000"
>```
>
>What I've found can be summarized as follows:
>
>   - Overall there is no impact to the dbus by creating a large number
>     of log entries.  Interactions with other daemons happen just fine
>     with no performance impact.

Right, I don't expect that once they are created that they would have a 
meaningful impact other than maybe some sort of memory footprint, 
though, that footprint is magnified from just phosphor-logging by the 
mapper.

>   - Creating 10k log entries does take a while.  Most of this time is
>     observed (via top) in jffs2 but there is also some peaky objmgr
>     activity.  There might be some improvements to be had there, but I
>     don't think anyone is intending to create 10k events in the span of
>     a minute.

This is really my biggest concern at this point. The OpenBMC is already 
the slowest-to-boot BMC firmware that I have worked on in the past 10 
years, and that is in the face of faster BMC processors and faster RAM. 
Delay the 'fully booted' state of the BMC for this will cause validation 
bugs because the BMC is changing behavior even though it should be at a 
stable state.

>   - Dumping all the events from phosphor-logging is slow when there are
>     10k of them.  It took 8-11s.  I didn't have `strace` installed, but
>     it seemed like much of this was coming from `busctl` processing the
>     result and not from the bus transfer itself, but more investigation
>     would be required.

I think more investigation needs to be done here. We should be limited 
by the network, not by accessing the items.

>   - Deleting all 10k of the events timed out at a dbus level, but still
>     succeeded.  Almost all of the time was spent in jffs2.

This would be a lot faster if all the items were in a single file, which 
is a change that could be made independently of whether or not the 
individual log entries are hosted as dbus objects.

--Vernon
