Return-Path: <openbmc+bounces-986-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C86CB5297
	for <lists+openbmc@lfdr.de>; Thu, 11 Dec 2025 09:46:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRmQw497sz2y7b;
	Thu, 11 Dec 2025 19:46:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765442792;
	cv=none; b=CdVkUZfX9+lFKyWx/XiT8NYzjMsfIKXVYl/Har34nd5XvDX7NuxlCS8ixTVVqnlkwks+ffxIPlwKoJiOSPFQ7y6LQ83AvQZUy4iignofC7hZH32sgUqOEzd40coXXluYQJtbzZcGWo6Q1Sza2DH5NQtD9/KBe70lV2303dlGYgBZ3J0Nc1ayOO+haC8Hr/POR9b+2FmeVgOrgb2KlN/U8rIRNb86hpdSVbxoab4lUTbFpDBDf5MVb+l98ThPChyKZ1WLVGlq2dYJm1jmyi05Hzzo9pownZL0Fcl+cstA7om45QFAbhXyyrO2hy7shADWL8vXmbqUPf7zXDZJb7g7QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765442792; c=relaxed/relaxed;
	bh=RWuMTwybbkZcREm+V+X/6EP+nTE/N/jdJSHIMtDYtnE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hQ3CSphqN1piXLbOfLZpQ3svDbVbItdm65iX4JN2AMg7MYdgZEvV+3kMbF6+J7BJ0jPp/XI02Ofy0PxUAvlJeS7ZnPH1f175Zz41B6H4rxBcdTr+Zwc3XdmbyJxcoFF5D0zq5g1JPRdF00kviT3B0XRp5Xwk/IPf1ij7/iToeIb3HxKPoqY78dXu/u0cpqvPbrDldFo2la0Gdx8/qNAQmmn7FUgR0rB3mh9ILB60ih85iUVH9GMFDYQbvOY1d4mC0kxXzl9UgT9cp1SeYjggabG2EpsES5rfFTKWqtNsYra9T5z4E+cOLm7gpF7hsIytzopgzVq/8HMGJYWFpiUIKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=mh71Hco2; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=mh71Hco2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRmQv5pt3z2xLR;
	Thu, 11 Dec 2025 19:46:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442791;
	bh=RWuMTwybbkZcREm+V+X/6EP+nTE/N/jdJSHIMtDYtnE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mh71Hco25hibo/l0UO3QYRXGQbADPdJGzJsRR/tj3w4AiJ+azFWUbtzBEC5NDqXaB
	 ThAx6Jks1X+4EOQwIj/6rhjjJCeEkC9I4qu3Fprqmjw0yrk2Q9Za5q2BuPr9huGo4f
	 UhlrfURae093F4CWUvsNhGKn/Rk3hJKX0AXtPTxVAgT7Bm2PKoB9/PzvI1PH06rvDX
	 eGQXY3YkS4PNJOawJcJWCsVcq+npZ52m+JFnlNGRtk8ykIzqmuxV4JY6lg83xsFlrK
	 ftx+6j5c9ltnVbp3nUj0azovvToi6uwFAQaG3Kw5Mta1cR0dreqJWf+37/v9EogZlB
	 HJbs6cmQFJj5A==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5E2147CADE;
	Thu, 11 Dec 2025 16:46:26 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 11 Dec 2025 17:45:43 +0900
Subject: [PATCH RFC 01/16] dt-bindings: hwmon: Convert
 aspeed,ast2400-pwm-tacho to DT schema
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
Message-Id: <20251211-dev-dt-warnings-all-v1-1-21b18b9ada77@codeconstruct.com.au>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-iio@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.3
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: "Rob Herring (Arm)" <robh@kernel.org>

Convert the ASpeed fan controller binding to DT schema format.

The '#cooling-cells' value used is 1 rather than 2. '#size-cells' is 0
rather 1.

Some users define more that 8 fan nodes where 2 fans share a PWM. The
driver seems to let the 2nd fan just overwrite the 1st one. That also
creates some addressing errors in the DT (duplicate addresses and wrong
unit-addresses).

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 .../bindings/hwmon/aspeed,ast2400-pwm-tacho.yaml   | 106 +++++++++++++++++++++
 .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt |  73 --------------
 2 files changed, 106 insertions(+), 73 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/aspeed,ast2400-pwm-tacho.yaml b/Documentation/devicetree/bindings/hwmon/aspeed,ast2400-pwm-tacho.yaml
