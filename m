Return-Path: <openbmc+bounces-362-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1723BB07CC7
	for <lists+openbmc@lfdr.de>; Wed, 16 Jul 2025 20:23:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bj4DX4YjGz3bgV;
	Thu, 17 Jul 2025 04:23:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2416::600" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752690188;
	cv=pass; b=ZbqZFHQvhZLt7fUxLgrL2TvMSlcCHdVLJmu0sfvVpbR/0FnkbxKymYD+jlepLQD20h0TES+DsFmhXUOX7pBwwFTg1igFOKkYulNO1GI8b3q0DE/v3/i5lNki36Ttjjf1oR/NOR/tVRAmBX6gIKUBSA6t+n82+op8wdQ1+fnsytbPXgjLJbo3pJVkB/t/UUNlgR/2uyHnBiQIjDRIPPnmcJkgZwwkWg5yobK4ipWDcqI5O7JGko3P32dW1u2klUpsXe/hvJnLBkrJ1ZtiqXLpBv2lx+32UrVWSowYzcE7uaNqxIiZDSPi7kNRZPmO1Om4C0vs29uRuCLq/6HwD7V+UQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752690188; c=relaxed/relaxed;
	bh=2XZEkZ8Nh7IJar+QLhbRsqhoZs1SudCLK65C/XokS+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=d6Pp+iyEDHCa6c4uZ/vfYuHWeVpikYzJz4tkT1Ro2zm26HNLZmG2CDf6fvkihU2LKoW41VoecT3AQYw+HuN7f2UNSwAlrBlvcbZjA+y5n16H5mx82oOazSqZJ5X88/sVmx7XOhtrjqNJ5WKZcDRke6y7W8IgZngTMxBcnGLk7XarnGHnutLCuOfzyRpqxJAEtdFnhnv7Hil3HpgrgSFltyd3VJHv1195oBj35WCUwk92INQE1TuvHCb1+JOmEkYmj0P9+zGICDxUdxeWmhnoBAierTF0tnWAqTYSEH9kJEacx2ZoZ88OiFZadPuSI56iEVWhZIE8TaPVihJwVZeqfg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gCnXc01I; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2416::600; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gCnXc01I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2416::600; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::600])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bj4DW24cmz30Vb;
	Thu, 17 Jul 2025 04:23:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U5Um1CM4JrelU2i7hqjDI4qh+RdSySTlfZibF4w0ZsiRPF87ls+o9VODW2Z4x+Ut95Vt+TaVO9JKkOSgZ4ASgZ8DxtJuCGYx4rzFDHazrXjG38MmXIYGexl8XfmVD6z721FJu1jSBRdJJB54F3d6cWSSYAAujWTOHY3spJleFKzWfHQBCoCXP8+jZqUfpLrlCfS5hHoirHym0OgKAJQGb7inPK5Si1U6ezQFLNXde0s85syXQ8cqvw8rW0HuQwHJO5n+kViNlQrzTQ3XIoxkufyIViV/mwYjubwo4vU02Z4loMdxs/qtJEgMz0qXaLqEJXs+YMNJetjA0wYw7Qf2eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XZEkZ8Nh7IJar+QLhbRsqhoZs1SudCLK65C/XokS+Y=;
 b=QAbDu5G+/fmutp4/PbNb56qSWPGz+e8GtdwUudMdF3DtlDOAetXjOdx8HPuKHhfIhfblPONuJ0+Tf4QuhT9RQBHIkzPD5ysikGay6VPbqlD8V/lUQb/EWfgRZ1m5NU/usFcvAvbeb3o61nK+/ZF570Gv5MOEvOPyR2gz5+dvn2EuukRzWNaqbCLMVLUfVmaOv92eNC7l2No0wkAgAunoAMCQHoomWFRrrpnkTs2NmZrSu+P8/4Tk1g5YICWqQCW2gtxM2rYqfPE18Ex+PhK6ANsWNJVifsqzE9EAoDzqw6pawc/Xe2x7WFj9DUb85EKiXSp08NqvrYbX/CaCWzPVdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XZEkZ8Nh7IJar+QLhbRsqhoZs1SudCLK65C/XokS+Y=;
 b=gCnXc01IQebtPlbVSD6R9BB9vch+sNKEimzQIFlz8dZAArhlwARDeLdNfmuF9iEHfWsF1ginuvk6kBtLCO0scu/ZPe7qpHYT18EJIFDTlr2vciU31yx0XEHw2mddobQfK7TZUVJ4DYEiYSedEgWKKuoqkkTzPJBIQjBQWUsWKTMoKMdv2U5WkZCc41grcqdAe6G5J9arJiMAWK1kQs7vJdWjEOleV39mfGbIYH7g1TKhofmo60PKcLpTlbUZ4sLEy7/UBEhWwO1qccwWvuIaZ4eyhkNNXbfbDJyQm1oXNj9J/YLHG0UsVpHs37qkz0nlXB8CHHBfmWtjmQeBP3yCTw==
