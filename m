Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE48691931
	for <lists+openbmc@lfdr.de>; Fri, 10 Feb 2023 08:29:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCljb3fjTz3cgV
	for <lists+openbmc@lfdr.de>; Fri, 10 Feb 2023 18:29:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PClgm5QrCz3cdC;
	Fri, 10 Feb 2023 18:27:45 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 31A7EWro068845;
	Fri, 10 Feb 2023 15:14:32 +0800 (GMT-8)
	(envelope-from chiawei_wang@aspeedtech.com)
Received: from Chiawei-PC03.aspeed.com (192.168.2.66) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 10 Feb
 2023 15:26:47 +0800
From: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
To: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <joel@jms.id.au>,
        <andrew@aj.id.au>, <jirislaby@kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>
Subject: [PATCH 1/4] dt-bindings: aspeed: Add UART controller
Date: Fri, 10 Feb 2023 15:26:40 +0800
Message-ID: <20230210072643.2772-2-chiawei_wang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230210072643.2772-1-chiawei_wang@aspeedtech.com>
References: <20230210072643.2772-1-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.66]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 31A7EWro068845
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

Add dt-bindings for Aspeed UART controller.

Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
---
 .../bindings/serial/aspeed,uart.yaml          | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/aspeed,uart.yaml

diff --git a/Documentation/devicetree/bindings/serial/aspeed,uart.yaml b/Documentation/devicetree/bindings/serial/aspeed,uart.yaml
new file mode 100644
index 000000000000..10c457d6a72e
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/aspeed,uart.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/aspeed,uart.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aspeed Universal Asynchronous Receiver/Transmitter
+
+maintainers:
+  - Chia-Wei Wang <chiawei_wang@aspeedtech.com>
+
+allOf:
+  - $ref: serial.yaml#
+
+description: |
+  The Aspeed UART is based on the basic 8250 UART and compatible
+  with 16550A, with support for DMA
+
+properties:
+  compatible:
+    const: aspeed,ast2600-uart
+
+  reg:
+    description: The base address of the UART register bank
+    maxItems: 1
+
+  clocks:
+    description: The clock the baudrate is derived from
+    maxItems: 1
+
+  interrupts:
+    description: The IRQ number of the device
+    maxItems: 1
+
+  dma-mode:
+    type: boolean
+    description: Enable DMA
+
+  dma-channel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The channel number to be used in the DMA engine
+
+  virtual:
+    type: boolean
+    description: Indicate virtual UART
+
+  sirq:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The serial IRQ number on LPC bus interface
+
+  sirq-polarity:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The serial IRQ polarity on LPC bus interface
+
+  pinctrl-0: true
+
+  pinctrl_names:
+    const: default
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/ast2600-clock.h>
+
+    serial@1e783000 {
+        compatible = "aspeed,ast2600-uart";
+        reg = <0x1e783000 0x20>;
+        interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_LOW>;
+        clocks = <&syscon ASPEED_CLK_GATE_UART1CLK>;
+        pinctrl-0 = <&pinctrl_txd1_default &pinctrl_rxd1_default>;
+        dma-mode;
+        dma-channel = <0>;
+    };
-- 
2.25.1

