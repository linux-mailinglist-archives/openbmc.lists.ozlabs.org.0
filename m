Return-Path: <openbmc+bounces-507-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2A9B323A8
	for <lists+openbmc@lfdr.de>; Fri, 22 Aug 2025 22:39:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7sVD0Sf9z3d3Z;
	Sat, 23 Aug 2025 06:39:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2407::62e" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755895140;
	cv=pass; b=PjBkxychKDx5Op/RReyJGjqsbcBhedo0v+4p+YJL2ipGyCbo19/Hmkt4pgGfBF6PvIhEufQTs2S5fQfrNN4tFRKufWXJ0FOYVMBjFc910bmBnC0TjVwGBe6g6zDHj43IzvX/UOLoSEIozzz2D40Xzae7fhSkpfJ+1K+U9YkEVkEth9m4y2TJy+ye6LznPR54OoS3YJHFHVfWfCM3B64xj2weMXTOf2SDS/LqWM01VNFyK3w/sK3jFpm0ZX2+0MmV2mHqKV0ZHcbY1oRwkxnbnXv72pq+m7168jwWqqUc7PGgxKkeB2PZZuqrsxqseI27fcQuyZRk13ckLybYMjNzDw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755895140; c=relaxed/relaxed;
	bh=Iv3t8qmzbDydYifsD/57ErrI25TQdHA3hw8wwHIlhmw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JA9LJlJdcrOREq7u42HQ9O97rArJ7xuHwURMmeY4V1x4ibzRsVPH6Cpqkp8YRJCVoHqHU2GDSTs9zkIl1edyUbcY2seIJRGOO04C8ui5EX7BWgrpARQndsTDgbzKF6zSQP1P9AKMiooXl//oct4xoV+I68j82tk8/Sj5u1+gEfeCkcoQUk3nf3QebW5sliTPxk4fzCGzfDskH/WPNjpR9x80sWerolvPzLk7C1ZGgqtQax5MOQxCcS1mzNioaIZA8rcwMOfZZx6X3hVvP8llw273gxgVGj1KEjniBS0xFio9P4qyjJPKoqbEdkJJLQpOLBoVYU6u8zyo6rvUtLKXOg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SByH/lwz; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2407::62e; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SByH/lwz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2407::62e; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2062e.outbound.protection.outlook.com [IPv6:2a01:111:f403:2407::62e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7sVC3Y0Mz3cnS;
	Sat, 23 Aug 2025 06:38:59 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gp15KQaOTYD2lF+oCxss9zK5n9P7swqtR2iUHXpqTTeaW1kVNWr4gxzLQMBd7zxpbY1Fpoy5Jww0mPdw7N/0gkK5TMSATSR9uP0MvAXZpNIhDK7kqNIsp+6eVnAGTWiUFDTlWG8m28ECHn4wG4roj5+H99FeRSjiKQN1t3kKQdNhXnzUjaRUlh/5/Vy176fG4cyt7jepLBNhM82tskbM0FUHVHyWXcbcqB92FZ22bvlWTFLOYMrQnses/HDc1T+6okgc545dfLdSp1Q6m5TD+oh104lrAOAnwuPBXXvmKN4CvMwBPDyawxayppqYU4IMFgQWxMzTOx+tVppnbbWY8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iv3t8qmzbDydYifsD/57ErrI25TQdHA3hw8wwHIlhmw=;
 b=DplKQcT0f6eUeeNzr228fGxMDsqArGuSiOscMPNc5BqIXVrkeLbucyK1dTWl9UeVNfkxkJFgHmOsA07PzvZbi5PuxVEtFvWbQeOHaRqIBEagF8pgsf5aARUhgEyUirRphWZvkZtjvle2gIz6q67yBza/HKOhYRa4DM2JW2AYJXWkdITI/dfwOLn2U+uFZujBERXeC927lI2UMW/hlrJDs42EfR7x4HLYirBw0UGKyy2bJWIBLIcgFvUAEWfsW1aq7Y4+Mgd/2lZqsTA/THtqtVnnP58FT82uaO4kTLK8XzeQYjQWwbvK9eS9CEIS8Md9WjsdV5VYb8dx+qX9p04QvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iv3t8qmzbDydYifsD/57ErrI25TQdHA3hw8wwHIlhmw=;
 b=SByH/lwzEEhI1vxkYMGDEQrzWvWQeO9WHtXhIIi8DX+ZwWolq3128SCo+ng1mmxpTejypoHzuLWrQkaWJ7dIzIhMI9hoian+GV+tY3fKJqP3SS3p1CdOyMYkQiVOReiPL9TlJncqxrP9t/t5xVbMrI8wJGS74btVGtK/Mo201g6MDX1RWUKJWeMdaNWLpUX6l0lN11uQ3V35SVL92yus271LqfJHFI67uSuI2E9gz18/dEVwFAf6z1eKMuD2ZqTF6q9+WQQ7Izaot6TPfG6h5DNk9zSoqOFozNKxxDRq+oCaH2V5xHOibI9iE1Y8WknpneFGg33ZnhE+9Mtas/L/Mg==
