Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B82F4D9052
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 00:26:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHXjr2wb3z30Lq
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 10:26:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jC9fe38x;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=jim.t90615@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jC9fe38x; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFG285NVHz2yLg
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 17:17:52 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id g1so7105259pfv.1
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2022 22:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=npnhPa4F4dpAeLhC/6t5St4ImcPuLXiS6APM0jcnbRA=;
 b=jC9fe38xIEEylCpVDeqZd+xbj0KcQPtjQ7VCHYmenoUXKLoAjfm+dCCs9Gv02aeTgT
 wYNtfZCNotluCmwfrp7LvzdIgZGDvpE5aJ2ud19vldm7PRNY4hEE3VM9lqCoQ6liJdRh
 TPrAVYrhEvRueOryrW86nfv8VYvVx36SpPYu1zCiwqoySXoiXYte9QD33K58XIB/jb3g
 bzkef06EbMIDBJlXVdvA1A62tfuI7SHRLu6ApQxzx8HjKBesd/u78VwSw/M6qCwYp9Yr
 UFvYCSOlqypP3FR/Le30r0iqxIuAByudDsauSebpzqveCD+iYgHqGHrsSFVhaPZLZli8
 Nrrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=npnhPa4F4dpAeLhC/6t5St4ImcPuLXiS6APM0jcnbRA=;
 b=7Siv3XS8428HayaPJRNCwsduPf1EsLWE73wQ1QNZYilXVW0GILrg8lCVpxtSgVr3W2
 hZ90qCXr0i9/sPT7BzikiYAlfdckRq51hKAm8VcfwJQSX+vZVeVdIQbw45y0s105I18U
 Pmmm2bIeMZNAZ1QVeVBSet+J2KYog4QR+n2NxsmXWD70Vzd999OvKS1lBYFkPlw3YI8n
 VQlV4PPXPnKWF8KW0AhzU9kC8NogUBcEJIHsRLrDD57YmLNgvp0qnBo2tMf9LKZMfkyS
 NmNTSLpU8chlK68LcGs9lhWDkt3fKE2m3+pWadeGVeeyy0I++zhKVxl2bYr8yvpHuP0i
 S7rg==
X-Gm-Message-State: AOAM533tAX0v4FYAswHW9874fmeBnMRegBPUm8Mp+xq0tyUwbTKS5Vhc
 344p533ZutmOS04PoX0GTtE=
X-Google-Smtp-Source: ABdhPJzZNUfDmVxGHLXUW8ADqq0lkojmviv/QWBtQVyudsASd9aBaOcmGUynoa4KzNaJgag+rhlcbA==
X-Received: by 2002:a05:6a00:ccd:b0:4f6:f6fb:d2b with SMTP id
 b13-20020a056a000ccd00b004f6f6fb0d2bmr8707152pfv.59.1646979470428; 
 Thu, 10 Mar 2022 22:17:50 -0800 (PST)
Received: from localhost.localdomain ([116.89.135.255])
 by smtp.gmail.com with ESMTPSA id
 d20-20020a056a0010d400b004f7093700c4sm9101764pfu.76.2022.03.10.22.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 22:17:50 -0800 (PST)
From: jimliu2 <jim.t90615@gmail.com>
X-Google-Original-From: jimliu2 <JJLIU0@nuvoton.com>
To: JJLIU0@nuvoton.com, KWLIU@nuvoton.com, linus.walleij@linaro.org,
 brgl@bgdev.pl, robh+dt@kernel.org, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, jim.t90615@gmail.com,
 CTCCHIEN@nuvoton.com
Subject: [PATCH v1 3/3] gpio:gpio-npcm-sgpio: Add Nuvoton sgpio driver
Date: Fri, 11 Mar 2022 14:09:36 +0800
Message-Id: <20220311060936.10663-4-JJLIU0@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220311060936.10663-1-JJLIU0@nuvoton.com>
References: <20220311060936.10663-1-JJLIU0@nuvoton.com>
X-Mailman-Approved-At: Tue, 15 Mar 2022 10:24:35 +1100
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add Nuvoton sgpio driver and add config to Kconfig/Makefile

