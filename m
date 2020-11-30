Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB212C7FA5
	for <lists+openbmc@lfdr.de>; Mon, 30 Nov 2020 09:21:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ckyqv0Nb4zDqtt
	for <lists+openbmc@lfdr.de>; Mon, 30 Nov 2020 19:21:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.237.135;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=VY5K2tW0; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2135.outbound.protection.outlook.com [40.107.237.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ckym05YkbzDqdx
 for <openbmc@lists.ozlabs.org>; Mon, 30 Nov 2020 19:18:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7/0NtOpQ5k4iFTT2mf1eIMOotqTpexySP+Svs0s1ql+KhVwdQr3y6fMl1T38SvHAffi2ORFyGIV9aILZ8E+gqiSG2igTeyiiUxbukJaX+4PuUsyrvSgSkMtpACcMoJjlxGaHY7jVBy8gpv3erl97FjF4aw+H5S3DAF3U1PZYJX942BrWOr+jw0K0K5U8Bfa4qEgQr22jVgNaxXcTizLG5hufyvYLSRk46bKLsZV+Vg0cs5SW4KUzHzIp0+lxiUdspYaFjenRLgtmooblHf5gs87rq9MFr5YyBoRd8x22El81VZwLNR4V1JMeRjU2ruB/8v5OYhBFQIRq29pQsBiYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pl7lDOQln8/VtPLZl9mhRiHI2Ym2Rsrla+a0QrpZPOw=;
 b=KIzn8arslvgSELMdXlL1RX4mS60xQS1vnJXwax4SZjIczfsxrNPjudt7RYHVM0HyOVb9XbSaG/vk5kFbcaK0jjxY4ML6nqA8m11nj7aDfs0JpPdGBhyWduizQ6lf6MogmwCHtu4U6Slc/m90r9N5Cv+wr3AXIoXw2/d2yVZyObN+c3wNgHqbRsAyYAi/iHq7DnCuBbIFQwALL0ZW9dHKnNG7HKEL8U2H2tj6bog8OT8TDDS4Cakt0cy8iXRTgKxgfuszLECC3nC3htU0yrmIAfuU/GRibgb28bOlTz5iVLmVbMnS4xa02P3wqZK8zLxafI3jFJtRyBxxJflUKveIEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pl7lDOQln8/VtPLZl9mhRiHI2Ym2Rsrla+a0QrpZPOw=;
 b=VY5K2tW0zLGYYMVOCWz6Wa+p2CEF2DpiTzeiRlXfp3I9dmrzMxdxABgqKNwMfKsvtOk4lX1dlCiDV7jg5pXdUjlLYyljy3dYDJnO8g67tFim+VSQ3l9x74qWsY5K1jYGWamxISak6d/7+Oh67ftS7Vk2xiT050cnqi8z1gyYDe0=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW4PR01MB6467.prod.exchangelabs.com (2603:10b6:303:75::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.25; Mon, 30 Nov 2020 08:17:55 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::9978:c933:a050:a0e8]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::9978:c933:a050:a0e8%7]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 08:17:55 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2 2/2] ARM: dts: aspeed: Add device tree for Ampere's Mt.
 Jade BMC
