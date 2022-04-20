Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2EA5095F2
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 06:25:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkPbt3bnKz2yn9
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 14:25:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=IsIWE4FN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::633;
 helo=mail-ej1-x633.google.com; envelope-from=patrick.rudolph@9elements.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256
 header.s=google header.b=IsIWE4FN; dkim-atps=neutral
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjxdN0Gp3z2yZf
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2022 20:25:25 +1000 (AEST)
Received: by mail-ej1-x633.google.com with SMTP id l7so2596713ejn.2
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2022 03:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HhBmXYJjQHhWk3uxLrQEiAfdEgpLcWdw3WLyzG4SGMk=;
 b=IsIWE4FNamegYO/zkDEuMEUUSbevsJI4FYJmRUxOlBqLL+B46dYA/6seyo9Jqs0TY4
 iMY2479i4yZHuojPIInKJ4O83wSq9jBenNG699KWOfBhSwN7O/LY9TwezDSac5mOsVEL
 +hIKxu2h8djtlOOKrCtOIUvEyiRfaqINKDJFUUPCJxlwfMqt8rlQ56CtzsiqB5oa/1yb
 MzbT0O5Y+WlxNT0wVZkNJdxnCUg8Jw2x4Ib97kg1XgR2YPoEN5UGVuHdZ0ncrShLV2D1
 WvKXKzqhOzSfuOw4r7aloS0i9q57phIQc8x7zk4MiNHlAK+AX6rlbu/ihOUxAVMMRMFg
 EX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HhBmXYJjQHhWk3uxLrQEiAfdEgpLcWdw3WLyzG4SGMk=;
 b=JGbp4ifTDxIoWlwo8fSk1HI9jxwe4qqDCshXMbOE0oEsjWz0hrsUJR19kvFdoMRPGw
 +YWMWZgMlaAEWmcY+4uCZrEynyz1ORNDW0DEzc4OT+aENme4KZ3l2pjbHzD1sMwlCYQK
 6ooqWPRzIzACAgq1HmFSVF32j5bgeSkFb3QirFQI6sInCD4Nbwg2W99p2bXhpUpA7yH/
 U2XvF7zPQ+4ljZGHooC+gqLIlVizKfJSVgnVw7APs5t6209r03me86BmuLmNTh8NGF8e
 idUver6OvrzHgwuujIZmsK8TY+KZO1Sx2OpgKUbzXPYw+J6tQoCI2+COAYpbXCPPL7Q4
 EvBw==
X-Gm-Message-State: AOAM532mhsufHgTg8OVT9ifyKB352aob8dfBvqqD6kOwBOvKSzMcNr3/
 /4nFxdwqPeyBW1qvQ26RHHxfIA==
X-Google-Smtp-Source: ABdhPJzyhFect5+ts8fqClS/zdDMn/C3U8NewOKI2APLeGZTIKDmCWkt2G/ZgHWh8KlmvOjypOCgNA==
X-Received: by 2002:a17:907:7f0a:b0:6ef:cc08:bd73 with SMTP id
 qf10-20020a1709077f0a00b006efcc08bd73mr9454688ejc.210.1650450319886; 
 Wed, 20 Apr 2022 03:25:19 -0700 (PDT)
Received: from fedora.sec.9e.network
 (ip-005-146-070-114.um05.pools.vodafone-ip.de. [5.146.70.114])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a056402020c00b00422e7556951sm7431346edv.87.2022.04.20.03.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 03:25:19 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 1/4] arm/dts: Add Genesis3 board
Date: Wed, 20 Apr 2022 12:24:59 +0200
Message-Id: <20220420102502.1791566-1-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 21 Apr 2022 14:24:52 +1000
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
Cc: christian.walter@9elements.com, takken@us.ibm.com,
 Patrick Rudolph <patrick.rudolph@9elements.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add IBM Genesis3 board and devicetree source file.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 arch/arm/dts/Makefile                |  1 +
 arch/arm/dts/ibm-genesis3.dts        | 83 ++++++++++++++++++++++++++++
 arch/arm/mach-aspeed/ast2500/Kconfig | 11 ++++
 board/ibm/genesis3/Kconfig           | 13 +++++
 board/ibm/genesis3/Makefile          |  1 +
 board/ibm/genesis3/ibm_genesis3.c    |  5 ++
 include/configs/ibm_genesis3.h       | 19 +++++++
 7 files changed, 133 insertions(+)
 create mode 100644 arch/arm/dts/ibm-genesis3.dts
 create mode 100644 board/ibm/genesis3/Kconfig
 create mode 100644 board/ibm/genesis3/Makefile
 create mode 100644 board/ibm/genesis3/ibm_genesis3.c
 create mode 100644 include/configs/ibm_genesis3.h

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index a79f885f54..fae23e6bc1 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -677,6 +677,7 @@ dtb-$(CONFIG_ARCH_BCM6858) += \
 dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2400-evb.dtb \
 	ast2500-evb.dtb \
