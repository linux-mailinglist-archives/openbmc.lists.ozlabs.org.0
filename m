Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D36828D766C
	for <lists+openbmc@lfdr.de>; Sun,  2 Jun 2024 16:43:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P07ysRBG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VsfjN3t6fz3cX9
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2024 00:43:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P07ysRBG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VsfZN711mz3cSN
	for <openbmc@lists.ozlabs.org>; Mon,  3 Jun 2024 00:37:00 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-52b92e73e2fso1302131e87.2
        for <openbmc@lists.ozlabs.org>; Sun, 02 Jun 2024 07:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717339017; x=1717943817; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGv3NbBqPiem8aYcRxFdqQkSRQ9pcDiqUHD8qSmG7rM=;
        b=P07ysRBGP48IdcWxjhWhB2AQ65bGdMtHT/Ku5DdM9ua1Bja2TyX6wm8G8Zu4yHACam
         TVyN4o8+aAw7r55JnuvU+bbwMDgrBuU0pvurnYHBAL/D5jdCGqlGG9BvZ1QpBCPLSG0y
         50G74zzrk0J8Vn0TQmTbHZ6UUyAZPrVl21OCuFRijETeQGtaIdeuXpeauIAfcgB2Txbv
         IEMa/2WHRhbw+KI+GlDof/Op7tZSIPtNFfwFNwsceBbwjEI5AEYAkP2NO2bXIy159BBE
         Lf1BRMYM3zN2ybTgnsEwpWOO2fxGO9viVQY0roLph8/G/lOeiCKwHOs3M3xDr7vmg6Si
         svXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717339017; x=1717943817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QGv3NbBqPiem8aYcRxFdqQkSRQ9pcDiqUHD8qSmG7rM=;
        b=AhN4dMYbUPaAuPE92E8DfNdm3OXsnhUtnlUYqdcBxrGrel8dS6i3f+XZ2F3jQgmsaR
         kzbL8Zr+1plu60XDe1RNDZUm2VwINH9Ih0rosyZ5CAspBkAM6lGsTvHHX0eTbHzmt6mI
         jtsF7KKu8Xxu8L92VigP4m2ULIY4PiXLsB8kq8zz5lGD6oFdKy/prLAPzgz12qrlBC3K
         Lpho7CHCMP/NvDqOsyIhndmzJ/QX3ueGTiEiAtPGoAnqXM6e89q/6HwnJ59wVrZ2kbS2
         9IvldeYip083CAoJaXxQ8kIl0/PrgonCsOCBq3QcBfOmiDpaFjyB08coSQgmJcVvE1bz
         9iCg==
X-Forwarded-Encrypted: i=1; AJvYcCXtIz16mi6xM2kucs8GO1g44n5+XPaVj/jsxByH8UwrR8clWoW6W2a3pjMN6VJSOt1/Fsksh+hQsdaPE36CSAgphP1b0phBK/U=
X-Gm-Message-State: AOJu0Yx2WagGW/HbEQ0uiKUS1WH84flE9c+YNPTKJtu5IVs+c4E4kCjA
	XtWVREEcXdLQ1+N5EUHLN/DnhoOroZV5sc5URqx7oOd0z/0wGCsl
X-Google-Smtp-Source: AGHT+IFkb663DNOyqdsore0QGUpv7EOg2/8eNJ3suh3po+h9pXROfK9knMlzsNFdFPcXReK5ys+FeQ==
X-Received: by 2002:a05:6512:54e:b0:52b:7945:a434 with SMTP id 2adb3069b0e04-52b8957aecfmr4486424e87.28.1717339016875;
        Sun, 02 Jun 2024 07:36:56 -0700 (PDT)
