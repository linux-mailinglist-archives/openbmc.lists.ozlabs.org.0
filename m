Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35197B57E7
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 00:11:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Xy3s4NNqzF3tn
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 08:10:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Xy313HKRzF3nH
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 08:09:56 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Sep 2019 15:09:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,518,1559545200"; d="scan'208";a="198838162"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by orsmga002.jf.intel.com with ESMTP; 17 Sep 2019 15:09:53 -0700
From: Ed Tanous <ed.tanous@intel.com>
Subject: Re: Updating BMC GUI Front End Framework
To: Derick Montague <Derick.Montague@ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <OF4FF7F8E2.9E3777F1-ON0025846D.004E7B10-0025846D.0051A226@notes.na.collabserv.com>
Message-ID: <010dd1ab-1081-a05f-ec20-3694e1bc0dce@intel.com>
Date: Tue, 17 Sep 2019 15:09:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <OF4FF7F8E2.9E3777F1-ON0025846D.004E7B10-0025846D.0051A226@notes.na.collabserv.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/6/19 7:51 AM, Derick Montague wrote:
> Hello,
>  
> We would like to start the discussion of migrating the BMC GUI off of
> AngularJS. The AngularJS long term support period is 3 years and started
> on 7/1/2018 and will end on 7/30/2021. You can read more about this on
> the angular blog
> - https://blog.angular.io/stable-angularjs-and-long-term-support-7e077635ee9c.

Despite what this says, I would be _very_ surprised if we hit any major
issues after that date.  Given how many major applications are still
AngularJS based, I suspect the angular community itself will continue to
support the 1.X series for a long time to come.  With that said, if
someone wants to move us to something more modern, I'm happy to see it
happen.

>  
> The most likely options for migration are Angular, React, and Vue.
> LogRocket has a decent comparison of the 3 frameworks
> - https://blog.logrocket.com/angular-vs-react-vs-vue-a-performance-comparison/.

I think in the end a lot of this going to be determined by whomever
wants to do the work.  Oddly enough, Inspur has an implementation of a
VueJS based single page app that I've run on OpenBMC before, and seems
to work ok, although it needs some work.

https://github.com/inspur-bmc/OR-web

In their implementation, they even reused the phosphor-webui recipe, and
their backend implementation was based on bmcweb, so at least we know it
interoperates with OpenBMC properly.

If we're going to Angular2+, we will likely need to move to typescript
as well given that's what most of the examples are in.  I'm not sure if
that's something people are comfortable with at this point, but it's
something to consider?


>  
> My first thought based on the size of the application, the need for a
> smaller footprint, and the benefit of a small learning curve would
> be Vue. However, I'm just throwing that out there to start the conversation.
>  

To be clear do people believe the current footprint (about 440kb) is ok
at the moment?  Or are we trying to get a reduction with this change?

> Does anyone else have a preference on the next front end framework?

One thing I'd like to understand is development process;  How are we
going to separate out the javascript changes from the DOM changes that
are needed?  Ideally, we'd separate them, and make sure that we can
generate the same DOM from both frameworks, which should insulate the
effort a bit from having to keep up to date on more recent changes.  By
the time the new effort merges, hopefully it's identical to the existing
feature-wise.

On another topic, one thing I've wondered before:  Do we want to
continue having a single page application?  While it has its advantages,
they come at a cost of complexity and size.  Would it be possible to
build a more statically driven site that gives the same experience?

I suspect the answer is no, but if we're talking about rewriting the
whole frontend from scratch, we should at least ask the question.
