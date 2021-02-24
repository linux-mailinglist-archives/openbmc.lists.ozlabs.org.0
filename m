Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25105324456
	for <lists+openbmc@lfdr.de>; Wed, 24 Feb 2021 20:05:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dm5381DN7z3cbm
	for <lists+openbmc@lfdr.de>; Thu, 25 Feb 2021 06:05:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dm52G66nRz3cJL;
 Thu, 25 Feb 2021 06:04:38 +1100 (AEDT)
IronPort-SDR: NF302UMYcISqz7eji9S5bUUrhR3m4yOeGt7yd68d9ORJXbTedwId9YxbPJVLZk8W7l670FYUNS
 ApuW3EXib/6A==
X-IronPort-AV: E=McAfee;i="6000,8403,9905"; a="184578394"
X-IronPort-AV: E=Sophos;i="5.81,203,1610438400"; d="scan'208";a="184578394"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2021 11:04:32 -0800
IronPort-SDR: OMf1WpvajrY+23yRH9vItFY2/cDwNllRifTmsMkUogqkSTYu9pbSKwdk7/DAkfKuow/9g0o2Y5
 giNmTM3Nvdag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,203,1610438400"; d="scan'208";a="367098930"
Received: from maru.jf.intel.com ([10.54.51.77])
 by orsmga006.jf.intel.com with ESMTP; 24 Feb 2021 11:04:32 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Brendan Higgins <brendanhiggins@google.com>,
 Wolfram Sang <wsa@the-dreams.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, Cedric Le Goater <clg@kaod.org>
Subject: [PATCH v4 2/4] ARM: dts: aspeed: modify I2C node to support buffer
 mode
Date: Wed, 24 Feb 2021 11:17:18 -0800
Message-Id: <20210224191720.7724-3-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210224191720.7724-1-jae.hyun.yoo@linux.intel.com>
References: <20210224191720.7724-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, linux-i2c@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This driver uses byte mode that makes lots of interrupt calls
so it's not good for performance. Also, it makes the driver very
timing sensitive. To improve performance of the driver, this commit
modifies I2C node to support buffer mode which uses I2C SRAM buffer
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

AST2600:
It has 32 Bytes of individual I2C SRAM buffer per each bus and its
range is from 0x1e78ac00 to 0x1e78adff. Works just like AST2500
does.

See Documentation/devicetree/bindings/i2c/i2c-aspeed.txt for
enabling buffer mode details.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
---
Changes since v3:
- None

Changes since v2:
- Added SRAM resources back to default dtsi and added mode selection
  property.

