Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C87342EE1
	for <lists+openbmc@lfdr.de>; Sat, 20 Mar 2021 19:21:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F2pxf2PNhz2yyH
	for <lists+openbmc@lfdr.de>; Sun, 21 Mar 2021 05:21:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=kJCXeSYI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.20; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=kJCXeSYI; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F2px86CSjz30LC
 for <openbmc@lists.ozlabs.org>; Sun, 21 Mar 2021 05:21:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1616264451;
 bh=fYnk+0aVGf2OivWiHr/yd+MuJt17pR5QiE8V9sY/L84=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=kJCXeSYIQflE8F2nnFtbcqsTbmW8dAbS6c8rwYSxFnUWJ/pPJ5UCXSUmGH/+AEARM
 4Y1WVMKdikrG6WusBpWrZ1QlUjeUIg32l/GMtRybsFuxpOsXvKNhWQZa4z58SjgmEV
 Qym+BEF4HXiun3UoEpB0pLAzPsnKRYcI7cgCyVBc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFsYx-1lSqEO19fr-00HP46; Sat, 20
 Mar 2021 19:20:51 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 08/14] irqchip: Add driver for WPCM450 interrupt controller
Date: Sat, 20 Mar 2021 19:16:04 +0100
Message-Id: <20210320181610.680870-9-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210320181610.680870-1-j.neuschaefer@gmx.net>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6DpsB2llwLLicXhl87VXK6OBN2xTwr0hoEzpTf2akKkuV8Vf27l
 WLnsrdeW8anF93k/Yw+X6C4k6HobYfLWpdd5LlG54WUiXztIfmcu4m134EUagVSJeJgGWNr
 41XFcYrB6dNsryDd+/hh0qJ2FWyyYnLPjyaDb0wSJbZk6YC9EDjbSGXZLP0GXEDudksAeBX
 lJb16YQsPCk5v/IParNRg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TwTQpQ5Sxhw=:HH/NolGr/WeAqbaOI0kLl5
 GamHGrE3W/u9huj8e6zBVAWXwMaUDSHf/Wk1aO/AXU3ezSpsyj3dQfxNVMl29uGu3kMosQC+6
 XBg0pqIlSxVdbZngJyjD0VpU0PPNhgEAxxZEuyVnq3nxB/RnLUFrml5NxH3vtgrMMmz2G1SJJ
 6gvAU7Ehh5Dg++xY2pMJ01ZzKv7EKlM4rddGFX7wV2DWgZf2gRTwf1KcMj7twWNXc+LzxA7VG
 AvYZERL9PIzPY/is6aA2zX1wZrHmxl+EGuNnC/heISlqbE+eCQC3dGGZoQymggb8tt0Fmj122
 PQbJu+HmaTPTMP2KneNMSYTWNxWwggCjQroW07Q1smmUeCTIKZRTuDwr9x70O3BfnEMOVU+UX
 a7SD2N09dBz31i1HZsdKicON5YCZQkZ0i/c+gTf0FpLAeK3g6j4vqVWRInKoHq6Ehi5O4CW91
 iyqWuVNer+cE6folFdbAFceWPPA0NlpDSpLEy85bDmym77+mKR3bz1kn6UzuloeHr6oB6gPem
 iHeAK/1hcNck6PEREd9pZ+ZvaDidq8170CE+XsjyzcwTZksfIBnVFr+0wljXM5JbXWkqdOaC2
 vsJlvUF8gMONvfzEVHt0+vJw1f4iZxZieNAKgAwVxqaJpQEyx6MHpm5uoUsrjUxhBNBCWjYCm
 f91e7JctWh5ZNcDKKnnfBKxOFaAKDSWCagRew3nZPI5An0dzXTpbc5h/HVeuFfJ1pNU/1FO/0
 pc2tp4HFLZaHORcrMgK5rq4lT/N1GfCCXHjEVWGVYafSFsOLKeXQeuNJZCxYc5FIzEbjmTrvQ
 XXvT9h1+6wcnszy3c/2ED7iSYdZejMr0kULgTBBm/0rpJAP7bR91B8XlKSiH9UVrYhArsZupr
 AM8hEbsqJdzX1p0v3kErcIjS9Ge6Wso8jo+DMeawkcTDi6plaBwz7KQCRRyN8liVaHh4FZ/7V
 TrJW7VohNRGoqCfdx/UK97pJiJN4mrEtjFLrkIxD8iXti8WWXC8jutAZfggZK/REgIIHXccKp
 VsHYQ+DGo5TFq73k+1p85i33H3n1ttvy8tlwubyOd16k/mkWCtCx90EF3sItM35jWfUc/VV7K
 HQut983toZ9h7lX1QSV+CPCSgQikfZnKVt1+BfkdBcv3G8v+3CPKI3o4eyzvPvbyJiawbN6NP
 V1edc3n2ubr7g1g6JcfK8Rk64uTVy46owWlyzg1kwJLv5Ckfm5dd6WHzoji/C1mMekZqipXRV
 bZElo4NtL3C7SHdW0
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
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Marc Zyngier <maz@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>, Tali Perry <tali.perry1@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The WPCM450 AIC ("Advanced Interrupt Controller") is the interrupt
controller found in the Nuvoton WPCM450 SoC and other Winbond/Nuvoton
SoCs.

