Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 809E62ECDA5
	for <lists+openbmc@lfdr.de>; Thu,  7 Jan 2021 11:18:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DBMdP5GjGzDr7F
	for <lists+openbmc@lfdr.de>; Thu,  7 Jan 2021 21:18:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=maz@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DBMcR4l1yzDr6c;
 Thu,  7 Jan 2021 21:17:43 +1100 (AEDT)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 36E2023138;
 Thu,  7 Jan 2021 10:17:40 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1kxSML-005oKv-V9; Thu, 07 Jan 2021 10:17:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 07 Jan 2021 10:17:37 +0000
From: Marc Zyngier <maz@kernel.org>
To: ChiaWei Wang <chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH 4/6] irqchip/aspeed: Add Aspeed eSPI interrupt controller
In-Reply-To: <HK0PR06MB377957C33FDD43C5A7F5EA1691AF0@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210106055939.19386-1-chiawei_wang@aspeedtech.com>
 <20210106055939.19386-5-chiawei_wang@aspeedtech.com>
 <123bc25c72b3b17c0c4154d8bd8ce3b0@kernel.org>
 <HK0PR06MB377957C33FDD43C5A7F5EA1691AF0@HK0PR06MB3779.apcprd06.prod.outlook.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <beae3a8ba0a89ac6dff638df4e8b3211@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: chiawei_wang@aspeedtech.com, robh+dt@kernel.org,
 joel@jms.id.au, andrew@aj.id.au, tglx@linutronix.de, p.zabel@pengutronix.de,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 BMC-SW <BMC-SW@aspeedtech.com>, andrew@aj.id.au, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, p.zabel@pengutronix.de,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2021-01-07 02:59, ChiaWei Wang wrote:
