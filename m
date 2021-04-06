Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD5F355353
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 14:12:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF5xg0yyjz304L
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 22:12:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=RaH/JCpV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.22; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=RaH/JCpV; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF5wK4751z3brb
 for <openbmc@lists.ozlabs.org>; Tue,  6 Apr 2021 22:11:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1617711051;
 bh=FYOblBUbHRlSqo0KG/HksG7r9RNT7O0AdZ2/oD/Ognw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=RaH/JCpVSXdwQjn+FNBZ/SQLlrLqpd+q3r505SnLpijrBPCWzMGARAvLue/FEcWm/
 83VA1gUHuDSE6bkFhOQtI7WXhk2NvRmBi1scQnx4Fj94alk4+W+nDe41M/PTOYOORn
 nNq7UK0Ew8wDzcdWtDmUSKYjtr55Mz2IJQIczVOQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRTRN-1lFfVW1NnZ-00NPRq; Tue, 06
 Apr 2021 14:10:51 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v2 06/10] irqchip: Add driver for WPCM450 interrupt controller
Date: Tue,  6 Apr 2021 14:09:17 +0200
Message-Id: <20210406120921.2484986-7-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210406120921.2484986-1-j.neuschaefer@gmx.net>
References: <20210406120921.2484986-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hefIZlOtQ+LbUsf9BJMTwfPpAhYwakBaowyBoCpHN/A5qME7nVV
 rDAsFv0ZibsTdppttyGMkqh81M7g6z9CtYIgiOpTxybu7hPI8crW3LRsZMmA571f8l+IxKw
 vRWo/zEhH0YknrATgoKP6qA5kBVDSBegfDwrOnpaqZLujH5Jt1Llu7BcFmGpthLUrwjFB16
 xKbDnu8zAvDaUV0orGhiQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zwygWbOrTOo=:HtR7OlXL/+jYezqulrWYYL
 ThpapzqeSaNDM3oVxkecDOeWVEkqorKyAU9ye5hXg5pSA3j9kmIlfGwpynZWklNKua8HObrjl
 NvXH6K3EEzIZZStnS3anOUnZv85jH8RyU4P/9ztaBcRooUr8XXjm39JBQtHwk5y6MiCga6ToA
 YqSumWPu2VO1L4odTw+V4qoGx9npaQ9BjLap0DleWKV5o3Si0L9ykflZbCEfxOxkbAoZpOYlz
 s4SXUjRzowamINhZAqPqkYz0OTw7wqydiSIapkTaTMGCXo5RwvS45sY05bV9FRu5mXGTzeuql
 aYEdT6g86mH3f2hUHSfdvnWik7dN8g88p595O8945v8DBS7X7mXJA3B3YpzNK5Mi2FtHguxgl
 V4pz9+TDaxHO0JY/I1OkMA18MEyamVN7CwEqVSc2Zrm34rres19qLHd2V2PQx32bI4qQAElO6
 osibLYsj3JUtEgDIwvMeqYaIJtCkkyTLeUGHc3smpj1kFnP3CvystnhAvfxXgo8IeB0RJb756
 tmkoCwS6mCsfDsGkKuqdIki7sI2ZvvWkJdlFycUOg0a3x4qPrAx7H8pQWLUlqUVmz7WJz7J2x
 9U6EgGHGfbRGChSIXlC+k/hgC9elVaFxvglxt6rRMmLWCdxiZB+gc08c424vcxvKmQoCiEvb6
 O18IU44HxoJvzE2c9vqxixqQVD270d0llT2nVC6sttYEWSnRCuunYHpz3jMASi5f1Go6vBeFk
 FnLinZrL3+lAZxfAmeqTuZcRKDlxaOr7CNIOVfOMXEqlgVjZxeYyeK7s0E3g/BIGNCLFfIowO
 9BYD8Z/GP02BL5iEgbWzQEvHxJVfgHaWIBOCqIKijKbR0qfoAKbMadlXhVMJrTBiOYaIjY0K7
 EAZC2DEw+NWpaF7IruG5UtrcWY9wss/DDXQjtXdSmx5ZMPuYqaWVfI2G3NtxltfixTyF746NV
 Ywqr/TYgQ+mpKAx4M43yDfY5blbObRrG6Sj6/VtYUmXXtdy2Ne6tySPU2j54Idd035TCnlsab
 VJ4HkulU4ZETqTh1NQhE1OYJUpkUAwyRFGerJNqSZVCDCtvF+qMC43JsuznqbqH68cxK9B4nC
 FY693+70sX1H0icDyCRtRm2Ecdc5g5YPW9vzfE5oqYdaVeNqXVV/39T30/y665K3IY5GO1/Jw
 Pnkb3jGAmhFjn9B9BbPdtRBwDH1NTcuFtg6Sf4uUEWjR0AIQfFrmvdj4FY3n8Gx0j+kJ0lFk8
 lk1IAzuPtP441C8CG
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
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>,
 Tali Perry <tali.perry1@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Benjamin Fair <benjaminfair@google.com>
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

