Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4A2A5D530
	for <lists+openbmc@lfdr.de>; Wed, 12 Mar 2025 05:59:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZCJM15cLjz3cmw
	for <lists+openbmc@lfdr.de>; Wed, 12 Mar 2025 15:59:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2418::617" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741755543;
	cv=pass; b=Ow2GQcxz/u40LxEU8jaMpiNrkytOTlwi/jS/a2fHWYaX2Y4In7c31YY6fC3lUxOVlO4CDC6pFQNj034AwrEt3F4feQrGxFlB4j39mU+LY3NnrC0zsumRvyUAgI7TexqJREhtacptkJp+ShrKHhY73xR3v8MHYZiCZeonoK/HdhobHwKINUIZUFE71uWdtI8BkRtxIL2Y9LWfE8e+FT6miwUe4Oavmwx7SX7d5Z6sr9SgPFMZFHtUdrpsW6pLVZei/sWrPBxT/gMxYYRGmC0xfDbqiy+iRofaUA9DwqZRCOkagTMArprhxbkNJAToMcYj6rySC6y+Un/eSADY3OY7yA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741755543; c=relaxed/relaxed;
	bh=I4JaUZow6XGP2vjDY+Wnbr1gTyJV8eDlMUN60glA880=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UKKQ0MkQ977Bs4EvL3jej9kkTEpKVEJYCW3hf9k02waxRDLtN+jOK6Mi9ZBBe/8aJ2b1EbDCchblKIDDJNYqyf5QE9EMQXbfCSZ1NFavTw2LQRHCAdxStirslqhL+KgCp/POocgzGvLPVLwwcWXICRpJrInQy/ysAqmnD9TMyho2LcScH5QLwVhQ7NFPsLL0/AM4ZXjUHbVD8fYr8YinIEgao4PmN/fUPbpfty0iI4AK49n0DOsXWL06Xs7cZQxZSuSArfnKHpYI1IZ/bM9IP+MYMG94Ckjj3HVRHRAHt+fOLdPoS9zmIY80C9KVbD9llkOMnD30VacoCICMZcgJLQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rbXAiS7O; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2418::617; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rbXAiS7O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2418::617; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20617.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::617])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZCJLs1d6Yz2xyG;
	Wed, 12 Mar 2025 15:59:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fCbYNuDAjQgDypz7AMaoi8QGhSUEuath2+dSsRK2Ss5leNZaKM8XUQmwbeqtq7+bCNhVXWEDb0+ohO67mfDXhQlDgGdo4BLDBHIorBPnZlVvQF8wCVhTbQCiOfL+SPwxVQBBbugZfe9ez0yS5o2dC8f5iKQqcnChK+8OaUEBhRmWVOHZ5OrrIdjcoYmBHO+700BCfup9ox+0B4kVgCVIutN6LN5myGXTSV2v95r0TacZuPnrVrHvywtmEmZ6BM0J9xT9tvveZ09ctzKbfFcaj6lZ+95VFkxElvN5nJPIM61DAhNOQT7j8JyEJQYx+CikuBQdt64nrvmrSxpqvVbAyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4JaUZow6XGP2vjDY+Wnbr1gTyJV8eDlMUN60glA880=;
 b=ReWi4stf9p8WRTvik4wPBIlPHvsemLELKLcxi82hrvK+YtBiuHBEGlb6gbPTz3IzLCTcfNSUuOKU7lbJLPCz3/uMmb0dqm775h4My3CnBvYlQ51+iTBKpr7B0voLG9qfuV6vNhEJ2UaHNOi8QqSy1y+DQvB/8sQpXrxtiKBoDRzyfoC3T+Tn6jBDt+aGI08vNeGh8XLfVY5QBrRbcmdjw5ShS5VmZReN1Opcncp3383nDYe7Asz9hQUysNrT6dCS2hoVL5jcegML9eYmNRfarXKIaZKmS6whpGc+pR6P7UMQpxbvXTQ+xbelk6iaLmOGG7ZzYSc/Sow8uG/EcDz2wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4JaUZow6XGP2vjDY+Wnbr1gTyJV8eDlMUN60glA880=;
 b=rbXAiS7OmW14xrBDu7SWLRcxJDSLpyrZX+vO3kF7aIUvrZasS+Onn0BULEEbYNGHVebh8IlD+qVEpHf3gMiWZGLGPrM7CQRAON24+gNIs/8ntZWb4vIURLyJWH98Nhgf31aDLzPZmbFtsMSmYej8cRQNWf84Or3IF/H4I4c8sOvYrOOYFxeWjQM3ugyx1Yk4ecNfrZkAjBr2x7zTAE21bUZ5ih5v0T4iI8uzkYWbRJMxoQZPaWx5kNzNrJrPxZgTSr+B++JIiF4UlR7wNSFrPgGd1svs3rSewmT69/itlh+zedu3VyaEzVtvR+HsSYxnGH2VvLSslGVZKarkJIzglw==