+	ibm-genesis3.dtb \
 	ast2600a0-evb.dtb \
 	ast2600a1-evb.dtb \
 	ast2600-bletchley.dtb \
diff --git a/arch/arm/dts/ibm-genesis3.dts b/arch/arm/dts/ibm-genesis3.dts
new file mode 100644
index 0000000000..ba610c9032
--- /dev/null
+++ b/arch/arm/dts/ibm-genesis3.dts
@@ -0,0 +1,83 @@
+/dts-v1/;
+
+#include "ast2500-u-boot.dtsi"
+
+/ {
+        model = "IBM Genesis3";
+        compatible = "ibm,genesis3", "aspeed,ast2500";
+
+	memory {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	aliases {
+		spi0 = &fmc;
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
+	clock-frequency = <400000000>;
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
+&wdt3 {
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
+&fmc {
+	status = "okay";
+	timing-calibration-disabled;
+	flash@0 {
+		compatible = "spi-flash", "spansion,s25fl256l";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+
+	flash@1 {
+                compatible = "spi-flash", "spansion,s25fl256l";
+                status = "okay";
+                spi-max-frequency = <50000000>;
+                spi-tx-bus-width = <2>;
+                spi-rx-bus-width = <2>;
+        };
+};
+
diff --git a/arch/arm/mach-aspeed/ast2500/Kconfig b/arch/arm/mach-aspeed/ast2500/Kconfig
index 4f992f442d..81c4fd0c2f 100644
--- a/arch/arm/mach-aspeed/ast2500/Kconfig
+++ b/arch/arm/mach-aspeed/ast2500/Kconfig
@@ -15,8 +15,19 @@ config TARGET_EVB_AST2500
 	  It has 512M of RAM, 32M of SPI flash, two Ethernet ports,
 	  4 Serial ports, 4 USB ports, VGA port, PCIe, SD card slot,
 	  20 pin JTAG, pinouts for 14 I2Cs, 3 SPIs and eSPI, 8 PWMs.
+
+config TARGET_IBM_GENESIS3
+	bool "IBM-Genesis3"
+	help
+	  IBM Genesis3 is an IBM evaluation board for Intel Xeon
+	  and AST2500 BMC. It has 512M of RAM, 32M of SPI flash,
+	  two Ethernet ports, 1 debug uart, 1 USB ports and 1 PCIe
+	  port connected to the PCH.
+	  It has support for JTAG, pinouts for 9 I2Cs and eSPI.
+
 endchoice
 
 source "board/aspeed/evb_ast2500/Kconfig"
+source "board/ibm/genesis3/Kconfig"
 
 endif
diff --git a/board/ibm/genesis3/Kconfig b/board/ibm/genesis3/Kconfig
new file mode 100644
index 0000000000..09fe60262b
--- /dev/null
+++ b/board/ibm/genesis3/Kconfig
@@ -0,0 +1,13 @@
+if TARGET_IBM_GENESIS3
+
+config SYS_BOARD
+	default "genesis3"
+
+config SYS_VENDOR
+	default "ibm"
+
+config SYS_CONFIG_NAME
+	string "board configuration name"
+	default "ibm_genesis3"
+
+endif
diff --git a/board/ibm/genesis3/Makefile b/board/ibm/genesis3/Makefile
new file mode 100644
index 0000000000..2bb8917fab
--- /dev/null
+++ b/board/ibm/genesis3/Makefile
@@ -0,0 +1 @@
+obj-y += ibm_genesis3.o
diff --git a/board/ibm/genesis3/ibm_genesis3.c b/board/ibm/genesis3/ibm_genesis3.c
new file mode 100644
index 0000000000..9de8531806
--- /dev/null
+++ b/board/ibm/genesis3/ibm_genesis3.c
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2022 9elements GmbH
+ */
+#include <common.h>
diff --git a/include/configs/ibm_genesis3.h b/include/configs/ibm_genesis3.h
new file mode 100644
index 0000000000..f40aeed8a9
--- /dev/null
+++ b/include/configs/ibm_genesis3.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2022 9elements GmbH.
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
+#endif	/* __CONFIG_H */
-- 
2.35.1

