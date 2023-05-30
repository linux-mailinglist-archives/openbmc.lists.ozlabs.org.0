Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CADD5715A02
	for <lists+openbmc@lfdr.de>; Tue, 30 May 2023 11:25:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVn7R0T8Kz3f6b
	for <lists+openbmc@lfdr.de>; Tue, 30 May 2023 19:25:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Hs+fUuyV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.181.12.215; helo=m12.mail.163.com; envelope-from=lintao1890@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Hs+fUuyV;
	dkim-atps=neutral
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.215])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVn6p6lSHz3bhC
	for <openbmc@lists.ozlabs.org>; Tue, 30 May 2023 19:25:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Hv3Dj
	4XyAZOE//sd0oL3DF4/boGWivslEaIaNCc+X3M=; b=Hs+fUuyVf5Q8AhTxU+2fT
	eCd4Y8/iF3QgJVPI++pqStiAatokSMEZrItcXdqlV64kA0pTRE96xKFsXDUV88J1
	MA5yIjsrBHvbuA/8io86Jy695zBfb5SzcsdZpGuQU+UJqo8NDobV3ysmSkNp0UQ+
	pRV5uHgi+5gTXVvDvBpMeI=
Received: from localhost (unknown [60.208.111.205])
	by zwqz-smtp-mta-g2-3 (Coremail) with SMTP id _____wD3pWrcwHVkey0BBA--.52630S2;
	Tue, 30 May 2023 17:24:44 +0800 (CST)
From: lintao1890@163.com
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v7] board: ast2600: Add Inspur SCM V1 board
Date: Tue, 30 May 2023 17:24:44 +0800
Message-Id: <20230530092444.817807-1-lintao1890@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3pWrcwHVkey0BBA--.52630S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZF1DKFyrCryrtFW8CrW8Crg_yoW5try7pa
	n7ZFWrGFZYqF4xG3W5Ary8KF1rJw1kZFZ3Krn7AFy8GF4ruF90q348KryxArnrJryUGw4r
	tFn7WryvqFs8t3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j6UDJUUUUU=
X-Originating-IP: [60.208.111.205]
X-CM-SenderInfo: xolq3tjrrymii6rwjhhfrp/1tbiMgB-llWB37-LywAAsv
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
Cc: Lin Tao <lintao.lc@inspur.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Lin Tao <lintao.lc@inspur.com>

AST2600-INSPUR is an Inspur SCM V1 board which is equipped with AST2600

Signed-off-by: Lin Tao <lintao.lc@inspur.com>
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
V5 -> V6:
    - delete unnecessary code
---
V6 -> V7:
    - submit device tree only
---
 arch/arm/dts/Makefile                    |   1 +
 arch/arm/dts/ast2600-inspur-nf5280m7.dts | 163 +++++++++++++++++++++++
 2 files changed, 164 insertions(+)
 create mode 100644 arch/arm/dts/ast2600-inspur-nf5280m7.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 6c34b83336..9d21e58ca5 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -687,6 +687,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2600-dcscm.dtb \
 	ast2600-fpga.dtb \
 	ast2600-intel.dtb \
+	ast2600-inspur-nf5280m7.dtb \
 	ast2600-ncsi.dtb \
 	ast2600-p10bmc.dtb \
 	ast2600-pfr.dtb \
diff --git a/arch/arm/dts/ast2600-inspur-nf5280m7.dts b/arch/arm/dts/ast2600-inspur-nf5280m7.dts
new file mode 100644
index 0000000000..3c9200c525
--- /dev/null
+++ b/arch/arm/dts/ast2600-inspur-nf5280m7.dts
@@ -0,0 +1,163 @@
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
+};
+
+&i2c4 {
+	status = "okay";
+	multi-master;
+};
+
+&i2c5 {
+	status = "okay";
+	multi-master;
+};
+
+&i2c6 {
+	status = "okay";
+	multi-master;
+};
+
+&i2c7 {
+	status = "okay";
+	multi-master;
+};
+
+&i2c8 {
+	status = "okay";
+	multi-master;
+};
+
+&i2c9 {
+	status = "okay";
+	multi-master;
+};
+
+&i2c12 {
+	status = "okay";
+	multi-master;
+};
+
+&i2c13 {
+	status = "okay";
+	multi-master;
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
-- 
2.34.1

