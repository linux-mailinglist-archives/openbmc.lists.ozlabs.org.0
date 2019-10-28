Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5871E7839
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 19:17:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4722xS5SLHzDrcZ
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 05:17:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4722sf3yszzDrdn
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 05:13:55 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 11:13:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,240,1569308400"; d="scan'208";a="374302805"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga005.jf.intel.com with ESMTP; 28 Oct 2019 11:13:51 -0700
Subject: Re: Could someone help to review bmcweb code?
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <CALzeG+989c4bQ-JQRjCV2g_zTKgDHpByJ_G-PsasZMqsg+__Lg@mail.gmail.com>
 <a7c7c24e-4711-4890-7c1f-ea57c3a3eebc@linux.intel.com>
 <3600C284-3968-4278-84EC-C7DF39D5BC88@fuzziesquirrel.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <e514cc74-ecf5-7137-cf60-3a44ce7ed298@linux.intel.com>
Date: Mon, 28 Oct 2019 11:13:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <3600C284-3968-4278-84EC-C7DF39D5BC88@fuzziesquirrel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, apparao.puli@linux.intel.com,
 Carol Wang <karo33bug@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/28/19 10:47 AM, Brad Bishop wrote:
> 
>> On Oct 28, 2019, at 1:08 PM, James Feist <james.feist@linux.intel.com> wrote:
>>
>> On 10/28/19 5:51 AM, Carol Wang wrote:
>>> Hi,
>>> I wanna know who can help to review bmcweb code? I'm not sure if the list of maintainers I added
>>> is changed or not. This is the link of my coding about setting PowerCap. ---->
>>> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/26223
>>
>> It looks like this patch has been -1ed for over a week,
> 
> Actually it got the -1 just last Wednesday.  Prior to that it had a +1 without any -1s for 6 days.

It was WIP on the 17th, and +1ed on the 23rd? The same day it was -1ed. 
But we're splitting hairs. Regardless it's been -1ed for quite a few 
days, and it would make the process better if at least the things that 
both Appu and Carol agreed with were fixed. However a direct email to 
Appu would be good to get him to reply to comments.

> 
>> generally the maintainers will not look at a patch that has been -1ed.
> 
> I don’t agree with this and I’d suggest you don’t make this your general policy.  If you do this, then you are going to miss reviewers giving people bad advice, which the reviewers will then implement at great waste of time.  I see kernel maintainers correcting bad advice from reviewers all the time.

Sure, but anyone should be able to say that the advice is bad. And if 
the back and forth isn't working, then I agree that it can be escalated. 
I'm not saying it is a general rule, but most repos won't look at code 
if it is -1ed, and some wont look unless it is +1ed. I know I've been 
told many times that my code can't be merged unless someone on my team 
+1s it.


> 
>> I would work with the community to come to resolution and get some +1s.
> 
> Carol responded to the feedback (with questions, that remain unanswered) the same day it was given, 5 days ago.  I’d say "working with the community" is exactly what Carol is trying to do here.
>
