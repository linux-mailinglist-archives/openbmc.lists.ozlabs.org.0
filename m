Return-Path: <openbmc+bounces-371-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0421B089DE
	for <lists+openbmc@lfdr.de>; Thu, 17 Jul 2025 11:53:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjSsJ0br7z2xlM;
	Thu, 17 Jul 2025 19:52:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2412::619" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752745972;
	cv=pass; b=VFGHatIvu9EXJ+N5SspKHH1mJLtx9Ke3fzZ9Nc3wjE55U0En1hFv11f2Zq9HaVHHVs1jiYLcmBU5mD0k3IGyz2uCIwODtQvXZ50C4rK0um5Z+CqtG0i/voYaj0uhGWqAFyHOCwBcs5f9wV0S3r3L4qs+FLaJjX4vF2O1338IArTSuxcn0Fx7idBYRy/Xrs43LTphZUsYE7Dhatqt9sI7CVbl00MBPrIyLS9QFnopPAsNTfLtZusyrTGqpastCqvKPk9f5mAfqfkzz1p1IbuWfjt/j3CLD1NIJfGK/qgRVPQJugNQWPJLVKWHaVjrjZdJ+8B8F3Re7icaY1z/sIuy6A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752745972; c=relaxed/relaxed;
	bh=lWkWfZutqQT+qFOmLnfDTsBntwOP+JAXAYtZirayczQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=C+5b4V6veaJPh7ZI2CKNBJPmupU2tun60xsX1KQj3KKOki/XhgSIo1mVJzTbFOKGie3o7JJA0zkXqJ5j7enJ+kFGF0rabKkCOHXPSGSNhFW8QVXsFkGFFpeKNB8waBPooAvE9sn6ftAhWPO9sUBxeKQvey8VUmWFDT/HN5yC2rSnnXsNgM1We+q0MAr5nSzxOCDZzL/nAajPjhmc91HceJvot78UOuvZlNg/9sW0o9DOjbkSPM1d1iK5RmEj6NOdNGkgv5fiWXPkmCL7tEtJwGzYklgX0Z59poqH8myW07JCGsH/zjr9iGZJEg0iDAOABq/5NZfy5JnDpZc3Y59saQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Ol8jBQJY; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2412::619; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Ol8jBQJY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2412::619; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20619.outbound.protection.outlook.com [IPv6:2a01:111:f403:2412::619])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjSsH2K7Kz3blc;
	Thu, 17 Jul 2025 19:52:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wSwIF33Azqc/uWsnARaCZSsKfM94euH7u87sEAN+/JVIguXXVFmGY4dBO0frodtOf9dpmTKZtj3wJnCqsvT+STGgeydkzRPp1pJboMAvEhJeduZj/GdORrcU+OmJOXezx410rafAtj4Cx5URtyK+xW1aFyziygk80VRfHpQZ4VhuLfBq6eTHPkJ8bMdas7azLzbsCdZP1b6te33CW1vrX6ocgRxCKGOFhMpqtExYNLwYo6HRpjSSXmlrTxNnQ57VDVpaLnsWYawzF70IFAKeLnRzS/INk930efG7jACX8J0/3BtU5J07Bw5A7e4FcCDr37XTD1RWQKRmjFdmbsXcnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWkWfZutqQT+qFOmLnfDTsBntwOP+JAXAYtZirayczQ=;
 b=UduddTQxVenMwUAlvM5TzxhCQvWI97HVrZ/MhT2F3znAE0XpigN6b+FORLGedc9GQX/vOcNEgoQ+AFvwejc8dTR6/ArDbr+sfn5oi/dUx/n35TezZkHKjNTYVjIMe9mP7dpkZ9KAKWgYPkLcnIYPO7M0a4h0DpoGVASl9ehvrV+d9WhgfILETtY77H9DHshDeCEq/KL3wlYkPgfUwUaOn+ddtUe4c7PEo3OWGZBYcFU2ZpJ5Y07+I2Uw3gICyNr6TFXQBhmqbFfTuZhXbA9j0pnX+B0S1nvV2QNYQQqepJ2qz608BQpql0Yl0QgBk4f7Yzzz2JqdR/v1IOohhSoyTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWkWfZutqQT+qFOmLnfDTsBntwOP+JAXAYtZirayczQ=;
 b=Ol8jBQJY61rbL3/2Ut/woJST1DArATxEbicoM28ki65g/Jnw/HuMcSvkMxqprFgQR5SsM8K2meH9LHKd/XYSBgijx6T4yFGGD8T2+f61Z488cPy/WETZDpwEkGkpaVRF8AVJHxsn6oDZs71qbnkIoQJ5enBuvZClKkkwM89s2A5GOuvPc5LdwV1G20QE6miNhjDoX9lmkHxr6RQHFkbi8PnK3UzG+Kt7KTs1deKfq1/KfI1/Lf8K3kQFhOhYHUtjN1YfcBhTKU3zUGp0UZ5t1vfs/5RgVDpsZUtuE+EqsublTlADi/Qn7LbRnyp792/JRrvK/PqlWIMloflBQ7wz3g==
