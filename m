Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A967034DD02
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 02:32:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8VlW4v8zz30FH
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 11:32:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=MK8VEoXa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=MK8VEoXa; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8Vkn1VfFz2ydG;
 Tue, 30 Mar 2021 11:32:00 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 3CD4FA8F;
 Mon, 29 Mar 2021 17:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1617063904;
 bh=w56QNwgTzFfQ20vdnp8aRrubhpSunslkOzk8MrUdZrs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MK8VEoXaqnXH7v/g8EcaqO9T/0rkLDIvncZI8E7U1Do4HtUu0GgJuIMXBG3N4lAb9
 gcWlsAeiXvmTgTJOUxknhUhuOAz3SaAfUn5ACUpPJ1wD8Y3SAhhjeItdGmzhtu9rq3
 D05/dvDIiWIqUZNIwjsm2lotMzG+W3NBYgxNyFSM=
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 3/3] ARM: dts: aspeed: add ASRock E3C246D4I BMC
Date: Mon, 29 Mar 2021 19:23:38 -0500
Message-Id: <20210330002338.335-4-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210330002338.335-1-zev@bewilderbeest.net>
References: <20210330002338.335-1-zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Zev Weiss <zev@bewilderbeest.net>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a relatively low-cost AST2500-based Xeon E-2100/E-2200 series
mini-ITX board that we hope can provide a decent platform for OpenBMC
development.

This initial device-tree provides the necessary configuration for
basic BMC functionality such as host power control, serial console and
KVM support, and POST code snooping.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 .../boot/dts/aspeed-bmc-asrock-e3c246d4i.dts  | 188 ++++++++++++++++++
 1 file changed, 188 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts

