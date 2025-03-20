Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0B2A6AB6E
	for <lists+openbmc@lfdr.de>; Thu, 20 Mar 2025 17:48:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJWjD41pWz3bqh
	for <lists+openbmc@lfdr.de>; Fri, 21 Mar 2025 03:48:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2412::607" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742489273;
	cv=pass; b=cCuwuICMtnANOXs7FfOea0eZZdnf1ZTF2ZqQweZgSsATgd+lkmfvH+4+zzZ1wMzLrAioCe9WUl9z1JFYtjKzQryO7jQgx3YIWboWv81qiyVCHhtDKnWmzgsfTEP1kHrPf+jZHc8F34HVsbaBiYGV4l1Yq4BBzhrwSyh2/QtKX1wtBkqFKYA7ItgumQhqr23uCnb/XQnwxdDpX4YNjb7XwVqP/Y8ABldzkjwAaMyMyuQEIQ2mAkev3SjS+Vzp/mmp9VVGXu31SlIexZVzBBIW+25aapnwHZJ1fncr4agSw9pPgzelsAkOOwYdSHLsp4ujQtF+Ou5Jdd5XtMT3/TwxDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742489273; c=relaxed/relaxed;
	bh=nPMrw5+Sp8jOvub/tm/8oq/eywdyXZIlvO1gWYOlbEA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dQIyZByBe2usmOspZImNgQ3vafluMUyKki7WjeqjZl0wfOD5kRXHJBjw22GpkLrOLXlOmDdVsJH9D+ZSMcKRQdvTo5KjqXzxX0fk1mt07qdREkx3sFnNy+6JQcooW1BcfLlWoRui/62N+r7JpycHr2v2+d4DOGAGPFjAbg18qE78R4TXiZzUlrt+L1kmZZ6pfBjoOWWY4f1pY3LzcjWluyxbZ6KSguOf0LclK1e5hqV4TvcOrjbVcY9gXqH1T339vD1pKkV91X42JmwyEjNoq2bDC1tP6s8vgq5KM/KDfy2DtthmWTOLOF0AKcg/z6EVDk37p9PcOfDdmnbnp/5+UQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kfDwDyKC; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2412::607; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kfDwDyKC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2412::607; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20607.outbound.protection.outlook.com [IPv6:2a01:111:f403:2412::607])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJWj02Lh6z30TM;
	Fri, 21 Mar 2025 03:47:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e4r6e/SeOcDUs+9BRDivnQgKQae0l5dZPcQhBMPK3b6js7O/XQsLItsZtJHbzaTzSqsRMd29uSerJF/sUMwU7hUCkkOu2n6Gjhazsw0LpiN81W6Rl7Ux2YSNTLVCyb5FXTZ2gq0FZ55/joRcevuMmQIWJwloKZKn47ivRLfpVVpCGCi5sbIa96Aw0UwF0iiCH+0gauz6SV1Mlfr4Uqb1yiOggOXqTAObf6+BBO9DmfyVSyI0kmmEZc2J5hZ9bwZBjC1NfbEDULgEcveBrypiw8FB8KXlxF+XBy37ONiz+p/4p/IXBVCAF4evTFPfy8r6QvDzU5KEoZCthdpi/w0uTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPMrw5+Sp8jOvub/tm/8oq/eywdyXZIlvO1gWYOlbEA=;
 b=E+J/NErSt39htHybp3flls6muuTf9d3HIhd1c214ekFMxSoIWOV8J3NuCAYJPzSIaa7B0/ucrNfxEEcGIAXxhm1a/3H8kHI7GTiA+ZH32IIODfCTr8UQg+1feSuiJcqUotdp9TOYINJ5Srs+nUWHeZN38Sfn9ScTa7Pua3H+mUjaAla0ElepoI8AMXqEcD7EDYjg8kWP9QQb6PcUUEXqjV8b+N3oev7X4W+BZ7m5ja25GpnwsLlNrcWvuSfr4Pncef2KCPSJtKVkpC5Uak6Sei+ejRn6ogJaRbnD95CpVmULXYSeaqx8rWNNcrYuu5YbhyTzGQB/P9e+LM9v2H2YEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPMrw5+Sp8jOvub/tm/8oq/eywdyXZIlvO1gWYOlbEA=;
 b=kfDwDyKCVmsaMOxin0AOi6XgruvwS22jWMzecdgWD910r/bRtfIouAD2/iEoKgJ/3ytUoKZMuZLYcjFDg+LrGWUbd8s0bgcImW3g3EHsglrMKQS8eAitRbWx9sAjGV0eZTqb94T26HPHQo8h6vXw5xOEFkYX4CTf1D4PqiqHNvyeuNWAiW97cgBRyQMBXR1u+BiDYdwFqD52dv1L3B4Q8Mj80vNJj3ioC8X8Ti3RXiRKJLScHfj7NcZqNQ326VDkMdZ7Dg+BVbCSFTca2O/qD6475jc4Wz5s0bEzO/UYQLrjha9UmRNw5xWxMLM+FMfDJJPDuYX1asiLr70yKgJ0lg==
