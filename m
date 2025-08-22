Return-Path: <openbmc+bounces-508-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B46A5B323AB
	for <lists+openbmc@lfdr.de>; Fri, 22 Aug 2025 22:39:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7sVQ6dN5z3d8R;
	Sat, 23 Aug 2025 06:39:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:200a::621" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755895150;
	cv=pass; b=jCzugcD6L7aM9C2LgrqmFYvmE/hkTh4QV20i7kdDfDgK7Y5bhnwqbycP846PD4SF73gJiE5n6id9Uzown/nDB5w6RgBJvr0cw6GclY7eIZske2z7TjAePl2/j5UEb/Vagdln/HdvVT6SU+FjvRr0h2V+5PZzFVei2hA03ehyOJ74fKVT7WDXZ58BtV2goup1/XkPtU32zqdNkDqQzKYCjbV+y0ixergHM9l/EVoC84LyPOo2e6R2TP4PMuV8NaB8KIQOm+z9RGGTcrA7T+K0RPKCuTYcULC7Nb1Zatb+nosGyYYgiAC58/R5ym+IYbB4TVhuX7f5nwdvrCxxvp/Rdg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755895150; c=relaxed/relaxed;
	bh=ZpBHTYr+6Lq9jTsCVQT57AjbTDUUPLVRnBTnnVsqc0s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KLvZR5Lezi2cGOsu7BBgt8eyKsDIgGd4DfLBM3f0ZiLBTttw4SYxyO/JwxUC8H7m5SWH28XMlntnVC2SyXP44C2fbOj8+SVjnKsrjfYDYyNLsFQSE/41y0YzW3h9NYI07sRDF+egvc4ymoYuKDmv5Nw+2WKqH0kvcEw1xygOj6+mTF0VWki3GmdKy25jgDbjhQPpSAq+88+mJAJbbvT7yCsyUzXhRMTH5QQnqHVNjap1xp7NEPD5ZIHUyTwkd/hO/XAJp/20eUG1xzYKWzjjK5mtghstGVnTSinJRTuneEW8DKeeN0wX0aOFcxvFJwIw5Y8r5m+96k77lRLYiiEf9w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lLXjZK7s; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:200a::621; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lLXjZK7s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:200a::621; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20621.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::621])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7sVQ044gz3d8J;
	Sat, 23 Aug 2025 06:39:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQYPqKxzmQUcxKhWf32oESu+77h0tMZoeh5Sl+xt3b2T9TFk8Rj7UHGybr+Uevy50Zlt5vdt4prCYzehB5MvaiOPckolt8WIfh5XNcSw5ChcVBnw+rcC9v3pytxcxqZoSpbs1KzD5rUJ8GQBu8PujZK35M7b6XLGO2N2S0LRHg74xg+3jbMKYGWkTn4h+pr76LAow/swbIAuJVHntxh+s1xD8YLojAK3ZfbPCtLGSMsK+Bq8INPFeQxt0sSy7tUz1atbTpBi0dRsegc+ep6oGhXe1U+mg06unwmrKDRsAXUH2Ltp1Y2TWhyKKpGSNbQpx2mJGFaWfq3pkHSrhNhuSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpBHTYr+6Lq9jTsCVQT57AjbTDUUPLVRnBTnnVsqc0s=;
 b=CL3AGO+sjzWycdDQal6LcICBW3d4Y/qqnaUbVJp8v8zf0/NXZbEk3Nk9+xQpih2QbUwfJgEmiKe3O2j0dfMTjtzG1qITCTlszLaM/ODuxCZegZDkEvrB8yiYhq2cFrQkif82BOuDxbm/NBU1yTP18BZiE1yXNkHGHMXi8lua3kfxsBs37m7+7EBRg/R+zvbHEZ4Bkc/S9rWo7yk3iaYMSbRaRKfn0/bIb2N6h1dO9Siw4ioVh5KVbsq5UfxJRVmY3QGfi0l6G7DbMmn2SHzvjG4cHkcaSNfyD7AY0xOWIl+d2nhmwkQZ2YVmNDBLiCkiUkcboOaL/nqPx2HcKXCVcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZpBHTYr+6Lq9jTsCVQT57AjbTDUUPLVRnBTnnVsqc0s=;
 b=lLXjZK7s5OJ/zl3oy8rPeySrRlndyy/zNJd7Dt3iflE+q/Bz+LNLzaLGhrngBNhGaQ3tUbC6e8dhLBDwEeumpNfjkBO5/Ss+pMQTiSICTDRlY0QbbWO8YlFf3lCYuapiShWs1lGNDj0Sb8KLVWXfrptThnhr2ctRAisygW9cdAp9QCS+n58IuPXblinLUPsUzCuXRos/LJ+Eix6w1idB3VjCkhI8elywWa0ev9zFxvJZG9VCJa9QaFvhyM5wIXrKO/nGttEG7YZ4qMpf6rW/NZcxo5Z9tlUAj0fktHYlu8FHzenKs3tZ56nmkdku1QJAb08A405qUIm8k3BUtQ5VBg==
