Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E428050EF
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 11:44:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eruoJ0HT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkxxM5mdqz3dHK
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 21:44:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eruoJ0HT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Skxln3srXz3cTg
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 21:36:21 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50be9e6427dso3183943e87.1
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 02:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701772578; x=1702377378; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1k7lWyrahDo5SYtgc/iFqm9GbNDF7pT46/C/AsBzOrs=;
        b=eruoJ0HTDHVkM/JTQTMHLkc32LYQW02ccCPAPbPP01srgX9T6eAM7xBRZQ7co8wVlt
         yjc884NEKpPSsJTJepL2EuOmw5IACiDyp4P/FMOVg7R89nGssQfrl8UOl7mNK1pzMo2X
         92XFpx7L0eebBjNqAKE/f/qRoiuBQghF1BK4kfTNtWBaUrMUR5n9LX55cQ645SnoNtXq
         CIIyQb497NCSIRWfawgfVYmX9yLPS9rw3/IdoZi0zdZI+c3qeRy0/MpWu5/d2kTWb6/0
         wBBMrzNN0eHzj+5VNhqp/wqWs2moS4uLfYOmAD/o6oQ4f9+ChuWSFaCbWKl0glJEKr72
         Kgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701772578; x=1702377378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1k7lWyrahDo5SYtgc/iFqm9GbNDF7pT46/C/AsBzOrs=;
        b=ULsC7WEhcJzatuo6QdyAkcAvYXL/hKQiUZ0mvmmUIvyg8usAGQXsxMoUUZTvo2wr33
         r/S51dkfRDQcYqiKdyq2OUoQF6y1telLN1ZBShNiUi8fL1GXqRBem7RZiOV8AnvBRAWg
         96RKkK+m/rOBKNJj2seCnByYOFMjYhqBiUFoy04qTbq+kwvBxV05UdieJuUsMFe/ZRE0
         kGN3/zF8a7fD8Bmw2bubFi01dUylSLS21u9FndYl6Ef4sh1s5qK6d7kw5Pp5ulVUEpnV
         vg//rsT+jFBJEclB2Tr1rArIZ6RmM43kJFuBl1nps10YhRnL31yd6QDrBSNcq3suAq+9
         b1SQ==
X-Gm-Message-State: AOJu0Yz0gqXa+K4yajp5kJV5xw5iwxMhFt1QWjC/TEH9nU8lEqVhgUNN
	Z70DoBwpf2xbh1mj6Q2xmE0=
X-Google-Smtp-Source: AGHT+IHiQBmXNoe+RQLiP7bM9J3YBFryfD6UtciM5O4MFeuegXmFDkM36Hx7vUyDh05FWBDXGXAVbg==
X-Received: by 2002:ac2:59c6:0:b0:50b:e45b:efc9 with SMTP id x6-20020ac259c6000000b0050be45befc9mr2154973lfn.50.1701772578250;
        Tue, 05 Dec 2023 02:36:18 -0800 (PST)
Received: from localhost ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id i22-20020a056512225600b0050bf5188390sm633346lfu.167.2023.12.05.02.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 02:36:17 -0800 (PST)
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 09/16] net: mdio: Add Synopsys DW XPCS management interface support
Date: Tue,  5 Dec 2023 13:35:30 +0300
Message-ID: <20231205103559.9605-10-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231205103559.9605-1-fancer.lancer@gmail.com>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
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
Cc: netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Synopsys DesignWare XPCS IP-core can be synthesized with the device CSRs
being accessible over MCI or APB3 interface instead of the MDIO bus (see
the CSR_INTERFACE HDL parameter). Thus all the PCS registers can be just
memory mapped and be a subject of standard MMIO operations of course
taking into account the way the Clause C45 CSRs mapping is defined. This
commit is about adding a device driver for the DW XPCS Management
Interface platform device and registering it in the framework of the
kernel MDIO subsystem.

