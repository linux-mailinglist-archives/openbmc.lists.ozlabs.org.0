Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E002AA2689C
	for <lists+openbmc@lfdr.de>; Tue,  4 Feb 2025 01:32:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yn47j1c6Tz3fml
	for <lists+openbmc@lfdr.de>; Tue,  4 Feb 2025 11:32:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738561439;
	cv=none; b=Xusfz0J1GBF080xOueNi/qiyX4kbacBevLuh6OqChzr7zXdEpvVzOsBTfmHTgdYq85o/mNK+4j2L/IPbLOWaCFj+amJItEh9VVjwVQZgpuU5LQg5hNSZyqLHXeN7PUac9/Wag5Uoto4HOj+zTTjuz5tVJzNe7tEuUPHuxWmFg59kDOFfDLQWYUBY3ToHahGWO+MR+QLw3xYstYbrG7hKZTIgEUNjEe2WIexFD0a1pQYYSlxE0WYRdtsWt9vA/KCggYvx3s5du9SV6noGAB6cPjXSHFRjzdUXEHzZoEPUqwWvS0Uackr+T9t2R5bmpaPXJqDz7DsxP8GYul6uKXJo1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738561439; c=relaxed/relaxed;
	bh=rf/ShRyvxTN8+33G5lApFqsieby0UFmnabOeDI9FQLs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bj6z7rvbK+HHOvWRW4G7qgI8wjMPsQj0dK1H4k5U0Lnnvhv7Hz1ogfJuVNRz5/rqCAmgxMzpOpdPjB+4tT/6Gm4GGuklw7KWkFAOgm5sVO9sS+j83wpVh82tI0KH+00X6W+6T+oGPS7t8R6KlQxyvOQUFcln4Z1d0HNLtXGesaEGB8gNm85S3ilFxaN78FpvgdMNM5un+AzT/0TpiTH0oyNk2ApoJB0jjs2eMkOxQl22jjYl+sC0XCtoiHohLAn3Qao/hgdb+0hL67MY4r6tRDIO2wtCxaRrVoaxQ9XBswnsVuIltLwprFRHRBdg8fSFLrUfRSwpeJDCGlseNwL8vg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dUe1L1JM; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dUe1L1JM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ymb5p4fx4z2xdr
	for <openbmc@lists.ozlabs.org>; Mon,  3 Feb 2025 16:43:58 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2167141dfa1so67692795ad.1
        for <openbmc@lists.ozlabs.org>; Sun, 02 Feb 2025 21:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738561436; x=1739166236; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rf/ShRyvxTN8+33G5lApFqsieby0UFmnabOeDI9FQLs=;
        b=dUe1L1JM5PZhVdzDYA13a1zLOPmvaNP+s/Q076hDq4eyuJcE9CH5nU6IvjHZ4aFfre
         yVZshtqP3H6C+3d6+K2hbLC6Kqwy80b/UaPIqt6sL2HO5rz4vhaZ0SfoZ/1OjotKnLCR
         v3VZyTBUa29qQE6fATsJRGRZeN4pKAZ7bqXUZyG0Ktg52DCuS4GgXqH/xhKzZMMIhyw+
         Z/THzZ3I/N5/aSewfZF5+deunmI6M+/jvdjPsmObfazxaXoRxXwKVgTAdy0dg4y//H+f
         vTS9TJt44lSPBDCat4ejGZDz/dgTtCFQpRhQV6Kv4+7wJpPnosEnWMZ1GR+q/pAvFkEu
         bdow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738561436; x=1739166236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rf/ShRyvxTN8+33G5lApFqsieby0UFmnabOeDI9FQLs=;
        b=FEwrgk9EisqZ2teRW/JyXfjDV2Adnv/CCU4Hy9PY9nXbu2or4ExWbm21LZmjSr0tQI
         Xa4Nxu60vXtxGqLbgsvh03smna3vGfqtZBrG0MsO5zK0EEc7CW6k9DhtJvSQzb/sQS1q
         jQ0t7gLsVEtLLz+GHdrMtUB2BFQF/YmHtR0Ct/05BdY1A7F8zjjBiLSTnzFoubJGcvEk
         wh8SBvlZxh7Gmtp58DpqFbqm75aND7aYBNTGioIZtUJog/UvkZ8MkTVU13sioKTw+c3H
         Dw6ZdozNOYUnzQERJtV8ZB8xKuJX4H4RRiwQBToF25AR6oSJ7Oou6X5EkAIYcsmF5NFj
         C20Q==
