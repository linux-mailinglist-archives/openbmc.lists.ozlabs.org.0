Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7165433704
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2019 19:44:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Hj9G00m1zDqQx
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 03:44:18 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Hj8p6Z1XzDqQd
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2019 03:43:46 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jun 2019 10:43:42 -0700
X-ExtLoop1: 1
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga001.fm.intel.com with ESMTP; 03 Jun 2019 10:43:42 -0700
Subject: Re: pid control configuration
To: Vijay Khemka <vijaykhemka@fb.com>, Patrick Venture <venture@google.com>
References: <96A52DC2-7B18-4F69-B8E8-3B489BDA84C6@fb.com>
 <1c5566ba-696e-42eb-c193-22eaca33a1db@intel.com>
 <7D337AEA-CB20-4E39-8A9A-58E21EDA0F31@fb.com>
 <1b82951d-4293-0525-a562-000899544c2e@intel.com>
 <14F05B01-0B7D-44D1-A599-5EDD8CC3A6C8@fb.com>
 <CAO=notzQc2CX9Dx4gjX6HwnuCKnjmD_3ek+tv-XAfO+LxdQ3WA@mail.gmail.com>
 <b058940e-ae1b-d238-c9b1-885252ba2464@intel.com>
 <235B9067-D22E-439F-9009-F3D6C2A70993@fb.com>
 <945b4275-2441-8562-7efe-5bc7a9eca4f7@intel.com>
 <0AA4F6A3-830C-4F62-A8B5-7D26BF65A16C@fb.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <6b61ef37-4b8b-959a-5131-488d0560ce4c@intel.com>
Date: Mon, 3 Jun 2019 10:43:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <0AA4F6A3-830C-4F62-A8B5-7D26BF65A16C@fb.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/31/19 2:00 PM, Vijay Khemka wrote:
> 
> This config is failing with below message.
> Apr 12 23:32:39 tiogapass swampd[1310]: terminate called after throwing an instance of 'std::out_of_range'
> Apr 12 23:32:39 tiogapass swampd[1310]:   what():  _Map_base::at
> 

If I had to guess, you're missing a property that's required.

> Is there any default data which I can be used for config but has no impact in its action?

Like I said before, I don't know of anyone running phosphor-pid like you
are hoping to.  The "default" is to run in cascade loop mode, and all
the existing systems are examples of that configuration.  It's likely
time for you to break out GDB and start debugging your configuration.

Alternatively, approximating your fans as linear, and using that as the
output targets would likely get you to a working thermal solution faster
than going down the path you're going.
