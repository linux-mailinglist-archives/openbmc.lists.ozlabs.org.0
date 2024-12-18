Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E429F6FAA
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2024 22:43:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YD6bz4z6Dz3cBK
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2024 08:42:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734522306;
	cv=none; b=C3zONZkTd7yLC0KuiFb3QEemnA5gmHG8DwXIy7pdksgDcmyvWWWrBNbhnTLS5xkjY1zokqBqep3bnweLSQcn2eMqh5EoxcvCKgkEQwgo6IIyQRyOlTtnI0kt4vNI9P7vCxrY8EAYQcbNpTnU6JX+E9QZX+3JMuxenpHRiO00YVlbBKFAlbDI4L0bfCWfewE0umwGAamuve1/nQhYXwP4O22sAShEhSoZchJCy3LPyfQNabLGWkeJIK4i8YZdF8wSuupEgY6GigYk4eV5UBsm2WqZXNYKdTggW/qCxw3InkMBQ3gMsCyzlVK1KD1Kk0zWu2Qs124oO2tv60bdNteEBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734522306; c=relaxed/relaxed;
	bh=NiozAIbAch5ehbFvYachJlRvMKlUEEfH30ZvBdsBbJM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aDSQ4QNO+uya755NdjOxa+FrSD4tkuBiltmDqgAMjY25ut/QC0a7D9GJaNrkagQCMTdaTQkAwRtzablH3QeCGqqku+PBIaLCG1XUfoHIEY7XLwayeJVI7VO7hSyhcF/Y+s+g8BD1hHO5PKuz6WAm+2NvHD+2/1QgfMNGNQlrTYEKZulkLBghh5qwKNkqS7WYKCAk9u38P1VVvhb2tqbZMzn5bK5Oc69pvg3WV9TgV0RBkHzKfknHVD+A1xYj3PWh+NFOgLS8lDky9GvdYnJ5sbVkKql4BuhTJajicvoC3tI0mcz+FNDN0p61515Ab/a6Rhmtsi8ChTw4eW8yP/nWMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Cwivd9Ez; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Cwivd9Ez;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCsL93hsMz30CD
	for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2024 22:45:05 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-7fc93152edcso524426a12.0
        for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2024 03:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734522303; x=1735127103; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NiozAIbAch5ehbFvYachJlRvMKlUEEfH30ZvBdsBbJM=;
        b=Cwivd9Ezl+S3ZDvGbKkk+dorU9HVmbQeSwjR+XYU2mvHF0f9bS2NmwOzUKaoY7keZB
         ES8hJGoaCvZ31JDOYRiiLjqeWxy46UV9yQF0BOdobyVK02cddvLK2hHdynz5CwcBc4VO
         IFhzK2njTU0d4tdjrpaexJQzNkRexanOsAl2BTZhxKE1XDSMj3wp+hPD+GzkMCSayinx
         ZqPCMMBfrAf7gbapWHvVybMLO9D9gzuG8WALRczDsfCyah/zJPzgtKB1M+7SXsWd0hSp
         IYOcsvVmG8DwmuMQpFCsj8JSP4gAiNvkgHiIqjyYS1hKfwnfe3OTKI1gUT3N6FeqxPtC
         RmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734522303; x=1735127103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NiozAIbAch5ehbFvYachJlRvMKlUEEfH30ZvBdsBbJM=;
        b=Ak3QVfFjAUETVZixoE5nXyjW4ooMwESpLYK7YNfRxxvXjfvwy4bAy5t1jr/Jyy+ajj
         FtNWyTwzR+iHEJ/1qSdO9uoQu69CIXovRJu2vd0PRL+cFJAgI91bjMEpdCrHotcFDYSW
         mizLGbzU2r/dF1IMV/skrSoooA8FzF6xQTFKzSv09PYqp35F0fK2U6zhZYpL1uBYiEc7
         4Dt5Flg5cAgm8rufTezmibDhQEI6dccKKeHQLDdXnsHI7TNaWcJW+c/Ipj1qdQcU5oLq
         db8zliVojlE/3bhvK7rECx9DnSRFatGE9Wds6GOZG2WTKnsyw2CeiA0A+VNisx88nrbI
         x+pg==
X-Forwarded-Encrypted: i=1; AJvYcCXZg+pfu49H23Vu3pXuCw1IY8MwGQJ4IMjJ/gzxQIEqj14jYe0Duo6hXtkoo40iCgK4uo9NzQ7n@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyQe6BulAgZc4AucJsbeZCGZSdmpWahh2qgstipKkvnO+78m1eN
	zpsqlA19mP7S6XREIbK6yWhi7c/5DjHSNDkLxes/5FiDZr6On2Lx
X-Gm-Gg: ASbGnct20tN3DkMGk98jIsV/F4O2iEZPc95opXLMLgXQKrywNk3BSJGL9etnaSZvOcF
	lrbWuJUh9qWfkFjQaBEukgoIZ7K+3I/Q4sPRdQKWXWDG4pXQURP0/Pg3f7PkEQatAFcOGF8eZDA
	MZrzxE6lOQm4h9m/Tu7diCeqNiy6z8Lu3F4+TbTjvUbaX5V2GOJnT4yvSeQv+Db1IyJLoDqDMXi
	1VhVgeaz71QwiAhzI5M0nkcRENdC7DEnwCvPSb271vOnCuxRqp0Nd2YkU15WRvbNLpyTH4cRms6
	PYCDD0yRKqrI+9kOfqqRPw==
