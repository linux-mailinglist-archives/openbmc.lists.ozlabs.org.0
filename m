Return-Path: <openbmc+bounces-465-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAD9B28872
	for <lists+openbmc@lfdr.de>; Sat, 16 Aug 2025 00:44:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c3cc61S1gz3cYy;
	Sat, 16 Aug 2025 08:44:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2412::615" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755297862;
	cv=pass; b=MD7dzIZ5h2dgSXPyxLGpY9G3lus/h5YfW/OibU0reBGfEFr2JHgnreJtt5llE9a97/PBEacHZ+jpdXJF82vK+WZHvNt6p07h9Ufv3ieXgMrSb8rcRDP3OSxl+hCTbz7eSnGyTuZ8S1dONsn9QF8+XR8iHMiQy5n9t9JaGzBIW4yOMYn6hK5wJLNjigWkG7Z+oGCU+IzYZNg6Bc7PaBY+59sBwc9chPHQefmz2c4/z+qhKjMJEeFtOxuK+trzAreNV9n0ZKXe9ZJdRis8oz9exM0/k1mmGDBlrwhTh9DcD6ztgE9XFmaIxUbo4MaTwEVHHDS+H0no5pxsb18IrkvHWg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755297862; c=relaxed/relaxed;
	bh=/PJbBvDV+noSKFlIser/JH9z0P+Q4gTCv13gY7hx1Mg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BMNaIojPjQaQS/NlLfPRoB/8aPka554QpBcEdih9b/GPBNcQ/1h5GaXyc87wp4SsefwALw/xfNvz/Yqm1+wniXp3sq8VBZ1MWBF/mJEjPFnoe7uuHu2CkPnTq4x9MVAbCjcXB4HVQkTDBkulITo6h75BU2/Yyu9oTAu4g+OBAC2XVqEAKqd8H72F5VXQBM8OpyWsvuTDeeePAm2AM9T5lTyavsLal9+FbKZSTuQvnJwbHHLtxb/B1pLoVHJNRJlcF8aXIoN6CcPjuqgvm8pWiLYpS8eZ0+6Fg5FyPJx42Xb5cghlxR+QDa25M8LbUYfwin75pZMd8vp/eNh472pdXQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rFG+yO8M; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2412::615; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rFG+yO8M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2412::615; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20615.outbound.protection.outlook.com [IPv6:2a01:111:f403:2412::615])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c3cc45kXJz3cYP;
	Sat, 16 Aug 2025 08:44:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=faoyaV3RI4QZLFBQyZTQ0VFAy1ulSEt7yQ6f/9hig8eLlp/yQU6hQnWaWo+Dx2vmZT6J6Nh2qohBHg+vGAsdlSQxAbMViNxgbf+Gv5StvgV9WBIkTWN4Y0u9EF6ZrnEdvj6oxlgnSc+ihziWMFKTG0Hx2DOdclJyEgovcHvkkMBQuyvrURSwMHaw/75v0OR6euG13gdtkHCFkPsArvBMRW2h46tC/d64IJytTj69Q3T+GLtEP+I9+TQgoF5B+pHnuh5KzLxOMp0BXKe0tKbNk+NE5CJkeZRP1BKZWiTAAPQ/e2Xb5URqVgKc1zIW7NkjAg+xLDtcdXLbPXZvVPfSag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/PJbBvDV+noSKFlIser/JH9z0P+Q4gTCv13gY7hx1Mg=;
 b=h+GTRKbudmV9KvCZj79IqvCQr3euq/CZrBrq7UA03eYkCmYrwCd8zArIKAJf5TkrwRgT/0cDGjLuUM/tJpbq1o7mcImIM2Go6URC7+eKVdykP4PTAh7f/nhSrs3nlqFnl4CQJ0GoWWAJ3+TSZFi8TtnV+5J6Tpo1QwVOam3HgY1K2s0GR/kLOpMogjKU8YxxLWXY933uvW8uTqLzTRLGsosvhWk8jovfeAKAxg6zhOLc3FIYdcnYcZ1fvsUPyHEeD6d+7Vz/uhGKsxxfNXdYDHe90WgAdupfFmXuBdfsDd4LlCXbJVkzpHHxeFMQhYvavgB8TiwYmEtQy27S/ZsLhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PJbBvDV+noSKFlIser/JH9z0P+Q4gTCv13gY7hx1Mg=;
 b=rFG+yO8MNnZOWL+Iz124NZR0d7KsJQNUqEgFDCyrrcjq4wA9+/Vx+Y7NScIzzEunJjtzVzJV/uzp7pK+ApVt0XKlWPZX+LZ5JnyPtkAFft792wZmkRwlrCw1S7o8DudQXrYkQZHazP196qhRd313/Nw2LF4AAUTPfWJYy05yNx6dZ4F5USesbXO+Noc9rpZkWLsB0Si9lSyhU37pvWdt5E9LIGYtHB8xPG8oiIzEDluU3IPnxQzg1++nHQoO5Y7893GI4wuvb8mYRW6T6W76RJ1qXTVi8A67l7mis5kfId1V5ZRPPA8M9SRcfw1B9mBekBdcW0NETduS/tNwzV8HOQ==
