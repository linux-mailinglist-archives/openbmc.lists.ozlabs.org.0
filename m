Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0195425E93
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2019 09:14:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4583lT4HQ4zDqQr
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2019 17:13:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ami.com
 (client-ip=63.147.10.40; helo=atlmailgw1.ami.com;
 envelope-from=hongweiz@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ami.com
Received: from atlmailgw1.ami.com (atlmailgw1.ami.com [63.147.10.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457qC41ldtzDqM7
 for <openbmc@lists.ozlabs.org>; Wed, 22 May 2019 07:48:29 +1000 (AEST)
X-AuditID: ac1060b2-d3bff700000059e1-8d-5ce472282d10
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id
 5D.C2.23009.82274EC5; Tue, 21 May 2019 17:48:25 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 21 May 2019 17:48:21 -0400
From: Hongwei Zhang <hongweiz@ami.com>
To: Joel Stanley <joel@jms.id.au>, <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.0 v3] ARM: dts: aspeed: Add Microsoft Olympus BMC
Date: Tue, 21 May 2019 17:47:44 -0400
Message-ID: <1558475264-29119-1-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrILMWRmVeSWpSXmKPExsWyRiBhgq5m0ZMYgw/HWC12XeawWHrzCpvF
 7/N/mS1OtbxgcWDxuNq+i93j9vYmdo+LH48xe5yfsZAxgCWKyyYlNSezLLVI3y6BK+Pl9C7W
 gtPKFdMfTWBqYDwr3cXIySEhYCJx98ofxi5GLg4hgV1MEutnHmeDcA4zSvz98JINpIpNQE1i
 7+Y5TCC2iICtxJO9l9lBbGaBYonlD88wgtjCAr4SnRt6wOIsAqoSq8/9ZAWxeQUcJLZ972aC
 2CYncfNcJzNEXFDi5MwnLBBzJCQOvngBFhcSkJW4degxVL2CxPO+xywTGPlmIWmZhaRlASPT
 KkahxJKc3MTMnPRyQ73E3Ey95PzcTYyQgNu0g7HlovkhRgEORiUe3nf5T2KEWBPLiitzDzFK
 cDArifCePvUoRog3JbGyKrUoP76oNCe1+BCjNAeLkjjvjJDLMUIC6YklqdmpqQWpRTBZJg5O
 qQbGQ3wuHhdfT3GYPZvXzrFvncsRwY28wVNmMucI9yS9XPvLgk0t+0yxxZPj0ypvHrEU+xkT
 6lj1wkNIp3nr3o1qF6e3nZ9y7s6cXOvru6647njZmxx9vZJD61/glQPODf3HDrtztXm0MUat
 /iHTnjshI2G34jz291mbeG7qTZjyxt/Y21I9YJGWEktxRqKhFnNRcSIA5amKSzQCAAA=
X-Mailman-Approved-At: Wed, 22 May 2019 17:12:17 +1000
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

Olympus is a Microsoft OCP platform equipped with Aspeed 1250 or
2400 BMC SoC.

Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
---
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts | 211 +++++++++++++++++++++
 2 files changed, 212 insertions(+)
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
index 0000000..a3d6b71
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
@@ -0,0 +1,211 @@
+//SPDX-License-Identifier: GPL-2.0+
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
+	pinctrl-names = "default";
+	pinctrl-0 =    <&pinctrl_adc0_default
+			&pinctrl_adc1_default
+			&pinctrl_adc2_default
+			&pinctrl_adc3_default
+			&pinctrl_adc4_default
+			&pinctrl_adc5_default
+			&pinctrl_adc6_default
+			&pinctrl_adc7_default>;
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
+	pinctrl-0 = <&pinctrl_spi1_default>;
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

