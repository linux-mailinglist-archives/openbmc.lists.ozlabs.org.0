Return-Path: <openbmc+bounces-492-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B84B2ED6D
	for <lists+openbmc@lfdr.de>; Thu, 21 Aug 2025 07:11:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c6ryX3mRDz30T8;
	Thu, 21 Aug 2025 15:11:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2413::60f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755753092;
	cv=pass; b=GOoVm9KCksvsuSdSPv92OIJmDpvVq2QuQq7mah9w56Z8nY5SgtaWQ8L7cZwLa3jH3w6NJ+L1igyBzSI+t/JaMgz7oMuucm9/3TFaxs6U9yOddfVLAdvRIZNVYCpX42xV0zfWZ6jDJvPXNHHuGfSOybAhyGwqbpKHvcV5TLvtyyo0NGIB4oQkwTXsujjyV933NzxtnS0+Ddj+JAtfo027ecV5rN8uCmUzzEIVL7Jc+WPT8M/1Oo20z97z1NniaHu0ED2szGOAmJ8/Q3idZiHKmNgGaKmafJoR7KB5FDa75xx7xWpHNxa2emV0HWOgtswqjWvjZUXO/V4Y9JNm+dVplQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755753092; c=relaxed/relaxed;
	bh=jv86RM6kx5Id2OXDWyT1PnIS03iC0tmyd4rJ8QrfpjA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KPiQNqFloqCXYHTYCfYDED2Ph0aSurhJ7fSzrLvrkUfWj462Xdd6lN94lLwLatfdZZFhSvH2a4Nu/+nu9sIGmJoJnwr7NHdN5JJr0Wp/wsJKKinR69PYzYOyMWGSi/Enx72cKsI6uyM69JrczVy1vdUFz7cryPz/Qb7q8JiwFjnk7tbhyTW2ZzRCtvbPzNYzozcHFreEbFoNj4mS0rnVJ9u8i6SNJ2ntLLpt79CaQjhz9W4rMsq/qZ/Yc+k2ZbcsYcBZ5ZKe0gwWwtxCSMi5e+r12Aj9vs7cAkQ9hyEyxs7yCdVqulXVuZqkjqWoxlmX+mbxb9aHXKfOPaCpXTp3ew==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RVdG0+DU; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2413::60f; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RVdG0+DU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2413::60f; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2060f.outbound.protection.outlook.com [IPv6:2a01:111:f403:2413::60f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c6ryW1dkZz2xnM;
	Thu, 21 Aug 2025 15:11:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MtrzZ9FLewkNgrQYQj5xKUyiy9cN7JxwBPjKyUpZOwOHAzsqVQXwjEUdEe7Gn++sar5v0mxsktpKWeFr2C+PRnmSONL7M86e6sqfTDdbnc6XmHNloNO8TvvLI4jsxCa2OuGiYs1665AMFJKdbEDlQOUZgiw3a75pIUJcscEodYn8o4x5jw+NtolR7+IQG6bXcehIefPJTrr91u5z6kGChg0ZfYdGEq7WY37WL3x2OcwupZb2f8wnZZW+ZLPDBVewTM/EshLnsWCkaMIr7V22KbKwcDPn9PcPBrLLCTdQhwa2+cY0QZJkWr1gIxnf8pvQR/Jvu0hGU10XqnTTmHFA1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jv86RM6kx5Id2OXDWyT1PnIS03iC0tmyd4rJ8QrfpjA=;
 b=Kdx5F1y9DrnOJAZBOTXwh+gcvuZQEf+givb/e4nDsfi4uPxygPua24PIgvhrk7NGI/YLD9//kWX92LyqSC8FK4XkKE3AHVfs8N2ZG1vvm92dBpkmJRC2QwV04aF+f3/wtbcfqYCVJHMvcPDgYb/VpHgMhvjxmUF6AcyTXN4YIIFgFqusenZbCN9JbCyGaHsWcQ50TYA7zAjH+9D2lnXVgKUChAn9afEDTSQ7RuVXfVLe50USgLb65+C42A8eDpiwrDJORcI3A3jRcrJFZDwp6b4VKftXKLe6lfXYD3AZFQahlYYK7HWZscHGGxK3BJ1jIS58IWfa3edDByYDLZrjRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jv86RM6kx5Id2OXDWyT1PnIS03iC0tmyd4rJ8QrfpjA=;
 b=RVdG0+DUzrzABooetrU2ZvPN6e95yvYXANdJdbNtVLObjq4Cq2hyDHBiUEK+H6LGglsZ6/fLqygOEkzlarVfd6+l9uctj8rKpOR+lAuyRvfx/qUXhzY0GsXZA5xyZ+ZG9FAMHbURpKuLGCLJOIGdS5JlRxFBr7Yh6M6uMkSgUry5qEwCT6v5T/Rd7PdQ/pdQiexfsuxW4H9cqGijWHYEJPu9NuVbanJBtlD3x6pcp3VbLO9CAd8iwc+DNiihQ2L6QmplZ3pP9a/vLerTSpzc7lY8q7v7gT5xXqQ8Hs0Ld8uTVa5T3YUrYPXjP+KwikLO09VGr/B0h9LLuGrOuUGXEg==
Received: from CH0PR04CA0107.namprd04.prod.outlook.com (2603:10b6:610:75::22)
 by SA1PR12MB9248.namprd12.prod.outlook.com (2603:10b6:806:3a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 05:11:07 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::4d) by CH0PR04CA0107.outlook.office365.com
 (2603:10b6:610:75::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.15 via Frontend Transport; Thu,
 21 Aug 2025 05:11:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Thu, 21 Aug 2025 05:11:06 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 20 Aug
 2025 22:10:49 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 20 Aug
 2025 22:10:49 -0700
Received: from dondevbox.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 20 Aug 2025 22:10:48 -0700
From: Donald Shannon <donalds@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<donalds@nvidia.com>
CC: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <etanous@nvidia.com>
Subject: [PATCH 0/2] Add NVIDIA VR144NVL board
Date: Wed, 20 Aug 2025 22:10:45 -0700
Message-ID: <20250821051047.3638978-1-donalds@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|SA1PR12MB9248:EE_
X-MS-Office365-Filtering-Correlation-Id: 12d6476a-14a5-4589-f656-08dde071223c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aiMihgr4OJg0l3SDZsxW8CjN2jeGNtfqAcopEcs7QkKeMxe13TjprOtFxeGz?=
 =?us-ascii?Q?03fCld/HUvGtfYo4GOcF8gOoLi3N1WMDhC25+0GcM4TYohZaru+895dp6JD0?=
 =?us-ascii?Q?1Yol4Ga39k1QzzZmfdvvNg1UxU62pV2krSBnew07MsrBthJVcxpNJj5pxW3W?=
 =?us-ascii?Q?NcrJm7nq2OUavvWbWYsrgAgI9sR0M98TYvAIfvW812gzw/79w6yMCy2fEZI6?=
 =?us-ascii?Q?pkBGdQEy8svotwNGNYjtI4QiXSYUSIckKIMA9vEV8E2go+AB1kvPFQwLCKT3?=
 =?us-ascii?Q?I0b7YnFai5v1Zr0Gl3L1O0f8Ael1wHgAnvKzJvNCItn0M6so05HO5lZ9G0Sd?=
 =?us-ascii?Q?Tgy2XTukiojrg+O/wjA3xnUcDc0NLB/CrG6+S1xg2gsROmWE5LvrhUyqobgv?=
 =?us-ascii?Q?xG1DSjqLqr0TB4xje9jyconT2UA5lkAQ1O2pQ54HaZ/fYYEUvY7nlk/CcX3Z?=
 =?us-ascii?Q?+OLvqDsZJJwdn/51rjsBnF5WSPiIK6HUolCoDX+WJFh2dlncB3Mrf0W2jdo2?=
 =?us-ascii?Q?nPAfuCrrD5FVdkTd2tSpu6s6Y7oQIMRoJn9V/R6YoGXYpRjGFbjctXKJcTcG?=
 =?us-ascii?Q?qTRqQySqSW6yhHujXh4rYGW4PaUmZD62Ug+xewb2dNwcBIEa19u+XMp5AQkq?=
 =?us-ascii?Q?LmfpdCV0w9djJq/Bk+SLgL3t8figgVTKWfbdD5zCVy0WJplbMC6/RWALcsQ3?=
 =?us-ascii?Q?3e301ElUFRJ5pSVcjSueI1EKFBHpYfh7dnR6KBUcau/EqU0ysCC77/BTyDT3?=
 =?us-ascii?Q?BJwoIBb6iSkVsHm0aMu7QLULGWB0BDyx4ol2zc6RBZpFowCwMs0otoBq6+aD?=
 =?us-ascii?Q?hQkcxsJNBUqMSTYBK1xvM0JqNktQLSy7AdL5mRIFLPSWODMpwHMUkTcyUhw0?=
 =?us-ascii?Q?liIMFUygN+ldaXrsfDiAlLdYBmLp+7ZcqOKM3iEpxsGavH8pp5XAzENZpymU?=
 =?us-ascii?Q?Rlt17RxnCgRVv9ELEaYFc/rsI3S3jqVBijPTXCs3WLvbbq9VTKmUhVW3N+56?=
 =?us-ascii?Q?RCWp8Xc9r1D0gqQDgCHsSE2fU2J280snvS3E3XNKC4yWhMAmRxHTbNDmRyVH?=
 =?us-ascii?Q?9CR5wH7RrzsWFd/NgXbiXWWZxQ51evUFQ1ZlNWg18DHFpWn5j+bI/JVZ/Ufz?=
 =?us-ascii?Q?U7or2ieEGiVPxn0MIPq29Ys7VF8/NUXY9XrM+om8BSnEb0/appmARJ9aE03x?=
 =?us-ascii?Q?Uo6SjApvYNoVHqkZ+99w6SXxs3495Z89W9E+Gw0N9DaQtvWYxj5ZAStXbHQv?=
 =?us-ascii?Q?mw+Ub4jnnIElwCbg8iS3DRwuGm7svc+GJP+Uubz1QJnj+ew5MjMy5LEJO8il?=
 =?us-ascii?Q?ZqBvpz3/E1VQEch8L2Fg5BVTcAaJzY5gN+mdNDgxwDsFWC55/3CWgs4jrM3y?=
 =?us-ascii?Q?qk+9LfCvXpOvN0JoRwVNQ1yFSdWePc/z0F3rubZ/EQRNBdTkAxW2W6Ggg9dB?=
 =?us-ascii?Q?L5NemGGNZXYWxnd43IU88nJne400AooI8iH0h5RbVB1/5f7Zly2mQUXs74vj?=
 =?us-ascii?Q?Fp2x9I4Cir5d4yHmsWKaRJVqu3/ip8whPn7j?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 05:11:06.5825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12d6476a-14a5-4589-f656-08dde071223c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9248
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

Donald Shannon (2):
  dt-bindings: arm: aspeed: Add NVIDIA VR144NVL board
  ARM: dts: aspeed: Add NVIDIA VR144NVL board

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-nvidia-vr144nvl.dts | 879 ++++++++++++++++++
 3 files changed, 881 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr144nvl.dts

-- 
2.43.0