The list of registers if based on the AMI vendor kernel and the
Nuvoton W90N745 datasheet.

Although the hardware supports other interrupt modes, the driver only
supports high-level interrupts at the moment, because other modes could
not be tested so far.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 arch/arm/mach-npcm/Kconfig        |   1 +
 drivers/irqchip/Kconfig           |   6 ++
 drivers/irqchip/Makefile          |   1 +
 drivers/irqchip/irq-wpcm450-aic.c | 162 ++++++++++++++++++++++++++++++
 4 files changed, 170 insertions(+)
 create mode 100644 drivers/irqchip/irq-wpcm450-aic.c

diff --git a/arch/arm/mach-npcm/Kconfig b/arch/arm/mach-npcm/Kconfig
index 658c8efb4ca14..a71cf1d189ae5 100644
=2D-- a/arch/arm/mach-npcm/Kconfig
+++ b/arch/arm/mach-npcm/Kconfig
@@ -10,6 +10,7 @@ config ARCH_WPCM450
 	bool "Support for WPCM450 BMC (Hermon)"
 	depends on ARCH_MULTI_V5
 	select CPU_ARM926T
+	select WPCM450_AIC
 	select NPCM7XX_TIMER
 	help
 	  General support for WPCM450 BMC (Hermon).
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index e74fa206240a1..baf4efec31c67 100644
=2D-- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -586,4 +586,10 @@ config MST_IRQ
 	help
 	  Support MStar Interrupt Controller.

+config WPCM450_AIC
+	bool "Nuvoton WPCM450 Advanced Interrupt Controller"
+	depends on ARCH_WPCM450 || COMPILE_TEST
+	help
+	  Support for the interrupt controller in the Nuvoton WPCM450 BMC SoC.
+
 endmenu
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index c59b95a0532c9..bef57937e7296 100644
=2D-- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -113,3 +113,4 @@ obj-$(CONFIG_LOONGSON_PCH_MSI)		+=3D irq-loongson-pch-=
msi.o
 obj-$(CONFIG_MST_IRQ)			+=3D irq-mst-intc.o
 obj-$(CONFIG_SL28CPLD_INTC)		+=3D irq-sl28cpld.o
 obj-$(CONFIG_MACH_REALTEK_RTL)		+=3D irq-realtek-rtl.o
