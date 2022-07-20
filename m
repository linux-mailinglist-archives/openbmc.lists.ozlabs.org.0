Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 165C457B347
	for <lists+openbmc@lfdr.de>; Wed, 20 Jul 2022 10:55:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnqKl6sVbz2xt3
	for <lists+openbmc@lfdr.de>; Wed, 20 Jul 2022 18:55:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=V9jOkGhY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.94.111; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=V9jOkGhY;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2111.outbound.protection.outlook.com [40.107.94.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LnqH15J1Kz2xn3;
	Wed, 20 Jul 2022 18:53:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLoIkO90k1Q4yPt3HnZ/VdJ5qErpFPJrPLNespuw1Qon0GKAEGMt9iqyseeSnY2ysaJtKYlmd/W1Z3vz9rETcDXAzP4/jxYl37R6uQHVUJgbfayYUE1YsGESDk7fxl+Lp3a21YHkkqwFqbtBZcjdvQfxwFP/9NG3dEm2o0YGw0LoBOQCpXOfX5/EH/Yrht6YriX4IQIYphxL1i55WykT0SWYmqN2fDt2CAIEBpTI3p+764u64FeOBEDKiqeu3aS+LjeoPvUjPmcU006FX9iezfubAggdTmmIDvARALtpX5djXPFOGXHpgSZE7doE3IuceEvykv25I7lIpVlPYzxzkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SU8V7XKGm+y7lIjWHlLa0REZd5v7SsWPd1TfqOcQrw=;
 b=cX1prJrAe7MkNeKsEYa4RJvSH1NtXtA3IIO6ar7BoQYnH8S5rBmvTaDPBAgkeRC4c0TVfzUtN7An58xX0NHfdhSqXD8Az5GPwMav9ZtX/M0pNFlfVab4uCdLPSrRnc19mMdlZurxuKKFFJQVk6fOxwMf8qa0oQdFqx3/8h71X/4QJ4HeVqcVfzOwITYlTXD57gz+LeTSCZePdoO9S+TkOZEjTHfcpm7ANmFof8jAX7mETtd6htNrTSblQMgAz8V9HZZhtOiuNJ/yTiNKjKvWvZ6cGihonq3WHskg3b7aEp607V+Aa7dXB04tKoRbL/aletpMxbQZcL0bnJbUoeit6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2SU8V7XKGm+y7lIjWHlLa0REZd5v7SsWPd1TfqOcQrw=;
 b=V9jOkGhY0SYxUDZe5+9ky5pbLaiAmdP7+WpxVCGa4q7nC2Zs0/HZv7zBZ3f/BSbrsxoPN8YBoknQz2eB1q2xiqQmSU0mu/RIKlSNjrMLnZH562pQ9J8g5Vg8mAlLTW7H76RQPFhn2CTggAky34E3o/sRcG9jtqcYuNLm4JkzJsk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 DM6PR01MB5289.prod.exchangelabs.com (2603:10b6:5:63::16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.17; Wed, 20 Jul 2022 08:53:03 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e%9]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 08:53:03 +0000
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
Subject: [PATCH v2 2/2] ARM: dts: aspeed: Add device tree for Ampere's Mt. Mitchell BMC
Date: Wed, 20 Jul 2022 15:52:30 +0700
Message-Id: <20220720085230.3801945-3-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220720085230.3801945-1-quan@os.amperecomputing.com>
References: <20220720085230.3801945-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3813300-4225-465f-e65c-08da6a2d417f
X-MS-TrafficTypeDiagnostic: DM6PR01MB5289:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	pzSoMEf4x5YbyvB9pwoArD2DXorNA4+mRXEIXj8po8TPCZlA2XFWvpeMzLt5qENtwVoiKuNbX1oZT6/eyAxl7SHQgyvdbCulO62trb75stxWBierTC6X8Htbg/iR+NPNvPGozyUOB9Oc08jf+q2nUahY2spnD0P4fIIx0v9SR+Om4/aiyU5DM5mBYm++ow5/O/+t84dxscPzq9QdLyBTqjAuxxKx6TpkJrzujHXQV0a53m33VmmM/jar3amzTs0NeKvchXXIrt6foez2Pyf3EQPdc8hoy9mm0ottTRUnn3tYRq3DeIlNcli+z3Uzu6dcM9x9rNlpH2qkqilkAOHRkFh4ADUpMKTFoIVNBnDTr3JFDjYmaspnoMwtkR/O8dqR9vqVywGlU66Id9pXwafcnI0vb2JIHaz8LlXwtcfvgA3f/Jz6AwD/hxR234hhmQjRMJvyuZFjtZjImaPMG5HLCX7+KOqr6gKZjVi7dLv1fAlspnQIArCD6AlwJToyez2xvv4LAvQCapYndcDusdAKW+owI31JYrluVz9v9n9RwMN3vxQSChlh2z0AX/idR1KY+aH2WhmNLaVlEohQx6+V53dMNX/b0sz60ardpqtmEc5rjLiWfgZ8FZrwN2FGJ1JMK++wievBiHevBWhXj4wtkT0QXTtuM9WBqOsFl6b9RpeWGZlH8A8NgULih9aSg7cpGsIIB8HSWY9m0eZyIkVBvN0S141gMsVoylC7Xj9qnGbrkiJLQgM/D0irJKZKxmhQTGQs3MeXaTPTZgOrBedm+/1AxJZ0KJvzTUFsELs9aTKB+c6eRmfkVObxbe0nKTKQ8xJ4yFxfZpq/8xPc/vQQ+cZ6APDLyKlgaEH5hvAyUxAjCgvmEEIc5e2hhER6+dgZrt45XkPbQ7xgnVL7xS+7mQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(366004)(376002)(346002)(136003)(396003)(7416002)(110136005)(38350700002)(6506007)(41300700001)(5660300002)(38100700002)(83380400001)(316002)(921005)(66946007)(66574015)(66476007)(8676002)(66556008)(4326008)(2616005)(186003)(52116002)(6486002)(478600001)(86362001)(6666004)(1076003)(8936002)(2906002)(26005)(107886003)(6512007)(30864003)(449214003)(414714003)(473944003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?lUV8MiNVfRJDp7Te5ERh3hG5yCESL3rE0oO09RS3Jl9B1hJxHirS6J7uohJ5?=
 =?us-ascii?Q?fA0+XUkRdKAkJRwKU/WGJjrV++p4EWp4ygzZsFCm4Zn2LUi5Q2Y+eoc76Gzg?=
 =?us-ascii?Q?NvHDEDxJhhMZRZqYA064IUSHv/CS0igI57X//rJQ0zOy2UVnYJePIClccSNj?=
 =?us-ascii?Q?eh5iM6HtsS9Pikphj36KmAzAo/hs37c0Nkm/YgZi6AqEV+ZgW9G7JPm8td/A?=
 =?us-ascii?Q?e49W1vJmRZTWVDpiJLExTchijJA9BO9sBX2PsucvRCyXSvt5MWQ4oJ4XYFIv?=
 =?us-ascii?Q?DzmFHl4D7k3+Ob6ENRqC8/bN9T3iBwag4rstPXXlHEDn03uhKWdtO/lfSL+t?=
 =?us-ascii?Q?wyMyNJ51a1bBCET+ZLCkL17bWBKgB3v/9A6B0b4WYB/yV7nsMAB+nGZrzW3m?=
 =?us-ascii?Q?sXfPZ6wdAWu7dBMNNOs/JirrFg62CpTtHeU0bNBzWSMvC0O0y6peHIxrg5g5?=
 =?us-ascii?Q?6UFAf8R0RJvySFRDwJ8nHbhpM6sfem/8gQ6SMeKdZc7v4AMws2C8fuInKoH6?=
 =?us-ascii?Q?bFkThsAAjgw6f8bcUvMg87B8CxXG10iDzfHrrX0Xr07bpUYXI+S/+rXMlGtl?=
 =?us-ascii?Q?fWt/KlygE2eooeWhWbrq/2b0cyRypde4PaRQLnjuLRf5JYWn/EFKUZnJmfvB?=
 =?us-ascii?Q?wT5ka2AJVGCaG9jhvFGBbDhpuael/EZqm2JdgWGmaVjCQ/Wd+HY2WE+xeIhx?=
 =?us-ascii?Q?y6LpSz+hR63S55R9MsXIoYrl8MUJM/gT54Qn6HxmmYamgU3QSXuOEdonYqeN?=
 =?us-ascii?Q?U6cSkC4x/WhtnI3XilfIgKtFJZ/rrVwaDT+DHxp8Y+U/aYM8soF/hcQwqWzi?=
 =?us-ascii?Q?8T79TzAJ3X1JqcgikI1OSGqEt091ooqprlO+9v6nc+u5fYRYZrQfgVzb4/GY?=
 =?us-ascii?Q?f/5fo806OwkiLGxQvf7pC+i8WTqSOtH7BEABvHXcqv5RxCo4q2zBNl1SPpxo?=
 =?us-ascii?Q?6XORJ3scp5LK7FsBiYiwDKXmfxc2L2I0r6cr5bXYsJP0ITvBGeXNig0YpQ7n?=
 =?us-ascii?Q?rhWc5adjNYPxGc2MVKrlhMJtKqP1hrVZ6mIVZMiVYc7Rw24U7JJ7kkX9bJ5J?=
 =?us-ascii?Q?IZltExMctRFIE5pSsqobHmAfMSpaazl6hcS+8igdalESAWSAEyuUVfp0plU9?=
 =?us-ascii?Q?oJJJI8H2cVHGoFos93KGc/xm4omqXRRK6LBnMU7ww1IHfUePiuj+fETwrEqq?=
 =?us-ascii?Q?C12X5g5o4NPpDpXUVuabVUGzpZ3AbxVyXUgPaXhjc6NXqm13A3+YYJrCARYp?=
 =?us-ascii?Q?+VoewkUTrteoL2dGt6ROlT7+5mr3h0Ta2uzYJxJSvTvPgWJGW5RQTg/ToDSF?=
 =?us-ascii?Q?6OshEes1lyZSkeMkbZefjOjJuTFQ3Bn8Te48FZu4Bmrovxo6gS/SzYOa+SXj?=
 =?us-ascii?Q?7nsM1gsyJcLuSp4PK2FppkzGSUr98aIfzxWGbc6/cfkCqwb5DV7Lk/tO6m8z?=
 =?us-ascii?Q?daiLKyJaxsVVsYkOGMP3CEXAh2RpWGYzhJnxgFWOj6Op0hu6mSjbAuppPyuv?=
 =?us-ascii?Q?mcHr8HFLlYtkvCG/my82qV4+fM+YDc0aP9CryXENnl5Tp+74xKpv/bbsJpvw?=
 =?us-ascii?Q?AY4l3edFMCger0XqtZjEOssz47bJvFkpjqKhrrX992Ta0Zil7YjjSUTMBoj0?=
 =?us-ascii?Q?hz4IDuu/IJON7iWBViCdzvw=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3813300-4225-465f-e65c-08da6a2d417f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 08:53:03.5069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZDDtiEHsMEdZS+tz8M6B9kpsBtMGk5qBHHF4qO7cjKhPKRhkNgP20IyyixM2t8Ia6ElaGf44P84M//HSX8IzvbTQwNwUrMklB830Jj0DC9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5289
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
v2 :
  + Remove bootargs                                       [Krzysztof]
  + Fix gpio-keys nodes name to conform with device tree binding
  documents                                               [Krzysztof]
  + Fix some nodes to use generic name                    [Krzysztof]
  + Remove unnecessary blank line                         [Krzysztof]
  + Fix typo "LTC" to "LLC" in license info and corrected license
  info to GPL-2.0-only

 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 577 ++++++++++++++++++
 2 files changed, 578 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index f9484f5ef126..ecb9dafb8f1a 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1573,6 +1573,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-ast2600-evb.dtb \
 	aspeed-bmc-amd-ethanolx.dtb \
 	aspeed-bmc-ampere-mtjade.dtb \
+	aspeed-bmc-ampere-mtmitchell.dtb \
 	aspeed-bmc-arm-centriq2400-rep.dtb \
 	aspeed-bmc-arm-stardragon4800-rep2.dtb \
 	aspeed-bmc-asrock-e3c246d4i.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
new file mode 100644
index 000000000000..2e68f5264bb1
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
@@ -0,0 +1,577 @@
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
+		/* 1GB memory */
+		vga_memory: region@bf000000 {
+			no-map;
+			compatible = "shared-dma-pool";
+			reg = <0xbf000000 0x01000000>;  /* 16M */
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		s0-overtemp-event {
+			label = "S0_OVERTEMP";
+			gpios = <&gpio0 ASPEED_GPIO(V, 7) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(V, 7)>;
+		};
+
+		s0-hightemp-event {
+			label = "S0_HIGHTEMP";
+			gpios = <&gpio0 ASPEED_GPIO(V, 0) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(V, 0)>;
+		};
+
+		s1-overtemp-event {
+			label = "S1_OVERTEMP";
+			gpios = <&gpio0 ASPEED_GPIO(X, 6) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(X, 6)>;
+		};
+
+		s1-hightemp-event {
+			label = "S1_HIGHTEMP";
+			gpios = <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(X, 3)>;
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
+	adc_i2c: adc-i2c@16 {
+		compatible = "lltc,ltc2497";
+		reg = <0x16>;
+		vref-supply = <&voltage_mon_reg>;
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