Received: from CH2PR18CA0049.namprd18.prod.outlook.com (2603:10b6:610:55::29)
 by PH7PR12MB8425.namprd12.prod.outlook.com (2603:10b6:510:240::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 04:58:32 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:55:cafe::b5) by CH2PR18CA0049.outlook.office365.com
 (2603:10b6:610:55::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.27 via Frontend Transport; Wed,
 12 Mar 2025 04:58:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Wed, 12 Mar 2025 04:58:32 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 11 Mar
 2025 21:58:16 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 11 Mar
 2025 21:58:16 -0700
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 11 Mar 2025 21:58:16 -0700
From: Willie Thai <wthai@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <kees@kernel.org>,
	<tony.luck@intel.com>, <gpiccoli@igalia.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>
Subject: [PATCH v2] ARM: dts: aspeed: Add device tree for Nvidia's GB200NVL BMC
Date: Wed, 12 Mar 2025 04:58:02 +0000
Message-ID: <20250312045802.4115029-1-wthai@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|PH7PR12MB8425:EE_
X-MS-Office365-Filtering-Correlation-Id: c3eea50d-b696-4d5e-c04c-08dd612289b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024|921020|13003099007;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?/+werNdnf0R9aCbZ3fpVMswONLH/8rZdCaHQMsA4TAyXMTvBwr669IkHlJBD?=
 =?us-ascii?Q?qv/KlDOhwI8kI/+Nn1stqlSPxMHVwQ9/wIpRjeJiunu/u+W0DKtDxb+5MxKM?=
 =?us-ascii?Q?nVoJcDSXbUlnuTmO/EFuz0RP43QIXcqZErNpBJIQky/BWShpRBnVmZ2omR95?=
 =?us-ascii?Q?y6FrW1C4sQYcBTkftfyv3QJ9aw94AprbDaq/rylzX0lH8W7TUQN4C1uTFb2m?=
 =?us-ascii?Q?UwGU8cRJTrRhhjF02Q2NdMxEcQRKJfPz3bnAzRRk+xxv/KJjHzO7OO2FncwT?=
 =?us-ascii?Q?wxHiROMxRJ4UsPpR7YkjjqqEbYgj9GFVnfiryr79CubBh5GQ++sxuiWcd5zs?=
 =?us-ascii?Q?TlZxWgSizzdmYvwoLXhMS4h5oGsCVW7B+dBjJA5cDNZ37Z0/3rsffhqwWf+k?=
 =?us-ascii?Q?QoI+WG/pOA5LCvPiW4f72nom+nn5PMBEvcGXQyIsao6ePqY1HlSjMLwj4LDH?=
 =?us-ascii?Q?0F0o+Y+5EpS6hp8ZAbp5DrfK9ayHWadhRFABzBG920g72S8QBKRMib+nLoxt?=
 =?us-ascii?Q?N2yf6Ja9GDlyxn+DPhZ6a3Z40vPG5FdwaXws7t8rMN6pFRJ+NWXfm3FeME3n?=
 =?us-ascii?Q?JNHetXHSfl0quU6GuwNpm66guPQOWk/4m2v/rgpBAwOOehi75Uh3qKBaYaSt?=
 =?us-ascii?Q?g/aFWYeDYvn339pEiwIk4vn4IhTJpCIdInU+/5gNeJDV3+LqOkmWlAIs8VF0?=
 =?us-ascii?Q?ZfbAX1IX6H2RNJAWCXcPkJntCDbbCiiTmxA6wTbjON8q8aU3RhmlyQZ3SWOz?=
 =?us-ascii?Q?r5eR61o2dmtMcIJhreCPd0n6h1IhJ9HxtPe8pe6PrfnwIvsTB7yCOgzpZQ+C?=
 =?us-ascii?Q?dNZU0nnE7ztqUrLhWsNXdtWsSqZoWcfGcf01lGPu8IWUgnpKyoZdOOV06RhG?=
 =?us-ascii?Q?O32ZSute9LO3A5qaNf/QLYQYSsGmM7VIfQx031Ybmci2oRrPSzEZGzIUXJfh?=
 =?us-ascii?Q?tiI1uXxRKFtjV2pcIgvAA0IGEFf6z1pUB9ocfW09iIOIDMv3aHaVowPbb0yw?=
 =?us-ascii?Q?fpoE0ZzDkSa+wB6EeH4tDoRcDWOTkX15qrinqQ6vivpz0Y0CupYSe65T/uKP?=
 =?us-ascii?Q?OTPwewyxHNahOQRVHZG47OnQw+AF3mLrsdv74zbmXmVtZvGVJ3TIv27AkPWl?=
 =?us-ascii?Q?AT0UI5ef/aRenYn909u1retUI8pY/NPnfF343czbcBkj0yfHu7lcs9zskafN?=
 =?us-ascii?Q?O0sAvk5n1H7P9ctewOigzJec5R4LUILLYVOA6n+QvlAwsKMBNk+Li6XcgSeS?=
 =?us-ascii?Q?csfL0vL25gIoB4Gms8XKR8Zvrp7eyO9j9SKBaajaNb2MKDcKgmrzgTLHF1TK?=
 =?us-ascii?Q?jvkX+Sz/tlhTO1ZfoUux2hs7l0CKqy6XZF0bnAbFfsLb3n4QK5yvPAhuVgYj?=
 =?us-ascii?Q?iMZghtx8wsNxL16mpiYuv9//cGVFdcWqCpkmeGjNIZZm91bk7BPCWKeSt3n4?=
 =?us-ascii?Q?uOzqUi5HUgShngYBhhjvK5fKmafsLEygtz+ENI/pR0U+5B8LuZI3xncatj4w?=
 =?us-ascii?Q?PnrjWVsxHVDj6tCT11wiwB5G8HhJS3q9NMrs?=
X-Forefront-Antispam-Report: 	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024)(921020)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 04:58:32.2153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3eea50d-b696-4d5e-c04c-08dd612289b6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8425
X-Spam-Status: No, score=-0.4 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS,WEIRD_QUOTING autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: maryang@nvidia.com, tingkaic@nvidia.com, pmenzel@molgen.mpg.de, leohu@nvidia.com, Krzysztof Kozlowski <krzk@kernel.org>, wthai@nvidia.com, Andrew Lunn <andrew@lunn.ch>, dkodihalli@nvidia.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The GB200NVL BMC is an Aspeed Ast2600 based BMC
for Nvidia Blackwell GB200NVL platform.
Reference to Ast2600 SOC [1].
Reference to Blackwell GB200NVL Platform [2].
Co-developed-by: Mars Yang <maryang@nvidia.com>
Signed-off-by: Mars Yang <maryang@nvidia.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>
Link: Reference to Ast2600 SOC: https://www.aspeedtech.com/server_ast2600/ [1]
Link: Reference to Blackwell GB200NVL Platform: https://nvdam.widen.net/s/wwnsxrhm2w/blackwell-datasheet-3384703 [2]
Signed-off-by: Willie Thai <wthai@nvidia.com>
---
Changes in v2:
  - Fix the SOB name [Krzysztof]
  - Fix warnings from scripts/checkpatch.pl run [Krzysztof]
  - Fix DTS coding style [Krzysztof]
  - Move pinctrl override to the bottom [Krzysztof]
  - Drop bootargs [Krzysztof]
  - Follow DTS coding style and change naming for leds node [Krzysztof]
  - Change flash 0 status property [Krzysztof]
  - Change the phy-mode to rgmii [Andrew]
  - Remove the max-speed in mac0 [Andrew]
