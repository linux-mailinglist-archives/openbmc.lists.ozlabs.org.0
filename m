Return-Path: <openbmc+bounces-466-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5516BB28875
	for <lists+openbmc@lfdr.de>; Sat, 16 Aug 2025 00:44:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c3cc62Rd9z3cZR;
	Sat, 16 Aug 2025 08:44:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:240a::602" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755297862;
	cv=pass; b=ai4xktI83kBBSVugcod5N7+xY/3jNeV0hwxyVRlaRxqe9/vlJW9BQj4QKbnlEvVXUqEnLTKxX1OMveQJBHG0NEHLULbMm6nO6kAVZ1sbnIqVScPji5q73NUkAT3GXFJOBdT5K41YdJT3gYLVZIbGbyXUKig+d+iAINb1R2QLpN5sg7QpCdvJ8V4hL2qjGm2qUrVQ/SV4Ce3eH8ZVEA6UUrwbUL/YfXw9SE4GVEnQNoPLPOXV0Zv5AzhTVfpFxhrOzjbHk5MPuCjlwvgg9RKgaRw2zkQJbQuEEZNmyxcPO1QsdmF/Izy/y5WhIG+ofWgwrdtRDwe0thh9Vxa0qH4o3A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755297862; c=relaxed/relaxed;
	bh=EK68s2SbsUE+hKjDYrAHOcUn2ehn7pg+/Aah7Nk8o64=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cBsGYpDwo91stNtJqg6bJ9Oej5mp0s9m6W2uCANxpaePxkgT1Iu7+Jf9z/oOnxZOm7hoDRnbuKPJx2AVg2OIRzjCyNuc3JnCaScRY/HmpYTBZ6/jgpM3bETUSXRTmAPeAHxk2gqImD3sjGgxnkhU7L2GP8IbywJEPSuJoq9LhQxMcjMoDweXELQlZSoTpRZ7lcm4kLUHVfxYF2kwltFJNgJ03QMOOixhNx+NKKmZu6Agl12KpPXe8CKVHn8YKYrWJfIFt4U4/LTFyF5v6hHxGVgGve2gGoq2hCthmv3/yS0ub4FeUxyWrJEaZr9wxvf8IC3veuYNtmEZp2KgB/sdOw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=blDgkxp+; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:240a::602; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=blDgkxp+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:240a::602; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20602.outbound.protection.outlook.com [IPv6:2a01:111:f403:240a::602])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c3cc46jVgz3cYm;
	Sat, 16 Aug 2025 08:44:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v68jxFjXIPZFUnctvmXh0bnvwgoL+nnSLmJOi8VUGr0YJnSQRrZ5Nr/A4XapTZC2uQO+tIadCxffWQpdsLVSmktODhgBcmUEOz5ySu6cKWwr2RPIhzDNx1ATMRzqQYDzuhAVQLEeG5yd2rrXrd6TT/DUdVuBisZFVJV95JoiCh3oWGL8x1MFoKz5iksbOJB0Q1pVS+uiWLP1iFAP15BPrwrxPuLX89M5oCb8dsd0kfxFSATGJ9pvZUPO7qpRx5Yp9BuTGASg76gt/8+wOPxfhtX/KZeAyL5Vg0XNokzV10Y5SFgHDKWZ2N3BmuYuKD1o9XppENaJMRJ/OmxfZcpJAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EK68s2SbsUE+hKjDYrAHOcUn2ehn7pg+/Aah7Nk8o64=;
 b=MpT5JlT//YNCoLjXRxYajUZWLhSQJeuBT7Ei+XBtyJYU4fSNRuZd+eoC52IaTHleIFSQ8gtU2llJtmeK8OQZWHbCxAtFRyl2IF6KaIrih04DwWLcQWkgkuKwV2z7ZAQ81mryZwLqObAhGQ8fIcU/YFGBlGkA32fIFKMwmbX6xsgb2k55PWYINgcbeEn5miEmU0MmWkrCJQom5RRCscTGrrPp46mtLOxg6Y0o+lGDwcwAoH8tjYMiKuCG087CW4wCfyzjqBWq8wHeN9yeE2iGj29bo5LbJXGXHxUnakCZIkZeEy0nu/aJVC3hIfivJ6KxTi3mGvZ2JAs9/G6RElUEEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EK68s2SbsUE+hKjDYrAHOcUn2ehn7pg+/Aah7Nk8o64=;
 b=blDgkxp+ETT/C/lRnQ4d3LvXGWWS299KqDdCFLx6ULAzucumS9u29ATs19O+vl48UTWLWo/cJjEo9RvIYTvWbg4fIRfhu/DNA6AIplzElxID5vpz3+Km15Slb3AVqKvWn4xwqZiqg7n6AA52tobO7chh2robq55v387oDpzHRCrdOf+nHfKo2bllfkJsZdCIcZTTqq7wD2Wn/T36doy5TX94GxvPj9eTO9pGrb/Tv3UxOojGiuGOoKVhsDxizDMqqNjlI05G2A+20pAei9u/PAsJxqT/uOzJbYh1DOSMbi1Pv+XhcL8v9gN4q8MRFWKpCIF48+eC6pevGfOT6eU1fg==
