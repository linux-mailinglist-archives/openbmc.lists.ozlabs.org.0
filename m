Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A67A456EAB
	for <lists+openbmc@lfdr.de>; Fri, 19 Nov 2021 13:03:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hwb043Xrxz30Pj
	for <lists+openbmc@lfdr.de>; Fri, 19 Nov 2021 23:03:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=rKw8NSju;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=rKw8NSju; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwZyT3Kbbz2yw7
 for <openbmc@lists.ozlabs.org>; Fri, 19 Nov 2021 23:01:37 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 3C2A145DEB;
 Fri, 19 Nov 2021 12:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1637323290; x=1639137691; bh=IqemCNlRNrkn/RvNtM5nfvEehAS1VvbFCVf
 KtEQ85fg=; b=rKw8NSjuJlSsaH9yUBtfL4QF8mH7oXMCGgKHdGQ23xgcqsFyXUZ
 Z6oTJVI1DYzZO9PP+hkqyc0kP6ptjCt+J9ZUJPp0zVPUEUHQN80hjH0jfQZRE7Ss
 dxPaju044P70tH3n66nXMx5FWYJQaPAF40Saz9jSrNGDcKeCvQQe7P+M=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WbTRWGgZqmsM; Fri, 19 Nov 2021 15:01:30 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 6C31C460D7;
 Fri, 19 Nov 2021 15:01:27 +0300 (MSK)
Received: from nb-511.yadro.com (10.199.10.105) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 19
 Nov 2021 15:01:26 +0300
From: Andrei Kartashev <a.kartashev@yadro.com>
To: <joel@jms.id.au>, <andrew@aj.id.au>, <openbmc@lists.ozlabs.org>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v2 2/2] ARM: dts: aspeed: add device tree for YADRO VEGMAN BMC
Date: Fri, 19 Nov 2021 15:00:57 +0300
Message-ID: <20211119120057.12118-3-a.kartashev@yadro.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211119120057.12118-1-a.kartashev@yadro.com>
References: <20211119120057.12118-1-a.kartashev@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.199.10.105]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

YADRO VEGMAN is x86 based servers family with ASPEED AST2500-based BMC.
Currently there are three models:
* VEGMAN N110
* VEGMAN S220/320
* VEGMAN R120/220

The dts files provides configuration for BMC system.

Signed-off-by: Andrei Kartashev <a.kartashev@yadro.com>
---
 arch/arm/boot/dts/Makefile                   |   5 +-
 arch/arm/boot/dts/aspeed-bmc-vegman-n110.dts | 149 +++++++++
 arch/arm/boot/dts/aspeed-bmc-vegman-rx20.dts | 255 +++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-vegman-sx20.dts | 154 +++++++++
 arch/arm/boot/dts/aspeed-bmc-vegman.dtsi     | 311 +++++++++++++++++++
 5 files changed, 873 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-vegman-n110.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-vegman-rx20.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-vegman-sx20.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-vegman.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 0de64f237cd8..78b71e02624c 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1519,4 +1519,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-quanta-q71l.dtb \
 	aspeed-bmc-supermicro-x11spi.dtb \
 	aspeed-bmc-inventec-transformers.dtb \
