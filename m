Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA5722CEA5
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 21:29:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCzmL3mSbzF1Sc
	for <lists+openbmc@lfdr.de>; Sat, 25 Jul 2020 05:29:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=nam11-bn8-obe.outbound.protection.outlook.com
 (client-ip=40.107.236.65; helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=supreeth.venkatesh@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-amdcloud-onmicrosoft-com header.b=d6nuEfJu; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCzlP24ZqzDrnm;
 Sat, 25 Jul 2020 05:28:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6oups4hh2UkbAc5GAiRDixD+zJOa8JAgYs2C2g4b26R6F7fbhSDi1d6zW9ZHyh78lOV5ItShVkcq++BNluCowLiu95/2qcOLhmbMbA/tjR66h/xuzAxYCT/ov+sldO46Avgjy+ObCqRHXnf+iO8JGrDYp1SPx7Jnd3QLahomFzVV51gyoannlXsI9Mb1V+ADAmenAyM8Mwv2phlc1+HJmNskkii9J6Ub4HYv8E6fXihdvZh7cdW4OCTNcCoov6qVOV2sfeWyVfiTJyE+y1uRQCLidjk63F5sp9XOkXzEr32Xu7UrHaaLrbXQrgEnvujhp+4GYOiBynng6zSAAraXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qzu39u+hsqS4T/zy1RmLmLQahWLLyCmRamt06m5PI80=;
 b=bGozSzuwwonqT85PoDLhF0e39olAwCKTw/A8nWtBoxzAB1eeYrhXcoUmxSLSWfYZ8RwkxwI/x8mzNR9qhQEqgmfcgGrUllb+crfP844nKFhCJCj6zgaR3K3PG5bMWDm1G06QvXJVnFs9aU59RaZeJqI/9k4uMl//eguFEwH6as0+xdSncQEsl+x0gKm02T5X1itN2u1d5LoLZeafklMa9bUtveVOZ7efBVmzFra+rgFWOQmqFRXOjrYFRuQgfVWGKIaHpB72+zwY4X0CLiLudK+g92KOnGoF/MW9NwNzgmIMN6T05Eq6aCExAlozZ47aPiTfG1hFrc2rsk3xlTTzjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qzu39u+hsqS4T/zy1RmLmLQahWLLyCmRamt06m5PI80=;
 b=d6nuEfJuHlgBb/LEXT6Kmn5rv/wA33uUVcImMHkVSzF8U7QtywWpNABGaicVRaREuodr+4xJYm7j842OVFhPQ8MqJMCx3ldyqVAvrQk9XZjf36/+tVQmyrK3jR3/5ouqCxXHJFEgTXda/wrzeafdl+BFCrlvHoBxZ0tpM+4gQHo=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2542.namprd12.prod.outlook.com (2603:10b6:802:26::28)
 by SA0PR12MB4525.namprd12.prod.outlook.com (2603:10b6:806:92::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Fri, 24 Jul
 2020 19:28:40 +0000
Received: from SN1PR12MB2542.namprd12.prod.outlook.com
 ([fe80::7d62:9500:521b:40a4]) by SN1PR12MB2542.namprd12.prod.outlook.com
 ([fe80::7d62:9500:521b:40a4%6]) with mapi id 15.20.3216.023; Fri, 24 Jul 2020
 19:28:40 +0000
From: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
To: joel@jms.id.au, andrew@aj.id.au, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, robh+dt@kernel.org
Subject: [PATCH v3 1/1] ARM:dts:aspeed: Initial device tree for AMD EthanolX
Date: Fri, 24 Jul 2020 14:28:18 -0500
Message-Id: <20200724192818.68068-1-supreeth.venkatesh@amd.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR21CA0009.namprd21.prod.outlook.com
 (2603:10b6:5:174::19) To SN1PR12MB2542.namprd12.prod.outlook.com
 (2603:10b6:802:26::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from BMCDEV-02.amd.com (165.204.78.1) by
 DM6PR21CA0009.namprd21.prod.outlook.com (2603:10b6:5:174::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.1 via Frontend Transport; Fri, 24 Jul 2020 19:28:39 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.78.1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ddde1527-1780-42b1-8e2c-08d83007c4c9
X-MS-TrafficTypeDiagnostic: SA0PR12MB4525:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4525D721DBB0CDE510B1029B96770@SA0PR12MB4525.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pZ6UqTnOR2ej0LTmCgaEm/Kl7qCvDlExGhlMNBoRQOy0atJ7nvB18kfz2I6AbI6f9FGuMMkIug39yz9KKONt06uCXfpVgTqIbR8zn5bXcpbMCynJevcHmGVPnXPn86FfUPF1B+xFYagKf6IctwKRPF5fd2wdgOtHQyu5FyWm8CL7DJ5tvrkJpExXLVC3vngNzxJzwgyR44mcTtqx7hZnthOx9hkd1lYOPkLyQEOvm1o2N6xQ+7B5iouqFsZwLS1TEMc8oHhnd6UKCz/QjGb0TxOsx2GXCydUhx9/xZb+sNzvX15YEPOR2CRyp1Th6KMrmBnyz9yzlyho65Y+liFuLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2542.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39860400002)(366004)(376002)(136003)(396003)(4326008)(16526019)(186003)(2906002)(52116002)(26005)(86362001)(5660300002)(1076003)(8936002)(66556008)(83380400001)(36756003)(6666004)(956004)(6486002)(7696005)(478600001)(8676002)(66476007)(66946007)(2616005)(316002)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: CKYCTluRzuK7mfpkyFyXvoYKBFaJIt//Pb4ycG15rAhQx0oQHo8WfvTJI0fxXe2NFD8DUSMUSZFr3knCjngFhX68+UG9pYoFyL9Xlx9AsjzHnydYHc55bARBalKTO5AwOQhtEVGRnU+AcwE7cRS7HgH9/N/Liae9+mYP5JLexELif3PTHU6UUvn3nnyRliCjNHG9h9SwXTph+SHFTxprP8E6K0xpC3rmcK8CsiCfUTlrAXuSSqgCUXfFVvav03gk77Wbjp95mzUsfwdKGz+fhq0aLoIcAb6hsPLls2KmH3KJnpCjyMnHaPVjajbGldUkDohY3bK9GI9Qoua9xMoqItfY69ytBcH3uDJk0k9MhPrcRCKUYkmp2iEFMTwIhnQxiRrJg92QQG7f0ZHoqoX391pSimYNz59RWF7O5F4szn4tFlk9n++mlP/M92f12wduFw/4Mi5ngitjcUGlorV2mxkzFofMPTM+v3vW7BcVyUo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddde1527-1780-42b1-8e2c-08d83007c4c9
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2542.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2020 19:28:39.9042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VycfIOsIgpI0tb3fjG2P39v91qvIA+W+1Qvx1lQPHaPcI4O5axVq5GU3vpbA23VHdE4yl9lTiv3armBCWirw/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4525
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
Cc: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Initial introduction of AMD EthanolX platform equipped with an
Aspeed ast2500 BMC manufactured by AMD.

AMD EthanolX platform is an AMD customer reference board with an
Aspeed ast2500 BMC manufactured by AMD.
This adds AMD EthanolX device tree file including the flash layout
used by EthanolX BMC machines.

This also adds an entry of AMD EthanolX device tree file in Makefile.

Signed-off-by: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
---
Changes since v2:
* Removed incorrect I2C0 and I2C1 Reg addresses

Changes since v1:
* Addressed review comment regarding SPDX License Identifier
* Added I2c0 and I2c1 which cater to AMD's APML Interface
---
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 219 ++++++++++++++++++
 2 files changed, 220 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index d6dfdf73e66b..55ed881d2ebc 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1281,6 +1281,7 @@ dtb-$(CONFIG_ARCH_ZX) += zx296702-ad1.dtb
 dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-ast2500-evb.dtb \
 	aspeed-ast2600-evb.dtb \
+	aspeed-bmc-amd-ethanolx.dtb \
 	aspeed-bmc-arm-centriq2400-rep.dtb \
 	aspeed-bmc-arm-stardragon4800-rep2.dtb \
 	aspeed-bmc-facebook-cmm.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
new file mode 100644
index 000000000000..60ba86f3e5bc
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
@@ -0,0 +1,219 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2020 AMD Inc.
+// Author: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
+/dts-v1/;
+
+#include "aspeed-g5.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	model = "AMD EthanolX BMC";
+	compatible = "amd,ethanolx-bmc", "aspeed,ast2500";
+
+	memory@80000000 {
+		reg = <0x80000000 0x20000000>;
+	};
+	aliases {
+		serial0 = &uart1;
+		serial4 = &uart5;
+	};
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,115200 earlyprintk";
+	};
+	leds {
+		compatible = "gpio-leds";
+
+		fault {
+			gpios = <&gpio ASPEED_GPIO(A, 2) GPIO_ACTIVE_LOW>;
+		};
+
+		identify {
+			gpios = <&gpio ASPEED_GPIO(A, 3) GPIO_ACTIVE_LOW>;
+		};
+	};
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>, <&adc 4>;
+	};
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		#include "openbmc-flash-layout.dtsi"
+	};
+};
+
+
+&mac0 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii1_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
+		 <&syscon ASPEED_CLK_MAC1RCLK>;
+	clock-names = "MACCLK", "RCLK";
+};
+
+&uart1 {
+	//Host Console
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd1_default
+		     &pinctrl_rxd1_default>;
+};
+
+&uart5 {
+	//BMC Console
+	status = "okay";
+};
+
+&adc {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc0_default
+		     &pinctrl_adc1_default
+		     &pinctrl_adc2_default
+		     &pinctrl_adc3_default
+		     &pinctrl_adc4_default>;
+};
+
+//APML for P0
+&i2c0 {
+	status = "okay";
+};
+
+//APML for P1
+&i2c1 {
+	status = "okay";
+};
+
+// Thermal Sensors
+&i2c7 {
+	status = "okay";
+
+	lm75a@48 {
+		compatible = "national,lm75a";
+		reg = <0x48>;
+	};
+
+	lm75a@49 {
+		compatible = "national,lm75a";
+		reg = <0x49>;
+	};
+
+	lm75a@4a {
+		compatible = "national,lm75a";
+		reg = <0x4a>;
+	};
+
+	lm75a@4b {
+		compatible = "national,lm75a";
+		reg = <0x4b>;
+	};
+
+	lm75a@4c {
+		compatible = "national,lm75a";
+		reg = <0x4c>;
+	};
+
+	lm75a@4d {
+		compatible = "national,lm75a";
+		reg = <0x4d>;
+	};
+
+	lm75a@4e {
+		compatible = "national,lm75a";
+		reg = <0x4e>;
+	};
+
+	lm75a@4f {
+		compatible = "national,lm75a";
+		reg = <0x4f>;
+	};
+};
+
+&kcs1 {
+	status = "okay";
+	kcs_addr = <0x60>;
+};
+
+&kcs2 {
+	status = "okay";
+	kcs_addr = <0x62>;
+};
+
+&kcs4 {
+	status = "okay";
+	kcs_addr = <0x97DE>;
+};
+
+&lpc_snoop {
+	status = "okay";
+	snoop-ports = <0x80>;
+};
+
+&lpc_ctrl {
+	//Enable lpc clock
+	status = "okay";
+};
+
+&pwm_tacho {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default
+	&pinctrl_pwm1_default
+	&pinctrl_pwm2_default
+	&pinctrl_pwm3_default
+	&pinctrl_pwm4_default
+	&pinctrl_pwm5_default
+	&pinctrl_pwm6_default
+	&pinctrl_pwm7_default>;
+
+	fan@0 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
+	};
+
+	fan@1 {
+		reg = <0x01>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x01>;
+	};
+
+	fan@2 {
+		reg = <0x02>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x02>;
+	};
+
+	fan@3 {
+		reg = <0x03>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x03>;
+	};
+
+	fan@4 {
+		reg = <0x04>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x04>;
+	};
+
+	fan@5 {
+		reg = <0x05>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x05>;
+	};
+
+	fan@6 {
+		reg = <0x06>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x06>;
+	};
+
+	fan@7 {
+		reg = <0x07>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x07>;
+	};
+};
+
+
+
-- 
2.17.1

