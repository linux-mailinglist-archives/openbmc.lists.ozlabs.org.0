Return-Path: <openbmc+bounces-1066-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E3ECE5A7C
	for <lists+openbmc@lfdr.de>; Mon, 29 Dec 2025 02:16:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dfdb06yPyz2yFq;
	Mon, 29 Dec 2025 12:16:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.46.83 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766714327;
	cv=pass; b=R4ZOnoTqAePcmwn07NmsUuwjLkqQLkVU6S2p+EXfiAYLbsSqX/EO1tAQRWyYbSwxE5OPI4i0YNKNRL0xhIye6cZuj3h1v3VET6kI97+euazKcrpv7bEjRY0GlESQ9R0BfWWbbHe9YOOTSNnxVKA/1cgma1awzlEziDyubUa9AES8wnm6eD3wlpDsA+sYjLU8HXtitsdK3c1uR9Qsn2YaeAoWbqzoThE3UWSITIsTbw+dceUpWp1CvhVccl3Vs/u45i4p31RFmsN2ad9gW74ElUV0CK2OQA6AVBwfWxOuEiHkNs9S2UytUj0VQC4hrffgKM6Sl1hM9XSGVL4qFzjuMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766714327; c=relaxed/relaxed;
	bh=FwB0rvWFb81MZ7f2Rhaq/CSB3wfdD3ParFs0HyV26D8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Wc6sojzqwqHIPyQtK9COXA73EPDgHgDxJh3pmvD/lh8YyLRbr0xK3xNv35RmLeD/EvzEdBqJ2KWwrkaJjlWPFwEVTBL/hZuWUh6hjZ+nNLi+ddTE3UB63T0Yesw1AproQmcuTlHcM0gLcBuRPHwfmcORIbTSr1D5IGKPxgOAdfrdCcmch/vyTLSGP5ASMsCg6MiEl/YE2ysOhlg6H/qdF9Bhw6ASaC+cP2F04v+1qkSeIkt2INeoOXzspHzQ+xQYdRL9X1eIAU9S08uR2f7AaKa2XNogju2I9C+/8Wt1QrfHc76JouNQz24VKkgoLXfYkZBpB7VpviAQLJ9DVHWNWQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=t+s634BU; dkim-atps=neutral; spf=pass (client-ip=52.101.46.83; helo=co1pr03cu002.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=t+s634BU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=52.101.46.83; helo=co1pr03cu002.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org)
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11020083.outbound.protection.outlook.com [52.101.46.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dcpgS0ldNz2xFn
	for <openbmc@lists.ozlabs.org>; Fri, 26 Dec 2025 12:58:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+rkLI5qSMwrmW1hqUYEg0RGyhLTZfEgnZ87Avw7wJ77/DHnRQeQF3gFeMLwgzEugQErJWrs5wRZzLl+nobhK/TmKcfTu0tNV7+0TKaCmrnlGPNHqIMH3GU5+3JGgh2LqZsYLfLbMRTc52AitlvGGW5Nf+qoYikVlpm1/VhPuaGAOHK0+7W4xI0pML0CmMxLRLxuVGqIjnkV+bbqish/cQo6bp9zeIRLIgRgB2Si4ZGbV3jzaAXrSWD9dkLlZwL396HN3VqbBp0chqRiMYVEcjhqIibvkaMg/7Mv5KSnaK4675VlqqNCi/qImpmgzACPyyvmmmDQz2feZhJ1VuO4fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwB0rvWFb81MZ7f2Rhaq/CSB3wfdD3ParFs0HyV26D8=;
 b=xaJP1fr34VxB0jStNAIvLTZk1xSD56/3bbXwpNQDlTJ2eguWqdRqZMWVt2pq5JFxL38zcGLFwuYIYk6mZfYcc4CBuX0FrNXkos1LLdE3YwSTpCNDgcyjQgvxOLDjtTKdiHa0eR457n8fgs72YTloGLSoZBDBUwiHY7PiKUIUOIEzbeH374yH4EECk+gVZekLJpuWO4AkzYk15Y3GMrrBeyY73ARbeOaeJ4TWR1/JFIsd623Mob022icKVs9hn5d7X3zs9MHgcPLd4sUHXK5zqumgk1CZ37zXK381iN8LxT8C7iTc4IlVMxI+IoT8IQGkRPMN/+uN1Faow+zmjGMXCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 4.227.125.105) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwB0rvWFb81MZ7f2Rhaq/CSB3wfdD3ParFs0HyV26D8=;
 b=t+s634BU4BAn96NK2MV2/RCI1qR7glzGbueysEko04+WROgHz2XQ1mdKOwEJHMup1Tt/PGnUSq3Y+/AHV07c8Kr4Ke/FjLnbqlN27wJJmxnBytSddMrbp7FRTQ86XOOmnbShz7pOSKfhcmENW0g9qEReH+ggq4DD3igARznqsvXK73wS6CBFv0PZcTM5q+qNvvV4v8AVsyD/9WBHZNku118BftDrkERGereJlu+d3aSI2zMI2DUDNRbqWLH/iT9LP+v1aCRW6ZZjibNfaavRY00ueMzWkLOtzWI0E2tj79gkLAGIB53Koe0fX/IC0MlZs1Gib7TTWflysjNOvq9dqQ==
