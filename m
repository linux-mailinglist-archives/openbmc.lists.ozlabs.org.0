Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 783C1226721
	for <lists+openbmc@lfdr.de>; Mon, 20 Jul 2020 18:09:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9RVt2W27zDqS1
	for <lists+openbmc@lfdr.de>; Tue, 21 Jul 2020 02:09:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=nam04-bn3-obe.outbound.protection.outlook.com
 (client-ip=40.107.68.75; helo=nam04-bn3-obe.outbound.protection.outlook.com;
 envelope-from=supreeth.venkatesh@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-amdcloud-onmicrosoft-com header.b=nJej+TK5; 
 dkim-atps=neutral
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680075.outbound.protection.outlook.com [40.107.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9RLr2MbDzDqcV;
 Tue, 21 Jul 2020 02:02:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3qTqd+iB1pZcYz2xIxqclSN3UVD+WQPlM/UUpr0H3cyKHXt+SS4s0LfRLRo/Wx0KpQiBtRRS64G5E2scgmQ+wUQp54GAlHuPYgIR/FkHe70UfV20cEj69cEmnau+1FBm8JleETthZzmn2Vm7sqCHWjv14BBl+cy/TYlLHI58IOZ6Z0Ju3dMnVYb7xmVkWjd9lHozwg2E9J+jdI/zc7ICsEcVH9qX5bAsJ638/zu9LmeFCVYCvWizJXDwBd/JjKbMjI1oVSzPhVBdKbVdKqmHxtAGnbaIJTaTgtloFsSO9928EGz3GFJttjYFV8BN8218IpZTc2RZV6sFDb9UPpl0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvlFlS2v9Mu+0bBwJ9GMqsVwteCLhvO6xXBmXIwN0BY=;
 b=IBjQjQ3Az0jz8/KRSNQBfRAL7kG5XBX/o1fn5zHWfD5PRdt2v3aYoi0jslbaxm1EskGjT/G3sR0PyFwPd+OE0MYW/loSvgTpp6tR+kRu957TEt0cH825z/urdPmsF1csPv8Bt+e3DC3hL8gv5hDqtNrjA7ghCxySaIcD7CKycI7h+B8IVWfNYei1vRGZ8OOCANZ3GhsAFod3FvxvwEDVzW3AN2CnRlWCTXC6FHBP455cJ37EYNaFw4LwcUWxWBqQu0KrzQ02mQoi1CpbOZ0GpUtn+se5zXbeJrAc7OVtqI7wl8HR4uRqb0vHcvlPMGnoBjUEw4HLxe77S2hlUYJQrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvlFlS2v9Mu+0bBwJ9GMqsVwteCLhvO6xXBmXIwN0BY=;
 b=nJej+TK5vz8XmnwuQrFhEcwnGqt7zmjEed+GoB7AuRyrd/uO4IQZ2pytTZrJC06/rrmLt8coaqIDIP2NmMtyYtBivqGPcUNKCC/b/MIHFxVVGDnkVlhAGDIUNdQSExL5x7nhAbGXCCfTWexomouLjGu8Sn9TIKjLQUXp/GzOKoE=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4582.namprd12.prod.outlook.com (2603:10b6:208:26b::18)
 by MN2PR12MB4189.namprd12.prod.outlook.com (2603:10b6:208:1d8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Mon, 20 Jul
 2020 16:02:03 +0000
Received: from MN2PR12MB4582.namprd12.prod.outlook.com
 ([fe80::7d2d:b00b:bac4:a66b]) by MN2PR12MB4582.namprd12.prod.outlook.com
 ([fe80::7d2d:b00b:bac4:a66b%7]) with mapi id 15.20.3195.024; Mon, 20 Jul 2020
 16:02:03 +0000
From: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
To: joel@jms.id.au, andrew@aj.id.au, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, robh+dt@kernel.org
Subject: [PATCH 1/1] ARM:dts:aspeed: Initial device tree for AMD EthanolX
Date: Mon, 20 Jul 2020 11:01:47 -0500
Message-Id: <20200720160147.22339-1-supreeth.venkatesh@amd.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM3PR12CA0128.namprd12.prod.outlook.com
 (2603:10b6:0:51::24) To MN2PR12MB4582.namprd12.prod.outlook.com
 (2603:10b6:208:26b::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from BMCDEV-02.amd.com (165.204.78.1) by
 DM3PR12CA0128.namprd12.prod.outlook.com (2603:10b6:0:51::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Mon, 20 Jul 2020 16:02:02 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.78.1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7ae39265-ec20-4e4d-ae88-08d82cc63e05
X-MS-TrafficTypeDiagnostic: MN2PR12MB4189:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB41892777A12BBA91C318001B967B0@MN2PR12MB4189.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /+87qw9zlKVMTLN4EwS2hq2ElwaXJEs1vxSyT5HacmBwxZzRtXPHbexwHHG6uwmQm5M8I43IYyTpvJhD/h6tCV3ghvc0F0ZQ2bLP7Aq82/7EcRc1v8cAR9Us6/DUL9cJGtRG4tJG/S8pwpPF43qW2LlmKZuPp3LMVYT2zIrebyL1qbRFt6WYws8DfqfGRbRBbCxKRPBzX+523sHFiSYwJW5YlzjM/s3yk1FPWCWVopnr1ZU/c0yDpMb7IcCMSyPPLRlWHL3NtBPDlfrq9MGP+zpx2COVVDbcXce6H9C6gaSyaSDVZU+/dgytPJsbwFHk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4582.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(376002)(136003)(346002)(39860400002)(2906002)(83380400001)(8676002)(36756003)(66556008)(66476007)(66946007)(5660300002)(86362001)(1076003)(4326008)(316002)(478600001)(44832011)(8936002)(6486002)(52116002)(7696005)(26005)(956004)(2616005)(186003)(16526019)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: GUmDsJsmZTHINoHmEQhwNmt3CEUIaJE+sbZtz6xyOBSgqWO85TSnBol2yWBsa4tg3KAuLvM3xEKHPr2hnijYfMEFC5YmV68bjARheLMBaZeLh2JOxCM+gGIqWVwcpait80Z+hj4oHPAZcb4jZ2bYY6rYoHW3l7AGltkKkqVGE26wNil0s0xnPSo2C6VlxrZHDy9HVQ5uqnWI9Wgq7a4wdNyU7HmyaqPxf5lh8zyrK+L60F+efEOkGW/WVNmxxunPiw590pL2ORbcsmrqitUxl79fGfYejGkrAj1FPqQgELWs6d63+tluBWNNMNnYJwpIctBhlapyLrSd8BVQnyJp+bgiVTRsD1Wuhp2PfTFFhdb7GRTmhaudqyDnRp9nrKUeAIax1qE5z2Bz5ivbFZvPEnYxcIQ9ZM1cmpgzryk+Vh/Q9URkMpyREzlK0HK2xFFod+2bcxyF5PKMdcwDQQdWwXnVPIFRIS1C03U/bb1MSqw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae39265-ec20-4e4d-ae88-08d82cc63e05
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4582.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2020 16:02:03.1220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jrWtmUZrnERaES9LC31i86W9TCAKO1aMYSfbaUe0kuu0buJuQ96edN5WHb4zgt3HJ3vKKiA1uYIupTYq3oatQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4189
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
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 209 ++++++++++++++++++
 2 files changed, 210 insertions(+)
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
index 000000000000..dcabdfc08172
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: Apache-2.0
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

