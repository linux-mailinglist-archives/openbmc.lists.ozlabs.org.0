Return-Path: <openbmc+bounces-49-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A031ABA31D
	for <lists+openbmc@lfdr.de>; Fri, 16 May 2025 20:47:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zzbg266njz30Vf;
	Sat, 17 May 2025 04:47:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2406::605" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747421262;
	cv=pass; b=cdUZttj5uSYQvNLETv0GWWm83Czh5wn93pZ6RWsRWmoiao2ztasQiyLEK6Tm+6pKiDS5zpKCpuyLtpJ3ZpnZREk5nGlNWAmb7QdA0Qhf/8oZvNknTJ4ZQnn0GItby9xKs45/T8aJBpmARaFjO5EkkoV+tPMTnJBOQatbkiWHdF99OSUv+QsJTlycubLtYD/u1Tve747JnxeBUk5baRXIwDJZQ0xA5GU1xXg87Lf2tA3jaxyoVQLLcUGmmtX3xg4k8dmRRkLAkeyov0SMGKWpm9p620VR/dhsa1p2f+Ysdf9S7fnmnzwIlK6eDVWRUe5mR0uOcqa+PHsi+zjjLoIdAw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747421262; c=relaxed/relaxed;
	bh=EvIhpRKI28V36m0x34k6avnjEdaobWFysClTNqKwRYY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=exbif60gNqA+URxDfacHQuAfkG26XD8p1ezgp4H4QwrlOxnhtUoJFZpA1+x1i1gcVwFRa5n9TByYdV+4sKDFX3EaP3mcdiEEu1Ka+eZij74PU/TioLFaen4ZPARlqB12emGkNEesicrTh+CS+/6XCQopVdfZwhqlbWGWpmF5394FPcXiO9BxVqjKjQwLceVqXBI0BAigUfBX9L58crg9hsJqwO93Ilxg3xSZ31CmuUdTEhVyRZElwTktyIk2vlQOZ0GQPDtX/IhzjX5csBwIGvmxa++bvDmbW41yeSGtdxJw4bVe2SXnczMXDW5CTN00O1ooYWPVCsQ772Vmvvkumg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ifRcyjs0; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2406::605; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ifRcyjs0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2406::605; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on20605.outbound.protection.outlook.com [IPv6:2a01:111:f403:2406::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zzbg14tQ8z30Ql
	for <openbmc@lists.ozlabs.org>; Sat, 17 May 2025 04:47:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K98IwAbjCwa+imfex8iWGcwkJLvMcaNHE3wGbB1OpDlRyv/GSanK8au6d3JCEgMTWCT7x0ZihxSrRyJqzCU8wr4ms0XKx7nhG/Wd9bSeKrQ5kYFR/olOle+zjpN6Me1N4mho1FYhpw1uKgyEWH1cYKDeZPOQhaIomo+Y59YXyXUSItWspGbwL419SJJVBz4vntZznJyMYp/zMv7jAkE/4nwl/aKepuGgVgcF2KDg704hngRDLGuhzh39U20WC/vrXP8RpMStwZ/4kHK4PxLxQoFwKAcig1hP5EAny3yKJSZyKsFLd0liRE+52LPB0C66UH4HvEzeKB62nTuFshdOHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EvIhpRKI28V36m0x34k6avnjEdaobWFysClTNqKwRYY=;
 b=IENk7sWqlq1kxPZBv+gCKXiDFRQWligt1ZmZ7SwOp95mWJ4ew4trruGGEo/6BR2Id92YcPjl+GypHKW9j9hE6KYrzSqkNOnRT4+Dt01JY0ne7l2vlxb7fGvrS9GTom54SMd3tCc/7w1bzrq5v1LWqtf0vSpACQcXpzrAkfEthUp5wFMF0h/gpcTUJigBeY6CjWQB6x3RGi/dyKxZcu+S6+n+etbjRW7oz8wjeTayq1UlTr/0nM7vSFnwtei+I+MnXZiGLU6Ct6CUvpeq4D+PyVJqBpadgHk3Mn/pSuVOltyTUy5MO+riT+hKnKxXxQP+Z1lQidEzTqCNOx0zoYZ+rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=jms.id.au smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvIhpRKI28V36m0x34k6avnjEdaobWFysClTNqKwRYY=;
 b=ifRcyjs00JTmqmNZ0EZcqojx6pRDwqLYKvE6AwpY/r+IuIcQ2piq3AcoceK8ixDNGtH4QqmRp+sy8de/NF67/y4Wx/MRSAZT2K7Mcjv+Ltwt9Mu2raJCDVlaZARx5ZR+Jx8prD63voV59fCbVLEL9zgN5BYtmCI6rX0d0PizShqT7Rr7gV4DFHRTgMaMOUAG/YJIr8O+i7GRwhQ0RkCGQhG6kPhFPhLqM8VaY4d7o+89hnJ32bVgvlSjkQKmD7te17ZIyVoUGgsdFlddnAjYHJzLMHlCqEiyMs5pfKnGCB6LY7at/8wMbrFZttWcGS3J+s5RyLiZTrK608rTL8q8sQ==
Received: from DM6PR05CA0049.namprd05.prod.outlook.com (2603:10b6:5:335::18)
 by CY3PR12MB9579.namprd12.prod.outlook.com (2603:10b6:930:10a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Fri, 16 May
 2025 18:47:20 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:5:335:cafe::87) by DM6PR05CA0049.outlook.office365.com
 (2603:10b6:5:335::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.12 via Frontend Transport; Fri,
 16 May 2025 18:47:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Fri, 16 May 2025 18:47:20 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 11:47:09 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 16 May
 2025 11:47:08 -0700
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 16 May 2025 11:47:08 -0700
From: Willie Thai <wthai@nvidia.com>
To: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<openbmc@lists.ozlabs.org>
CC: <wthai@nvidia.com>, <leohu@nvidia.com>, <tingkaic@nvidia.com>,
	<dkodihalli@nvidia.com>, Ed Tanous <etanous@nvidia.com>
Subject: [PATCH u-boot v2 0/3] ARM: dts: aspeed: nvidia: Update the DTS file for GB200nvl BMC
Date: Fri, 16 May 2025 18:47:00 +0000
Message-ID: <20250516184703.726599-1-wthai@nvidia.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|CY3PR12MB9579:EE_
X-MS-Office365-Filtering-Correlation-Id: f4b75e28-0337-484c-c726-08dd94aa16ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KZJMJX9IfldGG87XyZPAyxbHOf7CbVrjMHMv54uaogaasydXIN3iczcp5g1L?=
 =?us-ascii?Q?L9KDyo8OyrKnZcdSpFvEOXi133oIXoHh+hWphoCrG9ai/WbKB0IreV58Bc8F?=
 =?us-ascii?Q?5GHsVj8h+LTon0G5kcOw8+9WiWM/K6uz9P7MkJtlqABqo/4VrSl5nrqyCo2P?=
 =?us-ascii?Q?tBbwzJd6+zEJqn4F3803ZaX7l/aANmWmYSizJjNJVrMe4maNX5J35M96UgbO?=
 =?us-ascii?Q?wNKymOqp1OrBtRWAhU3XT2tWp5x3m/ZDdWuZHS6aEhqCU7Kh6uovMiQzXCJE?=
 =?us-ascii?Q?38aOSu++DQ1tLy/mEM5dUGCsmxGzvXIcr2kOOfF40zM7/Io8lhSv2dl1Hb3w?=
 =?us-ascii?Q?IrJTXyK2QqPRSTWA1ZJ4s3zJlqUu7BmR+neCxKHR/OQ8ViL/jqrnkV5wI2MG?=
 =?us-ascii?Q?ATgQehC3rnTfZQ9+0ADz/iPYtcG6xiMfTeAULdFibtx4A82pWRNZJl48U9fo?=
 =?us-ascii?Q?NExBQZrImIQto8cX7wVMpx/3KoAbry4OLps4oIhhsWzXbC4p9rYIWxODpfoQ?=
 =?us-ascii?Q?AXn9CpSygXYq0js/RUex1LQjSo0Wk1cNNF3xawxoxoVFsX4KE2CpWQc6INbf?=
 =?us-ascii?Q?dOYmOquB2kY688YIZL55sqrVyKfUN5vOF+z0FXI2EZ/vVAsLoAIVvt7hQmn/?=
 =?us-ascii?Q?7FjIK7BWMHBKSxiwDOgWthtYdROgRPsVvFGO7nGimZbEe5M61ksWQBVdc0Om?=
 =?us-ascii?Q?IGEMx38FUlMNus+gYUMnlO3eal1mib51g4Yp5Nunfoj1Nqj3EknW+2XElass?=
 =?us-ascii?Q?CYGLSW7Iid1KWxtbeJWa6xHHSPJKx+N1I0rueLQS8vuzxUI3AMvde8mqrXOT?=
 =?us-ascii?Q?+GnyaLfD7Dt8VMn7meGE0sXE9PNnZHd5dudTtXggHf/7jSbbYm60Kh9ihwkt?=
 =?us-ascii?Q?vSK+7cEDkS9UYk5q3ie9q3L+ABJxe8YIHm+PSFdsqo/YETdL/+HvabwNAfas?=
 =?us-ascii?Q?jX40xrfl3h+ipTIzL7U5yTXop5cRZNzt44Wi/Gu7KM1TMux8objDMhjqQ3lG?=
 =?us-ascii?Q?JWE9WbWzwaaWlFZ4jh731/TCX+39N9V/9Cgw3CkLGYcUXLrVZjdZwO3m039K?=
 =?us-ascii?Q?4MUbU/XquyT/pDrOVVy+vV3QNLxwel6V1vIPQQuRQ0O75gQsKS8DVraYol7A?=
 =?us-ascii?Q?c2xL+//WmqZImlkoRuhNqJWRMMh6o7rFt01+Yytz7KueNmR+lPW/xCEdyS40?=
 =?us-ascii?Q?PqSWy61Emv9wEVbVnCwx8SQ2075HsAWSt9C+hURykvIVCoH7Vf2K0tih9Ydu?=
 =?us-ascii?Q?5bkZ0/o3KWuDizbQi9l+f83RlgJkq5saasDuJppQYOq7KoMzxgW/j81sc7KD?=
 =?us-ascii?Q?jMPKy89FSZb6czGKH4D0ShBgJH+nounqnjutK8oyqYr6TpKrEPnvvlW0HRw0?=
 =?us-ascii?Q?oqeFGBZ3Nx3lIKagkPm3eN7WYxDCLbGhdhdoLJhJj5N9ezDnbUi5F8Gthzn+?=
 =?us-ascii?Q?HVX2oukWD2vrMzdd9c+dZ4skAheTjDnC0q0AzILw/fohZOGeKjblSJ7TBRsG?=
 =?us-ascii?Q?gdKyJ0zPBEvHeCcGWipHz0WM4bxFCpM98an5?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 18:47:20.1621
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4b75e28-0337-484c-c726-08dd94aa16ba
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9579
X-Spam-Status: No, score=-0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Adjust some property nodes and removing unnecessary devices.

Signed-off-by: Deepak Kodihalli <dkodihalli@nvidia.com>
Signed-off-by: Ed Tanous <etanous@nvidia.com>
Signed-off-by: Willie Thai <wthai@nvidia.com>
---
Changes v1 -> v2:
   - Separate the change to multiple patches [Andrew Jeffery]
---

Willie Thai (3):
  ARM: dts: aspeed: nvidia: Remove ECC
  ARM: dts: aspeed: nvidia: Remove mdio and mac0
  ARM: dts: aspeed: nvidia: Enable HACE and ACRY engine

 arch/arm/dts/ast2600-gb200nvl-bmc-nvidia.dts | 32 ++++++--------------
 1 file changed, 10 insertions(+), 22 deletions(-)

-- 
2.25.1


