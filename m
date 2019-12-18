Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D729123C77
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 02:36:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cyJs3CT8zDqVq
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 12:36:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cy7l40nBzDqSg
 for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2019 12:28:19 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 17:28:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,327,1571727600"; d="scan'208";a="390019025"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO ubuntu.jf.intel.com)
 ([10.7.153.147])
 by orsmga005.jf.intel.com with ESMTP; 17 Dec 2019 17:28:16 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org
Subject: [PATCH dev-5.4 07/14] dt-bindings: peci: add NPCM PECI documentation
Date: Tue, 17 Dec 2019 17:28:01 -0800
Message-Id: <20191218012808.6482-8-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218012808.6482-1-jae.hyun.yoo@linux.intel.com>
References: <20191218012808.6482-1-jae.hyun.yoo@linux.intel.com>
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tomer Maimon <tmaimon77@gmail.com>

Added device tree binding documentation for Nuvoton BMC
NPCM Platform Environment Control Interface(PECI).

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
Changes since v11:
- None

Changes since v10:
- Newly added in v11.

 .../devicetree/bindings/peci/peci-npcm.yaml   | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/peci/peci-npcm.yaml

diff --git a/Documentation/devicetree/bindings/peci/peci-npcm.yaml b/Documentation/devicetree/bindings/peci/peci-npcm.yaml
new file mode 100644
index 000000000000..bcd5626e68e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/peci/peci-npcm.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/peci/peci-npcm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM PECI Bus Device Tree Bindings
+
+maintainers:
+  - Tomer Maimon <tmaimon77@gmail.com>
+
+properties:
+  compatible:
+    const: nuvoton,npcm750-peci # for the NPCM7XX BMC.
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    # Required to define a client address.
+    const: 1
+
+  "#size-cells":
+    # Required to define a client address.
+    const: 0
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    # PECI reference clock.
+    maxItems: 1
+
+  cmd-timeout-ms:
+    # Command timeout in units of ms.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 1
+        maximum: 60000
+        default: 1000
+
+  pull-down:
+    description: |
+      Defines the PECI I/O internal pull down operation.
+        0: pull down always enable
+        1: pull down only during transactions.
+        2: pull down always disable.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 0
+        maximum: 2
+        default: 0
+
+  host-neg-bit-rate:
+    description: |
+      Define host negotiation bit rate divider.
+      the host negotiation bit rate calculate with formula:
+      clock frequency[Hz] / [4 x {host-neg-bit-rate + 1}]
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 7
+        maximum: 31
+        default: 15
+
+  high-volt-range:
+    description: |
+      Adapts PECI I/O interface to voltage range.
+        0: PECI I/O interface voltage range of 0.8-1.06V (default)
+        1: PECI I/O interface voltage range of 0.95-1.26V
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - interrupts
+  - clocks
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
+    peci: bus@100000 {
+        compatible = "simple-bus";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x100000 0x200>;
+
+        peci0: peci-bus@0 {
+            compatible = "nuvoton,npcm750-peci";
+            reg = <0x0 0x200>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk NPCM7XX_CLK_APB3>;
+            cmd-timeout-ms = <1000>;
+            pull-down = <0>;
+            host-neg-bit-rate = <15>;
+        };
+    };
+...
-- 
2.17.1

