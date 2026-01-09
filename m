Return-Path: <openbmc+bounces-1143-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6DDD0CA0F
	for <lists+openbmc@lfdr.de>; Sat, 10 Jan 2026 01:31:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dp01W4LgFz2yZc;
	Sat, 10 Jan 2026 11:31:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.201.93 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767938621;
	cv=pass; b=ZQUyWNZnZHXCWBfF3C0g7FLpjva0sFOrYh2XFNnBVBoNf/VNxHG6tgfcv0vimWP1Ck91V6z3joi1qaP6ni2cakiQhExLkZ+VYopZ1Rg0SEZnVzZBEKBHI2PMH/SnWeYFptwj22uiQuxsPU8FitFlEBszLkiv0BKDv4USpKIRSfo5O0f37bscDVjPxkPPzC/Y2njvoPbeGj1XqPhh7qu+AF7hw8ET2xSossXnHRCNHwwnx6Ecx08uDS3iV3oWhSPjWnO9YizVAEOoVp//LY3m5sEMGZtjAYCf8jRd4DGH1bqQriHrkfvp6bVvItSlN1MmOFLgPllmttRb3vDsPkyTRQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767938621; c=relaxed/relaxed;
	bh=mIa0T9GWni9TWlREt3UWRlmr/dQ0Nhxs88vSINunaoc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c7GfuFhrdoPD6Psftr6PhFGWSK4PtfqNRBdP1taIEFV3wL9h5MpsiqLB+jbYOALx/ODvccrEU4JmqIJvIUc96RKdperODaSnKL+rIyIhNukDB/PqDda3+DXfdCjj7h2wy+L/5lQa+jzjBWYAoOfcuGpQqZRZ5hekseGZLALHG5lR5C0Nc/3OVAb1+T39nc+n7ILLRomgskSCACRuswEl6Wcj3o7r3AewFtrw+OKDSq4S1XjYCfHRtBxWycQq9qyCj/Lw8WCbMEW1pbguyjUCARqJq1+v09TtSyCMSH/ZHkfH+2qu5+TOM1CcoX+WhLK6ZRn8usV2zhefVHJ21EX1vA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=eNnPOQ+3; dkim-atps=neutral; spf=pass (client-ip=40.107.201.93; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=eNnPOQ+3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=40.107.201.93; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org)
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11023093.outbound.protection.outlook.com [40.107.201.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnWRb4YFVz2xP8
	for <openbmc@lists.ozlabs.org>; Fri, 09 Jan 2026 17:03:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ItVur7L9cDKFgMgjaiybR6q49sK6/paejuX++LY1hzAAIPkpvp+2JXjostY4dCCpJ5FVgKDBPmaixFbl233R6goHAFTaWhbaN9n1JdjvGKON5drsr5sYxdgjJ8tlLTG2+mqpRd/PSRVLTj0nIO099Mw1ul3cYQX27Zmbo+FgHxG9vj1iyY2Yw6IyDRc/GakxML37SpRqYrWpuV/bKhVxVRdZUxQPVb4x8E+6HnXYHAwa48kEsQVhFmVLCxrvZPWa+w5jWQknw2Fy0GhCUlZGG+cPP4i81JiViJpjQkGADxN//jPTVDkvM1Q3Mo0+84UtsUt7Mh32p7qvowfq0fT2EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIa0T9GWni9TWlREt3UWRlmr/dQ0Nhxs88vSINunaoc=;
 b=Nrc7e3PFDmEpSWB7J3r9S/52PDWrulDRa9cZpGd8KrxHrLupiSspyUdtIVN6lImNUHzCzDMYNG/ZtLtlaExBI9+X3BiNA1ImE1Dj9U1HS5xpXg6sIBpCCAXB3IR7Q6bu3Nvp377lmIV3kaAZ79w9GlzqqRFczFENRS++YPB8HauAS9+iByLKQcReZnX9WX4OG4CwzLkhJZ5q7GqRNYmSmSMaXrg8Nc6K/n7UMC2Bdm6j0XuxTLp2aogUGz26T5xoO6sfSmmxD9sLjtq0ZIjCTA2wb5Gkpf1ViV54yX63oeaEnGkokQe5FwcAUfkpjoW4VT7neYkoc5xCSYWad96vEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 4.227.125.105) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIa0T9GWni9TWlREt3UWRlmr/dQ0Nhxs88vSINunaoc=;
 b=eNnPOQ+3hDanSmMaYfAe2KtnHyAtzj2cGOofORyMJ4gN9vIF30OwtqMDL7VIqfot/bXDaENTXMMlk85TlJwhqoCakfhO4Nq5VEuughxOtM8XDRJxz3VN4tFt9tNKZ+iaxcb5A0fZ9+00Rav/hTZrzqypr6d4o2uq0J25e8ks3nxnsyQl41ORe1g7iv5ub10vQaHiav4pQdyl2SZ5K4uq2G4Wmos8a0tDvOPM8fHJTCNu7RFixl6Gd4ZeDtIqrSbWH5Fl1FA+LiZH029ZVBvNJlhT0wVtyZGiqPTnA+0meX0upGFzAHAG1yEhtP5As7u+JUKNTv32Jfl7xeeTq5UBwg==
