Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4820A25C7FD
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 19:22:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bj70G1wQGzDrBs
	for <lists+openbmc@lfdr.de>; Fri,  4 Sep 2020 03:22:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bj6yy4xvQzDrBB
 for <openbmc@lists.ozlabs.org>; Fri,  4 Sep 2020 03:20:57 +1000 (AEST)
IronPort-SDR: WyOYPKOmT17l2NJl57PBE5ZkpAQ6HX3F9U9e7Cimabz6i2YFz96IkwBx4GAEizqT2Qgow5x+Tp
 XU/Dft6DeyNA==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="175679101"
X-IronPort-AV: E=Sophos;i="5.76,387,1592895600"; d="scan'208";a="175679101"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2020 10:20:55 -0700
IronPort-SDR: Itkvo4g+QTBN5Dk0TXckW4dzR0ernvWG/nmLftD0yd6DrZSSnZJSclYz1a30vItKicGSTQcYKc
 QFAEylT2baSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,387,1592895600"; d="scan'208";a="503142515"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.209.79.113])
 ([10.209.79.113])
 by fmsmga005.fm.intel.com with ESMTP; 03 Sep 2020 10:20:53 -0700
Subject: Re: Dealing with a sensor which doesn't have valid reading until host
 is powered up
To: Alex Qiu <xqiu@google.com>
References: <CAA_a9xLk5JhUjEkiWka6LSXJ1gD-BcH0PqgENqroisDKEUyztA@mail.gmail.com>
 <CAA_a9xJ54rpnKm0y+hrEG2YjuFzzhqKBEJbStsu4Q126APgbVg@mail.gmail.com>
 <9129e6cf-76a8-deea-7e8c-1ac17cf45b4b@linux.intel.com>
 <CAA_a9x+A+OkbdTW_M4KT=6eV982Lg_0PoWaYvW47c0Aoh676-w@mail.gmail.com>
 <9679c401-28ce-3197-f871-2cccd2940885@linux.intel.com>
 <CAA_a9xLXDPP-4SodzEnnASupm7GTtB_My+6GbPrtR9A0S23KLg@mail.gmail.com>
 <CAA_a9x+dyj+K7Zr-3nPUoOp35WjVRjHDo7L0AJ2BSp6sV9M_bA@mail.gmail.com>
 <e9f84dab-54c2-d254-6767-14cfc2197318@linux.intel.com>
 <CAA_a9xJ6nAP+nkPoGL1pPEM5zwxYWYQA6TiYgx9qZMw+gBjn_g@mail.gmail.com>
 <CAA_a9xL8TYcW-c3U=C2uT5NQ=WG-A0DPgrC1E=mr11h6fPBemA@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <85bdbb93-eb7c-9a56-e80c-9f941feeb2dc@linux.intel.com>
Date: Thu, 3 Sep 2020 10:20:53 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAA_a9xL8TYcW-c3U=C2uT5NQ=WG-A0DPgrC1E=mr11h6fPBemA@mail.gmail.com>
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/2/2020 3:07 PM, Alex Qiu wrote:
> Hi James,
> 
> I just tried, now I have no reading at all... I saw you marked your pull 
> request to work in progress. I'll wait for further updates...
> 
> - Alex Qiu

Hi Alex,

Yes I ran into the same issue, I was originally using the tcp socket, 
then calling read() directly, and that 'worked' and may work for your 
use case, but mine the driver timeout still slowed down the sensor to an 
non-functional state. I pushed a patch to CPU sensor to make it fail 
faster, because in the case peci is down, you have bigger problems then 
sensors responding slow. It sounds like we aren't the first ones to hit 
this problem 
https://lists.ozlabs.org/pipermail/openbmc/2017-May/007557.html.

I'm thinking the only 'full proof' ways to fix this sort of things are:

1. Have some way to check state that you're good to read.
2. Handle reading in threads separate from d-bus.
3. Maybe avoid using the sysfs handles as they don't seem to respond 
correctly to epoll as they always respond ready to read.

-James


