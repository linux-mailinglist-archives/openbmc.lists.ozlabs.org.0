Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E554BE635
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 22:12:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dq4663kpzDqlW
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 06:12:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dq3L5YgSzDqYV
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 06:12:06 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Sep 2019 13:12:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,549,1559545200"; d="scan'208";a="201362880"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by orsmga002.jf.intel.com with ESMTP; 25 Sep 2019 13:12:03 -0700
Subject: Re: [External] Re: Question for upstream
To: Payne Yang <pyang4@lenovo.com>
References: <6bb44c8941db46efb2e7e2a0da39d2db@lenovo.com>
 <4053AD86-2951-40CD-93D2-FEB381B7B14A@intel.com>
 <4f41e599eba54f1cb2a85defacd42578@lenovo.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <7be7c4d5-518a-4d0d-518f-3570bda42520@intel.com>
Date: Wed, 25 Sep 2019 13:12:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4f41e599eba54f1cb2a85defacd42578@lenovo.com>
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

On 9/24/19 10:00 PM, Payne Yang wrote:
> By the way, I have to include a specific fpga library in this implementation.
> Should I update it also ?

Based on the initial premise, I was assuming this was just yet another
hwmon temperature sensor in dbus-sensors.  This is sounding more and
more complex, and the answer to your questions is going to depend on
what's there, what the licenses are, what the sizes are, how much extra
stuff we're pulling in with this library, and whether or not it's able
to be disabled by the people that won't be using it.

I think a lot of your questions would be answered by filling out a
design template and submitting it to the docs repo.  I would expect the
"impacts" section would include some statement like "requires library X
from vendor Y with license Z" and in that review, we'd be able to
evaluate whether or not we want to support that, and what the model
would be.

One thing to remember: everything in dbus sensors is intended to be
configurable at runtime, so please try to avoid hardcoding
addresses/buses in your application, and follow the pattern of some of
the other sensors that are there.

-Ed
