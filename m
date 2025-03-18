Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 590B0A6802A
	for <lists+openbmc@lfdr.de>; Tue, 18 Mar 2025 23:59:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHS2p5Hsfz3fQs
	for <lists+openbmc@lfdr.de>; Wed, 19 Mar 2025 09:59:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2009::607" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742271191;
	cv=pass; b=KMpN2R5fIGSXVnKYQou+uibv7mWzmZOVgjAXZUZZjtZw+OgudZ5JT50WSghaUGSPvi3V023eylQgKh4Y1cW2tO2yr13fQ+5+mdrSCI6p+z2Cckn+ia2m+AVfuuUgMn6Pl+4rWmt5RcKmCJh7THn0F7lsnxy8OZyLkU39WdmCgJ3QWoV+L0GL45dj9y+V/Y1Ra/gJcjWPY+8W+6LGZEiywkZz6JQlBYYFurYRxWKCpyyWZDBz190LKUcwJ4HQq6+51QkerdnuIx5mxlwlpvhtWOMuGTVHv3dDBmNTqVJRyitfKXSFSfidhr5Uv2bDl/9Vd6qYVW+wLV8Bl4EGq2+n2A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742271191; c=relaxed/relaxed;
	bh=g15Jwk2XBtRD52urtHvgO/HW52gaj7b5k3Qau8Py9vQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dtv999fscVG1RkBfEUd8Ifm5d8eU0m4+f4PISeyBP5kCnyldbaPmyNI3O9U1cR6ZVXGlBzI6A270Q1Frw6TOkBGGUtOvtC6U+cd+hDCfLL7KChsdGbKEg+zcceZ6NTk3chvFfa+EkWMWMKp3peZgdK9PPE7pF4ZOy1grpwS/Hs/bvgFNYLsc1Re5i/jJDIDV2Sp8WWcfN67xZWF2//Nxe4PwnQMksDfNug6vySuKo5Ti+wSfyR+tpxifrkq9vEu4cleP+LYVTWATJBbGULHSGhmFp0Kk8s/Cw/SWgZW+GuIhATlQvwTi2yGne9iVDDopp1bTOAD2PM9QRIF+lTSglA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GKeAbDuD; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2009::607; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=rajaganesh.rathinasabapathi@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GKeAbDuD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2009::607; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=rajaganesh.rathinasabapathi@amd.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20607.outbound.protection.outlook.com [IPv6:2a01:111:f403:2009::607])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGz3B6F12z2yfG;
	Tue, 18 Mar 2025 15:13:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L5Z+gPWouWOG4fWa42BB8ocw1UQCyYGvRFQ5pH5q8NdvST6hmqWQIyKkit8xCHO14F2EPHY4O/20CuJ3kDamZLk3GF8vjkyHfpYGXO2DjBfjhfg0TWea1Opi4P2SE4dHP3VmlMoshvIYmrl+q+UPn2XzqQjkxb8S3IjLCKcZ6ip5WFPnVxRjEFaRoQB50TFEhzhSNpt7rDBAcyCxEkkbqHKYXlZpAY5pO65iNWAnJ4D7kieHCe4AwU+ul4J6soHBSjjtfjDQKk9LSOYWSiQ4Bul+c5iCt+YuS6hIaCX1YQcVYCc/2XUBP6Bz/3Hnmzm7ybyosv8Qsl8uLU0kjS3KRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g15Jwk2XBtRD52urtHvgO/HW52gaj7b5k3Qau8Py9vQ=;
 b=qAKvltXpXRqt72ADZSnzF0W9WSrAF33djCJaFpSvAAT2440QWSnnm3EGRPyXx/XjmpfNduD6Q1nldAKX0UJAGMrsDyUZTMTYsx+b1JzBXnAsJDi/xBT7bPbjUVEe1ayR5rhZZPX7G93YDr9d7QpAebZYN/bdhMandVDj3d2jvMQRSSt1mSxOoai4t99rw3NetfQ3gpA9F+iRlPfu9MnctR788xOT3pyC6vyEWTEdB1Oax5nZXN2gPkrEQ4IuvN6gX3ZxkaV2Epi+qSu7NxTeCivfCiFeYMyf+xxjX4XEx2y6d0/WJHT/Bd8zsTkQLrJVuGY5tuOjNtW13pqKHX6beg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g15Jwk2XBtRD52urtHvgO/HW52gaj7b5k3Qau8Py9vQ=;
 b=GKeAbDuDenxxZq9glXp5jB5KBfHF63kP0E8MtaWZqwG/CKJvUE01wErV2AnkAdsziyDeRe+y4wVOfPwjPe7/1Kgukzlh3+2tZqa7sN884393JKFQcz95q2myB7UapDsDmdsViwt7k4i5ji2/d0ds+8GUnJ+rSSzCzPIblfuNvRA=
