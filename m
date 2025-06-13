Return-Path: <openbmc+bounces-194-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1F0AD8245
	for <lists+openbmc@lfdr.de>; Fri, 13 Jun 2025 07:04:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJS3Z2cxxz30DL;
	Fri, 13 Jun 2025 15:03:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749785738;
	cv=none; b=g4srMBZZUCaRImNAfKeg4Sp0L7FBETbT5FbAnjf7S4Sr9NP9BO7vbbWsW9v7aNRAjqzapyt3JtH20OoaJCLuAgHOhboOzE+28LoRNl9SRnISsO05ogectyuG+hD61Lq8uBIQ1TO8kDeovVSKEdKUuqmVKbv1KqkuW3t/C5vJLH8/17zKei0845QIM5XNYeE+s55/5KvLBHYwuTvVzVTAa3saKx6F4rJ9Z4kEwHjNxhlgmWNprmuTIODHxVSOkv1bR+Q0WWZiYbljYuvAwobcAyca3A2JGfFzHQzQuaASU3ZKiBVcIiuG2B8ygl5qf6QulTqPIRl5qiOQ7780tBG+og==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749785738; c=relaxed/relaxed;
	bh=PDpSHFX5/iKofQqkW2v7Wb8RTbMe57FisKpAdF+H81o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UZk6m6HzEC4rHM3C3/bBna+DAkrWzgjYtOb3uypoXrSZ67zepIlderGa+55mM5PyTX4TuOMQhks554wIxYw9klQsk9bw9qC+d0ZVvZKbyW3LNyREK6nts35FTq8+kJvfw84bvOpSeLZn4PEEfzAlrcCcf4JuW1FwBGB2iWTyDGgKgHFAJWX0aq3aLjmlW329H5i2BBU+yRFP6qNRswvTpDvAXewttofy3Rh97VKetgA4aAHijdlWBfC/+tVUPFJ//Ue+bsJnX3ckHEVR4PD0aCmxTQFjW8mQR2q6NS4ByMpM7TV0u1R7sbgoBC5l1BIBhXqOJ7yknBls0tgr0ls0GA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJQ5j6BYdz3089
	for <openbmc@lists.ozlabs.org>; Fri, 13 Jun 2025 13:35:37 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 13 Jun
 2025 11:30:02 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 13 Jun 2025 11:30:02 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <bhelgaas@google.com>, <lpieralisi@kernel.org>, <kwilczynski@kernel.org>,
	<mani@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<vkoul@kernel.org>, <kishon@kernel.org>, <linus.walleij@linaro.org>,
	<p.zabel@pengutronix.de>, <linux-aspeed@lists.ozlabs.org>,
	<linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>
CC: <elbadrym@google.com>, <romlem@google.com>, <anhphan@google.com>,
	<wak@google.com>, <yuxiaozhang@google.com>, <BMC-SW@aspeedtech.com>
Subject: [PATCH 1/7] dt-bindings: phy: Add document for ASPEED PCIe PHY
Date: Fri, 13 Jun 2025 11:29:55 +0800
Message-ID: <20250613033001.3153637-2-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
References: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
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
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add device tree binding YAML documentation for the ASPEED PCIe PHY.
This schema describes the required properties for the PCIe PHY node,
including compatible strings and register space, and provides an
example for reference.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 .../bindings/phy/aspeed-pcie-phy.yaml         | 38 +++++++++++++++++++
 MAINTAINERS                                   | 10 +++++
 2 files changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/aspeed-pcie-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/aspeed-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/aspeed-pcie-phy.yaml
new file mode 100644
index 000000000000..762bf7b0aedc
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/aspeed-pcie-phy.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/aspeed-pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED PCIe PHY
+
+maintainers:
+  - Jacky Chou <jacky_chou@aspeedtech.com>
+
+description: |
+  The ASPEED PCIe PHY provides the physical layer interface for PCIe
+  controllers in the SoC. This node represents the register block for the PCIe
+  PHY, which is typically accessed by PCIe Root Complex or Endpoint drivers
+  via syscon.
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2600-pcie-phy
+      - aspeed,ast2700-pcie-phy
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pcie-phy@1e6ed200 {
+      compatible = "aspeed,ast2600-pcie-phy";
+      reg = <0x1e6ed200 0x100>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index a5a650812c16..68115443607d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3696,6 +3696,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/aspeed,video-engine.yaml
 F:	drivers/media/platform/aspeed/
 
+ASPEED PCIE CONTROLLER DRIVER
+M:	Jacky Chou <jacky_chou@aspeedtech.com>
+L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
+L:	linux-pci@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/pci/aspeed-pcie-cfg.yaml
+F:	Documentation/devicetree/bindings/pci/aspeed-pcie.yaml
+F:	Documentation/devicetree/bindings/phy/aspeed-pcie-phy.yaml
+F:	drivers/pci/controller/pcie-aspeed.c
+
 ASUS EC HARDWARE MONITOR DRIVER
 M:	Eugene Shalygin <eugene.shalygin@gmail.com>
 L:	linux-hwmon@vger.kernel.org
-- 
2.43.0


