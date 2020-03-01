Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B65D7174C99
	for <lists+openbmc@lfdr.de>; Sun,  1 Mar 2020 10:41:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Vdb13x66zDr85
	for <lists+openbmc@lfdr.de>; Sun,  1 Mar 2020 20:41:49 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48VdZQ1nt7zDr85
 for <openbmc@lists.ozlabs.org>; Sun,  1 Mar 2020 20:41:16 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 0219eidV028748;
 Sun, 1 Mar 2020 11:40:44 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 34FF8603B0; Sun,  1 Mar 2020 11:40:44 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
 mark.rutland@arm.com, joel@jms.id.au, avifishman70@gmail.com,
 tali.perry1@gmail.com, yuenn@google.com, benjaminfair@google.com
Subject: [PATCH v1 3/4] dt-binding: watchdog: add bootstatus reset type
 documentation
Date: Sun,  1 Mar 2020 11:40:39 +0200
Message-Id: <20200301094040.123189-4-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200301094040.123189-1-tmaimon77@gmail.com>
References: <20200301094040.123189-1-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 Tomer Maimon <tmaimon77@gmail.com>, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add device tree three bootstatus reset types documentation.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../bindings/watchdog/nuvoton,npcm-wdt.txt    | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
index 0a0f86a25eb0..836e0ac29196 100644
--- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
@@ -18,6 +18,33 @@ Required clocking property, have to be one of:
 Optional properties:
 - timeout-sec : Contains the watchdog timeout in seconds
 - nuvoton,restart-priority : Contains the card restart priority.
+- nuvoton,card-reset-type : "porst|corst|wd0|wd1|wd2|sw1|sw2|sw3|sw4"
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
+- nuvoton,ext1-reset-type : "porst|corst|wd0|wd1|wd2|sw1|sw2|sw3|sw4"
+  Contains the external 2 reset type for checking and indicating
+  the last external 2 reset status (WDIOF_EXTERN1)
+
+  If 'nuvoton,card-reset-type' is not specified the default is wd0.
+
+  Reset types are the same as in nuvoton,card-reset-type property.
+
+- nuvoton,ext2-reset-type : "porst|corst|wd0|wd1|wd2|sw1|sw2|sw3|sw4"
+  Contains the external 2 reset type for checking and indicating
+  the last external 2 reset status (WDIOF_EXTERN2)
+
+  If 'nuvoton,card-reset-type' is not specified the default is sw1.
+
+  Reset types are the same as in nuvoton,card-reset-type property.
 
 Example:
 
@@ -27,4 +54,7 @@ timer@f000801c {
     reg = <0xf000801c 0x4>;
     clocks = <&clk NPCM7XX_CLK_TIMER>;
 	nuvoton,restart-priority = <155>;
+	nuvoton,card-reset-type = "porst";
+	nuvoton,ext1-reset-type = "wd1";
+	nuvoton,ext2-reset-type = "sw2";
 };
-- 
2.22.0

