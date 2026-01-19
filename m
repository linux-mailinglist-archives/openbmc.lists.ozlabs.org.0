Return-Path: <openbmc+bounces-1241-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6C2D3BA5B
	for <lists+openbmc@lfdr.de>; Mon, 19 Jan 2026 23:06:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dw4Kc41mdz2yFK;
	Tue, 20 Jan 2026 09:06:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768808043;
	cv=none; b=fnOddco3OZ5tr+dmNKEewaa5pYNEII2N5rPuuVag9TF15beU3F/41G55fxA6SbtJeS+3X5Bc1CtDP0pZ16eAy51XEl1oHIEzbkC7Wmrqfc9afcuEG8NiDeecubD+lMq3WgpNp36SUVfuDO0DP4yzB5z14+TjlB9H1PtN/98aiJ9YzGGBE0Zmytn6Ljh0OkET7Vxpz2ecg8xKN0M1Pgx25MWQmYPc6/M15A5QiVrnRjbZQgGWJLrTZEVCmNvmnIVbj24v8865G+85QRKovz6YNftwEsL0dr8yGGN3A8atUrfqus2lbDP2XJKq69LUtHgpfuuBvYpYZ+DlzPfXvM9wZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768808043; c=relaxed/relaxed;
	bh=Ybf9Yq4UjuLMbNCxcGaRkMzoJjb7+v4gNLMMg1+C2V4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n1MlsOmQUMQJyJt9kqM3HAIW3OgbwG+XfcErX8QlvAfM0h2m9wdY9PQJ562YfqwMb9NOVO1U9/l3XIjmB9fXwR8dyp6I19LBQaP669K03vDtIJTqsAK3J2f0ODPcpXGqJ38najT16ORHdVKlUv9MYbZcfotpu9wTmCzukXjy+so0XGjy0+MVjjUt8qK0r4BQlhBi8b/NuzC5IiABe+2tPpdQe/tOjbiJMCvROKPC37S1s9YrPsddOto/vOzluNKfMDl5obJWEBcDIbP2BllL1+r+fjrQdHMjgG+XBa3IPSrPidw9XL7b5M5XJvvdEhJJ5pMMDQcF5N3G1JruWe+/1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aLI5zxxb; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aLI5zxxb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvhzG5vSQz2xHW
	for <openbmc@lists.ozlabs.org>; Mon, 19 Jan 2026 18:34:02 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2a0fe77d141so26347045ad.1
        for <openbmc@lists.ozlabs.org>; Sun, 18 Jan 2026 23:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768808041; x=1769412841; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ybf9Yq4UjuLMbNCxcGaRkMzoJjb7+v4gNLMMg1+C2V4=;
        b=aLI5zxxbrJN80XcNQGWOKxPS3T1jGjjmd6Dn8Uk/ayIIaP5Ybj+7zpXm8dd7n5rtqZ
         5o5v60S3XsK2C9QVcZdkyUh1/Bm0UvftZqIKXdPMEoKvv49xn5IDw4GKqv9BjH0+I978
         AB6D3Fx3TJiNDSe4CStY1i+YxV/T3mO8l7mBeme0I61VNgk2MqSh2GXAFe6DYhwCGUSU
         5wg5ZlNVK6NJfodAxHYF5hFQs2bw9bSGQ2Vcjq+Z0LdRGEMUW46R4A/94szSih4AYYAB
         45b1S8citMTKZ/Z4lxk8kiI85YpcUOBu/dkTof6Ia/BB9EEEPxdGVU1fYsf6O7PSYwg3
         il6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768808041; x=1769412841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ybf9Yq4UjuLMbNCxcGaRkMzoJjb7+v4gNLMMg1+C2V4=;
        b=dfPXbKr+ZcmzReyKMLrswCVrf7M3fPmRdxrSx6lY++SjjT7Mr980SeCyraRyN4SlEE
         mGh51kScK5SNmpCPnwIk2rzbKGks4iBiRUCtiJfrqWwrAWSt2ZDoFxqvBhyMhnJDHx/E
         Fzbrtem2R8Qll+gpISwVZVRyV8roczfbDRu+wbpoctmoUyxKdyLPBKZW3OyWvmDIKJwk
         ksR+kuHnnr8xZYpXF+/OqDE8fzSboHbrG/uTH5ocZc5uCmtySf7FuqKMOEHoVnmsNdGz
         U9aJW4OGz+Ry05BDFN444PuRQ5JJkM3skUlxSTTw8vQpprQpA25bmC6DaMqK7WTUVSbE
         uW7A==
