Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C79A01C6F
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 00:15:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRCmB6qHdz88mZ
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 10:13:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1035"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735886001;
	cv=none; b=fhDME3mtpbr/tiSAJpLf2Nuy51dIvokyTJF7SzW0ptzg6nIkbGP89ItPp0u4oTMYYb9Zuxlry3gMnvqc5s4nSlo/G35YsJrrdDud+moGb+FEn+V5nacVO3wqE3yoBIpamJnqn7Nex6PRAZ3vJK2z3UVkGmztIOb05jEKmuoUv0CVSwj1A/XoQnUlnndRoiThvdhEXPMOGF6ncgrc0wKJqxSfXZ4WkTyqo7LPl9yAmo4KtBEGeevBg8vpjwE/ANRM63H4kRKRXASNeCnPjS0FEtvpzjDhTLSl1COjA0k7wZ8QlSsUgTT4AlGk1aEUM3LgUTUNLKgwGGeYyNUwtTDeBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735886001; c=relaxed/relaxed;
	bh=8rvoiNSUQcM8TuxFbSwULTNEYBecHUA9EgFBttRWDN4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E1JXgC1oGRX7YBx/VDy4FcgSHRD+GxJggum3reIODnCg6jKlpgfA0SSsSNQ5/CQAOILU/1T+0vlWp96on2AiAAcysbFTUvH6aDfoVE3OZPUWM1JoZ8jtRSYia5Lxwc06iAJE/q1GOeaaUS3sbjpnJKLwFmor4+RQyST0sYHzd2q5hfIb8Pe+2ryM0EJCM3onfse53gFjHuJnKtBTx+J+EufoO4df/AH4Jc/kIqMee59iSGZ3w99bzfuWQ4pePUc1hOF7yM2If8g4NEwl0fGULCZLvUFb3hg6PdbXfV5DvKXuI1cA4c6VZ8khNcrAd3ETLSShFT38PEyR31aJ6Q8BHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R6NKxCbC; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R6NKxCbC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPYg42fYKz2yF0
	for <openbmc@lists.ozlabs.org>; Fri,  3 Jan 2025 17:33:20 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2f4409fc8fdso14182474a91.1
        for <openbmc@lists.ozlabs.org>; Thu, 02 Jan 2025 22:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735885999; x=1736490799; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rvoiNSUQcM8TuxFbSwULTNEYBecHUA9EgFBttRWDN4=;
        b=R6NKxCbCYgkdSJoohC+qw8u9u1yJLfX3eg6WNw4j3yPlwTWm516x48D62A4z00rHEb
         FKZFZMNPeAgOZSnxmxkEF21RAy2d4wh8rZPyAENBae7IcIQzUam1GNeUKpwGvO8elGot
         5TehZ+5t/DYs6D76KtmhCrbRvhQezVeQ+kzSGyCFwG4emtzAJRHFVlX7nRNTvA1Oq2fN
         2gMW1YpMYIEGDIOcdncLxQK1dODx0qvxVzVEtwp7IdNGIoIYhi0GJTpBIjKXTpiTbf+N
         bv5UDr5XHf7nrF/JCx5dZhrHb9NJtvcr05fTeJAY8+rlqUis9y2uVwDwl6PhYxT1bct3
         oK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735885999; x=1736490799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8rvoiNSUQcM8TuxFbSwULTNEYBecHUA9EgFBttRWDN4=;
        b=HgKIKOZtQe0IYSUqrq9hySOAiuVFJ88ElTODnuD2pfD1h18WoD2ofqYr67ZXmZaYa/
         gojdPIbndtoq9INfgvsURBaW3BX3sFHVxGZmLZL1WpiP6o02bpVcj0v4pPboGsNDcbT2
         47g2Dog7l/wguDzUYj0U1sgTKgTFHGAZ7BeQzTca0bRSidbzb/x81CTKl6ck3Y2jY7sC
         J110A16VNU+Zz8JOI8vmgpiEk3VmMmsAl76/P3Ebqh7jcIYdUk/mzCwUnO+r0u8s8yfu
         UYZlS1NC8uiJJpPqVPOwr2ynSs//QDIVCYVc+Bh7tGWHElXILBTUXwzrjEB+Et++N7fs
         fvTg==
