Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ADEA78236
	for <lists+openbmc@lfdr.de>; Tue,  1 Apr 2025 20:32:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZRxSC3PhWz3c8Y
	for <lists+openbmc@lfdr.de>; Wed,  2 Apr 2025 05:32:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2418::615" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743532343;
	cv=pass; b=DJD9rCfgN9j7U7uBFCoyO0byxnPKpFcdZKhBd6Fycf83+6OWAoYQ6BqDDeY9zCXFEQAW0HYQpdbP54EFpdfI8UcbL92qWjV2UZSKhtO28i8uW8tSQU6+VHV2SOryhUCoLa3+tfKK3yLpBmT9cxxZ4Unb6dNJmbGb8FZ002Lt4KFOWkFqLcq1KRKUs14gAYD6LjT+CXsrkPc5s0oDQbGuQfZBaNWtlbQNEtjdz2srwjQ+/zoQS30bb+NpqV30wkNCsq4jc5ldpAPh3693ngnY0HaXWZnCw+Ws/P6nApAoaesRoBvV/b/AvQAtZbKF1Vel8w6TY2nFql1K1uZT0fvlrA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743532343; c=relaxed/relaxed;
	bh=/RtgQl01kq2TO20xn2KYyiXvXfuClC78/4l3Iqv+Ix8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kQITWlgYC9S+M5Q93JETCq6UOcNm3SP2GUrHBdUw0YATeMLpbKdyFJHWLY23Zw1XT6sz7NgfAemu3Eq6wMx4ybLySkaDE7hfqt4IPRs54DV6HFOTeFbcaAmnmxULx1x3CUwGKmC/CaWBto8RjW55gJizTEAIEjbM/izdj22a1LPSNz9Sr9PrRejTiYGp0SVESADOZaSgeeB6lRpjzKgNL/ibkrk6ev79fKQ6YhdPrihppvFcgk4zaIlrjzoqrwOfGqLFNBB3p3+2n0sLRUwG8dkgmPMUoURzEX6RGEXgVzQcf0cePHc+/Nm3bSlPTeVyn5GFd300nRgk/toA2sysZw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aBcx6uSz; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2418::615; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aBcx6uSz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2418::615; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20615.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::615])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZRxS44Ykcz2yRx
	for <openbmc@lists.ozlabs.org>; Wed,  2 Apr 2025 05:32:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sI3joSK7tvAgmNl/FfaW9Kn7atk0CSQlhszWV7Uuwntea7E8hvKui6saO7HQJXJuy4ubKPoFXIQlEuNd8JfKWlTaX4q2H+YpkR/duME3dwykjMC2jfF86K0KEQw0IQ9QqD0OXtzaMJkUAHQVA7TUBgv0wNgtlSWaEfJcQEpxcfcU7vbrN6HYe3HGmMdVvL5FHM8DyslSEPz8+n9qZD1YSHdXziYCVwLjGfE+gMrZd4w5OuCzap0g9hda6R25INR6jpzLuBlDsCvFeSfOJwP+gxhBrougvyipqZvq14A35sDYALKYO5dwqQ1NFNPF9VtLzXGgFDto8JMPHZKaickdqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/RtgQl01kq2TO20xn2KYyiXvXfuClC78/4l3Iqv+Ix8=;
 b=jjvONC40FhIKKsUPUx1EI+DkUa9AIgv6JOxOdWmO3RQucjUt9wV2Wawxa7KhjH/Kzov9tGyWWhZHIMmiYXCYFfbJVDC/oLT2n3bwEzJv88mMpDlOGF2+VpKzDQzg4ZNmEf7J9hxVqDEuhSJ+4fxhJVn5jrSeT1uydLMOY4nvcW7ZHncA2z5mdPhiodxAb2iQBM/NX3mGutIc5VhoB5Hv0RVBg3eZV/d/RhCUcIifY96tgBJW/o+qdSJ1chkcrsI3kXaShoK9oPkW/edX0yUWDtyBUwjwg6umw1Zg2IN3mqmI+05XkFDYXFNIy+1kGonmAkxSS6ePBhvRKhOadCK3lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=jms.id.au smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/RtgQl01kq2TO20xn2KYyiXvXfuClC78/4l3Iqv+Ix8=;
 b=aBcx6uSzLMlbwnaONwbIbUegLGgfzMuVpCLCU+f32FGSQDx4SxbiTio0gaxNYEAu5mDDwZFkX7nB47LMvtIznrQpTUZGPk+E1WbypivU2cLgg5M2CR/P/qzoz5+kAOQuoXe8iieWj4hoBlxCAgQI0ilGm6tSQddkHfhOyrbMlGdFFWSiXJyWMQWaeCM/EM29Qxl2vmarn/d5neKiumR9gxqvHInHSbXmZ16xMZFiqYjQmhqG39NiO+iTWibEv6Se3tCjUu9TuCVgUFoA6tj590ucswRxhhlOPOPTStRxrrhvOZD8XkMtdYvlJbE8c1oQFjcgeRpa9XTVUWicfYrbFw==
