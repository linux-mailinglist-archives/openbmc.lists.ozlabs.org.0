Return-Path: <openbmc+bounces-363-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 567A5B07CCB
	for <lists+openbmc@lfdr.de>; Wed, 16 Jul 2025 20:23:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bj4DY6pfPz3bm3;
	Thu, 17 Jul 2025 04:23:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2408::618" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752690189;
	cv=pass; b=YJY3LMc8cOkQFSoFidU3kKgdTW7T+re/rp0sQCeXqt54j9jg+Y7/gVsLPN0NXA94TYhuPxWX4pafV7UFHD/eMYXjxvmA0U1dEkNKOLtnSdHKz0u+yiFj3N737r4YnA7RzFjLbVNiRKXuq47FgKtsTWkeuUor0zUSSRY+ATh7PsAvDJcgxZo5sBrZhdIM7XrAcWS2gKx/eaZhI95VkPwydll8aTv1b2odYiBrggX9AtzrmS94SQ7G47B+FHfsh8Uz43TkHrQqEVrIoozNACAuH8ISbfgGHNQmf76DcKipe1TvDrv2BDziDwt4Cc7CoH9TaLIDQL03dSSAWNHueXeHoA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752690189; c=relaxed/relaxed;
	bh=lWkWfZutqQT+qFOmLnfDTsBntwOP+JAXAYtZirayczQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=buF0z7oePFN8/eC3FEXpPHteKWeYyv572E8s3Xl3UePFMCA72ZR1aXnL9Z++p7ALqA/WbWvpcxNV8deSkz8Oyuqvp6pZ0S5FRsWcavoQGkgzWZg1YZnA5Qjd4VGyiLp2VxDBVAG1rCEjPpsuihpTydfdUNJA81QCsD2srK5r7Uw5OoBVSjy4vCBog1LBlRTBPnP7Jhxb+bw6LNblHQrrMgDNTW/nvqE8IzlhuucJjmwDCfmbhZYLEHP2Ur2LmZrPD52R7b4WVsr3HFRaUAgXozXOVWnWNVWe8XFxSFAd/shsznmFf5609RbqimclvlfL3G9gYyl6E8bVvDkEsvDb7Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Gr9CRyDz; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2408::618; helo=nam04-bn8-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Gr9CRyDz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2408::618; helo=nam04-bn8-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on20618.outbound.protection.outlook.com [IPv6:2a01:111:f403:2408::618])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bj4DY2Ypyz30Vb;
	Thu, 17 Jul 2025 04:23:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KDP0JMUTuooqONabtihGjWKD/JLRlNYeOe7fy12qnDF/zcVrpxyPEXTPNHS3bzkOWIqfUxZSGikHuxlz8fQpU/M0jQpDpdGvbxwyhC6Etow4tZa8mFO82fKkPHqnkzgn2AQ/Ue/Ij9YkkImkZ+be5IP8ohTdCanZqJ+gpyRhn15jy2C/ldAZrf6T29KVn3+k9L1ZbF2jJaH3LlA5hiSMgCJpwiKnTwNT1vbufmVVnp7NJ64vnxH6tqKa52Rf0PUJFhfasc2+SgIthxbkmV1PWQJgwpYszRHWFfcO5u57dGDEP3Fkh6gBAIZgnEKYo3MT5BKryUdF54FrKWJaNtasZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWkWfZutqQT+qFOmLnfDTsBntwOP+JAXAYtZirayczQ=;
 b=T0aQYBFdVJL1ANd8jbrD+nbhPXaUqGZ3jQ7JbqFSsZ+DR/m/izXmzY9h2RIzTcLEQ6KEOeKtcL/Meg2Iuuicp/lo06cmjAgliqwuo/elEHFqvHLMcFZh8ORV7ErGDRZm5KhccMZukMM0twYMg7SFOWgXbZLsdL5CIrpkIGZTzbS4izhROz803TZCoFHf+YteSIZocCc4tdks04qwHjIjrItXhh0ALCAekTL90948NZ1A9OE7HKw6LKVtjVpMhEnfEA8lcgOeu8dJrIWoNiCpThg+Kwxu+yhtcC+3TQ1b9QArzv0wXDnaUxvB8b+RrjkiuimAo+V95Tk62pJimE8YFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWkWfZutqQT+qFOmLnfDTsBntwOP+JAXAYtZirayczQ=;
 b=Gr9CRyDz8xAsxWx5d5Md2ULMJNJRk88S0YThIdlN/R7h8zi1LHIJgu90DZ5+NE77qnaspCxMrZ2u17qvVKx8WFnEWjsph+IBYZj95xsl+qhjnip5fpahO8pB3W4AUTyWm1wqmjhI9wLD0otRKQg3y4T1PVlpBBoPhHfO9ShiYDuEZCkMjEk6BmCxmuZBdD+bMfnadYEsLHPPzvPDtl1qY+j6W836yl7LQfu0A7+SteMIMrnI1fTLbdnCjwsIgwjX8m6j1lzrLfWm+r5RXMcxKPhWTvqc/j7lp9Xy/LPZNR6I0sEMQy0c65+hrXYOYetlq1LuIHaeauot+Zdj5m/VcQ==
