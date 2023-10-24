Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E991D7D4B98
	for <lists+openbmc@lfdr.de>; Tue, 24 Oct 2023 11:10:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mPSRWZ1F;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SF5qq5JxWz3cWs
	for <lists+openbmc@lfdr.de>; Tue, 24 Oct 2023 20:10:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mPSRWZ1F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=jim.t90615@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SF5mL1SZbz3c7q
	for <openbmc@lists.ozlabs.org>; Tue, 24 Oct 2023 20:07:13 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1c9a1762b43so35376875ad.1
        for <openbmc@lists.ozlabs.org>; Tue, 24 Oct 2023 02:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698138431; x=1698743231; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvzSHiZh5xMnrhzY3bIBUbLv505m4EHV2TAFLRI9ySc=;
        b=mPSRWZ1FWXfl2Ig64YPkBL6P4rkHuPuIXtK3iWbUU/ojhTGiy2cmXs0D3mMN5jqofj
         XeR02yA0qgX4FRcKsMp94EccfL4UIx6nWloc0HdFgYapaixOc2GH573QYV8Rpudz8YqB
         3jIjkfUpUrk9OKTuic4Db60U/yfnm8Bztbshbe01xFKWkx5wl/FUF7G11GHhX41xhOEz
         FQyPNnqgCjs2cm3AhMbMRHW40VNdhq3L7IoS6eTlCc+IvPbBTgTnNVnEOD8590/cnrzm
         9YtDtgdtUrFbw6w8j46Ejy0JXF9HdtRLteeVqgNUZDIuKvLc8ufl8QPUR+apmIde+d2I
         kFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698138431; x=1698743231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvzSHiZh5xMnrhzY3bIBUbLv505m4EHV2TAFLRI9ySc=;
        b=i/hTiZx8+WfTBubr0J0jhntAbNczl+tj8YxEcojyCeOPb8GYXW4zgpHHSfesOUrBlX
         z1e3YiSmFUhKvjnqg1ekcQeb4x51BtwWjriZALuQKgAqliAKNGKk6VcRSR+WAlsMJyZe
         T+eOJL2/18lP82iEmNGdALFeEEOtK+OXG8T7iRuUNhtJB6r4XWwxlXuzvK5bMBf4GlRk
         mX2AiV18eFaE5KxyyE1g94Azk5FBxr0siDLQf5P6Rsy/k4m6OFTLa93nlJmbRIftjb1h
         yAEtp8K85RIWtfbcAw+qebR63MZmz3cH6pRusr0XWw4+1+OzXnExiusHKQk/iNTHucjm
         E5QA==
X-Gm-Message-State: AOJu0Yym3fQJVUdKioQpo31HiBsNw6xq8RnsRw3KerAeTaoYCiIsnQtf
	9RFKst8OkUrEq0snazZkafZodBw+bSs=
X-Google-Smtp-Source: AGHT+IGGnFxlm6YJZBodezSR8Kki4pb2QPmy4EjuMvhVfvb4RWW/9Q4qvcOPgW803O6cW6SB/6lSVA==
X-Received: by 2002:a17:902:dac6:b0:1c7:66a4:27ba with SMTP id q6-20020a170902dac600b001c766a427bamr16423909plx.48.1698138431038;
        Tue, 24 Oct 2023 02:07:11 -0700 (PDT)
Received: from cs20-buildserver.lan ([1.200.144.223])
        by smtp.gmail.com with ESMTPSA id c24-20020a170902d91800b001c9ab91d3d7sm7055324plz.37.2023.10.24.02.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 02:07:10 -0700 (PDT)
From: Jim Liu <jim.t90615@gmail.com>
To: jim.t90615@gmail.com,
	JJLIU0@nuvoton.com,
	linus.walleij@linaro.org,
	krzysztof.kozlowski+dt@linaro.org,
	brgl@bgdev.pl
