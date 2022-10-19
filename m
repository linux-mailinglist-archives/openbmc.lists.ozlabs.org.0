Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD91604F54
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 20:05:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MszDR1YT7z3c3G
	for <lists+openbmc@lfdr.de>; Thu, 20 Oct 2022 05:05:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BXfe7IHd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BXfe7IHd;
	dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MszCp08r0z2yQl
	for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2022 05:05:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666202710; x=1697738710;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=yBt8VLs8204CtleSQhfe/Cd/NVBXetGTRhc/7itoqq4=;
  b=BXfe7IHdP7QfoVyS9ccj8O1VULUsPlnlzTD61qk7AY3OX8CoJRgkZXes
   L4D8A/LAQKvisOan2BuCpqnPpOFZ4vjeYHXcvYoTIVrkTowjeW5tQeaB6
   t5frMGXqy8IW43Jkm5UsRpnPE68rwaL0RXgZdPvbhDHY7Kmr9iUhx/Xiy
   eQNJZNzAsMNLyAgCcAsY5M75L+aZ/v4dkrL7vRopBcN7SbywZ9eW4K3/k
   zB5m7ZBkFOAghM7C4ddDmGJzorguHsn8gy3xRGm7v7G6w9tbjF+t2PbJV
   biA3QqOBWPj12TAVtBvKgUyTj1CMC5EdFItMwCrSsZSzNTInzJaPf90y/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="293886369"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; 
   d="scan'208";a="293886369"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2022 11:05:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="771909480"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; 
   d="scan'208";a="771909480"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga001.fm.intel.com with ESMTP; 19 Oct 2022 11:05:04 -0700
Received: from [10.212.45.137] (jmbills-mobl1.amr.corp.intel.com [10.212.45.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 8E467580C3B
	for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2022 11:05:04 -0700 (PDT)
Message-ID: <6a0d18b1-cc43-41ad-9f9a-85c0a927e5b2@linux.intel.com>
Date: Wed, 19 Oct 2022 12:05:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: Adding support for custom SEL records
Content-Language: en-US
To: openbmc@lists.ozlabs.org
References: <CAGm54UFshn7RpFMhpoJrMVHh9ONibDQ0DKoUokaG0q7V4Qi5VQ@mail.gmail.com>
 <e91a28c961288e3ead27cff19dfc9f03907f4405.camel@fuzziesquirrel.com>
 <CAGm54UE55N3JW0CUYb9piRopBcz35+Q2H66row-fDBf1VEGo+w@mail.gmail.com>
 <b96c24c0a1e5779c66a8882b6eec9883f9bd5e00.camel@fuzziesquirrel.com>
 <5994636c-b32a-0b8a-5873-a73390318fe3@linux.intel.com>
 <20221019171044.s4kfuqehuwwxpiit@cheese>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <20221019171044.s4kfuqehuwwxpiit@cheese>
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



On 10/19/2022 11:10 AM, Brad Bishop wrote:
> Thanks Jason
> 
> On Wed, Oct 19, 2022 at 09:50:47AM -0600, Bills, Jason M wrote:
> 
>> Intel had a requirement to support storing at least 4000 log entries. 
> 
> Ok.  So is it fair to assume anyone using the DBus backend does not have 
> this requirement?

That is my assumption, yes.
> 
>> At the time, we were able to get about 400 entries on D-Bus before 
>> D-Bus performance became unusable.
> 
> To anyone using the DBus backend - have you observed similar performance 
> issues?
> 
> Jason is there a testcase or scenario I can execute to highlighht the 
> issues you refer to concretely?  Maybe something like "create 4000 sels, 
> run ipmitool and see how long it takes?"

To clarify, my understanding is the D-Bus performance issues were not 
isolated to just IPMI.  All of D-Bus for every BMC service was impacted.

If I remember correctly, Ed Tanous is who did the initial evaluation, so 
he may have more detail.  But I think it was similar to what you 
suggest: Create 4000 logs on D-Bus and check the performance.  This 
could be done with ipmitool.
> 
>> I'd also be curious about the reverse question.  Is there any benefit 
>> to storing logs on D-Bus that makes it a better solution?
> 
> Yes, this is exactly the question I've been trying to ask.  The answer 
> seems only to be that the code is in meta-intel/intel-ipmi-oem - but 
> that is easily fixed by moving the code to 
> meta-phosphor/phosphor-host-ipmid.
> 
>> At the risk of complicating things more (https://xkcd.com/927/), D-Bus 
>> was the primary solution when Intel joined.  We created the rsyslog 
>> approach because of the limitation imposed by D-Bus.  But I know there 
>> are still those who don't like the rsyslog approach.  Is there a way 
>> we can now get together and define a new logging solution that is 
>> fully upstream and avoids the drawbacks of both existing solutions?
> 
> I hope so, because doing that would make things a lot easier for our 
> users adopting OpenBMC.

My main requirements are to store many logs (at least 4000 was the 
original number, but I can try to get an updated number if needed) and 
have them persist across BMC reboots.

We currently accomplish this using rsyslog to extract logs from the 
journal and store them in a persistent text file.

How is best to approach starting a new design discussion?  Should we 
continue discussing in this thread?  Start a design doc review? 
Something else?
> 
> Thanks,
> brad