+obj-$(CONFIG_WPCM450_AIC)		+=3D irq-wpcm450-aic.o
diff --git a/drivers/irqchip/irq-wpcm450-aic.c b/drivers/irqchip/irq-wpcm4=
50-aic.c
new file mode 100644
index 0000000000000..0d6dd8b1fc824
=2D-- /dev/null
+++ b/drivers/irqchip/irq-wpcm450-aic.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright 2021 Jonathan Neusch=C3=A4fer
+
+#include <linux/console.h>
+#include <linux/irqchip.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+
+#include <asm/exception.h>
+
+#define AIC_SCR(x)	((x)*4)	/* Source control registers */
+#define AIC_GEN		0x84
+#define AIC_GRSR	0x88
+#define AIC_IRSR	0x100	/* Interrupt raw status register */
+#define AIC_IASR	0x104	/* Interrupt active status register */
+#define AIC_ISR		0x108	/* Interrupt status register */
+#define AIC_IPER	0x10c	/* Interrupt priority encoding register */
+#define AIC_ISNR	0x110	/* Interrupt source number register */
+#define AIC_IMR		0x114	/* Interrupt mask register */
+#define AIC_OISR	0x118	/* Output interrupt status register */
+#define AIC_MECR	0x120	/* Mask enable command register */
+#define AIC_MDCR	0x124	/* Mask disable command register */
+#define AIC_SSCR	0x128	/* Source set command register */
+#define AIC_SCCR	0x12c	/* Source clear command register */
+#define AIC_EOSCR	0x130	/* End of service command register */
+
+#define AIC_SCR_SRCTYPE_LOW_LEVEL	(0 << 6)
+#define AIC_SCR_SRCTYPE_HIGH_LEVEL	(1 << 6)
+#define AIC_SCR_SRCTYPE_NEG_EDGE	(2 << 6)
+#define AIC_SCR_SRCTYPE_POS_EDGE	(3 << 6)
+#define AIC_SCR_PRIORITY(x)		(x)
+
+#define IRQS		32
+
+struct wpcm450_aic {
+	void __iomem *regs;
+	struct irq_domain *domain;
+};
+
+static struct wpcm450_aic *aic;
+
+static void wpcm450_aic_init_hw(void)
+{
+	int i;
+
+	/* Disable (mask) all interrupts */
+	writel(0xffffffff, aic->regs + AIC_MDCR);
+
+	/*
+	 * Make sure the interrupt controller is ready to serve new interrupts.
+	 * Reading from IPER indicates that the nIRQ signal may be deasserted,
+	 * and writing to EOSCR indicates that interrupt handling has finished.
+	 */
+	readl(aic->regs + AIC_IPER);
+	writel(0, aic->regs + AIC_EOSCR);
+
+	/* Initialize trigger mode and priority of each interrupt source */
+	for (i =3D 0; i < IRQS; i++)
+		writel(AIC_SCR_SRCTYPE_HIGH_LEVEL | AIC_SCR_PRIORITY(7),
+		       aic->regs + AIC_SCR(i));
+}
+
+static void __exception_irq_entry wpcm450_aic_handle_irq(struct pt_regs *=
regs)
+{
+	int hwirq;
+
+	/* Determine the interrupt source */
+	/* Read IPER to signal that nIRQ can be de-asserted */
+	hwirq =3D readl(aic->regs + AIC_IPER) / 4;
+
+	handle_domain_irq(aic->domain, hwirq, regs);
+}
+
+static void wpcm450_aic_ack(struct irq_data *d)
+{
+	/* Signal end-of-service */
+	writel(0, aic->regs + AIC_EOSCR);
+}
+
+static void wpcm450_aic_mask(struct irq_data *d)
+{
+	unsigned int mask =3D 1U << d->hwirq;
+
+	/* Disable (mask) the interrupt */
+	writel(mask, aic->regs + AIC_MDCR);
+}
+
+static void wpcm450_aic_unmask(struct irq_data *d)
+{
+	unsigned int mask =3D 1U << d->hwirq;
+
+	/* Enable (unmask) the interrupt */
+	writel(mask, aic->regs + AIC_MECR);
+}
+
+static int wpcm450_aic_set_type(struct irq_data *d, unsigned int flow_typ=
e)
+{
+	/*
+	 * The hardware supports high/low level, as well as rising/falling edge
+	 * modes, and the DT binding accommodates for that, but as long as
+	 * other modes than high level mode are not used and can't be tested,
+	 * they are rejected in this driver.
+	 */
+	if ((flow_type & IRQ_TYPE_SENSE_MASK) !=3D IRQ_TYPE_LEVEL_HIGH) {
+		pr_err("IRQ mode %#x is not supported\n", flow_type);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static struct irq_chip wpcm450_aic_chip =3D {
+	.name =3D "wpcm450-aic",
+	.irq_ack =3D wpcm450_aic_ack,
+	.irq_mask =3D wpcm450_aic_mask,
+	.irq_unmask =3D wpcm450_aic_unmask,
+	.irq_set_type =3D wpcm450_aic_set_type,
+};
+
+static int wpcm450_aic_map(struct irq_domain *d, unsigned int irq, irq_hw=
_number_t hwirq)
+{
+	if (hwirq > IRQS)
+		return -EPERM;
+
+	irq_set_chip_and_handler(irq, &wpcm450_aic_chip, handle_level_irq);
+	irq_set_chip_data(irq, aic);
+	irq_set_probe(irq);
+
+	return 0;
+}
+
+static const struct irq_domain_ops wpcm450_aic_ops =3D {
+	.map =3D wpcm450_aic_map,
+	.xlate =3D irq_domain_xlate_twocell,
+};
+
+static int __init wpcm450_aic_of_init(struct device_node *node,
+				      struct device_node *parent)
+{
+	if (parent)
+		return -EINVAL;
+
+	aic =3D kzalloc(sizeof(*aic), GFP_KERNEL);
+	if (!aic)
+		return -ENOMEM;
+
+	aic->regs =3D of_iomap(node, 0);
+	if (!aic->regs) {
+		pr_err("Failed to map WPCM450 AIC registers\n");
+		return -ENOMEM;
+	}
+
+	wpcm450_aic_init_hw();
+
+	set_handle_irq(wpcm450_aic_handle_irq);
+
+	aic->domain =3D irq_domain_add_linear(node, IRQS, &wpcm450_aic_ops, aic)=
;
+
+	return 0;
+}
+
+IRQCHIP_DECLARE(wpcm450_aic, "nuvoton,wpcm450-aic", wpcm450_aic_of_init);
=2D-
2.30.2

