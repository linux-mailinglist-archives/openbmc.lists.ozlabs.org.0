Return-Path: <openbmc+bounces-912-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01062C641D5
	for <lists+openbmc@lfdr.de>; Mon, 17 Nov 2025 13:40:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d96kT4hKRz30gY;
	Mon, 17 Nov 2025 23:39:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763383153;
	cv=none; b=dmz94XJa1rGzuoRpfIeBf4WIJw9sHEMpgoYItZxrBR9Fqa7HmAePWOgMFks6RxTK86opp0WvbMAGBckCdvQU/4UWYCY5bLAphq93qd1I1yZ9CAeCuKQAff/1QvZluugyM7YhGM80rG5srk2RRehefEtudYMqXbMF9e9P+pTDJBD6mRMptLSthf5OSZGgJNRZJzc/Md+Ypi7vTHls4CM1+Rf1DFFmqFtHw+MLysnCieAH66w9NiJ0Lb1IjXXxyg4ZzjJgsyOyB49u55k6UQKlty6K1gVBApNtcsYet9DxiP1Hk4mCHXSyTJOw3kP4weAGHl8XgM9yLTj5h8Wlc4ui6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763383153; c=relaxed/relaxed;
	bh=3B8S3zDeHha0GdI6Jb4DuQ5h6tF6GbY3TFPLDu7JYyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=l72bNbVZuIKAeafF1cPUigYvLxL3kQIX/rL6Yw8Xu8Wq4K1ZhgWbFZqOQbdgosKG4crjUT1dNXqh/Yks5ULXTfGyNFAaMzGEiToLQNkyKL0FaIHa88maVO8yTLY5pDklcsIvJbGvUS1/m+6XfBAV2BuHclrfs7272Bc02NRfjoCuI0yKXTOMqdI12UVE2GUGbCepenKwvYrcwCfyZbusE6x9gwpl7gIwPPkxH2S2hvN/d+Nc8cTHlZAuwbfMfuvdHxRTdKjeJtXq5zXvKdQxSDWiYnw2zvdCXfiHAzj9A+t91stk5N+/hLN324exTF1fxIPdklSf9oAAW6RfRUME1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d96kT0xf5z30Yb;
	Mon, 17 Nov 2025 23:39:13 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 17 Nov
 2025 20:38:52 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 17 Nov 2025 20:38:52 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Mon, 17 Nov 2025 20:37:53 +0800
Subject: [PATCH v5 6/8] PCI: Add FMT, TYPE and CPL status definition for
 TLP header
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251117-upstream_pcie_rc-v5-6-b4a198576acf@aspeedtech.com>
References: <20251117-upstream_pcie_rc-v5-0-b4a198576acf@aspeedtech.com>
In-Reply-To: <20251117-upstream_pcie_rc-v5-0-b4a198576acf@aspeedtech.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan
 Sadhasivam" <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-aspeed@lists.ozlabs.org>, <linux-pci@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, Jacky Chou <jacky_chou@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763383131; l=1361;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=nq0bqCx0rHmNiL65sL9sXGxxVddeGd0PW7LtKF4DAu4=;
 b=ohyGxEFVCsregWLt3wVAi2U+bBcoIDIlGlp/apfQY0etcg+EXobiXAKPvzkSUVMmQK6qKIDif
 BLm+I4EiODJDaDLdFpfsDe6s4IqY0umuxt4J2jZKnU6hPPNUStGiTaX
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

According to PCIe specification, add FMT, TYPE and CPL status
definition for TLP header.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 drivers/pci/pci.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 36f8c0985430..3a075f77cf4a 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -88,6 +88,21 @@ struct pcie_tlp_log;
 #define PCI_BUS_BRIDGE_MEM_WINDOW	1
 #define PCI_BUS_BRIDGE_PREF_MEM_WINDOW	2
 
+/* Format of TLP; PCIe r7.0, sec 2.2.1 */
+#define PCIE_TLP_FMT_3DW_NO_DATA	0x00 /* 3DW header, no data */
+#define PCIE_TLP_FMT_4DW_NO_DATA	0x01 /* 4DW header, no data */
+#define PCIE_TLP_FMT_3DW_DATA		0x02 /* 3DW header, with data */
+#define PCIE_TLP_FMT_4DW_DATA		0x03 /* 4DW header, with data */
+
+/* Type of TLP; PCIe r7.0, sec 2.2.1 */
+#define PCIE_TLP_TYPE_CFG0_RD		0x04 /* Config Type 0 Read Request */
+#define PCIE_TLP_TYPE_CFG0_WR		0x04 /* Config Type 0 Write Request */
+#define PCIE_TLP_TYPE_CFG1_RD		0x05 /* Config Type 1 Read Request */
+#define PCIE_TLP_TYPE_CFG1_WR		0x05 /* Config Type 1 Write Request */
+
+/* Cpl. status of Complete; PCIe r7.0, sec 2.2.9.1 */
+#define PCIE_CPL_STS_SUCCESS		0x00 /* Successful Completion */
+
 extern const unsigned char pcie_link_speed[];
 extern bool pci_early_dump;
 

-- 
2.34.1


