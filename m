Return-Path: <openbmc+bounces-398-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 613ADB0FCAC
	for <lists+openbmc@lfdr.de>; Thu, 24 Jul 2025 00:24:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bnTFp3zYhz2yGY;
	Thu, 24 Jul 2025 08:24:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2413::617" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753309470;
	cv=pass; b=Ql6RXP2UXQKO1y4Wun3uH3BrVdBwt7uB1iYGcfAzzJyAJQWLbx5CmcZxKbSbiT+TaP3O4KzkkPPHizMKod1eWBpx5IyJW1NtrZCeXr//F68RF2e8sykkNYHDWUfmZKzmAYMbrtRMKcWw2gWe/g8WB+CJe3AYTKW8FDU1e0xkQ4XlGeYWmaJ1kf8eioAVNPiVCQC6bBA9v+U8ecgGO/+Al4rNVDaRvRU8f2jUhMewDCQtPxlPGz8fRvSx7SQ7TC6yWLiIzLpSyKuxx4kT0Tzf2h7OKp/XK3Rkg/83OjbOonHREXMUWpNq8O8ADh3rWMvM9xqyKBt8a0XHVYsGwGgPzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753309470; c=relaxed/relaxed;
	bh=Gwj61VdGZbmkj1z8gtIXqp+9+EvND36erwsUAlu04no=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AwOoJdBFKn1NsC8czXlbAqRgC8WyU0JwB/ViFBHVFFpFVmn0fYr1If7oQDI30rsbT+Hu7A0B4hJ5bn6m1Tb4+4piF9ZBlmNoiuCFPFbCFBY9Tc/VnlqNjSGtJlWPDj8QSgIMjv19Cd9gaywR9EWZmkJSUGDHAUxf/Xm9/PZgIjTP3/HplEvDQeM1Ait4HV5Whp8ZoPUfxAqAzdY0LDtDJa9/+xdzLLfpo19UFryCQ0egktmfAQU/aSGKwpga5A+QcjC5bXJU5c+OHg4AkBcNtH1YSUuTRxAgkwqmuvbJgEmA26wL6kw7/z2d1eMjtVj0/ZBOSDtHQQR2TPcCqT9T2g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fMXPUB+Y; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2413::617; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fMXPUB+Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2413::617; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20617.outbound.protection.outlook.com [IPv6:2a01:111:f403:2413::617])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bnTFn0y0Nz2xd6;
	Thu, 24 Jul 2025 08:24:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cALbSVPeJhiZ7U4AL3bSBcINrGxb1dDAVYKREkKi0wbImSg9epyXvQITRyfH94D2iT/gTiL/PzZJtn5FCCHacBYBgSh7Do351gxKMuHmeu3zPqy9AcmSQg/k23EpqWLh1CU8W3j0uwhFE5CFBhqMoau0diYirgnUVfU5NOj5GGfT5yvyT41xmQCyMWCeRy74K+9hnl24cmN5zwLZp9Jq2VaAYUE7oPkW89bunatU7h5hBcQ6RzbXppb8s7oopZhD9ub3eKLtYLBvJ+Iklfs4/nkh373/mzFrr7RiCRNyueihfKiwM406ALwcBu7HhsbKNslrSaDKbvxXC6WyaTFBBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gwj61VdGZbmkj1z8gtIXqp+9+EvND36erwsUAlu04no=;
 b=DbPODhLYPUKd7OuIvq0eiSOd6v3w6cuNo5FhPIDsf6cplTfNDMPC/hqJgltasm6gvXiO+757sskxarP5+5+j9a+Ch8tLXTvo0OXdcwhfXu5B0+0+ppihx64ZxA+PoZCXEBKx3ECFYeOVDPqWpltvyQDVb8i7n7/+3/Y1tMZpNcwalwl+Go1HSf2VCGznkqi2wNNUKnfJ+R7WM4BscQwEYDDAjXAyj5Z6qCgslnFJUEqm3E/VPc7V0W9Yymah+xa3jgcdj6yvK78DscJwEa1drTU02pP8kgEm4wTiBV0fa4IWFLuYmZ+K+yec4nAayRE2UihNGqON0Z3SNUpLih+Tdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gwj61VdGZbmkj1z8gtIXqp+9+EvND36erwsUAlu04no=;
 b=fMXPUB+Y4So95+l4svkZCM6RRjBPR3wwhqC+eO/k2Nxw6+D8aOb6j1s7D/bz4WvwMF2uKWjcPxYNcO78ahLQT9Y93JiqRZTa80PGxJ8PcckE/x7QTGQ1o4PbBaCbGGy34sqJ0oPT00zmiBUuCa9kuaBPq+BbfId2V70Rzq2xTmRh/Tpb84PpkxQ8ZFJiotC4ChApmmqIcu9570fZTNCUL93Y0wmwXWD8gafXbiFCz9SoWHZyzFcuKsQciuqAcImtVY74RjCBSUdQ5d3H8liKTIePRAZ1X6yxWdvVbO4zABsr2r5RyiUNuXgFEAYwaYc4hUji8r25L75TBo0NfIWhmQ==
