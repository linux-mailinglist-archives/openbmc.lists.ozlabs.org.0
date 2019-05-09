Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A94FE18DDD
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 18:19:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450JSb1qj8zDqRd
	for <lists+openbmc@lfdr.de>; Fri, 10 May 2019 02:19:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450JRm06v9zDqBj
 for <openbmc@lists.ozlabs.org>; Fri, 10 May 2019 02:18:26 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 May 2019 09:18:23 -0700
X-ExtLoop1: 1
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by orsmga006.jf.intel.com with ESMTP; 09 May 2019 09:18:23 -0700
Subject: Re: Intel kernel patches (was Re: Is there Intel node management
 support?)
To: Joel Stanley <joel@jms.id.au>, James Feist <james.feist@linux.intel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAO9PYRL4Pr2hV=Hz5dvTJzhx-x9WPJL12qZEKuh+DiCWx2RMww@mail.gmail.com>
 <CAHkHK0_FCE=QHF6tdD3DyGNcOMZHkhrkAZmgPwQ0Lr-G0-e9Qg@mail.gmail.com>
 <CACPK8XftUZPWf_1hVaFu-iw7Hd1CT6oBcUHsAWcX1NVYRyLzQg@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <66754d8b-7954-c0ad-b60a-f7b10c653603@intel.com>
Date: Thu, 9 May 2019 09:18:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CACPK8XftUZPWf_1hVaFu-iw7Hd1CT6oBcUHsAWcX1NVYRyLzQg@mail.gmail.com>
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

On 5/8/19 2:01 AM, Joel Stanley wrote:
> On Wed, 8 May 2019 at 03:44, qianlihu <wangzhiqiang8906@gmail.com> wrote:
>>
>> On Wed, May 8, 2019 at 11:22 AM Deng Tyler <tyler.sabdon@gmail.com> wrote:
>>>
>>> Hi all:
>>>     Is there any package support Intel node management in current openbmc or plan to support it?
>> According to my understanding, you can refer to these repos:
>> [ipmbbridge] (https://github.com/openbmc/ipmbbridge)
>> [node-manager] (https://github.com/Intel-BMC/node-manager)

The above package is our attempt to support Node Manager on OpenBMC.  As
has already been pointed out, it hasn't been submitted to OpenBMC
upstream, and as such, should be treated as a prototype of the features
we want to make available at some point in the future.

With that said, they're all available for use today.

>>
>> Also need the ipmi related patch here
>>
>> https://github.com/Intel-BMC/openbmc/tree/intel/meta-openbmc-mods/meta-wolfpass/recipes-kernel/linux/linux-aspeed
> 
You were close, you actually need this patch:
https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-common/recipes-kernel/linux/linux-aspeed/0019-Add-I2C-IPMB-support.patch


> Is there a reason the Intel team has not submitted these patches for
> inclusion in the kernel tree?  
In the case of the above patch, it was submitted about a year ago, but
it looks like it didn't receive many reviews.
https://lkml.org/lkml/2018/4/23/835

The intent is to get it upstreamed, but the original author has moved to
a different team, so getting someone else working on it has been slowed
a bit.  It was my intent long term to pick up this patch and get it
submitted again as part of the libmctp work.

In the case of some of the other patches, some of them have been
submitted to upstream, some are taken from other non-master upstream
patches, and some can't be upstreamed given their nature.  Can we do a
better job filtering and upstreaming? Absolutely.  I do want to see us
improve here.

> 
> I encourage you to send them to the list for review and merging.
> 
> Cheers,
> 
> Joel
> 