Received: from CH2PR18CA0023.namprd18.prod.outlook.com (2603:10b6:610:4f::33)
 by CH0PR12MB8507.namprd12.prod.outlook.com (2603:10b6:610:189::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 04:12:50 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:610:4f:cafe::b4) by CH2PR18CA0023.outlook.office365.com
 (2603:10b6:610:4f::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Tue,
 18 Mar 2025 04:12:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8583.3 via Frontend Transport; Tue, 18 Mar 2025 04:12:50 +0000
Received: from BMCDEV-TH5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Mar
 2025 23:12:48 -0500
From: Rajaganesh Rathinasabapathi <Rajaganesh.Rathinasabapathi@amd.com>
To: <devicetree@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>
Subject: [PATCH v3 2/2] ARM:dts:aspeed: Initial device tree for AMD Onyx Platform
Date: Mon, 17 Mar 2025 23:12:24 -0500
Message-ID: <20250318041224.1693323-2-Rajaganesh.Rathinasabapathi@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318041224.1693323-1-Rajaganesh.Rathinasabapathi@amd.com>
References: <20250318041224.1693323-1-Rajaganesh.Rathinasabapathi@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|CH0PR12MB8507:EE_
X-MS-Office365-Filtering-Correlation-Id: 0497d183-3f4a-45fc-f23b-08dd65d325e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?0ZEEOgvylSbiozPbS3VPnx7inNQdoxwafgud+wod4cZHMNHG0CgurXCSldKc?=
 =?us-ascii?Q?MJWqJ9hoGIIIm8fb0yWoD/qPYq9M4CqkX9240XhcDmPDOp8e5mklD26lCdom?=
 =?us-ascii?Q?edSWopH2ugXOrz5I5pe6Gs3UiSA6EhCCjzyjbdTjqfmNeLofp1y6Tg6xxbys?=
 =?us-ascii?Q?h1SFzN1ObUun80rohckbsMSa7/VBMMhHfGm1QJ6jY4KMaP6gWFJR/2SJirlF?=
 =?us-ascii?Q?/zmium0xPogikEwli4zxWc5cRso/5BnWmmuRdQISH1CS0zir6FJfyKUzzLTe?=
 =?us-ascii?Q?BHdm/TL9xuLU1MELgmLuX5uBh+QLOl66Hk2DbziCix0w4MGpCxhZY9gq9g27?=
 =?us-ascii?Q?f5dHNSDsozzGaGU3/C4f3VdXqLA+J+0DrAptRFFUVSQ2vju8KLivHVcUXTu/?=
 =?us-ascii?Q?+rawO8LyrvIHleqV0Ecgwj4GBG8ZQiJSdKgyfWCbDB4UyZCVkVmdrXADrkgz?=
 =?us-ascii?Q?Lrlg06mhPbIMif9E+YNy7lon+NjyvCTBQtdWp4rp9sXbC3S40l7VqioKCLRu?=
 =?us-ascii?Q?fQ+SnLGjQziPAHtmtwmTrMj+461KSkJCzjzPIkpu6D7kzVM1vLgk8jwxOPxK?=
 =?us-ascii?Q?pRiN9tQp0jP8NEIMWPvXxEBV2VjTD/6PyA8C7gC55FW9AG5u6kwiRpHSv0Fr?=
 =?us-ascii?Q?ISAqqTZcscXyoNZTPfutnbs/hm1R+Q0kGQ8sr3tEUJvn1D9yBY5CyDmJJVqM?=
 =?us-ascii?Q?H3sc4YoXwPYsUm13q26t7aps9ZjTr2NDOr8Ujup37TaspNJmtyl4CtAA2y+1?=
 =?us-ascii?Q?7WfUq7rRZfb+Y0EjzUlgh5upg7HSZ3jLHYjSP0PLXq/LAFRZqQl9xafy0gGc?=
 =?us-ascii?Q?ueTrL/7fjUOzw50KzkH3GMDhGx8FGwAL3oejQayAm0VljTRiMlSDt/urHT6m?=
 =?us-ascii?Q?pf2rMZZ81x9Y9pHOAO7TykSqvmwJIK5JmFx94YEcjhZxw7fa04doeNQZ3i6g?=
 =?us-ascii?Q?reZzgxL+p5xiCTIgU/k/KTiW7Ef/koP7w+JcsPEyRlzQxIpnlT+IOB10r8jW?=
 =?us-ascii?Q?i7+7+CqNhSt2dM3UCo9VOa4u0dh3DyM+EC1zlhqD3fXK5xMIWHVyP+vO5KxK?=
 =?us-ascii?Q?pyEAA2K5Djw9e5vI+uZ3A8790czQAfjGdJ7FTfeY93sOHV0hkqO5NcHz4+YZ?=
 =?us-ascii?Q?ni7qJOV3Zgl7DuxX73dm30gtwUeNzj8jgHFuy1pVi3/I6trtciGsxY4Tt1me?=
 =?us-ascii?Q?19/ZeWIk2sN2ROQ4OUQ7iUNhHxZGnt/s/cFkjJ0y3A56PoQqFtqygsHK7Zat?=
 =?us-ascii?Q?IiGyk5yqDx/OwBZu54wQ3YuqntUP2g114tHemtYCLY4yWIOd97Ph7n93cgS4?=
 =?us-ascii?Q?wzAoNeAW/yqhEpW2rqap38OlXVywBjxif+Dg+R4y3Qqmpe0AD6gNkTKPbQOc?=
 =?us-ascii?Q?8FEv2a09YYx9jEAYlc74A02qId6sVAD43W5p7AJuILIaxg3VQ6Xde0wrUJ/w?=
 =?us-ascii?Q?8kRyyc5P+gzwqgB7k8m36mqC4eNArfTZKxC0USVoVoJpmEIGjgaWAeswygyq?=
 =?us-ascii?Q?baJVsx8ahohbjko=3D?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 04:12:50.4119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0497d183-3f4a-45fc-f23b-08dd65d325e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8507
X-Spam-Status: No, score=-1.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS,WEIRD_QUOTING autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailman-Approved-At: Wed, 19 Mar 2025 09:59:23 +1100
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
Cc: conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rajaganesh Rathinasabapathi <Rajaganesh.Rathinasabapathi@amd.com>, robh+dt@kernel.org, Supreeth Venkatesh <supreeth.venkatesh@amd.com>, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add initial device tree and makefile updates for
AMD Onyx platform.

AMD Onyx platform is an AMD customer reference board with an Aspeed
ast2600 BMC manufactured by AMD.
It describes I2C devices, UARTs, MAC, FMC, etc.
present on AMD Onyx platform.

Signed-off-by: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
Signed-off-by: Rajaganesh Rathinasabapathi <Rajaganesh.Rathinasabapathi@amd.com>
---
Changes since v1:
* Incorporate review comments
* Update commit message
* Remove vmalloc and earlyprintk

Changes since v2:
* Address review comments
* Fix checkpatch warnings
* Remove bootargs
---
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../boot/dts/aspeed/aspeed-bmc-amd-onyx.dts   | 102 ++++++++++++++++++
 2 files changed, 103 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index 2e5f4833a073..1e6a130377b8 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-ast2600-evb.dtb \
 	aspeed-bmc-amd-daytonax.dtb \
 	aspeed-bmc-amd-ethanolx.dtb \
+	aspeed-bmc-amd-onyx.dtb \
 	aspeed-bmc-ampere-mtjade.dtb \
 	aspeed-bmc-ampere-mtjefferson.dtb \
 	aspeed-bmc-ampere-mtmitchell.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts
new file mode 100644
index 000000000000..6f3334995398
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2021 - 2024 AMD Inc.
+// Author: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
+
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	model = "AMD Onyx BMC";
+	compatible = "amd,onyx-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial0 = &uart1;
+		serial4 = &uart5;
+	};
+
+	chosen {
+		stdout-path = serial4:115200n8;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x80000000>;
+	};
+
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
+&mac3 {
+	status = "okay";
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii4_default>;
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		status = "okay";
+		#include "openbmc-flash-layout-128.dtsi"
+	};
+};
+
+//Host Console
+&uart1 {
+	status = "okay";
+};
+
+//BMC Console
+&uart5 {
+	status = "okay";
+};
+
+&gpio0 {
+gpio-line-names =
+	/*A0-A7*/	"","","","","","","","",
+	/*B0-B7*/	"","","","","MON_POST_COMPLETE","P0_PRESENT_L","","",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"","","","","","","","",
+	/*E0-E7*/	"","","","","","","","",
+	/*F0-F7*/	"","","","","","","","",
+	/*G0-G7*/	"","","","","","","","",
+	/*H0-H7*/	"","ASSERT_WARM_RST_BTN_L","ASSERT_SOC_RST_BTN_L","","","","","",
+	/*I0-I7*/	"","","","","","","","P0_I3C_APML_ALERT_L",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"","","","","","","PSP_SOFT_FUSE_NOTIFY","ASSERT_BMC_READY",
+	/*O0-O7*/	"","","HDT_SEL","HDT_XTRIG5","HDT_XTRIG6","JTAG_TRST_N","","",
+	/*P0-P7*/	"MON_RST_BTN_L","ASSERT_RST_BTN_L","MON_PWR_BTN_L","ASSERT_PWR_BTN_L",
+					"HPM_FPGA_LOCKOUT","ASSERT_NMI_BTN_L","MON_PWR_GOOD","",
+	/*Q0-Q7*/	"","","HDT_DBREQ_L","","BIOS_SPD_MUX_CTRL_RELEASED_L","","","",
+	/*R0-R7*/	"","","","","","","","",
+	/*S0-S7*/	"","","","","","","P0_DIMM_AF_ERROR","P0_DIMM_GL_ERROR",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z7*/	"","","","","","","","";
+};
+
+&i2c7 {
+	status = "okay";
+	mbeeprom@50 {
+		compatible = "atmel,24c256";
+		reg = <0x50>;
+	};
+};
-- 
2.34.1