Received: from BYAPR01CA0058.prod.exchangelabs.com (2603:10b6:a03:94::35) by
 DM4PR12MB6087.namprd12.prod.outlook.com (2603:10b6:8:b1::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.21; Wed, 23 Jul 2025 22:24:08 +0000
Received: from CO1PEPF000066ED.namprd05.prod.outlook.com
 (2603:10b6:a03:94:cafe::75) by BYAPR01CA0058.outlook.office365.com
 (2603:10b6:a03:94::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Wed,
 23 Jul 2025 22:24:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000066ED.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 22:24:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 23 Jul
 2025 15:23:53 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 23 Jul
 2025 15:23:53 -0700
Received: from dondevbox.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 23 Jul 2025 15:23:53 -0700
From: Donald Shannon <donalds@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, Donald Shannon <donalds@nvidia.com>
Subject: [PATCH v7 1/2] dt-bindings: arm: aspeed: Add NVIDIA GB200-UT3.0b  board
Date: Wed, 23 Jul 2025 15:23:49 -0700
Message-ID: <20250723222350.200094-2-donalds@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250723222350.200094-1-donalds@nvidia.com>
References: <20250723222350.200094-1-donalds@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066ED:EE_|DM4PR12MB6087:EE_
X-MS-Office365-Filtering-Correlation-Id: f8bd7142-178f-45cc-537f-08ddca37a426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ygGTckY4NrN4szaudb5Jx7W/0bN1nR2h9Z8gRFOZXKDEHVTa6qMFMC4EhfPG?=
 =?us-ascii?Q?3/B0WRphZONMhVLD4BqZ2dIy4gSwlB0fumeFUMJAHRl6m4KrcGWIlCVbkWP+?=
 =?us-ascii?Q?DXQt1SepZEZWq8fglXY8IaRRSm7c8tBPaoqwls5Q0p7zrDC4SYsPDgaCbgOs?=
 =?us-ascii?Q?UmuKXKAxMPQOUUysewrxhZCHVWZm/ROYizvTwHZB0+mpdQlOjW3rusNhnXTo?=
 =?us-ascii?Q?Q36xXDXv2EJDmQFyDU4GTITw3vBteJhxHWHj4v2sHpeeG5nWHOhff6WtZjwk?=
 =?us-ascii?Q?aGrQXyB/MKgfEaK3xgLULrNW8MfpF07Njwvj2dWokZiJBESPLwLx4NLLoGm7?=
 =?us-ascii?Q?20oCsQu4A6x+x5OAq4+msq/ef5X2UQ9ewHvcFJDKSKTDdqzrnjMBJwGNngEr?=
 =?us-ascii?Q?fMCgWffNwHGz2WiSn81YmxQjOKQMEMzkujv30L78PKTsxPHE5UH0B/4buomH?=
 =?us-ascii?Q?/HolMvcF0ZFdm2ZA6nC9sT+Z/xJ93Y38PlqcbRK6raWwkk0Atm+R5E6uTR/l?=
 =?us-ascii?Q?Bjfpul/XhM9jS8rmUN52FnUlP5OQ7CNXLI4wUH5/U6e38l0quLmgdpJ5ONFs?=
 =?us-ascii?Q?oxL5EAqnno3rCh4AZO9rmRjMVG36bl6DAGfhIIiShF+/+HOyWmuAhIgCvWTa?=
 =?us-ascii?Q?p5Avot81rxT65vLp0kC7Zs2Iuo7py+xvsGLQYnWBa006En/rZs7AcVg4jn9t?=
 =?us-ascii?Q?KHWUZ7A7sd+qphrZhiY7+WU7tMwR/Np8gz+jwsf32dIRoayhee7Gn+2fHY1k?=
 =?us-ascii?Q?Hu4st8mbhyPBL8GJdWxS1bBccJvZJNTrHSwh1SlVBz5p/ugwleXHpQlXxlpP?=
 =?us-ascii?Q?5zj6hODu2P9saOY9i8LeGxRoXkGRBMHOgVpMtXELOquR+P7C5Khg+FJwDf6y?=
 =?us-ascii?Q?Z2YLOFtUR3aobMRitmW7fPhujJPkGKnVyNSNfW3aq4brU6FgF7c1vIHiXbYp?=
 =?us-ascii?Q?7Z0IPZ3lpwtAZ71yNtgFP9Xlx0ZkprZ8SaAogsvvW9iMjSNhjYtKZ8l1+r3a?=
 =?us-ascii?Q?Err1EPbwd0DWF2nDDB8mxFYevGBDn5D84Q3eabB742z/8cuHH6Z21LbMqQC0?=
 =?us-ascii?Q?RqIytn3nA5sMycUOKMVmAvwBtgA69VMBSrNg0bt1XLNTYL4QM3C6WTdsYcaW?=
 =?us-ascii?Q?CIWNRCyXuT/nZ2hRYiVzYXWu3FlxtffloqHifvBCIPrJ5UaznK3KmqV2G4IT?=
 =?us-ascii?Q?SkmdZbjX4rp3RYFNcNE8KOCKdILfwbVNuIkK0/KD0dkDeqH/Eh/ORtlZ9fBx?=
 =?us-ascii?Q?4RJ+011LSEFlL1NEgp+n09yeftgR6U7QS1KfjdFjvKgxAkcrZcaMqpIhMhyq?=
 =?us-ascii?Q?VyJxZq7ty2Ki2kDP4Gd4X2FyBox5NKNbDlQ3e7lp/gpGH7UaQ6zdj9bqYXtp?=
 =?us-ascii?Q?X8v5FmwX8kzevylyEIhVsFXzJQnidV+uS3iDeyVmVXDlNyKJytdLEa1n8n5X?=
 =?us-ascii?Q?uM82sGQ9Bhf9i8V6KvjDZVxBUra2YNHfdQkWUz95IUFVw3pEE31OLkjEp+ZE?=
 =?us-ascii?Q?SSTTzRvrnVRgC5NKexY/rtI6l9YG8j6+v5XO?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 22:24:08.1430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8bd7142-178f-45cc-537f-08ddca37a426
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6087
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


