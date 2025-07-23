Return-Path: <openbmc+bounces-397-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE58B0FCAA
	for <lists+openbmc@lfdr.de>; Thu, 24 Jul 2025 00:24:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bnTFp3mhFz2yD5;
	Thu, 24 Jul 2025 08:24:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2418::617" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753309470;
	cv=pass; b=Vd0pTq49Z2ufoIuCXnVH9zq/MnLsZ3kLEmh8hx/+vliSQIhBjVylol8unm1o7ZhNSK9om6K0VhA8UvvdgTV9EijD6VR9BdVLd3XgJpVXeehjNFQmjlReFMAbmBjhWxhQSbOlz6IFevKEGf6EdXNum6teJa5omjRSnndJYdR2UcuyD96phb17TvIiOMA0h501sxqZPs4bySG/Ca1f1L4WBPP7ICN2wefceTJo5mtu+SuOQ49mMIZ+yEjm+VPYbK9SCY0Mhiwvl2lPpkcux1+6odoRcTWqdLWSl1lcYs7iG0UeLp5J6Zx3s/BdBeoUQTE2ofMeBjSUyY26lW0bPeYcvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753309470; c=relaxed/relaxed;
	bh=sk7fGqM9K8ZSFlIJ0kO5WwvIMPX1r8ofHO2NM0+p53w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jYnY65QAJHvvqsg91oARYNRxPwdScW2j1vEEkfl1QJyXGM1X+3Tuj2r8bxZGLV2zF/oOkuZWOmAPoG7+98SCf7u1G7R/zyS32422/JvYf3EVKh7lJDwsLG0MrO0SfBtKutiP5DzuhoNj2ttSWvQW/g0O/HVfpCv83cDC7H5W9F6reVwTIUCGBLac4kqUb9o/FG5uOr21o78tBVj5rap751yv67MpiCqShBktTKWa+ckR3fm2snlmGK7q0dCnZFDg3/0pWHAm918nR/uABFzhf/O/hWFVNm1Z0D19i1l7+aaGNbpk1s6Ayb9SlHwlZ7V4KGOvwhLi67X7/QPZ0gI1Qg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=K8HinJd6; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2418::617; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=K8HinJd6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2418::617; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20617.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::617])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bnTFn5Nm5z2xdg;
	Thu, 24 Jul 2025 08:24:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oXTesyiU38NYNzf0VRt2LnoI1v9HEGhn1nhsqrgQkKzyGSmJ5q9JhOFuLULkiehFZtSvQX9cpta70LsQNW3eAagi8LVbo0Pxo2hV33vHT5YJdkVKvcGZZGZkgx9cT/EI1gYfbmaNe4ERwJqFIO8VAkJ92eZxWi5i7I7VU7hbOZ5zyKAiKQ8v1ErcmLE3uVMPwc7dFFoUoavfXsa1tciLEhZdbRnagS6oRbUWteCvDnH7CjeH02ailRePWkTD/eyoXvSMNT6lDb4oMK1692qcj71BUtgwjtMIA1ZQ1Ce46jp6QNOsZQ8qt2273LMS1PI4yz2YX2vbgDVBAlT14eVHGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sk7fGqM9K8ZSFlIJ0kO5WwvIMPX1r8ofHO2NM0+p53w=;
 b=COME3yr8f6U5kpHiqvc/ceDebilVFZY4Fck5q79IS2d4gWvQzbTDUj+/RmhzrAr7FnYJ+AimTwWt0QwPh+Uf1tBv9L6Vwehl4W0dT7wEPq/InnG11FKVUAIZww3GSWEgWCyTa+6HUpvGl/e5bdNemhv3OnBuXriw4XiBrYcS6FIHDcYlKT6avLTB92jhWWrwsnL/x/u+s6CiTaL6iBgIRt1R8I9GrjPo59NFvjIYmWCrx7kk51sUqtam2DLYLx2RSBu/bWpqyx/Udo8POcYWmgf8TAAXj+m+PIuBG1dYOA/Wo7nyXrThVO9rtypxAp/0dtNNSlJmug46DJx4IA1Gsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sk7fGqM9K8ZSFlIJ0kO5WwvIMPX1r8ofHO2NM0+p53w=;
 b=K8HinJd6v8ykvzSjTrhrkkokedM2zvvYC0CxhN8GK6ogvzngiEHsdOLks3kLNfbU1snmoFTXUAGlLPMGdsccoA9G33LoYYIU/y1oGhOUjwUFx+I+eqO6Z8bLOLcFp1GakMxK6kBPfga5trp3wzk8l1c+c8Mf4vtaaeo1nQn8A1MzbHEgZ6pN8A3mVEM0juyjDEhHxwPKD18CKLQ/xS6EsomrB4UCEVbgzED/tQVeeH98ZH/BJvN2J3dba9lk3cA5pbhy59A3RHoG28ASFJEQHLwMLC9TlXcLk1iSKA7kuVPUJDW6oeoqqU2YsCqD+fFwIR2VKf339ezZkFRbngH9gA==
