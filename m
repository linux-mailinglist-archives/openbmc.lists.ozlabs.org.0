Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41022740C54
	for <lists+openbmc@lfdr.de>; Wed, 28 Jun 2023 11:05:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrbJT1TgWz30Xb
	for <lists+openbmc@lfdr.de>; Wed, 28 Jun 2023 19:05:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrbHX4L0Gz30K8
	for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2023 19:04:20 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 35S94A8p008079
	for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2023 12:04:10 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.14; Wed, 28 Jun
 2023 12:04:09 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 28
 Jun 2023 17:04:08 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server id 15.1.2176.2 via Frontend Transport;
 Wed, 28 Jun 2023 17:04:07 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 1F80164740; Wed, 28 Jun 2023 12:04:07 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-6.1 v1 1/2] dt-bindings: Add bindings for peci-npcm
Date: Wed, 28 Jun 2023 12:04:03 +0300
Message-ID: <20230628090404.234965-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230628090404.234965-1-tmaimon77@gmail.com>
References: <20230628090404.234965-1-tmaimon77@gmail.com>
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
Cc: Iwona Winiarska <iwona.winiarska@intel.com>, Joel Stanley <joel@jms.id.au>, kfting <warp5tw@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add device tree bindings for the peci-npcm controller driver.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
Signed-off-by: kfting <warp5tw@gmail.com>
Co-developed-by: Iwona Winiarska <iwona.winiarska@intel.com>
Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
---
 .../devicetree/bindings/peci/peci-npcm.yaml   | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/peci/peci-npcm.yaml

diff --git a/Documentation/devicetree/bindings/peci/peci-npcm.yaml b/Documentation/devicetree/bindings/peci/peci-npcm.yaml
new file mode 100644
index 000000000000..f82a6ed3a3d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/peci/peci-npcm.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/peci/peci-npcm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton PECI Bus
+
+maintainers:
+  - Tomer Maimon <tmaimon77@gmail.com>
+
+allOf:
+  - $ref: peci-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,npcm750-peci
+      - nuvoton,npcm845-peci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    description:
+      Clock source for PECI controller. Should reference the APB
+      clock.
+    maxItems: 1
+
+  cmd-timeout-ms:
+    minimum: 1
+    maximum: 1000
+    default: 1000
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    peci-controller@f0100000 {
+      compatible = "nuvoton,npcm750-peci";
+      reg = <0xf0100000 0x200>;
+      interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&clk NPCM7XX_CLK_APB3>;
+      cmd-timeout-ms = <1000>;
+    };
+...
-- 
2.33.0

