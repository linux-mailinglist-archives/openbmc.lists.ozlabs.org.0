Return-Path: <openbmc+bounces-372-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AC2B089E5
	for <lists+openbmc@lfdr.de>; Thu, 17 Jul 2025 11:53:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjSsJ59L8z3blc;
	Thu, 17 Jul 2025 19:52:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2415::61e" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752745972;
	cv=pass; b=k9mufFKOAVhon6EwiGtBEYTBmjJSOO6edDlQpi033PBZDV+kqC6aHxmpkan7ApoEpVZh3uzeMDf0LJ/uZwZQKz1eRm5x4PRqpEKNjmEY/saGklccCc+MC4XXYPxqajkZZtJOO9phoxH/qLuVdtPyW2XuIof7/+yo5qtt7tkpGb7bBHR0hL+itXQSUI9uzSVVlEtXjlMkt+XQlGbyjkdTkb7bCVCeAKB7ijM5rsj+dBdp4lbOfXwcIUlwqznvjLRXFghlia+COde8piABChcZDIjIrEvQ/rD8SMdiT7Q8Id+A2K85c6eN620Gs9MakGKrG3ywmVQSAL9+ejclXhJ3ww==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752745972; c=relaxed/relaxed;
	bh=s5+xgvktZP1gnfMj7MRWLXEkFOIow0kXg8Y+3Vgk7xc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=AQpEDKQUvook5fdXV5BKWNpMcF9wcBCiyar+7z2BbYtTZLeY4RkZQatyggwAnxBcjGaN4DHqEbthf/31NL4nDvISf13I2gHEuMgPWJiY25l7XH7hMUmeRppq9ZjC8kd3qx/26TfMLcWmY5x0YXmFs3Uo1M7/L/tNUO1ciamALkq1IEHcrV67pacVN8v8dvlY8HODyfR75W6FRt4eSyrLH9K/GXts5izUEU0RZzqJO9RaFjcIGCvSILdqaGKEgWFiaAK9hgH3jaPe547tTr7usyDSWIps2KosGrFdME/f19kzVfrYJZP9AuDByIZYayDyMlMos/3XEL9tYjt6l0maEA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FfodNsZ6; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2415::61e; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FfodNsZ6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2415::61e; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f403:2415::61e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjSsJ19lmz3bnJ;
	Thu, 17 Jul 2025 19:52:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MGXEgSdRtrwIbQdx42pqMzWIA5TzNpDC/VcvADlq6AzJWkUGeXa4uyBRv1FWhwhKF3LUne5k0CM7kfFgjgXBdfQPXuraoy3LKd07f2WhfGOpMBHRQWISib4fq1VpRS2CaQ4BP37E4JA/9MgFP0rRBXZI9vGOXQ4oujZoaB24ADNv+fSKcPLLniOIFKpjnGOUnF1Cpvkht5bW6UwrV0EHUCK6Jv3j6CWJvq0UHvR2tdtl59aINTObFT5FbigByWPMpcFpK/kh0UjL372xbvzfTf3JdiLHlaVmjPlrdi3uJ0L9kIb3/0cPkEAr97dyzonWRf2/ZEWA/7Kgy1JRajNnFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5+xgvktZP1gnfMj7MRWLXEkFOIow0kXg8Y+3Vgk7xc=;
 b=ZuU5g/Qlwv9sdMYZVfUh6eO/zyvKFH82HNV3Z+89qOzfwyCcCvUWohu2bvRjmRsY0fwpXOh+tigQZkyGWYlkrU0weqZ0y5mr9uZ6jgoSESttO2asEGioDyABFe6XjMAGralY1lB4tGXlNVkg3aKV18USLC/4k/2KV5H/z+jtSOtJ7qQiM2VrS9q5BCuVoLP5yHum08Tv1Ih0Dci3aHRG7gHq6UPrpJDvfy+Te/V6BiNFh2W1fU9nFU9ndhj26qIUq/4juE25ug7hq0tvB4pumNukgpXh1JrT8vN3Dt739LceAVEeuQWWcyH2EXfV1yQy3M/n1xvTZTDmymMUmTWyPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5+xgvktZP1gnfMj7MRWLXEkFOIow0kXg8Y+3Vgk7xc=;
 b=FfodNsZ6AyYgOdJlwdnf/SKkGZpMLgW6MKBOnJH/Kq5CjeFldmqkb3ktdPrkKWUM1AEgqNjSf4M0Y8zB2pByC133zVxle89LjdjB1aI8JKtJ57xDH8VwlTOAhew1t/SP8YYfiYBugCOXcr+Ab4w0ArM/rmyOyShz82Ti90RuvrXdNLea7gk0FvGqvlvk5ROrNqXu+lu5UMTJPcdCIQpgaTCSmi5VU67QK2/IFrCEItoSK8fpPkwXJUAmeglGMTCQ8iZXbM12PvBJRPTndMMn6JLGvLQ6HYGSOCKXRtGwneZrdXRoisskr+/M6UZv9yVKvaqJ6wn2M+5io49b0UYb7w==
