Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CED6D4EB1B7
	for <lists+openbmc@lfdr.de>; Tue, 29 Mar 2022 18:20:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSZYH5B6qz2yJ9
	for <lists+openbmc@lfdr.de>; Wed, 30 Mar 2022 03:20:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fkznxugo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fkznxugo; dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSZXt539Nz2xD4
 for <openbmc@lists.ozlabs.org>; Wed, 30 Mar 2022 03:20:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648570814; x=1680106814;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=tDg5vAXmSAh0TxxebCYfVvLsG2pBqv3SM3HOJt5WEOg=;
 b=fkznxugoClr+I7FmWWiQp/zzAHFicjZ3IgsE7kLdFAgkuSYAvS/T9jhf
 X5ik8sqQpbpr+vZqyqW8DP8HImsRAX+3c+uYeBm1Yvml3gTufFHacEMq8
 N0H4X2xr5OJYIBirxFx05S045CJCb04B6NnAVS09Nv2zmKjsWdIIKxJo/
 sxPIJVOwgtW/EdynQIRULxnZM5Bz2Mi9YV97wXaij1Uet7BGTux21NkqB
 aXEBmuSngFnrhNCyk1+9s7RKCURXaCrUb0tK/aHnuhNMKDtsY0V+1cPm+
 CxzvM9BqdcYeZIInl8dbco0fdNdJkXG5vDQ/JIVOVwk1tDKg0YOmshA+5 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="241444585"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="241444585"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 09:18:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="519025058"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga002.jf.intel.com with ESMTP; 29 Mar 2022 09:18:55 -0700
