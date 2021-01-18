Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5552F9A40
	for <lists+openbmc@lfdr.de>; Mon, 18 Jan 2021 07:56:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DK2dP6RNNzDqwW
	for <lists+openbmc@lfdr.de>; Mon, 18 Jan 2021 17:56:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=troy_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DK2XL41tLzDqvx;
 Mon, 18 Jan 2021 17:52:17 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 10I6jp6s030916;
 Mon, 18 Jan 2021 14:45:51 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 18 Jan
 2021 14:51:08 +0800
From: Troy Lee <troy_lee@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, Philipp Zabel <p.zabel@pengutronix.de>, open list
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/ASPEED MACHINE
 SUPPORT" <linux-aspeed@lists.ozlabs.org>
Subject: [PATCH v3 1/4] dt-bindings: hwmon: Add Aspeed AST2600 PWM/Fan
Date: Mon, 18 Jan 2021 06:50:49 +0000
Message-ID: <20210118065059.2478078-2-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210118065059.2478078-1-troy_lee@aspeedtech.com>
References: <20210118065059.2478078-1-troy_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 10I6jp6s030916
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
Cc: Rob Herring <robh@kernel.org>, chiawei_wang@aspeedtech.com,
 troy_lee@aspeedtech.com, ryan_chen@aspeedtech.com, leetroy@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

We add binding for supporting a new AST2600 PWM/Fan hwmon driver.

Changes since v2:
 - Fixed yamllint warnings/errors

Changes since v1:
 - dt binding with DT schema format

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Reported-by: Rob Herring <robh@kernel.org>
---
 .../hwmon/aspeed,ast2600-pwm-tachometer.yaml  | 131 ++++++++++++++++++
 1 file changed, 131 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,ast2600-pwm-tachometer.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/aspeed,ast2600-pwm-tachometer.yaml b/Documentation/devicetree/bindings/hwmon/aspeed,ast2600-pwm-tachometer.yaml
new file mode 100644
index 000000000000..fa5340f5a43f
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/aspeed,ast2600-pwm-tachometer.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/aspeed,ast2600-pwm-tachometer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED AST2600 PWM and Fan Tacho controller device driver
+
+maintainers:
+  - Ryan Chen <ryan_chen@aspeedtech.com>
+
+description: |
+  The ASPEED PWM controller can support upto 16 PWM outputs. The ASPEED Fan Tacho
+  controller can support upto 16 Fan tachometer inputs.
+  There can be upto 16 fans supported. Each fan can have one PWM output and
+  one Fan tach inputs.
+
+properties:
+  compatible:
+    const: aspeed,ast2600-pwm-tachometer
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  "#cooling-cells":
+    const: 2
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+patternProperties:
+  "^fan@[0-9a-f]$":
+    type: object
+    description:
+      Under fan subnode there can upto 16 child nodes, with each child node
+      representing a fan. There are 16 fans each fan can have one PWM port and one
+      Fan tach inputs.
+      For PWM port can be configured cooling-levels to create cooling device.
+      Cooling device could be bound to a thermal zone for the thermal control.
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 15
+        description:
+          This property identify the PWM control channel of this fan.
+
+      fan-tach-ch:
+        $ref: /schemas/types.yaml#/definitions/uint8
+        minimum: 0
+        maximum: 15
+        description:
+          This property identify the fan tach input channel.
+
+      pulses-per-revolution:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        default: 2
+        minimum: 1
+        description:
+          Specify tacho pulse per revolution of the fan.
+
+      cooling-levels:
+        description:
+          PWM duty cycle values in a range from 0 to 255
+          which correspond to thermal cooling states.
+
+      aspeed,pwm-freq-hz:
+        default: 25000
+        minimum: 24
+        maximum: 780000
+        description:
+          Specify the frequency of PWM.
+
+      aspeed,inverse-pin:
+        type: boolean
+        description:
+          Inverse PWM output signal.
+
+      aspeed,falling-point:
+        $ref: /schemas/types.yaml#/definitions/uint8
+        default: 10
+        description:
+          Initialize the pulse width.
+
+    required:
+      - fan-tach-ch
+      - reg
+
+    additionalProperties: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pwm_tacho: pwm-tacho-controller@1e610000 {
+        compatible = "aspeed,ast2600-pwm-tachometer";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0x1e610000 0x100>;
+
+        fan@1 {
+            reg = <0x00>;
+            aspeed,pwm-freq-hz = <25000>;
+            cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+            fan-tach-ch = /bits/ 8 <0x00>;
+            pulses-per-revolution = <2>;
+        };
+
+        fan@2 {
+            reg = <0x01>;
+            aspeed,pwm-freq-hz = <25000>;
+            cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+            fan-tach-ch = /bits/ 8 <0x01>;
+            pulses-per-revolution = <2>;
+        };
+    };
+...
-- 
2.25.1

