Return-Path: <openbmc+bounces-51-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DD1ABA323
	for <lists+openbmc@lfdr.de>; Fri, 16 May 2025 20:48:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zzbg65r8dz3bNt;
	Sat, 17 May 2025 04:47:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2413::627" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747421266;
	cv=pass; b=jVl5lb2iEDt9oKbxQ5ymmANn4nWr/fB2gyyPP5bK+ZeNi7Ajq9HZhurXk7uyS+sommN5yzDSItMsUUHZI5vfi9GJ/Y/XvB863JC2M6OZvMFx8tisbOEaTuBzKOoLgHZ09qM8oWxx50uISGJgrEGYyWmc2JaoT2KqsBI3Lqd9WcBdr6ffu4mWmcTzM4e59zqa5LWzzbzckQsDypryCEvu1Wz5l11DiI+XW7bZg2NZ41elBp5/Ho6tAgoFGt9rZHQ4zGMGnGBtdHHmHj9ZXB/07v7WIsS4wkE00Gq9QKcH4qQB24aCgk43bvv6ViCTGdbbymEGYcRw80nlC3ot4Whhfg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747421266; c=relaxed/relaxed;
	bh=Nn4XnApxsN10/nbTU8UFXTSC6IDAdcqwaW+MaXH2Yc8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HLFeGE7pYayQY4gBVk+b63/E7Wpl7F6SaVdQYUyRaU/XO0WDj46Q8lG7SUrFXkprur7zHxcBlLpVHkUTZhGWgZ0CkaHBpEPS9fsBGw88NB9ippNbGqJimBxURMuAddkDyL0y3oEIoNGw7HotFCa0GoTABSfWtEab3hLAkR0dLq0R/a7t/jXPZ9xdbLFhaT1HAsdvgq/CvXfc9qaOqH6yPvnz7bNiFFdY6Lx9BgXk187HTmaJBIpWLOelNviKnjq0uCRLpPzZ7Kxh57pIOO9hqYZ0o/7MI8RhTI7KVrjG1+32VhN1CwXR91kNt0YCQWRtjDRWKisZsE2hAzOt3aKBHw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PKUoApa0; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2413::627; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PKUoApa0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2413::627; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20627.outbound.protection.outlook.com [IPv6:2a01:111:f403:2413::627])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zzbg61FvSz30WQ
	for <openbmc@lists.ozlabs.org>; Sat, 17 May 2025 04:47:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D9TjxuDnXHy/ccNfRmaZLyZNBmJs4kWh3V7bEmpk3GepgTL6JamIzwPvgdT1uj/PkzSShHGeifTdWwJJ5ZNkbITTfIV3CNSIYhqHu4nyMDLSvagFd4scz98eKECl44R7QPatWTwKz3vZwLWScUkuPUNBeJB98mPf6+zv9IZmlMrKbowxFXMWdWFD28X4EsbMGy2wlwFJblNTbNKOOFmYYHtPwSGjsn3sz+bHDaUdTW9Fsm42slgcDujePpBwYST1zqIohIJ1g4rgfHAKvtVVNZ500srg7l43tGb//TAXR7RqX97L5WL1lWmT0+RmeO1I5hNGgyaXZf5+VmEbD8oRVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nn4XnApxsN10/nbTU8UFXTSC6IDAdcqwaW+MaXH2Yc8=;
 b=YrjqL66+QHx2O8rikn3rmvUO/RzQEn120d9C/2g7eQT6jIFwqGyYLsy6FYeBqrq3FKcx3Uo6q+CCddnFZuLvqJIgavNGkXRar8CnPpzq3+DDC7eBsVKksUM0psH1uR8CXTNNeHO/8uWnHb2cJbK+PQBF+y/lPQSX67QCGJ7PkdjocwFoUvq9L41aJgYiM377+wKwjgbs0HUULcsc9NmE5WArm1EqwQfhRhdoKHhkMitqIdLOGZy20Lb4t3+VczxNI1lyFySgkKAmobLnTCodTWXgl7cSLPL6WEdkgJdTWTcN1HKF51pfo4FjSUoyVkAbknXIY64b1QqEu4pKqPw+Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=jms.id.au smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nn4XnApxsN10/nbTU8UFXTSC6IDAdcqwaW+MaXH2Yc8=;
 b=PKUoApa0I5+jHS/KMwiDzkVPPd0aWB+msl4O3OpYdT6y+iabuOH0srXCS5V85Y8/vA938rsriAUViXorbPnUIMHEsp23T4k2nRtVQoydEfZfArdPtm7P3yeoMT+cju7PBfhxvg+aBlC69dB8xlQJJZ3w0JhDMM2fYOk4PDnW8ZrIQfEQIvfPvLwydfYdSGPOveqyCTHDsMUh5mBhsx7Ei6k6+fZVzLCAKKeX1+Jeq5jS1K+x4Bz7u47YlSxo25fFh21hET+ZV4NlaTu3BhviJVmlrepir9TZzJElhJ4IXe9IYrNcH5gHaIwpvtewFS7Wq06ozWq5e9BaYl0oO18OqA==
