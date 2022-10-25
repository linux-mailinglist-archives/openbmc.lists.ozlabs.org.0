Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 613D060D56F
	for <lists+openbmc@lfdr.de>; Tue, 25 Oct 2022 22:19:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mxjvy1x5lz3blt
	for <lists+openbmc@lfdr.de>; Wed, 26 Oct 2022 07:19:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SVB8P18s;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SVB8P18s;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MxjvM5Vycz307C
	for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2022 07:18:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666729135; x=1698265135;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=ALecxNN1eyQEYj1Vynn+r9uMN4KB2hGnKmw3sGRTeIM=;
  b=SVB8P18s8dGaAyIjC/634YgjNeBoRV74vK7FfZjdtJ3BRZ2L5DX8iDa9
   HpkPfNjlQs9tyEQL62JyL88AnG2O2ooyLGxqD3GSikn4o9YfnxzeGsRFT
   04lRmUWLwN9HQ7Uq6sY1OXR5/wCf7f1f+a8E0RLghcRrK9IhW4PdwES2d
   xkHlhEx1nQGxoW0+8ZP2/glxBje4DPazC3+4l1KlxlRFYg3C0QAF7jm43
   f3lifefqu4rsjZNORTsTJxg4na6IDcUszKAhD2f8dXYS/r/adrZFCRoBO
   Wz180dERCCy6zmvjdOZ02EkwN+1nJFmP+JLHGhBAjBNEc9cG8+RVbAlVK
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="288178508"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; 
   d="scan'208";a="288178508"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2022 13:18:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="700674024"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; 
   d="scan'208";a="700674024"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga004.fm.intel.com with ESMTP; 25 Oct 2022 13:18:40 -0700
Received: from [10.213.183.198] (jmbills-mobl1.amr.corp.intel.com [10.213.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 0B70B58090C
	for <openbmc@lists.ozlabs.org>; Tue, 25 Oct 2022 13:18:39 -0700 (PDT)
Message-ID: <15b6d689-81fe-92c9-b5a1-d512eecc3e5a@linux.intel.com>
Date: Tue, 25 Oct 2022 14:18:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Adding support for custom SEL records
To: openbmc@lists.ozlabs.org
References: <CAGm54UFshn7RpFMhpoJrMVHh9ONibDQ0DKoUokaG0q7V4Qi5VQ@mail.gmail.com>
 <e91a28c961288e3ead27cff19dfc9f03907f4405.camel@fuzziesquirrel.com>
 <CAGm54UE55N3JW0CUYb9piRopBcz35+Q2H66row-fDBf1VEGo+w@mail.gmail.com>
 <b96c24c0a1e5779c66a8882b6eec9883f9bd5e00.camel@fuzziesquirrel.com>
 <5994636c-b32a-0b8a-5873-a73390318fe3@linux.intel.com>
 <20221019171044.s4kfuqehuwwxpiit@cheese>
 <6a0d18b1-cc43-41ad-9f9a-85c0a927e5b2@linux.intel.com>
 <CAH2-KxDoO4=141nhu2OV-FmyqCCst8_2TSmgvhJP4Ch14vas0A@mail.gmail.com>
 <20221024190322.et5kn54vong3tn2v@cheese>
 <CAH2-KxCAGR0LKE5iDecqe1hSf2zJ2xYhVbYS2hfedrpf9S70Ag@mail.gmail.com>
Content-Language: en-US
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <CAH2-KxCAGR0LKE5iDecqe1hSf2zJ2xYhVbYS2hfedrpf9S70Ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 10/24/2022 2:19 PM, Ed Tanous wrote:
> On Mon, Oct 24, 2022 at 12:03 PM Brad Bishop
> <bradleyb@fuzziesquirrel.com> wrote:
>>
>> This is helpful, thanks Ed.
>>
>> On Mon, Oct 24, 2022 at 10:59:51AM -0700, Ed Tanous wrote:
>> >From what I recall, the requirements were:
>>> - Ability to store 4000 logs in a rotating buffer (original desire was
>>> 10,000, but 4000 was picked as a middle-ground that could be
>>> implemented).
>>
>> A DBus object based implementation could meet this requirement, right?
>>
>>> - Ability to log 100+ entries per second, including when buffers get
>>> overwritten.
>>
>> I guess I would not be shocked if DBus objects + serialization might not
>> be able to sustain this rate of incoming logs.  Maybe it depends on the
>> filesystem or how the data is serialized in the filesystem.  The DBus
>> approach creates many files.  Obviously the syslog approach is only
>> using a couple of files.
>>
>> Do you think this kind of requirement is typical?  Quoting Patrick from
>> another thread here:
> 
> There are cases where every sensor will cross a threshold at the same
> moment (generally because a threshold was changed).  Is this a
> "typical" use case, probably not, but if it's trivial to DOS the BMC
> with events with a couple commands, it's not great.
> 
>>
>>> don't think anyone is intending to create 10k events in the span of
>>> a minute
> 
> Intending to, no.  Created in an error case, or in the case of a
> failing piece of hardware, it can happen.
> 
>>
>> 100/s is only 6k in a minute but that is getting pretty close...
>>
>>> - (abstract) Log storage should be aware of hardware limitations (SPI
>>> flash cell write endurance) and allow writing N logs per minute for
>>> the lifetime of the machine without hardware failure.  (I forget the
>>> value of N).
>>
>> Do you think the rsyslog implementation does better at this?  Why?
> 
> @Jason?  I know there were a lot of worries about write expansion (N
> byte sel log turning into 100XN bytes of JSON) wearing out flash
> faster, and having some interactions with jffs2.
> 

Yes.  We ran into this issue both with trying to use individual files 
per SEL entry and with persisting the journal.  At the time, we only had 
4MB of SPI flash space for persistent storage, and both of those methods 
quickly filled that up.

We now have 8MB, but only a small part of that can be dedicated to 
persisting logs, so we still have a requirement that persisting many 
logs should not consume too much persistent storage space.

>>
>>> - "ipmitool sensor list" should return the results from a full sel log
>>> in less than 1 second (renegotiated from 200ms, the faster the
>>> better).
>>
>> Ok, again I would not be shocked if DBus objects weren't able to deliver
>> on this.
>>
>>> - The logging implementation should be able to support a well-formed,
>>> version controlled, Redfish MessageRegistry to the DMTF
>>> specifications.
>>
>> Do you think a DBus object based implementation could meet this
>> requirement?
> 
> Today, as defined, without duplicating the logging strings, no, but
> DBus is just an IPC;  I'm fairly certain we could define a DBus based
> logging mechanism that met these requirements, but the key is that the
> Redfish instance (bmcweb in this case) needs a-priori knowledge of
> every possible log that the system can publish, and version them with
> DMTF-appropriate semver (existing messages changes rev the patch
> version, new messages revs the subminor version).  The existing
> rsyslog implementation places the log strings into bmcweb, so the only
> thing being transferred over the IPC is the MessageId and the
> specific-instance arguments, which in theory, increases the
> performance quite a bit, and avoids duplicating the strings in two
> places.
> 
>>
>>> - The logging implementation should be able to implement a
>>> well-formed, stable, and ACID compliant IPMI SEL command
>>> implementation.
>>
>> Do you think a DBus object based implementation could meet this
>> requirement?
> 
> Same answer, with today's code, no.  DBus is just an IPC, we could
> potentially define one.
> 
>>
>>>
>>> I don't believe the current DBus implementation can meet the previous
>>> requirements,
>>
>> The motivation of my questions above is to understand which requirements
>> cannot be met by something based on DBus objects.
> 
> Cool.
> 
> 
>>
>> Thanks,
>> brad
