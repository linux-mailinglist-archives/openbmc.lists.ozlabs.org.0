Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D829221304D
	for <lists+openbmc@lfdr.de>; Fri,  3 Jul 2020 02:00:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yZq20MjMzDr9N
	for <lists+openbmc@lfdr.de>; Fri,  3 Jul 2020 10:00:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yZp81NznzDr80
 for <openbmc@lists.ozlabs.org>; Fri,  3 Jul 2020 09:59:43 +1000 (AEST)
IronPort-SDR: zSGrVaqn1yLAZB1nD8+NPJ9K+1v18VIIN2xDa1IEaAt20P+qtMC3ofTC1Brfxi9WWgJzyqqTIJ
 yBPra7SOM5gQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="147064888"
X-IronPort-AV: E=Sophos;i="5.75,306,1589266800"; d="scan'208";a="147064888"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 16:59:40 -0700
IronPort-SDR: kJJ8Jkt7Fb/awnHPN8RqzrHbN71/A2PS9KEfObQB/RMcYwwFTEcaoCX5GOqfd/+1u/b7SGdz0v
 oE3eIT9rYQzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,306,1589266800"; d="scan'208";a="426118385"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga004.jf.intel.com with ESMTP; 02 Jul 2020 16:59:40 -0700
Received: from [10.209.134.10] (jmbills-mobl.amr.corp.intel.com
 [10.209.134.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 1522258077A
 for <openbmc@lists.ozlabs.org>; Thu,  2 Jul 2020 16:59:40 -0700 (PDT)
Subject: Re: Weird build dependency issue causing missing symbols
To: openbmc@lists.ozlabs.org
References: <c99c6e23-a2b4-01de-7cb9-ab035dcf8e01@linux.intel.com>
 <20200702213328.GD3922@heinlein>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <ac51ef67-40de-933e-a5a9-50d7506e073f@linux.intel.com>
Date: Thu, 2 Jul 2020 16:59:39 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200702213328.GD3922@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
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



On 7/2/2020 2:33 PM, Patrick Williams wrote:
> On Thu, Jul 02, 2020 at 12:58:43PM -0700, Bills, Jason M wrote:
>> We have narrowed this down to being caused by two separate issues:
>> 1. When phosphor-dbus-interfaces is rebuilt it will sometimes change the
>> order of the PropertiesVariant in server.hpp.
> 
> This sounds like a bug in sdbus++.  We should be sorting the variant
> parameters or issuing them in array order.  I'll look into it.
> 
>> 2. When the order of PropertiesVariant changes on a rebuild, the recipes
>> that already have an old copy of server.hpp are not triggered to rebuild
>> and are left with the old copy of server.hpp.
> 
> This isn't surprising if what is triggering the rebuild is not a Yocto
> variable change (or git revision).  Yocto doesn't cache the contents of
> the packages, but caches the variables that went into a build step.  A
> hash of the variables are used to look up the potential 'sstate-cache'
> files so that it can skip build steps.
> 
> If you think a variable or a git-revision should have changed with what
> you were doing, then maybe it is something else.
> 
It seems like a header file change should trigger a rebuild, though?  If 
I manually edited something like a library header file, I'd expect 
everything that includes that library to be rebuilt with the new header 
change.

I tried to devtool modify boost to check the behavior, but that causes 
boost to rebuild every time and correctly triggers the dependent builds. 
  Maybe the case above of modifying a header file is invalid?