X-Google-Smtp-Source: AGHT+IE6625a3zz+jwuwR+ZM2W8rdYS+MlxZLIdkTumi+AeaBxvzwCMuG/fLPvKuIAteZsDbVs/QmQ==
X-Received: by 2002:a17:90b:1e4c:b0:2ee:e2f6:8abc with SMTP id 98e67ed59e1d1-2f2d87f672fmr9972766a91.10.1734522302783;
        Wed, 18 Dec 2024 03:45:02 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed62cddbsm1324362a91.15.2024.12.18.03.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 03:45:02 -0800 (PST)
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
Subject: [PATCH v5 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
Date: Wed, 18 Dec 2024 19:44:42 +0800
Message-Id: <20241218114442.137884-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241218114442.137884-1-a0987203069@gmail.com>
References: <20241218114442.137884-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 19 Dec 2024 08:42:42 +1100
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
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com, Joey Lu <a0987203069@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, joabreu@synopsys.com, schung@nuvoton.com, peppe.cavallaro@st.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add support for Gigabit Ethernet on Nuvoton MA35 series using dwmac driver.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 182 ++++++++++++++++++
 3 files changed, 194 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 6658536a4e17..c8cbc0ec1311 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -121,6 +121,17 @@ config DWMAC_MESON
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
+	  for the stmmac device driver.
+
 config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index 2389fd261344..9812b824459f 100644
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
index 000000000000..c5b8933c1f44
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
@@ -0,0 +1,182 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Nuvoton DWMAC specific glue layer
+ *
+ * Copyright (C) 2024 Nuvoton Technology Corp.
+ *
+ * Author: Joey Lu <yclu4@nuvoton.com>
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
+#define REG_SYS_GMAC0MISCR  0x108
+#define REG_SYS_GMAC1MISCR  0x10C
+
+#define MISCR_RMII          BIT(0)
+
+/* 2000ps is mapped to 0 ~ 0xF */
+#define PATH_DELAY_DEC      134
+#define TX_DELAY_OFFSET     16
+#define TX_DELAY_MASK       GENMASK(19, 16)
+#define RX_DELAY_OFFSET     20
+#define RX_DELAY_MASK       GENMASK(23, 20)
+
+struct nvt_priv_data {
+	struct platform_device *pdev;
+	struct regmap *regmap;
+};
+
+static struct nvt_priv_data *
+nuvoton_gmac_setup(struct platform_device *pdev, struct plat_stmmacenet_data *plat)
+{
+	struct device *dev = &pdev->dev;
+	struct nvt_priv_data *bsp_priv;
+	phy_interface_t phy_mode;
+	u32 tx_delay, rx_delay;
+	u32 macid, arg, reg;
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
+		tx_delay = 0; /* Default value is 0 */
+	} else {
+		if (arg <= 2000) {
+			tx_delay = (arg == 2000) ? 0xF : (arg / PATH_DELAY_DEC);
+			dev_dbg(dev, "Set Tx path delay to 0x%x\n", tx_delay);
+		} else {
+			dev_err(dev, "Invalid Tx path delay argument.\n");
+			return ERR_PTR(-EINVAL);
+		}
+	}
+	if (of_property_read_u32(dev->of_node, "rx-internal-delay-ps", &arg)) {
+		rx_delay = 0; /* Default value is 0 */
+	} else {
+		if (arg <= 2000) {
+			rx_delay = (arg == 2000) ? 0xF : (arg / PATH_DELAY_DEC);
+			dev_dbg(dev, "Set Rx path delay to 0x%x\n", rx_delay);
+		} else {
+			dev_err(dev, "Invalid Rx path delay argument.\n");
+			return ERR_PTR(-EINVAL);
+		}
+	}
+
+	regmap_read(bsp_priv->regmap,
+		    macid == 0 ? REG_SYS_GMAC0MISCR : REG_SYS_GMAC1MISCR, &reg);
+	reg &= ~(TX_DELAY_MASK | RX_DELAY_MASK);
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
+		reg &= ~MISCR_RMII;
+		break;
+	case PHY_INTERFACE_MODE_RMII:
+		reg |= MISCR_RMII;
+		break;
+	default:
+		dev_err(dev, "Unsupported phy-mode (%d)\n", phy_mode);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (!(reg & MISCR_RMII)) {
+		reg |= tx_delay << TX_DELAY_OFFSET;
+		reg |= rx_delay << RX_DELAY_OFFSET;
+	}
+
+	regmap_write(bsp_priv->regmap,
+		     macid == 0 ? REG_SYS_GMAC0MISCR : REG_SYS_GMAC1MISCR, reg);
+
+	bsp_priv->pdev = pdev;
+
+	return bsp_priv;
+}
+
+static int nuvoton_gmac_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
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
+	plat_dat->bsp_priv = nuvoton_gmac_setup(pdev, plat_dat);
+	if (IS_ERR(plat_dat->bsp_priv)) {
+		ret = PTR_ERR(plat_dat->bsp_priv);
+		return ret;
+	}
+
+	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
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
+static const struct of_device_id nuvoton_dwmac_match[] = {
+	{ .compatible = "nuvoton,ma35d1-dwmac"},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, nuvoton_dwmac_match);
+
+static struct platform_driver nuvoton_dwmac_driver = {
+	.probe  = nuvoton_gmac_probe,
+	.remove = stmmac_pltfr_remove,
+	.driver = {
+		.name           = "nuvoton-dwmac",
+		.pm		= &stmmac_pltfr_pm_ops,
+		.of_match_table = nuvoton_dwmac_match,
+	},
+};
+module_platform_driver(nuvoton_dwmac_driver);
+
+MODULE_AUTHOR("Joey Lu <yclu4@nuvoton.com>");
+MODULE_DESCRIPTION("Nuvoton DWMAC specific glue layer");
+MODULE_LICENSE("GPL v2");
-- 
2.34.1

