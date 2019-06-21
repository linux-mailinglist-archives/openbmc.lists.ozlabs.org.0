Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 649424ED82
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2019 18:58:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VlJ55DTszDqg3
	for <lists+openbmc@lfdr.de>; Sat, 22 Jun 2019 02:58:29 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VlHV5BgrzDqM3
 for <openbmc@lists.ozlabs.org>; Sat, 22 Jun 2019 02:57:57 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jun 2019 09:57:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,401,1557212400"; d="scan'208";a="312040852"
Received: from unknown (HELO [10.7.153.148]) ([10.7.153.148])
 by orsmga004.jf.intel.com with ESMTP; 21 Jun 2019 09:57:54 -0700
Subject: Re: [RFC PATCH dev-5.1 0/6] Aspeed I2C buffer/DMA mode support
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20190620194922.15093-1-jae.hyun.yoo@linux.intel.com>
 <2e5fb83f-8884-5c24-1cd5-d7c1e7b930b9@kaod.org>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <c3c8ae72-fa70-37ec-35b4-6e43dcab5c30@linux.intel.com>
Date: Fri, 21 Jun 2019 09:57:54 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <2e5fb83f-8884-5c24-1cd5-d7c1e7b930b9@kaod.org>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/21/2019 8:46 AM, Cédric Le Goater wrote:
> On 20/06/2019 21:49, Jae Hyun Yoo wrote:
>> This patch series adds buffer mode and DMA mode transfer support for the
>> Aspeed I2C driver. With this change, default transfer mode will be set to
>> buffer mode for better performance, and DMA mode can be selectively used
>> depends on platform configuration.
>>
>> * Buffer mode
>>    AST2400:
>>      It has 2 KBytes (256 Bytes x 8 pages) of I2C SRAM buffer pool from
>>      0x1e78a800 to 0x1e78afff that can be used for all busses with
>>      buffer pool manipulation. To simplify implementation for supporting
>>      both AST2400 and AST2500, it assigns each 128 Bytes per bus without
>>      using buffer pool manipulation so total 1792 Bytes of I2C SRAM
>>      buffer will be used.
>>
>>    AST2500:
>>      It has 16 Bytes of individual I2C SRAM buffer per each bus and its
>>      range is from 0x1e78a200 to 0x1e78a2df, so it doesn't have 'buffer
>>      page selection' bit field in the Function control register, and
>>      neither 'base address pointer' bit field in the Pool buffer control
>>      register it has. To simplify implementation for supporting both
>>      AST2400 and AST2500, it writes zeros on those register bit fields
>>      but it's okay because it does nothing in AST2500.
>>
>> * DMA mode
>>    Only AST2500 supports DMA mode under some limitations:
>>      I2C is sharing the DMA H/W with UHCI host controller and MCTP
>>      controller. Since those controllers operate with DMA mode only, I2C
>>      has to use buffer mode or byte mode instead if one of those
>>      controllers is enabled. Also make sure that if SD/eMMC or Port80
>>      snoop uses DMA mode instead of PIO or FIFO respectively, I2C can't
>>      use DMA mode..
>>
>> I'm submitting this series as an RFC because it needs more test on real
>> AST2400 BMC mahines, also it needs to check if QEMU can handle this change
>> so please review and test it.
> 
> QEMU should have some support for the I2C DMA mode. Lightly tested
> though. The DT would activate it, right ?
> 
> C.

Hi Cédric,

Right, DMA should be enabled in dt by adding below setting into each bus
node if you are going to use I2C DMA mode.

aspeed,dma-buf-size = <4096>;

Please see an example in the 1/6 patch of this series.

Also, you should disable USB host features by disabling CONFIG_USB from
kernel configs. You could remove it from defconfig like this:
https://gerrit.openbmc-project.xyz/c/openbmc/meta-aspeed/+/22808
Or, you can simply add CONFIG_USB=n into your machine layer kernel
config overlay.

Thanks,
Jae

>> Jae Hyun Yoo (6):
>>    dt-bindings: i2c: aspeed: add buffer and DMA mode transfer support
>>    ARM: dts: aspeed: add I2C buffer mode support
>>    irqchip/aspeed-i2c-ic: add I2C SRAM enabling control
>>    i2c: aspeed: fix master pending state handling
>>    i2c: aspeed: add buffer mode transfer support
>>    i2c: aspeed: add DMA mode transfer support
>>
>>   .../devicetree/bindings/i2c/i2c-aspeed.txt    |  52 +-
>>   arch/arm/boot/dts/aspeed-g4.dtsi              |  42 +-
>>   arch/arm/boot/dts/aspeed-g5.dtsi              |  42 +-
>>   drivers/i2c/busses/i2c-aspeed.c               | 469 ++++++++++++++++--
>>   drivers/irqchip/irq-aspeed-i2c-ic.c           |   8 +
>>   5 files changed, 548 insertions(+), 65 deletions(-)
>>
> 
