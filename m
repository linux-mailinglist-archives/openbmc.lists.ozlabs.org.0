Return-Path: <openbmc+bounces-50-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3A7ABA321
	for <lists+openbmc@lfdr.de>; Fri, 16 May 2025 20:47:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zzbg36rS6z30Ql;
	Sat, 17 May 2025 04:47:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2406::61c" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747421263;
	cv=pass; b=gvL/+8hLQM9tT87eIpYLazUsBm36hjTs6wIKAgxFm7uE/4BP143yCW5lGqtpuz1lNIwQz6AmQyY/G78dRjovDP9YBaQoP18PwtTdnNOerrD+2TFmhJcvxClOKVDZXTJDLbE7NMEXOuiWg6HJe+eGGugsqKXoyB6Qtre/F35hAPrJ+iqxWPqn5QvnKaroA1dbZRgCTb0lvKmfBA0TDh+PYfsNZ9tZM4JXbPGfrKZbFlLAa7TSW+8/PdoZr44vBZ/3Y9wusrwGEg6Kw53BKTDEM2P5stf658JakkPjDdpYKlgKp3Mz3nRvl0XXY3yiK8sOVp+hY46nh9AVOhcNc2VzCg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747421263; c=relaxed/relaxed;
	bh=9TWnqsZsai3Sap5AbNjt0wLWBX1mc8ZVdIKVwTxyDF0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XU9DdKqPwOZk7IgNi5SvrmrGykHdcllDOmbnG52FNiUBVtBjWHE2tK2VEvk392AZbwdVtfy60g5oOT4MafdF6MuSr/BJqvemHaHd0SCaj8kw3uN7osi0hxOlMvp8rYNZ2pnxN4myEwaNUmYvJnbWl3gPw4y2whGBYcfznSA5t6Xo6WLK2RTgONRUQPZmDjJXgEV8g7HKAK13l3K7v2ZYVWapUEaBimrqVT54hMM+S0vASd99pXz4x0IRgsgs7oFzfBpPZntO0A0IFzKLKKMssDFwKvRE/YkxeehfiVVm2zxDHtyhQh2rw6iJKHyvQoHwuiqPPQhNn6WFIfMY7Jc6sw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=riXQXDNZ; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2406::61c; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=riXQXDNZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2406::61c; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2061c.outbound.protection.outlook.com [IPv6:2a01:111:f403:2406::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zzbg30wcjz30WQ
	for <openbmc@lists.ozlabs.org>; Sat, 17 May 2025 04:47:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/a24yZrbcQ1sudPv5mTcm+J+aGp46hej8gPn0Qc5UZ2X50aAE+IbNU07ph9EdixAaIkMmGExeqk5BH5bSPw8yeiUv7MN4GlUVA4kAU0WXVweSO1pt4wGl5hAhA3rP0wuczjtsHSpOczaCXziqRkyLn+T56ZCdOUdymS4kzyH+5zD2Ha2upYoghZs11CGFOkt7FPerwta3I20YFer8VOKKr3p3b5e8kVRwAUDtiObU53z5jWAruT+1b/KzInTlTLyvj1ZzWfavTfGGp4JHvdDPTPAnli9TF0zyhVzoHbU+tSe/rKdEDurVlTb3zhhmDGxEeuVadho/2ehsHSVllOOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9TWnqsZsai3Sap5AbNjt0wLWBX1mc8ZVdIKVwTxyDF0=;
 b=ZEeT9Uq0Lpknabj54Pz2tCE22IcARiC4nCbakDYIXp3SeGiDYWqCZKnyJcBjLHQZTTttUwWDUzaEiYEK//XIM84LWLtpWVJuqdZ3wx+DF1/YIFk87zC8AqteCMaxdh4Y14zT4+5Q/lptdAXtJtIqIXiz9zzz/0KndAlIH/QwT3vq1TpIr8l/x+XvWeWZ3mU1d3Y7jkEQLHDwguJdtvsz2f5mHDRXjgAh41C8/C8Y4CrAsB/uSz0lHLkAiNHb2iUi9yc1jnEg/P+JJ3CH4l5DrRx/aD6b/ip33slrF4OhKlp87gn4J2as+mRgWoyqzpns3qM3zUyYM9AD8Rr8ZiaBPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=jms.id.au smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9TWnqsZsai3Sap5AbNjt0wLWBX1mc8ZVdIKVwTxyDF0=;
 b=riXQXDNZDwV5b90PojXeWrv6juw/xHAiwto+11QpSHl4rO9i5Ic3KKk+04C7aVgk6J1umLjJJeQDC+zbET/5jpCL7kmd4zyr8CWUKbD9bdxO09x4QhtPJ55juMMagd3wpjDisfZ7oAzIaKO/rAn5d9+lGYjuR1abaUxa76iQV8tEpSotluuv58APpb1OV1cEwsJybLhLWwAK3LKtwnNAWS7P4tBRSW05TrvgS+sh+vyhMkmf7zIuu3cPSnhnvT2IP0Tmcgk19NiokMCtbbOqLw9OMsUun85MW/++HbT1+I2oWwJNrGYZdlp9yycTJVMwPlGtZ7BOeimjd3oMtV2cRw==
Received: from DS7PR05CA0102.namprd05.prod.outlook.com (2603:10b6:8:56::22) by
 DM4PR12MB6591.namprd12.prod.outlook.com (2603:10b6:8:8e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.29; Fri, 16 May 2025 18:47:23 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:8:56:cafe::43) by DS7PR05CA0102.outlook.office365.com
 (2603:10b6:8:56::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.11 via Frontend Transport; Fri,
 16 May 2025 18:47:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Fri, 16 May 2025 18:47:22 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 11:47:11 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 16 May
 2025 11:47:10 -0700
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 16 May 2025 11:47:10 -0700
From: Willie Thai <wthai@nvidia.com>
To: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<openbmc@lists.ozlabs.org>
CC: <wthai@nvidia.com>, <leohu@nvidia.com>, <tingkaic@nvidia.com>,
	<dkodihalli@nvidia.com>, Ed Tanous <etanous@nvidia.com>
Subject: [PATCH u-boot v2 1/3] ARM: dts: aspeed: nvidia: Remove ECC
Date: Fri, 16 May 2025 18:47:01 +0000
Message-ID: <20250516184703.726599-2-wthai@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250516184703.726599-1-wthai@nvidia.com>
References: <20250516184703.726599-1-wthai@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|DM4PR12MB6591:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aff9b03-0657-4e24-ff4d-08dd94aa17ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DzhMA+olLSLS3iPZ9MIIzon44LADyTN8MnT87zacmMZ1Dtaejfcpe276iXEe?=
 =?us-ascii?Q?NGw/5YztU1m+AoyN0yeP1n1xbKFpXHUD42WTGgq52qtwdNKsD5J15z4PgAbD?=
 =?us-ascii?Q?wNqwzA8XrEK10EvYB+DjgJKL38U8lfuWvo1yc5geGilrtka6yAj8kH7cQ0w5?=
 =?us-ascii?Q?GVN9c4V9UkSx/60Ee1qS18+Gsw0Cf2HjaEqdlCqIAEfHkeyu/2f0FU26wzw0?=
 =?us-ascii?Q?0i7yEfDgI8qAw6MZI62GCOElFzvmjJCKcSvm50nJKvdBBUumRsEx/pBwCEdI?=
 =?us-ascii?Q?C+5n4FpIi8uYvG304kaeg/olZuCHvcZbH07dLqacAQ5HB/KxBlF8vg3lkcxq?=
 =?us-ascii?Q?8P+kk+O9zh+vz4jAhk5UCTMbiOyg8nstkxtc0gBcscITog5DK7bd/ecQZ+EN?=
 =?us-ascii?Q?yFe8lGCF5IQBonkfMomMF+6aSuKjOYmCf3RsY1LVVTpMVDmM0yZQBf3s85XB?=
 =?us-ascii?Q?JQhseBT/73o5FAnvkZJfJNfQAkW9FkQJzdfkztZc0x7oY3V31uUv3jHK9WAH?=
 =?us-ascii?Q?j8GS+Jlruzaiwl3OWVfYYYnQMsJS4HpO5lDPXKru/ZkhOxJ5Oni5srFGgQy5?=
 =?us-ascii?Q?otoE33zZM8CaJLEQk84ejStQzf2UQ63GrwALWervqi6QaR8LecCgG/nZaJQj?=
 =?us-ascii?Q?pfMKF5vqPhdM0zUqnvs2eqky1KoaKrBAc6/WJCXW5ATs4D2TCMAMDf756OnE?=
 =?us-ascii?Q?H+qiQsfhiFUh04x8vh9xCNvQ3+Ab2wRrS/2IaDL8aY1Vv2t//OGpKTnV+XtV?=
 =?us-ascii?Q?KMgCuCV6lnf9gkPzKC03S9vRvYhivSkUf0h+6nfyF1Kua0nmDdGYbJUmuyTo?=
 =?us-ascii?Q?zICZYnmRDRuxfvXi+Ks1ROUTUx9kPJWCZ8+HBIhH4XvFCANhYpduBMo1c0ni?=
 =?us-ascii?Q?V9KtvgtitCFO1gQ+isUj/FdZuq3IyuYACKwnBn2ixn7UeNgHNye3n/VSArA+?=
 =?us-ascii?Q?Blyv5n8eaCgy9lBHG6WxGIQnuIVzNX0Y8zAGhNyQ87pZbNNyw5T0FGfsRhO8?=
 =?us-ascii?Q?4M/Nk+CToUuVstEDegrP2pk+ZMYEd2VKIl9+yPyJ/1GfVxjDNS/fufQ49gBV?=
 =?us-ascii?Q?U76/nEeTd1/GyVDJJewmDFiGG9t59Y9ljgUtdJACBK8tBvwFr31WqlzhtEre?=
 =?us-ascii?Q?3UVwSMQ49mV/z4RGmaqX+7gAEcVChH8z+k39fE8Gf0lFzV7DODeNrT5Gn9GK?=
 =?us-ascii?Q?AYlR50nYFpR2p51X5J5q18lAsSiGZ5f6TRwZq6qW6HUAkeyaYl3UR+jLB5rF?=
 =?us-ascii?Q?BVaQtXV9VLnFt2y3F9oD5bRrxb9cXcdkLxgGLvsZ7CxGVZyvs/cSaWjDcL6/?=
 =?us-ascii?Q?Pln+Zm8RJI9fjR3AbSlzSZGSdKJXDBshSLQx9lLdpwDXY7gkr0A9+YEHkIRs?=
 =?us-ascii?Q?gt5PDwOTB89U9Z69NLWet0gCQOfd8SEsCqMjjScW2DUycnkHQXKbOHM3J2WM?=
 =?us-ascii?Q?nez0Z5ibrfqlEFpGE0o+LZy54aP17UrerTivlLzRdUIP3DzWTWe/d847HJ7s?=
 =?us-ascii?Q?K4p/8/ZxGEaJxCAMHGuIlSJ96ZLzfVSEGvHc?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 18:47:22.1821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aff9b03-0657-4e24-ff4d-08dd94aa17ec
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6591
X-Spam-Status: No, score=-0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Observe the performance downsides with ecc mode.

Signed-off-by: Deepak Kodihalli <dkodihalli@nvidia.com>
Signed-off-by: Ed Tanous <etanous@nvidia.com>
Signed-off-by: Willie Thai <wthai@nvidia.com>
---
 arch/arm/dts/ast2600-gb200nvl-bmc-nvidia.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/dts/ast2600-gb200nvl-bmc-nvidia.dts b/arch/arm/dts/ast2600-gb200nvl-bmc-nvidia.dts
index beac18cfcb..bf0fd26617 100644
--- a/arch/arm/dts/ast2600-gb200nvl-bmc-nvidia.dts
+++ b/arch/arm/dts/ast2600-gb200nvl-bmc-nvidia.dts
@@ -46,8 +46,6 @@
 
 &sdrammc {
 	clock-frequency = <400000000>;
-	aspeed,ecc-enabled;
-	aspeed,ecc-size-mb = <0>;
 };
 
 &wdt1 {
-- 
2.25.1


