Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ACE25C7EF
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 19:17:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bj6tq2MPszDr76
	for <lists+openbmc@lfdr.de>; Fri,  4 Sep 2020 03:17:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bj6sT4XlBzDrB8
 for <openbmc@lists.ozlabs.org>; Fri,  4 Sep 2020 03:16:01 +1000 (AEST)
IronPort-SDR: 7cbEwXr8KHBrEDvoH/pEVKZp7QOAB/5m7qLi6NztIO/K7ynxPJuz3MgKBVRx5Th5Repz/MOr17
 YAnKEt3AANfw==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="145361534"
X-IronPort-AV: E=Sophos;i="5.76,387,1592895600"; d="scan'208";a="145361534"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2020 10:15:58 -0700
IronPort-SDR: W9vhmbHtIP5Ik27WBkmMqA0iyq4eiGfG8+FSM8skI/3Ne2amzD2S27cu7XgBN8SsAW3yQ0HIQN
 RIucu6mlXLYQ==
X-IronPort-AV: E=Sophos;i="5.76,387,1592895600"; d="scan'208";a="375935423"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2020 10:15:58 -0700
Date: Thu, 3 Sep 2020 10:15:56 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: PECI patchset status
Message-ID: <20200903171556.GA32795@mauery.jf.intel.com>
References: <CACPK8XddFvszC1daDKTtqwkE-XDfB7uYFP_H4HZXNUxvNHUaqw@mail.gmail.com>
 <DM5PR11MB188419A3302F33CE6FE80740902C0@DM5PR11MB1884.namprd11.prod.outlook.com>
 <20200903152753.GA57949@patrickw3-mbp.lan.stwcx.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200903152753.GA57949@patrickw3-mbp.lan.stwcx.xyz>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 03-Sep-2020 10:27 AM, Patrick Williams wrote:
>On Thu, Sep 03, 2020 at 05:57:48AM +0000, Mihm, James wrote:
>> Thank you Joel for carrying this patchset, and Intel does have an interest in getting our patchsets upstreamed.
>>
>> Since Intel has a large set of patches that need to be upstreamed our plan is to fork the kernel in github/intel-bmc and apply the intel patchsets. Upstream recipes can then pull the kernel from the intel fork with the intel patches. Intel will ensure that this fork tracks the openbmc kernel version and maintain the intel patchsets while in the process of getting them upstreamed.
>
>Rather than create a separate fork of the kernel, is there something
>that could be done here to have someone from Intel work with Joel on
>preparing the patches?  When a new kernel comes out, Joel can ensure it
>works on the base AST2xxx system design and before we move all the
>systems to it, someone from Intel can rebase the non-upstreamed patches
>they are carrying?  This hopefully reduces some of the burden on Joel
>and stops us from further fragmenting the community.

Keep in mind that Intel does not plan to keep the fork around 
indefinitely. The hope is to fully upstream all of the patches that we 
have outstanding. Our intention is not to fragment the community, but to 
provide a mechanism to continue to move forward while still providing a 
way for other users to build the intel-platforms target.

As an added feature, having our full kernel source in a publicly 
available tree will allow us to upstream more features that depend on 
kernel support that is not currently available.

--Vernon