DW XPCS platform device is supposed to be described by the respective
compatible string "snps,dw-xpcs-mi", CSRs memory space and optional
peripheral bus clock source. Note depending on the INDIRECT_ACCESS DW XPCS
IP-core synthesize parameter the memory-mapped reg-space can be
represented as either directly or indirectly mapped Clause 45 space. In
the former case the particular address is determined based on the MMD
device and the registers offset (5 + 16 bits all together) within the
device reg-space. In the later case there is only 256 lower address bits
are utilized for the registers mapping. The upper bits are supposed to be
written into the respective viewport CSR in order to reach the entire C45
space.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/net/mdio/Kconfig        |   8 +
 drivers/net/mdio/Makefile       |   1 +
 drivers/net/mdio/mdio-dw-xpcs.c | 384 ++++++++++++++++++++++++++++++++
 3 files changed, 393 insertions(+)
 create mode 100644 drivers/net/mdio/mdio-dw-xpcs.c

diff --git a/drivers/net/mdio/Kconfig b/drivers/net/mdio/Kconfig
index 4a7a303be2f7..39f7ce8087bf 100644
--- a/drivers/net/mdio/Kconfig
+++ b/drivers/net/mdio/Kconfig
@@ -185,6 +185,14 @@ config MDIO_IPQ8064
 	  This driver supports the MDIO interface found in the network
 	  interface units of the IPQ8064 SoC
 
+config MDIO_DW_XPCS
+	tristate "Synopsys DesignWare XPCS MI bus support"
+	depends on HAS_IOMEM
+	select MDIO_DEVRES
+	help
+	  This driver supports the MCI/APB3 Management Interface responsible
+	  for communicating with the Synopsys DesignWare XPCS devices.
+
 config MDIO_REGMAP
 	tristate
 	help
diff --git a/drivers/net/mdio/Makefile b/drivers/net/mdio/Makefile
index 1015f0db4531..6389d4c3b862 100644
--- a/drivers/net/mdio/Makefile
+++ b/drivers/net/mdio/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_MDIO_BCM_IPROC)		+= mdio-bcm-iproc.o
 obj-$(CONFIG_MDIO_BCM_UNIMAC)		+= mdio-bcm-unimac.o
 obj-$(CONFIG_MDIO_BITBANG)		+= mdio-bitbang.o
 obj-$(CONFIG_MDIO_CAVIUM)		+= mdio-cavium.o
+obj-$(CONFIG_MDIO_DW_XPCS)		+= mdio-dw-xpcs.o
 obj-$(CONFIG_MDIO_GPIO)			+= mdio-gpio.o
 obj-$(CONFIG_MDIO_HISI_FEMAC)		+= mdio-hisi-femac.o
 obj-$(CONFIG_MDIO_I2C)			+= mdio-i2c.o
