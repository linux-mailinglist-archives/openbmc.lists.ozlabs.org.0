Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6119123C6C
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 02:30:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cyB84yQHzDqVK
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 12:30:24 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cy7h2VLMzDqSQ
 for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2019 12:28:15 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 17:28:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,327,1571727600"; d="scan'208";a="390019007"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO ubuntu.jf.intel.com)
 ([10.7.153.147])
 by orsmga005.jf.intel.com with ESMTP; 17 Dec 2019 17:28:11 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org
Subject: [PATCH dev-5.4 01/14] dt-bindings: Add PECI subsystem document
Date: Tue, 17 Dec 2019 17:27:55 -0800
Message-Id: <20191218012808.6482-2-jae.hyun.yoo@linux.intel.com>
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

This commit adds PECI subsystem document.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
Changes since v11:
- None

Changes since v10:
- Changed documents format to DT schema format so I dropped all review tags.
  Please review it again.

 .../devicetree/bindings/peci/peci-bus.yaml    | 129 ++++++++++++++++++
 .../devicetree/bindings/peci/peci-client.yaml |  54 ++++++++
 2 files changed, 183 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/peci/peci-bus.yaml
 create mode 100644 Documentation/devicetree/bindings/peci/peci-client.yaml

diff --git a/Documentation/devicetree/bindings/peci/peci-bus.yaml b/Documentation/devicetree/bindings/peci/peci-bus.yaml
new file mode 100644
index 000000000000..b085e67089cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/peci/peci-bus.yaml
@@ -0,0 +1,129 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/peci/peci-bus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic Device Tree Bindings for PECI bus
+
+maintainers:
+  - Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
+
+description: |
+  PECI (Platform Environment Control Interface) is a one-wire bus interface that
+  provides a communication channel from Intel processors and chipset components
+  to external monitoring or control devices. PECI is designed to support the
+  following sideband functions:
+
+  * Processor and DRAM thermal management
+    - Processor fan speed control is managed by comparing Digital Thermal
+      Sensor (DTS) thermal readings acquired via PECI against the
+      processor-specific fan speed control reference point, or TCONTROL. Both
+      TCONTROL and DTS thermal readings are accessible via the processor PECI
+      client. These variables are referenced to a common temperature, the TCC
+      activation point, and are both defined as negative offsets from that
+      reference.
+    - PECI based access to the processor package configuration space provides
+      a means for Baseboard Management Controllers (BMC) or other platform
+      management devices to actively manage the processor and memory power
+      and thermal features.
+
+  * Platform Manageability
+    - Platform manageability functions including thermal, power, and error
+      monitoring. Note that platform 'power' management includes monitoring
+      and control for both the processor and DRAM subsystem to assist with
+      data center power limiting.
+    - PECI allows read access to certain error registers in the processor MSR
+      space and status monitoring registers in the PCI configuration space
+      within the processor and downstream devices.
+    - PECI permits writes to certain registers in the processor PCI
+      configuration space.
+
+  * Processor Interface Tuning and Diagnostics
+    - Processor interface tuning and diagnostics capabilities
+      (Intel Interconnect BIST). The processors Intel Interconnect Built In
+      Self Test (Intel IBIST) allows for infield diagnostic capabilities in
+      the Intel UPI and memory controller interfaces. PECI provides a port to
+      execute these diagnostics via its PCI Configuration read and write
+      capabilities.
+
+  * Failure Analysis
+    - Output the state of the processor after a failure for analysis via
+      Crashdump.
+
+  PECI uses a single wire for self-clocking and data transfer. The bus
+  requires no additional control lines. The physical layer is a self-clocked
+  one-wire bus that begins each bit with a driven, rising edge from an idle
+  level near zero volts. The duration of the signal driven high depends on
+  whether the bit value is a logic '0' or logic '1'. PECI also includes
+  variable data transfer rate established with every message. In this way, it
+  is highly flexible even though underlying logic is simple.
+
+  The interface design was optimized for interfacing between an Intel
+  processor and chipset components in both single processor and multiple
+  processor environments. The single wire interface provides low board
+  routing overhead for the multiple load connections in the congested routing
+  area near the processor and chipset components. Bus speed, error checking,
+  and low protocol overhead provides adequate link bandwidth and reliability
+  to transfer critical device operating conditions and configuration
+  information.
+
+  PECI subsystem provides single or multiple bus nodes support so each bus can
+  have one adapter node and multiple device specific client nodes that can be
+  attached to the PECI bus so each processor client's features can be supported
+  by the client node through an adapter connection in the bus.
+
+properties:
+  compatible:
+    const: simple-bus
+
+  "#address-cells":
+    # Required to define bus device control resource address.
+    const: 1
+
+  "#size-cells":
+    # Required to define bus device control resource address.
+    const: 1
+
+  ranges: true
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/ast2600-clock.h>
+    peci: bus@1e78b000 {
+        compatible = "simple-bus";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x1e78b000 0x200>;
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
+        };
+
+        // Just an example. ast2600 doesn't have a second PECI module actually.
+        peci1: peci-bus@100 {
+            compatible = "aspeed,ast2600-peci";
+            reg = <0x100 0x100>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&syscon ASPEED_CLK_GATE_REF0CLK>;
+            resets = <&syscon ASPEED_RESET_PECI>;
+            clock-frequency = <24000000>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/peci/peci-client.yaml b/Documentation/devicetree/bindings/peci/peci-client.yaml
new file mode 100644
index 000000000000..fc7c4110e929
--- /dev/null
+++ b/Documentation/devicetree/bindings/peci/peci-client.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/peci/peci-client.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic Device Tree Bindings for PECI clients
+
+maintainers:
+  - Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
+
+properties:
+  compatible:
+    enum:
+      - intel,peci-client
+
+  reg:
+    description: |
+      Address of a client CPU. According to the PECI specification, client
+      addresses start from 0x30.
+    maxItems: 1
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
+
+            peci-client@30 {
+                compatible = "intel,peci-client";
+                reg = <0x30>;
+            };
+
+            peci-client@31 {
+                compatible = "intel,peci-client";
+                reg = <0x31>;
+            };
+        };
+    };
+...
-- 
2.17.1

