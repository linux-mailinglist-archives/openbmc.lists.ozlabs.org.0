Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D9002123C72
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 02:33:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cyG61PTxzDqTx
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 12:33:50 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cy7k3CTzzDqSM
 for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2019 12:28:18 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 17:28:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,327,1571727600"; d="scan'208";a="390019018"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO ubuntu.jf.intel.com)
 ([10.7.153.147])
 by orsmga005.jf.intel.com with ESMTP; 17 Dec 2019 17:28:14 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org
Subject: [PATCH dev-5.4 04/14] dt-bindings: Add bindings document of Aspeed
 PECI adapter
Date: Tue, 17 Dec 2019 17:27:58 -0800
Message-Id: <20191218012808.6482-5-jae.hyun.yoo@linux.intel.com>
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This commit adds bindings document of Aspeed PECI adapter for ASPEED
AST24xx/25xx/26xx SoCs.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
Changes since v11:
- None

Changes since v10:
- Changed documents format to DT schema format so I dropped all review tags.
  Please review it again.

 .../devicetree/bindings/peci/peci-aspeed.yaml | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/peci/peci-aspeed.yaml

diff --git a/Documentation/devicetree/bindings/peci/peci-aspeed.yaml b/Documentation/devicetree/bindings/peci/peci-aspeed.yaml
new file mode 100644
index 000000000000..0f5c2993fe9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/peci/peci-aspeed.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/peci/peci-aspeed.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aspeed PECI Bus Device Tree Bindings
+
+maintainers:
+  - Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2400-peci
+      - aspeed,ast2500-peci
+      - aspeed,ast2600-peci
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
+    description: |
+      Clock source for PECI controller. Should reference the external
+      oscillator clock.
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  clock-frequency:
+    # Operation frequency of PECI controller in units of Hz.
+    minimum: 187500
+    maximum: 24000000
+
+  msg-timing:
+    description: |
+      Message timing negotiation period. This value will determine the period
+      of message timing negotiation to be issued by PECI controller. The unit
+      of the programmed value is four times of PECI clock period.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 0
+        maximum: 255
+        default: 1
+
+  addr-timing:
+    description: |
+      Address timing negotiation period. This value will determine the period
+      of address timing negotiation to be issued by PECI controller. The unit
+      of the programmed value is four times of PECI clock period.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 0
+        maximum: 255
+        default: 1
+
+  rd-sampling-point:
+    description: |
+      Read sampling point selection. The whole period of a bit time will be
+      divided into 16 time frames. This value will determine the time frame
+      in which the controller will sample PECI signal for data read back.
+      Usually in the middle of a bit time is the best.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 0
+        maximum: 15
+        default: 8
+
+  cmd-timeout-ms:
+    # Command timeout in units of ms.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 1
+        maximum: 60000
+        default: 1000
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - interrupts
+  - clocks
+  - resets
+  - clock-frequency
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/ast2600-clock.h>
+    peci: bus@1e78b000 {
+        compatible = "simple-bus";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x1e78b000 0x60>;
+
+        peci0: peci-bus@0 {
+            compatible = "aspeed,ast2600-peci";
+            reg = <0x0 0x100>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&syscon ASPEED_CLK_GATE_REF0CLK>;
+            resets = <&syscon ASPEED_RESET_PECI>;
+            clock-frequency = <24000000>;
+            msg-timing = <1>;
+            addr-timing = <1>;
+            rd-sampling-point = <8>;
+            cmd-timeout-ms = <1000>;
+        };
+    };
+...
-- 
2.17.1

