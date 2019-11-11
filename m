Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4DFF822B
	for <lists+openbmc@lfdr.de>; Mon, 11 Nov 2019 22:22:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BkNL0TDtzF4M8
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2019 08:22:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BkMf4XwKzF4F7
 for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2019 08:21:33 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Nov 2019 13:21:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,293,1569308400"; d="scan'208";a="234610052"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga002.fm.intel.com with ESMTP; 11 Nov 2019 13:21:31 -0800
Subject: Re: entity-manager: adding additional fru formats to fru-device
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <80AD98E1-20D5-4ADD-ADD2-6901A3B77A43@fuzziesquirrel.com>
 <120a78a0-1801-facf-040b-346471c37b70@linux.intel.com>
 <D4FB1F4C-C279-47B5-A55B-108D7186A1C3@fuzziesquirrel.com>
 <1327cf09-6bb2-7901-598f-3411ad724efb@linux.intel.com>
 <E1DC15AE-6CA8-46CD-AA27-DD31B21A5BE6@fuzziesquirrel.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <21bd66d8-f419-9171-da45-4c773e6a7d98@linux.intel.com>
Date: Mon, 11 Nov 2019 13:21:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <E1DC15AE-6CA8-46CD-AA27-DD31B21A5BE6@fuzziesquirrel.com>
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

On 11/11/19 12:47 PM, Brad Bishop wrote:
> 
> 
>> On Nov 11, 2019, at 3:06 PM, James Feist <james.feist@linux.intel.com> wrote:
>>
>> Oh I assumed it was long living, I guess I misunderstood. Either should be fine. Is there any reason to make the parsing logic a shared library?
> 
> None other than continuing to support the existing application.
> 
> Now that I think about it, I could probably re-work the existing application that uses the parsing logic to instead just call the fru-device DBus API (removing the need to expose the parsing logic via shared library).  Does that seem better?

I think that sounds good.

> 
>> The parsing logic could probably just be a build switch otherwise, I imagine some sort of binary-to-dict function that we could just create multiple of and compile time choose what format we want.
> 
> Any issue with support for multiple formats at the same time?
> 

Only if they conflict somehow. I don't know enough about VPD to 
determine that. IPMI FRU format requires a specific header that we check 
to determine if it's an IPMI FRU. If VPD matches this header, then we 
won't be able to tell which parsing algorithm to use, unless you know of 
some other way to tell. I guess we could run the full parse on both as 
well, but the header check was mostly there to avoid scanning something 
too much that isn't a fru. If they can co-exist, that'd be preferable. 
If they collide we can do a build switch was my thought.
