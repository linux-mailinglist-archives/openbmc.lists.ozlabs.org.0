Return-Path: <openbmc+bounces-614-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AA9B50CCB
	for <lists+openbmc@lfdr.de>; Wed, 10 Sep 2025 06:18:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cM6r55wgSz3cgt;
	Wed, 10 Sep 2025 14:18:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2418::617" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757477909;
	cv=pass; b=BWGsTsJVOaKer2b5SFFPFViPe6XuB4qJZJQ/ilSWAyiV+55VvfV3YqpfURq9nyT9BoH9x3CENr9EVJ1RfWrjZHWuF/xjI18g/8xqOHkY71R86CzCKlerg9Qcd2ZPc3ojlWC+cAStanvDyJuDaMZn+5aQ17LfvKNG4HsSusZA5/TZAHkJE3YyGw5cAAW+7mlZWRPOkl5tQrnYvX3+ozL1sn+G1CXUBsyuYXSwLQqH8lIFmtoHgoYIreDqR7CrmMmv5rtNvcEbLJ0L/4b3qeIVVQ6BxspVieIXT8Gh92n6jiFsCcYKqMBNHCWMPNN0nZYe/+zptKURCZRNpxsp/GStdw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757477909; c=relaxed/relaxed;
	bh=/PJbBvDV+noSKFlIser/JH9z0P+Q4gTCv13gY7hx1Mg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bWpekxUCkp6a+h2WVqhBqQWOFKVAlIicCb1In+vduui+mbNLrBPtLVhbig8uu1LvPVR+DvGx2lKSXdPDkKbPv5IjyneRISY6Kf+FBZGmWHetX9DrptpqHq5a3DF9vSYxJNl9l3WJ8mZHn18DRn1bHfh2l7FOUHZ1t+WIo6ELtq2lToTocTc1ox+67vpHBgF7ri99hx0jCzS/P+QrgvpywIAdpKzT/cD+npeB3l8ykiFwFiRn2M7pzgQs6KM4YTkqylkQ1eIai7//k4YQKL/F37ZdE/wl2O946zftNUOLi+YUpfbRqDsufwDxfVoUBIlwT5o6KtqgaYFEEa4tXVbfUA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=iaAIFVRx; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2418::617; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=iaAIFVRx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2418::617; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20617.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::617])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cM6r51KFKz3cfW;
	Wed, 10 Sep 2025 14:18:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u+YAlsEAgWdrzYbevkdqw8sLTQXSEwfZ8lhwIcSnI3HIkj+sGNHgXtSzjFkY8/KZMWyc5/GfCdHfmrP7K39Peq4VYS5A5LaTOqnW9hvE5pCx4D04b8DiNPDSrK2Pigi8nL+3shSBMpN7xTh0a6TTg+8BdvtvV85QXN+YAszRQV968GJ/1NogCrTVk5SQTH20haFOfcj1kShySaLznaTqFWDquiFIXHpI2bYqa+U0z5EH42MJSREX04bfgv1iTzVQyAWOffCYeY8mEiMXFtj9r9cclFVTkCuHj8ESzk0QHHi7e4GLyVdyYWSq144K1mvacDOB+0qR3X77BnDZmbb2Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/PJbBvDV+noSKFlIser/JH9z0P+Q4gTCv13gY7hx1Mg=;
 b=jdIS+c1n6BHg+BLsT4e6Il6tcCPLPq4q6548nTPTXlXnxKw1TwsJ5LtAckpYOPFVkg5XUejAkjjw0qQcxE4YbPS6wTYkaWgXQMh3Bl3+vnifDwxjTOc1PnUSqjnbnwmIVkVK2McapXi24QnaA7WImHW8/yENBn+J+eqOXQI5CNgSRiUeh/URfoEtyLfXzRSx+JKIIBio7l0BqIC/GMFkG9IVQ6vGGkKpcWmtNWmDbJSL1Wt7Iy2EI00kr25mNbmAouhm1gwVfA/7+6MLI2prn74qFtszKLI4OozayItKYwsu/Ozoz4HiAzYEKe6NafqEksYcagPoz0CIFiPuNFdq2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PJbBvDV+noSKFlIser/JH9z0P+Q4gTCv13gY7hx1Mg=;
 b=iaAIFVRxWtwfZXRs9enRM1l9vZ54G9YjAB0hKorwHV4cgZ1IVF6SPdgt8t1duUyQJinmQk8EtTgrGbGTrRhzuqxNbUC7mzWj2MCfXY8U4NOzqkIlYhoJ/pqhHQt+JsJGJ3FW6w9R0hQzLaGnfwLJljgWnmtuNIPojbT8XkbhZS4dnIDn/GGbUll7PGvHiqxhtoyXYdSHaMMcL5aMTuFR14xnQtmv6G2OY7/wHZfFsGWhWVbYpJjfs3ySbITZLY2G8YubhNw4N1lCeOKXwpC8GsbnxmQzDqyvldOwDY1pQ+0kO78eCSr9j1rz2U/0PIF69U0t285Wu6YQ4NoMUuCYpg==
