Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D1E73E83
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 22:25:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45v6Kg5bKkzDqCx
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2019 06:25:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45v6FX5qK7zDqGp
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2019 06:21:51 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jul 2019 13:21:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,304,1559545200"; d="scan'208";a="171602322"
Received: from unknown (HELO [10.241.240.244]) ([10.241.240.244])
 by fmsmga007.fm.intel.com with ESMTP; 24 Jul 2019 13:21:48 -0700
Subject: Re: IPMI Add SEL command question
To: Emily Shaffer <emilyshaffer@google.com>, Harry Sung1 <hsung1@lenovo.com>
References: <626c8a30d1674c71bfb4d4995dde4ca8@lenovo.com>
 <CAJoAoZn6+AZJQWgg_79=gqmAf6016eaWexQUkJDN2q_sfewddw@mail.gmail.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <7e474d7f-dca6-125d-5e93-02cdf870456a@linux.intel.com>
Date: Wed, 24 Jul 2019 13:21:48 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAJoAoZn6+AZJQWgg_79=gqmAf6016eaWexQUkJDN2q_sfewddw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Derek Lin23 <dlin23@lenovo.com>, Duke KH Du <dukh@lenovo.com>,
 Andrew MS1 Peng <pengms1@lenovo.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Payne Yang <pyang4@lenovo.com>, Yonghui YH21 Liu <liuyh21@lenovo.com>,
 Lisa YJ19 Liu <liuyj19@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 7/12/2019 12:07 PM, Emily Shaffer wrote:
> Harry, I suggest that you participate in the discussion on the review 
> you linked to give suggestions. You're right that it's not implemented - 
> if you have a vested interest in it, your best bet is to find out what 
> approach Jason etc. took and see if you can help fix the problems they 
> found in your own implementation. Based on the inactivity there, I'm 
> guessing Intel deprioritized that command, so you should probably expect 
> to drive development effort (or modification of that patch) yourself. >
> On Fri, Jul 12, 2019 at 7:08 AM Harry Sung1 <hsung1@lenovo.com 
> <mailto:hsung1@lenovo.com>> wrote:
> 
>     Hi Team,____
> 
>     __ __
> 
>     I have a question about Add SEL command. __ __
> 
>     This standard command seems not be implemented in
>     “phosphor-host-ipmid”.____
> 
>     (https://github.com/openbmc/phosphor-host-ipmid/blob/master/storagehandler.cpp#L605)____
> 
>     __ __
> 
>     Though I found a patch set about it, but it doesn’t be merged in
>     master due to some issues.____
> 
>     https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/12951____
> 
This change ran into issues when we persisted the journal to flash. 
Because of that, Intel has moved to keeping the journal only in volatile 
memory and using rsyslog to scrape the SEL entries from the journal and 
persist them in a text file which is much more efficient.

We have also moved away from allowing the Add SEL command to go into the 
IPMI SEL because we currently only support dynamic IPMI sensor numbers. 
We still support the Add SEL command but it adds a "Raw SEL" entry to 
the Redfish log instead of IPMI SEL.  However, if the sensor numbers are 
not an issue, the old Add SEL implementation in review should still work.

Our current implementation is here: 
https://github.com/openbmc/intel-ipmi-oem/blob/master/src/storagecommands.cpp.

If there is interest in making the journal+rsyslog SEL implementation 
available as a build option, I can update this review.  Otherwise, it 
may be time to abandon it.

>     __ __
> 
>     Is anyone having any plans to implement it? Or other repository we
>     can refer to?____
> 
>     __ __
> 
>     Thanks,____
> 
>     Harry____
> 
> 
> 
> -- 
> Emily Shaffer
