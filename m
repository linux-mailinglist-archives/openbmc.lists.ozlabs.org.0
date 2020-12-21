Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 630F52DF918
	for <lists+openbmc@lfdr.de>; Mon, 21 Dec 2020 07:01:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Czpks6nBGzDqLs
	for <lists+openbmc@lfdr.de>; Mon, 21 Dec 2020 17:01:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=chiawei_wang@aspeedtech.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Czpfg3hvTzDqL5;
 Mon, 21 Dec 2020 16:57:59 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 0BL5qWvB013664;
 Mon, 21 Dec 2020 13:52:33 +0800 (GMT-8)
 (envelope-from chiawei_wang@aspeedtech.com)
Received: from ChiaWeiWang-PC.aspeed.com (192.168.2.66) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 21 Dec 2020 13:56:08 +0800
From: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
To: <lee.jones@linaro.org>, <robh+dt@kernel.org>, <joel@jms.id.au>,
 <andrew@aj.id.au>, <linus.walleij@linaro.org>, <minyard@acm.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>
Subject: [PATCH v3 1/5] dt-bindings: aspeed-lpc: Remove LPC partitioning
Date: Mon, 21 Dec 2020 13:56:19 +0800
Message-ID: <20201221055623.31463-2-chiawei_wang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201221055623.31463-1-chiawei_wang@aspeedtech.com>
References: <20201221055623.31463-1-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.66]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 0BL5qWvB013664
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
Cc: BMC-SW@aspeedtech.com, cyrilbur@gmail.com, haiyue.wang@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The LPC controller has no concept of the BMC and the Host partitions.
This patch fixes the documentation by removing the description on LPC
partitions. The register offsets illustrated in the DTS node examples
are also fixed to adapt to the LPC DTS change.

Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
---
 .../devicetree/bindings/mfd/aspeed-lpc.txt    | 99 ++++---------------
 1 file changed, 21 insertions(+), 78 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
index d0a38ba8b9ce..90eb0ecc95d1 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
+++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
@@ -9,13 +9,7 @@ primary use case of the Aspeed LPC controller is as a slave on the bus
 conditions it can also take the role of bus master.
 
 The LPC controller is represented as a multi-function device to account for the
-mix of functionality it provides. The principle split is between the register
-layout at the start of the I/O space which is, to quote the Aspeed datasheet,
-"basically compatible with the [LPC registers from the] popular BMC controller
-H8S/2168[1]", and everything else, where everything else is an eclectic
-collection of functions with a esoteric register layout. "Everything else",
-here labeled the "host" portion of the controller, includes, but is not limited
-to:
+mix of functionality, which includes, but is not limited to:
 
 * An IPMI Block Transfer[2] Controller
 
@@ -44,80 +38,29 @@ Required properties
 ===================
 
 - compatible:	One of:
-		"aspeed,ast2400-lpc", "simple-mfd"
-		"aspeed,ast2500-lpc", "simple-mfd"
-		"aspeed,ast2600-lpc", "simple-mfd"
+		"aspeed,ast2400-lpc-v2", "simple-mfd", "syscon"
+		"aspeed,ast2500-lpc-v2", "simple-mfd", "syscon"
+		"aspeed,ast2600-lpc-v2", "simple-mfd", "syscon"
 
 - reg:		contains the physical address and length values of the Aspeed
                 LPC memory region.
 
 - #address-cells: <1>
 - #size-cells:	<1>
-- ranges: 	Maps 0 to the physical address and length of the LPC memory
-                region
-
-Required LPC Child nodes
-========================
-
-BMC Node
---------
-
-- compatible:	One of:
-		"aspeed,ast2400-lpc-bmc"
-		"aspeed,ast2500-lpc-bmc"
-		"aspeed,ast2600-lpc-bmc"
-
-- reg:		contains the physical address and length values of the
-                H8S/2168-compatible LPC controller memory region
-
-Host Node
----------
-
-- compatible:   One of:
-		"aspeed,ast2400-lpc-host", "simple-mfd", "syscon"
-		"aspeed,ast2500-lpc-host", "simple-mfd", "syscon"
-		"aspeed,ast2600-lpc-host", "simple-mfd", "syscon"
-
-- reg:		contains the address and length values of the host-related
-                register space for the Aspeed LPC controller
-
-- #address-cells: <1>
-- #size-cells:	<1>
-- ranges: 	Maps 0 to the address and length of the host-related LPC memory
+- ranges:	Maps 0 to the physical address and length of the LPC memory
                 region
 
 Example:
 
 lpc: lpc@1e789000 {
-	compatible = "aspeed,ast2500-lpc", "simple-mfd";
+	compatible = "aspeed,ast2500-lpc-v2", "simple-mfd", "syscon";
 	reg = <0x1e789000 0x1000>;
 
 	#address-cells = <1>;
 	#size-cells = <1>;
 	ranges = <0x0 0x1e789000 0x1000>;
-
-	lpc_bmc: lpc-bmc@0 {
-		compatible = "aspeed,ast2500-lpc-bmc";
-		reg = <0x0 0x80>;
-	};
-
-	lpc_host: lpc-host@80 {
-		compatible = "aspeed,ast2500-lpc-host", "simple-mfd", "syscon";
-		reg = <0x80 0x1e0>;
-		reg-io-width = <4>;
-
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0x0 0x80 0x1e0>;
-	};
 };
 
-BMC Node Children
-==================
-
-
-Host Node Children
-==================
 
 LPC Host Interface Controller
 -------------------
@@ -149,14 +92,12 @@ Optional properties:
 
 Example:
 
-lpc-host@80 {
-	lpc_ctrl: lpc-ctrl@0 {
-		compatible = "aspeed,ast2500-lpc-ctrl";
-		reg = <0x0 0x80>;
-		clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
-		memory-region = <&flash_memory>;
-		flash = <&spi>;
-	};
+lpc_ctrl: lpc-ctrl@80 {
+	compatible = "aspeed,ast2500-lpc-ctrl";
+	reg = <0x80 0x80>;
+	clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
+	memory-region = <&flash_memory>;
+	flash = <&spi>;
 };
 
 LPC Host Controller
@@ -179,9 +120,9 @@ Required properties:
 
 Example:
 
-lhc: lhc@20 {
+lhc: lhc@a0 {
 	compatible = "aspeed,ast2500-lhc";
-	reg = <0x20 0x24 0x48 0x8>;
+	reg = <0xa0 0x24 0xc8 0x8>;
 };
 
 LPC reset control
@@ -192,16 +133,18 @@ state of the LPC bus. Some systems may chose to modify this configuration.
 
 Required properties:
 
- - compatible:		"aspeed,ast2600-lpc-reset" or
-			"aspeed,ast2500-lpc-reset"
-			"aspeed,ast2400-lpc-reset"
+ - compatible:		One of:
+			"aspeed,ast2600-lpc-reset";
+			"aspeed,ast2500-lpc-reset";
+			"aspeed,ast2400-lpc-reset";
+
  - reg:			offset and length of the IP in the LHC memory region
  - #reset-controller	indicates the number of reset cells expected
 
 Example:
 
-lpc_reset: reset-controller@18 {
+lpc_reset: reset-controller@98 {
         compatible = "aspeed,ast2500-lpc-reset";
-        reg = <0x18 0x4>;
+        reg = <0x98 0x4>;
         #reset-cells = <1>;
 };
-- 
2.17.1

