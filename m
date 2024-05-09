Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E558C15F9
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2024 22:03:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vb2y56khtz3cdB
	for <lists+openbmc@lfdr.de>; Fri, 10 May 2024 06:03:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vb2xC2Hgqz3bs2
	for <openbmc@lists.ozlabs.org>; Fri, 10 May 2024 06:02:38 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 449JOIQ1013146
	for <openbmc@lists.ozlabs.org>; Thu, 9 May 2024 22:24:18 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 9 May
 2024 22:24:18 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 10 May
 2024 03:24:16 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 10 May 2024 03:24:15 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 30DD25F66B;
	Thu,  9 May 2024 22:24:15 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 2EEABDC0BCE; Thu,  9 May 2024 22:24:15 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <p.zabel@pengutronix.de>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <tali.perry1@gmail.com>, <joel@jms.id.au>, <venture@google.com>,
        <yuenn@google.com>, <benjaminfair@google.com>
Subject: [PATCH v24 4/4] dt-binding: clock: remove nuvoton npcm845-clk bindings
Date: Thu, 9 May 2024 22:24:11 +0300
Message-ID: <20240509192411.2432066-5-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240509192411.2432066-1-tmaimon77@gmail.com>
References: <20240509192411.2432066-1-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Remove nuvoton,npcm845-clk binding since the NPCM8xx clock driver
using the auxiliary device framework and not the device tree framework.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../bindings/clock/nuvoton,npcm845-clk.yaml   | 49 -------------------
 1 file changed, 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml

diff --git a/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml b/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
deleted file mode 100644
index b901ca13cd25..000000000000
--- a/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
+++ /dev/null
@@ -1,49 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/clock/nuvoton,npcm845-clk.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Nuvoton NPCM8XX Clock Controller
-
-maintainers:
-  - Tomer Maimon <tmaimon77@gmail.com>
-
-description: |
-  Nuvoton Arbel BMC NPCM8XX contains an integrated clock controller, which
-  generates and supplies clocks to all modules within the BMC.
-
-properties:
-  compatible:
-    enum:
-      - nuvoton,npcm845-clk
-
-  reg:
-    maxItems: 1
-
-  '#clock-cells':
-    const: 1
-    description:
-      See include/dt-bindings/clock/nuvoton,npcm8xx-clock.h for the full
-      list of NPCM8XX clock IDs.
-
-required:
-  - compatible
-  - reg
-  - '#clock-cells'
-
-additionalProperties: false
-
-examples:
-  - |
-    ahb {
-        #address-cells = <2>;
-        #size-cells = <2>;
-
-        clock-controller@f0801000 {
-            compatible = "nuvoton,npcm845-clk";
-            reg = <0x0 0xf0801000 0x0 0x1000>;
-            #clock-cells = <1>;
-        };
-    };
-...
-- 
2.34.1

