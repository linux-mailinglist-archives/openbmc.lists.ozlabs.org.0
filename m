Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C96713F8DF9
	for <lists+openbmc@lfdr.de>; Thu, 26 Aug 2021 20:40:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwWr55qMZz2ywd
	for <lists+openbmc@lfdr.de>; Fri, 27 Aug 2021 04:40:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inventec.com (client-ip=218.32.67.185; helo=mail.inventec.com;
 envelope-from=mohammed.habeeb@inventec.com; receiver=<UNKNOWN>)
X-Greylist: delayed 905 seconds by postgrey-1.36 at boromir;
 Fri, 27 Aug 2021 04:40:19 AEST
Received: from mail.inventec.com (unknown [218.32.67.185])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwWql65NZz2yPg
 for <openbmc@lists.ozlabs.org>; Fri, 27 Aug 2021 04:40:19 +1000 (AEST)
Received: from IEC1-EX2016-04.iec.inventec (10.1.254.222) by
 IEC1-EX2016-03.iec.inventec (10.15.2.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 27 Aug 2021 02:25:04 +0800
Received: from IEC1-MSE-DB.inventec.com (10.1.254.205) by
 IEC1-EX2016-04.iec.inventec (10.1.254.222) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 27 Aug 2021 02:25:04 +0800
Received: from IEC1-SPAM-2.inventec.com (smg2.inventec.com [10.1.254.202])
 by IEC1-MSE-DB.inventec.com with ESMTP id 17QIOxMD082004
 for <openbmc@lists.ozlabs.org>; Fri, 27 Aug 2021 02:24:59 +0800 (GMT-8)
 (envelope-from mohammed.habeeb@inventec.com)
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72])
 by IEC1-SPAM-2.inventec.com with ESMTPS id 17QIOsQd086826
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Fri, 27 Aug 2021 02:24:56 +0800 (GMT-8)
 (envelope-from mohammed.habeeb@inventec.com)
Received: by mail-oo1-f72.google.com with SMTP id
 k6-20020a4ae286000000b00290b373626dso25918oot.6
 for <openbmc@lists.ozlabs.org>; Thu, 26 Aug 2021 11:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=F8od1nqEtYFt6kcoxz13e5qLF/JrWHdkpAZ+DQABFJ4=;
 b=S1bMuPmr2zSy5tMuwthyEK1QCdnCo1C45b/po/qj6ArG0Dv1qd8WP+cx6wHfQMVVJB
 yhn6IveeOqXyCrvgHTC7NxbmG8MJ685tRi672BQTZmAS27zERAEaw0sSjxhPer/2eyWF
 UtyzbzIsVBpyKJJ6VY/TRu1Ayos440WxQMOAZTFYCDlZYaP0Za5H512tSbFDj8XYxmSZ
 ihH1kpLl7dBMG4UBM09EYCnn/NI7IkUzJFzTvQUdczOjNmw6bwqaCRE3lzTlVLQkAoUk
 8wg1T/rPSf1RDP0QTSL2gPeDWPektiAOHoqnmdycZHAsTL+LghQZuMOZfUiyJa3gKkm5
 Vy5A==
X-Gm-Message-State: AOAM5337urN6roJmmmxUa2qOqUlGGQVqXagANvfWLXpcqDZUYu/5ZKgk
 u+9jIf3EwOYEfspyIPlOnH2fjJSe6nRtEsrGFFBXwR5oxyzlKMWZSlYhTtc9teJ04jWYbgouoL7
 VC6BVNJg/GDF9GfOXZF81vA==
X-Received: by 2002:a05:6830:4124:: with SMTP id
 w36mr4446014ott.72.1630002295187; 
 Thu, 26 Aug 2021 11:24:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrrdvPJDo8fgU3i7ahwbuRrWbfDDHVu6pCWrWYqXMjqN9nZj25M7pAtNDp1VKfxLmtFTmNyg==
X-Received: by 2002:a05:6830:4124:: with SMTP id
 w36mr4445982ott.72.1630002294667; 
 Thu, 26 Aug 2021 11:24:54 -0700 (PDT)
