Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3A0587E0D
	for <lists+openbmc@lfdr.de>; Tue,  2 Aug 2022 16:17:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lxxrx1d4Vz3c6V
	for <lists+openbmc@lfdr.de>; Wed,  3 Aug 2022 00:17:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxxrD088Gz2xHQ
	for <openbmc@lists.ozlabs.org>; Wed,  3 Aug 2022 00:16:41 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 272EGXjO022659
	for <openbmc@lists.ozlabs.org>; Tue, 2 Aug 2022 17:16:34 +0300
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 2 Aug
 2022 17:16:32 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Tue, 2 Aug 2022
 22:16:30 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Tue, 2 Aug 2022 22:16:29 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 0491862EFF; Tue,  2 Aug 2022 17:16:29 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.15 v1 1/2] dt-bindings: mmc: npcm: NPCM binding documentation
Date: Tue, 2 Aug 2022 17:16:24 +0300
Message-ID: <20220802141625.238907-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220802141625.238907-1-tmaimon77@gmail.com>
References: <20220802141625.238907-1-tmaimon77@gmail.com>
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
Cc: andrew@aj.id.au, joel@jms.id.au, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch adds the device tree binding documentation for the NPCM BMC
SoC SDHCI driver.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../devicetree/bindings/mmc/sdhci-npcm.txt    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/sdhci-npcm.txt

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-npcm.txt b/Documentation/devicetree/bindings/mmc/sdhci-npcm.txt
new file mode 100644
index 000000000000..c7c2ba6b537a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/sdhci-npcm.txt
@@ -0,0 +1,22 @@
+* NPCM SDHCI Controller
+
+This file documents differences between the core properties in mmc.txt
+and the properties used by the sdhci-npcm driver.
+
+Required properties:
+- compatible  : "nuvoton,npcm750-sdhci" for the NPCM7XX BMC.
+				"nuvoton,npcm845-sdhci" for the NPCM8XX BMC.
+
+Example:
+
+		sdhci0: sdhci@f0842000 {
+			compatible = "nuvoton,npcm750-sdhci";
+			status = "disabled";
+			reg = <0xf0842000 0x200>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =  <&clk NPCM7XX_CLK_MMC>;
+			clock-names = "clk_mmc";
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc8_pins
+				     &mmc_pins>;
+		};
-- 
2.33.0

