Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99283A2017C
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2025 00:21:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yhkts5JcNz3bYq
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2025 10:21:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:200a::601" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737695949;
	cv=pass; b=SAWFEuoDdCw/pzps7tx6lLkUJFEzLj4OGLrNvPEu7+eErW+F3zGiQ8NCA1W2ulEMAMAhFeK8bLZMThul8B5hVjrLLXM81SxRIYuB/ZWTfCIhBB0qfTEOYMe+1bJoyUm0rW3xYtMNdO4KcFvj1eKoPB81RcpkXzqy18wQj/bNEzBXBKPDRYgOz95ngfSNm1bu1k0n4TaroM0MwelD8N7v2BG3QW5bDuijReSGTHr2x+R0QZbJMXcSg11HT5Z9RRjl50mSl/FCMHPVPjBANA63EQv6dNCM2phgVes0opTjNHimMmvspDnNBB/GAf4IZ13hZoC4+1DUrmkjpmYlCOV+bA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737695949; c=relaxed/relaxed;
	bh=9jBR0u/RYNbFMDZpXxRdzsK+8LLl0xqfF8Sg6XLTopc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ml/EyGBkb0K+auFrH+1iMMhbsPNVrBWMA2RYh6PFzS8phj24bV+J8f8170rBAQR+A6KVx0KNhdZxulJIcQcbnOTMUszIMBkd4Cu6vVssyefFrkZ3xBSMbgpReqGgqlcrEp+gqJsJPvjE57pmjiYPHD07On4x1bYt5mEXqKbu9VG+YIheyokIifJMJe4VjW3b/KtUahn3773bnEwxaqareRIry8QlSEtEAr/MCLWA9iI0gB/9Nn0L2PLozTC+iLddxF9tz0tyVa47JAPckGtF+v+KQFQ8mYjJF1Lmm8feCrpFw+4/FffHeGfayjwIJOu0VaUMEo04JBLsL7dKP14jzg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=G6dGOhww; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:200a::601; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=G6dGOhww;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:200a::601; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::601])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YfR1m1JYXz2yb9;
	Fri, 24 Jan 2025 16:19:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdzpWohioeTYt6duo47nWcFGqB2dPysPju4yv7G9KeBheTTGrz3HonGLYELdydL+52LTSP/rQIaI0mKdWcl5rGszsHTb1R5Hh0CyVjX2mKNAwhMjhRyuql9xRuigWchdq0HxwrbAxsuhFFG7U1nu/pOu8bbBGcGFLjcJFave8PVtzRIDLaKwTmfKsFHgoMLUM39PObDTrmkZ6rVlI9cZcbiGQhKir7yjL7Xq34eLRT7ZPJmnEEVn7apr8ITFXz1WsIVaCuyIqDZDv6XTMg8UzDRX6DrCkuBHLBrsW0T8Kp6eEBd/kVglrGkMBBvI6yqA+K73bwiK6tj8Z+T2+gZHNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jBR0u/RYNbFMDZpXxRdzsK+8LLl0xqfF8Sg6XLTopc=;
 b=UOmPGEJ+o4eXyrbmsxwJiZ1lwDJJHDW0TBg5/8xlf5zQFLG623EcMfOeYWnHUFepDaa6ntgrvY5oEqYQZQOJtwJH6EBHKULkVC4wQoEoNITqP4SZVREt3RBoIaxWxepUVKvS8/WfH2PcObQqaJKxaD7XuP2xmD26JGovUidh7l43nRu1rSfKpj7qsdWlI+IMNlXDSjuGkHSeETHxYQbdG60ASvV8VW9UKiQfJUmduoVy8NZhiTvYpfYTdNutd3h8j3G984n7pASvdlcaaVqRp+qiMrhTOIrQEVoqNRJfUdk5wRTTeaVVrLGl+cGDaA8sv4852pnHSvtiLWnh8NiGqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jBR0u/RYNbFMDZpXxRdzsK+8LLl0xqfF8Sg6XLTopc=;
 b=G6dGOhww27u2xERswKLcE5WZGPjCaZWnatqmp8vEUISPOxTjupwMjYaPglLxqoUEQ0Ey2dI90nYFF+BlZjunrZ83BLHQBssYqWUtOLyEEjd0RlJcerBlsCAEYLK5DSpf3E04WiTcBePl/nsUckclVgF06BjErDXUaKOT1qjFhXS2AbUBA1NN3OQ45Jn1+ycJLx0qkQ8AsxJlcsFxFE5p9ylBogeB4BaHMwVzZ/GGeX2GfZW2SKSyRshfnQPlMcbpKby04TSZCl5VtDHHEhvpE38lhnLkyYbpRhQOUfECfTpKIygBY/NM8ZutVVUVBAtomN/8NdIcFL57Wd7gJ1haMQ==
