Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4B25D3DE
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 18:06:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dTct60ZSzDqYp
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2019 02:06:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dTc957nBzDqCF
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jul 2019 02:05:44 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jul 2019 09:05:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,443,1557212400"; d="scan'208";a="154477059"
Received: from unknown (HELO [10.7.153.149]) ([10.7.153.149])
 by orsmga007.jf.intel.com with ESMTP; 02 Jul 2019 09:05:41 -0700
Subject: Re: [RFC v2 dev-5.1 4/5] i2c: aspeed: add buffer mode transfer support
To: Joel Stanley <joel@jms.id.au>
References: <20190625205109.27672-1-jae.hyun.yoo@linux.intel.com>
 <20190625205109.27672-5-jae.hyun.yoo@linux.intel.com>
 <5cc696ba-7fa7-c7cb-0ba6-81df3015e974@fb.com>
 <9c862188-8360-fa39-f21d-9c6d51e1d831@linux.intel.com>
 <CACPK8XdSeK0CPrncmxjMKBLfCwCVHE-VWhAVaia1oQMFTOf_0w@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <74652ba6-ef4b-9e45-7e3a-f2375e21d40f@linux.intel.com>
Date: Tue, 2 Jul 2019 09:05:42 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CACPK8XdSeK0CPrncmxjMKBLfCwCVHE-VWhAVaia1oQMFTOf_0w@mail.gmail.com>
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

On 7/1/2019 10:24 PM, Joel Stanley wrote:
> On Thu, 27 Jun 2019 at 23:35, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> On 6/27/2019 4:24 PM, Tao Ren wrote:
>>> On 6/25/19 1:51 PM, Jae Hyun Yoo wrote:
>>>> Byte mode currently this driver uses makes lots of interrupt call
>>>> which isn't good for performance and it makes the driver very
>>>> timing sensitive. To improve performance of the driver, this commit
>>>> adds buffer mode transfer support which uses I2C SRAM buffer
>>>> instead of using a single byte buffer.
>>>>
>>>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>>
>>> Tested-by: Tao Ren <taoren@fb.com>
>>>
>>> Applied patch serial 1-4 to openbmc kernel 5.1.15 and booted up Facebook CMM AST2500 BMC: I2C component looks normal to me.
>>
>> Hi Tao,
>>
>> Thanks a lot for sharing the test result.
> 
> Do you want we to merge this series into the openbmc tree for further testing?

Hi Joel,

Yes please. It would be good if it gets tested on more various platforms
before upstreaming it.

Thanks,
Jae

> Cheers,
> 
> Joel
> 
>>
>> Regards,
>> Jae
>>
>>>
>>> Cheers,
>>>
>>> Tao
>>>
