Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D236C23B
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2019 22:38:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ppxW4qkqzDqQW
	for <lists+openbmc@lfdr.de>; Thu, 18 Jul 2019 06:38:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ppws1x6DzDqK5
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jul 2019 06:37:28 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jul 2019 13:37:24 -0700
X-IronPort-AV: E=Sophos;i="5.64,275,1559545200"; d="scan'208";a="319424820"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jul 2019 13:37:23 -0700
Date: Wed, 17 Jul 2019 13:37:22 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Patrick Venture <venture@google.com>
Subject: Re: Super Short OEM IPMI Proposal
Message-ID: <20190717203722.GA31389@mauery.jf.intel.com>
References: <CAO=notxgpy8N5bf4GyqgoTaw6KdRgCUE7jy5Jk-a3-TZDYRpwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAO=notxgpy8N5bf4GyqgoTaw6KdRgCUE7jy5Jk-a3-TZDYRpwQ@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 17-Jul-2019 01:10 PM, Patrick Venture wrote:
>Hi all;
>
>Undoubtedly you've been using IPMI out of necessity and ran into some
>limitations.  You've then worked to map out the commands you want, and
>dropped them into the OEM space.
>
>I was looking at how Intel handled one of their OEM commands and
>effectively want that command -- not all their commands, but just that
>one.  And I was curious if there was any value in OpenBMC as a
>community working to define some shared OEM commands.
>
>Is there value in this or will it just become a cumbersome camel?

     //
   _oo\
  (__/ \  _  _
     \  \/ \/ \
     (         )\
      \_______/  \
       [[] [[]
       [[] [[]

As much as I don't want to tell someone to cut and paste code, I can't 
really think of a good way to share something like an OEM command that 
doesn't really have a shared spec. I guess it depends on the command 
that you are interested in. We have overridden a couple of standard 
commands to have behavior that is slightly different than the default 
and we have two whole netfns of OEM commands that we have carried along 
for generations of BMC implementations. Either way, the commands are 
subject to change over time that may or may not diverge from what anyone 
else might want, which is where the shared bit can become awkward. But 
copied code won't necessarily get any updates or bug fixes, so that is 
not great either.

--Vernon
