Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 712F711C0AD
	for <lists+openbmc@lfdr.de>; Thu, 12 Dec 2019 00:40:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YD2b2x9xzDqV8
	for <lists+openbmc@lfdr.de>; Thu, 12 Dec 2019 10:40:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y6rF4CyzzDqsb
 for <openbmc@lists.ozlabs.org>; Thu, 12 Dec 2019 06:46:37 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Dec 2019 11:46:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,303,1571727600"; d="scan'208";a="216033832"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO ubuntu.jf.intel.com)
 ([10.7.153.143])
 by orsmga003.jf.intel.com with ESMTP; 11 Dec 2019 11:46:35 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lee Jones <lee.jones@linaro.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jonathan Corbet <corbet@lwn.net>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "Darrick J . Wong" <darrick.wong@oracle.com>,
 Eric Sandeen <sandeen@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Wu Hao <hao.wu@intel.com>, Tomohiro Kusumi <kusumi.tomohiro@gmail.com>,
 "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>,
 Frederic Barrat <fbarrat@linux.vnet.ibm.com>,
 "David S . Miller" <davem@davemloft.net>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Philippe Ombredanne <pombredanne@nexb.com>, Vinod Koul <vkoul@kernel.org>,
 Stephen Boyd <sboyd@codeaurora.org>,
 David Kershner <david.kershner@unisys.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 Sagar Dharia <sdharia@codeaurora.org>, Johan Hovold <johan@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v11 05/14] ARM: dts: aspeed: Add PECI node
Date: Wed, 11 Dec 2019 11:46:15 -0800
Message-Id: <20191211194624.2872-6-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
References: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
X-Mailman-Approved-At: Thu, 12 Dec 2019 10:31:04 +1100
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, linux-doc@vger.kernel.org,
 openbmc@lists.ozlabs.org, Jason M Biils <jason.m.bills@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This commit adds PECI bus/adapter node into aspeed-g4, aspeed-g5
and aspeed-g6.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Jason M Biils <jason.m.bills@linux.intel.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>
Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
Reviewed-by: James Feist <james.feist@linux.intel.com>
Reviewed-by: Vernon Mauery <vernon.mauery@linux.intel.com>
---
Changes since v10:
- Added PECI node for Aspeed AST2600.

 arch/arm/boot/dts/aspeed-g4.dtsi | 25 +++++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 25 +++++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-g6.dtsi | 25 +++++++++++++++++++++++++
 3 files changed, 75 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 46c0891aac5a..3b81aebed190 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -378,6 +378,13 @@
 				};
 			};
 
+			peci: bus@1e78b000 {
+				compatible = "simple-bus";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x0 0x1e78b000 0x60>;
+			};
+
 			uart2: serial@1e78d000 {
 				compatible = "ns16550a";
 				reg = <0x1e78d000 0x20>;
@@ -421,6 +428,24 @@
 	};
 };
 
+&peci {
+	peci0: peci-bus@0 {
+		compatible = "aspeed,ast2400-peci";
+		reg = <0x0 0x60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupts = <15>;
+		clocks = <&syscon ASPEED_CLK_GATE_REFCLK>;
+		resets = <&syscon ASPEED_RESET_PECI>;
+		clock-frequency = <24000000>;
+		msg-timing = <1>;
+		addr-timing = <1>;
+		rd-sampling-point = <8>;
+		cmd-timeout-ms = <1000>;
+		status = "disabled";
+	};
+};
+
 &i2c {
 	i2c_ic: interrupt-controller@0 {
 		#interrupt-cells = <1>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index a259c63fff06..41faf0ad8074 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -492,6 +492,13 @@
 				};
 			};
 
+			peci: bus@1e78b000 {
+				compatible = "simple-bus";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x0 0x1e78b000 0x60>;
+			};
+
 			uart2: serial@1e78d000 {
 				compatible = "ns16550a";
 				reg = <0x1e78d000 0x20>;
@@ -535,6 +542,24 @@
 	};
 };
 
+&peci {
+	peci0: peci-bus@0 {
+		compatible = "aspeed,ast2500-peci";
+		reg = <0x0 0x60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupts = <15>;
+		clocks = <&syscon ASPEED_CLK_GATE_REFCLK>;
+		resets = <&syscon ASPEED_RESET_PECI>;
+		clock-frequency = <24000000>;
+		msg-timing = <1>;
+		addr-timing = <1>;
+		rd-sampling-point = <8>;
+		cmd-timeout-ms = <1000>;
+		status = "disabled";
+	};
+};
+
 &i2c {
 	i2c_ic: interrupt-controller@0 {
 		#interrupt-cells = <1>;
diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index 5f6142d99eeb..1056c1538be5 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -391,6 +391,13 @@
 				status = "disabled";
 			};
 
+			peci: bus@1e78b000 {
+				compatible = "simple-bus";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x0 0x1e78b000 0x100>;
+			};
+
 			lpc: lpc@1e789000 {
 				compatible = "aspeed,ast2600-lpc", "simple-mfd";
 				reg = <0x1e789000 0x1000>;
@@ -601,6 +608,24 @@
 
 #include "aspeed-g6-pinctrl.dtsi"
 
+&peci {
+	peci0: peci-bus@0 {
+		compatible = "aspeed,ast2600-peci";
+		reg = <0x0 0x100>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&syscon ASPEED_CLK_GATE_REF0CLK>;
+		resets = <&syscon ASPEED_RESET_PECI>;
+		clock-frequency = <24000000>;
+		msg-timing = <1>;
+		addr-timing = <1>;
+		rd-sampling-point = <8>;
+		cmd-timeout-ms = <1000>;
+		status = "disabled";
+	};
+};
+
 &i2c {
 	i2c0: i2c-bus@80 {
 		#address-cells = <1>;
-- 
2.17.1

