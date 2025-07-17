Return-Path: <openbmc+bounces-370-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E7CB089DD
	for <lists+openbmc@lfdr.de>; Thu, 17 Jul 2025 11:53:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjSsH39Smz3bm3;
	Thu, 17 Jul 2025 19:52:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2418::605" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752745971;
	cv=pass; b=FLz1vJRldwMF8KD0ojjM/ZJ4UOqehXCkRHeqqsu8nNp7XMylPwhHyxkCrQwOW7ENPUnVoDBildlDPEyydoFxnJU0/4dr6u/LLj/ZfCTlCoherba+w25FZMgJtUbek2wl1UVU/vOzMB2/HdP/rIbQWR7FsdP6M+Gh02jjJEplMf7PA9gEShsfZ5WzCcTOOJshW8yAD08kNvWvuEG6D4GVyhiMcnzaCzYVJ0iTYpCarr6MS2S2e5WANZV8xJxgq3qgrOZXMVQxp8cdCjkAxtyE2J9AlwSu1ntWBwwpozGtwOjpaksQzj618Mw2+p1w8fjsH4/f0zuRK6XlSy+2ou8YBg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752745971; c=relaxed/relaxed;
	bh=2XZEkZ8Nh7IJar+QLhbRsqhoZs1SudCLK65C/XokS+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cXrSPmT1yL2+SgOyRCnHX09PC8mzUsi/IqJbVsPaOB1IKoJTXsqpponbZeXDO01XBki5A0gMFrkpSJrKJ1KTqIIzwW6qN9wegJjKaubkaDRzUzPbABjp5oj8n//0TGikRxDb4gSK8RdtigyvG5+hz72a7UF4HpfD1Ii+Ex7ZsleiUjb2xr5j6zOVRI08P8Fjbpu13eIFHCDngd620+iXx57ogzPd+AxIPoM/6jq+6HeE9ST6p+a9cnBr7Kr5mOpWtZbEUZdQIcKpqapNrOepgAP1N9Z8gwevX6Lel9abEiFowyZQYFZjDsa7QqU3metrmIpXfEW3+uKhP06oCW/Ifw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ST3sa72W; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2418::605; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ST3sa72W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2418::605; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20605.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::605])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjSsG6QZdz2xlM;
	Thu, 17 Jul 2025 19:52:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sILXMPAQn+N3TCZ/S0bafujXXDDkLLzOke3H9Z0JRVY1mlax4ibEI1/qoCCXzJvDyqW++aSNydoF2yPgQrRcabbiso1OE1zdBU1JNA0KZmQX5F72OLHX8weREXHyNdLBtHyTH4CrgHfBYb0iU3XKuEWMjI5MxsJS8wdXx8uWhTuVtcHhbJasnAPQpV3sQzIZy/c+MFWTgmwzg/EAAIu3fwpS1xEnTgIdrxGizaJlZ1hEzmPjrqCDbVwJTzxp1NYhEz2vaoY53yHImqBqJ+3alYiG/V6w2LC/sFkO++KSN6OrPXV/zhm118h0Oa1tZ6vRBAvov6ukoUtPIglcQNzbpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XZEkZ8Nh7IJar+QLhbRsqhoZs1SudCLK65C/XokS+Y=;
 b=C75FJL6fyu5eGLN4Ao+v1vBtgwTF2b+KhOaqybNl2sGpggEpaP8sIfWi3AISy+a7X23VBDuhziSr5dr7CON+8L3f/1K28gQlqYHB6mJdNFY3mrVe1QG6q3hxiEooYv3oy3wQpt8wkf642jcIkLoYL9KqGO5eEdTkSBqT+ggjlJrTMO4Oc197sE9q1AdIQ+2MqhXrW16C3BW+gtipdt8vGtcb8ycyB8LDLZSVkRQT0ufI0Rm8952d9Z/wySPnNMwesNuK3FjscY3tfV5XUhjS3TuCulc4Vp+s5L7yEaM14Izo00hFNzQGqwizRPy+TPfaVtyLRHsY/0u+X5WL9ee2uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XZEkZ8Nh7IJar+QLhbRsqhoZs1SudCLK65C/XokS+Y=;
 b=ST3sa72WV27yCVYRS9zSzvUMf95DTrVWobW0WDfNr3JjMpT5Iv3K2zmz6ge0f2RAMxGnxgnPsMzU6FtAJL8QtMdmIx4XfAXar5AL2qB9k2mXL6mFrFqpl+Zzgwhzsz+4iKT6VVwgX9LEN7caVqO0WwrDjUj34W/JvkElHfFEc0ied/ulCdNKsm6QDZIcPzCdF2anhth906KoVEnu2PzSleMbN9yKBmpZCRNBozVYMploN+LKRakn9vLJBEaqECHeeeH/ZuuSFhw60lEn7tHMCIIM5DciqPi4Vzyelgb0+BxqxHo1c8P7UMJb78O9RIFRy4C9DNg3+8YCjzCO1dGtbw==
