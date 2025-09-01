Return-Path: <openbmc+bounces-542-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 807EDB3D938
	for <lists+openbmc@lfdr.de>; Mon,  1 Sep 2025 08:00:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFdW05k3gz2yyx;
	Mon,  1 Sep 2025 15:59:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756706380;
	cv=none; b=L9U5g64CM6xAEnDdYaEJtL2r/oNbtG3mWBpfvTXnCcSBiovrfTdZO/IlvV6cETMuRgySB+JuL78uee85G86dsTR5W3hYtwynrAF712UQZzUM7ZJUFnhR1CAOe/WIT0PLbAKwyjcEKN+NQK6Oa+6dwk5lccRpdSS4XfPKm3/XkEnYGjETfNetYjBjmoyrj3j+szPccS0ysG23B+W5iMLsO5NqxBYUa/pK2RQeo8/rvL/Ny4MpSURxeFcutlfYewag5WN3VLXbQxr0L0yLyaliI9dbSSNPhSV98lYxu+skZmOVwf+ldfRrv+BlaK30bunyXULU1K+z3Jwm2X5Uaa9SzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756706380; c=relaxed/relaxed;
	bh=r7kgqnm5OUJlxlcySrLHt7O6IwYyT+7b1D3LiT2HFj8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aruj+YkoxbpE07qzPvpsBNqDJQEBIXI4XvHnD/EdJvSzZzwjsOpaTUG8NAYdxgEahcl84YS8wc/XiUvyvTWLmEcIQ6cgPBBiTIJL30Brjbc7W7pXJgiBQ3qGq3brvqW3QG3RbSI7D2HQwY4pldkZDtn5bcpykmoTzzetd+yGe//qFLPphdKtevBSjU94Bp+803lZg5b0VwWw4o1NBRvzpXl9DirNIrNpCQdY65V6I0XTE38MrHwZfy8SCNwS/tY48nFPHTDCTFaI2bm5OOm7wuf4YWJWMmMK8tFK6S1nB9ZFMIbifaj+nTHPMjVzLQv6PD3CYKH+lRL4no4Ntv78Eg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cFdVz6YX9z2yx7;
	Mon,  1 Sep 2025 15:59:39 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 1 Sep
 2025 13:59:22 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 1 Sep 2025 13:59:22 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bhelgaas@google.com>,
	<lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <vkoul@kernel.org>,
	<kishon@kernel.org>, <linus.walleij@linaro.org>, <p.zabel@pengutronix.de>,
	<linux-aspeed@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>
CC: <jacky_chou@aspeedtech.com>
Subject: [PATCH v3 02/10] dt-bindings: phy: aspeed: Add ASPEED PCIe PHY
Date: Mon, 1 Sep 2025 13:59:14 +0800
Message-ID: <20250901055922.1553550-3-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250901055922.1553550-1-jacky_chou@aspeedtech.com>
References: <20250901055922.1553550-1-jacky_chou@aspeedtech.com>
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

Introduce device-binding for ASPEED AST2600/2700 PCIe PHY.
The PCIe PHY is used for PCIe RC to configure as RC mode.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 .../bindings/phy/aspeed,ast2600-pcie-phy.yaml | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/aspeed,ast2600-pcie-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/aspeed,ast2600-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/aspeed,ast2600-pcie-phy.yaml
new file mode 100644
index 000000000000..71a5cd91fb3f
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/aspeed,ast2600-pcie-phy.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/aspeed,ast2600-pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED PCIe PHY
+
+maintainers:
+  - Jacky Chou <jacky_chou@aspeedtech.com>
+
+description:
+  The ASPEED PCIe PHY provides the physical layer functionality for PCIe
+  controllers in the SoC.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - aspeed,ast2600-pcie-phy
+          - aspeed,ast2700-pcie-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@1e6ed200 {
+      compatible = "aspeed,ast2600-pcie-phy";
+      reg = <0x1e6ed200 0x100>;
+      #phy-cells = <0>;
+    };
-- 
2.43.0


