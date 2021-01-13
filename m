Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E75852F53CA
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 21:03:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGJJz15z2zDrft
	for <lists+openbmc@lfdr.de>; Thu, 14 Jan 2021 07:02:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGJGG4fj8zDrSp
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2021 07:00:34 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 10DK0Kq2007574;
 Wed, 13 Jan 2021 22:00:20 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 075A763A17; Wed, 13 Jan 2021 22:00:21 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 v3 05/12] dt-binding: watchdog: Add DT restart
 priority and reset type
Date: Wed, 13 Jan 2021 22:00:03 +0200
Message-Id: <20210113200010.71845-6-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20210113200010.71845-1-tmaimon77@gmail.com>
References: <20210113200010.71845-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Tomer Maimon <tmaimon77@gmail.com>,
 benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add device tree restart priority documentation and
three reset types documentation.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../bindings/watchdog/nuvoton,npcm-wdt.txt    | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
index 6d593003c933..a3142cb60495 100644
--- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
@@ -16,7 +16,36 @@ Required clocking property, have to be one of:
                     timer (usually 25000000).
 
 Optional properties:
+- syscon: a phandle to access GCR registers.
 - timeout-sec : Contains the watchdog timeout in seconds
+- nuvoton,restart-priority - Contains the card restart priority.
+- nuvoton,card-reset-type = "porst|corst|wd0|wd1|wd2|sw1|sw2|sw3|sw4"
+  Contains the card reset type for checking and indicating
+  the last card reset status (WDIOF_CARDRESET)
+
+  If 'nuvoton,card-reset-type' is not specified the default is porst
+
+  Reset types:
+       - porst: Power reset
+       - corst: Core reset
+	   - wdX : Watchdog reset X (X represante 0-2)
+	   - swX : Software reset X (X represante 1-4)
+
+- nuvoton,ext1-reset-type = "porst|corst|wd0|wd1|wd2|sw1|sw2|sw3|sw4"
+  Contains the external 2 reset type for checking and indicating
+  the last external 2 reset status (WDIOF_EXTERN1)
+
+  If 'nuvoton,card-reset-type' is not specified the default is wd0.
+
+  Reset types are the same as in nuvoton,card-reset-type property.
+
+- nuvoton,ext2-reset-type = "porst|corst|wd0|wd1|wd2|sw1|sw2|sw3|sw4"
+  Contains the external 2 reset type for checking and indicating
+  the last external 2 reset status (WDIOF_EXTERN2)
+
+  If 'nuvoton,card-reset-type' is not specified the default is sw1.
+
+  Reset types are the same as in nuvoton,card-reset-type property.
 
 Example:
 
@@ -25,4 +54,9 @@ timer@f000801c {
     interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
     reg = <0xf000801c 0x4>;
     clocks = <&clk NPCM7XX_CLK_TIMER>;
+	syscon = <&gcr>;
+	nuvoton,restart-priority = <155>;
+	nuvoton,card-reset-type = "porst";
+	nuvoton,ext1-reset-type = "wd1";
+	nuvoton,ext2-reset-type = "sw2";
 };
-- 
2.22.0

