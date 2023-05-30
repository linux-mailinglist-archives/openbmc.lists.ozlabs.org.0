Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C3D71541C
	for <lists+openbmc@lfdr.de>; Tue, 30 May 2023 05:04:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVcgS4LJbz3f87
	for <lists+openbmc@lfdr.de>; Tue, 30 May 2023 13:04:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=i6cqdltJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.181.12.199; helo=m12.mail.163.com; envelope-from=lintao1890@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=i6cqdltJ;
	dkim-atps=neutral
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.199])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVcfs00Pwz3bdm
	for <openbmc@lists.ozlabs.org>; Tue, 30 May 2023 13:03:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=gzEkK
	TkolYP/utAnGBI2d3rQ1ozs9aMvksRPjwrRjTE=; b=i6cqdltJOmhyl2HLznzJV
	+vb6RE+u5Zmw9IELKzeDbi45GQ8jnaLBuPhIK3XSgeyKUGr1rOEmaW47kVCegXfI
	wOuKZwRhbWiI8Jn5YKBE20Zq0uIOm422OrhmDkUuB2WmVxTCdpd+C3sOcMas/m6k
	Nj0GvJ9p3SrqJhS2oAIZgc=
Received: from localhost (unknown [223.104.189.248])
	by zwqz-smtp-mta-g0-3 (Coremail) with SMTP id _____wCHHs94Z3VkvoDtAw--.37470S2;
	Tue, 30 May 2023 11:03:21 +0800 (CST)
From: lintao1890@163.com
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v5] board: ast2600: Add Inspur SCM V1 board
Date: Tue, 30 May 2023 11:03:20 +0800
Message-Id: <20230530030320.548408-1-lintao1890@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCHHs94Z3VkvoDtAw--.37470S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3JFyfJw1UAF1fGr4kAr13Jwb_yoWxAw4fpa
	n3ZF4rKF4fXa1rKas8Ary0gFyfGan5CrZakw17W345JFWfu3s0vrW8Kr97Arn8Xr4DGw4f
	KFyrGF9FgF1ktw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U8Cz_UUUUU=
X-Originating-IP: [223.104.189.248]
X-CM-SenderInfo: xolq3tjrrymii6rwjhhfrp/1tbiWxx-lmI0aNMsrAAAsD
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
Cc: LinTao <lintao.lc@inspur.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: LinTao <lintao.lc@inspur.com>

AST2600-INSPUR is an Inspur SCM V1 board which is
equipped with AST2600

Signed-off-by: LinTao <lintao.lc@inspur.com>
---
V1 -> V2:
    - add a missing '\'
---
V2 -> V3:
    - use gpio subsystem
---
V3 -> V4:
    - fix style problems
---
V4 -> V5:
    - turn on SCM LED1
---
 arch/arm/dts/Makefile                    |   3 +-
 arch/arm/dts/ast2600-inspur-nf5280m7.dts | 190 +++++++++++++++++++++++
 arch/arm/mach-aspeed/ast2600/Kconfig     |   8 +
 board/aspeed/ast2600_inspur/Kconfig      |  13 ++
 board/aspeed/ast2600_inspur/Makefile     |   1 +
 board/aspeed/ast2600_inspur/inspur.c     |  18 +++
 6 files changed, 232 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/dts/ast2600-inspur-nf5280m7.dts
 create mode 100644 board/aspeed/ast2600_inspur/Kconfig
 create mode 100644 board/aspeed/ast2600_inspur/Makefile
 create mode 100644 board/aspeed/ast2600_inspur/inspur.c

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 6c34b83336..f62c16b4f1 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -695,7 +695,8 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2600-slt.dtb \
 	ast2600-tacoma.dtb \
 	ast2600-intel.dtb \
-	ast2600-tacoma.dtb
+	ast2600-tacoma.dtb \
+	ast2600-inspur-nf5280m7.dtb
 
 dtb-$(CONFIG_ARCH_STI) += stih410-b2260.dtb
 