Received: from CH0PR03CA0026.namprd03.prod.outlook.com (2603:10b6:610:b0::31)
 by CH3PR12MB8186.namprd12.prod.outlook.com (2603:10b6:610:129::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 22 Aug
 2025 20:38:44 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::b7) by CH0PR03CA0026.outlook.office365.com
 (2603:10b6:610:b0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.19 via Frontend Transport; Fri,
 22 Aug 2025 20:38:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 20:38:44 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 22 Aug
 2025 13:38:23 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 22 Aug
 2025 13:38:22 -0700
Received: from dondevbox.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 22 Aug 2025 13:38:22 -0700
From: Donald Shannon <donalds@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<donalds@nvidia.com>
CC: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <etanous@nvidia.com>
Subject: [PATCH v2 2/2] ARM: dts: aspeed: Add NVIDIA VR144NVL board
Date: Fri, 22 Aug 2025 13:38:18 -0700
Message-ID: <20250822203818.4062595-3-donalds@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250822203818.4062595-1-donalds@nvidia.com>
References: <20250822203818.4062595-1-donalds@nvidia.com>
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
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|CH3PR12MB8186:EE_
X-MS-Office365-Filtering-Correlation-Id: 890f692b-f320-40ae-0a1e-08dde1bbe370
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FRstnX0FKT99ZPAlOsgbibA9/V2U8J8bPzkgxb23oFM3quQ5jxS8mrONVV+b?=
 =?us-ascii?Q?Xe9z/lsz/drCj6/fvu3zsJb0tUoYqBdUFIoE5wP0CCa5hifvyAXCQKDiKfVq?=
 =?us-ascii?Q?01l3dysKuzt86urr5Ok1fFWuxvX+jDkUIKUvgQJOSjwaB9TiPwUEiFAuUesV?=
 =?us-ascii?Q?5lMjBFpCInEwgrWBj3XZ3u1s17HDVaqcPVfeJJ0ghwEXP9bKtXMV0HGVkYgx?=
 =?us-ascii?Q?7eAQob/XA7yzekQgfd0XpZ21LsO6B1ojc2x5WvhSquo6I5j/rK6Ew1M6N3//?=
 =?us-ascii?Q?93GSc5Z5fWK48tTLvQ7IIRS3gq7wLTJWCHSMsSn50cxIlR6hr69FRhDXZu2u?=
 =?us-ascii?Q?KSIFLWxwepX+cdkMMAtXsgd/AuomdVRR312UT1qjIF29IX4gFYBOoQIyy3UQ?=
 =?us-ascii?Q?TYB5For/SJWmHdV1fQyP4vhyH5CKffhWtAT/PbQg9y+JtBTanXBILgqREdY1?=
 =?us-ascii?Q?tQSrv0Btx4V4os3ZhvLhvg7J80vAA2MOP7b6c54a3UdjHnewaOnkw6z/8ZPr?=
 =?us-ascii?Q?OJAQMGzFF8Z1UHktSyDTFA3wlMuqt2h1mSY+p7iwNEv64D9iy7RDO0jOGDsR?=
 =?us-ascii?Q?2JbbBvc1VWu+eJfzzbQGIsGS8Wl2f8bcFb42Q9+8hUukzGZe1+Ab+zqSyFtW?=
 =?us-ascii?Q?oxIHU6WLK57EaF/ANERbqGhJKfmPYNAuzhSzcOgZ8ODYa8q+6wRMrDtV6D+U?=
 =?us-ascii?Q?tx/mPx0XozXiBLpEEK7cth+W2c89L8D5s+1AyiIEP/qQtZ7v/p+/B4ddvxQj?=
 =?us-ascii?Q?6lrljXouqz6rSirruTjr/CmgEJbdxkEwOevieV9YIG71KoPloaQ1l9HEz1x/?=
 =?us-ascii?Q?tDqsc5jdROi73CADGq6uDyQ5mSbovsLzkZhOJkrgcLQEFt/GMbeNRz4wTGTU?=
 =?us-ascii?Q?ZRFEV8G8vqv7Trh299T0ckA4Ao8ea1IQ0vYn1hH60HOw7sdsu0RcIBbGE1qW?=
 =?us-ascii?Q?zO1wtW9750vuFabQIsnrPhk6nSwhKEBIdUbLzOA1z29nAiikuTvcGEQIzoKw?=
 =?us-ascii?Q?oRPNHSbSwRZ5WaTdjXZs3m757G+YLOg1ssSdJP2BksY6BLYf+WjiNLSSWRwj?=
 =?us-ascii?Q?CxEW3dwBb+8fSRfjegaoII5YWxIZFkxVBjwvcg0bHsQtojIMtV4UCHeUQ4Cm?=
 =?us-ascii?Q?q05Qg97ZUvmHnRpZQPs4NVfTcyYIa1EKGegZwp+9B80fdVxocOkosNtaG3IE?=
 =?us-ascii?Q?mjzyFJr53hDovL6G8h+RyLGgMWDxyscPlDtfJUlQXmxfkZeEtUtjE06b0fas?=
 =?us-ascii?Q?OOYsD4235/RXgDz2w4LYJieBbTLbxISScb+32CeRR4TS4C+ySKrz1kU9qqVd?=
 =?us-ascii?Q?tVetdncUTCV4bcYe6UaV8mFr0MNQ9/vQFLYeO+BoibU1xNaqDBAUzeipK0jX?=
 =?us-ascii?Q?3kSwLMVdrRITywytObUdeie2KMBNDtAR7VnH3YzLYlx1ezXstHxQqFF6XyMX?=
 =?us-ascii?Q?sfdRD2jmpnU7yjCJkkOqmKz4zWZ794xOXEGlLdjeZw7n7GujY5rKSB2LYqet?=
 =?us-ascii?Q?rhFDodD0gwsqRFLfi/qENeDlcGqfnrP1K8dn?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 20:38:44.5856
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 890f692b-f320-40ae-0a1e-08dde1bbe370
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8186
X-Spam-Status: No, score=-3.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS,WEIRD_QUOTING autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is an Aspeed AST2600 based BMC board for the NVIDIA VR144NVL
Platform.

Reference to Ast2600 SOC [1].
Reference to DC-SCM Spec [2].

Link: https://www.aspeedtech.com/server_ast2600/ [1]
Link: https://www.opencompute.org/w/index.php?title=Server/MHS/DC-SCM-Specs-and-Designs [2]

Signed-off-by: Donald Shannon <donalds@nvidia.com>
---
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-nvidia-vr144nvl.dts | 779 ++++++++++++++++++
 2 files changed, 780 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr144nvl.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index 8062c685f7e8..b479824c434b 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -55,6 +55,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-lenovo-hr855xg2.dtb \
 	aspeed-bmc-microsoft-olympus.dtb \
 	aspeed-bmc-nvidia-gb200nvl-bmc.dtb \
+	aspeed-bmc-nvidia-vr144nvl.dtb \
 	aspeed-bmc-opp-lanyang.dtb \
 	aspeed-bmc-opp-mowgli.dtb \
 	aspeed-bmc-opp-nicole.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr144nvl.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr144nvl.dts
new file mode 100644
index 000000000000..5984984b5109
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr144nvl.dts
@@ -0,0 +1,779 @@
+// SPDX-License-Identifier: GPL-2.0+
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "AST2600 VR144NVL BMC";
+	compatible = "nvidia,vr144nvl-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial2 = &uart3;
+		serial4 = &uart5;
+		i2c16 = &c0uphy0;
+		i2c17 = &c0uphy2;
+		i2c24 = &c1uphy0;
+		i2c25 = &c1uphy2;
+		i2c32 = &i2c_usb_hub;
+		i2c33 = &i2c_tpm;
+		i2c34 = &i2c_dp;
+		i2c35 = &i2c_rtc;
+	};
+
+	buttons {
+		compatible = "gpio-keys";
+		button-power {
+			label = "power_btn";
+			linux,code = <KEY_POWER>;
+			gpios = <&exp7 9 GPIO_ACTIVE_LOW>;
+		};
+		button-uid {
+			label = "uid_btn";
+			linux,code = <KEY_FN_1>;
+			gpios = <&exp7 11 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		hb-led {
+			gpios = <&gpio0 127 GPIO_ACTIVE_LOW>;
+			function = LED_FUNCTION_HEARTBEAT;
+			color = <LED_COLOR_ID_GREEN>;
+			label = "bmc-hbled";
+			linux,default-trigger = "heartbeat";
+			default-state = "on";
+			retain-state-suspended;
+			retain-state-shutdown;
+		};
+		pwr-led {
+			gpios = <&exp7 8 GPIO_ACTIVE_LOW>;
+			function = LED_FUNCTION_POWER;
+			color = <LED_COLOR_ID_WHITE>;
+			label = "pwr-led";
+			linux,default-trigger = "default-on";
+			default-state = "on";
+			retain-state-suspended;
+			retain-state-shutdown;
+		};
+		uid-led {
+			gpios = <&exp7 10 GPIO_ACTIVE_LOW>;
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_BLUE>;
+			label = "uid-led";
+			default-state = "off";
+			retain-state-suspended;
+			retain-state-shutdown;
+		};
+		fault-led {
+			gpios = <&exp7 12 GPIO_ACTIVE_LOW>;
+			function = LED_FUNCTION_PANIC;
+			color = <LED_COLOR_ID_WHITE>;
+			label = "fault-led";
+			default-state = "off";
+			retain-state-suspended;
+			retain-state-shutdown;
+			panic-indicator;
+		};
+		warn-led {
+			gpios = <&exp7 15 GPIO_ACTIVE_LOW>;
+			function = LED_FUNCTION_PANIC;
+			color = <LED_COLOR_ID_RED>;
+			label = "warn-led";
+			default-state = "off";
+			retain-state-suspended;
+			retain-state-shutdown;
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
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
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
+		compatible = "jedec,spi-nor";
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
+// USB Port B
+&ehci1 {
+	status = "okay";
+};
+
+// USB Port B
+&uhci {
+	status = "okay";
+};
+
+// USB port A
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
+		/*C0-C7*/ "", "", "", "", "", "", "", "",
+		/*D0-D7*/ "", "", "", "", "", "", "", "",
+		/*E0-E7*/ "RTL8221_PHY_RST_L-O", "RTL8211_PHY_INT_L-I",	"", "", "", "", "",
+					"MUX_SGPIO_SEL-O",
+		/*F0-F7*/ "", "", "", "", "", "", "", "",
+		/*G0-G7*/ "", "", "", "", "", "", "", "",
+		/*H0-H7*/ "", "", "", "", "", "", "", "",
+		/*I0-I7*/ "", "", "", "", "", "QSPI2_RST_L-O", "GLOBAL_WP-O", "BMC_DDR4_TEN-O",
+		/*J0-J7*/ "", "", "", "", "", "", "", "",
+		/*K0-K7*/ "", "", "", "", "", "", "", "",
+		/*L0-L7*/ "", "", "", "", "", "", "", "",
+		/*M0-M7*/ "HUB_RST_N-O", "BMC_FRU_WP-O", "SCM_PGOOD_C-O", "HPM_STBY_POWER_EN-O",
+					"STBY_POWER_PG_3V3-I", "PCIE_EP_RST_C_L-O", "", "",
+		/*N0-N7*/ "", "", "", "", "", "", "", "",
+		/*O0-O7*/ "", "", "", "", "", "", "", "",
+		/*P0-P7*/ "", "", "", "", "", "", "", "BMC_HBLED_L-O",
+		/*Q0-Q7*/ "", "", "", "", "", "", "", "",
+		/*R0-R7*/ "", "SP0_AP_INTR_N-I", "", "", "", "", "", "",
+		/*S0-S7*/ "", "", "", "", "", "", "", "",
+		/*T0-T7*/ "", "", "", "", "", "", "", "",
+		/*U0-U7*/ "", "", "", "", "", "", "", "",
+		/*V0-V7*/ "", "", "", "","PCB_TEMP_ALERT_L-I", "","", "",
+		/*W0-W7*/ "", "", "", "", "", "", "", "",
+		/*X0-X7*/ "", "", "", "", "", "", "", "",
+		/*Y0-Y7*/ "", "", "", "EMMC_RST_L-O", "","", "", "",
+		/*Z0-Z7*/ "GPIOZ0_EROT_OOB_INTR_N_C-I","", "", "", "", "", "", "";
+};
+
+&gpio1 {
+	/* 36 1.8V GPIOs */
+	gpio-line-names =
+		/*A0-A7*/ "", "", "", "", "", "", "", "",
+		/*B0-B7*/ "", "", "", "", "AP_EROT_REQ-O", "EROT_AP_GNT-I", "I2C_MGMT0_ALERT_N-I",
+					"",
+		/*C0-C7*/ "", "", "", "", "", "", "", "",
+		/*D0-D7*/ "", "", "", "", "", "", "", "I2C_SSIF_ALERT_N-I",
+		/*E0-E7*/ "", "", "", "", "", "", "", "";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart5 {
+	status = "okay";
+};
+
+// I2C1
+&i2c0 {
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+// I2C2
+// Baseboard 0 Management 1
+&i2c1 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
+		i2c-mux-idle-disconnect;
+		vdd-supply = <&reg_3v3_stby>;
+
+		c0uphy0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		c0uphy2: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+	};
+
+	exp0: gpio@20 {
+		compatible = "nxp,pca9535";
+		reg = <0x20>;
+		vcc-supply = <&reg_3v3_stby>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"MCU_RESET_L-O",
+			"MCU_RECOVERY_L-O",
+			"GPU_MCU_RESET_L_3V3-O",
+			"GPU_MCU_RECOVERY_L_3V3-O",
+			"THERM_OVERT_L-I",
+			"THERM_WARN_L-I",
+			"HMC_IST_PRE_RST_L-O",
+			"CPLD_READY-I",
+			"MODULE_PWR_GOOD-I",
+			"MCU_HMC_ALERT_L-I",
+			"USB_HMC_HUB_RST_L-O",
+			"HPM_MCU_OK-I",
+			"CPU0_SHDN_OK_L_3V3-I",
+			"PRIMARY_NODE_L-O",
+			"IST_SYS_RST_L-O",
+			"PWR_BRAKE_STATUS_L-I";
+	};
+
+	exp1: gpio@21 {
+		compatible = "nxp,pca9535";
+		reg = <0x21>;
+		vcc-supply = <&reg_3v3_stby>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"CPU_FORCED_RECOVERY_L-O",
+			"CPU_BOOT_DEV_SEL0-O",
+			"CPU_BOOT_DEV_SEL1-O",
+			"CPU_BOOT_DEV_SEL2-O",
+			"BOARD_ID_0-I",
+			"CPU_RECOVERY_TYPE0-O",
+			"CPU_RECOVERY_TYPE1-O",
+			"CPU_IST_BOOT_HMC-O",
+			"CPU_BOOT_CHAIN0-O",
+			"BOARD_ID_1-I",
+			"BOARD_ID_2-I",
+			"CPU_DIE_SEL0-O",
+			"CPU_DIE_SEL1-O",
+			"CPU_DIE_SEL2-O",
+			"CPU_BOOT_COMPLETE-I",
+			"IOX_JTAG_NVSEL-O";
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+		pagesize = <32>;
+	};
+};
+
+// I2C3
+// Baseboard 0 Management 0
+&i2c2 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	exp3: gpio@20 {
+		compatible = "nxp,pca9535";
+		reg = <0x20>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		vcc-supply = <&reg_3v3_stby>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"BMC_SHDN_FORCE_L-O",
+			"IOX_STBY_PWR_PGOOD-I",
+			"THERM_OVERT_L-I",
+			"THERM_WARN_L-I",
+			"GLOBAL_WP_BMC-O",
+			"USB_HUB0_RST_L-O",
+			"IOX_PRE_RST_N-O",
+			"LEAK_DETECT_L-I",
+			"RUN_PWR_EN-O",
+			"MODULE_PWR_GOOD-I",
+			"CPU_CHIPTHROT_L_3V3-I",
+			"SHDN_REQ_L_3V3-O",
+			"CPU0_SHDN_OK_L_3V3-I",
+			"CPU1_SHDN_OK_L_3V3-I",
+			"PWR_BRAKE_L_3V3-O",
+			"PWR_BRAKE_STATUS_L-I";
+	};
+
+	exp4: gpio@21 {
+		compatible = "nxp,pca9535";
+		reg = <0x21>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		vcc-supply = <&reg_3v3_stby>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"I2C_BUS_MUX_RST_L-O",
+			"HPM_MCU_OK-I",
+			"AIC_USB_EN-O",
+			"SOCAMM_DAC_SEL0-O",
+			"SNN_SOCAMM_DAC_SEL1-O",
+			"C0_SOCAMM_I2C_SEL_R-O",
+			"SNN_C1_SOCAMM_I2C_SEL_R-O",
+			"EEPROM_POWER_DISABLE-O",
+			"CPU_L0L1_RST_L_3V3-I",
+			"CPU_L2_RST_L_3V3-I",
+			"BOARD_ID_0-I",
+			"BOARD_ID_1-I",
+			"BMC_LEAK_TEST_L-O",
+			"MCU_BMC_ALERT_L-I",
+			"CPU_BOOT_COMPLETE_3V3-I",
+			"BOARD_ID_2-I";
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+		pagesize = <32>;
+	};
+};
+
+// I2C4
+// Baseboard 1 Management 1
+&i2c3 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
+		i2c-mux-idle-disconnect;
+		vdd-supply = <&reg_3v3_stby>;
+
+		c1uphy0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		c1uphy2: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+	};
+
+	exp5: gpio@20 {
+		compatible = "nxp,pca9535";
+		reg = <0x20>;
+		vcc-supply = <&reg_3v3_stby>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"MCU_RESET_L_C1-O",
+			"MCU_RECOVERY_L_C1-O",
+			"GPU_MCU_RESET_L_3V3_C1-O",
+			"GPU_MCU_RECOVERY_L_3V3_C1-O",
+			"THERM_OVERT_L_C1-I",
+			"THERM_WARN_L_C1-I",
+			"HMC_IST_PRE_RST_L_C1-O",
+			"CPLD_READY_C1-I",
+			"MODULE_PWR_GOOD_C1-I",
+			"MCU_HMC_ALERT_L_C1-I",
+			"USB_HMC_HUB_RST_L_C1-O",
+			"HPM_MCU_OK_C1-I",
+			"CPU0_SHDN_OK_L_3V3_C1-I",
+			"PRIMARY_NODE_L_C1-O",
+			"IST_SYS_RST_L_C1-O",
+			"PWR_BRAKE_STATUS_L_C1-I";
+	};
+
+	exp6: gpio@21 {
+		compatible = "nxp,pca9535";
+		reg = <0x21>;
+		vcc-supply = <&reg_3v3_stby>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"CPU_FORCED_RECOVERY_L_C1-O",
+			"CPU_BOOT_DEV_SEL0_C1-O",
+			"CPU_BOOT_DEV_SEL1_C1-O",
+			"CPU_BOOT_DEV_SEL2_C1-O",
+			"BOARD_ID_0_C1-I",
+			"CPU_RECOVERY_TYPE0_C1-O",
+			"CPU_RECOVERY_TYPE1_C1-O",
+			"CPU_IST_BOOT_HMC_C1-O",
+			"CPU_BOOT_CHAIN0_C1-O",
+			"BOARD_ID_1_C1-I",
+			"BOARD_ID_2_C1-I",
+			"CPU_DIE_SEL0_C1-O",
+			"CPU_DIE_SEL1_C1-O",
+			"CPU_DIE_SEL2_C1-O",
+			"CPU_BOOT_COMPLETE_C1-I",
+			"IOX_JTAG_NVSEL_C1-O";
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+		pagesize = <32>;
+	};
+};
+
+// I2C5
+&i2c4 {
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+// I2C6
+// Management Board
+&i2c5 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	exp7: gpio@20 {
+		compatible = "nxp,pca9555";
+		reg = <0x20>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		vcc-supply = <&reg_3v3_stby>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"HMC_RST_R_L-O",
+			"HMC_RECOVERY_R-O",
+			"HMC_SPI_MUX_R_SEL-O",
+			"GLOBAL_WP-O",
+			"HMC_READY-I",
+			"HMC_PRSNT_R-I",
+			"BMC_SELF_PWR_CYCLE-O",
+			"EEDO_LED2-O",
+			"PWR_LED_L-O",
+			"PWR_BTN_L-I",
+			"UID_LED_L-O",
+			"UID_BTN_L-I",
+			"FAULT_LED_L-I",
+			"USB2_HUB_RST_L-O",
+			"BMC_M2_RST_L-O",
+			"WARN_LED_L-O";
+	};
+
+	temp-sensor@48 {
+		compatible = "ti,tmp1075";
+		reg = <0x48>;
+	};
+};
+
+// I2C7
+// BMC Expander + Management Board
+&i2c6 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	exp8: gpio@20 {
+		compatible = "ti,tca6408";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		vcc-supply = <&reg_3v3_stby>;
+		gpio-line-names =
+			"",
+			"",
+			"EROT_FATAL_ERROR_N-I",
+			"",
+			"",
+			"EROT_RECOV_N-O",
+			"NRESET_IN_IOX_N-O",
+			"";
+	};
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9546";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
+		i2c-mux-idle-disconnect;
+		vdd-supply = <&reg_3v3_stby>;
+
+		i2c_usb_hub:i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c_tpm:i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+		};
+
+		i2c_dp:i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		i2c_rtc:i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+};
+
+// I2C8
+// Baseboard 1 Management 0
+&i2c7 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	exp9: gpio@20 {
+		compatible = "nxp,pca9535";
+		reg = <0x20>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		vcc-supply = <&reg_3v3_stby>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"BMC_SHDN_FORCE_L_C1-O",
+			"IOX_STBY_PWR_PGOOD_C1-I",
+			"THERM_OVERT_L_C1-I",
+			"THERM_WARN_L_C1-I",
+			"GLOBAL_WP_BMC_C1-O",
+			"USB_HUB0_RST_L_C1-O",
+			"IOX_PRE_RST_N_C1-O",
+			"LEAK_DETECT_L_C1-I",
+			"RUN_PWR_EN_C1-O",
+			"MODULE_PWR_GOOD_C1-I",
+			"CPU_CHIPTHROT_L_3V3_C1-I",
+			"SHDN_REQ_L_3V3_C1-O",
+			"CPU0_SHDN_OK_L_3V3_C1-I",
+			"CPU1_SHDN_OK_L_3V3_C1-I",
+			"PWR_BRAKE_L_3V3_C1-O",
+			"PWR_BRAKE_STATUS_L_C1-I";
+	};
+
+	exp10: gpio@21 {
+		compatible = "nxp,pca9535";
+		reg = <0x21>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		vcc-supply = <&reg_3v3_stby>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"I2C_BUS_MUX_RST_L_C1-O",
+			"HPM_MCU_OK_C1-I",
+			"AIC_USB_EN_C1-O",
+			"SOCAMM_DAC_SEL0_C1-O",
+			"SNN_SOCAMM_DAC_SEL1_C1-O",
+			"C0_SOCAMM_I2C_SEL_R_C1-O",
+			"SNN_C1_SOCAMM_I2C_SEL_R_C1-O",
+			"EEPROM_POWER_DISABLE_C1-O",
+			"CPU_L0L1_RST_L_3V3_C1-I",
+			"CPU_L2_RST_L_3V3_C1-I",
+			"BOARD_ID_0_C1-I",
+			"BOARD_ID_1_C1-I",
+			"BMC_LEAK_TEST_L_C1-O",
+			"MCU_BMC_ALERT_L_C1-I",
+			"CPU_BOOT_COMPLETE_3V3_C1-I",
+			"BOARD_ID_2_C1-I";
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+		pagesize = <32>;
+	};
+};
+
+// I2C9
+&i2c8 {
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+// I2C10
+&i2c9 {
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+// I2C11
+// BMC FRU + TEMP
+&i2c10 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+
+	temp-sensor@48 {
+		compatible = "ti,tmp1075";
+		reg = <0x48>;
+	};
+
+};
+
+// I2C13
+&i2c12 {
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+// I2C14
+&i2c13 {
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+// I2C15
+&i2c14 {
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+// I2C16
+&i2c15 {
+	clock-frequency = <400000>;
+	status = "okay";
+};
-- 
2.43.0


