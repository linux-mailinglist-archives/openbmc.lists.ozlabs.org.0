Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA3AFEFF
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 19:38:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tpf03pqNzDqMP
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 03:38:16 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tpdB3LcnzDq9Z
 for <openbmc@lists.ozlabs.org>; Wed,  1 May 2019 03:37:33 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Apr 2019 10:37:31 -0700
X-ExtLoop1: 1
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148])
 ([10.7.153.148])
 by orsmga002.jf.intel.com with ESMTP; 30 Apr 2019 10:37:31 -0700
Subject: Re: [PATCH dev-5.0 0/4] Improve stability of Aspeed video engine
 driver - 2nd phase
To: Joel Stanley <joel@jms.id.au>
References: <20190425222040.2413-1-jae.hyun.yoo@linux.intel.com>
 <CACPK8XdOBgGrR6EKj4rP3VhnwiCrFGAn33n6XTrU1UR3kJSigA@mail.gmail.com>
 <66b34da6-5d17-aa0b-0bcf-21ce9049fca4@linux.intel.com>
 <CACPK8XeL6vDFa94RmbhpM8riLcsvzyovi3HCTOf6yLe0LzGSLw@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <f6be059c-3574-5737-c452-e6d3f83a6917@linux.intel.com>
Date: Tue, 30 Apr 2019 10:37:31 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XeL6vDFa94RmbhpM8riLcsvzyovi3HCTOf6yLe0LzGSLw@mail.gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 4/29/2019 9:12 PM, Joel Stanley wrote:
> On Mon, 29 Apr 2019 at 16:27, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> On 4/29/2019 12:27 AM, Joel Stanley wrote:
>>> Hi Jae,
>>>
>>> On Thu, 25 Apr 2019 at 22:20, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>>>
>>>> This patch series improves stability of Aspeed video engine driver by fixing
>>>> interrupt handling logic and by reducing noisy log printings in the driver.
>>>
>>> NIce work. Did you post these for upstream inclusion?
>>>
>>> I suggest doing that now. I can apply these to dev-5.0 once we have an
>>> ack from Eddie.
>>
>> Hi Joel,
>>
>> Thanks for your review. I'll upstream it after Eddie's patch
>> upstreaming. Will submit the 1st phase and this 2nd phase series
>> altogether then.
> 
> I recommend you post them to the list now, and note in your cover
> letter that they are based on Eddie's fixes.
> 

Sure, I'll submit it to upstream as well when I submit v2.

Thanks,
Jae

> Cheers,
> 
> Joel
> 