Received: from PH7P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::34)
 by PH0PR12MB5605.namprd12.prod.outlook.com (2603:10b6:510:129::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 04:18:09 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:510:326:cafe::e2) by PH7P220CA0002.outlook.office365.com
 (2603:10b6:510:326::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 04:18:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 04:18:08 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 9 Sep
 2025 21:17:40 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 9 Sep
 2025 21:17:39 -0700
Received: from dondevbox.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 9 Sep 2025 21:17:39 -0700
From: Donald Shannon <donalds@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<donalds@nvidia.com>
CC: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <etanous@nvidia.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v9 1/2] dt-bindings: arm: aspeed: Add NVIDIA GB200-UT3.0b  board
Date: Tue, 9 Sep 2025 21:17:35 -0700
Message-ID: <20250910041736.245451-2-donalds@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250910041736.245451-1-donalds@nvidia.com>
References: <20250910041736.245451-1-donalds@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|PH0PR12MB5605:EE_
X-MS-Office365-Filtering-Correlation-Id: aef6040b-446b-4bff-9533-08ddf0210c80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r1T4HyoryYM/AZiGq6P5kAL9fDt2BXvgI36+uPMxpcRxOLRQ+MQ/H+TjjDuk?=
 =?us-ascii?Q?LNTcbPHu6WtQ5eWSGoS1mOpqqPNqig26xrn4AZsXxIJtwkgqU5aGYM8eVHOm?=
 =?us-ascii?Q?DW1Rv3XQE0x03ry4a2UWmPEHFd77Xst+sC1KopCQCP7GhzzGI04NQ4qmgAAL?=
 =?us-ascii?Q?ApZN3poXJDyRBW2s4WLPzUMoZeGQH/uUHgXGAr4wnLdT+fZHU4Em506Y2doP?=
 =?us-ascii?Q?zqGZ4L0xWb5xB0bsDEnRIwhCNfoJ0b4zj2l6H2TSgpIkmN+9j16lmQVEj7db?=
 =?us-ascii?Q?wcNeWBd+odPL20NaCPWgU+NnIWn+nYdR4Lkr+s/xPtB1W7DWBJ4Zr8ShvUeH?=
 =?us-ascii?Q?FP/P6JlwBrS08N4xiPkoWHSXmD0GXVquKN5j0xAh28NjPeDe2SEKO42xWMNk?=
 =?us-ascii?Q?uOxTqS9SDkmV5vQ96kA58PKHeHw0VgiFJmq6qL9wUck/6ctbkDXzptPf6Gqh?=
 =?us-ascii?Q?fHOrBzH2zRJSwhnZPaUXXYQqsHggEdYOku2ZFnzCk8GwD55J6nFKahocTqlI?=
 =?us-ascii?Q?4TrcpnkGPrxPzt5zyixoKoVMjH6TClq7uPTTS7oP6T6uxB4v5+sjFuN1Kw9S?=
 =?us-ascii?Q?HoAvVaJjrCnoVA04+LL69zi1tJ3u74EOkcjkWRllctxjefzJonfdXjQ5KPEx?=
 =?us-ascii?Q?rE4Kab+zA7yVkodh/eKNf/xXGLzktaUC7fuIolUo1wHYkolwvm8qUrOTIHaW?=
 =?us-ascii?Q?U14O74Ppr/+e54epMfrykugNnKHwnh2NYCPeYSwZNECXc76LPOt6aYqvlDbZ?=
 =?us-ascii?Q?NkhrtEBIN7H0e8A+QVEOuCF5SegGYQxyfZ7NU+AJAyRjIU+w8bUgN8y+kb1i?=
 =?us-ascii?Q?wBBjQ2ChLS8u6YoCBH6EOr2hd58qc3+i9VvOMlVwRFeziKQ/AbpSgejKFQvC?=
 =?us-ascii?Q?VoydLo5yOHI+8n7Ogl7BxB9bAeS/9u9t+h3dDJmRpJoGsxsdfnERO8tXur7v?=
 =?us-ascii?Q?S/32RzgndYZa+RAEGWz/HpNDxZd+N1pl99WychAvcMprScpjibEUVqYyH4uY?=
 =?us-ascii?Q?DvuTQXzB74dWcRAdxRO1njyKTsWcxfd6/x+hcD2VNkGt0IDgOgoHZQzDVPds?=
 =?us-ascii?Q?4qYuEa6lJ7FmuPQJDPqii0cmoxSQVv+aSGqbXLi9tnN6dbnxhCpGO53uJdPa?=
 =?us-ascii?Q?SrGrZVwpA3iipIHg/UzWZfS0bdElzxqBV5dlCbqSdYlpKcLJU2/lDFH1M7ff?=
 =?us-ascii?Q?8gbyjYsF0TNyL3IKLZp6ThUpR0F3CoYgN2upDktKFkJnMZe68Evu+nEjPHiI?=
 =?us-ascii?Q?IoyDYybiriAaOxw7RHr7X35VY5RqebxNe5JhDNtWWwO3Ix1HjZmY7zbXSfMX?=
 =?us-ascii?Q?pYH2j3NHhwEF/ipVsvk005EK/UPuaYVAOvOl8J5lPj/0zUlyuZhgwaKSbbbZ?=
 =?us-ascii?Q?ecXZG/6+nhC7pKpfOZtqEMlqdu4QxJ/dgKSl1Q4pshDA9kvZThhn2FCa/kLp?=
 =?us-ascii?Q?9NZx2RRnhFQRqh+L+QlVLH4BJik+U0h+bxDogEUPSdlNoejD+/Bg7rL92oPI?=
 =?us-ascii?Q?+W1/DHsewilNDnQeCzKsLup7GXiMu2H1SXSi?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 04:18:08.7997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aef6040b-446b-4bff-9533-08ddf0210c80
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5605
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is an Aspeed AST2600 based unit testing platform for GB200.
UT3.0b is different than nvidia-gb200nvl-bmc due to networking topology
differences, additional gpio expanders, and voltage regulator gating
some devices.

Reference to Ast2600 SOC [1].
Reference to Blackwell GB200NVL Platform [2].

Link: https://www.aspeedtech.com/server_ast2600/ [1]
Link: https://nvdam.widen.net/s/wwnsxrhm2w/blackwell-datasheet-3384703 [2]
Signed-off-by: Donald Shannon <donalds@nvidia.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 456dbf7b5ec8..624581db2330 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -99,6 +99,7 @@ properties:
               - inventec,starscream-bmc
               - inventec,transformer-bmc
               - jabil,rbp-bmc
+              - nvidia,gb200-ut30b
               - nvidia,gb200nvl-bmc
               - qcom,dc-scm-v1-bmc
               - quanta,s6q-bmc
-- 
2.43.0