Received: from BN9PR03CA0971.namprd03.prod.outlook.com (2603:10b6:408:109::16)
 by DM4PR12MB8557.namprd12.prod.outlook.com (2603:10b6:8:18b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 22:44:00 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:408:109:cafe::e0) by BN9PR03CA0971.outlook.office365.com
 (2603:10b6:408:109::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.19 via Frontend Transport; Fri,
 15 Aug 2025 22:43:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.0 via Frontend Transport; Fri, 15 Aug 2025 22:43:59 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 15 Aug
 2025 15:43:47 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 15 Aug
 2025 15:43:47 -0700
Received: from dondevbox.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 15 Aug 2025 15:43:47 -0700
From: Donald Shannon <donalds@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<donalds@nvidia.com>
CC: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 1/2] dt-bindings: arm: aspeed: Add NVIDIA GB200-UT3.0b  board
Date: Fri, 15 Aug 2025 15:43:43 -0700
Message-ID: <20250815224344.908130-2-donalds@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815224344.908130-1-donalds@nvidia.com>
References: <20250815224344.908130-1-donalds@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|DM4PR12MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: 76569be5-7d84-4425-bd92-08dddc4d39df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1uqPpCxU7duqnv+vXw1RcO9vYHFhzQ3mrFXWNMJa7+JEm62Z4QxEqE0pbTQi?=
 =?us-ascii?Q?UDllrQKthtxN/pnSABeri7XJi9G6Zts454ewkNevO+Btg1VwqIArlNMn397q?=
 =?us-ascii?Q?mIFv7IFBwJuFINYn5ZpUEKIqyy9cVna0yoEmPAR2zaPcMWmahWAroMBT0QcG?=
 =?us-ascii?Q?Lru7s5mNnA4cX9eXy/6sKbD8N9v0LiGdy5cnH/z0w1wlD0MewYQqxZ66+QQS?=
 =?us-ascii?Q?BDQzmrIQUA5CTK7sHoRu2T4y1GX5IAdRVUeY5kZM3O7iReFjbWuno89F0cs2?=
 =?us-ascii?Q?tAsi1kWM2l1z6iyaRxVK871HQdwagwm1ki5QzUQytTIXXaRxrBt2SF5hwtCe?=
 =?us-ascii?Q?T4v0vMJZ/ULyFqNZ724smyU97uOD7uCyu7RQh35yGm4ZgaSH3PWkTlywGz01?=
 =?us-ascii?Q?YIve/pzpuUvfrhgzp0eXJQVvKpQ2eGwJ19N1AgWA/UzX86/IN7DOfTHmCDPZ?=
 =?us-ascii?Q?VL1q4JfU7XOMwn6VF/6yQ4IBhTWneBLRIChZhvKo9Tc0IkAByEPdPrTcBbNN?=
 =?us-ascii?Q?FoS0lWmrOaw9Gy8E2Su9TMw8Juiqmo6LJFPC/+0GQlrDwyBxwTwBt8NiT50S?=
 =?us-ascii?Q?qxuytjdQVev6xXSpo0l97Fawzxr9Fij9k1C8YAn6QhFwWCRiT6Z89jp3jxAm?=
 =?us-ascii?Q?2ud1KQPyg6cKbtPgMWa08BBTAZci6PfTT90v8NCiNLhE0+qtLzGk53+Nw6R6?=
 =?us-ascii?Q?iriasafss3yfWpqIAK6/2biyzc5emscruwut7wlNKxUCtliKSfUlv7G9NtDG?=
 =?us-ascii?Q?/la/IawGaMNjj9F5XcNQ7XzzJW3oMa8FACNcfV8Q6YZubihd3EuRVIVMl3Dc?=
 =?us-ascii?Q?i3+dxoiFTJOvn28/Dnl0bBxwHT72P4DZBC9YKlC+Nyl8wNaw64cMMlcErIw5?=
 =?us-ascii?Q?yf/MBoGhy4KLZsdQL9LN2ANtZfTFeqPo5Y3yf1fHUhXOEzI9ZuBpRblvVfHN?=
 =?us-ascii?Q?94AEsOcKx94L5o22TG/tLAKDlI6Qhf8lVW8rv0u3ASsDspVJN3NwydT2A5Kl?=
 =?us-ascii?Q?WaR/HUzjd7lEFcXtVgO6jjLslkvPMF8QAbvWnEL4UaD6uVxaieEgIBCsNtgG?=
 =?us-ascii?Q?9ut5IJ+IwKQQ6mDUYdrVDhSdQBIzBSxe4KB9um8JVkiG7OXihmzbubPaNQwO?=
 =?us-ascii?Q?qTzFWSLaepgR1W/OLRsbAMMiCUz4vgHqf8UJTan4oH8N5XP7s1D9fntVXpD+?=
 =?us-ascii?Q?FVUeXHTlwGiKPngYoIoPOMcctQv7x8dbRoTYanHFaZgv6fGnOr5vxbssPvUB?=
 =?us-ascii?Q?mZaQQe1rRpT4ApQo3/iMKW/OaPVDLmzoa9ZIq9enZIo7LQtPOCE2FNLXUgi/?=
 =?us-ascii?Q?H4OHzTcyjMFlnbmBym7bg7xdVgY1kVTc0RTb3T3uA6E5e9tYfpO1aGe/mcpj?=
 =?us-ascii?Q?wkUfdIJdMO8ewI8evumIzQ3693db/Pi8DlO2iu5xGc6Y/6REfsOVSRvtyiTg?=
 =?us-ascii?Q?5NL+4hmnkrlQTpDu5SN+o81R3Wme9PfTqLlimHV5xQgzx9veH4ZOdI6ndPj/?=
 =?us-ascii?Q?Wta60Le4D0NtjfI197QDmHp70ETjMr9frwOx?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 22:43:59.6072
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76569be5-7d84-4425-bd92-08dddc4d39df
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8557
X-Spam-Status: No, score=-3.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is an Aspeed AST2600 based unit testing platform for GB200.
UT3.0b is different than nvidia-gb200nvl-bmc due to networking topology
differences, additional gpio expanders, and voltage regulator gating
some devices.

Reference to Ast2600 SOC [1].
Reference to Blackwell GB200NVL Platform [2].

Link: https://www.aspeedtech.com/server_ast2600/ [1]
Link: https://nvdam.widen.net/s/wwnsxrhm2w/blackwell-datasheet-3384703 [2]
Signed-off-by: Donald Shannon <donalds@nvidia.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 456dbf7b5ec8..624581db2330 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -99,6 +99,7 @@ properties:
               - inventec,starscream-bmc
               - inventec,transformer-bmc
               - jabil,rbp-bmc
+              - nvidia,gb200-ut30b
               - nvidia,gb200nvl-bmc
               - qcom,dc-scm-v1-bmc
               - quanta,s6q-bmc
-- 
2.43.0