Received: from BY3PR05CA0045.namprd05.prod.outlook.com (2603:10b6:a03:39b::20)
 by IA1PR12MB7613.namprd12.prod.outlook.com (2603:10b6:208:42a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.36; Wed, 16 Jul
 2025 18:22:47 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::6f) by BY3PR05CA0045.outlook.office365.com
 (2603:10b6:a03:39b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.14 via Frontend Transport; Wed,
 16 Jul 2025 18:22:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 18:22:46 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 16 Jul
 2025 11:22:31 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 16 Jul
 2025 11:22:30 -0700
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 16 Jul 2025 11:22:29 -0700
From: Willie Thai <wthai@nvidia.com>
Date: Wed, 16 Jul 2025 18:21:56 +0000
Subject: [PATCH v2 2/4] ARM: dts: aspeed: nvidia: gb200nvl: Enable i2c3 bus
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
Message-ID: <20250716-update-gb200nvl-dts-for-new-hardware-v2-2-9a1a916f461d@nvidia.com>
References: <20250716-update-gb200nvl-dts-for-new-hardware-v2-0-9a1a916f461d@nvidia.com>
In-Reply-To: <20250716-update-gb200nvl-dts-for-new-hardware-v2-0-9a1a916f461d@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, <openbmc@lists.ozlabs.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, "Deepak
 Kodihalli" <dkodihalli@nvidia.com>, Ed Tanous <etanous@nvidia.com>, Leo Huang
	<leohu@nvidia.com>, Willie Thai <wthai@nvidia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752690148; l=909;
 i=wthai@nvidia.com; s=20250525; h=from:subject:message-id;
 bh=E5CvWtfedBNindT75YTTq7hmXgdKy6ZDH+6awigFKQg=;
 b=RjrCFH0zc7Y063/5GThjGSbNQi0mXcnVtMNKNhsZ8/EYliLo0kGxuNO7WSsbwNthPZhJEJ+oW
 Jch+QaruvgeALHuJWBGS4r5s1vI06ZKC0ZuaqTjqfhJvMFrNyrYnnrX
X-Developer-Key: i=wthai@nvidia.com; a=ed25519;
 pk=i/6dxnUqKdr7Z6GA0KECRkwz5HX4RCiodw0v6kB9fbs=
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|IA1PR12MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: fdebf74a-d767-4491-ca31-08ddc495c379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YXlaeUx2WEpsVFRFQnN3M2JicUZsQ0NKUWx2Nm9FRDVaejg1YXNjTGZ1Y2F4?=
 =?utf-8?B?WGJjYnlRNWVlaTlKQkE0RXlPeGs0N3R6U1pya3NsbTZLOWtkaUpnamRjUEpL?=
 =?utf-8?B?Zm5zMlk3R1Zna2tGYmU1U01YV2NSTVFBYjFjdHFSaDZRRjQrSEwrTXVlYlRv?=
 =?utf-8?B?YnNQWXlCSGFHU3EwNGV6TEhTa2xEeEpmWm8yZHl2alF2SytVVlFqdjdZa0Iz?=
 =?utf-8?B?VGxUOEdKU2UzaHJEaThDN1YyQytWSndxOXh3elN6a1h3ZTE1bGVQUXhlSnpF?=
 =?utf-8?B?aDdaMG5uUGs1OGVpemZWeUVCM2tjMktheEI1QjlnNmtrcUtRTHNGMDBhVG1M?=
 =?utf-8?B?bGpaalVPcGl2VFdneWFWc2FpeFZqNnIwZUhwQjR1Z2tkTHhmT0h3TVZDSjRP?=
 =?utf-8?B?RUhCU0dIWDFwaThXOWRBa25Qb2w0VTZhMy85SWFWYnE4VW8ySTF0WTY4RUly?=
 =?utf-8?B?TUwwMXRjQ1lpSDRVdDZrbTl6YTFYWWtFQVFTYTZVWnpkVGZINjlwbG90Q0ZX?=
 =?utf-8?B?S0ozNWFpV3dRbU94NFVzbUlQZ2JaU0N0aHZkSEtEb2p0WGt0YnJ1YzVSbkZ5?=
 =?utf-8?B?UXovK3c0S2thNmdtRVhhd1V4eU0yK2xPd25nWEVUbW85dnJDVDRVcmJzdkJR?=
 =?utf-8?B?MUppZzJiZ0IrZ294RlU5Z0VFNVNycXp2bERSb1VXd2ZwNlluWFRCVVVVNHVZ?=
 =?utf-8?B?akdGbVNYTTlMWGMwVnlINWovMUtnd3AzZGxXeFo0eWFBRDIxYW1GamRRcFl0?=
 =?utf-8?B?dUlnMEdwOU9PU1oyZ2V3RURwc3BXT3g2NlY2YUhzOEYya0NLOC9CWGg0R3U4?=
 =?utf-8?B?VHpzdTAzaXBrMWJGOHdTYld3VjJBdGIyRHFLUU40RGd5cy80ODdwZkNTU04z?=
 =?utf-8?B?aUJNcUJtbXpYSkVaa3ZYaXB2bE14eVdVbjUzeXJSQUhWQzFORnNXTWxsdEo4?=
 =?utf-8?B?YW80NmNJdGpMT1BSMkVsMW9qUWN4L3dGODdRNWtZK2M2Q0xBSzd3RUc4SGtT?=
 =?utf-8?B?OFJZZ3lTc2NuWnlnbHdkVUJZME1UelpyV1Zzc2M4UU50SXhFZE84MkRWa1Vw?=
 =?utf-8?B?SGgwSDlkTW0wZWZRT0l4NFlIS2s0UkdJR2pMWm82S3dwWmhRRzA2c0hBL2pP?=
 =?utf-8?B?anpqQ2haLytSM2o3aHI4YllBQzVqRVVYbzhtY3VFcmlMSytrWHRIVmJRQncx?=
 =?utf-8?B?OWE4SGxBdTZxaFhtd2hxVExFckFCdklnNkJhd0VFODlremtMWnlNTVRRQUhs?=
 =?utf-8?B?cmRRNWoyYjlvQ1pDKzZQai9lQUZmR2o2cUlTOG5YUGo5ZWtnOE1MYloxSDl5?=
 =?utf-8?B?RmozMjdHemF2Ry9rZ1ZPbytvSlREeTB2UFQycEhhOTBPWm02S0JUUEViWnFO?=
 =?utf-8?B?Zk84L0V5Y3c3NHh1Rm5vRTNVRXdkQno3em9ZQk41Q2lPZko5TThHKzIrZlBU?=
 =?utf-8?B?bW1kbnZMeEpFTnFVWHowY25mNVVROEhOM3IzTVdEMlVsM1FOdXlQTDlkaEht?=
 =?utf-8?B?N3RQYWFPK2xydVlmQzd4dGFNOTNVQWpQek1mMmN4RWxoSUJLUWRDRTd6MmNl?=
 =?utf-8?B?dk0vaUxhQUlxWThjZFNvTWFubGxISW9md25SWmhkUVl0ZFZPSm9zcFJXdGxu?=
 =?utf-8?B?alBSNUNQSWk2NWg1cW1rRjB5Nks3aEpLcXZ4bmswZG5lRzV5Yk5ENnR3UjJo?=
 =?utf-8?B?eDQ3MEZHaTNqSUNtVEpicFgwOXlWam5PQk9VMG8wUkNEbGszMFpQQXVnb3ZX?=
 =?utf-8?B?anhGRk50OURWTEFnZkRqbHRvYnRwNlErQm8vdE9RV0JrcDBTNkFTSTJTbmF2?=
 =?utf-8?B?YUxBdndFcWl1UGVtNjZBVFFyajlGNVYyOFRzWUE4T0kzdngxQmdqb051SUhh?=
 =?utf-8?B?VVllTlJzUXhKSzl4S0ZGK2FxQTZnZXJ0dTlCdEd0N255WVpySEFxV2lKbEU1?=
 =?utf-8?B?QW95QlM3Z0hQN3JXVW9KL2NBU01iWVBabUJLd1piU2d2anRONStYNS9yNWlD?=
 =?utf-8?B?RW9WL0pHRzdvSnFpN245aytoYy9YTVE1OEZ2YmtDMU10cC81aVR4RmhMR1hI?=
 =?utf-8?Q?OHI8ej?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 18:22:46.3900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdebf74a-d767-4491-ca31-08ddc495c379
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7613
X-Spam-Status: No, score=-3.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Enable i2c3 bus for telemetry fetching purpose.

Signed-off-by: Deepak Kodihalli <dkodihalli@nvidia.com>
Signed-off-by: Ed Tanous <etanous@nvidia.com>
Signed-off-by: Willie Thai <wthai@nvidia.com>
---
Changes v1 -> v2:
   - Fix unevaluated vcc-supply properties [Rob Herring]
---
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
index bd9395a194137ea70d184665ad6cb659541ef175..f0a18adc328759e290bc354ad8ef703f28c1ffe8 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
@@ -422,7 +422,7 @@ &i2c2 {
 
 // I2C4
 &i2c3 {
-	status = "disabled";
+	status = "okay";
 };
 
 // I2C5

-- 
2.25.1


