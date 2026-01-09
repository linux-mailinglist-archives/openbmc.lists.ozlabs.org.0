Return-Path: <openbmc+bounces-1142-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7186D0CA0C
	for <lists+openbmc@lfdr.de>; Sat, 10 Jan 2026 01:31:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dp01Q44Ljz2yRG;
	Sat, 10 Jan 2026 11:31:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.61.127 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767938620;
	cv=pass; b=DQsQvUWly2yi0Q3mR7Ci3Fw5GofiGqpQPeDErTdxgYUbZQK7LbbUTlEUUmj0hUxXW7U3rVw/pEiVR9E+89n3pxYbnKtCwEizrQLbEnCjg4/oe/XfxAbKYbDxPHSATYRLgVxheQmzDny99R3bu351IiuMZMcgaewzcld9btZyYSHJRdUCBSu6gjxLje3U2hl19QwAFg7AblJg7zuGbB/sSyJPmkIJdv6tNnT7ae1OFfvOFewh4tXSKFqJwbjiIV4FCRKGS//2Y8ZYosl1CG+q2nVhLelomJC75OkiCQROBfzGRiBg4Im1/lqnULc5+CAx4laSiO8JN0J9/Mrv/YNZ1A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767938620; c=relaxed/relaxed;
	bh=gQIXFdql2ooORPO7b1z8Z/dgBrDKEwHCpeqWLIGA20s=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z35tUC+Cx2jhbstUkjGeAHHgsJGTjeYUyc0/pbCZ52tIOZypOQtt415MHt6KHGDdCpXKOUGUCOUhPLTRwiOuWdYWXXPi8cyMseiGv3d0YITp2kkoiKdhYsEwxyV4BbEI4INMre42Mi6YhITqHRIk+d5m5NR0xJwjaR8MEtKafOrgRaOl7wDi1i++pvJ5fjF9Yi0g2Yo51ftZcmBdkz8f4lQsAdG/3C6Bi4pFMeb3TVgVCkmyqiXmdlhvkEj9x0o+HP++vdElN2tKSj+YiiAGO/UtdYLUG8avFW5tMcsnu96yEnCIPdmCPJxmtTy4dwKZa3s83n6LwyB5IxHD+cpcuQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=wmHR4cBK; dkim-atps=neutral; spf=pass (client-ip=52.101.61.127; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=wmHR4cBK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=52.101.61.127; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org)
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11020127.outbound.protection.outlook.com [52.101.61.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnWRb1BxQz2xJ6
	for <openbmc@lists.ozlabs.org>; Fri, 09 Jan 2026 17:03:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kdudNnXIRyw8IuPcYAD/zUph4bQDpBNMnHuee99JSO1TUlWGpQjoFVOgoQzBPr8bXH56Zc3qHfW5qgxpp4euenPeDYAfOGCXlIvvzfxq8dQisi4Dicg1TMZX5mLRUTbRU8JdM3RB3yKFvfD0yyA63Lx6RgBE1i6Vr9jJST6UTp6bfWM0o1IBSLq9lc+OoSmAHYmmnCAHKVIiqPFFpQqvnenUv0DzLpVw+w4JMC3KuCPNua8tjn3O4fBP6h8xUZ+x9pVDz7CcUn/Jut4Q9dkz2M5LlHWzmI7at9DnSAlAG5XhkeXPdEEYq6WkS/HeAGKUMzmidZ+jIjB7o7IahYJ1pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQIXFdql2ooORPO7b1z8Z/dgBrDKEwHCpeqWLIGA20s=;
 b=SB+36P4wwDBAqMiMmJc/rP5BGjV5epL25U7XLElcW6v4uGReq6tqsylNrUSUY4DuxMmlp3nNbEN2K7YRrfP1+MP7yuv6FJiYvZDDkcDQaXaJCaQ2cANgLgfxYqqIdrH9lStVaDh8N+ZoI96NMLeqCia+xEXRJszYypYc6foJmA27B6DB6+8d1xMY6YFoUi7r1d5H5+c3qHhxdLV9jyHmhwmkID425Bm2g1ZptPfTShFlQsk3WJI3JKKHgHNTX+q1HsHImV9j3lB/Qd4jpRxmD0vFZKLiYNkum9umxSh5wO2D1/pk8oQrgXDcb20n4O6XxZGaX1eq4+KfxRsOBDVvEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 4.227.125.105) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQIXFdql2ooORPO7b1z8Z/dgBrDKEwHCpeqWLIGA20s=;
 b=wmHR4cBKWRu7Jpbx51OvwWKK35ip4EgsAJ8bMZeCMGKhH5OObAMsrozSx0Ast1QI9I0eeVcGT7/IdLFeOO8Js7piyl+kgBbdzBhmZvGKlAfpcQaKmgSOTLpGLVoQAXcyZNoQkvh+/7PiYRLZlfqGF/utfK9+kCw2aTjAbJC4jbieLhWZtfXXvXtXw9KK972/oq6PkuDIusfNRwUGqqSS7a9fVVop6PptsyCwFx6KKlu0s7dX/Ng0iio4e4EzMW+p/CByp18Dk1pq8JylCnONhvN6rCFjF4KZxgqUSZopUwDo52+B7gYCdmBLdqca34V8eHQbPJ0hz6oI6Mo38s6GHQ==
Received: from BN9PR03CA0524.namprd03.prod.outlook.com (2603:10b6:408:131::19)
 by MW4PR18MB5108.namprd18.prod.outlook.com (2603:10b6:303:1b7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 06:02:57 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:408:131:cafe::13) by BN9PR03CA0524.outlook.office365.com
 (2603:10b6:408:131::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 06:02:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.227.125.105)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 4.227.125.105 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.227.125.105; helo=axiado.com;
