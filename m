Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E6D78B29E
	for <lists+openbmc@lfdr.de>; Mon, 28 Aug 2023 16:09:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZC9N4fwyz3c1H
	for <lists+openbmc@lfdr.de>; Tue, 29 Aug 2023 00:09:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZC8z333kz2yDS
	for <openbmc@lists.ozlabs.org>; Tue, 29 Aug 2023 00:09:02 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 37SE8sem019851
	for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2023 17:08:55 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.14; Mon, 28 Aug
 2023 17:08:54 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.14; Mon, 28
 Aug 2023 22:08:51 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 28 Aug 2023 22:08:51 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 44E0064741; Mon, 28 Aug 2023 17:08:51 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <avifishman70@gmail.com>, <tali.perry1@gmail.com>, <joel@jms.id.au>,
        <venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
        <j.neuschaefer@gmx.net>
Subject: [PATCH v7 1/2] dt-binding: pinctrl: Add NPCM8XX pinctrl and GPIO documentation
Date: Mon, 28 Aug 2023 17:08:48 +0300
Message-ID: <20230828140849.21724-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230828140849.21724-1-tmaimon77@gmail.com>
References: <20230828140849.21724-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
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
Cc: Rob Herring <robh@kernel.org>, Tomer Maimon <tmaimon77@gmail.com>, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Added device tree binding documentation for Nuvoton Arbel BMC NPCM8XX
pinmux and GPIO controller.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../pinctrl/nuvoton,npcm845-pinctrl.yaml      | 216 ++++++++++++++++++
 1 file changed, 216 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
