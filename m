Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A64AA77F37
	for <lists+openbmc@lfdr.de>; Tue,  1 Apr 2025 17:41:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZRsfb4NRhz3f3G
	for <lists+openbmc@lfdr.de>; Wed,  2 Apr 2025 02:41:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2009::627" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743522053;
	cv=pass; b=QVnZhJrOdnw5i0BzgDSDNiIprEQGzWWeZQT6R6pleo+SzPiDXaUhpnwyNIAHomJ8Jt7cAWjRho46tE+QQAzafHAWmLUxzKYNcUwuh+hrKHXqzbojRXgs9QdGoq5UOWohZx09hibuwSzkBStCZ7g66xHG1AAcFS/jqG2kgNod4TqZVoIyprfszrCf3PynZkS8uR9J4BpauWaQWVBJjnGR6WOE2kMCnHxz8N7gq1dEl3+rsbafVKeUYrzC++7K2xwmzCUm7C/voORhVJYVcClILzPV+BfphyP24nvoa+6Xpt8IH5/yoc1dI1+da1IetHOfYz2hxENO3OB2d1hLIqPwYg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743522053; c=relaxed/relaxed;
	bh=0z1e4bKkjbmgZ2+b73Zlr9txkiHuSWu2ExAR75lcFMc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JcLb2+tfAJh4YFw3E78IARjPt4OTV8PFtY4qu0ROkrHdT2cy7s8TlSUsQM7Y3967GFB1BlZxmBr8N8EYTzjCpBH0V/Bl+Mynf/cX+m0xFP5+P2HtwUF2lp1mhvcGMbq3GLFJw1dnwTQxEBOIIGbGd7EMWlA8LP3S76BtFJRbjoaUM0NzTp1mm0wuFFFHX0sNtrGy+BDIxdoFPHtyZF+SzKcEtoN341rMPiw/IOkKkVpxKprMEcsLD4W9A1fQTGd8AD1Scvz7SnpyiJZDGhAa4deZyU0xjy4LtOX5LcJ17yzg5V5Bf5OnzSZKGBWcht06oBdWt+Dx/tepqmBnH0N4UQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EAJ934th; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2009::627; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EAJ934th;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2009::627; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20627.outbound.protection.outlook.com [IPv6:2a01:111:f403:2009::627])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZRsfD32ftz3brr;
	Wed,  2 Apr 2025 02:40:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QjOg9AetcYUZWnw9/N2E7HQ4dhAwFgJJ85j5/FVPOH3bJf6zFaFZUENkJmj6MEFcg9wUipa+VhKK7Peg+WDWUJVCrz6DhqgHDEnNkiSJqOXf8J58MixW+E5QaWW5scNl/jZmC3XOPih8/0QHSXco4rr/H1Ly75gnrU1tLiuy6fIbClNHJZLQWE0Nqy4vmqLHgRHKwAODdyu6jZX57ipnJSu6eltm/Brg+saoqviQzskoyotxIn2hvf5jmHic217hHeOVB9m8c8EyNPQ4iuXaZe1Kc5XRD4b3IUv2ADPmt8PGlYC/H1ldvpw8ylosrjzZ/MA7bZF6ZPLF39p92LDdCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0z1e4bKkjbmgZ2+b73Zlr9txkiHuSWu2ExAR75lcFMc=;
 b=rKfdwnodPcH4YSexVX5WiS2PIaayFX0/IaDz9iD3vAlUVOEqs0Ppb9fIO4CO4enmFFdMJjperfS1WkTKiE+hD51mzpVSkO8hgBi1gV/lq5LhV5PBTR7usf3hAmAy3YO8HT29/CUK9qXsaj+OgUevD35I4guyuJAoUKKJGhN5hqSTAlJtLxYa0zXwqd/C+GWcdvlqQslBgkNF6qlqhpYN0RJ6OD0pJgOPlejEqgMNKQAKRIj6k9CgQCcqYcT6oqF2tpb27vNPiVNndFOXgZBW916NRBqhX6y+NCLOit0FhslQPUqG9s8qXyY53gVjURojbzazW+lpPD5YH5t/D6T7jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0z1e4bKkjbmgZ2+b73Zlr9txkiHuSWu2ExAR75lcFMc=;
 b=EAJ934thJb5WiygG804JHyxP9Enk/tuBV3fmYHOM6QNilsUhtGzTBa63RvhXCjYZpI3dK0RICtZ1c8NidhGXnKI7tP0W5BO7u9v5V0dYy0ECqYlg+KZA7kCOT2TjBEc+J3yHffMEEJJ090vJr47rurWkHJ5Zm549O52wE0GEAiROBJCeOcoDsfUGiVKp9BrHCX9th9zB5OsULSbuJTlyNXQpTygd1DhDCgQV8PdPz3oG4t88KH5Gyx9VD8t5aJt1U8SrsAplflOVqg6Bxv9QJOBmyxmW4O5YXIt2dI4TAGHPX/+h5twQ3VfFUopoe3haNfZu0DBStg7jrqM89U+yqg==
