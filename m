Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6985152DD3C
	for <lists+openbmc@lfdr.de>; Thu, 19 May 2022 20:56:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3zb521lTz30DC
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 04:56:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=frhkRuTX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=199.106.114.39;
 helo=alexa-out-sd-02.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=frhkRuTX; dkim-atps=neutral
X-Greylist: delayed 123 seconds by postgrey-1.36 at boromir;
 Fri, 20 May 2022 04:55:38 AEST
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3zZf5zpFz2yyQ
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2022 04:55:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652986539; x=1684522539;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cIPa1NoyfDMNm06yHcW9CZ7Ga4FWuzhpFTZ0ypuRj3g=;
 b=frhkRuTXz3zjfUurZ1Q7I7T4zVDgbTp6uSVrtShbWwbcW80bJmmHo18L
 r/sBk7yjhicZGuTk2vdoxq3IfScJMJHPQQq0mpXeSP+kO2FvPnLnDZIcl
 xNsXYyzTEadO78SJcwGBMqBmRBgqIsnjsi9rJlC20RuwbqjbffVLwKiQQ Y=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 19 May 2022 11:53:31 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 11:53:31 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 19 May 2022 11:53:31 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 19 May
 2022 11:53:30 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2] ARM: dts: aspeed: add
 Qualcomm DC-SCM V1
Date: Thu, 19 May 2022 11:53:18 -0700
Message-ID: <20220519185318.62655-1-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: openbmc@lists.ozlabs.org, Graeme Gregory <quic_ggregory@quicinc.com>,
 Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Jamie Iles <quic_jiles@quicinc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Graeme Gregory <quic_ggregory@quicinc.com>

Add initial version of device tree for Qualcomm DC-SCM V1 BMC which is
equipped with Aspeed AST2600 BMC SoC.

Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com>
Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
---
Changes in v2:
* Changed vendor name from Nuvia to Qualcomm.

 arch/arm/dts/Makefile                   |   1 +
 arch/arm/dts/ast2600-qcom-dc-scm-v1.dts | 208 ++++++++++++++++++++++++
 2 files changed, 209 insertions(+)
 create mode 100644 arch/arm/dts/ast2600-qcom-dc-scm-v1.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 3515100c65ce..e86a6c0ed609 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -686,6 +686,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2600-intel.dtb \
 	ast2600-ncsi.dtb \
 	ast2600-pfr.dtb \
+	ast2600-qcom-dc-scm-v1.dts \
 	ast2600-rainier.dtb \
 	ast2600-s6q.dtb \
 	ast2600-slt.dtb \
diff --git a/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts b/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
new file mode 100644
index 000000000000..e966f739b708
--- /dev/null
+++ b/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+/dts-v1/;
+
+#include "ast2600-u-boot.dtsi"
+
+/ {
+	model = "Qualcomm DC-SCM V1 BMC";
+	compatible = "qcom,dc-scm-v1-bmc", "aspeed,ast2600";
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
+		spi0 = &fmc;
+		spi1 = &spi1;
+		spi2 = &spi2;
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
+	pinctrl-0 = <&pinctrl_mdio4_default>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ethphy3: ethernet-phy@1 {
+		reg = <1>;
+	};
+};
+
+&mac2 {
+	status = "okay";
+	reg = <0x1e670000 0x180>, <0x1e650018 0x4>;
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy3>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii3_default>;
+};
+
+&fmc {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fmcquad_default>;
+
+	flash@0 {
+		compatible = "spi-flash", "sst,w25q256";
+		status = "okay";
+		spi-max-frequency = <133000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+
+	flash@1 {
+		compatible = "spi-flash", "sst,w25q256";
+		status = "okay";
+		spi-max-frequency = <133000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
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
+		spi-max-frequency = <133000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
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
+&i2c12 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c13_default>;
+};
+
+&i2c13 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c14_default>;
+};
+
+&i2c14 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c15_default>;
+};
+
+&i2c15 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c16_default>;
+};
+
+&scu {
+	mac0-clk-delay = <0x1d 0x1c
+			  0x10 0x17
+			  0x10 0x17>;
+	mac1-clk-delay = <0x1d 0x10
+			  0x10 0x10
+			  0x10 0x10>;
+	mac2-clk-delay = <0x0a 0x04
+			  0x08 0x04
+			  0x08 0x04>;
+	mac3-clk-delay = <0x0a 0x04
+			  0x08 0x04
+			  0x08 0x04>;
+};
-- 
2.25.1

