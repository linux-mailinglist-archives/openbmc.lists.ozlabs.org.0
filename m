Return-Path: <openbmc+bounces-613-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50087B50CC7
	for <lists+openbmc@lfdr.de>; Wed, 10 Sep 2025 06:18:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cM6r373hMz3cgQ;
	Wed, 10 Sep 2025 14:18:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:200a::624" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757477907;
	cv=pass; b=nu6Yp9rItqLBlPOeupM0vIEE5Izj0NYQOwUWeOm/5xfFO4EzDEkgPsy2Z5YLlEdIk05+KAkBIPO1i7FhSY7rmSVFBivO0mtEYnaD48I5exQ8xGVNsk9bAeFrsuSJrTX9t2jA27BPBQVNa/PWk0CaV5g+56EvbhgzUnH25tqq5+cncb2IOwZxKw/QZ6U9wQc9WadwAXkUDd4iY1EEh6oH2B5rGcA4C1jGhN+vwXs9MPI6iqbkdCP2vuUye+LcB4am+DMDfiUNNN0crglGIJuatN12fPU4jFY52YV4Lgz2FtKWhSaQ9/e5GX/Dkrghat63HZL7GT0st+f4FqQ4K1Prkw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757477907; c=relaxed/relaxed;
	bh=sO9hxbyZhHDdinaF6r2kJd79GHsslS2ciL9LKu4zkpY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OjtwevnOTAnP9i+gxZkutaQ0+GRThGEh1CvW39lZYdgbVJD3ZaeoH4ckqZ6EWcBaXrF8UlPS/ACdTuDYRSorghtkc7nX/ResjF6g8ZHrPpTdQwQDLCKERkpxAt60N1CjbvJNtiJTe+yKZ62HvDBrpojXVczC2A5dT96GxNW7NYMObLtALunPdQXYNwXVpMndnIYkfXsg1W4cCoq1NSvX2zH/+2xYWDFX2/5E+xf0BtyJSq6XxsNp1jhR1CUGR7I4WkoZWcxCCnkM0NbeFH1zOi9yqCf8YrDRyC0eNJFR2Fg8C4PtPmV95uc8tEa7C5WxGxJH4LMn1heXf4z+khLtFw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hJ7LJpBT; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:200a::624; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hJ7LJpBT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:200a::624; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20624.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::624])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cM6r26TGmz3cfW;
	Wed, 10 Sep 2025 14:18:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQ+o92ge21F5z/HzV6pO2vZQuR1SUb5bNEJ0BGB9SfBQApsf39BJTteZoz9TihceSsU6t4BlClEDkXiQMZsWVzaY5boq7oSu7e2HbODwJiJtOX37KporKQMpW//g550g2hCDNM6fILhAWOEkCXFmpchfsjezwXvHcSiQTBeInT8Fn4IIIkGaiVZTJ39U4cGkhgIpe29lp1lq0Scm59PdloI0H8kwXGXUxfXALUhFmecWHm0Uw3XhJWiGTqIHai1pu25utr9tbjEexLpws/Ce3VMUtLweyl27oXvzUz/3ATu1NtdocjehVAXOzkxvh8O1MYjN3sKCSiKrhnM5ER/nog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sO9hxbyZhHDdinaF6r2kJd79GHsslS2ciL9LKu4zkpY=;
 b=Q5dT2xkZVxCI09o5FlDyCPT5yHeK5jBvy8Mk0JbP0MJp+sj4QFdiKSlUtcsmLerFBQCLRzYxvZTR7qAPG89r06F27O1iNu2b/f+ND90slHW008K9O1eaP+PjZlI2hobVIFu7w4fZjQb2y3coW45oFEDGQvoooRq+xL65/00CBLZNxgC+a0va9RkNmEJ+8aNpy9skdl8kPlFlnAaL5GTuHKhA6oIF8bIg+i8tXn+3DdFltHTfFv+jKzcJeBHope3SoYUSwKiBUVFCHoA1fumVUaGObDM6FI4jWADr7yNFJVolRq1r8OXYbyynW7d4rLEgdqJmfFPUzPnbah0jKGXSZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sO9hxbyZhHDdinaF6r2kJd79GHsslS2ciL9LKu4zkpY=;
 b=hJ7LJpBTXtZwzisNC86wWIZ2saK2Mr49Lm4WGUGh8oH1TqR0zofKR6V2gz2NfiOUTENlgbdZOnEYhfgnoEMcK0RfM0cWkDmzLgkwimjmVuqH2DJ+xIuKyVpwIgU2+xQ98WKVcqL04FuLbEpPzzqNlVLSZOggaDarzvKqmm0QXtlMbdmEJhggp6nYnPr/TcQcR4MD43XOaDot0hf1hllBzzr2xbfTUZsVEpzU+uuVpblK16snPxyNO6eeRwBgJOgXpwpblVFwZ/voDQPt13Hvyx0+nX5vfdrc0edZlapJX/2p79CM2OAR0dzh57VPZvNBQHXXOkBpf5881AvZGmQtRQ==
