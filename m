Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A574B044D
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2019 20:56:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TB2f1j8FzF3qS
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 04:56:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TB244NFDzF3pj
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 04:56:11 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Sep 2019 11:56:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="196982092"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148])
 ([10.7.153.148])
 by orsmga002.jf.intel.com with ESMTP; 11 Sep 2019 11:56:09 -0700
Subject: Re: [PATCH dev-5.2 0/2] i2c: aspeed: Add H/W timeout support
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Cedric Le Goater <clg@kaod.org>, Eddie James <eajames@linux.ibm.com>
References: <20190904200758.5420-1-jae.hyun.yoo@linux.intel.com>
 <CACPK8Xfzn3A7nCFqCbSm=6qsB-5dgJOcz1rgSGhRH=xojb4m_w@mail.gmail.com>
 <ca423521-05a5-1fcd-27f1-bb5f68fa3c23@linux.intel.com>
 <e37f18a6-18f0-4768-96c7-fb4ad05fe03f@www.fastmail.com>
 <d2ceccb7-2b1c-d944-76f2-ea284f4197f5@linux.intel.com>
 <d602a97b-4555-43cc-b801-c87f3c2899b6@www.fastmail.com>
 <35ff4cb2-0cc7-ba53-da71-980cc11a09de@linux.intel.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <c8058df6-559d-7b78-f843-2e319219caaa@linux.intel.com>
Date: Wed, 11 Sep 2019 11:56:09 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <35ff4cb2-0cc7-ba53-da71-980cc11a09de@linux.intel.com>
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
Cc: Brendan Higgins <brendanhiggins@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Tao Ren <taoren@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

On 9/4/2019 5:54 PM, Jae Hyun Yoo wrote:
> On 9/4/2019 5:10 PM, Andrew Jeffery wrote:
>>
>>
>> On Thu, 5 Sep 2019, at 09:10, Jae Hyun Yoo wrote:
>>> Hi Andrew,
>>>
>>> On 9/4/2019 4:12 PM, Andrew Jeffery wrote:
>>>> On Thu, 5 Sep 2019, at 08:31, Jae Hyun Yoo wrote:
>>>>> Hi Joel,
>>>>>
>>>>> On 9/4/2019 3:54 PM, Joel Stanley wrote:
>>>>>> Hi Jae,
>>>>>>
>>>>>> On Wed, 4 Sep 2019 at 20:08, Jae Hyun Yoo 
>>>>>> <jae.hyun.yoo@linux.intel.com> wrote:
>>>>>>>
>>>>>>> In case of multi-master environment, if a peer master incorrectly 
>>>>>>> handles
>>>>>>> a bus in the middle of a transaction, I2C hardware hangs in slave 
>>>>>>> state
>>>>>>> and it can't escape from the slave state, so this commit adds slave
>>>>>>> inactive timeout support to recover the bus in the case.
>>>>>>>
>>>>>>> By applying this change, SDA data-low and SCL clock-low timeout 
>>>>>>> feature
>>>>>>> also could be enabled which was disabled previously.
>>>>>>
>>>>>> Please consider sending your RFC patches to the upstream list. You
>>>>>> have a big backlog of patches now.
>>>>>
>>>>> Thanks for the reminding. I can't send the RFC patches yet because 
>>>>> QEMU
>>>>> H/W model isn't ready yet. I'm still waiting for the fix from Cedric.
>>>>
>>>> QEMU shouldn't be preventing you from sending patches upstream, rather
>>>> it prevents us from enabling the buffer mode support in the OpenBMC
>>>> kernel tree. You should be sending all patches upstream as early as 
>>>> possible.
>>>
>>> I met a QEMU issue when I was upstreaming a patch set last year:
>>> https://lists.ozlabs.org/pipermail/linux-aspeed/2018-September/000750.html 
>>>
>>>
>>> If OpenBMC community accepts the QEMU issue, I can submit the RFC
>>> patches to upstream. Will submit the patch set soon to linux tree.
>>
>> Ah, didn't realise it was Guenter that ran into it. We have some 
>> changes[1] in
>> Cedric's aspeed-4.2 qemu tree - do you mind testing it out? If those 
>> patches
>> resolve the issue Maybe we could point Guenter at that tree, though 
>> really we
>> should get the fixes upstream so this isn't an issue.
>>
>> [1] 
>> https://github.com/legoater/qemu/compare/59dda66ab756e52e6a9c1ef89660d30b3769f63c...aspeed-4.2 
>>
>>
> 
> Okay. I'll give it a try.

I've tested I2C buffer mode support in QEMU using:
git://github.com/legoater/qemu.git
SRCBRANCH = "aspeed-4.2"
SRCREV = "1b31d645c448858eb7d11d463a4cb77df0ee7923"

Checked that I2C buffer mode works on the latest QEMU H/W model.
Thanks Cedric, Eddie for the H/W model implementation.

I'll submit all I2C backlog patches into linux upstream.

Cheers,
Jae