Received: from DS7PR03CA0069.namprd03.prod.outlook.com (2603:10b6:5:3bb::14)
 by DS0PR12MB7947.namprd12.prod.outlook.com (2603:10b6:8:150::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Tue, 1 Apr
 2025 18:31:49 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:5:3bb:cafe::5f) by DS7PR03CA0069.outlook.office365.com
 (2603:10b6:5:3bb::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Tue,
 1 Apr 2025 18:31:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.22 via Frontend Transport; Tue, 1 Apr 2025 18:31:48 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 1 Apr 2025
 11:31:43 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 1 Apr 2025 11:31:42 -0700
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 1 Apr 2025 11:31:42 -0700
From: Willie Thai <wthai@nvidia.com>
To: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<openbmc@lists.ozlabs.org>
Subject: [PATCH u-boot v1] ARM: dts: aspeed: Add Nvidia's GB200NVL BMC
Date: Tue, 1 Apr 2025 18:31:41 +0000
Message-ID: <20250401183141.338026-1-wthai@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|DS0PR12MB7947:EE_
X-MS-Office365-Filtering-Correlation-Id: e45c4e4f-a35e-479a-36bb-08dd714b76fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?t5ZWGyJnNrlSbIg15Gam5jFpRBDpm8VG89/rejhssFaFMmmpbAIW1j0jg+0I?=
 =?us-ascii?Q?gGhbTI1ZKPCfPrkOlP6wQDS0facdqmEvVDQFZ+rhOr1M5ELuVqIMQ7gdZ31L?=
 =?us-ascii?Q?vmmu5ttgACFC6/y3kH45X71C3UDuOhVC3jAvdJk6wj8aFYPIx3p1Do1GPrai?=
 =?us-ascii?Q?qB6/cMwH6fHO2uWcIfqtT9wQerq2NO/YHwZ/gUdg/qk5kSBX+sj50OHjzXa5?=
 =?us-ascii?Q?/wGK8Hjg+ujZ7EqroBZr8nifi12/En/KIDPG8ezV+8RVmS4VR2/j28fgi9IL?=
 =?us-ascii?Q?7Z8rcy21qWkeoOd9kSnDEckvoxbNi2CaI331AX0MOGYzCmbjllw+KT09P+MD?=
 =?us-ascii?Q?Av/yH2CgzqFjNoYl5O6yV4stEijxdajWN0xlrt+zSA/9tETn5T1wAp5L/Pgf?=
 =?us-ascii?Q?Tpcfal7rUohrFHtWTOitzyBkzCNT4Hz8GJoikZ0+4D72y7l7W0ExbHZJJSaq?=
 =?us-ascii?Q?z/uWfrZF9SRMw9yHHfmSpyeVEq11/ZmFOv+3yuw+ea0h6t28EGm7/zsNi3hC?=
 =?us-ascii?Q?IUN7RiKUJifECA6S5fYkEvFZ68oOpyiH3xrK2hAuEeoKz1qjxu4uOq+s7NPo?=
 =?us-ascii?Q?NvXOn3HKWcykS5pqmfI2yNsvKd3LFb9l57EiM93YH+hxTWVbwZ0XmE+Am94E?=
 =?us-ascii?Q?GA4x51IsZF1yHB4AnrZbQpOavyrtXtviFt2FCWxfDSP2jJNy4t5DyMnZmTAA?=
 =?us-ascii?Q?obrKnAErGHntZPXw9azTxoJnlh6HNGn7S4yXxWF+rAbLg1ne6yu4jPLlh0CN?=
 =?us-ascii?Q?xiyyJnH5AtRgyDIKu+4+yCh33z6rJNjmy4SN39b2rcHs7tzG4IOVA13Q2B7W?=
 =?us-ascii?Q?qX3dSe7AhDFTqM8kYkQQPD3xaSp5jG6hjeI8r2I7z1K3TodTlRSY3g38b3hG?=
 =?us-ascii?Q?7CdRGzPnKNR4pZB6nkIVYY5sZNhDuwgQ2Gi6VE48N6M3FBKkfT8QlxOZGYWs?=
 =?us-ascii?Q?Bj5SeH+RDyTeXfRqjSvFflqsGg1a3PLplqsKulDq08i7ax8x2aPbb+PKAd0z?=
 =?us-ascii?Q?VORxfElwEsooyEqzsnoLbA+bxiZ1nIlBGqwK0cnQig9aF1SCNbnHLVFfX4Ds?=
 =?us-ascii?Q?0GtMMSpizBnyh03ufI73I27wwD9gBrbRvFB9rDpFy5cQxoMRqB6YZFS9jt/g?=
 =?us-ascii?Q?Kg2lDz0sa6Y2HsAf4LAvS85LJ4y7wyFusvXUxZQgNhvCH8IPvlK6J6nLjW7v?=
 =?us-ascii?Q?Z9+6YMy+tJpyAoLzKNQdI46ffqt034meC9ypWkP2Ioxm6erw+cjJlx7iBKRf?=
 =?us-ascii?Q?UCQidXwxvORgbDvI4GeeaJqRIRFuEXq5ANfzial1NGVizZw9ai1M3XTDB/hv?=
 =?us-ascii?Q?TQOU9+b8ZukSHCuzcNVnkdZEYZi9HVLEZmoyGdRQEfKMh1heN3G0H5YVa+k3?=
 =?us-ascii?Q?9CED+UurYOVeDck2r+o2uudgcOuilT8WlyIdXaS8ZglybbHeaKZmwMK+/UGS?=
 =?us-ascii?Q?+w/NzU6WVzFKUb6Pup+QzbcJw0H1HCPYr7KCfh4mh0mJ5lTm0FIuh84588a2?=
 =?us-ascii?Q?XacIkt5k5P8No2g=3D?=
X-Forefront-Antispam-Report: 	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 18:31:48.7889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e45c4e4f-a35e-479a-36bb-08dd714b76fb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7947
X-Spam-Status: No, score=-1.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: leohu@nvidia.com, dkodihalli@nvidia.com, tingkaic@nvidia.com, wthai@nvidia.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The GB200NVL BMC is an Aspeed Ast2600 based BMC for Nvidia Blackwell GB200NVL platform.
Reference to Ast2600 SOC [1].
Reference to Blackwell GB200NVL Platform [2].

Link: https://www.aspeedtech.com/server_ast2600/ [1]
Link: https://nvdam.widen.net/s/wwnsxrhm2w/blackwell-datasheet-3384703 [2]
Signed-off-by: Willie Thai <wthai@nvidia.com>
---
 arch/arm/dts/Makefile                        |   1 +
 arch/arm/dts/ast2600-gb200nvl-bmc-nvidia.dts | 221 +++++++++++++++++++
 2 files changed, 222 insertions(+)
 create mode 100644 arch/arm/dts/ast2600-gb200nvl-bmc-nvidia.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 13374bb12a..dbb2fafc4f 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -688,6 +688,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2600-evb.dtb \
 	ast2600-facebook.dtb \
 	ast2600-fpga.dtb \
+	ast2600-gb200nvl-bmc-nvidia.dtb \
 	ast2600-greatlakes.dtb \
 	ast2600-intel.dtb \
 	ast2600-intel.dtb \
diff --git a/arch/arm/dts/ast2600-gb200nvl-bmc-nvidia.dts b/arch/arm/dts/ast2600-gb200nvl-bmc-nvidia.dts
new file mode 100644
index 0000000000..beac18cfcb
--- /dev/null
+++ b/arch/arm/dts/ast2600-gb200nvl-bmc-nvidia.dts
@@ -0,0 +1,221 @@
+// SPDX-License-Identifier: GPL-2.0+
+/dts-v1/;
+
+#include "ast2600-u-boot.dtsi"
+
+/ {
+	model = "AST2600 GB200NVL BMC";
+	compatible = "nvidia,gb200nvl-bmc", "aspeed,ast2600";
+
+	memory {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	aliases {
+		mmc0 = &emmc_slot0;
+		mmc1 = &sdhci_slot0;
+		mmc2 = &sdhci_slot1;
+		spi0 = &fmc;
+		spi1 = &spi1;
+		spi2 = &spi2;
+		ethernet0 = &mac0;
+		ethernet1 = &mac1;
+		ethernet2 = &mac2;
+		ethernet3 = &mac3;
+	};
+
+	cpus {
+		cpu@0 {
+			clock-frequency = <800000000>;
+		};
+		cpu@1 {
+			clock-frequency = <800000000>;
+		};
+	};
+};
+
+&uart5 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&sdrammc {
+	clock-frequency = <400000000>;
+	aspeed,ecc-enabled;
+	aspeed,ecc-size-mb = <0>;
+};
+
+&wdt1 {
+	status = "okay";
+};
+
+&wdt2 {
+	status = "okay";
+};
+
+&wdt3 {
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = < &pinctrl_mdio4_default>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	ethphy3: ethernet-phy@2 {
+		reg = <2>;
+	};
+};
+
+&mac0 {
+	status = "okay";
+	reg = <0x1e660000 0x180>, <0x1e650018 0x4>;
+	phy-mode = "rgmii-rxid";
+	phy-handle = <&ethphy3>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1_default>;
+};
+
+&fmc {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fmcquad_default>;
+
+	flash@0 {
+		compatible = "spi-flash", "sst,w25q256";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+
+	flash@1 {
+		compatible = "spi-flash", "sst,w25q256";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+
+	flash@2 {
+		compatible = "spi-flash", "sst,w25q256";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
+&spi1 {
+	status = "okay";
+	num-cs = <1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default &pinctrl_spi1abr_default
+			&pinctrl_spi1cs1_default &pinctrl_spi1wp_default
+			&pinctrl_spi1wp_default &pinctrl_spi1quad_default>;
+
+	flash@0 {
+		compatible = "spi-flash", "sst,w25q256";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+
+	flash@1 {
+		compatible = "spi-flash", "sst,w25q256";
+		status = "disabled";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
+&spi2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi2_default &pinctrl_spi2cs1_default
+			&pinctrl_spi2cs2_default &pinctrl_spi2quad_default>;
+	num-cs = <1>;
+	flash@0 {
+		compatible = "spi-flash", "sst,w25q256";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
+&i2c4 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c5_default>;
+};
+
+&i2c5 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c6_default>;
+};
+
+&i2c6 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c7_default>;
+};
+
+&i2c7 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c8_default>;
+};
+
+&i2c8 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c9_default>;
+};
+
+&i2c10 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c11_default>;
+};
+
+&pcie_phy1 {
+	status = "okay";
+};
+
+&pcie_bridge {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&scu {
+	mac0-clk-delay = <0x10 0x0a
+			0x10 0x10
+			0x10 0x10>;
+	mac1-clk-delay = <0x10 0x0a
+			0x10 0x10
+			0x10 0x10>;
+	mac2-clk-delay = <0x08 0x04
+			0x08 0x04
+			0x08 0x04>;
+	mac3-clk-delay = <0x08 0x04
+			0x08 0x04
+			0x08 0x04>;
+};
+
+&display_port {
+	status = "okay";
+};
-- 
2.25.1

