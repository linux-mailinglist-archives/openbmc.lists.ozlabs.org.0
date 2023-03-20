Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCE26C0BEF
	for <lists+openbmc@lfdr.de>; Mon, 20 Mar 2023 09:14:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pg6vx4Yplz3cF7
	for <lists+openbmc@lfdr.de>; Mon, 20 Mar 2023 19:14:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pg6t90bQgz3cBK;
	Mon, 20 Mar 2023 19:12:47 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 32K7v6wg088828;
	Mon, 20 Mar 2023 15:57:06 +0800 (GMT-8)
	(envelope-from chiawei_wang@aspeedtech.com)
Received: from Chiawei-PC03.aspeed.com (192.168.2.66) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 20 Mar
 2023 16:11:38 +0800
From: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
To: <vkoul@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <joel@jms.id.au>,
        <andrew@aj.id.au>, <gregkh@linuxfoundation.org>,
        <jirislaby@kernel.org>, <pmenzel@molgen.mpg.de>,
        <ilpo.jarvinen@linux.intel.com>, <hdanton@sina.com>,
        <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <openbmc@lists.ozlabs.org>
Subject: [PATCH v3 2/5] dt-bindings: dmaengine: Add AST2600 UDMA bindings
Date: Mon, 20 Mar 2023 16:11:30 +0800
Message-ID: <20230320081133.23655-3-chiawei_wang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320081133.23655-1-chiawei_wang@aspeedtech.com>
References: <20230320081133.23655-1-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.66]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 32K7v6wg088828
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

Add the dmaengine bindings for the UART DMA engine of Aspeed AST2600 SoC.

Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
---
 .../bindings/dma/aspeed,ast2600-udma.yaml     | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/aspeed,ast2600-udma.yaml

diff --git a/Documentation/devicetree/bindings/dma/aspeed,ast2600-udma.yaml b/Documentation/devicetree/bindings/dma/aspeed,ast2600-udma.yaml
new file mode 100644
index 000000000000..4c0a5edf2168
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/aspeed,ast2600-udma.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/aspeed,ast2600-udma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aspeed AST2600 UART DMA controller
+
+maintainers:
+  - Chia-Wei Wang <chiawei_wang@aspeedtech.com>
+
+description:
+  The Aspeed AST2600 UDMA controller provides direct memory access capabilities
+  for the NS16550A-compatible UART devices inside AST2600 SoCs. UDMA supports 28
+  DMA channels and each UART device has its dedicated pair of TX and RX channels.
+
+allOf:
+  - $ref: dma-controller.yaml#
+
+properties:
+  compatible:
+    const: aspeed,ast2600-udma
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#dma-cells":
+    const: 1
+
+  dma-channels:
+    maximum: 28
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#dma-cells"
+  - dma-channels
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    dma-controller@1e79e000 {
+        compatible = "aspeed,ast2600-udma";
+        reg = <0x1e79e000 0x1000>;
+        interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+        dma-channels = <28>;
+        #dma-cells = <1>;
+    };
+
+...
-- 
2.25.1