Received: from DM6PR11CA0006.namprd11.prod.outlook.com (2603:10b6:5:190::19)
 by IA1PR12MB7687.namprd12.prod.outlook.com (2603:10b6:208:421::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Fri, 22 Aug
 2025 20:38:37 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:5:190:cafe::51) by DM6PR11CA0006.outlook.office365.com
 (2603:10b6:5:190::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.19 via Frontend Transport; Fri,
 22 Aug 2025 20:38:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 20:38:36 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 22 Aug
 2025 13:38:21 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 22 Aug
 2025 13:38:21 -0700
Received: from dondevbox.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 22 Aug 2025 13:38:20 -0700
From: Donald Shannon <donalds@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<donalds@nvidia.com>
CC: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <etanous@nvidia.com>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: aspeed: Add NVIDIA VR144NVL board
Date: Fri, 22 Aug 2025 13:38:17 -0700
Message-ID: <20250822203818.4062595-2-donalds@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250822203818.4062595-1-donalds@nvidia.com>
References: <20250822203818.4062595-1-donalds@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|IA1PR12MB7687:EE_
X-MS-Office365-Filtering-Correlation-Id: 346f5b9e-870e-47b6-b713-08dde1bbdec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ThCyFWHo6KGhM8yP5UKmALBvQwctWIjy71l+o+xOqUJ/nk2xvXaPEzhvroHv?=
 =?us-ascii?Q?2JZ5m+d9b2jf+3eQGaiEvMCWYkOB3w46U7/3ibQgO7ypM+VNLgaSJ3NcoD+M?=
 =?us-ascii?Q?MvUkWWlwnsTJfX/KIysfHMBXmZQEoFR29LXuOLO8taJ3wPvgOVHRQRrRvoPv?=
 =?us-ascii?Q?74Cl75WAD4D6Tigc+mWretiFsYJ1h7iXu+zI644Tk9TFfqbl/AfLjOHN57Wb?=
 =?us-ascii?Q?/5pJksWmio8fU8Sux9iHBw49/1EsaL5tF+2ei96/gopQLuiDJxfHYeNvHKCa?=
 =?us-ascii?Q?n7f00ZgOeqtxX5A1st6KndTjjs31Ecb1/v2ocog+3rXmUKGt0Gf8Mu2QlqoF?=
 =?us-ascii?Q?XQNHAQ3/SqjX4XA3Ltt83oKqKDpLMVQ0Q6/fKDMUK2eMIuK7C2zlFPYlXXuY?=
 =?us-ascii?Q?/GNAFe2DMjY1qahndTOa5tbwjZh8KRcUqIWhBqgGu4KCn9no+4TOXuTGNkki?=
 =?us-ascii?Q?QeFqEPp5bks5ig9SGycVO6t7CK00e97jF3ZTV5kcMrv7K7VcM2xL8jdCC7wy?=
 =?us-ascii?Q?IWHSj5rQVjtJnwRDHPp3KB6npTjn+e5rXa/TgoL18EWFdy/6KkH2iNZ7ERVC?=
 =?us-ascii?Q?2+k9ZKPHlR9f4sNyFxX/ffZ+IO+kZSwEqUfeopOumHOPQntCO0GqaMQAL/g8?=
 =?us-ascii?Q?+/n+WvvZ6luQzdN7EWv0Duz7YYvBHRok1kdBiTm80lfszAgXC/OeD+de/bhZ?=
 =?us-ascii?Q?yzyrECOQqKBGE8aCB3JvJ7uJtojbuZHnwZg5ekIYkBHdpYFm/fIQ7UDHEcxD?=
 =?us-ascii?Q?N9vqeeABZU6PbMnNXPWqeSma8ehZ6tVpR0I4rfrxWLh9utSpjMi4LFdmHr3y?=
 =?us-ascii?Q?3OPY6llp9OGQU0d6A/CwOmZTJkjU0q5gPWdV701jnTe5WgwbHR0iVNhxeSuV?=
 =?us-ascii?Q?SBrvx69bsRsbQVlsWCZy/mpo4xND10AFUgRcSgXU0YZiZzBzTJEYg/qkjoBk?=
 =?us-ascii?Q?ilsyR+1Nqt1dfTKGGPOsMF2FqxJbcQUr/Fzy3sS6TPjgncJoVtDr7ftWk1qm?=
 =?us-ascii?Q?gfEN4/H0bIJ1LM8QxuQ5bRsSH0djfAKg/eiR5H39zf1CynSnlNCwRlvOHMFL?=
 =?us-ascii?Q?3Gc7u2LhftMsxFZ8Br8qse0K81MUezJfNdHK0SOG+qEKazp/8bdwAfcB6BRs?=
 =?us-ascii?Q?LgdMVumZWJjemX2P7Mf48fNKfDjhNLiZI7spTsHz9EfFAdu6FdNHW1lSPAvc?=
 =?us-ascii?Q?Nx9IbGiLpsJ1aKRWhkOHT6Jj+SUlABD7dG2Lj34br8U0ZQzmstPasZOFsUAp?=
 =?us-ascii?Q?iOUcsd/g+st4FjuVzZ3IhjdaxYdm2sVMb7xch0adtD2/zMlADBy0dDiUFK6w?=
 =?us-ascii?Q?WeEyKOFJjVbFPz5pHcwwKXtXbCeMnkjiZF0+pZRLGHjCz7e0LKCx0ZnSul9p?=
 =?us-ascii?Q?cAnC++wmMFy9T1EvIzJ7Y3CI1wUI4IAZXSmV7JPaUjUdLaLvQeJqrF3/tHrP?=
 =?us-ascii?Q?I6oQwgkEX3XCb9mFs538le62NXryYLAv9A18ExFmh3gXJooui7dsuGccMH51?=
 =?us-ascii?Q?EXFk7zqmShWMKP2KAnQxsV0kvI6pujzegZ+C?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 20:38:36.7098
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 346f5b9e-870e-47b6-b713-08dde1bbdec3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7687
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

Signed-off-by: Donald Shannon <donalds@nvidia.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes v1 -> v2:
  - Received Acked-by from Conor Dooley
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index b3c9d3310d57..11e17e9ef15f 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -103,6 +103,7 @@ properties:
               - inventec,transformer-bmc
               - jabil,rbp-bmc
               - nvidia,gb200nvl-bmc
+              - nvidia,vr144nvl-bmc
               - qcom,dc-scm-v1-bmc
               - quanta,s6q-bmc
               - ufispace,ncplite-bmc
-- 
2.43.0