X-Forwarded-Encrypted: i=1; AJvYcCWmq+rKoADBHmQ3aOXNDwJDz0EDBrhDFt2MTIkENLg+Z+/KUcsxMK/iRqwt0ybH0xUJKkh7PZgZ@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxWHr9IujZhMZXh3AofjSL4QudrSyQfLaRFi870HawGc/YzqdYn
	5G5hHkc/eXY74GLkGSBSOWZvHNiKfXTUv2zV0FMCq+wofySiwXPq
X-Gm-Gg: ASbGncuW8rBqYqYga5go8fRzuHvE3NeKjNY1Ro6cxxn14X6N5S9VPxG10WIm+55MS4G
	BoM1yQxVzr7OcD9dD/RjvnS/oD3oIr2DaqiQLK3gRBSKC0n22DtIslz1gEbMBnc3diIC/Ca6yeG
	0MD8YZWmWyeWSlVQuO2+cbhurqj8BeB2R1UBjR8ffl+MGCGe9nN7u25jrMkCHF9lIF+fpK2qS1p
	8NVOdOSU3pEk0PHjhK96vA14iT30R1lo3ihr5xIaqF8N/sEZJ/KHLNO6S2Z1HVo8COSHB/oGPPQ
	HQe8VqLh+zUPb0+xdijQBkcPkWbiRK7lDIHMY1EGrvyGBSH2XIXlPyB2
X-Google-Smtp-Source: AGHT+IEFZ/36yBGHunOCtMy0HzmagZccJHEJhSVPNJSjo1bf8v5C2SzsrkRY+0DkSsg96GNkpYmziQ==
X-Received: by 2002:a17:902:c40e:b0:216:6ef9:60d with SMTP id d9443c01a7336-21edd86e506mr222878405ad.23.1738561436434;
        Sun, 02 Feb 2025 21:43:56 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32ea5fesm66894555ad.132.2025.02.02.21.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 21:43:56 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com
Subject: [PATCH net-next v8 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
Date: Mon,  3 Feb 2025 13:42:00 +0800
Message-Id: <20250203054200.21977-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203054200.21977-1-a0987203069@gmail.com>
References: <20250203054200.21977-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 04 Feb 2025 11:32:08 +1100
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
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com, Joey Lu <a0987203069@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, joabreu@synopsys.com, Andrew Lunn <andrew@lunn.ch>, schung@nuvoton.com, peppe.cavallaro@st.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add support for Gigabit Ethernet on Nuvoton MA35 series using dwmac driver.

The driver has been tested on the NuMaker-HMI-MA35D1-S1 development board,
and the log is attached below. For more information about the SoCs,
please refer to the MA35D1 series datasheet.

[    0.000000] Machine model: Nuvoton MA35D1-SOM
...
[    1.836386] nuvoton-dwmac 40120000.ethernet: IRQ eth_wake_irq not found
[    1.843039] nuvoton-dwmac 40120000.ethernet: IRQ eth_lpi not found
[    1.849304] nuvoton-dwmac 40120000.ethernet: IRQ sfty not found
[    1.856331] nuvoton-dwmac 40120000.ethernet: User ID: 0x10, Synopsys ID: 0x37
[    1.863532] nuvoton-dwmac 40120000.ethernet:         DWMAC1000
[    1.868750] nuvoton-dwmac 40120000.ethernet: DMA HW capability register supported
[    1.876190] nuvoton-dwmac 40120000.ethernet: RX Checksum Offload Engine supported
[    1.883696] nuvoton-dwmac 40120000.ethernet: COE Type 2
[    1.888903] nuvoton-dwmac 40120000.ethernet: TX Checksum insertion supported
[    1.895912] nuvoton-dwmac 40120000.ethernet: Enhanced/Alternate descriptors
[    1.902846] nuvoton-dwmac 40120000.ethernet: Enabled extended descriptors
[    1.909598] nuvoton-dwmac 40120000.ethernet: Ring mode enabled
[    1.915406] nuvoton-dwmac 40120000.ethernet: Enable RX Mitigation via HW Watchdog Timer
[    2.540881] nuvoton-dwmac 40130000.ethernet: IRQ eth_wake_irq not found
[    2.547463] nuvoton-dwmac 40130000.ethernet: IRQ eth_lpi not found
[    2.553626] nuvoton-dwmac 40130000.ethernet: IRQ sfty not found
[    2.560015] nuvoton-dwmac 40130000.ethernet: User ID: 0x10, Synopsys ID: 0x37
[    2.567116] nuvoton-dwmac 40130000.ethernet:         DWMAC1000
[    2.572300] nuvoton-dwmac 40130000.ethernet: DMA HW capability register supported
[    2.579747] nuvoton-dwmac 40130000.ethernet: RX Checksum Offload Engine supported
[    2.587198] nuvoton-dwmac 40130000.ethernet: COE Type 2
[    2.592395] nuvoton-dwmac 40130000.ethernet: TX Checksum insertion supported
[    2.599418] nuvoton-dwmac 40130000.ethernet: Enhanced/Alternate descriptors
[    2.606351] nuvoton-dwmac 40130000.ethernet: Enabled extended descriptors
[    2.613109] nuvoton-dwmac 40130000.ethernet: Ring mode enabled
[    2.618918] nuvoton-dwmac 40130000.ethernet: Enable RX Mitigation via HW Watchdog Timer

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 182 ++++++++++++++++++
 3 files changed, 195 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 4cc85a36a1ab..f083a0e97b75 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -121,6 +121,18 @@ config DWMAC_MESON
 	  the stmmac device driver. This driver is used for Meson6,
 	  Meson8, Meson8b and GXBB SoCs.
 
+config DWMAC_NUVOTON
+	tristate "Nuvoton MA35 dwmac support"
+	default ARCH_MA35
+	depends on OF && (ARCH_MA35 || COMPILE_TEST)
+	select MFD_SYSCON
+	help
+	  Support for Ethernet controller on Nuvoton MA35 series SoC.
+
+	  This selects the Nuvoton MA35 series SoC glue layer support
+	  for the stmmac device driver. The nuvoton-dwmac driver is
+	  used for MA35 series SoCs.
+
 config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index b26f0e79c2b3..48e25b85ea06 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_DWMAC_IPQ806X)	+= dwmac-ipq806x.o
 obj-$(CONFIG_DWMAC_LPC18XX)	+= dwmac-lpc18xx.o
 obj-$(CONFIG_DWMAC_MEDIATEK)	+= dwmac-mediatek.o
 obj-$(CONFIG_DWMAC_MESON)	+= dwmac-meson.o dwmac-meson8b.o
