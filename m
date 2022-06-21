Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9163552E26
	for <lists+openbmc@lfdr.de>; Tue, 21 Jun 2022 11:23:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LS1Jj5lnSz3bvP
	for <lists+openbmc@lfdr.de>; Tue, 21 Jun 2022 19:23:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=M/p39M90;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.94.137; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=M/p39M90;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2137.outbound.protection.outlook.com [40.107.94.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LS1J52Kd1z2ypZ;
	Tue, 21 Jun 2022 19:22:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXgt/ujqvDg8+MAeKn1HaoFQuh0ueJ7rsSwO3cbSAMfGL7ZYc4mIJSr7hAeYZOjhrfSN2EknzxRUSXML2+8GOe8S42cIjy0djStwVrI1wDRj3t+WQstzfw25vSIjzfd89DcDGSIdxHKAARscZ62Z5WzlGrybSYz983Xla96A00WlAfIXDrNMeDH1irZSJHy7cj7JL+WMYU+Wpwi8FGalf9pm3HmMBHrE4/pcI7I8Y46tgz6gSr+Cr+UGOmCRGh5DviRR7GNkHQ6ZdgUulkJVAyghGhQqUXKzmMy0sUaBrm1D+2mk82Qu9OgcH/jwgDOIxHDSFJ1sFILmAJ5PcdUWwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GV2tG3EwFKB4aLw3gxrL2NH8w2N0PP1NXZO+ibajz4I=;
 b=hwhiMX38xEbj/+HFX3uLVbGXdFZLNBMXfRoEZ0iQRjKhrt/vpWR7BvudSimFqqd5mkG3TaNdHVKZLtROoGdjxUwDLePfH2USAjzZIYycD1r/jKWSCCv4WDXVFdrVTbzhHdocXDNMgZ4a0Z76B/mkgpA1/IhXId80lUjYPtAgHi0mqz0KwZE771F5LwI0OvqSpK2crWoJ5BHevW2TJz3JSP0zZfmv2HqrRc1+KPpe8mqrotfqKHOCd7AWU4rQkd8wvV1fKWogYZe8z1W2kfkw1ViTNG9UY1y0j09Xi/crRvohpaWkNIIIoqnSlJ4ef7quyYNPmR6ZoOk27XF3Kiz+Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GV2tG3EwFKB4aLw3gxrL2NH8w2N0PP1NXZO+ibajz4I=;
 b=M/p39M90u8NHwYWvPgRqoE/6c6+b4HR6gr2PwVAQMtvE97rtaCs/GiGV3PA3W+2PcdLxWl8+cefTyer7BYudraDh5VGhLn+0kuegmEtPmGv5N/aa3+H5KnzsBsxlizCScLqsur0dpvlZ/bZ2kWdbX7jona3TaGOcDvxWdI5RdDc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BN3PR01MB2148.prod.exchangelabs.com (2a01:111:e400:7bb4::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.15; Tue, 21 Jun 2022 09:22:06 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e%7]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 09:22:05 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: openbmc@lists.ozlabs.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH] ARM: dts: aspeed: Add device tree for Ampere's Mt. Mitchell BMC
Date: Tue, 21 Jun 2022 16:21:20 +0700
Message-Id: <20220621092120.2427152-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0126.apcprd02.prod.outlook.com
 (2603:1096:4:188::11) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af02a914-31e7-4962-bf3e-08da536781db
