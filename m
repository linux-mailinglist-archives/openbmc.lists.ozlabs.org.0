Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AC4347F19
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 18:16:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5FJy1sZPz30K2
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 04:16:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=maz@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5FJm6Pwfz30Bx
 for <openbmc@lists.ozlabs.org>; Thu, 25 Mar 2021 04:16:40 +1100 (AEDT)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CDC70619B4;
 Wed, 24 Mar 2021 17:16:37 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1lP77U-003ZJ5-37; Wed, 24 Mar 2021 17:16:36 +0000
Date: Wed, 24 Mar 2021 17:16:35 +0000
Message-ID: <87sg4kiia4.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH 08/14] irqchip: Add driver for WPCM450 interrupt controller
In-Reply-To: <20210320181610.680870-9-j.neuschaefer@gmx.net>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
 <20210320181610.680870-9-j.neuschaefer@gmx.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: j.neuschaefer@gmx.net, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, linux@armlinux.org.uk,
 tglx@linutronix.de
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, 20 Mar 2021 18:16:04 +0000,
Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net> wrote:
>=20
> The WPCM450 AIC ("Advanced Interrupt Controller") is the interrupt
> controller found in the Nuvoton WPCM450 SoC and other Winbond/Nuvoton
> SoCs.
>=20
> The list of registers if based on the AMI vendor kernel and the
> Nuvoton W90N745 datasheet.
>=20
> Although the hardware supports other interrupt modes, the driver only
> supports high-level interrupts at the moment, because other modes could
> not be tested so far.
>=20
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> ---
>  arch/arm/mach-npcm/Kconfig        |   1 +
>  drivers/irqchip/Kconfig           |   6 ++
>  drivers/irqchip/Makefile          |   1 +
>  drivers/irqchip/irq-wpcm450-aic.c | 162 ++++++++++++++++++++++++++++++
>  4 files changed, 170 insertions(+)
>  create mode 100644 drivers/irqchip/irq-wpcm450-aic.c
>=20
> diff --git a/arch/arm/mach-npcm/Kconfig b/arch/arm/mach-npcm/Kconfig
> index 658c8efb4ca14..a71cf1d189ae5 100644
> --- a/arch/arm/mach-npcm/Kconfig
> +++ b/arch/arm/mach-npcm/Kconfig
> @@ -10,6 +10,7 @@ config ARCH_WPCM450
>  	bool "Support for WPCM450 BMC (Hermon)"
>  	depends on ARCH_MULTI_V5
>  	select CPU_ARM926T
> +	select WPCM450_AIC
>  	select NPCM7XX_TIMER
>  	help
>  	  General support for WPCM450 BMC (Hermon).
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index e74fa206240a1..baf4efec31c67 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -586,4 +586,10 @@ config MST_IRQ
>  	help
>  	  Support MStar Interrupt Controller.
>=20
> +config WPCM450_AIC
> +	bool "Nuvoton WPCM450 Advanced Interrupt Controller"
> +	depends on ARCH_WPCM450 || COMPILE_TEST
> +	help
> +	  Support for the interrupt controller in the Nuvoton WPCM450 BMC SoC.
> +
>  endmenu
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index c59b95a0532c9..bef57937e7296 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -113,3 +113,4 @@ obj-$(CONFIG_LOONGSON_PCH_MSI)		+=3D irq-loongson-pch=
-msi.o
>  obj-$(CONFIG_MST_IRQ)			+=3D irq-mst-intc.o
>  obj-$(CONFIG_SL28CPLD_INTC)		+=3D irq-sl28cpld.o
>  obj-$(CONFIG_MACH_REALTEK_RTL)		+=3D irq-realtek-rtl.o
> +obj-$(CONFIG_WPCM450_AIC)		+=3D irq-wpcm450-aic.o
> diff --git a/drivers/irqchip/irq-wpcm450-aic.c b/drivers/irqchip/irq-wpcm=
450-aic.c
> new file mode 100644
> index 0000000000000..0d6dd8b1fc824
> --- /dev/null
> +++ b/drivers/irqchip/irq-wpcm450-aic.c
> @@ -0,0 +1,162 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright 2021 Jonathan Neusch=C3=A4fer
> +
> +#include <linux/console.h>

That's unexpected. Why do you need this?

> +#include <linux/irqchip.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +
> +#include <asm/exception.h>
> +
> +#define AIC_SCR(x)	((x)*4)	/* Source control registers */
> +#define AIC_GEN		0x84
> +#define AIC_GRSR	0x88
> +#define AIC_IRSR	0x100	/* Interrupt raw status register */
> +#define AIC_IASR	0x104	/* Interrupt active status register */
> +#define AIC_ISR		0x108	/* Interrupt status register */
> +#define AIC_IPER	0x10c	/* Interrupt priority encoding register */
> +#define AIC_ISNR	0x110	/* Interrupt source number register */
> +#define AIC_IMR		0x114	/* Interrupt mask register */
> +#define AIC_OISR	0x118	/* Output interrupt status register */
> +#define AIC_MECR	0x120	/* Mask enable command register */
> +#define AIC_MDCR	0x124	/* Mask disable command register */
> +#define AIC_SSCR	0x128	/* Source set command register */
> +#define AIC_SCCR	0x12c	/* Source clear command register */
> +#define AIC_EOSCR	0x130	/* End of service command register */
> +
> +#define AIC_SCR_SRCTYPE_LOW_LEVEL	(0 << 6)
> +#define AIC_SCR_SRCTYPE_HIGH_LEVEL	(1 << 6)
> +#define AIC_SCR_SRCTYPE_NEG_EDGE	(2 << 6)
> +#define AIC_SCR_SRCTYPE_POS_EDGE	(3 << 6)
> +#define AIC_SCR_PRIORITY(x)		(x)