Subject: [PATCH v6 3/3] gpio: nuvoton: Add Nuvoton NPCM sgpio driver
Date: Tue, 24 Oct 2023 17:06:31 +0800
Message-Id: <20231024090631.3359592-4-jim.t90615@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231024090631.3359592-1-jim.t90615@gmail.com>
References: <20231024090631.3359592-1-jim.t90615@gmail.com>
MIME-Version: 1.0
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add Nuvoton BMC NPCM7xx/NPCM8xx sgpio driver support.
Nuvoton NPCM SGPIO module is combine serial to parallel IC (HC595)
and parallel to serial IC (HC165), and use APB3 clock to control it.
This interface has 4 pins  (D_out , D_in, S_CLK, LDSH).
BMC can use this driver to increase 64 gpi pins and 64 gpo pins to use.


Signed-off-by: Jim Liu <jim.t90615@gmail.com>
---
Change for v6:
   - Remove bus-frequency property set
   - Use GPIO_GENERIC
   - Move iowrite8 out of the branches
   - Add error codes in npcm_sgpio_get_direction
   - Use used a ternary operator for npcm_sgpio_init_port
   - change npcm_clk_cfg u8 to unsigned int
   - Fix typo
Changes for v5:
   - remove printk
   - add descriptive for to_bank
   - using "GPL" instead of "GPL v2"
Changes for v4:
   - followed reviewer suggestion to modify npcm_sgpio_dir_in
   - blank line in npcm_sgpio_dir_out
   - use int type for dir in npcm_sgpio_get

Changes for v3:
   - remove return in bank_reg function
Changes for v2:
   - add prefix
   - write the enum values in all capitals
   - remove _init in npcm_sgpio_probe
---
 drivers/gpio/Kconfig           |   8 +
 drivers/gpio/Makefile          |   1 +
 drivers/gpio/gpio-npcm-sgpio.c | 650 +++++++++++++++++++++++++++++++++
 3 files changed, 659 insertions(+)
 create mode 100644 drivers/gpio/gpio-npcm-sgpio.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 673bafb8be58..ae5492569666 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -478,6 +478,14 @@ config GPIO_MXS
 	select GPIO_GENERIC
 	select GENERIC_IRQ_CHIP
 
+config GPIO_NPCM_SGPIO
+        bool "Nuvoton SGPIO support"
+        depends on (ARCH_NPCM || COMPILE_TEST) && OF_GPIO
+        select GPIO_GENERIC
+        select GPIOLIB_IRQCHIP
+        help
+          Say Y here to support Nuvoton NPCM7XX/NPCM8XX SGPIO functionality.
+
 config GPIO_OCTEON
 	tristate "Cavium OCTEON GPIO"
 	depends on CAVIUM_OCTEON_SOC
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index eb73b5d633eb..373aa2943de5 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -116,6 +116,7 @@ obj-$(CONFIG_GPIO_MT7621)		+= gpio-mt7621.o
 obj-$(CONFIG_GPIO_MVEBU)		+= gpio-mvebu.o
 obj-$(CONFIG_GPIO_MXC)			+= gpio-mxc.o
 obj-$(CONFIG_GPIO_MXS)			+= gpio-mxs.o
+obj-$(CONFIG_GPIO_NPCM_SGPIO)		+= gpio-npcm-sgpio.o
 obj-$(CONFIG_GPIO_OCTEON)		+= gpio-octeon.o
 obj-$(CONFIG_GPIO_OMAP)			+= gpio-omap.o
 obj-$(CONFIG_GPIO_PALMAS)		+= gpio-palmas.o
