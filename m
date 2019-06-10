Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E59CC3B618
	for <lists+openbmc@lfdr.de>; Mon, 10 Jun 2019 15:35:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45MvKH2xZNzDqPv
	for <lists+openbmc@lfdr.de>; Mon, 10 Jun 2019 23:35:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45MvGW02KjzDqPb
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jun 2019 23:33:19 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x5ADWke9029720;
 Mon, 10 Jun 2019 16:32:46 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id DA70061FCD; Mon, 10 Jun 2019 16:32:46 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: olof@lixom.net, gregkh@linuxfoundation.org, arnd@arndb.de,
 robh+dt@kernel.org, mark.rutland@arm.com, avifishman70@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 joel@jms.id.au
Subject: [PATCH v1 1/2] dt-binding: soc: Add common LPC snoop documentation
Date: Mon, 10 Jun 2019 16:32:44 +0300
Message-Id: <20190610133245.306812-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190610133245.306812-1-tmaimon77@gmail.com>
References: <20190610133245.306812-1-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Added device tree binding documentation for Nuvoton BMC
NPCM BIOS Post Code (BPC) and Aspeed AST2500 LPC snoop.
The LPC snoop monitoring two configurable I/O addresses
written by the host on Low Pin Count (LPC) bus.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/soc/lpc/lpc-snoop.txt | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/lpc/lpc-snoop.txt

diff --git a/Documentation/devicetree/bindings/soc/lpc/lpc-snoop.txt b/Documentation/devicetree/bindings/soc/lpc/lpc-snoop.txt
new file mode 100644
index 000000000000..c21cb8df4ffb
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/lpc/lpc-snoop.txt
@@ -0,0 +1,27 @@
+LPC snoop interface
+
+The LPC snoop (BIOS Post Code) interface can monitor
+two configurable I/O addresses written by the host on
+the Low Pin Count (LPC) bus.
+
+Nuvoton NPCM7xx LPC snoop supports capture double words,
+when using capture double word only I/O address 1 is monitored.
+
+Required properties for lpc-snoop node
+- compatible   : "nuvoton,npcm750-lpc-bpc-snoop" for Poleg NPCM7XX
+                 "aspeed,ast2500-lpc-snoop" for Aspeed AST2500.
+- reg          : specifies physical base address and size of the registers.
+- interrupts   : contain the LPC snoop interrupt with flags for falling edge.
+- snoop-ports  : contain monitor I/O addresses, at least one monitor I/O
+                 address required
+
+Optional property for NPCM7xx lpc-snoop node
+- nuvoton,lpc-en-dwcapture : enable capture double words support.
+
+Example:
+	lpc-snoop: lpc_snoop@f0007040 {
+		compatible = "nuvoton,npcm750-lpc-bpc-snoop";
+		reg = <0xf0007040 0x14>;
+		snoop-ports = <0x80>;
+		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+	};
-- 
2.18.0

