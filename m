Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2F66D282
	for <lists+openbmc@lfdr.de>; Thu, 18 Jul 2019 19:07:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qLCS4Z5ZzDqKs
	for <lists+openbmc@lfdr.de>; Fri, 19 Jul 2019 03:07:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qLBw1TVQzDqNv
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jul 2019 03:06:31 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 10:06:28 -0700
X-IronPort-AV: E=Sophos;i="5.64,278,1559545200"; d="scan'208";a="319701676"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 10:06:28 -0700
Date: Thu, 18 Jul 2019 10:06:27 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Patrick Venture <venture@google.com>
Subject: Re: Super Short OEM IPMI Proposal
Message-ID: <20190718170627.GB31389@mauery.jf.intel.com>
References: <CAO=notxgpy8N5bf4GyqgoTaw6KdRgCUE7jy5Jk-a3-TZDYRpwQ@mail.gmail.com>
 <20190717203722.GA31389@mauery.jf.intel.com>
 <7bff7bf4-6eb0-4327-35af-20f758061c40@intel.com>
 <CAO=notzOsYf6-xau+mqaDOpHQQkf_FdFApRc96kWN0MDjbZJtg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAO=notzOsYf6-xau+mqaDOpHQQkf_FdFApRc96kWN0MDjbZJtg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed.tanous@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 17-Jul-2019 04:02 PM, Patrick Venture wrote:
>On Wed, Jul 17, 2019 at 2:56 PM Ed Tanous <ed.tanous@intel.com> wrote:
>>
>> On 7/17/19 1:37 PM, Vernon Mauery wrote:
>> > As much as I don't want to tell someone to cut and paste code, I can't
>> > really think of a good way to share something like an OEM command that
>> > doesn't really have a shared spec.
>>
>> +1.  Unless we're looking to do an OpenBMC shared OEM spec, which I
>> think would be interesting to discuss, I'm not sure how to effectively
>> share these kinds of thing especially when the needs of the commands
>> change over time.
>
>My thinking was it within the OpenBMC OEM numbering thing.

If there are OpenBMC specific IPMI commands that you think we should 
implement under an OpenBMC OEM NetFn, I think that would be reasonable 
to have in a common place. Nothing is coming to mind right now, but any 
features that are specific to OpenBMC that are not covered by the IPMI 
standard could fit in that. Maybe thing like a mechanism for 
enabling/disabling various phosphor services or something, for example.

--Vernon
