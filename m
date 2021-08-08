Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3733E3949
	for <lists+openbmc@lfdr.de>; Sun,  8 Aug 2021 09:10:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gj9NY3KvDz3bNp
	for <lists+openbmc@lfdr.de>; Sun,  8 Aug 2021 17:10:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.131;
 helo=out30-131.freemail.mail.aliyun.com;
 envelope-from=guoheyi@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gj9NJ0c7cz309j
 for <openbmc@lists.ozlabs.org>; Sun,  8 Aug 2021 17:10:37 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R381e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426; MF=guoheyi@linux.alibaba.com;
 NM=1; PH=DS; RN=10; SR=0; TI=SMTPD_---0UiHsV0k_1628406618; 
Received: from B-G4TALVDL-1650.local(mailfrom:guoheyi@linux.alibaba.com
 fp:SMTPD_---0UiHsV0k_1628406618) by smtp.aliyun-inc.com(127.0.0.1);
 Sun, 08 Aug 2021 15:10:19 +0800
Subject: Re: Question about NVMe MCTP in dbus-sensors
To: Jeremy Kerr <jk@codeconstruct.com.au>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc <openbmc@lists.ozlabs.org>
References: <6fa87e93-863e-94a6-651f-8d6126557553@linux.alibaba.com>
 <863f7fca-7088-450e-a855-92261ba56b9d@www.fastmail.com>
 <30416e46-2e6d-c878-4c7d-943aa1119c0e@linux.alibaba.com>
 <556ea2925e85d84f296211cce9ef3572647e9e80.camel@codeconstruct.com.au>
From: Heyi Guo <guoheyi@linux.alibaba.com>
Message-ID: <debba2ae-88c0-c133-328a-92fe4c2b1d09@linux.alibaba.com>
Date: Sun, 8 Aug 2021 15:10:18 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <556ea2925e85d84f296211cce9ef3572647e9e80.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Zhikui Ren <zhikui.ren@intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, "Winiarska,
 Iwona" <iwona.winiarska@intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, Ed Tanous <ed@tanous.net>,
 "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 "sumanth.bhat@linux.intel.com" <sumanth.bhat@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 2021/8/6 下午5:46, Jeremy Kerr wrote:
> Hi Heyi,
>
>> BTW, when will MCTP be ready in openbmc mainline, including SMBus
>> binding and PCIe binding? Do you have any plan in the future openbmc
>> release?
> We're mostly working on the generic infrastructure components at the
> moment; those are based on their relevant upstream projects rather than
> as parts of OpenBMC specifically. However, the upstream work is going
> well, and the OpenBMC integration shouldn't be too difficult there;
> we'll get that done as necessary.
>
> As for interfaces: I currently have i2c and serial transports working,
> but have no specific plans for PCIe - no hardware to test on. If this
> is something you'd be interested in working on yourself, I can provide
> some pointers.

Yes, we are both interested in SMBus binding and PCIe VDM binding, and 
we have supporting hardware platforms (servers with Aspeed 2600 as BMC).

It's my pleasure to make contribution to the community :)

Thanks,

Heyi

>
> Regards,
>
>
> Jeremy
