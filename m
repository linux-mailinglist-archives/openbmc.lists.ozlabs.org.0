Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEF77F322F
	for <lists+openbmc@lfdr.de>; Tue, 21 Nov 2023 16:18:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZSgb4L0qz3dHw
	for <lists+openbmc@lfdr.de>; Wed, 22 Nov 2023 02:18:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZSg852mSz2xHT
	for <openbmc@lists.ozlabs.org>; Wed, 22 Nov 2023 02:17:52 +1100 (AEDT)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 3ALFHfev026532
	for <openbmc@lists.ozlabs.org>; Tue, 21 Nov 2023 17:17:41 +0200
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.14; Tue, 21 Nov
 2023 17:17:40 +0200
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.14; Tue, 21
 Nov 2023 23:17:38 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 21 Nov 2023 23:17:38 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id BD5805F63D;
	Tue, 21 Nov 2023 17:17:36 +0200 (IST)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 50B72235CE25; Tue, 21 Nov 2023 17:17:36 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <davem@davemloft.net>, <edumazet@google.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <alexandre.torgue@foss.st.com>,
        <peppe.cavallaro@st.com>, <joabreu@synopsys.com>,
        <mcoquelin.stm32@gmail.com>, <avifishman70@gmail.com>,
        <tali.perry1@gmail.com>, <joel@jms.id.au>,
        <andrew@codeconstruct.com.au>, <venture@google.com>,
        <yuenn@google.com>, <benjaminfair@google.com>, <j.neuschaefer@gmx.net>
Subject: [PATCH v1 1/2] dt-bindings: net: Add support NPCM dwmac
Date: Tue, 21 Nov 2023 17:17:32 +0200
Message-ID: <20231121151733.2015384-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20231121151733.2015384-1-tmaimon77@gmail.com>
References: <20231121151733.2015384-1-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add documentation to describe Nuvoton BMC NPCM dwmac driver(sgmii).

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../bindings/net/nuvoton,npcm8xx-sgmii.yaml   | 72 +++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,npcm8xx-sgmii.yaml

diff --git a/Documentation/devicetree/bindings/net/nuvoton,npcm8xx-sgmii.yaml b/Documentation/devicetree/bindings/net/nuvoton,npcm8xx-sgmii.yaml
new file mode 100644
index 000000000000..6a5f2cade7c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nuvoton,npcm8xx-sgmii.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/nuvoton,npcm8xx-sgmii.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM DWMAC SGMII Ethernet controller
+
+maintainers:
+  - Tomer Maimon <tmaimon77@gmail.com>
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - nuvoton,npcm8xx-sgmii
+  required:
+    - compatible
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - nuvoton,npcm8xx-sgmii
+          - const: snps,dwmac-3.50a
+  reg:
+    items:
+      - description:
+          The first range represent DWMAC controller registers.
+      - description:
+          The second range represent PCS configuration registers.
+
+  clocks:
+    items:
+      - description: GMAC main clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,npcm845-clk.h>
+
+    ahb {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      gmac0: ethernet@f0802000 {
+          compatible = "nuvoton,npcm8xx-sgmii","snps,dwmac-3.50a";
+          reg = <0x0 0xf0802000 0x0 0x2000>, <0x0 0xf0780000 0x0 0x200>;
+          interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+          interrupt-names = "macirq";
+          clocks = <&clk NPCM8XX_CLK_AHB>;
+          clock-names = "stmmaceth";
+          phy-mode = "rgmii-id";
+      };
+    };
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 5c2769dc689a..ba52dbc85144 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -66,6 +66,7 @@ properties:
         - ingenic,x2000-mac
         - loongson,ls2k-dwmac
         - loongson,ls7a-dwmac
+        - nuvoton,npcm8xx-sgmii
         - qcom,qcs404-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
-- 
2.33.0

