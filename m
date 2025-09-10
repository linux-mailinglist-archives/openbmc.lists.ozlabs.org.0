Return-Path: <openbmc+bounces-612-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A158EB50CB3
	for <lists+openbmc@lfdr.de>; Wed, 10 Sep 2025 06:07:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cM6ZZ4pbhz3cfv;
	Wed, 10 Sep 2025 14:06:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:240a::61a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757477206;
	cv=pass; b=FcHHGrx7ju2mch4giwONdJLEBJxfOeWzbLYcna8BAlHbEXoCcpckZ7dQs97IgXQMXJljtpHEluFLzKeVEm9TtbUZz8nHBM6MXLDD2xuqQn6JE7/tk3aF+znyVztTSUqz0kCQM5QvqCQcnaWyGLroE5oHHYwPMOps/C3qzM2BboOIEG21ysuUQdoMeaqd+j2USmdjIKOJ7Ap/+WzWlBbgHyxnX01zHlPrHBlal7wudTrRVLEWCgNGdlUZ6enJKhjyFNdnHUazDqA7OHB7q7NuR+c4KDxK0h/EW1YzoYnoaF2ByYR2BHFNubcVc5RSRZ8tVh+Gc9L1W/tnPh9LiXosvw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757477206; c=relaxed/relaxed;
	bh=PLQmH6H4rM+WwYUyDdnPZIF5dGFpwqEnQG5H1j+xyoY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VkUvTd0XQiBQD7ZFU/YzUQrcPBGARcSh0Bl1NWKBO3K5hLiIUFaBCkVhL3ei294tUK4Udo3PQR8GqBKbtUOPrtDILMhshsX8Jefz8r9fbpwkTUrVUNXO/p+F50dwq4S/UuWdkpgJw+Y0wBU/jEAYi/Q9k3z2ZiaPvwzIJzRzpgZapl77dh4RQCQ3ZMQoUeyeutE9q0j7+zCsAJtnUyKBOqT/UH0XOJJD1TVn8om/T7im5e+7+JE+jKY9wFbHx17TNsYnGc69Op160PND9GHvTndDNTGXl8kbNZgTjwdwUesftzwplqQqSV8/C1m83ZGDYD9AfAMd7WI7kOgj2w18nA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WIwIkDho; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:240a::61a; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WIwIkDho;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:240a::61a; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2061a.outbound.protection.outlook.com [IPv6:2a01:111:f403:240a::61a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cM6ZY4GY5z3cft;
	Wed, 10 Sep 2025 14:06:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTnYGGxFT35IbM4MdZrVGLdSauCqc+18gTIzdwidTDqCOsnFf561kFOI1fiaNs5eB1X/5wI2Cq1e5Sf4tZxZjuBI1Ma44gfskKAiqdr0QwhfiaS2HE9pp2CU16eH2CrlCDhEsjEarQi/CC73KWR9R4hOHP+Svll1qBykZkideJlnkwM/4IKZQAjNQumdLhybX8GMqgaqgjBua0kFaYX0w6Yozpv3DS81i3kLYyRa4gQwzn1gYWcW1EIQ8fk7ABVB/lt9SJjL8Jh3vRjfXUe//FmnC6MmU1CPUN53+EGv7VyvFQydrWvK5HT4WRx2ukxd0uRXcJTGRq/eMZVkQ+Ntxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLQmH6H4rM+WwYUyDdnPZIF5dGFpwqEnQG5H1j+xyoY=;
 b=TY5KtlEzc2iaAE4OlJIySauJXq2bf0YBkmHwMldlnguaTNsSqADRzTGQ6CZr16OwhdpLOBJ4qE4iUJABXd7J5Lx5s3HMXHRIdeDCOQY+MwXplGq2XqafXt9+J4RSTR4Sb8yG2XHIevj7XlwmrW5wRhnklUjY3/CvJn9LLxTyIlb74zCqAJ7SDSH/Xy49Gu+IDOSstzM9DuQEHneWREMZiwB4FKkInQTbcCctnKppMK0M38x77Vzp5aSTNP/9b4Z5ys4NsMwhaNgqPqp6aowUCZFvTwp0EhaTzdqTNaA+sukt0H7WjpWFchz8gAX4ZXsjfmnEAQEVlbi9CplYb+d71Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLQmH6H4rM+WwYUyDdnPZIF5dGFpwqEnQG5H1j+xyoY=;
 b=WIwIkDhomFFMwgt1sxYuDntNr+Pryb0MG4WfZ8csqv5PLV6WiQlFVTi6JdITSkWG77NL2as0Ev2S99JA2MW6NsHyOt7Tla/wL3GrJYg7Q2wAmunMNbtF6xDM+mZ2bEh7N91qPGARIz9d9t7H7FiW4vm0ACg8RwRmToHHaE52WAD1argMKQY4jDKf0+udu4uoNP5jVIlvAFvb/q/WQVLm/Fg6OvB3GUVirF92YNCrI+kC3uYTwS80ytfI9tQdZ4Z4uXZdlNX4Yo19f0YyJVAXwnAaLYrgVDeJDcbrJeQhn1B3DLr+rkus5GpXCPsZxmyqx8P9toDeA9QbYpu6ItLryw==
Received: from BL1PR13CA0149.namprd13.prod.outlook.com (2603:10b6:208:2bb::34)
 by PH8PR12MB7279.namprd12.prod.outlook.com (2603:10b6:510:221::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 04:06:19 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:208:2bb:cafe::ac) by BL1PR13CA0149.outlook.office365.com
 (2603:10b6:208:2bb::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.14 via Frontend Transport; Wed,
 10 Sep 2025 04:06:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 04:06:18 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 9 Sep
 2025 21:06:05 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 9 Sep 2025 21:06:04 -0700
Received: from dondevbox.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 9 Sep 2025 21:06:04 -0700
From: Donald Shannon <donalds@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<donalds@nvidia.com>
CC: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <etanous@nvidia.com>
Subject: [PATCH v3 2/2] ARM: dts: aspeed: Add NVIDIA VR144NVL board
Date: Tue, 9 Sep 2025 21:06:01 -0700
Message-ID: <20250910040601.240162-3-donalds@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250910040601.240162-1-donalds@nvidia.com>
References: <20250910040601.240162-1-donalds@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|PH8PR12MB7279:EE_
X-MS-Office365-Filtering-Correlation-Id: 847cfe45-6338-4cc2-7026-08ddf01f6537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A0i5RDQBo1krYcFOAaR50GuV8wQKW92yUCGVvXjjngpXcQHjDgOYeVb1cgxV?=
 =?us-ascii?Q?b72oHfwyscH7cpJ4/Y8TSH/Uh8Y4XgRPuP3mwxjur1P6bXm2k44cyBP3PqAF?=
 =?us-ascii?Q?SQVoHVpaOIm3xNPMFsC4LbrDcdVhzOX3EQDpq7jtYFj27AD52W1WnMcchCJF?=
 =?us-ascii?Q?wU3pCPuWzhxtAg/7TrtxfAuGQ8LBfaXl0sDIOCCIMt9q40H4X2Ao4u8lSeXa?=
 =?us-ascii?Q?g+Ce0djlvOIkex2Jpj6AW2vBCp+6kx/QlouZYWMduDbN7kiw640qJOWIHjpE?=
 =?us-ascii?Q?WQ8nfqe5PXr9TKIAgKSxM34gTtr7cMkB/PxGNPYZF2YrihA/N54WI5Ah3+ah?=
 =?us-ascii?Q?fEi7yhNJjAbMFj7chdDw+FYj2eo+4VjakdLPmQ9ikw/Fy8+OPYPbWqkJ0EqB?=
 =?us-ascii?Q?OehAYEKSM50YXisoyUeejKL81t/8YO8So8XyZTZiU3CdrN+VbKfzYU3emaJd?=
 =?us-ascii?Q?scbDIi5an8Qt3MSIcIb3pyGA9CYULa9NnJyp/1F9VS5CaUna67HJQOj4pTpG?=
 =?us-ascii?Q?mtQDWv4jno4ZDGUOJsNvJSTkS7GXdgitMgaGvKwX/qnPr4w4Z6AMQ85X+6Qj?=
 =?us-ascii?Q?+aBlPL4E6R4h7m6rkYL1+1zUDDkIIfdcGvA5P7yT+zjOcYoKqNQAGbixbIWM?=
 =?us-ascii?Q?rrAHZhEYrgExN56hDZfJ6Jq5b4di42NZ0fcvdEFBaNIChOCL2Hft8jOojPQ+?=
 =?us-ascii?Q?DGssZYy+oL47uWE5tPrB6QNn5or+JgTG4fGLCThZfgvhNseU/QGJsSRbYFcQ?=
 =?us-ascii?Q?z1Oi2RJfbyh8NujroqpD4KIHmH5U2ya1coE6Ufj3NMAATO3VwNmT6lznphPj?=
 =?us-ascii?Q?ZsdCQN0Duj01bMH6UYHDWrQBE5Abw5QoAXpNz72AjNn17Fxx9INQ7NZw/nKf?=
 =?us-ascii?Q?8g5EqTSTdQbNPgXmCZ0Fzyw9Ef4dEAU9xQur7baDzH0sUVCmine/9zOsoOYy?=
 =?us-ascii?Q?ZyeamkSqnUn96ejUKc6XvjlTTrVhUDMoP2Wj6uoCyXgT32zSHQ4TYWyZLTRk?=
 =?us-ascii?Q?NtsBNXq5o6INKxSQi9A7l+jSoK5WVfeWV+24qis/h4R1bbj1nMZOGTDCsCbY?=
 =?us-ascii?Q?Sm46SaI6fYFE3dpd+etiBjujLXWeMG/xiQUdKFtEmzhT5v59gIR8gYWsSWX1?=
 =?us-ascii?Q?6/2k3w5BV9gXExSHVg5fDd2oLcXQDHjRIAd3dj47WxY74UKQ8Aspm5/F8k1q?=
 =?us-ascii?Q?cqsau+YSj7dgWyv1LyygdRrlWxGH6FEqga/0j8C97YK7plHIn6Z6uMO30rkH?=
 =?us-ascii?Q?1ZDi0qkAng09QBNQ5PshYnfp64JJ4nz+5qC6yLAiPeOFxe3LaLjVQN0YiezV?=
 =?us-ascii?Q?DiFekWA6eLy67IiLnu9oGsM0/Jw+e9A+AAuWhdyzCInCmoj/ik6FoGMW1h4y?=
 =?us-ascii?Q?SsbFdytVHG3CoePQNcZjX/t2zmMIFGyyiEtLO9tKnBxFAJ4UJ1MZVf9Z9kIo?=
 =?us-ascii?Q?CLKMsef3an2IGaNP6mLuPCmwYxjHgNukO5mIj7QjNSHoWG1HstJqOSfC97m0?=
 =?us-ascii?Q?1zivoUyvxMd9oRQ9SnVqbw8uLZnLPfe0yMUI?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 04:06:18.7381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 847cfe45-6338-4cc2-7026-08ddf01f6537
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7279
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
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
Changes v2 -> v3:
  - Changed to alphebetical order
  - Added comment that our flash layout is different because of our ROT
  - Removed unused phy-mode property from mac0
  - Renamed fault led gpio from input to output
---
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-nvidia-vr144nvl.dts | 778 ++++++++++++++++++
 2 files changed, 779 insertions(+)
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
index 000000000000..d7f11844246c
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr144nvl.dts
@@ -0,0 +1,778 @@
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
+// USB Port B
+&ehci1 {
+	status = "okay";
+};
+
+// Need custom layout for Root of Trust
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
+		/*I0-I7*/ "", "", "", "", "", "QSPI2_RST_L-O", "", "BMC_DDR4_TEN-O",
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
+			"FAULT_LED_L-0",
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
+
+&mac0 {
+	pinctrl-names = "default";
+	phy-handle = <&ethphy0>;
+	pinctrl-0 = <&pinctrl_rgmii1_default>;
+	status = "okay";
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
+&rng {
+	status = "okay";
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
+&uart1 {
+	status = "okay";
+};
+
+&uart5 {
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
+&video {
+	memory-region = <&video_engine_memory>;
+	status = "okay";
+};
-- 
2.43.0


