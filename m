Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 947349C7E14
	for <lists+openbmc@lfdr.de>; Wed, 13 Nov 2024 23:06:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpcmP3Nt1z3fql
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2024 09:05:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4860:4864:20::36"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731475213;
	cv=none; b=fVfpppIzhvuIhtvPn5uq+VGG7aW9hsUjqr53pVI+sNiZ9jK/Ci/OAG/ZNnXUl4duAAxesYArLWclXtOb9dkLD7qREcTKTR8D2fYZIjJGSu5O3T33mGS2REmhVx7Rz1S/OQFkuB2A7gOhUNEm7rWLeMClRivnKLXow1vaaeaQbG+M9y9LcMvmYr27ZfUxEbYEZAOADZBhg8W21OswW0CXNZ7wXLk5rvabl5R2YQSST+Jfgm9QzeLwrKaNL4qFtGLkOf7UY8UOZheoFuJCzR1+XMrYtTUPp9b0cy3o4o01clbctWVLRTC0UdWYvTsQV6CqMYa8yK0Cr2fdvKASrj4nNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731475213; c=relaxed/relaxed;
	bh=5353xv9nfR949Aq3luMMcKblmb1cgT053z7RFtTwcFU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rh5hj8pI8RddhTvLXxL1ULRRABCyRnq1FZt5LkL75d7thWlOt8w9g7IESAoJZ6PjsqW5uj3zmA1F4CzsSxeMPa7l+gLjm6umqbZ4UerF4pYGdWas5Hx4kwAImbTw8rGNfmWJlNwEV3EJYlS0YOvaxNQByKm8vgoTCkziBgUicKxg5JHFJgex/+2CqQYpWJr5nNySquQME9RSq91X0nwRU5NDACEYlORwy0zbLP0WFFMQC1i8dWzvfwdZzTo0l4V9hXBwTNiHOOJVsaxTNfqmh+n9vbzw8z2u14niMiBYcwqNuaqE/GmAJdDlxbdH+mIYP0P2ilSjxrLkeH99ZG3qhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QhiDjYos; dkim-atps=neutral; spf=pass (client-ip=2001:4860:4864:20::36; helo=mail-oa1-x36.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QhiDjYos;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::36; helo=mail-oa1-x36.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpBSD1Tdgz2xpm
	for <openbmc@lists.ozlabs.org>; Wed, 13 Nov 2024 16:20:12 +1100 (AEDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-288642376bcso3321871fac.1
        for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2024 21:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731475209; x=1732080009; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5353xv9nfR949Aq3luMMcKblmb1cgT053z7RFtTwcFU=;
        b=QhiDjYosq+pCBCDtVq7+OId1wDSGd9zG1N9lPwNYgvmmOwPFUIPokWIUPgBn9LfuMb
         y/4+neXB1v663SvAuCYAUufG0sKJev8OXJxwy9fvbI8lYifV80V3mIndNP0zrY2G3ASE
         96yNvcTc8OI2NspZRyHzIQOZjJOAHRtFpLWKe1mXhk2IBX/SxabKX8JWp7L4dYR/mOt/
         8OmCI0pLA90+3paDqZtpfDzpPxNSyxQh5jMHshVcpDUyqQkMppLN0l4yWEv5rMiEO4C6
         q6496fQGz2SMXpNwftgprCTBtqkctFXRzEGsA5Cm7QY9ymiOelpNjCdcioFNnQKlQkRj
         IjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731475209; x=1732080009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5353xv9nfR949Aq3luMMcKblmb1cgT053z7RFtTwcFU=;
        b=AAwbCM64jCUD7egXkQjhw5a2cTg3alkztvAGj4vHkm0+yTLQxmw9Jc9j3t07SEbY3K
         Rym5kViUxNBWp4X9mmoerFUuF4NEdPWA99DjQl9Dk79/Igz/7GZpjVY92Nqi6igxBulx
         eNFw+HPVjZUPWc9R2sfuTLCu5Ph059EwUrYzK7AyXaIoPIBd2AQ0ln4Mn0VY3qWRjrhk
         Te1dDxiXJloicnn7vZRE5taG4RhA+zPTDoehhD+bAyYXXJeWNhf+Brporx72P4l0MhLM
         DCyIoyVWRB8hK0RlIxMYbUBkPQ18RpVhp+pRj17Dx6l8Vi9BhrTJNiJxi306KFueLiRS
         n0gQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3C4kElZdfsTS0gBgC/j35aOcihmT/YwgI3C6kupVb+5U4wA8wqk9wpn/YaAJitt8lnYGoisEJ@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwBLqR2/f+2UuNOK4wJfvYO/S7A76SRlzCgqWGhrG68kkofh/Tl
	qEXj7dT+0trXUDVOIdi+uer03ZRsNlH8meCF8ryJrlMXfoMCgTqf
X-Google-Smtp-Source: AGHT+IFA7M9iVYxjJX9yzGaZF33PqN+3je2YxeBLIbH3+k+DhcZianzX1wGkCN8eQ4smDjyciHl1ng==
X-Received: by 2002:a05:6870:230a:b0:254:bd24:de83 with SMTP id 586e51a60fabf-29560065134mr17026514fac.12.1731475209174;
        Tue, 12 Nov 2024 21:20:09 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724079aaa01sm12644376b3a.100.2024.11.12.21.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 21:20:08 -0800 (PST)
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
Subject: [PATCH v2 3/3] net: stmmac: dwmac-nuvoton: Add dwmac support for MA35 family
Date: Wed, 13 Nov 2024 13:18:57 +0800
Message-Id: <20241113051857.12732-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113051857.12732-1-a0987203069@gmail.com>
References: <20241113051857.12732-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 14 Nov 2024 09:05:26 +1100
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
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com, Joey Lu <a0987203069@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, joabreu@synopsys.com, schung@nuvoton.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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
index 05cc07b8f48c..55d94f669be3 100644
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
index c2f0e91f6bf8..c08fcfdd7b31 100644
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
index 000000000000..68c71d2b46f4
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
@@ -0,0 +1,179 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/**
+ * dwmac-nuvoton.c - Nuvoton MA35 series DWMAC specific glue layer
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
+#define PATHDLY_DEC         134
+#define TXDLY_OFST          16
+#define TXDLY_MSK           GENMASK(19, 16)
+#define RXDLY_OFST          20
+#define RXDLY_MSK           GENMASK(23, 20)
+
+#define REG_SYS_GMAC0MISCR  0x108
+#define REG_SYS_GMAC1MISCR  0x10C
+
+#define MISCR_RMII          BIT(0)
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
+		dev_err(dev, "Failed to get sys register\n");
+		return ERR_PTR(-ENODEV);
+	}
+	if (macid > 1) {
+		dev_err(dev, "Invalid sys arguments\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (of_property_read_u32(dev->of_node, "tx-internal-delay-ps", &arg)) {
+		tx_delay = 0; /* Default value is 0 */
+	} else {
+		if (arg > 0 && arg <= 2000) {
+			tx_delay = (arg == 2000) ? 0xF : (arg / PATHDLY_DEC);
+			dev_dbg(dev, "Set Tx path delay to 0x%x\n", tx_delay);
+		} else {
+			tx_delay = 0;
+			dev_err(dev, "Invalid Tx path delay argument. Setting to default.\n");
+		}
+	}
+	if (of_property_read_u32(dev->of_node, "rx-internal-delay-ps", &arg)) {
+		rx_delay = 0; /* Default value is 0 */
+	} else {
+		if (arg > 0 && arg <= 2000) {
+			rx_delay = (arg == 2000) ? 0xF : (arg / PATHDLY_DEC);
+			dev_dbg(dev, "Set Rx path delay to 0x%x\n", rx_delay);
+		} else {
+			rx_delay = 0;
+			dev_err(dev, "Invalid Rx path delay argument. Setting to default.\n");
+		}
+	}
+
+	regmap_read(bsp_priv->regmap,
+		    macid == 0 ? REG_SYS_GMAC0MISCR : REG_SYS_GMAC1MISCR, &reg);
+	reg &= ~(TXDLY_MSK | RXDLY_MSK);
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
+		reg |= tx_delay << TXDLY_OFST;
+		reg |= rx_delay << RXDLY_OFST;
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
+	dev_info(&pdev->dev, "Wake-Up On Lan supported\n");
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
+	.remove_new = stmmac_pltfr_remove,
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