Received: from [10.209.20.201] (jmbills-MOBL.amr.corp.intel.com
 [10.209.20.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 359A0580922
 for <openbmc@lists.ozlabs.org>; Tue, 29 Mar 2022 09:18:55 -0700 (PDT)
Message-ID: <fd5ff423-6392-b0a5-8e3a-27926508cc01@linux.intel.com>
Date: Tue, 29 Mar 2022 10:18:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Defining the behaviour of code formatting in openbmc-build-scripts
Content-Language: en-US
To: openbmc@lists.ozlabs.org
References: <4bc2b30d-b335-4457-9601-9c7226d6c656@www.fastmail.com>
 <CACWQX82FJw=wfpjfT9_T+bnvW85SJTca=yr7gOrSaY7Z7ShyAA@mail.gmail.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <CACWQX82FJw=wfpjfT9_T+bnvW85SJTca=yr7gOrSaY7Z7ShyAA@mail.gmail.com>
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



On 3/29/2022 9:29 AM, Ed Tanous wrote:
> On Mon, Mar 28, 2022 at 7:08 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>>
>> Hello,
>>
>> Review of https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/52406
>> sparked some discussion about what we actually want from the code-formatting
>> support in openbmc-build-scripts going forward.
>>
>> ## General statements
>>
>> Enforcing code formatting in CI is effective in that it ensures style from
>> multiple contributors is consistent with minimal maintainer intervention.
>> Sometimes the automated formatting might be questionable, but the judgement is
>> that on the whole the consistency is a better trade-off than occasional
>> enforced untidiness. There are also escape hatches to disable formatting in
>> extreme circumstances. Automated code formatting is desirable.
>>
>> clang-format is at the heart of OpenBMC's code formatting support as the bulk
>> of the OpenBMC codebase is written in C++.
>>
>> ## The problem
>>
>> "Like all Vogon ships, it looked as if it had been not so much designed, as
>> congealed." - Douglas Adams, The Salmon of Doubt
> 
> Don't panic.
> 
>>
>>
>> Code formatting support in openbmc-build-scripts has evolved over time and
>> no-one has ever written down what we actually want. The lack of concrete
>> requirements has lead to an counter-intuitive and convoluted implementation
>> that has ended in some repositories (e.g. entity-manager) not having their code
>> formatted as expected.
>>
>> There are 4 possible behaviours that openbmc-build-scripts could take against
>> an application repository:
>>
>> 1. All code formatting is disabled: No further action
> 
> Long term, is there a use case for this?  I realize it's required
> temporarily while we make all the repos consistent, but it seems like
> it should ideally be a temporary situation for portions of the
> codebase, and something that eventually we can just enforce globally
> in the project.
> 
>>
>> 2. No custom code formatting: Just do whatever the default actions are as
>>     implemented in openbmc-build-scripts
>>
>> 3. Some custom code formatting: Actions to run in addition to the default
>>     actions implemented in openbmc-build-scripts
>>
>> 4. Only custom code formatting: Actions to run in-place of the default actions
>>     implemented in openbmc-build-scripts (which must not be run)
>>
>> Currently openbmc-build-scripts only implements 1, 2 and 4, while
>> entity-manager had assumed 3 was supported.
>>
>> ## Background (AKA why don't we have support for 3?)
>>
>> Code formatting support in openbmc-build-scripts began with an implementation
>> of 1. However, along the way we introduced the phosphor-mboxd repository which
>> due to some unfortunate history has a mixed C and C++ codebase. The C code is
>> written in kernel style, while it was desired that the C++ be written in
>> OpenBMC style.
>>
>> At the time the problem arose, clang-format had two issues:
>>
>> a. It treats C and C++ as the same language, and so maintaining a code
>>     formatting split across those language boundaries requires two separate
>>     clang-format configuration files
> 
> Is the core of the issue here that we have different formatting rules
> for C than C++?  clang-format is entirely whitespace changes, so could
> we solve this simply by just reformatting all the C code to the common
> project style, and we wouldn't need this anymore?  It seems like
> regardless of C vs C++ we should be consistent.
I agree with this. I have some C code that I just let format according 
to our project style, and it makes formatting much simpler.

> 
>>
>> b. clang-format's -style=file historically required that the style file in
>>     question be called ".clang-format"
>>
>> These two constraints together required that phosphor-mboxd ship two separate
>> configuration files, and to explicitly symlink them as .clang-format before
>> invoking the clang-format command. As such it was easier to reason about code
>> formatting if the support in openbmc-build-scripts transferred the entire
>> formatting responsibility to repository-specific format-code script rather than
>> attempting to do anything of its own accord.
>>
>> Hence, we support 1, 2 and 4, but not (yet) 3.
>>
>> ## Analysis
>>
>> The current behaviour of openbmc-build-scripts is as follows, from
>> scripts/unit-test.py:
>>
>> 1. Check that code formatting was requested. If not, no further code-formatting
>>     action is taken
>>
>> 2. Check for `format-code` and `format-code.sh` in the root of the target
>>     repository and add them to the formatter list
>>
>> 3. If no custom scripts were found in 1, add the default format-code.sh
>>     implementation[1] to the formatter list 4. Execute the scripts in the
>>     formatter list
>>
>> [1] https://github.com/openbmc/openbmc-build-scripts/blob/0ea75ec9efb7ffacb88f63e38fa7823fe8b124a7/scripts/format-code.sh
>>
>> This algorithm is implemented here:
>>
>> https://github.com/openbmc/openbmc-build-scripts/blob/0ea75ec9efb7ffacb88f63e38fa7823fe8b124a7/scripts/unit-test.py#L1215-L1226
>>
>> Confusingly, inside the default format-code.sh implementation there's also an
>> invocation of the custom format-code.sh script if it exists, but the default
>> format-code.sh implementation won't be executed if the custom format-code.sh
>> file exists (due to the implementation of scripts/unit-test.py). So this code
>> is dead:
>>
>> https://github.com/openbmc/openbmc-build-scripts/blob/ac5915f07d3b796f224c85477763ca7fe893dcc2/scripts/format-code.sh#L136-L141
>>
>> The a consequence of all this is that the entity-manager codebase isn't being
>> formatted with clang-format because it ships a custom format-code script that
>> doesn't invoke it.
>>
>> ## Proposal
>>
>> I don't really have one. Does anyone have thoughts on how we differentiate
>> between cases 3 and 4? Use different file names? Invoke the script and ask it
>> what it expects?
>>
>> Interested in your thoughts.
>>
>> Andrew
