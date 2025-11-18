Return-Path: <openbmc+bounces-918-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9275AC66DCF
	for <lists+openbmc@lfdr.de>; Tue, 18 Nov 2025 02:41:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9S4P2fyCz2yx8;
	Tue, 18 Nov 2025 12:40:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763430053;
	cv=none; b=Y/PGe4/npSKrjPCKz+xQsQ9/gTI5RwthfvOiHLR8DncN2m2w9HOwdmYWx6ByhFB4WJYrQqB1UY39X2l2A6TdRygw16MHiTPgr9c70NblA/oa/J7mjesDmwiM90P3aRvOE2FPhbiWW5uWKFScV/2aCoNcE2SuWAU7dW2iB6wUTPm545pxndDyoHfyjMVasjJUhhS757Jx40AM6sB6EO/JhzpNyBMDXh2/mqYjyyyMFbG/9oUlUwI9lkzx5ggHEiKkOwMCq6+KV9eXM65crq9Gs8OiphhjVFz4DYUMeIlfGLPdzo4TxFduzTUl/gggzsUjl67cICvu1lziYk8rDezQhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763430053; c=relaxed/relaxed;
	bh=W77VAo4vqY7GLQ8CLBK0o8kjc8bjJBmSTSKvFZ/YE1Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BAdZYO05xEAU7+xHlwVSzhB0YrgWDVRPSg84/WfzXwBCTbx0fV4NTQal+OAm7LeW1pL9O+iOn18j4fEihlYb6rGoe/6zCX+nf4XkoG0h6Srh0UIund+l0rBAPAAu3fwd7t1hQmyKOfjkGvTxM4JKphL8j0Umc1tWKm/UbSXS3/etiHFF2D/ab487dVHifZsemfeFm6MABKvSMd18f6rrdVw7puxBW9iZegTOypHitP714AdbAJGRmk6ktEob2tQQRQWlZ+5zlRXO1RaCHWUVtxzcBext8uZJYwxZol9SA0BeC1EjuRY58E07U57bq/JvJevmQU/KYoHE9/T+aMOXgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9S4N2tbMz2ymg;
	Tue, 18 Nov 2025 12:40:52 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 18 Nov
 2025 09:40:34 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 18 Nov 2025 09:40:34 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: <ryan_chen@aspeedtech.com>, <bmc-sw@aspeedtech.com>,
	<andriy.shevchenko@linux.intel.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <benh@kernel.crashing.org>, <joel@jms.id.au>,
	<andi.shyti@kernel.org>, <jk@codeconstruct.com.au>,
	<andrew@codeconstruct.com.au>, <p.zabel@pengutronix.de>,
	<naresh.solanki@9elements.com>, <linux-i2c@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v24 1/4] dt-bindings: i2c: Split AST2600 binding into a new YAML
Date: Tue, 18 Nov 2025 09:40:31 +0800
Message-ID: <20251118014034.820988-2-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251118014034.820988-1-ryan_chen@aspeedtech.com>
References: <20251118014034.820988-1-ryan_chen@aspeedtech.com>
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

The AST2600 I2C controller introduces a completely new register
map and Separate control/target register sets, unlike the mixed
layout used in AST2400/AST2500.

In addition, at new AST2600 configuration registers and transfer
modes require new DT properties, which are incompatible with
existing bindings. Therefore, this creates a dedicated binding
file for AST2600 to properly describe these new hardware
capabilities.

A subsequent change will modify this new binding to properly
describe the AST2600 hardware.

The example section updated to reflect the actual AST2600 SoC
register layout and interrupt configuration.
Reference: aspeed-g6.dtsi (lines 885-897)

-I2C bus and buffer register offsets
 - AST2600 I2C controller register base starts from 0x80, and the
   buffer region is located at 0xc00, as defined in AST2600 SOC
   register map.

-Interrupt configuration
 - AST2600 I2C controller are connected to ARM GIC interrupt
   controller rather than the legacy internal interrupt controller.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 .../bindings/i2c/aspeed,ast2600-i2c.yaml      | 65 +++++++++++++++++++
 .../devicetree/bindings/i2c/aspeed,i2c.yaml   |  3 +-
 2 files changed, 66 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
new file mode 100644
index 000000000000..e5484d18f616
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED I2C on the AST26XX SoCs
+
+maintainers:
+  - Ryan Chen <ryan_chen@aspeedtech.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2600-i2c-bus
+
+  reg:
+    items:
+      - description: controller registers
+      - description: controller buffer space
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      root clock of bus, should reference the APB
+      clock in the second cell
+
+  clock-frequency:
+    description: Desired operating frequency of the I2C bus in Hz.
+    minimum: 500
+    maximum: 4000000
+    default: 100000
+
+  resets:
+    maxItems: 1
+
+required:
+  - reg
+  - compatible
+  - clocks
+  - resets
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/aspeed-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    i2c@80 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      compatible = "aspeed,ast2600-i2c-bus";
+      reg = <0x80 0x80>, <0xc00 0x20>;
+      clocks = <&syscon ASPEED_CLK_APB>;
+      resets = <&syscon ASPEED_RESET_I2C>;
+      clock-frequency = <100000>;
+      interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+    };
diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
index 5b9bd2feda3b..d4e4f412feba 100644
--- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: ASPEED I2C on the AST24XX, AST25XX, and AST26XX SoCs
+title: ASPEED I2C on the AST24XX, AST25XX SoCs
 
 maintainers:
   - Rayn Chen <rayn_chen@aspeedtech.com>
@@ -17,7 +17,6 @@ properties:
     enum:
       - aspeed,ast2400-i2c-bus
       - aspeed,ast2500-i2c-bus
-      - aspeed,ast2600-i2c-bus
 
   reg:
     minItems: 1
-- 
2.34.1


