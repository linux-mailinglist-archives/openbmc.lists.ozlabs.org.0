Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B99956541
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2024 10:09:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnQH90kwPz3blF
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2024 18:09:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WnQH21b7Qz2xZt;
	Mon, 19 Aug 2024 18:09:18 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 19 Aug
 2024 16:08:59 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 19 Aug 2024 16:08:59 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <robh@kernel.org>, <conor+dt@kernel.org>, <eajames@linux.ibm.com>,
	<mchehab@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
	<hverkuil@xs4all.nl>, <pmenzel@molgen.mpg.de>, <krzk+dt@kernel.org>
Subject: [PATCH v5 1/2] dt-bindings: arm: aspeed: Add aspeed,video binding
Date: Mon, 19 Aug 2024 16:08:58 +0800
Message-ID: <20240819080859.1304671-2-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240819080859.1304671-1-jammy_huang@aspeedtech.com>
References: <20240819080859.1304671-1-jammy_huang@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The Video Engine block in ASPEED Silicon SoCs is responsible for video
compressions with a wide range of video quality and compression
ratio options. It can capture and compress video data from digital or
analog sources.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 .../bindings/arm/aspeed/aspeed,video.yaml     | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/aspeed/aspeed,video.yaml

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed,video.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed,video.yaml
new file mode 100644
index 000000000000..bef7bd2f310a
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed,video.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/aspeed/aspeed,video.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED Video Engine
+
+maintainers:
+  - Eddie James <eajames@linux.ibm.com>
+  - Jammy Huang <jammy_huang@aspeedtech.com>
+
+description: |
+  The ASPEED video engine can be configured to capture and compress video
+  data from digital or analog sources.
+
+select:
+  properties:
+    compatible:
+      pattern: "^aspeed,ast[0-9]+-video-engine$"
+  required:
+    - compatible
+
+properties:
+  compatible:
+    oneOf:
+      - description: Preferred naming style for compatibles of video components
+        pattern: "^aspeed,ast[0-9]+-video-engine$"
+
+      - enum:
+          - aspeed,ast2400-video-engine
+          - aspeed,ast2500-video-engine
+          - aspeed,ast2600-video-engine
+
+  reg:
+    minItems: 1
+
+  clocks:
+    minItems: 2
+
+  clock-names:
+    items:
+      - const: vclk
+      - const: eclk
+
+  interrupts:
+    minItems: 1
+
+  aspeed,scu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Specifies the scu node that is needed if video wants to capture
+      from sources other than Host VGA.
+
+  aspeed,gfx:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Specifies the Soc Display(gfx) node that needs to be queried to get
+      related information if video wants to use gfx as capture source.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+
+additionalProperties: true
+
+examples:
+  - |
+    video: video@1e700000 {
+          	compatible = "aspeed,ast2600-video-engine";
+          	reg = <0x1e700000 0x1000>;
+          	clocks = <&syscon ASPEED_CLK_GATE_VCLK>,
+          	         <&syscon ASPEED_CLK_GATE_ECLK>;
+          	clock-names = "vclk", "eclk";
+          	interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+          	aspeed,scu = <&syscon>;
+          	aspeed,gfx = <&gfx>;
+    };
-- 
2.25.1