diff --git a/arch/arm/dts/ast2600-inspur-nf5280m7.dts b/arch/arm/dts/ast2600-inspur-nf5280m7.dts
new file mode 100644
index 0000000000..8210797868
--- /dev/null
+++ b/arch/arm/dts/ast2600-inspur-nf5280m7.dts
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright 2023 Inspur Corp.
+/dts-v1/;
+
+#include "ast2600-u-boot.dtsi"
+
+/ {
+	model = "Inspur SCM V1";
+	compatible = "inspur,nf5280m7-bmc", "aspeed,ast2600";
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
+		ethernet1 = &mac1;
+	};
+
+	cpus {
+		cpu@0 {
+			clock-frequency = <1200000000>;
+		};
+		cpu@1 {
+			clock-frequency = <1200000000>;
+		};
+	};
+};
+
+&gpio0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
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
+&mdio {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mdio2_default>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	ethphy0: ethernet-phy@0 {
+		reg = <0>;
+	};
+
+	ethphy1: ethernet-phy@1 {
+		reg = <0>;
+	};
+
+	ethphy2: ethernet-phy@2 {
+		reg = <0>;
+	};
+
+	ethphy3: ethernet-phy@3 {
+		reg = <0>;
+	};
+};
+
+&mac1 {
+	status = "okay";
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii2_default>;
+};
+
+&fmc {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fmcquad_default>;
+	flash@0 {
+		status = "okay";
+		spi-max-frequency = <40000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+	flash@1 {
+		status = "okay";
+		spi-max-frequency = <40000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
+&i2c1 {
+	status = "okay";
+	multi-master;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2_default>;
+};
+
+&i2c4 {
+	status = "okay";
+	multi-master;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c5_default>;
+};
+
+&i2c5 {
+	status = "okay";
+	multi-master;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c6_default>;
+};
+
+&i2c6 {
+	status = "okay";
+	multi-master;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c7_default>;
+};
+
+&i2c7 {
+	status = "okay";
+	multi-master;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c8_default>;
+};
+
+&i2c8 {
+	status = "okay";
+	multi-master;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c9_default>;
+};
+
+&i2c9 {
+	status = "okay";
+	multi-master;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c10_default>;
+};
+
+&i2c12 {
+	status = "okay";
+	multi-master;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c13_default>;
+};
+
+&i2c13 {
+	status = "okay";
+	multi-master;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c14_default>;
+};
+
+&hace {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&acry {
+	u-boot,dm-pre-reloc;
+	status = "disabled";
+};
diff --git a/arch/arm/mach-aspeed/ast2600/Kconfig b/arch/arm/mach-aspeed/ast2600/Kconfig
index f5852afa77..db177399b9 100644
--- a/arch/arm/mach-aspeed/ast2600/Kconfig
+++ b/arch/arm/mach-aspeed/ast2600/Kconfig
@@ -51,6 +51,13 @@ config TARGET_QUALCOMM_DC_SCM_V1
 	  QUALCOMM-DC-SCM-V1 is a Qualcomm DC-SCM V1 board which is
 	  equipped with AST2600.
 
+config TARGET_AST2600_INSPUR
+	bool "AST2600-INSPUR"
+	depends on ASPEED_AST2600
+	help
+	  AST2600-INSPUR is an Inspur SCM V1 board which is
+	  equipped with AST2600.
+
 endchoice
 
 source "board/aspeed/evb_ast2600/Kconfig"
@@ -59,5 +66,6 @@ source "board/aspeed/slt_ast2600/Kconfig"
 source "board/aspeed/ast2600_ibm/Kconfig"
 source "board/aspeed/ast2600_intel/Kconfig"
 source "board/qualcomm/dc-scm-v1/Kconfig"
+source "board/aspeed/ast2600_inspur/Kconfig"
 
 endif
diff --git a/board/aspeed/ast2600_inspur/Kconfig b/board/aspeed/ast2600_inspur/Kconfig
new file mode 100644
index 0000000000..ef11a01bcc
--- /dev/null
+++ b/board/aspeed/ast2600_inspur/Kconfig
@@ -0,0 +1,13 @@
+if TARGET_AST2600_INSPUR
+
+config SYS_BOARD
+	default "ast2600_inspur"
+
+config SYS_VENDOR
+	default "aspeed"
+
+config SYS_CONFIG_NAME
+	string "board configuration name"
+	default "ast2600_inspur"
+
+endif
diff --git a/board/aspeed/ast2600_inspur/Makefile b/board/aspeed/ast2600_inspur/Makefile
new file mode 100644
index 0000000000..8af8692f3c
--- /dev/null
+++ b/board/aspeed/ast2600_inspur/Makefile
@@ -0,0 +1 @@
+obj-y += inspur.o
diff --git a/board/aspeed/ast2600_inspur/inspur.c b/board/aspeed/ast2600_inspur/inspur.c
new file mode 100644
index 0000000000..2edf0f5578
--- /dev/null
+++ b/board/aspeed/ast2600_inspur/inspur.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2023 Inspur Corp.
+ */
+
+#include <common.h>
+#include <asm/io.h>
+#include <asm/gpio.h>
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+int board_late_init(void)
+{
+	/* Turn on SCM LED1 */
+	gpio_request(ASPEED_GPIO(B, 2), "");
+	gpio_direction_output(ASPEED_GPIO(B, 2), GPIO_ACTIVE_LOW);
+
+	return 0;
+}
-- 
2.34.1

