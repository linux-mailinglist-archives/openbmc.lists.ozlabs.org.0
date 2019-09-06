Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 055B9ABD95
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2019 18:21:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Q2qX5l48zDr8g
	for <lists+openbmc@lfdr.de>; Sat,  7 Sep 2019 02:21:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Q2pf0f0DzDqMG
 for <openbmc@lists.ozlabs.org>; Sat,  7 Sep 2019 02:20:24 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Sep 2019 09:20:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,473,1559545200"; d="scan'208";a="334936314"
Received: from unknown (HELO [10.7.153.148]) ([10.7.153.148])
 by orsmga004.jf.intel.com with ESMTP; 06 Sep 2019 09:20:21 -0700
Subject: Re: [PATCH dev-5.2 2/2] i2c: aspeed: add slave inactive timeout
 support
To: Tao Ren <taoren@fb.com>, Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Ryan Chen <ryan_chen@aspeedtech.com>
References: <20190904200758.5420-1-jae.hyun.yoo@linux.intel.com>
 <20190904200758.5420-3-jae.hyun.yoo@linux.intel.com>
 <f0f1a11c-4e0a-0ac0-b1dd-d05931bf5b4e@fb.com>
 <438748a7-2952-d4b9-ea60-9090bf9e9aaa@linux.intel.com>
 <073a63d8-bea6-4c91-a6a8-0486abeb6027@fb.com>
 <7ea704e7-22d4-047b-7b1c-65ccc9b61817@linux.intel.com>
 <0acba616-1c3c-53fc-cbc1-2bc19e48b4dc@fb.com>
 <f6f5d927-7c04-fe6b-dd5a-b930c77153e8@fb.com>
 <5b97e83a-4bac-8a44-05f3-298951afdd36@fb.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <e5c73545-dd59-bc33-5bf7-d29996b6e46f@linux.intel.com>
Date: Fri, 6 Sep 2019 09:20:21 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5b97e83a-4bac-8a44-05f3-298951afdd36@fb.com>
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

Hi Tao,

On 9/5/2019 7:35 PM, Tao Ren wrote:
> Hi Jae,
> 
> On 9/5/19 6:56 PM, Tao Ren wrote:
>> On 9/5/19 6:16 PM, Tao Ren wrote:
>>> Hi Jae,
>>>
>>> On 9/5/19 4:35 PM, Jae Hyun Yoo wrote:
>>>> On 9/5/2019 4:19 PM, Tao Ren wrote:
>>>>> On 9/5/19 3:48 PM, Jae Hyun Yoo wrote:
>>>>>> Hi Tao,
>>>>>>
>>>>>> On 9/5/2019 3:28 PM, Tao Ren wrote:
>>>>>>> Hi Jae,
>>>>>>>
>>>>>>> On 9/4/19 1:07 PM, Jae Hyun Yoo wrote:
>>>>>>>> In case of multi-master environment, if a peer master incorrectly handles
>>>>>>>> a bus in the middle of a transaction, I2C hardware hangs in slave state
>>>>>>>> and it can't escape from the slave state, so this commit adds slave
>>>>>>>> inactive timeout support to recover the bus in the case.
>>>>>>>>
>>>>>>>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>>>>>>
>>>>>>> I have a generic question on the patch: is it good enough to just enable slave_inactive_timeout and acknowledge the interrupt when it happens? Or do we need to reset the i2c controller to bring it out of slave state?
>>>>>>>
>>>>>>> I'm asking this because I hit an issue on my Minipack BMC where the slave_inactive_timeout interrupt was generated once every ~0.1 seconds (I set aspeed,hw-timeout-ms to 1000), and a few seconds later my BMC was rebooted (I guess watchdog timed out). Given the issue happened only once, I don't have chance to collect more information (such as why the repetitive interrupt was generated, why BMC rebooted, and etc.). Will share more if I met the problem again.
>>>>>>
>>>>>> Basic concept of this implementation is setting the slave state of
>>>>>> driver to ASPEED_I2C_SLAVE_INACTIVE to avoid calling of
>>>>>> aspeed_i2c_reset() directly from interrupt context. Instead, when a
>>>>>> master xfer happens after that, it will try bus recovery
>>>>>> through aspeed_i2c_recover_bus() and it will call aspeed_i2c_reset()
>>>>>> if needed.
>>>>>>
>>>>>> If this patch doesn't work in your case, test it again after adding
>>>>>> one line code into this driver. See below.
>>>>>
>>>>> If bus_reset is really needed in this case, then I'd prefer to do it immediately or in a threaded_irq_handler if it's bad idea to call aspeed_i2c_reset() in hardware interrupt context. The reasons being:
>>>>>
>>>>> 1) we don't know when userspace starts next master transfer.
>>>>> 2) aspeed_i2c_recover_bus() is not triggered in aspeed_i2c_master_xfer() in my environment because bus is "idle" (I2CD14[16] == 0).
>>>>>
>>>>
>>>> Oh, so to support the case as well, probably we need to add a flag for
>>>> indicating recovery needs when a master xfer comes then it could
>>>> forcibly recover and reset the bus even if the bus is idle. Can you
>>>> please test that with making code changes? Unfortunately, I can't
>>>> reproduce the case in my system.
>>>
>>> Not sure if I understand it correctly, but given we already reset the bus in interrupt handler, the extra flag should not be needed?
>>
>> One of my colleagues reminded me to enable bus auto release (I2CD00[17]) which could avoid explicit bus reset in interrupt handler.
>>
>> Let me try and will update back soon.
> 
> Let me summarize my testing result on Minipack BMC:
> 
> BMC i2c controller cannot exit slave state by enabling slave_inactive_timeout interrupt only: in this case, i2c controller stays in SRXD state and slave_inactive_timeout interrupt will be generated again and again until bus is explicitly reset.
> 
> I've tried below 2 approaches and both works on my platform:
>    - calling aspeed_i2c_reset() in interrupt handler when slave_inacive_timeout interrupt is delivered.
>    - enabling bus auto release feature (I2CD00[17]) in probe function.

Thanks a lot for your testing result and suggestions. It seems that the
latter way - enabling bus auto release would be better for this
implementation.

I'll submit a next spin today.

Cheers,
Jae