---
---
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts | 1229 +++++++++++++++++
 2 files changed, 1230 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index 2e5f4833a073..20fd357a1ee9 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -50,6 +50,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-lenovo-hr630.dtb \
 	aspeed-bmc-lenovo-hr855xg2.dtb \
 	aspeed-bmc-microsoft-olympus.dtb \
+	aspeed-bmc-nvidia-gb200nvl-bmc.dtb \
 	aspeed-bmc-opp-lanyang.dtb \
 	aspeed-bmc-opp-mowgli.dtb \
 	aspeed-bmc-opp-nicole.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
new file mode 100644
index 000000000000..eeec3704a43b
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
@@ -0,0 +1,1229 @@
+// SPDX-License-Identifier: GPL-2.0+
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "AST2600 GB200NVL BMC";
+	compatible = "nvidia,gb200nvl-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial2 = &uart3;
+		serial4 = &uart5;
+		i2c16   = &imux16;
+		i2c17   = &imux17;
+		i2c18   = &imux18;
+		i2c19   = &imux19;
+		i2c20   = &imux20;
+		i2c21   = &imux21;
+		i2c22   = &imux22;
+		i2c23   = &imux23;
+		i2c24   = &imux24;
+		i2c25   = &imux25;
+		i2c26   = &imux26;
+		i2c27   = &imux27;
+		i2c28   = &imux28;
+		i2c29   = &imux29;
+		i2c30   = &imux30;
+		i2c31   = &imux31;
+		i2c32   = &imux32;
+		i2c33   = &imux33;
+		i2c34   = &imux34;
+		i2c35   = &imux35;
+		i2c36   = &imux36;
+		i2c37   = &imux37;
+		i2c38   = &imux38;
+		i2c39   = &imux39;
+		i2c40	= &e1si2c0;
+		i2c41	= &e1si2c1;
+		i2c42	= &e1si2c2;
+		i2c43	= &e1si2c3;
+		i2c44	= &e1si2c4;
+		i2c45	= &e1si2c5;
+		i2c46	= &e1si2c6;
+		i2c47	= &e1si2c7;
+		i2c48	= &i2c17mux0;
+		i2c49	= &i2c17mux1;
+		i2c50	= &i2c17mux2;
+		i2c51	= &i2c17mux3;
+		i2c52	= &i2c25mux0;
+		i2c53	= &i2c25mux1;
+		i2c54	= &i2c25mux2;
+		i2c55	= &i2c25mux3;
+		i2c56	= &i2c29mux0;
+		i2c57	= &i2c29mux1;
+		i2c58	= &i2c29mux2;
+		i2c59	= &i2c29mux3;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x80000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		vga_memory: framebuffer@9f000000 {
+			no-map;
+			reg = <0x9f000000 0x01000000>; /* 16M */
+		};
+
+		ramoops@a0000000 {
+			compatible = "ramoops";
+			reg = <0xa0000000 0x100000>; /* 1MB */
+			record-size = <0x10000>; /* 64KB */
+			max-reason = <2>; /* KMSG_DUMP_OOPS */
+		};
+
+		gfx_memory: framebuffer {
+			size = <0x01000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+
+		video_engine_memory: jpegbuffer {
+			size = <0x02000000>;	/* 32M */
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		led-0{
+			label = "uid_led";
+			gpios = <&sgpiom0 27 GPIO_ACTIVE_LOW>;
+		};
+		led-1{
+			label = "fault_led";
+			gpios = <&sgpiom0 29 GPIO_ACTIVE_LOW>;
+		};
+		led-2{
+			label = "power_led";
+			gpios = <&sgpiom0 31 GPIO_ACTIVE_LOW>;
+		};
+
+	};
+
+	buttons {
+		button-power {
+			label = "power-btn";
+			gpio = <&sgpiom0 156 GPIO_ACTIVE_LOW>;
+		};
+		button-uid {
+			label = "uid-btn";
+			gpio = <&sgpiom0 154 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+};
+
+// Enable Primary flash on FMC for bring up activity
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		compatible = "jedec,spi-nor";
+		label = "bmc";
+		spi-max-frequency = <50000000>;
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			u-boot@0 {
+				// 896KB
+				reg = <0x0 0xe0000>;
+				label = "u-boot";
+			};
+
+			kernel@100000 {
+				// 9MB
+				reg = <0x100000 0x900000>;
+				label = "kernel";
+			};
+
+			rofs@a00000 {
+				// 55292KB (extends to end of 64MB SPI - 4KB)
+				reg = <0xa00000 0x35FF000>;
+				label = "rofs";
+			};
+		};
+	};
+};
+
+&spi2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi2_default>;
+
+	// Data SPI is 64MB in size
+	flash@0 {
+		status = "okay";
+		label = "config";
+		spi-max-frequency = <50000000>;
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			u-boot-env@0 {
+				// 256KB
+				reg = <0x0 0x40000>;
+				label = "u-boot-env";
+			};
+
+			rwfs@40000 {
+				// 16MB
+				reg = <0x40000 0x1000000>;
+				label = "rwfs";
+			};
+
+			log@1040000 {
+				// 40MB
+				reg = <0x1040000 0x2800000>;
+				label = "log";
+			};
+		};
+	};
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart3 {
+	// Enabling SOL
+	status = "okay";
+};
+
+&uart5 {
+	// BMC Debug Console
+	status = "okay";
+};
+
+&uart_routing {
+	status = "okay";
+};
+
+// MAC1 (per schematics, 1-based MAC1-MAC4) of AST2600 connected to external PHY
+// This is "mac0" in zero-based DTS
+&mdio0 {
+	status = "okay";
+	ethphy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+
+};
+
+&mdio3 {
+	status = "okay";
+	ethphy3: ethernet-phy@2 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <2>;
+	};
+};
+
+&mac0 {
+	status = "okay";
+	pinctrl-names = "default";
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy3>;
+	pinctrl-0 = <&pinctrl_rgmii1_default>;
+};
+
+&mac2 {
+	status = "okay";
+	phy-mode = "rmii";
+	use-ncsi;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii3_default>;
+};
+
+// Enable emmc
+&emmc_controller {
+	status = "okay";
+};
+
+&emmc {
+	non-removable;
+	pinctrl-0 = <&pinctrl_emmcg5_default>;
+	bus-width = <4>;
+	max-frequency = <52000000>;
+	clk-phase-mmc-hs200 = <9>, <225>;
+};
+
+/*
+ * Enable USB port A as device (via the virtual hub) to host
+ */
+&vhub {
+	status = "okay";
+	pinctrl-names = "default";
+	/*
+	 * Uncomment below line to enable internal EHCI controller
+	 * Current config uses xHCI Port1
+	 */
+};
+
+&video {
+	status = "okay";
+	memory-region = <&video_engine_memory>;
+};
+
+// USB 2.0 to HMC, on USB Port B
+&ehci1 {
+	status = "okay";
+};
+
+// USB 1.0
+&uhci {
+	status = "okay";
+};
+
+&sgpiom0 {
+	status="okay";
+	ngpios = <128>;
+
+	gpio-line-names =
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"RUN_POWER_FAULT_L-I","SYS_RST_IN_L-O",
+		"RUN_POWER_PG-I","PWR_BRAKE_L-O",
+		"SYS_RST_OUT_L-I","RUN_POWER_EN-O",
+		"L0L1_RST_REQ_OUT_L-I","SHDN_FORCE_L-O",
+		"L2_RST_REQ_OUT_L-I","SHDN_REQ_L-O",
+		"SHDN_OK_L-I","UID_LED_N-O",
+		"BMC_I2C1_FPGA_ALERT_L-I","SYS_FAULT_LED_N-O",
+		"BMC_I2C0_FPGA_ALERT_L-I","PWR_LED_N-O",
+		"FPGA_RSVD_FFU3-I","",
+		"FPGA_RSVD_FFU2-I","",
+		"FPGA_RSVD_FFU1-I","",
+		"FPGA_RSVD_FFU0-I","BMC_I2C_SSIF_ALERT_L-O",
+		"CPU_BOOT_DONE-I","JTAG_MUX_SELECT-O",
+		"SPI_BMC_FPGA_INT_L-I","RTC_CLR_L-O",
+		"THERM_BB_WARN_L-I","UART_MUX_SEL-O",
+		"THERM_BB_OVERT_L-I","",
+		"CPU0_UPHY3_PRSNT1_L-I","IOBRD0_RUN_POWER_EN-O",
+		"CPU0_UPHY3_PRSNT0_L-I","IOBRD1_RUN_POWER_EN-O",
+		"CPU0_UPHY2_PRSNT1_L-I","FPGA_RSVD_FFU4-O",
+		"CPU0_UPHY2_PRSNT0_L-I","FPGA_RSVD_FFU5-O",
+		"CPU0_UPHY1_PRSNT1_L-I","FPGA_RSVD_FFU6-O",
+		"CPU0_UPHY1_PRSNT0_L-I","FPGA_RSVD_FFU7-O",
+		"CPU0_UPHY0_PRSNT1_L-I","RSVD_NV_PLT_DETECT-O",
+		"CPU0_UPHY0_PRSNT0_L-I","SPI1_INT_L-O",
+		"CPU1_UPHY3_PRSNT1_L-I","",
+		"CPU1_UPHY3_PRSNT0_L-I","HMC_EROT_MUX_STATUS",
+		"CPU1_UPHY2_PRSNT1_L-I","",
+		"CPU1_UPHY2_PRSNT0_L-I","",
+		"CPU1_UPHY1_PRSNT1_L-I","",
+		"CPU1_UPHY1_PRSNT0_L-I","",
+		"CPU1_UPHY0_PRSNT1_L-I","",
+		"CPU1_UPHY0_PRSNT0_L-I","",
+		"FAN1_PRESENT_L-I","",
+		"FAN0_PRESENT_L-I","",
+		"","",
+		"IPEX_CABLE_PRSNT_L-I","",
+		"M2_1_PRSNT_L-I","",
+		"M2_0_PRSNT_L-I","",
+		"CPU1_UPHY4_PRSNT1_L-I","",
+		"CPU0_UPHY4_PRSNT0_L-I","",
+		"","",
+		"I2C_RTC_ALERT_L-I","",
+		"FAN7_PRESENT_L-I","",
+		"FAN6_PRESENT_L-I","",
+		"FAN5_PRESENT_L-I","",
+		"FAN4_PRESENT_L-I","",
+		"FAN3_PRESENT_L-I","",
+		"FAN2_PRESENT_L-I","",
+		"IOBRD0_IOX_INT_L-I","",
+		"IOBRD1_PRSNT_L-I","",
+		"IOBRD0_PRSNT_L-I","",
+		"IOBRD1_PWR_GOOD-I","",
+		"IOBRD0_PWR_GOOD-I","",
+		"","",
+		"","",
+		"FAN_FAIL_IN_L-I","",
+		"","",
+		"","",
+		"","",
+		"PDB_CABLE_PRESENT_L-I","",
+		"","",
+		"CHASSIS_PWR_BRK_L-I","",
+		"","",
+		"IOBRD1_IOX_INT_L-I","",
+		"10GBE_SMBALRT_L-I","",
+		"PCIE_WAKE_L-I","",
+		"I2C_M21_ALERT_L-I","",
+		"I2C_M20_ALERT_L-I","",
+		"TRAY_FAST_SHDN_L-I","",
+		"UID_BTN_N-I","",
+		"PWR_BTN_L-I","",
+		"PSU_SMB_ALERT_L-I","",
+		"","",
+		"","",
+		"NODE_LOC_ID[0]-I","",
+		"NODE_LOC_ID[1]-I","",
+		"NODE_LOC_ID[2]-I","",
+		"NODE_LOC_ID[3]-I","",
+		"NODE_LOC_ID[4]-I","",
+		"NODE_LOC_ID[5]-I","",
+		"FAN10_PRESENT_L-I","",
+		"FAN9_PRESENT_L-I","",
+		"FAN8_PRESENT_L-I","",
+		"FPGA1_READY_HMC-I","",
+		"DP_HPD-I","",
+		"HMC_I2C3_FPGA_ALERT_L-I","",
+		"HMC_I2C2_FPGA_ALERT_L-I","",
+		"FPGA0_READY_HMC-I","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"LEAK_DETECT_ALERT_L-I","",
+		"MOD1_B2B_CABLE_PRESENT_L-I","",
+		"MOD1_CLINK_CABLE_PRESENT_L-I","",
+		"FAN11_PRESENT_L-I","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"RSVD_SGPIO_IN_CRC[0]","RSVD_SGPIO_O_CRC[7]",
+		"RSVD_SGPIO_IN_CRC[1]","RSVD_SGPIO_O_CRC[6]",
+		"RSVD_SGPIO_IN_CRC[2]","RSVD_SGPIO_O_CRC[5]",
+		"RSVD_SGPIO_IN_CRC[3]","RSVD_SGPIO_O_CRC[4]",
+		"RSVD_SGPIO_IN_CRC[4]","RSVD_SGPIO_O_CRC[3]",
+		"RSVD_SGPIO_IN_CRC[5]","RSVD_SGPIO_O_CRC[2]",
+		"RSVD_SGPIO_IN_CRC[6]","RSVD_SGPIO_O_CRC[1]",
+		"RSVD_SGPIO_IN_CRC[7]","RSVD_SGPIO_O_CRC[0]";
+};
+
+// I2C1, SSIF IPMI interface
+&i2c0 {
+	status = "okay";
+	clock-frequency = <400000>;
+	disable-master = <1>;
+	i2c-scl-clk-low-timeout-us = <32000>;
+	ssif-bmc@10 {
+		compatible = "ssif-bmc";
+		reg = <0x10>;
+	};
+};
+
+// I2C2
+// BMC_I2C1_FPGA - Secondary FPGA
+// HMC EROT
+&i2c1 {
+	status = "okay";
+	clock-frequency = <400000>;
+	multi-master;
+	i2c-scl-clk-low-timeout-us = <32000>;
+};
+
+// I2C3
+// BMC_I2C0_FPGA - Primary FPGA
+// HMC FRU EEPROM
+&i2c2 {
+	status = "okay";
+	clock-frequency = <400000>;
+	multi-master;
+	i2c-scl-clk-low-timeout-us = <32000>;
+};
+
+// I2C4
+&i2c3 {
+	status = "disabled";
+};
+
+// I2C5
+// RTC Driver
+// IO Expander
+&i2c4 {
+	status = "okay";
+	clock-frequency = <400000>;
+	// Module 0, Expander @0x21
+	exp4: pca9555@21 {
+		compatible = "nxp,pca9555";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+
+		gpio-line-names =
+			"RTC_MUX_SEL-O",
+			"PCI_MUX_SEL-O",
+			"TPM_MUX_SEL-O",
+			"FAN_MUX-SEL-O",
+			"SGMII_MUX_SEL-O",
+			"DP_MUX_SEL-O",
+			"UPHY3_USB_SEL-O",
+			"NCSI_MUX_SEL-O",
+			"BMC_PHY_RST-O",
+			"RTC_CLR_L-O",
+			"BMC_12V_CTRL-O",
+			"PS_RUN_IO0_PG-I",
+			"",
+			"",
+			"",
+			"";
+	};
+};
+
+// I2C6
+// Module 0/1 I2C MUX x3
+&i2c5 {
+	status = "okay";
+	clock-frequency = <400000>;
+	multi-master;
+	i2c-scl-clk-low-timeout-us = <32000>;
+
+	i2c-switch@71 {
+		compatible = "nxp,pca9546";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x71>;
+		i2c-mux-idle-disconnect;
+
+		imux16: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		imux17: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			i2c-switch@74 {
+				compatible = "nxp,pca9546";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x74>;
+				i2c-mux-idle-disconnect;
+
+				i2c17mux0: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+
+				i2c17mux1: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+
+				i2c17mux2: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+
+				i2c17mux3: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+			};
+		};
+
+		imux18: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		imux19: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+
+	i2c-switch@72 {
+		compatible = "nxp,pca9546";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x72>;
+		i2c-mux-idle-disconnect;
+
+		imux20: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		imux21: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			pca9555@21 {
+				compatible = "nxp,pca9555";
+				reg = <0x21>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				gpio-line-names =
+					"RST_CX_0_L-O",
+					"RST_CX_1_L-O",
+					"CX0_SSD0_PRSNT_L-I",
+					"CX1_SSD1_PRSNT_L-I",
+					"CX_BOOT_CMPLT_CX0-I",
+					"CX_BOOT_CMPLT_CX1-I",
+					"CX_TWARN_CX0_L-I",
+					"CX_TWARN_CX1_L-I",
+					"CX_OVT_SHDN_CX0-I",
+					"CX_OVT_SHDN_CX1-I",
+					"FNP_L_CX0-O",
+					"FNP_L_CX1-O",
+					"",
+					"MCU_GPIO-I",
+					"MCU_RST_N-O",
+					"MCU_RECOVERY_N-O";
+			};
+		};
+
+		imux22: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		imux23: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+
+	i2c-switch@73 {
+		compatible = "nxp,pca9546";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x73>;
+		i2c-mux-idle-disconnect;
+
+		imux24: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		imux25: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			i2c-switch@70 {
+				compatible = "nxp,pca9546";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x70>;
+				i2c-mux-idle-disconnect;
+
+				i2c25mux0: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+
+				i2c25mux1: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+
+				i2c25mux2: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+
+				i2c25mux3: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+			};
+		};
+
+		imux26: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		imux27: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+
+	i2c-switch@75 {
+		compatible = "nxp,pca9546";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x75>;
+		i2c-mux-idle-disconnect;
+
+		imux28: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		imux29: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			i2c-switch@74 {
+				compatible = "nxp,pca9546";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x74>;
+				i2c-mux-idle-disconnect;
+
+				i2c29mux0: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+
+				i2c29mux1: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+
+				i2c29mux2: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+
+				i2c29mux3: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+			};
+		};
+
+		imux30: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		imux31: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+
+	i2c-switch@76 {
+		compatible = "nxp,pca9546";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x76>;
+		i2c-mux-idle-disconnect;
+
+		imux32: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		imux33: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			pca9555@21 {
+				compatible = "nxp,pca9555";
+				reg = <0x21>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				gpio-line-names =
+					"SEC_RST_CX_0_L-O",
+					"SEC_RST_CX_1_L-O",
+					"SEC_CX0_SSD0_PRSNT_L-I",
+					"SEC_CX1_SSD1_PRSNT_L-I",
+					"SEC_CX_BOOT_CMPLT_CX0-I",
+					"SEC_CX_BOOT_CMPLT_CX1-I",
+					"SEC_CX_TWARN_CX0_L-I",
+					"SEC_CX_TWARN_CX1_L-I",
+					"SEC_CX_OVT_SHDN_CX0-I",
+					"SEC_CX_OVT_SHDN_CX1-I",
+					"SEC_FNP_L_CX0-O",
+					"SEC_FNP_L_CX1-O",
+					"",
+					"SEC_MCU_GPIO-I",
+					"SEC_MCU_RST_N-O",
+					"SEC_MCU_RECOVERY_N-O";
+				};
+		};
+
+		imux34: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		imux35: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+
+	i2c-switch@77 {
+		compatible = "nxp,pca9546";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x77>;
+		i2c-mux-idle-disconnect;
+
+		imux36: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		imux37: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		imux38: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		imux39: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+};
+
+// I2C7
+// Module 0/1 Leak Sensors
+// Module 0/1 Fan Controllers
+&i2c6 {
+	status = "okay";
+	clock-frequency = <400000>;
+	hsc@12 {
+		compatible = "ti,lm5066i";
+		reg = <0x12>;
+		shunt-resistor-micro-ohms = <190>;
+		status = "okay";
+	};
+	hsc@14 {
+		compatible = "ti,lm5066i";
+		reg = <0x14>;
+		shunt-resistor-micro-ohms = <190>;
+		status = "okay";
+	};
+	max31790@20 {
+		compatible = "maxim,max31790";
+		reg = <0x20>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+	max31790@23 {
+		compatible = "maxim,max31790";
+		reg = <0x23>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+	max31790@2c {
+		compatible = "maxim,max31790";
+		reg = <0x2c>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+	max31790@2f {
+		compatible = "maxim,max31790";
+		reg = <0x2f>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
+
+// I2C9
+// M.2
+&i2c8 {
+	status = "okay";
+	clock-frequency = <400000>;
+	multi-master;
+	i2c-scl-clk-low-timeout-us = <32000>;
+};
+
+// I2C10
+// HMC IO Expander
+// Module 0/1 IO Expanders
+&i2c9 {
+	status = "okay";
+	clock-frequency = <400000>;
+	// Module 0, Expander @0x20
+	exp0: pca9555@20 {
+		compatible = "nxp,pca9555";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+
+		gpio-line-names =
+		"FPGA_THERM_OVERT_L-I",
+		"FPGA_READY_BMC-I",
+		"HMC_BMC_DETECT-O",
+		"HMC_PGOOD-O",
+		"",
+		"BMC_STBY_CYCLE-O",
+		"FPGA_EROT_FATAL_ERROR_L-I",
+		"WP_HW_EXT_CTRL_L-O",
+		"EROT_FPGA_RST_L-O",
+		"FPGA_EROT_RECOVERY_L-O",
+		"BMC_EROT_FPGA_SPI_MUX_SEL-O",
+		"USB_HUB_RESET_L-O",
+		"NCSI_CS1_SEL-O",
+		"SGPIO_EN_L-O",
+		"B2B_IOEXP_INT_L-I",
+		"I2C_BUS_MUX_RESET_L-O";
+	};
+
+	// Module 1, Expander @0x21
+	exp1: pca9555@21 {
+		compatible = "nxp,pca9555";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+
+		gpio-line-names =
+		"SEC_FPGA_THERM_OVERT_L-I",
+		"SEC_FPGA_READY_BMC-I",
+		"",
+		"",
+		"",
+		"",
+		"SEC_FPGA_EROT_FATAL_ERROR_L-I",
+		"SEC_WP_HW_EXT_CTRL_L-O",
+		"SEC_EROT_FPGA_RST_L-O",
+		"SEC_FPGA_EROT_RECOVERY_L-O",
+		"SEC_BMC_EROT_FPGA_SPI_MUX_SEL-O",
+		"SEC_USB2_HUB_RST_L-O",
+		"",
+		"",
+		"",
+		"SEC_I2C_BUS_MUX_RESET_L-O";
+	};
+
+	// HMC Expander @0x27
+	exp2: pca9555@27 {
+		compatible = "nxp,pca9555";
+		reg = <0x27>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+
+		gpio-line-names =
+		"HMC_PRSNT_L-I",
+		"HMC_READY-I",
+		"HMC_EROT_FATAL_ERROR_L-I",
+		"I2C_MUX_SEL-O",
+		"HMC_EROT_SPI_MUX_SEL-O",
+		"HMC_EROT_RECOVERY_L-O",
+		"HMC_EROT_RST_L-O",
+		"GLOBAL_WP_HMC-O",
+		"FPGA_RST_L-O",
+		"USB2_HUB_RST-O",
+		"CPU_UART_MUX_SEL-O",
+		"",
+		"",
+		"",
+		"",
+		"";
+	};
+	// HMC Expander @0x74
+	exp3: pca9555@74 {
+		compatible = "nxp,pca9555";
+		reg = <0x74>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+
+		gpio-line-names =
+		"IOB_PRSNT_L",
+		"IOB_DP_HPD",
+		"IOX_BMC_RESET",
+		"IOB_IOEXP_INT_L",
+		"IOB_UID_LED_L",
+		"IOB_UID_BTN_L",
+		"IOB_SYS_RST_BTN_L",
+		"IOB_PWR_LED_L",
+		"IOB_PWR_BTN_L",
+		"IOB_PHY_RST",
+		"CPLD_JTAG_MUX_SEL",
+		"",
+		"",
+		"",
+		"",
+		"";
+	};
+};
+
+// I2C11
+// BMC FRU EEPROM
+// BMC Temp Sensor
+&i2c10 {
+	status = "okay";
+	clock-frequency = <400000>;
+	// BMC FRU EEPROM - 256 bytes
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+		pagesize = <8>;
+	};
+};
+
+// I2C12
+&i2c11 {
+	status = "disabled";
+};
+
+// I2C13
+&i2c12 {
+	status = "disabled";
+};
+
+// I2C14
+// Module 0 UPHY3 SMBus
+&i2c13 {
+	status = "disabled";
+};
+
+// I2C15
+// Module 1 UPHY3 SMBus
+&i2c14 {
+	status = "okay";
+	clock-frequency = <100000>;
+	multi-master;
+	i2c-scl-clk-low-timeout-us = <32000>;
+
+	//E1.S drive slot 0-3
+	i2c-switch@77 {
+		compatible = "nxp,pca9546";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x77>;
+		i2c-mux-idle-disconnect;
+
+		e1si2c0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		e1si2c1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		e1si2c2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		e1si2c3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+};
+
+// I2C16
+&i2c15 {
+	status = "okay";
+	clock-frequency = <100000>;
+	multi-master;
+	i2c-scl-clk-low-timeout-us = <32000>;
+
+	//E1.S drive slot 4-7
+	i2c-switch@77 {
+		compatible = "nxp,pca9546";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x77>;
+		i2c-mux-idle-disconnect;
+
+		e1si2c4: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		e1si2c5: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		e1si2c6: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		e1si2c7: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+};
+
+&rng {
+	status = "okay";
+};
+
+&gpio0 {
+	gpio-line-names =
+
+	/* gpio-line-names are the combination of <signal>-<I/O> , "" is
+	 *	the placeholder for the unused pins
+	 */
+
+	/* 208 (26*8) 3.3V GPIOs */
+
+	/*A0-A7*/ "", "", "", "", "", "", "", "",
+	/*B0-B7*/ "", "", "", "", "", "", "", "",
+	/*C0-C7*/ "SGPIO_I2C_MUX_SEL-O", "", "", "", "", "", "", "",
+	/*D0-D7*/ "", "", "", "UART1_MUX_SEL-O", "", "FPGA_PEX_RST_L-O", "", "",
+	/*E0-E7*/
+	"RTL8221_PHY_RST_L-O",
+	"RTL8211_PHY_INT_L-I",
+	"",
+	"UART3_MUX_SEL-O",
+	"", "", "",
+	"SGPIO_BMC_EN-O",
+	/*F0-F7*/ "", "", "", "", "", "", "", "",
+	/*G0-G7*/ "", "", "", "", "", "", "", "",
+	/*H0-H7*/ "", "", "", "", "", "", "", "",
+	/*I0-I7*/ "", "", "", "", "", "QSPI2_RST_L-O", "GLOBAL_WP_BMC-O", "BMC_DDR4_TEN-O",
+	/*J0-J7*/ "", "", "", "", "", "", "", "",
+	/*K0-K7*/ "", "", "", "", "", "", "", "",
+	/*L0-L7*/ "", "", "", "", "", "", "", "",
+	/*M0-M7*/
+	"PCIE_EP_RST_EN-O",
+	"BMC_FRU_WP-O",
+	"HMC_RESET_L-O",
+	"STBY_POWER_EN-O",
+	"STBY_POWER_PG-I",
+	"PCIE_EP_RST_L-O",
+	"", "",
+	/*N0-N7*/ "", "", "", "", "", "", "", "",
+	/*O0-O7*/ "", "", "", "", "", "", "", "",
+	/*P0-P7*/ "", "", "", "", "", "", "", "",
+	/*Q0-Q7*/ "", "", "", "", "", "", "", "",
+	/*R0-R7*/ "", "", "", "", "", "", "", "",
+	/*S0-S7*/ "", "", "", "", "", "", "", "",
+	/*T0-T7*/ "", "", "", "", "", "", "", "",
+	/*U0-U7*/ "", "", "", "", "", "", "", "",
+	/*V0-V7*/ "AP_EROT_REQ-O", "EROT_AP_GNT-I", "", "","PCB_TEMP_ALERT-I", "","", "",
+	/*W0-W7*/ "", "", "", "", "", "", "", "",
+	/*X0-X7*/ "", "", "TPM_MUX_SEL-O", "", "", "", "", "",
+	/*Y0-Y7*/ "", "", "", "EMMC_RST-O", "","", "", "",
+	/*Z0-Z7*/ "BMC_READY-O","", "", "", "", "", "", "";
+};
+
+&gpio1 {
+	/* 36 1.8V GPIOs */
+	gpio-line-names =
+	/*A0-A7*/ "", "", "", "", "", "", "", "",
+	/*B0-B7*/ "", "", "", "", "", "", "IO_EXPANDER_INT_L-I","",
+	/*C0-C7*/ "", "", "", "", "", "", "", "",
+	/*D0-D7*/ "", "", "", "", "", "", "SPI_HOST_TPM_RST_L-O", "SPI_BMC_FPGA_INT_L-I",
+	/*E0-E7*/ "", "", "", "", "", "", "", "";
+};
+
+// EMMC group that excludes WP pin
+&pinctrl {
+	pinctrl_emmcg5_default: emmcg5_default {
+		function = "EMMC";
+		groups = "EMMCG5";
+	};
+};
-- 
2.25.1

