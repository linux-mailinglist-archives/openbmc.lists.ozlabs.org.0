Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D49D450F87
	for <lists+openbmc@lfdr.de>; Mon, 15 Nov 2021 19:29:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtHmK2zJSz3bnq
	for <lists+openbmc@lfdr.de>; Tue, 16 Nov 2021 05:29:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtHkP5vVVz304y;
 Tue, 16 Nov 2021 05:28:13 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="294322878"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; d="scan'208";a="294322878"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 10:27:11 -0800
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; d="scan'208";a="592241453"
Received: from tkolecki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.154.97])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 10:27:01 -0800
From: Iwona Winiarska <iwona.winiarska@intel.com>
To: linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3 03/13] ARM: dts: aspeed: Add PECI controller nodes
Date: Mon, 15 Nov 2021 19:25:42 +0100
Message-Id: <20211115182552.3830849-4-iwona.winiarska@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211115182552.3830849-1-iwona.winiarska@intel.com>
References: <20211115182552.3830849-1-iwona.winiarska@intel.com>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Dave Hansen <dave.hansen@intel.com>, Zev Weiss <zweiss@equinix.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Iwona Winiarska <iwona.winiarska@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Randy Dunlap <rdunlap@infradead.org>, Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add PECI controller nodes with all required information.

Co-developed-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 14 ++++++++++++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 14 ++++++++++++++
 arch/arm/boot/dts/aspeed-g6.dtsi | 14 ++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index b313a1cf5f73..cdaf6db4f07d 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -391,6 +391,20 @@ uart_routing: uart-routing@9c {
 				};
 			};
 
+			peci0: peci-controller@1e78b000 {
+				compatible = "aspeed,ast2400-peci";
+				reg = <0x1e78b000 0x60>;
+				interrupts = <15>;
+				clocks = <&syscon ASPEED_CLK_GATE_REFCLK>;
+				resets = <&syscon ASPEED_RESET_PECI>;
+				cmd-timeout-ms = <1000>;
+				aspeed,clock-divider = <0>;
+				aspeed,msg-timing = <1>;
+				aspeed,addr-timing = <1>;
+				aspeed,rd-sampling-point = <8>;
+				status = "disabled";
+			};
+
 			uart2: serial@1e78d000 {
 				compatible = "ns16550a";
 				reg = <0x1e78d000 0x20>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index c7049454c7cb..1ff71c182c95 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -511,6 +511,20 @@ ibt: ibt@140 {
 				};
 			};
 
+			peci0: peci-controller@1e78b000 {
+				compatible = "aspeed,ast2500-peci";
+				reg = <0x1e78b000 0x60>;
+				interrupts = <15>;
+				clocks = <&syscon ASPEED_CLK_GATE_REFCLK>;
+				resets = <&syscon ASPEED_RESET_PECI>;
+				cmd-timeout-ms = <1000>;
+				aspeed,clock-divider = <0>;
+				aspeed,msg-timing = <1>;
+				aspeed,addr-timing = <1>;
+				aspeed,rd-sampling-point = <8>;
+				status = "disabled";
+			};
+
 			uart2: serial@1e78d000 {
 				compatible = "ns16550a";
 				reg = <0x1e78d000 0x20>;
diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index 5106a424f1ce..efd87ceb40b6 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -507,6 +507,20 @@ wdt4: watchdog@1e7850c0 {
 				status = "disabled";
 			};
 
+			peci0: peci-controller@1e78b000 {
+				compatible = "aspeed,ast2600-peci";
+				reg = <0x1e78b000 0x100>;
+				interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&syscon ASPEED_CLK_GATE_REF0CLK>;
+				resets = <&syscon ASPEED_RESET_PECI>;
+				cmd-timeout-ms = <1000>;
+				aspeed,clock-divider = <0>;
+				aspeed,msg-timing = <1>;
+				aspeed,addr-timing = <1>;
+				aspeed,rd-sampling-point = <8>;
+				status = "disabled";
+			};
+
 			lpc: lpc@1e789000 {
 				compatible = "aspeed,ast2600-lpc-v2", "simple-mfd", "syscon";
 				reg = <0x1e789000 0x1000>;
-- 
2.31.1