Received: from MW2PR2101CA0034.namprd21.prod.outlook.com (2603:10b6:302:1::47)
 by SA1PR12MB9547.namprd12.prod.outlook.com (2603:10b6:806:45a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 04:18:07 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:302:1:cafe::d0) by MW2PR2101CA0034.outlook.office365.com
 (2603:10b6:302:1::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.4 via Frontend Transport; Wed,
 10 Sep 2025 04:18:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 04:18:07 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 9 Sep
 2025 21:17:38 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 9 Sep
 2025 21:17:38 -0700
Received: from dondevbox.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 9 Sep 2025 21:17:38 -0700
From: Donald Shannon <donalds@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<donalds@nvidia.com>
CC: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <etanous@nvidia.com>
Subject: [PATCH v9 0/2] Adding device tree and binding for NVIDIA GB200-UT3.0b
Date: Tue, 9 Sep 2025 21:17:34 -0700
Message-ID: <20250910041736.245451-1-donalds@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|SA1PR12MB9547:EE_
X-MS-Office365-Filtering-Correlation-Id: 56212dbf-12b7-4406-978b-08ddf0210b68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?supkqL/TkAUD0dwXKgfWS+TNBIDmgZXeAsjvBy7SyxvGxafMaWjO247NzZHA?=
 =?us-ascii?Q?R5k+mU8YvPbLDD3B86g8pUEfUVPlYoWTrqjlcWEJfLi/M74NvjkxMODdVoPU?=
 =?us-ascii?Q?UdajCUjWqhZW73KEayssNxCq7HK0vOh0B/l2G2Nvcrjr/2iCeLd37iu6tpqM?=
 =?us-ascii?Q?JKVOfOdSM9FWslJ2zPMmf1Whbemc+I4U0HI2ZcwBw1hhc4uoWKZGH0C/5sUK?=
 =?us-ascii?Q?ZrTkhvyXhWIKT6An8EwcDalOHtikP6o63i+j1Yu55ZEpe9onfdi6kJaBeG5I?=
 =?us-ascii?Q?PyCIL3Mm0Gp4ORR27az5xIkljTEQOMJDHG9jT2z0qwJ9B01Im/vVa+My954j?=
 =?us-ascii?Q?1OD0D3Os+9Wswdr1+CBHY/pUugZUuU9wjUE0vR88sHgocNsa/+rMG9jhlfWZ?=
 =?us-ascii?Q?2HplCsD8eNZO/sq/vZnoqxA7xeMiOGCf+fp7fZEvPJdq8k4Ki4ytXxV/L2YL?=
 =?us-ascii?Q?xx2wuzCYHPCx3DTiWhyZHiJ/WWrxWuW1+8jyOsBcxcxvqi8aW/ygm76YKLRO?=
 =?us-ascii?Q?ZhXYiLKsapmmDFXGpX3KPZNCvMtKsC7eU2PzHE6K+b3QfqLptajW+06sD9yO?=
 =?us-ascii?Q?MAbCf6gWgzR4dOnDiLN5w6Yld5Gefb9W0rOTos2dPThXMTUakjOyG0fSKiod?=
 =?us-ascii?Q?KeCmLHPNFl/PbTHHzIYOIgPdUo6lVzdrIozjhaug/TZfreT2aALK+vJpz5B6?=
 =?us-ascii?Q?g9x164p1dn1lvKo0oMlQV5c0r+x1XERNcxOWIFIultxc6rvLJPISBV7PWBoK?=
 =?us-ascii?Q?e8lkCe9Xi/7KtjybU9B5OBuJ9ZMt1HyJ1oeE7reabl/93Hkh9O8WE/RvjrAR?=
 =?us-ascii?Q?pjDkSDnIDi9ZLHvfb4y5qcMhjOvF6msufnoN5RyyPWQ8sNdn0PK5P0mcanBy?=
 =?us-ascii?Q?8eiljIu47vRoZnl6rpgTnn0GbdyrUrjXRX10Rv9xiUNNdZf8ENXe9Bdct9W8?=
 =?us-ascii?Q?124Kdix3kG/cR91HkoZQxSodubZTNEiSHhOcPXhtHNP8HYAXrAd5Qd22MPH/?=
 =?us-ascii?Q?0bBfR8xknPZWFD3jQTj0n+zCKHiqLC7WaoJqAvNxJcP6mfjcbsWukU0fHEOT?=
 =?us-ascii?Q?WAkOYUUnp6tMOhORBBQlVnmgQ9aEBD5GwQ3sRdVPyw+RtBiLvzNqJzAZqwc8?=
 =?us-ascii?Q?iYpawV7guUQxMc5lJfLb0y4zNIGpHjn87zmoGnAeyF1rIAFLkcYnBEyQgFkI?=
 =?us-ascii?Q?9jqsHDH3Lv+nnd4g/qZxemQ8hk/gaS5URU53xq3dDIfGZst/YpeqYr00CNNk?=
 =?us-ascii?Q?BPxV2Bz/3YS4WbPquchL/uueQQfxgMnBk8zv2wzQaHDDjN0ZlcYSEz4qD+/d?=
 =?us-ascii?Q?586Yyjhe+DSKb+pW7EkJwB+dVSYOsXlZ/fogB9cxFGcrLMlZd9C5Oyms9K5E?=
 =?us-ascii?Q?HWPFNFfqZlsO5A/ADyUfPt/VuLO1+EADFWxJ+j4+sGNSN1CPaTuGn3Z1y+FT?=
 =?us-ascii?Q?49CN++Tvs7xPJHYyd8quxHnyYiT9PIzXHRCvsPMxkVlG9fKXqttPKuAR5gaQ?=
 =?us-ascii?Q?Lax7qerwoD45sDoeEaY51astw19rSMAU90AgMV1hiqT68v0mrPv9lhEmSw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 04:18:07.0617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56212dbf-12b7-4406-978b-08ddf0210b68
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9547
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
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
 - Fixed schema validation issues from my end (there are still issues
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
Changes v8 -> v9:
  - Changed to alphebetical order
  - Added comment that our flash layout is different because of our ROT
  - Removed unused phy-mode property from mac0
  - Removed empty uart_routing
  - Added temp-sensor
---

Donald Shannon (2):
  dt-bindings: arm: aspeed: Add NVIDIA GB200-UT3.0b  board
  ARM: dts: aspeed: Add NVIDIA GB200 UT3.0b board

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-nvidia-gb200-ut30b.dts  | 1032 +++++++++++++++++
 3 files changed, 1034 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dts

-- 
2.43.0


