Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 753E26877F7
	for <lists+openbmc@lfdr.de>; Thu,  2 Feb 2023 09:55:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6t0m2z8Hz3f3f
	for <lists+openbmc@lfdr.de>; Thu,  2 Feb 2023 19:55:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=otRNP9Du;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=lesly895@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=otRNP9Du;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6t0B02Sqz3cdZ
	for <openbmc@lists.ozlabs.org>; Thu,  2 Feb 2023 19:55:05 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id o13so1285305pjg.2
        for <openbmc@lists.ozlabs.org>; Thu, 02 Feb 2023 00:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d+MdWcKt9zClXcvx61+Ta5iqkOnx5LPu8iXu+batmrA=;
        b=otRNP9Duaub5XIuBorhimPyjkpSVpOj9Hg9qr3D3dVtImDIzAQUJNN2J8fwgcGCb+t
         W1IpqxGZQQy1fJPuSqoc5/pO45ZV1tKs26pj4iH9irlak+fd4HLcVSFJo7n5RTbiEEOt
         MvgXdKeYu975Up3VmQ77MfAyyHc/VrC7StjwaaKJO7Ip0rqSJsJpMxpElMvAhqXfptbB
         EjhPc6uLiVKBDWX/IZXt0yhc4Ht/Uec8UdYa5G+NgvWt4Idc8cmFzawen2xjb6yQfaBm
         GXAgHSb/wi1gjQDmcnecvjw1XY2eGfSLYVXibG/UW+t/Rk9VA0AOOsBOPKWMVb19W49P
         SOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d+MdWcKt9zClXcvx61+Ta5iqkOnx5LPu8iXu+batmrA=;
        b=OHr7ZFMgvfC52Myk8n9aCIHfrqluP8/gar3/2siotTtWQPgMmKbTIIsXcbkxb254W+
         9J9nVuES/EZ4bJw33i/FtaUUA9YBbuy5cYCDxrT/e+8ICKnrc6P2nV9L5bOh1YvngXRM
         f/aS52+mFRD5dPNvn7g7rqi0p+3BnR+1CipX4Z/il/amZ/n1kPfkoyWT8I+ZMfTqFXpr
         AI6+eLeMFxKTBiLhTdpSbnLwIyK/ubbnjyKqYCKPWdqPomIpWSl2li6E1CkkE73B/08i
         zz7mQYcKrdV6+zJkfb4r8StZkdg/FlyeXs+Io7CvH/MOMFmKhjvll/IbMp4wV9TIeAbE
         Qg/Q==
X-Gm-Message-State: AO0yUKWRrQsle5Tp5UQKAWlvwHLFbPO+697fi+gk1DP+1IprNSUgrioM
	27yJEQnPkmuZeYg6az7rBLLnlv55wtgxMw==
X-Google-Smtp-Source: AK7set+C5IBKBJpL96ajmGfk4IlCBz3Om3hLfVqomrF+MmniPj6GVkGAZ0g/nNz3Q9j+T0zqI53sww==
X-Received: by 2002:a17:90a:5d14:b0:22c:6238:ad0c with SMTP id s20-20020a17090a5d1400b0022c6238ad0cmr5881300pji.24.1675328102587;
        Thu, 02 Feb 2023 00:55:02 -0800 (PST)
Received: from localhost.localdomain (61-220-204-242.hinet-ip.hinet.net. [61.220.204.242])
        by smtp.gmail.com with ESMTPSA id e185-20020a6369c2000000b00499bc49fb9csm12066336pgc.41.2023.02.02.00.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 00:55:02 -0800 (PST)
From: lesly895@gmail.com
X-Google-Original-From: ryans@supermicro.com.tw
To: openbmc@lists.ozlabs.org
Subject: [PATCH] ARM: dts: aspeed: Add Supermicro X13DEM (AST2600) BMC
Date: Thu,  2 Feb 2023 16:54:58 +0800
Message-Id: <20230202085458.6786-1-ryans@supermicro.com.tw>
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
Cc: andrew@aj.id.au, Ryan Sie <ryans@supermicro.com.tw>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Ryan Sie <ryans@supermicro.com.tw>

Add initial version of device tree for Supermicro X13DEM (AST2600) BMC.
X13DEM is Supermicro's next generation Hyper platform with an AST2600 BMC.

Signed-off-by: Ryan Sie <ryans@supermicro.com.tw>
---
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/aspeed-bmc-supermicro-x13dem.dts | 398 ++++++++++++++++++
 2 files changed, 399 insertions(+)
 create mode 100664 arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts

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
new file mode 100664
index 000000000000..7c0771904544
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts
@@ -0,0 +1,398 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2023 Supermicro Corp.
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
+		video_engine_memory: video {
+			size = <0x04000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+
+		gfx_memory: framebuffer {
+			size = <0x01000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
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
+	aliases {
+		mmc0 = &emmc;
+	};
+
+};
+
+&emmc_controller {
+	status = "okay";
+};
+
+&emmc {
+	status = "okay";
+
+	non-removable;
+	max-frequency = <100000000>;
+	sdhci-drive-type = /bits/ 8 <3>;
+	bus-width = <4>;
+};
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
+&adc0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
+		&pinctrl_adc2_default &pinctrl_adc3_default
+		&pinctrl_adc4_default &pinctrl_adc5_default
+		&pinctrl_adc6_default &pinctrl_adc7_default>;
+};
+
+&adc1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
+		&pinctrl_adc10_default &pinctrl_adc11_default
+		&pinctrl_adc12_default &pinctrl_adc13_default
+		&pinctrl_adc14_default &pinctrl_adc15_default>;
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
+&lpc_snoop {
+	snoop-ports = <0x80>;
+	status = "okay";
+};
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
+	status = "okay";
+
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy0>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1_default>;
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
+};
+
+&i2c3 {
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