Received: from BN9PR03CA0528.namprd03.prod.outlook.com (2603:10b6:408:131::23)
 by MW3PR18MB3499.namprd18.prod.outlook.com (2603:10b6:303:5c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Fri, 9 Jan
 2026 06:02:59 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:408:131:cafe::56) by BN9PR03CA0528.outlook.office365.com
 (2603:10b6:408:131::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 06:02:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.227.125.105)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 4.227.125.105 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.227.125.105; helo=axiado.com;
Received: from axiado.com (4.227.125.105) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Fri, 9 Jan 2026 06:02:58 +0000
From: Kuan-Jui Chiu <kchiu@axiado.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Subject: [PATCH linux dev-6.12 v2 2/6] dt-bindings: gpio: cdns: add Axiado AX3000 GPIO variant
Date: Thu,  8 Jan 2026 22:02:49 -0800
Message-Id: <20260109060254.1575868-3-kchiu@axiado.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260109060254.1575868-1-kchiu@axiado.com>
References: <20260109060254.1575868-1-kchiu@axiado.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|MW3PR18MB3499:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 99d0b9c2-2035-4201-40f8-08de4f44bd48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VOd9fYQGiZMRr5jXOD5huPXNmgIgvYdEN8CW2+KBUr2xq/pmeL77yArIhl2v?=
 =?us-ascii?Q?bZkWJ1nbwtSBcX0+1b92I4wVCV9LB264QoDLuFLLynmrDSHvUziTgKTpr7ml?=
 =?us-ascii?Q?uMxHw/km2oVr+hs4K+fcxlKEdWzQUErH+K+zyupboQqy8XbUmpbXjUQY6s7l?=
 =?us-ascii?Q?dFoUq9DOT299QLDOkHRzPxVGJD4XFZQgBSq4Wkp0/+H6QtD9TfDipLiE73Zc?=
 =?us-ascii?Q?R0jLHMl85QqpYzQXEISnfIq3qsj1mk4MgqDO5zN91ywcLA5nPcalFbops76G?=
 =?us-ascii?Q?2LKFo7ScP0u6sXVYguMQKttZZ/OswZNtWuOUa45yYLBOHcRMZca6kDlHtgY3?=
 =?us-ascii?Q?mTekyNvmTrBi2NVsDkn1Sq9tGj0Sd9ijrKfA8c5o7RCExMbw71CH9bFab4Ju?=
 =?us-ascii?Q?kEBHtuT15yFFNQvIS7Whx8r36bPi85+RCMaL2PkDpylMc2ihh+Vn9JpI1u+6?=
 =?us-ascii?Q?z0uc6slA5Rf7Rqm6Dab36bR4toULtnbt3BUmBtncMsusMtA4CVQdSYqRmnlD?=
 =?us-ascii?Q?9GVS7MZOf7j8uP3T6WjFSpkSKCWqU3vPwfRmtM7NtY4hpmXhb3JJOJkwgnxo?=
 =?us-ascii?Q?q9/gU/Ow+BVXwuRmTLXW6SGsoRaY09Bf1qY+CuL/iBsd1s9rYHpb3clXMCxp?=
 =?us-ascii?Q?9r6rk7bzfOEO1ELGfqBTAe8PJUjR0efC2p6BNGB/t4pycxgRwMRYpPUJhUwY?=
 =?us-ascii?Q?ffORZUIAulllFBM5LZJ+sXYslkcW8aaeR1RdmgdzDmHwVEC7PVp0s7taO9JK?=
 =?us-ascii?Q?O39SXHTJgeHdnhmoeNl6t77KVE2EWNl7RETlgKOT1E2dBAffJoAlAlrdDL9w?=
 =?us-ascii?Q?Wwkr1ofOrVOHUXtnLNJm6y3yJX80zHU/9eZpFKBg8VM6XpYZzNOPuTsju6pJ?=
 =?us-ascii?Q?ChekyEoVGZUtMEVOlFwQPJwhpGQ6BOb0B+bWtGEHgI6NPUu71lDZXJ8MT6wN?=
 =?us-ascii?Q?dLaDpRoUdYea1VHcYiZmGjV54fxQ+4Tys+tVu4eRXGVK/bCMG7xUonmDDOoX?=
 =?us-ascii?Q?fPWwKayFGy9oOEPkeXCG3NPobbWmWuHTZ6sTrdszIonS0q+Pvp8TrRGWkRgx?=
 =?us-ascii?Q?aDhcabwIgDZO2Y1tNRpnIDwL+oQUmW4II/reZZCeBDI60j4cvPqbCyEKoq1Z?=
 =?us-ascii?Q?jxKWl1lfoP6m8FLT7LhRbTmJOQGxdslhneIQ0j6I2kGVzV9enJPr9J5DSk9H?=
 =?us-ascii?Q?97rDf7kA22dWA3xYmXHBklQCUkmrDlyK7LqKaj5YWw0fItqpL4roZFt9a/8v?=
 =?us-ascii?Q?MFlcwlgHUFJzPAfwRN3Eanx8QPXkXjjwUJsBI5AKTm9tVsCYzk0UPbTUT+cM?=
 =?us-ascii?Q?x4alyAhwpkJrNptS3AlXYZwyUl3ATbcIJgrH+jzPUtWDd+X15+UUH9oQ4MgT?=
 =?us-ascii?Q?LGIU/43+pQlLVZj2H2CR9IWvg01XP4kXewNzytD1DyvX0iepk5PU81fxi6Yy?=
 =?us-ascii?Q?8SvK1KboYjK0iHjurdkYjMd7E05lgVSzJ2dB+XJAXlbrml0rpccFNSmKuoAs?=
 =?us-ascii?Q?j9I/GSUycH14xJWvEPTYWIRREynXlk/alaY9DW8ilKVY8rdZaENB7tzl3gxL?=
 =?us-ascii?Q?9JdWEYqXgTJtr8LvFEc=3D?=
X-Forefront-Antispam-Report:
	CIP:4.227.125.105;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 06:02:58.2023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d0b9c2-2035-4201-40f8-08de4f44bd48
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[4.227.125.105];Helo=[axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR18MB3499
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Harshit Shah <hshah@axiado.com>

Add binding for Axiado AX3000 GPIO controller. So far, no changes
are known, so it can fallback to default compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Harshit Shah <hshah@axiado.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
(cherry picked from commit 4c5250ebc3e4ae49934069968beffbfaa83fb734)
Signed-off-by: Kuan-Jui Chiu <kchiu@axiado.com>
---
 Documentation/devicetree/bindings/gpio/cdns,gpio.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
index f1a64c173665..a84d60b39459 100644
--- a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
@@ -11,7 +11,12 @@ maintainers:
 
 properties:
   compatible:
-    const: cdns,gpio-r1p02
+    oneOf:
+      - const: cdns,gpio-r1p02
+      - items:
+          - enum:
+              - axiado,ax3000-gpio
+          - const: cdns,gpio-r1p02
 
   reg:
     maxItems: 1
-- 
2.34.1


