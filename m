Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 974BB65731C
	for <lists+openbmc@lfdr.de>; Wed, 28 Dec 2022 07:21:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NhhHj3C59z306l
	for <lists+openbmc@lfdr.de>; Wed, 28 Dec 2022 17:21:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VKMH8CX6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=lesly895@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VKMH8CX6;
	dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NhhH34XjYz304m
	for <openbmc@lists.ozlabs.org>; Wed, 28 Dec 2022 17:21:02 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id jn22so15179637plb.13
        for <openbmc@lists.ozlabs.org>; Tue, 27 Dec 2022 22:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fIi3nVBr5HhvV6liomqZDA7tgozsDbLWycpm0oi0WgQ=;
        b=VKMH8CX6iDupXY+H+MuKnxn6zf5AnG7Bk5xP6NEs1lvgzc9LrjtXE0CKhhdRl80IEw
         EwOWn55+mcvOzVHKdFAYcJbGk7Srm58H+WzX5Q9DmUnCKyl8xTRvHdoqx8ZcYOovj8iP
         6oXduq9xrBcPOWEfpr3N0XtsxIRkZjZBCqRxmfGgcETpAj2SHQyIfbaw6bFxPoGGcDX8
         UoT6/6HuWQOGlo1QM+aE3wg57xzmKI+ur8mRbg0eNfAgGSCiYrtsXXNm+9SYle2diGoR
         MW1IRAS3y+c8/ddpIqnMZjWvs0wpNXnaZzwy17xzwKQ2b4j8NYKRQPYSSiGqSKlrRyPB
         b/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fIi3nVBr5HhvV6liomqZDA7tgozsDbLWycpm0oi0WgQ=;
        b=rwkipwdOYZcV9Mozo0U0WFQUjHNDe0WvQYf0l/KB3Lt5VyBplOURS7G1KoXG4DIV1+
         +yfTRANS+kTSEM+oZJZ1DzTN2ZGt27S6A5IAsTuZVlnXfnRZ5dBKa8aVf8YoHWqIw03r
         1o6qkZv70wHvTEjehcU0oCKLjkCWxjuub/3xmPqISpsobgUa79TB3hoYO8muBDe6ELG2
         YFoT3md6uBaz7ySExCz8kWXGsV9yIntNSjbr0ZYDWRz22KsMExRczpthXcWYNj6bBQgl
         pnibMPHcnphyURIfxeTKQ6sSoSBY7+/gES/Vb4y7BgjaBHOsRMez0MPkyOpaywq4KBLI
         s2GQ==
X-Gm-Message-State: AFqh2kpS0Soee6ykEce+bWCm4QSEbBYiE8iybvVumDORj1NnSXo/C7/M
	Gl8vwVzjUqn+5D6ijYoXeJQfcQOKpTE=
X-Google-Smtp-Source: AMrXdXuSos4Wu1VUvr73G2DGKjpwm3606VDmKYvc0fr7QK8ziMfImm524v/v5arLs9E7NRiSGejREg==
X-Received: by 2002:a17:90a:4210:b0:219:49c6:538b with SMTP id o16-20020a17090a421000b0021949c6538bmr41251958pjg.33.1672208457651;
        Tue, 27 Dec 2022 22:20:57 -0800 (PST)
Received: from localhost.localdomain (61-220-204-242.hinet-ip.hinet.net. [61.220.204.242])
        by smtp.gmail.com with ESMTPSA id m10-20020a17090a3f8a00b002195819d541sm11298438pjc.8.2022.12.27.22.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 22:20:57 -0800 (PST)
From: Ryan Sie <lesly895@gmail.com>
X-Google-Original-From: Ryan Sie <ryans@supermicro.com.tw>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] Add Supermicro X13DEM BMC machine
Date: Wed, 28 Dec 2022 14:20:07 +0800
Message-Id: <20221228062007.1989410-1-ryans@supermicro.com.tw>
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

