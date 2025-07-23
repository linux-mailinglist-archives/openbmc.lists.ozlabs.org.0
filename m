Return-Path: <openbmc+bounces-399-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1D0B0FCB0
	for <lists+openbmc@lfdr.de>; Thu, 24 Jul 2025 00:25:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bnTFz6bc9z30Vf;
	Thu, 24 Jul 2025 08:24:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2418::60a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753309479;
	cv=pass; b=aiF+nNhDs5JhaBgn8rjb+RywwmTAliFxOP9c3pIBiYXaM/5iC3Q6m48AnkkJqX84A40gNXhJKSfxiyPP7kwb0eh2iEJ8tT4LSaXtYdup2VCuo0dFoOJ+f+ItUdX4PuWcM+5fA2paUJ4CczN0GjuhX+lDikimJEt+GAIM2fHBM0Kmp6FCfMkzeLfeDfW5miUinEmhlUx0pbNHv0HLontS5nAFIk93xwZc0aVW1xOiBPUEkUGK/xKyjc3C3+gKtS6c6QL7ffO+2Ic2K56Tp+kk8AY9CIFH/Ume1z5QuTfaBsnPPYI/Uo/MjHk4fAnINh0YlTp++OLyJIEqNPPo1qMFkg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753309479; c=relaxed/relaxed;
	bh=3nwdzMJOILOPT1RRvxKjJmQgHf4bBDlqc/PDekcOiIU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gq2ehi/P6oPl+S4GR+H89lpuQUm2L7BMNQROcPIclTudNbkfcBQI4/nD7a6raV3SApOEuxJ3pT3MvMRKhAZc1Ud/7qSvy4CiIuzWUwAIqLk6fVflreFjeyx5+TRLjeTwshp22qnXdsBt/AIS3eaGDv1PCr7XFmPSVFJEDfLx8U7L4eIFFdFZX6VauHoxwhK5E/27/JFAx8b5/GaP5SJn9u/qEVUVLOfjqO5VeD44aLKvsgsz+bH4UbN+9rJwU3xsdqYszphcexPfftYXVaG0NWW4lhT8WNcXYwVZIJbVhgysX4OVTFvka5NKTt4pm3kJ+riKT96bnxT/aDm/U53Mjg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GvLCYZ+i; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2418::60a; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GvLCYZ+i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2418::60a; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::60a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bnTFy64KPz2xd6;
	Thu, 24 Jul 2025 08:24:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u8HDtSet+ivVUEpv1HxkQAFF/vY/zwhMBm/V9fVFRgv79ULO2wRot5xvx6POcGChNSR/9V0y8lZ4XTmmRxzPOQFd7We6y2F0QxUFyMxFjm+lArBDfr+sm+O6sFzBkgQzpUo8yvkY1pJdAbdwDMurM1RRdScLGwvR9s1z852vc9c4wlpr3Tw+do1IZts67fFkhJpCQ3oSPmV9Hka7jEVAOmVPBlubyidtEAsz4PQjxVnubm+h58ymwwRb60QLo3jTaH8SF2JZMwtA3CyzLME2d6kCW+A3CpKHpFJycEoJJZVkqUs1Be+U8rcovjJhsUdzzHHG12C8BRRzhUvlJIZ+jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3nwdzMJOILOPT1RRvxKjJmQgHf4bBDlqc/PDekcOiIU=;
 b=QR60vbqGjcfXyIxKsBbmGN4vPNBU8fk59M/2/5yJ6M3ir8olN5QjCxZSJo0zjYKzm/27LLMLNWLTaZOtgWBe9n0IlZ5aEgJ8ZKhsJYX95ws0jkY+llqUoZlwGSZqIfpAk8bRFBiNTGpfN/ZeB74XKrZEdPt/QmdAW+U037A3ZB+HhhPiwoupmvB54ovNttwFi1Q+bT9fj8G91v2x7h4cWmNd7hQ9LUkgqRo//hf4RBeO10pxSu19bcwa6iznkT+O0ch1zwdo7LE9ux3PC3Aw+odqnapKmK42D8c6ua1x8RSZlZFfYUIWfDN5n1GnK5tCVoxST3b6GfjY5UPtlYgHCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3nwdzMJOILOPT1RRvxKjJmQgHf4bBDlqc/PDekcOiIU=;
 b=GvLCYZ+iCafyeH5Cro+MKHSg7E/6SjQzjwRDdPzWlP7n5flpLL4VtRQyDf/Vu7u07YyKhH0HMeU14io0LwrGCWY0ydfwzT2bL7DnbXfstJZqcBH4U9h0ftMvBSODUGEN2/FDKuGMDIyGwJxmFbh9O+jfYrKBh+5mRJGBNg2/1s61Q/xMXKH5c0FRHFaC+OoLRP4MaSKDYwDfLwgpPdbDin9BMoaEiJBogskcCPJ8OvSv1lwNOMX07sDiBAgz/ZBcY1Mz21O1c8e7WjBJT98D+WVyK7wedonqjeGDT6AOn0kB+jVuCtA9rBy4o/gFMc0ElwnxwLoGiY+w3LyXVr7Rsw==
