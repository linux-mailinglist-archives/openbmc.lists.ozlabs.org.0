Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4037522A1A7
	for <lists+openbmc@lfdr.de>; Wed, 22 Jul 2020 23:56:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBq6l3cDXzDr2q
	for <lists+openbmc@lfdr.de>; Thu, 23 Jul 2020 07:56:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=nam11-dm6-obe.outbound.protection.outlook.com
 (client-ip=40.107.223.63; helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=supreeth.venkatesh@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-amdcloud-onmicrosoft-com header.b=j3VjI31l; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBq5n5C0YzDqT7;
 Thu, 23 Jul 2020 07:55:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h46WKeqa+QybwxJKoG6DVZBB4B2HTlo/2TuVCmhZ4/cKdLVAu4jGRFS0kIbdQSMpbKzn0ywZRBwd6I4JvTV5Pth5kZBHL+hSk1X6VbLkW+nw1/hN9b64IFadfXIwulhRShQGcRBtt32Poy6Noe21DjKfpiGYXne4tiJ6i4HE1C+GoZESUUy7k+SfJbYgvMvdKAmKprNIOYIUaUENu35JKr70LEH3x/bWH9IFx/7z27A+7v1m8zm9q1St0EQpPt4IM584PHrZQFHlBt3sHvA1ACqWHkzxxY+YkstLi41/WIJFlBWV7gPRtcGWRBSHpPH+WNyIH5qVSzQiKXKhbUifJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlGZjebzE57gHn+5sKfurMuK0R7344ncjIYBc5Vk4Ok=;
 b=jb+CHsB6GxvS8tYdU8GzK5GjCVMmG5K7aqL+ruEAKiGRdAf5N5QRTclU4eaoOe7YsCogQpVXwpzqL4bZgZLOIwhFpEWRsALuNMYpjqLn+7YYdiJ7J2T/CPVGh/gAhDjfAnDxG/VsVCuIIfUfSWSZHvJR4HKPM87RGzMEIuX+1mnYKsat2Bp3/Bw0BiWsLWOTMifbTJx2rb47sFs9QZGwBYrzw7PzOD331qpmpCtkIdT4edp4cwicfWbX1s6NZhfxzmKwnkGzrxlBqnxHhzsI+XZbhduX5k+e6i51/ZIhH8NSPDRy0CdanfIOKRDzuAcQt+GSGwMplaRfPTYSMnnkLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlGZjebzE57gHn+5sKfurMuK0R7344ncjIYBc5Vk4Ok=;
 b=j3VjI31lDX8r9KFH0giQHepHU5NI9fvtutYVmXpMW+XXPweLCmf3iNyfXX0wGhyaYTYdbYsHzVkbeCqdOCR8ZTXwnKVlGdQ5f0YenfENXw8ISOIMvQvbfhm8Baf0QJ9VGSZ1d5LqRsCC4532WFCy+SYl0kPEb4/pR7QpactO+GQ=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4582.namprd12.prod.outlook.com (2603:10b6:208:26b::18)
 by MN2PR12MB3917.namprd12.prod.outlook.com (2603:10b6:208:166::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20; Wed, 22 Jul
 2020 21:55:32 +0000
Received: from MN2PR12MB4582.namprd12.prod.outlook.com
 ([fe80::7d2d:b00b:bac4:a66b]) by MN2PR12MB4582.namprd12.prod.outlook.com
 ([fe80::7d2d:b00b:bac4:a66b%7]) with mapi id 15.20.3195.026; Wed, 22 Jul 2020
 21:55:32 +0000
From: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
To: joel@jms.id.au, andrew@aj.id.au, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, robh+dt@kernel.org
Subject: [PATCH v2 1/1] ARM:dts:aspeed: Initial device tree for AMD EthanolX
Date: Wed, 22 Jul 2020 16:55:06 -0500
Message-Id: <20200722215506.5984-1-supreeth.venkatesh@amd.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0701CA0002.namprd07.prod.outlook.com
 (2603:10b6:803:28::12) To MN2PR12MB4582.namprd12.prod.outlook.com
 (2603:10b6:208:26b::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from BMCDEV-02.amd.com (165.204.78.1) by
 SN4PR0701CA0002.namprd07.prod.outlook.com (2603:10b6:803:28::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23 via Frontend
 Transport; Wed, 22 Jul 2020 21:55:30 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.78.1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 67349b89-ce61-402c-a4e6-08d82e89f466
X-MS-TrafficTypeDiagnostic: MN2PR12MB3917:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3917A9BF810DF4D7C05DC3D696790@MN2PR12MB3917.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZsaBwO9tFu80ZHjB0xsXvCZXInGxl0nBTeQuWRdqQ1KL8cNcYlfF1sSo+4nBz7jtTCWtQQ6rU9ekH7H23cJ3t8/cq4vwVNYfq7pRlu7p/vbbjIrumwDpnABi8CTA07/YGT3JL6iHjaAik4N7GRhPF5s3VCuQiPIL9EDD9oKDPSCqI2vIcNOP/etny2Rdh+n4NnoP4+zWCGuOwAdoDJH2sb0PgmdiYJ0CTU3/alP/db1GfZSNpDrQHyUBApuenXYjZydt9AaK9KGowCbELMiMO8o9CFXgKwQYRIcCmeswYsbvSYLQvLe1fSzwa4RFkWUGSSmGgUy9IQXgksu9FOm5sw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4582.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(8676002)(478600001)(36756003)(186003)(66556008)(6486002)(7696005)(44832011)(66476007)(52116002)(83380400001)(66946007)(16526019)(6666004)(2616005)(316002)(26005)(956004)(8936002)(5660300002)(1076003)(4326008)(2906002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: /VrQ9RWC/f+pC+21P40CKTfnhMYrV2IFzJkKQrHnujhConufO2in+3MQ8S1P7CDxNbS1sAzMaW1GUQ0eA/sHiVKGZwoQp5hM7kkgFmqnizmDUpecm8sgjLPZwDxlM5xXnsJtfIxfM5JxacKisGYd/pShOe0eV1hX+86ygArFpCUUkMrF4X8vJhLZMFSNVyqNyNnxDBfj84BrUELfldXuthREGzJR/m44b+KPqT9eyLVV4QD5B+/nEUachmf+klHYc7f6W8iaC17Rt1uKwQuaZcxa0hcrG7o5oRAkhwuPQ1RtBaOt/r8dmN+Bjvd9/XJD1sOnYTyeJ7sGclk23AmpX6tUXA2HTJhfAPAVHshSzjppc6rb9IwI0zntGqeGWITj2sDG2PaTUWDsG4bCuOz+MTl5UNOufnHEHUmbuxW3MrnsUqH+Hl7n0txLgyNdHpditCZ9Rnr3bxaWWaz8Mu4TKFp96fWQfIbKKVEcLFpxVYU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67349b89-ce61-402c-a4e6-08d82e89f466
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4582.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2020 21:55:31.9894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lRwILJdWd74pFCSnRnj2Giis/1tcq4/SjqvqnljNc1SozvSDAEmF3TlHownd3qNlIty+K3GunLcj/Ke+XbuqFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3917
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
Changes since v1:
* Addressed review comment regarding SPDX License Identifier
* Added I2c0 and I2c1 which cater to AMD's APML Interface
---
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 221 ++++++++++++++++++
 2 files changed, 222 insertions(+)
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
index 000000000000..3d67fa31a3ab
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
@@ -0,0 +1,221 @@
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
+	reg = <0x80 0x40>;
+	status = "okay";
+};
+
+//APML for P1
+&i2c1 {
+	reg = <0xc0 0x40>;
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