Received: from localhost.localdomain ([207.140.31.150])
 by smtp.gmail.com with ESMTPSA id b11sm752243ooi.0.2021.08.26.11.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 11:24:54 -0700 (PDT)
From: Habeeb Mohammed <mohammed.habeeb@inventec.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH] configs: ast2600: Add Inventec's Transformers machine config
Date: Thu, 26 Aug 2021 11:24:50 -0700
Message-ID: <20210826182450.64053-1-mohammed.habeeb@inventec.com>
X-Mailer: git-send-email 2.17.1
X-DNSRBL: 
X-MAIL: IEC1-MSE-DB.inventec.com 17QIOxMD082004
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 11733DE2EF52A36E2D442DB74C2AAA495331410A73CE8A9E95D05228014E5F4F2000:8
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
Cc: Habeeb Mohammed <mohammed.habeeb@inventec.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: Habeeb Mohammed <mohammed.habeeb@inventec.com>
---
 arch/arm/dts/Makefile                  |   3 +-
 arch/arm/dts/ast2600-transformers.dts  | 252 +++++++++++++++++++++++++
 configs/transformers-ast2600_defconfig |  82 ++++++++
 3 files changed, 336 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/dts/ast2600-transformers.dts
 create mode 100644 configs/transformers-ast2600_defconfig

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index df844065cd..3da04295fa 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -685,7 +685,8 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2600-rainier.dtb \
 	ast2600-slt.dtb \
 	ast2600-tacoma.dtb \
-	ast2600-intel.dtb
+	ast2600-intel.dtb \
+	ast2600-transformers.dtb
 
 dtb-$(CONFIG_ARCH_STI) += stih410-b2260.dtb
 
