Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF82658B61
	for <lists+openbmc@lfdr.de>; Thu, 29 Dec 2022 11:02:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NjP8H4wdnz3bgL
	for <lists+openbmc@lfdr.de>; Thu, 29 Dec 2022 21:02:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Qs4UWArA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=lesly895@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Qs4UWArA;
	dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NjP7g1WXZz2xb4
	for <openbmc@lists.ozlabs.org>; Thu, 29 Dec 2022 21:02:05 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id a184so1566626pfa.9
        for <openbmc@lists.ozlabs.org>; Thu, 29 Dec 2022 02:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X4I9oIialc8bnEltn8gN3N+sqnljy8SNiiG7uWE7maw=;
        b=Qs4UWArACVmk9sBDBfygZiHp3+4T6KrXYmell+bjgEQLH326y0Ylnuvd8SNhej5Hn4
         aTmac6OSaosyDO+4MywfRCmZKQjHBRoBsrXFJeXoPVhAImAa4zsswDv9D6QSAjOtMwCp
         SEjAYHIytHK/Mvn4FiqkJMxF7ExZ5qLz/R3blyJW1hKxEUP8U7t2ZjVJlUOX+xgFz2pi
         MrZvl9D+U0983PI2p1nUp7NcfJ+ZX1FRxDJBQdVCdBZBA276wHhqm812M/9SIWkPyEfo
         OSqnHur7XriQ4SVXOBJu21qucTnB7uqeTVIj8GDQiFTg7ZH21XVEo477uhe8ccfgPBwH
         cAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4I9oIialc8bnEltn8gN3N+sqnljy8SNiiG7uWE7maw=;
        b=YdJUS6TMUxmDzavO3LQQ66b1tBd9ej8bKsEv3rVGYkW3vN4aiFsnvYah1XAmdy3oqh
         HAS+zoEmAoT2U9/qR832Mlq+VS4Wdi74YzrXFeSJniOPlgnQr2sknyy1y/vkKDmRQIH4
         sD8ldE4U77uMDR/i+GQM8IolODDEri7LqQbEyJoC1SKT/fKLFnUf9QGf9cIKVuV+P72+
         r+0Km2UdMUMvicuxwpAzBQPDpX7Cu9Zf8HNOKYrKSrMq1DFTQx9NhLKQ6rxVXQwQk/GL
         8qNEsSOwvUlWHkih9/aJC6HRA7XEBQ9pFGh7vvG8AmoCIH8sOYCOQApzeGLwNNOS3uYq
         t5nQ==
X-Gm-Message-State: AFqh2kpcmIicL47g9WHZuMTsDNvqEXv7dtJJN1kqv9hhhC8823tZS2By
	C65lcRyD+YWsKSrxWH5E0q8fpz2OFqQ=
X-Google-Smtp-Source: AMrXdXvs/HrNageJ73vmWhakxQ8KxxKU3PvyLDOhQXFYx/W/Bh+aJqZLGPqwkF5+UUfXTJwfKRI8xA==
X-Received: by 2002:a05:6a00:b48:b0:581:dda:cec3 with SMTP id p8-20020a056a000b4800b005810ddacec3mr20185245pfo.16.1672308121705;
        Thu, 29 Dec 2022 02:02:01 -0800 (PST)
Received: from localhost.localdomain (61-220-204-242.hinet-ip.hinet.net. [61.220.204.242])
        by smtp.gmail.com with ESMTPSA id j1-20020a62c501000000b00581d48ad9b0sm789391pfg.154.2022.12.29.02.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 02:02:01 -0800 (PST)
From: lesly895@gmail.com
X-Google-Original-From: ryans@supermicro.com.tw
To: openbmc@lists.ozlabs.org
Subject: [PATCH] ARM: dts: aspeed: Add Supermicro X13DEM (AST2600) BMC
Date: Thu, 29 Dec 2022 18:01:55 +0800
Message-Id: <20221229100155.2954455-1-ryans@supermicro.com.tw>
X-Mailer: git-send-email 2.25.1
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
Cc: Ryan Sie <ryans@supermicro.com.tw>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Ryan Sie <ryans@supermicro.com.tw>

Add initial version of device tree for Supermicro X13DEM (AST2600) BMC.
X13DEM is Supermicro's next generation Hyper platform with an AST2600 BMC.

Signed-off-by: Ryan Sie <ryans@supermicro.com.tw>
---
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/aspeed-bmc-supermicro-x13dem.dts | 476 ++++++++++++++++++
 2 files changed, 477 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 2ee9c043218b..3b89006fa008 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1623,6 +1623,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-quanta-q71l.dtb \
 	aspeed-bmc-quanta-s6q.dtb \
 	aspeed-bmc-supermicro-x11spi.dtb \
+	aspeed-bmc-supermicro-x13dem.dtb \
 	aspeed-bmc-inventec-transformers.dtb \
 	aspeed-bmc-tyan-s7106.dtb \
 	aspeed-bmc-tyan-s8036.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts b/arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts
new file mode 100644
index 000000000000..b94783a52999
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts
@@ -0,0 +1,476 @@
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/i2c/i2c.h>
+
+/ {
+	model = "AST2600 BMC";
+	compatible = "aspeed,ast2600";
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,115200 earlyprintk";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		gfx_memory: framebuffer {
+			size = <0x01000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+
+		video_engine_memory: jpegbuffer {
+			size = <0x02000000>;	/* 32M */
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+
+		ssp_memory: ssp_memory {
+			size = <0x00200000>;
+			alignment = <0x00100000>;
+			compatible = "shared-dma-pool";
+			no-map;
+		};
+
+	};
+
+	leds {
+	    compatible = "gpio-leds";
+	    powerfail {
+		default-state = "off";
+		gpios = <&gpio0 ASPEED_GPIO(G, 5) GPIO_ACTIVE_LOW>;
+	    };
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
+			<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
+			<&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
+			<&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
+	};
+
+#if 0
+	aliases {
+		i2c18 = &imux18;
+		i2c19 = &imux19;
+		i2c20 = &imux20;
+		i2c21 = &imux21;
+		i2c22 = &imux22;
+		mmc0 = &emmc;
+	};
+#else
+	aliases {
+		mmc0 = &emmc;
+	};
+#endif
+
+};
+
+&emmc_controller {
+	status = "okay";
+	timing-phase = <0x700FF>;
+};
+
+&emmc {
+	status = "okay";
+
+	non-removable;
+	max-frequency = <100000000>;
+	sdhci-drive-type = /bits/ 8 <3>;
+#if 1
+	bus-width = <4>;
+#else
+	bus-width = <8>;
+	pinctrl-0 = <&pinctrl_emmc_default
+			&pinctrl_emmcdat4_default
+			&pinctrl_emmcdat5_default
+			&pinctrl_emmcdat6_default
+			&pinctrl_emmcdat7_default>;
+#endif
+};
+
+//&jtag1 {
+//	status = "okay";
+//};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		label = "bmc";
+		spi-max-frequency = <25000000>;
+		spi-tx-bus-width = <1>;
+		m25p,fast-read;
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			u-boot@0 {
+				reg = <0x0 0x100000>;
+				label = "u-boot";
+			};
+			u-boot-env@3f0000 {
+				reg = <0x3f0000 0x10000>;
+				label = "u-boot-env";
+			};
+			u-boot-env-redund@7f0000 {
+				reg = <0x7f0000 0x10000>;
+				label = "u-boot-env-redund";
+			};
+		};
+	};
+};
+
+&spi1 {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		label = "spi1:0";
+		spi-max-frequency = <25000000>;
+		spi-bus-width = <1>;
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			all-bios@0 {
+				label = "all_part_bios";
+				reg = <0x000000000 0x02000000>;
+			};
+		};
+	};
+
+};
+
+&spi2 {
+	status = "disabled";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi2_default &pinctrl_spi2cs1_default &pinctrl_spi2cs2_default
+				&pinctrl_qspi2_default>;
+
+	flash@0 {
+		status = "okay";
+		label = "spi2:0";
+		spi-max-frequency = <100000000>;
+		spi-bus-width = <2>;
+		m25p,fast-read;
+	};
+};
+
+//&peci0 {
+//	status = "okay";
+//};
+
+&syscon {
+	uart-clock-high-speed;
+	status = "okay";
+};
+
+&adc0 {
+	status = "okay";
+};
+
+&adc1 {
+	status = "okay";
+};
+
+&gpio0 {
+	status = "okay";
+	gpio-line-names =
+		/*A0-A7*/	"","","","","","","","",
+		/*B0-B7*/	"","","","","","","","",
+		/*C0-C7*/	"","","","","","","","",
+		/*D0-D7*/	"","","","","","","","",
+		/*E0-E7*/	"","","","","","","","",
+		/*F0-F7*/	"","","","","","","","",
+		/*G0-G7*/	"","","","","","","","",
+		/*H0-H7*/	"","NMI_N","PWRBTN_N","RST_N","","","","",
+		/*I0-I7*/	"","","","","","","","",
+		/*J0-J7*/	"","","","","","","","",
+		/*K0-K7*/	"","","","","","","","",
+		/*L0-L7*/	"","","","","","","","",
+		/*M0-M7*/	"","","","","","","","",
+		/*N0-N7*/	"","","","","","","","",
+		/*O0-O7*/	"","","","","","","","",
+		/*P0-P7*/	"","","","","","","","",
+		/*Q0-Q7*/	"","","","","","","","",
+		/*R0-R7*/	"","","","","","","","",
+		/*S0-S7*/	"","","","","PWROK_IN","","","",
+		/*T0-T7*/	"","","","","","","","",
+		/*U0-U7*/	"","","","","","","","",
+		/*V0-V7*/	"","","","","","","","",
+		/*W0-W7*/	"","","","","","","","",
+		/*X0-X7*/	"","BIOS_CMP_IN","","","","","","",
+		/*Y0-Y7*/	"","","","","","","","",
+		/*Z0-Z7*/	"","","PWRBTN_IN","","","","","";
+};
+
+&gpio1 {
+	status = "disabled";
+};
+
+&sgpiom0 {
+	status = "disabled";
+	gpio-line-names =
+		/* SGPIO output lines */
+		/*OA0-OA7*/	"","","","","","","","",
+		/*OB0-OB7*/	"","","","","","","","",
+		/*OC0-OC7*/	"","","","","","","","",
+		/*OD0-OD7*/	"","","","","","","","",
+		/*OE0-OE7*/	"","","","","","","","",
+		/*OF0-OF7*/	"","","","","","","","",
+		/*OG0-OG7*/	"","","","","","","","",
+		/*OH0-OH7*/	"","","","","","","","",
+		/*OI0-OI7*/	"","","","","","","","",
+		/*OJ0-OJ7*/	"","","","","","","","",
+		/*DUMMY*/	"","","","","","","","",
+		/*DUMMY*/	"","","","","","","","",
+
+		/* SGPIO input lines */
+		/*IA0-IA7*/	"","","","","","","","",
+		/*IB0-IB7*/	"","","","","","","","",
+		/*IC0-IC7*/	"","","","","","","","",
+		/*ID0-ID7*/	"","","","","","","","",
+		/*IE0-IE7*/	"","","","","","","","",
+		/*IF0-IF7*/	"","","","","","","","",
+		/*IG0-IG7*/	"","","","","","","","",
+		/*IH0-IH7*/	"","","","","","","","",
+		/*II0-II7*/	"","","","","","","","",
+		/*IJ0-IJ7*/	"","","","","","","","";
+};
+
+&kcs3 {
+	aspeed,lpc-io-reg = <0xCA2>;
+	status = "okay";
+};
+
+&kcs4 {
+	aspeed,lpc-io-reg = <0xCA4>;
+	status = "okay";
+};
+
+//&lpc_sio {
+//	status = "okay";
+//};
+
+&lpc_snoop {
+	snoop-ports = <0x80>;
+	status = "okay";
+};
+
+//&mbox {
+//	status = "okay";
+//};
+
+&uart1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd1_default
+			&pinctrl_rxd1_default
+			&pinctrl_nrts1_default
+			&pinctrl_ndtr1_default
+			&pinctrl_ndsr1_default
+			&pinctrl_ncts1_default
+			&pinctrl_ndcd1_default
+			&pinctrl_nri1_default>;
+};
+
+&uart2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd2_default
+			&pinctrl_rxd2_default
+			&pinctrl_nrts2_default
+			&pinctrl_ndtr2_default
+			&pinctrl_ndsr2_default
+			&pinctrl_ncts2_default
+			&pinctrl_ndcd2_default
+			&pinctrl_nri2_default>;
+};
+
+&uart3 {
+	status = "okay";
+};
+
+&uart4 {
+	status = "okay";
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&uart_routing {
+	status = "okay";
+};
+
+&mdio0 {
+	status = "okay";
+
+	ethphy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&mac0 {
+    status = "okay";
+
+    phy-mode = "rgmii";
+    phy-handle = <&ethphy0>;
+
+    pinctrl-names = "default";
+    pinctrl-0 = <&pinctrl_rgmii1_default>;
+};
+
+&mdio1 {
+	status = "disabled";
+
+	ethphy1: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&mac1 {
+	status = "disabled";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii2_default>;
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy1>;
+};
+
+&mdio2 {
+	status = "disabled";
+
+	ethphy2: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&mac2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii3_default>;
+	use-ncsi;
+};
+
+&mdio3 {
+	status = "disabled";
+
+	ethphy3: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&mac3 {
+	status = "disabled";
+	pinctrl-names = "default";
+	phy-handle = <&ethphy3>;
+	phy-mode = "rgmii";
+
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "disabled";
+};
+
+&i2c2 {
+	multi-master;
+	status = "okay";
+#if 0
+	i2c-switch@71 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x71>;
+		i2c-mux-idle-disconnect;
+
+		imux18: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		imux19: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+
+		imux20: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+		};
+
+		imux21: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+		};
+
+		imux22: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+		};
+	};
+#endif
+};
+
+&i2c3 {
+	//TODO, i2c switch
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+	bus-frequency = <400000>;
+};
+
+&i2c5 {
+	status = "okay";
+};
+
+&i2c6 {
+	//TODO, i2c switch
+	status = "okay";
+};
+
+&i2c7 {
+	status = "okay";
+};
+
+&video {
+	status = "okay";
+	memory-region = <&video_engine_memory>;
+};
+
+&vhub {
+	status = "okay";
+};
+
+&rtc {
+	status = "okay";
+};
-- 
2.25.1

