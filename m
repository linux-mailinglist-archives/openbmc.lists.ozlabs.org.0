Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 593AB4EC81
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2019 17:47:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VjkM4kM8zDqcX
	for <lists+openbmc@lfdr.de>; Sat, 22 Jun 2019 01:47:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=178.33.251.49; helo=2.mo173.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 2.mo173.mail-out.ovh.net (2.mo173.mail-out.ovh.net
 [178.33.251.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VjjZ1dS6zDqVy
 for <openbmc@lists.ozlabs.org>; Sat, 22 Jun 2019 01:46:54 +1000 (AEST)
Received: from player730.ha.ovh.net (unknown [10.109.146.5])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 7792810B71C
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jun 2019 17:46:45 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player730.ha.ovh.net (Postfix) with ESMTPSA id 969446FE6666;
 Fri, 21 Jun 2019 15:46:37 +0000 (UTC)
Subject: Re: [RFC PATCH dev-5.1 0/6] Aspeed I2C buffer/DMA mode support
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20190620194922.15093-1-jae.hyun.yoo@linux.intel.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2e5fb83f-8884-5c24-1cd5-d7c1e7b930b9@kaod.org>
Date: Fri, 21 Jun 2019 17:46:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190620194922.15093-1-jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 18150632400179202818
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrtdeigdeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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

On 20/06/2019 21:49, Jae Hyun Yoo wrote:
> This patch series adds buffer mode and DMA mode transfer support for the
> Aspeed I2C driver. With this change, default transfer mode will be set to
> buffer mode for better performance, and DMA mode can be selectively used
> depends on platform configuration.
> 
> * Buffer mode
>   AST2400:
>     It has 2 KBytes (256 Bytes x 8 pages) of I2C SRAM buffer pool from
>     0x1e78a800 to 0x1e78afff that can be used for all busses with
>     buffer pool manipulation. To simplify implementation for supporting
>     both AST2400 and AST2500, it assigns each 128 Bytes per bus without
>     using buffer pool manipulation so total 1792 Bytes of I2C SRAM
>     buffer will be used.
> 
>   AST2500:
>     It has 16 Bytes of individual I2C SRAM buffer per each bus and its
>     range is from 0x1e78a200 to 0x1e78a2df, so it doesn't have 'buffer
>     page selection' bit field in the Function control register, and
>     neither 'base address pointer' bit field in the Pool buffer control
>     register it has. To simplify implementation for supporting both
>     AST2400 and AST2500, it writes zeros on those register bit fields
>     but it's okay because it does nothing in AST2500.
> 
> * DMA mode
>   Only AST2500 supports DMA mode under some limitations:
>     I2C is sharing the DMA H/W with UHCI host controller and MCTP
>     controller. Since those controllers operate with DMA mode only, I2C
>     has to use buffer mode or byte mode instead if one of those
>     controllers is enabled. Also make sure that if SD/eMMC or Port80
>     snoop uses DMA mode instead of PIO or FIFO respectively, I2C can't
>     use DMA mode..
> 
> I'm submitting this series as an RFC because it needs more test on real
> AST2400 BMC mahines, also it needs to check if QEMU can handle this change
> so please review and test it.

QEMU should have some support for the I2C DMA mode. Lightly tested  
though. The DT would activate it, right ? 

C. 

> Jae Hyun Yoo (6):
>   dt-bindings: i2c: aspeed: add buffer and DMA mode transfer support
>   ARM: dts: aspeed: add I2C buffer mode support
>   irqchip/aspeed-i2c-ic: add I2C SRAM enabling control
>   i2c: aspeed: fix master pending state handling
>   i2c: aspeed: add buffer mode transfer support
>   i2c: aspeed: add DMA mode transfer support
> 
>  .../devicetree/bindings/i2c/i2c-aspeed.txt    |  52 +-
>  arch/arm/boot/dts/aspeed-g4.dtsi              |  42 +-
>  arch/arm/boot/dts/aspeed-g5.dtsi              |  42 +-
>  drivers/i2c/busses/i2c-aspeed.c               | 469 ++++++++++++++++--
>  drivers/irqchip/irq-aspeed-i2c-ic.c           |   8 +
>  5 files changed, 548 insertions(+), 65 deletions(-)
> 