A mask would be welcomed for this field.

> +
> +#define IRQS		32

Please use something a bit less generic.

> +
> +struct wpcm450_aic {
> +	void __iomem *regs;
> +	struct irq_domain *domain;
> +};
> +
> +static struct wpcm450_aic *aic;
> +
> +static void wpcm450_aic_init_hw(void)
> +{
> +	int i;
> +
> +	/* Disable (mask) all interrupts */
> +	writel(0xffffffff, aic->regs + AIC_MDCR);

Consider using relaxed accessors throughout this driver.

> +
> +	/*
> +	 * Make sure the interrupt controller is ready to serve new interrupts.
> +	 * Reading from IPER indicates that the nIRQ signal may be deasserted,
> +	 * and writing to EOSCR indicates that interrupt handling has finished.
> +	 */
> +	readl(aic->regs + AIC_IPER);
> +	writel(0, aic->regs + AIC_EOSCR);
> +
> +	/* Initialize trigger mode and priority of each interrupt source */
> +	for (i =3D 0; i < IRQS; i++)
> +		writel(AIC_SCR_SRCTYPE_HIGH_LEVEL | AIC_SCR_PRIORITY(7),
> +		       aic->regs + AIC_SCR(i));
> +}
> +
> +static void __exception_irq_entry wpcm450_aic_handle_irq(struct pt_regs =
*regs)
> +{
> +	int hwirq;
> +
> +	/* Determine the interrupt source */
> +	/* Read IPER to signal that nIRQ can be de-asserted */
> +	hwirq =3D readl(aic->regs + AIC_IPER) / 4;
> +
> +	handle_domain_irq(aic->domain, hwirq, regs);
> +}
> +
> +static void wpcm450_aic_ack(struct irq_data *d)
> +{
> +	/* Signal end-of-service */
> +	writel(0, aic->regs + AIC_EOSCR);

Is that an Ack or an EOI? My gut feeling is that the above read is the
Ack, and that this write should actually be an EOI callback.

> +}
> +
> +static void wpcm450_aic_mask(struct irq_data *d)
> +{
> +	unsigned int mask =3D 1U << d->hwirq;

Consider using BIT().

> +
> +	/* Disable (mask) the interrupt */
> +	writel(mask, aic->regs + AIC_MDCR);
> +}
> +
> +static void wpcm450_aic_unmask(struct irq_data *d)
> +{
> +	unsigned int mask =3D 1U << d->hwirq;
> +
> +	/* Enable (unmask) the interrupt */
> +	writel(mask, aic->regs + AIC_MECR);
> +}
> +
> +static int wpcm450_aic_set_type(struct irq_data *d, unsigned int flow_ty=
pe)
> +{
> +	/*
> +	 * The hardware supports high/low level, as well as rising/falling edge
> +	 * modes, and the DT binding accommodates for that, but as long as
> +	 * other modes than high level mode are not used and can't be tested,
> +	 * they are rejected in this driver.
> +	 */
> +	if ((flow_type & IRQ_TYPE_SENSE_MASK) !=3D IRQ_TYPE_LEVEL_HIGH) {
> +		pr_err("IRQ mode %#x is not supported\n", flow_type);

The core kernel shouts loudly enough, no need for extra messages.

> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct irq_chip wpcm450_aic_chip =3D {
> +	.name =3D "wpcm450-aic",
> +	.irq_ack =3D wpcm450_aic_ack,
> +	.irq_mask =3D wpcm450_aic_mask,
> +	.irq_unmask =3D wpcm450_aic_unmask,
> +	.irq_set_type =3D wpcm450_aic_set_type,
> +};
> +
> +static int wpcm450_aic_map(struct irq_domain *d, unsigned int irq, irq_h=
w_number_t hwirq)
> +{
> +	if (hwirq > IRQS)
> +		return -EPERM;
> +
> +	irq_set_chip_and_handler(irq, &wpcm450_aic_chip, handle_level_irq);
> +	irq_set_chip_data(irq, aic);
> +	irq_set_probe(irq);
> +
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops wpcm450_aic_ops =3D {
> +	.map =3D wpcm450_aic_map,
> +	.xlate =3D irq_domain_xlate_twocell,
> +};
> +
> +static int __init wpcm450_aic_of_init(struct device_node *node,
> +				      struct device_node *parent)
> +{
> +	if (parent)
> +		return -EINVAL;
> +
> +	aic =3D kzalloc(sizeof(*aic), GFP_KERNEL);
> +	if (!aic)
> +		return -ENOMEM;
> +
> +	aic->regs =3D of_iomap(node, 0);
> +	if (!aic->regs) {
> +		pr_err("Failed to map WPCM450 AIC registers\n");
> +		return -ENOMEM;
> +	}
> +
> +	wpcm450_aic_init_hw();
> +
> +	set_handle_irq(wpcm450_aic_handle_irq);
> +
> +	aic->domain =3D irq_domain_add_linear(node, IRQS, &wpcm450_aic_ops, aic=
);
> +
> +	return 0;
> +}
> +
> +IRQCHIP_DECLARE(wpcm450_aic, "nuvoton,wpcm450-aic", wpcm450_aic_of_init);

Otherwise, looks good.

	M.

--=20
Without deviation from the norm, progress is not possible.