Received: from MW4PR04CA0380.namprd04.prod.outlook.com (2603:10b6:303:81::25)
 by CY5PR12MB6600.namprd12.prod.outlook.com (2603:10b6:930:40::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Tue, 1 Apr
 2025 15:40:29 +0000
Received: from MWH0EPF000989EB.namprd02.prod.outlook.com
 (2603:10b6:303:81:cafe::6a) by MW4PR04CA0380.outlook.office365.com
 (2603:10b6:303:81::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Tue,
 1 Apr 2025 15:40:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000989EB.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.22 via Frontend Transport; Tue, 1 Apr 2025 15:40:28 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 1 Apr 2025
 08:40:07 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 1 Apr
 2025 08:40:07 -0700
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 1 Apr 2025 08:40:06 -0700
From: Willie Thai <wthai@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <kees@kernel.org>,
	<tony.luck@intel.com>, <gpiccoli@igalia.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>
Subject: [PATCH v5 1/2] dt-bindings: arm: aspeed: add Nvidia's GB200NVL BMC
Date: Tue, 1 Apr 2025 15:39:54 +0000
Message-ID: <20250401153955.314860-2-wthai@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250401153955.314860-1-wthai@nvidia.com>
References: <20250401153955.314860-1-wthai@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EB:EE_|CY5PR12MB6600:EE_
X-MS-Office365-Filtering-Correlation-Id: e251f71e-41e8-44dc-da84-08dd713387b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?8Ac1nzmI3DS8eL292+sIhQW5nKooGZT4iUHxL5ssI+LMhRBuKcmTEu6nBvpi?=
 =?us-ascii?Q?dJI3pWy78tb1qc2gmGL59BTZRmqarTC9X0tHPFBE8Hdjg4PPBOjQrGU/rza2?=
 =?us-ascii?Q?emQsWAUnLujywxAG9T+08qkvi1vJpuir4N8++3YdQf7ldaKyCjxz9UCIDAJ7?=
 =?us-ascii?Q?uTzAaEXU5G4WvtFeB3H+rkZmGYVjFcT2/AuSO2uxCAOwfbP9ouvXzr2SBZUd?=
 =?us-ascii?Q?zBSetrg2RW3yjRrkaz3xafPOQ8YHCaMv3B89cGfKA+boltDxWUihmgs2gX0/?=
 =?us-ascii?Q?L8txw+6Lg/tOxi/1f61Z58ThkPhPUV6PuZq3WSuM31U25nh4VGTgSADaFzSC?=
 =?us-ascii?Q?n7fvZjRJXHnBos1DJEkK07lMHRomSaYnzy9ZEZ5XngaHLrb+Oumf+aCaK8s0?=
 =?us-ascii?Q?yGETb35zkLjBr41ost9eRBozyLYFLAgsxY+zGfgCA3z6Fph/htZe2FzzVZv4?=
 =?us-ascii?Q?5UK7lzMjtcD2948IB/GBFTCp3p3tXMNbmeUIoHt0dhWWNkaMIz/eLjSmdbiF?=
 =?us-ascii?Q?UX2SpyxxVsvFKlmSomEb077GubSrFlmzPhGXr3QCkDr5BC1KsSs/n459/i6K?=
 =?us-ascii?Q?tTLNMNZcp6ZoqiIoBMSZQvc8KLIu+qJFWc/KRdmLW0FIgnqcdA92LWkr/9ym?=
 =?us-ascii?Q?SgtOhDh1DXlKvXeBQ0/3Pm41BZLzDSlFB2k0ksxBMs4112Frk6CjzKhXi4wY?=
 =?us-ascii?Q?4MCkZ0+xaHpWA9bo2h28wXzKEAgYcUinQMfSIrYeDoTIh/OeudsFS3d12/Pc?=
 =?us-ascii?Q?+beZF3IwIGE66lcVUvCw1Hg+r3Vx7ThA5SSRa4Ro5P0TdhEWcbB7MYnfjmkx?=
 =?us-ascii?Q?VYgVlb2W8q3R25e2yhvm2h9efspcwLB+RNNsKGuF+gj5kHXO5t8enliQiiip?=
 =?us-ascii?Q?FxC2b1NcwPpILa34+hiUThWrBbkDRasmpxL+8ureUUUveUxeYm5wLBGFgMXs?=
 =?us-ascii?Q?E5foRh3uf4miCuAsMOY6gj6R8sTYPeyJaOeDVoaKeWZVdu8EnKYiTFZKwHw5?=
 =?us-ascii?Q?IdnYow1VS0NnLxiCF9eEWQdc20Q+GwBAhoaZPetw1J2WMZ2vkqdru5gK/mcN?=
 =?us-ascii?Q?dxmF+sgxepKGZ9WPf+pDFjMAt6ehXsSXKNnKuL1un7gYo9QGyAvAVQxP1vk3?=
 =?us-ascii?Q?J/pq3zeLyVxhM90CYNFy7JaWHJWmmCeHHR0ZHRlfoNePqUT/a0pW/65POTd6?=
 =?us-ascii?Q?wGHynVmBasnC3nud+ekTCZjMsx+YOibED6DvToZoK/pqu+ePoWTXaBEjTg85?=
 =?us-ascii?Q?Rf8eyfITfjpubR0qBFPLcChcMUBvUSaNTrLM1lv+I9+tWlaMFUN2ZCdbB6t1?=
 =?us-ascii?Q?++al/ub+cH78M1Z7owueb1CJaRgjINoeLLr8X6uCjKOAwqNlant7ULJddVwI?=
 =?us-ascii?Q?g4h6vPh0kia3ovq7AbDKEr/UtrKC/n9o62nwUWD2ClSdLaMCZ82t2FkJ3h/R?=
 =?us-ascii?Q?Lv96I3yv6Fla6TGQL6SOcmYGgyc3GVFgZtrEGotSi/yyD7N9qYvY4cbHwYwd?=
 =?us-ascii?Q?2zWiCwmrCQikgRaYhUIEmxefK1zbLUN6rawj?=
X-Forefront-Antispam-Report: 	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 15:40:28.9134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e251f71e-41e8-44dc-da84-08dd713387b9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 	MWH0EPF000989EB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6600
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
Cc: Mars Yang <maryang@nvidia.com>, tingkaic@nvidia.com, leohu@nvidia.com, Krzysztof Kozlowski <krzk@kernel.org>, wthai@nvidia.com, dkodihalli@nvidia.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add Nvidia's  GB200NVL BMC board compatible.

Co-developed-by: Mars Yang <maryang@nvidia.com>
Signed-off-by: Mars Yang <maryang@nvidia.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Willie Thai <wthai@nvidia.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 01333ac111fb..a3736f134130 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -98,6 +98,7 @@ properties:
               - inventec,starscream-bmc
               - inventec,transformer-bmc
               - jabil,rbp-bmc
+              - nvidia,gb200nvl-bmc
               - qcom,dc-scm-v1-bmc
               - quanta,s6q-bmc
               - ufispace,ncplite-bmc
-- 
2.25.1

