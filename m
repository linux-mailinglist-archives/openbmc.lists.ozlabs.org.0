Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1725F2EB9CC
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 07:06:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9f5T5Nz5zDqQl
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 17:06:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=chiawei_wang@aspeedtech.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9dyJ0hP6zDqbr;
 Wed,  6 Jan 2021 17:00:35 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1065sEQK004599;
 Wed, 6 Jan 2021 13:54:14 +0800 (GMT-8)
 (envelope-from chiawei_wang@aspeedtech.com)
Received: from ChiaWeiWang-PC.aspeed.com (192.168.2.66) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 6 Jan 2021 13:58:49 +0800
From: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
To: <robh+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <tglx@linutronix.de>, <maz@kernel.org>, <p.zabel@pengutronix.de>,
 <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/6] dt-bindings: aspeed: Add eSPI controller
Date: Wed, 6 Jan 2021 13:59:34 +0800
Message-ID: <20210106055939.19386-2-chiawei_wang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210106055939.19386-1-chiawei_wang@aspeedtech.com>
References: <20210106055939.19386-1-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.66]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1065sEQK004599
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
Cc: BMC-SW@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add dt-bindings and the inclusion header for Aspeed eSPI controller.

Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
---
 .../devicetree/bindings/soc/aspeed/espi.yaml  | 252 ++++++++++++++++++
 .../interrupt-controller/aspeed-espi-ic.h     |  15 ++
 2 files changed, 267 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/aspeed/espi.yaml
 create mode 100644 include/dt-bindings/interrupt-controller/aspeed-espi-ic.h

