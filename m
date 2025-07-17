Return-Path: <openbmc+bounces-369-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4BBB089DC
	for <lists+openbmc@lfdr.de>; Thu, 17 Jul 2025 11:53:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjSsF2WxBz2yF1;
	Thu, 17 Jul 2025 19:52:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2418::631" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752745969;
	cv=pass; b=PQcszwGqzwt5AS8uCIUfQxfpgmpMYGd9thTxiyRlEbs/ABIcJeAG+1Okl+VnYp+e3lHNMk+mGZgWV90No6AGj1MBtogLJoiGLUXmESZ1iyJBcTX576PMmuPlo6eTw7kgU0pqkdn/Pior8Pyvsu5a5RwsTRseToDk5SJZsKxwj5XgmDmX26gyJcqdlaBPC8WbxpWq/zQDuJ4wNItXGBhWqjmzANvZMGUfaf7/Dhu5zeO+9q6l0QpyH8d/plb6VDdVknpTAZMyBNZRlaCa+fexHOF9wpazwcJ3e1MolvHJs46Zg3nNuwLpdiudB1HeBSSy2yGGRQjoQGZyqgLhVE8COg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752745969; c=relaxed/relaxed;
	bh=6/Ku+K4LJm+WHMBkr6/YBPhXCc3OIXQvcbsZrDCfsN4=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=EkE3Pu61pW+K2k1qWqza5Tk+KJvHsFoTMLJA3bpO223SZ2cs4dDP4iR1SeQn1pnxdkvtgqZa5A1JNNY5Cb/3mR8R0RZATA3WGmfVMzvzXKvCpdt523uRf+11kgmXN/EnuWHOIbsXwDuJu2KSYB+4xvfDhkWaGRdv0L1W7QS0R+RzoXQy2h3B2Ouln26lxy1tw+u04UQOcHuy8eSeSCn1Mm/xQ4PEL/3U7tp4agS+h2JQCuq05mR8LiElCsWpLWWkO8YzZWvcJrEda0mxDXSm38Ki1bf9qxOEXKSM2RX/El0KuyloAaw4ULg6SngC5aHR2XCCRk0e71DQjZyYUIt7wg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Hit6bZxv; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2418::631; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Hit6bZxv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2418::631; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20631.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjSsC4mBpz2xlM;
	Thu, 17 Jul 2025 19:52:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3zP4EHvPOy41ANrUPAppHyM6FVyAajP39RcMaSWoN85VPiZrg9ymemYJQfJ6FT0M3yxT838oon7lCZKf7JofyxB/c5NJiAnRa/he9uPOdT8Z8x/jXK0JBNwrGIPGEY1aMl+C2coNzTY2S8vf3X9SDoB9rkgLm/NR1yMtURYpwB6hx0PnA7gqrj5VJt/Ofh3O2FntHneRMXMiTrzhLU+ZIo39dxoroxLFMz4284R7JA+ittJKVXpR5X8jNX+19/sB1tCf75XlfuW+t0Jd7X37CAjgL8eNoBCZvUQGD+g+R4lF7Fi2OflaXgfNW3C5LAgquChwO79D0llD46oXgAgEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/Ku+K4LJm+WHMBkr6/YBPhXCc3OIXQvcbsZrDCfsN4=;
 b=JbvJKLM1DkUDzfPKremt87eJAhjYRkbCSZwMUUSvMTu1N/rNWSXNNWiNXNoLs25XXExOCM7wPBp5c2yCh7GuX6J+vLndAOaaHJAWPPjPIusEdeOJ6ZP7QaBFAgHeFY2WLK1D2ij5KcF97ehtZARA/grzyVxAWQ290gnk3Hj11juaqmN2a6hfhpcPcclDq/iRrBi5x+oJeykLXXYxSLXt8n5MNKeM8e00G13/C+F3ksAdQVevsqhDIYrOC/ThMP9YGoh/nol4yrpMI8AP/PTQYx/LKyTN5xc5XQ5ON/17mY2T+7QsIhzETOplAVOJcnTlinr+4ZXkFbRxWzhbVG54Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/Ku+K4LJm+WHMBkr6/YBPhXCc3OIXQvcbsZrDCfsN4=;
 b=Hit6bZxvpIaj5W5MZ7yrEVimIPF2559yPOSqYLDFl6PIM8McVKqdNLaIWYM4kMNpL2trOm7cQ/YhDADMFJZN78KMshuLTHHAw8dBgMssL64SU/MnB88IvgWN9xygi2uuUgo8G6Qzt22L44TRspKy0UYodB05nOne5HnZ6uwL/G5wZbMRKvooOF/G7u11dG5NtG+j835s10ExqCiGtxuf3a7e0tNGzdNCBVy5BM9rVF7/vxIz5FoK+56udvfctQ63EupWiWkyUGIncyL8C/+5YiRsmLKxCjdBq6JQwc34434B9Vtkrz2Z2k2Emx+CSc7UwvqzulMuwimpR9lVienkhQ==