Received: from BL1PR13CA0402.namprd13.prod.outlook.com (2603:10b6:208:2c2::17)
 by MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 22:43:59 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:208:2c2:cafe::32) by BL1PR13CA0402.outlook.office365.com
 (2603:10b6:208:2c2::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.7 via Frontend Transport; Fri,
 15 Aug 2025 22:43:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.0 via Frontend Transport; Fri, 15 Aug 2025 22:43:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 15 Aug
 2025 15:43:46 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 15 Aug
 2025 15:43:46 -0700
Received: from dondevbox.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 15 Aug 2025 15:43:46 -0700
From: Donald Shannon <donalds@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<donalds@nvidia.com>
CC: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>
Subject: [PATCH v8 0/2] Adding device tree and binding for NVIDIA GB200-UT3.0b
Date: Fri, 15 Aug 2025 15:43:42 -0700
Message-ID: <20250815224344.908130-1-donalds@nvidia.com>
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
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|MN0PR12MB5716:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c1115c5-d994-4a2c-d8fe-08dddc4d3972
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6xxEZ+Cg2l11/kC3z0mqS2KqTW5ZV0SRxfsVYwKnCfRT84wOei7ISVDTiYLW?=
 =?us-ascii?Q?IMEM450tMxM6dNlXoxirHiwMncD5nC7BFEPxlKOl6tqaL05HCzvc5lQNHYVu?=
 =?us-ascii?Q?hbvNzCKMUKBaJIMazPon3/Yp7c39v7HvPxJCXnLyXGBeFzTh9WZCdZ+SnLSo?=
 =?us-ascii?Q?27wbt1+IWlXPEYOnVXZqsXgMaLJ/z+tahGMd8kBBYQYDE6jc9KY2f0XsfYvG?=
 =?us-ascii?Q?91lhC2Ld6JXBMEpbEYnjggoBXWjVcKtiawVwbo/o3FGImPZ9yG2ItrR5VsMQ?=
 =?us-ascii?Q?HiAAvd+eu0mjkswTMooeWLd7EgR1xHZuF6s8hTj8k5mz6Lk+xBBhrh8xunxs?=
 =?us-ascii?Q?KpMutxYuROAVcELYY+jZ+mLYwTqW1WAgMTyGlNNxKwARB6ZSjd5rgo6aJ8n7?=
 =?us-ascii?Q?3kEpfmZtQNGZTPFRzPUTffPf6YCLpo4KKNgQDrn3eHt30cqhXyhAJPLbt6fH?=
 =?us-ascii?Q?D8pqQGtDG9N++wR7NeyML+MP4fCeckD7M9N0aKRXUf7YW4aO6NAlR0NFN1KT?=
 =?us-ascii?Q?bnrL2E2s06HUXCnxfNjR6PloEi5oStBwvUJGDdZOUhWMtmGua+8KrZaDz61H?=
 =?us-ascii?Q?sGerW9Y8qj/lP4BAFPQ6hifsYZj45hjJNBKXlovmCTIqF+9H3QmGbrQOnkwX?=
 =?us-ascii?Q?QdIawfEyKiPZwhQMgXG4WYo47hLXCPRodesN4r4cDnxGyYGDuMqDCUOOShPG?=
 =?us-ascii?Q?yWob3xPsXTSNV7XfFjGvu+r7NAALji1y2dAwPaP0zL+lRrUs86j+M0DyAZKa?=
 =?us-ascii?Q?8vqQBxW6k3WyFIyDVCRwQBnrK6UB5dRT1X8sK1Evh9nDIdp04bW0u178oud9?=
 =?us-ascii?Q?fpNdMsHlvmOn/eN0rMIEOMqhIxAz2yF6vHwdT88ZvKkjg5CaSoSvTcICmKBZ?=
 =?us-ascii?Q?g8CmHxJ4iAgnyJzd8AWBUAS59mSz9XEm0HUanx0Wk32HKfnuJJzGlabJPRbj?=
 =?us-ascii?Q?gVf2V7xQQ5abiWBM+xTkoV/RvOWARDJ+XFMFg+BvV0oMldXxSpaoSPKwz+wM?=
 =?us-ascii?Q?H0ynvVUpYn3vv8RfKG+KRUOI6veVskGPBgGzYqw2xoH6H53FdEjLudcG4ZQr?=
 =?us-ascii?Q?aRk07YBYTMvEijw7Brw1ICnN9svYsSZbQ0SuEV55Hg/8NjhB2gw2jYo0zwmy?=
 =?us-ascii?Q?qpmgrtDizSbCgkTDnKiq8BgHV5fIKIOPe4mdfGJdn89f/abJbBP6cks4wNG6?=
 =?us-ascii?Q?26cB4HX0LgxWygv1ocTR+3fBKnFyPRMCYXQVUXaCJSBGOE19AGnSK2kcNdL/?=
 =?us-ascii?Q?UKRLFt8N0dJnCkBVV8K2T26Wq56+ic/zGdyytkZsJOG/TqrXH8DKrtE+8EFR?=
 =?us-ascii?Q?fe0rkNFiWL8NHXdMQd2l5H2pwEbx+9SF62ZEhQ8H+XX64m+WnH7bBC+0exhA?=
 =?us-ascii?Q?T6qX4IDa5A5R7zqyOe00arE+Wsn3rAcwWGbJkwIuI8ibQaZIjjmDRNSBhMm0?=
 =?us-ascii?Q?pA409st8BtC+nelVEGvSfana6ZyIBQKetzzqDrm43mvUKQIse4KF8GltUz2R?=
 =?us-ascii?Q?LOtl/DQ8fmYgaDA=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 22:43:58.9004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c1115c5-d994-4a2c-d8fe-08dddc4d3972
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5716
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
 - Added Acked-by for Krzysztof
Changes v6 -> v7:
  - Removed Acked-by Krzysztof
Changes v7 -> v8:
  - Added missing linux,code for identify and uid button
  - Added Acked-by for Krzysztof
---

Donald Shannon (2):
  dt-bindings: arm: aspeed: Add NVIDIA GB200-UT3.0b  board
  ARM: dts: aspeed: Add NVIDIA GB200 UT3.0b board

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-nvidia-gb200-ut30b.dts  | 1030 +++++++++++++++++
 3 files changed, 1032 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dts


base-commit: 05adbee3ad528100ab0285c15c91100e19e10138
-- 
2.43.0