diff --git a/drivers/net/mdio/mdio-dw-xpcs.c b/drivers/net/mdio/mdio-dw-xpcs.c
new file mode 100644
index 000000000000..c47f0a54d31b
--- /dev/null
+++ b/drivers/net/mdio/mdio-dw-xpcs.c
@@ -0,0 +1,384 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Synopsys DesignWare XPCS Management Interface driver
+ *
+ * Copyright (C) 2023 BAIKAL ELECTRONICS, JSC
+ */
+
+#include <linux/atomic.h>
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mdio.h>
+#include <linux/module.h>
+#include <linux/of_mdio.h>
+#include <linux/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/property.h>
+#include <linux/sizes.h>
+
+/* Page select register for the indirect MMIO CSRs access */
+#define DW_VR_CSR_VIEWPORT		0xff
+
+struct dw_xpcs_mi {
+	struct platform_device *pdev;
+	struct mii_bus *bus;
+	bool reg_indir;
+	int reg_width;
+	void __iomem *reg_base;
+	struct clk *pclk;
+};
+
+static inline ptrdiff_t dw_xpcs_mmio_addr_format(int dev, int reg)
+{
+	return FIELD_PREP(0x1f0000, dev) | FIELD_PREP(0xffff, reg);
+}
+
+static inline u16 dw_xpcs_mmio_addr_page(ptrdiff_t csr)
+{
+	return FIELD_GET(0x1fff00, csr);
+}
+
+static inline ptrdiff_t dw_xpcs_mmio_addr_offset(ptrdiff_t csr)
+{
+	return FIELD_GET(0xff, csr);
+}
+
+static int dw_xpcs_mmio_read_reg_indirect(struct dw_xpcs_mi *dxmi,
+					  int dev, int reg)
+{
+	ptrdiff_t csr, ofs;
+	u16 page;
+	int ret;
+
+	csr = dw_xpcs_mmio_addr_format(dev, reg);
+	page = dw_xpcs_mmio_addr_page(csr);
+	ofs = dw_xpcs_mmio_addr_offset(csr);
+
+	ret = pm_runtime_resume_and_get(&dxmi->pdev->dev);
+	if (ret)
+		return ret;
+
+	switch (dxmi->reg_width) {
+	case 4:
+		writel(page, dxmi->reg_base + (DW_VR_CSR_VIEWPORT << 2));
+		ret = readl(dxmi->reg_base + (ofs << 2));
+		break;
+	default:
+		writew(page, dxmi->reg_base + (DW_VR_CSR_VIEWPORT << 1));
+		ret = readw(dxmi->reg_base + (ofs << 1));
+		break;
+	}
+
+	pm_runtime_put(&dxmi->pdev->dev);
+
+	return ret;
+}
+
+static int dw_xpcs_mmio_write_reg_indirect(struct dw_xpcs_mi *dxmi,
+					   int dev, int reg, u16 val)
+{
+	ptrdiff_t csr, ofs;
+	u16 page;
+	int ret;
+
+	csr = dw_xpcs_mmio_addr_format(dev, reg);
+	page = dw_xpcs_mmio_addr_page(csr);
+	ofs = dw_xpcs_mmio_addr_offset(csr);
+
+	ret = pm_runtime_resume_and_get(&dxmi->pdev->dev);
+	if (ret)
+		return ret;
+
+	switch (dxmi->reg_width) {
+	case 4:
+		writel(page, dxmi->reg_base + (DW_VR_CSR_VIEWPORT << 2));
+		writel(val, dxmi->reg_base + (ofs << 2));
+		break;
+	default:
+		writew(page, dxmi->reg_base + (DW_VR_CSR_VIEWPORT << 1));
+		writew(val, dxmi->reg_base + (ofs << 1));
+		break;
+	}
+
+	pm_runtime_put(&dxmi->pdev->dev);
+
+	return 0;
+}
+
+static int dw_xpcs_mmio_read_reg_direct(struct dw_xpcs_mi *dxmi,
+					int dev, int reg)
+{
+	ptrdiff_t csr;
+	int ret;
+
+	csr = dw_xpcs_mmio_addr_format(dev, reg);
+
+	ret = pm_runtime_resume_and_get(&dxmi->pdev->dev);
+	if (ret)
+		return ret;
+
+	switch (dxmi->reg_width) {
+	case 4:
+		ret = readl(dxmi->reg_base + (csr << 2));
+		break;
+	default:
+		ret = readw(dxmi->reg_base + (csr << 1));
+		break;
+	}
+
+	pm_runtime_put(&dxmi->pdev->dev);
+
+	return ret;
+}
+
+static int dw_xpcs_mmio_write_reg_direct(struct dw_xpcs_mi *dxmi,
+					 int dev, int reg, u16 val)
+{
+	ptrdiff_t csr;
+	int ret;
+
+	csr = dw_xpcs_mmio_addr_format(dev, reg);
+
+	ret = pm_runtime_resume_and_get(&dxmi->pdev->dev);
+	if (ret)
+		return ret;
+
+	switch (dxmi->reg_width) {
+	case 4:
+		writel(val, dxmi->reg_base + (csr << 2));
+		break;
+	default:
+		writew(val, dxmi->reg_base + (csr << 1));
+		break;
+	}
+
+	pm_runtime_put(&dxmi->pdev->dev);
+
+	return 0;
+}
+
+static int dw_xpcs_mmio_read_c22(struct mii_bus *bus, int addr, int reg)
+{
+	struct dw_xpcs_mi *dxmi = bus->priv;
+
+	if (addr != 0)
+		return -ENODEV;
+
+	if (dxmi->reg_indir)
+		return dw_xpcs_mmio_read_reg_indirect(dxmi, MDIO_MMD_VEND2, reg);
+	else
+		return dw_xpcs_mmio_read_reg_direct(dxmi, MDIO_MMD_VEND2, reg);
+}
+
+static int dw_xpcs_mmio_write_c22(struct mii_bus *bus, int addr, int reg, u16 val)
+{
+	struct dw_xpcs_mi *dxmi = bus->priv;
+
+	if (addr != 0)
+		return -ENODEV;
+
+	if (dxmi->reg_indir)
+		return dw_xpcs_mmio_write_reg_indirect(dxmi, MDIO_MMD_VEND2, reg, val);
+	else
+		return dw_xpcs_mmio_write_reg_direct(dxmi, MDIO_MMD_VEND2, reg, val);
+}
+
+static int dw_xpcs_mmio_read_c45(struct mii_bus *bus, int addr, int dev, int reg)
+{
+	struct dw_xpcs_mi *dxmi = bus->priv;
+
+	if (addr != 0)
+		return -ENODEV;
+
+	if (dxmi->reg_indir)
+		return dw_xpcs_mmio_read_reg_indirect(dxmi, dev, reg);
+	else
+		return dw_xpcs_mmio_read_reg_direct(dxmi, dev, reg);
+}
+
+static int dw_xpcs_mmio_write_c45(struct mii_bus *bus, int addr, int dev,
+				  int reg, u16 val)
+{
+	struct dw_xpcs_mi *dxmi = bus->priv;
+
+	if (addr != 0)
+		return -ENODEV;
+
+	if (dxmi->reg_indir)
+		return dw_xpcs_mmio_write_reg_indirect(dxmi, dev, reg, val);
+	else
+		return dw_xpcs_mmio_write_reg_direct(dxmi, dev, reg, val);
+}
+
+static struct dw_xpcs_mi *dw_xpcs_mi_create_data(struct platform_device *pdev)
+{
+	struct dw_xpcs_mi *dxmi;
+
+	dxmi = devm_kzalloc(&pdev->dev, sizeof(*dxmi), GFP_KERNEL);
+	if (!dxmi)
+		return ERR_PTR(-ENOMEM);
+
+	dxmi->pdev = pdev;
+
+	dev_set_drvdata(&pdev->dev, dxmi);
+
+	return dxmi;
+}
+
+static int dw_xpcs_mi_init_res(struct dw_xpcs_mi *dxmi)
+{
+	struct device *dev = &dxmi->pdev->dev;
+	struct resource *res;
+
+	if (!device_property_read_u32(dev, "reg-io-width", &dxmi->reg_width)) {
+		if (dxmi->reg_width != 2 && dxmi->reg_width != 4) {
+			dev_err(dev, "Invalid regspace data width\n");
+			return -EINVAL;
+		}
+	} else {
+		dxmi->reg_width = 2;
+	}
+
+	res = platform_get_resource_byname(dxmi->pdev, IORESOURCE_MEM, "direct") ?:
+	      platform_get_resource_byname(dxmi->pdev, IORESOURCE_MEM, "indirect");
+	if (!res) {
+		dev_err(dev, "No regspace found\n");
+		return -EINVAL;
+	}
+
+	if (!strcmp(res->name, "indirect"))
+		dxmi->reg_indir = true;
+
+	if ((dxmi->reg_indir && resource_size(res) < dxmi->reg_width * SZ_256) ||
+	    (!dxmi->reg_indir && resource_size(res) < dxmi->reg_width * SZ_2M)) {
+		dev_err(dev, "Invalid regspace size\n");
+		return -EINVAL;
+	}
+
+	dxmi->reg_base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(dxmi->reg_base)) {
+		dev_err(dev, "Failed to map regspace\n");
+		return PTR_ERR(dxmi->reg_base);
+	}
+
+	return 0;
+}
+
+static int dw_xpcs_mi_init_clk(struct dw_xpcs_mi *dxmi)
+{
+	struct device *dev = &dxmi->pdev->dev;
+	int ret;
+
+	dxmi->pclk = devm_clk_get_optional(dev, "pclk");
+        if (IS_ERR(dxmi->pclk))
+		return dev_err_probe(dev, PTR_ERR(dxmi->pclk),
+				     "Failed to get ref clock\n");
+
+	pm_runtime_set_active(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret) {
+		dev_err(dev, "Failed to enable runtime-PM\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int dw_xpcs_mi_init_mdio(struct dw_xpcs_mi *dxmi)
+{
+	struct device *dev = &dxmi->pdev->dev;
+	static atomic_t id = ATOMIC_INIT(-1);
+	int ret;
+
+	dxmi->bus = devm_mdiobus_alloc_size(dev, 0);
+	if (!dxmi->bus)
+		return -ENOMEM;
+
+	dxmi->bus->name = "DW XPCS MI";
+	dxmi->bus->read = dw_xpcs_mmio_read_c22;
+	dxmi->bus->write = dw_xpcs_mmio_write_c22;
+	dxmi->bus->read_c45 = dw_xpcs_mmio_read_c45;
+	dxmi->bus->write_c45 = dw_xpcs_mmio_write_c45;
+	dxmi->bus->phy_mask = ~0;
+	dxmi->bus->parent = dev;
+	dxmi->bus->priv = dxmi;
+
+	snprintf(dxmi->bus->id, MII_BUS_ID_SIZE,
+		 "dwxpcs-%x", atomic_inc_return(&id));
+
+	ret = devm_of_mdiobus_register(dev, dxmi->bus, dev_of_node(dev));
+	if (ret) {
+		dev_err(dev, "Failed to create MDIO bus\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int dw_xpcs_mi_probe(struct platform_device *pdev)
+{
+	struct dw_xpcs_mi *dxmi;
+	int ret;
+
+	dxmi = dw_xpcs_mi_create_data(pdev);
+	if (IS_ERR(dxmi))
+		return PTR_ERR(dxmi);
+
+	ret = dw_xpcs_mi_init_res(dxmi);
+	if (ret)
+		return ret;
+
+	ret = dw_xpcs_mi_init_clk(dxmi);
+	if (ret)
+		return ret;
+
+	ret = dw_xpcs_mi_init_mdio(dxmi);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int __maybe_unused dw_xpcs_mi_pm_runtime_suspend(struct device *dev)
+{
+	struct dw_xpcs_mi *dxmi = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(dxmi->pclk);
+
+	return 0;
+}
+
+static int __maybe_unused dw_xpcs_mi_pm_runtime_resume(struct device *dev)
+{
+	struct dw_xpcs_mi *dxmi = dev_get_drvdata(dev);
+
+	return clk_prepare_enable(dxmi->pclk);
+}
+
+const struct dev_pm_ops dw_xpcs_mi_pm_ops = {
+        SET_RUNTIME_PM_OPS(dw_xpcs_mi_pm_runtime_suspend, dw_xpcs_mi_pm_runtime_resume, NULL)
+};
+
+static const struct of_device_id dw_xpcs_mi_of_ids[] = {
+	{ .compatible = "snps,dw-xpcs-mi" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, dw_xpcs_mi_of_ids);
+
+static struct platform_driver dw_xpcs_mi_driver = {
+	.probe = dw_xpcs_mi_probe,
+	.driver = {
+		.name = "dw-xpcs-mi",
+		.pm = &dw_xpcs_mi_pm_ops,
+		.of_match_table = dw_xpcs_mi_of_ids,
+	},
+};
+
+module_platform_driver(dw_xpcs_mi_driver);
+
+MODULE_DESCRIPTION("Synopsys DesignWare XPCS Management Interface driver");
+MODULE_AUTHOR("Serge Semin <Sergey.Semin@baikalelectronics.ru>");
+MODULE_LICENSE("GPL v2");
-- 
2.42.1