Received: from axiado.com (4.227.125.105) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Fri, 9 Jan 2026 06:02:57 +0000
From: Kuan-Jui Chiu <kchiu@axiado.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Subject: [PATCH linux dev-6.12 v2 1/6] dt-bindings: gpio: cdns: convert to YAML
Date: Thu,  8 Jan 2026 22:02:48 -0800
Message-Id: <20260109060254.1575868-2-kchiu@axiado.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260109060254.1575868-1-kchiu@axiado.com>
References: <20260109060254.1575868-1-kchiu@axiado.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|MW4PR18MB5108:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 24c6b67b-ce26-47bf-fce2-08de4f44bca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1fzCyyLpF8gvnjnGHs+X81z8bgTsDCoahqm4Y9My468X4LmTGbiCSUElF+uG?=
 =?us-ascii?Q?prPNDeX9AY4YLAoQI3LUTLo3JspLzpwXFz+2VTzQQ/0N2RAFdhzBN/JIUMev?=
 =?us-ascii?Q?IytqEzsHVO0FkYJEta9wFA8C8a48cgfPY0app9Xb5n8wlDspz8miAqJN5CtO?=
 =?us-ascii?Q?lttr66c/f9bYH+REgqFhO2PD9nNFR4dG6WZvRPRemozndD05JCY3zv1kvHkx?=
 =?us-ascii?Q?D3Wf6d8sCG5HqSCfFUdpKOCib7E3LU0l05qyQUOK5j36ac84Pa6q9XSrfXSm?=
 =?us-ascii?Q?Fxet5dPH9rgVTIpX4rv+1p565HNp059G5eDoRfLel9EWNOR+5gesysaggLyP?=
 =?us-ascii?Q?9erDDlHlC9X6TPp92yBCZGIAkoUS84X1SELX25gfZP2ihH7TAKSGTewHn257?=
 =?us-ascii?Q?kl495VBpBLC2/dbMxqWQs4+/wuLxCxc7uRzlYin54GbvpILz7us6jDJiaO+K?=
 =?us-ascii?Q?OmVxan701K/fEpYGTklzU64cSmHmU8mWYEiUC6hUXOA97vriC/zaS8YzF3ce?=
 =?us-ascii?Q?nzxONOinnujUJMUuFjvC+LABI+zj7yB8v10UPIu52WPxN4TA7sxe+EZ3Pn2Z?=
 =?us-ascii?Q?L1avsnJ55n8fqjx71218rZlpbR+4mNVUkn9p9rRbrfYFm67xq7E0/ebbg640?=
 =?us-ascii?Q?USNVC3IznObUzXuaWmqEx7uLiHKCJx8HCq61fN92ANkq1kyViQrcRuu8BNUk?=
 =?us-ascii?Q?H7y7C/mFQYs2UBWo7m9zY/BBPQEW1eNLzJJ+jBPSu8psNBco19HrrS+4l+o9?=
 =?us-ascii?Q?9aRp1rz1IvWHBkYfpEJgoVbu0O0LOfAVs2rvDr2jcqZMDgmh01qbyAakFmNF?=
 =?us-ascii?Q?P9iAxmA8JIe7dfNdqyLva6zBhfVzY0e+yDTA3ha8ctvjKrUbnQVxKBK5VanV?=
 =?us-ascii?Q?oicxeUvNQp6mhr/R60vvpzvxsunEmYYOCZyTW6eIs814UkfusMWQFhfCyWsV?=
 =?us-ascii?Q?y/cw5B4S0JOZEQ2EOa6LeFKFi+cknU9xyp0bFRNRoNpzozdApPGGvw2+Pc06?=
 =?us-ascii?Q?gbnI0BTqk+BfZk0tJKSKfggfiWzUPMMy6T4FhJgBAnxoLDQaME7Gv8rT0osd?=
 =?us-ascii?Q?k4XkoZQuEnt7VVSWXub9Td9iWZziZzNoXvLepf8tv6F1CeuRfDuiN8vsUpX/?=
 =?us-ascii?Q?Va+wcqiavyFuFLJEVoDRAk6CK+4JMJomlSgLs6hcScLsA8qp+1fdf5+qnaTo?=
 =?us-ascii?Q?d55ntRxljiy5ZW5J/oCJ1ohcvvD+q7UbumDIcqYIvjCqESsEYENfw5PkMK1o?=
 =?us-ascii?Q?0tAuWwoIOIElGKtSYOHUFbXOZoRSk/ZoTBZLmieSGNU4Ig/kDR2nL9abz5x0?=
 =?us-ascii?Q?1F6pCvVG5ezsNbiOAtNoo0u+CVxSQR7zNShUHHjn3NxBz2TK7jJP1YpVgIn7?=
 =?us-ascii?Q?uAHxM4+RYofpd35ScvSftZdrIMks5WpIjE9T1zEkGwSScsq4qpS2RyvNBCwb?=
 =?us-ascii?Q?+LTyc1RZ34HkxBZhkNA/47K0fOC61CVYfBaQr0lcR0kqDS+egq5pWWi/6O/S?=
 =?us-ascii?Q?MVWdSXndKzvgE7tTAokD6bvGsh8um46NCI4V?=
X-Forefront-Antispam-Report:
	CIP:4.227.125.105;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 06:02:57.1396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24c6b67b-ce26-47bf-fce2-08de4f44bca5
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[4.227.125.105];Helo=[axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR18MB5108
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Harshit Shah <hshah@axiado.com>

Convert Cadence family GPIO controller bindings to DT schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Harshit Shah <hshah@axiado.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
(cherry picked from commit 36f42234497845bfa45ca13e8a683dbffaa09a83)
Signed-off-by: Kuan-Jui Chiu <kchiu@axiado.com>
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