Received: from SJ0PR03CA0026.namprd03.prod.outlook.com (2603:10b6:a03:33a::31)
 by DM6PR12MB4371.namprd12.prod.outlook.com (2603:10b6:5:2a3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Thu, 17 Jul
 2025 09:52:27 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:a03:33a:cafe::f1) by SJ0PR03CA0026.outlook.office365.com
 (2603:10b6:a03:33a::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Thu,
 17 Jul 2025 09:52:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.1 via Frontend Transport; Thu, 17 Jul 2025 09:52:26 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Jul
 2025 02:52:13 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 17 Jul
 2025 02:52:12 -0700
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 17 Jul 2025 02:52:12 -0700
From: Willie Thai <wthai@nvidia.com>
Subject: [PATCH v3 0/4] ARM: dts: aspeed: nvidia: Update DTS to support
 GB200NVL hardware
Date: Thu, 17 Jul 2025 09:52:09 +0000
Message-ID: <20250717-update-gb200nvl-dts-for-new-hardware-v3-0-f28145c55c98@nvidia.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMnHeGgC/5WOyw6CMBAAf8X07Jo+BIMn/8N4WNqtNNGWbLFqC
 P8ucNGrx7nMzCgycaAsjptRMJWQQ4ozmO1G2A7jlSC4mYWWupIHVcOjdzgQXFstZSw3cEMGnxg
 iPaFDdk9kglYZ6UwjbWOsmFU9kw+vNXO+zOw53WHomPArr3S1yooCCQ3a2qAzrVfVKZbgAu5su
 i+uLuQh8Xs9Lnox/jlX9BpQ2Kja72vlfgOXaZo+DpfksxUBAAA=
X-Change-ID: 20250716-update-gb200nvl-dts-for-new-hardware-b130d390c93c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, <openbmc@lists.ozlabs.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, "Deepak
 Kodihalli" <dkodihalli@nvidia.com>, Ed Tanous <etanous@nvidia.com>, Leo Huang
	<leohu@nvidia.com>, Willie Thai <wthai@nvidia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752745932; l=1053;
 i=wthai@nvidia.com; s=20250525; h=from:subject:message-id;
 bh=9sWcpJKjFL9eJA+RrsdJi5sJhsE02CWsPHUAD5VFoM4=;
 b=mkBJRjAtVUE3RbQ+qXa9FepSv/DW+t8bjKhqDPNoV5wqHfpX4K1IJCZmTlzVjZbabD+kFyXL7
 7EKropvZ7IKBX050B6b37qJZZomQsipZ6tM6NooFqe+2CCNjpSHbgrx
X-Developer-Key: i=wthai@nvidia.com; a=ed25519;
 pk=i/6dxnUqKdr7Z6GA0KECRkwz5HX4RCiodw0v6kB9fbs=
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|DM6PR12MB4371:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ea253c2-7b19-4961-df31-08ddc517a2f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q2hBcXdDSzRHb1ZUNjliR3g0MTNadHR5NFhESHVMRnJocnJMQW5lRTVHYlpR?=
 =?utf-8?B?Y2M0QlI2d0J1T0pRUDc3bVdMZmdxR3ROaitEMVNvdEd1T1VUMFhiOHJYTlJC?=
 =?utf-8?B?S01uNVNxcUtWbWpGOHNDQ2swOTRyd2k1RFIwOWlES1FES2poTm5VRDk5enhx?=
 =?utf-8?B?dkdIOXZDWFM2a0VISXJNbHg2NTBmdFY0UWRMWDdqbVNSZlYvNi9Zd0h0aUg5?=
 =?utf-8?B?dldIWkFETHJ5Sk1BY0JxZEY3VUNRTmlxWUtrYmRwNDRna0tNZEhsVDVibnpB?=
 =?utf-8?B?YmtBN0FsVHdxREpoU3gvbWJqUjVGdFVBUGdtZnErMSt3Ymk1c3gzT0l0Q0lN?=
 =?utf-8?B?dUZLcWJtb3M1UDRHd2MzV0JQcVN5eGd6TkVpUERUWVBEM2tRaFBKZW50ZDQw?=
 =?utf-8?B?TlU1S281THFVeURXVmlDQ21OSm0xb0F4WTREOE05ZTByWWtRckVZaFZuWkpu?=
 =?utf-8?B?ajJpaVkzUW9CNDNUWXVzN1RGc1p5aE04QzE2czFsQ0htL2pKbW9VYkpvQXBW?=
 =?utf-8?B?TzFWRHRSaGN5N3VObmxKNDlQcU9sWTROOXlMWVdMcWdJWFFUNzFhVFlYbnVH?=
 =?utf-8?B?cHRVZEp6djNKN09lekFYZzZPZDNFeXhjd0NzQmdDWmZMNDNram93L3hRSFhp?=
 =?utf-8?B?MjZnSkVoWW5PQnBlZVBWSVpxZDh3SGo5Uit1QWs2am02Z0ZkYy92QTBVTWNv?=
 =?utf-8?B?Zm14Sjl0NEVQSElQR2RKd0NoY2EyRjE5M24wdlB3TFFOeDBpQ0I2Z3gwTFpV?=
 =?utf-8?B?K2dDRGxlMzQ1WGV1VDlkWDB3bTlsQStBVi9hYVlhcEhhcUI4bXF3Vlc1WmRL?=
 =?utf-8?B?c2tZeWZTa0kxRFpRd0drZnh4MmFOYjk4dkNHUERWR2R1ZVRKR0c3dVBzSXJR?=
 =?utf-8?B?TmFBNHlNc2N3U0tWcjNUWGd3TFRoNUltRk5BRVp4QnFORWtiNkVKMUFtZEdC?=
 =?utf-8?B?UmFBSXlVRklDd1UrT1dHSXk0aFhnWmZvRWptTW0vQkRKaGdVbVVBOXg4QTdL?=
 =?utf-8?B?YUJnZ2VPZEovTng3aUJrZHQ3TmxJbWRER3FDU3FFYWdMVk9KeFEzV0ltbmlF?=
 =?utf-8?B?TlJkc1lUWmUybzh1b3cyUDVOYWYzQXRTNm04QzVYYUpKOFJHbXM3NnBBTkcx?=
 =?utf-8?B?T3RyTThvcXNlZkhhVDhndXRGUG4vVWd1dnQ1MTMzTTlWTjlQNVVreC9Ub1kz?=
 =?utf-8?B?U2I4Q0owdHo0OXpZNGhmcGFEZHBOM3FnSWFGZHZ6S3psVXlUeE03TlVjdjdF?=
 =?utf-8?B?ZjYrcVRZYUNDcG9vOFM4SCtobWtGUXdxZ2x5K2JYdjQvbFpvc3pQL0d2eTY0?=
 =?utf-8?B?eHErREJlMzNnZ1Z0ZnhQZFRoWS9oNDFZT2pkSFEzclZocXVIekJudnl5TVI0?=
 =?utf-8?B?bUs0UVFEY3h3bFRNak9kN1lKVjhkZVZ6ZzdrSjNRbUkrR2VhZi92N043a05l?=
 =?utf-8?B?YnlOQlNJcTl1VndKelp4OXBPSVNYRG15dUJpNEQvODE1VE1hYm93MTNDblRz?=
 =?utf-8?B?R1lISitxM1VyV0JqZEJiNVNYK1JpRStKbm9KN1E4NkZKYWQxVnRhVHp4M1BV?=
 =?utf-8?B?dzJidkkwMy9jVDR5cVlTRjNCVndyTFF5ZWVLTU5RVlJDVjU5YWs3Uml1TDdr?=
 =?utf-8?B?enk5TGlML0lPVXNBWU0vczhxUVRZYTlzUmk5TXhqejQ5aUhpdUFadUlXVGY0?=
 =?utf-8?B?MkZEOVptVHFzTXZweTZSMzFKUm9kU3FYMmZsNnlYd3A4ZVhDQlFHbCtUamU4?=
 =?utf-8?B?bEVESURQMlU3QkVjWVIxamVCSDI3Nmc0TE9VWFpZVmxvc0Q5VWZXdTBHeWU3?=
 =?utf-8?B?U3R4R0FhWVdnd2hicEFCUTVMMVQ1YmVHb2hjZExVVTgybFptR0YxaDFSK25S?=
 =?utf-8?B?L05PYUl1V294VXFsRGNOamhaZ3M3ZFRxT2ZYU1U0Z3drdWsvWUljWHM3OTBQ?=
 =?utf-8?B?bmxBR3VFazhMM24vakhxeDBwaXovakRyN0EwL3hGQ1k2NVkzMzhRbTNtRmlx?=
 =?utf-8?B?NXlrVXE4OTdVRWZnYVdUYkxIaFhwTFZJK0x2UWRjczB4OUlWZGxpMXc0amVy?=
 =?utf-8?Q?SCmuOS?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 09:52:26.5026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ea253c2-7b19-4961-df31-08ddc517a2f4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4371
X-Spam-Status: No, score=-3.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Update the DTS file for the GB200NVL hardware change.

Signed-off-by: Deepak Kodihalli <dkodihalli@nvidia.com>
Signed-off-by: Ed Tanous <etanous@nvidia.com>
Signed-off-by: Leo Huang <leohu@nvidia.com>
Signed-off-by: Willie Thai <wthai@nvidia.com>
---
Changes v1 -> v2:
- Fix unevaluated vcc-supply properties [Rob Herring]
- Add MAC0 [Deepak Kodihalli]
Changes v2-> v3:
- Remove max-speed setting as it is not necessary [Andrew Lunn]
---

---
Willie Thai (4):
      ARM: dts: aspeed: nvidia: gb200nvl: Add VCC Supply
      ARM: dts: aspeed: nvidia: gb200nvl: Enable i2c3 bus
      ARM: dts: aspeed: nvidia: gb200nvl: Repurpose the HMC gpio pin
      ARM: dts: aspeed: nvidia: gb200nvl: Enable MAC0 for BMC network

 .../dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts  | 54 +++++++++++++++++++++-
 1 file changed, 52 insertions(+), 2 deletions(-)
---
base-commit: 13c9c6eabf033ed4f369ad4d29bdc58ed4a411e3
change-id: 20250716-update-gb200nvl-dts-for-new-hardware-b130d390c93c

Best regards,
-- 
Willie Thai <wthai@nvidia.com>


