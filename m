Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8901DE5AD
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 13:38:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49T4Hx0y7GzDqxl
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 21:38:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tali.perry@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49T4Cy4cfYzDqvj
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 21:35:10 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 04MBXMSl015024;
 Fri, 22 May 2020 14:33:22 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 20088)
 id 676E4639C1; Fri, 22 May 2020 14:33:22 +0300 (IDT)
From: Tali Perry <tali.perry1@gmail.com>
To: ofery@google.com, brendanhiggins@google.com, avifishman70@gmail.com,
 tmaimon77@gmail.com, kfting@nuvoton.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
 wsa@the-dreams.de, andriy.shevchenko@linux.intel.com
Subject: [PATCH v13 1/3] dt-bindings: i2c: npcm7xx: add NPCM I2C controller
Date: Fri, 22 May 2020 14:33:10 +0300
Message-Id: <20200522113312.181413-2-tali.perry1@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200522113312.181413-1-tali.perry1@gmail.com>
References: <20200522113312.181413-1-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Added device tree binding documentation for Nuvoton BMC
NPCM I2C controller.

Signed-off-by: Tali Perry <tali.perry1@gmail.com>
---
 .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
new file mode 100644
index 000000000000..1c9d9a2d4bcd
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/nuvoton,npcm7xx-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: nuvoton NPCM7XX I2C Controller Device Tree Bindings
+
+description: |
+  The NPCM750x includes sixteen I2C bus controllers. All Controllers support
+  both master and slave mode. Each controller can switch between master and slave
+  at run time (i.e. IPMB mode). Each controller has two 16 byte HW FIFO for TX and
+  RX.
+
+maintainers:
+  - Tali Perry <tali.perry1@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,npcm7xx-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: Reference clock for the I2C bus
+
+  bus-frequency:
+    description: Desired I2C bus clock frequency in Hz. If not specified,
+                 the default 100 kHz frequency will be used.
+                 possible values are 100000, 400000 and 1000000.
+    default: 100000
+    enum: [100000, 400000, 1000000]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c0: i2c@80000 {
+        compatible = "nuvoton,npcm750-i2c";
+        reg = <0x80000 0x1000>;
+        clocks = <&clk NPCM7XX_CLK_APB2>;
+        bus-frequency = <100000>;
+        interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+...
-- 
2.22.0

