Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3F1A68029
	for <lists+openbmc@lfdr.de>; Tue, 18 Mar 2025 23:59:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHS2k5X2Nz3c5t
	for <lists+openbmc@lfdr.de>; Wed, 19 Mar 2025 09:59:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2412::60d" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742271184;
	cv=pass; b=YODCo6FS207N8Kem9JCSauy51p8iBxtlBH110HSUOdzY98wciSYFdzUwul3bkAw9eOv11tRLQTxaydZjbLjhFO4Eed2UIepeHfpz2mbP3QlUPg2ICBZ9xv27VSIY3Ga5KequOiupl2BjteAhuGMxt3X5NxJ4pS64f+romI5xQp04vAX3kqQe92K2/uUxjY8Ox3nY3k5JD4VUhgfmKEZgxi9GicbC1WfeXfvUXeYHwkn/z1BnlaiHk1wtTxJpNsM3yVmsnyVLDNmBEOpmDxdzJVj9K9906rhbyKpH+jvuob0gS1nr4FvNgbkw5uRMGTy/UTJXEkzvhex0fe2u/v1E/w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742271184; c=relaxed/relaxed;
	bh=TX84Y6pPK9YOw1FeEOyRUN9cFVqfhBUGf9QAX8ddxMs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=abAY4fK3XGM40uE9oL1Su+maF1e7yFOmZZuK5lk61ponydsFYI5dJZ8uBwr/OjbhdvgXxobAogT1re3P/1m7c17ePzwZkPXdpGwHQyH0smoA/y845Cem2PfM435/ipzqPdoF3o+6PfsEuXpON3eJ/Fg8ikAKt/B7nWVjQ1la2OOaBLhlnLiPQzR1/d3cLvGPMqzxGisVsDk29g1Hxk6iUrBJr3B22LvULMhmsc2b8joIio4y9tIyHzRrMd/ClQEmfJxZRnvKx5+BePUh/lpOt0jb+DzSD3yLC/zz8ytaXY1EqxVr0cC8+rGx5lMERNmnuA/QOK1CxuC45VI4Nllo8w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=VVEOkfOc; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2412::60d; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=rajaganesh.rathinasabapathi@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=VVEOkfOc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2412::60d; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=rajaganesh.rathinasabapathi@amd.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f403:2412::60d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGz321XDNz2yVb;
	Tue, 18 Mar 2025 15:13:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSjyEiteeiyFijaQnhs4lnoBt6ebhAKwKMUntmEySWaEhdjmjpFI5tEEngXw7mQKuOQv9mvxgQxK1B/8miqRLe/IUBDv7VkGYKU9SEpjhjksuTmpmLqq/rghFqUHesrwJaQvf6kJTHe55U1t6Im+yfH9F4IERMUbSByLLFJYvkYQ/349QeDTwenNme77Va7YHb/X94EhgVoa1vUSok9/8CmWTFouFogkWwZVRhdesnO4khKuhRmDXIB9EyB2LFnZEJDQKzLb8HBXQgl/Rp/eFy0X60YrNTH5VwEapsf6q+qvKjIp320+qMWSsSVAx3qaoOa8cMwIsYl72PdE4aI9tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TX84Y6pPK9YOw1FeEOyRUN9cFVqfhBUGf9QAX8ddxMs=;
 b=QBa8xFYW2aFTfwScBi6jE0R7Y7fxJz1Mha5Wrv7enG4lBFQJr/0tYfhzAYxFNNklr7UWJR3Pgv+dHdby4IqNp2B75FSn6bmgrb8e6sNLUJPCCFz9DEk1i9960Pp7dtaYGRbjrIOpJz9LS3bPZXEN/56UoItAJskonwyqg/p/zIPbkcXWxLtDgnoewxsOGQS9h8Liysi09TaUVHO4qs7wKL91auccyzV+KtiyYeXvczRy6/B2wkc0lxXbybGSEu2KTBoN+biE1U2FikssGzGXxI6VKG3abCs5mrAlMDrVmcidDbVLvIO9IOKe9V0VQaRGo/QFaKzOJeuNTxkNBCTwRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TX84Y6pPK9YOw1FeEOyRUN9cFVqfhBUGf9QAX8ddxMs=;
 b=VVEOkfOc6clBq0Q4z+TvhRpeUwQgfS2TpdYLagAviFFjVMOFOoyLJBEWEp9Chy3cXfMTmuXb+5TYPne7KW/Y2s9gl7SNMI8ntGCatwRni/aOiLfJYNQ7bPr0MqnSXNC/NQmHOOJv3TJ+x0G2wC6b4aOBcevEfCGYyOe4ZA90wAg=
