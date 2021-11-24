Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2388A45BBE0
	for <lists+openbmc@lfdr.de>; Wed, 24 Nov 2021 13:22:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzgBn09nWz2yb6
	for <lists+openbmc@lfdr.de>; Wed, 24 Nov 2021 23:22:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=sa8UCszN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=sa8UCszN; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzgBN2l3Xz2xDv
 for <openbmc@lists.ozlabs.org>; Wed, 24 Nov 2021 23:22:36 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 0FE2746938;
 Wed, 24 Nov 2021 12:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1637756551; x=
 1639570952; bh=O/CFaqIyVhGViI7qhGE1oHLZNCX4Qr01fZHJj3zAWtY=; b=s
 a8UCszNn4zf/jtkPXIWSZEDRD7SPlBffxrl2iCNFraHNc/47q3RtA4tUlWd6w0fD
 GvoKaCOY+RPg8YmF3ThqFG1CqhA6G2laRDbtpqHSSdzfKy7edqYKqxUhRvxdBhcs
 mBMZDNGSYs8lRUX7oPdQm2Rbtbr7HULYXuZ3X0QvUU=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t1bngYkQK0GA; Wed, 24 Nov 2021 15:22:31 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 673A446902;
 Wed, 24 Nov 2021 15:22:31 +0300 (MSK)
Received: from nb-511.yadro.com (10.199.10.105) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 24
 Nov 2021 15:22:30 +0300
From: Andrei Kartashev <a.kartashev@yadro.com>
To: <openbmc@lists.ozlabs.org>, <joel@jms.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] ARM: dts: aspeed: add vegman
 machine dts
Date: Wed, 24 Nov 2021 15:22:14 +0300
Message-ID: <20211124122214.19669-1-a.kartashev@yadro.com>
X-Mailer: git-send-email 2.32.0
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

Signed-off-by: Andrei Kartashev <a.kartashev@yadro.com>
---
 arch/arm/dts/Makefile           |   1 +
 arch/arm/dts/ast2500-vegman.dts | 167 ++++++++++++++++++++++++++++++++
 2 files changed, 168 insertions(+)
 create mode 100644 arch/arm/dts/ast2500-vegman.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index df844065cd..5ce7ae2415 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -677,6 +677,7 @@ dtb-$(CONFIG_ARCH_BCM6858) += \
 dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2400-evb.dtb \
 	ast2500-evb.dtb \
+	ast2500-vegman.dtb \
 	ast2600-evb.dtb \
 	ast2600-ncsi.dtb \
 	ast2600a0-evb.dtb \
diff --git a/arch/arm/dts/ast2500-vegman.dts b/arch/arm/dts/ast2500-vegman.dts
new file mode 100644
index 0000000000..9bbb7e0708
--- /dev/null
+++ b/arch/arm/dts/ast2500-vegman.dts
@@ -0,0 +1,167 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (C) 2021 YADRO
+/dts-v1/;
+
+#include "ast2500-u-boot.dtsi"
+
+/ {
+	model = "AST2500 VEGMAN";
+	compatible = "aspeed,ast2500-vegman", "aspeed,ast2500";
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
+		spi1 = &spi1;
+		ethernet0 = &mac1;
+		ethernet1 = &mac0;
+	};
+
+	leds {
+		u-boot,dm-pre-reloc;
+		compatible = "gpio-leds";
+
+		identify {
+			label = "platform:blue:indicator";
+			default-state = "on";
+			gpios = <&gpio 150 1>;
+		};
+
+		status_amber {
+			label = "platform:red:status";
+			default-state = "off";
+			gpios = <&gpio 149 1>;
+		};
+
+		status_green {
+			label = "platform:green:status";
+			default-state = "off";
+			gpios = <&gpio 148 1>;
+		};
+
+		power_fault {
+			label = "platform:red:power";
+			default-state = "off";
+			gpios = <&gpio 212 1>;
+		};
+
+		power_ok {
+			label = "platform:green:power";
+			default-state = "off";
+			gpios = <&gpio 213 1>;
+		};
+	};
+};
+
+&gpio {
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
+
+&sdhci_slot0 {
+	status = "okay";
+	bus-width = <4>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sd1_default>;
+};
+
+&sdhci_slot1 {
+	status = "okay";
+	bus-width = <4>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sd2_default>;
+};
+
+&i2c3 {
+	status = "okay";
+};
+
+&i2c7 {
+	status = "okay";
+};
-- 
2.32.0

