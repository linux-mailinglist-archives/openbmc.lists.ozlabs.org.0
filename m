Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DA9B2637
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2019 21:46:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VR2l4C9wzF5fW
	for <lists+openbmc@lfdr.de>; Sat, 14 Sep 2019 05:46:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VR226zYwzF5QW
 for <openbmc@lists.ozlabs.org>; Sat, 14 Sep 2019 05:45:28 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Sep 2019 12:45:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="197661247"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by orsmga002.jf.intel.com with ESMTP; 13 Sep 2019 12:45:25 -0700
Subject: Re: Rant regarding code review issues
To: openbmc@lists.ozlabs.org
References: <EB0500AF-9574-4007-BE55-B6E7384D027C@fb.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <f5205bbe-7320-67ee-2b2d-91c5cc185b02@intel.com>
Date: Fri, 13 Sep 2019 12:45:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <EB0500AF-9574-4007-BE55-B6E7384D027C@fb.com>
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

On 9/13/19 11:52 AM, Wilfred Smith wrote:
> 
> I strongly assert that there should be a formal list of commit rules. If the rules were actually documented and published, one could go through the checklist to ensure that the commit conforms. The result would be less time wasted by the committer and the reviewers, as well as more consistency.
> 
https://github.com/openbmc/docs

> But it sucks to have a commit booted for reasons that (a) I could not reasonably be expected to have known previously (because I read the documentation, of course) and(b) I may legitimately disagree with (e.g. the insanity that anyone
holds to an 80-column rule instead of 132 in a day of 4K monitors and
75-character class names inside nested namespaces that are just as long,
not counting fully decorated traits). Oh…right…just use “auto”.

From the coding standard here:
https://github.com/openbmc/docs/blob/master/cpp-style-and-conventions.md

"Line length should be limited to 80 characters."

You are welcome to disagree with that statement, but the recommended way
to go about that would be to push a review to change to that rule,
invoking a 132 character line length, and start a discussion about the
above.  After that, follow up with changes to the clang-format, and
commits to each repository to change the codebase to obey the new rule.
I'm willing to bet if you did that, many people would agree with you,
and we'd have a very productive discussion about it.

It should be noted, for most code, all of this formatting is automatic
via clang-format, which is documented on the next line in the file I linked.

With all of the above, I'm struggling to see how you're wanting to
improve here.  Do you think the documentation could be cleaned up?  Is
the documentation too long to read?  Should we organize it in a
different way so that the information above is easier to find?

> 
> The process should be somewhat predictable, preferably programmatic.

Agreed, but throughout this email, I don't see any actionable suggestion
on how this could be improved.  Could you focus a little more on what
you think we could change to make this situation better?

> 
> Mind you, I have no problem with complying with the maintainer’s rules, but I’d like to have some chance at getting a trivial commit passed on the first shot. Two lines of BitBake config, that actually accomplish what is intended, fetches a half-dozen complaints?

Assuming this is the review you're talking about:
https://gerrit.openbmc-project.xyz/c/openbmc/meta-facebook/+/25145

It was 7 lines of bitbake config, and it followed some project practices
that are deprecated and trying to be removed.

Interestingly enough, I'm not able to find where we document the 50/72
rule for commit messages, although I know some editors will enforce it
when you do your edits.  I would've expected it to be here:
https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#submitting-changes
Maybe that's an improvement to the docs you could propose?

> 
> It helps the maintainer if committers are able to self-police 98% of the issues, and makes the entire process seem less hostile.

Agreed.  I'd also mention that in some cases (like the 50/27 rule and 80
character line lengths) the CI could give faster feedback for obvious
things.  Is that something you'd be willing to look into automating in
the CI?  I'm sure a lot of people would appreciate you doing so.
There's a lot of low hanging fruit here that could be added to CI to
make the responses seem less hostile.

> 
> Also, there are too many places to put the same information. I quoted the warning messages I was remedying in the patch set comments, but summarized in the commit message because that seemed like the right thing to do. And that got me another downvote.

At the end of the day, the commit message is what most people are
looking at once the commit is merged, and you put a single line that
wasn't very descriptive.  The maintainer pointed out that you already
had the level of detail needed, you just failed to put it in the commit
message.  Certainly, writing this email took longer than just updating
the commit message with more detail?