Received: from BN9PR03CA0167.namprd03.prod.outlook.com (2603:10b6:408:f4::22)
 by MN0PR12MB6198.namprd12.prod.outlook.com (2603:10b6:208:3c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Thu, 17 Jul
 2025 09:52:31 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:408:f4:cafe::b) by BN9PR03CA0167.outlook.office365.com
 (2603:10b6:408:f4::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Thu,
 17 Jul 2025 09:52:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 09:52:30 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Jul
 2025 02:52:14 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 17 Jul
 2025 02:52:14 -0700
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 17 Jul 2025 02:52:13 -0700
From: Willie Thai <wthai@nvidia.com>
Date: Thu, 17 Jul 2025 09:52:10 +0000
Subject: [PATCH v3 1/4] ARM: dts: aspeed: nvidia: gb200nvl: Add VCC Supply
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
Message-ID: <20250717-update-gb200nvl-dts-for-new-hardware-v3-1-f28145c55c98@nvidia.com>
References: <20250717-update-gb200nvl-dts-for-new-hardware-v3-0-f28145c55c98@nvidia.com>
In-Reply-To: <20250717-update-gb200nvl-dts-for-new-hardware-v3-0-f28145c55c98@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, <openbmc@lists.ozlabs.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, "Deepak
 Kodihalli" <dkodihalli@nvidia.com>, Ed Tanous <etanous@nvidia.com>, Leo Huang
	<leohu@nvidia.com>, Willie Thai <wthai@nvidia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752745932; l=4653;
 i=wthai@nvidia.com; s=20250525; h=from:subject:message-id;
 bh=4YKBGVin4fIcApqjT83lHdFPoOly2P5FAdZ6KRKPWyE=;
 b=HIIne3xyTnqaie1dOQR/btr+pLZsIzrN9jFMkM6NYqRtdCrXFplva8mt3ha08MX3RjZXGbXLE
 Hmt3T7ls4AwCVOnmA8NksIziHVAGB/SdVugISjbWVPTMvZbMhbLda7C
X-Developer-Key: i=wthai@nvidia.com; a=ed25519;
 pk=i/6dxnUqKdr7Z6GA0KECRkwz5HX4RCiodw0v6kB9fbs=
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|MN0PR12MB6198:EE_
X-MS-Office365-Filtering-Correlation-Id: 997bd9d7-9080-455f-2e75-08ddc517a582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wi9ZY0JORms5TUh2TnA5dlZGOFh6QWNjbTJkbndIVzFBSXRwaEZwYW9XUmsy?=
 =?utf-8?B?ZGU4UFFmb2hkc2h3dWIzTVovaXoweWZmdlNUMnRiSnl2RnNrOUI3R1pyQ3dw?=
 =?utf-8?B?OG9tMFRvakszNjJxK1pXZ1NYTXA3ODJUeXBPNXFZaFIyNE8rem1rQmhLa3Bk?=
 =?utf-8?B?ZTg4ODF6U3pRS1E5UE5WeGVHZzZzaUJVWDZlS3p6NTRBTlliQTlmNmlGRWls?=
 =?utf-8?B?dFdvMDNEeklubWlDc1IrZE5CTDlyUFMyU0hKZ1M1Q3pPZU5xR3E1cXlBc0dy?=
 =?utf-8?B?OGRKYjVFbGQvWTZ6c1ZyUEpLS2xnMzJkU3R3dUZQby8wcTd2TEdvM2NMTVE1?=
 =?utf-8?B?WHp4VkJ5TXdMVUJ1MGhUc3BWYTluN05RNEJjQURvck1EYVY0VmdlenNaU1BT?=
 =?utf-8?B?bkNaVCs4VVFVNS9PcUFMQm1xTjJ6Q1ZkZGFDMjVEZlIwY1lPVEFYTHVjSE95?=
 =?utf-8?B?OVh5TU5kWjNJb0J6bWhHUmd3aVk1a3NraFlmL3pCcERYVkxTdXVpcW5tLzBJ?=
 =?utf-8?B?WGN0Yy8vYldkTHdFZitsdEx1MjhUOTIwaTluNlFhM0ZGQ0FhZ1UyMmRnTk5I?=
 =?utf-8?B?QTdkSVJ4S0tSbW9nSi9xejA0dkdYeHBwZ2d0d3dwa3pFc1FuK3hZNmhwc2NP?=
 =?utf-8?B?M0ZLT1V0ckQzaUZwdzFhQ3piY2RJUnQ3d0d4SFpSY1lZTyt3Z3dRYm5mUHdj?=
 =?utf-8?B?WUVrTGVpdStPMW5uR3hJZnJUdlRvMk5zOC80RGQ2QzQ2NVpGSzNYaHJGZi9r?=
 =?utf-8?B?bXMrTHo1Vklmdm42WXRpMm1vS0ZyRlRzZ0x3aHdoMUkxREJmRU03OXhVRDlX?=
 =?utf-8?B?d0Z1WDBNK283M0t5NWxFQWpiSWNXb3lXSWhxdUtuWmR4ekF2eUVwTWdjalZG?=
 =?utf-8?B?QW1IaSt5Nk02b0hsVFpKNThid2VOTms1ZDcvOXdvMUgwMEVLN0p2QkVOMnI3?=
 =?utf-8?B?VllMSGVJSXhqNlVjWjBGYXRJcnRMNFI1c2RoS3dTSmwySm9CRElZY1dhZkMv?=
 =?utf-8?B?TTJqL0l5SEhUVFZTYW8vaDd2MUNPa2o3OHdYNUdjWnJSd0ZiMTlQaVhlazBm?=
 =?utf-8?B?eGZKZTJ3MG5nZ09LdkJmeXRJMTZBUUFiT0pXbzdmRjcrMHRIeGY5UVg2K2VX?=
 =?utf-8?B?cDc1R2hhemxYQzI5U0tRMXp1amxuUHBzN2dZOGZBRkRETGFSaHVvaFdVbzUy?=
 =?utf-8?B?dlduS1FkNXNXSmhoWTBkN25CTjk4UG9UemE5bE1kd24zTXlsMjNOZHFFMDN3?=
 =?utf-8?B?U0Q2TC9ISUNRN2FEL2JOeE5FME9pbC9udnZsNS9GMWdlMFdWREpEdDhKT3Zr?=
 =?utf-8?B?S0kzOWRtemdLTW12UXFaNnRhbFVvaE9UaXNyMVcwSGVDVE43OXlaQllWN3BD?=
 =?utf-8?B?cE4zVHFjZ1BMVDhFajRrVkhkTng4SkJmOEhOL1NMQUc0OS9yb2xsOWdVK2hR?=
 =?utf-8?B?NmVJa2ViOUM5a0VWWEZCMFFzVzNPNm9obTZmZ0N0UzlEdTlsNlFmTnp3cmlv?=
 =?utf-8?B?eGo1aTk0MkdnVGUyRmdtYnRsZnBCU0Q0TjZUVnUwOElKWXRvdWIyVUsxVTFL?=
 =?utf-8?B?M3Jzd05IQWxDRFdmakZxYktkV2tJWWNSQTNNakNpb3N1Z0E2V0dpSTZQTUd6?=
 =?utf-8?B?SVNXZk5ZQ3NKZjk5NjV3QVpuR1lSYXZjYVc0SnEvR21JSjNLd0pWOW1tUHM2?=
 =?utf-8?B?OXo4cEo3VlU1OXZLVFBTSHdiYUgweDRtaFRvYzNtZkRBYkV1ck9SbHBjZGh6?=
 =?utf-8?B?clFKbjA5cTRaMmJRTHRQb00vWXZ2RUJXVlQyWGZTZUV4Ryswd3B2bm9CUEtJ?=
 =?utf-8?B?dVZJaTBRd09Uc3dRaDNiSkQvYnVSRk5uUTNJS2k1eHFtMHlYQnM0YlNXRjY4?=
 =?utf-8?B?Q0xEWjhzQ1NvdWpnTThKOUtza1U0MGVZUXpTNXFvQ21TbE5DcGdtU2twaUhh?=
 =?utf-8?B?NFlyTTh1dm5ReUtlVFk5TkwxUmNXMVpsRnhBNS9uZG9KWXd0cThmYVlHNVlt?=
 =?utf-8?B?UmEzbWt6S0ErbldnUXhPeis2WTZja0cwR0k5Ly9meGMzNVNHNk5KOTAxUjI1?=
 =?utf-8?Q?CCOTQW?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 09:52:30.6240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 997bd9d7-9080-455f-2e75-08ddc517a582
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6198
X-Spam-Status: No, score=-3.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add Vcc supply to avoid probing the devices before they have power.

Signed-off-by: Deepak Kodihalli <dkodihalli@nvidia.com>
Signed-off-by: Ed Tanous <etanous@nvidia.com>
Signed-off-by: Willie Thai <wthai@nvidia.com>
---
Changes v1 -> v2:
   - Fix unevaluated vcc-supply properties [Rob Herring]
---
---
 .../dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts  | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
index 41e3e9dd85f571254a08d40e68c0d8f8f049256b..bd9395a194137ea70d184665ad6cb659541ef175 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
@@ -126,6 +126,17 @@ button-uid {
 			gpio = <&sgpiom0 154 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	standby_power_regulator: standby-power-regulator {
+		status = "okay";
+		compatible = "regulator-fixed";
+		regulator-name = "standby_power";
+		gpio = <&gpio0 ASPEED_GPIO(M, 3) GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		enable-active-high;
+		regulator-always-on;
+	};
 };
 
 // Enable Primary flash on FMC for bring up activity
@@ -431,6 +442,7 @@ exp4: gpio@21 {
 		#interrupt-cells = <2>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&standby_power_regulator>;
 		gpio-line-names =
 			"RTC_MUX_SEL-O",
 			"PCI_MUX_SEL-O",
@@ -464,6 +476,7 @@ i2c-mux@71 {
 		#size-cells = <0>;
 		reg = <0x71>;
 		i2c-mux-idle-disconnect;
+		vdd-supply = <&standby_power_regulator>;
 
 		imux16: i2c@0 {
 			#address-cells = <1>;
@@ -528,6 +541,7 @@ i2c-mux@72 {
 		#size-cells = <0>;
 		reg = <0x72>;
 		i2c-mux-idle-disconnect;
+		vdd-supply = <&standby_power_regulator>;
 
 		imux20: i2c@0 {
 			#address-cells = <1>;
@@ -545,6 +559,7 @@ gpio@21 {
 				reg = <0x21>;
 				gpio-controller;
 				#gpio-cells = <2>;
+				vcc-supply = <&standby_power_regulator>;
 				gpio-line-names =
 					"RST_CX_0_L-O",
 					"RST_CX_1_L-O",
@@ -584,6 +599,7 @@ i2c-mux@73 {
 		#size-cells = <0>;
 		reg = <0x73>;
 		i2c-mux-idle-disconnect;
+		vdd-supply = <&standby_power_regulator>;
 
 		imux24: i2c@0 {
 			#address-cells = <1>;
@@ -602,6 +618,7 @@ i2c-mux@70 {
 				#size-cells = <0>;
 				reg = <0x70>;
 				i2c-mux-idle-disconnect;
+				vdd-supply = <&standby_power_regulator>;
 
 				i2c25mux0: i2c@0 {
 					#address-cells = <1>;
@@ -648,6 +665,7 @@ i2c-mux@75 {
 		#size-cells = <0>;
 		reg = <0x75>;
 		i2c-mux-idle-disconnect;
+		vdd-supply = <&standby_power_regulator>;
 
 		imux28: i2c@0 {
 			#address-cells = <1>;
@@ -712,6 +730,7 @@ i2c-mux@76 {
 		#size-cells = <0>;
 		reg = <0x76>;
 		i2c-mux-idle-disconnect;
+		vdd-supply = <&standby_power_regulator>;
 
 		imux32: i2c@0 {
 			#address-cells = <1>;
@@ -729,6 +748,7 @@ gpio@21 {
 				reg = <0x21>;
 				gpio-controller;
 				#gpio-cells = <2>;
+				vcc-supply = <&standby_power_regulator>;
 				gpio-line-names =
 					"SEC_RST_CX_0_L-O",
 					"SEC_RST_CX_1_L-O",
@@ -768,6 +788,7 @@ i2c-mux@77 {
 		#size-cells = <0>;
 		reg = <0x77>;
 		i2c-mux-idle-disconnect;
+		vdd-supply = <&standby_power_regulator>;
 
 		imux36: i2c@0 {
 			#address-cells = <1>;
@@ -862,6 +883,7 @@ exp0: gpio@20 {
 		#interrupt-cells = <2>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&standby_power_regulator>;
 		gpio-line-names =
 			"FPGA_THERM_OVERT_L-I",
 			"FPGA_READY_BMC-I",
@@ -891,6 +913,7 @@ exp1: gpio@21 {
 		#interrupt-cells = <2>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&standby_power_regulator>;
 		gpio-line-names =
 			"SEC_FPGA_THERM_OVERT_L-I",
 			"SEC_FPGA_READY_BMC-I",
@@ -949,6 +972,7 @@ exp3: gpio@74 {
 		#interrupt-cells = <2>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&standby_power_regulator>;
 		gpio-line-names =
 			"IOB_PRSNT_L",
 			"IOB_DP_HPD",
@@ -1014,6 +1038,7 @@ i2c-mux@77 {
 		#size-cells = <0>;
 		reg = <0x77>;
 		i2c-mux-idle-disconnect;
+		vdd-supply = <&standby_power_regulator>;
 
 		e1si2c0: i2c@0 {
 			#address-cells = <1>;
@@ -1054,6 +1079,7 @@ i2c-mux@77 {
 		#size-cells = <0>;
 		reg = <0x77>;
 		i2c-mux-idle-disconnect;
+		vdd-supply = <&standby_power_regulator>;
 
 		e1si2c4: i2c@0 {
 			#address-cells = <1>;

-- 
2.25.1


