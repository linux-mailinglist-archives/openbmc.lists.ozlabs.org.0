Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF85D3438
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2019 01:17:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46q6Rb5Kj2zDqMf
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2019 10:16:59 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46q6Qt2mMHzDq96;
 Fri, 11 Oct 2019 10:16:21 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Oct 2019 16:16:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,281,1566889200"; d="scan'208";a="184577880"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148])
 ([10.7.153.148])
 by orsmga007.jf.intel.com with ESMTP; 10 Oct 2019 16:16:17 -0700
Subject: Re: [PATCH] i2c: aspeed: fix master pending state handling
To: Tao Ren <taoren@fb.com>, Brendan Higgins <brendanhiggins@google.com>,
 Wolfram Sang <wsa@the-dreams.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrew Jeffery <andrew@aj.id.au>,
 Cedric Le Goater <clg@kaod.org>
References: <20191009212034.20325-1-jae.hyun.yoo@linux.intel.com>
 <3ea1c0d5-47f1-bf8c-6b2d-2ea8d3f93471@fb.com>
 <637d4b8b-5113-b07b-f99f-ce66dbe6948c@linux.intel.com>
 <5ce20a28-21ed-ff0c-9e31-bcac3cd7a5fb@fb.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <69296b93-8fc6-c056-ab9b-ae190dc5eea1@linux.intel.com>
Date: Thu, 10 Oct 2019 16:16:17 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5ce20a28-21ed-ff0c-9e31-bcac3cd7a5fb@fb.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/10/2019 4:11 PM, Tao Ren wrote:
> On 10/10/19 3:04 PM, Jae Hyun Yoo wrote:
>> On 10/10/2019 2:20 PM, Tao Ren wrote:
>>> On 10/9/19 2:20 PM, Jae Hyun Yoo wrote:
>> [...]
>>>>            /*
>>>>             * If a peer master starts a xfer immediately after it queues a
>>>> -         * master command, change its state to 'pending' then H/W will
>>>> -         * continue the queued master xfer just after completing the
>>>> -         * slave mode session.
>>>> +         * master command, clear the queued master command and change
>>>> +         * its state to 'pending'. To simplify handling of pending
>>>> +         * cases, it uses S/W solution instead of H/W command queue
>>>> +         * handling.
>>>>             */
>>>>            if (unlikely(irq_status & ASPEED_I2CD_INTR_SLAVE_MATCH)) {
>>>> +            writel(readl(bus->base + ASPEED_I2C_CMD_REG) &
>>>> +                ~ASPEED_I2CD_MASTER_CMDS_MASK,
>>>> +                   bus->base + ASPEED_I2C_CMD_REG);
>>>
>>> Sorry for the late comments (just noticed this line while testing the patch):
>>>
>>> I assume this line is aimed at stopping the running master commands, but as per
>>> AST2500 datasheet, it's NOP to write 0 to MASTER_STOP/MASTER_RX/MASTER_TX bits.
>>> Maybe all we need is writing 1 to MASTER_STOP field?
>>
>> There could be two pending cases:
>> 1. Master goes to pending before it triggers a command if a slave
>>     operation is already initiated.
>> 2. Master goes to pending after it triggered a command if a peer
>>     master immediately sends something just after the master command
>>     triggering.
>>
>> Above code is for the latter case. H/W handles the case priority based
>> so the slave event will be handled first, and then the master command
>> will be handled when the slave operation is completed. Problem is,
>> this H/W shares the same buffer for master and slave operations so
>> it's unreliable. Above code just removes the master command from the
>> command register to prevent this H/W command handling of pending events.
>> Instead, it restarts the master command using a call of aspeed_i2c_do_start when the slave operation is completed.
> 
> Thanks for the clarify, Jae. I mean clearing these bits has no effect to
> hardware according to aspeed datasheet; in other word, master command cannot
> be removed from command register by this statement.
> 
> For example, below is the description for MASTER_STOP_CMD(I2CD14, bit 5):
> 
>    0: NOP
>    1: Issue Master Stop Command
>    This register will be automatically cleared by H/W when Stop Command has
>    been issues.

It's removing before H/W fetches the the command so the pending command
isn't cleared by H/W at the timing. If we send a stop command at here, 
the bus will be messed up.

Thanks,

Jae
