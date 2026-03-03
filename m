Return-Path: <openbmc+bounces-1433-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIVlCJC+qGm1wwAAu9opvQ
	(envelope-from <openbmc+bounces-1433-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Thu, 05 Mar 2026 00:21:52 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAB1208F1F
	for <lists+openbmc@lfdr.de>; Thu, 05 Mar 2026 00:21:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fR7w01yMVz3bsC;
	Thu, 05 Mar 2026 10:21:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772529632;
	cv=none; b=NGXHre0jabEVt5RIou5QpekUe3aT2kUV83joGLwQKVSEF47aMbWABuyUWBEPaK8IFyHDveFMO+sESulxU1vxLEIEAifUcyptVdKiBL59zcKJsJ5h4QZeUn3ZdLTo3IpmGcLn/NVmCHN3o8vsE2J+/3MGf8qxmujRbpdFuILHmBOpfBp86FXuYC3E+ts0prd6ZHQDD46uhkzZppILurv/HGiKo1G5mzCwNFz5F5v7lC8DLZbu/f2hK+cE58pT4FWN2JMqCSsmZztls1Yvn3xw46AZt7jeomZxNVpdNu6RnS6QPqaKrmBZClFO8Q4Zpc5esX/OixzOp8oS11xq0roaKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772529632; c=relaxed/relaxed;
	bh=XSV+AC8eWTk36V/fHXUoLjLGPO33bJQuNND71Ov3wWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LwpWYe965sT6n/77T97txULWWDA8d8HMgkODG4AV1yjsONFTDBewmSiujv3W3ZC6/duq6aJ7Wch/R1aZctIccKD/g1asDcIBuZ4TavQPaBqZ015Mg5jvnOG6V0hKM37740/EMJqR+91IQtwBW2FhyXhY8cpH09PW7flRFiReDhc8n3t0aB4zr/q/eqpiAbkWGj36s8OfOmRhlaxmpzIg+QuuhdLwz+Zs13kPb5iU81fWHcmir0EaalfW00Z5Xpl4fGresBOlqYF43lbqLhaI5F0j/+z34WvYCG1j0dHG9dkZJ/WjQ0QuKnFM1fswvzNj61TI1iZoXwVUc6A5A5db8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=g3ut/Flg; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=g3ut/Flg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQ9JH3mPjz30Lw
	for <openbmc@lists.ozlabs.org>; Tue, 03 Mar 2026 20:20:31 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ad4d639db3so25006225ad.0
        for <openbmc@lists.ozlabs.org>; Tue, 03 Mar 2026 01:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772529629; x=1773134429; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSV+AC8eWTk36V/fHXUoLjLGPO33bJQuNND71Ov3wWs=;
        b=g3ut/FlgnzgNdDRB3othNeEYsvTpLpliW4MKKMcFehL0Vzyn9UxzVkKN0VCiDTOVAQ
         YmUusfnXJdf6UQIsvT0txfZccVrRMWh2emtT7mO8FHHm2XNIeyEaVzjrM5G2GwCUw+Eu
         mRD+EvIsgP6VcqGOJXoi6X/fGx/i2ZWy6ulSw5XFwCFWBZjX6jq95U/MZYCMSj4nizgD
         ddlrvyTFmua+KvQnQqtCewV5ysg3gmJ2TIZJcr/lawZLZt25sxWhWZ8T2h0rsoYFuBD1
         D2i4DyvQmQjEeUKyVZ9C9yeCSxTdnpkPv8y7LX9I+ZfwFSISGThcItd/92RlEQ3hGrTq
         4krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772529629; x=1773134429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XSV+AC8eWTk36V/fHXUoLjLGPO33bJQuNND71Ov3wWs=;
        b=i7beq5dPLw3WxYYTrLlF6/YUdtiSPyIb8bYStIR05cSlz4NKU+REz9mQLuL/ISucjQ
         +7Zqfo2RpXMEMyjPd99X/7L5/sbgbb2xEYbIBuTE38GQLmNOCqYqU831B3AC7Z9Hd18j
         RPCUw24W8yA83fKIYONrZ51tgeS69QYEqn5qUr6cjK4EkV7mLvmtpBOLyVq54zAUV9Zr
         dZh35yBWZ8BC+r4rx91QyC8+OSPq3V3OjqwVAnGU1Gr36EnOvh65SFINsvaAIG93QxUz
         m0S9EO8ZVet4ruRW3nIhUJTkYt8dnJqlBeY6qT7vRNVZbHurEvkTT5zYJUYlk5zBUcdu
         T6MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh+lnWiTcL84IAYlRw5NMM7mq0gH+ZyKfe0M7pDQibtWXBmL+pHWIEBLSryZVkCigr+aJxRTlz@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxntQrjQRXA/KgDMj6CpDCNdct3t1wk/NWlWCJUrtaZTvHZiyXW
	DQfOHj7Ln0cQt3Lf/chGZVykU40EwvRNMwGk6b8QeTSeQBo0Lf3FWjbp1/Iiyg==
X-Gm-Gg: ATEYQzzP4sdUtpwvDCe+ebZaxHPYlDIrd4Nt3PFH3tJ0yGHSauPS8twGuTbaNFxvowV
	SMNfAKwBslIMYP7yetUICaNQhK8XtVh2Q1S1Pkm/YVhnGH9jqm7/3ekkMr6c27lS4aidgk9ZkEZ
	z2aZek32kr8UoPRFY9vPIafnMGtLxH62Ol9sU0617j2yrdbUp7SbtBHkIPfvNgLyoLDlduSZ+5M
	LUH5UcIR968iHbNhgW+sMXlbFDU0fRuDfZtEDVzZVc/Q3a01hiLJYMYqAJS0LIinGg/W3LbiKdj
	C7n3OURQ7UW2hZcazHBrmYydeu0Ov8JI30VAWuc46uIxHmYYpahVr/r6e0NwSiS0n4a2V3aO2i/
	BVV/Gppzmkub7VOq++N9TrduR3ed5wCjjIWXTpMzebjyKiUxdTihh89uFuIR7T3QopjVgTFiauy
	yTaO5uqWMRuuIqCHZjvnzvLJmBQILP9c4wFXR1+VswIwU2+W/XaQHbV8fosffwkvlOteLr+M6L2
	qkRnUgofBkJ
X-Received: by 2002:a17:903:1aeb:b0:2ae:6192:8da3 with SMTP id d9443c01a7336-2ae619297cemr15448335ad.42.1772529629524;
        Tue, 03 Mar 2026 01:20:29 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69f996sm158777475ad.50.2026.03.03.01.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 01:20:29 -0800 (PST)
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
Subject: [PATCH net-next v13 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
Date: Tue,  3 Mar 2026 17:20:06 +0800
Message-ID: <20260303092006.263715-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303092006.263715-1-a0987203069@gmail.com>
References: <20260303092006.263715-1-a0987203069@gmail.com>
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
X-Rspamd-Queue-Id: 3EAB1208F1F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.80 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[38];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:richardcochran@gmail.com,m:alexandre.torgue@foss.st.com,m:joabreu@synopsys.com,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:peppe.cavallaro@st.com,m:linux-arm-kernel@lists.infradead.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:linux-stm32@st-md-mailman.stormreply.com,m:a0987203069@gmail.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,openbmc@lists.ozlabs.org];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1433-lists,openbmc=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,openbmc@lists.ozlabs.org];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[openbmc,netdev,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_CC(0.00)[foss.st.com,synopsys.com,nuvoton.com,st.com,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,st-md-mailman.stormreply.com,gmail.com,lunn.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

Add support for Gigabit Ethernet on Nuvoton MA35 series using dwmac driver.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 136 ++++++++++++++++++
 3 files changed, 149 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

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
new file mode 100644
index 000000000000..80f1d7419d46
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Nuvoton DWMAC specific glue layer
+ *
+ * Copyright (C) 2025 Nuvoton Technology Corp.
+ *
+ * Author: Joey Lu <a0987203069@gmail.com>
+ */
+
+#include <linux/mfd/syscon.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of.h>
+#include <linux/of_net.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/stmmac.h>
+
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
+	struct device *dev;
+	struct regmap *regmap;
+	u32 macid;
+};
+
+static int nvt_gmac_get_delay(struct device *dev, const char *property)
+{
+	u32 arg;
+
+	if (of_property_read_u32(dev->of_node, property, &arg))
+		return 0;
+
+	if (arg > 2000)
+		return -EINVAL;
+
+	if (arg == 2000)
+		return 15;
+
+	return arg / NVT_PATH_DELAY_STEP;
+}
+
+static int nvt_set_phy_intf_sel(void *bsp_priv, u8 phy_intf_sel)
+{
+	struct nvt_priv_data *priv = bsp_priv;
+	u32 reg, val;
+	int ret;
+
+	if (phy_intf_sel == PHY_INTF_SEL_RGMII) {
+		ret = nvt_gmac_get_delay(priv->dev, "rx-internal-delay-ps");
+		if (ret < 0)
+			return ret;
+		val = FIELD_PREP(NVT_RX_DELAY_MASK, ret);
+
+		ret = nvt_gmac_get_delay(priv->dev, "tx-internal-delay-ps");
+		if (ret < 0)
+			return ret;
+		val |= FIELD_PREP(NVT_TX_DELAY_MASK, ret);
+	} else if (phy_intf_sel == PHY_INTF_SEL_RMII) {
+		val = NVT_MISCR_RMII;
+	} else {
+		return -EINVAL;
+	}
+
+	reg = (priv->macid == 0) ? NVT_REG_SYS_GMAC0MISCR : NVT_REG_SYS_GMAC1MISCR;
+	regmap_update_bits(priv->regmap, reg,
+			   NVT_RX_DELAY_MASK | NVT_TX_DELAY_MASK | NVT_MISCR_RMII, val);
+
+	return 0;
+}
+
+static int nvt_gmac_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
+	struct device *dev = &pdev->dev;
+	struct nvt_priv_data *priv;
+	int ret;
+
+	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get platform resources\n");
+
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	if (IS_ERR(plat_dat))
+		return dev_err_probe(dev, PTR_ERR(plat_dat), "Failed to get platform data\n");
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return dev_err_probe(dev, -ENOMEM, "Failed to allocate private data\n");
+
+	priv->regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys",
+							    1, &priv->macid);
+	if (IS_ERR(priv->regmap))
+		ret = dev_err_probe(dev, PTR_ERR(priv->regmap), "Failed to get sys register\n");
+
+	if (priv->macid > 1)
+		ret = dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");
+
+	plat_dat->bsp_priv = priv;
+	plat_dat->set_phy_intf_sel = nvt_set_phy_intf_sel;
+
+	return stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
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