Received: from SJ0PR13CA0005.namprd13.prod.outlook.com (2603:10b6:a03:2c0::10)
 by SA1PR18MB927523.namprd18.prod.outlook.com (2603:10b6:806:4b3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Fri, 26 Dec
 2025 01:58:01 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::2d) by SJ0PR13CA0005.outlook.office365.com
 (2603:10b6:a03:2c0::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.2 via Frontend Transport; Fri,
 26 Dec 2025 01:58:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.227.125.105)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 4.227.125.105 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.227.125.105; helo=axiado.com;
Received: from axiado.com (4.227.125.105) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.9
 via Frontend Transport; Fri, 26 Dec 2025 01:58:00 +0000
From: Kuan-Jui Chiu <kchiu@axiado.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: Harshit Shah <hshah@axiado.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH linux dev-6.12 1/6] dt-bindings: gpio: cdns: convert to YAML
Date: Thu, 25 Dec 2025 17:57:45 -0800
Message-Id: <20251226015750.377679-1-kchiu@axiado.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|SA1PR18MB927523:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fc3ac0ce-0937-4ed2-6ece-08de442232d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?w1xwuAMJWU6kzB1x3Tm+t3u5Fwx5cJfaM0YMyQfYzTGjF8g1Cbq+wLjK2Geq?=
 =?us-ascii?Q?xHF5yqJm5Obrq9c2hrTfwN1eMRLSH6e2QaDFRsoMV2/mYvCRCO2ms6VN/9/u?=
 =?us-ascii?Q?Ecb0LE4Os5kadcx8vjHRbAbcJrNZD0jWNu76+RsacTCqY/NABQ0592/Tf8eM?=
 =?us-ascii?Q?yrUqc4npsaPGbhZ19RzbQsGisoHcpc4Al+6nZBvIlk2ByU6aON2GnRik5p9X?=
 =?us-ascii?Q?Uxq/H4E992AaYzxf9DKxjE9iNL3JjSJAwhLzKLIVdUhXJlBA6wG1tK57IcsW?=
 =?us-ascii?Q?VMkRQF5or4qFXP1o4gC1/w5e7Exd0ChyrQdb6aVPxZ2zeU8pYQCdrtFHIgLP?=
 =?us-ascii?Q?480IFbEinCYlCg4oFC6AwbDOL6fnaoK/xnheuJ76uqz1uqOTInooQgdEzERQ?=
 =?us-ascii?Q?8xuiW61skHdMHDU2fVTLGktXuyiyccA5XVKZYc6s1gL+xwrecmLOvq7zO9AO?=
 =?us-ascii?Q?BI+pH0ElLhRFQRWeswDHwyAH0VNEuGHwx2/OhGgNi96F9i0p0MnkMV7rEPYe?=
 =?us-ascii?Q?ld+2k1JBFGvucN9Qs80QRPQKRT63LgHYjRh9OJ/gbYnpKZRiLaRsza4wUqzX?=
 =?us-ascii?Q?MSe7XlrgFntWXO48kDVyUoAvg0fJbzUfX+gGpt9mxuXPhbCXmu9I8aGPXpaG?=
 =?us-ascii?Q?4JWphPS3RGEKs48klJy0BOq9gOkriaqjLKUsVUtjbKCMv85lHAzxm9FUsRFH?=
 =?us-ascii?Q?hZh1DMlHAnW7LWCURP9iHcguMoRYcsvj5DvtCVd0NTS//skFFs0PTM5+f6QX?=
 =?us-ascii?Q?ER9mgsivhgdxts/deKjw8aBqMlVGpT3jClRS33V1iJMeDunZ4ZUzj5iEvg3I?=
 =?us-ascii?Q?4Cvd6cwXErvdnHASOINGz/gskFGBJKPp+WtmwEtP58y05g7S8YlokvqXUQEp?=
 =?us-ascii?Q?h4lNTbJGbW9i3Kx1rYL5kdp6cux6Tc8xsLE0hDCXoA0r5HjM+Wo6QFm268Am?=
 =?us-ascii?Q?8W4q6JqPrS8zLCzRywFHY3lSBhP9yWZmu3HPQhwfOgi4ORX27eBjn8kqgYGq?=
 =?us-ascii?Q?9ILJkmoAUqmKOSL6ergVQccj7DdmSBKt/GwA+fjyLmuV3faKKxLZ5w/HK8GI?=
 =?us-ascii?Q?ueAc/e2yehQbLyPsiKpo58cpFh1GIC4dB87kcASI7fIWR4vyuLOUBrzUbKHE?=
 =?us-ascii?Q?i7bUuHY9vSnz2w7pFKi/0za1L89V5n6bYAnmgxpmZr45oyn/GsCAVFYs5ch4?=
 =?us-ascii?Q?9Rj4Hln66XBFIVZKHmuVxgexoG0IzDY1L0cYztZUTtudD/0M/sOwezPhWrJs?=
 =?us-ascii?Q?cOp+FzGCCPF7raH1Ei/BoMym96rCaI7zstFozSoKy7yt7QPpLf4HJ9LYfkfp?=
 =?us-ascii?Q?gznGSrXv59049YmbGufnurLobJZs5ak6ihWIIvksW1+CtaxklADmL6wz2Iw9?=
 =?us-ascii?Q?KSclfgQu3U4csQ+J8nS7CSwReutqSrf5bY3z7p6l0osNoBjIGmmvhYM704pQ?=
 =?us-ascii?Q?50/Vzq8hfjUK1Fjj3UElXRt5xCHx75pkuR9eSV7T5r2ZsoS4J0QuhyJF90fw?=
 =?us-ascii?Q?BcphKZlt5EoTGdU=3D?=