X-Forwarded-Encrypted: i=1; AJvYcCXxTwA7KhUZBjmqPx0h+D7EOMvYSjaJN3g/3Tm2S0WomIPbhDrmqtrHBGkvwO+tTRU42C5LhGCf@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwQ9wxjPlXtMFbfnIV0ttzaBRjFK+WbcaLoLIdCLnmPFXL69R4c
	BBiHcvXqU2g3Gp4mxGsCgsHzDehdtcqbKC6cR/QZVuUdAJesJGkd
X-Gm-Gg: ASbGncvGT6gTF7a+ImHB7Yja+VT1xure91gf5phxG/99OAc2bTtefrlMG/Me4XhSfKU
	zCrrOgjNQChblmnuJEDk55uTWCw0eyLsF0xw0cP2bnii6U5RO6t6Zji98cjE31iUuO8iSK79PXe
	G0IQdqsqazjvl7QqEsctJpNW/FdI+T9hdg79hGFnjDUGqVmZOi+brdCtiK4EwPelV7AyhtUOr2n
	r3TNNPAuidt1ODqa05V4MYbD1R+vjSKcvp9PcJiyb8IJfhcWqOPZCD8fiVz3OQ6LANPvK0RiTAF
	GRVP1JQuh81bWTnMt/Klbw==
X-Google-Smtp-Source: AGHT+IFTt3/x35cc7jj3NYKfE7pGfA0/26fnxS5Q/C4NNxu/m4kr/JSjVBvl7fjIltQQk5YfHmvdRA==
X-Received: by 2002:a17:90b:548c:b0:2ef:e063:b3f8 with SMTP id 98e67ed59e1d1-2f4435abac6mr86690019a91.7.1735885998777;
        Thu, 02 Jan 2025 22:33:18 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ee26d89asm29427805a91.46.2025.01.02.22.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 22:33:18 -0800 (PST)
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
Subject: [PATCH net-next v6 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
Date: Fri,  3 Jan 2025 14:32:41 +0800
Message-Id: <20250103063241.2306312-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103063241.2306312-1-a0987203069@gmail.com>
References: <20250103063241.2306312-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 06 Jan 2025 10:12:37 +1100
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
index 000000000000..23fec10296e5
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
+#define NVT_REG_SYS_GMAC0MISCR  0x108
+#define NVT_REG_SYS_GMAC1MISCR  0x10C
+
+#define NVT_MISCR_RMII          BIT(0)
+
+/* 2000ps is mapped to 0x0 ~ 0xF */
+#define NVT_PATH_DELAY_DEC      134
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
+		tx_delay = 0;
+	} else {
+		if (arg <= 2000) {
+			tx_delay = (arg == 2000) ? 0xF : (arg / NVT_PATH_DELAY_DEC);
+			dev_dbg(dev, "Set Tx path delay to 0x%x\n", tx_delay);
+		} else {
+			dev_err(dev, "Invalid Tx path delay argument.\n");
+			return ERR_PTR(-EINVAL);
+		}
+	}
+	if (of_property_read_u32(dev->of_node, "rx-internal-delay-ps", &arg)) {
+		rx_delay = 0;
+	} else {
+		if (arg <= 2000) {
+			rx_delay = (arg == 2000) ? 0xF : (arg / NVT_PATH_DELAY_DEC);
+			dev_dbg(dev, "Set Rx path delay to 0x%x\n", rx_delay);
+		} else {
+			dev_err(dev, "Invalid Rx path delay argument.\n");
+			return ERR_PTR(-EINVAL);
+		}
+	}
+
+	regmap_read(bsp_priv->regmap,
+		    macid == 0 ? NVT_REG_SYS_GMAC0MISCR : NVT_REG_SYS_GMAC1MISCR, &reg);
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
+		reg |= FIELD_PREP(NVT_TX_DELAY_MASK, tx_delay);
+		reg |= FIELD_PREP(NVT_RX_DELAY_MASK, rx_delay);
+	}
+
+	regmap_write(bsp_priv->regmap,
+		     macid == 0 ? NVT_REG_SYS_GMAC0MISCR : NVT_REG_SYS_GMAC1MISCR, reg);
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
+MODULE_AUTHOR("Joey Lu <yclu4@nuvoton.com>");
+MODULE_DESCRIPTION("Nuvoton DWMAC specific glue layer");
+MODULE_LICENSE("GPL v2");
-- 
2.34.1

