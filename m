Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B77A51C057
	for <lists+openbmc@lfdr.de>; Tue, 14 May 2019 03:25:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4530PM5BBjzDqDK
	for <lists+openbmc@lfdr.de>; Tue, 14 May 2019 11:25:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ami.com
 (client-ip=63.147.10.42; helo=atlmailgw2.ami.com;
 envelope-from=hongweiz@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ami.com
Received: from atlmailgw2.ami.com (atlmailgw2.ami.com [63.147.10.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452pw461h1zDq9M
 for <openbmc@lists.ozlabs.org>; Tue, 14 May 2019 04:18:11 +1000 (AEST)
X-AuditID: ac10606f-0adff700000054ce-c2-5cd9b4de927e
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id
 DF.58.21710.ED4B9DC5; Mon, 13 May 2019 14:18:07 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 13 May 2019 14:18:06 -0400
From: Hongwei Zhang <hongweiz@ami.com>
To: Joel Stanley <joel@jms.id.au>, <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.0] ARM: dts: aspeed: Add Microsoft Olympus BMC
Date: Mon, 13 May 2019 14:17:17 -0400
Message-ID: <1557771437-26366-1-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrILMWRmVeSWpSXmKPExsWyRiBhgu79LTdjDNacYbXYdZnDYunNK2wW
 v8//ZbY41fKCxYHF42r7LnaP29ub2D0ufjzG7HF+xkLGAJYoLpuU1JzMstQifbsErowr0zvZ
 C64pVpya95CxgbFBqouRk0NCwETiYvtR9i5GLg4hgV1MEi1/jrFCOIcZJdrefGMDqWITUJPY
 u3kOE4gtImAr8WTvZXYQm1mgWGL5wzOMILawgJfE5ek/weIsAqoSF29tZAWxeQUcJJY3/WaE
 2CYncfNcJzNEXFDi5MwnLBBzJCQOvngBFhcSkJW4degxE0S9gsTzvscsExj5ZiFpmYWkZQEj
 0ypGocSSnNzEzJz0ciO9xNxMveT83E2MkIDL38H48aP5IUYBDkYlHt6EeTdjhFgTy4orcw8x
 SnAwK4nwRineiBHiTUmsrEotyo8vKs1JLT7EKM3BoiTOOyPkcoyQQHpiSWp2ampBahFMlomD
 U6qBMd4jWoGv9927nW5XeOdbfXn9UMFXaAmzr4Upe2/jxtnzz/5nv3vER/NP9x7/tr9LBZu2
 3373KD9K7YDtqQe3naYx3r4c+zea5ybHYZ7vXuUun95OKVfTcVbr8vwQuvLllzXcBgY7N+U3
 m2Yw2tjxmehO/n+pafsn+8cvl+l+v3R8gXtmYtu2KUosxRmJhlrMRcWJAMfu5es0AgAA
X-Mailman-Approved-At: Tue, 14 May 2019 11:23:06 +1000
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
Soc.

Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
---
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts | 204 +++++++++++++++++++++
 2 files changed, 205 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index c01a7b1..072725a 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1242,6 +1242,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-facebook-tiogapass.dtb \
 	aspeed-bmc-intel-s2600wf.dtb \
 	aspeed-bmc-lenovo-hr630.dtb \
+	aspeed-bmc-microsoft-olympus.dtb \
 	aspeed-bmc-opp-lanyang.dtb \
 	aspeed-bmc-opp-palmetto.dtb \
 	aspeed-bmc-opp-romulus.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts b/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
new file mode 100644
index 0000000..ed25fac
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
@@ -0,0 +1,204 @@
+//SPDX-License-Identifier: GPL-2.0+
+/*
+ * Device Tree file for Microsoft Olympus platform.
+ */
+
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
+
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "pnor";
+	};
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
+	clock-frequency = <100000>;
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
+};
+
+&mbox {
+	status = "okay";
+};
+
+&pwm_tacho {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 =    <&pinctrl_pwm0_default
+			&pinctrl_pwm1_default
+			&pinctrl_pwm2_default
+			&pinctrl_pwm3_default
+			&pinctrl_pwm4_default
+			&pinctrl_pwm5_default
+			&pinctrl_pwm6_default>;
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

