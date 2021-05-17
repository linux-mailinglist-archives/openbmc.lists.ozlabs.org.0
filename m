Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2943382312
	for <lists+openbmc@lfdr.de>; Mon, 17 May 2021 05:28:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fk4NK4zSYz2yxk
	for <lists+openbmc@lfdr.de>; Mon, 17 May 2021 13:28:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jsVBQVHW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=liuxiwei1013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jsVBQVHW; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fk4N25NZrz2xgN
 for <openbmc@lists.ozlabs.org>; Mon, 17 May 2021 13:28:16 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id v12so2346382plo.10
 for <openbmc@lists.ozlabs.org>; Sun, 16 May 2021 20:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2N5t4+C3Wb5+aIcNvILIsPBRttC20hhqHSpE46cRLUM=;
 b=jsVBQVHWu/vAHjO09OqA4Lzh6H6yztRxOloNq8MHCdfWc0aK8O8/UtKFLwDW2RBcub
 BbK2F+6TCdzvSD3NbV7lhvpV2oFUizGgg5NdPJ0IuRjwrXgoRRC37zNJ7Crq7kErZutR
 M1TWJW76TtJtvPyTogQ/DTgHUQ3I7ta/PS367lYYtBr9BB28JX+daKowo0xTlZatf7Po
 MV2ua/EkR1+N7CiymxJr0ldF+oKOsPqNQWKwflws3Kkzkxq/UynvGSH9f/IiOJ5VQ3Zb
 cC83TBwfw8d6r7xU+fpLfOfw9LzQBRROTfd3qpIdxxWyhkr8ELefKDQflaMyXKQqFysv
 KTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2N5t4+C3Wb5+aIcNvILIsPBRttC20hhqHSpE46cRLUM=;
 b=VdgKTEksa0jkLyN8OrAWNW/rS+FTjJWEhaGzhwHj1vVToe/7CdBYbs0f9CImPPbBD8
 P0F0puxfO644O3ordrQStRgZJJHx8tmSttAEu6s8dVPPdbBLQcp2E6Bfk9bfg4GLAiqF
 2m2mBg819YpZBERkHQySMI6Dg+cKHlfWfcWO1pj4ONI8dayk6v5s4dYilaXgyNg4rKMQ
 cxRGXy0efMeeAWY3ISlCzi1JsQz7uuYlbzSZuQODgRVKuPfwcmcKlvQQ0F6hxYDpKMV6
 Y0volz/ow43Zxb7wjFB0A9S8tmL/r0dj918YQVY/Al+LgFC3tTvTOsGK0ExGlYjSPlgv
 lKuA==
X-Gm-Message-State: AOAM530pXBPcMRJKeVo26BxsFJG8JyN72fZcGA5r+2ktikf8owt6WjE1
 r9wI+iYZ4x2WyF9l6+k+u31AfIhOlurdUg==
X-Google-Smtp-Source: ABdhPJxLNTXc+THKhNS4yaCFSiEOOreA27guebt4fiKnmD2lJKQa183sqmgXPs5zb5f4Vruh8swYCQ==
X-Received: by 2002:a17:90a:9312:: with SMTP id
 p18mr24271126pjo.171.1621222093141; 
 Sun, 16 May 2021 20:28:13 -0700 (PDT)
Received: from localhost (95.169.4.245.16clouds.com. [95.169.4.245])
 by smtp.gmail.com with ESMTPSA id js6sm12840372pjb.0.2021.05.16.20.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 20:28:12 -0700 (PDT)
From: George Liu <liuxiwei1013@gmail.com>
X-Google-Original-From: George Liu <liuxiwei@inspur.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH] Add dts file for NF5280M6
Date: Mon, 17 May 2021 11:27:56 +0800
Message-Id: <20210517032756.75523-1-liuxiwei@inspur.com>
X-Mailer: git-send-email 2.30.2
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
Cc: guoping@inspur.com, George Liu <liuxiwei@inspur.com>, banht@inspur.com,
 wangxinglong@inspur.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: George Liu <liuxiwei@inspur.com>
