Return-Path: <openbmc+bounces-806-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF330C0BEBE
	for <lists+openbmc@lfdr.de>; Mon, 27 Oct 2025 07:13:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cw38W0sBPz3btx;
	Mon, 27 Oct 2025 17:12:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761545579;
	cv=none; b=NRAHIDy7IbAs6AmZYgRTJdZOtZfWrhwG6ax1dzJcBjjK4WtBFG6IUMnanmV4vNyLSXjQCJsTqvd6deOo0ImmwwHNN1omYlrZSptFOLDQx9aRV/P7ZFwXO5oqx+1PeKSHIAiVbDro8WMdEdIuMXrW5ZXQCPQR0KwN7nsAzcrQ8qhmt6BgXahrNUPxLs2jogfIuvHuYFhWIcOpnr51rIHMKHI5qoZ0XPSd74EhS4+lYYdWhIOZVzUcwK3lk//mDEVAWQG6U11Cy4Q4O7EvAZ9DbgEae9b//hEhQeYM8wExj1UY0b/RNv7udbvUI39KgUxCHkslrOhMrHh1wz4V0XC3hA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761545579; c=relaxed/relaxed;
	bh=c0C96LEGCRbvGWCAuulDGECLSitILm6Lb2+wjLfqMKk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hn6x6PzZ/Pi6q6h117tsW3VqdA8w/Ff3ZfTg2dqQuTzJv24HyDcqMFaEjTPFeN8NM2kQHFAWJh/avVaGhc3IuEAveGQ2+n946uV0ZgXH8IBSiGyCQIhXNtIqTB5hHOU8E1vy4+t3+7H8GS4+4uCommSeb78hgmReSqYfD0Rz2xpmfSr2sUAuHnYnMtiYn4UctskIXOemxIs2r7P5u9JgHQJKKdJtaarklcGIWjfb/OdsTzAJjmTQmhLXomlhXZV/su9HMnzpLWM3VUgQKdzBxkkLkCbCZLwPY+bwcdmasL7CLVDKteftkY9RbunB/x4YmBq1dzwaCbbTLGSZtJkJeA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cw38T5H1bz3bcf;
	Mon, 27 Oct 2025 17:12:57 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 27 Oct
 2025 14:12:40 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 27 Oct 2025 14:12:40 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: <ryan_chen@aspeedtech.com>, <bmc-sw@aspeedtech.com>,
	<benh@kernel.crashing.org>, <joel@jms.id.au>, <andi.shyti@kernel.org>,
	<jk@codeconstruct.com.au>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <andrew@codeconstruct.com.au>,
	<p.zabel@pengutronix.de>, <andriy.shevchenko@linux.intel.com>,
	<naresh.solanki@9elements.com>, <linux-i2c@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v21 1/4] dt-bindings: i2c: Split AST2600 binding into a new YAML
Date: Mon, 27 Oct 2025 14:12:37 +0800
Message-ID: <20251027061240.3427875-2-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027061240.3427875-1-ryan_chen@aspeedtech.com>
References: <20251027061240.3427875-1-ryan_chen@aspeedtech.com>
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
existing bindings. Therefore, this patch creates a dedicated
binding file for AST2600 to properly describe these new
hardware capabilities.

A subsequent change will modify this new binding to properly
describe the AST2600 hardware.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 .../devicetree/bindings/i2c/aspeed,i2c.yaml   |  3 +-
 .../devicetree/bindings/i2c/ast2600-i2c.yaml  | 66 +++++++++++++++++++
 2 files changed, 67 insertions(+), 2 deletions(-)
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
index 000000000000..6ddcec5decdc
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/ast2600-i2c.yaml#
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


