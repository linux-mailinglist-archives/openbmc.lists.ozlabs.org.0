Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C11BFF2D
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 19:58:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tq4r5tP4zDqSt
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 03:58:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tq3y66D0zDqM5
 for <openbmc@lists.ozlabs.org>; Wed,  1 May 2019 03:57:16 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Apr 2019 10:57:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,414,1549958400"; d="scan'208";a="153642343"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by FMSMGA003.fm.intel.com with ESMTP; 30 Apr 2019 10:57:14 -0700
Subject: Re: A question about bmcweb code
To: Lei YU <mine260309@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAARXrtmfZhmxJK3m-eOmR4cz0m78EaN9xyQjqdR5=1mf+CvZzA@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <24eb40ef-4921-37e3-6bb4-6e922dd5369e@intel.com>
Date: Tue, 30 Apr 2019 10:57:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAARXrtmfZhmxJK3m-eOmR4cz0m78EaN9xyQjqdR5=1mf+CvZzA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
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

On 4/29/19 10:59 PM, Lei YU wrote:
> This email is to ask a question about the code in bmcweb.
> 
> When I started to review/read some code in bmcweb, some code concerns me.
> 
> 1. There is a static systemBus in `include/dbus_singleton.hpp`, which is
>    included by multiple header files;
>    In case this is included by multiple cpp files, there will be different
>    instances of `systemBus` in different compile units, which makes it not
>    singleton at all
> 2. There are static variables in multiple header files in `includes/`, e.g.
>    `include/obmc_console.hpp`
>    In case these are included by multiple cpp files, we got different instances,
>    and some of the variables are large and thus consume memory.
> 
> Luckily, current bmcweb only includes all the header files
> src/webserver_main.cpp, so it does not have issues mentioned above.
> 
> So my question is, is it a design to enforce all implementation in headers and
> only included by `webserver_main.cpp`?

Today bmcweb is built as a (mostly) single compile unit because of some
history, and some heavy template usage early on that was inherited from
crow.  A lot of that has been cleaned up in the last while.  As you say,
the mediocre singletons don't present a functional issue at this point,
but it's definitely something that could be improved.

My goal long term is to see things moved into appropriate separate
compile units as make sense, with the goal of decreasing the build
times, but I haven't really had time to execute on it as of late.


> If yes, I would expect some description in README or some document;
> If no, how do we avoid the issues described above?

This isn't documented because we aren't consistent about it today, so
documenting it would only really be documenting the statement on where
we want to get to.  Once it's made consistent, we will absolutely
document the rules.

Any patches you want to send in to fix some, or all of these issues
would be greatly appreciated and reviewed.

> 
> Thanks!
> 