X-Forefront-Antispam-Report:
	CIP:4.227.125.105;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2025 01:58:00.1370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc3ac0ce-0937-4ed2-6ece-08de442232d9
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[4.227.125.105];Helo=[axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR18MB927523
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Harshit Shah <hshah@axiado.com>

Convert Cadence family GPIO controller bindings to DT schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Harshit Shah <hshah@axiado.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../devicetree/bindings/gpio/cdns,gpio.txt    | 43 ----------
 .../devicetree/bindings/gpio/cdns,gpio.yaml   | 79 +++++++++++++++++++
 2 files changed, 79 insertions(+), 43 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/cdns,gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/cdns,gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/cdns,gpio.txt b/Documentation/devicetree/bindings/gpio/cdns,gpio.txt
deleted file mode 100644
index 706ef00f5c64..000000000000
--- a/Documentation/devicetree/bindings/gpio/cdns,gpio.txt
+++ /dev/null
@@ -1,43 +0,0 @@
-Cadence GPIO controller bindings
-
-Required properties:
-- compatible: should be "cdns,gpio-r1p02".
-- reg: the register base address and size.
-- #gpio-cells: should be 2.
-	* first cell is the GPIO number.
-	* second cell specifies the GPIO flags, as defined in
-		<dt-bindings/gpio/gpio.h>. Only the GPIO_ACTIVE_HIGH
-		and GPIO_ACTIVE_LOW flags are supported.
-- gpio-controller: marks the device as a GPIO controller.
-- clocks: should contain one entry referencing the peripheral clock driving
-	the GPIO controller.
-
-Optional properties:
-- ngpios: integer number of gpio lines supported by this controller, up to 32.
-- interrupts: interrupt specifier for the controllers interrupt.
-- interrupt-controller: marks the device as an interrupt controller. When
-	defined, interrupts, interrupt-parent and #interrupt-cells
-	are required.
-- interrupt-cells: should be 2.
-	* first cell is the GPIO number you want to use as an IRQ source.
-	* second cell specifies the IRQ type, as defined in
-		<dt-bindings/interrupt-controller/irq.h>.
-		Currently only level sensitive IRQs are supported.
-
-
-Example:
-	gpio0: gpio-controller@fd060000 {
-		compatible = "cdns,gpio-r1p02";
-		reg =<0xfd060000 0x1000>;
-
-		clocks = <&gpio_clk>;
-
-		interrupt-parent = <&gic>;
-		interrupts = <0 5 IRQ_TYPE_LEVEL_HIGH>;
-
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		interrupt-controller;
-		#interrupt-cells = <2>;
-	};
diff --git a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
new file mode 100644
index 000000000000..f1a64c173665
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/cdns,gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence GPIO Controller
+
+maintainers:
+  - Jan Kotas <jank@cadence.com>
+
+properties:
+  compatible:
+    const: cdns,gpio-r1p02
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  ngpios:
+    minimum: 1
+    maximum: 32
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+    description: |
+      - First cell is the GPIO line number.
+      - Second cell is flags as defined in <dt-bindings/gpio/gpio.h>,
+        only GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW supported.
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+    description: |
+      - First cell is the GPIO line number used as IRQ.
+      - Second cell is the trigger type, as defined in
+        <dt-bindings/interrupt-controller/irq.h>.
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - gpio-controller
+  - "#gpio-cells"
+
+if:
+  required: [interrupt-controller]
+then:
+  required:
+    - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    gpio0: gpio-controller@fd060000 {
+        compatible = "cdns,gpio-r1p02";
+        reg = <0xfd060000 0x1000>;
+        clocks = <&gpio_clk>;
+
+        interrupt-parent = <&gic>;
+        interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
-- 
2.34.1


