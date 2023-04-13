Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 934206E0857
	for <lists+openbmc@lfdr.de>; Thu, 13 Apr 2023 09:55:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxsMd3nW8z3fSk
	for <lists+openbmc@lfdr.de>; Thu, 13 Apr 2023 17:55:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxsLg0R2zz3f52;
	Thu, 13 Apr 2023 17:55:05 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 33D7bXNw096963;
	Thu, 13 Apr 2023 15:37:33 +0800 (GMT-8)
	(envelope-from ryan_chen@aspeedtech.com)
Received: from aspeedtech.com (192.168.10.13) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 13 Apr
 2023 15:53:30 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
        Benjamin Herrenschmidt
	<benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa@kernel.org>,
        "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>,
        <linux-i2c@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
        Jean Delvare <jdelvare@suse.de>,
        William Zhang <william.zhang@broadcom.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Ryan Chen
	<ryan_chen@aspeedtech.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        "Phil
 Edworthy" <phil.edworthy@renesas.com>,
        <openbmc@lists.ozlabs.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 1/2 RESEND] dt-bindings: i2c: aspeed: support for AST2600-i2cv2
Date: Thu, 13 Apr 2023 15:53:26 +0800
Message-ID: <20230413075327.1397306-2-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230413075327.1397306-1-ryan_chen@aspeedtech.com>
References: <20230413075327.1397306-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.13]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 33D7bXNw096963
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

Add ast2600-i2cv2 compatible and aspeed,global-regs, aspeed,enable-dma
and description for ast2600-i2cv2.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 52 +++++++++++++++++--
 1 file changed, 49 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
index f597f73ccd87..de252f6817ee 100644
--- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
@@ -9,9 +9,6 @@ title: ASPEED I2C on the AST24XX, AST25XX, and AST26XX SoCs Device Tree Bindings
 maintainers:
   - Rayn Chen <rayn_chen@aspeedtech.com>
 
-allOf:
-  - $ref: /schemas/i2c/i2c-controller.yaml#
-
 properties:
   compatible:
     enum:
@@ -49,6 +46,25 @@ properties:
     description:
       states that there is another master active on this bus
 
+  aspeed,enable-dma:
+    type: boolean
+    description: |
+      I2C bus enable dma mode transfer.
+
+      ASPEED ast2600 platform equipped with 16 I2C controllers that share a
+      single DMA engine. DTS files can specify the data transfer mode to/from
+      the device, either DMA or programmed I/O. However, hardware limitations
+      may require a DTS to manually allocate which controller can use DMA mode.
+      The "aspeed,enable-dma" property allows control of this.
+
+      In cases where one the hardware design results in a specific
+      controller handling a larger amount of data, a DTS would likely
+      enable DMA mode for that one controller.
+
+  aspeed,global-regs:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of i2c global register node.
+
 required:
   - reg
   - compatible
@@ -57,6 +73,26 @@ required:
 
 unevaluatedProperties: false
 
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: aspeed,ast2600-i2cv2
+
+    then:
+      properties:
+        reg:
+          minItems: 2
+      required:
+        - aspeed,global-regs
+    else:
+      properties:
+        aspeed,global-regs: false
+        aspeed,enable-dma: false
+
+
 examples:
   - |
     #include <dt-bindings/clock/aspeed-clock.h>
@@ -71,3 +107,13 @@ examples:
       interrupts = <0>;
       interrupt-parent = <&i2c_ic>;
     };
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    i2c1: i2c@80 {
+      compatible = "aspeed,ast2600-i2cv2";
+      reg = <0x80 0x80>, <0xc00 0x20>;
+      aspeed,global-regs = <&i2c_global>;
+      clocks = <&syscon ASPEED_CLK_APB>;
+      resets = <&syscon ASPEED_RESET_I2C>;
+      interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+    };
-- 
2.34.1