diff --git a/Documentation/devicetree/bindings/soc/aspeed/espi.yaml b/Documentation/devicetree/bindings/soc/aspeed/espi.yaml
new file mode 100644
index 000000000000..ee92b66fe15b
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/aspeed/espi.yaml
@@ -0,0 +1,252 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# # Copyright (c) 2020 Aspeed Technology Inc.
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/aspeed/espi.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Aspeed eSPI Controller
+
+maintainers:
+  - Chia-Wei Wang <chiawei_wang@aspeedtech.com>
+  - Ryan Chen <ryan_chen@aspeedtech.com>
+
+description:
+  Aspeed eSPI controller implements a slave side eSPI endpoint device
+  supporting the four eSPI channels, namely peripheral, virtual wire,
+  out-of-band, and flash.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - aspeed,ast2600-espi
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
+  espi-ic:
+    type: object
+
+    properties:
+      compatible:
+        const: aspeed,ast2600-espi-ic
+
+      interrupts:
+        maxItems: 2
+
+      interrupt-controller: true
+
+      "#interrupt-cells":
+        const: 1
+        description:
+          The cell is a SW-encoded number for IRQ dispatching to eSPI channels
+
+    required:
+      - compatible
+      - interrupts
+      - interrupt-controller
+      - "#interrupt-cells"
+
+  espi-ctrl:
+    type: object
+
+    properties:
+      compatible:
+        const: aspeed,ast2600-espi-ctrl
+
+      interrupts:
+        maxItems: 2
+
+      clocks:
+        maxItems: 1
+
+      resets:
+        maxItems: 1
+
+    required:
+      - compatible
+      - interrupts
+      - clocks
+      - resets
+
+  espi-peripheral-channel:
+    type: object
+
+    properties:
+      compatible:
+        const: aspeed,ast2600-espi-peripheral
+
+      interrupts:
+        maxItems: 2
+
+      dma-mode:
+        type: boolean
+
+      memcyc,map-src-addr:
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+        description: The host side address to be decoded into the memory cycle over eSPI peripheral channel
+
+      memcyc,map-size:
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+        description: The size of the memory region allocated for the memory cycle over eSPI peripheral channel
+        minimum: 65536
+
+    required:
+      - compatible
+      - interrupts
+      - memcyc,map-src-addr
+      - memcyc,map-size
+
+  espi-vw-channel:
+    type: object
+
+    properties:
+      compatible:
+        const: aspeed,ast2600-espi-vw
+
+      interrupts:
+        maxItems: 2
+
+    required:
+      - compatible
+      - interrupts
+
+  espi-oob-channel:
+    type: object
+
+    properties:
+      compatible:
+        const: aspeed,ast2600-espi-oob
+
+      interrupts:
+        maxItems: 2
+
+      dma-mode:
+        type: boolean
+
+      dma-tx-desc-num:
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+        minimum: 2
+        maximum: 1023
+
+      dma-rx-desc-num:
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+        minimum: 2
+        maximum: 1023
+
+    required:
+      - compatible
+      - interrupts
+
+  espi-flash-channel:
+    type: object
+
+    properties:
+      compatible:
+        const: aspeed,ast2600-espi-flash
+
+      interrupts:
+        maxItems: 2
+
+      dma-mode:
+        type: boolean
+
+      safs-mode:
+        description: Slave-Attached-Sharing-Flash mode, 0->Mix, 1->SW, 2->HW
+        enum: [ 0, 1, 2 ]
+
+    required:
+      - compatible
+      - interrupts
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+  - espi-ic
+  - espi-ctrl
+  - espi-peripheral-channel
+  - espi-vw-channel
+  - espi-oob-channel
+  - espi-flash-channel
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/aspeed-espi-ic.h>
+    #include <dt-bindings/clock/ast2600-clock.h>
+    #include <dt-bindings/gpio/aspeed-gpio.h>
+
+    espi: espi@1e6ee000 {
+        compatible = "aspeed,ast2600-espi", "simple-mfd", "syscon";
+        reg = <0x1e6ee000 0x1000>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x1e6ee000 0x1000>;
+
+        espi_ic: espi-ic {
+            #interrupt-cells = <1>;
+            compatible = "aspeed,ast2600-espi-ic";
+            interrupts-extended = <&gic GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+                                  <&gpio0 ASPEED_GPIO(W, 7) IRQ_TYPE_EDGE_FALLING>;
+            interrupt-controller;
+        };
+
+        espi_ctrl: espi-ctrl {
+            compatible = "aspeed,ast2600-espi-ctrl";
+            interrupts-extended = <&espi_ic ASPEED_ESPI_IC_CTRL_EVENT>,
+                                  <&espi_ic ASPEED_ESPI_IC_CTRL_RESET>;
+            clocks = <&syscon ASPEED_CLK_GATE_ESPICLK>;
+            resets = <&syscon ASPEED_RESET_ESPI>;
+        };
+
+        espi_peripheral: espi-peripheral-channel {
+            compatible = "aspeed,ast2600-espi-peripheral";
+            interrupts-extended = <&espi_ic ASPEED_ESPI_IC_PERIF_EVENT>,
+                                  <&espi_ic ASPEED_ESPI_IC_CHAN_RESET>;
+            dma-mode;
+            memcyc,map-src-addr = <0x98000000>;
+            memcyc,map-size = <0x10000>;
+        };
+
+        espi_vw: espi-vw-channel {
+            compatible = "aspeed,ast2600-espi-vw";
+            interrupts-extended = <&espi_ic ASPEED_ESPI_IC_VW_EVENT>,
+                                  <&espi_ic ASPEED_ESPI_IC_CHAN_RESET>;
+        };
+
+        espi_oob: espi-oob-channel {
+            compatible = "aspeed,ast2600-espi-oob";
+            interrupts-extended = <&espi_ic ASPEED_ESPI_IC_OOB_EVENT>,
+                                  <&espi_ic ASPEED_ESPI_IC_CHAN_RESET>;
+            dma-mode;
+            dma-tx-desc-num = <2>;
+            dma-rx-desc-num = <2>;
+        };
+
+        espi_flash: espi-flash-channel {
+            compatible = "aspeed,ast2600-espi-flash";
+            interrupts-extended = <&espi_ic ASPEED_ESPI_IC_FLASH_EVENT>,
+                                  <&espi_ic ASPEED_ESPI_IC_CHAN_RESET>;
+            dma-mode;
+            safs-mode = <2>;
+        };
+    };
+
+...
diff --git a/include/dt-bindings/interrupt-controller/aspeed-espi-ic.h b/include/dt-bindings/interrupt-controller/aspeed-espi-ic.h
new file mode 100644
index 000000000000..85faa198350d
--- /dev/null
+++ b/include/dt-bindings/interrupt-controller/aspeed-espi-ic.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _DT_BINDINGS_INTERRUPT_CONTROLLER_ASPEED_ESPI_IC_H_
+#define _DT_BINDINGS_INTERRUPT_CONTROLLER_ASPEED_ESPI_IC_H_
+
+/* SW-decoded IRQs for eSPI host HW reset and channel events */
+#define ASPEED_ESPI_IC_CTRL_RESET	0
+#define ASPEED_ESPI_IC_CHAN_RESET	1
+#define ASPEED_ESPI_IC_CTRL_EVENT	2
+#define ASPEED_ESPI_IC_PERIF_EVENT	3
+#define ASPEED_ESPI_IC_VW_EVENT		4
+#define ASPEED_ESPI_IC_OOB_EVENT	5
+#define ASPEED_ESPI_IC_FLASH_EVENT	6
+
+#endif
-- 
2.17.1

