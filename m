Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0577D64C
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2019 09:29:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zhkl4wgtzDqs3
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2019 17:29:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=avi.fishman@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zhhx6gpNzDqpf
 for <openbmc@lists.ozlabs.org>; Thu,  1 Aug 2019 17:27:59 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x717R6Mk004915;
 Thu, 1 Aug 2019 10:27:06 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 8441)
 id 45E6661FD3; Thu,  1 Aug 2019 10:27:06 +0300 (IDT)
From: Avi Fishman <avifishman70@gmail.com>
To: venture@google.com, yuenn@google.com, benjaminfair@google.com,
 davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com,
 gregkh@linuxfoundation.org
Subject: [PATCH v1 1/2] dt-binding: net: document NPCM7xx EMC 10/100 DT
 bindings
Date: Thu,  1 Aug 2019 10:26:10 +0300
Message-Id: <20190801072611.27935-2-avifishman70@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190801072611.27935-1-avifishman70@gmail.com>
References: <20190801072611.27935-1-avifishman70@gmail.com>
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com, avifishman70@gmail.com,
 netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 tali.perry1@gmail.com, tglx@linutronix.de
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Added device tree binding documentation for
Nuvoton NPCM7xx Ethernet MAC Controller (EMC) 10/100 RMII

Signed-off-by: Avi Fishman <avifishman70@gmail.com>
---
 .../bindings/net/nuvoton,npcm7xx-emc.txt      | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,npcm7xx-emc.txt

diff --git a/Documentation/devicetree/bindings/net/nuvoton,npcm7xx-emc.txt b/Documentation/devicetree/bindings/net/nuvoton,npcm7xx-emc.txt
new file mode 100644
index 000000000000..a7ac3ca66de9
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nuvoton,npcm7xx-emc.txt
@@ -0,0 +1,38 @@
+Nuvoton NPCM7XX 10/100 Ethernet MAC Controller (EMC)
+
+The NPCM7XX provides one or two Ethernet MAC RMII Controllers
+for WAN/LAN applications
+
+Required properties:
+- device_type     : Should be "network"
+- compatible      : "nuvoton,npcm750-emc" for Poleg NPCM7XX.
+- reg             : Offset and length of the register set for the device.
+- interrupts      : Contain the emc interrupts with flags for falling edge.
+                    first interrupt dedicated to Txirq
+                    second interrupt dedicated to Rxirq
+- phy-mode        : Should be "rmii" (see ethernet.txt in the same directory)
+- clocks          : phandle of emc reference clock.
+- resets          : phandle to the reset control for this device.
+- use-ncsi        : Use the NC-SI stack instead of an MDIO PHY
+
+Example:
+
+emc0: eth@f0825000 {
+	device_type = "network";
+	compatible = "nuvoton,npcm750-emc";
+	reg = <0xf0825000 0x1000>;
+	interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+	             <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+	phy-mode = "rmii";
+	clocks = <&clk NPCM7XX_CLK_AHB>;
+
+	#use-ncsi; /* add this to support ncsi */
+
+	clock-names = "clk_emc";
+	resets = <&rstc 6>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&r1_pins
+	             &r1err_pins
+	             &r1md_pins>;
+	status = "okay";
+};
-- 
2.18.0

