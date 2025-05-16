Return-Path: <openbmc+bounces-52-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC41ABA324
	for <lists+openbmc@lfdr.de>; Fri, 16 May 2025 20:48:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZzbgF1hC8z3bcW;
	Sat, 17 May 2025 04:47:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2406::600" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747421273;
	cv=pass; b=kZznmWt/sgBb6B6FhU3zlvV+OaSbk5cUxfrfeC1qZWuEHpm5W+CUBCrNL2FvLhl39f0KLUdhrOzG68rBe3DZ+KEkWAaU8YvwOetnXE+3+v1HjWnqTwUhMkhkiOSmzEmmM6VcRcUnM27l/G8FQz/i0+eq/ZlZvRSL4ZJsJVmMXJqI4Gy0lW2vrlNmmcsFM2EaRpC4k/ptYpbIokkzDFRW7ISt7XCyu/+1y8zoPBnAd/IFW8PFsqlh4jjJjXt2OBaOb/vohrp3msqmq+jXdRdNExL90XA2UNsabhIjJsgb7pyamZ1JyehAGgPWUDeAyCrISEXLO77J12L2H+UMLJjTsw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747421273; c=relaxed/relaxed;
	bh=OJTcussDaopJiuyrUJnZZ5ffRpwRuVEZZ0g2Y9nJAQU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J25aSBixO7zVuDb8/ZCGs5oeCddPKaeRH57lWbgwOBcpauqEebczYI68Y2/FUNCIUL3GqiA832G0DaqoCP6KIlXt7ZDtigPBSsWpJJ7JmYdefLJZAqslU4giz2cpghOUxZn/PI/PJTdJ18xEux4FayCP5w/QGO8ujiHuRkBf5dsy2apDYXk2TySn9eXFgpzgN33GINuTKSp18MSxr2POrN71ocsFFGfli/HWvp7kRlkksG+etxplTGmugoDHi3U0Um1XpCr4DPMt4YPkp+7ZrASjPy1tqgh3FFdTplRrv6Stv9HFEO20nB+sd7zCZKU7ufOwlvjd28XXugfqXFl+Eg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=G/qeZJyp; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2406::600; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=G/qeZJyp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2406::600; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2406::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZzbgD4PyLz30WQ
	for <openbmc@lists.ozlabs.org>; Sat, 17 May 2025 04:47:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D7vZR5PPaRQwfOiUBw4rOHZ3pATLsNPEOul/YeaYjkoEAfPMzCBK6mLbJOOHJUcY6IvAAg4/2A2yydMDXe+XuIi14zxT0Td2uan9Y1gwYWVoHyqWYVUwQ/uDTbiRpak6J/GgXLtf1a1by8/EcEVYY5LvxC+uGfXW3M81PrTrQfnor5C88M5BTOf81iNaUAaElQxjLromhayycvooD+d/G+mCoPMOduB6+8qCF0XRPUACxx0qfl89J3whD7bSBpL/jAlOwKxWcEKgmTN5mNb2KTOq4dwVN12IGq4PdoEviOMAyNX8kJHWsYh5jYEWyzP8sjXTaESB476FcOd+Bhxl6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJTcussDaopJiuyrUJnZZ5ffRpwRuVEZZ0g2Y9nJAQU=;
 b=P075DWER4Q9O0Udy+A222ul5cPDSbHcUjVlIjyRNGJL6jfuERQBinyHg1cEsVNI42oqp1wyTDlDt3G/Dlva4w8uAuWCALFY29ydfLdc6+LyWwcHye1gt23pDzLyjpjOBCclJEFwIWxMFYVblneTL5zdCgkgNURFX+5naE/sKTFOunuBVgS4LObDKyKaJ2cYX3ldFNec9LxRy2wXzs538HIxyQc9SJfTg3r9LmMR4irPpwZqib3yI4x0gDEfxpiLuCVS6OS5Xl97KG9AkkhJOEmUzZWeDBPo4WPqN17qess/RZCadjXpHo0/FlBeUi2tTeUQ4z6w8YnMooLii3YXljw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=jms.id.au smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJTcussDaopJiuyrUJnZZ5ffRpwRuVEZZ0g2Y9nJAQU=;
 b=G/qeZJyp26wppsgeAdsiYDlqmr/qPZvgLqHYjlIDgg3ycjut3r3kimkCCaQ5FXVi8AfPgqDL1ppa82Ghp67Fjr2B4SIcf8MgGTzmMbjXNtK7m9vkDjhk7OZ4P3w9w91Gmv62+SiQTbH+W9DlEzwOohr3de+IRj7BbUoWBvrTHT7Yvy/vLItuSdRF9aab7yubfDq5lUd9uB603kuYIzKt6jvSa+gXlR06NNce37kI4g/H8xnUVlXKn5kMR4JLzZbNw/MYDoRHfIvBZHPh205sXr5VsBuGjYwJ03SW6VVhRT1nVXdwAUPwN/qec5TtyGndXde7e7V601SNoayVue+d2Q==
