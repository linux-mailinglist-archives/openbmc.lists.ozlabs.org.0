Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD51109D0D
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 12:33:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MhcW1KKPzDqY6
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 22:33:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=213.251.177.50;
 helo=inca-roads.misterjones.org; envelope-from=maz@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from inca-roads.misterjones.org (inca-roads.misterjones.org
 [213.251.177.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Mhb33sjGzDqCG;
 Tue, 26 Nov 2019 22:32:30 +1100 (AEDT)
Received: from www-data by cheepnis.misterjones.org with local (Exim 4.80)
 (envelope-from <maz@kernel.org>)
 id 1iZZ4o-0007tn-89; Tue, 26 Nov 2019 12:32:14 +0100
To: Roy van Doormaal <roy.van.doormaal@prodrive-technologies.com>
Subject: Re: [PATCH v2] irqchip/aspeed-i2c-ic: Fix irq domain name memory leak
X-PHP-Originating-Script: 0:main.inc
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 26 Nov 2019 11:32:14 +0000
From: Marc Zyngier <maz@kernel.org>
In-Reply-To: <20191126074025.5112-1-roy.van.doormaal@prodrive-technologies.com>
References: <20191125202937.23133-1-roy.van.doormaal@prodrive-technologies.com>
 <20191126074025.5112-1-roy.van.doormaal@prodrive-technologies.com>
Message-ID: <a980578b688ab760697b44dab267ad2c@www.loen.fr>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/0.7.2
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: roy.van.doormaal@prodrive-technologies.com,
 brendanhiggins@google.com, benh@kernel.crashing.org, joel@jms.id.au,
 tglx@linutronix.de, jason@lakedaemon.net, andrew@aj.id.au,
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org);
 SAEximRunCond expanded to false
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
Cc: Jason Cooper <jason@lakedaemon.net>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2019-11-26 07:40, Roy van Doormaal wrote:
> The aspeed irqchip driver overwrites the default irq domain name,
> but doesn't free the existing domain name.
> This patch frees the irq domain name before overwriting it.
>
> kmemleak trace:
>
> unreferenced object 0xb8004c40 (size 64):
> comm "swapper", pid 0, jiffies 4294937303 (age 747.660s)
> hex dump (first 32 bytes):
> 3a 61 68 62 3a 61 70 62 3a 62 75 73 40 31 65 37 :ahb:apb:bus@1e7
> 38 61 30 30 30 3a 69 6e 74 65 72 72 75 70 74 2d 8a000:interrupt-
> backtrace:
> [<086b59b8>] kmemleak_alloc+0xa8/0xc0
> [<b5a3490c>] __kmalloc_track_caller+0x118/0x1a0
> [<f59c7ced>] kvasprintf+0x5c/0xc0
> [<49275eec>] kasprintf+0x30/0x50
> [<5713064b>] __irq_domain_add+0x184/0x25c
> [<53c594d0>] aspeed_i2c_ic_of_init+0x9c/0x128
> [<d8d7017e>] of_irq_init+0x1ec/0x314
> [<f8405bf1>] irqchip_init+0x1c/0x24
> [<7ef974b3>] init_IRQ+0x30/0x90
> [<87a1438f>] start_kernel+0x28c/0x458
> [< (null)>] (null)
> [<f0763fdf>] 0xffffffff
>
> Signed-off-by: Roy van Doormaal 
> <roy.van.doormaal@prodrive-technologies.com>
> ---
> Changes in v2:
> - drop irq domain name assignment by the aspeed irqchip driver

Which is good, except that the commit message doesn't quite reflect
what this patch does anymore.

I'll fix it when picking it for -rc1.

Thanks,

         M.

> ---
>  drivers/irqchip/irq-aspeed-i2c-ic.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/irqchip/irq-aspeed-i2c-ic.c
> b/drivers/irqchip/irq-aspeed-i2c-ic.c
> index 8d591c179f81..0bd46f63a3c3 100644
> --- a/drivers/irqchip/irq-aspeed-i2c-ic.c
> +++ b/drivers/irqchip/irq-aspeed-i2c-ic.c
> @@ -92,8 +92,6 @@ static int __init aspeed_i2c_ic_of_init(struct
> device_node *node,
>  		goto err_iounmap;
>  	}
>
> -	i2c_ic->irq_domain->name = "aspeed-i2c-domain";
> -
>  	irq_set_chained_handler_and_data(i2c_ic->parent_irq,
>  					 aspeed_i2c_ic_irq_handler, i2c_ic);

-- 
Jazz is not dead. It just smells funny...
