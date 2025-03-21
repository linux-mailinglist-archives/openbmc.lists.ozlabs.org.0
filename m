Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64309A6BFED
	for <lists+openbmc@lfdr.de>; Fri, 21 Mar 2025 17:32:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZK7JD4TCqz3093
	for <lists+openbmc@lfdr.de>; Sat, 22 Mar 2025 03:31:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742574708;
	cv=none; b=Oja71czeChQgo28qSxkZ+WvMl2t2jVX1Bf/nTCJJzFxqclBVBNfGmxAEqcmThh/H3rZ1tw0PZIROIopwj1alirjZinzuDBsbNtZHG5fbALzFMx659e6MQuqDXFIL0nVgRYSRaXv9D75jaPiAL0dZE5RKliP7+I1MbF4VH/jiNdxjV9rSFWRLwBdROaUHrNSXGRk6HHsWnfU4Gg2f7bLxb4/XrOF5usy2pcwXSIU3nQWreBcs/Xx/miZbEhVV+T+Ddr99AgkjY18rXqtG3yQonDbGHneB0H/ZdrBNwc+zak/4KDmSOEQa3JXPmTRgu7wsIk20Dp1de6UjhM6PIPzWTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742574708; c=relaxed/relaxed;
	bh=MCAIRL4LQ3z3IvUnY3IrB0FeXfBfRP7veFYHs/WMWFw=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=F0ntrPmfrRwDsqhTOLTv3QV9feEEWA9ie2dp2Qpvg3Y9/CRuazHNKXm+ehJc32cxu4j6vQvs2JATCOKnaWNP79lQrxG0h4RRJaJyCcw2PmA9JHJUlfcCmvJf6rPDcIrYDk152PGuqhx/lUV6R8yabRf1CQJh2c+ACcEnk/U9AGVaXuGSoCI6nRwntmFaxcGXiDuhMG6AXObSXX5px2chGywhUyi98Ls0Cmr3xmF1BCc8o2mby7jZjscarCo0xsTIyFd7x2NndKTI0KGlka/4xdmDqywaCWw9G/3iLmdNoMJQsexfP1JkyhbGSAzP8MUMDeeIa/EDcEK07TriKMDqKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=EnkjWf8B; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=EnkjWf8B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 118 seconds by postgrey-1.37 at boromir; Sat, 22 Mar 2025 03:31:44 AEDT
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZK7J05gVnz303B
	for <openbmc@lists.ozlabs.org>; Sat, 22 Mar 2025 03:31:44 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id D38258287F15
	for <openbmc@lists.ozlabs.org>; Fri, 21 Mar 2025 11:31:42 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 8c4ApE1PaWLY for <openbmc@lists.ozlabs.org>;
	Fri, 21 Mar 2025 11:31:34 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 88A7D82881B9
	for <openbmc@lists.ozlabs.org>; Fri, 21 Mar 2025 11:31:34 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 88A7D82881B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1742574694; bh=MCAIRL4LQ3z3IvUnY3IrB0FeXfBfRP7veFYHs/WMWFw=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=EnkjWf8Bd+hV1nufyNuc9TyaGNlAcB7fb+ShpTXZZObPG2VoW7vifJF5Pg9Y4zgmj
	 w433UP+GV7hELKKoWObcnOVFaO+v0pv/ZxEtDDrF4toepF79BtCWlVnyoVuWLkWLv9
	 CtnMXnLw58pT/iz9524ZnnH3rNN7TsGksH2LQ3gc=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 3T-QCouiG_Ic for <openbmc@lists.ozlabs.org>;
	Fri, 21 Mar 2025 11:31:34 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 3A3878287F15
	for <openbmc@lists.ozlabs.org>; Fri, 21 Mar 2025 11:31:34 -0500 (CDT)
Date: Fri, 21 Mar 2025 11:31:34 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc <openbmc@lists.ozlabs.org>
Message-ID: <153524654.19587858.1742574694008.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 4/4] Add SIE Cronos platform
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC134 (Linux)/8.5.0_GA_3042)
Thread-Index: TLNBwrRCsbwsYfkaqfrQYVcZvfh5gw==
Thread-Topic: Add SIE Cronos platform
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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

Cronos is an internal OpenBMC-based management card for SIE systems

Signed-off-by: Jason Gomes <jason.gomes@sony.com>
Signed-off-by: Georgy Yakovlev <georgy.yakovlev@sony.com>
Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 arch/arm/dts/Makefile                  |    1 +
 arch/arm/dts/ast2600-sie-cronos-v1.dts |  249 ++++
 arch/arm/mach-aspeed/ast2600/Kconfig   |    7 +
 board/sie/sie_cronos/Kconfig           |   17 +
 board/sie/sie_cronos/Makefile          |    2 +
 board/sie/sie_cronos/cronos.c          | 1478 +++++++++++++++++++++++
 board/sie/sie_cronos/fru_eeprom.c      |  163 +++
 board/sie/sie_cronos/fru_eeprom.h      |    5 +
 board/sie/sie_cronos/i2c.c             |  231 ++++
 configs/sie_cronos_openbmc_defconfig   | 1495 ++++++++++++++++++++++++
 include/configs/sie_cronos.h           |   27 +
 11 files changed, 3675 insertions(+)
 create mode 100644 arch/arm/dts/ast2600-sie-cronos-v1.dts
 create mode 100644 board/sie/sie_cronos/Kconfig
 create mode 100644 board/sie/sie_cronos/Makefile
 create mode 100644 board/sie/sie_cronos/cronos.c
 create mode 100644 board/sie/sie_cronos/fru_eeprom.c
 create mode 100644 board/sie/sie_cronos/fru_eeprom.h
 create mode 100644 board/sie/sie_cronos/i2c.c
 create mode 100755 configs/sie_cronos_openbmc_defconfig
 create mode 100644 include/configs/sie_cronos.h

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 13374bb12a3..e98910c6b09 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -696,6 +696,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2600-pfr.dtb \
 	ast2600-qcom-dc-scm-v1.dtb \
 	ast2600-s6q.dtb \
+	ast2600-sie-cronos-v1.dtb \
 	ast2600-slt.dtb \
 	ast2600-tacoma.dtb \
 	ast2600-tacoma.dtb \
