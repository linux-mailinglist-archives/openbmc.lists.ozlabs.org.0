Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E544035FE50
	for <lists+openbmc@lfdr.de>; Thu, 15 Apr 2021 01:14:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLJGK65cpz3bVF
	for <lists+openbmc@lfdr.de>; Thu, 15 Apr 2021 09:14:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Thu, 15 Apr 2021 09:14:39 AEST
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLJG7607gz309h
 for <openbmc@lists.ozlabs.org>; Thu, 15 Apr 2021 09:14:39 +1000 (AEST)
IronPort-SDR: wFuoNkbdu1s21hGHUURJfp4lzpDGfj2wP1/k+1CjWjCeGI3op+bg/TnykEe/OVkZ4rDaA/EHW6
 4OAkPKtJD10g==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="280069598"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="280069598"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 16:13:29 -0700
IronPort-SDR: FGfFIMl6wrulixWsaa1MxlPhjsKOVUzlWM3QJ+GevLSfLsPT3ITqvDmdH5XR39TDtCjII/2TDd
 V17S70B8bKRQ==
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="452670843"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 16:13:17 -0700
Date: Wed, 14 Apr 2021 16:13:13 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: Re: Time for C++20.
Message-ID: <20210414231056.GA22459@mauery.jf.intel.com>
References: <YHdMjAsKKA+BKW8X@heinlein>
 <69ba3eb8-fab3-c0a3-2530-67ebe0de4526@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <69ba3eb8-fab3-c0a3-2530-67ebe0de4526@linux.intel.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 14-Apr-2021 02:12 PM, Bills, Jason M wrote:
>
>
>On 4/14/2021 1:11 PM, Patrick Williams wrote:
>>Hello.
>>
>>Per [1], as a project we've generally committed to using the latest C++
>>standard.  C++20 was released in early Sept. 2020 and already had pretty
>>decent compiler support at the time it was released.  We're currently
>>using GCC10 and according to [2] it has support for nearly every C++20
>>feature I could see us regularly wanting to use(*).  It seems like it
>>is a reasonable time for us to move on to it.
>>
>>* - Except I recall seeing some mention of std::source_location being
>>     useful to fix some of the issues with phosphor-logging, but that
>>     won't be available until GCC11.

I am excited for this... always having the logging header file's 
location reported is less than useful.

>>In general the C++ standard is backwards compatible.  This shouldn't
>>have any impact if you are writing C++17-only code.  What it allows us
>>to do is to start using features out of C++20 like the spaceship
>>operator and ranges.
>>
>>I've put up some commits to start this process.  So far the only hiccup
>>I've ran into is that you need Meson 0.57.0 or higher in order for it to
>>recognize the 'cpp_std=c++20' option.  I am adding code to our unit-test
>>framework to ensure you have this specified in your `meson.build` if you
>>are requesting C++20.
>>
>>     - https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-build-scripts/+/42252
>>         * Adds some checking to ensure you've specified a meson_version
>>           in your meson.build that can handle C++20.
>>
>>     - https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/42255
>>         * Update C++ style doc from C++17 to C++20.
>>
>>     - https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/42256
>>         * Update sdbusplus to use C++20.
>>
>>Please let me know if you have any concerns with this upgrade; I'll be
>>surprised if this not a fairly low-contention move.
>+1
>
>I just discovered starts_with() will be available for std::string 
>which I want to use.  I turned it on locally and didn't have any 
>issues.
>
>coroutines are also an interesting possibility for some of our async calls.

The c++ coroutines are implemented differently than the boost::asio 
stuff that ipmid is currently using. It will require some rewriting. But 
I would prefer to move on to the standard than using an older 
implementation from boost.

--Vernon