Received: from DM6PR03CA0032.namprd03.prod.outlook.com (2603:10b6:5:40::45) by
 SN7PR12MB8819.namprd12.prod.outlook.com (2603:10b6:806:32a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Fri, 16 May
 2025 18:47:28 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:5:40:cafe::de) by DM6PR03CA0032.outlook.office365.com
 (2603:10b6:5:40::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.25 via Frontend Transport; Fri,
 16 May 2025 18:47:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Fri, 16 May 2025 18:47:27 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 11:47:16 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 16 May
 2025 11:47:16 -0700
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 16 May 2025 11:47:15 -0700
From: Willie Thai <wthai@nvidia.com>
To: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<openbmc@lists.ozlabs.org>
CC: <wthai@nvidia.com>, <leohu@nvidia.com>, <tingkaic@nvidia.com>,
	<dkodihalli@nvidia.com>, Ed Tanous <etanous@nvidia.com>
Subject: [PATCH u-boot v2 2/3] ARM: dts: aspeed: nvidia: Remove mdio and mac0
Date: Fri, 16 May 2025 18:47:02 +0000
Message-ID: <20250516184703.726599-3-wthai@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250516184703.726599-1-wthai@nvidia.com>
References: <20250516184703.726599-1-wthai@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|SN7PR12MB8819:EE_
X-MS-Office365-Filtering-Correlation-Id: 553bf29b-c161-43aa-c0b6-08dd94aa1b22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d9PPZ73EuZUEDziLIPoXiQuaTJRZnMTAZcIzQ31n5xbw6F1iL/vX14q3WF1/?=
 =?us-ascii?Q?+cFYwSzTujgVyLQcTHcQhsTE/UXkmNlAusZLQsgpRA2flYLYzJTn5xbTWUPR?=
 =?us-ascii?Q?vaB4vVg0WD7r/sec5YzWc2KyGEltEkgPoVcXO+dcrVfKmiFYQpwI3Df2nMXV?=
 =?us-ascii?Q?hSm5/osHfF8JndNd+VQvXylA6X2ntMAUfQLOTmH/1FGPt+kXKzdE3GC/tDkY?=
 =?us-ascii?Q?5a8bW8IUFvESgQdzfmPyos58kH/0MHQh0AdBvvOBa4Agd4DqB2OOIp1gBJi0?=
 =?us-ascii?Q?GSGkOnziTFyTmoGGpm7hKNghXoyCgOBRxpkoTVrdG6nvhoTmsjT1wwdZBt+z?=
 =?us-ascii?Q?Msnl69Rr5ZqbxGVCxXOnKhoCSRk/O+AcNLG8ORv/iKtKc8EuNOsZvqxDX7lG?=
 =?us-ascii?Q?g+F6ApF1+BDpYP1jZpapvwjN9dfJh7rlov1Rw224o1NYWXBP+tb4VLb74a++?=
 =?us-ascii?Q?wzqpIoGw1HtNxyw/sb2AZ0IrY9y7GTZXNl6ev65fMjBMZPd0zgryp0iAEA7K?=
 =?us-ascii?Q?PlCEWjSoQjdzE/WzVPytuJm9sDTIYWMbWFcoFezJXEzv/CtY8oFW9Qkq6vPd?=
 =?us-ascii?Q?ON0dwfdG6jIft2chhgCXew4pGZamLOeMw4RX8EBlvYoejfZH0w1G3Ak5W2FT?=
 =?us-ascii?Q?ljLg6yrxkV2DXPfDBLoO99q6LdcoQ+zBazoRPQt1hQngy8VRNKrgpOD2CkVZ?=
 =?us-ascii?Q?GZUhLlCi/fou/DEtwMF9T20oG/Hejhkp82XEQeWRzzw7w2jKb3xb6xvWTToN?=
 =?us-ascii?Q?Z4tHp2j5sko7gmrF1c37+/ORAoW9CgBa0zQcPqvegjix7apcVxD1s7eHAwVf?=
 =?us-ascii?Q?7v8MXaG0l97LNL9ufCUq3Zsr8wmmMGuSRNZOi9D/vvsVLdrkiX4Q8dz7wEtS?=
 =?us-ascii?Q?9/ldHpwXxfr33zUfL41pluKiI2AP9Ln4eG70+18+soRySj+0Ee/H0J7M8GuB?=
 =?us-ascii?Q?Oi+OK2VqECsm/2Kjv7cvJSTfItlPH3zprjEjbyRmfkHAns9058yfQwWOeyQO?=
 =?us-ascii?Q?vT1gXAD9AevvijzadreSfLUcRTO8vvJNceUT+SdvJ0JclqTMJdh9cEgRQzNY?=
 =?us-ascii?Q?AHkeO7/w7vb1I+AOn85UTgZGcUvjRCCSyp7jXoNxEvw44g9tFTatFO0HBmSG?=
 =?us-ascii?Q?n+aRlx6zznGGh41u9EYYhWlYPfSwjoiqdYQ32QqPuLp62nSB2l3K/izDB5iL?=
 =?us-ascii?Q?mOUh0I+APDaCa05ZmiIEHxKiZoK0s1Y7vPHSAPMCtclCkIcSmkUjHiDog0WR?=
 =?us-ascii?Q?bvIHWkwfFytHI6QtQHfcbs97vi59dHQ2Wfr9Wl90Ofxiq4Hw9H6rrUOZqoZ4?=
 =?us-ascii?Q?UpehZWmbkCvpI+lYySPxVfoecNNFeWexJeK19+6GZZGJh+KhDGBrGETh56j6?=
 =?us-ascii?Q?wTrcrRQzICZMJZqGHKLHMvpp3hs45uDwgoKNiqfpPZHkmbqxxn822RvGRea1?=
 =?us-ascii?Q?vLRxyzDUt6MYcXtkND063yWeoVFbA8NP1UUVHO1pIR4RG5/g2whMXX9/lmgv?=
 =?us-ascii?Q?0HqoXOV27zEvLSLtMUzPw5acxJM0g1gK4cfM?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 18:47:27.5612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 553bf29b-c161-43aa-c0b6-08dd94aa1b22
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8819
X-Spam-Status: No, score=-0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Remove unnecessary mdio0 and mac0 for the latest version of hardware.

Signed-off-by: Deepak Kodihalli <dkodihalli@nvidia.com>
Signed-off-by: Ed Tanous <etanous@nvidia.com>
Signed-off-by: Willie Thai <wthai@nvidia.com>
---
 arch/arm/dts/ast2600-gb200nvl-bmc-nvidia.dts | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/arch/arm/dts/ast2600-gb200nvl-bmc-nvidia.dts b/arch/arm/dts/ast2600-gb200nvl-bmc-nvidia.dts
index bf0fd26617..065149478b 100644
--- a/arch/arm/dts/ast2600-gb200nvl-bmc-nvidia.dts
+++ b/arch/arm/dts/ast2600-gb200nvl-bmc-nvidia.dts
@@ -60,26 +60,6 @@
 	status = "okay";
 };
 
-&mdio {
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = < &pinctrl_mdio4_default>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-	ethphy3: ethernet-phy@2 {
-		reg = <2>;
-	};
-};
-
-&mac0 {
-	status = "okay";
-	reg = <0x1e660000 0x180>, <0x1e650018 0x4>;
-	phy-mode = "rgmii-rxid";
-	phy-handle = <&ethphy3>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_rgmii1_default>;
-};
-
 &fmc {
 	status = "okay";
 
-- 
2.25.1