new file mode 100644
index 000000000000..21f18e9d0dd4
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/aspeed,ast2400-pwm-tacho.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/aspeed,ast2400-pwm-tacho.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED AST2400/AST2500 PWM and Fan Tacho controller
+
+maintainers:
+  - Joel Stanley <joel@jms.id.au>
+  - Andrew Jeffery <andrew@codeconstruct.com.au>
+
+description: >
+  The ASPEED PWM controller can support up to 8 PWM outputs. The ASPEED Fan
+  Tacho controller can support up to 16 Fan tachometer inputs.
+
+  There can be up to 8 fans supported. Each fan can have 1 PWM output and
+  1-2 Fan tach inputs.
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2400-pwm-tacho
+      - aspeed,ast2500-pwm-tacho
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  '#cooling-cells':
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+patternProperties:
+  '^fan@[0-7]$':
+    description: Fan subnode
+    type: object
+    additionalProperties: false
+
+    properties:
+      reg:
+        description: PWM source port index (0 = PWM A, ..., 7 = PWM H)
+        maximum: 7
+
+      cooling-levels:
+        description: PWM duty cycle values for cooling states
+        $ref: /schemas/types.yaml#/definitions/uint8-array
+        minItems: 1
+        maxItems: 16  # Should be enough
+
+      aspeed,fan-tach-ch:
+        description: Fan tachometer input channel
+        $ref: /schemas/types.yaml#/definitions/uint8-array
+        minItems: 1
+        maxItems: 2
+        items:
+          maximum: 15
+
+    required:
+      - reg
+      - aspeed,fan-tach-ch
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+  - '#size-cells'
+  - clocks
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/aspeed-clock.h>
+
+    fan-controller@1e786000 {
+        compatible = "aspeed,ast2500-pwm-tacho";
+        reg = <0x1e786000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        #cooling-cells = <1>;
+        clocks = <&syscon ASPEED_CLK_APB>;
+        resets = <&syscon ASPEED_RESET_PWM>;
+
+        fan@0 {
+            reg = <0x00>;
+            cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+            aspeed,fan-tach-ch = /bits/ 8 <0x00>;
+        };
+
+        fan@1 {
+            reg = <0x01>;
+            aspeed,fan-tach-ch = /bits/ 8 <0x01 0x02>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
deleted file mode 100644
index 8645cd3b867a..000000000000
--- a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
+++ /dev/null
@@ -1,73 +0,0 @@
-ASPEED AST2400/AST2500 PWM and Fan Tacho controller device driver
-
-The ASPEED PWM controller can support upto 8 PWM outputs. The ASPEED Fan Tacho
-controller can support upto 16 Fan tachometer inputs.
-
-There can be upto 8 fans supported. Each fan can have one PWM output and
-one/two Fan tach inputs.
-
-Required properties for pwm-tacho node:
-- #address-cells : should be 1.
-
-- #size-cells : should be 1.
-
-- #cooling-cells: should be 2.
-
-- reg : address and length of the register set for the device.
-
-- pinctrl-names : a pinctrl state named "default" must be defined.
-
-- pinctrl-0 : phandle referencing pin configuration of the PWM ports.
-
-- compatible : should be "aspeed,ast2400-pwm-tacho" for AST2400 and
-	       "aspeed,ast2500-pwm-tacho" for AST2500.
-
-- clocks : phandle to clock provider with the clock number in the second cell
-
-- resets : phandle to reset controller with the reset number in the second cell
-
-fan subnode format:
-===================
-Under fan subnode there can upto 8 child nodes, with each child node
-representing a fan. If there are 8 fans each fan can have one PWM port and
-one/two Fan tach inputs.
-For PWM port can be configured cooling-levels to create cooling device.
-Cooling device could be bound to a thermal zone for the thermal control.
-
-Required properties for each child node:
-- reg : should specify PWM source port.
-	integer value in the range 0 to 7 with 0 indicating PWM port A and
-	7 indicating PWM port H.
-
-- cooling-levels: PWM duty cycle values in a range from 0 to 255
-                  which correspond to thermal cooling states.
-
-- aspeed,fan-tach-ch : should specify the Fan tach input channel.
-                integer value in the range 0 through 15, with 0 indicating
-		Fan tach channel 0 and 15 indicating Fan tach channel 15.
-		At least one Fan tach input channel is required.
-
-Examples:
-
-pwm_tacho: pwmtachocontroller@1e786000 {
-	#address-cells = <1>;
-	#size-cells = <1>;
-	#cooling-cells = <2>;
-	reg = <0x1E786000 0x1000>;
-	compatible = "aspeed,ast2500-pwm-tacho";
-	clocks = <&syscon ASPEED_CLK_APB>;
-	resets = <&syscon ASPEED_RESET_PWM>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
-
-	fan@0 {
-		reg = <0x00>;
-		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
-		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
-	};
-
-	fan@1 {
-		reg = <0x01>;
-		aspeed,fan-tach-ch = /bits/ 8 <0x01 0x02>;
-	};
-};

-- 
2.47.3


