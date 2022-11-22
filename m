Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FC4634773
	for <lists+openbmc@lfdr.de>; Tue, 22 Nov 2022 21:13:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGwSb1ZYbz3cLh
	for <lists+openbmc@lfdr.de>; Wed, 23 Nov 2022 07:13:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGwRT4kj6z3cLR
	for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2022 07:12:49 +1100 (AEDT)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 2AMKCdHu009110
	for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2022 22:12:39 +0200
Received: from NTHCCAS03.nuvoton.com (10.1.20.28) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 22 Nov
 2022 22:12:38 +0200
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS03.nuvoton.com
 (10.1.20.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1847.3; Wed, 23 Nov
 2022 04:12:36 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Wed, 23 Nov 2022 04:12:36 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id BDD6363A1B; Tue, 22 Nov 2022 22:12:35 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <avifishman70@gmail.com>, <tali.perry1@gmail.com>, <joel@jms.id.au>,
        <venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
        <arnd@arndb.de>, <hasegawa-hitomi@fujitsu.com>, <marcan@marcan.st>,
        <nicolas.ferre@microchip.com>, <conor.dooley@microchip.com>,
        <heiko@sntech.de>, <sven@svenpeter.dev>, <briannorris@chromium.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v1 1/2] dt-binding: soc: nuvoton: Add NPCM BPC LPC documentation
Date: Tue, 22 Nov 2022 22:12:31 +0200
Message-ID: <20221122201232.107065-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20221122201232.107065-1-tmaimon77@gmail.com>
References: <20221122201232.107065-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Added device tree binding documentation for Nuvoton BMC NPCM BIOS Post
Code (BPC).

The NPCM BPC monitoring two configurable I/O addresses written by the
host on Low Pin Count (LPC) bus.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../bindings/soc/nuvoton/npcm-lpc-bpc.yaml    | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/nuvoton/npcm-lpc-bpc.yaml

diff --git a/Documentation/devicetree/bindings/soc/nuvoton/npcm-lpc-bpc.yaml b/Documentation/devicetree/bindings/soc/nuvoton/npcm-lpc-bpc.yaml
new file mode 100644
index 000000000000..2c8e66546891
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/nuvoton/npcm-lpc-bpc.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/nuvoton/npcm-lpc-bpc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton Low Pin Count (LPC) Bus Controller
+
+maintainers:
+  - Tomer Maimon <tmaimon77@gmail.com>
+
+description:
+  The Low Pin Count (LPC) is a low bandwidth bus that is used to connect
+  peripherals around the CPU and to replace the Industry Standard Architecture
+  (ISA) bus.
+
+  The Nuvoton NPCM LPC bus is a bridge of host CPU to a several of peripheral
+  devices.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - nuvoton,npcm750-lpc
+          - nuvoton,npcm845-lpc
+      - const: simple-mfd
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^lpc_bpc@[0-9a-f]+$":
+    type: object
+    additionalProperties: false
+
+    description:
+      Nuvoton BMC NPCM BIOS Post Code (BPC) monitoring two configurable I/O
+      addresses written by the host on the Low Pin Count (LPC) bus, the capure
+      data stored in 128-word FIFO.
+
+      NPCM BPC supports capture double words, when using capture
+      double word only I/O address 1 is monitored.
+
+    properties:
+      compatible:
+        items:
+          - enum:
+              - nuvoton,npcm750-lpc-bpc
+              - nuvoton,npcm845-lpc-bpc
+
+      reg:
+        maxItems: 1
+
+      interrupts:
+        maxItems: 1
+
+      nuvoton,monitor-ports:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description: 
+          Contain monitor I/O addresses, at least one monitor I/O address 
+          required.
+
+      nuvoton,bpc-en-dwcapture:
+        description: If present, Enable capture double words support.
+        type: boolean
+
+    required:
+      - compatible
+      - reg
+      - interrupts
+      - nuvoton,monitor-ports
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties:
+  type: object
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    lpc: lpc@f0007000 {
+        compatible = "nuvoton,npcm750-lpc", "simple-mfd", "syscon";
+        reg = <0xf0007000 0x1000>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0xf0007000 0x1000>;
+
+        lpc_snoop: lpc-snoop@40 {
+            compatible = "nuvoton,npcm750-lpc-bpc";
+            reg = <0x40 0x20>;
+            interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+            nuvoton,monitor-ports = <0x80>;
+        };
+    };
+...
-- 
2.33.0

