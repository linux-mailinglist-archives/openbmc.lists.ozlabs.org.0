Return-Path: <openbmc+bounces-771-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A49C6BEF012
	for <lists+openbmc@lfdr.de>; Mon, 20 Oct 2025 03:32:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cqdFw2PRcz2ygH;
	Mon, 20 Oct 2025 12:32:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760923940;
	cv=none; b=PjG6UZV8M2TvgKCq7pTtjoKkgSUeDWre5y8z2vThaFKwFNdVYKzFfDBI7rdINMj4zPbMSLKjD5fBfUkS+I2+3LmiJc+/Y7DAwCZY78Hcfcg6vKgQWj7KESHp7wbHjzTW5W1yJshWniQbc/pGa2fg/o8o6cnAcqZWSKruHG+mgxnn9tdUP1rFZeBGNLBTUdWBSMWrS/FcXSkzSlI2ykRlOL9itDloz6JHDL1qEflbMDG6sPHpZWB5S9uJuRVR3p1+VqIBSuzCBx4a7ovr/G/MJAStpXdH61uWzhn9zKbs3vyC4Qqjv6uDMrtFu0w2o71/WZLCuVuUTl29F+eLVZCfgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760923940; c=relaxed/relaxed;
	bh=I3irr+I34/Duq3thisxPYhbIp9nyHDLkzqRnBXQ7Gfc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ctUc7krhBMaHyVXW7AHAPHAFNE43CSQ+zT7tuwsgPmAhjykj8w9rTIFIcROdmDFR7yNnxShzXUJSmRwOF89ATfNK6wzErXo87GHkXCFi2b0J9rJyPKwGkxPCxbsKKOR5kcHxqUUEWKzneKXruAQkZUBlFnBfvEwX7Z2o9opYQmo6QETW8KqLXikJ/BHTdN9j2vSWCBwrDqt29ttbL+6kMrM0oyDKu0VMjgcrJYXIkB6US8Q6WR6qzaa3LqAbAw26cx2optGUErV4/LTVdm8hHquR9B2cTlHl3G49C72oLWlu12hb+MBZLyeV0WNZE3r39jmXmhSc7oyLSICEVSjvtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cqdFv1yt0z3000;
	Mon, 20 Oct 2025 12:32:19 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 20 Oct
 2025 09:32:01 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 20 Oct 2025 09:32:01 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: <ryan_chen@aspeedtech.com>, <benh@kernel.crashing.org>, <joel@jms.id.au>,
	<andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <andrew@codeconstruct.com.au>,
	<p.zabel@pengutronix.de>, <andriy.shevchenko@linux.intel.com>,
	<naresh.solanki@9elements.com>, <linux-i2c@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v19 1/4] dt-bindings: i2c: Split AST2600 binding into a new YAML
Date: Mon, 20 Oct 2025 09:31:57 +0800
Message-ID: <20251020013200.1858325-2-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251020013200.1858325-1-ryan_chen@aspeedtech.com>
References: <20251020013200.1858325-1-ryan_chen@aspeedtech.com>
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

The AST2600 I2C controller is a new hardware design compared to the
I2C controllers in previous ASPEED SoCs (e.g., AST2400, AST2500).

It introduces new features such as:
 - A redesigned register layout
 - Separation between controller and target mode registers
 - Transfer mode selection (byte, buffer, DMA)
 - Support for a shared global register block for configuration

Due to these fundamental differences, maintaining a separate
devicetree binding file for AST2600 helps to clearly distinguish
the hardware capabilities and configuration options from the older
controllers.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 .../devicetree/bindings/i2c/aspeed,i2c.yaml   |  3 +-
 .../devicetree/bindings/i2c/ast2600-i2c.yaml  | 67 +++++++++++++++++++
 2 files changed, 68 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml

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
diff --git a/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml b/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml
new file mode 100644
index 000000000000..2dcddb0ecc2e
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
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
+    minItems: 1
+    maxItems: 2
+    items:
+      - description: address offset and range of bus
+      - description: address offset and range of bus buffer
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
+  resets:
+    maxItems: 1
+
+  bus-frequency:
+    minimum: 500
+    maximum: 4000000
+    default: 100000
+    description: frequency of the bus clock in Hz defaults to 100 kHz when not
+      specified
+
+required:
+  - reg
+  - compatible
+  - clocks
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/aspeed-clock.h>
+    i2c@40 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      compatible = "aspeed,ast2600-i2c-bus";
+      reg = <0x40 0x40>;
+      clocks = <&syscon ASPEED_CLK_APB>;
+      resets = <&syscon ASPEED_RESET_I2C>;
+      bus-frequency = <100000>;
+      interrupts = <0>;
+      interrupt-parent = <&i2c_ic>;
+    };
-- 
2.34.1


