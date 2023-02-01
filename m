Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7F968645D
	for <lists+openbmc@lfdr.de>; Wed,  1 Feb 2023 11:35:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6JGZ2Bj6z3bT0
	for <lists+openbmc@lfdr.de>; Wed,  1 Feb 2023 21:35:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6JG81r75z3cNR;
	Wed,  1 Feb 2023 21:35:10 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 311AMJ1B097435;
	Wed, 1 Feb 2023 18:22:19 +0800 (GMT-8)
	(envelope-from ryan_chen@aspeedtech.com)
Received: from aspeedtech.com (192.168.10.13) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 1 Feb
 2023 18:34:04 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        Philipp Zabel
	<p.zabel@pengutronix.de>, <openbmc@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/3] dt-bindings: i2c-ast2600: Add support for AST2600 I2C global controller
Date: Wed, 1 Feb 2023 18:33:57 +0800
Message-ID: <20230201103359.1742140-2-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201103359.1742140-1-ryan_chen@aspeedtech.com>
References: <20230201103359.1742140-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.13]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 311AMJ1B097435
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

AST2600 I2C global register controller, add bindings document
to support driver of i2c global register set.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 .../i2c/aspeed,i2c-ast2600-global.yaml        | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,i2c-ast2600-global.yaml

diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c-ast2600-global.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c-ast2600-global.yaml
new file mode 100644
index 000000000000..d92a0878d03b
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c-ast2600-global.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/aspeed,i2c-ast2600-global.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AST2600 I2C Global Register on the AST26XX SoCs Device Tree Bindings
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
+      - aspeed,ast2600-i2c-global
+
+  reg:
+    minItems: 1
+    items:
+      - description: address offset and range of bus
+      - description: address offset and range of bus buffer
+
+  resets:
+    maxItems: 1
+
+required:
+  - reg
+  - compatible
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/ast2600-clock.h>
+
+    i2c_gr: i2c-global-regs@0 {
+      compatible = "aspeed,ast2600-i2c-global", "syscon";
+      reg = <0x0 0x20>;
+      resets = <&syscon ASPEED_RESET_I2C>;
+    };
-- 
2.34.1