Signed-off-by: jimliu2 <JJLIU0@nuvoton.com>
---
 drivers/gpio/Kconfig           |  12 +
 drivers/gpio/Makefile          |   1 +
 drivers/gpio/gpio-npcm-sgpio.c | 634 +++++++++++++++++++++++++++++++++
 3 files changed, 647 insertions(+)
 create mode 100644 drivers/gpio/gpio-npcm-sgpio.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 1c211b4c63be..f4d97016d184 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1575,6 +1575,18 @@ config GPIO_SODAVILLE
 
 endmenu
 
+config GPIO_NUVOTON_SGPIO
+	bool "Nuvoton SGPIO support"
+	depends on (ARCH_NPCM || COMPILE_TEST) && OF_GPIO
+	select GPIO_GENERIC
+	select GPIOLIB_IRQCHIP
+	help
+	  Say Y here to support Nuvoton NPCM7XX/NPCM8XX SGPIO functionality.
+	  If unsure, say N.
+	  NPCM7XX/NPCM8XX can use same serial GPIO driver.
+	  NPCM7XX/NPCM8XX includes two SGPIO modules, SIOX1 ans SIOX2 are
+	  under BMC control.
+
 menu "SPI GPIO expanders"
 	depends on SPI_MASTER
 
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index edbaa3cb343c..109c4a5c845b 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -106,6 +106,7 @@ obj-$(CONFIG_GPIO_MT7621)		+= gpio-mt7621.o
 obj-$(CONFIG_GPIO_MVEBU)		+= gpio-mvebu.o
 obj-$(CONFIG_GPIO_MXC)			+= gpio-mxc.o
 obj-$(CONFIG_GPIO_MXS)			+= gpio-mxs.o
+obj-$(CONFIG_GPIO_NUVOTON_SGPIO)	+= gpio-npcm-sgpio.o
 obj-$(CONFIG_GPIO_OCTEON)		+= gpio-octeon.o
 obj-$(CONFIG_GPIO_OMAP)			+= gpio-omap.o
 obj-$(CONFIG_GPIO_PALMAS)		+= gpio-palmas.o