new file mode 100644
index 000000000000..e4b9f3da2cf0
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
@@ -0,0 +1,216 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/nuvoton,npcm845-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM845 Pin Controller and GPIO
+
+maintainers:
+  - Tomer Maimon <tmaimon77@gmail.com>
+
+description:
+  The Nuvoton BMC NPCM8XX Pin Controller multi-function routed through
+  the multiplexing block, Each pin supports GPIO functionality (GPIOx)
+  and multiple functions that directly connect the pin to different
+  hardware blocks.
+
+properties:
+  compatible:
+    const: nuvoton,npcm845-pinctrl
+
+  ranges:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  nuvoton,sysgcr:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: a phandle to access GCR registers.
+
+patternProperties:
+  '^gpio@':
+    type: object
+
+    description:
+      Eight GPIO banks that each contain 32 GPIOs.
+
+    properties:
+      gpio-controller: true
+
+      '#gpio-cells':
+        const: 2
+
+      reg:
+        maxItems: 1
+
+      interrupts:
+        maxItems: 1
+
+      gpio-ranges:
+        maxItems: 1
+
+    required:
+      - gpio-controller
+      - '#gpio-cells'
+      - reg
+      - interrupts
+      - gpio-ranges
+
+  '-mux$':
+    $ref: pinmux-node.yaml#
+
+    properties:
+      groups:
+        description:
+          One or more groups of pins to mux to a certain function
+        items:
+          enum: [ iox1, iox2, smb1d, smb2d, lkgpo1, lkgpo2, ioxh, gspi,
+                  smb5b, smb5c, lkgpo0, pspi, jm1, jm2, smb4den, smb4b,
+                  smb4c, smb15, smb16, smb17, smb18, smb19, smb20, smb21,
+                  smb22, smb23, smb23b, smb4d, smb14, smb5, smb4, smb3,
+                  spi0cs1, spi0cs2, spi0cs3, spi1cs0, spi1cs1, spi1cs2,
+                  spi1cs3, spi1cs23, smb3c, smb3b, bmcuart0a, uart1, jtag2,
+                  bmcuart1, uart2, sg1mdio, bmcuart0b, r1err, r1md, r1oen,
+                  r2oen, rmii3, r3oen, smb3d, fanin0, fanin1, fanin2, fanin3,
+                  fanin4, fanin5, fanin6, fanin7, fanin8, fanin9, fanin10,
+                  fanin11, fanin12, fanin13, fanin14, fanin15, pwm0, pwm1, pwm2,
+                  pwm3, r2, r2err, r2md, r3rxer, ga20kbc, smb5d, lpc, espi, rg2,
+                  ddr, i3c0, i3c1, i3c2, i3c3, i3c4, i3c5, smb0, smb1, smb2,
+                  smb2c, smb2b, smb1c, smb1b, smb8, smb9, smb10, smb11, sd1,
+                  sd1pwr, pwm4, pwm5, pwm6, pwm7, pwm8, pwm9, pwm10, pwm11,
+                  mmc8, mmc, mmcwp, mmccd, mmcrst, clkout, serirq, lpcclk,
+                  scipme, smi, smb6, smb7, spi1, faninx, r1, spi3, spi3cs1,
+                  spi3quad, spi3cs2, spi3cs3, nprd_smi, smb0b, smb0c, smb0den,
+                  smb0d, ddc, rg2mdio, wdog1, wdog2, smb12, smb13, spix,
+                  spixcs1, clkreq, hgpio0, hgpio1, hgpio2, hgpio3, hgpio4,
+                  hgpio5, hgpio6, hgpio7 ]
+
+      function:
+        description:
+          The function that a group of pins is muxed to
+        enum: [ iox1, iox2, smb1d, smb2d, lkgpo1, lkgpo2, ioxh, gspi,
+                smb5b, smb5c, lkgpo0, pspi, jm1, jm2, smb4den, smb4b,
+                smb4c, smb15, smb16, smb17, smb18, smb19, smb20, smb21,
+                smb22, smb23, smb23b, smb4d, smb14, smb5, smb4, smb3,
+                spi0cs1, spi0cs2, spi0cs3, spi1cs0, spi1cs1, spi1cs2,
+                spi1cs3, spi1cs23, smb3c, smb3b, bmcuart0a, uart1, jtag2,
+                bmcuart1, uart2, sg1mdio, bmcuart0b, r1err, r1md, r1oen,
+                r2oen, rmii3, r3oen, smb3d, fanin0, fanin1, fanin2, fanin3,
+                fanin4, fanin5, fanin6, fanin7, fanin8, fanin9, fanin10,
+                fanin11, fanin12, fanin13, fanin14, fanin15, pwm0, pwm1, pwm2,
+                pwm3, r2, r2err, r2md, r3rxer, ga20kbc, smb5d, lpc, espi, rg2,
+                ddr, i3c0, i3c1, i3c2, i3c3, i3c4, i3c5, smb0, smb1, smb2,
+                smb2c, smb2b, smb1c, smb1b, smb8, smb9, smb10, smb11, sd1,
+                sd1pwr, pwm4, pwm5, pwm6, pwm7, pwm8, pwm9, pwm10, pwm11,
+                mmc8, mmc, mmcwp, mmccd, mmcrst, clkout, serirq, lpcclk,
+                scipme, smi, smb6, smb7, spi1, faninx, r1, spi3, spi3cs1,
+                spi3quad, spi3cs2, spi3cs3, nprd_smi, smb0b, smb0c, smb0den,
+                smb0d, ddc, rg2mdio, wdog1, wdog2, smb12, smb13, spix,
+                spixcs1, clkreq, hgpio0, hgpio1, hgpio2, hgpio3, hgpio4,
+                hgpio5, hgpio6, hgpio7 ]
+
+    dependencies:
+      groups: [ function ]
+      function: [ groups ]
+
+    additionalProperties: false
+
+  '^pin':
+    $ref: pincfg-node.yaml#
+
+    properties:
+      pins:
+        description:
+          A list of pins to configure in certain ways, such as enabling
+          debouncing
+        items:
+          pattern: '^GPIO([0-9]|[0-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-6])'
+
+      bias-disable: true
+
+      bias-pull-up: true
+
+      bias-pull-down: true
+
+      input-enable: true
+
+      output-low: true
+
+      output-high: true
+
+      drive-push-pull: true
+
+      drive-open-drain: true
+
+      input-debounce:
+        description:
+          Debouncing periods in microseconds, one period per interrupt
+          bank found in the controller
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 1
+        maxItems: 4
+
+      slew-rate:
+        description: |
+          0: Low rate
+          1: High rate
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1]
+
+      drive-strength:
+        enum: [ 0, 1, 2, 4, 8, 12 ]
+
+    additionalProperties: false
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - compatible
+  - ranges
+  - '#address-cells'
+  - '#size-cells'
+  - nuvoton,sysgcr
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      pinctrl: pinctrl@f0010000 {
+        compatible = "nuvoton,npcm845-pinctrl";
+        ranges = <0x0 0x0 0xf0010000 0x8000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        nuvoton,sysgcr = <&gcr>;
+
+        gpio0: gpio@0 {
+          gpio-controller;
+          #gpio-cells = <2>;
+          reg = <0x0 0xb0>;
+          interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+          gpio-ranges = <&pinctrl 0 0 32>;
+        };
+
+        fanin0_pin: fanin0-mux {
+          groups = "fanin0";
+          function = "fanin0";
+        };
+
+        pin34_slew: pin34-slew {
+          pins = "GPIO34/I3C4_SDA";
+          bias-disable;
+        };
+      };
+    };
-- 
2.33.0