+obj-$(CONFIG_DWMAC_NUVOTON)	+= dwmac-nuvoton.o
 obj-$(CONFIG_DWMAC_QCOM_ETHQOS)	+= dwmac-qcom-ethqos.o
 obj-$(CONFIG_DWMAC_ROCKCHIP)	+= dwmac-rk.o
 obj-$(CONFIG_DWMAC_RZN1)	+= dwmac-rzn1.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
new file mode 100644
index 000000000000..588e2f234c5b
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
@@ -0,0 +1,182 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Nuvoton DWMAC specific glue layer
+ *
+ * Copyright (C) 2025 Nuvoton Technology Corp.
+ *
+ * Author: Joey Lu <a0987203069@gmail.com>
+ */
+
+#include <linux/mfd/syscon.h>
+#include <linux/of_device.h>
+#include <linux/of_net.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/stmmac.h>
+
+#include "stmmac.h"
+#include "stmmac_platform.h"
+
+#define NVT_REG_SYS_GMAC0MISCR  0x108
+#define NVT_REG_SYS_GMAC1MISCR  0x10C
+
+#define NVT_MISCR_RMII          BIT(0)
+
+/* Two thousand picoseconds are evenly mapped to a 4-bit field,
+ * resulting in each step being 2000/15 picoseconds.
+ */
+#define NVT_PATH_DELAY_STEP     134
+#define NVT_TX_DELAY_MASK       GENMASK(19, 16)
+#define NVT_RX_DELAY_MASK       GENMASK(23, 20)
+
+struct nvt_priv_data {
+	struct platform_device *pdev;
+	struct regmap *regmap;
+};
+
+static struct nvt_priv_data *
+nvt_gmac_setup(struct platform_device *pdev, struct plat_stmmacenet_data *plat)
+{
+	struct device *dev = &pdev->dev;
+	struct nvt_priv_data *bsp_priv;
+	phy_interface_t phy_mode;
+	u32 macid, arg, reg;
+	u32 tx_delay_step;
+	u32 rx_delay_step;
+	u32 miscr;
+
+	bsp_priv = devm_kzalloc(dev, sizeof(*bsp_priv), GFP_KERNEL);
+	if (!bsp_priv)
+		return ERR_PTR(-ENOMEM);
+
+	bsp_priv->regmap =
+		syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys", 1, &macid);
+	if (IS_ERR(bsp_priv->regmap)) {
+		dev_err_probe(dev, PTR_ERR(bsp_priv->regmap), "Failed to get sys register\n");
+		return ERR_PTR(-ENODEV);
+	}
+	if (macid > 1) {
+		dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (of_property_read_u32(dev->of_node, "tx-internal-delay-ps", &arg)) {
+		tx_delay_step = 0;
+	} else {
+		if (arg <= 2000) {
+			tx_delay_step = (arg == 2000) ? 0xf : (arg / NVT_PATH_DELAY_STEP);
+			dev_dbg(dev, "Set Tx path delay to 0x%x\n", tx_delay_step);
+		} else {
+			dev_err(dev, "Invalid Tx path delay argument.\n");
+			return ERR_PTR(-EINVAL);
+		}
+	}
+	if (of_property_read_u32(dev->of_node, "rx-internal-delay-ps", &arg)) {
+		rx_delay_step = 0;
+	} else {
+		if (arg <= 2000) {
+			rx_delay_step = (arg == 2000) ? 0xf : (arg / NVT_PATH_DELAY_STEP);
+			dev_dbg(dev, "Set Rx path delay to 0x%x\n", rx_delay_step);
+		} else {
+			dev_err(dev, "Invalid Rx path delay argument.\n");
+			return ERR_PTR(-EINVAL);
+		}
+	}
+
+	miscr = (macid == 0) ? NVT_REG_SYS_GMAC0MISCR : NVT_REG_SYS_GMAC1MISCR;
+	regmap_read(bsp_priv->regmap, miscr, &reg);
+	reg &= ~(NVT_TX_DELAY_MASK | NVT_RX_DELAY_MASK);
+
+	if (of_get_phy_mode(pdev->dev.of_node, &phy_mode)) {
+		dev_err(dev, "missing phy mode property\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	switch (phy_mode) {
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		reg &= ~NVT_MISCR_RMII;
+		break;
+	case PHY_INTERFACE_MODE_RMII:
+		reg |= NVT_MISCR_RMII;
+		break;
+	default:
+		dev_err(dev, "Unsupported phy-mode (%d)\n", phy_mode);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (!(reg & NVT_MISCR_RMII)) {
+		reg |= FIELD_PREP(NVT_TX_DELAY_MASK, tx_delay_step);
+		reg |= FIELD_PREP(NVT_RX_DELAY_MASK, rx_delay_step);
+	}
+
+	regmap_write(bsp_priv->regmap, miscr, reg);
+
+	bsp_priv->pdev = pdev;
+
+	return bsp_priv;
+}
+
+static int nvt_gmac_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
+	struct nvt_priv_data *priv_data;
+	int ret;
+
+	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
+	if (ret)
+		return ret;
+
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	if (IS_ERR(plat_dat))
+		return PTR_ERR(plat_dat);
+
+	/* Nuvoton DWMAC configs */
+	plat_dat->has_gmac = 1;
+	plat_dat->tx_fifo_size = 2048;
+	plat_dat->rx_fifo_size = 4096;
+	plat_dat->multicast_filter_bins = 0;
+	plat_dat->unicast_filter_entries = 8;
+	plat_dat->flags &= ~STMMAC_FLAG_USE_PHY_WOL;
+
+	priv_data = nvt_gmac_setup(pdev, plat_dat);
+	if (IS_ERR(priv_data))
+		return PTR_ERR(priv_data);
+
+	ret = stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
+	if (ret)
+		return ret;
+
+	/* The PMT flag is determined by the RWK property.
+	 * However, our hardware is configured to support only MGK.
+	 * This is an override on PMT to enable WoL capability.
+	 */
+	plat_dat->pmt = 1;
+	device_set_wakeup_capable(&pdev->dev, 1);
+
+	return 0;
+}
+
+static const struct of_device_id nvt_dwmac_match[] = {
+	{ .compatible = "nuvoton,ma35d1-dwmac"},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, nvt_dwmac_match);
+
+static struct platform_driver nvt_dwmac_driver = {
+	.probe  = nvt_gmac_probe,
+	.remove = stmmac_pltfr_remove,
+	.driver = {
+		.name           = "nuvoton-dwmac",
+		.pm		= &stmmac_pltfr_pm_ops,
+		.of_match_table = nvt_dwmac_match,
+	},
+};
+module_platform_driver(nvt_dwmac_driver);
+
+MODULE_AUTHOR("Joey Lu <a0987203069@gmail.com>");
+MODULE_DESCRIPTION("Nuvoton DWMAC specific glue layer");
+MODULE_LICENSE("GPL");
-- 
2.34.1

