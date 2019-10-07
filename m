Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FAACEF7C
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 01:15:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nGYl6KJvzDqLx
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 10:15:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nGVm6DhNzDqKV;
 Tue,  8 Oct 2019 10:13:20 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Oct 2019 16:13:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,269,1566889200"; d="scan'208";a="218109585"
Received: from maru.jf.intel.com ([10.54.51.77])
 by fmsmga004.fm.intel.com with ESMTP; 07 Oct 2019 16:13:19 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>
Subject: [PATCH 2/5] ARM: dts: aspeed: add I2C buffer mode support
Date: Mon,  7 Oct 2019 16:13:10 -0700
Message-Id: <20191007231313.4700-3-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007231313.4700-1-jae.hyun.yoo@linux.intel.com>
References: <20191007231313.4700-1-jae.hyun.yoo@linux.intel.com>
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
Cc: devicetree@vger.kernel.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
 arch/arm/boot/dts/aspeed-g4.dtsi | 47 +++++++++++++++++++-------------
 arch/arm/boot/dts/aspeed-g5.dtsi | 47 +++++++++++++++++++-------------
 2 files changed, 56 insertions(+), 38 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index dffb595d30e4..f51b016aa769 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -420,12 +420,21 @@
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
@@ -433,7 +442,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x40 0x40>;
+		reg = <0x40 0x40>, <0x800 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -449,7 +458,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x80 0x40>;
+		reg = <0x80 0x40>, <0x880 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -465,7 +474,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0xc0 0x40>;
+		reg = <0xc0 0x40>, <0x900 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -482,7 +491,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x100 0x40>;
+		reg = <0x100 0x40>, <0x980 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -499,7 +508,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x140 0x40>;
+		reg = <0x140 0x40>, <0xa00 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -516,7 +525,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x180 0x40>;
+		reg = <0x180 0x40>, <0xa80 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -533,7 +542,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x1c0 0x40>;
+		reg = <0x1c0 0x40>, <0xb00 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -550,7 +559,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x300 0x40>;
+		reg = <0x300 0x40>, <0xb80 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -567,7 +576,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x340 0x40>;
+		reg = <0x340 0x40>, <0xc00 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -584,7 +593,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x380 0x40>;
+		reg = <0x380 0x40>, <0xc80 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -601,7 +610,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x3c0 0x40>;
+		reg = <0x3c0 0x40>, <0xd00 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -618,7 +627,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x400 0x40>;
+		reg = <0x400 0x40>, <0xd80 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -635,7 +644,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x440 0x40>;
+		reg = <0x440 0x40>, <0xe00 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -652,7 +661,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x480 0x40>;
+		reg = <0x480 0x40>, <0xe80 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index e8feb8b66a2f..cbc31ce3fab2 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -513,12 +513,21 @@
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
@@ -526,7 +535,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x40 0x40>;
+		reg = <0x40 0x40>, <0x200 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -542,7 +551,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x80 0x40>;
+		reg = <0x80 0x40>, <0x210 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -558,7 +567,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0xc0 0x40>;
+		reg = <0xc0 0x40>, <0x220 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -575,7 +584,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x100 0x40>;
+		reg = <0x100 0x40>, <0x230 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -592,7 +601,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x140 0x40>;
+		reg = <0x140 0x40>, <0x240 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -609,7 +618,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x180 0x40>;
+		reg = <0x180 0x40>, <0x250 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -626,7 +635,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x1c0 0x40>;
+		reg = <0x1c0 0x40>, <0x260 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -643,7 +652,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x300 0x40>;
+		reg = <0x300 0x40>, <0x270 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -660,7 +669,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x340 0x40>;
+		reg = <0x340 0x40>, <0x280 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -677,7 +686,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x380 0x40>;
+		reg = <0x380 0x40>, <0x290 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -694,7 +703,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x3c0 0x40>;
+		reg = <0x3c0 0x40>, <0x2a0 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -711,7 +720,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x400 0x40>;
+		reg = <0x400 0x40>, <0x2b0 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -728,7 +737,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x440 0x40>;
+		reg = <0x440 0x40>, <0x2c0 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -745,7 +754,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x480 0x40>;
+		reg = <0x480 0x40>, <0x2d0 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
-- 
2.23.0