Received: from BY3PR05CA0045.namprd05.prod.outlook.com (2603:10b6:a03:39b::20)
 by MN0PR12MB6198.namprd12.prod.outlook.com (2603:10b6:208:3c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Wed, 16 Jul
 2025 18:22:48 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::bc) by BY3PR05CA0045.outlook.office365.com
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
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 18:22:47 +0000
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
 Transport; Wed, 16 Jul 2025 11:22:30 -0700
From: Willie Thai <wthai@nvidia.com>
Date: Wed, 16 Jul 2025 18:21:57 +0000
Subject: [PATCH v2 3/4] ARM: dts: aspeed: nvidia: gb200nvl: Repurpose the
 HMC gpio pin
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
Message-ID: <20250716-update-gb200nvl-dts-for-new-hardware-v2-3-9a1a916f461d@nvidia.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752690148; l=1239;
 i=wthai@nvidia.com; s=20250525; h=from:subject:message-id;
 bh=U/hb94f62wDxLjqgv/eiUe31gOSf0eh/bOHZltRZM0M=;
 b=cq7KXjzfbD8N3bDaS+iutkJ2gIw9t+wrDSFGUrY7CNrC8hPQhh2rdEGboW1w+C9X2yhCJP9/w
 wmX9JHEEBJIB+4SXXeY+zisxTKFJItyokLTlLsU0KrhWUx9TfzrBcgs
