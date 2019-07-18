Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEC06D4DA
	for <lists+openbmc@lfdr.de>; Thu, 18 Jul 2019 21:40:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qPcj0qvKzDqKb
	for <lists+openbmc@lfdr.de>; Fri, 19 Jul 2019 05:40:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qPVx51gnzDqdh
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jul 2019 05:35:37 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 12:35:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,279,1559545200"; d="scan'208";a="187852066"
Received: from maru.jf.intel.com ([10.54.51.77])
 by fmsmga001.fm.intel.com with ESMTP; 18 Jul 2019 12:35:36 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Cedric Le Goater <clg@kaod.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Tao Ren <taoren@fb.com>
Subject: [RFC v3 dev-5.2 2/5] ARM: dts: aspeed: add I2C buffer mode support
Date: Thu, 18 Jul 2019 12:35:17 -0700
Message-Id: <20190718193520.17058-3-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190718193520.17058-1-jae.hyun.yoo@linux.intel.com>
References: <20190718193520.17058-1-jae.hyun.yoo@linux.intel.com>
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
Cc: openbmc@lists.ozlabs.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Byte mode currently this driver uses makes lots of interrupt call
which isn't good for performance and it makes the driver very
timing sensitive. To improve performance of the driver, this commit
adds buffer mode transfer support which uses I2C SRAM buffer
instead of using a single byte buffer.

AST2400:
It has 2 KBytes (256 Bytes x 8 pages) of I2C SRAM buffer pool from
0x1e78a800 to 0x1e78afff that can be used for all busses with
buffer pool manipulation. To simplify implementation for supporting
both AST2400 and AST2500, it assigns each 128 Bytes per bus without
using buffer pool manipulation so total 1792 Bytes of I2C SRAM
buffer will be used.

AST2500:
It has 16 Bytes of individual I2C SRAM buffer per each bus and its
range is from 0x1e78a200 to 0x1e78a2df, so it doesn't have 'buffer
page selection' bit field in the Function control register, and
neither 'base address pointer' bit field in the Pool buffer control
register it has. To simplify implementation for supporting both
AST2400 and AST2500, it writes zeros on those register bit fields
but it's okay because it does nothing in AST2500.

This commit fixes all I2C bus nodes to support buffer mode
transfer.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
v2 -> v3:
 - Removed 'reg-names' to make driver compatible with old device tree.

v1 -> v2:
 - Added i2c-global-regs node to provide access of the I2C global regs.

 arch/arm/boot/dts/aspeed-g4.dtsi | 47 +++++++++++++++++++-------------
 arch/arm/boot/dts/aspeed-g5.dtsi | 47 +++++++++++++++++++-------------
 2 files changed, 56 insertions(+), 38 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index fd857be397bf..7678f0ca1865 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -404,12 +404,21 @@
 };
 
 &i2c {
-	i2c_ic: interrupt-controller@0 {
-		#interrupt-cells = <1>;
-		compatible = "aspeed,ast2400-i2c-ic";
+	i2c_gr: i2c-global-regs@0 {
+		compatible = "aspeed,ast2400-i2c-gr", "syscon";
 		reg = <0x0 0x40>;
-		interrupts = <12>;
-		interrupt-controller;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x40>;
+
+		i2c_ic: interrupt-controller@0 {
+			#interrupt-cells = <1>;
+			compatible = "aspeed,ast2400-i2c-ic";
+			reg = <0x0 0x4>;
+			interrupts = <12>;
+			interrupt-controller;
+		};
 	};
 
 	i2c0: i2c-bus@40 {
@@ -417,7 +426,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x40 0x40>;
+		reg = <0x40 0x40>, <0x800 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -433,7 +442,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x80 0x40>;
+		reg = <0x80 0x40>, <0x880 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -449,7 +458,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0xc0 0x40>;
+		reg = <0xc0 0x40>, <0x900 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -466,7 +475,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x100 0x40>;
+		reg = <0x100 0x40>, <0x980 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -483,7 +492,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x140 0x40>;
+		reg = <0x140 0x40>, <0xa00 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -500,7 +509,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x180 0x40>;
+		reg = <0x180 0x40>, <0xa80 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -517,7 +526,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x1c0 0x40>;
+		reg = <0x1c0 0x40>, <0xb00 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -534,7 +543,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x300 0x40>;
+		reg = <0x300 0x40>, <0xb80 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -551,7 +560,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x340 0x40>;
+		reg = <0x340 0x40>, <0xc00 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -568,7 +577,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x380 0x40>;
+		reg = <0x380 0x40>, <0xc80 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -585,7 +594,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x3c0 0x40>;
+		reg = <0x3c0 0x40>, <0xd00 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -602,7 +611,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x400 0x40>;
+		reg = <0x400 0x40>, <0xd80 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -619,7 +628,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x440 0x40>;
+		reg = <0x440 0x40>, <0xe00 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -636,7 +645,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x480 0x40>;
+		reg = <0x480 0x40>, <0xe80 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index dc58eb8c6969..d6ca491a0574 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -526,12 +526,21 @@
 };
 
 &i2c {
-	i2c_ic: interrupt-controller@0 {
-		#interrupt-cells = <1>;
-		compatible = "aspeed,ast2500-i2c-ic";
+	i2c_gr: i2c-global-regs@0 {
+		compatible = "aspeed,ast2500-i2c-gr", "syscon";
 		reg = <0x0 0x40>;
-		interrupts = <12>;
-		interrupt-controller;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x40>;
+
+		i2c_ic: interrupt-controller@0 {
+			#interrupt-cells = <1>;
+			compatible = "aspeed,ast2500-i2c-ic";
+			reg = <0x0 0x4>;
+			interrupts = <12>;
+			interrupt-controller;
+		};
 	};
 
 	i2c0: i2c-bus@40 {
@@ -539,7 +548,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x40 0x40>;
+		reg = <0x40 0x40>, <0x200 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -555,7 +564,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x80 0x40>;
+		reg = <0x80 0x40>, <0x210 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -571,7 +580,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0xc0 0x40>;
+		reg = <0xc0 0x40>, <0x220 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -588,7 +597,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x100 0x40>;
+		reg = <0x100 0x40>, <0x230 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -605,7 +614,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x140 0x40>;
+		reg = <0x140 0x40>, <0x240 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -622,7 +631,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x180 0x40>;
+		reg = <0x180 0x40>, <0x250 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -639,7 +648,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x1c0 0x40>;
+		reg = <0x1c0 0x40>, <0x260 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -656,7 +665,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x300 0x40>;
+		reg = <0x300 0x40>, <0x270 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -673,7 +682,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x340 0x40>;
+		reg = <0x340 0x40>, <0x280 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -690,7 +699,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x380 0x40>;
+		reg = <0x380 0x40>, <0x290 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -707,7 +716,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x3c0 0x40>;
+		reg = <0x3c0 0x40>, <0x2a0 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -724,7 +733,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x400 0x40>;
+		reg = <0x400 0x40>, <0x2b0 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -741,7 +750,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x440 0x40>;
+		reg = <0x440 0x40>, <0x2c0 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -758,7 +767,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x480 0x40>;
+		reg = <0x480 0x40>, <0x2d0 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
-- 
2.22.0