> Hi Marc,
> 
>> -----Original Message-----
>> From: Marc Zyngier <maz@kernel.org>
>> Sent: Wednesday, January 6, 2021 6:59 PM
>> To: ChiaWei Wang <chiawei_wang@aspeedtech.com>
>> Subject: Re: [PATCH 4/6] irqchip/aspeed: Add Aspeed eSPI interrupt 
>> controller
>> 
>> On 2021-01-06 05:59, Chia-Wei, Wang wrote:
>> > The eSPI interrupt controller acts as a SW IRQ number decoder to
>> > correctly control/dispatch interrupts of the eSPI peripheral, virtual
>> > wire, out-of-band, and flash channels.
>> >
>> > Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
>> > ---
>> >  drivers/irqchip/Makefile             |   2 +-
>> >  drivers/irqchip/irq-aspeed-espi-ic.c | 251 ++++++++++++++++++++++++
>> >  include/soc/aspeed/espi.h            | 279
>> +++++++++++++++++++++++++++
>> >  3 files changed, 531 insertions(+), 1 deletion(-)  create mode 100644
>> > drivers/irqchip/irq-aspeed-espi-ic.c
>> >  create mode 100644 include/soc/aspeed/espi.h
>> >
>> > diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile index
>> > 0ac93bfaec61..56da4a3123f8 100644
>> > --- a/drivers/irqchip/Makefile
>> > +++ b/drivers/irqchip/Makefile
>> > @@ -86,7 +86,7 @@ obj-$(CONFIG_MVEBU_PIC)			+=
>> irq-mvebu-pic.o
>> >  obj-$(CONFIG_MVEBU_SEI)			+= irq-mvebu-sei.o
>> >  obj-$(CONFIG_LS_EXTIRQ)			+= irq-ls-extirq.o
>> >  obj-$(CONFIG_LS_SCFG_MSI)		+= irq-ls-scfg-msi.o
>> > -obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o irq-aspeed-i2c-ic.o
>> > irq-aspeed-scu-ic.o
>> > +obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o irq-aspeed-i2c-ic.o
>> > irq-aspeed-scu-ic.o irq-aspeed-espi-ic.o
>> >  obj-$(CONFIG_STM32_EXTI) 		+= irq-stm32-exti.o
>> >  obj-$(CONFIG_QCOM_IRQ_COMBINER)		+= qcom-irq-combiner.o
>> >  obj-$(CONFIG_IRQ_UNIPHIER_AIDET)	+= irq-uniphier-aidet.o
>> > diff --git a/drivers/irqchip/irq-aspeed-espi-ic.c
>> > b/drivers/irqchip/irq-aspeed-espi-ic.c
>> > new file mode 100644
>> > index 000000000000..8a5cc8fe3f0c
>> > --- /dev/null
>> > +++ b/drivers/irqchip/irq-aspeed-espi-ic.c
>> > @@ -0,0 +1,251 @@
>> > +// SPDX-License-Identifier: GPL-2.0-or-later
>> > +/*
>> > + * Copyright (c) 2020 Aspeed Technology Inc.
>> > + */
>> > +#include <linux/bitops.h>
>> > +#include <linux/module.h>
>> > +#include <linux/irq.h>
>> > +#include <linux/irqchip.h>
>> > +#include <linux/irqchip/chained_irq.h> #include <linux/irqdomain.h>
>> > +#include <linux/interrupt.h> #include <linux/mfd/syscon.h> #include
>> > +<linux/regmap.h> #include <linux/of.h> #include <linux/of_platform.h>
>> > +
>> > +#include <soc/aspeed/espi.h>
>> > +#include <dt-bindings/interrupt-controller/aspeed-espi-ic.h>
>> > +
>> > +#define DEVICE_NAME	"aspeed-espi-ic"
>> > +#define IRQCHIP_NAME	"eSPI-IC"
>> > +
>> > +#define ESPI_IC_IRQ_NUM	7
>> > +
>> > +struct aspeed_espi_ic {
>> > +	struct regmap *map;
>> > +	int irq;
>> > +	int gpio_irq;
>> > +	struct irq_domain *irq_domain;
>> > +};
>> > +
>> > +static void aspeed_espi_ic_gpio_isr(struct irq_desc *desc) {
>> > +	unsigned int irq;
>> > +	struct aspeed_espi_ic *espi_ic = irq_desc_get_handler_data(desc);
>> > +	struct irq_chip *chip = irq_desc_get_chip(desc);
>> > +
>> > +	chained_irq_enter(chip, desc);
>> > +
>> > +	irq = irq_find_mapping(espi_ic->irq_domain,
>> > +				   ASPEED_ESPI_IC_CTRL_RESET);
>> > +	generic_handle_irq(irq);
>> > +
>> > +	irq = irq_find_mapping(espi_ic->irq_domain,
>> > +				   ASPEED_ESPI_IC_CHAN_RESET);
>> > +	generic_handle_irq(irq);
>> 
>> So for each mux interrupt, you generate two endpoints interrupt, 
>> without even
>> checking whether they are pending? That's no good.
> 
> As the eSPI IC driver is chained to Aspeed GPIO IC, the pending is
> checked in the gpio-aspeed.c

That's not the place to do that.

> 
>> > +
>> > +	chained_irq_exit(chip, desc);
>> > +}
>> > +
>> > +static void aspeed_espi_ic_isr(struct irq_desc *desc) {
>> > +	unsigned int sts;
>> > +	unsigned int irq;
>> > +	struct aspeed_espi_ic *espi_ic = irq_desc_get_handler_data(desc);
>> > +	struct irq_chip *chip = irq_desc_get_chip(desc);
>> > +
>> > +	chained_irq_enter(chip, desc);
>> > +
>> > +	regmap_read(espi_ic->map, ESPI_INT_STS, &sts);
>> > +
>> > +	if (sts & ESPI_INT_STS_PERIF_BITS) {
>> > +		irq = irq_find_mapping(espi_ic->irq_domain,
>> > +				       ASPEED_ESPI_IC_PERIF_EVENT);
>> > +		generic_handle_irq(irq);
>> > +	}
>> > +
>> > +	if (sts & ESPI_INT_STS_VW_BITS) {
>> > +		irq = irq_find_mapping(espi_ic->irq_domain,
>> > +				       ASPEED_ESPI_IC_VW_EVENT);
>> > +		generic_handle_irq(irq);
>> > +	}
>> > +
>> > +	if (sts & ESPI_INT_STS_OOB_BITS) {
>> > +		irq = irq_find_mapping(espi_ic->irq_domain,
>> > +				       ASPEED_ESPI_IC_OOB_EVENT);
>> > +		generic_handle_irq(irq);
>> > +	}
>> > +
>> > +	if (sts & ESPI_INT_STS_FLASH_BITS) {
>> > +		irq = irq_find_mapping(espi_ic->irq_domain,
>> > +				       ASPEED_ESPI_IC_FLASH_EVENT);
>> > +		generic_handle_irq(irq);
>> > +	}
>> > +
>> > +	if (sts & ESPI_INT_STS_HW_RST_DEASSERT) {
>> > +		irq = irq_find_mapping(espi_ic->irq_domain,
>> > +				       ASPEED_ESPI_IC_CTRL_EVENT);
>> > +		generic_handle_irq(irq);
>> > +	}
>> 
>> This is horrible. Why can't you just use fls() in a loop?
> 
> The bits in the interrupt status register for a eSPI channel are not
> sequentially arranged.
> Using fls() may invoke an eSPI channel ISR multiple times.
> So I collected the bitmap for each channel, respectively, and call the
> ISR at once.

And that's equally wrong. You need to handle interrupts individually,
as they are different signal. If you are to implement an interrupt
controller, please do it properly.

Otherwise, get rid of it and move everything into your pet driver.
There is no need to do a half-baked job.

As it is, there is no way this code can be merged.

         M.
-- 
Jazz is not dead. It just smells funny...
