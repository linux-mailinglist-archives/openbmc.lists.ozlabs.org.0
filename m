Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D42135869F9
	for <lists+openbmc@lfdr.de>; Mon,  1 Aug 2022 14:10:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxH4S53gsz3cH1
	for <lists+openbmc@lfdr.de>; Mon,  1 Aug 2022 22:10:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxH2x2TF9z2yL6
	for <openbmc@lists.ozlabs.org>; Mon,  1 Aug 2022 22:08:40 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 271C8QEk020957
	for <openbmc@lists.ozlabs.org>; Mon, 1 Aug 2022 15:08:27 +0300
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 1 Aug
 2022 15:08:26 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Mon, 1 Aug 2022
 20:08:23 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 1 Aug 2022 20:08:23 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id C3DA863A0A; Mon,  1 Aug 2022 15:08:22 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.15 v1 03/16] dt-binding: clk: npcm845: Add binding for Nuvoton NPCM8XX Clock
Date: Mon, 1 Aug 2022 15:08:06 +0300
Message-ID: <20220801120819.113533-4-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220801120819.113533-1-tmaimon77@gmail.com>
References: <20220801120819.113533-1-tmaimon77@gmail.com>
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
Cc: andrew@aj.id.au, joel@jms.id.au, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add binding for the Arbel BMC NPCM8XX Clock controller.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../bindings/clock/nuvoton,npcm845-clk.yaml   | 49 +++++++++++++++++++
 .../dt-bindings/clock/nuvoton,npcm845-clk.h   | 49 +++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
 create mode 100644 include/dt-bindings/clock/nuvoton,npcm845-clk.h

diff --git a/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml b/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
new file mode 100644
index 000000000000..771db2ddf026
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/nuvoton,npcm845-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM8XX Clock Controller Binding
+
+maintainers:
+  - Tomer Maimon <tmaimon77@gmail.com>
+
+description: |
+  Nuvoton Arbel BMC NPCM8XX contains an integrated clock controller, which
+  generates and supplies clocks to all modules within the BMC.
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,npcm845-clk
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+    description:
+      See include/dt-bindings/clock/nuvoton,npcm8xx-clock.h for the full
+      list of NPCM8XX clock IDs.
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    ahb {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@f0801000 {
+            compatible = "nuvoton,npcm845-clk";
+            reg = <0x0 0xf0801000 0x0 0x1000>;
+            #clock-cells = <1>;
+        };
+    };
+...
diff --git a/include/dt-bindings/clock/nuvoton,npcm845-clk.h b/include/dt-bindings/clock/nuvoton,npcm845-clk.h
new file mode 100644
index 000000000000..e5cce08b00e1
--- /dev/null
+++ b/include/dt-bindings/clock/nuvoton,npcm845-clk.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2021 Nuvoton Technologies.
+ * Author: Tomer Maimon <tomer.maimon@nuvoton.com>
+ *
+ * Device Tree binding constants for NPCM8XX clock controller.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_NPCM8XX_H
+#define __DT_BINDINGS_CLOCK_NPCM8XX_H
+
+#define NPCM8XX_CLK_CPU		0
+#define NPCM8XX_CLK_GFX_PIXEL	1
+#define NPCM8XX_CLK_MC		2
+#define NPCM8XX_CLK_ADC		3
+#define NPCM8XX_CLK_AHB		4
+#define NPCM8XX_CLK_TIMER	5
+#define NPCM8XX_CLK_UART	6
+#define NPCM8XX_CLK_UART2	7
+#define NPCM8XX_CLK_MMC		8
+#define NPCM8XX_CLK_SPI3	9
+#define NPCM8XX_CLK_PCI		10
+#define NPCM8XX_CLK_AXI		11
+#define NPCM8XX_CLK_APB4	12
+#define NPCM8XX_CLK_APB3	13
+#define NPCM8XX_CLK_APB2	14
+#define NPCM8XX_CLK_APB1	15
+#define NPCM8XX_CLK_APB5	16
+#define NPCM8XX_CLK_CLKOUT	17
+#define NPCM8XX_CLK_GFX		18
+#define NPCM8XX_CLK_SU		19
+#define NPCM8XX_CLK_SU48	20
+#define NPCM8XX_CLK_SDHC	21
+#define NPCM8XX_CLK_SPI0	22
+#define NPCM8XX_CLK_SPI1	23
+#define NPCM8XX_CLK_SPIX	24
+#define NPCM8XX_CLK_RG		25
+#define NPCM8XX_CLK_RCP		26
+#define NPCM8XX_CLK_PRE_ADC	27
+#define NPCM8XX_CLK_ATB		28
+#define NPCM8XX_CLK_PRE_CLK	29
+#define NPCM8XX_CLK_TH		30
+#define NPCM8XX_CLK_REFCLK	31
+#define NPCM8XX_CLK_SYSBYPCK	32
+#define NPCM8XX_CLK_MCBYPCK	33
+
+#define NPCM8XX_NUM_CLOCKS	(NPCM8XX_CLK_MCBYPCK + 1)
+
+#endif
-- 
2.33.0

