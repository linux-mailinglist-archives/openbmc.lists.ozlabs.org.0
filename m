Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C22A97C2
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 02:57:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46P2Mm29tgzDr0D
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 10:57:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46P2M22lP6zDqtv
 for <openbmc@lists.ozlabs.org>; Thu,  5 Sep 2019 10:56:29 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Sep 2019 17:56:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,468,1559545200"; d="scan'208";a="266844874"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.251.21.134])
 ([10.251.21.134])
 by orsmga001.jf.intel.com with ESMTP; 04 Sep 2019 17:56:27 -0700
Subject: Re: [PATCH dev-5.2 0/2] i2c: aspeed: Add H/W timeout support
To: Brendan Higgins <brendanhiggins@google.com>, Joel Stanley <joel@jms.id.au>
References: <20190904200758.5420-1-jae.hyun.yoo@linux.intel.com>
 <CACPK8Xfzn3A7nCFqCbSm=6qsB-5dgJOcz1rgSGhRH=xojb4m_w@mail.gmail.com>
 <CAFd5g44dg3=FiW6QHLWtdoZzgP18ghQ0Fd40SGpBK1GYAHan-A@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <637a86f5-45b2-e37e-2bed-6a65b5cda477@linux.intel.com>
Date: Wed, 4 Sep 2019 17:56:25 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFd5g44dg3=FiW6QHLWtdoZzgP18ghQ0Fd40SGpBK1GYAHan-A@mail.gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/4/2019 4:50 PM, Brendan Higgins wrote:
> On Wed, Sep 4, 2019 at 3:55 PM Joel Stanley <joel@jms.id.au> wrote:
>>
>> Hi Jae,
>>
>> On Wed, 4 Sep 2019 at 20:08, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>>
>>> In case of multi-master environment, if a peer master incorrectly handles
>>> a bus in the middle of a transaction, I2C hardware hangs in slave state
>>> and it can't escape from the slave state, so this commit adds slave
>>> inactive timeout support to recover the bus in the case.
>>>
>>> By applying this change, SDA data-low and SCL clock-low timeout feature
>>> also could be enabled which was disabled previously.
>>
>> Please consider sending your RFC patches to the upstream list. You
>> have a big backlog of patches now.
> 
> Joel, thanks for keeping track of this!
> 
> Sorry, for not keeping up with my emails, I don't think I have time to
> continue to maintain this.
> 
> However, I don't want to hand this off in a bad state. I will try to
> get up to date on all the emails in the coming weeks.
> 
> Jae, can you start sending things upstream as Joel suggested?

Sure, I'll start upstreaming after taking some tests on Cedric's QEMU
patch.

Thanks,
Jae


