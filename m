Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E68564F0CF
	for <lists+openbmc@lfdr.de>; Sat, 22 Jun 2019 00:34:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Vtl96HznzDqg8
	for <lists+openbmc@lfdr.de>; Sat, 22 Jun 2019 08:33:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Vtkd1ZXTzDqP1
 for <openbmc@lists.ozlabs.org>; Sat, 22 Jun 2019 08:33:28 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jun 2019 15:33:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,402,1557212400"; d="scan'208";a="171371830"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148])
 ([10.7.153.148])
 by orsmga002.jf.intel.com with ESMTP; 21 Jun 2019 15:33:22 -0700
Subject: Re: [RFC PATCH dev-5.1 4/6] i2c: aspeed: fix master pending state
 handling
To: Tao Ren <taoren@fb.com>, Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 C?ric Le Goater <clg@kaod.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20190620194922.15093-1-jae.hyun.yoo@linux.intel.com>
 <20190620194922.15093-5-jae.hyun.yoo@linux.intel.com>
 <4ef34869-3425-1258-2ab6-eecfee063aef@fb.com>
 <5afd2271-e5f4-1358-a1b3-da00a9fc8fb1@linux.intel.com>
 <1086141d-8c9b-36bf-66b4-c9404c40196d@fb.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <150ed063-59d4-9964-6837-f91537d4d625@linux.intel.com>
Date: Fri, 21 Jun 2019 15:33:22 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1086141d-8c9b-36bf-66b4-c9404c40196d@fb.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/21/2019 3:11 PM, Tao Ren wrote:
> On 6/20/19 1:34 PM, Jae Hyun Yoo wrote:
>> On 6/20/2019 1:30 PM, Tao Ren wrote:
>>> On 6/20/19 12:49 PM, Jae Hyun Yoo wrote:
>>>> In case of a master pending state, it should not trigger the master
>>>> command because this H/W is sharing the same data buffer for slave
>>>> and master operation, so this commit fixes the issue with making
>>>> the master command triggering happens when the state goes to active
>>>> state.
>>>>
>>>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>>
>>> Thank you Jae for the patch. I believe I hit the bug while debugging BMC-BIC multi-master communication on my Minipack ast2500 BMC platform. Let me apply the patch and run some testing, will try to share my results by this Friday (Pacific Time).
>>
>> Thank you Tao for your help for testing it. It would be really helpful
>> to complete this patch implementation. Will wait the test results.
>>
>> Regards,
>> Jae
> 
> Hi Jae,
> 
> Although my problem is not fixed by this patch, nothing gets worse :) And patch itself looks reasonable to me.

Hi Tao,

Thanks for your review.

> 
> The problem I'm facing is: i2c-0 (multi-master) stays in "SLAVE_ACTIVE" state: slave_state is brought back to SLAVE_START again and again due to SLAVE_MATCH interrupt. I didn't get chance to check master state machine, but I'd assume it's always pending which explains why userspace applications get "connection timed out" error for i2c master transfers.

I haven't seen this issue in my machine. Probably it needs to enable
'slave timeout' feature which AST2500 provides.

Thanks,
Jae

> 
> Cheers,
> 
> Tao
> 
