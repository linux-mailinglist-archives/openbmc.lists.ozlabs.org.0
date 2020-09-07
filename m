Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A9C25F738
	for <lists+openbmc@lfdr.de>; Mon,  7 Sep 2020 12:05:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlP6V0yXNzDqBm
	for <lists+openbmc@lfdr.de>; Mon,  7 Sep 2020 20:05:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlP5S2stNzDqCC
 for <openbmc@lists.ozlabs.org>; Mon,  7 Sep 2020 20:04:28 +1000 (AEST)
IronPort-SDR: wCqBQ5GY9LDA9Cr1EDC6biF0pJ6DHvfI1/khKu9BU+alg9hwAdrFCsgVXOSxMaflVyf+wFBJxE
 pG+MW2LcLEQw==
X-IronPort-AV: E=McAfee;i="6000,8403,9736"; a="242797050"
X-IronPort-AV: E=Sophos;i="5.76,401,1592895600"; d="scan'208";a="242797050"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2020 03:03:03 -0700
IronPort-SDR: 0QQ6F8gpq9x/QAarfH94mCUyz1CUEr1so2X1v9Uu2nh+EHNMc4Ara1HNnLq4GXH/TElzsZ13Aa
 O36lMSSsAH1w==
X-IronPort-AV: E=Sophos;i="5.76,401,1592895600"; d="scan'208";a="328041305"
Received: from aambroze-mobl.ger.corp.intel.com (HELO [10.213.17.186])
 ([10.213.17.186])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2020 03:03:02 -0700
From: =?UTF-8?Q?Adrian_Ambro=c5=bcewicz?= <adrian.ambrozewicz@linux.intel.com>
Subject: openbmc\telemetry - upstreaming process boost
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed@tanous.net>
Message-ID: <b114645e-1736-db35-5e35-027b60b02a44@linux.intel.com>
Date: Mon, 7 Sep 2020 12:02:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
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

Hi all,

For those who don't know - we are currently in the process of 
upstreaming first iteration of DMTF TelemetryService D-Bus back-end at 
https://gerrit.openbmc-project.xyz/c/openbmc/telemetry/+/34273 . After 2 
months of review and almost 300 comments and discussions, together with 
team we've decided to propose slight change in the process to speed up 
development time.

== The past ==
Let me admit to several faults and mistakes first, so we could all know 
our lessons learned:
- patch is too big for the review, even as an initial commit. 
Unfortunately it was not our decisions, but unpleasant side effect of 
legal processes;
- we didn't expect amount of effort nor prepare properly for 
simultaneous upstreaming and developing the same code;
- because of above - we have two separate implementations to maintain, 
test and fix, which are diverging over time;
- part of discussions in upstream code aim to rework parts of 
implementation, which in some cases doesn't apply for downstream (more 
ahead) implementation, making both ours and reviewers efforts .

In short - we've screwed up, ask for community understanding and 
forgiveness, and the most importantly - we ask for help.

== The present ==
Current situation and arguments for change are the following:
- we have big chunk of code in the review with many discussions already 
resolved. It looks like the most crucial issues were resolved, leaving 
mostly coding style or micro-optimizations.
- we're working on new features (i estimate that around 50% of planned 
scope is completed). Due to limited resources we cannot afford to keep 
maintaining two versions of the code and we want to switch to 
upstream-only as soon as possible.
- upstream code is becoming more and more behind our downstream 'top', 
and the incoming task to sync them will be harder the longer we wait.

== The future ==
So.. Having said all that we would like to propose a solution which will 
not only allow to continue the usual review and improvement process, 
while enabling working on next iterations and making life easier for 
both reviewers and maintainers. Seems like a good trade, right?:) I 
would like to propose a plan of resolving that situations and seek for 
your advice and acceptance.

Plan is to do the following:
1) Merge current big-bang review as-is, opening GitHub issues for all 
existing comments to address them at convenient time.
2) Sync downstream implementation with upstream. Split changes in chain 
of reviews to separate them as much as possible.
3) Work on the chain of reviews and addressing aforementioned issues 
until in usual manner.
4) As soon as code is more stable - work on new features.

As you can see - only 1st step of the plan is diverging from usual 
Gerrit flow.

We really hope for your understanding and count on acceptance of such 
workflow. Let us know what you think.

Regards,
TelemetryService team


