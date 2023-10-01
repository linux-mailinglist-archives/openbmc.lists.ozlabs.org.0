Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3A27B47B5
	for <lists+openbmc@lfdr.de>; Sun,  1 Oct 2023 15:49:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rz56g3fhhz3vb3
	for <lists+openbmc@lfdr.de>; Mon,  2 Oct 2023 00:49:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rz55f1yMCz3cmW
	for <openbmc@lists.ozlabs.org>; Mon,  2 Oct 2023 00:48:34 +1100 (AEDT)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 391DmRYY018285
	for <openbmc@lists.ozlabs.org>; Sun, 1 Oct 2023 16:48:27 +0300
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Sun, 1 Oct
 2023 16:48:26 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Sun, 1 Oct
 2023 21:48:24 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Sun, 1 Oct 2023 21:48:24 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id DF7F164741; Sun,  1 Oct 2023 16:48:23 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-6.5 v1 1/6] media: dt-bindings: nuvoton: Add NPCM VCD and ECE engine
Date: Sun, 1 Oct 2023 16:48:15 +0300
Message-ID: <20231001134820.110921-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20231001134820.110921-1-tmaimon77@gmail.com>
References: <20231001134820.110921-1-tmaimon77@gmail.com>
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
Cc: Marvin Lin <milkfafa@gmail.com>, Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add dt-bindings document for Video Capture/Differentiation Engine
(VCD) and Encoding Compression Engine (ECE) present on Nuvoton NPCM
SoCs.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../bindings/media/nuvoton,npcm-ece.yaml      | 43 +++++++++++
 .../bindings/media/nuvoton,npcm-vcd.yaml      | 72 +++++++++++++++++++
 2 files changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nuvoton,npcm-ece.yaml
 create mode 100644 Documentation/devicetree/bindings/media/nuvoton,npcm-vcd.yaml

diff --git a/Documentation/devicetree/bindings/media/nuvoton,npcm-ece.yaml b/Documentation/devicetree/bindings/media/nuvoton,npcm-ece.yaml
new file mode 100644
index 000000000000..b47468e54504
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nuvoton,npcm-ece.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/nuvoton,npcm-ece.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM Encoding Compression Engine
+
+maintainers:
+  - Joseph Liu <kwliu@nuvoton.com>
+  - Marvin Lin <kflin@nuvoton.com>
+
+description: |
+  Video Encoding Compression Engine (ECE) present on Nuvoton NPCM SoCs.
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,npcm750-ece
+      - nuvoton,npcm845-ece
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/reset/nuvoton,npcm7xx-reset.h>
+
+    ece: video-codec@f0820000 {
+        compatible = "nuvoton,npcm750-ece";
+        reg = <0xf0820000 0x2000>;
+        resets = <&rstc NPCM7XX_RESET_IPSRST2 NPCM7XX_RESET_ECE>;
+    };
diff --git a/Documentation/devicetree/bindings/media/nuvoton,npcm-vcd.yaml b/Documentation/devicetree/bindings/media/nuvoton,npcm-vcd.yaml
new file mode 100644
index 000000000000..c885f559d2e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nuvoton,npcm-vcd.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/nuvoton,npcm-vcd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM Video Capture/Differentiation Engine
+
+maintainers:
+  - Joseph Liu <kwliu@nuvoton.com>
+  - Marvin Lin <kflin@nuvoton.com>
+
+description: |
+  Video Capture/Differentiation Engine (VCD) present on Nuvoton NPCM SoCs.
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,npcm750-vcd
+      - nuvoton,npcm845-vcd
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  nuvoton,sysgcr:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to access GCR (Global Control Register) registers.
+
+  nuvoton,sysgfxi:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to access GFXI (Graphics Core Information) registers.
+
+  nuvoton,ece:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to access ECE (Encoding Compression Engine) registers.
+
+  memory-region:
+    maxItems: 1
+    description:
+      CMA pool to use for buffers allocation instead of the default CMA pool.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - resets
+  - nuvoton,sysgcr
+  - nuvoton,sysgfxi
+  - nuvoton,ece
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/nuvoton,npcm7xx-reset.h>
+
+    vcd: vcd@f0810000 {
+        compatible = "nuvoton,npcm750-vcd";
+        reg = <0xf0810000 0x10000>;
+        interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+        resets = <&rstc NPCM7XX_RESET_IPSRST2 NPCM7XX_RESET_VCD>;
+        nuvoton,sysgcr = <&gcr>;
+        nuvoton,sysgfxi = <&gfxi>;
+        nuvoton,ece = <&ece>;
+    };
-- 
2.33.0