Received: from SA1PR03CA0011.namprd03.prod.outlook.com (2603:10b6:806:2d3::23)
 by BL3PR12MB6546.namprd12.prod.outlook.com (2603:10b6:208:38d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 22:24:09 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:2d3:cafe::cd) by SA1PR03CA0011.outlook.office365.com
 (2603:10b6:806:2d3::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Wed,
 23 Jul 2025 22:24:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 22:24:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 23 Jul
 2025 15:23:52 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 23 Jul
 2025 15:23:52 -0700
Received: from dondevbox.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 23 Jul 2025 15:23:51 -0700
From: Donald Shannon <donalds@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, Donald Shannon <donalds@nvidia.com>
Subject: [PATCH v7 0/2] Adding device tree and binding for NVIDIA GB200-UT3.0b
Date: Wed, 23 Jul 2025 15:23:48 -0700
Message-ID: <20250723222350.200094-1-donalds@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|BL3PR12MB6546:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c06da49-340e-46d9-a682-08ddca37a475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7CGEVzMTJiSZMI/NxW5IVCiM+zVwQQkEyN40cIyq3WX0Y4XHGVGH1qolB57w?=
 =?us-ascii?Q?P1gKhhJJlB3nKLv5sGWtZzcP01NMbNmbowVsETnqm1dQdC0728apMJcp44WW?=
 =?us-ascii?Q?M5BTI+RC5dWhEaR9YTrkHRhhvF6KlreciUbzOjAmNPn2yucS6BEsoh9KPlK9?=
 =?us-ascii?Q?zt1p4mfLQGhatXLN+3oJe5z5V/jTd/l1XY4n4LLCQAu+wuPgMQhcSJ7qq4BV?=
 =?us-ascii?Q?Pjs/xBTDfNDl6SdHPI1s/rXlsL4OihLIqFhHvGUUc2/xg3Eu+FEf4vKKQMsg?=
 =?us-ascii?Q?gK+cZkd1kY+T7JqREVp1ZAloC0fUZNZw+Smg8LFDznV2bHOBMndiTfueESO/?=
 =?us-ascii?Q?zOCsgZ0MQhCzfjR/7gChyy3UPpUgeYVNXR6p1qf5SUeLM3zLBLQDnX0mwUbi?=
 =?us-ascii?Q?YetkXdD2vkX5pfxN/D/lMaA9xvxNPnOcC89BYQRDmgzxmmxmwO++AUjX3B/E?=
 =?us-ascii?Q?UzH+WZ+oEVJUuCojwmLEiBFJIJAVbeJfCZ6VnexvVfbZ+jLYjjQfaEo4R83k?=
 =?us-ascii?Q?LYEiSxozJ8GINtlR7heJQeDvf9bfsW4Vau3AW+x4w+NJUc0soeMTeqM8EwtZ?=
 =?us-ascii?Q?aed+ZVaevL2fYjUUPpKPw3xfD/GAf4hqiC5LuJ441haVshNFok95il5v7YDz?=
 =?us-ascii?Q?GLgnP/PNrYzc24jLCvk6OT2mGSWK+4LYLcyL5HAdbJkJTi3VdVUwvxbESEM+?=
 =?us-ascii?Q?Slp/0XeFudaf+sZ0ZKq1at/1F4WjO64FYe8x5msJA344/LPz3MFYaR3cbSh2?=
 =?us-ascii?Q?momBHwWxGVw3ug+9A3uUPgAvRXv5sxXmj0y69PH4xijbT8htRQlYSSUr4i5m?=
 =?us-ascii?Q?lM9o7ZFqGBx3BF4L8UFysu1GCWCECRi4lLjq0faEwC129F7GGYBnQPNZ3Ap5?=
 =?us-ascii?Q?Zs/PDmw/RV0pNwRH+fYxqIjimPCU5pjSqzniIwD0+0+r19XY/FBr6CZRbLDD?=
 =?us-ascii?Q?du9FM2n2fu9QXGjKdr6DaOPDCQa3WpHbL76yK+Bz5yK2J1TG6XbIRtm8vRF/?=
 =?us-ascii?Q?pLvCS+/CUOpj5VdozLULkKroORg6NlBbdmt8zxJ5e/uLb7x33qsNqeoG9ymW?=
 =?us-ascii?Q?LHmo9dQsqGT6ej2ls9NlYVU/U+mDlm0Km+Pd1/miPvESIYvRagKG6L4VT3v0?=
 =?us-ascii?Q?pk7yTXKqrSn6g/ZL5drr/m9AgHAzlT02bIS253et0HxS+deDi15w95HF7xqo?=
 =?us-ascii?Q?p16Cg82Pdm4tX6XaJt9sgBmhSfItPYDCUBLc3EPTKZsoMcceh7MpaT2bZQAO?=
 =?us-ascii?Q?ffst5PEUXyzKjb2uT8PtetBZaOIQFeJ1V71J9E4nHeScYXoZ5L38NNV/mHSv?=
 =?us-ascii?Q?x4maXObbS9sjVaaH/R8Y/CaQolMFYFBtPAxmdfKEqvhZcIPONS2QEOI0PT7A?=
 =?us-ascii?Q?toeImJGawszmgv4JgUX6awz1ws2Q2F3y/fmchP87SJG6BzatU6Hb4Vmy7UO9?=
 =?us-ascii?Q?CI8wHBCfA2v4u//xPhTDnVjsg/03jFitX7x60UGwNLZUGKW1fN4vc/wdaKBJ?=
 =?us-ascii?Q?K1CJrD8u+vqNCKn5KC++8YsG8QX5R5fS1Sy2?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 22:24:08.6199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c06da49-340e-46d9-a682-08ddca37a475
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6546
X-Spam-Status: No, score=-3.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Patch 1 adds the binding for the NVIDIA GB200-UT3.0b platform.
Patch 2 adds the device tree for the NVIDIA GB200-UT3.0b platform.

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

Donald Shannon (2):
  dt-bindings: arm: aspeed: Add NVIDIA GB200-UT3.0b  board
  ARM: dts: aspeed: Add NVIDIA GB200 UT3.0b board

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-nvidia-gb200-ut30b.dts  | 1028 +++++++++++++++++
 3 files changed, 1030 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dts


base-commit: 05adbee3ad528100ab0285c15c91100e19e10138
-- 
2.43.0


