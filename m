Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E509B26F8
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2019 23:01:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VSjn4HRgzF5Cq
	for <lists+openbmc@lfdr.de>; Sat, 14 Sep 2019 07:01:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VSj43802zF4gr
 for <openbmc@lists.ozlabs.org>; Sat, 14 Sep 2019 07:00:53 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Sep 2019 14:00:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="197680301"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by orsmga002.jf.intel.com with ESMTP; 13 Sep 2019 14:00:50 -0700
Subject: Re: Current Minimal Binary Size
To: Wilfred Smith <wilfredsmith@fb.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <B01C7B99-DEFC-4252-A402-38903C016238@fb.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <47e7e01c-de0a-58a9-69fc-4716c1b9fe53@intel.com>
Date: Fri, 13 Sep 2019 14:00:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <B01C7B99-DEFC-4252-A402-38903C016238@fb.com>
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

On 9/13/19 5:52 AM, Wilfred Smith wrote:
> These values may be of use to someone else. I’ve been putting energy into reducing code size lately. The following are all with -Os enabled.
> 
> Smallest .SO (one function with no statements in the body) - 8.2K
> Smallest executable (main with only a return statement) - 12K
> Smallest executable with a printf and return - 14K
> Smallest executable with a std::cout and return - 103K

This is exactly why this rule exists:
https://github.com/openbmc/docs/blob/master/cpp-style-and-conventions.md#iostream

Unfortunately not everyone is consistent about it (including myself).
The components that pull iostreams in should definitely be moved to
something like std::format, printf, or fmt in the future.

> 
> For comparison:
>  Smallest executable with a printf and return on x86-64 - 8.2K
>  Smallest executable with a std::cout and return on x86-64 - 42K
> 
> 

It would be interesting data to load all of the above in a real OpenBMC
rootfs, and compare the size again in this tool (or something similar)
https://github.com/openbmc/openbmc-tools/blob/master/edtanous/rootfs_size.py

Just because the file is "bigger" when compiled doesn't mean that it's
actually taking up space post-squashfs.  A lot of the code that's common
across applications code gets de-duplicated when the filesystem is built.

That's not to say it's not something that could be improved on, but it
might be a smaller issue than it seems.
