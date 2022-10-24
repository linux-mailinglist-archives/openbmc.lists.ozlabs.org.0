Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B649760BE00
	for <lists+openbmc@lfdr.de>; Tue, 25 Oct 2022 00:56:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mx9S448X5z3bYF
	for <lists+openbmc@lfdr.de>; Tue, 25 Oct 2022 09:56:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WmlitFLx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WmlitFLx;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mx9RR5rDFz2xGD
	for <openbmc@lists.ozlabs.org>; Tue, 25 Oct 2022 09:56:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666652180; x=1698188180;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b7fe5qHbfGH13X/tOojG8Lb2JfHgPifoceUzgw9dJSQ=;
  b=WmlitFLxD0yKVQbGJKQBiPh0KIu/cB99aq6EZoJglSpDtdPqP2jyIRxm
   kH6dGoLBYz8tlrqxOOZ/P/4Qp0Np2YuFpykWeQuSt2FwIfABsKEz/LbmS
   NV26FuDUbBBomzR06l9f4w6d64eCpLdDj+0avmSCTDM3xAlyRs1sJdaQZ
   zq3NW0Wrz7nUUcT2zJBgSQPjYJre5n5sffiXrdUCmtqR+jJQoBLxQRIhU
   uIPCSqr6sVxWslwia2Gje7PmpE5RMWIGvCZLxAGpxzuoOYVSKs2NNsKLW
   DhOCk2iCetgsswHwcAUOSc8Qn8CA+X00mkS7Zc3CbjAohzgh+QvSeKQte
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="308633088"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; 
   d="scan'208";a="308633088"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2022 15:56:17 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="664704266"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; 
   d="scan'208";a="664704266"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com) ([10.243.48.71])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2022 15:56:12 -0700
Date: Mon, 24 Oct 2022 15:56:04 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: Adding support for custom SEL records
Message-ID: <Y1cYBPGouQ+X37k7@mauery.jf.intel.com>
References: <CAGm54UFshn7RpFMhpoJrMVHh9ONibDQ0DKoUokaG0q7V4Qi5VQ@mail.gmail.com>
 <e91a28c961288e3ead27cff19dfc9f03907f4405.camel@fuzziesquirrel.com>
 <CAGm54UE55N3JW0CUYb9piRopBcz35+Q2H66row-fDBf1VEGo+w@mail.gmail.com>
 <b96c24c0a1e5779c66a8882b6eec9883f9bd5e00.camel@fuzziesquirrel.com>
 <5994636c-b32a-0b8a-5873-a73390318fe3@linux.intel.com>
 <20221019171044.s4kfuqehuwwxpiit@cheese>
 <6a0d18b1-cc43-41ad-9f9a-85c0a927e5b2@linux.intel.com>
 <CAH2-KxDoO4=141nhu2OV-FmyqCCst8_2TSmgvhJP4Ch14vas0A@mail.gmail.com>
 <20221024190322.et5kn54vong3tn2v@cheese>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20221024190322.et5kn54vong3tn2v@cheese>
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
Cc: Ed Tanous <edtanous@google.com>, "Bills, Jason M" <jason.m.bills@linux.intel.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 24-Oct-2022 03:03 PM, Brad Bishop wrote:
>This is helpful, thanks Ed.
>
>On Mon, Oct 24, 2022 at 10:59:51AM -0700, Ed Tanous wrote:
>>From what I recall, the requirements were:
>>- Ability to store 4000 logs in a rotating buffer (original desire was
>>10,000, but 4000 was picked as a middle-ground that could be
>>implemented).
>
>A DBus object based implementation could meet this requirement, right?
>
>>- Ability to log 100+ entries per second, including when buffers get
>>overwritten.
>
>I guess I would not be shocked if DBus objects + serialization might 
>not be able to sustain this rate of incoming logs.  Maybe it depends 
>on the filesystem or how the data is serialized in the filesystem.  
>The DBus approach creates many files.  Obviously the syslog approach 
>is only using a couple of files.
>
>Do you think this kind of requirement is typical?  Quoting Patrick 
>from another thread here:
>
>>don't think anyone is intending to create 10k events in the span of
>>a minute
>
>100/s is only 6k in a minute but that is getting pretty close...

I think 100/s is a pretty high rate. Actually creating events at that 
rate seems like a signal that the system is in a bit of distress. 
Really, I think the gating factor is how fast they get processed at boot 
time. If loading the events onto D-Bus as objects at boot time is the 
same cost as creating them to start with, 100/s is insufficient for a 
large number of log entries.

>>- (abstract) Log storage should be aware of hardware limitations (SPI
>>flash cell write endurance) and allow writing N logs per minute for
>>the lifetime of the machine without hardware failure.  (I forget the
>>value of N).
>
>Do you think the rsyslog implementation does better at this?  Why?

One file with jffs2 uses fewer bytes than many files. When we were 
trying to figure out how to do a file-based implementation to start 
with, we tried individual files and found we ran out of space quickly 
even though the total size of the files was not that great. We even 
tried using empty files, encoding the data into the filenames themselves 
in hopes to only use inodes but that seemed to suffer the same issue. A 
single file that held all the entries was fast, small, and easy to 
handle.

>>- "ipmitool sensor list" should return the results from a full sel log
>>in less than 1 second (renegotiated from 200ms, the faster the
>>better).
>
>Ok, again I would not be shocked if DBus objects weren't able to 
>deliver on this.

I imagine dbus-broker could handle it, especially on a dual-core system. 
I am not sure the systemd dbus daemon was able to handle it on the 
ast2500.

>>- The logging implementation should be able to support a well-formed,
>>version controlled, Redfish MessageRegistry to the DMTF
>>specifications.
>
>Do you think a DBus object based implementation could meet this 
>requirement?
>
>>- The logging implementation should be able to implement a
>>well-formed, stable, and ACID compliant IPMI SEL command
>>implementation.
>
>Do you think a DBus object based implementation could meet this 
>requirement?
>
>>
>>I don't believe the current DBus implementation can meet the previous
>>requirements,
>
>The motivation of my questions above is to understand which 
>requirements cannot be met by something based on DBus objects.

I think it is possible to come up with a dbus interface that supports 
the various requirements in this thread. I don't believe that the 
current implementation is sufficient though.


--Vernon