---
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/aspeed-bmc-inspur-nf5280m6.dts   | 752 ++++++++++++++++++
 2 files changed, 753 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 03b5424bafa8..cc2580f1e99b 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1405,6 +1405,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-ibm-rainier-4u.dtb \
 	aspeed-bmc-intel-s2600wf.dtb \
 	aspeed-bmc-inspur-fp5280g2.dtb \
+	aspeed-bmc-inspur-nf5280m6.dtb \
 	aspeed-bmc-lenovo-hr630.dtb \
 	aspeed-bmc-lenovo-hr855xg2.dtb \
 	aspeed-bmc-microsoft-olympus.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dts
new file mode 100644
index 000000000000..37cb0e232f61
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dts
@@ -0,0 +1,752 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2020 Inspur Corporation
+/dts-v1/;
+
+#include "aspeed-g5.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/i2c/i2c.h>
+#include <dt-bindings/leds/leds-pca955x.h>
+
+/ {
+	model = "NF5280M6 BMC";
+	compatible = "inspur,nf5280m6-bmc", "aspeed,ast2500";
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,115200 earlyprintk";
+	};
+
+	memory@80000000 {
+		reg = <0x80000000 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		vga_memory: framebuffer@9f000000 {
+			no-map;
+			reg = <0x9f000000 0x01000000>; /* 16M */
+		};
+
+		gfx_memory: framebuffer {
+           size = <0x01000000>;
+           alignment = <0x01000000>;
+           compatible = "shared-dma-pool";
+           reusable;
+		};
+
+		video_engine_memory: jpegbuffer {
+			size = <0x02000000>;	/* 32M */
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+
+		flash_memory: region@8c000000 {
+           no-map;
+           reg = <0x8c000000 0x04000000>; /* 64M */
+		};
+	};
+
+	leds {
+	    compatible = "gpio-leds";
+
+		bmc_alive {
+			label = "bmc_alive";
+			gpios = <&gpio ASPEED_GPIO(B, 0) GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "timer";
+			led-pattern = <1000 1000>;
+		};
+
+		front-fan {
+           label = "front-fan";
+           gpios = <&gpio ASPEED_GPIO(F,2) GPIO_ACTIVE_LOW>;
+		};
+	   
+	    front-psu {
+           label = "front-psu";
+           gpios = <&gpio ASPEED_GPIO(F,3) GPIO_ACTIVE_LOW>;
+		};
+	   
+	    front-syshot {
+			label = "front-syshot";
+			gpios = <&gpio ASPEED_GPIO(J, 3) GPIO_ACTIVE_LOW>;
+		};
+		
+		front-memory {
+			label = "front-memory";
+			gpios = <&gpio ASPEED_GPIO(S, 7) GPIO_ACTIVE_LOW>;
+		};
+		
+		identify {
+			label = "identify";
+			gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_LOW>;
+		};
+	};	   
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
+			<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
+			<&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
+			<&adc 12>, <&adc 13>, <&adc 14>, <&adc 15>;
+	};
+	
+	gpio-keys {
+		compatible = "gpio-keys";
+		id-button {
+			label = "id-button";
+			gpios = <&gpio ASPEED_GPIO(AA, 6) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(AA, 6)>;
+		};
+		
+		ps0-presence {
+			label = "ps0-presence";
+			gpios = <&gpio ASPEED_GPIO(F, 0) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(F, 0)>;
+		};
+
+		ps1-presence {
+			label = "ps1-presence";
+			gpios = <&gpio ASPEED_GPIO(F, 1) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(F, 1)>;
+		};
+	};
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+		spi-max-frequency = <50000000>;
+#include "openbmc-flash-layout.dtsi"
+	};
+};
+
+&spi1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bios";
+		spi-max-frequency = <100000000>;
+	};
+};
+
+&syscon {
+   uart-clock-high-speed;
+   status = "okay";
+};
+
+&uart1 {
+	status = "okay";
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
+	pinctrl-0 = <&pinctrl_rmii1_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
+		<&syscon ASPEED_CLK_MAC1RCLK>;
+	clock-names = "MACCLK", "RCLK";
+	use-ncsi;
+};
+
+&mac1 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
+};
+
+&gpio {
+	power_out {
+		gpios = <ASPEED_GPIO(AA, 7) GPIO_ACTIVE_LOW>;
+		output-low;
+	};
+};
+
+&gpio {
+	status = "okay";
+	/* Enable GPIOE0 and GPIOE2 pass-through by default */
+	pinctrl-names = "pass-through";
+	pinctrl-0 = <&pinctrl_gpie0_default
+			&pinctrl_gpie2_default>;
+	gpio-line-names =
+	/*A0-A7*/	"","MAC2LINK","BMC_RESET_CPLD","","BMC_SCL9","","MAC2MDC_R","",
+	/*B0-B7*/	"BMC_INIT_OK","FM_SKU_ID2","FM_SPD_DDRCPU_LVLSHFT_DIS_R_N",
+				"FM_CPU_MSMI_CATERR_LVT3_BMC_N","","FM_CPU0_PROCHOT_LVT3_N",
+				"FM_CPU_MEM_THERMTRIP_LVT3_N","BIOS_LOAD_DEFAULT_R_N",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"","BMC_SD2CMD","BMC_SD2DAT0","BMC_SD2DAT1","BMC_SD2DAT2",
+				"BMC_SD2DAT3","BMC_SD2DET","BMC_SD2WPT",
+	/*E0-E7*/	"FM_BOARD_ID0","FM_BOARD_ID1","FM_BOARD_ID2","FM_BOARD_ID3",
+				"FM_BOARD_ID4","FM_BOARD_ID5","","",
+	/*F0-F7*/	"PSU1_PRESENT_N","PSU2_PRESENT_N","FAN_FAULT_LED_N","PSU_FAULT_LED_N",
+				"BIOS_DEBUG_MODE_N","FP_LCD_RESET","FAN_TYPE_SEL","RST_GLB_RST_WARN_N",
+	/*G0-G7*/	"IRQ_LPTM21L_ALERT_N","IRQ_PLD_ALERT_N","AC_FAIL_N","FP_LCD_PRESENT_BMC",
+				"BMC_JTAG_TCK_MUX_SEL","BMC_BIOS_RESERVED","SYS_NMI_N","BMC_NMI_N",
+	/*H0-H7*/	"JTAG_BMC_TDI","JTAG_BMC_TDO","JTAG_BMC_TCK","JTAG_BMC_TMS","FM_BOARD_ID6",
+				"FM_SKU_ID0","IRQ_SML1_PMBUS_ALERT_N","IRQ_SML0_ALERT_MUX_N",
+	/*I0-I7*/	"FM_CPU_ERR0_LVT3_BMC_N","FM_CPU_ERR1_LVT3_BMC_N","FM_BMC_PCH_SCI_LPC_N",
+				"FM_SYS_THROTTLE_LVC3","SPI2_PCH_CS0_N","","","",
+	/*J0-J7*/	"FM_CPU0_SKTOCC_LVT3_N","FM_CPU1_SKTOCC_LVT3_N","","SYSHOT_FAULT_LED_N",
+				"VGA_HSYNC","VGA_VSYNC","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","SYS_UART_TXD1","SYS_UART_RXD1",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"","","","","","","","",
+	/*O0-O7*/	"","","","","","","","",
+	/*P0-P7*/	"","","","","","","","",
+	/*Q0-Q7*/	"","","","","","","FM_PCH_BMC_THERMTRIP_N","INTRUDER_N",
+	/*R0-R7*/	"SPI_BMC_BOOT_CS1_R_N","FM_CPU_MEMHOT_LVC3_N","DBP_CPU_PREQ_N",
+				"FM_CPU_ERR2_LVT3_BMC_N","RISER_NCSI_EN_N","","LOM_NCSI_EN_N","OCP_NCSI_EN_N",
+	/*S0-S7*/	"BMC_XDP_PRDY_N","SIO_POWER_GOOD","BMC_PWR_DEBUG_R_N","BMC_DEBUG_EN_R_N","",
+				"GPIOS5_BMC","","GPIOS7_BMC",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","BMC_DET_UID_N","BMC_JTAG_SEL","SIO_ONCONTROL","","","","",
+	/*Z0-Z7*/	"XDP_PRESENT_N","DBP_SYSPWROK","BMC_JTAG_SEL","FM_SMI_ACTIVE_N","","GPIOZ5","","",
+	/*AA0-AA7*/	"FP_BMC_SYSLED_N","PS_PWROK","RST_PLTRST_BMC_N","HDA_SDO_BMC","FM_SLPS4_R_N",
+				"","POWER_BUTTON","POWER_OUT",
+	/*AB0-AB7*/	"RESET_OUT","RESET_BUTTON","BIOS_REFLASH","POST_COMPLETE","","","","",
+	/*AC0-AC7*/	"","","","","","","","";
+};
+
+&i2c0 {
+	/* FP_LCD */
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+	
+	eeprom@50 {
+		compatible = "atmel,24c256";
+		reg = <0x50>;
+		label = "fru";
+	};
+};
+
+&i2c2 {
+	status = "okay";
+	
+	tmp112@48 {
+		compatible = "ti,tmp112";
+		reg = <0x48>;
+		label = "inlet";
+	};
+
+	tmp112@49 {
+		compatible = "ti,tmp112";
+		reg = <0x49>;
+		label = "outlet";
+	};
+	
+	pca9548@70 {
+		compatible = "nxp,pca9548";
+		reg = <0x70>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+	
+	pca9548@70 {
+		compatible = "nxp,pca9548";
+		reg = <0x70>;
+	};
+	
+	pca9548@71 {
+		compatible = "nxp,pca9548";
+		reg = <0x71>;
+	};
+	
+	pca9548@72 {
+		compatible = "nxp,pca9548";
+		reg = <0x72>;
+	};
+};
+
+&i2c4 {
+	/* IPMB */
+	status = "okay";
+};
+
+&i2c5 {
+	status = "okay";
+	
+	pca9548@70 {
+		compatible = "nxp,pca9548";
+		reg = <0x70>;
+	};
+};
+
+&i2c6 {
+	status = "okay";
+	
+	pca9548@70 {
+		compatible = "nxp,pca9548";
+		reg = <0x70>;
+	};
+};
+
+&i2c7 {
+	status = "okay";
+	
+	adm1278@33 {
+		compatible = "adi,adm1293";
+		reg = <0x33>;
+	};
+
+	adm1278@32 {
+		compatible = "adi,adm1293";
+		reg = <0x32>;
+	};
+
+	adm1278@20 {
+		compatible = "adi,adm1293";
+		reg = <0x20>;
+	};
+};
+
+&i2c8 {
+	status = "okay";
+	
+	pca0: pca9555@23 {
+		compatible = "nxp,pca9555";
+		reg = <0x23>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio@0 {
+			reg = <0>;
+            type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@1 {
+			reg = <1>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@2 {
+			reg = <2>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@3 {
+			reg = <3>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@4 {
+			reg = <4>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@5 {
+			reg = <5>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@6 {
+			reg = <6>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+	};
+
+	pca1: pca9555@22 {
+		compatible = "nxp,pca9555";
+		reg = <0x22>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio@0 {
+			reg = <0>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@1 {
+			reg = <1>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@2 {
+			reg = <2>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@3 {
+			reg = <3>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@4 {
+			reg = <4>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@5 {
+			reg = <5>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@6 {
+			reg = <6>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@7 {
+			reg = <7>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+	};
+	
+	pca2: pca9555@20 {
+		compatible = "nxp,pca9555";
+		reg = <0x20>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio@0 {
+			reg = <0>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@1 {
+			reg = <1>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@2 {
+			reg = <2>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@3 {
+			reg = <3>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@4 {
+			reg = <4>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@5 {
+			reg = <5>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@6 {
+			reg = <6>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@7 {
+			reg = <7>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+	};
+	
+	pca3: pca9555@21 {
+		compatible = "nxp,pca9555";
+		reg = <0x21>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio@0 {
+			reg = <0>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@1 {
+			reg = <1>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@2 {
+			reg = <2>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@3 {
+			reg = <3>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@4 {
+			reg = <4>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@5 {
+			reg = <5>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@6 {
+			reg = <6>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@7 {
+			reg = <7>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+	};
+};
+
+&i2c9 {
+	/* cpld */
+	status = "okay";
+};
+
+&i2c10 {
+	status = "okay";
+	
+	pca4: pca9555@24 {
+		compatible = "nxp,pca9555";
+		reg = <0x24>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio@0 {
+			reg = <0>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@1 {
+			reg = <1>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@2 {
+			reg = <2>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@3 {
+			reg = <3>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@4 {
+			reg = <4>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@5 {
+			reg = <5>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@6 {
+			reg = <6>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@7 {
+			reg = <7>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+	};
+
+	pca5: pca9555@25 {
+		compatible = "nxp,pca9555";
+		reg = <0x25>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio@0 {
+			reg = <0>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@1 {
+			reg = <1>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@2 {
+			reg = <2>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@3 {
+			reg = <3>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@4 {
+			reg = <4>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@5 {
+			reg = <5>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@6 {
+			reg = <6>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+	};
+};
+
+&i2c11 {
+	status = "okay";
+
+	power-supply@58 {
+		compatible = "inspur,ipsps1";
+		reg = <0x58>;
+	};
+
+	power-supply@59 {
+		compatible = "inspur,ipsps1";
+		reg = <0x59>;
+	};
+};
+
+&i2c12 {
+	status = "okay";
+};
+
+&i2c13 {
+	status = "okay";
+};
+
+&lpc_ctrl {
+   status = "okay";
+   memory-region = <&flash_memory>;
+   flash = <&spi1>;
+};
+
+&gfx {
+	status = "okay";
+	memory-region = <&gfx_memory>;
+};
+
+&pinctrl {
+	aspeed,external-nodes = <&gfx &lhc>;
+};
+
+&pwm_tacho {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
+		&pinctrl_pwm2_default &pinctrl_pwm3_default
+		&pinctrl_pwm4_default &pinctrl_pwm5_default
+		&pinctrl_pwm6_default &pinctrl_pwm7_default>;
+
+	fan@0 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x00 0x01>;
+	};
+
+	fan@1 {
+		reg = <0x01>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x02 0x03>;
+	};
+
+	fan@2 {
+		reg = <0x02>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x04 0x05>;
+	};
+
+	fan@3 {
+		reg = <0x03>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x06 0x07>;
+	};
+
+	fan@4 {
+		reg = <0x04>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x08 0x09>;
+	};
+
+	fan@5 {
+		reg = <0x05>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0a 0x0b>;
+	};
+
+	fan@6 {
+		reg = <0x06>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0c 0x0d>;
+	};
+
+	fan@7 {
+		reg = <0x07>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0e 0x0f>;
+	};
+};
+
+&kcs3 {
+   status = "okay";
+   kcs_addr = <0xca2>;
+};
+
+&kcs4 {
+   status = "okay";
+   kcs_addr = <0xca4>;
+};
+
+&peci0 {
+   status = "okay";
+};
+
+&adc {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
+	 &pinctrl_adc2_default &pinctrl_adc3_default &pinctrl_adc4_default
+	 &pinctrl_adc5_default &pinctrl_adc6_default &pinctrl_adc7_default
+	 &pinctrl_adc8_default &pinctrl_adc9_default &pinctrl_adc10_default
+	 &pinctrl_adc11_default &pinctrl_adc12_default &pinctrl_adc13_default
+	 &pinctrl_adc14_default &pinctrl_adc15_default>;
+};
+
+&vhub {
+   status = "okay";
+};
+
+&video {
+   status = "okay";
+   memory-region = <&video_engine_memory>;
+};
+
+&vuart {
+	status = "okay";
+};
-- 
2.30.2