X-Developer-Key: i=wthai@nvidia.com; a=ed25519;
 pk=i/6dxnUqKdr7Z6GA0KECRkwz5HX4RCiodw0v6kB9fbs=
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|MN0PR12MB6198:EE_
X-MS-Office365-Filtering-Correlation-Id: a79e7af0-e818-4762-e620-08ddc495c447
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NHNUcTQ0dzdqbVJDaTAyMGtLaEdwNWw4UGVMTXNZNTZOWGZsUitYMlo4WWpU?=
 =?utf-8?B?b1o3cHpGUDhBMlZVdTNVSHdYSHlGbUVHdFFnQUYwQitUYVYwWit2NXdDcytM?=
 =?utf-8?B?RjJ4azN4cXVMQjhqWFcxQUdPMFpjS0I4WEwrQnVka1FFTHRTRjk3QWI4WFo1?=
 =?utf-8?B?SExpWDBRcDFKQ2pnZFM4b0dBR3pFOHpnNjZvQll4TmlSMHNFREpjVG9teWRR?=
 =?utf-8?B?RytVV2pEK1RXN3dkNEtzNHc1RmJIR2V6T05DSGNmTTdFZ1BmTGxRTENsMXJ4?=
 =?utf-8?B?b2FYYW1TWWk3MlB3QzdMNmZ6d0oxVHBTd0Ftcy9jN0c0aHI5ODA0cUFiTXVy?=
 =?utf-8?B?ZzZhTTR3czZ4UjhvUmtoL2MvNm00Y0dlZ2k2cndtYi9ndmZmZ0w4T1VTVkk1?=
 =?utf-8?B?K0tMTTNZUmlPVmNLM1QyeGJpN2FJdDZpYUhDRnRLN0l4TjR6K01HOUdPOWJB?=
 =?utf-8?B?dGEvdHVEbXB6dDB6R2ZjZjRjNG56TTRsRnd1S3c2WVlGa3loTkcxV0FtUzAy?=
 =?utf-8?B?NEFXWlRpdzZ4TTVsTzMzdnF6T3B4RGl0a0JZYjZMMkY2Tkd0ZUFBcDI1UGJR?=
 =?utf-8?B?OHd0emZaOXhPaW1YUnRHRURBOEVZbHo4Q3RsbDJyL1JVY1loeC9tRlI0SWs4?=
 =?utf-8?B?UU9nUGwxa0xqbmNTbHY2ZmYyZ1A1bzJGamkwSzFWcnVLd2l1ZGE4eW5XTXFp?=
 =?utf-8?B?Y0dzMjBmbFozSkpnNy84eHUrcHZ6bC9tbkRkWkRVdkZKeklPelFEQ1BQOUp1?=
 =?utf-8?B?WndaOUcwekZMbFhyU2ozV2x2Mmp6UGhPY1UxNEVYdGp1bVJtMHI1R2QxMVJU?=
 =?utf-8?B?L0FIUWxGV1h0NytzblJ0VVpwWjk2YmFBdFYzMzAycEFSeHNSOHRDbDB0bDlj?=
 =?utf-8?B?MVoyZmpvNFlzd0JERjBxcWlKbjN1dnh1aU9OU2ZndUhqTEprSFl2c1JRNWdN?=
 =?utf-8?B?alZKYmFzbkZMYk43Q2NHRDd2TTVjU3k0OVd5SWFkUFJNY0FIaTBqM0JQSVNL?=
 =?utf-8?B?VHpYd3ZFNzRrQUR6SmdkcEREMGQwSFo4RWI5RENuemVuUUVuaUFLdDFNamJv?=
 =?utf-8?B?cldwZ3MvV0FlVTM1bW9hbjdtZUF1NzF4MlJ1RDJVVjhwRklhSzNzMFlVMlI0?=
 =?utf-8?B?UUVjWjc1YnZEUEczR1RQWlFTbm91NzdvamYrZUU1WHYzYXl5NWJJa3ZTcU1M?=
 =?utf-8?B?UHd2d0NyTGp5L1ZvTmZ1VmRQOFNEcVpza2ZsNkdwSjJ5VHVIWmFaU3ZFNzd2?=
 =?utf-8?B?bm1yN2prQXhXSVM4cm96Mk43Wm13Y2hYM1dVQWVUOEFBOEpoRmk4bHdTTWJ1?=
 =?utf-8?B?K1lNY0NVYTJSWU9aUVBpRHdNSXN4QmRKUmFxRmorQ0VLa1lTeTVYTEFtY1Ir?=
 =?utf-8?B?WkZxWkpGa25EclpKQTdNdmNsWmRQbWlJazhPWDhjL2xCeWYyd2lBWldPQ2ZN?=
 =?utf-8?B?S3JBdXB1S0VzTVNBei8xemVMbUdWaE5sd1Fta3lIL3kvK1hPQlBiNmpDWG92?=
 =?utf-8?B?dkhPU09oM041VVZ1MmV4QXQzZzFYeUdkR0I5ZHdLN3dEK2RzSmozMGxJcVB5?=
 =?utf-8?B?b0p2R0hzZEF5VFVYNlBtVTYvVndRZXhRdE5rajBHNWdnMXUvb2RwbUorcDB2?=
 =?utf-8?B?TkdPdTdiN1BpZy9ZRVNMazJPTWs0R2JHTndPWm9sQzVSd3BLWHpERldITXQ1?=
 =?utf-8?B?cW8vRFBPNU9PcWdCeVp4c1ZsTk9jekpuMFpYdkZCUzY2cWlQSmRQYjFIaXpn?=
 =?utf-8?B?YlVBU2VtaTJPS3dhSEIrV1RIVDZicUpnY2V0bWlFS21JNk1ZVW5GZXVlUCs0?=
 =?utf-8?B?VUFhT0dYbDR1azZFdHlwSlJFZm92anVVaXl2c1R5OHZFUFc0R2FzRUppOFFS?=
 =?utf-8?B?TWhBdk14MmhKeTEybGZpdlAxaHppODA1MjBlRHkxendadlBOQ1BCeHY2d2dY?=
 =?utf-8?B?TWxPTGdaMWUvMlcyb1BpSDY3U3o2MmlPaGVFT2RPeHlRUEpkRjhLdFZIcDBG?=
 =?utf-8?B?Yld4VURSWlhvQ3ZaR1BvZXhETnlhSkRxL2FEeFA2bjRqV0pMTzlKQ3ZYeUpn?=
 =?utf-8?Q?0Zu7It?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 18:22:47.7336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a79e7af0-e818-4762-e620-08ddc495c447
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6198
X-Spam-Status: No, score=-3.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Repurpose the HMC reset pin to FPGA reset pin.
This change is according to hardware change.

Signed-off-by: Deepak Kodihalli <dkodihalli@nvidia.com>
Signed-off-by: Ed Tanous <etanous@nvidia.com>
Signed-off-by: Willie Thai <wthai@nvidia.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
index f0a18adc328759e290bc354ad8ef703f28c1ffe8..dd2a02a6d1d40cd3fe99af83123a7a3a67149a69 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
@@ -1126,7 +1126,7 @@ &gpio0 {
 		/*J0-J7*/ "", "", "", "", "", "", "", "",
 		/*K0-K7*/ "", "", "", "", "", "", "", "",
 		/*L0-L7*/ "", "", "", "", "", "", "", "",
-		/*M0-M7*/ "PCIE_EP_RST_EN-O", "BMC_FRU_WP-O", "HMC_RESET_L-O", "STBY_POWER_EN-O",
+		/*M0-M7*/ "PCIE_EP_RST_EN-O", "BMC_FRU_WP-O", "FPGA_RST_L-O", "STBY_POWER_EN-O",
 					"STBY_POWER_PG-I", "PCIE_EP_RST_L-O", "", "",
 		/*N0-N7*/ "", "", "", "", "", "", "", "",
 		/*O0-O7*/ "", "", "", "", "", "", "", "",

-- 
2.25.1