-	aspeed-bmc-tyan-s7106.dtb
+	aspeed-bmc-tyan-s7106.dtb \
+	aspeed-bmc-vegman-n110.dtb \
+	aspeed-bmc-vegman-rx20.dtb \
+	aspeed-bmc-vegman-sx20.dtb
diff --git a/arch/arm/boot/dts/aspeed-bmc-vegman-n110.dts b/arch/arm/boot/dts/aspeed-bmc-vegman-n110.dts
new file mode 100644
index 000000000000..24319267d550
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-vegman-n110.dts
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (C) 2021 YADRO
+/dts-v1/;
+
+#include "aspeed-bmc-vegman.dtsi"
+
+/ {
+	model = "YADRO VEGMAN N110 BMC";
+	compatible = "yadro,vegman-n110-bmc", "aspeed,ast2500";
+};
+
+&gpio {
+	status = "okay";
+	gpio-line-names =
+	/*A0-A7*/	"CHASSIS_INTRUSION","CASE_OPEN_FAULT_RST","","","SPEAKER_BMC","FM_FORCE_BMC_UPDATE","","",
+	/*B0-B7*/	"","","","","","","","",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"","","","","","","","",
+	/*E0-E7*/	"RESET_BUTTON","RESET_OUT","POWER_BUTTON","POWER_OUT","","","","",
+	/*F0-F7*/	"NMI_OUT","PCIE_NIC_ALERT","","","SKT0_FAULT_LED","","RST_RGMII_PHYRST_DNP","",
+	/*G0-G7*/	"CPU_ERR2","CPU_CATERR","PCH_BMC_THERMTRIP","","IRQ_NMI_EVENT","","","",
+	/*H0-H7*/	"PWRGD_P3V3_RISER1","PWRGD_P3V3_RISER2","PWRGD_P3V3_RISER3","","MIO_BIOS_SEL","_SPI_FLASH_HOLD","_SPI_FLASH_WP","FM_240VA_STATUS",
+	/*I0-I7*/	"","","","","","","","",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"","","","","","","","",
+	/*O0-O7*/	"","","","","","","","_SPI2_BMC_CS_SEL",
+	/*P0-P7*/	"","","","","","","","",
+	/*Q0-Q7*/	"","","","","","","","",
+	/*R0-R7*/	"_SPI_RMM4_LITE_CS","","","","","","","",
+	/*S0-S7*/	"_SPI2_BMC_CS1","","","IRQ_SML0_ALERT_MUX","FP_LED_STATUS_GREEN","FP_LED_STATUS_AMBER","FP_ID_LED","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"SIO_S3","SIO_S5","","SIO_ONCONTROL","","","","",
+	/*Z0-Z7*/	"FM_BMC_PWR_BTN","SIO_POWER_GOOD","FM_BMC_PWRBTN_OUT","FM_BMC_PCH_SCI_LPC","","","","",
+	/*AA0-AA7*/	"","IRQ_SML1_PMBUS_ALERT","FM_PVCCIN_CPU0_PWR_IN_ALERT","FM_PVCCIN_CPU1_PWR_IN_ALERT","BMC_SYS_PWR_FAULT","BMC_SYS_PWR_OK","SMI","POST_COMPLETE",
+	/*AB0-AB7*/	"FM_CPU_BMCINIT","NMI_BUTTON","ID_BUTTON","PS_PWROK","","","","",
+	/*AC0-AC7*/	"","","","","","","","";
+};
+
+&sgpio {
+	ngpios = <80>;
+	bus-frequency = <2000000>;
+	status = "okay";
+	/* SGPIO lines. even: input, odd: output */
+	gpio-line-names =
+	/*A0-A7*/	"CPU1_PRESENCE","","CPU1_THERMTRIP","","CPU1_VRHOT","","CPU1_FIVR_FAULT","","CPU1_MEM_ABCD_VRHOT","","CPU1_MEM_EFGH_VRHOT","","","","","",
+	/*B0-B7*/	"CPU1_MISMATCH","","CPU1_MEM_THERM_EVENT","","CPU2_PRESENCE","","CPU2_THERMTRIP","","CPU2_VRHOT","","CPU2_FIVR_FAULT","","CPU2_MEM_ABCD_VRHOT","","CPU2_MEM_EFGH_VRHOT","",
+	/*C0-C7*/	"","","","","CPU2_MISMATCH","","CPU2_MEM_THERM_EVENT","","","","","","","","","",
+	/*D0-D7*/	"","","","","","","","","","","","","","","","",
+	/*E0-E7*/	"","","","","","","","","","","","","","","","",
+	/*F0-F7*/	"SGPIO_PLD_MINOR_REV_BIT0","","SGPIO_PLD_MINOR_REV_BIT1","","SGPIO_PLD_MINOR_REV_BIT2","","SGPIO_PLD_MINOR_REV_BIT3","","SGPIO_PLD_MAJOR_REV_BIT0","","SGPIO_PLD_MAJOR_REV_BIT1","","SGPIO_PLD_MAJOR_REV_BIT2","","SGPIO_PLD_MAJOR_REV_BIT3","",
+	/*G0-G7*/	"MAIN_PLD_MINOR_REV_BIT0","","MAIN_PLD_MINOR_REV_BIT1","","MAIN_PLD_MINOR_REV_BIT2","","MAIN_PLD_MINOR_REV_BIT3","","MAIN_PLD_MAJOR_REV_BIT0","","MAIN_PLD_MAJOR_REV_BIT1","","MAIN_PLD_MAJOR_REV_BIT2","","MAIN_PLD_MAJOR_REV_BIT3","",
+	/*H0-H7*/	"","","","","","","","","","","","","","","","",
+	/*I0-I7*/	"","","","","","","","","","","","","","","","",
+	/*J0-J7*/	"","","","","","","","","","","","","","","","";
+};
+
+&i2c11 {
+	/* SMB_BMC_MGMT_LVC3 */
+	gpio@21 {
+		compatible = "nxp,pcal9535";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+		/*IO0.0-0.7*/	"", "", "", "", "", "", "PE_PCH_SCR_CLKREQ", "",
+		/*IO1.0-1.7*/	"", "PE_PCH_MEZ_PRSNT", "PE_PCH_MEZ_PRSNT_", "NIC_4_PE_PRSNT", "NIC_3_PE_PRSNT", "NIC_2_PE_PRSNT", "NIC_1_PE_PRSNT", "";
+	};
+	gpio@27 {
+		compatible = "nxp,pca9698";
+		reg = <0x27>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+		/*IO0.0-0.7*/	"PWRGD_PS_PWROK", "PWRGD_DSW_PWROK", "PWRGD_P5V_AUX", "PWRGD_P3V3_AUX", "PWRGD_P5V", "PWRGD_P3V3", "PWRGD_P1V8_PCH_AUX", "PWRGD_PCH_PVNN_AUX",
+		/*IO1.0-1.7*/	"PWRGD_P1V05_PCH_AUX", "PWRGD_PCH_AUX_VRS", "PWRGD_PVCCIN_CPU0", "PWRGD_PVCCSA_CPU0", "PWRGD_PVCCIO_CPU0", "PWRGD_PVMCP_CPU0", "PWRGD_P1V0_CPU0", "PWRGD_PVDDQ_ABC_CPU0",
+		/*IO2.0-2.7*/	"PWRGD_PVPP_ABC_CPU0", "PWRGD_PVTT_ABC_CPU0", "PWRGD_PVDDQ_DEF_CPU0", "PWRGD_PVPP_DEF_CPU0", "PWRGD_PVTT_DEF_CPU0", "", "", "",
+		/*IO3.0-3.7*/	"", "", "", "", "", "", "", "",
+		/*IO4.0-4.7*/	"", "", "", "", "", "", "", "";
+	};
+};
+
+&i2c13 {
+	/* SMB_PCIE2_STBY_LVC3 */
+	mux-expa@73 {
+		compatible = "nxp,pca9545";
+		reg = <0x73>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+	};
+	mux-sata@71 {
+		compatible = "nxp,pca9543";
+		reg = <0x71>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+	};
+};
+
+&i2c2 {
+	/* SMB_PCIE_STBY_LVC3 */
+	mux-expb@71 {
+		compatible = "nxp,pca9545";
+		reg = <0x71>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+	};
+};
+
+&pwm_tacho {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
+			 &pinctrl_pwm2_default &pinctrl_pwm3_default
+			 &pinctrl_pwm4_default &pinctrl_pwm5_default>;
+
+	fan@0 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x00 0x06>;
+	};
+	fan@1 {
+		reg = <0x01>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x01 0x08>;
+	};
+	fan@2 {
+		reg = <0x02>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x02 0x09>;
+	};
+	fan@3 {
+		reg = <0x03>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x03 0x0A>;
+	};
+	fan@4 {
+		reg = <0x04>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x04 0x0B>;
+	};
+	fan@5 {
+		reg = <0x05>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x05>;
+	};
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-vegman-rx20.dts b/arch/arm/boot/dts/aspeed-bmc-vegman-rx20.dts
new file mode 100644
index 000000000000..ebbb68b55559
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-vegman-rx20.dts
@@ -0,0 +1,255 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (C) 2021 YADRO
+/dts-v1/;
+
+#include "aspeed-bmc-vegman.dtsi"
+
+/ {
+	model = "YADRO VEGMAN Rx20 BMC";
+	compatible = "yadro,vegman-rx20-bmc", "aspeed,ast2500";
+
+	leds {
+		compatible = "gpio-leds";
+
+		temp_alarm {
+			label = "temp:red:status";
+			default-state = "off";
+			gpios = <&gpio ASPEED_GPIO(E, 4) GPIO_ACTIVE_LOW>;
+		};
+
+		temp_ok {
+			label = "temp:green:status";
+			default-state = "off";
+			gpios = <&gpio ASPEED_GPIO(E, 5) GPIO_ACTIVE_LOW>;
+		};
+
+		psu_fault {
+			label = "psu:red:status";
+			default-state = "off";
+			gpios = <&gpio ASPEED_GPIO(E, 6) GPIO_ACTIVE_LOW>;
+		};
+
+		psu_ok {
+			label = "psu:green:status";
+			default-state = "off";
+			gpios = <&gpio ASPEED_GPIO(E, 7) GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&gpio {
+	status = "okay";
+	gpio-line-names =
+	/*A0-A7*/	"CASE_OPEN_DNP","CASE_OPEN_FAULT_RST_DNP","BEZEL_ON_PWR_P3V3","PWM_PWRGD_EXP_EN","SPEAKER_BMC","FM_FORCE_BMC_UPDATE","","",
+	/*B0-B7*/	"","","","","","","","",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"","","","","","","","",
+	/*E0-E7*/	"RESET_BUTTON","RESET_OUT","POWER_BUTTON","POWER_OUT","LED_TEMP_STATUS_R","LED_TEMP_STATUS_G","LED_PWR_STATUS_R","LED_PWR_STATUS_G",
+	/*F0-F7*/	"NMI_OUT","CPU1_DISABLE_COD","","","SKT0_FAULT_LED_DNP","SKT1_FAULT_LED_DNP","RST_RGMII_PHYRST_DNP","",
+	/*G0-G7*/	"CPU_ERR2","CPU_CATERR","PCH_BMC_THERMTRIP","SPI_BMC_BOOT_HD","IRQ_NMI_EVENT","SPI_BMC_BOOT_WP","SPI_BMC_BOOT_WP1","",
+	/*H0-H7*/	"PWRGD_P3V3_RISER1","PWRGD_P3V3_RISER2","PWRGD_P3V3_RISER3","","MIO_BIOS_SEL","_SPI_FLASH_HOLD","_SPI_FLASH_WP","FM_240VA_STATUS",
+	/*I0-I7*/	"","","","","","","","",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"SEL_FLASH_SOFT","STATUS_SEL_BMC","","","BMC_WDT_P","ID_BUTTON","PS_PWROK","",
+	/*N0-N7*/	"","","","","","","","",
+	/*O0-O7*/	"","","","","","","","",
+	/*P0-P7*/	"","","","","","","SPI_BIOS_ACTIVE_FLASH_SEL","STATUS_SEL_BIOS",
+	/*Q0-Q7*/	"","","","","","","","",
+	/*R0-R7*/	"_SPI_BMC_BOOT_CS1","","","","","","","",
+	/*S0-S7*/	"_SPI2_BMC_CS1","RSR_A_SMBEXP_RST_INT","RSR_B_SMBEXP_RST_INT","IRQ_SML0_ALERT_MUX","FP_LED_STATUS_GREEN","FP_LED_STATUS_AMBER","FP_ID_LED","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"SIO_S3","SIO_S5","","SIO_ONCONTROL","","","","",
+	/*Z0-Z7*/	"FM_BMC_PWR_BTN","SIO_POWER_GOOD","FM_BMC_PWRBTN_OUT","FM_BMC_PCH_SCI_LPC","","","","",
+	/*AA0-AA7*/	"CPU_CLK_MUX_SEL","IRQ_SML1_PMBUS_ALERT","FM_PVCCIN_CPU0_PWR_IN_ALERT","FM_PVCCIN_CPU1_PWR_IN_ALERT","BMC_SYS_PWR_FAULT","BMC_SYS_PWR_OK","SMI","POST_COMPLETE",
+	/*AB0-AB7*/	"FM_CPU_BMCINIT","NMI_BUTTON","BMC_WDT_RST1","BMC_WDT_RST2","","","","",
+	/*AC0-AC7*/	"","","","","","","","";
+};
+
+&sgpio {
+	ngpios = <80>;
+	bus-frequency = <2000000>;
+	status = "okay";
+	/* SGPIO lines. even: input, odd: output */
+	gpio-line-names =
+	/*A0-A7*/	"CPU1_PRESENCE","","CPU1_THERMTRIP","","CPU1_VRHOT","","CPU1_FIVR_FAULT","","CPU1_MEM_ABCD_VRHOT","","CPU1_MEM_EFGH_VRHOT","","","","","",
+	/*B0-B7*/	"CPU1_MISMATCH","","CPU1_MEM_THERM_EVENT","","CPU2_PRESENCE","","CPU2_THERMTRIP","","CPU2_VRHOT","","CPU2_FIVR_FAULT","","CPU2_MEM_ABCD_VRHOT","","CPU2_MEM_EFGH_VRHOT","",
+	/*C0-C7*/	"","","","","CPU2_MISMATCH","","CPU2_MEM_THERM_EVENT","","","","","","","","","",
+	/*D0-D7*/	"","","","","","","","","","","","","","","","",
+	/*E0-E7*/	"","","","","","","","","","","","","","","","",
+	/*F0-F7*/	"SGPIO_PLD_MINOR_REV_BIT0","","SGPIO_PLD_MINOR_REV_BIT1","","SGPIO_PLD_MINOR_REV_BIT2","","SGPIO_PLD_MINOR_REV_BIT3","","SGPIO_PLD_MAJOR_REV_BIT0","","SGPIO_PLD_MAJOR_REV_BIT1","","SGPIO_PLD_MAJOR_REV_BIT2","","SGPIO_PLD_MAJOR_REV_BIT3","",
+	/*G0-G7*/	"MAIN_PLD_MINOR_REV_BIT0","","MAIN_PLD_MINOR_REV_BIT1","","MAIN_PLD_MINOR_REV_BIT2","","MAIN_PLD_MINOR_REV_BIT3","","MAIN_PLD_MAJOR_REV_BIT0","","MAIN_PLD_MAJOR_REV_BIT1","","MAIN_PLD_MAJOR_REV_BIT2","","MAIN_PLD_MAJOR_REV_BIT3","",
+	/*H0-H7*/	"","","","","","","","","","","","","","","","",
+	/*I0-I7*/	"","","","","","","","","","","","","","","","",
+	/*J0-J7*/	"","","","","","","","","","","","","","","","";
+};
+
+&i2c11 {
+	/* SMB_BMC_MGMT_LVC3 */
+	gpio@21 {
+		compatible = "nxp,pcal9535";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+		/*IO0.0-0.7*/	"ETH3_CLK_REQ", "ETH2_CLK_REQ", "RSR_A_PCIE_X16_2_PRSNT", "RSR_B_PCIE_X16_2_PRSNT", "", "RSR_B_PCIE_X8_3_PRSNT", "RSR_B_PCIE_X8_4_PRSNT", "RSR_B_PCIE_X16_PRSNT_N",
+		/*IO1.0-1.7*/	"RSR_B_PCIE_X8_2_PRSNT", "RSR_B_PCIE_X8_1_PRSNT", "NIC_1_PE_BUF_PRSNT", "RSR_A_PCIE_X16_PRSNT", "RSR_A_PCIE_X8_3_PRSNT", "RSR_A_PCIE_X8_2_PRSNT", "RSR_A_PCIE_X8_1_PRSNT_N", "";
+	};
+	gpio@23 {
+		compatible = "nxp,pcal9535";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+		/*IO0.0-0.7*/	"FM_LINK_WIDTH_ID0", "FM_LINK_WIDTH_ID0", "FM_LINK_WIDTH_ID0", "FM_LINK_WIDTH_ID0", "FM_LINK_WIDTH_ID0", "", "", "",
+		/*IO1.0-1.7*/	"", "", "", "", "", "", "", "";
+	};
+	gpio@27 {
+		compatible = "nxp,pca9698";
+		reg = <0x27>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+		/*IO0.0-0.7*/	"PWRGD_PS_PWROK", "PWRGD_DSW_PWROK", "PWRGD_P5V_AUX", "PWRGD_P3V3_AUX", "PWRGD_P5V", "PWRGD_P3V3", "PWRGD_P1V8_PCH_AUX", "PWRGD_PCH_PVNN_AUX",
+		/*IO1.0-1.7*/	"PWRGD_P1V05_PCH_AUX", "PWRGD_PCH_AUX_VRS", "PWRGD_PVCCIN_CPU0", "PWRGD_PVCCSA_CPU0", "PWRGD_PVCCIO_CPU0", "PWRGD_PVMCP_CPU0", "PWRGD_P1V0_CPU0", "PWRGD_PVDDQ_ABC_CPU0",
+		/*IO2.0-2.7*/	"PWRGD_PVPP_ABC_CPU0", "PWRGD_PVTT_ABC_CPU0", "PWRGD_PVDDQ_DEF_CPU0", "PWRGD_PVPP_DEF_CPU0", "PWRGD_PVTT_DEF_CPU0", "PWRGD_PVCCIN_CPU1", "PWRGD_PVCCSA_CPU1", "PWRGD_PVCCIO_CPU1",
+		/*IO3.0-3.7*/	"PWRGD_PVMCP_CPU1", "PWRGD_P1V0_CPU1", "PWRGD_PVDDQ_GHJ_CPU1", "PWRGD_PVPP_GHJ_CPU1", "PWRGD_PVTT_GHJ_CPU1", "PWRGD_PVDDQ_KLM_CPU1", "PWRGD_PVPP_KLM_CPU1", "PWRGD_PVTT_KLM_CPU1",
+		/*IO4.0-4.7*/	"PCH_PWR_RESET_N", "FM_BOARD_SKU_ID0", "FM_BOARD_SKU_ID1", "FM_BOARD_SKU_ID2", "FM_BOARD_SKU_ID3", "FM_BOARD_SKU_ID4", "FM_BOARD_REV_ID0", "FM_BOARD_REV_ID1";
+	};
+	gpio@39 {
+		compatible = "nxp,pca9554";
+		reg = <0x39>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+		/*IO0.0-0.7*/	"FAN_FAULT_0", "FAN_FAULT_1", "FAN_FAULT_2", "FAN_FAULT_3", "FAN_FAULT_4", "FAN_FAULT_5", "FAN_FAULT_6", "";
+	};
+};
+
+&i2c13 {
+	/* SMB_PCIE2_STBY_LVC3 */
+	mux-expa@70 {
+		compatible = "nxp,pca9548";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+			rsra-mux@72 {
+				compatible = "nxp,pca9548";
+				reg = <0x72>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+					at24@50 {
+						compatible = "atmel,24c64";
+						reg = <0x50>;
+						pagesize = <32>;
+						size = <8192>;
+						address-width = <16>;
+					};
+				};
+			};
+		};
+	};
+	mux-sata@71 {
+		compatible = "nxp,pca9543";
+		reg = <0x71>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+	};
+};
+
+&i2c2 {
+	/* SMB_PCIE_STBY_LVC3 */
+	mux-expb@71 {
+		compatible = "nxp,pca9548";
+		reg = <0x71>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			rsrb-mux@72 {
+				compatible = "nxp,pca9548";
+				reg = <0x72>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+					at24@50 {
+						compatible = "atmel,24c64";
+						reg = <0x50>;
+						pagesize = <32>;
+						size = <8192>;
+						address-width = <16>;
+					};
+				};
+			};
+			at24@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+				pagesize = <32>;
+				size = <8192>;
+				address-width = <16>;
+			};
+		};
+	};
+};
+
+&pwm_tacho {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
+			 &pinctrl_pwm2_default &pinctrl_pwm3_default
+			 &pinctrl_pwm4_default &pinctrl_pwm5_default
+			 &pinctrl_pwm6_default>;
+
+	fan@0 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x00 0x07>;
+	};
+	fan@1 {
+		reg = <0x01>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x01 0x08>;
+	};
+	fan@2 {
+		reg = <0x02>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x02 0x09>;
+	};
+	fan@3 {
+		reg = <0x03>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x03 0x0A>;
+	};
+	fan@4 {
+		reg = <0x04>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x04 0x0B>;
+	};
+	fan@5 {
+		reg = <0x05>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x05 0x0C>;
+	};
+	fan@6 {
+		reg = <0x06>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x06 0x0D>;
+	};
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-vegman-sx20.dts b/arch/arm/boot/dts/aspeed-bmc-vegman-sx20.dts
new file mode 100644
index 000000000000..e36ee4704994
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-vegman-sx20.dts
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (C) 2021 YADRO
+/dts-v1/;
+
+#include "aspeed-bmc-vegman.dtsi"
+
+/ {
+	model = "YADRO VEGMAN Sx20 BMC";
+	compatible = "yadro,vegman-sx20-bmc", "aspeed,ast2500";
+};
+
+&gpio {
+	status = "okay";
+	gpio-line-names =
+	/*A0-A7*/	"CHASSIS_INTRUSION","CASE_OPEN_FAULT_RST","","","SPEAKER_BMC","FM_FORCE_BMC_UPDATE","","",
+	/*B0-B7*/	"","","","","","","","",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"","","","","","","","",
+	/*E0-E7*/	"RESET_BUTTON","RESET_OUT","POWER_BUTTON","POWER_OUT","","","","",
+	/*F0-F7*/	"NMI_OUT","CPU1_DISABLE_COD","","","SKT0_FAULT_LED","SKT1_FAULT_LED","RST_RGMII_PHYRST_DNP","",
+	/*G0-G7*/	"CPU_ERR2","CPU_CATERR","PCH_BMC_THERMTRIP","","IRQ_NMI_EVENT","","","",
+	/*H0-H7*/	"PWRGD_P3V3_RISER1","PWRGD_P3V3_RISER2","PWRGD_P3V3_RISER3","","MIO_BIOS_SEL","_SPI_FLASH_HOLD","_SPI_FLASH_WP","FM_240VA_STATUS",
+	/*I0-I7*/	"","","","","","","","",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","BMC_GPU_RISER_ID1","BMC_GPU_RISER_ID0","","",
+	/*N0-N7*/	"","","","","","","","",
+	/*O0-O7*/	"","","","","","","","_SPI2_BMC_CS_SEL",
+	/*P0-P7*/	"","P12V_HDDS_A_EN","P12V_HDDS_B_EN","P5V_HDDS_A_EN","PWRGD_P5V_HDDS_A","P5V_HDDS_B_EN","PWRGD_P5V_HDDS_B","",
+	/*Q0-Q7*/	"","","","","","","","",
+	/*R0-R7*/	"_SPI_RMM4_LITE_CS","","","","","","","",
+	/*S0-S7*/	"_SPI2_BMC_CS1","","","IRQ_SML0_ALERT_MUX","FP_LED_STATUS_GREEN","FP_LED_STATUS_AMBER","FP_ID_LED","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"SIO_S3","SIO_S5","","SIO_ONCONTROL","","","","",
+	/*Z0-Z7*/	"FM_BMC_PWR_BTN","SIO_POWER_GOOD","FM_BMC_PWRBTN_OUT","FM_BMC_PCH_SCI_LPC","","","","",
+	/*AA0-AA7*/	"CPU_CLK_MUX_SEL","IRQ_SML1_PMBUS_ALERT","FM_PVCCIN_CPU0_PWR_IN_ALERT","FM_PVCCIN_CPU1_PWR_IN_ALERT","BMC_SYS_PWR_FAULT","BMC_SYS_PWR_OK","SMI","POST_COMPLETE",
+	/*AB0-AB7*/	"FM_CPU_BMCINIT","NMI_BUTTON","ID_BUTTON","PS_PWROK","","","","",
+	/*AC0-AC7*/	"","","","","","","","";
+};
+
+&sgpio {
+	ngpios = <80>;
+	bus-frequency = <2000000>;
+	status = "okay";
+	/* SGPIO lines. even: input, odd: output */
+	gpio-line-names =
+	/*A0-A7*/	"CPU1_PRESENCE","","CPU1_THERMTRIP","","CPU1_VRHOT","","CPU1_FIVR_FAULT","","CPU1_MEM_ABCD_VRHOT","","CPU1_MEM_EFGH_VRHOT","","","","","",
+	/*B0-B7*/	"CPU1_MISMATCH","","CPU1_MEM_THERM_EVENT","","CPU2_PRESENCE","","CPU2_THERMTRIP","","CPU2_VRHOT","","CPU2_FIVR_FAULT","","CPU2_MEM_ABCD_VRHOT","","CPU2_MEM_EFGH_VRHOT","",
+	/*C0-C7*/	"","","","","CPU2_MISMATCH","","CPU2_MEM_THERM_EVENT","","","","","","","","","",
+	/*D0-D7*/	"","","","","","","","","","","","","","","","",
+	/*E0-E7*/	"","","","","","","","","","","","","","","","",
+	/*F0-F7*/	"SGPIO_PLD_MINOR_REV_BIT0","","SGPIO_PLD_MINOR_REV_BIT1","","SGPIO_PLD_MINOR_REV_BIT2","","SGPIO_PLD_MINOR_REV_BIT3","","SGPIO_PLD_MAJOR_REV_BIT0","","SGPIO_PLD_MAJOR_REV_BIT1","","SGPIO_PLD_MAJOR_REV_BIT2","","SGPIO_PLD_MAJOR_REV_BIT3","",
+	/*G0-G7*/	"MAIN_PLD_MINOR_REV_BIT0","","MAIN_PLD_MINOR_REV_BIT1","","MAIN_PLD_MINOR_REV_BIT2","","MAIN_PLD_MINOR_REV_BIT3","","MAIN_PLD_MAJOR_REV_BIT0","","MAIN_PLD_MAJOR_REV_BIT1","","MAIN_PLD_MAJOR_REV_BIT2","","MAIN_PLD_MAJOR_REV_BIT3","",
+	/*H0-H7*/	"","","","","","","","","","","","","","","","",
+	/*I0-I7*/	"","","","","","","","","","","","","","","","",
+	/*J0-J7*/	"","","","","","","","","","","","","","","","";
+};
+
+&i2c11 {
+	/* SMB_BMC_MGMT_LVC3 */
+	gpio@21 {
+		compatible = "nxp,pcal9535";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+		/*IO0.0-0.7*/	"", "", "CPU1_PE3_0_SLOT_PRSNT", "", "CPU1_PE1_GPU_PRSNT", "CPU1_PE3_1_SLOT_PRSNT", "PE_PCH_MEZ_PRSNT", "CPU0_PE3_1_SLOT_PRSNT",
+		/*IO1.0-1.7*/	"CPU0_PE1_GPU_PRSNT", "CPU0_PE2_NVME2_PRSNT", "CPU1_PE2_NVME3_PRSNT", "CPU1_PE2_SLOT_PRSNT", "CPU1_PE2_NVME4_PRSNT", "", "CPU0_PE2_NVME1_PRSNT", "CPU0_PE3_0_RAID_PRSNT";
+	};
+	gpio@27 {
+		compatible = "nxp,pca9698";
+		reg = <0x27>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+		/*IO0.0-0.7*/	"PWRGD_PS_PWROK", "PWRGD_DSW_PWROK", "PWRGD_P5V_AUX", "PWRGD_P3V3_AUX", "PWRGD_P5V", "PWRGD_P3V3", "PWRGD_P1V8_PCH_AUX", "PWRGD_PCH_PVNN_AUX",
+		/*IO1.0-1.7*/	"PWRGD_P1V05_PCH_AUX", "PWRGD_PCH_AUX_VRS", "PWRGD_PVCCIN_CPU0", "PWRGD_PVCCSA_CPU0", "PWRGD_PVCCIO_CPU0", "PWRGD_PVMCP_CPU0", "PWRGD_P1V0_CPU0", "PWRGD_PVDDQ_ABC_CPU0",
+		/*IO2.0-2.7*/	"PWRGD_PVPP_ABC_CPU0", "PWRGD_PVTT_ABC_CPU0", "PWRGD_PVDDQ_DEF_CPU0", "PWRGD_PVPP_DEF_CPU0", "PWRGD_PVTT_DEF_CPU0", "PWRGD_PVCCIN_CPU1", "PWRGD_PVCCSA_CPU1", "PWRGD_PVCCIO_CPU1",
+		/*IO3.0-3.7*/	"PWRGD_PVMCP_CPU1", "PWRGD_P1V0_CPU1", "PWRGD_PVDDQ_GHJ_CPU1", "PWRGD_PVPP_GHJ_CPU1", "PWRGD_PVTT_GHJ_CPU1", "PWRGD_PVDDQ_KLM_CPU1", "PWRGD_PVPP_KLM_CPU1", "PWRGD_PVTT_KLM_CPU1",
+		/*IO4.0-4.7*/	"PWRGD_P5V_HDDS_A_R", "PWRGD_P5V_HDDS_B_R", "", "", "", "", "", "";
+	};
+};
+
+&i2c13 {
+	/* SMB_PCIE2_STBY_LVC3 */
+	mux-expa@73 {
+		compatible = "nxp,pca9545";
+		reg = <0x73>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+	};
+	mux-sata@71 {
+		compatible = "nxp,pca9543";
+		reg = <0x71>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+	};
+};
+
+&i2c2 {
+	/* SMB_PCIE_STBY_LVC3 */
+	mux-expb@71 {
+		compatible = "nxp,pca9545";
+		reg = <0x71>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+	};
+};
+
+&pwm_tacho {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
+			 &pinctrl_pwm2_default &pinctrl_pwm3_default
+			 &pinctrl_pwm4_default &pinctrl_pwm5_default
+			 &pinctrl_pwm6_default>;
+
+	fan@0 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
+	};
+	fan@1 {
+		reg = <0x01>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x01>;
+	};
+	fan@2 {
+		reg = <0x02>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x02>;
+	};
+	fan@3 {
+		reg = <0x03>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x03>;
+	};
+	fan@4 {
+		reg = <0x04>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x04>;
+	};
+	fan@5 {
+		reg = <0x05>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x05>;
+	};
+	fan@6 {
+		reg = <0x06>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x06>;
+	};
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-vegman.dtsi b/arch/arm/boot/dts/aspeed-bmc-vegman.dtsi
new file mode 100644
index 000000000000..1a5b25b2ea29
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-vegman.dtsi
@@ -0,0 +1,311 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (C) 2021 YADRO
+
+#include "aspeed-g5.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	aliases {
+		serial4 = &uart5;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,115200 earlyprintk";
+	};
+
+	memory@80000000 {
+		reg = <0x80000000 0x20000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		video_engine_memory: jpegbuffer {
+			size = <0x02000000>;	/* 32M */
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+
+		ramoops@9eff0000{
+			compatible = "ramoops";
+			reg = <0x9eff0000 0x10000>;
+			record-size = <0x2000>;
+			console-size = <0x2000>;
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
+	leds {
+		compatible = "gpio-leds";
+
+		identify {
+			label = "platform:blue:indicator";
+			linux,default-trigger = "heartbeat";
+			gpios = <&gpio ASPEED_GPIO(S, 6) GPIO_ACTIVE_LOW>;
+		};
+
+		status_amber {
+			label = "platform:red:status";
+			default-state = "off";
+			gpios = <&gpio ASPEED_GPIO(S, 5) GPIO_ACTIVE_LOW>;
+		};
+
+		status_green {
+			label = "platform:green:status";
+			default-state = "off";
+			gpios = <&gpio ASPEED_GPIO(S, 4) GPIO_ACTIVE_LOW>;
+		};
+
+		power_fault {
+			label = "platform:red:power";
+			default-state = "off";
+			gpios = <&gpio ASPEED_GPIO(AA, 4) GPIO_ACTIVE_LOW>;
+		};
+
+		power_ok {
+			label = "platform:green:power";
+			default-state = "off";
+			gpios = <&gpio ASPEED_GPIO(AA, 5) GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	beeper {
+		compatible = "pwm-beeper";
+		pwms = <&timer 5 1000000 0>;
+	};
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		label = "bmc";
+		m25p,fast-read;
+#include "openbmc-flash-layout-64.dtsi"
+	};
+};
+
+&spi2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi2ck_default
+			&pinctrl_spi2miso_default
+			&pinctrl_spi2mosi_default
+			&pinctrl_spi2cs0_default>;
+	flash@0 {
+		status = "okay";
+		label = "bios";
+		m25p,fast-read;
+	};
+};
+
+&mac0 {
+	status = "okay";
+	use-ncsi;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii1_default>;
+};
+
+&mac1 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
+
+	phy-mode = "rgmii";
+	phy-handle = <&phy>;
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy: ethernet-phy@1 {
+			/* KSZ9131 */
+			compatible = "ethernet-phy-id0022.1640";
+			reg = <1>;
+
+			micrel,led-mode = <0>;
+		};
+	};
+};
+
+&vhub {
+	status = "okay";
+};
+
+&adc {
+	status = "okay";
+};
+
+&video {
+	status = "okay";
+	memory-region = <&video_engine_memory>;
+};
+
+&sdmmc {
+	status = "okay";
+};
+
+&sdhci1 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sd2_default>;
+	disable-wp;
+};
+
+&timer {
+	fttmr010,pwm-outputs = <5>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_timer5_default>;
+	#pwm-cells = <3>;
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
+&uart5 {
+	status = "okay";
+};
+
+&vuart {
+	status = "okay";
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
+&uart_routing {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <>;
+};
+
+&uart3 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <>;
+};
+
+&uart4 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <>;
+};
+
+&i2c0 {
+	/* SMB_IPMB_STBY_LVC3 */
+	multi-master;
+	status = "okay";
+};
+
+&i2c1 {
+	/* SMB_CHASSENSOR_STBY_LVC3 */
+	status = "okay";
+};
+
+&i2c2 {
+	/* SMB_PCIE_STBY_LVC3 */
+	status = "okay";
+};
+
+&i2c3 {
+	/* SMB_HOST_STBY_LVC3 */
+	multi-master;
+	status = "okay";
+};
+
+&i2c4 {
+	/* BMC_PMBUS2_STBY */
+	status = "okay";
+};
+
+&i2c5 {
+	/* SMB_SMLINK0_STBY_LVC3 */
+	bus-frequency = <1000000>;
+	multi-master;
+	status = "okay";
+};
+
+&i2c6 {
+	/* SMB_TEMPSENSOR_STBY_LVC3 */
+	multi-master;
+	status = "okay";
+};
+
+&i2c7 {
+	/* SMB_SM_PMB1_SML1_STBY_LVC3 */
+	multi-master;
+	status = "okay";
+};
+
+&i2c9 {
+	/* SMB_BMC_ETH3_LVC3 */
+	status = "okay";
+};
+
+&i2c10 {
+	/* SMB_BMC_ETH2_LVC3 */
+	status = "okay";
+};
+
+&i2c11 {
+	/* SMB_BMC_MGMT_LVC3 */
+	status = "okay";
+
+	at24@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+		pagesize = <32>;
+		size = <8192>;
+		address-width = <16>;
+	};
+};
+
+&i2c12 {
+	/* SMB_BMC_FAULT_EXP_LVC3 */
+	status = "okay";
+};
+
+&i2c13 {
+	/* SMB_PCIE2_STBY_LVC3 */
+	status = "okay";
+};
-- 
2.32.0