Date: Mon, 30 Nov 2020 15:17:33 +0700
Message-Id: <20201130081733.18893-3-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201130081733.18893-1-quan@os.amperecomputing.com>
References: <20201130081733.18893-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2PR02CA0195.apcprd02.prod.outlook.com
 (2603:1096:201:21::31) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HK2PR02CA0195.apcprd02.prod.outlook.com (2603:1096:201:21::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Mon, 30 Nov 2020 08:17:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80f61e8e-1b6f-4dca-e178-08d895087093
X-MS-TrafficTypeDiagnostic: MW4PR01MB6467:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW4PR01MB64670D0BCD208E8CECBA3CD4F2F50@MW4PR01MB6467.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hORMTuTeoG5+SPLoBwzROWzUFIGTfA/aYxIesgxk794rccagqSi006cM4MIGa3mSY11wNQKyhDuBbY8sOQxP3YJsxjo6ImwEKIxG3yEA7Gq7BQy1Vq6zkR0/w5QPfyPVN/YRB+fkQyju0791QmU2jlcBcwqFD9920iQjLIWmmdDgg15nL8Dnhml87MotQvBzn90ilmkdw1IHh4gizSBPxbVAuMED1nyNr3zA3du8YLJtNdqHsTHZl8iRf7A0D6SiW+tJrrggC5ycv3+EZTZ/Kulv8OTVaAaRt8L5QQGYHW7Q2lvo5rM6DK42ErQmvJ5L+woC+GPCqeB5uhUYgbQzKnK0vI6GJKlfTZI2XjbaXNo3kdeB9lz7kB5jmqKsLCqele27Ku2bjLoqGwtn8nt9Ag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(39840400004)(376002)(396003)(6666004)(83380400001)(5660300002)(52116002)(2906002)(66476007)(66556008)(66946007)(26005)(4326008)(6486002)(316002)(478600001)(54906003)(86362001)(30864003)(16526019)(1076003)(186003)(8936002)(956004)(8676002)(2616005)(107886003)(6506007)(6512007)(414714003)(473944003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?DbrChN10xkpTmaVBeUvAC2oaHpmAcL0eq+kjH2nfin3d4TrJb/zVtrDJjA3r?=
 =?us-ascii?Q?D7Q4q5nf7LV/yIKqmJI8/zvM1J9/pXvQqDCV+Cqhn956teXi/7hrSaMHrC4+?=
 =?us-ascii?Q?zt3CDmsD5pw457u7eqmDdrhw3SHvli20Iih94xEtTIj81BjGIAp7+DVbQfgU?=
 =?us-ascii?Q?MZvo24Zpmh3nuRKczp+MQvv30F2s4gN+prDyT23ciFse7PJk65eGazcDqaUC?=
 =?us-ascii?Q?R0mh0TglPwDa8zHyuU5tsWt25H3uJCg49MWi3cfJwkDJE+IfJ0lgsDGL4n2n?=
 =?us-ascii?Q?0AE7O6cCIUB2Yskv/i6jAuI4VRLnPJ1nL7Gd/orHcT5/ZeJM5S7Ern6Ccig2?=
 =?us-ascii?Q?MFYzVHEVXyC2EHXg3lia3euDm4vwzy6YaZU/zrt5MXEpfSGl3qzEJBZl3oup?=
 =?us-ascii?Q?bzIwrU/VlzBKK8YyNfrcwcxGedaDOH86asj7OlkxcX8GDUtdjIVygN1uzyOt?=
 =?us-ascii?Q?LcRkPoVSYCOA6m8sCoUdJv0NVSzJCk+J5fDevIThrRtTQy4Q6FxGarD4ra4b?=
 =?us-ascii?Q?mveSjjbku6tu1nYWK6Vu85+vz6STm3ge0rQuINkcqzSnBCwOQo/ExnL1xvt4?=
 =?us-ascii?Q?/CuOzDSagT1pHcR0C4BMJaP5nMCJpVLpX0TbzaxJZUmaeYQj7jrQfr5Jx8Wt?=
 =?us-ascii?Q?6G3nZm9HAbHUsMYNKXNUY7lr4dBq4e8MdGytaMJbkeTZ22Df3U5ZNVjz1rja?=
 =?us-ascii?Q?y6eJL9kAagF4bc8N6EhXREyq5Q3y4bEgNyEN3pK46GzdDbzs6Jzo9mdG4DOq?=
 =?us-ascii?Q?ZxTkouXU1t2DmIXOsEzN0Aklr6wOCHbLAOYyjqdPkw4n0Jww6UP2ZwS1dRQM?=
 =?us-ascii?Q?+21xZaDHVgY++r6eYM49iFjiYl8XaNaxbF0d9UQZ8Mh32QlHK9J0XOsEv3fM?=
 =?us-ascii?Q?F6zP5YvPj16wegIfXzB/4z46zn2j9b0GH+udUJHvAH95Ew+N304FULJOpleg?=
 =?us-ascii?Q?qdYexufQgjeYXUh4ChVyM4JKWXncqSDVnw9EJ38nnWBFPNr0qQHgtMVcKnLb?=
 =?us-ascii?Q?gDkk?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f61e8e-1b6f-4dca-e178-08d895087093
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 08:17:55.7329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zTggexCgE00x33OXBU04HpQ2SeXmeVmOT0rejGN6b648Rio12gbwF/bH86WVYmL5/Ly5rpv+ziJF+qDM+Vx5/Y7kuCEzyGg64beXEd5CmCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6467
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The Mt. Jade BMC is an ASPEED AST2500-based BMC for the Mt. Jade
hardware reference platform with Ampere's Altra Processor Family.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
Signed-off-by: Phong Vo <phong@os.amperecomputing.com>
Signed-off-by: Thang Q. Nguyen <thang@os.amperecomputing.com>
---
 arch/arm/boot/dts/Makefile                    |   1 +
 .../arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 558 ++++++++++++++++++
 2 files changed, 559 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 9537b2e5aad6..6d4ae66f8cf7 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1394,6 +1394,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-ast2500-evb.dtb \
 	aspeed-ast2600-evb.dtb \
 	aspeed-bmc-amd-ethanolx.dtb \
+	aspeed-bmc-ampere-mtjade.dtb \
 	aspeed-bmc-arm-centriq2400-rep.dtb \
 	aspeed-bmc-arm-stardragon4800-rep2.dtb \
 	aspeed-bmc-bytedance-g220a.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
new file mode 100644
index 000000000000..8f5ec22e51c2
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
@@ -0,0 +1,558 @@
+// SPDX-License-Identifier: GPL-2.0+
+/dts-v1/;
+#include "aspeed-g5.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	model = "Ampere Mt. Jade BMC";
+	compatible = "ampere,mtjade-bmc", "aspeed,ast2500";
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,115200 earlyprintk";
+	};
+
+	memory@80000000 {
+		reg = <0x80000000 0x20000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		vga_memory: framebuffer@9f000000 {
+			no-map;
+			reg = <0x9f000000 0x01000000>; /* 16M */
+		};
+
+		gfx_memory: framebuffer {
+			size = <0x01000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+
+		video_engine_memory: jpegbuffer {
+			size = <0x02000000>;	/* 32M */
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		fault {
+			gpios = <&gpio ASPEED_GPIO(B, 6) GPIO_ACTIVE_HIGH>;
+		};
+
+		identify {
+			gpios = <&gpio ASPEED_GPIO(Q, 6) GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		shutdown_ack {
+			label = "SHUTDOWN_ACK";
+			gpios = <&gpio ASPEED_GPIO(G, 2) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(G, 2)>;
+		};
+
+		reboot_ack {
+			label = "REBOOT_ACK";
+			gpios = <&gpio ASPEED_GPIO(J, 3) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(J, 3)>;
+		};
+
+		S0_overtemp {
+			label = "S0_OVERTEMP";
+			gpios = <&gpio ASPEED_GPIO(G, 3) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(G, 3)>;
+		};
+
+		S0_hightemp {
+			label = "S0_HIGHTEMP";
+			gpios = <&gpio ASPEED_GPIO(J, 0) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(J, 0)>;
+		};
+
+		S0_cpu_fault {
+			label = "S0_CPU_FAULT";
+			gpios = <&gpio ASPEED_GPIO(J, 1) GPIO_ACTIVE_HIGH>;
+			linux,code = <ASPEED_GPIO(J, 1)>;
+		};
+
+		S1_overtemp {
+			label = "S1_OVERTEMP";
+			gpios = <&gpio ASPEED_GPIO(Z, 6) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(Z, 6)>;
+		};
+
+		S1_hightemp {
+			label = "S1_HIGHTEMP";
+			gpios = <&gpio ASPEED_GPIO(AB, 0) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(AB, 0)>;
+		};
+
+		S1_cpu_fault {
+			label = "S1_CPU_FAULT";
+			gpios = <&gpio ASPEED_GPIO(Z, 1) GPIO_ACTIVE_HIGH>;
+			linux,code = <ASPEED_GPIO(Z, 1)>;
+		};
+
+		id_button {
+			label = "ID_BUTTON";
+			gpios = <&gpio ASPEED_GPIO(Q, 5) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(Q, 5)>;
+		};
+
+	};
+
+	gpioA0mux: mux-controller {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		mux-gpios = <&gpio ASPEED_GPIO(A, 0) GPIO_ACTIVE_LOW>;
+	};
+
+	adc0mux: adc0mux {
+		compatible = "io-channel-mux";
+		io-channels = <&adc 0>;
+		#io-channel-cells = <1>;
+		io-channel-names = "parent";
+		mux-controls = <&gpioA0mux>;
+		channels = "s0", "s1";
+	};
+
+	adc1mux: adc1mux {
+		compatible = "io-channel-mux";
+		io-channels = <&adc 1>;
+		#io-channel-cells = <1>;
+		io-channel-names = "parent";
+		mux-controls = <&gpioA0mux>;
+		channels = "s0", "s1";
+	};
+
+	adc2mux: adc2mux {
+		compatible = "io-channel-mux";
+		io-channels = <&adc 2>;
+		#io-channel-cells = <1>;
+		io-channel-names = "parent";
+		mux-controls = <&gpioA0mux>;
+		channels = "s0", "s1";
+	};
+
+	adc3mux: adc3mux {
+		compatible = "io-channel-mux";
+		io-channels = <&adc 3>;
+		#io-channel-cells = <1>;
+		io-channel-names = "parent";
+		mux-controls = <&gpioA0mux>;
+		channels = "s0", "s1";
+	};
+
+	adc4mux: adc4mux {
+		compatible = "io-channel-mux";
+		io-channels = <&adc 4>;
+		#io-channel-cells = <1>;
+		io-channel-names = "parent";
+		mux-controls = <&gpioA0mux>;
+		channels = "s0", "s1";
+	};
+
+	adc5mux: adc5mux {
+		compatible = "io-channel-mux";
+		io-channels = <&adc 5>;
+		#io-channel-cells = <1>;
+		io-channel-names = "parent";
+		mux-controls = <&gpioA0mux>;
+		channels = "s0", "s1";
+	};
+
+	adc6mux: adc6mux {
+		compatible = "io-channel-mux";
+		io-channels = <&adc 6>;
+		#io-channel-cells = <1>;
+		io-channel-names = "parent";
+		mux-controls = <&gpioA0mux>;
+		channels = "s0", "s1";
+	};
+
+	adc7mux: adc7mux {
+		compatible = "io-channel-mux";
+		io-channels = <&adc 7>;
+		#io-channel-cells = <1>;
+		io-channel-names = "parent";
+		mux-controls = <&gpioA0mux>;
+		channels = "s0", "s1";
+	};
+
+	adc8mux: adc8mux {
+		compatible = "io-channel-mux";
+		io-channels = <&adc 8>;
+		#io-channel-cells = <1>;
+		io-channel-names = "parent";
+		mux-controls = <&gpioA0mux>;
+		channels = "s0", "s1";
+	};
+
+	adc9mux: adc9mux {
+		compatible = "io-channel-mux";
+		io-channels = <&adc 9>;
+		#io-channel-cells = <1>;
+		io-channel-names = "parent";
+		mux-controls = <&gpioA0mux>;
+		channels = "s0", "s1";
+	};
+
+	adc10mux: adc10mux {
+		compatible = "io-channel-mux";
+		io-channels = <&adc 10>;
+		#io-channel-cells = <1>;
+		io-channel-names = "parent";
+		mux-controls = <&gpioA0mux>;
+		channels = "s0", "s1";
+	};
+
+	adc11mux: adc11mux {
+		compatible = "io-channel-mux";
+		io-channels = <&adc 11>;
+		#io-channel-cells = <1>;
+		io-channel-names = "parent";
+		mux-controls = <&gpioA0mux>;
+		channels = "s0", "s1";
+	};
+
+	adc12mux: adc12mux {
+		compatible = "io-channel-mux";
+		io-channels = <&adc 12>;
+		#io-channel-cells = <1>;
+		io-channel-names = "parent";
+		mux-controls = <&gpioA0mux>;
+		channels = "s0", "s1";
+	};
+
+	adc13mux: adc13mux {
+		compatible = "io-channel-mux";
+		io-channels = <&adc 13>;
+		#io-channel-cells = <1>;
+		io-channel-names = "parent";
+		mux-controls = <&gpioA0mux>;
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
+			<&adc13mux 0>, <&adc13mux 1>;
+	};
+
+	iio-hwmon-adc14 {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 14>;
+	};
+
+	iio-hwmon-battery {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 15>;
+	};
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+		/* spi-max-frequency = <50000000>; */
+#include "openbmc-flash-layout.dtsi"
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
+		/* spi-max-frequency = <100000000>; */
+	};
+};
+
+&uart1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd1_default
+			 &pinctrl_rxd1_default
+			 &pinctrl_ncts1_default
+			 &pinctrl_nrts1_default>;
+};
+
+&uart2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd2_default
+			 &pinctrl_rxd2_default>;
+};
+
+&uart3 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd3_default
+			 &pinctrl_rxd3_default>;
+};
+
+&uart4 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd4_default
+			 &pinctrl_rxd4_default>;
+};
+
+/* The BMC's uart */
+&uart5 {
+	status = "okay";
+};
+
+&mac1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+	eeprom@50 {
+		compatible = "microchip,24c64", "atmel,24c64";
+		reg = <0x50>;
+		pagesize = <32>;
+	};
+
+	inlet_mem2: tmp175@28 {
+		compatible = "ti,tmp175";
+		reg = <0x28>;
+	};
+
+	inlet_cpu: tmp175@29 {
+		compatible = "ti,tmp175";
+		reg = <0x29>;
+	};
+
+	inlet_mem1: tmp175@2a {
+		compatible = "ti,tmp175";
+		reg = <0x2a>;
+	};
+
+	outlet_cpu: tmp175@2b {
+		compatible = "ti,tmp175";
+		reg = <0x2b>;
+	};
+
+	outlet1: tmp175@2c {
+		compatible = "ti,tmp175";
+		reg = <0x2c>;
+	};
+
+	outlet2: tmp175@2d {
+		compatible = "ti,tmp175";
+		reg = <0x2d>;
+	};
+};
+
+&i2c4 {
+	status = "okay";
+	rtc@51 {
+		compatible = "nxp,pcf85063a";
+		reg = <0x51>;
+	};
+};
+
+&i2c5 {
+	status = "okay";
+};
+
+&i2c6 {
+	status = "okay";
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
+&i2c7 {
+	status = "okay";
+};
+
+&i2c8 {
+	status = "okay";
+};
+
+&i2c9 {
+	status = "okay";
+};
+
+&gfx {
+	status = "okay";
+	memory-region = <&gfx_memory>;
+};
+
+&pinctrl {
+	aspeed,external-nodes = <&gfx &lhc>;
+};
+
+&pwm_tacho {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm2_default &pinctrl_pwm3_default
+			&pinctrl_pwm4_default &pinctrl_pwm5_default
+			&pinctrl_pwm6_default &pinctrl_pwm7_default>;
+
+	fan@0 {
+		reg = <0x02>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x04>;
+	};
+
+	fan@1 {
+		reg = <0x02>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x05>;
+	};
+
+	fan@2 {
+		reg = <0x03>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x06>;
+	};
+
+	fan@3 {
+		reg = <0x03>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x07>;
+	};
+
+	fan@4 {
+		reg = <0x04>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x08>;
+	};
+
+	fan@5 {
+		reg = <0x04>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x09>;
+	};
+
+	fan@6 {
+		reg = <0x05>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0a>;
+	};
+
+	fan@7 {
+		reg = <0x05>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0b>;
+	};
+
+	fan@8 {
+		reg = <0x06>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0c>;
+	};
+
+	fan@9 {
+		reg = <0x06>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0d>;
+	};
+
+	fan@10 {
+		reg = <0x07>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0e>;
+	};
+
+	fan@11 {
+		reg = <0x07>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0f>;
+	};
+
+};
+
+&vhub {
+	status = "okay";
+};
+
+&adc {
+	status = "okay";
+};
+
+&video {
+	status = "okay";
+	memory-region = <&video_engine_memory>;
+};
+
+&gpio {
+	gpio-line-names =
+	/*A0-A7*/	"","","","S0_BMC_SPECIAL_BOOT","","","","",
+	/*B0-B7*/	"BMC_SELECT_EEPROM","","","",
+			"POWER_BUTTON","","","",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"","","","","","","","",
+	/*E0-E7*/	"","","","","","","","",
+	/*F0-F7*/	"","","BMC_SYS_PSON_L","S0_DDR_SAVE","PGOOD",
+			"S1_DDR_SAVE","","",
+	/*G0-G7*/	"S0_FW_BOOT_OK","SHD_REQ_L","","S0_OVERTEMP_L","","",
+			"","",
+	/*H0-H7*/	"","","","","","","","",
+	/*I0-I7*/	"","","S1_BMC_SPECIAL_BOOT","","","","","",
+	/*J0-J7*/	"S0_HIGHTEMP_L","S0_FAULT_L","S0_SCP_AUTH_FAIL_L","",
+			"","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/       "","","","BMC_SYSRESET_L","SPI_AUTH_FAIL_L","","","",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"","","","","","","","",
+	/*O0-O7*/	"","","","","","","","",
+	/*P0-P7*/	"","","","","","","","",
+	/*Q0-Q7*/	"","","","","","UID_BUTTON","","",
+	/*R0-R7*/	"","","BMC_EXT_HIGHTEMP_L","","","RESET_BUTTON","","",
+	/*S0-S7*/	"","","","","","","","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z7*/	"S0_BMC_PLIMIT","S1_FAULT_L","S1_FW_BOOT_OK","","",
+			"S1_SCP_AUTH_FAIL_L","S1_OVERTEMP_L","",
+	/*AA0-AA7*/	"","","","","","","","",
+	/*AB0-AB7*/	"S1_HIGHTEMP_L","S1_BMC_PLIMIT","S0_BMC_DDR_ADDR",
+			"S1_BMC_DDR_ADR","","","","",
+	/*AC0-AC7*/	"SYS_PWR_GD","","","","","BMC_READY","SLAVE_PRESENT_L",
+			"BMC_OCP_PG";
+};
-- 
2.28.0