v2:
- Rename IRQS macro to AIC_NUM_IRQS
- Fix IRQ range check
- Use linux/printk.h header instead of linux/console.h
- Add AIC_SCR_PRIORITY_MASK constant
- Add missing register descriptions
- Remove superfluous printk about IRQ flow type mismatch
- Use BIT() macro
- Rename _ack function to _eoi for accuracy, and use handle_fasteoi_irq
=2D--
 arch/arm/mach-npcm/Kconfig        |   1 +
 drivers/irqchip/Kconfig           |   6 ++
 drivers/irqchip/Makefile          |   1 +
 drivers/irqchip/irq-wpcm450-aic.c | 161 ++++++++++++++++++++++++++++++
 4 files changed, 169 insertions(+)
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
index 0000000000000..f3ac392d5bc87
=2D-- /dev/null
+++ b/drivers/irqchip/irq-wpcm450-aic.c
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright 2021 Jonathan Neusch=C3=A4fer
+
+#include <linux/irqchip.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/printk.h>
+
+#include <asm/exception.h>
+
+#define AIC_SCR(x)	((x)*4)	/* Source control registers */
+#define AIC_GEN		0x84	/* Interrupt group enable control register */
+#define AIC_GRSR	0x88	/* Interrupt group raw status register */
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
+#define AIC_SCR_PRIORITY_MASK		0x7
+
+#define AIC_NUM_IRQS		32
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
+	for (i =3D 0; i < AIC_NUM_IRQS; i++)
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
+static void wpcm450_aic_eoi(struct irq_data *d)
+{
+	/* Signal end-of-service */
+	writel(0, aic->regs + AIC_EOSCR);
+}
+
+static void wpcm450_aic_mask(struct irq_data *d)
+{
+	unsigned int mask =3D BIT(d->hwirq);
+
+	/* Disable (mask) the interrupt */
+	writel(mask, aic->regs + AIC_MDCR);
+}
+
+static void wpcm450_aic_unmask(struct irq_data *d)
+{
+	unsigned int mask =3D BIT(d->hwirq);
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
+	if ((flow_type & IRQ_TYPE_SENSE_MASK) !=3D IRQ_TYPE_LEVEL_HIGH)
+		return -EINVAL;
+
+	return 0;
+}
+
+static struct irq_chip wpcm450_aic_chip =3D {
+	.name =3D "wpcm450-aic",
+	.irq_eoi =3D wpcm450_aic_eoi,
+	.irq_mask =3D wpcm450_aic_mask,
+	.irq_unmask =3D wpcm450_aic_unmask,
+	.irq_set_type =3D wpcm450_aic_set_type,
+};
+
+static int wpcm450_aic_map(struct irq_domain *d, unsigned int irq, irq_hw=
_number_t hwirq)
+{
+	if (hwirq >=3D AIC_NUM_IRQS)
+		return -EPERM;
+
+	irq_set_chip_and_handler(irq, &wpcm450_aic_chip, handle_fasteoi_irq);
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
+	aic->domain =3D irq_domain_add_linear(node, AIC_NUM_IRQS, &wpcm450_aic_o=
ps, aic);
+
+	return 0;
+}
+
+IRQCHIP_DECLARE(wpcm450_aic, "nuvoton,wpcm450-aic", wpcm450_aic_of_init);
=2D-
2.30.2

