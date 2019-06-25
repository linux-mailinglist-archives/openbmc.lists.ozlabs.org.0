Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B4E555C1
	for <lists+openbmc@lfdr.de>; Tue, 25 Jun 2019 19:19:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YCZc3wMSzDqRf
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 03:19:36 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YCYz0YDzzDqK9
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2019 03:19:01 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jun 2019 10:18:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,416,1557212400"; d="scan'208";a="155574655"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.156])
 ([10.7.153.156])
 by orsmga008.jf.intel.com with ESMTP; 25 Jun 2019 10:18:58 -0700
Subject: Re: [RFC PATCH dev-5.1 5/6] i2c: aspeed: add buffer mode transfer
 support
To: Tao Ren <taoren@fb.com>, Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 C?ric Le Goater <clg@kaod.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20190620194922.15093-1-jae.hyun.yoo@linux.intel.com>
 <20190620194922.15093-6-jae.hyun.yoo@linux.intel.com>
 <03abb910-c3aa-07af-1c08-8df83a1425e2@fb.com>
 <c6dc2095-3b2a-322c-e131-2056ab0ef4c7@linux.intel.com>
 <0801acf7-3c24-0a6c-c454-43a8521adb89@fb.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <02216a49-c263-1f37-56aa-9c8e7ee0a980@linux.intel.com>
Date: Tue, 25 Jun 2019 10:18:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <0801acf7-3c24-0a6c-c454-43a8521adb89@fb.com>
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

On 6/24/2019 4:54 PM, Tao Ren wrote:
> On 6/21/19 3:34 PM, Jae Hyun Yoo wrote:
>> On 6/21/2019 3:29 PM, Tao Ren wrote:
>>> On 6/20/19 12:49 PM, Jae Hyun Yoo wrote:
>>>> Byte mode currently this driver uses makes lots of interrupt call
>>>> which isn't good for performance and it makes the driver very
>>>> timing sensitive. To improve performance of the driver, this commit
>>>> adds buffer mode transfer support which uses I2C SRAM buffer
>>>> instead of using a single byte buffer.
>>>>
>>>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>>
>>> Let me apply the patch to my ast2500 BMC platform and will share results earlier next week.
>>
>> Thanks Tao! It would be helpful.
> 
> Hi Jae,
> 
> I applied patches 1-5 (except DMA mode) to my local tree: buffer mode is enabled by default, and reg_base/buf_base also looks correct to me, but I'm seeing some pca9548/lm75 driver binding failures on CMM BMC. I'm wondering if I missed some dependency patches as I'm still working on kernel 5.0 (although i2c-aspeed.c is up to date)?

Hi Tao,

It seems that I2C SRAM isn't enabled in your system. I forgot that Intel
local tree has I2C driver in u-boot so SRAM is enabled because u-boot
makes an I2C reset, but in other OpenBMC systems, it would not work
correctly because SRAM enabling control is triggered before an I2C
reset. I will move the SRAM control code from irq-aspeed-i2c-ic module
to i2c-aspeed module just after the deasserting of I2C reset. Will
submit v2 soon.

> 
> BTW, USB is enabled in my image because both EHCI and UHCI are needed. But I guess it won't impact buffer mode?

This patch series adds DMA support code but it doesn't set the transfer
mode to DMA. It sets buffer mode as default transfer mode. Even in case
you enable DMA, if CONFIG_USB_UHCI_ASPEED is enabled then buffer mode
will be selected instead of DMA by checking code in i2c-aspeed module.

Thanks,
Jae

> 
> Let me see if I can quickly set up kernel 5.1 and re-run testing; meanwhile, kindly let me know what information will be helpful for your debugging.
> 
> 
> Cheers,
> 
> Tao
> 