Changes since v1:
- Updated commit message.
- Removed buffer reg settings to keep the default transfer mode as byte mode.

 arch/arm/boot/dts/aspeed-g4.dtsi | 47 +++++++++++++++++++-------------
 arch/arm/boot/dts/aspeed-g5.dtsi | 47 +++++++++++++++++++-------------
 arch/arm/boot/dts/aspeed-g6.dtsi | 32 +++++++++++-----------
 3 files changed, 72 insertions(+), 54 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index e7a45ba18fc9..16d13c2003e5 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -443,12 +443,21 @@
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
@@ -456,7 +465,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x40 0x40>;
+		reg = <0x40 0x40>, <0x800 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -472,7 +481,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x80 0x40>;
+		reg = <0x80 0x40>, <0x880 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -488,7 +497,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0xc0 0x40>;
+		reg = <0xc0 0x40>, <0x900 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -505,7 +514,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x100 0x40>;
+		reg = <0x100 0x40>, <0x980 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -522,7 +531,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x140 0x40>;
+		reg = <0x140 0x40>, <0xa00 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -539,7 +548,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x180 0x40>;
+		reg = <0x180 0x40>, <0xa80 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -556,7 +565,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x1c0 0x40>;
+		reg = <0x1c0 0x40>, <0xb00 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -573,7 +582,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x300 0x40>;
+		reg = <0x300 0x40>, <0xb80 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -590,7 +599,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x340 0x40>;
+		reg = <0x340 0x40>, <0xc00 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -607,7 +616,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x380 0x40>;
+		reg = <0x380 0x40>, <0xc80 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -624,7 +633,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x3c0 0x40>;
+		reg = <0x3c0 0x40>, <0xd00 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -641,7 +650,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x400 0x40>;
+		reg = <0x400 0x40>, <0xd80 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -658,7 +667,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x440 0x40>;
+		reg = <0x440 0x40>, <0xe00 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -675,7 +684,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x480 0x40>;
+		reg = <0x480 0x40>, <0xe80 0x80>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 21930521a986..b97041559474 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -566,12 +566,21 @@
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
@@ -579,7 +588,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x40 0x40>;
+		reg = <0x40 0x40>, <0x200 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -595,7 +604,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x80 0x40>;
+		reg = <0x80 0x40>, <0x210 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -611,7 +620,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0xc0 0x40>;
+		reg = <0xc0 0x40>, <0x220 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -628,7 +637,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x100 0x40>;
+		reg = <0x100 0x40>, <0x230 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -645,7 +654,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x140 0x40>;
+		reg = <0x140 0x40>, <0x240 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -662,7 +671,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x180 0x40>;
+		reg = <0x180 0x40>, <0x250 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -679,7 +688,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x1c0 0x40>;
+		reg = <0x1c0 0x40>, <0x260 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -696,7 +705,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x300 0x40>;
+		reg = <0x300 0x40>, <0x270 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -713,7 +722,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x340 0x40>;
+		reg = <0x340 0x40>, <0x280 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -730,7 +739,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x380 0x40>;
+		reg = <0x380 0x40>, <0x290 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -747,7 +756,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x3c0 0x40>;
+		reg = <0x3c0 0x40>, <0x2a0 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -764,7 +773,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x400 0x40>;
+		reg = <0x400 0x40>, <0x2b0 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -781,7 +790,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x440 0x40>;
+		reg = <0x440 0x40>, <0x2c0 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -798,7 +807,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x480 0x40>;
+		reg = <0x480 0x40>, <0x2d0 0x10>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index 3ee470c2b7b5..48f86f4587db 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -695,7 +695,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x80 0x80>;
+		reg = <0x80 0x80>, <0xc00 0x20>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -710,7 +710,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x100 0x80>;
+		reg = <0x100 0x80>, <0xc20 0x20>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -725,7 +725,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x180 0x80>;
+		reg = <0x180 0x80>, <0xc40 0x20>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -740,7 +740,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x200 0x80>;
+		reg = <0x200 0x80>, <0xc60 0x20>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -755,7 +755,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x280 0x80>;
+		reg = <0x280 0x80>, <0xc80 0x20>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -770,7 +770,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x300 0x80>;
+		reg = <0x300 0x80>, <0xca0 0x20>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -785,7 +785,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x380 0x80>;
+		reg = <0x380 0x80>, <0xcc0 0x20>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -800,7 +800,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x400 0x80>;
+		reg = <0x400 0x80>, <0xce0 0x20>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -815,7 +815,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x480 0x80>;
+		reg = <0x480 0x80>, <0xd00 0x20>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -830,7 +830,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x500 0x80>;
+		reg = <0x500 0x80>, <0xd20 0x20>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -845,7 +845,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x580 0x80>;
+		reg = <0x580 0x80>, <0xd40 0x20>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -860,7 +860,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x600 0x80>;
+		reg = <0x600 0x80>, <0xd60 0x20>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -875,7 +875,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x680 0x80>;
+		reg = <0x680 0x80>, <0xd80 0x20>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -890,7 +890,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x700 0x80>;
+		reg = <0x700 0x80>, <0xda0 0x20>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -905,7 +905,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x780 0x80>;
+		reg = <0x780 0x80>, <0xdc0 0x20>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -920,7 +920,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x800 0x80>;
+		reg = <0x800 0x80>, <0xde0 0x20>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
-- 
2.17.1

