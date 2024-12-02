Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB709E0F09
	for <lists+openbmc@lfdr.de>; Mon,  2 Dec 2024 23:50:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2JrK4wm5z3frY
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2024 09:49:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733107035;
	cv=none; b=ZqP9Ikf82Y8yda00+QAYhOXn4HPaxjf4M6wWjc79WKvCE8UvjBoemdW+ny9o6dDYHA6Dlbd/1wxQzoivBHveD5iunDlc2d7EvGovSbfpPllZlA01rpydFpFsA2cZenY3XAw2jbjULMSeygJBGQrOr2QwgcV2KZTWhKRIWw904NouXHwziCNdBmdZmJkG/W67R/xPmQ+lk17YnH9JFxTuheNw1bHD5Qt4h/RoxYsV3cWszzY7/lGgX/+9spC6Dq8XEVoeHA2ZgFh1i/0LzR+DgPsIZcwe4LrRAH+FlI+c2oCE+QTR0FceoLqiqMR/sffn6KqzImxo+PGW8kkYdA8/bg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733107035; c=relaxed/relaxed;
	bh=CB1gc44K87Zx/e8BKj+glmThcSf/y+P7e3BC8hfkr4c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g+XiLCuBxsJuOF7oaEg6tb4+doRTWvbB+bqnznWvS5N8c3xKkl23kSLnOWN0Zfn094BsWqeckSZjhImQMIXP58ryjL5cQ0nbG6NVInXSg6k8LvbvB31WRzVt29xxNU9hnI1KNstUItBAQ/bAuwb8EqEWHVKOWuaB63BIFr5U7ljBHirn+q7LVBIHx5b09ROlBudzZ5aFWYKkIaY4TGmvHgoeQK4/OJjn3bMnzksIa9B4I7WvDW0M95nUh7zlBxv7WL3xWZk00Optb0GoMlOJVCCtUahO6q30VhMfVmROM/Z6hu2eT7DFmXBwDRLB74RpHshPoYDC5EUH0s70qwH1XA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OKlrvdMT; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OKlrvdMT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y1nxQ4Ntdz2yh2
	for <openbmc@lists.ozlabs.org>; Mon,  2 Dec 2024 13:37:14 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2155157c58cso11939005ad.0
        for <openbmc@lists.ozlabs.org>; Sun, 01 Dec 2024 18:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733107032; x=1733711832; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CB1gc44K87Zx/e8BKj+glmThcSf/y+P7e3BC8hfkr4c=;
        b=OKlrvdMTUHbm7u9A3m6rVXVO5/WpbuKOc5J8losn0jXzBrNkBSS1HyCw4Lc3lqRu/q
         JQQJlK3zESsYUi7c4f7Jy6GIZklJQ/B620q+DV1kXOeQneiwLm8kQkGT5zNAp12fd7SD
         b1Ylx19NVR0hd1f4rnkBXKA4P+zonZG/FgwUAdK+TpgDipwkeOB+X1dC4p74TVlhkHJr
         P1MNa8Y0ijLPS8b/xmQ/zgf8U9ozoGNg+4hFY5LBOCsFIVaFW19OP1YWjaZ8p6nwI+Zj
         JP+8Sb4fPxXiQtv8iYss2BVdmhd1HtEpJQQOc9GVUVv1Sg4frgoaHALI1G470JXgtciT
         xl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733107032; x=1733711832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CB1gc44K87Zx/e8BKj+glmThcSf/y+P7e3BC8hfkr4c=;
        b=NsfQt2oNS1gUVE/eifbrkiIhBvkUNywfXVKm79AbW91MCmq0CKcCKVkxBfjiadOiDv
         eWgRhkzwq3ASLIo8Zgrba3mjlzIkv6Rgx3sp0pyPFsah+B0Qsf0S6k/gwMK0g9iw4+Mk
         tXzeONkcg64IK3teYoebiRr6B6hdCiCwba5Zd9AqUaIm0lMBXwDMBTzdcgHjH9MuX8n7
         v3PmQd+qZLbZovhZLLCSkA29vz7BNU4jtM8dWjcPprfMbCBr1f8G39gcrPVzxf/IXPMp
         teaV/MSLcxa/7PC1P1I0u4vdh0JhRMzyOtWKxdjrdjbyodEIMGeHXwxqdfHWwBgGBea7
         fV7w==
X-Forwarded-Encrypted: i=1; AJvYcCXzi3Dxa+7Ytg6/QH7/FQeIpMnAzjZn95JltlBOOT2adiehhcx2peBy4zXWtAyOR/BblcK5JNJX@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy7e6semKOcOeDQafVs3RQj6gufny6x4qVhWw3nUbc3BfpJnZiG
	WOZt0Vu/fapjx+JvlBI7FyeyLWcMSXXmCj22ETcvv1IzGWEAdvEi
X-Gm-Gg: ASbGncvToxAAeSE7beg0VvEKsx9gjHC45wFl84LURCbXP0Pefkj4S2mq7wx8zIbdVCE
	3pE6KZgkBwhHl6X0iV1+FbGB0ioDN1wGx3xmZehlcX16IfsgXD2pThNaidRHynLUvtdz/L47XNJ
	bhXhV8Iy3oh29rUpI2mNNXXxVuq1tIfmYuaKlXRCYyk5u0w4D66XNEJw/ZqHF7mZ8oS/wxfakNs
	hwknSSnU++ANi6YvhXXaHLtIhwxfRtGVE/BLbIw/URib5EwpjIS65MUO1/1WaIjFdWK0aQ0imyZ
	5u+PsLhoEppcmds=
X-Google-Smtp-Source: AGHT+IFmmiRmnhtjmaill+eHoeCyv73QoSMvQDoM0KoIwEs5kK7srVuN5Wk8FHAy5MamwgF94ZrlnQ==
X-Received: by 2002:a17:902:d483:b0:215:4662:db7a with SMTP id d9443c01a7336-2154662dd3dmr141843645ad.54.1733107032359;
        Sun, 01 Dec 2024 18:37:12 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2159ebee334sm2306375ad.67.2024.12.01.18.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 18:37:11 -0800 (PST)
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
Subject: [PATCH v4 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
Date: Mon,  2 Dec 2024 10:36:43 +0800
Message-Id: <20241202023643.75010-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202023643.75010-1-a0987203069@gmail.com>
References: <20241202023643.75010-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 03 Dec 2024 09:49:25 +1100
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
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 179 ++++++++++++++++++
 3 files changed, 191 insertions(+)
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
index 000000000000..eed852cb13ab
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
@@ -0,0 +1,179 @@
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
+	/* We support WoL by magic packet, override pmt to make it work! */
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

