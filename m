Return-Path: <openbmc+bounces-812-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8ED5C0CCF6
	for <lists+openbmc@lfdr.de>; Mon, 27 Oct 2025 10:59:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cw8901Yzzz2yw7;
	Mon, 27 Oct 2025 20:58:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761559124;
	cv=none; b=k/O+2NC9+lc2XBvx3utpYeRJ6qGEd9Q0s9njWIRSiiPgZMT0dMXADdEoTAb3GL+ocSPKb1wmEUsNaTJacQad+QJlyMLCSKcU3KYvRcut4rBLWDyQXdZraTdW5bhInrGWMj4adyBpAl8uMWyeRG+hRBGkJoAk2w91j2pYW6rcvtrvbHDWpcySPbTQ7rD6sASWxEEVmwLE0CplVXPS+VUKiFzFYe4j2ptEbQOatbVUwe/jAHUxgknGYPLBcGwAlANkBqxynKNQV3fBx7hajk1OX2KT8Btb+ROa9kMw7yXHXVAzEd79j5G8sPeW3Gl18FQqsbSVbj4BLOarVBrRrr0UAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761559124; c=relaxed/relaxed;
	bh=pmtwlaKVIMCBuX0nInauBiUGiilGYmvRgtqVePhQhmw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZhXqaBcBcbI6lIGPfyA2ypQ9R/Rxxj9dfJrlHxFVZXt4xXAg6dvQsJfV4kOv2tadFxjLlolnkcTQQ1Ks6Ootg1WjQpqbvtcy6SywM2B0rqELETIfNSpTrjyO+ci2JNw1capZhsQzt9kM3qh9y03mZcF5HhHGyZmuu104XBxs9ptX7p6jfUdt1WNJYmIIBNIxHTH8ntOg2EycJljb3u/hsM3sc9kUVz9+A7I4OxtDgwQ+gpS9n9OQDV0gACF5Xnlr/zY57Q1vPB/CQ5dTuBuCx2QtDYubx1i1TnN/ip15jSJ2MDe3ycb/foo+FLzWxJHTUTQhHbuHCylU221JXmZNTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cw88z3vqGz3btg;
	Mon, 27 Oct 2025 20:58:43 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 27 Oct
 2025 17:58:25 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 27 Oct 2025 17:58:25 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
	<robh@kernel.org>, <bhelgaas@google.com>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<vkoul@kernel.org>, <kishon@kernel.org>, <linus.walleij@linaro.org>,
	<p.zabel@pengutronix.de>, <linux-aspeed@lists.ozlabs.org>,
	<linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>
CC: <jacky_chou@aspeedtech.com>
Subject: [PATCH v4 2/9] dt-bindings: PCI: Add ASPEED PCIe RC support
Date: Mon, 27 Oct 2025 17:58:18 +0800
Message-ID: <20251027095825.181161-3-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027095825.181161-1-jacky_chou@aspeedtech.com>
References: <20251027095825.181161-1-jacky_chou@aspeedtech.com>
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

ASPEED AST2600 provides one PCIe RC for Gen2 and AST2700 provides three
PCIe RC for two Gen4 and one Gen2. All of these RCs have just one root
port to connect to PCIe device. And also have Mem, I/O access, legacy
interrupt and MSI.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 .../bindings/pci/aspeed,ast2600-pcie.yaml     | 168 ++++++++++++++++++
 1 file changed, 168 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/aspeed,ast2600-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/aspeed,ast2600-pcie.yaml b/Documentation/devicetree/bindings/pci/aspeed,ast2600-pcie.yaml
new file mode 100644
index 000000000000..d40fe7eb6fa0
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/aspeed,ast2600-pcie.yaml
@@ -0,0 +1,168 @@
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
+  memory and I/O windows, MSI and legacy interrupts, and integration with
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
+    description: IntX and MSI interrupt
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
+  legacy-interrupt-controller:
+    description: Interrupt controller node for handling INTx.
+    type: object
+    properties:
+      '#address-cells':
+        const: 0
+      '#interrupt-cells':
+        const: 1
+      interrupt-controller: true
+
+    required:
+      - '#address-cells'
+      - '#interrupt-cells'
+      - interrupt-controller
+
+    additionalProperties: false
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
+  - interrupt-map-mask
+  - interrupt-map
+  - legacy-interrupt-controller
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
+      pinctrl-0 = <&pinctrl_pcierc1_default>;
+      pinctrl-names = "default";
+
+      #interrupt-cells = <1>;
+      msi-controller;
+
+      aspeed,ahbc = <&ahbc>;
+
+      interrupt-map-mask = <0 0 0 7>;
+      interrupt-map = <0 0 0 1 &pcie_intc0 0>,
+                      <0 0 0 2 &pcie_intc0 1>,
+                      <0 0 0 3 &pcie_intc0 2>,
+                      <0 0 0 4 &pcie_intc0 3>;
+      legacy-interrupt-controller {
+        interrupt-controller;
+        #address-cells = <0>;
+        #interrupt-cells = <1>;
+      };
+
+      pcie@8,0 {
+        reg = <0x804000 0 0 0 0>;
+        #address-cells = <3>;
+        #size-cells = <2>;
+        device_type = "pci";
+        resets = <&syscon ASPEED_RESET_PCIE_RC_O>;
+        reset-names = "perst";
+        clocks = <&syscon ASPEED_CLK_GATE_BCLK>;
+        phys = <&pcie_phy1>;
+        ranges;
+      };
+    };
-- 
2.34.1