diff --git a/drivers/gpio/gpio-npcm-sgpio.c b/drivers/gpio/gpio-npcm-sgpio.c
new file mode 100644
index 000000000000..45dd404a8166
--- /dev/null
+++ b/drivers/gpio/gpio-npcm-sgpio.c
@@ -0,0 +1,650 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NPCM Serial GPIO Driver
+ *
+ * Copyright (C) 2021 Nuvoton Technologies
+ */
+
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
+#define  NPCM_IOXCFG1			0x2A
+#define  NPCM_IOXCFG1_SFT_CLK	GENMASK(3, 0)
+#define  NPCM_IOXCFG1_SCLK_POL	BIT(4)
+#define  NPCM_IOXCFG1_LDSH_POL	BIT(5)
+
+#define  NPCM_IOXCTS					0x28
+#define  NPCM_IOXCTS_IOXIF_EN			BIT(7)
+#define  NPCM_IOXCTS_RD_MODE			GENMASK(2, 1)
+#define  NPCM_IOXCTS_RD_MODE_PERIODIC		BIT(2)
+#define  NPCM_IOXCTS_RD_MODE_CONTINUOUS	GENMASK(2, 1)
+
+#define  NPCM_IOXCFG2			0x2B
+#define  NPCM_IXOEVCFG_MASK		0x3
+#define  NPCM_IXOEVCFG_BOTH		0x3
+#define  NPCM_IXOEVCFG_FALLING	0x2
+#define  NPCM_IXOEVCFG_RISING	0x1
+
+#define NPCM_CLK_TH 8000000
+
+#define GPIO_BANK(x)    ((x) / 8)
+#define GPIO_BIT(x)     ((x) % 8)
+
+/*
+ * Select the frequency of shift clock.
+ * The shift clock is a division of the APB clock.
+ */
+struct npcm_clk_cfg {
+	const unsigned int *SFT_CLK;
+	const unsigned int *CLK_SEL;
+	const unsigned int cfg_opt;
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
+	u8 rdata_reg;
+	u8 wdata_reg;
+	u8 event_config;
+	u8 event_status;
+};
+
+enum npcm_sgpio_reg {
+	READ_DATA,
+	WRITE_DATA,
+	EVENT_CFG,
+	EVENT_STS,
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
+	case READ_DATA:
+		return gpio->base + bank->rdata_reg;
+	case WRITE_DATA:
+		return gpio->base + bank->wdata_reg;
+	case EVENT_CFG:
+		return gpio->base + bank->event_config;
+	case EVENT_STS:
+		return gpio->base + bank->event_status;
+	default:
+		/* actually if code runs to here, it's an error case */
+		WARN(true, "Getting here is an error condition");
+		return -EINVAL;
+	}
+}
+
+static const struct npcm_sgpio_bank *offset_to_bank(unsigned int offset)
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
+	*bank = offset_to_bank(*offset);
+	*bit = GPIO_BIT(*offset);
+}
+
+static int npcm_sgpio_init_port(struct npcm_sgpio *gpio)
+{
+	u8 in_port, out_port, set_port, reg;
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
+	iowrite8(set_port, gpio->base + NPCM_IOXCFG2);
+
+	reg = ioread8(gpio->base + NPCM_IOXCFG2);
+
+	return reg == set_port ? 0 : -EINVAL;
+
+}
+
+static int npcm_sgpio_dir_in(struct gpio_chip *gc, unsigned int offset)
+{
+	struct npcm_sgpio *gpio = gpiochip_get_data(gc);
+
+	return offset <	gpio->nout_sgpio ? -EINVAL : 0;
+
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
+
+	return -EINVAL;
+}
+
+static int npcm_sgpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct npcm_sgpio *gpio = gpiochip_get_data(gc);
+
+	if (offset > gpio->chip.ngpio)
+		return -EINVAL;
+
+	if (offset < gpio->nout_sgpio)
+		return GPIO_LINE_DIRECTION_OUT;
+	return GPIO_LINE_DIRECTION_IN;
+}
+
+static void npcm_sgpio_set(struct gpio_chip *gc, unsigned int offset, int val)
+{
+	struct npcm_sgpio *gpio = gpiochip_get_data(gc);
+	const struct  npcm_sgpio_bank *bank = offset_to_bank(offset);
+	void __iomem *addr;
+	u8 reg = 0;
+
+	addr = bank_reg(gpio, bank, WRITE_DATA);
+	reg = ioread8(addr);
+
+	if (val)
+		reg |= (val << GPIO_BIT(offset));
+	else
+		reg &= ~(1 << GPIO_BIT(offset));
+
+	iowrite8(reg, addr);
+}
+
+static int npcm_sgpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct npcm_sgpio *gpio = gpiochip_get_data(gc);
+	const struct  npcm_sgpio_bank *bank;
+	void __iomem *addr;
+	u8 reg;
+	int dir;
+
+	dir = npcm_sgpio_get_direction(gc, offset);
+	if (dir == 0) {
+		bank = offset_to_bank(offset);
+
+		addr = bank_reg(gpio, bank, WRITE_DATA);
+		reg = ioread8(addr);
+		reg = (reg >> GPIO_BIT(offset)) & 0x01;
+	} else {
+		offset -= gpio->nout_sgpio;
+		bank = offset_to_bank(offset);
+
+		addr = bank_reg(gpio, bank, READ_DATA);
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
+	reg = ioread8(gpio->base + NPCM_IOXCTS);
+	reg = reg & ~NPCM_IOXCTS_RD_MODE;
+	reg = reg | NPCM_IOXCTS_RD_MODE_PERIODIC;
+
+	if (enable) {
+		reg |= NPCM_IOXCTS_IOXIF_EN;
+		iowrite8(reg, gpio->base + NPCM_IOXCTS);
+	} else {
+		reg &= ~NPCM_IOXCTS_IOXIF_EN;
+		iowrite8(reg, gpio->base + NPCM_IOXCTS);
+	}
+}
+
+static int npcm_sgpio_setup_clk(struct npcm_sgpio *gpio,
+				const struct npcm_clk_cfg *clk_cfg)
+{
+	unsigned long apb_freq;
+	u32 val;
+	u8 tmp;
+	int i;
+
+	apb_freq = clk_get_rate(gpio->pclk);
+	tmp = ioread8(gpio->base + NPCM_IOXCFG1) & ~NPCM_IOXCFG1_SFT_CLK;
+
+	for (i = 0; i < clk_cfg->cfg_opt; i++) {
+		val = apb_freq / clk_cfg->SFT_CLK[i];
+		if ((NPCM_CLK_TH < val) && (i != 0)) {
+			iowrite8(clk_cfg->CLK_SEL[i-1] | tmp, gpio->base + NPCM_IOXCFG1);
+			return 0;
+		} else if (i == (clk_cfg->cfg_opt-1) && (NPCM_CLK_TH > val)) {
+			iowrite8(clk_cfg->CLK_SEL[i] | tmp, gpio->base + NPCM_IOXCFG1);
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
+	addr = bank_reg(gpio, bank, EVENT_CFG);
+
+	spin_lock_irqsave(&gpio->lock, flags);
+
+	npcm_sgpio_setup_enable(gpio, false);
+
+	reg = ioread16(addr);
+	if (set) {
+		reg &= ~(NPCM_IXOEVCFG_MASK << (bit * 2));
+	} else {
+		type = gpio->int_type[offset];
+		reg |= (type << (bit * 2));
+	}
+
+	iowrite16(reg, addr);
+
+	npcm_sgpio_setup_enable(gpio, true);
+
+	addr = bank_reg(gpio, bank, EVENT_STS);
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
+	status_addr = bank_reg(gpio, bank, EVENT_STS);
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
+		val = NPCM_IXOEVCFG_BOTH;
+		handler = handle_edge_irq;
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		val = NPCM_IXOEVCFG_RISING;
+		handler = handle_edge_irq;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		val = NPCM_IXOEVCFG_FALLING;
+		handler = handle_edge_irq;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		val = NPCM_IXOEVCFG_RISING;
+		handler = handle_level_irq;
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		val = NPCM_IXOEVCFG_FALLING;
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
+	addr = bank_reg(gpio, bank, EVENT_CFG);
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
+		reg = ioread8(bank_reg(gpio, bank, EVENT_STS));
+		for_each_set_bit(j, &reg, 8) {
+			girq = irq_find_mapping(gc->irq.domain, i * 8 + gpio->nout_sgpio + j);
+			generic_handle_irq(girq);
+		}
+	}
+
+	chained_irq_exit(ic, desc);
+}
+
+static const struct irq_chip sgpio_irq_chip = {
+	.name = "sgpio-irq",
+	.irq_ack = npcm_sgpio_irq_ack,
+	.irq_mask = npcm_sgpio_irq_mask,
+	.irq_unmask = npcm_sgpio_irq_unmask,
+	.irq_set_type = npcm_sgpio_set_type,
+	.flags		= IRQCHIP_IMMUTABLE | IRQCHIP_MASK_ON_SUSPEND,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
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
+	npcm_sgpio_setup_enable(gpio, false);
+
+	/* Disable IRQ and clear Interrupt status registers for all SGPIO Pins. */
+	for (i = 0; i < ARRAY_SIZE(npcm_sgpio_banks); i++) {
+		const struct npcm_sgpio_bank *bank = &npcm_sgpio_banks[i];
+
+		iowrite16(0x0000, bank_reg(gpio, bank, EVENT_CFG));
+		iowrite8(0xff, bank_reg(gpio, bank, EVENT_STS));
+	}
+
+	irq = &gpio->chip.irq;
+	irq->chip = &sgpio_irq_chip;
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
+static const unsigned int npcm750_SFT_CLK[] = {
+		1024, 32, 8, 4, 3, 2,
+};
+
+static const unsigned int npcm750_CLK_SEL[] = {
+		0x00, 0x05, 0x07, 0x0C, 0x0D, 0x0E,
+};
+
+static const unsigned int npcm845_SFT_CLK[] = {
+		1024, 32, 16, 8, 4,
+};
+
+static const unsigned int npcm845_CLK_SEL[] = {
+		0x00, 0x05, 0x06, 0x07, 0x0C,
+};
+
+static const struct npcm_clk_cfg npcm750_sgpio_pdata = {
+	.SFT_CLK = npcm750_SFT_CLK,
+	.CLK_SEL = npcm750_CLK_SEL,
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
+	{ .compatible = "nuvoton,npcm750-sgpio", .data = &npcm750_sgpio_pdata, },
+	{ .compatible = "nuvoton,npcm845-sgpio", .data = &npcm845_sgpio_pdata, },
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, npcm_sgpio_of_table);
+
+static int npcm_sgpio_probe(struct platform_device *pdev)
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
+	rc = device_property_read_u32(&pdev->dev, "nuvoton,input-ngpios", &nin_gpios);
+	if (rc < 0) {
+		dev_err(&pdev->dev, "Could not read ngpios property\n");
+		return -EINVAL;
+	}
+
+	rc = device_property_read_u32(&pdev->dev, "nuvoton,output-ngpios", &nout_gpios);
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
+	gpio->pclk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(gpio->pclk)) {
+		dev_err(&pdev->dev, "Could not get pclk\n");
+		return PTR_ERR(gpio->pclk);
+	}
+
+	rc = npcm_sgpio_setup_clk(gpio, clk_cfg);
+	if (rc < 0) {
+		dev_err(&pdev->dev, "Failed to setup clock\n");
+		return -EINVAL;
+	}
+
+	spin_lock_init(&gpio->lock);
+	gpio->chip.parent = &pdev->dev;
+	gpio->chip.ngpio = gpio->nin_sgpio + gpio->nout_sgpio;
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
+	rc = npcm_sgpio_init_port(gpio);
+	if (rc < 0)
+		return rc;
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
+	dev_info(&pdev->dev, "NPCM: SGPIO module is ready\n");
+
+	return 0;
+}
+
+static struct platform_driver npcm_sgpio_driver = {
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = npcm_sgpio_of_table,
+	},
+	.probe	= npcm_sgpio_probe,
+};
+
+module_platform_driver(npcm_sgpio_driver);
+
+MODULE_AUTHOR("Jim Liu <jjliu0@nuvoton.com>");
+MODULE_AUTHOR("Joseph Liu <kwliu@nuvoton.com>");
+MODULE_DESCRIPTION("Nuvoton NPCM Serial GPIO Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

