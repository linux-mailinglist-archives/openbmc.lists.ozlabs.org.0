Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD448313AE4
	for <lists+openbmc@lfdr.de>; Mon,  8 Feb 2021 18:28:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZCfd4Rl3zDvX7
	for <lists+openbmc@lfdr.de>; Tue,  9 Feb 2021 04:28:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZCdv0PxWzDr6P
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2021 04:27:45 +1100 (AEDT)
IronPort-SDR: 4G1Y3QIZMzTnTgosaDj+1cc3aLw4K/r9Vj4/bGYCQazuuB0C2TdmimT87I9fmr0o/zJrTwIKpp
 Ece5CLMVL+lA==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="169430251"
X-IronPort-AV: E=Sophos;i="5.81,162,1610438400"; d="scan'208";a="169430251"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 09:27:42 -0800
IronPort-SDR: gXnNl02Pau+O+xJ7JYSPPxVMNGz9SZwmS9t0zwTnYQqV9ZEtLP5k9v2b/j4TOoZNHwH+vadvtg
 zV9cPhKMmIIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,162,1610438400"; d="scan'208";a="418872163"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 08 Feb 2021 09:27:41 -0800
Received: from [10.209.112.124] (jmbills-MOBL.amr.corp.intel.com
 [10.209.112.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C1D42580428
 for <openbmc@lists.ozlabs.org>; Mon,  8 Feb 2021 09:27:41 -0800 (PST)
Subject: Re: Making the "new repo" requests go faster
To: openbmc@lists.ozlabs.org
References: <CACWQX80G75i+s8Vcro64uEyvcZn1Dc60y-coS6GqrvkJo59Kqg@mail.gmail.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <c3485284-2ead-ec47-e277-da1694fb6127@linux.intel.com>
Date: Mon, 8 Feb 2021 09:27:41 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACWQX80G75i+s8Vcro64uEyvcZn1Dc60y-coS6GqrvkJo59Kqg@mail.gmail.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 2/5/2021 12:02 PM, Ed Tanous wrote:
> An issue I've seen in the past with adding new repositories, is there:
> 1. Isn't a clear place to push code reviews for something "new".
> 2. The project quality/CI/formatting rules aren't really enforced
> until after you request a repo, then push code to it.
> 3. Setting up a new daemon with CI/build is non-trivial, and has sharp edges.
> 4. "state of the art" build constantly changes (make -> autotools ->
> cmake -> meson, clang-format, clang-tidy, shellcheck, cppcheck,
> service file location, ect).
> 
> In an effort to fix these issues and more, I'd like to propose
> creating a new repository for a "new daemon" template.  The hope would
> be that we can centralize a single set of "current state of the art"
> guidelines in such a way that they're usable more than just checking
> them into documentation.  Initially, template repo would contain:
> 
> 1. A meson file, that compiles a "hello world" dbus application that
> requests a name.
> 2. All the relevant .clang-tidy, .clang-format, and cppcheck files
> required to ensure that CI is testing as much as we can.
> 3. Unit tests
> 4. Pre-integrated repo CI.

+1 on this.  This would be very helpful for knowing how to set things up 
with the latest set of tools.  I know in a crunch, I would tend to leave 
some of these things out because I don't know how to get started on them.

In the future, it would also be nice to expand on the basics with some 
common enhancements such as build options in meson.

> 
> The end goal of this would be that when new code is created, whomever
> was looking for a new repository could push a gerrit review to this
> "template repo" and the CI could ensure that it met the automated
> quality requirements long before any maintainer actually reviewed it.
> This would likely reduce the time it takes to propose "I want to add a
> new repo" and make a procedure for doing it a lot more concrete than
> sending an email to the mailing list.
> 
> As part of this, I'd also want to deprecate and remove the .clang-tidy
> and .clang-format that are present in the docs repo, and supersede
> them with the files in the new repo, such that any changes to the CI
> infrastructure could be proposed on the template repo first.
> 
> FWIW, I take no credit for the above idea, I 100% stole it from James
> Feist, who thought through the broad strokes of this a while back when
> we were talking about how to move new initiatives along faster without
> burdening maintainers.
> 
> I'd love feedback.  Do others think this worth doing?
> 
> -Ed
> 
