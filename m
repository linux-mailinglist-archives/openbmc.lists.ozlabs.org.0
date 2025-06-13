Return-Path: <openbmc+bounces-195-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D72BCAD8246
	for <lists+openbmc@lfdr.de>; Fri, 13 Jun 2025 07:04:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJS3Z328Yz30HB;
	Fri, 13 Jun 2025 15:03:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749785739;
	cv=none; b=jU2tYv++Me4eGqbwfLZ06yvMSnloiKhkBQVmco9BlSNpx3aVlNKBEEczXQlO9k+oScLBfLWSr1GZOzR2ImJAdzHYwx6TGrGRPpnQKCA4CZa7r1PFzRNY+n33WPLle4fr3VuOJYn7hyAFy656jnX/860RsMDnp1VvAioWpbGYVvz5fwAsks68om2HifeMUdcD3usBVaAGbINBzcWXSGDDz58gSesqCEmuxR+sJC28kUKMH4lJ5SMu17WKH0vgctYM+bE9XGAYPFVqcfXzfdju+PQxHKbY9R8e7wZh903JYE6spzPWb8FGLA3lUVjRvUoEifm/hBGIC82fy55YIqnh5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749785739; c=relaxed/relaxed;
	bh=Mt2IIDVM6+U5cUTpdOyoV20KGSd22stNZ1+aNx10gA0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MfCN0CEBqsaWW9f4mpL+oaqn7673VtM0TzLZ/GOB08rOdUISjUOSeN28mAQhXrWmiJVeljeOi7G5ipRI1xybzuvkoi6XhJ67FKdmYkuBSJqM2/6DzycPlQJtcktK5P/tKwLlU4BAo2OEYSrPbVzxbARp010UaRzil9yHKZSGZl8BSYjVhgu8lKZURHgJ0FkMmikbT1jtm+nLXEN2f2RjnoJYYNniwVgZCn6FbxhKZQZV8PlbuU5M1BoFnK0M4SoT/UQTAlEJFAMtZwcNA/0IUQCb2rraRd2m0fk8FYCZGm4rw9aM3oQHo1hx5YVexH7egm5QzIXoYrFYl5XYcIM4dw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJQ5l1ZZSz30DP
	for <openbmc@lists.ozlabs.org>; Fri, 13 Jun 2025 13:35:39 +1000 (AEST)
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
Subject: [PATCH 3/7] dt-bindings: pci: Add document for ASPEED PCIe RC
Date: Fri, 13 Jun 2025 11:29:57 +0800
Message-ID: <20250613033001.3153637-4-jacky_chou@aspeedtech.com>
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

Add device tree binding documentation for the ASPEED PCIe Root Complex
controller. This binding describes the required and optional properties
for configuring the PCIe RC node, including support for syscon phandles,
MSI, clocks, resets, and interrupt mapping. The schema enforces strict
property validation and provides a comprehensive example for reference.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 .../devicetree/bindings/pci/aspeed-pcie.yaml  | 159 ++++++++++++++++++
 1 file changed, 159 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/aspeed-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/aspeed-pcie.yaml b/Documentation/devicetree/bindings/pci/aspeed-pcie.yaml
new file mode 100644
index 000000000000..5b50a9e2d472
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/aspeed-pcie.yaml
@@ -0,0 +1,159 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/aspeed-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED PCIe Root Complex Controller
+
+maintainers:
+  - Jacky Chou <jacky_chou@aspeedtech.com>
+
+description: |
+  Device tree binding for the ASPEED PCIe Root Complex controller.
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2600-pcie
+      - aspeed,ast2700-pcie
+
+  device_type:
+    const: pci
+
+  reg:
+    maxItems: 1
+
+  ranges:
+    minItems: 2
+    maxItems: 2
+
+  interrupts:
+    description: IntX and MSI interrupt
+
+  resets:
+    items:
+      - description: Module reset
+      - description: PCIe PERST
+
+  reset-names:
+    items:
+      - const: h2x
+      - const: perst
+
+  msi-parent: true
+
+  msi_address:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: MSI address
+
+  aspeed,ahbc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to ASPEED AHBC syscon.
+
+  aspeed,pciecfg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to ASPEED PCIe configuration syscon.
+
+  aspeed,pciephy:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to ASPEED PCIe PHY syscon.
+
+  clocks:
+    description: PCIe BUS clock
+
+  interrupt-controller:
+    description: Interrupt controller node for handling legacy PCI interrupts.
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
+  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/interrupt-controller/msi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: aspeed,ast2600-pcie
+    then:
+      required:
+        - aspeed,ahbc
+
+required:
+  - interrupts
+  - bus-range
+  - ranges
+  - resets
+  - reset-names
+  - msi-parent
+  - msi-controller
+  - aspeed,pciephy
+  - aspeed,pciecfg
+  - interrupt-map-mask
+  - interrupt-map
+  - interrupt-controller
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/ast2600-clock.h>
+
+    apb {
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      pcie0: pcie@1e7700C0 {
+        compatible = "aspeed,ast2600-pcie";
+        device_type = "pci";
+        reg = <0x1e7700C0 0x40>;
+        linux,pci-domain = <0>;
+        #address-cells = <3>;
+        #size-cells = <2>;
+        interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
+        bus-range = <0x80 0xff>;
+
+        ranges = <0x01000000 0x0 0x00018000 0x00018000 0x0 0x00008000
+                  0x02000000 0x0 0x70000000 0x70000000 0x0 0x10000000>;
+
+        resets = <&syscon ASPEED_RESET_H2X>,
+                 <&syscon ASPEED_RESET_PCIE_RC_O>;
+        reset-names = "h2x", "perst";
+        clocks = <&syscon ASPEED_CLK_GATE_BCLK>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_pcierc1_default>;
+
+        #interrupt-cells = <1>;
+        msi-parent = <&pcie0>;
+        msi-controller;
+        msi_address = <0x1e77005C>;
+
+        aspeed,ahbc = <&ahbc>;
+        aspeed,pciecfg = <&pciecfg>;
+        aspeed,pciephy = <&pcie_phy1>;
+
+        interrupt-map-mask = <0 0 0 7>;
+        interrupt-map = <0 0 0 1 &pcie_intc0 0>,
+                        <0 0 0 2 &pcie_intc0 1>,
+                        <0 0 0 3 &pcie_intc0 2>,
+                        <0 0 0 4 &pcie_intc0 3>;
+        pcie_intc0: interrupt-controller {
+          interrupt-controller;
+          #address-cells = <0>;
+          #interrupt-cells = <1>;
+        };
+      };
+    };
-- 
2.43.0