Received: from CH2PR18CA0019.namprd18.prod.outlook.com (2603:10b6:610:4f::29)
 by SA1PR12MB6918.namprd12.prod.outlook.com (2603:10b6:806:24d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 04:12:39 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:610:4f:cafe::32) by CH2PR18CA0019.outlook.office365.com
 (2603:10b6:610:4f::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Tue,
 18 Mar 2025 04:12:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8583.3 via Frontend Transport; Tue, 18 Mar 2025 04:12:39 +0000
Received: from BMCDEV-TH5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Mar
 2025 23:12:36 -0500
From: Rajaganesh Rathinasabapathi <Rajaganesh.Rathinasabapathi@amd.com>
To: <devicetree@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>
Subject: [PATCH v3 1/2] dt-bindings: arm: aspeed: Add AMD Onyx BMC compatible
Date: Mon, 17 Mar 2025 23:12:23 -0500
Message-ID: <20250318041224.1693323-1-Rajaganesh.Rathinasabapathi@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|SA1PR12MB6918:EE_
X-MS-Office365-Filtering-Correlation-Id: 6089fc30-d8cd-47b5-b687-08dd65d31f8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?OoUqffC+1iONBoFnQxaarbTpyzWbUe0wuUAbj4EN7aPZHCY0iICTe8GgPvPu?=
 =?us-ascii?Q?lKD9nlmRsCIC9o95AzcG2NKfz1sL9jQaRebIJYckNyFQFnUixGsoPaHfCa3P?=
 =?us-ascii?Q?yQS9GwxrZ1xqEDDOou8/CgG9t9nZ5NDM1Kip6DeoVs55AtQZUWmc0wwhgdyf?=
 =?us-ascii?Q?snSKUc+QbtnN3uhwTpniroDAvzmFshX75TAxdMtUSJd/MUHkhJvu7YqbPpJ2?=
 =?us-ascii?Q?EuMeLQYb+emGy2Uj0G9SWTmWxSzZNXcRcjCtx3hEsmHjfdK0YbN2t7k7Rrl4?=
 =?us-ascii?Q?/sq1Sezo/YcUiBmHpq563spwBO4aDbBkhjeKr9p7/HEUHIWjSt8kabhTFF/H?=
 =?us-ascii?Q?ImjPiRW2pliHn9ZuYYzSok5KgL1hNgR6C/qb74yybWruSTAyCbE6gNgtTeBR?=
 =?us-ascii?Q?LstD7w0NKEHCpK+F03gD01Om5zPd2cAXx8DKhV6LTlcesgOFgaBXh5WS5IK8?=
 =?us-ascii?Q?I7wsvmhBJPf835axQIj/McwSo3C9wSM1fH9rszRhQQp0othhp8RaOJzXjKZg?=
 =?us-ascii?Q?eHCN+nw8FYIJxZ/r4NWui1DqilJppAE+2ZlPWAmRAcpn6ZWqpBmp/Z9lgjT7?=
 =?us-ascii?Q?qjPrceLbpHb0Z+My7yeead40MjwGh9NF+zX0Ln/IDEqgGro7UanrZnnFN+Aa?=
 =?us-ascii?Q?TBRhSxb2lO4yoJajeVY6jTH1Dg//+H4hY/ZZCEGRRNtSZcE1Ohyu9aySKNOB?=
 =?us-ascii?Q?PPGNglBbezvZJ7v8aYf+uf8vQirI/q3Odk0wATQ9t3MBcLjOOYdMtxv30D4Y?=
 =?us-ascii?Q?jIwvL1wu4GZFee8j2rmcYPGdR5Obsa3GfzFsBznw5Q/inuBpQ51nkVoQJ3DQ?=
 =?us-ascii?Q?rg9Mc4vf7XDXTbF7YGSD8F2Rx70ZTb5dRjpALSfrU1qu+W5tAyV2pAZYspWC?=
 =?us-ascii?Q?O3EuDOQ1uvgElxltrhjX1dVRJhGjHgtIb47CK9hZp6ZJhawvC6zahEoaifsk?=
 =?us-ascii?Q?PirzTuJ00aCKFgVvI/Ag+sPg33fakPKt7Ta7O7l69fg2SRwvQ+kcIh3LfpLh?=
 =?us-ascii?Q?gyyAqlfxq8jT1mpp/ysWgE0HpdC0cHjFNQmxtj9EDBbV5KMgdODXYVBveLBW?=
 =?us-ascii?Q?qzDNiunqYPdzIqlc1F939gUCJYO6mA40U1A34A+alXsy0tpxsH98lejxlOs7?=
 =?us-ascii?Q?eEvwKX19YZcXKqvbJ0Ps6n/KrRaxYKr1MrVbt1eqs5h91E6uQjzPQd+2eH6U?=
 =?us-ascii?Q?OG1Z4jvFrFTgZdNxqgQG8wEK8fiQg+9zrN4IbnyiU/JoUcf6kmbi5zGI9R1p?=
 =?us-ascii?Q?VA5rjSoDdz5LCGXLqioMf/4W86kMCCBF+Fyn00wJuwx27rMXQDqDPZLou3l2?=
 =?us-ascii?Q?sBrbwnJGuxlLhjQlezAHhNsxUWbBS00ZM/SNxOAc3+ynF1L2wiy8Ptvta+MJ?=
 =?us-ascii?Q?8eM8oEGwTKKB5jpLJldRi8lE4IXZ9d09UiKzpBTR8/MihRtoKhZEwbpp0CX0?=
 =?us-ascii?Q?XLlaAuT+kQxxyrVJ+sJvPtJtHuekBaBfJET5xeF9z8v1ZScW2/gv+/79IApR?=
 =?us-ascii?Q?SSKIN0r6wldQ1Ds=3D?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 04:12:39.7870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6089fc30-d8cd-47b5-b687-08dd65d31f8f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6918
X-Spam-Status: No, score=-1.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailman-Approved-At: Wed, 19 Mar 2025 09:59:23 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rajaganesh Rathinasabapathi <Rajaganesh.Rathinasabapathi@amd.com>, robh+dt@kernel.org, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Document new AMD Onyx BMC board compatibles

Signed-off-by: Rajaganesh Rathinasabapathi <Rajaganesh.Rathinasabapathi@amd.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 01333ac111fb..98f92c16e342 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -74,6 +74,7 @@ properties:
       - description: AST2600 based boards
         items:
           - enum:
+              - amd,onyx-bmc
               - ampere,mtjefferson-bmc
               - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
-- 
2.34.1

