Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52063542173
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 08:28:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHy3923gXz3bk7
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 16:28:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHy2w2cfrz2xbW
	for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2022 16:28:08 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4LHy2w0N74z4xXF;
	Wed,  8 Jun 2022 16:28:08 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LHy2t5DsHz4xD8;
	Wed,  8 Jun 2022 16:28:06 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] ARM: dts: aspeed: Add a palmetto board (AST2400)
Date: Wed,  8 Jun 2022 08:28:03 +0200
Message-Id: <20220608062803.366909-1-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Joel Stanley <joel@jms.id.au>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Palmettos were the first OpenPOWER systems built by Tyan with the
product name: GN70-BP010. They contained an IBM POWER8 Turismo SCM
processor and an Aspeed AST2400 SoC.
 
Cc: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/dts/Makefile              |   1 +
 arch/arm/dts/ast2400-palmetto.dts  | 102 +++++++++++++++++++++++++++++
 configs/ast2400-palmetto_defconfig |  74 +++++++++++++++++++++
 3 files changed, 177 insertions(+)
 create mode 100644 arch/arm/dts/ast2400-palmetto.dts
 create mode 100644 configs/ast2400-palmetto_defconfig

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 3515100c65ce..4faf29d747bd 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -676,6 +676,7 @@ dtb-$(CONFIG_ARCH_BCM6858) += \
 
 dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2400-evb.dtb \
+	ast2400-palmetto.dtb \
 	ast2400-ahe-50dc.dtb \
 	ast2500-evb.dtb \
 	ast2600a0-evb.dtb \
diff --git a/arch/arm/dts/ast2400-palmetto.dts b/arch/arm/dts/ast2400-palmetto.dts
new file mode 100644
index 000000000000..a512f602d2f1
--- /dev/null
+++ b/arch/arm/dts/ast2400-palmetto.dts
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0+
+/dts-v1/;
+
+#include "ast2400-u-boot.dtsi"
+
+/ {
+	model = "Palmetto BMC";
+	compatible = "tyan,palmetto-bmc", "aspeed,ast2400";
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x40000000 0x10000000>;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,115200 earlyprintk";
+	};
+
+	aliases {
+		spi0 = &fmc;
+		spi1 = &spi1;
+		ethernet0 = &mac0;
+		ethernet1 = &mac1;
+	};
+};
+
+&uart5 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&sdrammc {
+	clock-frequency = <200000000>;
+};
+
+&wdt1 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&wdt2 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&mac0 {
+	status = "okay";
+	phy-mode = "rgmii";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mac1link_default &pinctrl_mdio1_default>;
+};
+
+&mac1 {
+	status = "okay";
+	phy-mode = "rgmii";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mac2link_default &pinctrl_mdio2_default>;
+};
+
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		compatible = "spi-flash", "sst,w25q256";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+
+	flash@1 {
+                compatible = "spi-flash", "sst,w25q256";
+                status = "okay";
+                spi-max-frequency = <50000000>;
+                spi-tx-bus-width = <2>;
+                spi-rx-bus-width = <2>;
+        };
+};
+
+&spi1 {
+	status = "okay";
+	flash@0 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_spi1_default>;
+		compatible = "spi-flash", "sst,w25q256";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+	flash@1 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_spi1_default &pinctrl_spi1cs1_default>;
+		compatible = "spi-flash", "sst,w25q256";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+};
diff --git a/configs/ast2400-palmetto_defconfig b/configs/ast2400-palmetto_defconfig
new file mode 100644
index 000000000000..8802323b4db8
--- /dev/null
+++ b/configs/ast2400-palmetto_defconfig
@@ -0,0 +1,74 @@
+CONFIG_ARM=y
+CONFIG_ARCH_ASPEED=y
+CONFIG_SYS_TEXT_BASE=0x0
+CONFIG_ASPEED_AST2400=y
+CONFIG_SYS_MALLOC_F_LEN=0x800
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0xF0000
+CONFIG_NR_DRAM_BANKS=1
+CONFIG_FIT=y
+CONFIG_USE_BOOTARGS=y
+CONFIG_BOOTARGS="console=ttyS4,115200n8 root=/dev/ram rw"
+CONFIG_USE_BOOTCOMMAND=y
+CONFIG_BOOTCOMMAND="bootm 20080000"
+CONFIG_PRE_CONSOLE_BUFFER=y
+CONFIG_PRE_CON_BUF_ADDR=0x1e720000
+CONFIG_SYS_CONSOLE_ENV_OVERWRITE=y
+CONFIG_HUSH_PARSER=y
+# CONFIG_AUTO_COMPLETE is not set
+CONFIG_SYS_PROMPT="ast# "
+CONFIG_CMD_MEMTEST=y
+CONFIG_SYS_ALT_MEMTEST=y
+CONFIG_CMD_CLK=y
+CONFIG_CMD_GPIO=y
+CONFIG_CMD_I2C=y
+CONFIG_CMD_MMC=y
+CONFIG_CMD_SF=y
+CONFIG_CMD_DHCP=y
+CONFIG_CMD_MII=y
+CONFIG_CMD_PING=y
+CONFIG_DEFAULT_DEVICE_TREE="ast2400-palmetto"
+CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_USE_ENV_SPI_BUS=y
+CONFIG_ENV_SPI_BUS=0
+CONFIG_USE_ENV_SPI_CS=y
+CONFIG_ENV_SPI_CS=0
+CONFIG_USE_ENV_SPI_MAX_HZ=y
+CONFIG_ENV_SPI_MAX_HZ=100000000
+CONFIG_NET_RANDOM_ETHADDR=y
+CONFIG_REGMAP=y
+CONFIG_CLK=y
+CONFIG_DM_GPIO=y
+CONFIG_ASPEED_GPIO=y
+CONFIG_DM_I2C=y
+CONFIG_SYS_I2C_ASPEED=y
+CONFIG_MISC=y
+CONFIG_DM_MMC=y
+# CONFIG_MMC_HW_PARTITIONING is not set
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_ASPEED=y
+CONFIG_DM_SPI_FLASH=y
+CONFIG_SPI_FLASH=y
+CONFIG_SPI_FLASH_GIGADEVICE=y
+CONFIG_SPI_FLASH_MACRONIX=y
+CONFIG_SPI_FLASH_SPANSION=y
+CONFIG_SPI_FLASH_STMICRO=y
+CONFIG_SPI_FLASH_WINBOND=y
+CONFIG_PHY_REALTEK=y
+CONFIG_PHY_NCSI=y
+CONFIG_DM_ETH=y
+CONFIG_PHY_GIGE=y
+CONFIG_FTGMAC100=y
+CONFIG_PHY=y
+CONFIG_PINCTRL=y
+CONFIG_RAM=y
+CONFIG_DM_SERIAL=y
+CONFIG_SYS_NS16550=y
+CONFIG_SPI=y
+CONFIG_DM_SPI=y
+CONFIG_SYSRESET=y
+CONFIG_TIMER=y
+CONFIG_WDT=y
+CONFIG_DM_RESET=y
+# CONFIG_CMD_BOOTEFI is not set
+# CONFIG_EFI_LOADER is not set
-- 
2.35.3

