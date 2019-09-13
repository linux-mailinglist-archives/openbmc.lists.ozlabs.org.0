Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8560B23F0
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2019 18:16:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VLP23QQyzF5nS
	for <lists+openbmc@lfdr.de>; Sat, 14 Sep 2019 02:16:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VLM76t4HzF3ry;
 Sat, 14 Sep 2019 02:14:58 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Sep 2019 09:14:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,489,1559545200"; d="scan'208";a="336937990"
Received: from unknown (HELO [10.7.153.148]) ([10.7.153.148])
 by orsmga004.jf.intel.com with ESMTP; 13 Sep 2019 09:14:55 -0700
Subject: Re: [PATCH -next 2/2] media: aspeed: set hsync and vsync polarities
 to normal before starting mode detection
To: Andrew Jeffery <andrew@aj.id.au>, Eddie James <eajames@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Joel Stanley <joel@jms.id.au>
References: <20190910190756.31432-1-jae.hyun.yoo@linux.intel.com>
 <20190910190756.31432-3-jae.hyun.yoo@linux.intel.com>
 <5c5538e7-4b7a-4d13-b4ac-584be4090d48@www.fastmail.com>
 <490bc4d9-e471-3b0f-49c9-39e99af95d62@linux.intel.com>
 <2c24c8a9-b357-4948-8744-3900ed28012c@www.fastmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <46c1fc35-1e9f-c08b-1c9f-ef5d82c46659@linux.intel.com>
Date: Fri, 13 Sep 2019 09:14:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2c24c8a9-b357-4948-8744-3900ed28012c@www.fastmail.com>
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
Cc: openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org,
 linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/12/2019 5:18 PM, Andrew Jeffery wrote:
> 
> 
> On Fri, 13 Sep 2019, at 02:36, Jae Hyun Yoo wrote:
>> On 9/11/2019 10:39 PM, Andrew Jeffery wrote:
>>>
>>>
>>> On Wed, 11 Sep 2019, at 04:37, Jae Hyun Yoo wrote:
>>>> Sometimes it detects a weird resolution such as 1024x287 when the
>>>> actual resolution is 1024x768. To resolve such an issue, this
>>>> commit adds clearing for hsync and vsync polarity register bits
>>>> at the beginning of the first mode detection. This is recommended
>>>> in the datasheet.
>>>
>>> I guess this answers my question on the previous patch's commit
>>> message. Maybe it should be in both?
>>
>> I think the previous patch is a bug fix and this one is an enhancement
>> patch. Better splitting them.
> 
> I wasn't suggesting squashing the patches, I was suggesting updating
> the commit message of the first patch to better justify/explain the
> change.

Okay. Will update the commit message of the first patch.

Thanks,
Jae

