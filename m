Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1B13F14B5
	for <lists+openbmc@lfdr.de>; Thu, 19 Aug 2021 10:01:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gqy0D23lFz3cRF
	for <lists+openbmc@lfdr.de>; Thu, 19 Aug 2021 18:01:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=chiawei_wang@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqxzT24n2z30BD;
 Thu, 19 Aug 2021 18:01:08 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 17J7gOJl024038;
 Thu, 19 Aug 2021 15:42:24 +0800 (GMT-8)
 (envelope-from chiawei_wang@aspeedtech.com)
Received: from ChiaWeiWang-PC.aspeed.com (192.168.2.66) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 19 Aug 2021 16:00:37 +0800
From: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
To: <joel@jms.id.au>, <robh+dt@kernel.org>, <andrew@aj.id.au>,
 <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/5] dt-bindings: aspeed: Add eSPI controller
Date: Thu, 19 Aug 2021 16:00:36 +0800
Message-ID: <20210819080040.31242-2-chiawei_wang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210819080040.31242-1-chiawei_wang@aspeedtech.com>
References: <20210819080040.31242-1-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.66]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 17J7gOJl024038
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
Cc: ryan_chen@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add dt-bindings for Aspeed eSPI controller

Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
---
 .../devicetree/bindings/soc/aspeed/espi.yaml  | 158 ++++++++++++++++++
 1 file changed, 158 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/aspeed/espi.yaml

diff --git a/Documentation/devicetree/bindings/soc/aspeed/espi.yaml b/Documentation/devicetree/bindings/soc/aspeed/espi.yaml
new file mode 100644
index 000000000000..fec3d37f3ffd
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/aspeed/espi.yaml
@@ -0,0 +1,158 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# # Copyright (c) 2021 Aspeed Technology Inc.
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
+          - aspeed,ast2500-espi
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
+  espi-ctrl:
+    type: object
+
+    properties:
+      compatible:
+        items:
+          - enum:
+              - aspeed,ast2500-espi-ctrl
+              - aspeed,ast2600-espi-ctrl
+
+      interrupts:
+        maxItems: 1
+
+      clocks:
+        maxItems: 1
+
+      perif,memcyc-enable:
+        type: boolean
+        description: Enable memory cycle over eSPI peripheral channel
+
+      perif,memcyc-src-addr:
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+        description: The Host side address to be decoded into the memory cycle over eSPI peripheral channel
+
+      perif,memcyc-size:
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+        description: The size of the memory region allocated for the memory cycle over eSPI peripheral channel
+        minimum: 65536
+
+      perif,dma-mode:
+        type: boolean
+        description: Enable DMA support for eSPI peripheral channel
+
+      oob,dma-mode:
+        type: boolean
+        description: Enable DMA support for eSPI out-of-band channel
+
+      oob,dma-tx-desc-num:
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+        minimum: 2
+        maximum: 1023
+        description: The number of TX descriptors available for eSPI OOB DMA engine
+
+      oob,dma-rx-desc-num:
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+        minimum: 2
+        maximum: 1023
+        description: The number of RX descriptors available for eSPI OOB DMA engine
+
+      flash,dma-mode:
+        type: boolean
+        description: Enable DMA support for eSPI flash channel
+
+      flash,safs-mode:
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+        enum: [ 0, 1, 2 ]
+        default: 0
+        description: Slave-Attached-Sharing-Flash mode, 0->Mix, 1->SW, 2->HW
+
+    dependencies:
+      perif,memcyc-src-addr: [ perif,memcyc-enable ]
+      perif,memcyc-size: [ perif,memcyc-enable ]
+      oob,dma-tx-desc-num: [ oob,dma-mode ]
+      oob,dma-rx-desc-num: [ oob,dma-mode ]
+
+    required:
+      - compatible
+      - interrupts
+      - clocks
+
+  espi-mmbi:
+    type: object
+
+    properties:
+      compatible:
+        const: aspeed, ast2600-espi-mmbi
+
+      interrupts:
+        maxItems: 1
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
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/ast2600-clock.h>
+
+    espi: espi@1e6ee000 {
+        compatible = "aspeed,ast2600-espi", "simple-mfd", "syscon";
+        reg = <0x1e6ee000 0x1000>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x1e6ee000 0x1000>;
+
+        espi_ctrl: espi-ctrl@0 {
+            compatible = "aspeed,ast2600-espi-ctrl";
+            reg = <0x0 0x800>;
+            interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&syscon ASPEED_CLK_GATE_ESPICLK>;
+            resets = <&syscon ASPEED_RESET_ESPI>;
+        };
+
+        espi_mmbi: espi-flash-channel@800 {
+            compatible = "aspeed,ast2600-espi-flash";
+            reg = <0x800 0x50>;
+            interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };
-- 
2.17.1

