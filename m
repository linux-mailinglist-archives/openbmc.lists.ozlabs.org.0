Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC136D277
	for <lists+openbmc@lfdr.de>; Thu, 18 Jul 2019 19:02:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qL6P17HYzDqPN
	for <lists+openbmc@lfdr.de>; Fri, 19 Jul 2019 03:02:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qL5m1RbkzDqNw
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jul 2019 03:02:03 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 10:01:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,278,1559545200"; d="scan'208";a="179307741"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by orsmga002.jf.intel.com with ESMTP; 18 Jul 2019 10:01:58 -0700
Subject: Re: [RFC v2 dev-5.1 4/5] i2c: aspeed: add buffer mode transfer support
To: Joel Stanley <joel@jms.id.au>
References: <20190625205109.27672-1-jae.hyun.yoo@linux.intel.com>
 <20190625205109.27672-5-jae.hyun.yoo@linux.intel.com>
 <5cc696ba-7fa7-c7cb-0ba6-81df3015e974@fb.com>
 <9c862188-8360-fa39-f21d-9c6d51e1d831@linux.intel.com>
 <CACPK8XdSeK0CPrncmxjMKBLfCwCVHE-VWhAVaia1oQMFTOf_0w@mail.gmail.com>
 <74652ba6-ef4b-9e45-7e3a-f2375e21d40f@linux.intel.com>
 <CACPK8XfvM-mYW_wvdsKRqYm0aLmQnROptPbh3VnZ4jsoNs9HyQ@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <930a4c56-68d6-8c54-0dd9-ccf298626109@linux.intel.com>
Date: Thu, 18 Jul 2019 10:01:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CACPK8XfvM-mYW_wvdsKRqYm0aLmQnROptPbh3VnZ4jsoNs9HyQ@mail.gmail.com>
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>, Cedric Le Goater <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

On 7/17/2019 10:58 PM, Joel Stanley wrote:
> Hey Jae,
> 
> On Tue, 2 Jul 2019 at 16:05, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>> Do you want we to merge this series into the openbmc tree for further testing?
>>
>> Yes please. It would be good if it gets tested on more various platforms
>> before upstreaming it.
> 
> I did this and hit some issues.
> 
> The first one is that we don't support this with the qemu model yet
> and so kernel crashes when probing i2c. This is bad, as we gate
> commits to the openbmc yocto tree on them passing a qemu boot test.

I see. Actually, it's one of reasons why I submit this series as an RFC
with CC'ing Cedric. It should be resolved before upstreaming it to linux
tree.

> Secondly, the changes you have made to the driver are incompatible
> with the old device tree. I thought I could revert the device tree
> change in order to get the old behavior, but the driver fails to
> probe. In general we strive to make kernel changes compatible with old
> versions of the device tree. I think that can be achieved here with
> some thought.

Okay. I'll change the resource getting logic using index instead of
'reg-names' then this driver could be probed even with an old device
tree.

> Cedric will try to resolve the qemu issue. If you could create a
> version of the patch that makes the driver compatible with the old
> device tree that would be appreciated.

Thanks a lot Joel and Cedric. I'll submit a new spin soon after adding
the device tree compatibility issue fix. Please update me the qemu side
resolving status.

Regards,
Jae

> Cheers,
> 
> Joel
> 