Received: from PH7P220CA0144.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::6)
 by IA1PR12MB8222.namprd12.prod.outlook.com (2603:10b6:208:3f2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 09:52:30 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2603:10b6:510:327:cafe::44) by PH7P220CA0144.outlook.office365.com
 (2603:10b6:510:327::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Thu,
 17 Jul 2025 09:52:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.1 via Frontend Transport; Thu, 17 Jul 2025 09:52:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Jul
 2025 02:52:16 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 17 Jul
 2025 02:52:16 -0700
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 17 Jul 2025 02:52:15 -0700
From: Willie Thai <wthai@nvidia.com>
Date: Thu, 17 Jul 2025 09:52:12 +0000
Subject: [PATCH v3 3/4] ARM: dts: aspeed: nvidia: gb200nvl: Repurpose the
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
Message-ID: <20250717-update-gb200nvl-dts-for-new-hardware-v3-3-f28145c55c98@nvidia.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752745932; l=1239;
 i=wthai@nvidia.com; s=20250525; h=from:subject:message-id;
 bh=U/hb94f62wDxLjqgv/eiUe31gOSf0eh/bOHZltRZM0M=;
 b=FXoomwwWVGvik6ljjvPf4mK+4Yk9TIiVos/6OzWcPgizzoslnAbepGN5uxABVHrDTPj8H2ygp
 CwvrjSgXnpHCNJMsKB9fxA8COwJQe0BVc3gn+mUpwll1z1v2xfXE+vM
X-Developer-Key: i=wthai@nvidia.com; a=ed25519;
 pk=i/6dxnUqKdr7Z6GA0KECRkwz5HX4RCiodw0v6kB9fbs=
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|IA1PR12MB8222:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e81d7ba-95de-4e9e-e15b-08ddc517a51e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MUVBWkdHVitaeDZZZFN5VUFDTnhWV0w5bk44RlNPSDIweXhKUzVrL0svaHRT?=
 =?utf-8?B?bkhKTDJEQWx2WUZHNVlXbXBIM0dlc096YU1wcURrcTREcjY1Z0NET0J6NDVW?=
 =?utf-8?B?cHZHd1BhUlRLdFBDZDVFMTJpU1RwQ2QyckJKRnFUNHlLV0Z6Q0tqOUU4UDJY?=
 =?utf-8?B?dDVyNGVESW92UXFyc0JVaDRxS2Z4eUJDdE45ZXBiU0xBeTAxdWdjTUdpZW5t?=
 =?utf-8?B?TXBrRTY0MHgrMGZudjhmSFRQenlaTHpqZjNVU3phRXVyMmJxY2NTZ1dmM0Rw?=
 =?utf-8?B?TlZFa0I1YTRtTkVOR0l2MEpLRXFycHRBQy9mK045aHJPcWQ2NDJNYnVXNURa?=
 =?utf-8?B?ZERZVzQ0NXYyRndSKzdZNFZuWERMZFNzM3crK3dRQ0JvaU9MOXlvVGxMYXYr?=
 =?utf-8?B?OHA0NTY4blNxaitrWFVqUWR0azk0M1h2a0Rlcms3Y1Y1NDlFV2UrTUgvRFlT?=
 =?utf-8?B?L2UxUW54WWhObHF5WFl3Q1hTR0pnNFR6NWU4cWdsYUp4U043MWN3aVBFSGF2?=
 =?utf-8?B?NXNkc1M2bmVMNksyUW9JdHRLRmV5WFB1T01xQTFBVTlUdDd1a0xoSTMwTkRI?=
 =?utf-8?B?YmxPUnZjclpuaksxSE04c2pTbEEwS0lWdDRWakVkd3VzOGlwL0VQNFdraGNL?=
 =?utf-8?B?U1lwNm1ocy9NZ0xlU3BMOW03YVFDenAybm1WYTlJYVNpK0FFY3RuTlp1WGxE?=
 =?utf-8?B?OTEwSlNqblFJbmJWSmpIYmpxWnlEWXlZajg0aFJ1cmxLcE1yN1hqeWEvOUU4?=
 =?utf-8?B?WW5oRGFpS2ZLRWg5emZTTnE4RytNUFJ3a29sVDFCVHlrc0tXaTY3bTIxSEtt?=
 =?utf-8?B?RnphODFKTUtKejFlWExBbGUyQ243R1o4c3hUQ0U0YXdDb1BBREdhajBpZXBS?=
 =?utf-8?B?WXQreXFnV1NKbGtMUHFjeUJJdVd2Nzc2dzFpM1dMeU55QUM5ZnV4Rmp5cTBl?=
 =?utf-8?B?bVVoV3BpYnladDZ2dmEwTnRaSVg3QjZUWTNCK3lTQmd6Uy9obmpYWmdHM2tz?=
 =?utf-8?B?WlN2bzVPQUE3ZTlMWHBOdTliUmYxM254d3pCbEYxME5vK3RTeXNnOU9qRERJ?=
 =?utf-8?B?NDE0dWZ5dnNJRWR2LzNGQi9Jd2FRNkp5RDlqNWVQb3dKejByTVpia0k2RmdI?=
 =?utf-8?B?T3dDOTJYM1cvZ3BOdkdXc0YxYnZIaVlHQTZPSGlQTzBBS0xtRWdRTUFrc3Uw?=
 =?utf-8?B?dmNjL2V2STBtbnRjMGU1VzhPQjZ1bkZFNXlwNkwxck5YZWNiVXpyL1lnSklj?=
 =?utf-8?B?bk9yUE0zT1Q2anppcHpCQXZzemNtV0ZNS3VJaS95czJHd3R1WkgweGMzSU1G?=
 =?utf-8?B?OHIrNkRoN3RFc0ZNM1YreEhaaE5NdkIvQVdvRVUvOUVvcmdyN1VlUG1OeSs1?=
 =?utf-8?B?TG5aTUJLMXBZdlY2M3pRTDY0aXVRdkx5Vm56djBDRzh6dFN0U0owc01PSHpW?=
 =?utf-8?B?eDcvMHNUY2ZhMHhVZlZ6MThrL2ZmQ0FBSlQxd2E4d002RE9DM0xzMUJCdGR4?=
 =?utf-8?B?c1lwUjc1L0xtaXF1VHR3QjFZNWJqNXpUM1ljWFpqdkkwMk9vYzIwOEVBOGxQ?=
 =?utf-8?B?Sjl6SXc0VkQvR0ZBWmY0Z0xFbFNNNjFKM21hNnU1Qk1ScmZYeFljWnVQYWw1?=
 =?utf-8?B?Tm9uZHRWMUM4MGJqc1hjdXpMdmFxV2hUWkRSeVgwMVdsSWFyL2xSdWZobmJm?=
 =?utf-8?B?dGc3NGtIWG9SNlUyOG1zUElUSzlXU1NhbFJRNFg4TEc1UUpkSnlBVDJJY3o0?=
 =?utf-8?B?S1VKbUE1ZmsySVJ3c3JUZDhPalU0TEhlZWRtSEpIQllkRmRBbmZVMUJrMjFP?=
 =?utf-8?B?dVFqaDZsSkx5STZqbjRjNGhXc0xWSFF0RTNQOW1VQ21lcSsyL0JSbldTeHZQ?=
 =?utf-8?B?OHNobW1RRmJoWXhzY21oaHplZU83WU1KdFRkRkVIbEtZbWtIT21uVXViYkFK?=
 =?utf-8?B?S2dON3RSbzBac0dGT0NzdVVYNlpWaHZBdWd6anZlWHRvbStlcnNqNXRpQ0Vm?=
 =?utf-8?B?UnM2NGE2Nlp0bjFWaWhpR0g5YThhamV6Q0FUVlZTUXczcndSTUJyVDlVdUZG?=
 =?utf-8?Q?nNqyuF?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 09:52:30.1379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e81d7ba-95de-4e9e-e15b-08ddc517a51e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8222
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


