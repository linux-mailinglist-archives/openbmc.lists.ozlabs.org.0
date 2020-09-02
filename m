Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33ED225B347
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 20:00:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhWtY3Db0zDr1F
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 04:00:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhWsd3KtJzDqwv
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 03:59:16 +1000 (AEST)
IronPort-SDR: UN0rW6U4IfOfsO3JwFwZYXkKmKglX0nhKL+ILvfrjLb1eStu7nM4U9Gu5l/xqinjHlsqMqs40f
 MKgBXNiahjVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="157452502"
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; d="scan'208";a="157452502"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 10:59:13 -0700
IronPort-SDR: ejgsnMMBZBki00Jiu0bJ5Mw+WX2WW6Sz4vWhbFnrT9bcYqw69zzMnD0l5Dohp8qe4jmfhgnQHS
 3MhJ+n0LLVcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; d="scan'208";a="446607635"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.212.28.117])
 ([10.212.28.117])
 by orsmga004.jf.intel.com with ESMTP; 02 Sep 2020 10:59:13 -0700
Subject: Re: Dealing with a sensor which doesn't have valid reading until host
 is powered up
To: Alex Qiu <xqiu@google.com>, Guenter Roeck <groeck@google.com>
References: <CAA_a9xLk5JhUjEkiWka6LSXJ1gD-BcH0PqgENqroisDKEUyztA@mail.gmail.com>
 <CAA_a9xJ54rpnKm0y+hrEG2YjuFzzhqKBEJbStsu4Q126APgbVg@mail.gmail.com>
 <9129e6cf-76a8-deea-7e8c-1ac17cf45b4b@linux.intel.com>
 <CAA_a9x+A+OkbdTW_M4KT=6eV982Lg_0PoWaYvW47c0Aoh676-w@mail.gmail.com>
 <9679c401-28ce-3197-f871-2cccd2940885@linux.intel.com>
 <CAA_a9xLXDPP-4SodzEnnASupm7GTtB_My+6GbPrtR9A0S23KLg@mail.gmail.com>
 <CAA_a9x+dyj+K7Zr-3nPUoOp35WjVRjHDo7L0AJ2BSp6sV9M_bA@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <e9f84dab-54c2-d254-6767-14cfc2197318@linux.intel.com>
Date: Wed, 2 Sep 2020 10:59:12 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAA_a9x+dyj+K7Zr-3nPUoOp35WjVRjHDo7L0AJ2BSp6sV9M_bA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
 Josh Lehan <krellan@google.com>, Jason Ling <jasonling@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/31/2020 3:08 PM, Alex Qiu wrote:
> Hi James,
> 
> I just came through this doc 
> (https://www.boost.org/doc/libs/1_74_0/doc/html/boost_asio/overview/posix/stream_descriptor.html). 
> Looks like that it's a terrible idea for hwmon driver to return EAGAIN 
> for dbus-sensors. With that, I think the proper fix is also to use other 
> errno instead in our driver, and this caveat should be probably 
> documented somewhere.
> 

Hi Alex,

I hit something similar with peci where timeouts was causing the scan 
loop to hang. I remembered that back when we were developing ipmbbridge 
we hit something similar with i2c, and the work around was to use the 
tcp socket instead 
https://www.boost.org/doc/libs/1_74_0/doc/html/boost_asio/reference/ip__tcp/socket.html 
as it could correctly handle the errors. This worked for me for the 
CpuSensor and is a easy to implement change that might be worth trying 
for other sensors 
https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/36181.

Thanks

James
