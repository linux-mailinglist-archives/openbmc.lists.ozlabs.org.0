Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E43331854E
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 08:20:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45039S3P3DzDqN6
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 16:20:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ami.com
 (client-ip=63.147.10.40; helo=atlmailgw1.ami.com;
 envelope-from=hongweiz@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ami.com
X-Greylist: delayed 905 seconds by postgrey-1.36 at bilbo;
 Fri, 26 Apr 2019 04:44:27 AEST
Received: from atlmailgw1.ami.com (atlmailgw1.ami.com [63.147.10.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44qmLg05xqzDqcy
 for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2019 04:44:26 +1000 (AEST)
X-AuditID: ac1060b2-f29ff700000058fe-f8-5cc1fc7c6a8f
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id
 3F.59.22782.C7CF1CC5; Thu, 25 Apr 2019 14:29:16 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 25 Apr 2019 14:29:16 -0400
From: Hongwei Zhang <hongweiz@ami.com>
To: Joel Stanley <joel@jms.id.au>, <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.0] ARM: dts: aspeed: Initial git pull request for
 Microsoft Olympus BMC
Date: Thu, 25 Apr 2019 14:28:23 -0400
Message-ID: <1556216903-24529-1-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRmVeSWpSXmKPExsWyRiBhgm7Nn4MxBrf2yFvsusxhsfTmFTaL
 3+f/MlucannB4sDicbV9F7vH7e1N7B4XPx5j9jg/YyFjAEtUA6NNYl5efkliSapCSmpxsq1S
 QFFmWWJypZJCZoqtkqGSQkFOYnJqbmpeia1SYkFBal6Kkh2XAgawASrLzFNIzUvOT8nMS7dV
 8gz217WwMLXUNVSyC8lIVcjMS8svyk0syczPU0jOzysBqk5NAYoqJHRxZlz4OIO54IJqxdJf
 j5gbGKfLdjFyckgImEicuPeBqYuRi0NIYBeTxI4Tz5ghnMOMEm9XH2ACqWITUJPYu3kOmC0i
 YCvxZO9ldhCbWaBYYvnDM4wgtrBAssTPzR9YQGwWAVWJi92TWEFsXgEHiZ8dT9ghtslJ3DzX
 yQwRF5Q4OfMJC8QcCYmDL16AxYUEZCVuHXrMBFGvIPG87zHLBEa+WUhaZiFpWcDItIpRKLEk
 JzcxMye93FAvMTdTLzk/dxMjJMI27WBsuWh+iFGAg1GJh3fxu4MxQqyJZcWVuYcYJTiYlUR4
 1U2BQrwpiZVVqUX58UWlOanFhxidgF6YyCzFDQpDYKTEGxsYSInCOIYmZibmRuaGlibmxsZK
 4rz5a5tihATSgZGbnZpakFoEM4SJg1OqgfFyTIDaiw/2mXt9SvSPe17YuLPec8dyCQH/j829
 856kSnzO/Hm7/MJFjUuS5+6/bur4EX5/7SVm911puyydW4o+Hft40E1b9wnHryBJ5sXVZ5n0
 /+67IBb6ImJz2X2uqat/yi+4wS9panU/WoPrCfNPUc8ZrZ3HmLP19jLnz+849Db+g3Cv5mQl
 luKMREMt5qLiRACVeDdr0wIAAA==
X-Mailman-Approved-At: Thu, 09 May 2019 16:11:01 +1000
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Hongwei Zhang <hongweiz@ami.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Olympus is a Microsoft OCP platform equipped with Aspeed 2400 BMC
SoC.
Tested: meta-olympus has been tested on an ASPEED AST2400 EVB board
        and MT Olympus server.
        The U-boot and kernel start and run as expected.

Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
---
 arch/arm/boot/dts/Makefile                   |   3 +-
 arch/arm/boot/dts/aspeed-bmc-opp-olympus.dts | 219 +++++++++++++++++++++++++++
 2 files changed, 221 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-olympus.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index bd40148..34c0b7a0 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1247,4 +1247,5 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-opp-witherspoon.dtb \
 	aspeed-bmc-opp-zaius.dtb \
 	aspeed-bmc-portwell-neptune.dtb \
-	aspeed-bmc-quanta-q71l.dtb
+	aspeed-bmc-quanta-q71l.dtb \
+	aspeed-bmc-opp-olympus.dts
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-olympus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-olympus.dts
new file mode 100644
index 0000000..8b4b00d0
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-olympus.dts
@@ -0,0 +1,219 @@
+//SPDX-License-Identifier: GPL-2.0+
+/dts-v1/;
+
+#include "aspeed-g4.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	model = "Olympus BMC";
+	compatible = "microsoft,olympus-bmc", "aspeed,ast2400";
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,115200 earlyprintk";
+	};
+
+	memory@40000000 {
+		reg = <0x40000000 0x20000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		vga_memory: framebuffer@5f000000 {
+			no-map;
+			reg = <0x5f000000 0x01000000>; /* 16M */
+		};
+
+		flash_memory: region@98000000 {
+			no-map;
+			reg = <0x98000000 0x01000000>; /* 16MB */
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		bmc_heartbeat {
+			gpios = <&gpio ASPEED_GPIO(B, 0) GPIO_ACTIVE_LOW>;
+		};
+
+		power_green {
+			gpios = <&gpio ASPEED_GPIO(U, 2) GPIO_ACTIVE_HIGH>;
+		};
+
+		power_amber {
+			gpios = <&gpio ASPEED_GPIO(U, 3) GPIO_ACTIVE_HIGH>;
+		};
+
+		identify {
+			gpios = <&gpio ASPEED_GPIO(Q, 5) GPIO_ACTIVE_LOW>;
+		};
+
+		fault {
+			gpios = <&gpio ASPEED_GPIO(A, 1) GPIO_ACTIVE_LOW>;
+		};
+	};
+
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
+		<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>;
+	};
+};
+
+&adc {
+	status = "okay";
+};
+
+&fmc {
+	status = "okay";
+
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+#include "openbmc-flash-layout.dtsi"
+	};
+};
+
+&spi {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1debug_default>;
+
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "pnor";
+	};
+};
+
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flbusy_default &pinctrl_flwp_default
+			&pinctrl_vgahs_default &pinctrl_vgavs_default
+			&pinctrl_ddcclk_default &pinctrl_ddcdat_default>;
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&mac0 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+
+	tmp421@4c {
+		compatible = "ti,tmp421";
+		reg = <0x4c>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <100000>;
+
+	slave-mqueue@20 {
+		compatible = "slave-ipmb";
+		reg = <0x40000020>;
+	};
+};
+
+&i2c5 {
+	status = "okay";
+};
+
+&i2c6 {
+	status = "okay";
+
+	tmp421@4c {
+		compatible = "ti,tmp421";
+		reg = <0x4c>;
+	};
+};
+
+&i2c7 {
+	status = "okay";
+};
+
+&vuart {
+	status = "okay";
+};
+
+&wdt2 {
+	status = "okay";
+};
+
+&lpc_ctrl {
+	status = "okay";
+	memory-region = <&flash_memory>;
+	flash = <&spi>;
+};
+
+&mbox {
+	status = "okay";
+};
+
+&pwm_tacho {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default
+			&pinctrl_pwm1_default
+			&pinctrl_pwm2_default
+			&pinctrl_pwm3_default>;
+
+	fan@0 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
+	};
+
+	fan@1 {
+		reg = <0x01>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x01>;
+	};
+
+	fan@2 {
+		reg = <0x02>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x02>;
+	};
+
+	fan@3 {
+		reg = <0x03>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x03>;
+	};
+
+	fan@4 {
+		reg = <0x04>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x04>;
+	};
+
+	fan@5 {
+		reg = <0x05>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x05>;
+	};
+
+};
-- 
2.7.4


Please consider the environment before printing this email.

The information contained in this message may be confidential and proprietary to American Megatrends, Inc.  This communication is intended to be read only by the individual or entity to whom it is addressed or by their designee. If the reader of this message is not the intended recipient, you are on notice that any distribution of this message, in any form, is strictly prohibited.  Please promptly notify the sender by reply e-mail or by telephone at 770-246-8600, and then delete or destroy all copies of the transmission.