X-MS-TrafficTypeDiagnostic: BN3PR01MB2148:EE_
X-Microsoft-Antispam-PRVS: 	<BN3PR01MB214898BD1C4F9649B646E046F2B39@BN3PR01MB2148.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	2+5rjC2TvHoCuIKzrbM8yXf6uHoq9f8LU86SgyTFVF2aOL1MleqzzvpSs285CA7Rcz1HvbrT6AsDA8XnI9ajaSGahRvHFI2i7yzH578+4oBOa8xpd+jLpiYOl+NUUxn9U1xCbVIYcDNyMMVn2BPr4k8YBAR8dA2UCmZdoXE2xkGOCKOQHWa+15orHTayuxL7X+9cn6ooJttUi+4ynyC4CRLwYwE09sdvY1QdiqrwBUUNSl8erndKq6YdrK97mVtarsWssowmy7LQIgA7RHd1cJLgBkHMyR/8ntpzM7WTbxF/Zm2GiMO4hSiUjCL0yT8Zs1QSG2BuTr2aUIa1qeJMnsqCVbOxNztbZuI7RgDaxnHGVPdtpkyhtnJ6Mdxc/7fzDeeFt/RfYGpKdHXLGzxDeHp+rWkT2Kssiwun9pb++MDBIpVFT4+nXkWEG0F9mPT37I/8X8y+AOAZ3uYvlmo+XtJx2CDF8dh5HLg8ps6uXPaU0oPeKlCtM6/Otwdm64zp0tY2KVgOL9KSgUhiY4vg65mu4G/9hyW/o/5X/jDtMBwLck4oD/qD2xYAdH37LeNJLtqtyuNTfUmjUfLpe0pNrgL5I1VDx7WSYjwRsJEbt7H9p9p9b/9CAzukyEHyImcKakkxwzUaPMAu+WJImQgqAydSp+cIfxD3PiPq8rRX7wXcZkdBCHcBPVbxnn0MTJ7btUxSKfUjvx/2DlB0LbQEWoo4zOBAXNGlOFOIwaQtG+2YNDcoKcq/RZ9xVPAJWJDJZv65o0wEnOT/WR4pS+lsQoCBvjlXFfR3MwnTs//WroxJRepXAONuIA4r7fGY0qSe
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(136003)(376002)(366004)(39850400004)(8676002)(478600001)(921005)(66476007)(41300700001)(54906003)(110136005)(66556008)(186003)(66946007)(1076003)(6486002)(4326008)(66574015)(52116002)(2616005)(6506007)(107886003)(5660300002)(86362001)(26005)(316002)(6512007)(6666004)(38350700002)(7416002)(8936002)(30864003)(83380400001)(2906002)(38100700002)(449214003)(473944003)(414714003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?RXrJIJ8k8E8bKfgkff5/V0U/mcDxQsu/nA3UCL5UuLhz0ostce9jyK+sUFV8?=
 =?us-ascii?Q?QFTexmqFL9YeUm2dnGlmGR3fxT2S214YW07GEb5vtRaCXxbqPe4SS6R8+//s?=
 =?us-ascii?Q?48I2Q/Q3jdIAStN1HU4qz0O4eDkRGydn9DnZF02pXH0WNq8azZh7rGJM/DQC?=
 =?us-ascii?Q?Foqd2G9vMRX/YeqSAHqmB9FAkmZQCjfwgbAolwRcxneqDOAS56e2vxjz4VxB?=
 =?us-ascii?Q?74ozbxMg14cLVDHk8bk/TG6luI1aRBz9HB2XfqNLcAfbO/5dUjaNG+CSM3bc?=
 =?us-ascii?Q?U1l4g0E74EQfQRcZN1MSQfbc9y1sWyMMEwWlQ9kAiWC0JRSjfxbegscQwKaZ?=
 =?us-ascii?Q?sDcVsVzIy7bl6slkhIspn322hzy/X9w631S46wEq6KPwbqUenRgpsxz7XdNS?=
 =?us-ascii?Q?vI2G3BrcjoDfyN5l6PfQXCKK7yj8W4rBftzYIR/Cy5eXr8dxbziiC5HiZCkt?=
 =?us-ascii?Q?HKT2g40c2lEJhPmpc5SOtE7MzeQVAEYJb76HDnm2ScZ1lTNpHTXLdL+neHtI?=
 =?us-ascii?Q?Ji3bCR2CfqpzscEHawycmWH/9PmzsnRHA6SPjdUVrZ8Vku7kmB64y38KhDXQ?=
 =?us-ascii?Q?i1NRVJbGmnR84FaZUuJfkV7qP+EAsPAVjgDtIjHOVWfOmMrwHlfBruxcFHPd?=
 =?us-ascii?Q?0LkiTWMnTnJr/FB1W3WMt+l+9H12/Ekv72teogWpBl002GI9ifqCtM1F3z50?=
 =?us-ascii?Q?HpeiutX8IQHvCW0vucmxe/2uNl9F27Q1/2+thAlT+QmC0zXL0dp3Z7mTnAwG?=
 =?us-ascii?Q?4Jntx1nAFsAettNIapLaabYuKaociPII0pRNHgbbeGHW7dguBjLejIBuMXvF?=
 =?us-ascii?Q?poav1Hkf+TxXZvo0vsaqtcdvxuwJB1lhcOoofRULxoBG4ErIgkZOczu2IAQt?=
 =?us-ascii?Q?04sXhrF48DH7e12RYEAVMBX1WleLnVPgH9C96+BOo46IWopejSQturygf4Y+?=
 =?us-ascii?Q?X3h/umWxyz/Sjb+DWp4oJ2/KAQq0aZKEcdIk601JGc8uHiupLIoBJNTnI4Xi?=
 =?us-ascii?Q?/JfCGyLWNrDVNcUnbBbrJDVP1W1SbhYRGvPTu2E0JMRJJqXxcDywQjpEY32d?=
 =?us-ascii?Q?gQ+6S9xDZBFH+GDWJ0koKyg8zRN7j83NslFLjFQ32DGo7c+3291OPsRXd8o0?=
 =?us-ascii?Q?GYO8GNY+JqT6kd76rpA+SuazHauuM8laMaf0cYICTZSSouwQgTq1mLMgBqDc?=
 =?us-ascii?Q?VArdz6zjrGusZ07mms/9GUplJ6tAOrIXk08A1b+VuigY2Ym1kNGkIig1zIfM?=
 =?us-ascii?Q?3I+DR3heFgbqNDyQD6U1FK0BzqhTWcicNb7fgLVCK/nlfx5ij46lFFVBDRq6?=
 =?us-ascii?Q?Ut/nUO2zS6OQYJNRYx8WeNgE1OlqHQbCqkiv2deVWAuyTb0af9VwFuFY2sCM?=
 =?us-ascii?Q?ecp5E2go0GQ4HKE/ByUnTOSWFW/akvNgQv+N+vqSa7i7z50XcywfO55YIf6R?=
 =?us-ascii?Q?EdyJXcHEjbV9imfl2Ug2MnLs/VKZBJRsRw6UTFy1R5sKJli223+3pJfedaof?=
 =?us-ascii?Q?6dGXyMST20+EPUv7X1vHZu6qAkLZukPVvMBjtleCLsBVE5y3PthkIrixAlQY?=
 =?us-ascii?Q?y3Fn2M/VgsEN8085zCvLw/iequAh24JjafdsnrGHRIN6UsQmOFym/KYKFpkb?=
 =?us-ascii?Q?CmsCZo0FEFnxeMri3kcvjCnhCxaHGFqsXQFrKdOyne4QaN9hx08Ql6jWBv5T?=
 =?us-ascii?Q?xVSyqYLU5MuDy809s/QOUL14nuSUTRlK+4iTmYh8ewvzuJulZ4RrGpnyNvHV?=
 =?us-ascii?Q?iAzb9ICyaFO/wORKFcbJ4kIiV4BoCdh7wtpBbaUloBwxiMK0wKrU?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af02a914-31e7-4962-bf3e-08da536781db
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 09:22:05.6588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A41kavaDwawePBFu+qZkF7nhtxBptvoc4DIT3uUP+ut2FMlo/3LbGiNWJMsahwsEaGFGqtn6PHRkTTAX150BxfAh3lanCalaULYBkNMYjro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR01MB2148
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
Cc: "Thang Q . Nguyen" <thang@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The Mt. Mitchell BMC is an ASPEED AST2600-based BMC for the Mt. Mitchell
hardware reference platform with AmpereOne(TM) processor.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
Signed-off-by: Phong Vo <phong@os.amperecomputing.com>
Signed-off-by: Thang Q. Nguyen <thang@os.amperecomputing.com>
---
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 579 ++++++++++++++++++
 2 files changed, 580 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 5112f493f494..93c236c14fa0 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1558,6 +1558,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-ast2600-evb.dtb \
 	aspeed-bmc-amd-ethanolx.dtb \
 	aspeed-bmc-ampere-mtjade.dtb \
+	aspeed-bmc-ampere-mtmitchell.dtb \
 	aspeed-bmc-arm-centriq2400-rep.dtb \
 	aspeed-bmc-arm-stardragon4800-rep2.dtb \
 	aspeed-bmc-asrock-e3c246d4i.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
new file mode 100644
index 000000000000..42425e13030a
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
@@ -0,0 +1,579 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2022 Ampere Computing LTC.
+
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	model = "Ampere Mt.Mitchell BMC";
+	compatible = "ampere,mtmitchell-bmc", "aspeed,ast2600";
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,115200n8 earlycon";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x80000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		gfx_memory: framebuffer {
+			size = <0x01000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+
+		video_engine_memory: video {
+			size = <0x04000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+
+		/* 1GB memory */
+		vga_memory: region@bf000000 {
+			no-map;
+			compatible = "shared-dma-pool";
+			reg = <0xbf000000 0x01000000>;  /* 16M */
+		};
+
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		S0_overtemp {
+			label = "S0_OVERTEMP";
+			gpios = <&gpio0 ASPEED_GPIO(V, 7) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(V, 7)>;
+		};
+
+		S0_hightemp {
+			label = "S0_HIGHTEMP";
+			gpios = <&gpio0 ASPEED_GPIO(V, 0) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(V, 0)>;
+		};
+
+		S1_overtemp {
+			label = "S1_OVERTEMP";
+			gpios = <&gpio0 ASPEED_GPIO(X, 6) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(X, 6)>;
+		};
+
+		S1_hightemp {
+			label = "S1_HIGHTEMP";
+			gpios = <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(X, 3)>;
+		};
+	};
+
+	ltc2497_reg: ltc2497_regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "ltc2497_reg";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	gpioI5mux: mux-controller {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		mux-gpios = <&gpio0 ASPEED_GPIO(I, 5) GPIO_ACTIVE_HIGH>;
+	};
+
+	adc0mux: adc0mux {
+		compatible = "io-channel-mux";
+		io-channels = <&adc0 0>;
+		#io-channel-cells = <1>;
+		io-channel-names = "parent";
+		mux-controls = <&gpioI5mux>;
+		channels = "s0", "s1";
+	};
+
+	adc1mux: adc1mux {
+		compatible = "io-channel-mux";
+		io-channels = <&adc0 1>;
+		#io-channel-cells = <1>;
+		io-channel-names = "parent";
+		mux-controls = <&gpioI5mux>;
+		channels = "s0", "s1";
+	};
+
+	adc2mux: adc2mux {
+		compatible = "io-channel-mux";
+		io-channels = <&adc0 2>;
+		#io-channel-cells = <1>;
+		io-channel-names = "parent";
+		mux-controls = <&gpioI5mux>;
+		channels = "s0", "s1";
+	};
+
+	adc3mux: adc3mux {
+		compatible = "io-channel-mux";
+		io-channels = <&adc0 3>;
+		#io-channel-cells = <1>;
+		io-channel-names = "parent";
+		mux-controls = <&gpioI5mux>;
+		channels = "s0", "s1";
+	};
+
+	adc4mux: adc4mux {
+		compatible = "io-channel-mux";
+		io-channels = <&adc0 4>;
+		#io-channel-cells = <1>;
+		io-channel-names = "parent";
+		mux-controls = <&gpioI5mux>;
+		channels = "s0", "s1";
+	};
+
+	adc5mux: adc5mux {
+		compatible = "io-channel-mux";
+		io-channels = <&adc0 5>;
+		#io-channel-cells = <1>;
+		io-channel-names = "parent";
+		mux-controls = <&gpioI5mux>;
+		channels = "s0", "s1";
+	};
+
+	adc6mux: adc6mux {
+		compatible = "io-channel-mux";
+		io-channels = <&adc0 6>;
+		#io-channel-cells = <1>;
+		io-channel-names = "parent";
+		mux-controls = <&gpioI5mux>;
+		channels = "s0", "s1";
+	};
+
+	adc7mux: adc7mux {
+		compatible = "io-channel-mux";
+		io-channels = <&adc0 7>;
+		#io-channel-cells = <1>;
+		io-channel-names = "parent";
+		mux-controls = <&gpioI5mux>;
+		channels = "s0", "s1";
+	};
+
+	adc8mux: adc8mux {
+		compatible = "io-channel-mux";
+		io-channels = <&adc1 0>;
+		#io-channel-cells = <1>;
+		io-channel-names = "parent";
+		mux-controls = <&gpioI5mux>;
+		channels = "s0", "s1";
+	};
+
+	adc9mux: adc9mux {
+		compatible = "io-channel-mux";
+		io-channels = <&adc1 1>;
+		#io-channel-cells = <1>;
+		io-channel-names = "parent";
+		mux-controls = <&gpioI5mux>;
+		channels = "s0", "s1";
+	};
+
+	adc10mux: adc10mux {
+		compatible = "io-channel-mux";
+		io-channels = <&adc1 2>;
+		#io-channel-cells = <1>;
+		io-channel-names = "parent";
+		mux-controls = <&gpioI5mux>;
+		channels = "s0", "s1";
+	};
+
+	adc11mux: adc11mux {
+		compatible = "io-channel-mux";
+		io-channels = <&adc1 3>;
+		#io-channel-cells = <1>;
+		io-channel-names = "parent";
+		mux-controls = <&gpioI5mux>;
+		channels = "s0", "s1";
+	};
+
+	adc12mux: adc12mux {
+		compatible = "io-channel-mux";
+		io-channels = <&adc1 4>;
+		#io-channel-cells = <1>;
+		io-channel-names = "parent";
+		mux-controls = <&gpioI5mux>;
+		channels = "s0", "s1";
+	};
+
+	adc13mux: adc13mux {
+		compatible = "io-channel-mux";
+		io-channels = <&adc1 5>;
+		#io-channel-cells = <1>;
+		io-channel-names = "parent";
+		mux-controls = <&gpioI5mux>;
+		channels = "s0", "s1";
+	};
+
+	adc14mux: adc14mux {
+		compatible = "io-channel-mux";
+		io-channels = <&adc1 6>;
+		#io-channel-cells = <1>;
+		io-channel-names = "parent";
+		mux-controls = <&gpioI5mux>;
+		channels = "s0", "s1";
+	};
+
+	adc15mux: adc15mux {
+		compatible = "io-channel-mux";
+		io-channels = <&adc1 7>;
+		#io-channel-cells = <1>;
+		io-channel-names = "parent";
+		mux-controls = <&gpioI5mux>;
+		channels = "s0", "s1";
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc0mux 0>, <&adc0mux 1>,
+			<&adc1mux 0>, <&adc1mux 1>,
+			<&adc2mux 0>, <&adc2mux 1>,
+			<&adc3mux 0>, <&adc3mux 1>,
+			<&adc4mux 0>, <&adc4mux 1>,
+			<&adc5mux 0>, <&adc5mux 1>,
+			<&adc6mux 0>, <&adc6mux 1>,
+			<&adc7mux 0>, <&adc7mux 1>,
+			<&adc8mux 0>, <&adc8mux 1>,
+			<&adc9mux 0>, <&adc9mux 1>,
+			<&adc10mux 0>, <&adc10mux 1>,
+			<&adc11mux 0>, <&adc11mux 1>,
+			<&adc12mux 0>, <&adc12mux 1>,
+			<&adc13mux 0>, <&adc13mux 1>,
+			<&adc14mux 0>, <&adc14mux 1>,
+			<&adc15mux 0>, <&adc15mux 1>,
+			<&ltc2497 0>, <&ltc2497 1>,
+			<&ltc2497 2>, <&ltc2497 3>,
+			<&ltc2497 4>, <&ltc2497 5>,
+			<&ltc2497 6>, <&ltc2497 7>,
+			<&ltc2497 8>, <&ltc2497 9>,
+			<&ltc2497 10>, <&ltc2497 11>,
+			<&ltc2497 12>, <&ltc2497 13>,
+			<&ltc2497 14>, <&ltc2497 15>;
+	};
+};
+
+&mdio0 {
+	status = "okay";
+
+	ethphy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&mac0 {
+	status = "okay";
+
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy0>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1_default>;
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+		spi-max-frequency = <50000000>;
+#include "openbmc-flash-layout-64.dtsi"
+	};
+
+	flash@1 {
+		status = "okay";
+		m25p,fast-read;
+		label = "alt-bmc";
+		spi-max-frequency = <50000000>;
+#include "openbmc-flash-layout-64-alt.dtsi"
+	};
+};
+
+&spi1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
+
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "pnor";
+		spi-max-frequency = <20000000>;
+	};
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
+&uart3 {
+	status = "okay";
+};
+
+&uart4 {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+
+	temp@2e {
+		compatible = "adi,adt7490";
+		reg = <0x2e>;
+	};
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+
+	psu@58 {
+		compatible = "pmbus";
+		reg = <0x58>;
+	};
+
+	psu@59 {
+		compatible = "pmbus";
+		reg = <0x59>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+
+	ltc2497: ltc2497@16 {
+		compatible = "lltc,ltc2497";
+		reg = <0x16>;
+		vref-supply = <&ltc2497_reg>;
+		#io-channel-cells = <1>;
+		status = "okay";
+	 };
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+		pagesize = <32>;
+	};
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9545";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
+		i2c-mux-idle-disconnect;
+
+		i2c4_bus70_chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0>;
+
+			outlet_temp1: tmp75@48 {
+				compatible = "ti,tmp75";
+				reg = <0x48>;
+			};
+			psu1_inlet_temp2: tmp75@49 {
+				compatible = "ti,tmp75";
+				reg = <0x49>;
+			};
+		};
+
+		i2c4_bus70_chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x1>;
+
+			pcie_zone_temp1: tmp75@48 {
+				compatible = "ti,tmp75";
+				reg = <0x48>;
+			};
+			psu0_inlet_temp2: tmp75@49 {
+				compatible = "ti,tmp75";
+				reg = <0x49>;
+			};
+		};
+
+		i2c4_bus70_chn2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x2>;
+
+			pcie_zone_temp2: tmp75@48 {
+				compatible = "ti,tmp75";
+				reg = <0x48>;
+			};
+			outlet_temp2: tmp75@49 {
+				compatible = "ti,tmp75";
+				reg = <0x49>;
+			};
+		};
+
+		i2c4_bus70_chn3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x3>;
+
+			mb_inlet_temp1: tmp75@7c {
+				compatible = "microchip,emc1413";
+				reg = <0x7c>;
+			};
+			mb_inlet_temp2: tmp75@4c {
+				compatible = "microchip,emc1413";
+				reg = <0x4c>;
+			};
+		};
+	};
+};
+
+&i2c5 {
+	status = "okay";
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
+		i2c-mux-idle-disconnect;
+	};
+};
+
+&i2c6 {
+	status = "okay";
+	rtc@51 {
+		compatible = "nxp,pcf85063a";
+		reg = <0x51>;
+	};
+};
+
+&i2c7 {
+	status = "okay";
+};
+
+&i2c9 {
+	status = "okay";
+};
+
+&i2c11 {
+	status = "okay";
+};
+
+&i2c14 {
+	status = "okay";
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+		pagesize = <32>;
+	};
+
+	bmc_ast2600_cpu: tmp175@35 {
+		compatible = "ti,tmp175";
+		reg = <0x35>;
+	};
+};
+
+&adc0 {
+	ref_voltage = <2500>;
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
+		&pinctrl_adc2_default &pinctrl_adc3_default
+		&pinctrl_adc4_default &pinctrl_adc5_default
+		&pinctrl_adc6_default &pinctrl_adc7_default>;
+};
+
+&adc1 {
+	ref_voltage = <2500>;
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
+		&pinctrl_adc10_default &pinctrl_adc11_default
+		&pinctrl_adc12_default &pinctrl_adc13_default
+		&pinctrl_adc14_default &pinctrl_adc15_default>;
+};
+
+&vhub {
+	status = "okay";
+};
+
+&video {
+	status = "okay";
+	memory-region = <&video_engine_memory>;
+};
+
+&gpio0 {
+	gpio-line-names =
+	/*A0-A7*/	"","","","","","i2c2-reset-n","i2c6-reset-n","i2c4-reset-n",
+	/*B0-B7*/	"","","","","host0-sysreset-n","host0-pmin-n","","",
+	/*C0-C7*/	"s0-vrd-fault-n","s1-vrd-fault-n","bmc-debug-mode","",
+			"irq-n","","vrd-sel","spd-sel",
+	/*D0-D7*/	"presence-ps0","presence-ps1","hsc-12vmain-alt2-n","ext-high-temp-n",
+			"","bmc-ncsi-txen","","",
+	/*E0-E7*/	"eth-phy-rst-n","eth-phy-int-n","clk50m-bmc-ncsi","","","","","",
+	/*F0-F7*/	"s0-pcp-oc-warn-n","s1-pcp-oc-warn-n","power-chassis-control",
+			"cpu-bios-recover","cpld-done","hs-scout-proc-hot",
+			"s0-vr-hot-n","s1-vr-hot-n",
+	/*G0-G7*/	"","","hsc-12vmain-alt1-n","bmc-salt12-s0-ssif-n","","","","",
+	/*H0-H7*/	"","fpga-program-b","wd-disable-n","power-chassis-good","","","","",
+	/*I0-I7*/	"","","","","","adc-sw","power-button","rtc-battery-voltage-read-enable",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"bmc-uart-cts1","s0-ddr-save","soc-spi-nor-access","presence-cpu0",
+			"s0-rtc-lock","","","",
+	/*N0-N7*/	"hpm-fw-recovery","hpm-stby-rst-n","jtag-sel-s0","led-sw-hb",
+			"jtag-dbgr-prsnt-n","","","",
+	/*O0-O7*/	"","","","","","","","",
+	/*P0-P7*/	"ps0-ac-loss-n","ps1-ac-loss-n","","",
+			"led-fault","cpld-user-mode","jtag-srst-n","led-bmc-hb",
+	/*Q0-Q7*/	"","","","","","","","",
+	/*R0-R7*/	"","","","","","","","",
+	/*S0-S7*/	"","","identify-button","led-identify",
+			"s1-ddr-save","spi-nor-access","sys-pgood","presence-cpu1",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"s0-hightemp-n","s0-fault-alert","s0-sys-auth-failure-n",
+			"host0-reboot-ack-n","host0-ready","host0-shd-req-n",
+			"host0-shd-ack-n","s0-overtemp-n",
+	/*W0-W7*/	"ocp-aux-pwren","ocp-main-pwren","ocp-pgood","",
+			"bmc-ok","bmc-ready","spi0-program-sel","spi0-backup-sel",
+	/*X0-X7*/	"i2c-backup-sel","s1-fault-alert","s1-fw-boot-ok",
+			"s1-hightemp-n","s0-spi-auth-fail-n","s1-sys-auth-failure-n",
+			"s1-overtemp-n","cpld-s1-spi-auth-fail-n",
+	/*Y0-Y7*/	"","","","","","","bmc-spi-fm-boot-abr-pd","host0-special-boot",
+	/*Z0-Z7*/	"reset-button","ps0-pgood","ps1-pgood","","","","","";
+};
+
+&gpio1 {
+	gpio-line-names =
+	/*18A0-18A7*/	"","","","","","","","",
+	/*18B0-18B7*/	"","","","","emmc-rst-n","","s0-soc-pgood","",
+	/*18C0-18C7*/	"uart1-mode0","uart1-mode1","uart2-mode0","uart2-mode1",
+			"uart3-mode0","uart3-mode1","uart4-mode0","uart4-mode1",
+	/*18D0-18D7*/	"","","","","","","","",
+	/*18E0-18E3*/	"","","","";
+};
+
-- 
2.35.1

