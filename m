Return-Path: <openbmc+bounces-949-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7A1C95D03
	for <lists+openbmc@lfdr.de>; Mon, 01 Dec 2025 07:30:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dKYsX2qLYz30VL;
	Mon, 01 Dec 2025 17:29:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764570576;
	cv=none; b=dDu0M1QVO7uir7s7bHKkX1vrz42IAGXyfUk+aaNug2BDYsBT9J27CIg24LMmG6eHftC0/mba4VJiJAltYP289W5t9ae4gYMGqNS68hG0XyHL1MTLDnKzEvCpP7o0XWApKWuHGZwFj/daCGwX/lACAt/GaVjmGH4q2BoDJURIFM569uSjoX6ruLSCkLCZXtSj4rUOLawgAsCfO6c2oa5yJW5BTKSWzWkh/QdUegwCWnK6X3CE3CNax6RG1OoXsvTOKKnSKCS2IOE7/0jh5VfO3l9oKfmVVgyB1k3naoXi+483IapDgBL0KaOkp4F283Iq5A7IKadHmG86AUtYhBexOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764570576; c=relaxed/relaxed;
	bh=Uu6SVXPiBwxE8r6hIfeZlJh+9UC95s19w0ZznNP9MHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=FH3Ky8qn3V4IKl39ABe3EpXjkqMJApk7i3Uu4Wt9Sk6MvLCVBXFIZ6hE9+qwXNHzUcpN90+98T5zWZhtJZZkRsv6KkqVdRm2Q5K6oz0VOnC6+bSLkyfaEqiGYXKKj7yLUxxJlve1ophLJmGdCGUsAtAfUK4lBf1Mw1TYvR2+JnQ0LENhEhDApZRecR2A4NZz7z6PHQSKWfHS040P17Q1bDFYsniyDvZOtc4NnayHaiYowC028pxL1tqyjs7Bttw/eFY7qb0mt/uyNluhUq4B5FFDYYkg1hPZs9+8Z7tknuB93ubXOLPKlVP+rElf3DMkvbSFv30O6IJ4oMz7MAdUkw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dKYsW53vbz30TM;
	Mon, 01 Dec 2025 17:29:35 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 1 Dec
 2025 14:29:16 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 1 Dec 2025 14:29:16 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Mon, 1 Dec 2025 14:29:12 +0800
Subject: [PATCH v6 2/7] dt-bindings: PCI: Add ASPEED PCIe RC support
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
Message-ID: <20251201-upstream_pcie_rc-v6-2-8c8800c56b16@aspeedtech.com>
References: <20251201-upstream_pcie_rc-v6-0-8c8800c56b16@aspeedtech.com>
In-Reply-To: <20251201-upstream_pcie_rc-v6-0-8c8800c56b16@aspeedtech.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764570556; l=4935;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=a0hN/cW5eif5O7U21y0DVnS9Jv2bo+ZTpcF/l8WV0k0=;
 b=J8If8V2vAJuE/6oEwRIL1mNrR7/8faGIWBnA0E2SPEpvCtoseapfuW+djNbezlYz5qyxPAH1d
 +f6t9htzLBSBdoVGqnbBcgdZjmiHy0L8nDShjQSPPAWxPzlgKO9rfNP
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

ASPEED AST2600 provides one PCIe RC for Gen2 and AST2700 provides three
PCIe RC for two Gen4 and one Gen2. All of these RCs have just one root
port to connect to PCIe device. And also have Mem, I/O access, legacy
interrupt and MSI.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 .../bindings/pci/aspeed,ast2600-pcie.yaml          | 150 +++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/aspeed,ast2600-pcie.yaml b/Documentation/devicetree/bindings/pci/aspeed,ast2600-pcie.yaml
new file mode 100644
index 000000000000..0b792acbf0b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/aspeed,ast2600-pcie.yaml
@@ -0,0 +1,150 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/aspeed,ast2600-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED PCIe Root Complex Controller
+
+maintainers:
+  - Jacky Chou <jacky_chou@aspeedtech.com>
+
+description:
+  The ASPEED PCIe Root Complex controller provides PCI Express Root Complex
+  functionality for ASPEED SoCs, such as the AST2600 and AST2700.
+  This controller enables connectivity to PCIe endpoint devices, supporting
+  memory and I/O windows, MSI and INTx interrupts, and integration with
+  the SoC's clock, reset, and pinctrl subsystems. On AST2600, the PCIe Root
+  Port device number is always 8.
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2600-pcie
+      - aspeed,ast2700-pcie
+
+  reg:
+    maxItems: 1
+
+  ranges:
+    minItems: 2
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+    description: INTx and MSI interrupt
+
+  resets:
+    items:
+      - description: PCIe controller reset
+
+  reset-names:
+    items:
+      - const: h2x
+
+  aspeed,ahbc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the ASPEED AHB Controller (AHBC) syscon node.
+      This reference is used by the PCIe controller to access
+      system-level configuration registers related to the AHB bus.
+      To enable AHB access for the PCIe controller.
+
+  aspeed,pciecfg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the ASPEED PCIe configuration syscon node.
+      This reference allows the PCIe controller to access
+      SoC-specific PCIe configuration registers. There are the others
+      functions such PCIe RC and PCIe EP will use this common register
+      to configure the SoC interfaces.
+
+  interrupt-controller: true
+
+allOf:
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
+  - $ref: /schemas/interrupt-controller/msi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: aspeed,ast2600-pcie
+    then:
+      required:
+        - aspeed,ahbc
+    else:
+      properties:
+        aspeed,ahbc: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: aspeed,ast2700-pcie
+    then:
+      required:
+        - aspeed,pciecfg
+    else:
+      properties:
+        aspeed,pciecfg: false
+
+required:
+  - reg
+  - interrupts
+  - bus-range
+  - ranges
+  - resets
+  - reset-names
+  - msi-controller
+  - interrupt-controller
+  - interrupt-map-mask
+  - interrupt-map
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/ast2600-clock.h>
+
+    pcie0: pcie@1e770000 {
+      compatible = "aspeed,ast2600-pcie";
+      device_type = "pci";
+      reg = <0x1e770000 0x100>;
+      #address-cells = <3>;
+      #size-cells = <2>;
+      interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
+      bus-range = <0x00 0xff>;
+
+      ranges = <0x01000000 0x0 0x00018000 0x00018000 0x0 0x00008000
+                0x02000000 0x0 0x60000000 0x60000000 0x0 0x20000000>;
+
+      resets = <&syscon ASPEED_RESET_H2X>;
+      reset-names = "h2x";
+
+      #interrupt-cells = <1>;
+      msi-controller;
+
+      aspeed,ahbc = <&ahbc>;
+
+      interrupt-controller;
+      interrupt-map-mask = <0 0 0 7>;
+      interrupt-map = <0 0 0 1 &pcie0 0>,
+                      <0 0 0 2 &pcie0 1>,
+                      <0 0 0 3 &pcie0 2>,
+                      <0 0 0 4 &pcie0 3>;
+
+      pcie@8,0 {
+        compatible = "pciclass,0604";
+        reg = <0x00004000 0 0 0 0>;
+        #address-cells = <3>;
+        #size-cells = <2>;
+        device_type = "pci";
+        resets = <&syscon ASPEED_RESET_PCIE_RC_O>;
+        reset-names = "perst";
+        clocks = <&syscon ASPEED_CLK_GATE_BCLK>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_pcierc1_default>;
+        phys = <&pcie_phy1>;
+        ranges;
+      };
+    };

-- 
2.34.1