Received: from localhost ([178.178.142.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d75fe2sm961334e87.128.2024.06.02.07.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 07:36:56 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 07/10] net: pcs: xpcs: Add Synopsys DW xPCS platform device driver
Date: Sun,  2 Jun 2024 17:36:21 +0300
Message-ID: <20240602143636.5839-8-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240602143636.5839-1-fancer.lancer@gmail.com>
References: <20240602143636.5839-1-fancer.lancer@gmail.com>
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>, Jiawen Wu <jiawenwu@trustnetic.com>, Abhishek Chauhan <quic_abchauha@quicinc.com>, Sagar Cheluvegowda <quic_scheluve@quicinc.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, Andrew Halaney <ahalaney@redhat.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Synopsys DesignWare XPCS IP-core can be synthesized with the device CSRs
being accessible over the MCI or APB3 interface instead of the MDIO bus
(see the CSR_INTERFACE HDL parameter). Thus all the PCS registers can be
just memory mapped and be a subject of the standard MMIO operations of
course taking into account the peculiarities of the Clause C45 CSRs
mapping. From that perspective the DW XPCS devices would look as just
normal platform devices for the kernel.

On the other hand in order to have the DW XPCS devices handled by the
pcs-xpcs.c driver they need to be registered in the framework of the
MDIO-subsystem. So the suggested change is about providing a DW XPCS
platform device driver registering a virtual MDIO-bus with a single
MDIO-device representing the DW XPCS device.

DW XPCS platform device is supposed to be described by the respective
compatible string "snps,dw-xpcs" (or with the PMA-specific compatible
string), CSRs memory space and optional peripheral bus and reference clock
sources. Depending on the INDIRECT_ACCESS IP-core synthesize parameter the
memory-mapped reg-space can be represented as either directly or
indirectly mapped Clause 45 space. In the former case the particular
address is determined based on the MMD device and the registers offset (5
+ 16 bits all together) within the device reg-space. In the later case
there is only 8 lower address bits are utilized for the registers mapping
(255 CSRs). The upper bits are supposed to be written into the respective
viewport CSR in order to select the respective MMD sub-page.

Note, only the peripheral bus clock source is requested in the platform
device probe procedure. The core and pad clocks handling has been
implemented in the framework of the xpcs_create() method intentionally
since the clocks-related setups are supposed to be performed later, during
the DW XPCS main configuration procedures. (For instance they will be
required for the DW Gen5 10G PMA configuration.)

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

---

Changelog v2:
- This is a new patch created by merging in two former patches:
  [PATCH net-next 09/16] net: mdio: Add Synopsys DW XPCS management interface support
  [PATCH net-next 10/16] net: pcs: xpcs: Add generic DW XPCS MDIO-device support
- Drop inline'es from the statically defined in *.c methods. (@Maxime)
---
 drivers/net/pcs/Kconfig         |   6 +-
 drivers/net/pcs/Makefile        |   3 +-
 drivers/net/pcs/pcs-xpcs-plat.c | 460 ++++++++++++++++++++++++++++++++
 drivers/net/pcs/pcs-xpcs.c      |  63 ++++-
 drivers/net/pcs/pcs-xpcs.h      |   6 +
 include/linux/pcs/pcs-xpcs.h    |  18 ++
 6 files changed, 547 insertions(+), 9 deletions(-)
 create mode 100644 drivers/net/pcs/pcs-xpcs-plat.c

diff --git a/drivers/net/pcs/Kconfig b/drivers/net/pcs/Kconfig
index 87cf308fc6d8..f6aa437473de 100644
--- a/drivers/net/pcs/Kconfig
+++ b/drivers/net/pcs/Kconfig
@@ -6,11 +6,11 @@
 menu "PCS device drivers"
 
 config PCS_XPCS
-	tristate
+	tristate "Synopsys DesignWare Ethernet XPCS"
 	select PHYLINK
 	help
-	  This module provides helper functions for Synopsys DesignWare XPCS
-	  controllers.
+	  This module provides a driver and helper functions for Synopsys
+	  DesignWare XPCS controllers.
 
 config PCS_LYNX
 	tristate
diff --git a/drivers/net/pcs/Makefile b/drivers/net/pcs/Makefile
index fb1694192ae6..4f7920618b90 100644
--- a/drivers/net/pcs/Makefile
+++ b/drivers/net/pcs/Makefile
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for Linux PCS drivers
 
-pcs_xpcs-$(CONFIG_PCS_XPCS)	:= pcs-xpcs.o pcs-xpcs-nxp.o pcs-xpcs-wx.o
+pcs_xpcs-$(CONFIG_PCS_XPCS)	:= pcs-xpcs.o pcs-xpcs-plat.o \
+				   pcs-xpcs-nxp.o pcs-xpcs-wx.o
 
 obj-$(CONFIG_PCS_XPCS)		+= pcs_xpcs.o
 obj-$(CONFIG_PCS_LYNX)		+= pcs-lynx.o
diff --git a/drivers/net/pcs/pcs-xpcs-plat.c b/drivers/net/pcs/pcs-xpcs-plat.c
new file mode 100644
index 000000000000..5b706f6939a6
--- /dev/null
+++ b/drivers/net/pcs/pcs-xpcs-plat.c
@@ -0,0 +1,460 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Synopsys DesignWare XPCS platform device driver
+ *
+ * Copyright (C) 2024 Serge Semin
+ */
+
+#include <linux/atomic.h>
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mdio.h>
+#include <linux/module.h>
+#include <linux/pcs/pcs-xpcs.h>
+#include <linux/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/property.h>
+#include <linux/sizes.h>
+
+#include "pcs-xpcs.h"
+
+/* Page select register for the indirect MMIO CSRs access */
+#define DW_VR_CSR_VIEWPORT		0xff
+
+struct dw_xpcs_plat {
+	struct platform_device *pdev;
+	struct mii_bus *bus;
+	bool reg_indir;
+	int reg_width;
+	void __iomem *reg_base;
+	struct clk *pclk;
+};
+
+static ptrdiff_t xpcs_mmio_addr_format(int dev, int reg)
+{
+	return FIELD_PREP(0x1f0000, dev) | FIELD_PREP(0xffff, reg);
+}
+
+static u16 xpcs_mmio_addr_page(ptrdiff_t csr)
+{
+	return FIELD_GET(0x1fff00, csr);
+}
+
+static ptrdiff_t xpcs_mmio_addr_offset(ptrdiff_t csr)
+{
+	return FIELD_GET(0xff, csr);
+}
+
+static int xpcs_mmio_read_reg_indirect(struct dw_xpcs_plat *pxpcs,
+				       int dev, int reg)
+{
+	ptrdiff_t csr, ofs;
+	u16 page;
+	int ret;
+
+	csr = xpcs_mmio_addr_format(dev, reg);
+	page = xpcs_mmio_addr_page(csr);
+	ofs = xpcs_mmio_addr_offset(csr);
+
+	ret = pm_runtime_resume_and_get(&pxpcs->pdev->dev);
+	if (ret)
+		return ret;
+
+	switch (pxpcs->reg_width) {
+	case 4:
+		writel(page, pxpcs->reg_base + (DW_VR_CSR_VIEWPORT << 2));
+		ret = readl(pxpcs->reg_base + (ofs << 2));
+		break;
+	default:
+		writew(page, pxpcs->reg_base + (DW_VR_CSR_VIEWPORT << 1));
+		ret = readw(pxpcs->reg_base + (ofs << 1));
+		break;
+	}
+
+	pm_runtime_put(&pxpcs->pdev->dev);
+
+	return ret;
+}
+
+static int xpcs_mmio_write_reg_indirect(struct dw_xpcs_plat *pxpcs,
+					int dev, int reg, u16 val)
+{
+	ptrdiff_t csr, ofs;
+	u16 page;
+	int ret;
+
+	csr = xpcs_mmio_addr_format(dev, reg);
+	page = xpcs_mmio_addr_page(csr);
+	ofs = xpcs_mmio_addr_offset(csr);
+
+	ret = pm_runtime_resume_and_get(&pxpcs->pdev->dev);
+	if (ret)
+		return ret;
+
+	switch (pxpcs->reg_width) {
+	case 4:
+		writel(page, pxpcs->reg_base + (DW_VR_CSR_VIEWPORT << 2));
+		writel(val, pxpcs->reg_base + (ofs << 2));
+		break;
+	default:
+		writew(page, pxpcs->reg_base + (DW_VR_CSR_VIEWPORT << 1));
+		writew(val, pxpcs->reg_base + (ofs << 1));
+		break;
+	}
+
+	pm_runtime_put(&pxpcs->pdev->dev);
+
+	return 0;
+}
+
+static int xpcs_mmio_read_reg_direct(struct dw_xpcs_plat *pxpcs,
+				     int dev, int reg)
+{
+	ptrdiff_t csr;
+	int ret;
+
+	csr = xpcs_mmio_addr_format(dev, reg);
+
+	ret = pm_runtime_resume_and_get(&pxpcs->pdev->dev);
+	if (ret)
+		return ret;
+
+	switch (pxpcs->reg_width) {
+	case 4:
+		ret = readl(pxpcs->reg_base + (csr << 2));
+		break;
+	default:
+		ret = readw(pxpcs->reg_base + (csr << 1));
+		break;
+	}
+
+	pm_runtime_put(&pxpcs->pdev->dev);
+
+	return ret;
+}
+
+static int xpcs_mmio_write_reg_direct(struct dw_xpcs_plat *pxpcs,
+				      int dev, int reg, u16 val)
+{
+	ptrdiff_t csr;
+	int ret;
+
+	csr = xpcs_mmio_addr_format(dev, reg);
+
+	ret = pm_runtime_resume_and_get(&pxpcs->pdev->dev);
+	if (ret)
+		return ret;
+
+	switch (pxpcs->reg_width) {
+	case 4:
+		writel(val, pxpcs->reg_base + (csr << 2));
+		break;
+	default:
+		writew(val, pxpcs->reg_base + (csr << 1));
+		break;
+	}
+
+	pm_runtime_put(&pxpcs->pdev->dev);
+
+	return 0;
+}
+
+static int xpcs_mmio_read_c22(struct mii_bus *bus, int addr, int reg)
+{
+	struct dw_xpcs_plat *pxpcs = bus->priv;
+
+	if (addr != 0)
+		return -ENODEV;
+
+	if (pxpcs->reg_indir)
+		return xpcs_mmio_read_reg_indirect(pxpcs, MDIO_MMD_VEND2, reg);
+	else
+		return xpcs_mmio_read_reg_direct(pxpcs, MDIO_MMD_VEND2, reg);
+}
+
+static int xpcs_mmio_write_c22(struct mii_bus *bus, int addr, int reg, u16 val)
+{
+	struct dw_xpcs_plat *pxpcs = bus->priv;
+
+	if (addr != 0)
+		return -ENODEV;
+
+	if (pxpcs->reg_indir)
+		return xpcs_mmio_write_reg_indirect(pxpcs, MDIO_MMD_VEND2, reg, val);
+	else
+		return xpcs_mmio_write_reg_direct(pxpcs, MDIO_MMD_VEND2, reg, val);
+}
+
+static int xpcs_mmio_read_c45(struct mii_bus *bus, int addr, int dev, int reg)
+{
+	struct dw_xpcs_plat *pxpcs = bus->priv;
+
+	if (addr != 0)
+		return -ENODEV;
+
+	if (pxpcs->reg_indir)
+		return xpcs_mmio_read_reg_indirect(pxpcs, dev, reg);
+	else
+		return xpcs_mmio_read_reg_direct(pxpcs, dev, reg);
+}
+
+static int xpcs_mmio_write_c45(struct mii_bus *bus, int addr, int dev,
+			       int reg, u16 val)
+{
+	struct dw_xpcs_plat *pxpcs = bus->priv;
+
+	if (addr != 0)
+		return -ENODEV;
+
+	if (pxpcs->reg_indir)
+		return xpcs_mmio_write_reg_indirect(pxpcs, dev, reg, val);
+	else
+		return xpcs_mmio_write_reg_direct(pxpcs, dev, reg, val);
+}
+
+static struct dw_xpcs_plat *xpcs_plat_create_data(struct platform_device *pdev)
+{
+	struct dw_xpcs_plat *pxpcs;
+
+	pxpcs = devm_kzalloc(&pdev->dev, sizeof(*pxpcs), GFP_KERNEL);
+	if (!pxpcs)
+		return ERR_PTR(-ENOMEM);
+
+	pxpcs->pdev = pdev;
+
+	dev_set_drvdata(&pdev->dev, pxpcs);
+
+	return pxpcs;
+}
+
+static int xpcs_plat_init_res(struct dw_xpcs_plat *pxpcs)
+{
+	struct platform_device *pdev = pxpcs->pdev;
+	struct device *dev = &pdev->dev;
+	resource_size_t spc_size;
+	struct resource *res;
+
+	if (!device_property_read_u32(dev, "reg-io-width", &pxpcs->reg_width)) {
+		if (pxpcs->reg_width != 2 && pxpcs->reg_width != 4) {
+			dev_err(dev, "Invalid reg-space data width\n");
+			return -EINVAL;
+		}
+	} else {
+		pxpcs->reg_width = 2;
+	}
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "direct") ?:
+	      platform_get_resource_byname(pdev, IORESOURCE_MEM, "indirect");
+	if (!res) {
+		dev_err(dev, "No reg-space found\n");
+		return -EINVAL;
+	}
+
+	if (!strcmp(res->name, "indirect"))
+		pxpcs->reg_indir = true;
+
+	if (pxpcs->reg_indir)
+		spc_size = pxpcs->reg_width * SZ_256;
+	else
+		spc_size = pxpcs->reg_width * SZ_2M;
+
+	if (resource_size(res) < spc_size) {
+		dev_err(dev, "Invalid reg-space size\n");
+		return -EINVAL;
+	}
+
+	pxpcs->reg_base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(pxpcs->reg_base)) {
+		dev_err(dev, "Failed to map reg-space\n");
+		return PTR_ERR(pxpcs->reg_base);
+	}
+
+	return 0;
+}
+
+static int xpcs_plat_init_clk(struct dw_xpcs_plat *pxpcs)
+{
+	struct device *dev = &pxpcs->pdev->dev;
+	int ret;
+
+	pxpcs->pclk = devm_clk_get(dev, "pclk");
+	if (IS_ERR(pxpcs->pclk))
+		return dev_err_probe(dev, PTR_ERR(pxpcs->pclk),
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
+static int xpcs_plat_init_bus(struct dw_xpcs_plat *pxpcs)
+{
+	struct device *dev = &pxpcs->pdev->dev;
+	static atomic_t id = ATOMIC_INIT(-1);
+	int ret;
+
+	pxpcs->bus = devm_mdiobus_alloc_size(dev, 0);
+	if (!pxpcs->bus)
+		return -ENOMEM;
+
+	pxpcs->bus->name = "DW XPCS MCI/APB3";
+	pxpcs->bus->read = xpcs_mmio_read_c22;
+	pxpcs->bus->write = xpcs_mmio_write_c22;
+	pxpcs->bus->read_c45 = xpcs_mmio_read_c45;
+	pxpcs->bus->write_c45 = xpcs_mmio_write_c45;
+	pxpcs->bus->phy_mask = ~0;
+	pxpcs->bus->parent = dev;
+	pxpcs->bus->priv = pxpcs;
+
+	snprintf(pxpcs->bus->id, MII_BUS_ID_SIZE,
+		 "dwxpcs-%x", atomic_inc_return(&id));
+
+	/* MDIO-bus here serves as just a back-end engine abstracting out
+	 * the MDIO and MCI/APB3 IO interfaces utilized for the DW XPCS CSRs
+	 * access.
+	 */
+	ret = devm_mdiobus_register(dev, pxpcs->bus);
+	if (ret) {
+		dev_err(dev, "Failed to create MDIO bus\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+/* Note there is no need in the next function antagonist because the MDIO-bus
+ * de-registration will effectively remove and destroy all the MDIO-devices
+ * registered on the bus.
+ */
+static int xpcs_plat_init_dev(struct dw_xpcs_plat *pxpcs)
+{
+	struct device *dev = &pxpcs->pdev->dev;
+	struct mdio_device *mdiodev;
+	int ret;
+
+	/* There is a single memory-mapped DW XPCS device */
+	mdiodev = mdio_device_create(pxpcs->bus, 0);
+	if (IS_ERR(mdiodev))
+		return PTR_ERR(mdiodev);
+
+	/* Associate the FW-node with the device structure so it can be looked
+	 * up later. Make sure DD-core is aware of the OF-node being re-used.
+	 */
+	device_set_node(&mdiodev->dev, fwnode_handle_get(dev_fwnode(dev)));
+	mdiodev->dev.of_node_reused = true;
+
+	/* Pass the data further so the DW XPCS driver core could use it */
+	mdiodev->dev.platform_data = (void *)device_get_match_data(dev);
+
+	ret = mdio_device_register(mdiodev);
+	if (ret) {
+		dev_err(dev, "Failed to register MDIO device\n");
+		goto err_clean_data;
+	}
+
+	return 0;
+
+err_clean_data:
+	mdiodev->dev.platform_data = NULL;
+
+	fwnode_handle_put(dev_fwnode(&mdiodev->dev));
+	device_set_node(&mdiodev->dev, NULL);
+
+	mdio_device_free(mdiodev);
+
+	return ret;
+}
+
+static int xpcs_plat_probe(struct platform_device *pdev)
+{
+	struct dw_xpcs_plat *pxpcs;
+	int ret;
+
+	pxpcs = xpcs_plat_create_data(pdev);
+	if (IS_ERR(pxpcs))
+		return PTR_ERR(pxpcs);
+
+	ret = xpcs_plat_init_res(pxpcs);
+	if (ret)
+		return ret;
+
+	ret = xpcs_plat_init_clk(pxpcs);
+	if (ret)
+		return ret;
+
+	ret = xpcs_plat_init_bus(pxpcs);
+	if (ret)
+		return ret;
+
+	ret = xpcs_plat_init_dev(pxpcs);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int __maybe_unused xpcs_plat_pm_runtime_suspend(struct device *dev)
+{
+	struct dw_xpcs_plat *pxpcs = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(pxpcs->pclk);
+
+	return 0;
+}
+
+static int __maybe_unused xpcs_plat_pm_runtime_resume(struct device *dev)
+{
+	struct dw_xpcs_plat *pxpcs = dev_get_drvdata(dev);
+
+	return clk_prepare_enable(pxpcs->pclk);
+}
+
+const struct dev_pm_ops xpcs_plat_pm_ops = {
+	SET_RUNTIME_PM_OPS(xpcs_plat_pm_runtime_suspend,
+			   xpcs_plat_pm_runtime_resume,
+			   NULL)
+};
+
+DW_XPCS_INFO_DECLARE(xpcs_generic, DW_XPCS_ID_NATIVE, DW_XPCS_PMA_ID_NATIVE);
+DW_XPCS_INFO_DECLARE(xpcs_pma_gen1_3g, DW_XPCS_ID_NATIVE, DW_XPCS_PMA_GEN1_3G_ID);
+DW_XPCS_INFO_DECLARE(xpcs_pma_gen2_3g, DW_XPCS_ID_NATIVE, DW_XPCS_PMA_GEN2_3G_ID);
+DW_XPCS_INFO_DECLARE(xpcs_pma_gen2_6g, DW_XPCS_ID_NATIVE, DW_XPCS_PMA_GEN2_6G_ID);
+DW_XPCS_INFO_DECLARE(xpcs_pma_gen4_3g, DW_XPCS_ID_NATIVE, DW_XPCS_PMA_GEN4_3G_ID);
+DW_XPCS_INFO_DECLARE(xpcs_pma_gen4_6g, DW_XPCS_ID_NATIVE, DW_XPCS_PMA_GEN4_6G_ID);
+DW_XPCS_INFO_DECLARE(xpcs_pma_gen5_10g, DW_XPCS_ID_NATIVE, DW_XPCS_PMA_GEN5_10G_ID);
+DW_XPCS_INFO_DECLARE(xpcs_pma_gen5_12g, DW_XPCS_ID_NATIVE, DW_XPCS_PMA_GEN5_12G_ID);
+
+static const struct of_device_id xpcs_of_ids[] = {
+	{ .compatible = "snps,dw-xpcs", .data = &xpcs_generic },
+	{ .compatible = "snps,dw-xpcs-gen1-3g", .data = &xpcs_pma_gen1_3g },
+	{ .compatible = "snps,dw-xpcs-gen2-3g", .data = &xpcs_pma_gen2_3g },
+	{ .compatible = "snps,dw-xpcs-gen2-6g", .data = &xpcs_pma_gen2_6g },
+	{ .compatible = "snps,dw-xpcs-gen4-3g", .data = &xpcs_pma_gen4_3g },
+	{ .compatible = "snps,dw-xpcs-gen4-6g", .data = &xpcs_pma_gen4_6g },
+	{ .compatible = "snps,dw-xpcs-gen5-10g", .data = &xpcs_pma_gen5_10g },
+	{ .compatible = "snps,dw-xpcs-gen5-12g", .data = &xpcs_pma_gen5_12g },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, xpcs_of_ids);
+
+static struct platform_driver xpcs_plat_driver = {
+	.probe = xpcs_plat_probe,
+	.driver = {
+		.name = "dwxpcs",
+		.pm = &xpcs_plat_pm_ops,
+		.of_match_table = xpcs_of_ids,
+	},
+};
+module_platform_driver(xpcs_plat_driver);
+
+MODULE_DESCRIPTION("Synopsys DesignWare XPCS platform device driver");
+MODULE_AUTHOR("Signed-off-by: Serge Semin <fancer.lancer@gmail.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index e8d5fd43a357..8f7e3af64fcc 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -6,6 +6,7 @@
  * Author: Jose Abreu <Jose.Abreu@synopsys.com>
  */
 
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/pcs/pcs-xpcs.h>
 #include <linux/mdio.h>
@@ -1244,7 +1245,9 @@ static int xpcs_get_id(struct dw_xpcs *xpcs)
 		id |= ret;
 	}
 
-	xpcs->info.pcs = id;
+	/* Set the PCS ID if it hasn't been pre-initialized */
+	if (xpcs->info.pcs == DW_XPCS_ID_NATIVE)
+		xpcs->info.pcs = id;
 
 	/* Find out PMA/PMD ID from MMD 1 device ID registers */
 	ret = xpcs_read(xpcs, MDIO_MMD_PMAPMD, MDIO_DEVID1);
@@ -1263,7 +1266,9 @@ static int xpcs_get_id(struct dw_xpcs *xpcs)
 	ret = (ret >> 10) & 0x3F;
 	id |= ret << 16;
 
-	xpcs->info.pma = id;
+	/* Set the PMA ID if it hasn't been pre-initialized */
+	if (xpcs->info.pma == DW_XPCS_PMA_ID_NATIVE)
+		xpcs->info.pma = id;
 
 	return 0;
 }
@@ -1387,10 +1392,49 @@ static void xpcs_free_data(struct dw_xpcs *xpcs)
 	kfree(xpcs);
 }
 
+static int xpcs_init_clks(struct dw_xpcs *xpcs)
+{
+	static const char *ids[DW_XPCS_NUM_CLKS] = {
+		[DW_XPCS_CORE_CLK] = "core",
+		[DW_XPCS_PAD_CLK] = "pad",
+	};
+	struct device *dev = &xpcs->mdiodev->dev;
+	int ret, i;
+
+	for (i = 0; i < DW_XPCS_NUM_CLKS; ++i)
+		xpcs->clks[i].id = ids[i];
+
+	ret = clk_bulk_get_optional(dev, DW_XPCS_NUM_CLKS, xpcs->clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get clocks\n");
+
+	ret = clk_bulk_prepare_enable(DW_XPCS_NUM_CLKS, xpcs->clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable clocks\n");
+
+	return 0;
+}
+
+static void xpcs_clear_clks(struct dw_xpcs *xpcs)
+{
+	clk_bulk_disable_unprepare(DW_XPCS_NUM_CLKS, xpcs->clks);
+
+	clk_bulk_put(DW_XPCS_NUM_CLKS, xpcs->clks);
+}
+
 static int xpcs_init_id(struct dw_xpcs *xpcs)
 {
+	const struct dw_xpcs_info *info;
 	int i, ret;
 
+	info = dev_get_platdata(&xpcs->mdiodev->dev);
+	if (!info) {
+		xpcs->info.pcs = DW_XPCS_ID_NATIVE;
+		xpcs->info.pma = DW_XPCS_PMA_ID_NATIVE;
+	} else {
+		xpcs->info = *info;
+	}
+
 	ret = xpcs_get_id(xpcs);
 	if (ret < 0)
 		return ret;
@@ -1438,17 +1482,24 @@ static struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev,
 	if (IS_ERR(xpcs))
 		return xpcs;
 
+	ret = xpcs_init_clks(xpcs);
+	if (ret)
+		goto out_free_data;
+
 	ret = xpcs_init_id(xpcs);
 	if (ret)
-		goto out;
+		goto out_clear_clks;
 
 	ret = xpcs_init_iface(xpcs, interface);
 	if (ret)
-		goto out;
+		goto out_clear_clks;
 
 	return xpcs;
 
-out:
+out_clear_clks:
+	xpcs_clear_clks(xpcs);
+
+out_free_data:
 	xpcs_free_data(xpcs);
 
 	return ERR_PTR(ret);
@@ -1483,6 +1534,8 @@ void xpcs_destroy(struct dw_xpcs *xpcs)
 	if (!xpcs)
 		return;
 
+	xpcs_clear_clks(xpcs);
+
 	xpcs_free_data(xpcs);
 }
 EXPORT_SYMBOL_GPL(xpcs_destroy);
diff --git a/drivers/net/pcs/pcs-xpcs.h b/drivers/net/pcs/pcs-xpcs.h
index 369e9196f45a..fa05adfae220 100644
--- a/drivers/net/pcs/pcs-xpcs.h
+++ b/drivers/net/pcs/pcs-xpcs.h
@@ -6,6 +6,9 @@
  * Author: Jose Abreu <Jose.Abreu@synopsys.com>
  */
 
+#include <linux/bits.h>
+#include <linux/pcs/pcs-xpcs.h>
+
 /* Vendor regs access */
 #define DW_VENDOR			BIT(15)
 
@@ -117,6 +120,9 @@
 /* VR MII EEE Control 1 defines */
 #define DW_VR_MII_EEE_TRN_LPI		BIT(0)	/* Transparent Mode Enable */
 
+#define DW_XPCS_INFO_DECLARE(_name, _pcs, _pma)				\
+	static const struct dw_xpcs_info _name = { .pcs = _pcs, .pma = _pma }
+
 int xpcs_read(struct dw_xpcs *xpcs, int dev, u32 reg);
 int xpcs_write(struct dw_xpcs *xpcs, int dev, u32 reg, u16 val);
 int xpcs_read_vpcs(struct dw_xpcs *xpcs, int reg);
diff --git a/include/linux/pcs/pcs-xpcs.h b/include/linux/pcs/pcs-xpcs.h
index 1dc60f5e653f..813be644647f 100644
--- a/include/linux/pcs/pcs-xpcs.h
+++ b/include/linux/pcs/pcs-xpcs.h
@@ -7,6 +7,8 @@
 #ifndef __LINUX_PCS_XPCS_H
 #define __LINUX_PCS_XPCS_H
 
+#include <linux/clk.h>
+#include <linux/mdio.h>
 #include <linux/phy.h>
 #include <linux/phylink.h>
 #include <linux/types.h>
@@ -21,6 +23,7 @@
 struct dw_xpcs_desc;
 
 enum dw_xpcs_pcs_id {
+	DW_XPCS_ID_NATIVE = 0,
 	NXP_SJA1105_XPCS_ID = 0x00000010,
 	NXP_SJA1110_XPCS_ID = 0x00000020,
 	DW_XPCS_ID = 0x7996ced0,
@@ -28,6 +31,14 @@ enum dw_xpcs_pcs_id {
 };
 
 enum dw_xpcs_pma_id {
+	DW_XPCS_PMA_ID_NATIVE = 0,
+	DW_XPCS_PMA_GEN1_3G_ID,
+	DW_XPCS_PMA_GEN2_3G_ID,
+	DW_XPCS_PMA_GEN2_6G_ID,
+	DW_XPCS_PMA_GEN4_3G_ID,
+	DW_XPCS_PMA_GEN4_6G_ID,
+	DW_XPCS_PMA_GEN5_10G_ID,
+	DW_XPCS_PMA_GEN5_12G_ID,
 	WX_TXGBE_XPCS_PMA_10G_ID = 0x0018fc80,
 };
 
@@ -36,10 +47,17 @@ struct dw_xpcs_info {
 	u32 pma;
 };
 
+enum dw_xpcs_clock {
+	DW_XPCS_CORE_CLK,
+	DW_XPCS_PAD_CLK,
+	DW_XPCS_NUM_CLKS,
+};
+
 struct dw_xpcs {
 	struct dw_xpcs_info info;
 	const struct dw_xpcs_desc *desc;
 	struct mdio_device *mdiodev;
+	struct clk_bulk_data clks[DW_XPCS_NUM_CLKS];
 	struct phylink_pcs pcs;
 	phy_interface_t interface;
 };
-- 
2.43.0

