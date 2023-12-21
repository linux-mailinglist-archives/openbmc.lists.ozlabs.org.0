Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6BD81B432
	for <lists+openbmc@lfdr.de>; Thu, 21 Dec 2023 11:47:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tu/ghz5G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwnFW1rmsz3dRQ
	for <lists+openbmc@lfdr.de>; Thu, 21 Dec 2023 21:47:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tu/ghz5G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.151; helo=mgamail.intel.com; envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Swn8624jrz3vjP
	for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2023 21:43:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703155382; x=1734691382;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JgQqUbGdAtN88usDSap4zsL/ISrWbnsX7wACyNl07Yk=;
  b=Tu/ghz5G1paz3bJZWWZI6WDeP4sKD78rBvaCP2LRr8cUeQCrphKtE/tK
   TP/PVmDlPF6eo+1cujkx/pfFNqKjqj7Ie7fKi/K2nrNyXtlS4qWH/z8H+
   G37gLUi3+OV/0YwP341iz5BeCOe3nkXMFLmn0r8/3d6kodp0Sj9gKEL8q
   Js/K5ESJ4ckSRwMIssKWtbPHG5P5IvBu/KQj69StymQ++cCFzym07II4r
   +M7XOJFnyykkKDVP+yS4fu98BQXETFNkDSCZfeYB7DsoZ/hNH7wUj1UP7
   VdnyNcxYFz/xJIi6NF4sJYGWkMsZku8gwSjAb0toCnzAk98K4tjg3Ph12
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="376105773"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="376105773"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 02:42:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="920289947"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="920289947"
Received: from aambroze-mobl4.ger.corp.intel.com (HELO [10.213.28.79]) ([10.213.28.79])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 02:42:55 -0800
Message-ID: <74ad915f-02b3-4c69-ab27-472bb9332388@linux.intel.com>
Date: Thu, 21 Dec 2023 11:42:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: openbmc/telemetry: First complaint of unresponsiveness
Content-Language: pl, en-US
To: Patrick Williams <patrick@stwcx.xyz>
References: <47c53da80f585dac8e1450b20c5855ede960d243.camel@codeconstruct.com.au>
 <5296a763-9a24-4828-a648-2de5d78cad76@linux.intel.com>
 <ZYMGqtn9XVgjkBj8@heinlein.vulture-banana.ts.net>
 <fcd703f2-b05b-4c21-9d66-6506b7aafa01@linux.intel.com>
 <ZYMc0jRDhpuaP_KR@heinlein.vulture-banana.ts.net>
From: "Ambrozewicz, Adrian" <adrian.ambrozewicz@linux.intel.com>
In-Reply-To: <ZYMc0jRDhpuaP_KR@heinlein.vulture-banana.ts.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: cezary.zwolak@intel.com, openbmc@lists.ozlabs.org, liuxiwei@ieisystem.com, jozef.wludzik@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 20.12.2023 17:56, Patrick Williams wrote:
> On Wed, Dec 20, 2023 at 05:03:21PM +0100, Ambrozewicz, Adrian wrote:
>> What I mean are functional tests on target, with real BMC, board, and
>> sensors.
> 
> openbmc/telemetry doesn't interact with any of these things directly.
> sensors are covered by dbus-sensors, etc.
> 
> What you are describing is an integration test that belongs in
> openbmc-test-automation with all the other integration / functional
> tests.
> 
> If you want to make sure that openbmc/telemetry reacts to the dbus model
> correctly (which is the only thing that belongs in a repository-level
> test) you should mock that out as a unit test.

Agreed and this is done in unit tests.

>> Could you point me to examples where it's documented or done in
>> automated CI for other subprojects?
> 
> See openbmc-test-automation test cases that currently run on QEMU as part of
> Romulus and you can talk to Andrew about the hardware tests that run on
> Witherspoon (which are non-blocking but he keeps on top of the
> failure reports).
> 

Thanks.

>> Or perhaps do you meen that maintainer stalling the change until he
>> makes sure it doesn't break various configurations is unacceptable? Then
>> IMHO I won't aggree, as code compiled within unit tests is just one
>> arch, yet alone separated from rest of the system.
> 
> There are many problems with your position from an open source
> perspective.  These are the ones that are top of mind to me:
> 
> 1. You have no idea if the breakage is due to the submitters proposed
>     change or because of a change in another repository.

Nobody said that tests results are going to be a blind go/no go. That's 
not the case.

> 2. You've made up your own test framework that nobody else has
>     visibility to.  That means you're effectively treating
>     openbmc/telemetry as your own sandbox and are not collaborating with
>     the rest of the project.

That's a bit harsh statement, considering years of development put into 
the code itself and contributions made by team in other related areas 
(sensors, entity-manager, sdbusplus etc.).

> 3. Your delay in integrating changes can have velocity impacts to the
>     rest of the project when we _require_ repository-level changes in
>     order to integrate a Yocto update, etc.

Like Andrew stated - this is an really nasty edge case, a total f-up on 
our side. I believe delay caused by our plain oversight is than how we 
assess changes before merging. I could be running my own instance of 
static analysis tool paid from my pocket for all I care. Does it mean 
it's wrong? We also strive to shorten the timelines but quality comes first.

> 4. Your position is that you will reject someone's commit because it
>     breaks your internal test.  They have no visibility to this test,
>     they have no way to know that they are "breaking you", and they have
>     no possible course of action to recover from any issue you report.

This is similar to #1 and I don't agree - I've never stated that. You're 
talking to a guy who often debugs _and_ fixes external bug himself while 
root-causing. We're on the same side!

> If you want to have your own tests to test integration of
> openbmc/telemetry (along with other open source components) with your own
> project you are more than welcome to do that (even though I think it would be
> far more beneficial to enhance openbmc-test-automation).  That should
> probably be happening when you import openbmc/openbmc into your own
> internal tree, but if you want to give yourself early signal to these
> failures, that is okay.
> 
> My gripe is that you should not be holding up the open-source project for
> your own unpublished, undocumented, non-aligned tests.

I see your point and understand your concerns. Thanks for pointing out 
clearly your arguments.

I would prefer to not dwell into further discussion here as certain 
topics are far beyond my control. I'll just assure you we're trying to 
do the best we can with resources available. Whenever similar related 
issues or decisions to make arise in the future I will be surely better 
equipped to make informed decisions aligned with general open source 
consensus.

Regards,
Adrian

>> W dniu 20.12.2023 o 16:22, Patrick Williams pisze:
>>> On Wed, Dec 20, 2023 at 03:18:38PM +0100, Ambrozewicz, Adrian wrote:
>>>>
>>>> Currently we've integrated proposed changes and wait for feedback from
>>>> automated regression test suite.
>>>
>>> Hi Adrian,
>>>
>>> What did you mean by this?  Commits go through CI when they are
>>> submitted.  I don't see any change in Gerrit for any of the 3 commits.
>>>
>>> If you have an internal test suite you haven't contributed upstream and you
>>> are holding off merging commits until you run them through a private test suite,
>>> this is unacceptable for the open source project.
>>>
> 