diff --git a/drivers/gpio/gpio-npcm-sgpio.c b/drivers/gpio/gpio-npcm-sgpio.c
new file mode 100644
index 000000000000..e8c13dd51564
--- /dev/null
+++ b/drivers/gpio/gpio-npcm-sgpio.c
@@ -0,0 +1,634 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NPCM Serial GPIO Driver
+ *
+ * Copyright (C) 2021 Nuvoton Technologies
+ */
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/gpio/driver.h>
+#include <linux/hashtable.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+#include <linux/string.h>
+
+#define MAX_NR_HW_SGPIO			64
+
+#define  IOXCFG1 0x2A
+#define  IOXCFG1_SFT_CLK GENMASK(3, 0)
+#define  IOXCFG1_SCLK_POL BIT(4)
+#define  IOXCFG1_LDSH_POL BIT(5)
+
+#define  IOXCTS 0x28
+#define  IOXCTS_IOXIF_EN BIT(7)
+#define  IOXCTS_RD_MODE GENMASK(2, 1)
+#define  IOXCTS_RD_MODE_PERIODIC BIT(2)
+#define  IOXCTS_RD_MODE_CONTINUOUS GENMASK(2, 1)
+
+#define  IOXCFG2 0x2B
+#define  IXOEVCFG_MASK 0x3
+#define  IXOEVCFG_BOTH 0x3
+#define  IXOEVCFG_FALLING 0x2
+#define  IXOEVCFG_RISING 0x1
+
+#define GPIO_BANK(x)    ((x) / 8)
+#define GPIO_BIT(x)     ((x) % 8)
+
+/*
+ * Slect the freqency of shift clock.
+ * The shift clock is a division of the APB clock.
+ */
+struct npcm_clk_cfg {
+	const int *SFT_CLK;
+	const u8 *CLK_SEL;
+	const u8 cfg_opt;
+};
+
+struct npcm_sgpio {
+	struct gpio_chip chip;
+	struct clk *pclk;
+	struct irq_chip intc;
+	spinlock_t lock; /*protect event config*/
+	void __iomem *base;
+	int irq;
+	u8 nin_sgpio;
+	u8 nout_sgpio;
+	u8 in_port;
+	u8 out_port;
+	u8 int_type[MAX_NR_HW_SGPIO];
+};
+
+struct npcm_sgpio_bank {
+	u8	rdata_reg;
+	u8	wdata_reg;
+	u8	event_config;
+	u8	event_status;
+};
+
+enum npcm_sgpio_reg {
+	read_data,
+	write_data,
+	event_cfg,
+	event_sts,
+};
+
+static const struct npcm_sgpio_bank npcm_sgpio_banks[] = {
+	{
+		.wdata_reg = 0x00,
+		.rdata_reg = 0x08,
+		.event_config = 0x10,
+		.event_status = 0x20,
+	},
+	{
+		.wdata_reg = 0x01,
+		.rdata_reg = 0x09,
+		.event_config = 0x12,
+		.event_status = 0x21,
+	},
+	{
+		.wdata_reg = 0x02,
+		.rdata_reg = 0x0a,
+		.event_config = 0x14,
+		.event_status = 0x22,
+	},
+	{
+		.wdata_reg = 0x03,
+		.rdata_reg = 0x0b,
+		.event_config = 0x16,
+		.event_status = 0x23,
+	},
+	{
+		.wdata_reg = 0x04,
+		.rdata_reg = 0x0c,
+		.event_config = 0x18,
+		.event_status = 0x24,
+	},
+	{
+		.wdata_reg = 0x05,
+		.rdata_reg = 0x0d,
+		.event_config = 0x1a,
+		.event_status = 0x25,
+	},
+	{
+		.wdata_reg = 0x06,
+		.rdata_reg = 0x0e,
+		.event_config = 0x1c,
+		.event_status = 0x26,
+	},
+	{
+		.wdata_reg = 0x07,
+		.rdata_reg = 0x0f,
+		.event_config = 0x1e,
+		.event_status = 0x27,
+	},
+
+};
+
+static void __iomem *bank_reg(struct npcm_sgpio *gpio,
+			      const struct npcm_sgpio_bank *bank,
+				const enum npcm_sgpio_reg reg)
+{
+	switch (reg) {
+	case read_data:
+		return gpio->base + bank->rdata_reg;
+	case write_data:
+		return gpio->base + bank->wdata_reg;
+	case event_cfg:
+		return gpio->base + bank->event_config;
+	case event_sts:
+		return gpio->base + bank->event_status;
+	default:
+		/* acturally if code runs to here, it's an error case */
+		BUG();
+	}
+}
+
+static const struct npcm_sgpio_bank *to_bank(unsigned int offset)
+{
+	unsigned int bank = GPIO_BANK(offset);
+
+	return &npcm_sgpio_banks[bank];
+}
+
+static void irqd_to_npcm_sgpio_data(struct irq_data *d,
+				    struct npcm_sgpio **gpio,
+				    const struct npcm_sgpio_bank **bank,
+				    u8 *bit, int *offset)
+{
+	struct npcm_sgpio *internal;
+
+	*offset = irqd_to_hwirq(d);
+	internal = irq_data_get_irq_chip_data(d);
+	WARN_ON(!internal);
+
+	*gpio = internal;
+	*offset -= internal->nout_sgpio;
+	*bank = to_bank(*offset);
+	*bit = GPIO_BIT(*offset);
+}
+
+static int npcm_sgpio_init_valid_mask(struct gpio_chip *gc,
+				      unsigned long *valid_mask, unsigned int ngpios)
+{
+	struct npcm_sgpio *gpio = gpiochip_get_data(gc);
+	u8 in_port, out_port, set_port;
+
+	in_port = gpio->nin_sgpio / 8;
+	if (gpio->nin_sgpio % 8 > 0)
+		in_port += 1;
+
+	out_port = gpio->nout_sgpio / 8;
+	if (gpio->nout_sgpio % 8 > 0)
+		out_port += 1;
+
+	gpio->in_port = in_port;
+	gpio->out_port = out_port;
+	set_port = ((out_port & 0xf) << 4) | (in_port & 0xf);
+	iowrite8(set_port, gpio->base + IOXCFG2);
+
+	return 0;
+}
+
+static int npcm_sgpio_dir_in(struct gpio_chip *gc, unsigned int offset)
+{
+	struct npcm_sgpio *gpio = gpiochip_get_data(gc);
+
+	if (offset < gpio->nout_sgpio)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int npcm_sgpio_dir_out(struct gpio_chip *gc, unsigned int offset, int val)
+{
+	struct npcm_sgpio *gpio = gpiochip_get_data(gc);
+
+	if (offset < gpio->nout_sgpio) {
+		gc->set(gc, offset, val);
+		return 0;
+	}
+	return -EINVAL;
+}
+
+static int npcm_sgpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct npcm_sgpio *gpio = gpiochip_get_data(gc);
+
+	if (offset < gpio->nout_sgpio)
+		return 0;
+	return 1;
+}
+
+static void npcm_sgpio_set(struct gpio_chip *gc, unsigned int offset, int val)
+{
+	struct npcm_sgpio *gpio = gpiochip_get_data(gc);
+	const struct  npcm_sgpio_bank *bank = to_bank(offset);
+	void __iomem *addr;
+	u8 reg = 0;
+
+	addr = bank_reg(gpio, bank, write_data);
+	reg = ioread8(addr);
+
+	if (val) {
+		reg |= (val << GPIO_BIT(offset));
+		iowrite8(reg, addr);
+	} else {
+		reg &= ~(1 << GPIO_BIT(offset));
+		iowrite8(reg, addr);
+	}
+}
+
+static int npcm_sgpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct npcm_sgpio *gpio = gpiochip_get_data(gc);
+	const struct  npcm_sgpio_bank *bank;
+	void __iomem *addr;
+	u8 dir, reg;
+
+	dir = npcm_sgpio_get_direction(gc, offset);
+	if (dir == 0) {
+		bank = to_bank(offset);
+
+		addr = bank_reg(gpio, bank, write_data);
+		reg = ioread8(addr);
+		reg = (reg >> GPIO_BIT(offset)) & 0x01;
+	} else {
+		offset -= gpio->nout_sgpio;
+		bank = to_bank(offset);
+
+		addr = bank_reg(gpio, bank, read_data);
+		reg = ioread8(addr);
+		reg = (reg >> GPIO_BIT(offset)) & 0x01;
+	}
+
+	return reg;
+}
+
+static void npcm_sgpio_setup_enable(struct npcm_sgpio *gpio, bool enable)
+{
+	u8 reg = 0;
+
+	reg = ioread8(gpio->base + IOXCTS);
+	reg = reg & ~IOXCTS_RD_MODE;
+	reg = reg | IOXCTS_RD_MODE_PERIODIC;
+
+	if (enable) {
+		reg |= IOXCTS_IOXIF_EN;
+		iowrite8(reg, gpio->base + IOXCTS);
+	} else {
+		reg &= ~IOXCTS_IOXIF_EN;
+		iowrite8(reg, gpio->base + IOXCTS);
+	}
+}
+
+static int npcm_sgpio_setup_clk(struct npcm_sgpio *gpio,
+				const struct npcm_clk_cfg *clk_cfg, u32 sgpio_freq)
+{
+	unsigned long apb_freq;
+	u32 sgpio_clk_div;
+	u8 tmp;
+	int i;
+
+	apb_freq = clk_get_rate(gpio->pclk);
+	sgpio_clk_div = (apb_freq / sgpio_freq);
+	if ((apb_freq % sgpio_freq) != 0)
+		sgpio_clk_div += 1;
+
+	tmp = ioread8(gpio->base + IOXCFG1) & ~IOXCFG1_SFT_CLK;
+
+	for (i = 0; i < clk_cfg->cfg_opt; i++) {
+		if (sgpio_clk_div >= clk_cfg->SFT_CLK[i]) {
+			iowrite8(clk_cfg->CLK_SEL[i] | tmp, gpio->base + IOXCFG1);
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static void npcm_sgpio_irq_init_valid_mask(struct gpio_chip *gc,
+					   unsigned long *valid_mask, unsigned int ngpios)
+{
+	struct npcm_sgpio *gpio = gpiochip_get_data(gc);
+	int n = gpio->nin_sgpio;
+
+	/* input GPIOs in the high range */
+	bitmap_set(valid_mask, gpio->nout_sgpio, n);
+	bitmap_clear(valid_mask, 0, gpio->nout_sgpio);
+}
+
+static void npcm_sgpio_irq_set_mask(struct irq_data *d, bool set)
+{
+	const struct npcm_sgpio_bank *bank;
+	struct npcm_sgpio *gpio;
+	unsigned long flags;
+	void __iomem *addr;
+	int offset;
+	u16 reg, type;
+	u8 bit;
+
+	irqd_to_npcm_sgpio_data(d, &gpio, &bank, &bit, &offset);
+	addr = bank_reg(gpio, bank, event_cfg);
+
+	spin_lock_irqsave(&gpio->lock, flags);
+
+	npcm_sgpio_setup_enable(gpio, false);
+
+	reg = ioread16(addr);
+	if (set) {
+		reg &= ~(IXOEVCFG_MASK << (bit * 2));
+	} else {
+		type = gpio->int_type[offset];
+		reg |= (type << (bit * 2));
+	}
+
+	iowrite16(reg, addr);
+
+	npcm_sgpio_setup_enable(gpio, true);
+
+	addr = bank_reg(gpio, bank, event_sts);
+	reg = ioread8(addr);
+	reg |= BIT(bit);
+	iowrite8(reg, addr);
+
+	spin_unlock_irqrestore(&gpio->lock, flags);
+}
+
+static void npcm_sgpio_irq_ack(struct irq_data *d)
+{
+	const struct npcm_sgpio_bank *bank;
+	struct npcm_sgpio *gpio;
+	unsigned long flags;
+	void __iomem *status_addr;
+	int offset;
+	u8 bit;
+
+	irqd_to_npcm_sgpio_data(d, &gpio, &bank, &bit, &offset);
+	status_addr = bank_reg(gpio, bank, event_sts);
+	spin_lock_irqsave(&gpio->lock, flags);
+	iowrite8(BIT(bit), status_addr);
+	spin_unlock_irqrestore(&gpio->lock, flags);
+}
+
+static void npcm_sgpio_irq_mask(struct irq_data *d)
+{
+	npcm_sgpio_irq_set_mask(d, true);
+}
+
+static void npcm_sgpio_irq_unmask(struct irq_data *d)
+{
+	npcm_sgpio_irq_set_mask(d, false);
+}
+
+static int npcm_sgpio_set_type(struct irq_data *d, unsigned int type)
+{
+	const struct npcm_sgpio_bank *bank;
+	irq_flow_handler_t handler;
+	struct npcm_sgpio *gpio;
+	unsigned long flags;
+	void __iomem *addr;
+	int offset;
+	u16 reg, val;
+	u8 bit;
+
+	irqd_to_npcm_sgpio_data(d, &gpio, &bank, &bit, &offset);
+
+	switch (type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_EDGE_BOTH:
+		val = IXOEVCFG_BOTH;
+		handler = handle_edge_irq;
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		val = IXOEVCFG_RISING;
+		handler = handle_edge_irq;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		val = IXOEVCFG_FALLING;
+		handler = handle_edge_irq;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		val = IXOEVCFG_RISING;
+		handler = handle_level_irq;
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		val = IXOEVCFG_FALLING;
+		handler = handle_level_irq;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	gpio->int_type[offset] = val;
+
+	spin_lock_irqsave(&gpio->lock, flags);
+	npcm_sgpio_setup_enable(gpio, false);
+	addr = bank_reg(gpio, bank, event_cfg);
+	reg = ioread16(addr);
+
+	reg |= (val << (bit * 2));
+
+	iowrite16(reg, addr);
+	npcm_sgpio_setup_enable(gpio, true);
+	spin_unlock_irqrestore(&gpio->lock, flags);
+
+	irq_set_handler_locked(d, handler);
+
+	return 0;
+}
+
+static void npcm_sgpio_irq_handler(struct irq_desc *desc)
+{
+	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
+	struct irq_chip *ic = irq_desc_get_chip(desc);
+	struct npcm_sgpio *gpio = gpiochip_get_data(gc);
+	unsigned int i, j, girq;
+	unsigned long reg;
+
+	chained_irq_enter(ic, desc);
+
+	for (i = 0; i < ARRAY_SIZE(npcm_sgpio_banks); i++) {
+		const struct npcm_sgpio_bank *bank = &npcm_sgpio_banks[i];
+
+		reg = ioread8(bank_reg(gpio, bank, event_sts));
+		for_each_set_bit(j, &reg, 8) {
+			girq = irq_find_mapping(gc->irq.domain, i * 8 + gpio->nout_sgpio + j);
+			generic_handle_irq(girq);
+		}
+	}
+
+	chained_irq_exit(ic, desc);
+}
+
+static int npcm_sgpio_setup_irqs(struct npcm_sgpio *gpio,
+				 struct platform_device *pdev)
+{
+	int rc, i;
+	struct gpio_irq_chip *irq;
+
+	rc = platform_get_irq(pdev, 0);
+	if (rc < 0)
+		return rc;
+
+	gpio->irq = rc;
+
+	/* Disable IRQ and clear Interrupt status registers for all SGPIO Pins. */
+	for (i = 0; i < ARRAY_SIZE(npcm_sgpio_banks); i++) {
+		const struct npcm_sgpio_bank *bank = &npcm_sgpio_banks[i];
+
+		iowrite16(0x0000, bank_reg(gpio, bank, event_cfg));
+		iowrite8(0xff, bank_reg(gpio, bank, event_sts));
+	}
+
+	gpio->intc.name = dev_name(&pdev->dev);
+	gpio->intc.irq_ack = npcm_sgpio_irq_ack;
+	gpio->intc.irq_mask = npcm_sgpio_irq_mask;
+	gpio->intc.irq_unmask = npcm_sgpio_irq_unmask;
+	gpio->intc.irq_set_type = npcm_sgpio_set_type;
+
+	irq = &gpio->chip.irq;
+	irq->chip = &gpio->intc;
+	irq->init_valid_mask = npcm_sgpio_irq_init_valid_mask;
+	irq->handler = handle_bad_irq;
+	irq->default_type = IRQ_TYPE_NONE;
+	irq->parent_handler = npcm_sgpio_irq_handler;
+	irq->parent_handler_data = gpio;
+	irq->parents = &gpio->irq;
+	irq->num_parents = 1;
+
+	return 0;
+}
+
+static const int npcm7xx_SFT_CLK[] = {
+		1024, 32, 8, 4, 3, 2,
+};
+
+static const u8 npcm7xx_CLK_SEL[] = {
+		0x00, 0x05, 0x07, 0x0C, 0x0D, 0x0E,
+};
+
+static const int npcm845_SFT_CLK[] = {
+		1024, 32, 16, 8, 4,
+};
+
+static const u8 npcm845_CLK_SEL[] = {
+		0x00, 0x05, 0x06, 0x07, 0x0C,
+};
+
+static const struct npcm_clk_cfg npcm7xx_sgpio_pdata = {
+	.SFT_CLK = npcm7xx_SFT_CLK,
+	.CLK_SEL = npcm7xx_CLK_SEL,
+	.cfg_opt = 6,
+};
+
+static const struct npcm_clk_cfg npcm845_sgpio_pdata = {
+	.SFT_CLK = npcm845_SFT_CLK,
+	.CLK_SEL = npcm845_CLK_SEL,
+	.cfg_opt = 5,
+};
+
+static const struct of_device_id npcm_sgpio_of_table[] = {
+	{ .compatible = "nuvoton,npcm750-sgpio", .data = &npcm7xx_sgpio_pdata, },
+	{ .compatible = "nuvoton,npcm845-sgpio", .data = &npcm845_sgpio_pdata, },
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, npcm_sgpio_of_table);
+
+static int __init npcm_sgpio_probe(struct platform_device *pdev)
+{
+	struct npcm_sgpio *gpio;
+	const struct npcm_clk_cfg *clk_cfg;
+	int rc;
+	u32 nin_gpios, nout_gpios, sgpio_freq;
+
+	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
+	if (!gpio)
+		return -ENOMEM;
+
+	gpio->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(gpio->base))
+		return PTR_ERR(gpio->base);
+
+	clk_cfg = device_get_match_data(&pdev->dev);
+	if (!clk_cfg)
+		return -EINVAL;
+
+	rc = device_property_read_u32(&pdev->dev, "nin_gpios", &nin_gpios);
+	if (rc < 0) {
+		dev_err(&pdev->dev, "Could not read ngpios property\n");
+		return -EINVAL;
+	}
+	rc = device_property_read_u32(&pdev->dev, "nout_gpios", &nout_gpios);
+	if (rc < 0) {
+		dev_err(&pdev->dev, "Could not read ngpios property\n");
+		return -EINVAL;
+	}
+
+	gpio->nin_sgpio = nin_gpios;
+	gpio->nout_sgpio = nout_gpios;
+	if (gpio->nin_sgpio > MAX_NR_HW_SGPIO || gpio->nout_sgpio > MAX_NR_HW_SGPIO) {
+		dev_err(&pdev->dev, "Number of GPIOs exceeds the maximum of %d: input: %d output: %d\n",
+			MAX_NR_HW_SGPIO, nin_gpios, nout_gpios);
+		return -EINVAL;
+	}
+
+	rc = device_property_read_u32(&pdev->dev, "bus-frequency", &sgpio_freq);
+	if (rc < 0) {
+		dev_err(&pdev->dev, "Could not read bus-frequency property\n");
+		return -EINVAL;
+	}
+
+	gpio->pclk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(gpio->pclk)) {
+		dev_err(&pdev->dev, "devm_clk_get failed\n");
+		return PTR_ERR(gpio->pclk);
+	}
+
+	rc = npcm_sgpio_setup_clk(gpio, clk_cfg, sgpio_freq);
+	if (rc < 0) {
+		dev_err(&pdev->dev, "Failed to setup clock\n");
+		return -EINVAL;
+	}
+	spin_lock_init(&gpio->lock);
+	gpio->chip.parent = &pdev->dev;
+	gpio->chip.ngpio = gpio->nin_sgpio + gpio->nout_sgpio;
+	gpio->chip.init_valid_mask = npcm_sgpio_init_valid_mask;
+	gpio->chip.direction_input = npcm_sgpio_dir_in;
+	gpio->chip.direction_output = npcm_sgpio_dir_out;
+	gpio->chip.get_direction = npcm_sgpio_get_direction;
+	gpio->chip.request = NULL;
+	gpio->chip.free = NULL;
+	gpio->chip.get = npcm_sgpio_get;
+	gpio->chip.set = npcm_sgpio_set;
+	gpio->chip.set_config = NULL;
+	gpio->chip.label = dev_name(&pdev->dev);
+	gpio->chip.base = -1;
+
+	rc = npcm_sgpio_setup_irqs(gpio, pdev);
+	if (rc < 0)
+		return rc;
+
+	rc = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
+	if (rc < 0)
+		return rc;
+
+	npcm_sgpio_setup_enable(gpio, true);
+	return 0;
+}
+
+static struct platform_driver npcm_sgpio_driver = {
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = npcm_sgpio_of_table,
+	},
+};
+
+module_platform_driver_probe(npcm_sgpio_driver, npcm_sgpio_probe);
+MODULE_AUTHOR("Jim Liu <jjliu0@nuvoton.com>");
+MODULE_AUTHOR("Joseph Liu <kwliu@nuvoton.com>");
+MODULE_DESCRIPTION("Nuvoton NPCM Serial GPIO Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