Received: from MW4PR04CA0148.namprd04.prod.outlook.com (2603:10b6:303:84::33)
 by SJ2PR12MB8925.namprd12.prod.outlook.com (2603:10b6:a03:542::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 22:24:08 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:303:84:cafe::f9) by MW4PR04CA0148.outlook.office365.com
 (2603:10b6:303:84::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Wed,
 23 Jul 2025 22:24:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 22:24:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 23 Jul
 2025 15:23:54 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 23 Jul
 2025 15:23:54 -0700
Received: from dondevbox.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 23 Jul 2025 15:23:54 -0700
From: Donald Shannon <donalds@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, Donald Shannon <donalds@nvidia.com>
Subject: [PATCH v7 2/2] ARM: dts: aspeed: Add NVIDIA GB200 UT3.0b board
Date: Wed, 23 Jul 2025 15:23:50 -0700
Message-ID: <20250723222350.200094-3-donalds@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250723222350.200094-1-donalds@nvidia.com>
References: <20250723222350.200094-1-donalds@nvidia.com>
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
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|SJ2PR12MB8925:EE_
X-MS-Office365-Filtering-Correlation-Id: 9447000c-aacb-4673-d609-08ddca37a466
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|7416014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8WhVRuYCC1dXw6eek7yb75Dgatv8Pz5w7Qku/VWQZtSZUMAQ4cRmQUnunuEk?=
 =?us-ascii?Q?2JznUwjn0rXCIDFALdcFQHuLfnqeacR1gq/bIeW6ASl+mn0Djwtyc2HfCdqq?=
 =?us-ascii?Q?GTGCztLucjVnN5SlOOXh2vSppZWxA+qeo1vyb+XULs7gxOeMgT2V7qLweuIB?=
 =?us-ascii?Q?Tk5Gu2mlhvncphR+OiV4GvEYRsEHNx0MonJk0OegLEEWI13BYsrjt97+y6Kc?=
 =?us-ascii?Q?J8+7kekzv/nBPsHTNeNqfBB8WDVyuMWfWQa/a/yuBvf4RtooYplJlfj1vSBM?=
 =?us-ascii?Q?ToeKTrdvEC22nC6FDctNA7+knfRvK/G7LNhoHLr8B8HK1O34V6+xqFbWfulL?=
 =?us-ascii?Q?8/01L76XzFspUI6r3RpcskYsjT/547hXYZZd0HFEugJd8sZ/pon5CVGTnGPm?=
 =?us-ascii?Q?+ObHebXr6unoXJ/jP2zfnfNRmRRyu0XOBWpPQCwksoRtxxJjLi02cnb0B9HB?=
 =?us-ascii?Q?i2TsdxTSvFdH38HHi/54yvl+BO8xCDUgBNALGKrD6qEOtVLcs/ioDf0oukj2?=
 =?us-ascii?Q?7BoF2MZfvn2mjmXmBX/e2uadAX32Lsz+AnsKKkutzoz20piF3R9cnN3IBBvN?=
 =?us-ascii?Q?vVH1mH+MzXEnYURLDREE9RBsNMrvSHFolbMZ3Wt1DsTanFGcwOBD1Nc9Edpt?=
 =?us-ascii?Q?T2A8WF2+wTeon5jDY861Mr/9n7x/4S36exQMAyJAKw0uBM6Q0vSX3tXeBmGa?=
 =?us-ascii?Q?9KJjDDhpzFH++81y9L434szsN89bpGfDCqCgI6J8C+52srbfOP0L/YB6lxuT?=
 =?us-ascii?Q?KzSX4cOs6DztnYAI/5hvD+iZNY01aZOvAuQs8G4saItugDejLRT4HQ6ePC/R?=
 =?us-ascii?Q?a9mb9NTUEIUwTFT4NJMugFua6ZEDZbo6v8Q0Qo6RXoUXBTMb3YSG2KzzxFoL?=
 =?us-ascii?Q?qtImF3NN3YN17/xi9s03rONuAsovnEUoyIlFAUQOhYmFMpcggcSY1rJqqmGC?=
 =?us-ascii?Q?DMcePWm6tD6gYvhGshMm82aXjGWRH3+I12zoDH+LX9rMfUtLaCuvBenLqySn?=
 =?us-ascii?Q?sjZ1ahOZW4rpbZBKvkaiwfy9m/r4yovbBVSvwuhf/O2j1CmZEXzC+vPSh0mx?=
 =?us-ascii?Q?vHDP8o+RT31WjVVC8/neRO00mOqFgEG/VZEOezFEnVkM7DMovr+SyE35+Bk+?=
 =?us-ascii?Q?kDgYe+xsXIXKYaDoAoc/6r1Sp5a3IO633ltGMr9ndzyKrexYOnalWdSi9ObW?=
 =?us-ascii?Q?EAqQBR8jTcLC8PvD98XoOMJXeevzqWlTBUaCL8byU+O93/2FZNftN4UKVk/G?=
 =?us-ascii?Q?AnbJdssLeZemIXIz6Ces9JgHR7IAbsciXFcjbKOYi0EvwKzxKs6VjeHNCLVC?=
 =?us-ascii?Q?wIQtmnnoc/A1t1DpGo4njUjLUxgOMq+q1KxlOw+qhi1morbjnTpJgmrTiIB8?=
 =?us-ascii?Q?kb+8NB7uYR2f32sEsJ3r3qntsJt6axjDV0Z5Vvyz/of/ACHKB063yYmBgWE3?=
 =?us-ascii?Q?MbTVD8lAEwmS1jDkd7zuX8ym1IuvHmB/W6gq7v5DBzVd6uZd5Hhjk/U6TG5k?=
 =?us-ascii?Q?Yt73ZYeCOjQcFHeclVBi4yK+BWRtuqPCU21z?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(7416014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 22:24:08.5636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9447000c-aacb-4673-d609-08ddca37a466
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8925
X-Spam-Status: No, score=-3.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS,WEIRD_QUOTING autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is an Aspeed AST2600 based unit testing platform for GB200.
UT3.0b is different than nvidia-gb200nvl-bmc due to networking topology
differences, additional gpio expanders, and voltage regulator gating
some devices.

Reference to Ast2600 SOC [1].
Reference to Blackwell GB200NVL Platform [2].

Link: https://www.aspeedtech.com/server_ast2600/ [1]
Link: https://nvdam.widen.net/s/wwnsxrhm2w/blackwell-datasheet-3384703 [2]
Signed-off-by: Donald Shannon <donalds@nvidia.com>
---
Changes v1 -> v2:
  - Changed phy-mode to rgmii-id [Lunn]
  - Removed redundant max-speed for mac0 [Lunn]
  - Fixed typo from gb200nvl to gb200 in Makefile
Changes v2 -> v3:
 - Fixed whitespace issues [Krzysztof]
 - Fixed schema validation issues from my end ( there are still issues
 with the aspeed dtsi file that are not related to this new dts)
 [Herring]
 - Reordered to follow style guide [Krzysztof]
 - Removed redundant status okays
 - Changed vcc to vdd for the power gating on the gpio expanders
Changes v3 -> v4:
  - Added changelog [Krzysztof]
  - Added nvidia,gb200-ut30b board binding [Krzysztof]
  - Removed unused imports
  - Reordered a couple other style guide violations
  - Added back in a couple needed "status okay"s
Changes v4 -> v5:
 - Resumed my patch after a pause
 - Don't plan to make this include of nvidia-gb200nvl-bmc due to some
 platform differences
 - Fixed io expanders that weren't gated by the 3.3V standby regulator
 - Fixed incorrect interrupt pin for one IO expander
 - Removed some IO expanders and I2C busses
Changes v5 -> v6:
 - Fixed subject line
 - Added missing gpio-key compatible type to buttons
Changes v6 -> v7:
  - Removed Acked-by Krzysztof
---
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-nvidia-gb200-ut30b.dts  | 1028 +++++++++++++++++
 2 files changed, 1029 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index aba7451ab749..37edc4625a9f 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -51,6 +51,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-lenovo-hr630.dtb \
 	aspeed-bmc-lenovo-hr855xg2.dtb \
 	aspeed-bmc-microsoft-olympus.dtb \
+	aspeed-bmc-nvidia-gb200-ut30b.dtb \
 	aspeed-bmc-nvidia-gb200nvl-bmc.dtb \
 	aspeed-bmc-opp-lanyang.dtb \
 	aspeed-bmc-opp-mowgli.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dts
new file mode 100644
index 000000000000..e0714ad796df
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dts
@@ -0,0 +1,1028 @@
+// SPDX-License-Identifier: GPL-2.0+
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	model = "AST2600 GB200 UT3.0b BMC";
+	compatible = "nvidia,gb200-ut30b", "aspeed,ast2600";
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
+		i2c48	= &i2c17mux0;
+		i2c49	= &i2c17mux1;
+		i2c50	= &i2c17mux2;
+		i2c51	= &i2c17mux3;
+		i2c52	= &i2c25mux0;
+		i2c53	= &i2c25mux1;
+		i2c54	= &i2c25mux2;
+		i2c55	= &i2c25mux3;
+		i2c56	= &i2c29mux0;
+		i2c57	= &i2c29mux1;
+		i2c58	= &i2c29mux2;
+		i2c59	= &i2c29mux3;
+	};
+
+	buttons {
+		compatible = "gpio-keys";
+		button-power {
+			label = "power-btn";
+			gpio = <&sgpiom0 156 GPIO_ACTIVE_LOW>;
+		};
+		button-uid {
+			label = "uid-btn";
+			gpio = <&sgpiom0 154 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		led-0 {
+			label = "uid_led";
+			gpios = <&sgpiom0 27 GPIO_ACTIVE_LOW>;
+		};
+		led-1 {
+			label = "fault_led";
+			gpios = <&sgpiom0 29 GPIO_ACTIVE_LOW>;
+		};
+		led-2 {
+			label = "power_led";
+			gpios = <&sgpiom0 31 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x80000000>;
+	};
+
+	reg_3v3_stby: regulator-3v3-standby {
+		compatible = "regulator-fixed";
+		regulator-name = "3v3-standby";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&gpio0 ASPEED_GPIO(M, 3) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
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
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0x01000000>;
+			alignment = <0x01000000>;
+		};
+
+		video_engine_memory: jpegbuffer {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0x02000000>;	/* 32M */
+			alignment = <0x01000000>;
+		};
+	};
+};
+
+// Enable Primary flash on FMC for bring up activity
+&fmc {
+	status = "okay";
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		label = "bmc";
+		spi-max-frequency = <50000000>;
+		status = "okay";
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			u-boot@0 {
+				// 896KB
+				reg = <0x0 0xe0000>;
+				label = "u-boot";
+			};
+
+			kernel@100000 {
+				// 9MB
+				reg = <0x100000 0x900000>;
+				label = "kernel";
+			};
+
+			rofs@a00000 {
+				// 55292KB (extends to end of 64MB SPI - 4KB)
+				reg = <0xa00000 0x35FF000>;
+				label = "rofs";
+			};
+		};
+	};
+};
+
+&spi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi2_default>;
+	status = "okay";
+	// Data SPI is 64MB in size
+	flash@0 {
+		label = "config";
+		spi-max-frequency = <50000000>;
+		status = "okay";
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			u-boot-env@0 {
+				// 256KB
+				reg = <0x0 0x40000>;
+				label = "u-boot-env";
+			};
+
+			rwfs@40000 {
+				// 16MB
+				reg = <0x40000 0x1000000>;
+				label = "rwfs";
+			};
+
+			log@1040000 {
+				// 40MB
+				reg = <0x1040000 0x2800000>;
+				label = "log";
+			};
+		};
+	};
+};
+
+&mdio0 {
+	status = "okay";
+	ethphy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&mac0 {
+	pinctrl-names = "default";
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy0>;
+	pinctrl-0 = <&pinctrl_rgmii1_default>;
+	status = "okay";
+};
+
+// USB Port B Controller
+&ehci1 {
+	status = "okay";
+};
+
+// USB Port B Controller
+&uhci {
+	status = "okay";
+};
+
+// USB port A vhub
+&vhub {
+	status = "okay";
+};
+
+&rng {
+	status = "okay";
+};
+
+&video {
+	memory-region = <&video_engine_memory>;
+	status = "okay";
+};
+
+&gpio0 {
+	gpio-line-names =
+		/*A0-A7*/ "", "", "", "", "", "", "", "",
+		/*B0-B7*/ "", "", "", "", "", "", "", "",
+		/*C0-C7*/ "SGPIO_I2C_MUX_SEL-O", "", "", "", "", "", "", "",
+		/*D0-D7*/ "", "", "", "UART1_MUX_SEL-O", "", "FPGA_PEX_RST_L-O", "", "",
+		/*E0-E7*/ "RTL8221_PHY_RST_L-O", "RTL8211_PHY_INT_L-I",	"", "UART3_MUX_SEL-O",
+					"", "", "", "SGPIO_BMC_EN-O",
+		/*F0-F7*/ "", "", "", "", "", "", "", "",
+		/*G0-G7*/ "", "", "", "", "", "", "", "",
+		/*H0-H7*/ "", "", "", "", "", "", "", "",
+		/*I0-I7*/ "", "", "", "", "", "QSPI2_RST_L-O", "GLOBAL_WP_BMC-O", "BMC_DDR4_TEN-O",
+		/*J0-J7*/ "", "", "", "", "", "", "", "",
+		/*K0-K7*/ "", "", "", "", "", "", "", "",
+		/*L0-L7*/ "", "", "", "", "", "", "", "",
+		/*M0-M7*/ "PCIE_EP_RST_EN-O", "BMC_FRU_WP-O", "FPGA_RST_L-O", "STBY_POWER_EN-O",
+					"STBY_POWER_PG-I", "PCIE_EP_RST_L-O", "", "",
+		/*N0-N7*/ "", "", "", "", "", "", "", "",
+		/*O0-O7*/ "", "", "", "", "", "", "", "",
+		/*P0-P7*/ "", "", "", "", "", "", "", "",
+		/*Q0-Q7*/ "", "", "", "", "", "", "", "",
+		/*R0-R7*/ "", "", "", "", "", "", "", "",
+		/*S0-S7*/ "", "", "", "", "", "", "", "",
+		/*T0-T7*/ "", "", "", "", "", "", "", "",
+		/*U0-U7*/ "", "", "", "", "", "", "", "",
+		/*V0-V7*/ "AP_EROT_REQ-O", "EROT_AP_GNT-I", "", "","PCB_TEMP_ALERT-I", "","", "",
+		/*W0-W7*/ "", "", "", "", "", "", "", "",
+		/*X0-X7*/ "", "", "TPM_MUX_SEL-O", "", "", "", "", "",
+		/*Y0-Y7*/ "", "", "", "EMMC_RST-O", "","", "", "",
+		/*Z0-Z7*/ "BMC_READY-O","", "", "", "", "", "", "";
+};
+
+&gpio1 {
+	/* 36 1.8V GPIOs */
+	gpio-line-names =
+		/*A0-A7*/ "", "", "", "", "", "", "", "",
+		/*B0-B7*/ "", "", "", "", "", "", "IO_EXPANDER_INT_L-I","",
+		/*C0-C7*/ "", "", "", "", "", "", "", "",
+		/*D0-D7*/ "", "", "", "", "", "", "SPI_HOST_TPM_RST_L-O", "SPI_BMC_FPGA_INT_L-I",
+		/*E0-E7*/ "", "", "", "", "", "", "", "";
+};
+
+&sgpiom0 {
+	ngpios = <128>;
+	status = "okay";
+	gpio-line-names =
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"RUN_POWER_FAULT_L-I","SYS_RST_IN_L-O",
+		"RUN_POWER_PG-I","PWR_BRAKE_L-O",
+		"SYS_RST_OUT_L-I","RUN_POWER_EN-O",
+		"L0L1_RST_REQ_OUT_L-I","SHDN_FORCE_L-O",
+		"L2_RST_REQ_OUT_L-I","SHDN_REQ_L-O",
+		"SHDN_OK_L-I","UID_LED_N-O",
+		"BMC_I2C1_FPGA_ALERT_L-I","SYS_FAULT_LED_N-O",
+		"BMC_I2C0_FPGA_ALERT_L-I","PWR_LED_N-O",
+		"FPGA_RSVD_FFU3-I","",
+		"FPGA_RSVD_FFU2-I","",
+		"FPGA_RSVD_FFU1-I","",
+		"FPGA_RSVD_FFU0-I","BMC_I2C_SSIF_ALERT_L-O",
+		"CPU_BOOT_DONE-I","JTAG_MUX_SELECT-O",
+		"SPI_BMC_FPGA_INT_L-I","RTC_CLR_L-O",
+		"THERM_BB_WARN_L-I","UART_MUX_SEL-O",
+		"THERM_BB_OVERT_L-I","",
+		"CPU0_UPHY3_PRSNT1_L-I","IOBRD0_RUN_POWER_EN-O",
+		"CPU0_UPHY3_PRSNT0_L-I","IOBRD1_RUN_POWER_EN-O",
+		"CPU0_UPHY2_PRSNT1_L-I","FPGA_RSVD_FFU4-O",
+		"CPU0_UPHY2_PRSNT0_L-I","FPGA_RSVD_FFU5-O",
+		"CPU0_UPHY1_PRSNT1_L-I","FPGA_RSVD_FFU6-O",
+		"CPU0_UPHY1_PRSNT0_L-I","FPGA_RSVD_FFU7-O",
+		"CPU0_UPHY0_PRSNT1_L-I","RSVD_NV_PLT_DETECT-O",
+		"CPU0_UPHY0_PRSNT0_L-I","SPI1_INT_L-O",
+		"CPU1_UPHY3_PRSNT1_L-I","",
+		"CPU1_UPHY3_PRSNT0_L-I","HMC_EROT_MUX_STATUS",
+		"CPU1_UPHY2_PRSNT1_L-I","",
+		"CPU1_UPHY2_PRSNT0_L-I","",
+		"CPU1_UPHY1_PRSNT1_L-I","",
+		"CPU1_UPHY1_PRSNT0_L-I","",
+		"CPU1_UPHY0_PRSNT1_L-I","",
+		"CPU1_UPHY0_PRSNT0_L-I","",
+		"FAN1_PRESENT_L-I","",
+		"FAN0_PRESENT_L-I","",
+		"","",
+		"IPEX_CABLE_PRSNT_L-I","",
+		"M2_1_PRSNT_L-I","",
+		"M2_0_PRSNT_L-I","",
+		"CPU1_UPHY4_PRSNT1_L-I","",
+		"CPU0_UPHY4_PRSNT0_L-I","",
+		"","",
+		"I2C_RTC_ALERT_L-I","",
+		"FAN7_PRESENT_L-I","",
+		"FAN6_PRESENT_L-I","",
+		"FAN5_PRESENT_L-I","",
+		"FAN4_PRESENT_L-I","",
+		"FAN3_PRESENT_L-I","",
+		"FAN2_PRESENT_L-I","",
+		"IOBRD0_IOX_INT_L-I","",
+		"IOBRD1_PRSNT_L-I","",
+		"IOBRD0_PRSNT_L-I","",
+		"IOBRD1_PWR_GOOD-I","",
+		"IOBRD0_PWR_GOOD-I","",
+		"","",
+		"","",
+		"FAN_FAIL_IN_L-I","",
+		"","",
+		"","",
+		"","",
+		"PDB_CABLE_PRESENT_L-I","",
+		"","",
+		"CHASSIS_PWR_BRK_L-I","",
+		"","",
+		"IOBRD1_IOX_INT_L-I","",
+		"10GBE_SMBALRT_L-I","",
+		"PCIE_WAKE_L-I","",
+		"I2C_M21_ALERT_L-I","",
+		"I2C_M20_ALERT_L-I","",
+		"TRAY_FAST_SHDN_L-I","",
+		"UID_BTN_N-I","",
+		"PWR_BTN_L-I","",
+		"PSU_SMB_ALERT_L-I","",
+		"","",
+		"","",
+		"NODE_LOC_ID[0]-I","",
+		"NODE_LOC_ID[1]-I","",
+		"NODE_LOC_ID[2]-I","",
+		"NODE_LOC_ID[3]-I","",
+		"NODE_LOC_ID[4]-I","",
+		"NODE_LOC_ID[5]-I","",
+		"FAN10_PRESENT_L-I","",
+		"FAN9_PRESENT_L-I","",
+		"FAN8_PRESENT_L-I","",
+		"FPGA1_READY_HMC-I","",
+		"DP_HPD-I","",
+		"HMC_I2C3_FPGA_ALERT_L-I","",
+		"HMC_I2C2_FPGA_ALERT_L-I","",
+		"FPGA0_READY_HMC-I","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"LEAK_DETECT_ALERT_L-I","",
+		"MOD1_B2B_CABLE_PRESENT_L-I","",
+		"MOD1_CLINK_CABLE_PRESENT_L-I","",
+		"FAN11_PRESENT_L-I","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"RSVD_SGPIO_IN_CRC[0]","RSVD_SGPIO_O_CRC[7]",
+		"RSVD_SGPIO_IN_CRC[1]","RSVD_SGPIO_O_CRC[6]",
+		"RSVD_SGPIO_IN_CRC[2]","RSVD_SGPIO_O_CRC[5]",
+		"RSVD_SGPIO_IN_CRC[3]","RSVD_SGPIO_O_CRC[4]",
+		"RSVD_SGPIO_IN_CRC[4]","RSVD_SGPIO_O_CRC[3]",
+		"RSVD_SGPIO_IN_CRC[5]","RSVD_SGPIO_O_CRC[2]",
+		"RSVD_SGPIO_IN_CRC[6]","RSVD_SGPIO_O_CRC[1]",
+		"RSVD_SGPIO_IN_CRC[7]","RSVD_SGPIO_O_CRC[0]";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+// Enabling SOL
+&uart3 {
+	status = "okay";
+};
+
+// BMC Debug Console
+&uart5 {
+	status = "okay";
+};
+
+&uart_routing { };
+
+// I2C1, SSIF IPMI interface
+&i2c0 {
+	clock-frequency = <400000>;
+	status = "okay";
+	ssif-bmc@10 {
+		compatible = "ssif-bmc";
+		reg = <0x10>;
+	};
+};
+
+// I2C3
+// BMC_I2C0_FPGA - Primary FPGA
+&i2c2 {
+	clock-frequency = <400000>;
+	multi-master;
+	status = "okay";
+};
+
+// I2C5
+// RTC Driver
+// IO Expander
+&i2c4 {
+	clock-frequency = <400000>;
+	status = "okay";
+	// Module 0, Expander @0x21
+	exp4: gpio@21 {
+		compatible = "nxp,pca9555";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&reg_3v3_stby>;
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
+	clock-frequency = <400000>;
+	multi-master;
+	status = "okay";
+
+	i2c-mux@71 {
+		compatible = "nxp,pca9546";
+		reg = <0x71>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+		vdd-supply = <&reg_3v3_stby>;
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
+
+			i2c-mux@74 {
+				compatible = "nxp,pca9546";
+				reg = <0x74>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				i2c-mux-idle-disconnect;
+				vdd-supply = <&reg_3v3_stby>;
+
+				i2c17mux0: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+
+				i2c17mux1: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+
+				i2c17mux2: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+
+				i2c17mux3: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+			};
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
+	i2c-mux@72 {
+		compatible = "nxp,pca9546";
+		reg = <0x72>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+		vdd-supply = <&reg_3v3_stby>;
+
+		imux20: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		imux21: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			gpio@20 {
+				compatible = "nxp,pca9555";
+				reg = <0x20>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				vcc-supply = <&reg_3v3_stby>;
+				gpio-line-names =
+					"RST_CX_0_L-O",
+					"RST_CX_1_L-O",
+					"CX0_SSD0_PRSNT_L-I",
+					"CX1_SSD1_PRSNT_L-I",
+					"CX_BOOT_CMPLT_CX0-I",
+					"CX_BOOT_CMPLT_CX1-I",
+					"CX_TWARN_CX0_L-I",
+					"CX_TWARN_CX1_L-I",
+					"CX_OVT_SHDN_CX0-I",
+					"CX_OVT_SHDN_CX1-I",
+					"FNP_L_CX0-O",
+					"FNP_L_CX1-O",
+					"",
+					"MCU_GPIO-I",
+					"MCU_RST_N-O",
+					"MCU_RECOVERY_N-O";
+			};
+		};
+
+		imux22: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		imux23: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	i2c-mux@73 {
+		compatible = "nxp,pca9546";
+		reg = <0x73>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+		vdd-supply = <&reg_3v3_stby>;
+
+		imux24: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		imux25: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			i2c-mux@70 {
+				compatible = "nxp,pca9546";
+				reg = <0x70>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				i2c-mux-idle-disconnect;
+				vdd-supply = <&reg_3v3_stby>;
+
+				i2c25mux0: i2c@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				i2c25mux1: i2c@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				i2c25mux2: i2c@2 {
+					reg = <2>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				i2c25mux3: i2c@3 {
+					reg = <3>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+		};
+
+		imux26: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		imux27: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	i2c-mux@75 {
+		compatible = "nxp,pca9546";
+		reg = <0x75>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+		vdd-supply = <&reg_3v3_stby>;
+
+		imux28: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		imux29: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			i2c-mux@74 {
+				compatible = "nxp,pca9546";
+				reg = <0x74>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				i2c-mux-idle-disconnect;
+				vdd-supply = <&reg_3v3_stby>;
+
+				i2c29mux0: i2c@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				i2c29mux1: i2c@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				i2c29mux2: i2c@2 {
+					reg = <2>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				i2c29mux3: i2c@3 {
+					reg = <3>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+		};
+
+		imux30: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		imux31: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	i2c-mux@76 {
+		compatible = "nxp,pca9546";
+		reg = <0x76>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+		vdd-supply = <&reg_3v3_stby>;
+
+		imux32: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		imux33: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		imux34: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		imux35: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	i2c-mux@77 {
+		compatible = "nxp,pca9546";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+		vdd-supply = <&reg_3v3_stby>;
+
+		imux36: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		imux37: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		imux38: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		imux39: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+// I2C7
+// Module 0/1 Leak Sensors
+// Module 0/1 Fan Controllers
+&i2c6 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	pmic@12 {
+		compatible = "ti,lm5066i";
+		reg = <0x12>;
+		shunt-resistor-micro-ohms = <190>;
+	};
+
+	pmic@14 {
+		compatible = "ti,lm5066i";
+		reg = <0x14>;
+		shunt-resistor-micro-ohms = <190>;
+	};
+
+	pwm@20 {
+		compatible = "maxim,max31790";
+		reg = <0x20>;
+	};
+
+	pwm@23 {
+		compatible = "maxim,max31790";
+		reg = <0x23>;
+	};
+
+	pwm@2c {
+		compatible = "maxim,max31790";
+		reg = <0x2c>;
+	};
+
+	pwm@2f {
+		compatible = "maxim,max31790";
+		reg = <0x2f>;
+	};
+};
+
+// I2C9
+// M.2
+&i2c8 {
+	clock-frequency = <400000>;
+	multi-master;
+	status = "okay";
+};
+
+// I2C10
+// Module 0/1 IO Expanders
+&i2c9 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	// Module 0, Expander @0x20
+	exp0: gpio@20 {
+		compatible = "nxp,pca9555";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&reg_3v3_stby>;
+		gpio-line-names =
+			"FPGA_THERM_OVERT_L-I",
+			"FPGA_READY_BMC-I",
+			"HMC_BMC_DETECT-O",
+			"HMC_PGOOD-O",
+			"",
+			"BMC_STBY_CYCLE-O",
+			"FPGA_EROT_FATAL_ERROR_L-I",
+			"WP_HW_EXT_CTRL_L-O",
+			"EROT_FPGA_RST_L-O",
+			"FPGA_EROT_RECOVERY_L-O",
+			"BMC_EROT_FPGA_SPI_MUX_SEL-O",
+			"USB_HUB_RESET_L-O",
+			"NCSI_CS1_SEL-O",
+			"SGPIO_EN_L-O",
+			"B2B_IOEXP_INT_L-I",
+			"I2C_BUS_MUX_RESET_L-O";
+	};
+
+	// UT3.0b Expander @0x22
+	exp2: gpio@22 {
+		compatible = "nxp,pca9555";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&reg_3v3_stby>;
+		gpio-line-names =
+			"BMC1_FANCTRL_FAIL_L-I",
+			"IOEXP_BMC_RST_12V-O",
+			"NODE_RST_STBY_H-O",
+			"",
+			"",
+			"",
+			"",
+			"",
+			"",
+			"",
+			"",
+			"",
+			"",
+			"",
+			"",
+			"";
+	};
+
+	// UT3.0b Expander @0x23
+	exp3: gpio@23 {
+		compatible = "nxp,pca9555";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&reg_3v3_stby>;
+		gpio-line-names =
+			"PEXSW_FL_SPI_MUX_SEL-O",
+			"PEX_SW_FATAL_ERROR_3V3_L-I",
+			"IOEXP_PDB_NODE_EN_L-O",
+			"NODE_PWOK_ISO-I",
+			"BMC_FAN_PWR_EN-O",
+			"BMC_ETHERNET_INT-I",
+			"BMC_ENET_RST-O",
+			"IOEXP_BMC_RST_SENSE-O",
+			"BMC_ID-I",
+			"TPM_MUX_3V3_SEL_N-O",
+			"IOEXP_TPM_RST_N-O",
+			"TPM_DOWN_SPI_INT_L-I",
+			"PS_BRD_PGOOD-I",
+			"FP_BUTTON_POWER_N-I",
+			"FP_BUTTON_RESET_N-I",
+			"FP_LED_POWER_GPIOEXP_N-O";
+	};
+};
+
+// I2C11
+// BMC FRU EEPROM
+// BMC Temp Sensor
+&i2c10 {
+	clock-frequency = <400000>;
+	status = "okay";
+
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
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+// I2C15
+// Module 1 UPHY3 SMBus
+&i2c14 {
+	clock-frequency = <100000>;
+	multi-master;
+	status = "okay";
+
+	//E1.S drive slot 0-3
+	i2c-mux@77 {
+		compatible = "nxp,pca9546";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+		vdd-supply = <&reg_3v3_stby>;
+
+		e1si2c0: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		e1si2c1: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		e1si2c2: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		e1si2c3: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
-- 
2.43.0