Received: from SJ0PR03CA0256.namprd03.prod.outlook.com (2603:10b6:a03:3a0::21)
 by MN2PR12MB4285.namprd12.prod.outlook.com (2603:10b6:208:1d7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 09:52:29 +0000
Received: from SJ1PEPF000023D6.namprd21.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::58) by SJ0PR03CA0256.outlook.office365.com
 (2603:10b6:a03:3a0::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.21 via Frontend Transport; Thu,
 17 Jul 2025 09:52:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000023D6.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.1 via Frontend Transport; Thu, 17 Jul 2025 09:52:28 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Jul
 2025 02:52:15 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 17 Jul
 2025 02:52:15 -0700
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 17 Jul 2025 02:52:14 -0700
From: Willie Thai <wthai@nvidia.com>
Date: Thu, 17 Jul 2025 09:52:11 +0000
Subject: [PATCH v3 2/4] ARM: dts: aspeed: nvidia: gb200nvl: Enable i2c3 bus
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
Message-ID: <20250717-update-gb200nvl-dts-for-new-hardware-v3-2-f28145c55c98@nvidia.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752745932; l=909;
 i=wthai@nvidia.com; s=20250525; h=from:subject:message-id;
 bh=E5CvWtfedBNindT75YTTq7hmXgdKy6ZDH+6awigFKQg=;
 b=Uar3UuJLC2Zp4TgbWQ3ojDU+3vhoAr5EQvHl4GdU+xSW3LjvsIttrQZCrKnOzRG2JHr9VJRuR
 Ynx/mTQn2nbBCjnDFVK/4EgOVvzAyA5DYWNBzNUgbZiKysP+dcxdb18
X-Developer-Key: i=wthai@nvidia.com; a=ed25519;
 pk=i/6dxnUqKdr7Z6GA0KECRkwz5HX4RCiodw0v6kB9fbs=
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D6:EE_|MN2PR12MB4285:EE_
X-MS-Office365-Filtering-Correlation-Id: 9117d6b2-2bac-4e00-568e-08ddc517a439
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qng0TXBNckFyLzFOeTdRbzA4SUp4Ly9acmVKRWk2QTFsbGJUbGFrdURCVDVw?=
 =?utf-8?B?b2hkYmNlSHJQMFFLZmFNZStQaTFHY2g2UFRxSCt5am9HbjdQMmVnN1VaZmxa?=
 =?utf-8?B?N0Fad3ppWCt2WE1EK203aVpsVHg1QzRJMEhNSURsdXBwZUo5Y25tWmROWWZk?=
 =?utf-8?B?SXY2ZWdubHd4aUtVVUM5N0dVM0ZPbWtRU29aUXRuTXpRSnRaU2NWcEtMc3cw?=
 =?utf-8?B?R2tBd1djbmZWOEkxZktIcVE0Qmg2eXUrZjZLMXVVYUU1bmFxR1VTMklnWW9h?=
 =?utf-8?B?VS9UUDVLUWFBYWNSV3ErSFhzMnVqdWJnYUlaWEhBOGQ0YzRiQnhyb2x2Tnlu?=
 =?utf-8?B?TFVkN1d6UUVad2Qyd0FZYVRGOE9BNWpneGIzTjJCaVgrc3J2eWRRZlJhMTFE?=
 =?utf-8?B?VTBxUzdqMk9vVDdFZTNaU3lLeU9JODJKa1NkaVZuaVhBdzdoMi9XVUkrbVdG?=
 =?utf-8?B?Nlhua1p3aGRuQTVzYUFaZnYyMU5rS3M0ZFhVUmc1TTYyUUQzZzltZXRDQVN0?=
 =?utf-8?B?alRYZmNBWmllWG9SZm5rc2tVV1diSFhoMHhiUzhoejM0Q09JRGxJVnprakJy?=
 =?utf-8?B?cXh4ei90Ri96cWpmRnRaRWdLK1c3V2hCZHhEeHJidy80clFQZlhubGQxZEJX?=
 =?utf-8?B?UFdsTERVTnF6NUFuYnMvM1lvaFVXS2xQMzRmd3ZvekRKQ1pCL3hFcEpFQ2F5?=
 =?utf-8?B?dm9tcW9GUURUeFRaUllMZldYbFQxOVk1enVTUGh0dmN3T0VpaTFVMGxwdVVl?=
 =?utf-8?B?c1AvZjNLSlJHRlFxdDZPbnB6eFJtVy9vOUxTNUQxQklrNUcvSE1reG84NUMv?=
 =?utf-8?B?c1hTL1RuOFgyemZDdmRWc3JncURFU1NWamxuSDVaY0Y0WXJ0dk8vUUpzKzdx?=
 =?utf-8?B?M3pOcUJrL3ZyTEhwSXl6Q0JxRDVLWkt2cVp1c0ZVeExxVkFsK3JNeC84Vnlz?=
 =?utf-8?B?dE1KT3B3OUVYRTZGYXBmT01VV0JoaWYwQnpsLytCYzBZbkdyWXdiSXJuR05C?=
 =?utf-8?B?akVSbk5HRzRXUGRwZk9WaWNHd0hVaXF1WUpWc21VblV2QmRxS0xjY05hbkVM?=
 =?utf-8?B?YVpmRjN5bkttY0E3aHNHY2Zta3V5NlhiKzFCcDZkRjZWVm1kVERDY1o4ejJw?=
 =?utf-8?B?NGxCelJCWDZTMGpiOUF2MVVhcVlCNWZzaXBBbnlUclg2QXk5dWlJWGhCdEov?=
 =?utf-8?B?OTBjK2UxM25WT1Fka2ZjQXpDVUlxL1VYL3RibXY5UmFrcFZkZTVqem4vcEph?=
 =?utf-8?B?RktVNTFySm5oN2VJdCtUQXd5V29NMTEyb3VQM0JvZWNxWGlsR0VGNUUzbmJp?=
 =?utf-8?B?V2VSOXJKRHlwbCt2U2ZEQkV5K0ZLMk41Y0todllpbnFGY1ZGWDVWWTFtY0xk?=
 =?utf-8?B?TzNqZEtYSjE3QXpTcXNDeWpRNDljazhMMEhjeUVnci9yekZubXJNb3lqc0k1?=
 =?utf-8?B?WEJYMWxERVJxK0hEK2dNVXRuaUtucm1vN3NIMGVDMzdRRWszZG9IY2Y1Q1lQ?=
 =?utf-8?B?RnNwUnVMQWR1QWQ2WE9nWW9mYkl2YVpsT3BSTXpEWHZERTF3SEExYnRHWXhJ?=
 =?utf-8?B?RkxHajRKSWhZZGpzUCtzei9JNmR2Rkl3RkZ1dGw0cWEwTVpsU0hGRW90UTZn?=
 =?utf-8?B?VnhyUzNWUUJ5U0hSWVI1a3N2Y0hSa3haTEVKTUtwRlhDR1NHWlNka0VDSzNz?=
 =?utf-8?B?aGVoQVRVYmtUQTV6RlQ5Wnp2Y2Z0RGZmL1g4OTFoYzVUUzJQZG9rVjVIcmV3?=
 =?utf-8?B?Y1hPTCtkd1VpSzRqRW9Ea1dPL1VCeXIzOC8xL3lOYmgzTXpmT3hUV1VLeHlu?=
 =?utf-8?B?b1I3RkxXZDRXbVZQRmtiUjJYdXdsUlppTkdaclh6ZzUxZzd2Y1QxYVJQamw5?=
 =?utf-8?B?cVdLa2JySmdybitubTV2RmhDdms0TTdPcmI2QTczd3BiMnAzYnZqRnY4ZE9V?=
 =?utf-8?B?Mm9mTEhMc1lvWmtac1EwakhvOWxJVUQ1VE91Q3FCTGlCU0tWWGQ5dm83M0Ny?=
 =?utf-8?B?Y09wR1c3L1BPNFp6TjhoMDRGeUYrZDh5RDcxMGhIZ3EwbmFvdUtXRVo3Mmo5?=
 =?utf-8?Q?ziobhC?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 09:52:28.6135
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9117d6b2-2bac-4e00-568e-08ddc517a439
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4285
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