Received: from SA1P222CA0143.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::19)
 by SA0PR12MB4432.namprd12.prod.outlook.com (2603:10b6:806:98::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 16:47:20 +0000
Received: from SA2PEPF00003F62.namprd04.prod.outlook.com
 (2603:10b6:806:3c2:cafe::28) by SA1P222CA0143.outlook.office365.com
 (2603:10b6:806:3c2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.34 via Frontend Transport; Thu,
 20 Mar 2025 16:47:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SA2PEPF00003F62.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Thu, 20 Mar 2025 16:47:20 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 20 Mar
 2025 09:47:11 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Mar 2025 09:47:11 -0700
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 20 Mar 2025 09:47:10 -0700
From: Willie Thai <wthai@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <kees@kernel.org>,
	<tony.luck@intel.com>, <gpiccoli@igalia.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>
Subject: [PATCH v3 1/2] ARM: dts: aspeed: Add device tree for Nvidia's GB200NVL BMC
Date: Thu, 20 Mar 2025 16:46:32 +0000
Message-ID: <20250320164633.101331-2-wthai@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250320164633.101331-1-wthai@nvidia.com>
References: <20250320164633.101331-1-wthai@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F62:EE_|SA0PR12MB4432:EE_
X-MS-Office365-Filtering-Correlation-Id: b89277d0-b32b-4217-c54a-08dd67cee1f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026|921020|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?PPHUsKCKi6yPs2U/kiikESDvjBxggAXHfU3h1Dabj9McmRTJB7BHTovHRlyb?=
 =?us-ascii?Q?YgxdqohtbvSRylRyI80MEdUcI+D/bW0KhuyvLRAyR3Dxe5DLvqW07+QOceuy?=
 =?us-ascii?Q?pzM2gyKlyKnqDWyeIegoa/hnNAf9n79Mu0KRM+PoyNdjkohgxyU4r/1LUTxc?=
 =?us-ascii?Q?xIO8VyBcUZrzX3KJxtHfE1vaN/tCch4MBYaqBdHpvZt9qewBo/HnelNS2fRl?=
 =?us-ascii?Q?IG6drbQAAYyUERSU3zfCvEnkUeQqHtg4JTdelmMHgXA+m/gxFKkBMKZDMl4P?=
 =?us-ascii?Q?9NZlnRL3qn2fPhjP79FmCXpflP5xP4EwOygowjdbTCwmqRzi5LHaFPTzYKBx?=
 =?us-ascii?Q?qZqb7ofVKEDWpv+calyOQjaXH49veHlZg/b/1lk7uQLQpIXq5nOrk1MybxdR?=
 =?us-ascii?Q?a/AoT0wXK4W7HiT1C0yO65A0UEoAba2WZTWcSDJmemW4oPIuae9uh/YF8ilK?=
 =?us-ascii?Q?7OfDcidcgAYgwiyz5+xWM9l9ziMIANePZvSnoHJ/8urnPA18aQxhVoa9Y/8Q?=
 =?us-ascii?Q?zgPRJAnpjvXu54OeXKM8s34yN6baQ+qR6oZEfqd9Ui7i8yf1toWNCi6PEMGX?=
 =?us-ascii?Q?DUVpxG9RoXD2FBeUPT+Hh6GF3bWkh6JpijU55HLcNAQySUqQMaTDmvwB7Gm2?=
 =?us-ascii?Q?y/G+yz2w8FBwuJ/SQJzBWQ7OHUCCT1jy3OgPHZ03y7AdzhIYNVNFAy+aTOVS?=
 =?us-ascii?Q?lMZ4r5ycWDm+Cq4EnWq98hGXRrn4SFt43PaByiqEgdSyf/dJ+jAM95tQzypa?=
 =?us-ascii?Q?brFyMBG9YwGUxx9kn71S1pxt0VakZp7DS6myDvzZBxKj3JO8XjhAhFROiLw7?=
 =?us-ascii?Q?WwINTnz0ISo7Pp4XnKqgeVkv0yWPL0F4wk+mliTGJARZ4bIqJgmDe3lQyTgG?=
 =?us-ascii?Q?eKi23xHb/r5kvTonDHGZ/tpHKAc7IzQOl1p1NdjCUPA0iXw2qojKbRQIaIxp?=
 =?us-ascii?Q?0hjrvzkWXAAt5e9qEl0Cu/OgdNeXacGzgD9HqyX6KQi4p79/wIyNv9szLek3?=
 =?us-ascii?Q?R9sV+u3aFX9KplcRSCjoqOWGLzDlTeUQ28q+Od05o+SehP1A7+E5xLvXtOVq?=
 =?us-ascii?Q?pr4Mjv6JATK2cJSMrJOsdHAzP+mNmgUbl+gKmUOtvDsh8EynexRV++uo4UIX?=
 =?us-ascii?Q?u/xSxuKdjF3CLMHm97dGwS6sQgBDmPFcuI6Kby9QMNSXXD39OvhGZsZZntXM?=
 =?us-ascii?Q?xucg63b7SH++F4TBhDLX6MbuvbyyMscHaQRXmst0oaumJzH5ck/1KxZmDeVV?=
 =?us-ascii?Q?Daun8XcazbRkAWM2TxBj7/znAVoOz109wS7qxdarHaHXcwhbp+1JZj4ztFcq?=
 =?us-ascii?Q?/Ua7A0/YzmBt5IW4mWEtqNvD3x4xDHsB0+8omtbu9GUSxp1lBrbT6w/EDkQp?=
 =?us-ascii?Q?7zdbnlnIfzPoptLE6SM3iP6lbQLP29fwTuNQCF12vgtSUP1yxutaGXAphCE8?=
 =?us-ascii?Q?m/XMlS2RN80kC5dLb7Rz0ZBkqFYqVJEW9Tcn0HOj8dmC3eZ0huZx52qH6UFT?=
 =?us-ascii?Q?Uknj78lhnj3A4Gc8wa0MDAeaV9mcU2p8NEfp?=
X-Forefront-Antispam-Report: 	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026)(921020)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 16:47:20.7394
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b89277d0-b32b-4217-c54a-08dd67cee1f9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 	SA2PEPF00003F62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4432
X-Spam-Status: No, score=-1.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS,WEIRD_QUOTING autolearn=disabled version=4.0.1
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
Cc: Mars Yang <maryang@nvidia.com>, Paul Menzel <pmenzel@molgen.mpg.de>, tingkaic@nvidia.com, Andrew Lunn <andrew@lunn.ch>, leohu@nvidia.com, Krzysztof Kozlowski <krzk@kernel.org>, wthai@nvidia.com, dkodihalli@nvidia.com
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
Cc: Rob Herring <robh@kernel.org>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>
Link: https://www.aspeedtech.com/server_ast2600/ [1]
Link: https://nvdam.widen.net/s/wwnsxrhm2w/blackwell-datasheet-3384703 [2]
Signed-off-by: Willie Thai <wthai@nvidia.com>
---
Changes v1 -> v2:
  - Fix the SOB name [Krzysztof]
  - Fix warnings from scripts/checkpatch.pl run [Krzysztof]
  - Fix DTS coding style [Krzysztof]
  - Move pinctrl override to the bottom [Krzysztof]
  - Drop bootargs [Krzysztof]
  - Follow DTS coding style and change naming for leds node [Krzysztof]
  - Change flash 0 status property [Krzysztof]
  - Change the phy-mode to rgmii [Andrew]
  - Remove the max-speed in mac0 [Andrew]
  - Put gpio line name in one line per group of 8 gpios, but keep some b/c they can exceed length limit [Paul]
Changes v2 -> v3:
  - Fix missing new line [Krzysztof]
  - Fix missing binding define, adding it in the patch no.1 of this patch set v3 [Krzysztof, Rob]
  - Fix DTS coding style [Krzysztof]
  - Modify nodes name to generic name for: i2c expander pca9546, gpio expander pca9555, power monitor lm5066i, fan controller max31790 [Krzysztof]
  - Skip mac setting and wait till the delay issue in phy-mode fix from Aspeed SOC vendor side [Andrew]
  - Remove i2c-scl-clk-low-timeout-us which is Apseed proprietary property [Mars]
---
---
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts | 1168 +++++++++++++++++
 2 files changed, 1169 insertions(+)
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
index 000000000000..0370a7b25181
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
@@ -0,0 +1,1168 @@
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
+		led-0 {
+			label = "uid_led";
+			gpios = <&sgpiom0 27 GPIO_ACTIVE_LOW>;
+		};
+		led-1 {
+			label = "fault_led";
+			gpios = <&sgpiom0 29 GPIO_ACTIVE_LOW>;
+		};
+		led-2 {
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
+};
+
+// I2C3
+// BMC_I2C0_FPGA - Primary FPGA
+// HMC FRU EEPROM
+&i2c2 {
+	status = "okay";
+	clock-frequency = <400000>;
+	multi-master;
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
+	exp4: gpio@21 {
+		compatible = "nxp,pca9555";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
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
+
+	i2c-mux@71 {
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
+			i2c-mux@74 {
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
+	i2c-mux@72 {
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
+
+			gpio@21 {
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
+	i2c-mux@73 {
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
+			i2c-mux@70 {
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
+	i2c-mux@75 {
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
+			i2c-mux@74 {
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
+	i2c-mux@76 {
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
+
+			gpio@21 {
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
+	i2c-mux@77 {
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
+	pmic@12 {
+		compatible = "ti,lm5066i";
+		reg = <0x12>;
+		shunt-resistor-micro-ohms = <190>;
+		status = "okay";
+	};
+	pmic@14 {
+		compatible = "ti,lm5066i";
+		reg = <0x14>;
+		shunt-resistor-micro-ohms = <190>;
+		status = "okay";
+	};
+	pwm@20 {
+		compatible = "maxim,max31790";
+		reg = <0x20>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+	pwm@23 {
+		compatible = "maxim,max31790";
+		reg = <0x23>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+	pwm@2c {
+		compatible = "maxim,max31790";
+		reg = <0x2c>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+	pwm@2f {
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
+};
+
+// I2C10
+// HMC IO Expander
+// Module 0/1 IO Expanders
+&i2c9 {
+	status = "okay";
+	clock-frequency = <400000>;
+	// Module 0, Expander @0x20
+	exp0: gpio@20 {
+		compatible = "nxp,pca9555";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"FPGA_THERM_OVERT_L-I",
+			"FPGA_READY_BMC-I",
+			"HMC_BMC_DETECT-O",
+			"HMC_PGOOD-O",
+			"",
+			"BMC_STBY_CYCLE-O",
+			"FPGA_EROT_FATAL_ERROR_L-I",
+			"WP_HW_EXT_CTRL_L-O",
+			"EROT_FPGA_RST_L-O",
+			"FPGA_EROT_RECOVERY_L-O",
+			"BMC_EROT_FPGA_SPI_MUX_SEL-O",
+			"USB_HUB_RESET_L-O",
+			"NCSI_CS1_SEL-O",
+			"SGPIO_EN_L-O",
+			"B2B_IOEXP_INT_L-I",
+			"I2C_BUS_MUX_RESET_L-O";
+	};
+
+	// Module 1, Expander @0x21
+	exp1: gpio@21 {
+		compatible = "nxp,pca9555";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"SEC_FPGA_THERM_OVERT_L-I",
+			"SEC_FPGA_READY_BMC-I",
+			"",
+			"",
+			"",
+			"",
+			"SEC_FPGA_EROT_FATAL_ERROR_L-I",
+			"SEC_WP_HW_EXT_CTRL_L-O",
+			"SEC_EROT_FPGA_RST_L-O",
+			"SEC_FPGA_EROT_RECOVERY_L-O",
+			"SEC_BMC_EROT_FPGA_SPI_MUX_SEL-O",
+			"SEC_USB2_HUB_RST_L-O",
+			"",
+			"",
+			"",
+			"SEC_I2C_BUS_MUX_RESET_L-O";
+	};
+
+	// HMC Expander @0x27
+	exp2: gpio@27 {
+		compatible = "nxp,pca9555";
+		reg = <0x27>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"HMC_PRSNT_L-I",
+			"HMC_READY-I",
+			"HMC_EROT_FATAL_ERROR_L-I",
+			"I2C_MUX_SEL-O",
+			"HMC_EROT_SPI_MUX_SEL-O",
+			"HMC_EROT_RECOVERY_L-O",
+			"HMC_EROT_RST_L-O",
+			"GLOBAL_WP_HMC-O",
+			"FPGA_RST_L-O",
+			"USB2_HUB_RST-O",
+			"CPU_UART_MUX_SEL-O",
+			"",
+			"",
+			"",
+			"",
+			"";
+	};
+	// HMC Expander @0x74
+	exp3: gpio@74 {
+		compatible = "nxp,pca9555";
+		reg = <0x74>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"IOB_PRSNT_L",
+			"IOB_DP_HPD",
+			"IOX_BMC_RESET",
+			"IOB_IOEXP_INT_L",
+			"IOB_UID_LED_L",
+			"IOB_UID_BTN_L",
+			"IOB_SYS_RST_BTN_L",
+			"IOB_PWR_LED_L",
+			"IOB_PWR_BTN_L",
+			"IOB_PHY_RST",
+			"CPLD_JTAG_MUX_SEL",
+			"",
+			"",
+			"",
+			"",
+			"";
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
+
+	//E1.S drive slot 0-3
+	i2c-mux@77 {
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
+
+	//E1.S drive slot 4-7
+	i2c-mux@77 {
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
+		/*A0-A7*/ "", "", "", "", "", "", "", "",
+		/*B0-B7*/ "", "", "", "", "", "", "", "",
+		/*C0-C7*/ "SGPIO_I2C_MUX_SEL-O", "", "", "", "", "", "", "",
+		/*D0-D7*/ "", "", "", "UART1_MUX_SEL-O", "", "FPGA_PEX_RST_L-O", "", "",
+		/*E0-E7*/ "RTL8221_PHY_RST_L-O", "RTL8211_PHY_INT_L-I",	"", "UART3_MUX_SEL-O",
+					"", "", "", "SGPIO_BMC_EN-O",
+		/*F0-F7*/ "", "", "", "", "", "", "", "",
+		/*G0-G7*/ "", "", "", "", "", "", "", "",
+		/*H0-H7*/ "", "", "", "", "", "", "", "",
+		/*I0-I7*/ "", "", "", "", "", "QSPI2_RST_L-O", "GLOBAL_WP_BMC-O", "BMC_DDR4_TEN-O",
+		/*J0-J7*/ "", "", "", "", "", "", "", "",
+		/*K0-K7*/ "", "", "", "", "", "", "", "",
+		/*L0-L7*/ "", "", "", "", "", "", "", "",
+		/*M0-M7*/ "PCIE_EP_RST_EN-O", "BMC_FRU_WP-O", "HMC_RESET_L-O", "STBY_POWER_EN-O",
+					"STBY_POWER_PG-I", "PCIE_EP_RST_L-O", "", "",
+		/*N0-N7*/ "", "", "", "", "", "", "", "",
+		/*O0-O7*/ "", "", "", "", "", "", "", "",
+		/*P0-P7*/ "", "", "", "", "", "", "", "",
+		/*Q0-Q7*/ "", "", "", "", "", "", "", "",
+		/*R0-R7*/ "", "", "", "", "", "", "", "",
+		/*S0-S7*/ "", "", "", "", "", "", "", "",
+		/*T0-T7*/ "", "", "", "", "", "", "", "",
+		/*U0-U7*/ "", "", "", "", "", "", "", "",
+		/*V0-V7*/ "AP_EROT_REQ-O", "EROT_AP_GNT-I", "", "","PCB_TEMP_ALERT-I", "","", "",
+		/*W0-W7*/ "", "", "", "", "", "", "", "",
+		/*X0-X7*/ "", "", "TPM_MUX_SEL-O", "", "", "", "", "",
+		/*Y0-Y7*/ "", "", "", "EMMC_RST-O", "","", "", "",
+		/*Z0-Z7*/ "BMC_READY-O","", "", "", "", "", "", "";
+};
+
+&gpio1 {
+	/* 36 1.8V GPIOs */
+	gpio-line-names =
+		/*A0-A7*/ "", "", "", "", "", "", "", "",
+		/*B0-B7*/ "", "", "", "", "", "", "IO_EXPANDER_INT_L-I","",
+		/*C0-C7*/ "", "", "", "", "", "", "", "",
+		/*D0-D7*/ "", "", "", "", "", "", "SPI_HOST_TPM_RST_L-O", "SPI_BMC_FPGA_INT_L-I",
+		/*E0-E7*/ "", "", "", "", "", "", "", "";
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

