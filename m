Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2510169C558
	for <lists+openbmc@lfdr.de>; Mon, 20 Feb 2023 07:23:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKsnK71HFz3c6w
	for <lists+openbmc@lfdr.de>; Mon, 20 Feb 2023 17:23:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKsmw1kp1z3bVP;
	Mon, 20 Feb 2023 17:23:27 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 31K64wMU022737;
	Mon, 20 Feb 2023 14:04:58 +0800 (GMT-8)
	(envelope-from ryan_chen@aspeedtech.com)
Received: from aspeedtech.com (192.168.10.13) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 20 Feb
 2023 14:17:51 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        Philipp Zabel
	<p.zabel@pengutronix.de>, <openbmc@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 1/2] dt-bindings: i2c: Add support for ASPEED i2Cv2
Date: Mon, 20 Feb 2023 14:17:44 +0800
Message-ID: <20230220061745.1973981-2-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220061745.1973981-1-ryan_chen@aspeedtech.com>
References: <20230220061745.1973981-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.13]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 31K64wMU022737
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

AST2600 support new register set for I2Cv2 controller, add bindings
document to support driver of i2cv2 new register mode controller.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 .../devicetree/bindings/i2c/aspeed,i2cv2.yaml | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,i2cv2.yaml

diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2cv2.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2cv2.yaml
new file mode 100644
index 000000000000..913fb45d5fbe
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/aspeed,i2cv2.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/aspeed,i2cv2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED I2Cv2 Controller on the AST26XX SoCs
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
+      - aspeed,ast2600-i2cv2
+
+  reg:
+    minItems: 1
+    items:
+      - description: address offset and range of register
+      - description: address offset and range of buffer register
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      Reference clock for the I2C bus
+
+  resets:
+    maxItems: 1
+
+  clock-frequency:
+    description:
+      Desired I2C bus clock frequency in Hz. default 100khz.
+
+  multi-master:
+    type: boolean
+    description:
+      states that there is another master active on this bus
+
+  timeout:
+    type: boolean
+    description: Enable i2c bus timeout for master/slave (35ms)
+
+  byte-mode:
+    type: boolean
+    description: Force i2c driver use byte mode transmit
+
+  buff-mode:
+    type: boolean
+    description: Force i2c driver use buffer mode transmit
+
+  aspeed,gr:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of i2c global register node.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+  - aspeed,gr
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/ast2600-clock.h>
+    i2c: i2c-bus@80 {
+      compatible = "aspeed,ast2600-i2cv2";
+      reg = <0x80 0x80>, <0xc00 0x20>;
+      interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+      aspeed,gr = <&i2c_gr>;
+      clocks = <&syscon ASPEED_CLK_APB2>;
+      resets = <&syscon ASPEED_RESET_I2C>;
+    };
-- 
2.34.1

