Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F006C58F985
	for <lists+openbmc@lfdr.de>; Thu, 11 Aug 2022 10:49:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3L8S06Mzz2x9J
	for <lists+openbmc@lfdr.de>; Thu, 11 Aug 2022 18:49:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3L886bCmz2xkP
	for <openbmc@lists.ozlabs.org>; Thu, 11 Aug 2022 18:49:08 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 27B8mwBB026502
	for <openbmc@lists.ozlabs.org>; Thu, 11 Aug 2022 11:48:59 +0300
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 11 Aug
 2022 11:48:58 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 11 Aug
 2022 16:48:56 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Thu, 11 Aug 2022 16:48:56 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 874F660269; Thu, 11 Aug 2022 11:48:55 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.15 v1 1/2] dt-binding: usb: Add NPCM UDC binding documentation
Date: Thu, 11 Aug 2022 11:48:49 +0300
Message-ID: <20220811084850.45927-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220811084850.45927-1-tmaimon77@gmail.com>
References: <20220811084850.45927-1-tmaimon77@gmail.com>
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

This patch adds device tree binding documentation for the NPCM BMC USB
Device Controller (UDC).

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../devicetree/bindings/usb/npcm-udc.txt      | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/npcm-udc.txt

diff --git a/Documentation/devicetree/bindings/usb/npcm-udc.txt b/Documentation/devicetree/bindings/usb/npcm-udc.txt
new file mode 100644
index 000000000000..938d163ad681
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/npcm-udc.txt
@@ -0,0 +1,33 @@
+Nuvoton NPCM USB Device controller.
+
+This DT-binding describe Nuvoton NPCM USB Device controller (UDC) device node.
+The UDC is based on Chipidea Subsystem Device Controller IP.
+
+Required properties:
+- compatible	  : "nuvoton,npcm750-udc" for Poleg NPCM7XX.
+		    "nuvoton,npcm845-udc" for Arbel NPCM8XX.
+- reg             : Offset and length of the register set for the device,
+		    Offset and length of the DTD buffer.
+- interrupts      : Contain the UDC interrupt.
+- clocks          : phandle of UDC reference clock.
+- clock-names     : Should be "clk_usb_bridge".
+
+Note: Each npcm-udc which should have an alias correctly numbered
+in "aliases" node.
+
+e.g.
+aliases {
+	udc1 = &udc1;
+};
+
+Example:
+		udc0:udc@f0830000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0830000 0x1000
+			       0xfffd0000 0x800>;
+			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+		};
+
-- 
2.33.0

