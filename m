Return-Path: <openbmc+bounces-493-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08094B2ED70
	for <lists+openbmc@lfdr.de>; Thu, 21 Aug 2025 07:11:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c6ryX4Wmbz30gC;
	Thu, 21 Aug 2025 15:11:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:200a::62f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755753092;
	cv=pass; b=NWe6csxskckQOkmVqtN0y478Pe44IeMtaSXACpUNb/zp9OfYA74WCH3+oCjhMn5KWN+0ttVBlmpmaoR9/nFq2TPwH3cIvAEOsPTLaXgNig6xFJG6H/gX32Rr60QMqRHMIG3HtNJqZEnupt2FfOAdQpXp0hm1Hq/vDSqs1rhEDijkwbNvFMwAGyAsCVoApBRDn8PnVI1c5bTcsvf+xZM0BOk9UjEwzxeT3NVkgqxd6iZ6JB7Gro2jRSNRHGP70i4vz2YmetpQADmLCmx6qQlKY0VRSY2sfT44QjpslEfk0epvJnB4Rco1QSl/46lWwndRQHYyPkQ5byL1lwcbdFkjyg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755753092; c=relaxed/relaxed;
	bh=llgtxgTHE9TOzql9by189XrkhFTZZLPUvu0FB7ZL9nY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YXPwIipgOadE8m1E1v3yS90a/y02CGLk+E2mkKdnmf7GQ9PtWLRR9w30dmR0Cvbxm5/h+Dn/qIlvVr/dgemXkBMDfjdvLSEiWD4jqRrzY4qr0kYWGt+s4D2fVoEpjr8Ca6EHfPfZctfw3xyoKl3Ezihbu92RoECDKkbRyPyBJv+EvUGhAHbwJMC6KnciemSQ1SgpWamfaQ4dN/Q8XpFQj06sy2Xb/KM9XxqgaCFfSyRrYhdnlBm9DA/gaCo0vyFMPvgK3YfP2TCpqFJX+EmEeFF6voHtuuwPOusQgjPEpfdW1BSPVWmYJL35tMFoanZnmJNqFvctEkemphI2+6osfw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MJ4l6ZGb; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:200a::62f; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MJ4l6ZGb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:200a::62f; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2062f.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c6ryW1rr7z2xpn;
	Thu, 21 Aug 2025 15:11:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0KYhNm9olSos02UmUCK6P1jRNJWH5qQis88SJ3myiaAXF1Eaow02JFb5I64aBp2gG25OL/U7aWerZzaM2JwHyshTIMspjTkT5s8olmrg91UbZU7+SMPEjJ9VfdJEHyN9J0A4RMKrOeSRksMtijXsEC2z0vGMoK+nw6c1vvMKJ2pKa8eTc3r1KWUKPqj8ogiDv6MibLAwcb7Lth0Mpw04+QgSX+PIve1MJYC1kPlg/OX5MEAql6xqd4HNokzvaDi4X6qnMaJSwSd5E3yWRxuobUnR/UPV+plZ8f9kKj5PhVceJMhdRm9OJGHoeb6wwT/AXyZyWkv6igRwWQBIHr8HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=llgtxgTHE9TOzql9by189XrkhFTZZLPUvu0FB7ZL9nY=;
 b=PgSNiOVk1RSg2CP036+/ofYiKsVCE10KGHpVs7ADAUajR3/KR21IDngMqOAoPY4WQH9J8xmBseiRwfltVNxN7ua/3CpJbiJItu4ht5O/GpVg1fEyJcsWF63jereFzwkXpBlddMdp+yjSBBeiBpfsij//St/a83C9Pa3sicCLvSa9Vl9D1G+lZj6ru0ZewI18E306Sscz10xrvxo8QOFT/hc8uv9lT2fiEpK+0XN2jhGPY24vdek+1zY7H5GNf9WtmF7kHmu8gQtG8XMzgrxidI/h2Y5y1X9MG3Gyf/ggCwoJyziT5r8Ny4U3fDoI+IeSr6b6fzBMWXNpgtfexqiSoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=llgtxgTHE9TOzql9by189XrkhFTZZLPUvu0FB7ZL9nY=;
 b=MJ4l6ZGbeZikTxI8JyIo3D7RswXt3i3vwPG8IySjbULlH51u/ufxH0I6REKefrJuOJXAZmakObRR9fpWBGGIIJDflrnR+uX4PE0PBJoRIDrWhJsWS+O57Volk3yxd93u+OKTN78d6aQwvW/+wVWLDUWbpFKFhlqIj964A+xWKb/Abf9ZvQQ4np+kOt9lVG+ML6THaov77epHcuq8MynC4A9FEV9IPfcSu6pq5FiJsujUOmfoteM+Yo9OCaxWKjgl4Z0UNh9k/higAMaR/yCkSl6o0ljSb2XZrI4QePaBI0GCz5Y+XdqJ9vJIlRjn+AdqxAldLiG1ppczC+uShugO6A==
