Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D86FB1D58E4
	for <lists+openbmc@lfdr.de>; Fri, 15 May 2020 20:18:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NxVp5xd9zDr48
	for <lists+openbmc@lfdr.de>; Sat, 16 May 2020 04:18:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NxV2644rzDqdf
 for <openbmc@lists.ozlabs.org>; Sat, 16 May 2020 04:17:57 +1000 (AEST)
IronPort-SDR: u04ny43GAjSiQ4tSddfWYSaizMX2aigfJX2B11/vThOQS/cq7J7Asm6kXEWuR+/npaigC3CurZ
 JV2l5/0uskfg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 11:17:53 -0700
IronPort-SDR: hIgcP8FcmC5URUsSmcnkr+GJU65MkURhAz1BryLBzBEgmm4d/AWSCYZ7czvubBW4fPOsj+f6/T
 gmAfpjvQ8K8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,396,1583222400"; d="scan'208";a="253857911"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.254.65.230])
 ([10.254.65.230])
 by fmsmga008.fm.intel.com with ESMTP; 15 May 2020 11:17:53 -0700
Subject: Re: Reducing fragmentation in OpenBMC
To: openbmc@lists.ozlabs.org
References: <d7da4861c449609d2cf1b1b1434c653e9a27a805.camel@ozlabs.org>
 <e70889bcbee171b407f64392704c417cf7c0856a.camel@ozlabs.org>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <35b7ea09-f09d-c0ac-e014-468c822358f8@linux.intel.com>
Date: Fri, 15 May 2020 11:17:53 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <e70889bcbee171b407f64392704c417cf7c0856a.camel@ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jeremy,

On 5/15/2020 3:45 AM, Jeremy Kerr wrote:
> Hi all,
> 
>>   - Keep pushing on upstream. Sometimes this can delay things, but I
>> really think that's almost always false economy; the out-of-tree
>> patches will have to be addressed at some point, and that job just
>> gets more involved as time passes.
> 
> One of the lagging items here is the amount of kernel patches pending
> in:
> 
>   
> https://github.com/Intel-BMC/openbmc/tree/intel/meta-openbmc-mods/meta-common/recipes-kernel/linux/linux-aspeed
> 
> Intel folks: any objections if I grab select patches from there and
> work on the upstreaming process? Or are you already working on this?
> 

First of all, thank you for your initiating this discussion. Obviously,
it should be done but I couldn't put enough time to make it.

I don't have any objection on that. It would be really helpful if you
grab patches from there for upstreaming. Please let me know if you need
any help or clarification from me or from Intel during the upstreaming.

Thanks,

Jae
