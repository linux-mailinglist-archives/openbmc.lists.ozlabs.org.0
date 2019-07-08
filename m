Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA4962CA8
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2019 01:32:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jMDh5sRQzDqQW
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2019 09:32:20 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jMDB2NsTzDqH1
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jul 2019 09:31:52 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jul 2019 16:31:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,468,1557212400"; d="scan'208";a="176317942"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by orsmga002.jf.intel.com with ESMTP; 08 Jul 2019 16:31:49 -0700
Subject: Re: aspeed-video WARN_ON in dma_free_attrs with 5.2
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Joel Stanley <joel@jms.id.au>, Eddie James <eajames@linux.ibm.com>
References: <CACPK8Xd7yntyZCP0fXr3B5puJP3D45oeaKLaEWUrL5pr+EY_QQ@mail.gmail.com>
 <12fd6bcb-59f3-92db-14d1-b45ddc50d184@linux.intel.com>
Message-ID: <9622daf4-7aac-562e-fe15-2dccdd27e9f3@linux.intel.com>
Date: Mon, 8 Jul 2019 16:31:49 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <12fd6bcb-59f3-92db-14d1-b45ddc50d184@linux.intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 7/8/2019 9:26 AM, Jae Hyun Yoo wrote:
> On 7/7/2019 9:15 PM, Joel Stanley wrote:
>> I am running with Jae's fixes from dev-5.1 applied to 5.2.. I see this
>> on boot, early on as userspace is coming up. The host is not running.
>>
>>   WARNING: CPU: 0 PID: 140 at kernel/dma/mapping.c:281 
>> dma_free_attrs+0xd0/0xe0
>>
>> The driver is calling dma_free_attrs from aspeed_video_release. The
>> comment in dma_free_attrs says:
>>
>>          /*
>>           * On non-coherent platforms which implement DMA-coherent 
>> buffers via
>>           * non-cacheable remaps, ops->free() may call vunmap(). Thus 
>> getting
>>           * this far in IRQ context is a) at risk of a BUG_ON() or 
>> trying to
>>           * sleep on some machines, and b) an indication that the 
>> driver is
>>           * probably misusing the coherent API anyway.
>>           */
>>          WARN_ON(irqs_disabled());
>>
>> Which suggests aspeed-video might be at fault.
>>
>> I can reproduce it in qemu. It does not reproduce with vanilla 5.2,
>> which does not contain Jae's various fixes.
> 
> Hi Joel,
> 
> Thanks for reporting the issue.
> I'll check it on dev-5.2 and will share the result.

Hi Joel,

I root caused the issue. That is caused by calling DMA buffer alloc/free
APIs in an interrupt disabled context. It cannot be seen in upstream
linux tree because a patch is slightly different.

I tested it on dev-5.2 branch in git://github.com/shenki/linux.
In this repo, the commit 233d753bad072caee5dbb7325158a086c9e9dcf4
should be replaced with an upstreamed version. You can cherry pick the
upstreamed version from:

https://lists.ozlabs.org/pipermail/linux-aspeed/2019-June/001793.html

or from:

commit 9698ed4d4a2993ce54b9f7d71a2891e972caa117 in next-20190708
branch of upstream linux tree.

Please let me know if you need an incremental patch on top of the latest
git://github.com/shenki/linux dev-5.2 branch instead of cherry-picking
above options.

Thanks,
Jae
