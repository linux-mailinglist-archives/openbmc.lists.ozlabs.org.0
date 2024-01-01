Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F4682150A
	for <lists+openbmc@lfdr.de>; Mon,  1 Jan 2024 19:49:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T3lPy5ZSRz3cbX
	for <lists+openbmc@lfdr.de>; Tue,  2 Jan 2024 05:49:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T3lNT1W7Qz3bPM
	for <openbmc@lists.ozlabs.org>; Tue,  2 Jan 2024 05:47:48 +1100 (AEDT)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 401IleOR020934
	for <openbmc@lists.ozlabs.org>; Mon, 1 Jan 2024 20:47:41 +0200
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 1 Jan
 2024 20:47:39 +0200
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 2 Jan
 2024 02:47:38 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 2 Jan 2024 02:47:37 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 34CF05F5D4;
	Mon,  1 Jan 2024 20:47:37 +0200 (IST)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 32776DC3805; Mon,  1 Jan 2024 20:47:37 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-6.6 v1 1/2] dt-bindings: soc: nuvoton: Add NPCM BPC
Date: Mon, 1 Jan 2024 20:47:34 +0200
Message-ID: <20240101184735.3048767-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240101184735.3048767-1-tmaimon77@gmail.com>
References: <20240101184735.3048767-1-tmaimon77@gmail.com>
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
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Added device tree binding documentation for Nuvoton BMC NPCM BIOS Post
Code (BPC).

The NPCM BPC monitoring two configurable I/O addresses written by the
host on the bus.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../soc/nuvoton/nuvoton,npcm-bpc.yaml         | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-bpc.yaml

diff --git a/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-bpc.yaml b/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-bpc.yaml
new file mode 100644
index 000000000000..c04302a1d52b
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-bpc.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/nuvoton/nuvoton,npcm-bpc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton BMC NPCM BIOS Post Code (BPC) controller
+
+maintainers:
+  - Tomer Maimon <tmaimon77@gmail.com>
+
+description:
+  Nuvoton BMC NPCM BIOS Post Code (BPC) monitoring two configurable I/O
+  addresses written by the host on the bus, the capture data stored in
+  128-word FIFO.
+
+  NPCM BPC supports capture double words, when using capture
+  double word only I/O address 1 is monitored.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - nuvoton,npcm845-bpc
+          - nuvoton,npcm750-bpc
+      - const: nuvoton,npcm-bpc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  nuvoton,monitor-ports:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Contain monitor I/O addresses on the bus, at least one monitor I/O
+      address required.
+
+  nuvoton,bpc-en-dwcapture:
+    description:
+      Set DWCAPTURE bit in BPCFEN register that enable double words capture
+      according to the first address setting.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - nuvoton,monitor-ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    bpc: bpc@f0007040 {
+        compatible = "nuvoton,npcm750-bpc", "nuvoton,npcm-bpc";
+        reg = <0xf0007040 0x20>;
+        interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+        nuvoton,monitor-ports = <0x80>;
+    };
+...
-- 
2.34.1

