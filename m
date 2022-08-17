Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AD8596A42
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 09:19:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6ztC5Yw7z3c6V
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 17:19:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=vS+94ZYV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.93.135; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=vS+94ZYV;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2135.outbound.protection.outlook.com [40.107.93.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6zqX1MV0z3cDD;
	Wed, 17 Aug 2022 17:17:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aIRof1EsfqCIR+zeKTilBW8qx/wW/u6QBgPQwrjN2wpV/xCeW93HszfoB5IBKpMWYKub0JYUvoMAC1bafMMbJJb+geIAN94GRLfGN04ZPN3eJO0QMwgg/BykxoUh9H1DER7q5s3VW7V3jz1Gu5SM7AHjByBcNy4vZ9fLVduEXpoWRFTlC6C6d972JvgU0Fl48e618gKItOwejTxGP+pPAnxcBfFPGsmIA/ifdkcl58/d7lSUX3/v/XBEG0mSob5ar3yn1tMhhPEzNKBw4TrgR0cLLOQXE96tG5rhIIdFmI3xSVbxQsJD3gySXFc28cFEU/fP8+b3QeveixfcgkMbFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DFfNv7CK4h4imDYtQBV9NqjH5oBQ6j9VbpKvOeLE6o=;
 b=a01U71ntsaa2qgmJyDZgohHGh5pfNCqom5zeDwMtz7NnilqEWTrbFkcp2Pc8AOvMFo5KAGvA2srqToDtK37n5tons3ABbXEQiJ7GSD+9ZDR0G5vfyAU7GRe/djue4AYir5uinNKbEXsJ/SrgX1NJJWZSBbixo9auKWqIYr095t/x5rIpvDB9vldnb3cxuO8aizGp3Bn3fu2T2AM5Jfsdk0yfmQzM0Dmk6fhzCPevguLodTf/2+pZSWrqfL+9mIyxbUWqiy35ixqJlcaDflDN3MCjNfnE0tgAWKOGbCTv7E+XKDSXY5G6B6g7MTu1/MIxW38k3efyk/MDm/Moo7EaUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DFfNv7CK4h4imDYtQBV9NqjH5oBQ6j9VbpKvOeLE6o=;
 b=vS+94ZYV+uffAlN5tods3ATSyu0d7etMPFdsHQofBtZc18Swx315ln8ZnG0lH5EfCuIMQBQq2Nj2S5ETnY4u8w86I9FgpJRgUYIF20Nn6rIu1Vw9hmTcc90ovv25x/wSg7e9FW+Oo3Qo+f2y184WotRDHPD9C5fKWoAxQHsn/SE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BL0PR01MB5300.prod.exchangelabs.com (2603:10b6:208:78::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.17; Wed, 17 Aug 2022 07:17:19 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::2c79:3341:5ae5:7d26]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::2c79:3341:5ae5:7d26%9]) with mapi id 15.20.5525.010; Wed, 17 Aug 2022
 07:17:19 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Quan Nguyen <quan@os.amperecomputing.com>,
	openbmc@lists.ozlabs.org,
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
Subject: [PATCH v3 2/2] ARM: dts: aspeed: Add device tree for Ampere's Mt. Mitchell BMC
Date: Wed, 17 Aug 2022 14:15:39 +0700
Message-Id: <20220817071539.176110-3-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220817071539.176110-1-quan@os.amperecomputing.com>
References: <20220817071539.176110-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0044.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::8) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32552972-13ae-4f39-3d32-08da80208560
X-MS-TrafficTypeDiagnostic: BL0PR01MB5300:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	IcPTZlHwuAdyuSkg3eOw4C6V8t4dczCFDel1Ezi8rwDVlfUcJ+VhF66qGCravFMfll6xhVPlGXNNl1xd3Bjjx5TlHFMkdUvYFipRgEpG/QT8w/5wT2j281hHs7UoNLgzlr0mmoaaIU8DwuKZF2m4a50sTSoWIl92YmlNRoeMJuw0L4cQvQXPpnSfm58R6ovStxEGbM+NIcH3LktLy0GNXPsmmklMMSPpZROtlpGD0/u1POF2yDgr98ZWnpWJ9tICxB4wBWE5F4hbTedFCDGG36os8WCbFHV79ZqlxB8IleN0cLqCQ4D2h6DKR8WfS+ToWRL1enpXgcdKDW7Vx7qhnQ1kSXMJMoApklWfYlvMXHJVUHP8qNEhbpsIv6UjZKt8WtLeuE2/mzQJmelCTP0mRbL7Vw80/oJ6bqExzZUj3FxxTJUMiW3UZxv/AKOSBgEbMpcz181f5az8COMQmBjvhhCFubqvKtb2Ei9NryCCxdqxIud7fJSS5nZD++6CITHr9vTQfpABe1yWqE9EZiwkre+/RAOkUV2s6F8sozbcWxqSs/w3ezXVVbmMDXvLJwWmWvljtedE2Vrw4AwQIq/UaA5+UVSXvwqVIWRojqIu7mGquHSXyzmulkWXzxLslb27tcXSNcmJ+N+FfotdUVoJNQM8Tmc10yE13dmcokmNdqSl/9OSfoIJCRVKbILsz/8/W6spbTUAmlVdCZ6a5m5KT/g+0oRBgHS6ssax9dfvqBguK+a29r7Gpy6vskByI1XMH/eSAYAwQEb774biYUldhfM4kp2EIIf91GoP3gxQN7/cgXzcdLqjKSlFXwUBx9zd2VPd0yLtbuDCus2rWlrRdFVmf0DEnZVrwAGNiCb9nlcXiGvrP9+jdc0Dbo5Yyb9u6zNZVgZDndC07dCspGWGUA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(39850400004)(396003)(366004)(6666004)(52116002)(6506007)(6512007)(26005)(110136005)(86362001)(316002)(41300700001)(6486002)(38350700002)(38100700002)(478600001)(186003)(921005)(107886003)(83380400001)(66574015)(8936002)(4326008)(5660300002)(7416002)(2616005)(30864003)(66946007)(66476007)(66556008)(8676002)(2906002)(1076003)(449214003)(414714003)(473944003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?1LZQ2mwFMsSAdTCRiTnFdDuo8Wqmn/XMD2AAblVFiQMnqWrnBzbUf8sfHpS/?=
 =?us-ascii?Q?kINft2QSkPhwqcBfP/uQRz4gACIiVEFVqtebQqY/x/QnFOSTd/CrY45mLR8R?=
 =?us-ascii?Q?gk3CZjANE7+nxnMjuTF8iHhJ9PqldCS5aaZVDjzgRpimsqYk4tBYAGj8vm1M?=
 =?us-ascii?Q?JQeOy2RAMl2xk2IdL6UwsFryGMUf8vaaHmazg4UNA6xNhtAE1nWqs96iAJzP?=
 =?us-ascii?Q?NdFlfF/OeOEEhoHaJJi9cpfwf83taADHcQp+maD7GL3PTEcSq42/ZcfLH1ZF?=
 =?us-ascii?Q?74awGho9SoV+7DJcL704byVt672RraiTcXCq67HCV6VG1q/eKN+fJItxapqQ?=
 =?us-ascii?Q?tlcL/M2MMCUsZZA729aHbUB8lFNNE7Kt5AL5bimxIp/RyYxabyNt6mewOo1V?=
 =?us-ascii?Q?ha8vFqvVry3HNDKfYrn8aAeDePjctnm2GFBJQJJfjp6WjQxlvZH/t7hR5msq?=
 =?us-ascii?Q?01DgKWzkuZF4DzSFpTEIhni1iG/S6M+w9HpfKenoxrBNfQ1lIVgvbPV8Li49?=
 =?us-ascii?Q?cgxdP2mj4zAz0Rt9fcb6tp5iu5GTtjkpYJJCMJOJKwxYBNszA3az7IF/Qthc?=
 =?us-ascii?Q?bk+/A8lVx5V45FBWP9XX+d8YJCpNCumEzLQlAOMzCN0+oZBvfeU7IHkUYHUt?=
 =?us-ascii?Q?eLQE+OxrD5fQIgk0vLzRXJOlGMuHtMonYE9ivW+nvUFZTqOSt0uPHRPxB4Mp?=
 =?us-ascii?Q?yin+oQT/xgXaKATUBBYZdQ18wQ2Vrt/vMboZJ3X3a8tGWjFLtcpneM8VFRqj?=
 =?us-ascii?Q?1GbToZI+18sut0TOok2790DVNYhDfB5uyTfCTJAg0iuGewRv9QDdE464d2A3?=
 =?us-ascii?Q?IcxsMLYQ+Gp2zfOYOlC6Q7d4pUUnrmU030gokCdJNzlV1E4rmNFMtsNFuqsq?=
 =?us-ascii?Q?W7O92J7dMMPCrYRkeBz277zxYvHlSee8AuSaVHCkmiSJUYtdLTicylAFNIKY?=
 =?us-ascii?Q?2kLsoJElhE5IRpisBzWW/F+pD7IjU7FKLaTBCZRkfHClIFdro4CmtqOtvKSv?=
 =?us-ascii?Q?nJDxrjFZazDiWZyuf3uIHlCkW83byUevERGWd/L7duPaViM20xbjZKQ9Gv1T?=
 =?us-ascii?Q?zOonZVXxCLAlnLUoJMPgtqenof0s0mV42he5csM7b8IX+IuE6VJyV+kPROeJ?=
 =?us-ascii?Q?mblJuO0Yqn3IB9MdZCpwhMyW0aHNX/8n+FkXZsvyfWac0/tfNMfQESCJOoE5?=
 =?us-ascii?Q?aZJSrVVcL7RSRGmVn3IwvVUOhnSCOARNymaTuRvzgTU1SBqu8aKENvMcfKrj?=
 =?us-ascii?Q?ViTyt9CJGF2ZSipHNMOmjtNmr/HxaFikDxcMnXx5rgUZZjgboFMmEaXD+K+Q?=
 =?us-ascii?Q?aFX5OyumQUvD99Nhy44uK+8+EIUuvMqd9rco0GAO72CDoiCmoQnTul/MkS6m?=
 =?us-ascii?Q?mk+4CfhPg4klLvQdp7H0iQ+Hzy2qTKpIaUw1+dZvrVR6ATk6ino0i77JfMq+?=
 =?us-ascii?Q?GwQSnraESlcxHrig9hMGgVN+oFnBD6jaxktGoKbJNBbC9d2odGzG2IU5CR52?=
 =?us-ascii?Q?iRGAPjaKxEG5YURzqbmrXsKNg9Zxsc7tsrURvhI2QnysJNLI8rFsF7E/ysq6?=
 =?us-ascii?Q?lQQhzuK11EUDLtnxc+AOK6BObofxNLc8BqZQlFXL68PqD5gqTGZnqQWBRjmz?=
 =?us-ascii?Q?r9F9sWIo56kENz+fOAiAkbU=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32552972-13ae-4f39-3d32-08da80208560
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 07:17:19.5695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJoGKMJBnbE4zgu44mJBp4xxOQxBg+DsoIyPbN6h+hqRkqqaSp32xwswYed4X5iC/Rn6W9kjiAzuL8d46Vny+Vbp3pwl0h++xJWThewYN1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB5300
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
Cc: thang@os.amperecomputing.com, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The Mt. Mitchell BMC is an ASPEED AST2600-based BMC for the Mt. Mitchell
hardware reference platform with AmpereOne(TM) processor.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
Signed-off-by: Phong Vo <phong@os.amperecomputing.com>
Signed-off-by: Thang Q. Nguyen <thang@os.amperecomputing.com>
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
index 05d8aef6e5d2..5d8c6ce49af9 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1576,6 +1576,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
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

