Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 376B71C5EF2
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 19:34:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Gn0t2bVgzDqf9
	for <lists+openbmc@lfdr.de>; Wed,  6 May 2020 03:34:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GmvK1h5xzDqSw
 for <openbmc@lists.ozlabs.org>; Wed,  6 May 2020 03:30:04 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 045H10xp113706; Tue, 5 May 2020 13:30:01 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30s3183cp6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 13:30:01 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 045HKR95005024;
 Tue, 5 May 2020 17:30:01 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 30s0g6ag4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 17:30:01 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 045HU0sM43712832
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 May 2020 17:30:00 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4D8E112061;
 Tue,  5 May 2020 17:30:00 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 428C4112062;
 Tue,  5 May 2020 17:30:00 +0000 (GMT)
Received: from talon7.ibm.com (unknown [9.211.137.116])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  5 May 2020 17:30:00 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 1/6] dt-bindings: soc: aspeed: xdma: Update to
 v11 upstream
Date: Tue,  5 May 2020 12:29:53 -0500
Message-Id: <1588699798-26292-2-git-send-email-eajames@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1588699798-26292-1-git-send-email-eajames@linux.ibm.com>
References: <1588699798-26292-1-git-send-email-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-05_09:2020-05-04,
 2020-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=1 mlxscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005050129
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

Switch the documentation to schema and update to the latest on the
upstream lists.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 .../devicetree/bindings/soc/aspeed/xdma.txt        |  40 --------
 .../devicetree/bindings/soc/aspeed/xdma.yaml       | 103 +++++++++++++++++++++
 2 files changed, 103 insertions(+), 40 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/aspeed/xdma.txt
 create mode 100644 Documentation/devicetree/bindings/soc/aspeed/xdma.yaml

diff --git a/Documentation/devicetree/bindings/soc/aspeed/xdma.txt b/Documentation/devicetree/bindings/soc/aspeed/xdma.txt
deleted file mode 100644
index da62975..0000000
--- a/Documentation/devicetree/bindings/soc/aspeed/xdma.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-Aspeed AST25XX and AST26XX XDMA Engine
-
-The XDMA Engine embedded in the AST2500 and AST2600 SOCs can perform automatic
-DMA operations over PCI between the SOC (acting as a BMC) and a host processor.
-
-Required properties:
- - compatible		: must be "aspeed,ast2500-xdma" or
-			  "aspeed,ast2600-xdma"
- - reg			: contains the address and size of the memory region
-			  associated with the XDMA engine registers
- - clocks		: clock specifier for the clock associated with the
-			  XDMA engine
- - resets		: reset specifier for the syscon reset associated with
-			  the XDMA engine
- - interrupts-extended	: two interrupt cells; the first specifies the global
-			  interrupt for the XDMA engine and the second
-			  specifies the PCI-E reset or PERST interrupt.
- - aspeed,scu		: a phandle to the syscon node for the system control
-			  unit of the SOC
- - memory-region	: a phandle to the reserved memory region to be used by
-			  the XDMA engine for DMA operations
-
-Optional properties:
- - pcie-device		: should be either "bmc" or "vga", corresponding to
-			  which device should be used by the XDMA engine for
-			  DMA operations. If this property is not set, the XDMA
-			  engine will use the BMC PCI-E device.
-
-Example:
-
-    xdma@1e6e7000 {
-        compatible = "aspeed,ast2500-xdma";
-        reg = <0x1e6e7000 0x100>;
-        clocks = <&syscon ASPEED_CLK_GATE_BCLK>;
-        resets = <&syscon ASPEED_RESET_XDMA>;
-        interrupts-extended = <&vic 6>, <&scu_ic ASPEED_AST2500_SCU_IC_PCIE_RESET_LO_TO_HI>;
-        aspeed,scu = <&syscon>;
-        pcie-device = "bmc";
-        memory-region = <&vga_memory>;
-    };
diff --git a/Documentation/devicetree/bindings/soc/aspeed/xdma.yaml b/Documentation/devicetree/bindings/soc/aspeed/xdma.yaml
new file mode 100644
index 0000000..4957435
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/aspeed/xdma.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/aspeed/xdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aspeed AST25XX and AST26XX XDMA Engine
+
+maintainers:
+ - Eddie James <eajames@linux.ibm.com>
+
+description: |
+  This binding describes the XDMA Engine embedded in the AST2500 and AST2600
+  SOCs. The XDMA engine can perform automatic DMA operations over PCI between
+  the SOC (acting as a BMC) and a host processor.
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2500-xdma
+      - aspeed,ast2600-xdma
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    minItems: 1
+    maxItems: 2
+
+  reset-names:
+    maxItems: 2
+    items:
+      - const: device
+      - const: root-complex
+
+  interrupts:
+    maxItems: 2
+    items:
+      - description: global interrupt for the XDMA engine
+      - description: PCI-E reset or PERST interrupt
+
+  aspeed,scu:
+    description: a reference to the System Control Unit node of the Aspeed SOC.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/phandle
+
+  aspeed,pcie-device:
+    description: describes which PCI-E device the XDMA engine should use
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/string
+      - enum: [ bmc, vga ]
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+  - interrupts-extended
+  - aspeed,scu
+  - memory-region
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: aspeed,ast2600-xdma
+then:
+  required:
+    - reset-names
+
+examples:
+  - |
+    #include <dt-bindings/clock/ast2600-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/aspeed-scu-ic.h>
+    syscon: syscon@1e6e2000 {
+        reg = <0x1e6e2000 0x1000>;
+        ranges = <0 0x1e6e2000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        scu_ic0: interrupt-controller@560 {
+            reg = <0x560 0x4>;
+            interrupt-controller;
+            #interrupt-cells = <1>;
+        };
+    };
+    xdma@1e6e7000 {
+        compatible = "aspeed,ast2600-xdma";
+        reg = <0x1e6e7000 0x100>;
+        clocks = <&syscon ASPEED_CLK_GATE_BCLK>;
+        resets = <&syscon ASPEED_RESET_DEV_XDMA>, <&syscon ASPEED_RESET_RC_XDMA>;
+        reset-names = "device", "root-complex";
+        interrupts-extended = <&gic GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+                              <&scu_ic0 ASPEED_AST2600_SCU_IC0_PCIE_PERST_LO_TO_HI>;
+        aspeed,scu = <&syscon>;
+        aspeed,pcie-device = "bmc";
+        memory-region = <&vga_memory>;
+    };
-- 
1.8.3.1