diff --git a/arch/arm/dts/ast2600-sie-cronos-v1.dts b/arch/arm/dts/ast2600-sie-cronos-v1.dts
new file mode 100644
index 00000000000..5d9e09a3cb2
--- /dev/null
+++ b/arch/arm/dts/ast2600-sie-cronos-v1.dts
@@ -0,0 +1,249 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2022 - 2025 Raptor Engineering, LLC
+/dts-v1/;
+
+#include "ast2600-u-boot.dtsi"
+/ {
+        model = "SIE CRONOS";
+        compatible = "sie,cronos", "aspeed,ast2600";
+
+	memory {
+		device_type = "memory";
+		reg = <0x80000000 0x80000000>;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	aliases {
+		mmc0 = &emmc_slot0;
+		mmc1 = &sdhci_slot0;
+		mmc2 = &sdhci_slot1;
+		spi0 = &fmc;
+		spi1 = &spi1;
+		spi2 = &spi2;
+		ethernet0 = &mac2;
+	};
+
+	cpus {
+		cpu@0 {
+			clock-frequency = <800000000>;
+		};
+		cpu@1 {
+			clock-frequency = <800000000>;
+		};
+	};
+};
+
+&uart5 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&sdrammc {
+	clock-frequency = <400000000>;
+};
+
+&wdt1 {
+	status = "okay";
+};
+
+&wdt2 {
+	status = "okay";
+};
+
+&wdt3 {
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <	&pinctrl_mdio1_default &pinctrl_mdio2_default
+			&pinctrl_mdio3_default &pinctrl_mdio4_default>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ethphy2: ethernet-phy@2 {
+		reg = <1>;
+	};
+};
+
+&mac2 {
+	status = "okay";
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy2>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii3_default &pinctrl_mac3link_default>;
+};
+
+&fmc {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fmcquad_default>;
+
+	flash@0 {
+		compatible = "spi-flash", "stm,n25q256a";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		#spi-tx-bus-width = <4>;
+		#spi-rx-bus-width = <4>;
+	};
+
+	flash@1 {
+		compatible = "spi-flash", "stm,n25q256a";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		#spi-tx-bus-width = <4>;
+		#spi-rx-bus-width = <4>;
+	};
+};
+
+&emmc {
+	u-boot,dm-pre-reloc;
+	timing-phase = <0x700ff>;
+};
+
+&emmc_slot0 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+	bus-width = <4>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_emmc_default>;
+	sdhci-drive-type = <1>;
+};
+
+&sdhci {
+	timing-phase = <0xc6ffff>;
+};
+
+&sdhci_slot0 {
+	status = "okay";
+	bus-width = <4>;
+	pwr-gpios = <&gpio0 ASPEED_GPIO(V, 0) GPIO_ACTIVE_HIGH>;
+	pwr-sw-gpios = <&gpio0 ASPEED_GPIO(V, 1) GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sd1_default>;
+	sdhci-drive-type = <1>;
+};
+
+&sdhci_slot1 {
+	status = "okay";
+	bus-width = <4>;
+	pwr-gpios = <&gpio0 ASPEED_GPIO(V, 2) GPIO_ACTIVE_HIGH>;
+	pwr-sw-gpios = <&gpio0 ASPEED_GPIO(V, 3) GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sd2_default>;
+	sdhci-drive-type = <1>;
+};
+
+&i2c3 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c4_default>;
+
+	eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
+		pagesize = <32>;
+		size = <8192>;
+		read-only;
+	};
+};
+
+&i2c4 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c5_default>;
+};
+
+&i2c5 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c6_default>;
+};
+
+&i2c6 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c7_default>;
+
+	cpld@34 {
+		compatible = "sie,cronus-cpld-v1";
+		reg = <0x34>;
+	};
+};
+
+&i2c7 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c8_default>;
+};
+
+&i2c8 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c9_default>;
+};
+
+&i2c9 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c10_default>;
+};
+
+&i2c10 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c11_default>;
+};
+
+#if 0
+&fsim0 {
+	status = "okay";
+};
+
+&fsim1 {
+	status = "okay";
+};
+#endif
+
+&ehci1 {
+	status = "okay";
+};
+
+&display_port {
+	status = "okay";
+};
+
+&scu {
+	uart-clk-source = <0x1fef>; /* Enable HUXCLK UART<1-4>,UART<6-13> */
+
+	mac0-clk-delay = <0x10 0x0a
+			  0x10 0x10
+			  0x10 0x10>;
+	mac1-clk-delay = <0x10 0x0a
+			  0x10 0x10
+			  0x10 0x10>;
+	mac2-clk-delay = <0x08 0x04
+			  0x08 0x04
+			  0x08 0x04>;
+	mac3-clk-delay = <0x08 0x04
+			  0x08 0x04
+			  0x08 0x04>;
+};
+
+&hace {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
diff --git a/arch/arm/mach-aspeed/ast2600/Kconfig b/arch/arm/mach-aspeed/ast2600/Kconfig
index decf263627f..5d4057a2842 100644
--- a/arch/arm/mach-aspeed/ast2600/Kconfig
+++ b/arch/arm/mach-aspeed/ast2600/Kconfig
@@ -25,6 +25,12 @@ config TARGET_FPGA_AST2600
 	  This is mainly for internal development. Note that
 	  most implementation is co-code with EVB-AST2600.
 
+config TARGET_SIE_CRONOS
+	bool "SIE-CRONOS"
+	depends on ASPEED_AST2600
+	help
+	  Sony Interactive Entertainment Cronos board.
+
 config TARGET_SLT_AST2600
 	bool "SLT-AST2600"
 	depends on ASPEED_AST2600
@@ -62,6 +68,7 @@ endchoice
 
 source "board/aspeed/evb_ast2600/Kconfig"
 source "board/aspeed/fpga_ast2600/Kconfig"
+source "board/sie/sie_cronos/Kconfig"
 source "board/aspeed/slt_ast2600/Kconfig"
 source "board/aspeed/ast2600_ibm/Kconfig"
 source "board/aspeed/ast2600_intel/Kconfig"
diff --git a/board/sie/sie_cronos/Kconfig b/board/sie/sie_cronos/Kconfig
new file mode 100644
index 00000000000..e9e64171cf5
--- /dev/null
+++ b/board/sie/sie_cronos/Kconfig
@@ -0,0 +1,17 @@
+if TARGET_SIE_CRONOS
+
+config SYS_BOARD
+	default "sie_cronos"
+
+config SYS_VENDOR
+	default "sie"
+
+config SYS_CONFIG_NAME
+	string "board configuration name"
+	default "sie_cronos"
+
+config BOARD_SPECIFIC_OPTIONS # dummy
+	def_bool y
+	select PHY_MARVELL_APPLY_MII_RXTX_ERRATA
+
+endif
diff --git a/board/sie/sie_cronos/Makefile b/board/sie/sie_cronos/Makefile
new file mode 100644
index 00000000000..bcc678fa3a3
--- /dev/null
+++ b/board/sie/sie_cronos/Makefile
@@ -0,0 +1,2 @@
+obj-y += cronos.o
+obj-y += fru_eeprom.o
diff --git a/board/sie/sie_cronos/cronos.c b/board/sie/sie_cronos/cronos.c
new file mode 100644
index 00000000000..ef813873e62
--- /dev/null
+++ b/board/sie/sie_cronos/cronos.c
@@ -0,0 +1,1478 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) ASPEED Technology Inc.
+ * Copyright 2022 Sony Interactive Entertainment LLC
+ * Copyright 2024-2025 Raptor Engineering, LLC
+ */
+
+#include <common.h>
+#include <asm/io.h>
+#include <dm.h>
+#include <i2c.h>
+#include <phy.h>
+#include <net.h>
+#include <environment.h>
+
+#include "fru_eeprom.h"
+
+#define SCU_BASE 0x1e6e2000
+
+#ifdef CONFIG_DM_I2C
+static struct udevice *pca9555_dev, *pca9555_smc, *adt1_dev, *adt2_dev,
+	*adt3_dev, *cpld_dev, *tmp435_dev;
+///LM25066 DEVICES
+static struct udevice *pca9546_i2c_mux_dev;
+static struct udevice *lm5066i_50_dev, *lm5066i_56_dev;
+static struct udevice *lm25066i_51_dev, *lm25066i_52_dev, *lm25066i_53_dev,
+	*lm25066i_54_dev, *lm25066i_55_dev;
+#endif
+
+static int interposer_present = 1;
+
+#ifdef DEBUG
+int dbgflg = 0;
+#endif
+
+#define I2C_ERR_READ 0
+#define I2C_ERR_WRITE 1
+
+static int i2c_report_err(int ret, int op, char *file, int line)
+{
+	printf("%s Line %d: Error %s the chip: %d\n", file, line,
+	       op == I2C_ERR_READ ? "reading" : "writing", ret);
+
+#if 0
+	return CMD_RET_FAILURE;
+#else
+	// Cronos Sled without connection to power interposer
+	// will hang on U-Boot startup unless we return SUCCESS here
+	return CMD_RET_SUCCESS;
+#endif
+}
+
+#if defined(CONFIG_WATCHDOG)
+#define CPLD_I2C_BUS 8
+#define CPLD_I2C_ADDR 0x3F
+#define CPLD_I2C_WDOG_REG 0x0C
+#define CPLD_I2C_CLR_REG 0x03
+#define CPLD_I2C_CLR_REG_VAL 0xC3
+#define CPLD_I2C_DEF_TO 0 /* 0=80 seconds, 1=10 seconds, ... , 7 = 70 seconds */
+#define CPLD_I2C_WATCHDOG_EN (1 << 7)
+#define CPLD_I2C_WATCHDOG_TO (7 << 0)
+
+#define CPLD_I2C_WATCHDOG_ENV "bmc_wdog_timeout"
+
+static unsigned char watchdog_init_done = 0;
+static unsigned char in_reset = 0;
+static int resetwait = 0;
+
+void watchdog_init_css(void)
+{
+	int status;
+	unsigned char cpldreg = 0;
+	int wdog_timeout;
+	char *fwenv;
+
+	debug("%s: ENTER, watchdog_init_done %d\n", __func__,
+	      watchdog_init_done);
+
+	if (watchdog_init_done == CPLD_I2C_CLR_REG_VAL)
+		return;
+
+#ifdef CONFIG_DM_I2C
+	status = dm_i2c_read(cpld_dev, CPLD_I2C_WDOG_REG, &cpldreg, 1);
+#else
+	status = i2c_read(CPLD_I2C_ADDR, CPLD_I2C_WDOG_REG, 1, &cpldreg, 1);
+#endif
+	if (status != 0) {
+		debug("%s: Can't read CPLD watchdog\n", __func__);
+		return;
+	}
+
+	debug("%s: CPLD Wdog reg %x\n", __func__, cpldreg);
+
+	/* If not already enabled then program the time value */
+	if (!(cpldreg & CPLD_I2C_WATCHDOG_EN)) {
+		/* Look for FW environment variable 'CPLD_I2C_WATCHDOG_ENV' */
+		fwenv = env_get(CPLD_I2C_WATCHDOG_ENV);
+		if (fwenv == NULL) {
+			wdog_timeout = CPLD_I2C_DEF_TO;
+
+			printf("Creating CPLD Watchdog env variable '%s'\n",
+			       CPLD_I2C_WATCHDOG_ENV);
+
+			/* Define the environment variable */
+			if (env_set_ulong(CPLD_I2C_WATCHDOG_ENV, wdog_timeout))
+				printf("%s: Couldn't create environment variable %s\n",
+				       __func__, CPLD_I2C_WATCHDOG_ENV);
+			else
+				env_save();
+		} else
+			wdog_timeout = simple_strtol(fwenv, 0, 16);
+
+		if (wdog_timeout != -1) {
+			cpldreg = CPLD_I2C_WATCHDOG_EN |
+				  (wdog_timeout & CPLD_I2C_WATCHDOG_TO);
+
+			debug("%s: CPLD Wdog prog reg %x\n", __func__, cpldreg);
+
+#ifdef CONFIG_DM_I2C
+			status = dm_i2c_write(cpld_dev, CPLD_I2C_WDOG_REG,
+					      &cpldreg, 1);
+#else
+			status = i2c_write(CPLD_I2C_ADDR, CPLD_I2C_WDOG_REG, 1,
+					   &cpldreg, 1);
+#endif
+			if (status != 0) {
+				debug("%s: Can't write CPLD watchdog\n",
+				      __func__);
+			}
+
+			watchdog_init_done = CPLD_I2C_CLR_REG_VAL;
+		}
+	} else
+		// Watchdog aready set, just enable reset routine
+		watchdog_init_done = CPLD_I2C_CLR_REG_VAL;
+
+	debug("%s: EXIT, watchdog_init_done = %x\n", __func__,
+	      watchdog_init_done);
+}
+
+void watchdog_reset(void)
+{
+	int status;
+	unsigned char cpldreg = 0;
+
+#ifdef DEBUG
+	dbgflg = 1;
+#endif
+
+	if (watchdog_init_done != CPLD_I2C_CLR_REG_VAL)
+		return;
+
+	// Re-entrant due to calling i2c libaries
+	if (in_reset == 1)
+		return;
+
+	// Delay between reset clears
+	if (resetwait++ < 500) {
+		in_reset = 0;
+		return;
+	}
+
+#ifdef DEBUG
+	dbgflg = 2;
+#endif
+
+	in_reset = 1;
+
+	cpldreg = CPLD_I2C_CLR_REG_VAL;
+
+#ifdef CONFIG_DM_I2C
+	status = dm_i2c_write(cpld_dev, CPLD_I2C_CLR_REG, &cpldreg, 1);
+#else
+	status = i2c_write(CPLD_I2C_ADDR, CPLD_I2C_CLR_REG, 1, &cpldreg, 1);
+#endif
+	if (status != 0) {
+		/* Can't print anything here as this function is re-entrant fron stdio */
+	}
+
+#ifdef DEBUG
+	dbgflg = 3;
+#endif
+
+	resetwait = in_reset = 0;
+}
+#endif /* defined(CONFIG_WATCHDOG) */
+
+int board_early_init_f(void)
+{
+	return 0;
+}
+
+/* Override weak target MAC address fetch symbol */
+int ftgmac100_target_fetch_mac(unsigned char *enetaddr)
+{
+	return css_fru_eeprom_get_mac(enetaddr);
+}
+
+#define I2CBUS_INTERPOSER 9
+#define I2CBUS_LOCAL 4
+#define I2CBUS_BMC_GPIO 5
+#define I2CBUS_CPLD 8
+
+#define PCA9555 0x20
+#define PCA9555_INPUT0_REG 0x00
+#define PCA9555_INPUT1_REG 0x01
+#define PCA9555_OUTPUT0_REG 0x02
+#define PCA9555_OUTPUT1_REG 0x03
+#define PCA9555_CONF0_REG 0x06
+#define PCA9555_CONF1_REG 0x07
+#define ADT1_ADDR 0x2C
+#define ADT2_ADDR 0x2D
+#define ADT3_ADDR 0x2E
+#define TMP435_ADDR 0x4C
+
+#define CSS_CPLD_ADDR 0x3F
+
+#define CPLD_I2C_LED_BRIGHTNESS_CTL_RED 0x17
+#define CPLD_I2C_LED_BRIGHTNESS_CTL_GREEN 0x18
+#define CPLD_I2C_LED_BRIGHTNESS_CTL_BLUE 0x19
+#define CPLD_I2C_BMC_MAC_START 0x30
+
+#define LM5066i_ADDR_50 0x50
+#define LM5066i_ADDR_56 0x56
+
+#define LM25066i_ADDR_51 0x51
+#define LM25066i_ADDR_52 0x52
+#define LM25066i_ADDR_53 0x53
+#define LM25066i_ADDR_54 0x54
+#define LM25066i_ADDR_55 0x55
+
+#define I2C_MUX_BUS_9_ADDR 0x77
+#define I2C_MUX_REG_ENABLE 0x05
+
+#define LM5066I_DEV_SETUP_CL BIT(4)
+#define LM5066I_REG_DEVICE_SETUP 0xd9
+#define LM25066_DEV_SETUP_CL BIT(4)
+#define LM25066_REG_DEVICE_SETUP 0xd9
+
+/* CPLD I2C Buses */
+#define CRONOS_CPLD_PROG_I2C_BUS 6
+#define CRONOS_CPLD_REGS_I2C_BUS 8
+
+/* Possible CPLD Addresses */
+#define CRONOS_CPLD_ADDR_I2C_DEFAULT \
+	(0x68 >> 1) /* Parpro assigned I2C addres  */
+#define CRONOS_CPLD_ADDR_I2C_MFG (0x80 >> 1) /* Lattice default I2C address */
+
+#define CRONOS_CPLD_ADDR_I2C_REGS (0x3F)
+
+/**
+ * cpld_prog_i2c_probe() - Probes for the CPLD device on the prog bus
+ *
+ * Return: 0 if OK, -ve on error
+ */
+int cpld_prog_i2c_probe(void)
+{
+	int ret;
+	struct udevice *bus, *i2c_dev;
+
+#ifdef CONFIG_DM_I2C
+	ret = uclass_get_device_by_seq(UCLASS_I2C, CRONOS_CPLD_PROG_I2C_BUS,
+				       &bus);
+	if (ret) {
+		printf("Failed to find CPLD device on prog bus %d\n",
+		       CRONOS_CPLD_PROG_I2C_BUS);
+	}
+
+	ret = dm_i2c_probe(bus, CRONOS_CPLD_ADDR_I2C_DEFAULT, 0, &i2c_dev);
+	if (ret == 0) {
+		printf("Found CPLD on prog bus %d, Addr: 0x%X\n",
+		       CRONOS_CPLD_PROG_I2C_BUS, CRONOS_CPLD_ADDR_I2C_DEFAULT);
+		return ret;
+	}
+
+	ret = dm_i2c_probe(bus, CRONOS_CPLD_ADDR_I2C_MFG, 0, &i2c_dev);
+	if (ret == 0) {
+		printf("Found CPLD on prog bus %d, Addr: 0x%X\n",
+		       CRONOS_CPLD_PROG_I2C_BUS, CRONOS_CPLD_ADDR_I2C_MFG);
+		return ret;
+	}
+
+#else
+	i2c_set_bus_num(CRONOS_CPLD_PROG_I2C_BUS);
+
+	ret = i2c_probe(CRONOS_CPLD_ADDR_I2C_DEFAULT);
+	if (ret == 0) {
+		printf("Found CPLD on Prog bus[%d]: Address: 0x%0X\n",
+		       CRONOS_CPLD_PROG_I2C_BUS, CRONOS_CPLD_ADDR_I2C_DEFAULT);
+		return ret;
+	}
+
+	ret = i2c_probe(CRONOS_CPLD_ADDR_I2C_MFG);
+	if (ret == 0) {
+		printf("Found CPLD on Prog bus[%d]: Address: 0x%0X\n",
+		       CRONOS_CPLD_PROG_I2C_BUS, CRONOS_CPLD_ADDR_I2C_MFG);
+		return ret;
+	}
+
+#endif
+
+	/* CPLD not detected on prog bus */
+	printf("Failed to find CPLD on Prog Bus[%d]: Addresses 0x%0X or 0x%0X\n",
+	       CRONOS_CPLD_PROG_I2C_BUS, CRONOS_CPLD_ADDR_I2C_DEFAULT,
+	       CRONOS_CPLD_ADDR_I2C_MFG);
+	return ret;
+}
+
+/**
+ * cpld_regs_i2c_probe() - Probes for the Cronos CPLD device
+ * If found, the device is assigned to cpld_dev
+ *
+ * Return: 0 if OK, -ve on error
+ */
+static int cpld_regs_i2c_probe(void)
+{
+	int ret;
+	int offset_len = 1;
+
+#ifdef CONFIG_DM_I2C
+	ret = i2c_get_chip_for_busnum(CRONOS_CPLD_REGS_I2C_BUS,
+				      CRONOS_CPLD_ADDR_I2C_REGS, 0, &cpld_dev);
+	if (ret) {
+		printf("Bus:[%d], Failed to get CPLD chip 0x%0X\n",
+		       CRONOS_CPLD_REGS_I2C_BUS, CRONOS_CPLD_ADDR_I2C_REGS);
+		return ret;
+	}
+
+	/* Device found; set the chip offset length */
+	ret = i2c_set_chip_offset_len(cpld_dev, offset_len);
+	if (ret) {
+		printf("Bus:[%d], CPLD device: [0x%0X]: Failed to set offset length to %d\n",
+		       CRONOS_CPLD_REGS_I2C_BUS, CRONOS_CPLD_ADDR_I2C_REGS,
+		       offset_len);
+		return ret;
+	}
+	printf("Found CPLD on bus %d, Addr: 0x%X\n", CRONOS_CPLD_REGS_I2C_BUS,
+	       CRONOS_CPLD_ADDR_I2C_REGS);
+	return ret;
+
+#else
+	i2c_set_bus_num(CRONOS_CPLD_REGS_I2C_BUS);
+
+	ret = i2c_probe(CRONOS_CPLD_ADDR_I2C_REGS);
+	if (ret == 0) {
+		printf("Found CPLD on bus %d, Addr: 0x%X\n",
+		       CRONOS_CPLD_REGS_I2C_BUS, CRONOS_CPLD_ADDR_I2C_REGS);
+
+		/* Device found; set the chip offset length */
+		ret = i2c_set_chip_offset_len(cpld_dev, offset_len);
+		if (ret) {
+			printf("Bus:[%d], CPLD device: [0x%0X]: Failed to set offset length to %d\n",
+			       CRONOS_CPLD_REGS_I2C_BUS,
+			       CRONOS_CPLD_ADDR_I2C_REGS, offset_len);
+			return ret;
+		}
+		printf("Found CPLD on bus %d, Addr: 0x%X\n",
+		       CRONOS_CPLD_REGS_I2C_BUS, CRONOS_CPLD_ADDR_I2C_REGS);
+		return ret;
+	}
+
+#endif
+
+	/* CPLD not detected on prog bus */
+	printf("Failed to find CPLD on Bus[%d]: Address 0x%0X\n",
+	       CRONOS_CPLD_REGS_I2C_BUS, CRONOS_CPLD_ADDR_I2C_REGS);
+	return ret;
+}
+
+int cssp_temp(int onps5)
+{
+	uint length = 1;
+	u_char dbyte = 1;
+	int ret;
+
+	// Skip if power interposer not detected
+	if (!interposer_present)
+		return 0;
+
+		// Make sure temp reading is in 2's complent mode
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_read(adt1_dev, 0x7C, &dbyte, length);
+#else
+	ret = i2c_read(I2CBUS_INTERPOSER, 0x02, 1, &dbyte, length);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_READ, __FILE__, __LINE__);
+
+	if (!(dbyte & 1)) {
+		dbyte |= 1;
+#ifdef CONFIG_DM_I2C
+		ret = dm_i2c_write(adt1_dev, 0x7C, &dbyte, length);
+#else
+		ret = i2c_write(I2CBUS_INTERPOSER, 0x7C, alen, 1, &dbyte);
+#endif
+		if (ret)
+			i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+	}
+
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_read(adt2_dev, 0x7C, &dbyte, length);
+#else
+	ret = i2c_read(I2CBUS_INTERPOSER, 0x02, 1, &dbyte, length);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_READ, __FILE__, __LINE__);
+
+	if (!(dbyte & 1)) {
+		dbyte |= 1;
+#ifdef CONFIG_DM_I2C
+		ret = dm_i2c_write(adt2_dev, 0x7C, &dbyte, length);
+#else
+		ret = i2c_write(I2CBUS_INTERPOSER, 0x7C, alen, 1, &dbyte);
+#endif
+		if (ret)
+			i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+	}
+
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_read(adt3_dev, 0x7C, &dbyte, length);
+#else
+	ret = i2c_read(I2CBUS_LOCAL, 0x02, 1, &dbyte, length);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_READ, __FILE__, __LINE__);
+
+	if (!(dbyte & 1)) {
+		dbyte |= 1;
+#ifdef CONFIG_DM_I2C
+		ret = dm_i2c_write(adt3_dev, 0x7C, &dbyte, length);
+#else
+		ret = i2c_write(I2CBUS_LOCAL, 0x7C, alen, 1, &dbyte);
+#endif
+		if (ret)
+			i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+	}
+
+#if 0
+    // Read 0x77 to Hold readings
+#ifdef CONFIG_DM_I2C
+    dbyte = 0x00;
+    ret = dm_i2c_read(adt1_dev, 0x77, &dbyte, length);
+#else
+    ret = i2c_read(I2CBUS_INTERPOSER, ADT1_ADDR, alen, 1, &dbyte);
+#endif
+    if (ret)
+        i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+#endif
+
+	// Read ADT1_REMOTE1
+#ifdef CONFIG_DM_I2C
+	dbyte = 0x00;
+	ret = dm_i2c_read(adt1_dev, 0x25, &dbyte, length);
+#else
+	ret = i2c_read(I2CBUS_INTERPOSER, ADT1_ADDR, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	if (dbyte == 0x80)
+		printf("Error reading ADT1_REMOTE1\n");
+	else
+		printf("ADT1_REMOTE1 : %d Deg Celsius\n", (int)dbyte);
+
+		// Read ADT1_REMOTE2
+#ifdef CONFIG_DM_I2C
+	dbyte = 0x00;
+	ret = dm_i2c_read(adt1_dev, 0x27, &dbyte, length);
+#else
+	ret = i2c_read(I2CBUS_INTERPOSER, ADT1_ADDR, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	if (dbyte == 0x80)
+		printf("Error reading ADT1_REMOTE2\n");
+	else
+		printf("ADT1_REMOTE2 : %d Deg Celsius\n", (int)dbyte);
+
+		// Read ADT1 On-chip temperature
+#ifdef CONFIG_DM_I2C
+	dbyte = 0x00;
+	ret = dm_i2c_read(adt1_dev, 0x26, &dbyte, length);
+#else
+	ret = i2c_write(I2CBUS_INTERPOSER, ADT1_ADDR, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	if (dbyte == 0x80)
+		printf("Error reading ADT1 LOCAL TEMP\n");
+	else
+		printf("ADT1 LOCAL : %d Deg Celsius\n", (int)dbyte);
+
+#if 0
+    // Read 0x77 to Hold readings
+#ifdef CONFIG_DM_I2C
+    dbyte = 0x00;
+    ret = dm_i2c_read(adt2_dev, 0x77, &dbyte, length);
+#else
+    ret = i2c_read(I2CBUS_INTERPOSER, ADT2_ADDR, alen, 1, &dbyte);
+#endif
+    if (ret)
+        i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+#endif
+
+		// Read ADT2_REMOTE1
+#ifdef CONFIG_DM_I2C
+	dbyte = 0x00;
+	ret = dm_i2c_read(adt2_dev, 0x25, &dbyte, length);
+#else
+	ret = i2c_read(I2CBUS_INTERPOSER, ADT2_ADDR, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	if (dbyte == 0x80)
+		printf("Error reading ADT2_REMOTE1\n");
+	else
+		printf("ADT2_REMOTE1 : %d Deg Celsius\n", (int)dbyte);
+
+		// Read ADT2_REMOTE2
+#ifdef CONFIG_DM_I2C
+	dbyte = 0x00;
+	ret = dm_i2c_read(adt2_dev, 0x27, &dbyte, length);
+#else
+	ret = i2c_read(I2CBUS_INTERPOSER, ADT2_ADDR, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	if (dbyte == 0x80)
+		printf("Error reading ADT2_REMOTE2\n");
+	else
+		printf("ADT2_REMOTE2 : %d Deg Celsius\n", (int)dbyte);
+
+		// Read ADT2 On-chip temperature
+#ifdef CONFIG_DM_I2C
+	dbyte = 0x00;
+	ret = dm_i2c_read(adt2_dev, 0x26, &dbyte, length);
+#else
+	ret = i2c_write(I2CBUS_INTERPOSER, ADT2_ADDR, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	if (dbyte == 0x80)
+		printf("Error reading ADT2 LOCAL TEMP\n");
+	else
+		printf("ADT2 LOCAL : %d Deg Celsius\n", (int)dbyte);
+
+#if 0
+    // Read 0x77 to Hold readings
+#ifdef CONFIG_DM_I2C
+    dbyte = 0x00;
+    ret = dm_i2c_read(adt3_dev, 0x77, &dbyte, length);
+#else
+    ret = i2c_read(I2CBUS_LOCAL, ADT3_ADDR, alen, 1, &dbyte);
+#endif
+    if (ret)
+        i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+#endif
+
+		// Read ADT3_REMOTE1
+#ifdef CONFIG_DM_I2C
+	dbyte = 0x00;
+	ret = dm_i2c_read(adt3_dev, 0x25, &dbyte, length);
+#else
+	ret = i2c_read(I2CBUS_LOCAL, ADT3_ADDR, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	if (dbyte == 0x80)
+		printf("Error reading ADT3_REMOTE1\n");
+	else
+		printf("ADT3_REMOTE1 : %d Deg Celsius\n", (int)dbyte);
+
+		// Read ADT3_REMOTE2
+#ifdef CONFIG_DM_I2C
+	dbyte = 0x00;
+	ret = dm_i2c_read(adt3_dev, 0x27, &dbyte, length);
+#else
+	ret = i2c_read(I2CBUS_LOCAL, ADT3_ADDR, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	if (dbyte == 0x80)
+		printf("Error reading ADT3_REMOTE2\n");
+	else
+		printf("ADT3_REMOTE2 : %d Deg Celsius\n", (int)dbyte);
+
+		// Read ADT3 On-chip temperature
+#ifdef CONFIG_DM_I2C
+	dbyte = 0x00;
+	ret = dm_i2c_read(adt3_dev, 0x26, &dbyte, length);
+#else
+	ret = i2c_read(I2CBUS_LOCAL, ADT3_ADDR, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	if (dbyte == 0x80)
+		printf("Error reading ADT3 LOCAL TEMP\n");
+	else
+		printf("ADT3 LOCAL : %d Deg Celsius\n", (int)dbyte);
+
+		// Read TMP435 Remote
+#ifdef CONFIG_DM_I2C
+	dbyte = 0x00;
+	ret = dm_i2c_read(tmp435_dev, 0x0, &dbyte, length);
+#else
+	ret = i2c_write(I2CBUS_INTERPOSER, TMP435_ADDR, alen, 0, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	printf("TMP435 Local : %d Deg Celsius\n", (int)dbyte);
+
+	return 0;
+}
+
+int cssp_pwm(int read, int *percent)
+{
+	uint length = 1;
+	u_char dbyte;
+	int ret;
+
+	// Skip if power interposer not detected
+	if (!interposer_present)
+		return 0;
+
+	if (read) {
+#ifdef CONFIG_DM_I2C
+		ret = dm_i2c_read(adt1_dev, 0x30, &dbyte, length);
+#else
+		ret = i2c_read(I2CBUS_INTERPOSER, 0x30, 1, &dbyte, length);
+#endif
+		if (ret)
+			i2c_report_err(ret, I2C_ERR_READ, __FILE__, __LINE__);
+
+		*percent = (dbyte * 100) / 0x100;
+	} else {
+		/* Enable manual mode PWM */
+#ifdef CONFIG_DM_I2C
+		ret = dm_i2c_read(adt1_dev, 0x5C, &dbyte, length);
+#else
+		ret = i2c_read(I2CBUS_INTERPOSER, 0x5C 1, &dbyte, length);
+#endif
+		if (ret)
+			i2c_report_err(ret, I2C_ERR_READ, __FILE__, __LINE__);
+
+		dbyte |= 0xE0;
+#ifdef CONFIG_DM_I2C
+		ret = dm_i2c_write(adt1_dev, 0x5C, &dbyte, length);
+#else
+		ret = i2c_write(I2CBUS_INTERPOSER, 0x5C, 1, &dbyte, length);
+#endif
+		if (ret)
+			i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+		dbyte = (*percent * 0x100) / 100;
+#ifdef CONFIG_DM_I2C
+		ret = dm_i2c_write(adt1_dev, 0x30, &dbyte, length);
+#else
+		ret = i2c_write(I2CBUS_INTERPOSER, 0x30, 1, &dbyte, length);
+#endif
+		if (ret)
+			i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+			/* Setup High Frequency PWM mode */
+#ifdef CONFIG_DM_I2C
+		ret = dm_i2c_read(adt1_dev, 0x5F, &dbyte, length);
+#else
+		ret = i2c_read(I2CBUS_INTERPOSER, 0x5F, 1, &dbyte, length);
+#endif
+		if (ret)
+			i2c_report_err(ret, I2C_ERR_READ, __FILE__, __LINE__);
+
+		dbyte |= 0x08;
+#ifdef CONFIG_DM_I2C
+		ret = dm_i2c_write(adt1_dev, 0x5F, &dbyte, length);
+#else
+		ret = i2c_write(I2CBUS_INTERPOSER, 0x5F, 1, &dbyte, length);
+#endif
+		if (ret)
+			i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+	}
+
+	return ret;
+}
+
+int cssp_init(int onps5)
+{
+	int alen = 1;
+	uint length = 1;
+	u_char dbyte = 1, dbyte2 = 1, dbyte3;
+	int ret = 0;
+
+#ifdef CONFIG_DM_I2C
+	if (i2c_get_chip_for_busnum(I2CBUS_BMC_GPIO, PCA9555, 0,
+				    &pca9555_smc) != 0) {
+		debug("%s: Can't set PCA9555 local bus\n", __func__);
+		return i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+	}
+	ret = i2c_set_chip_offset_len(pca9555_smc, alen);
+	if (ret)
+		return i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	if (i2c_get_chip_for_busnum(I2CBUS_LOCAL, ADT3_ADDR, 0, &adt3_dev) !=
+	    0) {
+		debug("%s: Can't set ADT3 bus\n", __func__);
+		return i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+	}
+
+	ret = i2c_set_chip_offset_len(adt3_dev, alen);
+	if (ret)
+		return i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	if (i2c_get_chip_for_busnum(I2CBUS_LOCAL, TMP435_ADDR, 0,
+				    &tmp435_dev) != 0) {
+		debug("%s: Can't set TMP435 bus\n", __func__);
+		return i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+	}
+
+	ret = i2c_set_chip_offset_len(tmp435_dev, alen);
+	if (ret)
+		return i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+#ifdef CONFIG_DM_I2C
+	dbyte = 0x00;
+	ret = dm_i2c_write(adt3_dev, 0x55, &dbyte, length);
+#else
+	ret = i2c_write(I2CBUS_LOCAL, ADT3_ADDR, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+#ifdef CONFIG_DM_I2C
+	dbyte = 0x00;
+	ret = dm_i2c_write(adt3_dev, 0x59, &dbyte, length);
+#else
+	ret = i2c_write(I2CBUS_LOCAL, ADT3_ADDR, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+#ifdef CONFIG_DM_I2C
+	dbyte = 0x05;
+	ret = dm_i2c_write(adt3_dev, 0x40, &dbyte, length);
+#else
+	ret = i2c_write(I2CBUS_LOCAL, ADT3_ADDR, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+#ifdef CONFIG_DM_I2C
+	dbyte = 0xF0;
+	ret = dm_i2c_write(adt3_dev, 0x7D, &dbyte, length);
+#else
+	ret = i2c_write(I2CBUS_LOCAL, ADT3_ADDR, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	dbyte = 0xFF;
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_write(pca9555_smc, PCA9555_OUTPUT1_REG, &dbyte, length);
+#else
+	ret = i2c_write(I2CBUS_BMC_GPIO, PCA9555_OUTPUT1_REG, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	/* Config Reg01 - Input to output */
+	dbyte = 0xFB;
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_write(pca9555_smc, PCA9555_CONF1_REG, &dbyte, length);
+#else
+	ret = i2c_write(I2CBUS_BMC_GPIO, PCA9555_CONF1_REG, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+#ifdef CONFIG_DM_I2C
+	dbyte = 0x28;
+	ret = dm_i2c_write(adt3_dev, 0x00, &dbyte, length);
+#else
+	ret = i2c_write(I2CBUS_LOCAL, ADT3_ADDR, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+#ifdef CONFIG_DM_I2C
+	dbyte = 0x29;
+	ret = dm_i2c_write(adt3_dev, 0x00, &dbyte, length);
+#else
+	ret = i2c_write(I2CBUS_LOCAL, ADT3_ADDR, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+#ifdef CONFIG_DM_I2C
+	dbyte = 0x2C;
+	ret = dm_i2c_write(adt3_dev, 0x00, &dbyte, length);
+#else
+	ret = i2c_write(I2CBUS_LOCAL, ADT3_ADDR, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+#ifdef CONFIG_DM_I2C
+	dbyte = 0x2D;
+	ret = dm_i2c_write(adt3_dev, 0x00, &dbyte, length);
+#else
+	ret = i2c_write(I2CBUS_LOCAL, ADT3_ADDR, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	// Power Interposer I2C
+	if (i2c_get_chip_for_busnum(I2CBUS_INTERPOSER, PCA9555, 0,
+				    &pca9555_dev) != 0) {
+		// Mark power interposer not present
+		interposer_present = 0;
+		return 0;
+
+		debug("%s: Can't set PCA9555 remote bus\n", __func__);
+
+		// return i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+	}
+	ret = i2c_set_chip_offset_len(pca9555_dev, alen);
+	if (ret)
+		return i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	if (i2c_get_chip_for_busnum(I2CBUS_INTERPOSER, ADT1_ADDR, 0,
+				    &adt1_dev) != 0) {
+		debug("%s: Can't set ADT1 bus\n", __func__);
+		return i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+	}
+
+	ret = i2c_set_chip_offset_len(adt1_dev, alen);
+	if (ret)
+		return i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	if (i2c_get_chip_for_busnum(I2CBUS_INTERPOSER, ADT2_ADDR, 0,
+				    &adt2_dev) != 0) {
+		debug("%s: Can't set ADT2 bus\n", __func__);
+		return i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+	}
+
+	ret = i2c_set_chip_offset_len(adt2_dev, alen);
+	if (ret)
+		return i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+#endif
+
+	dbyte = 0x2f;
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_write(pca9555_dev, PCA9555_OUTPUT0_REG, &dbyte, length);
+#else
+	ret = i2c_write(I2CBUS_INTERPOSER, PCA9555, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	dbyte = 0x00;
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_write(pca9555_dev, PCA9555_OUTPUT1_REG, &dbyte, length);
+#else
+	ret = i2c_write(I2CBUS_INTERPOSER, PCA9555, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	dbyte = 0x00; // Outputs
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_write(pca9555_dev, PCA9555_CONF0_REG, &dbyte, length);
+#else
+	ret = i2c_write(I2CBUS_INTERPOSER, PCA9555, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	dbyte = 0xff; // Inputs
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_write(pca9555_dev, PCA9555_CONF1_REG, &dbyte, length);
+#else
+	ret = i2c_write(I2CBUS_INTERPOSER, PCA9555, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	/* ADT1 - Setup Fan Tachometer limits */
+	dbyte = 0x00;
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_write(adt1_dev, 0x55, &dbyte, length);
+#else
+	ret = i2c_write(I2CBUS_INTERPOSER, ADT1_ADDR, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	dbyte = 0x00;
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_write(adt1_dev, 0x57, &dbyte, length);
+#else
+	ret = i2c_write(I2CBUS_INTERPOSER, ADT1_ADDR, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	dbyte = 0x00;
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_write(adt1_dev, 0x59, &dbyte, length);
+#else
+	ret = i2c_write(I2CBUS_INTERPOSER, ADT1_ADDR, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+		/* ADT1 - Enable manual mode PWM */
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_read(adt1_dev, 0x5C, &dbyte, length);
+#else
+	ret = i2c_read(I2CBUS_INTERPOSER, 0x5C 1, &dbyte, length);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_READ, __FILE__, __LINE__);
+
+	dbyte |= 0xE0;
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_write(adt1_dev, 0x5C, &dbyte, length);
+#else
+	ret = i2c_write(I2CBUS_INTERPOSER, 0x5C, 1, &dbyte, length);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+		/* ADT1 - Setup High Frequency PWM mode */
+#ifdef CONFIG_DM_I2C
+	dbyte = 0x00;
+	ret = dm_i2c_read(adt1_dev, 0x5F, &dbyte, length);
+#else
+	ret = i2c_read(I2CBUS_INTERPOSER, ADT1_ADDR, 1, &dbyte, length);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_READ, __FILE__, __LINE__);
+
+	dbyte |= 0x08;
+
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_write(adt1_dev, 0x5F, &dbyte, length);
+#else
+	ret = i2c_write(I2CBUS_INTERPOSER, ADT1_ADDR, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	/* ADT1 - Ready and Start */
+	dbyte = 0x05;
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_write(adt1_dev, 0x40, &dbyte, length);
+#else
+	ret = ret = i2c_write(I2CBUS_INTERPOSER, ADT1_ADDR, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+#ifdef CONFIG_DM_I2C
+	dbyte = 0xF0;
+	ret = dm_i2c_write(adt1_dev, 0x7D, &dbyte, length);
+#else
+	ret = i2c_write(I2CBUS_INTERPOSER, ADT1_ADDR, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	dbyte = 0x00;
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_write(adt2_dev, 0x55, &dbyte, length);
+#else
+	ret = i2c_write(I2CBUS_INTERPOSER, ADT2_ADDR, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	dbyte = 0x00;
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_write(adt2_dev, 0x57, &dbyte, length);
+#else
+	ret = i2c_write(I2CBUS_INTERPOSER, ADT2_ADDR, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	dbyte = 0x00;
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_write(adt2_dev, 0x59, &dbyte, length);
+#else
+	ret = i2c_write(I2CBUS_INTERPOSER, ADT2_ADDR, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+#ifdef CONFIG_DM_I2C
+	dbyte = 0x05;
+	ret = dm_i2c_write(adt2_dev, 0x40, &dbyte, length);
+#else
+	ret = i2c_write(I2CBUS_INTERPOSER, ADT2_ADDR, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+#ifdef CONFIG_DM_I2C
+	dbyte = 0xF0;
+	ret = dm_i2c_write(adt2_dev, 0x7D, &dbyte, length);
+#else
+	ret = i2c_write(I2CBUS_INTERPOSER, ADT2_ADDR, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	dbyte = 0x20;
+	dbyte2 = 0x01;
+	for (alen = 0; alen < 4; alen++) {
+		dbyte |= (1 << alen) & onps5;
+		dbyte2 |= (((1 << alen) & onps5) << 1);
+	}
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_read(pca9555_dev, PCA9555_OUTPUT0_REG, &dbyte3, length);
+#else
+	ret = i2c_read(I2CBUS_INTERPOSER, PCA9555_INPUT0_REG, 1, &dbyte3,
+		       length);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_READ, __FILE__, __LINE__);
+
+	dbyte3 &= 0xF0;
+	dbyte3 |= dbyte;
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_write(pca9555_dev, PCA9555_OUTPUT0_REG, &dbyte3, length);
+#else
+	ret = i2c_write(I2CBUS_INTERPOSER, PCA9555, alen, 1, &dbyte3);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_read(cpld_dev, 0x0a, &dbyte3, length);
+#else
+	ret = i2c_read(I2CBUS_CPLD, 0x0a, 1, &dbyte3, length);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_READ, __FILE__, __LINE__);
+
+	dbyte3 &= 0xE0;
+	dbyte3 |= dbyte2;
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_write(cpld_dev, 0x0a, &dbyte3, length);
+#else
+	ret = i2c_write(I2CBUS, CSS_CPLD_ADDR, alen, 1, &dbyte3);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	return 0;
+}
+
+static int cssp_lmsensor_init(void)
+{
+	int alen = 1;
+	uint length = 1;
+	u_char dbyte = 1;
+	int ret = -1;
+
+#ifdef CONFIG_DM_I2C
+
+	///INITIALIZE the I2C MUX
+	if (i2c_get_chip_for_busnum(I2CBUS_INTERPOSER, I2C_MUX_BUS_9_ADDR, 0,
+				    &pca9546_i2c_mux_dev) != 0) {
+		debug("%s: Can't get bus for PCA9546 I2C MUX device - 0X%X\n",
+		      __func__, I2C_MUX_BUS_9_ADDR);
+		return i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+	}
+	ret = i2c_set_chip_offset_len(pca9546_i2c_mux_dev, alen);
+	if (ret)
+		return i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	dbyte = -1;
+	// First time
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_read(pca9546_i2c_mux_dev, I2C_MUX_REG_ENABLE, &dbyte,
+			  length);
+#else
+	ret = i2c_read(I2CBUS_INTERPOSER, I2C_MUX_REG_ENABLE, 1, &dbyte,
+		       length);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_READ, __FILE__, __LINE__);
+
+		// Second time
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_read(pca9546_i2c_mux_dev, I2C_MUX_REG_ENABLE, &dbyte,
+			  length);
+#else
+	ret = i2c_read(I2CBUS_INTERPOSER, I2C_MUX_REG_ENABLE, 1, &dbyte,
+		       length);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_READ, __FILE__, __LINE__);
+
+	/// LM5066i DEVICE(S)
+	if (i2c_get_chip_for_busnum(I2CBUS_INTERPOSER, LM5066i_ADDR_50, 0,
+				    &lm5066i_50_dev) != 0) {
+		debug("%s: Can't get bus for LM5066i device - 0X%X\n", __func__,
+		      LM5066i_ADDR_50);
+		return i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+	}
+	ret = i2c_set_chip_offset_len(lm5066i_50_dev, alen);
+	if (ret)
+		return i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	if (i2c_get_chip_for_busnum(I2CBUS_INTERPOSER, LM5066i_ADDR_56, 0,
+				    &lm5066i_56_dev) != 0) {
+		debug("%s: Can't get bus for LM5066i device - 0X%X\n", __func__,
+		      LM5066i_ADDR_56);
+		return i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+	}
+	ret = i2c_set_chip_offset_len(lm5066i_56_dev, alen);
+	if (ret)
+		return i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+	///END_LM5066i DEVICES
+
+	/// LM25066 DEVICES
+	if (i2c_get_chip_for_busnum(I2CBUS_INTERPOSER, LM25066i_ADDR_51, 0,
+				    &lm25066i_51_dev) != 0) {
+		debug("%s: Can't get bus for LM25066 device - 0X%X\n", __func__,
+		      LM25066i_ADDR_51);
+		return i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+	}
+	ret = i2c_set_chip_offset_len(lm25066i_51_dev, alen);
+	if (ret)
+		return i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	if (i2c_get_chip_for_busnum(I2CBUS_INTERPOSER, LM25066i_ADDR_52, 0,
+				    &lm25066i_52_dev) != 0) {
+		debug("%s: Can't get bus for LM25066 device - 0X%X\n", __func__,
+		      LM25066i_ADDR_52);
+		return i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+	}
+	ret = i2c_set_chip_offset_len(lm25066i_52_dev, alen);
+	if (ret)
+		return i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	if (i2c_get_chip_for_busnum(I2CBUS_INTERPOSER, LM25066i_ADDR_53, 0,
+				    &lm25066i_53_dev) != 0) {
+		debug("%s: Can't get bus for LM25066 device - 0X%X\n", __func__,
+		      LM25066i_ADDR_53);
+		return i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+	}
+	ret = i2c_set_chip_offset_len(lm25066i_53_dev, alen);
+	if (ret)
+		return i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	if (i2c_get_chip_for_busnum(I2CBUS_INTERPOSER, LM25066i_ADDR_54, 0,
+				    &lm25066i_54_dev) != 0) {
+		debug("%s: Can't get bus for LM25066 device - 0X%X\n", __func__,
+		      LM25066i_ADDR_54);
+		return i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+	}
+	ret = i2c_set_chip_offset_len(lm25066i_54_dev, alen);
+	if (ret)
+		return i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	if (i2c_get_chip_for_busnum(I2CBUS_INTERPOSER, LM25066i_ADDR_55, 0,
+				    &lm25066i_55_dev) != 0) {
+		debug("%s: Can't get bus for LM25066 device - 0X%X\n", __func__,
+		      LM25066i_ADDR_55);
+		return i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+	}
+	ret = i2c_set_chip_offset_len(lm25066i_55_dev, alen);
+	if (ret)
+		return i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+		///END_LM25066 DEVICES
+
+#endif
+
+	// LM5066i Device(s) - setup
+	// Setup current limits
+	dbyte = LM5066I_DEV_SETUP_CL;
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_write(lm5066i_50_dev, LM5066I_REG_DEVICE_SETUP, &dbyte,
+			   length);
+#else
+	ret = i2c_write(I2CBUS_INTERPOSER, LM5066i_ADDR_50, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_write(lm5066i_56_dev, LM5066I_REG_DEVICE_SETUP, &dbyte,
+			   length);
+#else
+	ret = i2c_write(I2CBUS_INTERPOSER, LM5066i_ADDR_56, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	// LM25066 Devices - setup
+	// Setup current limits
+	dbyte = LM25066_DEV_SETUP_CL;
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_write(lm25066i_51_dev, LM25066_REG_DEVICE_SETUP, &dbyte,
+			   length);
+#else
+	ret = i2c_write(I2CBUS_INTERPOSER, LM25066i_ADDR_51, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_write(lm25066i_52_dev, LM25066_REG_DEVICE_SETUP, &dbyte,
+			   length);
+#else
+	ret = i2c_write(I2CBUS_INTERPOSER, LM25066i_ADDR_52, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_write(lm25066i_53_dev, LM25066_REG_DEVICE_SETUP, &dbyte,
+			   length);
+#else
+	ret = i2c_write(I2CBUS_INTERPOSER, LM25066i_ADDR_53, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_write(lm25066i_54_dev, LM25066_REG_DEVICE_SETUP, &dbyte,
+			   length);
+#else
+	ret = i2c_write(I2CBUS_INTERPOSER, LM25066i_ADDR_54, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+#ifdef CONFIG_DM_I2C
+	ret = dm_i2c_write(lm25066i_55_dev, LM25066_REG_DEVICE_SETUP, &dbyte,
+			   length);
+#else
+	ret = i2c_write(I2CBUS_INTERPOSER, LM25066i_ADDR_55, alen, 1, &dbyte);
+#endif
+	if (ret)
+		i2c_report_err(ret, I2C_ERR_WRITE, __FILE__, __LINE__);
+
+	///END_LM25066 DEVICES
+
+	return 0;
+}
+
+int cssp_phy_init(void)
+{
+#define SCU458_OFFSET (0x458)
+
+	uint32_t value;
+	int ret = -1;
+
+	// Setup MAC#3 drive strength (RMR-1448)
+	//
+	// Note:
+	// There is (or was) a device tree option to set the MAC drive strength.
+	// Check if it is feasible and then use that method instead of this.
+	//
+	// Older (Android) documentation references it:
+	// https://android.googlesource.com/kernel/msm/+/android-msm-bullhead-3.10-marshmallow-dr/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+	// Newer documentation does not have it:
+	// https://www.kernel.org/doc/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+	value = readl(SCU_BASE + SCU458_OFFSET);
+
+	value &= 0xFFFFFFF0;
+	value |= 0x0000000a;
+	writel(value, (SCU_BASE + SCU458_OFFSET));
+
+	// Verify
+	ret = (readl(SCU_BASE + SCU458_OFFSET) == value) ? 0 : 1;
+	return ret;
+}
+
+int misc_init_f(void)
+{
+	return 0;
+}
+
+int misc_init_r(void)
+{
+	int status = 0;
+
+	// printf("misc_init_r: ENTER\n");
+
+	/* Probe the CPLD on the prog bus */
+	cpld_prog_i2c_probe();
+	/* Initialize CPLD register access */
+	cpld_regs_i2c_probe();
+
+	// Power up all PS5s
+	status = cssp_init(0xf);
+
+	// Configure the LM25066i and LM5066i devices
+	status = cssp_lmsensor_init();
+
+	// configure the Ethernet PHY
+	status = cssp_phy_init();
+
+#if defined(CONFIG_WATCHDOG)
+	watchdog_init_css();
+#endif
+
+#ifdef DEBUG
+	printf("dbgflg addr = 0x%x\n", &dbgflg);
+#endif
+
+	return (status);
+}
+
+int last_stage_init(void)
+{
+	int status;
+	bool is_match = true;
+
+	// char *fwenv, macaddr[6],tbyte[3];
+	unsigned char fwenv[ARP_HLEN], macaddr[ARP_HLEN];
+
+	// printf("board_late_init: ENTER\n");
+
+	/* Look for FW environment variable 'ethaddr' */
+	if (!eth_env_get_enetaddr("ethaddr", fwenv))
+		printf("ERROR: Couldn't read 'ethaddr' env variable. Cannot set MAC in CPLD registers.\n");
+	else {
+		debug("ethaddr from env: [%pM]\n", fwenv);
+
+		for (int i = 0; i < ARP_HLEN; i++) {
+#if defined(CONFIG_WATCHDOG)
+			// Disable watchdog during CPLD regster write
+			watchdog_init_done = 0;
+#endif
+
+			// Write CPLD reg
+			status = dm_i2c_write(cpld_dev,
+					      (CPLD_I2C_BMC_MAC_START + i),
+					      &fwenv[i], 1);
+			if (status) {
+				printf("%s: Write to CPLD register %2x failed\n",
+				       __func__, 0x30 + i);
+#if defined(CONFIG_WATCHDOG)
+				watchdog_init_done = CPLD_I2C_CLR_REG_VAL;
+#endif
+				is_match &= false;
+				continue;
+			}
+
+			// Read back to ensure write is completed before any other operation
+			status = dm_i2c_read(cpld_dev,
+					     (CPLD_I2C_BMC_MAC_START + i),
+					     &macaddr[i], 1);
+			if (status) {
+				printf("%s: Read back from CPLD register %2x failed\n",
+				       __func__, 0x30 + i);
+			}
+
+			if (macaddr[i] == fwenv[i])
+				is_match &= true;
+			else
+				is_match &= false;
+
+#if defined(CONFIG_WATCHDOG)
+			// Re-enable watchdog reset
+			watchdog_init_done = CPLD_I2C_CLR_REG_VAL;
+#endif
+		}
+
+		printf("MAC from CPLD registers: [%pM]\n", macaddr);
+		if (!is_match)
+			printf("Error: CPLD MAC [%pM] does not match env ethaddr[%pM]\n",
+			       macaddr, fwenv);
+	}
+
+	/* Read and save the board hardware type to the environment */
+	uint8_t hwtype_len = 4;
+	char hw_type[hwtype_len];
+
+	if (css_fru_eeprom_get_hwtype(hw_type, hwtype_len))
+		printf("Error: Unable to read board hardware type from FRU EEPROM\n");
+
+	hw_type[hwtype_len - 1] = '\0';
+	debug("%s(%d): [LSI] SMC FRU EEPROM Board Product Name: [%s]\n",
+	      __FILE__, __LINE__, hw_type);
+
+	if (!strncmp(hw_type, "DVT", 3))
+		env_set("hwtype", "DVT");
+	else if (!strncmp(hw_type, "EVT", 3))
+		env_set("hwtype", "EVT");
+	else if (!strncmp(hw_type, "MP", 2))
+		env_set("hwtype", "MP");
+	else
+		env_set("hwtype", "N/A");
+
+	/* Setup default values for LED brightness registers in the CPLD */
+	uint8_t led_brightness = 0x00;
+	status = dm_i2c_write(cpld_dev, CPLD_I2C_LED_BRIGHTNESS_CTL_RED,
+			      &led_brightness, 1);
+	if (status) {
+		printf("%s: Failed to set default [RED] LED brightness\n",
+		       __func__);
+	}
+	status = dm_i2c_write(cpld_dev, CPLD_I2C_LED_BRIGHTNESS_CTL_GREEN,
+			      &led_brightness, 1);
+	if (status) {
+		printf("%s: Failed to set default [GREEN] LED brightness\n",
+		       __func__);
+	}
+	status = dm_i2c_write(cpld_dev, CPLD_I2C_LED_BRIGHTNESS_CTL_BLUE,
+			      &led_brightness, 1);
+	if (status) {
+		printf("%s: Failed to set default [BLUE] LED brightness\n",
+		       __func__);
+	}
+
+	return 0;
+}
+
+#define MIIM_88E151x_LED_FLD_SZ 4
+#define MIIM_88E151x_LED_FUNC_CTRL 16
+#define MIIM_88E151x_LED0_OFFS (0 * MIIM_88E151x_LED_FLD_SZ)
+#define MIIM_88E151x_LED1_OFFS (1 * MIIM_88E151x_LED_FLD_SZ)
+#define MIIM_88E151x_LED2_OFFS (2 * MIIM_88E151x_LED_FLD_SZ)
+#define MIIM_88E151x_LED0_1000MBPS 7
+#define MIIM_88E151x_LED1_100_1000_LINK 6
+#define MIIM_88E151x_LED2_ON_LINK 1
+
+static void cronos_m88e1518_phy_writebits(struct phy_device *phydev,
+			u8 reg_num, u16 offset, u16 len, u16 data)
+{
+	u16 reg, mask;
+
+	if ((len + offset) >= 16)
+		mask = 0 - (1 << offset);
+	else
+		mask = (1 << (len + offset)) - (1 << offset);
+
+	reg = phy_read(phydev, MDIO_DEVAD_NONE, reg_num);
+
+	reg &= ~mask;
+	reg |= data << offset;
+
+	phy_write(phydev, MDIO_DEVAD_NONE, reg_num, reg);
+}
+
+/* Override weak PHY LED configuration symbol */
+int m88e1510_led_config(struct phy_device *phydev)
+{
+	/* Configure LEDs */
+	/* LED[0]:0111 (1000MBPS Link) */
+	cronos_m88e1518_phy_writebits(phydev, MIIM_88E151x_LED_FUNC_CTRL,
+			       MIIM_88E151x_LED0_OFFS, MIIM_88E151x_LED_FLD_SZ,
+			       MIIM_88E151x_LED0_1000MBPS);
+	/* LED[1]:0110 (ON LINK) */
+	cronos_m88e1518_phy_writebits(phydev, MIIM_88E151x_LED_FUNC_CTRL,
+			       MIIM_88E151x_LED1_OFFS, MIIM_88E151x_LED_FLD_SZ,
+			       MIIM_88E151x_LED1_100_1000_LINK);
+	/* LED[2]:0001 (LINK 100/1000 Mbps) */
+	cronos_m88e1518_phy_writebits(phydev, MIIM_88E151x_LED_FUNC_CTRL,
+			       MIIM_88E151x_LED2_OFFS, MIIM_88E151x_LED_FLD_SZ,
+			       MIIM_88E151x_LED2_ON_LINK);
+
+	return 0;
+}
diff --git a/board/sie/sie_cronos/fru_eeprom.c b/board/sie/sie_cronos/fru_eeprom.c
new file mode 100644
index 00000000000..b29f37680fe
--- /dev/null
+++ b/board/sie/sie_cronos/fru_eeprom.c
@@ -0,0 +1,163 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright 2022 Sony Interactive Entertainment LLC */
+
+#include <common.h>
+#include <i2c.h>
+#include <net.h>
+#include <environment.h>
+#include <linux/types.h>
+
+#define I2CBUS_FRU_EEPROM (3)
+#define FRU_EEPROM_CHIP_ADDR (0x54)
+
+#define FRU_EEPROM_MAC_FIELD_START_OFFSET (0x1CD)
+#define FRU_EEPROM_MAC_FIELD_LENGTH (0x17)
+#define FRU_EEPROM_MAC_FIELD_MACADDR_START_INDEX (5)
+
+#define FRU_EEPROM_BOARD_PRODUCT_NAME_START_OFFSET (0x08C)
+#define FRU_EEPROM_BOARD_PRODUCT_NAME_LENGTH (0x0E)
+#define FRU_EEPROM_BOARD_PRODUCT_NAME_HWTYPE_START_INDEX (3)
+#define FRU_EEPROM_BOARD_PRODUCT_NAME_HWTYPE_LENGTH (3)
+
+// FRU EEPROM
+static struct udevice *eeprom24c64_dev;
+
+/* Read data from FRU EEPROM
+ * offset       - Read Start address
+ * length       - number of bytes to read
+ * data_buff    - Handle to buffer to hold data read from EEPROM
+ * */
+int css_fru_read_eeprom(unsigned int offset, unsigned int length,
+			char *data_buff)
+{
+	int ret = -1;
+	int alen = 2;
+
+	ret = i2c_get_chip_for_busnum(I2CBUS_FRU_EEPROM, FRU_EEPROM_CHIP_ADDR,
+				      1, &eeprom24c64_dev);
+
+	if (!ret)
+		i2c_set_chip_offset_len(eeprom24c64_dev, alen);
+
+	if (!ret)
+		ret = dm_i2c_read(eeprom24c64_dev, offset, (unsigned char *)data_buff, length);
+
+	if (ret)
+		debug("%s: %d: Error reading from the chip: %d\n", __FILE__,
+		      __LINE__, ret);
+
+	return ret;
+}
+
+/*
+ * Fetch the MAC address from the FRU EEPROM
+ *
+ * Details:
+ * Read the MAC Address String from the FRU EEPROM, parse it and
+ * return an 6-byte array of the MAC address in hex
+ *
+ * @mac_addr        - Handle to MAC address read from the FRU EEPROM
+ *                    (MAC address as a 6-byte array)
+ *
+ * Returns
+ * 0 if MAC address is successfully read and returned, non-zero error value otherwise
+ *
+ * Notes:
+ * According to the standard FRU spec., the address format is ASCII.
+ * For Foxconn FRU spec: MAC address Offset:0x1CD, length:0x17 (23-decimal)
+ * 			     format:MAC0:XX:XX:XX:XX:XX:XX;
+ *
+ * Console command: i2ctransfer -y -f -v 3 w2@0x54 0x1 0xcd r23
+ * msg 0: addr 0x54, write, len 2, buf 0x01 0xcd
+ * msg 1: addr 0x54, read, len 23, buf 0x4d 0x41 0x43 0x30 0x3a 0x46 0x34 0x3a 0x36 0x42 0x3a 0x38 0x43 0x3a 0x34 0x36 0x3a 0x30 0x30 0x3a 0x33 0x35 0x3b
+ * (                                   M    A    C    0    :    F    4    :    6    B    :    8    C    :    4    6    :    0    0    :    3    5    ;   )
+ * (        Index                      0    1    2    3    4    5    6    7    8    9    10   11   12   13   14   15   16   17   18   19   20   21   22
+ */
+int css_fru_eeprom_get_mac(unsigned char *mac_addr)
+{
+	/* Read the MAC field from the FRU EEPROM */
+	int ret = -1;
+	char mac_field[FRU_EEPROM_MAC_FIELD_LENGTH + 1];
+
+#ifdef CONFIG_DM_I2C
+	ret = css_fru_read_eeprom(FRU_EEPROM_MAC_FIELD_START_OFFSET,
+				  FRU_EEPROM_MAC_FIELD_LENGTH, mac_field);
+#else
+	int alen = 2;
+	ret = i2c_read(FRU_EEPROM_CHIP_ADDR, FRU_EEPROM_MAC_FIELD_START_OFFSET,
+		       alen, mac_field, FRU_EEPROM_MAC_FIELD_LENGTH);
+#endif
+	mac_field[FRU_EEPROM_MAC_FIELD_LENGTH] = '\0';
+
+	if (ret) {
+		debug("%s: %d: Failed to read MAC field from FRU EEPROM\n", __FILE__,
+		      __LINE__);
+	} else {
+		/* This helper function is available for this version (2019.04) of u-boot.
+         * But it is changed in newer versions.
+         * When/If u-boot is bumped to a newer version, this helper will need an update.
+         * See: doc/README.enetaddr for details on available helpers
+         */
+		/* Parse the string to a binary version */
+		eth_parse_enetaddr(
+			(mac_field + FRU_EEPROM_MAC_FIELD_MACADDR_START_INDEX),
+			mac_addr);
+	}
+
+	return ret;
+}
+
+/*
+ * Fetch the hardware type information from the FRU EEPROM
+ *
+ * Details:
+ * Read the BOARD_PRODUCT_NAME string from the FRU EEPROM, parse it
+ * and return ONLY the hardware type of requested length
+ *
+ * @hw_type        - Handle to board hardware type
+ * @length         - length of hw_type (num of bits to populate)
+ *
+ * Returns
+ * 0 if the BOARD_PRODUCT_NAME is successfully read and returned,
+ *   non-zero error value otherwise
+ *
+ * Notes:
+ * At this time, the board hardware type is being determined by the contents of
+ * the BOARD_PRODUCT_NAME field. This may change in future implementations.
+ * There may be a new field created or the hardware type could be determined by
+ * a combination of multiple fields.
+ *
+ */
+int css_fru_eeprom_get_hwtype(char *hw_type, uint8_t length)
+{
+	/* Read the board product name field from the FRU EEPROM */
+	int ret = -1;
+	char bp_name_field[FRU_EEPROM_BOARD_PRODUCT_NAME_LENGTH + 1];
+
+#ifdef CONFIG_DM_I2C
+	ret = css_fru_read_eeprom(FRU_EEPROM_BOARD_PRODUCT_NAME_START_OFFSET,
+				  FRU_EEPROM_BOARD_PRODUCT_NAME_LENGTH,
+				  bp_name_field);
+#else
+	int alen = 2;
+	ret = i2c_read(FRU_EEPROM_CHIP_ADDR,
+		       FRU_EEPROM_BOARD_PRODUCT_NAME_START_OFFSET, alen,
+		       (unsigned char *) bp_name_field, FRU_EEPROM_BOARD_PRODUCT_NAME_LENGTH);
+#endif
+	bp_name_field[FRU_EEPROM_BOARD_PRODUCT_NAME_LENGTH] = '\0';
+
+	if (ret) {
+		debug("%s(%u): Failed to read BOARD_PRODUCT_NAME field from FRU EEPROM\n",
+		      __FILE__, __LINE__);
+	} else {
+		/* Only copy over the hardware type */
+		memcpy(hw_type,
+		       bp_name_field +
+			       FRU_EEPROM_BOARD_PRODUCT_NAME_HWTYPE_START_INDEX,
+		       (length < FRU_EEPROM_BOARD_PRODUCT_NAME_LENGTH ?
+				length :
+				FRU_EEPROM_BOARD_PRODUCT_NAME_LENGTH));
+	}
+
+	return ret;
+}
diff --git a/board/sie/sie_cronos/fru_eeprom.h b/board/sie/sie_cronos/fru_eeprom.h
new file mode 100644
index 00000000000..f497799e6e6
--- /dev/null
+++ b/board/sie/sie_cronos/fru_eeprom.h
@@ -0,0 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright 2022 Sony Interactive Entertainment LLC */
+
+int css_fru_eeprom_get_mac(unsigned char* mac_addr);
+int css_fru_eeprom_get_hwtype(char *hw_type, uint8_t length);
diff --git a/board/sie/sie_cronos/i2c.c b/board/sie/sie_cronos/i2c.c
new file mode 100644
index 00000000000..4e506724d3b
--- /dev/null
+++ b/board/sie/sie_cronos/i2c.c
@@ -0,0 +1,231 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) ASPEED Technology Inc.
+ * Copyright 2022 Sony Interactive Entertainment LLC
+ * Copyright 2024-2025 Raptor Engineering, LLC
+ */
+
+#include "fru_eeprom.h"
+
+/**
+ * do_i2c_cssp() - Cronos Sled Switch Power On
+ * @cmdtp:	Command data struct pointer
+ * @flag:	Command flag
+ * @argc:	Command-line argument count
+ * @argv:	Array of command-line arguments
+ *
+ * Returns zero on success, CMD_RET_USAGE in case of misuse and negative
+ * on error.
+ *
+ * Syntax:
+ *	i2c cssp {onps5}
+ *
+ * Returns zero (success) if one or more I2C devices was found
+ */
+static int do_i2c_cssp(cmd_tbl_t *cmdtp, int flag, int argc, char *const argv[])
+{
+	uint onps5 = 0;
+	int ret;
+	extern int cssp_init(int onps5);
+
+	if (argc == 2)
+		onps5 = simple_strtoul(argv[1], NULL, 16);
+	else if (argc > 2)
+		return CMD_RET_USAGE;
+
+	if (cssp_init(onps5))
+		debug("%s: Couldn't start PS5s\n");
+	return 1;
+
+	return 0;
+}
+
+/**
+ * do_i2c_csst() - Cronos Sled Temperature Sensors
+ * @cmdtp:	Command data struct pointer
+ * @flag:	Command flag
+ * @argc:	Command-line argument count
+ * @argv:	Array of command-line arguments
+ *
+ * Returns zero on success, CMD_RET_USAGE in case of misuse and negative
+ * on error.
+ *
+ * Syntax:
+ *	i2c csst
+ *
+ * Returns zero (success) if one or more I2C devices was found
+ */
+static int do_i2c_csst(cmd_tbl_t *cmdtp, int flag, int argc, char *const argv[])
+{
+	int ret;
+	extern int cssp_temp(void);
+
+	if (argc != 1)
+		return CMD_RET_USAGE;
+
+	return (cssp_temp());
+}
+
+/**
+ * do_i2c_css_fru() - Cronos Sled FRU EEPROM commands
+ * @cmdtp:	Command data struct pointer
+ * @flag:	Command flag
+ * @argc:	Command-line argument count
+ * @argv:	Array of command-line arguments
+ *
+ * Returns zero on success, CMD_RET_USAGE in case of misuse and negative
+ * on error.
+ *
+ * Syntax:
+ *	i2c cssfrumac
+ *	i2c cssfruhwtype
+ *	i2c cssfru read 0x1CD 0x17 0x83000000
+ *
+ * Returns zero on success, CMD_RET_USAGE in case of misuse and negative
+ * on error.
+ */
+static int do_i2c_css_fru(cmd_tbl_t *cmdtp, int flag, int argc,
+			  char *const argv[])
+{
+	int ret = -1;
+	unsigned int offset = 0;
+	unsigned int length = 0;
+
+	if ((argc == 1) && (!strcmp("cssfrumac", argv[0]))) {
+		/* Read and display the MAC Address from the FRU EEPROM */
+		u_char fru_mac[ARP_HLEN];
+
+		ret = css_fru_eeprom_get_mac(fru_mac);
+		if (ret)
+			return i2c_report_err(ret, I2C_ERR_READ, __FILE__,
+					      __LINE__);
+
+		printf("FRU EEPROM MAC address: [%pM]\n", fru_mac);
+		ret = 0;
+	} else if ((argc == 1) && (!strcmp("cssfruhwtype", argv[0]))) {
+		/* Read and display the Board hardware type from the FRU EEPROM */
+		uint8_t hwtype_len = 4;
+		u_char hw_type[hwtype_len];
+
+		ret = css_fru_eeprom_get_hwtype(hw_type, hwtype_len);
+		if (ret)
+			return i2c_report_err(ret, I2C_ERR_READ, __FILE__,
+					      __LINE__);
+
+		hw_type[hwtype_len - 1] = '\0';
+		printf("SMC FRU EEPROM - Hardware Type: [%s]\n", hw_type);
+		ret = 0;
+	}
+	// Other specific field reads can be added here...
+	else if ((argc == 5) && (!strcmp("cssfru", argv[0])) &&
+		 (!strcmp("read", argv[1]))) {
+		/* Generic Read from FRU EEPROM:
+	 * Read <length> objects starting at <offset> and write to <memory_address> */
+		uchar *memaddr;
+
+		/* Address length */
+		int alen = 2;
+		/* Offset (address) within the chip from where to start reading */
+		offset = simple_strtoul(argv[2], NULL, 16);
+		/* Length is the number of objects, not number of bytes. */
+		length = simple_strtoul(argv[3], NULL, 16);
+		/* memaddr is the address where to store things in memory */
+		memaddr = (u_char *)simple_strtoul(argv[4], NULL, 16);
+
+#ifdef CONFIG_DM_I2C
+		ret = css_fru_read_eeprom(offset, length, memaddr);
+#else
+		ret = i2c_read(chip, offset, alen, memaddr, length);
+#endif
+		if (ret)
+			return i2c_report_err(ret, I2C_ERR_READ, __FILE__,
+					      __LINE__);
+	} else
+		ret = CMD_RET_USAGE;
+
+	return (ret);
+}
+
+/**
+ * do_i2c_css_pwm() - Cronos Sled Fan PWM Setting
+ * @cmdtp:	Command data struct pointer
+ * @flag:	Command flag
+ * @argc:	Command-line argument count
+ * @argv:	Array of command-line arguments
+ *
+ * Returns zero on success, CMD_RET_USAGE in case of misuse and negative
+ * on error.
+ *
+ * Syntax:
+ *	i2c csstpwm
+ *
+ * Returns zero (success) if one or more I2C devices was found
+ */
+static int do_i2c_css_pwm(cmd_tbl_t *cmdtp, int flag, int argc,
+			  char *const argv[])
+{
+	int ret = 0, percent;
+	extern int cssp_pwm(int read, int *percent);
+
+	if ((argc == 1) && (!strcmp("csspwmr", argv[0]))) {
+		ret = cssp_pwm(1, &percent);
+		if (!ret)
+			printf("PWM Percent : %d\n", percent);
+	} else if ((argc == 2) && (!strcmp("csspwmw", argv[0]))) {
+		percent = simple_strtol(argv[1], 0, 10);
+		ret = cssp_pwm(0, &percent);
+	}
+
+	return (ret);
+}
+
+cmd_tbl_t cmd_i2c_cronos[] = {
+	U_BOOT_CMD_MKENT(cssp, 1, 1, do_i2c_cssp, "", ""),
+	U_BOOT_CMD_MKENT(csst, 1, 1, do_i2c_csst, "", ""),
+	U_BOOT_CMD_MKENT(cssfru, 3, 1, do_i2c_css_fru, "", ""),
+	U_BOOT_CMD_MKENT(cssfrumac, 2, 1, do_i2c_css_fru, "", ""),
+	U_BOOT_CMD_MKENT(cssfruhwtype, 2, 1, do_i2c_css_fru, "", ""),
+	U_BOOT_CMD_MKENT(csspwmr, 1, 1, do_i2c_css_pwm, "", ""),
+	U_BOOT_CMD_MKENT(csspwmw, 1, 1, do_i2c_css_pwm, "", ""),
+};
+
+static int do_i2c_cronos(cmd_tbl_t *cmdtp, int flag, int argc,
+			 char *const argv[])
+{
+	cmd_tbl_t *c;
+
+	if (argc < 2)
+		return CMD_RET_USAGE;
+
+	/* Strip off leading 'i2c_cronos' command argument */
+	argc--;
+	argv++;
+
+	c = find_cmd_tbl(argv[0], cmd_i2c_cronos, ARRAY_SIZE(cmd_i2c_cronos));
+	if (!c)
+		return CMD_RET_USAGE;
+
+	return c->cmd(cmdtp, flag, argc, argv);
+}
+
+U_BOOT_CMD(
+	i2c_cronos, CONFIG_SYS_MAXARGS, 0, do_i2c_cronos,
+	"SIE Cronos specific I2C command",
+	"i2c_cronos cssp [onps5] - pops5. onps5 => bitmask [3:0] of PS5\n"
+	"i2c_cronos csst - Display Cronos Temperature Sensors\n"
+	"i2c_cronos cssfrumac - Read MAC Address from SMC FRU EERPOM\n"
+	"i2c_cronos cssfruhwtype - Read Board hardware type from SMC FRU EERPOM\n"
+	"i2c_cronos cssfru read offset(hex) length(hex) memaddress(hex) - Read FRU EERPOM to memory\n"
+	"i2c_cronos csspwmr - Read current PWM percentage\n"
+	"i2c_cronos csspwmw pwm - Set PWM percentage\n"
+	"i2c_cronos cpldr memaddress pagecount -  Read Cronos CPLD Flash CFG\n"
+	"    pagemount is number of 16-byte pages\n"
+	"          If pagemount is 0, reads entire\n"
+	"          Flash CFG and detects valid FW\n"
+	"          signature to determine size.\n"
+	"i2c_cronos cpldw memaddress pagecount key - Program Cronos CPLD Flash CFG\n"
+	"    pagemount is number of 16-byte pages.\n"
+	"          If pagemount is 0, attempts to detect\n"
+	"          valid FW signature and calcuates size\n"
+	"          to program.\n"
+	"    key is 32-bit hex verification code\n";);
diff --git a/configs/sie_cronos_openbmc_defconfig b/configs/sie_cronos_openbmc_defconfig
new file mode 100755
index 00000000000..0b665fbb7da
--- /dev/null
+++ b/configs/sie_cronos_openbmc_defconfig
@@ -0,0 +1,1495 @@
+#
+# Automatically generated file; DO NOT EDIT.
+# U-Boot 2019.04 Configuration
+#
+CONFIG_CREATE_ARCH_SYMLINK=y
+# CONFIG_ARC is not set
+CONFIG_ARM=y
+# CONFIG_M68K is not set
+# CONFIG_MICROBLAZE is not set
+# CONFIG_MIPS is not set
+# CONFIG_NDS32 is not set
+# CONFIG_NIOS2 is not set
+# CONFIG_PPC is not set
+# CONFIG_RISCV is not set
+# CONFIG_SANDBOX is not set
+# CONFIG_SH is not set
+# CONFIG_X86 is not set
+# CONFIG_XTENSA is not set
+CONFIG_SYS_ARCH="arm"
+CONFIG_SYS_CPU="armv7"
+CONFIG_SYS_SOC="aspeed"
+CONFIG_SYS_VENDOR="sie"
+CONFIG_SYS_BOARD="sie_cronos"
+CONFIG_SYS_CONFIG_NAME="sie_cronos"
+# CONFIG_SYS_ICACHE_OFF is not set
+CONFIG_SYS_DCACHE_OFF=y
+
+#
+# ARM architecture
+#
+# CONFIG_POSITION_INDEPENDENT is not set
+CONFIG_HAS_VBAR=y
+CONFIG_HAS_THUMB2=y
+CONFIG_ARM_ASM_UNIFIED=y
+CONFIG_SYS_ARM_CACHE_CP15=y
+CONFIG_SYS_ARM_MMU=y
+# CONFIG_SYS_ARM_MPU is not set
+CONFIG_CPU_V7A=y
+CONFIG_SYS_ARM_ARCH=7
+CONFIG_SYS_CACHE_SHIFT_6=y
+CONFIG_SYS_CACHELINE_SIZE=64
+CONFIG_SYS_ARCH_TIMER=y
+# CONFIG_ARM_SMCCC is not set
+# CONFIG_SEMIHOSTING is not set
+CONFIG_SYS_THUMB_BUILD=y
+CONFIG_SPL_SYS_THUMB_BUILD=y
+# CONFIG_SYS_L2CACHE_OFF is not set
+CONFIG_ENABLE_ARM_SOC_BOOT0_HOOK=y
+CONFIG_USE_ARCH_MEMCPY=y
+CONFIG_SPL_USE_ARCH_MEMCPY=y
+CONFIG_USE_ARCH_MEMSET=y
+CONFIG_SPL_USE_ARCH_MEMSET=y
+# CONFIG_ARM64_SUPPORT_AARCH32 is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_TARGET_EDB93XX is not set
+# CONFIG_TARGET_ASPENITE is not set
+# CONFIG_TARGET_GPLUGD is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_KIRKWOOD is not set
+# CONFIG_ARCH_MVEBU is not set
+# CONFIG_TARGET_APF27 is not set
+# CONFIG_ORION5X is not set
+# CONFIG_TARGET_SPEAR300 is not set
+# CONFIG_TARGET_SPEAR310 is not set
+# CONFIG_TARGET_SPEAR320 is not set
+# CONFIG_TARGET_SPEAR600 is not set
+# CONFIG_TARGET_STV0991 is not set
+# CONFIG_TARGET_X600 is not set
+# CONFIG_TARGET_WOODBURN is not set
+# CONFIG_TARGET_WOODBURN_SD is not set
+# CONFIG_TARGET_FLEA3 is not set
+# CONFIG_TARGET_MX35PDK is not set
+# CONFIG_ARCH_BCM283X is not set
+# CONFIG_ARCH_BCM63158 is not set
+# CONFIG_ARCH_BCM6858 is not set
+# CONFIG_TARGET_VEXPRESS_CA15_TC2 is not set
+# CONFIG_ARCH_BCMSTB is not set
+# CONFIG_TARGET_VEXPRESS_CA5X2 is not set
+# CONFIG_TARGET_VEXPRESS_CA9X4 is not set
+# CONFIG_TARGET_BCM23550_W1D is not set
+# CONFIG_TARGET_BCM28155_AP is not set
+# CONFIG_TARGET_BCMCYGNUS is not set
+# CONFIG_TARGET_BCMNSP is not set
+# CONFIG_TARGET_BCMNS2 is not set
+# CONFIG_ARCH_EXYNOS is not set
+# CONFIG_ARCH_S5PC1XX is not set
+# CONFIG_ARCH_HIGHBANK is not set
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_KEYSTONE is not set
+# CONFIG_ARCH_K3 is not set
+# CONFIG_ARCH_OMAP2PLUS is not set
+# CONFIG_ARCH_MESON is not set
+# CONFIG_ARCH_MEDIATEK is not set
+# CONFIG_ARCH_LPC32XX is not set
+# CONFIG_ARCH_IMX8 is not set
+# CONFIG_ARCH_IMX8M is not set
+# CONFIG_ARCH_MX23 is not set
+# CONFIG_ARCH_MX25 is not set
+# CONFIG_ARCH_MX28 is not set
+# CONFIG_ARCH_MX31 is not set
+# CONFIG_ARCH_MX7ULP is not set
+# CONFIG_ARCH_MX7 is not set
+# CONFIG_ARCH_MX6 is not set
+CONFIG_SPL_LDSCRIPT="arch/$(ARCH)/mach-aspeed/ast2600/u-boot-spl.lds"
+# CONFIG_ARCH_MX5 is not set
+# CONFIG_ARCH_OWL is not set
+# CONFIG_ARCH_QEMU is not set
+# CONFIG_ARCH_RMOBILE is not set
+# CONFIG_TARGET_S32V234EVB is not set
+# CONFIG_ARCH_SNAPDRAGON is not set
+# CONFIG_ARCH_SOCFPGA is not set
+# CONFIG_ARCH_SUNXI is not set
+# CONFIG_ARCH_VERSAL is not set
+# CONFIG_ARCH_VF610 is not set
+# CONFIG_ARCH_ZYNQ is not set
+# CONFIG_ARCH_ZYNQMP_R5 is not set
+# CONFIG_ARCH_ZYNQMP is not set
+# CONFIG_TEGRA is not set
+# CONFIG_TARGET_VEXPRESS64_AEMV8A is not set
+# CONFIG_TARGET_VEXPRESS64_BASE_FVP is not set
+# CONFIG_TARGET_VEXPRESS64_BASE_FVP_DRAM is not set
+# CONFIG_TARGET_VEXPRESS64_JUNO is not set
+# CONFIG_TARGET_LS2080A_EMU is not set
+# CONFIG_TARGET_LS2080A_SIMU is not set
+# CONFIG_TARGET_LS1088AQDS is not set
+# CONFIG_TARGET_LS2080AQDS is not set
+# CONFIG_TARGET_LS2080ARDB is not set
+# CONFIG_TARGET_LS2081ARDB is not set
+# CONFIG_TARGET_LX2160ARDB is not set
+# CONFIG_TARGET_LX2160AQDS is not set
+# CONFIG_TARGET_HIKEY is not set
+# CONFIG_TARGET_POPLAR is not set
+# CONFIG_TARGET_LS1012AQDS is not set
+# CONFIG_TARGET_LS1012ARDB is not set
+# CONFIG_TARGET_LS1012A2G5RDB is not set
+# CONFIG_TARGET_LS1012AFRWY is not set
+# CONFIG_TARGET_LS1012AFRDM is not set
+# CONFIG_TARGET_LS1088ARDB is not set
+# CONFIG_TARGET_LS1021AQDS is not set
+# CONFIG_TARGET_LS1021ATWR is not set
+# CONFIG_TARGET_LS1021AIOT is not set
+# CONFIG_TARGET_LS1043AQDS is not set
+# CONFIG_TARGET_LS1043ARDB is not set
+# CONFIG_TARGET_LS1046AQDS is not set
+# CONFIG_TARGET_LS1046ARDB is not set
+# CONFIG_TARGET_H2200 is not set
+# CONFIG_TARGET_ZIPITZ2 is not set
+# CONFIG_TARGET_COLIBRI_PXA270 is not set
+# CONFIG_ARCH_UNIPHIER is not set
+# CONFIG_STM32 is not set
+# CONFIG_ARCH_STI is not set
+# CONFIG_ARCH_STM32MP is not set
+# CONFIG_ARCH_ROCKCHIP is not set
+# CONFIG_TARGET_THUNDERX_88XX is not set
+CONFIG_ARCH_ASPEED=y
+CONFIG_SYS_TEXT_BASE=0x80001000
+# CONFIG_ASPEED_AST2400 is not set
+# CONFIG_ASPEED_AST2500 is not set
+CONFIG_ASPEED_AST2600=y
+# CONFIG_ASPEED_PALLADIUM is not set
+CONFIG_ASPEED_SSP_RERV_MEM=0x0
+# CONFIG_ASPEED_DEFAULT_SPI_FREQUENCY is not set
+# CONFIG_TARGET_EVB_AST2600 is not set
+# CONFIG_TARGET_FPGA_AST2600 is not set
+CONFIG_TARGET_SIE_CRONOS=y
+# CONFIG_TARGET_SLT_AST2600 is not set
+# CONFIG_TARGET_AST2600_IBM is not set
+# CONFIG_TARGET_AST2600_INTEL is not set
+# CONFIG_TARGET_AST2600_DCSCM is not set
+# CONFIG_TARGET_QUALCOMM_DC_SCM_V1 is not set
+CONFIG_BOARD_SPECIFIC_OPTIONS=y
+# CONFIG_SPL_GPIO_SUPPORT is not set
+CONFIG_SPL_LIBCOMMON_SUPPORT=y
+CONFIG_SPL_LIBGENERIC_SUPPORT=y
+CONFIG_SYS_MALLOC_F_LEN=0x2000
+# CONFIG_TFABOOT is not set
+# CONFIG_SPL_MMC_SUPPORT is not set
+CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0xE0000
+CONFIG_SPL_SYS_MALLOC_F_LEN=0x800
+CONFIG_SPL=y
+CONFIG_IDENT_STRING=""
+CONFIG_SPL_STACK_R_ADDR=0x90300000
+# CONFIG_SPL_FS_FAT is not set
+# CONFIG_SPL_LIBDISK_SUPPORT is not set
+# CONFIG_SPL_SPI_FLASH_SUPPORT is not set
+# CONFIG_SPL_SPI_SUPPORT is not set
+CONFIG_CPU_V7_HAS_NONSEC=y
+CONFIG_ARCH_SUPPORT_PSCI=y
+CONFIG_ARMV7_NONSEC=y
+CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
+CONFIG_ARMV7_PSCI=y
+CONFIG_ARMV7_PSCI_NR_CPUS=4
+# CONFIG_ARMV7_LPAE is not set
+# CONFIG_CMD_DEKBLOB is not set
+# CONFIG_CMD_HDMIDETECT is not set
+
+#
+# ARM debug
+#
+# CONFIG_DEBUG_LL is not set
+# CONFIG_DEBUG_UART is not set
+# CONFIG_AHCI is not set
+
+#
+# General setup
+#
+CONFIG_LOCALVERSION=""
+CONFIG_LOCALVERSION_AUTO=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+# CONFIG_DISTRO_DEFAULTS is not set
+# CONFIG_ENV_VARS_UBOOT_CONFIG is not set
+CONFIG_NR_DRAM_BANKS=1
+# CONFIG_SYS_BOOT_GET_CMDLINE is not set
+# CONFIG_SYS_BOOT_GET_KBD is not set
+CONFIG_SYS_MALLOC_F=y
+CONFIG_TPL_SYS_MALLOC_F_LEN=0x800
+CONFIG_EXPERT=y
+CONFIG_SYS_MALLOC_CLEAR_ON_INIT=y
+# CONFIG_TOOLS_DEBUG is not set
+# CONFIG_PHYS_64BIT is not set
+CONFIG_BUILD_TARGET=""
+
+#
+# Boot images
+#
+# CONFIG_ANDROID_BOOT_IMAGE is not set
+CONFIG_FIT=y
+CONFIG_FIT_EXTERNAL_OFFSET=0x0
+# CONFIG_FIT_ENABLE_SHA384_SUPPORT is not set
+# CONFIG_FIT_ENABLE_SHA512_SUPPORT is not set
+CONFIG_FIT_SIGNATURE=y
+CONFIG_FIT_SIGNATURE_MAX_SIZE=0x10000000
+# CONFIG_FIT_ENABLE_RSASSA_PSS_SUPPORT is not set
+# CONFIG_FIT_VERBOSE is not set
+# CONFIG_FIT_BEST_MATCH is not set
+CONFIG_SPL_FIT=y
+CONFIG_SPL_FIT_PRINT=y
+CONFIG_SPL_FIT_SIGNATURE=y
+CONFIG_SPL_LOAD_FIT=y
+# CONFIG_SPL_LOAD_FIT_FULL is not set
+# CONFIG_SPL_FIT_IMAGE_POST_PROCESS is not set
+CONFIG_SPL_FIT_SOURCE=""
+CONFIG_SPL_FIT_GENERATOR=""
+CONFIG_IMAGE_FORMAT_LEGACY=y
+# CONFIG_OF_BOARD_SETUP is not set
+# CONFIG_OF_SYSTEM_SETUP is not set
+# CONFIG_OF_STDOUT_VIA_ALIAS is not set
+CONFIG_SYS_EXTRA_OPTIONS=""
+CONFIG_ARCH_FIXUP_FDT_MEMORY=y
+
+#
+# API
+#
+# CONFIG_API is not set
+
+#
+# Boot timing
+#
+# CONFIG_BOOTSTAGE is not set
+CONFIG_BOOTSTAGE_RECORD_COUNT=30
+CONFIG_SPL_BOOTSTAGE_RECORD_COUNT=5
+CONFIG_BOOTSTAGE_STASH_ADDR=0
+CONFIG_BOOTSTAGE_STASH_SIZE=0x1000
+
+#
+# Boot media
+#
+# CONFIG_NAND_BOOT is not set
+# CONFIG_ONENAND_BOOT is not set
+# CONFIG_QSPI_BOOT is not set
+# CONFIG_SATA_BOOT is not set
+# CONFIG_SD_BOOT is not set
+# CONFIG_SPI_BOOT is not set
+CONFIG_BOOTDELAY=2
+CONFIG_USE_BOOTARGS=y
+CONFIG_BOOTARGS="console=ttyS4,115200n8 mem.devmem=1 root=/dev/ram rw vmalloc=512M"
+CONFIG_USE_BOOTCOMMAND=y
+CONFIG_BOOTCOMMAND="bootm 20100000"
+# CONFIG_USE_PREBOOT is not set
+
+#
+# Console
+#
+# CONFIG_CONSOLE_RECORD is not set
+# CONFIG_DISABLE_CONSOLE is not set
+CONFIG_LOGLEVEL=4
+CONFIG_SPL_LOGLEVEL=4
+CONFIG_TPL_LOGLEVEL=4
+# CONFIG_SILENT_CONSOLE is not set
+# CONFIG_PRE_CONSOLE_BUFFER is not set
+# CONFIG_CONSOLE_MUX is not set
+# CONFIG_SYS_CONSOLE_IS_IN_ENV is not set
+# CONFIG_SYS_CONSOLE_OVERWRITE_ROUTINE is not set
+CONFIG_SYS_CONSOLE_ENV_OVERWRITE=y
+# CONFIG_SYS_CONSOLE_INFO_QUIET is not set
+# CONFIG_SYS_STDIO_DEREGISTER is not set
+
+#
+# Logging
+#
+# CONFIG_LOG is not set
+CONFIG_LOG_DEFAULT_LEVEL=6
+# CONFIG_SUPPORT_RAW_INITRD is not set
+CONFIG_DEFAULT_FDT_FILE=""
+CONFIG_MISC_INIT_R=y
+CONFIG_VERSION_VARIABLE=y
+# CONFIG_BOARD_LATE_INIT is not set
+CONFIG_DISPLAY_CPUINFO=y
+CONFIG_DISPLAY_BOARDINFO=y
+CONFIG_DISPLAY_BOARDINFO_LATE=y
+# CONFIG_BOUNCE_BUFFER is not set
+# CONFIG_BOARD_TYPES is not set
+
+#
+# Start-up hooks
+#
+CONFIG_ARCH_EARLY_INIT_R=y
+# CONFIG_ARCH_MISC_INIT is not set
+# CONFIG_BOARD_EARLY_INIT_F is not set
+# CONFIG_BOARD_EARLY_INIT_R is not set
+CONFIG_LAST_STAGE_INIT=y
+
+#
+# Security support
+#
+CONFIG_HASH=y
+
+#
+# Update support
+#
+# CONFIG_UPDATE_TFTP is not set
+
+#
+# Blob list
+#
+# CONFIG_BLOBLIST is not set
+
+#
+# SPL / TPL
+#
+CONFIG_SUPPORT_SPL=y
+CONFIG_SPL_FRAMEWORK=y
+# CONFIG_SPL_BOARD_INIT is not set
+# CONFIG_SPL_BOOTROM_SUPPORT is not set
+# CONFIG_SPL_RAW_IMAGE_SUPPORT is not set
+# CONFIG_SPL_LEGACY_IMAGE_SUPPORT is not set
+CONFIG_SPL_SYS_MALLOC_SIMPLE=y
+# CONFIG_TPL_SYS_MALLOC_SIMPLE is not set
+CONFIG_SPL_STACK_R=y
+CONFIG_SPL_STACK_R_MALLOC_SIMPLE_LEN=0x100000
+CONFIG_SPL_SEPARATE_BSS=y
+CONFIG_SPL_BANNER_PRINT=y
+CONFIG_TPL_BANNER_PRINT=y
+# CONFIG_SPL_DISPLAY_PRINT is not set
+CONFIG_SPL_SKIP_RELOCATE=y
+# CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR is not set
+# CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION is not set
+# CONFIG_SPL_CRC32_SUPPORT is not set
+# CONFIG_SPL_MD5_SUPPORT is not set
+# CONFIG_SPL_SHA1_SUPPORT is not set
+CONFIG_SPL_SHA256_SUPPORT=y
+# CONFIG_SPL_SHA384_SUPPORT is not set
+# CONFIG_SPL_SHA512_SUPPORT is not set
+CONFIG_SPL_FIT_IMAGE_TINY=y
+# CONFIG_SPL_CPU_SUPPORT is not set
+CONFIG_SPL_CRYPTO_SUPPORT=y
+CONFIG_SPL_HASH_SUPPORT=y
+# CONFIG_TPL_HASH_SUPPORT is not set
+# CONFIG_SPL_DMA_SUPPORT is not set
+# CONFIG_SPL_ENV_SUPPORT is not set
+# CONFIG_SPL_FS_EXT4 is not set
+# CONFIG_SPL_FAT_WRITE is not set
+# CONFIG_SPL_FPGA_SUPPORT is not set
+CONFIG_SPL_I2C_SUPPORT=y
+# CONFIG_SPL_DM_MAILBOX is not set
+# CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT is not set
+# CONFIG_SPL_MTD_SUPPORT is not set
+# CONFIG_SPL_MUSB_NEW_SUPPORT is not set
+# CONFIG_SPL_NAND_SUPPORT is not set
+# CONFIG_SPL_NET_SUPPORT is not set
+# CONFIG_SPL_NO_CPU_SUPPORT is not set
+# CONFIG_SPL_NOR_SUPPORT is not set
+# CONFIG_SPL_XIP_SUPPORT is not set
+# CONFIG_SPL_ONENAND_SUPPORT is not set
+# CONFIG_SPL_OS_BOOT is not set
+CONFIG_SPL_PAYLOAD="u-boot.bin"
+# CONFIG_SPL_PCI is not set
+# CONFIG_SPL_PCH_SUPPORT is not set
+# CONFIG_SPL_POST_MEM_SUPPORT is not set
+CONFIG_SPL_DM_RESET=y
+# CONFIG_SPL_POWER_SUPPORT is not set
+# CONFIG_SPL_POWER_DOMAIN is not set
+CONFIG_SPL_RAM_SUPPORT=y
+CONFIG_SPL_RAM_DEVICE=y
+# CONFIG_SPL_REMOTEPROC is not set
+# CONFIG_SPL_RTC_SUPPORT is not set
+# CONFIG_SPL_SATA_SUPPORT is not set
+# CONFIG_SPL_THERMAL is not set
+# CONFIG_SPL_USB_HOST_SUPPORT is not set
+# CONFIG_SPL_USB_GADGET is not set
+CONFIG_SPL_WATCHDOG_SUPPORT=y
+# CONFIG_SPL_YMODEM_SUPPORT is not set
+# CONFIG_SPL_AM33XX_ENABLE_RTC32K_OSC is not set
+# CONFIG_SPL_OPTEE is not set
+
+#
+# Command line interface
+#
+CONFIG_CMDLINE=y
+CONFIG_HUSH_PARSER=y
+CONFIG_CMDLINE_EDITING=y
+# CONFIG_AUTO_COMPLETE is not set
+CONFIG_SYS_LONGHELP=y
+CONFIG_SYS_PROMPT="ast# "
+
+#
+# Autoboot options
+#
+CONFIG_AUTOBOOT=y
+# CONFIG_AUTOBOOT_KEYED is not set
+
+#
+# Commands
+#
+
+#
+# Info commands
+#
+CONFIG_CMD_BDI=y
+# CONFIG_CMD_CONFIG is not set
+CONFIG_CMD_CONSOLE=y
+# CONFIG_CMD_CPU is not set
+# CONFIG_CMD_LICENSE is not set
+
+#
+# Boot commands
+#
+CONFIG_CMD_BOOTD=y
+CONFIG_CMD_BOOTM=y
+CONFIG_CMD_BOOTZ=y
+# CONFIG_CMD_BOOTEFI is not set
+# CONFIG_CMD_BOOTMENU is not set
+# CONFIG_CMD_DTIMG is not set
+# CONFIG_CMD_ELF is not set
+CONFIG_CMD_FDT=y
+CONFIG_CMD_GO=y
+CONFIG_CMD_RUN=y
+# CONFIG_CMD_IMI is not set
+# CONFIG_CMD_IMLS is not set
+# CONFIG_CMD_XIMG is not set
+# CONFIG_CMD_SPL is not set
+# CONFIG_CMD_FITUPD is not set
+# CONFIG_CMD_THOR_DOWNLOAD is not set
+# CONFIG_CMD_ZBOOT is not set
+
+#
+# Environment commands
+#
+# CONFIG_CMD_ASKENV is not set
+CONFIG_CMD_EXPORTENV=y
+CONFIG_CMD_IMPORTENV=y
+CONFIG_CMD_EDITENV=y
+# CONFIG_CMD_GREPENV is not set
+CONFIG_CMD_SAVEENV=y
+CONFIG_CMD_ENV_EXISTS=y
+# CONFIG_CMD_ENV_CALLBACK is not set
+# CONFIG_CMD_ENV_FLAGS is not set
+# CONFIG_CMD_NVEDIT_EFI is not set
+
+#
+# Memory commands
+#
+# CONFIG_CMD_BINOP is not set
+CONFIG_CMD_CRC32=y
+# CONFIG_CRC32_VERIFY is not set
+# CONFIG_LOOPW is not set
+# CONFIG_CMD_MD5SUM is not set
+# CONFIG_CMD_MEMINFO is not set
+CONFIG_CMD_MEMORY=y
+CONFIG_CMD_MEMTEST=y
+CONFIG_SYS_ALT_MEMTEST=y
+# CONFIG_CMD_MX_CYCLIC is not set
+# CONFIG_CMD_SHA1SUM is not set
+# CONFIG_CMD_STRINGS is not set
+
+#
+# Compression commands
+#
+# CONFIG_CMD_LZMADEC is not set
+# CONFIG_CMD_UNZIP is not set
+# CONFIG_CMD_ZIP is not set
+
+#
+# Device access commands
+#
+# CONFIG_CMD_RNG is not set
+# CONFIG_CMD_ARMFLASH is not set
+# CONFIG_CMD_ADC is not set
+# CONFIG_CMD_BIND is not set
+CONFIG_CMD_CLK=y
+# CONFIG_CMD_DEMO is not set
+# CONFIG_CMD_DFU is not set
+CONFIG_CMD_DM=y
+# CONFIG_CMD_FDC is not set
+CONFIG_CMD_FLASH=y
+# CONFIG_CMD_FPGAD is not set
+# CONFIG_CMD_FUSE is not set
+CONFIG_CMD_GPIO=y
+# CONFIG_CMD_GPT is not set
+# CONFIG_RANDOM_UUID is not set
+# CONFIG_CMD_IDE is not set
+# CONFIG_CMD_IO is not set
+# CONFIG_CMD_IOTRACE is not set
+CONFIG_CMD_I2C=y
+CONFIG_CMD_LOADB=y
+CONFIG_CMD_LOADS=y
+CONFIG_CMD_MMC=y
+# CONFIG_CMD_MMC_RPMB is not set
+# CONFIG_CMD_MMC_SWRITE is not set
+# CONFIG_CMD_MTD is not set
+# CONFIG_CMD_NAND is not set
+# CONFIG_CMD_MMC_SPI is not set
+# CONFIG_CMD_ONENAND is not set
+# CONFIG_CMD_OSD is not set
+CONFIG_CMD_PART=y
+CONFIG_CMD_PCI=y
+# CONFIG_CMD_PCMCIA is not set
+CONFIG_CMD_PINMUX=y
+# CONFIG_CMD_POWEROFF is not set
+# CONFIG_CMD_READ is not set
+# CONFIG_CMD_SATA is not set
+# CONFIG_CMD_SAVES is not set
+# CONFIG_CMD_SCSI is not set
+# CONFIG_CMD_SDRAM is not set
+CONFIG_CMD_SF=y
+# CONFIG_CMD_SF_TEST is not set
+# CONFIG_CMD_SPI is not set
+# CONFIG_CMD_TSI148 is not set
+# CONFIG_CMD_UNIVERSE is not set
+CONFIG_CMD_USB=y
+# CONFIG_CMD_USB_SDP is not set
+# CONFIG_CMD_USB_MASS_STORAGE is not set
+
+#
+# Shell scripting commands
+#
+CONFIG_CMD_ECHO=y
+CONFIG_CMD_ITEST=y
+CONFIG_CMD_SOURCE=y
+CONFIG_CMD_SETEXPR=y
+CONFIG_CMD_NET=y
+CONFIG_CMD_BOOTP=y
+CONFIG_CMD_DHCP=y
+CONFIG_BOOTP_BOOTPATH=y
+CONFIG_BOOTP_DNS=y
+# CONFIG_BOOTP_DNS2 is not set
+CONFIG_BOOTP_GATEWAY=y
+CONFIG_BOOTP_HOSTNAME=y
+# CONFIG_BOOTP_PREFER_SERVERIP is not set
+CONFIG_BOOTP_SUBNETMASK=y
+# CONFIG_BOOTP_NTPSERVER is not set
+CONFIG_BOOTP_VCI_STRING="U-Boot.armv7"
+CONFIG_CMD_TFTPBOOT=y
+# CONFIG_CMD_TFTPPUT is not set
+# CONFIG_CMD_TFTPSRV is not set
+CONFIG_NET_TFTP_VARS=y
+# CONFIG_CMD_RARP is not set
+CONFIG_CMD_NFS=y
+CONFIG_CMD_MII=y
+CONFIG_CMD_PING=y
+# CONFIG_CMD_CDP is not set
+# CONFIG_CMD_SNTP is not set
+# CONFIG_CMD_DNS is not set
+# CONFIG_CMD_LINK_LOCAL is not set
+# CONFIG_CMD_ETHSW is not set
+# CONFIG_CMD_PXE is not set
+# CONFIG_CMD_WOL is not set
+
+#
+# Misc commands
+#
+# CONFIG_CMD_BSP is not set
+# CONFIG_CMD_BKOPS_ENABLE is not set
+CONFIG_CMD_BLOCK_CACHE=y
+# CONFIG_CMD_CACHE is not set
+# CONFIG_CMD_CONITRACE is not set
+# CONFIG_CMD_DISPLAY is not set
+# CONFIG_CMD_EFIDEBUG is not set
+# CONFIG_CMD_DATE is not set
+# CONFIG_CMD_TIME is not set
+# CONFIG_CMD_GETTIME is not set
+CONFIG_CMD_MISC=y
+# CONFIG_MP is not set
+# CONFIG_CMD_TIMER is not set
+# CONFIG_CMD_QFW is not set
+# CONFIG_CMD_TERMINAL is not set
+# CONFIG_CMD_UUID is not set
+
+#
+# TI specific command line interface
+#
+# CONFIG_CMD_DDR3 is not set
+
+#
+# Power commands
+#
+
+#
+# Security commands
+#
+# CONFIG_CMD_AES is not set
+# CONFIG_CMD_BLOB is not set
+CONFIG_CMD_HASH=y
+
+#
+# Firmware commands
+#
+
+#
+# Filesystem commands
+#
+# CONFIG_CMD_BTRFS is not set
+CONFIG_CMD_EXT2=y
+CONFIG_CMD_EXT4=y
+CONFIG_CMD_EXT4_WRITE=y
+CONFIG_CMD_FAT=y
+CONFIG_CMD_FS_GENERIC=y
+# CONFIG_CMD_FS_UUID is not set
+# CONFIG_CMD_JFFS2 is not set
+CONFIG_CMD_MTDPARTS=y
+CONFIG_MTDIDS_DEFAULT=""
+CONFIG_MTDPARTS_DEFAULT=""
+# CONFIG_CMD_MTDPARTS_SPREAD is not set
+# CONFIG_CMD_REISER is not set
+# CONFIG_CMD_ZFS is not set
+
+#
+# Debug commands
+#
+# CONFIG_CMD_BEDBUG is not set
+# CONFIG_CMD_DIAG is not set
+# CONFIG_CMD_LOG is not set
+# CONFIG_CMD_TRACE is not set
+# CONFIG_CMD_UBI is not set
+
+#
+# ASPEED Test commands
+#
+CONFIG_CMD_NETTEST=y
+CONFIG_CMD_DRAMTEST=y
+CONFIG_CMD_PECITEST=y
+# CONFIG_CMD_PLLTEST is not set
+# CONFIG_CMD_DPTEST is not set
+
+#
+# Partition Types
+#
+CONFIG_PARTITIONS=y
+# CONFIG_MAC_PARTITION is not set
+# CONFIG_SPL_MAC_PARTITION is not set
+CONFIG_DOS_PARTITION=y
+# CONFIG_SPL_DOS_PARTITION is not set
+# CONFIG_ISO_PARTITION is not set
+# CONFIG_SPL_ISO_PARTITION is not set
+# CONFIG_AMIGA_PARTITION is not set
+# CONFIG_SPL_AMIGA_PARTITION is not set
+CONFIG_EFI_PARTITION=y
+CONFIG_EFI_PARTITION_ENTRIES_NUMBERS=128
+CONFIG_EFI_PARTITION_ENTRIES_OFF=0
+# CONFIG_SPL_EFI_PARTITION is not set
+CONFIG_PARTITION_UUIDS=y
+# CONFIG_SPL_PARTITION_UUIDS is not set
+# CONFIG_PARTITION_TYPE_GUID is not set
+CONFIG_SUPPORT_OF_CONTROL=y
+CONFIG_DTC=y
+
+#
+# Device Tree Control
+#
+CONFIG_OF_CONTROL=y
+# CONFIG_OF_BOARD_FIXUP is not set
+CONFIG_SPL_OF_CONTROL=y
+# CONFIG_OF_LIVE is not set
+CONFIG_OF_SEPARATE=y
+# CONFIG_OF_EMBED is not set
+# CONFIG_OF_BOARD is not set
+# CONFIG_OF_PRIOR_STAGE is not set
+CONFIG_DEFAULT_DEVICE_TREE=""
+CONFIG_OF_LIST=""
+# CONFIG_MULTI_DTB_FIT is not set
+# CONFIG_SPL_MULTI_DTB_FIT is not set
+CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names interrupt-parent"
+# CONFIG_SPL_OF_PLATDATA is not set
+CONFIG_MKIMAGE_DTC_PATH="dtc"
+
+#
+# Environment
+#
+# CONFIG_ENV_IS_IN_EEPROM is not set
+# CONFIG_ENV_IS_IN_FAT is not set
+# CONFIG_ENV_IS_IN_EXT4 is not set
+# CONFIG_ENV_IS_IN_FLASH is not set
+# CONFIG_ENV_IS_IN_MMC is not set
+# CONFIG_ENV_IS_IN_NAND is not set
+# CONFIG_ENV_IS_IN_NVRAM is not set
+# CONFIG_ENV_IS_IN_ONENAND is not set
+# CONFIG_ENV_IS_IN_REMOTE is not set
+CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_USE_ENV_SPI_BUS=y
+CONFIG_ENV_SPI_BUS=0
+CONFIG_USE_ENV_SPI_CS=y
+CONFIG_ENV_SPI_CS=0
+CONFIG_USE_ENV_SPI_MAX_HZ=y
+CONFIG_ENV_SPI_MAX_HZ=100000000
+# CONFIG_USE_ENV_SPI_MODE is not set
+# CONFIG_ENV_IS_IN_UBI is not set
+# CONFIG_USE_DEFAULT_ENV_FILE is not set
+# CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG is not set
+CONFIG_NET=y
+CONFIG_NET_RANDOM_ETHADDR=y
+# CONFIG_NETCONSOLE is not set
+
+#
+# Device Drivers
+#
+
+#
+# Generic Driver Options
+#
+CONFIG_DM=y
+CONFIG_SPL_DM=y
+CONFIG_DM_WARN=y
+# CONFIG_DM_DEBUG is not set
+CONFIG_DM_DEVICE_REMOVE=y
+# CONFIG_SPL_DM_DEVICE_REMOVE is not set
+CONFIG_DM_STDIO=y
+CONFIG_DM_SEQ_ALIAS=y
+# CONFIG_SPL_DM_SEQ_ALIAS is not set
+CONFIG_REGMAP=y
+# CONFIG_SPL_REGMAP is not set
+CONFIG_SYSCON=y
+# CONFIG_DEVRES is not set
+CONFIG_SIMPLE_BUS=y
+CONFIG_SPL_SIMPLE_BUS=y
+CONFIG_OF_TRANSLATE=y
+CONFIG_SPL_OF_TRANSLATE=y
+CONFIG_DM_DEV_READ_INLINE=y
+# CONFIG_ADC is not set
+# CONFIG_ADC_EXYNOS is not set
+# CONFIG_ADC_SANDBOX is not set
+# CONFIG_SARADC_MESON is not set
+# CONFIG_SARADC_ROCKCHIP is not set
+# CONFIG_SATA is not set
+# CONFIG_SCSI_AHCI is not set
+
+#
+# SATA/SCSI device support
+#
+# CONFIG_DWC_AHSATA is not set
+# CONFIG_FSL_SATA is not set
+# CONFIG_MVSATA_IDE is not set
+# CONFIG_SATA_MV is not set
+# CONFIG_SATA_SIL is not set
+# CONFIG_SATA_SIL3114 is not set
+# CONFIG_AXI is not set
+CONFIG_BLK=y
+CONFIG_HAVE_BLOCK_DEVICE=y
+CONFIG_SPL_BLK=y
+CONFIG_BLOCK_CACHE=y
+# CONFIG_SPL_BLOCK_CACHE is not set
+# CONFIG_IDE is not set
+# CONFIG_BOOTCOUNT_LIMIT is not set
+
+#
+# Clock
+#
+CONFIG_CLK=y
+CONFIG_SPL_CLK=y
+# CONFIG_CLK_HSDK is not set
+# CONFIG_CLK_AT91 is not set
+# CONFIG_CLK_SIFIVE is not set
+# CONFIG_ICS8N3QV01 is not set
+# CONFIG_CLK_MPC83XX is not set
+# CONFIG_CPU is not set
+
+#
+# Hardware crypto devices
+#
+CONFIG_ASPEED_HACE=y
+# CONFIG_ASPEED_ACRY is not set
+# CONFIG_FSL_CAAM is not set
+# CONFIG_SYS_FSL_SEC_BE is not set
+# CONFIG_SYS_FSL_SEC_LE is not set
+# CONFIG_IMX8M_DRAM is not set
+# CONFIG_IMX8M_LPDDR4 is not set
+# CONFIG_IMX8M_DDR4 is not set
+CONFIG_SAVED_DRAM_TIMING_BASE=0x180000
+
+#
+# Demo for driver model
+#
+# CONFIG_DM_DEMO is not set
+# CONFIG_BOARD is not set
+
+#
+# DFU support
+#
+
+#
+# DMA Support
+#
+# CONFIG_DMA is not set
+# CONFIG_TI_EDMA3 is not set
+CONFIG_ASPEED_SPI_DMA=y
+
+#
+# Fastboot support
+#
+# CONFIG_UDP_FUNCTION_FASTBOOT is not set
+# CONFIG_FIRMWARE is not set
+
+#
+# FPGA support
+#
+# CONFIG_FPGA_ALTERA is not set
+# CONFIG_FPGA_SOCFPGA is not set
+# CONFIG_FPGA_XILINX is not set
+# CONFIG_FPGA_SPARTAN3 is not set
+# CONFIG_FPGA_ASPEED is not set
+
+#
+# GPIO Support
+#
+CONFIG_DM_GPIO=y
+# CONFIG_GPIO_HOG is not set
+# CONFIG_ALTERA_PIO is not set
+# CONFIG_DWAPB_GPIO is not set
+# CONFIG_AT91_GPIO is not set
+# CONFIG_ATMEL_PIO4 is not set
+CONFIG_ASPEED_GPIO=y
+# CONFIG_DA8XX_GPIO is not set
+# CONFIG_INTEL_BROADWELL_GPIO is not set
+# CONFIG_INTEL_ICH6_GPIO is not set
+# CONFIG_IMX_RGPIO2P is not set
+# CONFIG_HSDK_CREG_GPIO is not set
+# CONFIG_LPC32XX_GPIO is not set
+# CONFIG_MSM_GPIO is not set
+# CONFIG_MXC_GPIO is not set
+# CONFIG_CMD_PCA953X is not set
+# CONFIG_PCF8575_GPIO is not set
+# CONFIG_ROCKCHIP_GPIO is not set
+# CONFIG_XILINX_GPIO is not set
+# CONFIG_CMD_TCA642X is not set
+# CONFIG_TEGRA_GPIO is not set
+# CONFIG_TEGRA186_GPIO is not set
+# CONFIG_VYBRID_GPIO is not set
+# CONFIG_DM_74X164 is not set
+# CONFIG_DM_PCA953X is not set
+# CONFIG_SPL_DM_PCA953X is not set
+# CONFIG_MPC8XXX_GPIO is not set
+
+#
+# Hardware Spinlock Support
+#
+# CONFIG_DM_HWSPINLOCK is not set
+
+#
+# I2C support
+#
+CONFIG_DM_I2C=y
+# CONFIG_DM_I2C_COMPAT is not set
+# CONFIG_I2C_SET_DEFAULT_BUS_NUM is not set
+# CONFIG_DM_I2C_GPIO is not set
+# CONFIG_SYS_I2C_FSL is not set
+# CONFIG_SYS_I2C_DW is not set
+CONFIG_I2C_ASPEED_GLOBAL=y
+# CONFIG_SYS_I2C_AST2600 is not set
+CONFIG_SYS_I2C_ASPEED=y
+# CONFIG_SYS_I2C_INTEL is not set
+# CONFIG_SYS_I2C_IMX_LPI2C is not set
+# CONFIG_SYS_I2C_MXC is not set
+# CONFIG_SYS_I2C_ROCKCHIP is not set
+# CONFIG_SYS_I2C_MVTWSI is not set
+# CONFIG_SYS_I2C_XILINX_XIIC is not set
+# CONFIG_SYS_I2C_IHS is not set
+# CONFIG_I2C_MUX is not set
+CONFIG_INPUT=y
+# CONFIG_SPL_INPUT is not set
+# CONFIG_DM_KEYBOARD is not set
+# CONFIG_SPL_DM_KEYBOARD is not set
+# CONFIG_CROS_EC_KEYB is not set
+# CONFIG_TEGRA_KEYBOARD is not set
+# CONFIG_TWL4030_INPUT is not set
+
+#
+# LED Support
+#
+# CONFIG_LED is not set
+# CONFIG_SPL_LED is not set
+# CONFIG_LED_STATUS is not set
+
+#
+# Mailbox Controller Support
+#
+# CONFIG_DM_MAILBOX is not set
+
+#
+# Memory Controller drivers
+#
+
+#
+# Multifunction device drivers
+#
+CONFIG_MISC=y
+CONFIG_ASPEED_AHBC=y
+# CONFIG_ASPEED_DP is not set
+# CONFIG_ASPEED_FSI is not set
+# CONFIG_ALTERA_SYSID is not set
+# CONFIG_ATSHA204A is not set
+# CONFIG_ROCKCHIP_EFUSE is not set
+# CONFIG_VEXPRESS_CONFIG is not set
+# CONFIG_CROS_EC is not set
+# CONFIG_DS4510 is not set
+# CONFIG_FSL_SEC_MON is not set
+# CONFIG_MXC_OCOTP is not set
+# CONFIG_NUVOTON_NCT6102D is not set
+# CONFIG_PWRSEQ is not set
+# CONFIG_PCA9551_LED is not set
+# CONFIG_TWL4030_LED is not set
+# CONFIG_WINBOND_W83627 is not set
+CONFIG_I2C_EEPROM=y
+# CONFIG_SPL_I2C_EEPROM is not set
+CONFIG_ZYNQ_GEM_I2C_MAC_OFFSET=0x0
+CONFIG_SYS_I2C_EEPROM_ADDR=0
+CONFIG_SYS_I2C_EEPROM_BUS=0
+CONFIG_SYS_EEPROM_SIZE=256
+CONFIG_SYS_EEPROM_PAGE_WRITE_BITS=0
+CONFIG_SYS_EEPROM_PAGE_WRITE_DELAY_MS=0
+CONFIG_SYS_I2C_EEPROM_ADDR_LEN=1
+CONFIG_SYS_I2C_EEPROM_ADDR_OVERFLOW=0
+# CONFIG_GDSYS_RXAUI_CTRL is not set
+# CONFIG_GDSYS_IOEP is not set
+# CONFIG_MPC83XX_SERDES is not set
+# CONFIG_FS_LOADER is not set
+# CONFIG_GDSYS_SOC is not set
+# CONFIG_IHS_FPGA is not set
+
+#
+# MMC Host controller Support
+#
+CONFIG_MMC=y
+CONFIG_MMC_WRITE=y
+# CONFIG_MMC_BROKEN_CD is not set
+CONFIG_DM_MMC=y
+CONFIG_SPL_DM_MMC=y
+# CONFIG_ARM_PL180_MMCI is not set
+CONFIG_MMC_QUIRKS=y
+CONFIG_MMC_HW_PARTITIONING=y
+# CONFIG_SUPPORT_EMMC_RPMB is not set
+# CONFIG_MMC_IO_VOLTAGE is not set
+# CONFIG_SPL_MMC_IO_VOLTAGE is not set
+# CONFIG_MMC_HS400_SUPPORT is not set
+# CONFIG_SPL_MMC_HS400_SUPPORT is not set
+# CONFIG_MMC_HS200_SUPPORT is not set
+# CONFIG_SPL_MMC_HS200_SUPPORT is not set
+CONFIG_MMC_VERBOSE=y
+# CONFIG_MMC_TRACE is not set
+# CONFIG_SPL_MMC_TINY is not set
+# CONFIG_MMC_DW is not set
+# CONFIG_MMC_MXC is not set
+# CONFIG_MMC_PCI is not set
+# CONFIG_MMC_OMAP_HS is not set
+CONFIG_MMC_SDHCI=y
+# CONFIG_MMC_SDHCI_SDMA is not set
+CONFIG_MMC_SDHCI_ASPEED=y
+# CONFIG_MMC_SDHCI_BCMSTB is not set
+# CONFIG_MMC_SDHCI_CADENCE is not set
+# CONFIG_MMC_SDHCI_KONA is not set
+# CONFIG_MMC_SDHCI_MSM is not set
+# CONFIG_MMC_SDHCI_S5P is not set
+# CONFIG_MMC_SDHCI_SPEAR is not set
+# CONFIG_MMC_SDHCI_STI is not set
+# CONFIG_MMC_SDHCI_XENON is not set
+# CONFIG_MMC_SDHCI_TANGIER is not set
+# CONFIG_STM32_SDMMC2 is not set
+# CONFIG_FTSDC010 is not set
+# CONFIG_FSL_ESDHC is not set
+
+#
+# MTD Support
+#
+# CONFIG_MTD is not set
+# CONFIG_MTD_NOR_FLASH is not set
+# CONFIG_MTD_DEVICE is not set
+# CONFIG_FLASH_CFI_DRIVER is not set
+# CONFIG_NAND is not set
+
+#
+# SPI Flash Support
+#
+CONFIG_DM_SPI_FLASH=y
+CONFIG_SPI_FLASH=y
+CONFIG_SF_DEFAULT_BUS=0
+CONFIG_SF_DEFAULT_CS=0
+CONFIG_SF_DEFAULT_MODE=3
+CONFIG_SF_DEFAULT_SPEED=1000000
+# CONFIG_SPI_FLASH_SFDP_SUPPORT is not set
+# CONFIG_SPI_FLASH_BAR is not set
+# CONFIG_SF_DUAL_FLASH is not set
+# CONFIG_SPI_FLASH_ATMEL is not set
+# CONFIG_SPI_FLASH_EON is not set
+CONFIG_SPI_FLASH_GIGADEVICE=y
+# CONFIG_SPI_FLASH_ISSI is not set
+CONFIG_SPI_FLASH_MACRONIX=y
+CONFIG_SPI_FLASH_SPANSION=y
+CONFIG_SPI_FLASH_STMICRO=y
+# CONFIG_SPI_FLASH_SST is not set
+CONFIG_SPI_FLASH_WINBOND=y
+# CONFIG_SPI_FLASH_XMC is not set
+# CONFIG_SPI_FLASH_XTX is not set
+CONFIG_SPI_FLASH_USE_4K_SECTORS=y
+# CONFIG_SPI_FLASH_DATAFLASH is not set
+# CONFIG_SPI_FLASH_MTD is not set
+
+#
+# UBI support
+#
+# CONFIG_CONFIG_UBI_SILENCE_MSG is not set
+# CONFIG_MTD_UBI is not set
+# CONFIG_BITBANGMII is not set
+# CONFIG_MV88E6352_SWITCH is not set
+CONFIG_PHYLIB=y
+# CONFIG_PHY_ADDR_ENABLE is not set
+# CONFIG_B53_SWITCH is not set
+# CONFIG_MV88E61XX_SWITCH is not set
+# CONFIG_PHYLIB_10G is not set
+# CONFIG_PHY_AQUANTIA is not set
+# CONFIG_PHY_ATHEROS is not set
+# CONFIG_PHY_BROADCOM is not set
+# CONFIG_PHY_CORTINA is not set
+# CONFIG_PHY_DAVICOM is not set
+# CONFIG_PHY_ET1011C is not set
+# CONFIG_PHY_LXT is not set
+CONFIG_PHY_MARVELL=y
+# CONFIG_PHY_MESON_GXL is not set
+# CONFIG_PHY_MICREL is not set
+# CONFIG_PHY_MSCC is not set
+# CONFIG_PHY_NATSEMI is not set
+CONFIG_PHY_REALTEK=y
+# CONFIG_RTL8211E_PINE64_GIGABIT_FIX is not set
+# CONFIG_RTL8211X_PHY_FORCE_MASTER is not set
+# CONFIG_PHY_SMSC is not set
+# CONFIG_PHY_TERANETICS is not set
+# CONFIG_PHY_TI is not set
+# CONFIG_PHY_VITESSE is not set
+# CONFIG_PHY_XILINX is not set
+# CONFIG_PHY_FIXED is not set
+# CONFIG_PHY_NCSI is not set
+# CONFIG_PHY_AIROHA is not set
+# CONFIG_FSL_PFE is not set
+CONFIG_DM_ETH=y
+CONFIG_NETDEVICES=y
+CONFIG_PHY_GIGE=y
+# CONFIG_ALTERA_TSE is not set
+# CONFIG_BCM_SF2_ETH is not set
+# CONFIG_DWC_ETH_QOS is not set
+# CONFIG_E1000 is not set
+# CONFIG_ETH_DESIGNWARE is not set
+# CONFIG_ETHOC is not set
+# CONFIG_FTMAC100 is not set
+CONFIG_FTGMAC100=y
+# CONFIG_MACB is not set
+# CONFIG_PCH_GBE is not set
+CONFIG_RGMII=y
+# CONFIG_MII is not set
+# CONFIG_RTL8139 is not set
+# CONFIG_RTL8169 is not set
+# CONFIG_SMC911X is not set
+# CONFIG_SUN7I_GMAC is not set
+# CONFIG_SUN4I_EMAC is not set
+# CONFIG_SUN8I_EMAC is not set
+# CONFIG_SH_ETHER is not set
+# CONFIG_DRIVER_TI_CPSW is not set
+# CONFIG_DRIVER_TI_EMAC is not set
+# CONFIG_DRIVER_TI_KEYSTONE_NET is not set
+# CONFIG_SYS_DPAA_QBMAN is not set
+# CONFIG_TSEC_ENET is not set
+# CONFIG_MEDIATEK_ETH is not set
+
+#
+# MDIO Support
+#
+CONFIG_MDIO=y
+# CONFIG_NVME is not set
+CONFIG_PCI=y
+CONFIG_DM_PCI=y
+# CONFIG_DM_PCI_COMPAT is not set
+CONFIG_PCI_PNP=y
+CONFIG_PCIE_ASPEED=y
+# CONFIG_PCIE_ECAM_GENERIC is not set
+# CONFIG_PCI_XILINX is not set
+# CONFIG_PCIE_LAYERSCAPE is not set
+# CONFIG_PCIE_INTEL_FPGA is not set
+
+#
+# PHY Subsystem
+#
+CONFIG_PHY=y
+# CONFIG_SPL_PHY is not set
+# CONFIG_NOP_PHY is not set
+# CONFIG_MSM8916_USB_PHY is not set
+# CONFIG_OMAP_USB2_PHY is not set
+# CONFIG_MVEBU_COMPHY_SUPPORT is not set
+
+#
+# Pin controllers
+#
+CONFIG_PINCTRL=y
+CONFIG_PINCTRL_FULL=y
+CONFIG_PINCTRL_GENERIC=y
+CONFIG_PINMUX=y
+# CONFIG_PINCONF is not set
+# CONFIG_SPL_PINCTRL is not set
+# CONFIG_PINCTRL_AT91 is not set
+# CONFIG_PINCTRL_AT91PIO4 is not set
+# CONFIG_PINCTRL_ROCKCHIP_RV1108 is not set
+# CONFIG_PINCTRL_SINGLE is not set
+# CONFIG_PINCTRL_STM32 is not set
+CONFIG_ASPEED_AST2600_PINCTRL=y
+
+#
+# Power
+#
+
+#
+# Power Domain Support
+#
+# CONFIG_POWER_DOMAIN is not set
+# CONFIG_DM_PMIC is not set
+# CONFIG_PMIC_AS3722 is not set
+# CONFIG_POWER_MC34VR500 is not set
+# CONFIG_DM_REGULATOR is not set
+# CONFIG_DM_PWM is not set
+# CONFIG_PWM_SANDBOX is not set
+# CONFIG_U_QE is not set
+CONFIG_RAM=y
+CONFIG_SPL_RAM=y
+# CONFIG_STM32_SDRAM is not set
+# CONFIG_MPC83XX_SDRAM is not set
+# CONFIG_ASPEED_DDR4_400 is not set
+# CONFIG_ASPEED_DDR4_800 is not set
+# CONFIG_ASPEED_DDR4_1333 is not set
+CONFIG_ASPEED_DDR4_1600=y
+# CONFIG_ASPEED_DDR4_DUALX8 is not set
+# CONFIG_ASPEED_BYPASS_SELFTEST is not set
+CONFIG_ASPEED_DDR4_PHY_ODT80=y
+# CONFIG_ASPEED_DDR4_PHY_ODT60 is not set
+# CONFIG_ASPEED_DDR4_PHY_ODT48 is not set
+# CONFIG_ASPEED_DDR4_PHY_ODT40 is not set
+# CONFIG_ASPEED_DDR4_DRAM_ODT80 is not set
+# CONFIG_ASPEED_DDR4_DRAM_ODT60 is not set
+CONFIG_ASPEED_DDR4_DRAM_ODT48=y
+# CONFIG_ASPEED_DDR4_DRAM_ODT40 is not set
+CONFIG_ASPEED_DDR4_DRAM_RON_34=y
+# CONFIG_ASPEED_DDR4_DRAM_RON_48 is not set
+CONFIG_ASPEED_DDR4_WR_DATA_EYE_TRAINING_RESULT_OFFSET=0x10
+
+#
+# Remote Processor drivers
+#
+
+#
+# Reset Controller Support
+#
+CONFIG_DM_RESET=y
+CONFIG_RESET_AST2600=y
+
+#
+# Real Time Clock
+#
+# CONFIG_DM_RTC is not set
+# CONFIG_SPL_DM_RTC is not set
+# CONFIG_RTC_PL031 is not set
+# CONFIG_RTC_S35392A is not set
+# CONFIG_RTC_MC146818 is not set
+# CONFIG_RTC_M41T62 is not set
+# CONFIG_SCSI is not set
+# CONFIG_DM_SCSI is not set
+
+#
+# Serial drivers
+#
+CONFIG_BAUDRATE=115200
+CONFIG_REQUIRE_SERIAL_CONSOLE=y
+# CONFIG_SPECIFY_CONSOLE_INDEX is not set
+CONFIG_SERIAL_PRESENT=y
+CONFIG_SPL_SERIAL_PRESENT=y
+CONFIG_TPL_SERIAL_PRESENT=y
+CONFIG_DM_SERIAL=y
+# CONFIG_SERIAL_RX_BUFFER is not set
+# CONFIG_SERIAL_SEARCH_ALL is not set
+CONFIG_SPL_DM_SERIAL=y
+# CONFIG_TPL_DM_SERIAL is not set
+# CONFIG_ALTERA_JTAG_UART is not set
+# CONFIG_ALTERA_UART is not set
+# CONFIG_ARC_SERIAL is not set
+# CONFIG_ATMEL_USART is not set
+# CONFIG_BCM6345_SERIAL is not set
+# CONFIG_FSL_LINFLEXUART is not set
+# CONFIG_FSL_LPUART is not set
+# CONFIG_MVEBU_A3700_UART is not set
+# CONFIG_NULLDEV_SERIAL is not set
+CONFIG_SYS_NS16550=y
+# CONFIG_PL01X_SERIAL is not set
+# CONFIG_MSM_SERIAL is not set
+# CONFIG_OMAP_SERIAL is not set
+# CONFIG_PXA_SERIAL is not set
+# CONFIG_SIFIVE_SERIAL is not set
+# CONFIG_MTK_SERIAL is not set
+# CONFIG_SMEM is not set
+
+#
+# Sound support
+#
+# CONFIG_SOUND is not set
+CONFIG_SPI=y
+CONFIG_DM_SPI=y
+CONFIG_SPI_MEM=y
+# CONFIG_ALTERA_SPI is not set
+CONFIG_ASPEED_SPI=y
+# CONFIG_ASPEED_SPI_FLASH_WRITE_PROTECTION is not set
+# CONFIG_ATCSPI200_SPI is not set
+# CONFIG_ATMEL_SPI is not set
+# CONFIG_BCMSTB_SPI is not set
+# CONFIG_CADENCE_QSPI is not set
+# CONFIG_DESIGNWARE_SPI is not set
+# CONFIG_EXYNOS_SPI is not set
+# CONFIG_FSL_DSPI is not set
+# CONFIG_ICH_SPI is not set
+# CONFIG_MTK_QSPI is not set
+# CONFIG_MVEBU_A3700_SPI is not set
+# CONFIG_PL022_SPI is not set
+# CONFIG_ROCKCHIP_SPI is not set
+# CONFIG_SPI_SUNXI is not set
+# CONFIG_TEGRA114_SPI is not set
+# CONFIG_TEGRA20_SFLASH is not set
+# CONFIG_TEGRA20_SLINK is not set
+# CONFIG_TEGRA210_QSPI is not set
+# CONFIG_XILINX_SPI is not set
+# CONFIG_SOFT_SPI is not set
+# CONFIG_CF_SPI is not set
+# CONFIG_FSL_ESPI is not set
+# CONFIG_FSL_QSPI is not set
+# CONFIG_SH_SPI is not set
+# CONFIG_SH_QSPI is not set
+# CONFIG_TI_QSPI is not set
+# CONFIG_KIRKWOOD_SPI is not set
+# CONFIG_LPC32XX_SSP is not set
+# CONFIG_MPC8XXX_SPI is not set
+# CONFIG_MXC_SPI is not set
+# CONFIG_MXS_SPI is not set
+# CONFIG_OMAP3_SPI is not set
+
+#
+# SPMI support
+#
+# CONFIG_SPMI is not set
+
+#
+# System reset device drivers
+#
+CONFIG_SYSRESET=y
+# CONFIG_SYSRESET_GPIO is not set
+# CONFIG_SYSRESET_SYSCON is not set
+# CONFIG_SYSRESET_WATCHDOG is not set
+# CONFIG_SYSRESET_MCP83XX is not set
+# CONFIG_TEE is not set
+# CONFIG_OPTEE is not set
+# CONFIG_DM_THERMAL is not set
+
+#
+# Timer Support
+#
+# CONFIG_TIMER is not set
+
+#
+# TPM support
+#
+CONFIG_USB=y
+CONFIG_DM_USB=y
+CONFIG_SPL_DM_USB=y
+# CONFIG_DM_USB_GADGET is not set
+# CONFIG_SPL_DM_USB_GADGET is not set
+
+#
+# USB Host Controller Drivers
+#
+CONFIG_USB_HOST=y
+# CONFIG_USB_XHCI_HCD is not set
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_ASPEED=y
+# CONFIG_USB_EHCI_MSM is not set
+# CONFIG_USB_EHCI_PCI is not set
+# CONFIG_USB_EHCI_GENERIC is not set
+# CONFIG_USB_EHCI_FSL is not set
+# CONFIG_USB_OHCI_HCD is not set
+# CONFIG_USB_UHCI_HCD is not set
+# CONFIG_USB_DWC2 is not set
+# CONFIG_USB_DWC3 is not set
+
+#
+# Legacy MUSB Support
+#
+# CONFIG_USB_MUSB_HCD is not set
+# CONFIG_USB_MUSB_UDC is not set
+
+#
+# MUSB Controller Driver
+#
+# CONFIG_USB_MUSB_HOST is not set
+# CONFIG_USB_MUSB_GADGET is not set
+# CONFIG_USB_MUSB_TI is not set
+# CONFIG_USB_MUSB_AM35X is not set
+# CONFIG_USB_MUSB_DSPS is not set
+# CONFIG_USB_MUSB_PIO_ONLY is not set
+
+#
+# USB Phy
+#
+# CONFIG_TWL4030_USB is not set
+# CONFIG_OMAP_USB_PHY is not set
+# CONFIG_ROCKCHIP_USB2_PHY is not set
+
+#
+# ULPI drivers
+#
+
+#
+# USB peripherals
+#
+CONFIG_USB_STORAGE=y
+# CONFIG_USB_KEYBOARD is not set
+# CONFIG_USB_GADGET is not set
+# CONFIG_USB_HOST_ETHER is not set
+
+#
+# Graphics support
+#
+# CONFIG_DM_VIDEO is not set
+# CONFIG_SYS_WHITE_ON_BLACK is not set
+# CONFIG_NO_FB_CLEAR is not set
+
+#
+# TrueType Fonts
+#
+# CONFIG_VIDEO_VESA is not set
+# CONFIG_VIDEO_LCD_ANX9804 is not set
+# CONFIG_VIDEO_LCD_SSD2828 is not set
+# CONFIG_VIDEO_MVEBU is not set
+# CONFIG_I2C_EDID is not set
+# CONFIG_DISPLAY is not set
+# CONFIG_VIDEO_TEGRA20 is not set
+# CONFIG_VIDEO_BRIDGE is not set
+# CONFIG_VIDEO is not set
+# CONFIG_LCD is not set
+# CONFIG_VIDEO_SIMPLE is not set
+# CONFIG_VIDEO_DT_SIMPLEFB is not set
+# CONFIG_OSD is not set
+
+#
+# VirtIO Drivers
+#
+# CONFIG_VIRTIO_MMIO is not set
+# CONFIG_VIRTIO_PCI is not set
+
+#
+# 1-Wire support
+#
+# CONFIG_W1 is not set
+
+#
+# 1-wire EEPROM support
+#
+# CONFIG_W1_EEPROM is not set
+
+#
+# Watchdog Timer Support
+#
+# CONFIG_WATCHDOG is not set
+# CONFIG_WATCHDOG_RESET_DISABLE is not set
+# CONFIG_BCM2835_WDT is not set
+# CONFIG_ULP_WATCHDOG is not set
+CONFIG_WDT=y
+CONFIG_WDT_ASPEED=y
+# CONFIG_WDT_ORION is not set
+# CONFIG_WDT_CDNS is not set
+# CONFIG_XILINX_TB_WATCHDOG is not set
+# CONFIG_IMX_WATCHDOG is not set
+# CONFIG_WDT_AT91 is not set
+# CONFIG_PHYS_TO_BUS is not set
+
+#
+# File systems
+#
+# CONFIG_FS_BTRFS is not set
+# CONFIG_FS_CBFS is not set
+CONFIG_FS_EXT4=y
+CONFIG_EXT4_WRITE=y
+CONFIG_FS_FAT=y
+# CONFIG_FAT_WRITE is not set
+CONFIG_FS_FAT_MAX_CLUSTSIZE=65536
+# CONFIG_FS_JFFS2 is not set
+# CONFIG_UBIFS_SILENCE_MSG is not set
+# CONFIG_FS_CRAMFS is not set
+# CONFIG_YAFFS2 is not set
+
+#
+# Library routines
+#
+# CONFIG_BCH is not set
+# CONFIG_CC_OPTIMIZE_LIBS_FOR_SPEED is not set
+# CONFIG_DYNAMIC_CRC_TABLE is not set
+CONFIG_HAVE_PRIVATE_LIBGCC=y
+CONFIG_LIB_UUID=y
+CONFIG_PRINTF=y
+CONFIG_SPL_PRINTF=y
+CONFIG_SPRINTF=y
+CONFIG_SPL_SPRINTF=y
+CONFIG_STRTO=y
+CONFIG_SPL_STRTO=y
+CONFIG_USE_PRIVATE_LIBGCC=y
+CONFIG_SYS_HZ=1000
+# CONFIG_USE_TINY_PRINTF is not set
+# CONFIG_PANIC_HANG is not set
+CONFIG_REGEX=y
+CONFIG_LIB_RAND=y
+# CONFIG_LIB_HW_RAND is not set
+CONFIG_SPL_TINY_MEMSET=y
+# CONFIG_TPL_TINY_MEMSET is not set
+# CONFIG_BITREVERSE is not set
+# CONFIG_CMD_DHRYSTONE is not set
+
+#
+# Security support
+#
+# CONFIG_AES is not set
+CONFIG_RSA=y
+CONFIG_SPL_RSA=y
+CONFIG_RSA_SOFTWARE_EXP=y
+# CONFIG_TPM is not set
+# CONFIG_SPL_TPM is not set
+
+#
+# Android Verified Boot
+#
+
+#
+# Hashing Support
+#
+CONFIG_SHA1=y
+CONFIG_SHA256=y
+# CONFIG_SHA512_ALGO is not set
+# CONFIG_SHA_HW_ACCEL is not set
+CONFIG_MD5=y
+
+#
+# Compression Support
+#
+# CONFIG_LZ4 is not set
+# CONFIG_LZMA is not set
+# CONFIG_LZO is not set
+# CONFIG_SPL_LZ4 is not set
+# CONFIG_SPL_LZO is not set
+# CONFIG_SPL_GZIP is not set
+# CONFIG_ERRNO_STR is not set
+CONFIG_HEXDUMP=y
+CONFIG_OF_LIBFDT=y
+# CONFIG_OF_LIBFDT_OVERLAY is not set
+CONFIG_SPL_OF_LIBFDT=y
+# CONFIG_TPL_OF_LIBFDT is not set
+# CONFIG_FDT_FIXUP_PARTITIONS is not set
+
+#
+# System tables
+#
+# CONFIG_GENERATE_SMBIOS_TABLE is not set
+CONFIG_EFI_LOADER=y
+CONFIG_EFI_UNICODE_CAPITALIZATION=y
+# CONFIG_EFI_LOADER_HII is not set
+CONFIG_OPTEE_TZDRAM_SIZE=0x0000000
+CONFIG_OPTEE_TZDRAM_BASE=0x00000000
+# CONFIG_UNIT_TEST is not set
diff --git a/include/configs/sie_cronos.h b/include/configs/sie_cronos.h
new file mode 100644
index 00000000000..042ad78f2c8
--- /dev/null
+++ b/include/configs/sie_cronos.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) ASPEED Technology Inc.
+ */
+
+#ifndef __CONFIG_H
+#define __CONFIG_H
+
+#include <configs/aspeed-common.h>
+
+#define CONFIG_SYS_MEMTEST_START	(CONFIG_SYS_SDRAM_BASE + 0x300000)
+#define CONFIG_SYS_MEMTEST_END		(CONFIG_SYS_MEMTEST_START + 0x5000000)
+
+#define CONFIG_SYS_UBOOT_BASE		CONFIG_SYS_TEXT_BASE
+
+/* Memory Info */
+#define CONFIG_SYS_LOAD_ADDR		0x83000000
+
+/* SPL */
+#define CONFIG_SPL_TEXT_BASE		0x00000000
+#define CONFIG_SPL_MAX_SIZE		0x00010000
+#define CONFIG_SPL_STACK		0x10016000
+#define CONFIG_SPL_BSS_START_ADDR	0x90000000
+#define CONFIG_SPL_BSS_MAX_SIZE		0x00100000
+#define CONFIG_SPL_LOAD_FIT_ADDRESS	0x00010000
+
+#endif	/* __CONFIG_H */
-- 
2.39.5