diff --git a/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts b/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
new file mode 100644
index 000000000000..27b34c3cf67a
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
@@ -0,0 +1,188 @@
+// SPDX-License-Identifier: GPL-2.0+
+/dts-v1/;
+
+#include "aspeed-g5.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/i2c/i2c.h>
+
+/{
+	model = "ASRock E3C246D4I BMC";
+	compatible = "aspeed,ast2500";
+
+	aliases {
+		serial4 = &uart5;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=tty0 console=ttyS4,115200 earlyprintk";
+	};
+
+	memory@80000000 {
+		reg = <0x80000000 0x20000000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		heartbeat {
+			/* BMC_HB_LED_N */
+			gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "timer";
+		};
+
+		system-fault {
+			/* SYSTEM_FAULT_LED_N */
+			gpios = <&gpio ASPEED_GPIO(Z, 2) GPIO_ACTIVE_LOW>;
+			panic-indicator;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		uid-button {
+			label = "uid-button";
+			gpios = <&gpio ASPEED_GPIO(F, 1) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(F, 1)>;
+		};
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>, <&adc 4>,
+			<&adc 5>, <&adc 6>, <&adc 7>, <&adc 8>, <&adc 9>,
+			<&adc 10>, <&adc 11>, <&adc 12>;
+	};
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+		spi-max-frequency = <100000000>; /* 100 MHz */
+#include "openbmc-flash-layout.dtsi"
+	};
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&vuart {
+	status = "okay";
+	aspeed,sirq-active-high;
+};
+
+&mac0 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
+};
+
+&i2c1 {
+	status = "okay";
+
+	/* thermal sensor, one diode run to a disconnected header */
+	w83773g@4c {
+		compatible = "nuvoton,w83773g";
+		reg = <0x4c>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	/* FRU EEPROM */
+	eeprom@57 {
+		compatible = "st,24c128", "atmel,24c128";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+};
+
+&video {
+	status = "okay";
+};
+
+&vhub {
+	status = "okay";
+};
+
+&lpc_ctrl {
+	status = "okay";
+};
+
+&lpc_snoop {
+	status = "okay";
+	snoop-ports = <0x80>;
+};
+
+&gpio {
+	status = "okay";
+	gpio-line-names =
+		/*  A */ "BMC_MAC1_INTB", "BMC_MAC2_INTB", "NMI_BTN_N", "BMC_NMI",
+			"", "", "", "",
+		/*  B */ "", "", "", "", "", "IRQ_BMC_PCH_SMI_LPC_N", "", "",
+		/*  C */ "", "", "", "", "", "", "", "",
+		/*  D */ "BMC_PSIN", "BMC_PSOUT", "BMC_RESETCON", "RESETCON",
+			"", "", "", "",
+		/*  E */ "", "", "", "", "", "", "", "",
+		/*  F */ "LOCATORLED_STATUS_N", "LOCATORBTN", "", "",
+			"", "", "BMC_PCH_SCI_LPC", "BMC_NCSI_MUX_CTL",
+		/*  G */ "HWM_BAT_EN", "CHASSIS_ID0", "CHASSIS_ID1", "CHASSIS_ID2",
+			"BMC_ALERT1_N_R", "BMC_ALERT2_N_R", "BMC_ALERT3_N", "SML0ALERT",
+		/*  H */ "FM_ME_RCVR_N", "O_PWROK", "SKL_CNL_R", "D4_DIMM_EVENT_3V_N",
+			"MFG_MODE_N", "BMC_RTCRST", "BMC_HB_LED_N", "BMC_CASEOPEN",
+		/*  I */ "", "", "", "", "", "", "", "",
+		/*  J */ "BMC_READY", "BMC_PCH_BIOS_CS_N", "BMC_SMI", "",
+			"", "", "", "",
+		/*  K */ "", "", "", "", "", "", "", "",
+		/*  L */ "BMC_CTS1", "BMC_DCD1", "BMC_DSR1", "BMC_RI1",
+			"BMC_DTR1", "BMC_RTS1", "BMC_TXD1", "BMC_RXD1",
+		/*  M */ "BMC_LAN0_DIS_N", "BMC_LAN1_DIS_N", "", "",
+			"", "", "", "",
+		/*  N */ "", "", "", "", "", "", "", "",
+		/*  O */ "", "", "", "", "", "", "", "",
+		/*  P */ "", "", "", "", "", "", "", "",
+		/*  Q */ "", "", "", "",
+			"BMC_SBM_PRESENT_1_N", "BMC_SBM_PRESENT_2_N",
+			"BMC_SBM_PRESENT_3_N", "BMC_PCIE_WAKE_N",
+		/*  R */ "", "", "", "", "", "", "", "",
+		/*  S */ "PCHHOT_BMC_N", "", "RSMRST",
+			"", "", "", "", "",
+		/*  T */ "", "", "", "", "", "", "", "",
+		/*  U */ "", "", "", "", "", "", "", "",
+		/*  V */ "", "", "", "", "", "", "", "",
+		/*  W */ "PS_PWROK", /* dummy always-high signal */
+			"", "", "", "", "", "", "",
+		/*  X */ "", "", "", "", "", "", "", "",
+		/*  Y */ "SLP_S3", "SLP_S5", "", "", "", "", "", "",
+		/*  Z */ "CPU_CATERR_BMC_PCH_N", "", "SYSTEM_FAULT_LED_N", "BMC_THROTTLE_N",
+			"", "", "", "",
+		/* AA */ "CPU1_THERMTRIP_LATCH_N", "", "CPU1_PROCHOT_N", "",
+			"", "", "IRQ_SMI_ACTIVE_N", "FM_BIOS_POST_CMPLT_N",
+		/* AB */ "", "", "ME_OVERRIDE", "BMC_DMI_MODIFY",
+			"", "", "", "",
+		/* AC */ "LAD0", "LAD1", "LAD2", "LAD3",
+			"CK_33M_BMC", "LFRAME", "SERIRQ", "S_PLTRST";
+
+	/* Assert BMC_READY so BIOS doesn't sit around waiting for it */
+	bmc-ready {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(J, 0) GPIO_ACTIVE_LOW>;
+		output-high;
+	};
+};
+
+&adc {
+	status = "okay";
+};
+
+&kcs3 {
+	status = "okay";
+	aspeed,lpc-io-reg = <0xca2>;
+};
-- 
2.31.1