Received: from CH0PR04CA0107.namprd04.prod.outlook.com (2603:10b6:610:75::22)
 by SA0PR12MB4495.namprd12.prod.outlook.com (2603:10b6:806:70::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Thu, 21 Aug
 2025 05:11:10 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::82) by CH0PR04CA0107.outlook.office365.com
 (2603:10b6:610:75::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.15 via Frontend Transport; Thu,
 21 Aug 2025 05:11:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Thu, 21 Aug 2025 05:11:09 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 20 Aug
 2025 22:10:51 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 20 Aug
 2025 22:10:50 -0700
Received: from dondevbox.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 20 Aug 2025 22:10:50 -0700
From: Donald Shannon <donalds@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<donalds@nvidia.com>
CC: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <etanous@nvidia.com>
Subject: [PATCH 1/2] dt-bindings: arm: aspeed: Add NVIDIA VR144NVL board
Date: Wed, 20 Aug 2025 22:10:46 -0700
Message-ID: <20250821051047.3638978-2-donalds@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250821051047.3638978-1-donalds@nvidia.com>
References: <20250821051047.3638978-1-donalds@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|SA0PR12MB4495:EE_
X-MS-Office365-Filtering-Correlation-Id: e7ffe3ea-3fe4-4510-1f5f-08dde07123fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R8+fl0qekNuhvJRQrihlKrPcf+46n8fV/qklPEEn1C3GeYfi2ETsa7/E5AKJ?=
 =?us-ascii?Q?gHRLfZPjyC3dP9OMpVp9a7iwaBoOyBJGE4oXaP659jyATPcpTRIUgxND2FOR?=
 =?us-ascii?Q?x2FJSkVFh1BA9dFo/H1wW53E2fvBy1SmfNnOZyKv/+Bajh8Qv0IcZGpFGN1D?=
 =?us-ascii?Q?uyUYu+MBOtZF6kIs0Atd8r7BlKDwa1VCes9VwWQ61Uo008P7sEj2PdPoD9yZ?=
 =?us-ascii?Q?B4HqDxzPlFo00NPMII2Sf9R3PEAZRutlu3NsaDe8LdtiM6tf/TW/FHDwnCk+?=
 =?us-ascii?Q?U+OHa9bbjFU4WoowvuFCKxNtfhN2MU7l9BvNqB2IKahhBjLUacl52JjHEOct?=
 =?us-ascii?Q?USTrvbTde6PgO6mKm1Zho7N5LOSWvlgpYEcaNmDqcmwNENPUXxNvDVAqs8PH?=
 =?us-ascii?Q?LbM9yaDOcksBGVLGW7D7+2tB7iNLzH01kc0WNwfDlP7widffvYiB1ffglfw9?=
 =?us-ascii?Q?BnyjETvWlfiQxuwXbck+kgdcBJpfImKoF24CLQmDAjigDZOXRWW+/JghWM7C?=
 =?us-ascii?Q?mAPdM5VEy/lPcKdqqMlfNdmOUVebKiFkubqP3PbQOE4D8r/sGP0IUWK3CkCI?=
 =?us-ascii?Q?QvsuXs2LMIOhcHDfr9QIrGZlvBjJTLsBVE1KM3KBj1F/KbIXNRYE72D3deaJ?=
 =?us-ascii?Q?wwHgZfHKrFwMYdipN5NBPfHu/45btm6qX2QeP/CgpuITwYoJ+dajC87AyQkS?=
 =?us-ascii?Q?2ndQbHN3jvEjIBSMTSYszzaXS0GR3j5SM8kpB+19l60KbUm3fNZsN/CdCWdF?=
 =?us-ascii?Q?W7KHdROmim+miylrzQXsiUSbI/4Tz7c8YFGBDz3BafbHl9yuWbJIzPrIDYlQ?=
 =?us-ascii?Q?kn/JLelnA9b3NDi5eybRC75HtLhMHekulYAiFU1JXkRKKdc0LVx+ut33dJJF?=
 =?us-ascii?Q?uziQwFQXyIjEG4zB8M0qdw0FUSOqrzurYgsbnnZrQ6y1V6OuRpEJsf0aFM2y?=
 =?us-ascii?Q?mEHeF2cGTphfg8pRy3iIjiv7FEsCBbQgLMt8+AosgSSgf2la4IFUg2yrCDcm?=
 =?us-ascii?Q?CSijhqzAozYE/Sxh8pVcxe47tjjGDV8r4yGIhb9mG14iB4b16LaNxw4OPZUK?=
 =?us-ascii?Q?qSh9v2u2IQ6lefuIQHzS2tgrUjm2S1rvcLFQKHQEgZRqp5YAKmpJ/6v08lIo?=
 =?us-ascii?Q?bDWxeL2pMnLgZRjGo1CTXHI2yM7MqTQcrYhupyxB/k6ujFA2Ej/7yPrvFPx0?=
 =?us-ascii?Q?Ufs89mkBofoIiCOQJd8T2GUQUbwcRSvq7Cp9emkrNen4FcY3AlVszkeKmZCh?=
 =?us-ascii?Q?E3Dp8XZbZKBDIoqF57M9zbYNoys6JNJHEQWmhnYFqMyW+ciHQUyKQLr1Sz4n?=
 =?us-ascii?Q?Ugg6yuohvMse0EEvJYUWQgVyVEpW3uuSwI+oBjlrgkxO8Xz6+j9RLILH5RYf?=
 =?us-ascii?Q?Xcn+Txx6w1HAfMFpPsz1qv7S5Ky+igPZ4O6W5XTaO28HTjtpRs2Fzef7gk2G?=
 =?us-ascii?Q?Sjr3JvT2ws1c2MGlvdAwme2c/UZSpxIcldpGsLPTHkl+qECwOeITuQVyYIBy?=
 =?us-ascii?Q?k9nn/FiVMv4ArhbCb9k7Np8Nm+CC4090B9vd?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 05:11:09.4822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ffe3ea-3fe4-4510-1f5f-08dde07123fe
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4495
X-Spam-Status: No, score=-3.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is an Aspeed AST2600 based BMC board for the NVIDIA VR144NVL
platform.

Reference to Ast2600 SOC [1].
Reference to DC-SCM Spec [2].

Link: https://www.aspeedtech.com/server_ast2600/ [1]
Link: https://www.opencompute.org/w/index.php?title=Server/MHS/DC-SCM-Specs-and-Designs [2]

Signed-off-by: Donald Shannon <donalds@nvidia.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index b3c9d3310d57..11e17e9ef15f 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -103,6 +103,7 @@ properties:
               - inventec,transformer-bmc
               - jabil,rbp-bmc
               - nvidia,gb200nvl-bmc
+              - nvidia,vr144nvl-bmc
               - qcom,dc-scm-v1-bmc
               - quanta,s6q-bmc
               - ufispace,ncplite-bmc
-- 
2.43.0


