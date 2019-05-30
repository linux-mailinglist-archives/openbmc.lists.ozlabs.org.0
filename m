Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4087305D1
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 02:32:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FQQR6789zDqV9
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 10:32:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ami.com
 (client-ip=63.147.10.42; helo=atlmailgw2.ami.com;
 envelope-from=hongweiz@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ami.com
Received: from atlmailgw2.ami.com (atlmailgw2.ami.com [63.147.10.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FHPD5tWDzDqWH
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 05:16:15 +1000 (AEST)
X-AuditID: ac10606f-0c5ff700000054ce-8c-5cf02bfc3cdc
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id
 D2.D4.21710.CFB20FC5; Thu, 30 May 2019 15:16:12 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 30 May 2019 15:16:10 -0400
From: Hongwei Zhang <hongweiz@ami.com>
To: Joel Stanley <joel@jms.id.au>, <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.0 v1] ARM: dts: aspeed: Add SGPIO driver
Date: Thu, 30 May 2019 15:16:07 -0400
Message-ID: <1559243767-19773-1-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBLMWRmVeSWpSXmKPExsWyRiBhgu4f7Q8xBjOuK1vsusxh8fv8X2aL
 Uy0vWByYPa6272L3uPjxGLPH+RkLGQOYo7hsUlJzMstSi/TtErgyPm6fxVrwexljxYL+E4wN
 jDfaGbsYOTgkBEwkDr0V7mLk4hAS2MUkMb/5NTOEc5hR4vOyQ+xdjJwcbAJqEns3z2ECsUUE
 bCWe7L0MFmcWcJNY92sRI4gtLOAisW3PEjCbRUBVYu+8Y2D1vAIOEs9etrGB2BICchI3z3Uy
 Q8QFJU7OfMICMUdC4uCLF2BxIQFZiVuHHjNB1CtIPO97zDKBkW8WkpZZSFoWMDKtYhRKLMnJ
 TczMSS830kvMzdRLzs/dxAgJr/wdjB8/mh9iFOBgVOLhvaD1IUaINbGsuDL3EKMEB7OSCK/3
 hfcxQrwpiZVVqUX58UWlOanFhxilOViUxHlnhFyOERJITyxJzU5NLUgtgskycXBKNTDutZZf
 4/U7I0ayMfO82pNl3V9ZMjjqb6QaCVsFzcw93Vcw9/upk5WeRxYeecL+KotpsWfqzTuXu5nP
 33+iaBkpx1Ph9XWeTscx39fnFyuy3WtIUdf4efDJk48CZmXb1nNcjXv72a/7oJFJ+cffExh+
 RD87r3Uj7/at8gWry0/F3Yor0/i7YvVTJZbijERDLeai4kQAsw02/ysCAAA=
X-Mailman-Approved-At: Fri, 31 May 2019 10:25:30 +1000
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Hongwei Zhang <hongweiz@ami.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add SGPIO driver support for Aspeed AST2500 board.

Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
---
 arch/arm/boot/dts/aspeed-g5.dtsi           |  16 +
 drivers/gpio/Kconfig                       |   8 +
 drivers/gpio/Makefile                      |   1 +
 drivers/gpio/sgpio-aspeed.c                | 644 +++++++++++++++++++++++++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c |   4 +
 5 files changed, 673 insertions(+)
 create mode 100644 drivers/gpio/sgpio-aspeed.c

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 383510d..88a0f60 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -291,6 +291,17 @@
 				#interrupt-cells = <2>;
 			};
 
+			sgpio: sgpio@1e780200 {
+				#gpio-cells = <2>;
+				gpio-controller;
+				compatible = "aspeed,ast2500-sgpio";
+				reg = <0x1e780200 0x0100>;
+				interrupts = <40>;
+				interrupt-controller;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_sgpm_default>;
+			};
+
 			rtc: rtc@1e781000 {
 				compatible = "aspeed,ast2500-rtc";
 				reg = <0x1e781000 0x18>;
@@ -1394,6 +1405,11 @@
 		groups = "SDA2";
 	};
 
+	pinctrl_sgpm_default: sgpm_default {
+		function = "SGPM";
+		groups = "SGPM";
+	};
+
 	pinctrl_sgps1_default: sgps1_default {
 		function = "SGPS1";
 		groups = "SGPS1";
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 3f50526..d96dbc9 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -124,6 +124,14 @@ config GPIO_ASPEED
 	help
 	  Say Y here to support Aspeed AST2400 and AST2500 GPIO controllers.
 
+config SGPIO_ASPEED
+	bool "ASPEED SGPIO support"
+	depends on ARCH_ASPEED
+	select GPIO_GENERIC
+	select GPIOLIB_IRQCHIP
+	help
+	  Say Y here to support ASPEED SGPIO functionality.
+
 config GPIO_ATH79
 	tristate "Atheros AR71XX/AR724X/AR913X GPIO support"
 	default y if ATH79
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 54d5527..310e5cb 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -33,6 +33,7 @@ obj-$(CONFIG_GPIO_AMDPT)	+= gpio-amdpt.o
 obj-$(CONFIG_GPIO_ARIZONA)	+= gpio-arizona.o
 obj-$(CONFIG_GPIO_ATH79)	+= gpio-ath79.o
 obj-$(CONFIG_GPIO_ASPEED)	+= gpio-aspeed.o
+obj-$(CONFIG_SGPIO_ASPEED)	+= sgpio-aspeed.o
 obj-$(CONFIG_GPIO_RASPBERRYPI_EXP)	+= gpio-raspberrypi-exp.o
 obj-$(CONFIG_GPIO_BCM_KONA)	+= gpio-bcm-kona.o
 obj-$(CONFIG_GPIO_BD9571MWV)	+= gpio-bd9571mwv.o
diff --git a/drivers/gpio/sgpio-aspeed.c b/drivers/gpio/sgpio-aspeed.c
new file mode 100644
index 0000000..9eb3867
--- /dev/null
+++ b/drivers/gpio/sgpio-aspeed.c
@@ -0,0 +1,644 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/gpio/aspeed.h>
+#include <linux/hashtable.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+#include <linux/string.h>
+
+#ifdef ARCH_NR_GPIOS
+#undef ARCH_NR_GPIOS
+#endif
+
+// No of Parallel GPIO in Soc-AST
+#if defined(CONFIG_MACH_ASPEED_G5)	// 232
+#define GPIO_PORT_NUM 29
+#elif defined(CONFIG_MACH_ASPEED_G4)	// 224
+#define GPIO_PORT_NUM 28
+#endif
+
+#define GPIOS_PER_PORT            8
+#define ARCH_NR_GPIOS             (GPIOS_PER_PORT * GPIO_PORT_NUM)
+
+/*
+ * These two headers aren't meant to be used by GPIO drivers. We need
+ * them in order to access gpio_chip_hwgpio() which we need to implement
+ * the aspeed specific API which allows the coprocessor to request
+ * access to some GPIOs and to arbitrate between coprocessor and ARM.
+ */
+#include <linux/gpio/consumer.h>
+#include "gpiolib.h"
+
+struct aspeed_bank_props {
+	unsigned int bank;
+	u32 input;
+	u32 output;
+};
+
+struct aspeed_sgpio_config {
+	unsigned int nr_gpios;
+	const struct aspeed_bank_props *props;
+};
+
+/*
+ * @offset_timer: Maps an offset to an @timer_users index, or zero if disabled
+ * @timer_users: Tracks the number of users for each timer
+ *
+ * The @timer_users has four elements but the first element is unused. This is
+ * to simplify accounting and indexing, as a zero value in @offset_timer
+ * represents disabled debouncing for the GPIO. Any other value for an element
+ * of @offset_timer is used as an index into @timer_users. This behaviour of
+ * the zero value aligns with the behaviour of zero built from the timer
+ * configuration registers (i.e. debouncing is disabled).
+ */
+struct aspeed_sgpio {
+	struct gpio_chip chip;
+	spinlock_t lock;
+	void __iomem *base;
+	int irq;
+	const struct aspeed_sgpio_config *config;
+
+	u32 *dcache;
+};
+
+struct aspeed_sgpio_bank {
+	uint16_t	val_regs;	/* +0: Rd: read input value,
+					 *     Wr: set write latch
+					 * +4: Rd/Wr: Direction (0=in, 1=out)
+					 */
+	uint16_t	rdata_reg;	/*     Rd: read write latch,
+					 *     Wr: <none>
+					 */
+	uint16_t	irq_regs;
+	const char	names[4][3];
+};
+
+/*
+ * Note: The "value" register returns the input value sampled on the
+ *       line even when the GPIO is configured as an output. Since
+ *       that input goes through synchronizers, writing, then reading
+ *       back may not return the written value right away.
+ *
+ *       The "rdata" register returns the content of the write latch
+ *       and thus can be used to read back what was last written
+ *       reliably.
+ */
+
+static const struct aspeed_sgpio_bank aspeed_sgpio_banks[] = {
+	{
+		.val_regs = 0x0000,
+		.rdata_reg = 0x0070,
+		.irq_regs = 0x0004,
+		.names = { "SA", "SB", "SC", "SD" },
+	},
+	{
+		.val_regs = 0x001C,
+		.rdata_reg = 0x0074,
+		.irq_regs = 0x0020,
+		.names = { "SE", "SF", "SG", "SH" },
+	},
+	{
+		.val_regs = 0x0038,
+		.rdata_reg = 0x0078,
+		.irq_regs = 0x003C,
+		.names = { "SI", "SJ" },
+	},
+};
+
+enum aspeed_sgpio_reg {
+	reg_val,
+	reg_rdata,
+	reg_irq_enable,
+	reg_irq_type0,
+	reg_irq_type1,
+	reg_irq_type2,
+	reg_irq_status,
+};
+
+#define GPIO_VAL_VALUE	0x00
+#define GPIO_VAL_DIR	0x04
+#define GPIO_IRQ_ENABLE	0x00
+#define GPIO_IRQ_TYPE0	0x04
+#define GPIO_IRQ_TYPE1	0x08
+#define GPIO_IRQ_TYPE2	0x0c
+#define GPIO_IRQ_STATUS	0x10
+
+/* This will be resolved at compile time */
+static inline void __iomem *bank_reg(struct aspeed_sgpio *gpio,
+				     const struct aspeed_sgpio_bank *bank,
+				     const enum aspeed_sgpio_reg reg)
+{
+	switch (reg) {
+	case reg_val:
+		return gpio->base + bank->val_regs + GPIO_VAL_VALUE;
+	case reg_rdata:
+		return gpio->base + bank->rdata_reg;
+	case reg_irq_enable:
+		return gpio->base + bank->irq_regs + GPIO_IRQ_ENABLE;
+	case reg_irq_type0:
+		return gpio->base + bank->irq_regs + GPIO_IRQ_TYPE0;
+	case reg_irq_type1:
+		return gpio->base + bank->irq_regs + GPIO_IRQ_TYPE1;
+	case reg_irq_type2:
+		return gpio->base + bank->irq_regs + GPIO_IRQ_TYPE2;
+	case reg_irq_status:
+		return gpio->base + bank->irq_regs + GPIO_IRQ_STATUS;
+	}
+	WARN_ON(1);
+}
+
+#define GPIO_BANK(x)	((x) >> 5)
+#define GPIO_OFFSET(x)	((x) & 0x1f)
+#define GPIO_BIT(x)	BIT(GPIO_OFFSET(x))
+
+static const struct aspeed_sgpio_bank *to_bank(unsigned int offset)
+{
+	unsigned int bank = GPIO_BANK(offset);
+
+	WARN_ON(bank >= ARRAY_SIZE(aspeed_sgpio_banks));
+	return &aspeed_sgpio_banks[bank];
+}
+
+static inline bool is_bank_props_sentinel(const struct aspeed_bank_props *props)
+{
+	return !(props->input || props->output);
+}
+
+static inline const struct aspeed_bank_props *find_bank_props(
+		struct aspeed_sgpio *gpio, unsigned int offset)
+{
+	const struct aspeed_bank_props *props = gpio->config->props;
+
+	while (!is_bank_props_sentinel(props)) {
+		if (props->bank == GPIO_BANK(offset))
+			return props;
+		props++;
+	}
+
+	return NULL;
+}
+
+static inline bool have_gpio(struct aspeed_sgpio *gpio, unsigned int offset)
+{
+	const struct aspeed_bank_props *props = find_bank_props(gpio, offset);
+	const struct aspeed_sgpio_bank *bank = to_bank(offset);
+	unsigned int group = GPIO_OFFSET(offset) / 8;
+
+	return bank->names[group][0] != '\0' &&
+		(!props || ((props->input | props->output) & GPIO_BIT(offset)));
+}
+
+static inline bool have_input(struct aspeed_sgpio *gpio, unsigned int offset)
+{
+	const struct aspeed_bank_props *props = find_bank_props(gpio, offset);
+
+	return !props || (props->input & GPIO_BIT(offset));
+}
+
+#define have_irq(g, o) have_input((g), (o))
+
+static inline bool have_output(struct aspeed_sgpio *gpio, unsigned int offset)
+{
+	const struct aspeed_bank_props *props = find_bank_props(gpio, offset);
+
+	return !props || (props->output & GPIO_BIT(offset));
+}
+
+static int aspeed_sgpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
+	const struct aspeed_sgpio_bank *bank = to_bank(offset);
+
+	return !!(ioread32(bank_reg(gpio, bank, reg_val)) & GPIO_BIT(offset));
+}
+
+static void __aspeed_sgpio_set(struct gpio_chip *gc, unsigned int offset,
+			      int val)
+{
+	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
+	const struct aspeed_sgpio_bank *bank = to_bank(offset);
+	void __iomem *addr;
+	u32 reg;
+
+	addr = bank_reg(gpio, bank, reg_val);
+	reg = gpio->dcache[GPIO_BANK(offset)];
+
+	if (val)
+		reg |= GPIO_BIT(offset);
+	else
+		reg &= ~GPIO_BIT(offset);
+	gpio->dcache[GPIO_BANK(offset)] = reg;
+
+	iowrite32(reg, addr);
+}
+
+static void aspeed_sgpio_set(struct gpio_chip *gc, unsigned int offset,
+			    int val)
+{
+	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
+	unsigned long flags;
+
+	spin_lock_irqsave(&gpio->lock, flags);
+
+	__aspeed_sgpio_set(gc, offset, val);
+
+	spin_unlock_irqrestore(&gpio->lock, flags);
+}
+
+static int aspeed_sgpio_dir_in(struct gpio_chip *gc, unsigned int offset)
+{
+	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
+
+	if (!have_input(gpio, offset))
+		return -ENOTSUPP;
+
+	return 0;
+}
+
+static int aspeed_sgpio_dir_out(struct gpio_chip *gc,
+			       unsigned int offset, int val)
+{
+	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
+
+	if (!have_output(gpio, offset))
+		return -ENOTSUPP;
+
+	return 0;
+}
+
+static int aspeed_sgpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
+
+	if (!have_input(gpio, offset))
+		return 0;
+
+	if (!have_output(gpio, offset))
+		return 1;
+
+	return 1;
+
+}
+
+static inline int irqd_to_aspeed_sgpio_data(struct irq_data *d,
+					   struct aspeed_sgpio **gpio,
+					   const struct aspeed_sgpio_bank **bank,
+					   u32 *bit, int *offset)
+{
+	struct aspeed_sgpio *internal;
+
+	*offset = irqd_to_hwirq(d);
+
+	internal = irq_data_get_irq_chip_data(d);
+
+	/* This might be a bit of a questionable place to check */
+	if (!have_irq(internal, *offset))
+		return -ENOTSUPP;
+
+	*gpio = internal;
+	*bank = to_bank(*offset);
+	*bit = GPIO_BIT(*offset);
+
+	return 0;
+}
+
+static void aspeed_sgpio_irq_ack(struct irq_data *d)
+{
+	const struct aspeed_sgpio_bank *bank;
+	struct aspeed_sgpio *gpio;
+	unsigned long flags;
+	void __iomem *status_addr;
+	int rc, offset;
+	u32 bit;
+
+	rc = irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset);
+	if (rc)
+		return;
+
+	status_addr = bank_reg(gpio, bank, reg_irq_status);
+
+	spin_lock_irqsave(&gpio->lock, flags);
+
+	iowrite32(bit, status_addr);
+
+	spin_unlock_irqrestore(&gpio->lock, flags);
+}
+
+static void aspeed_sgpio_irq_set_mask(struct irq_data *d, bool set)
+{
+	const struct aspeed_sgpio_bank *bank;
+	struct aspeed_sgpio *gpio;
+	unsigned long flags;
+	u32 reg, bit;
+	void __iomem *addr;
+	int rc, offset;
+
+	rc = irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset);
+	if (rc)
+		return;
+
+	addr = bank_reg(gpio, bank, reg_irq_enable);
+
+	spin_lock_irqsave(&gpio->lock, flags);
+
+	reg = ioread32(addr);
+	if (set)
+		reg |= bit;
+	else
+		reg &= ~bit;
+
+	iowrite32(reg, addr);
+
+	spin_unlock_irqrestore(&gpio->lock, flags);
+}
+
+static void aspeed_sgpio_irq_mask(struct irq_data *d)
+{
+	aspeed_sgpio_irq_set_mask(d, false);
+}
+
+static void aspeed_sgpio_irq_unmask(struct irq_data *d)
+{
+	aspeed_sgpio_irq_set_mask(d, true);
+}
+
+static int aspeed_sgpio_set_type(struct irq_data *d, unsigned int type)
+{
+	u32 type0 = 0;
+	u32 type1 = 0;
+	u32 type2 = 0;
+	u32 bit, reg;
+	const struct aspeed_sgpio_bank *bank;
+	irq_flow_handler_t handler;
+	struct aspeed_sgpio *gpio;
+	unsigned long flags;
+	void __iomem *addr;
+	int rc, offset;
+
+	rc = irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset);
+	if (rc)
+		return -EINVAL;
+
+	switch (type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_EDGE_BOTH:
+		type2 |= bit;
+		/* fall through */
+	case IRQ_TYPE_EDGE_RISING:
+		type0 |= bit;
+		/* fall through */
+	case IRQ_TYPE_EDGE_FALLING:
+		handler = handle_edge_irq;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		type0 |= bit;
+		/* fall through */
+	case IRQ_TYPE_LEVEL_LOW:
+		type1 |= bit;
+		handler = handle_level_irq;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	spin_lock_irqsave(&gpio->lock, flags);
+
+	addr = bank_reg(gpio, bank, reg_irq_type0);
+	reg = ioread32(addr);
+	reg = (reg & ~bit) | type0;
+	iowrite32(reg, addr);
+
+	addr = bank_reg(gpio, bank, reg_irq_type1);
+	reg = ioread32(addr);
+	reg = (reg & ~bit) | type1;
+	iowrite32(reg, addr);
+
+	addr = bank_reg(gpio, bank, reg_irq_type2);
+	reg = ioread32(addr);
+	reg = (reg & ~bit) | type2;
+	iowrite32(reg, addr);
+
+	spin_unlock_irqrestore(&gpio->lock, flags);
+
+	irq_set_handler_locked(d, handler);
+
+	return 0;
+}
+
+static void aspeed_sgpio_irq_handler(struct irq_desc *desc)
+{
+	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
+	struct irq_chip *ic = irq_desc_get_chip(desc);
+	struct aspeed_sgpio *data = gpiochip_get_data(gc);
+	unsigned int i, p, girq;
+	unsigned long reg;
+
+	chained_irq_enter(ic, desc);
+
+	for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
+		const struct aspeed_sgpio_bank *bank = &aspeed_sgpio_banks[i];
+
+		reg = ioread32(bank_reg(data, bank, reg_irq_status));
+
+		for_each_set_bit(p, &reg, 32) {
+			girq = irq_find_mapping(gc->irq.domain, i * 32 + p);
+			generic_handle_irq(girq);
+		}
+
+	}
+
+	chained_irq_exit(ic, desc);
+}
+
+static struct irq_chip aspeed_sgpio_irqchip = {
+	.name		= "aspeed-sgpio",
+	.irq_ack	= aspeed_sgpio_irq_ack,
+	.irq_mask	= aspeed_sgpio_irq_mask,
+	.irq_unmask	= aspeed_sgpio_irq_unmask,
+	.irq_set_type	= aspeed_sgpio_set_type,
+};
+
+static void set_irq_valid_mask(struct aspeed_sgpio *gpio)
+{
+	const struct aspeed_bank_props *props = gpio->config->props;
+
+	while (!is_bank_props_sentinel(props)) {
+		unsigned int offset;
+		const unsigned long int input = props->input;
+
+		/* Pretty crummy approach, but similar to GPIO core */
+		for_each_clear_bit(offset, &input, 32) {
+			unsigned int i = props->bank * 32 + offset;
+
+			if (i >= gpio->config->nr_gpios)
+				break;
+
+			clear_bit(i, gpio->chip.irq.valid_mask);
+		}
+
+		props++;
+	}
+}
+
+static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
+		struct platform_device *pdev)
+{
+	int rc, i;
+	const struct aspeed_sgpio_bank *bank;
+
+	rc = platform_get_irq(pdev, 0);
+	if (rc < 0)
+		return rc;
+
+	gpio->irq = rc;
+
+	set_irq_valid_mask(gpio);
+
+	// Disable IRQ and clear Interrupt status registers for all SPGIO Pins.
+	//for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
+	for (i = 0; i < 1; i++) {
+		bank =  &aspeed_sgpio_banks[i];
+
+		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_enable));	// disable irq enable bits.
+		iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_status));	// clear status bits.
+	}
+
+	rc = gpiochip_irqchip_add(&gpio->chip, &aspeed_sgpio_irqchip,
+			0, handle_bad_irq, IRQ_TYPE_NONE);
+	if (rc) {
+		dev_info(&pdev->dev, "Could not add irqchip\n");
+		return rc;
+	}
+
+	gpiochip_set_chained_irqchip(&gpio->chip, &aspeed_sgpio_irqchip,
+				     gpio->irq, aspeed_sgpio_irq_handler);
+
+	//set IRQ settings and Enable Interrupt
+	for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
+		bank = &aspeed_sgpio_banks[i];
+
+		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type0));		// set Rising or high.
+		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type1));		// trigger type is edge
+		iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_type2));		// dual edge trigger mode.
+		iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_enable));	// enable irq
+	}
+
+	return 0;
+}
+
+static int aspeed_sgpio_request(struct gpio_chip *chip, unsigned int offset)
+{
+	if (!have_gpio(gpiochip_get_data(chip), offset))
+		return -ENODEV;
+
+	return 0;
+}
+
+static void aspeed_sgpio_free(struct gpio_chip *chip, unsigned int offset)
+{	// do nothing.
+}
+
+/*
+ * Any banks not specified in a struct aspeed_bank_props array are assumed to
+ * have the properties:
+ *
+ *     { .input = 0xffffffff, .output = 0xffffffff }
+ */
+
+static const struct aspeed_bank_props ast2500_bank_props[] = {
+	/*     input	  output   */
+	{ 1, 0xffffffff, 0xffffffff }, /* A/B/C/D */
+	{ 2, 0xffffffff, 0xffffffff }, /* E/F/G/H */
+	{ 3, 0x0000ffff, 0x0000ffff }, /* I/J */
+	{ },
+};
+
+static const struct aspeed_sgpio_config ast_config =
+	/* 96 for simplicity, actual number is 80 */
+	{ .nr_gpios = 96, .props = ast2500_bank_props, };
+
+static const struct of_device_id aspeed_sgpio_of_table[] = {
+	{ .compatible = "aspeed,ast2400-sgpio", .data = &ast_config, },
+	{ .compatible = "aspeed,ast2500-sgpio", .data = &ast_config, },
+	{}
+};
+MODULE_DEVICE_TABLE(of, aspeed_sgpio_of_table);
+
+static int __init aspeed_sgpio_probe(struct platform_device *pdev)
+{
+	const struct of_device_id *gpio_id;
+	struct aspeed_sgpio *gpio;
+	struct resource *res;
+	int rc, i, banks;
+
+	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
+	if (!gpio)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	gpio->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(gpio->base))
+		return PTR_ERR(gpio->base);
+
+	spin_lock_init(&gpio->lock);
+
+	gpio_id = of_match_node(aspeed_sgpio_of_table, pdev->dev.of_node);
+	if (!gpio_id)
+		return -EINVAL;
+
+	gpio->config = gpio_id->data;
+
+	gpio->chip.parent = &pdev->dev;
+	gpio->chip.ngpio = gpio->config->nr_gpios;
+
+	gpio->chip.direction_input = aspeed_sgpio_dir_in;
+	gpio->chip.direction_output = aspeed_sgpio_dir_out;
+	gpio->chip.get_direction = aspeed_sgpio_get_direction;
+	gpio->chip.request = aspeed_sgpio_request;
+	gpio->chip.free = aspeed_sgpio_free;
+	gpio->chip.get = aspeed_sgpio_get;
+	gpio->chip.set = aspeed_sgpio_set;
+	gpio->chip.set_config = NULL;
+	gpio->chip.label = dev_name(&pdev->dev);
+	gpio->chip.base = ARCH_NR_GPIOS;
+	gpio->chip.irq.need_valid_mask = true;
+
+	/* Allocate a cache of the output registers */
+	banks = gpio->config->nr_gpios >> 5;
+
+	gpio->dcache = devm_kcalloc(&pdev->dev,
+				    banks, sizeof(u32), GFP_KERNEL);
+
+	if (!gpio->dcache)
+		return -ENOMEM;
+
+	rc = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
+	if (rc < 0)
+		return rc;
+
+	return aspeed_sgpio_setup_irqs(gpio, pdev);
+}
+
+static struct platform_driver aspeed_sgpio_driver = {
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = aspeed_sgpio_of_table,
+	},
+};
+
+module_platform_driver_probe(aspeed_sgpio_driver, aspeed_sgpio_probe);
+
+MODULE_DESCRIPTION("Aspeed Serial GPIO Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 187abd7..0c89647 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -577,6 +577,8 @@ SS_PIN_DECL(N3, GPIOJ2, SGPMO);
 SIG_EXPR_LIST_DECL_SINGLE(SGPMI, SGPM, SIG_DESC_SET(SCU84, 11));
 SS_PIN_DECL(N4, GPIOJ3, SGPMI);
 
+FUNC_GROUP_DECL(SGPM, R2, L2, N3, N4);
+
 #define N5 76
 SIG_EXPR_LIST_DECL_SINGLE(VGAHS, VGAHS, SIG_DESC_SET(SCU84, 12));
 SIG_EXPR_LIST_DECL_SINGLE(DASHN5, DASHN5, SIG_DESC_SET(SCU94, 8));
@@ -2127,6 +2129,7 @@ static const struct aspeed_pin_group aspeed_g5_groups[] = {
 	ASPEED_PINCTRL_GROUP(SD2),
 	ASPEED_PINCTRL_GROUP(SDA1),
 	ASPEED_PINCTRL_GROUP(SDA2),
+	ASPEED_PINCTRL_GROUP(SGPM),
 	ASPEED_PINCTRL_GROUP(SGPS1),
 	ASPEED_PINCTRL_GROUP(SGPS2),
 	ASPEED_PINCTRL_GROUP(SIOONCTRL),
@@ -2296,6 +2299,7 @@ static const struct aspeed_pin_function aspeed_g5_functions[] = {
 	ASPEED_PINCTRL_FUNC(SD2),
 	ASPEED_PINCTRL_FUNC(SDA1),
 	ASPEED_PINCTRL_FUNC(SDA2),
+	ASPEED_PINCTRL_FUNC(SGPM),
 	ASPEED_PINCTRL_FUNC(SGPS1),
 	ASPEED_PINCTRL_FUNC(SGPS2),
 	ASPEED_PINCTRL_FUNC(SIOONCTRL),
-- 
2.7.4