Received: from SJ0PR13CA0069.namprd13.prod.outlook.com (2603:10b6:a03:2c4::14)
 by SA1PR12MB8743.namprd12.prod.outlook.com (2603:10b6:806:37c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 18:47:32 +0000
Received: from CO1PEPF000042A8.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::5e) by SJ0PR13CA0069.outlook.office365.com
 (2603:10b6:a03:2c4::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.16 via Frontend Transport; Fri,
 16 May 2025 18:47:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000042A8.mail.protection.outlook.com (10.167.243.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Fri, 16 May 2025 18:47:31 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 11:47:19 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 16 May
 2025 11:47:19 -0700
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 16 May 2025 11:47:18 -0700
From: Willie Thai <wthai@nvidia.com>
To: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<openbmc@lists.ozlabs.org>
CC: <wthai@nvidia.com>, <leohu@nvidia.com>, <tingkaic@nvidia.com>,
	<dkodihalli@nvidia.com>, Ed Tanous <etanous@nvidia.com>
Subject: [PATCH u-boot v2 3/3] ARM: dts: aspeed: nvidia: Enable HACE and ACRY engine
Date: Fri, 16 May 2025 18:47:03 +0000
Message-ID: <20250516184703.726599-4-wthai@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A8:EE_|SA1PR12MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: 119071fe-c600-4a54-83a1-08dd94aa1d81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+fxB1a8qcaLbKA5/1pVyNeedRtiiUv2+h//rDPl/OdTQY5rscF5pPEKrhz7s?=
 =?us-ascii?Q?mR2OSITs0OatOCPQ48v3nGTjXgteolM/DlTYRYoXpg9bXgoCFo55AkMJAyPi?=
 =?us-ascii?Q?wRfWbOSBLmqZFLrfrALZHE8X/DPISNRPeeDVs/0yHw6+oODYmZu3+mtZWtHP?=
 =?us-ascii?Q?tsxtWahZOENfKMNfKtVVqxC4DyIdvp4Bgn27hIfQF+7++UhAMVi3tDvTlJIO?=
 =?us-ascii?Q?DqUrd99BEcvvg6Vu8PjLcxRz5GQ8LVO06qYBbgdzTTiE3Z58bFG210pZXb4I?=
 =?us-ascii?Q?x6+3h1kRdUQ8h0zJPulKpbA6bRFTrzivn2/hEYSb8tdcIjau9/7WVARGxy+C?=
 =?us-ascii?Q?jXndc0Bes08Ur38jEg3H/T6SQKbZQijlCVhxeSIK6NEVmigiGWl24/0e/PLY?=
 =?us-ascii?Q?xGmGT79LY0357c7RO4PVBX8JJKIVupD0vrj4GgTrspEQV7/uvZSJnRFyj0TY?=
 =?us-ascii?Q?8Ap2+Bz2dv6hLfUGkco+bhS8+FEVgotzOmbn6J6dVVh+vM1mi2DVK/El0aSd?=
 =?us-ascii?Q?BETvH9L9ZztIUegouN7FTtO/zdHaOQdGKw8QK6l+459c6Kt2xJVnzIWG5Yfl?=
 =?us-ascii?Q?2GT8awz7rqm/Omwymwff9RZRd4y5tcf6DYEpDhFcuiGYdQZ/5nJCRdnJ5wRM?=
 =?us-ascii?Q?ot32LRo1Z4hiDwcjcW2rYCBWttYzUGymGQrfVEwjYTj4V4v9Hjlp0ghzIoGQ?=
 =?us-ascii?Q?bmluQL37oabxy5qPTaeQkOJQz/dBrZG6baLG+gSSh2IluwBBmTyz19hARssy?=
 =?us-ascii?Q?vfMzCnOnPetzxzBon1sqx2RU513syY+tt7eL9vzxr96alTsg3jPmKJF2aPuR?=
 =?us-ascii?Q?+1mSHCoOYHKLMmP5RqkB/mTMaEQG8nj9S25g1F19xThuYTD6/p3+ftYzH9DB?=
 =?us-ascii?Q?zSjIP5rOg9+k9mO+70i3r2yWx+meWzR0JrPxevFn5UT00t6Y9n4bFBLe1FFT?=
 =?us-ascii?Q?LDOcgNSub9S266/0hb0Kxyt2/pVOconForXtRBhJ2gq9/E7akZY0z3UbTD4H?=
 =?us-ascii?Q?boLq6k2wx2JULQHbJa2mBvibGwafxTpIGOjRZHNsVbj07By4mGiq2P4oPZYF?=
 =?us-ascii?Q?fAZLZYItVMiTkUd3mm1HO58fLApup+w6Qt+jM99GhCuBV+exVkI/SzRWkqCm?=
 =?us-ascii?Q?/GMCMhKr25w58XODn5WjHOKKXF6uUMQpSOMv3qB76m+EWk/xKRSFosbQ5iFn?=
 =?us-ascii?Q?+JLgGSv3fzGJsBw/UGldrYca4X6Q4/7tgW+BuAIEIGsP5OSwWVHMui4Nobmm?=
 =?us-ascii?Q?kYWBCZAE+NwQ9BUAVS1E0stcmI07F3g5lNRigizCFV6ajf8N3GlogdTWnk1P?=
 =?us-ascii?Q?UjblCgwE++M18L/Ddwh316x8LxAgtsdC6KEumTPsMT0VYUNSHKHgvaIfEK9r?=
 =?us-ascii?Q?1FhySnCenYrARvS4IKPiUTg6RBxV+ipQ1CEeGvWb7jyYuNL+5e/yttZDNE+U?=
 =?us-ascii?Q?871ci5DYE8W20ZS2L7ZL3SoApnnAvTf1xEPd9DzwdbBKu/bPQVKl8T1gnQkT?=
 =?us-ascii?Q?+psRw8QM6+Rgc1Bcin4v5FoT6VeV3Rp9J8wH?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 18:47:31.6438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 119071fe-c600-4a54-83a1-08dd94aa1d81
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8743
X-Spam-Status: No, score=-0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Enable HACE to accelerate hash data digest calculation.
Enable ACRY to accelerate ECDSA.

Signed-off-by: Deepak Kodihalli <dkodihalli@nvidia.com>
Signed-off-by: Ed Tanous <etanous@nvidia.com>
Signed-off-by: Willie Thai <wthai@nvidia.com>
---
 arch/arm/dts/ast2600-gb200nvl-bmc-nvidia.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/dts/ast2600-gb200nvl-bmc-nvidia.dts b/arch/arm/dts/ast2600-gb200nvl-bmc-nvidia.dts
index 065149478b..0066bf5664 100644
--- a/arch/arm/dts/ast2600-gb200nvl-bmc-nvidia.dts
+++ b/arch/arm/dts/ast2600-gb200nvl-bmc-nvidia.dts
@@ -194,6 +194,16 @@
 			0x08 0x04>;
 };
 
+&hace {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&acry {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
 &display_port {
 	status = "okay";
 };
-- 
2.25.1