diff --git a/arch/arm/dts/ast2600-transformers.dts b/arch/arm/dts/ast2600-transformers.dts
new file mode 100644
index 0000000000..88a94cb387
--- /dev/null
+++ b/arch/arm/dts/ast2600-transformers.dts
@@ -0,0 +1,252 @@
+/dts-v1/;
+
+#include "ast2600-u-boot.dtsi"
+
+/ {
+
+	memory {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
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
+		ethernet0 = &mac3;
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
+&mdio {
+        status = "okay";
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_mdio1_default>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        ethphy0: ethernet-phy@0 {
+                reg = <1>;
+        };
+};
+
+&mac3 {
+        status = "okay";
+        phy-mode = "rgmii";
+        phy-handle = <&ethphy0>;
+        reg = <0x1e690000 0x180>, <0x1e650000 0x8>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_rgmii4_default>;
+};
+
+&fmc {
+	status = "okay";
+#if 0
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fmcquad_default>;
+#endif
+	flash@0 {
+		compatible = "spi-flash", "sst,w25q256";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+
+	flash@1 {
+		compatible = "spi-flash", "sst,w25q256";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+};
+
+&spi1 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default &pinctrl_spi1abr_default
+			&pinctrl_spi1cs1_default &pinctrl_spi1wp_default
+			&pinctrl_spi1wp_default &pinctrl_spi1quad_default>;
+
+	flash@0 {
+		compatible = "spi-flash", "sst,w25q256";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+
+	flash@1 {
+		compatible = "spi-flash", "sst,w25q256";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+};
+
+&spi2 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi2_default &pinctrl_spi2cs1_default
+			&pinctrl_spi2cs2_default &pinctrl_spi2quad_default>;
+
+	flash@0 {
+		compatible = "spi-flash", "sst,w25q256";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+
+	flash@1 {
+		compatible = "spi-flash", "sst,w25q256";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+
+	flash@2 {
+		compatible = "spi-flash", "sst,w25q256";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
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
+	bus-width = <8>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_emmc_default>;
+	sdhci-drive-type = <3>;
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
+#if 0
+&pcie_bridge0 {
+        status = "okay";
+};
+#else
+&pcie_bridge1 {
+        status = "okay";
+};
+#endif
+
+&h2x {
+	status = "okay";
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
diff --git a/configs/transformers-ast2600_defconfig b/configs/transformers-ast2600_defconfig
new file mode 100644
index 0000000000..633d869b41
--- /dev/null
+++ b/configs/transformers-ast2600_defconfig
@@ -0,0 +1,82 @@
+CONFIG_ARM=y
+CONFIG_ARCH_ASPEED=y
+CONFIG_SYS_TEXT_BASE=0x0
+CONFIG_ASPEED_AST2600=y
+CONFIG_TARGET_EVB_AST2600A1=y
+CONFIG_SYS_MALLOC_F_LEN=0x2000
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0xE0000
+CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
+CONFIG_DEFAULT_DEVICE_TREE="ast2600-transformers"
+CONFIG_NR_DRAM_BANKS=1
+CONFIG_FIT=y
+CONFIG_USE_BOOTARGS=y
+CONFIG_BOOTARGS="console=ttyS4,115200n8 root=/dev/ram rw mem.devmem=1"
+CONFIG_USE_BOOTCOMMAND=y
+CONFIG_BOOTCOMMAND="bootm 20100000"
+CONFIG_PRE_CONSOLE_BUFFER=y
+CONFIG_PRE_CON_BUF_ADDR=0x10000000
+CONFIG_DISPLAY_BOARDINFO_LATE=y
+CONFIG_ARCH_EARLY_INIT_R=y
+CONFIG_HUSH_PARSER=y
+# CONFIG_AUTO_COMPLETE is not set
+CONFIG_SYS_PROMPT="ast# "
+CONFIG_CMD_MEMTEST=y
+CONFIG_SYS_ALT_MEMTEST=y
+CONFIG_CMD_CLK=y
+CONFIG_CMD_GPIO=y
+CONFIG_CMD_I2C=y
+CONFIG_CMD_PCI=y
+CONFIG_CMD_MMC=y
+CONFIG_CMD_SF=y
+CONFIG_CMD_DHCP=y
+CONFIG_CMD_MII=y
+CONFIG_CMD_PING=y
+CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_USE_ENV_SPI_BUS=y
+CONFIG_ENV_SPI_BUS=0
+CONFIG_USE_ENV_SPI_CS=y
+CONFIG_ENV_SPI_CS=0
+CONFIG_USE_ENV_SPI_MAX_HZ=y
+CONFIG_ENV_SPI_MAX_HZ=100000000
+CONFIG_NET_RANDOM_ETHADDR=y
+CONFIG_REGMAP=y
+CONFIG_SYSCON=y
+CONFIG_CLK=y
+CONFIG_DM_GPIO=y
+CONFIG_ASPEED_GPIO=y
+CONFIG_DM_I2C=y
+CONFIG_SYS_I2C_ASPEED=y
+CONFIG_MISC=y
+CONFIG_ASPEED_AHBC=y
+CONFIG_ASPEED_H2X=y
+CONFIG_DM_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_ASPEED=y
+CONFIG_DM_SPI_FLASH=y
+CONFIG_SPI_FLASH=y
+CONFIG_SPI_FLASH_GIGADEVICE=y
+CONFIG_SPI_FLASH_MACRONIX=y
+CONFIG_SPI_FLASH_SPANSION=y
+CONFIG_SPI_FLASH_STMICRO=y
+CONFIG_SPI_FLASH_WINBOND=y
+CONFIG_PHY_BROADCOM=y
+CONFIG_PHY_REALTEK=y
+CONFIG_DM_ETH=y
+CONFIG_FTGMAC100=y
+CONFIG_MDIO=y
+CONFIG_PCI=y
+CONFIG_DM_PCI=y
+CONFIG_DM_PCI_COMPAT=y
+CONFIG_PCIE_ASPEED=n
+CONFIG_PHY=y
+CONFIG_PINCTRL=y
+CONFIG_RAM=y
+CONFIG_DM_SERIAL=y
+CONFIG_SYS_NS16550=y
+CONFIG_SPI=y
+CONFIG_DM_SPI=y
+CONFIG_SYSRESET=y
+CONFIG_WDT=y
+CONFIG_DM_I2C_COMPAT=y
+CONFIG_MAX31790_I2C=y
-- 
2.17.1

