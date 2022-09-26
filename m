Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 786B45E9B76
	for <lists+openbmc@lfdr.de>; Mon, 26 Sep 2022 10:02:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbZwq3Ggdz3dqX
	for <lists+openbmc@lfdr.de>; Mon, 26 Sep 2022 18:02:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Wce4JpcI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.244.104; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Wce4JpcI;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2104.outbound.protection.outlook.com [40.107.244.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbZsk4vYwz3cBj;
	Mon, 26 Sep 2022 17:59:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaKwfFwRzq4izrLZUFaq4lL+5oMSSsZZQmv6997Wk7KhCjJ/e67MEd7hr/No08+U7QKehbShyJUyEi2q7Ks43OuGD+/ez10NJz4PgSvLy0xsp2N6MIfkA04CvGV6S2/rAylATF/FZu0PXKiFkkbKfKXkda2Lc2iHDyAnTSiL4aRBkjuVO+AxrBnnvCc+QWsfGliOPbCfXaigKYO8+Lu+xEs3PEY9uoElhON7yJM1/qow3Ko++LsPibxINFxnopdcQggkQr4SJIbkOhWAJVL8p2y86jOywIKkypNSa0BVz2/yOyU93zzXXShEfWtJHeB8fYlkXbXUWIfFGlVD9Mrxnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJLusmva63MYobsBjxoj5F+iAjwckHbXc/a/XyoCJlg=;
 b=Hq7vIo3I69MMKQ2M7rt6uo3z9EBz1X/kg03pgFSkFheWsRANVtD/YO8xkO77V1t0lkxSRwgwIxlVVHbj2HIEbYftFpFAshEYurkBkjAqMXsyjqTKtv0q/U91+o8A9wdsMHoyYbd/r99a07HLDnQzfUSFPNXnmBa8wn2V2qw5GtPNTHhgakBx/4rXEOtGbhNGWKKLcWKDNf74CHOiUQtQb+XMg8c9FQgBpEMi+KwCQe9RJS9vzMGiABkm+o2BBACIz4vpbc458LnUPctELN55ItlOvFaXiWA35Pfz8QBYh37LZ3QoKTWbPAGxDshr483AZLoVu5cX3lgFUxZi6CqPoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJLusmva63MYobsBjxoj5F+iAjwckHbXc/a/XyoCJlg=;
 b=Wce4JpcIqf1Zzp6pqvoANRFP7egd7enQ5ZRROqfU99QjPkKeon/tx4iwyJPz0nyCGqZll4xG86/G02AdWnu1eJMXUJ88zJzkp7QCX4QEDUu3bi6u+oVoAbm39ZTO/IkK7ZzzQ8PoOVZLdibVXH4KSdxGw6xwiFgrtvR0fUbzZwo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BL0PR01MB5235.prod.exchangelabs.com (2603:10b6:208:31::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.20; Mon, 26 Sep 2022 07:59:25 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 07:59:25 +0000
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
Subject: [PATCH v3 RESEND 2/2] ARM: dts: aspeed: Add device tree for Ampere's Mt. Mitchell BMC
Date: Mon, 26 Sep 2022 14:58:48 +0700
Message-Id: <20220926075848.206918-3-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220926075848.206918-1-quan@os.amperecomputing.com>
References: <20220926075848.206918-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::29)
 To SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|BL0PR01MB5235:EE_
X-MS-Office365-Filtering-Correlation-Id: 13c91e00-b28c-458e-2e85-08da9f95077a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	gqbG+RqtUN015IJcLLLwx3LlLl19I/9LxyoulsK98edYbCAKpAaAkA0q08W6JBhj1BV/BFCvEg2s88mJbHX4TpbWI/w02Kgic4oqiL0E6oXuiNt2jMHPSALLSCRxsecQHzT9g6lQomgu2oTAVlgPAl/06MegJ56qFKMIFKko5hfQ9CCn26WMWeXE4BfS0h85FduAnjBZqBeu3qu058lkhPDRnPSa21yvdMKBYZJe41+3Yn4LRGtmaVYLAyGcb/G8sKQIDYfYrx89jzCHt4QNtLaUlrHfv04O43nAmTWH+I/X28nLlpUt+EsOjpxLGZH1wW+jEZ1HE6JVeevlwLABwWX+rnOuVHjy0zrtemrL1o2qMgAiodQLNnCzjFyltc77TMOp+8uK76hlylulrw0dGvXXU0Clw+MehbCSrbzSQeZ4T+2EYr/lllKXNVldqvJbI2lOCEllzCAF/aL6/0acrdL4e6qCVy+0CI53AL/YgcxKVMUdTCLiTw7CRUgqAEORPN4iWqolhonMqqf+Rls29PysoUyyYngYy9dxduPQMefImoRbS2qNkp9Oy2cB9nZM34yh6iBVZmdiShublwn26sKhooZmJnxGIov7XRodsrvzc04Mb7sfYk3/PFPcraq3wOwe+9PvDPfTTgWCScvT6idM1rmRHY0bD6KR5pzcttfh9e8b+Nx6eWeBr6bkybfCO1RkoaB+2c6NJRrzixYzaN+9hqWUKOO4OdMW9MDvHYpAx1iX5Ei5vhBOAe5bPBIVhO1Dbk1ZR3oyQ525h4uT2q0TyjE0tLTAdeOn29c5cv+HrcIjH8E07W26+RZZ3Sm7hcrWU/EvOrdFN4O0ymoDyK/hptFKs3pKsnuMerYrZ/4=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39840400004)(376002)(396003)(366004)(136003)(451199015)(7416002)(30864003)(26005)(6512007)(5660300002)(6506007)(8936002)(52116002)(41300700001)(107886003)(6666004)(38350700002)(83380400001)(2616005)(1076003)(186003)(2906002)(66574015)(921005)(54906003)(110136005)(38100700002)(86362001)(4326008)(66946007)(8676002)(6486002)(316002)(66556008)(478600001)(66476007)(449214003)(473944003)(414714003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?eZSsmNIlaAa1Wy65oU2fEzmunoqy3F9H9jc6rHr448dD1/DK0SYUC44rK5YO?=
 =?us-ascii?Q?tjkFzl//2tZXEaYSZTCSr4OUUU54npPqknZrhdqbUu87r0/AW5xFyQMXXTcF?=
 =?us-ascii?Q?w7VhG7sgX9B2ewxDbfg0TT927FnOCRUV0TA9xg7NHsI6iF3f6P53NlZjIHPm?=
 =?us-ascii?Q?nR1EkuM1Pwg1zIp/SFJPXerc9ZE0PKlLfooNFrUJnlKmuHh5fX8OTOw7/2rO?=
 =?us-ascii?Q?k/vCLl4uLktaFTzwYX3Rt/LSKvhKFiLBMJ8uyT2S/ctV+wpxkgbvnV14C9Fe?=
 =?us-ascii?Q?FtHMnrTzAcrRMAdpjNB2Y55sa5vikIkyquxcoDjV5ySGt72HMa16voOkn0Un?=
 =?us-ascii?Q?cwPlYeI7Y2p6Iw364F6KAFChO+N9WkwAuOKsD5ZzJcukCPmKcCN1YIEyaaa/?=
 =?us-ascii?Q?3r7lWJ9QIoTucWYEerrB+7QKP+xMrDbJC1QCjNlsG8VYrGubPF04X4p88VH5?=
 =?us-ascii?Q?w7bquMiMOGXqEFkQ6ykqsuvSSoL+npIYfitSZtUdRSs1NwGteRixRwgGaZ9S?=
 =?us-ascii?Q?vIHXGiuEk2kZmCX1OpO/1a08WRtUz0RE0OBnPnDIn3GYF2MNVdbrGx1ApuIC?=
 =?us-ascii?Q?08mon4YW4Apce4D2+IC6Qd2i1Vc4jUeX3NqtbGcuVDYZnIaeYh3MpaPNYQgA?=
 =?us-ascii?Q?TbQXlnRA0CNAuH4KkSF7dQDpFeY5p89zQN0STrMkTPje0JMZZlVokZas4mwT?=
 =?us-ascii?Q?QjrTDzTjfdcV7AIbUYueRmo7pDnK9/j8h7QeYvIHPH5VrbkIrs2v52H/plEa?=
 =?us-ascii?Q?IB64OlGPnFWZqvdqp4iXDTx0+38qgg8lr2+TLAVQUI7S0mluQwdQjPgq9Jfw?=
 =?us-ascii?Q?XHAPTvRbLR8hXr4Sq9HeROUYHmIZlx27UbLVKI0ejPOTTvTdYN17FV6CVhBe?=
 =?us-ascii?Q?0CY2TMeAiQw6cQzu+IeB+6jvT+PBiJemNgYKh7kQmrmt3lE4i/QausGmx6R8?=
 =?us-ascii?Q?OwGlPPZvCTRGLLU8mmDVKx9dHfrAcIDfwP7QmDLU3Bw6cf97Ess/HiyBL00N?=
 =?us-ascii?Q?2USBqCzMWLVKX6u1DA/OiQpiHWhVEInq/dxXBME/7iWCCFzt4nJvZoFcM+7/?=
 =?us-ascii?Q?6sY/ECr+Bkxh5UBIA0Chl37DZwCGG4t2YUebTTuv8JDr8LJLDlx5k3bAaVsR?=
 =?us-ascii?Q?KHy/GCgY8SmwtinDTfrwqMzgPcol6rkc0a3qi6kzV/qNEVTHMmrlYhQx4Yzw?=
 =?us-ascii?Q?PuF8tcPZt19Hzvioi6I00sWhsyknlVYzpHaUedViXmYOcFCBZEYMV/49GFqU?=
 =?us-ascii?Q?qJ02WlIp5SuPfMpJ4Zd1QubzJHHDi+rjeUgO7RXRuXwyLtbnpL5VqQaEGlT3?=
 =?us-ascii?Q?D1FsrBdReB6Xkhdyz5/SouQTMOQa8JRtmfBt1oi7wU3nUAYs1oeh9M7DkFrm?=
 =?us-ascii?Q?HZ6wkP71n+K6YvOsB5GukTZ/KN9ts+zBbl5JcnRoKW7gKJIJqTKaOAgr2GlL?=
 =?us-ascii?Q?Jd1C77wKKI++nmlVhQFIr4lsSWXcpVWU4QAoKO0iSXz6MimASu1pKEGNrdyv?=
 =?us-ascii?Q?lmClzTXNAV2zHxyrUNefJYvsSW046JustcFVDD6BxKkIw6Vmu2HxlrdKlShP?=
 =?us-ascii?Q?i6dyg40pMBGBxaO39TMwaMcYIQkkcGGkun9+y6Hc5q4HDY5Q1GyoNYgzJAJW?=
 =?us-ascii?Q?6ZjJWMVVOlxIDrk04k7ZNc4=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13c91e00-b28c-458e-2e85-08da9f95077a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 07:59:25.5268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RejMmvzEEzyCZ+Pr7nsr1hSdi+4QkgupKV5PwRaqG1Bppa1fmzFGhQj+hXdlTNtG56CRzHDuEID8QYXJDuv4Rgpd0D0bWtY51ZWq3IlPRgA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB5235
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
Cc: thang@os.amperecomputing.com, Quan Nguyen <quan@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The Mt. Mitchell BMC is an ASPEED AST2600-based BMC for the Mt. Mitchell
hardware reference platform with AmpereOne(TM) processor.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
Signed-off-by: Phong Vo <phong@os.amperecomputing.com>
Signed-off-by: Thang Q. Nguyen <thang@os.amperecomputing.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
v3 :
  + Fix adc-i2c node to generic "adc" node                [Krzysztof]
  + Remove unused status property in adc node             [Krzysztof]
  + Remove trailing blank line at the end of file         [Krzysztof]
  + Remove the wrong comment on vga_memory nodes             [Andrew]
  + Remove gpio-keys                                         [Andrew]
  + Remove the line-name for bmc-debug-mode, eth-phy-rst-n,
    eth-phy-int-n, bmc-salt12-s0-ssif-n, fpga-program-b,
    bmc-uart-cts1, bmc-spi-fm-boot-abr-pd, emmc-rst-n gpios  [Andrew]
  + Update line-name for hs-csout-prochot, s1-spi-auth-fail-n  [Quan]
  + Add line-name [s0|s1]-heartbeat                            [Quan]

v2 :
  + Remove bootargs                                       [Krzysztof]
  + Fix gpio-keys nodes name to conform with device tree binding
  documents                                               [Krzysztof]
  + Fix some nodes to use generic name                    [Krzysztof]
  + Remove unnecessary blank line                         [Krzysztof]
  + Fix typo "LTC" to "LLC" in license info and corrected license
  info to GPL-2.0-only

 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 546 ++++++++++++++++++
 2 files changed, 547 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 1a718157d1a6..177fc02e5c6e 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1582,6 +1582,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-ast2600-evb.dtb \
 	aspeed-bmc-amd-ethanolx.dtb \
 	aspeed-bmc-ampere-mtjade.dtb \
+	aspeed-bmc-ampere-mtmitchell.dtb \
 	aspeed-bmc-arm-stardragon4800-rep2.dtb \
 	aspeed-bmc-asrock-e3c246d4i.dtb \
 	aspeed-bmc-asrock-romed8hm3.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
new file mode 100644
index 000000000000..606cd4be245a
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
@@ -0,0 +1,546 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2022, Ampere Computing LLC
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
+		vga_memory: region@bf000000 {
+			no-map;
+			compatible = "shared-dma-pool";
+			reg = <0xbf000000 0x01000000>;  /* 16M */
+		};
+	};
+
+	voltage_mon_reg: voltage-mon-regulator {
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
+			<&adc_i2c 0>, <&adc_i2c 1>,
+			<&adc_i2c 2>, <&adc_i2c 3>,
+			<&adc_i2c 4>, <&adc_i2c 5>,
+			<&adc_i2c 6>, <&adc_i2c 7>,
+			<&adc_i2c 8>, <&adc_i2c 9>,
+			<&adc_i2c 10>, <&adc_i2c 11>,
+			<&adc_i2c 12>, <&adc_i2c 13>,
+			<&adc_i2c 14>, <&adc_i2c 15>;
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
+	temperature-sensor@2e {
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
+	adc_i2c: adc@16 {
+		compatible = "lltc,ltc2497";
+		reg = <0x16>;
+		vref-supply = <&voltage_mon_reg>;
+		#io-channel-cells = <1>;
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
+			outlet_temp1: temperature-sensor@48 {
+				compatible = "ti,tmp75";
+				reg = <0x48>;
+			};
+			psu1_inlet_temp2: temperature-sensor@49 {
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
+			pcie_zone_temp1: temperature-sensor@48 {
+				compatible = "ti,tmp75";
+				reg = <0x48>;
+			};
+			psu0_inlet_temp2: temperature-sensor@49 {
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
+			pcie_zone_temp2: temperature-sensor@48 {
+				compatible = "ti,tmp75";
+				reg = <0x48>;
+			};
+			outlet_temp2: temperature-sensor@49 {
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
+			mb_inlet_temp1: temperature-sensor@7c {
+				compatible = "microchip,emc1413";
+				reg = <0x7c>;
+			};
+			mb_inlet_temp2: temperature-sensor@4c {
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
+	bmc_ast2600_cpu: temperature-sensor@35 {
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
+	/*C0-C7*/	"s0-vrd-fault-n","s1-vrd-fault-n","","",
+			"irq-n","","vrd-sel","spd-sel",
+	/*D0-D7*/	"presence-ps0","presence-ps1","hsc-12vmain-alt2-n","ext-high-temp-n",
+			"","bmc-ncsi-txen","","",
+	/*E0-E7*/	"","","clk50m-bmc-ncsi","","","","","",
+	/*F0-F7*/	"s0-pcp-oc-warn-n","s1-pcp-oc-warn-n","power-chassis-control",
+			"cpu-bios-recover","s0-heartbeat","hs-csout-prochot",
+			"s0-vr-hot-n","s1-vr-hot-n",
+	/*G0-G7*/	"","","hsc-12vmain-alt1-n","","","","","",
+	/*H0-H7*/	"","","wd-disable-n","power-chassis-good","","","","",
+	/*I0-I7*/	"","","","","","adc-sw","power-button","rtc-battery-voltage-read-enable",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","s0-ddr-save","soc-spi-nor-access","presence-cpu0",
+			"s0-rtc-lock","","","",
+	/*N0-N7*/	"hpm-fw-recovery","hpm-stby-rst-n","jtag-sel-s0","led-sw-hb",
+			"jtag-dbgr-prsnt-n","s1-heartbeat","","",
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
+			"s1-overtemp-n","s1-spi-auth-fail-n",
+	/*Y0-Y7*/	"","","","","","","","host0-special-boot",
+	/*Z0-Z7*/	"reset-button","ps0-pgood","ps1-pgood","","","","","";
+};
+
+&gpio1 {
+	gpio-line-names =
+	/*18A0-18A7*/	"","","","","","","","",
+	/*18B0-18B7*/	"","","","","","","s0-soc-pgood","",
+	/*18C0-18C7*/	"uart1-mode0","uart1-mode1","uart2-mode0","uart2-mode1",
+			"uart3-mode0","uart3-mode1","uart4-mode0","uart4-mode1",
+	/*18D0-18D7*/	"","","","","","","","",
+	/*18E0-18E3*/	"","","","";
+};
-- 
2.35.1