X-Forwarded-Encrypted: i=1; AJvYcCVPoHjT4swnic4Tu48WSW9RbRuLOg22tifaCGMALPfjpmGdpymOTBJllw41vVpl5KQhdQzIVYFU@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwdY8Uv5sQBbSO8tYwFun7d4EsJEpfG9QEc3Q/lepyGVnO0fd6l
	BmU5W3U0zcy3jfBtppI4IyG5N2Xg0grqOihBUYwPYcFKm+F7PQpijDv3
X-Gm-Gg: AZuq6aJHvjkB7rr7tJVoZ/146ItM8rwdHgNkBWd3tNE/MKdPjt96OWSsvKHgFQ8RyBv
	nNklxgGXBQeaLLSlKb9EwYOtX4BpK928D/qB01Wk2yxSY//taP1vc3RxZnlIPhPz/PO7vol5diP
	14fxIHet5C4+NZ2joofTLra2NrQeBZ7OzlHSC9SIJcP3dxwPmOaR2bF1fbUxjxiJ03VW+A/gtm/
	x+pc0K3jlHV6bAQAhDnzhscfIGfjVNUMRYQJtYi+/QhZhxCAHVa9bHCUVbisvfGIL6wNz8TvPWB
	mfyDta7tp93ZfxI3uBnlthl8RSJLUDn9H2dsRKlg7jMwB8pgH2TOM7iekxSCQhacdHEay2MfTgr
	KgfWDaAQHFwm1PrZIiTMxKJrGOPs0hLO7qA6bXFHxdb9CrX9++w4CkAktBqrI8UgkY41uAE0EuU
	ttfwi2EfAKQFm8CTPpxOoa9aaog61U3kxsu8yEtJTvwz+VpBqbgrak26bEdF6DCELcxSEoUjV2
X-Received: by 2002:a17:902:eccc:b0:29f:1fb:730d with SMTP id d9443c01a7336-2a717552deamr101918275ad.25.1768808040733;
        Sun, 18 Jan 2026 23:34:00 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71941e3cdsm84863325ad.100.2026.01.18.23.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 23:34:00 -0800 (PST)
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
Cc: alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Joey Lu <a0987203069@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v8 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton  MA35 family
Date: Mon, 19 Jan 2026 15:33:41 +0800
Message-ID: <20260119073342.3132502-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119073342.3132502-1-a0987203069@gmail.com>
References: <20260119073342.3132502-1-a0987203069@gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add support for Gigabit Ethernet on Nuvoton MA35 series using dwmac driver.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 174 ++++++++++++++++++
 3 files changed, 187 insertions(+)
 create mode 100755 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 07088d03dbab..861f1c6c14f1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -132,6 +132,18 @@ config DWMAC_MESON
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
index c9263987ef8d..4ade030b634f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_DWMAC_IPQ806X)	+= dwmac-ipq806x.o
 obj-$(CONFIG_DWMAC_LPC18XX)	+= dwmac-lpc18xx.o
 obj-$(CONFIG_DWMAC_MEDIATEK)	+= dwmac-mediatek.o
 obj-$(CONFIG_DWMAC_MESON)	+= dwmac-meson.o dwmac-meson8b.o
+obj-$(CONFIG_DWMAC_NUVOTON)	+= dwmac-nuvoton.o
 obj-$(CONFIG_DWMAC_QCOM_ETHQOS)	+= dwmac-qcom-ethqos.o
 obj-$(CONFIG_DWMAC_RENESAS_GBETH) += dwmac-renesas-gbeth.o
 obj-$(CONFIG_DWMAC_ROCKCHIP)	+= dwmac-rk.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
new file mode 100755
index 000000000000..728f5f453515
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
@@ -0,0 +1,174 @@
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
+	plat_dat->core_type = DWMAC_CORE_GMAC;
+	plat_dat->tx_fifo_size = 2048;
+	plat_dat->rx_fifo_size = 4096;
+	plat_dat->multicast_filter_bins = 0;
+	plat_dat->unicast_filter_entries = 8;
+
+	priv_data = nvt_gmac_setup(pdev, plat_dat);
+	if (IS_ERR(priv_data))
+		return PTR_ERR(priv_data);
+
+	ret = stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
+	if (ret)
+		return ret;
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
2.43.0