Received: from BN9PR03CA0441.namprd03.prod.outlook.com (2603:10b6:408:113::26)
 by CH2PR12MB9496.namprd12.prod.outlook.com (2603:10b6:610:27e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Fri, 24 Jan
 2025 05:18:40 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:408:113:cafe::d7) by BN9PR03CA0441.outlook.office365.com
 (2603:10b6:408:113::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Fri,
 24 Jan 2025 05:18:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Fri, 24 Jan 2025 05:18:40 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 23 Jan
 2025 21:18:26 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 23 Jan
 2025 21:18:26 -0800
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 23 Jan 2025 21:18:25 -0800
From: Willie Thai <wthai@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <kees@kernel.org>,
	<tony.luck@intel.com>, <gpiccoli@igalia.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>
Subject: [PATCH] ARM: dts: aspeed: Add device tree for Nvidia's GB200NVL BMC
Date: Fri, 24 Jan 2025 05:18:19 +0000
Message-ID: <20250124051819.7714-1-wthai@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|CH2PR12MB9496:EE_
X-MS-Office365-Filtering-Correlation-Id: b2c6f620-d50d-4141-394e-08dd3c369078
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?1+4Bx9KMgVGTmprjLR1G3cN9j+9fH5lB1h20HVlzxWk8hu+4wHA55KXFmdnJ?=
 =?us-ascii?Q?YQ0UZuQMom0YxsI11LyHVTjDl7jVLvdZ4ecH1PjNmjBVkVNteEFZ7JLPLh8h?=
 =?us-ascii?Q?/WU8uhUwH4+/js62joEGGvA/tJ/Cs6AUyJBL7QI/Xpk3q6xi9pVxBFysmNmf?=
 =?us-ascii?Q?rxEPInD7fAmervtWAZaVk75J0Kzz6JcaGx0gAn6vM9ygz3X9A2lCSI21mmXO?=
 =?us-ascii?Q?C0l/Q6NpMyqHOOFRVzN1wyaQfPgzSfgYR8Vp+s3bpXRmCQ97LuCV4jTn6RZV?=
 =?us-ascii?Q?ytCOR0ft74Ql50n+DMWw9fwerWtUc/lT6UgR/aaw0WxU57X5vH54fXgWPAQY?=
 =?us-ascii?Q?G9tRPV68AO42H36yfr01hMGtRDbphoxEi4CS532A9AFzFWo8q6pa2vTe1Rvp?=
 =?us-ascii?Q?2aagfOWFUfATekKVLovne8jrWqCvUuZDuxIm5dY/v/PrbqWXz9k6c/UNR8lw?=
 =?us-ascii?Q?PXvg9b/Jgev4kc6dxty2ALKQtdbWOKNJk75DOFPKErzCGmTrzKsnnX7uRZ/S?=
 =?us-ascii?Q?hnA5zf3eVABnWJxR02dHN7e5fW9BhGB/fiLwUBG0Xy2YKuOZnPrPe/Az+Jxx?=
 =?us-ascii?Q?/YZQH0T5VrrOu6kqkWxxH+19pbFyeeH38KggqiMWhTbjs0Uje62xIptJH/C9?=
 =?us-ascii?Q?uCQApfvLy+3xI7xk6ovwl+msK2JBFJD9AEouDOXxmrk6JV56z3PVdtiHbpm1?=
 =?us-ascii?Q?CfUTj3ZaJ6fd+ej4q4K4iJlF43xhP1OlrSxOUZJzOzJsKD2Y2tIq+eYnvj5g?=
 =?us-ascii?Q?wQRW73nkwTSVmbwGZ279gLLUvHRhXGI0/aLnBNnbYYBzmeQhQ4W+VuBnzr4R?=
 =?us-ascii?Q?i6ogaL+mnnGDHh6O8e/BsieWT9jffBOa3bOLxFo0vUK8tOuYl9HIewj80HE0?=
 =?us-ascii?Q?HZt1Pybz2mDdF3nchgVtx0zpn2cngF6KHedK4EXhqjv4Q5HpYfrpRVB0tdLd?=
 =?us-ascii?Q?TUYZiC4WC4ftCvpA5VCs9u0ou/ZC1dJWFvIHRnfcfMZpKD36GKM2a/OeCkj5?=
 =?us-ascii?Q?EByLSCkbEl3UzUXs7SdpNXylhbtnkQvnvO5SGxmRg6vt4KxOA55sdvyn/vzP?=
 =?us-ascii?Q?V47Y5guVJk65x7mllRFw7loPe5SNE6L1uwG3xk4YU3uNgBxqVJX91ks/TICj?=
 =?us-ascii?Q?xy/SOmQcyrLBThtRu/uG16nGLq1X52d4cLfH1u1tsdGBdYLinuVAgEHxYIhh?=
 =?us-ascii?Q?zZW+F8McF3BWLkYOoXisYwvH1Znm1Isd/Qc6gBovdVtpBnBMejveKELKwDf4?=
 =?us-ascii?Q?hzC1Gn7Kr34fpAYRnDSBxRYiNiN5JkuI/RSIo91RTzp0KZ2Y1ED+ezXW7XeM?=
 =?us-ascii?Q?vljm3NG4XFuYTyET0+tW1GvUf7AfKoWTBayxlykPbBGig9QXk0iVCULEh8vv?=
 =?us-ascii?Q?Ii03cBXVlwgKxIH1/lAm86oklXNMMyLQf82MM5sW9JBZBY5luNc3ABohyv9c?=
 =?us-ascii?Q?JOOSIRuQ4dTndDmx/bYZYPcBi+zks4qf2JKgM60+mE12njpDP77ML3chCLYP?=
 =?us-ascii?Q?xT4gi9HML5yGm14=3D?=
X-Forefront-Antispam-Report: 	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 05:18:40.4145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2c6f620-d50d-4141-394e-08dd3c369078
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9496
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS,WEIRD_QUOTING autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 28 Jan 2025 10:21:07 +1100
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
Cc: leohu@nvidia.com, dkodihalli@nvidia.com, tingkaic@nvidia.com, wthai@nvidia.com, wthai <wthai@willie-obmc-builder.nvidia.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: wthai <wthai@willie-obmc-builder.nvidia.com>

The GB200NVL BMC is an Aspeed Ast2600 based BMC
for Nvidia Blackwell GB200NVL platform.

Signed-off-by: wthai <wthai@nvidia.com>
---
 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts | 1352 +++++++++++++++++
 3 files changed, 1354 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 2f92b8ab08fa..0a6f3654dcb5 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -96,6 +96,7 @@ properties:
               - inventec,starscream-bmc
               - inventec,transformer-bmc
               - jabil,rbp-bmc
+              - nvidia,gb200nvl-bmc
               - qcom,dc-scm-v1-bmc
               - quanta,s6q-bmc
               - ufispace,ncplite-bmc
diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index c4f064e4b073..0dc5240866f3 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -48,6 +48,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-lenovo-hr630.dtb \
 	aspeed-bmc-lenovo-hr855xg2.dtb \
 	aspeed-bmc-microsoft-olympus.dtb \
+	aspeed-bmc-nvidia-gb200nvl-bmc.dtb \
 	aspeed-bmc-opp-lanyang.dtb \
 	aspeed-bmc-opp-mowgli.dtb \
 	aspeed-bmc-opp-nicole.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
new file mode 100644
index 000000000000..91d025229aba
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
@@ -0,0 +1,1352 @@
+// SPDX-License-Identifier: GPL-2.0+
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/leds/common.h>
+
+&gpio0 {
+	gpio-line-names =
+
+	/* gpio-line-names are the combination of <signal>-<I/O> , "" is the placeholder for the unused pins
+	*/
+
+	/* 208 (26*8) 3.3V GPIOs */
+
+	/*A0-A7*/
+	"", "", "", "", "", "", "", "",
+
+	/*B0-B7*/
+	"", "", "", "", "", "", "", "",
+
+	/*C0-C7*/
+	"SGPIO_I2C_MUX_SEL-O",
+	"", "", "", "", "", "", "",
+
+	/*D0-D7*/
+	"", "", "",
+	"UART1_MUX_SEL-O",
+	"",
+	"FPGA_PEX_RST_L-O",
+	"", "",
+
+	/*E0-E7*/
+	"RTL8221_PHY_RST_L-O",
+	"RTL8211_PHY_INT_L-I",
+	"",
+	"UART3_MUX_SEL-O",
+	"", "", "",
+	"SGPIO_BMC_EN-O",
+
+	/*F0-F7*/
+	"", "", "", "", "", "", "", "",
+
+	/*G0-G7*/
+	"", "", "", "", "", "", "", "",
+
+	/*H0-H7*/
+	"", "", "", "", "", "", "", "",
+
+	/*I0-I7*/
+	"", "", "", "", "",
+	"QSPI2_RST_L-O",
+	"GLOBAL_WP_BMC-O",
+	"BMC_DDR4_TEN-O",
+
+	/*J0-J7*/
+	"", "", "", "", "", "", "", "",
+
+	/*K0-K7*/
+	"", "", "", "", "", "", "", "",
+
+	/*L0-L7*/
+	"", "", "", "", "", "", "", "",
+
+	/*M0-M7*/
+	"PCIE_EP_RST_EN-O",
+	"BMC_FRU_WP-O",
+	"HMC_RESET_L-O",
+	"STBY_POWER_EN-O",
+	"STBY_POWER_PG-I",
+	"PCIE_EP_RST_L-O",
+	"", "",
+
+	/*N0-N7*/
+	"", "", "", "", "", "", "", "",
+
+	/*O0-O7*/
+	"", "", "", "", "", "", "", "",
+
+	/*P0-P7*/
+	"", "", "", "", "", "", "", "",
+
+	/*Q0-Q7*/
+	"", "", "", "", "", "", "", "",
+
+	/*R0-R7*/
+	"", "", "", "", "", "", "", "",
+
+	/*S0-S7*/
+	"", "", "", "", "", "", "", "",
+
+	/*T0-T7*/
+	"", "", "", "", "", "", "", "",
+
+	/*U0-U7*/
+	"", "", "", "", "", "", "", "",
+
+	/*V0-V7*/
+	"AP_EROT_REQ-O",
+	"EROT_AP_GNT-I",
+	"",
+	"",
+	"PCB_TEMP_ALERT-I",
+	"", "", "",
+
+	/*W0-W7*/
+	"", "", "", "", "", "", "", "",
+
+	/*X0-X7*/
+	"", "",
+	"TPM_MUX_SEL-O",
+	"", "", "", "", "",
+
+	/*Y0-Y7*/
+	"", "", "",
+	"EMMC_RST-O",
+	"","", "", "",
+
+	/*Z0-Z7*/
+	"BMC_READY-O",
+	"", "", "", "", "", "", "";
+};
+
+&sgpiom0 {
+	status="okay";
+	ngpios = <128>;
+
+	gpio-line-names =
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"RUN_POWER_FAULT_L-I",
+	"SYS_RST_IN_L-O",
+	"RUN_POWER_PG-I",
+	"PWR_BRAKE_L-O",
+	"SYS_RST_OUT_L-I",
+	"RUN_POWER_EN-O",
+	"L0L1_RST_REQ_OUT_L-I",
+	"SHDN_FORCE_L-O",
+	"L2_RST_REQ_OUT_L-I",
+	"SHDN_REQ_L-O",
+	"SHDN_OK_L-I",
+	"UID_LED_N-O",
+	"BMC_I2C1_FPGA_ALERT_L-I",
+	"SYS_FAULT_LED_N-O",
+	"BMC_I2C0_FPGA_ALERT_L-I",
+	"PWR_LED_N-O",
+	"FPGA_RSVD_FFU3-I",
+	"",
+	"FPGA_RSVD_FFU2-I",
+	"",
+	"FPGA_RSVD_FFU1-I",
+	"",
+	"FPGA_RSVD_FFU0-I",
+	"BMC_I2C_SSIF_ALERT_L-O",
+	"CPU_BOOT_DONE-I",
+	"JTAG_MUX_SELECT-O",
+	"SPI_BMC_FPGA_INT_L-I",
+	"RTC_CLR_L-O",
+	"THERM_BB_WARN_L-I",
+	"UART_MUX_SEL-O",
+	"THERM_BB_OVERT_L-I",
+	"",
+	"CPU0_UPHY3_PRSNT1_L-I",
+	"IOBRD0_RUN_POWER_EN-O",
+	"CPU0_UPHY3_PRSNT0_L-I",
+	"IOBRD1_RUN_POWER_EN-O",
+	"CPU0_UPHY2_PRSNT1_L-I",
+	"FPGA_RSVD_FFU4-O",
+	"CPU0_UPHY2_PRSNT0_L-I",
+	"FPGA_RSVD_FFU5-O",
+	"CPU0_UPHY1_PRSNT1_L-I",
+	"FPGA_RSVD_FFU6-O",
+	"CPU0_UPHY1_PRSNT0_L-I",
+	"FPGA_RSVD_FFU7-O",
+	"CPU0_UPHY0_PRSNT1_L-I",
+	"RSVD_NV_PLT_DETECT-O",
+	"CPU0_UPHY0_PRSNT0_L-I",
+	"SPI1_INT_L-O",
+	"CPU1_UPHY3_PRSNT1_L-I",
+	"",
+	"CPU1_UPHY3_PRSNT0_L-I",
+	"HMC_EROT_MUX_STATUS",
+	"CPU1_UPHY2_PRSNT1_L-I",
+	"",
+	"CPU1_UPHY2_PRSNT0_L-I",
+	"",
+	"CPU1_UPHY1_PRSNT1_L-I",
+	"",
+	"CPU1_UPHY1_PRSNT0_L-I",
+	"",
+	"CPU1_UPHY0_PRSNT1_L-I",
+	"",
+	"CPU1_UPHY0_PRSNT0_L-I",
+	"",
+	"FAN1_PRESENT_L-I",
+	"",
+	"FAN0_PRESENT_L-I",
+	"",
+	"",
+	"",
+	"IPEX_CABLE_PRSNT_L-I",
+	"",
+	"M2_1_PRSNT_L-I",
+	"",
+	"M2_0_PRSNT_L-I",
+	"",
+	"CPU1_UPHY4_PRSNT1_L-I",
+	"",
+	"CPU0_UPHY4_PRSNT0_L-I",
+	"",
+	"",
+	"",
+	"I2C_RTC_ALERT_L-I",
+	"",
+	"FAN7_PRESENT_L-I",
+	"",
+	"FAN6_PRESENT_L-I",
+	"",
+	"FAN5_PRESENT_L-I",
+	"",
+	"FAN4_PRESENT_L-I",
+	"",
+	"FAN3_PRESENT_L-I",
+	"",
+	"FAN2_PRESENT_L-I",
+	"",
+	"IOBRD0_IOX_INT_L-I",
+	"",
+	"IOBRD1_PRSNT_L-I",
+	"",
+	"IOBRD0_PRSNT_L-I",
+	"",
+	"IOBRD1_PWR_GOOD-I",
+	"",
+	"IOBRD0_PWR_GOOD-I",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"FAN_FAIL_IN_L-I",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"PDB_CABLE_PRESENT_L-I",
+	"",
+	"",
+	"",
+	"CHASSIS_PWR_BRK_L-I",
+	"",
+	"",
+	"",
+	"IOBRD1_IOX_INT_L-I",
+	"",
+	"10GBE_SMBALRT_L-I",
+	"",
+	"PCIE_WAKE_L-I",
+	"",
+	"I2C_M21_ALERT_L-I",
+	"",
+	"I2C_M20_ALERT_L-I",
+	"",
+	"TRAY_FAST_SHDN_L-I",
+	"",
+	"UID_BTN_N-I",
+	"",
+	"PWR_BTN_L-I",
+	"",
+	"PSU_SMB_ALERT_L-I",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"NODE_LOC_ID[0]-I",
+	"",
+	"NODE_LOC_ID[1]-I",
+	"",
+	"NODE_LOC_ID[2]-I",
+	"",
+	"NODE_LOC_ID[3]-I",
+	"",
+	"NODE_LOC_ID[4]-I",
+	"",
+	"NODE_LOC_ID[5]-I",
+	"",
+	"FAN10_PRESENT_L-I",
+	"",
+	"FAN9_PRESENT_L-I",
+	"",
+	"FAN8_PRESENT_L-I",
+	"",
+	"FPGA1_READY_HMC-I",
+	"",
+	"DP_HPD-I",
+	"",
+	"HMC_I2C3_FPGA_ALERT_L-I",
+	"",
+	"HMC_I2C2_FPGA_ALERT_L-I",
+	"",
+	"FPGA0_READY_HMC-I",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"LEAK_DETECT_ALERT_L-I",
+	"",
+	"MOD1_B2B_CABLE_PRESENT_L-I",
+	"",
+	"MOD1_CLINK_CABLE_PRESENT_L-I",
+	"",
+	"FAN11_PRESENT_L-I",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"RSVD_SGPIO_IN_CRC[0]",
+	"RSVD_SGPIO_O_CRC[7]",
+	"RSVD_SGPIO_IN_CRC[1]",
+	"RSVD_SGPIO_O_CRC[6]",
+	"RSVD_SGPIO_IN_CRC[2]",
+	"RSVD_SGPIO_O_CRC[5]",
+	"RSVD_SGPIO_IN_CRC[3]",
+	"RSVD_SGPIO_O_CRC[4]",
+	"RSVD_SGPIO_IN_CRC[4]",
+	"RSVD_SGPIO_O_CRC[3]",
+	"RSVD_SGPIO_IN_CRC[5]",
+	"RSVD_SGPIO_O_CRC[2]",
+	"RSVD_SGPIO_IN_CRC[6]",
+	"RSVD_SGPIO_O_CRC[1]",
+	"RSVD_SGPIO_IN_CRC[7]",
+	"RSVD_SGPIO_O_CRC[0]";
+};
+
+// EMMC group that excludes WP pin
+&pinctrl {
+	pinctrl_emmcg5_default: emmcg5_default {
+		function = "EMMC";
+		groups = "EMMCG5";
+	};
+};
+
+/ {
+	model = "AST2600 GB200NVL BMC";
+	compatible = "nvidia,gb200nvl-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial2 = &uart3;
+		serial4 = &uart5;
+		i2c16   = &imux16;
+		i2c17   = &imux17;
+		i2c18   = &imux18;
+		i2c19   = &imux19;
+		i2c20   = &imux20;
+		i2c21   = &imux21;
+		i2c22   = &imux22;
+		i2c23   = &imux23;
+		i2c24   = &imux24;
+		i2c25   = &imux25;
+		i2c26   = &imux26;
+		i2c27   = &imux27;
+		i2c28   = &imux28;
+		i2c29   = &imux29;
+		i2c30   = &imux30;
+		i2c31   = &imux31;
+		i2c32   = &imux32;
+		i2c33   = &imux33;
+		i2c34   = &imux34;
+		i2c35   = &imux35;
+		i2c36   = &imux36;
+		i2c37   = &imux37;
+		i2c38   = &imux38;
+		i2c39   = &imux39;
+		i2c40	= &e1si2c0;
+		i2c41	= &e1si2c1;
+		i2c42	= &e1si2c2;
+		i2c43	= &e1si2c3;
+		i2c44	= &e1si2c4;
+		i2c45	= &e1si2c5;
+		i2c46	= &e1si2c6;
+		i2c47	= &e1si2c7;
+		i2c48	= &i2c5mux0;
+		i2c49   = &m2riser;
+		i2c50	= &i2c5mux2;
+		i2c51	= &i2c5mux3;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=tty0 console=ttyS4,115200n8 earlyprintk";
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
+		vga_memory: framebuffer@9f000000 {
+			no-map;
+			reg = <0x9f000000 0x01000000>; /* 16M */
+		};
+
+		ramoops@a0000000 {
+			compatible = "ramoops";
+			reg = <0xa0000000 0x100000>; /* 1MB */
+			record-size = <0x10000>; /* 64KB */
+			max-reason = <2>; /* KMSG_DUMP_OOPS */
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
+	power-gpios{
+		n2-gpios = <&gpio0 ASPEED_GPIO(N, 2) (GPIO_ACTIVE_HIGH|GPIO_PULL_UP)>;
+		n3-gpios = <&gpio0 ASPEED_GPIO(N, 3) (GPIO_ACTIVE_HIGH|GPIO_PULL_UP)>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		uid_led {
+			gpios = <&sgpiom0 27 GPIO_ACTIVE_LOW>;
+		};
+		fault_led {
+			gpios = <&sgpiom0 29 GPIO_ACTIVE_LOW>;
+		};
+		power_led {
+			gpios = <&sgpiom0 31 GPIO_ACTIVE_LOW>;
+		};
+
+		// Non-LEDs:
+		//   BMC_READY-O GPIO pin (not an LED) is being bound to the GPIO LED driver.
+		// Notes:
+		// * This is a workaround and leverages the GPIO LED driver to enable control of
+		//   reset tolerance and still allow the GPIO to be controlled from user space.
+		// * The standard Linux GPIO driver allows control of reset tolerance, however
+		//   does not expose user space APIs for user space control of the GPIO pin.
+		// * GPIO_TRANSITORY = reset tolerance is disabled
+		// * Any non-leds should be added below this line.
+		bmc_ready_noled {
+			gpios = <&gpio0 ASPEED_GPIO(Z, 0) (GPIO_ACTIVE_HIGH|GPIO_TRANSITORY)>;
+		};
+	};
+
+	buttons {
+		power-btn {
+			gpio = <&sgpiom0 156 GPIO_ACTIVE_LOW>;
+		};
+		uid-btn {
+			gpio = <&sgpiom0 154 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+// Enabled Primary flash on FMC for bring up activity
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		compatible = "jedec,spi-nor";
+		label = "bmc";
+		spi-max-frequency = <50000000>;
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			u-boot@0 {
+				reg = <0x0 0xe0000>; // 896KB
+				label = "u-boot";
+			};
+
+			kernel@100000 {
+				reg = <0x100000 0x900000>; // 9MB
+				label = "kernel";
+			};
+
+			rofs@a00000 {
+				reg = <0xa00000 0x35FF000>; // 55292KB (extends to end of 64MB SPI - 4KB)
+				label = "rofs";
+			};
+		};
+	};
+};
+
+&fmcraw {
+	status = "okay";
+	spidev@0 {
+		compatible = "hgx,glacier";
+		status = "okay";
+	};
+};
+
+&spi1raw {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
+	spidev@0 {
+		spi-max-frequency = <25000000>;
+		compatible = "hgx,glacier";
+		status = "okay";
+	};
+};
+
+&spi2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi2_default>;
+
+	// Data SPI is 64MB in size
+	flash@0 {
+		status = "okay";
+		label = "config";
+		spi-max-frequency = <50000000>;
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			u-boot-env@0 {
+				reg = <0x0 0x40000>;            // 256KB at offset 0
+				label = "u-boot-env";
+			};
+
+			rwfs@40000 {
+				reg = <0x40000 0x1000000>;      // 16MB at offset 0x40000
+				label = "rwfs";
+			};
+
+			log@0x1040000 {
+				reg = <0x1040000 0x2800000>;    // 40MB at offset 0x1040000
+				label = "log";                  // Move log to EMMC, make this unused
+			};
+		};
+	};
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart3 {
+	//Enabling SOL
+	status = "okay";
+};
+
+&uart5 {
+	// BMC Debug Console
+	status = "okay";
+};
+
+&uart_routing {
+	status = "okay";
+};
+
+// MAC1 (per schematics, 1-based MAC1-MAC4) of AST2600 connected to external PHY
+// This is "mac0" in zero-based DTS
+&mdio0 {
+	status = "okay";
+	ethphy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+
+};
+
+&mdio3 {
+	status = "okay";
+	ethphy3: ethernet-phy@2 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <2>;
+	};
+};
+
+&mac0 {
+	status = "okay";
+	pinctrl-names = "default";
+	phy-mode = "rgmii-rxid";
+	max-speed = <1000>;
+	phy-handle = <&ethphy3>;
+	pinctrl-0 = <&pinctrl_rgmii1_default>;
+};
+
+&mac2 {
+	status = "okay";
+	phy-mode = "rmii";
+	use-ncsi;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii3_default>;
+};
+
+// Enable emmc
+&emmc_controller {
+	status = "okay";
+};
+
+&emmc {
+	non-removable;
+	pinctrl-0 = <&pinctrl_emmcg5_default>;
+	bus-width = <4>;
+	max-frequency = <52000000>;
+	clk-phase-mmc-hs200 = <9>, <225>;
+};
+
+/*
+* Enable USB port A as device (via the virtual hub) to host
+*/
+&vhub {
+	status = "okay";
+	pinctrl-names = "default";
+	/*
+	Uncomment below line to enable internal EHCI controller
+	Current config uses xHCI Port1
+	*/
+	// pinctrl-0 = <&pinctrl_usb2adp_default>;
+};
+
+&video {
+	status = "okay";
+	memory-region = <&video_engine_memory>;
+};
+
+// USB 2.0 to HMC, on USB Port B
+&ehci1 {
+	status = "okay";
+};
+
+// USB 1.0
+&uhci {
+	status = "okay";
+};
+
+// I2C1, SSIF IPMI interface
+&i2c0 {
+	status = "okay";
+	clock-frequency = <400000>;
+	disable-master = <1>;
+	i2c-tck-thddat-config = <0x0099EC00>;
+	ssif-bmc@10 {
+		compatible = "ssif-bmc";
+		alert-gpio = <&sgpiom0 39 GPIO_ACTIVE_LOW>;
+		pulse_width_us = <5>;
+		timeout_ms = <4995>;
+		reg = <0x10>;
+	};
+};
+
+// I2C2
+// BMC_I2C1_FPGA - Secondary FPGA
+// HMC EROT
+&i2c1 {
+	status = "okay";
+	clock-frequency = <400000>;
+	multi-master;
+	i2c-scl-clk-low-timeout-us = <32000>;
+	i2c-tck-thddat-config = <0x0099EC00>;
+};
+
+// I2C4
+&i2c3 {
+	status = "disabled";
+};
+
+// I2C5
+// RTC Driver
+// IO Expander
+&i2c4 {
+	status = "okay";
+	clock-frequency = <400000>;
+	i2c-tck-thddat-config = <0x0099EC00>;
+	// Module 0, Expander @0x21
+	exp4: pca9555@21 {
+		compatible = "nxp,pca9555";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+
+		gpio-line-names =
+			"RTC_MUX_SEL-O",
+			"PCI_MUX_SEL-O",
+			"TPM_MUX_SEL-O",
+			"FAN_MUX-SEL-O",
+			"SGMII_MUX_SEL-O",
+			"DP_MUX_SEL-O",
+			"UPHY3_USB_SEL-O",
+			"NCSI_MUX_SEL-O",
+			"BMC_PHY_RST-O",
+			"RTC_CLR_L-O",
+			"BMC_12V_CTRL-O",
+			"PS_RUN_IO0_PG-I",
+			"",
+			"",
+			"",
+			"";
+	};
+};
+
+// I2C6
+// Module 0/1 I2C MUX x3
+&i2c5 {
+	status = "okay";
+	clock-frequency = <400000>;
+	multi-master;
+	i2c-scl-clk-low-timeout-us = <32000>;
+	i2c-tck-thddat-config = <0x0099EC00>;
+
+	i2c-switch@71 {
+		compatible = "nxp,pca9546";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x71>;
+		i2c-mux-idle-disconnect;
+
+		imux16: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		imux17: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		imux18: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		imux19: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+
+	i2c-switch@72 {
+		compatible = "nxp,pca9546";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x72>;
+		i2c-mux-idle-disconnect;
+
+		imux20: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		imux21: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		imux22: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		imux23: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+
+	i2c-switch@73 {
+		compatible = "nxp,pca9546";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x73>;
+		i2c-mux-idle-disconnect;
+
+		imux24: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		imux25: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		imux26: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		imux27: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+
+	//A MUX for a riser with a secondary M.2 installed.
+	i2c-switch@74 {
+		compatible = "nxp,pca9546";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x74>;
+		i2c-mux-idle-disconnect;
+
+		i2c5mux0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		//Optional/secondary M.2 drive slot
+		m2riser: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c5mux2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		i2c5mux3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+
+	i2c-switch@75 {
+		compatible = "nxp,pca9546";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x75>;
+		i2c-mux-idle-disconnect;
+
+		imux28: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		imux29: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		imux30: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		imux31: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+
+	i2c-switch@76 {
+		compatible = "nxp,pca9546";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x76>;
+		i2c-mux-idle-disconnect;
+
+		imux32: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		imux33: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		imux34: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		imux35: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+
+	i2c-switch@77 {
+		compatible = "nxp,pca9546";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x77>;
+		i2c-mux-idle-disconnect;
+
+		imux36: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		imux37: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		imux38: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		imux39: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+};
+
+// I2C7
+// Module 0/1 Leak Sensors
+// Module 0/1 Fan Controllers
+&i2c6 {
+	status = "okay";
+	clock-frequency = <400000>;
+	i2c-tck-thddat-config = <0x0099EC00>;
+	hsc@12 {
+		compatible = "ti,lm5066i";
+		reg = <0x12>;
+		shunt-resistor-micro-ohms = <190>;
+		status = "okay";
+	};
+	hsc@14 {
+		compatible = "ti,lm5066i";
+		reg = <0x14>;
+		shunt-resistor-micro-ohms = <190>;
+		status = "okay";
+	};
+	max31790_1 {
+		compatible = "maxim,max31790";
+		reg = <0x20>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+	max31790_2 {
+		compatible = "maxim,max31790";
+		reg = <0x23>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+	max31790_3 {
+		compatible = "maxim,max31790";
+		reg = <0x2c>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+	max31790_4 {
+		compatible = "maxim,max31790";
+		reg = <0x2f>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
+
+// I2C9
+// M.2
+&i2c8 {
+	status = "okay";
+	clock-frequency = <400000>;
+	multi-master;
+	i2c-scl-clk-low-timeout-us = <32000>;
+	i2c-tck-thddat-config = <0x0099EC00>;
+};
+
+// I2C10
+// HMC IO Expander
+// Module 0/1 IO Expanders
+&i2c9 {
+	status = "okay";
+	clock-frequency = <400000>;
+	i2c-tck-thddat-config = <0x0099EC00>;
+	// Module 0, Expander @0x20
+	exp0: pca9555@20 {
+		compatible = "nxp,pca9555";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+
+		gpio-line-names =
+		"FPGA_THERM_OVERT_L-I",
+		"FPGA_READY_BMC-I",
+		"HMC_BMC_DETECT-O",
+		"HMC_PGOOD-O",
+		"",
+		"BMC_STBY_CYCLE-O",
+		"FPGA_EROT_FATAL_ERROR_L-I",
+		"WP_HW_EXT_CTRL_L-O",
+		"EROT_FPGA_RST_L-O",
+		"FPGA_EROT_RECOVERY_L-O",
+		"BMC_EROT_FPGA_SPI_MUX_SEL-O",
+		"USB_HUB_RESET_L-O",
+		"NCSI_CS1_SEL-O",
+		"SGPIO_EN_L-O",
+		"B2B_IOEXP_INT_L-I",
+		"I2C_BUS_MUX_RESET_L-O";
+	};
+
+	// Module 1, Expander @0x21
+	exp1: pca9555@21 {
+		compatible = "nxp,pca9555";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+
+		gpio-line-names =
+		"SEC_FPGA_THERM_OVERT_L-I",
+		"SEC_FPGA_READY_BMC-I",
+		"",
+		"",
+		"",
+		"",
+		"SEC_FPGA_EROT_FATAL_ERROR_L-I",
+		"SEC_WP_HW_EXT_CTRL_L-O",
+		"SEC_EROT_FPGA_RST_L-O",
+		"SEC_FPGA_EROT_RECOVERY_L-O",
+		"SEC_BMC_EROT_FPGA_SPI_MUX_SEL-O",
+		"",
+		"",
+		"",
+		"",
+		"SEC_I2C_BUS_MUX_RESET_L-O";
+	};
+
+	// HMC Expander @0x27
+	exp2: pca9555@27 {
+		compatible = "nxp,pca9555";
+		reg = <0x27>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+
+		gpio-line-names =
+		"HMC_PRSNT_L-I",
+		"HMC_READY-I",
+		"HMC_EROT_FATAL_ERROR_L-I",
+		"I2C_MUX_SEL-O",
+		"HMC_EROT_SPI_MUX_SEL-O",
+		"HMC_EROT_RECOVERY_L-O",
+		"HMC_EROT_RST_L-O",
+		"GLOBAL_WP_HMC-O",
+		"FPGA_RST_L-O",
+		"USB2_HUB_RST-O",
+		"CPU_UART_MUX_SEL-O",
+		"",
+		"",
+		"",
+		"",
+		"";
+	};
+	// HMC Expander @0x74
+	exp3: pca9555@74 {
+		compatible = "nxp,pca9555";
+		reg = <0x74>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+
+		gpio-line-names =
+		"IOB_PRSNT_L",
+		"IOB_DP_HPD",
+		"IOX_BMC_RESET",
+		"IOB_IOEXP_INT_L",
+		"IOB_UID_LED_L",
+		"IOB_UID_BTN_L",
+		"IOB_SYS_RST_BTN_L",
+		"IOB_PWR_LED_L",
+		"IOB_PWR_BTN_L",
+		"IOB_PHY_RST",
+		"CPLD_JTAG_MUX_SEL",
+		"",
+		"",
+		"",
+		"",
+		"";
+	};
+};
+
+// I2C11
+// BMC FRU EEPROM
+// BMC Temp Sensor
+&i2c10 {
+	status = "okay";
+	clock-frequency = <400000>;
+	i2c-tck-thddat-config = <0x0099EC00>;
+	// BMC FRU EEPROM - 256 bytes
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+		pagesize = <8>;
+	};
+};
+
+// I2C12
+&i2c11 {
+	status = "disabled";
+};
+
+// I2C13
+&i2c12 {
+	status = "disabled";
+};
+
+// I2C14
+// Module 0 UPHY3 SMBus
+&i2c13 {
+	status = "disabled";
+};
+
+// I2C15
+// Module 1 UPHY3 SMBus
+&i2c14 {
+	status = "okay";
+	clock-frequency = <100000>;
+	multi-master;
+	i2c-scl-clk-low-timeout-us = <32000>;
+	i2c-tck-thddat-config = <0x00EFD000>;
+
+	//E1.S drive slot 0-3
+	i2c-switch@77 {
+		compatible = "nxp,pca9546";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x77>;
+		i2c-mux-idle-disconnect;
+
+		e1si2c0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		e1si2c1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		e1si2c2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		e1si2c3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+};
+
+// I2C16
+&i2c15 {
+	status = "okay";
+	clock-frequency = <100000>;
+	multi-master;
+	i2c-scl-clk-low-timeout-us = <32000>;
+	i2c-tck-thddat-config = <0x00EFD000>;
+
+	//E1.S drive slot 4-7
+	i2c-switch@77 {
+		compatible = "nxp,pca9546";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x77>;
+		i2c-mux-idle-disconnect;
+
+		e1si2c4: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		e1si2c5: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		e1si2c6: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		e1si2c7: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+};
+
+// PCIe RC
+&pcie {
+	status = "okay";
+
+	interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
+
+	pcie_intc0: legacy-interrupt-controller {
+		interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
+	};
+};
+
+// Bridge between AHB bus and PCIe RC.
+&h2x {
+	status = "okay";
+};
+
+&mctp {
+	status = "okay";
+};
+
+&jtag0 {
+	status = "okay";
+};
+
+&jtag1 {
+	mux-gpios = <&sgpiom0 41 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>;
+	status = "okay";
+};
+
+&rng {
+	status = "okay";
+};
+
-- 
2.25.1

