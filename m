Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 342F7A6E1F2
	for <lists+openbmc@lfdr.de>; Mon, 24 Mar 2025 19:01:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZM17B4f6bz3fpN
	for <lists+openbmc@lfdr.de>; Tue, 25 Mar 2025 05:00:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2418::625" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742839225;
	cv=pass; b=fHc3izFNAB45GGmKO/cpnpDIxoN8s0KpQSMCBHID6cYk5Q2p5yAehsQh++aBj7KDbQvoJU7szoaDl929EdwgbG6SI5qLsMANGd7y+ekcqGWXiHzluTiVNgQmu4UUFjV9L4RTel2LW6DS+gs2Fs2kzd5ttKmspTV5SsaqA4EgPnu8cc+RpNPHD6N9vdU4VeHWdmIIl2M1OnklcrqzDTpFrA3kYD3FUAXXkmv9flzTNsVOdluwOIoyJF7+t4H3xaw/xy/jijo/0iS5uUlYtb3l0Fmcu5eDrXQcthWMQ4wxggdlQdIWon9OY40YACloZA3a2sFu181Sszku0n/mlOUCyw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742839225; c=relaxed/relaxed;
	bh=Yh7mulpSEp//J8Nt/5HDZJnD4mmSHpOlaCmq/LbMp+s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NSHGzhBHPtamWUZ6pfBN3LV1m/cFEXeO1iOevutnTOo0a0PGgNTmer8UyH3KWUALlqzdrKaBG/t+6Ni7xysuUbOQC8WseuHRzZD0fr/6zlAjt+wGGEJOgfwEYp6FZnkkru3nsbinZadQGdzcRNO8gJ2q62buHSTjUkAUyiEeO34VYEUIzNr3y8/I+oZM1fkzdaZp7PO+e+dLUeAx5oulp0mpy+/ylQQ7yK2WEs+iA+oX6aY2GcpwnBpQmRKs9xyBazDk8MAmohyuaGMZpPBUBl8baEStLFHfh52FMpsq9UyFbWYMe916L4MiE/mW4worZjXdpCeOoUQXFmioMwPtUw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XXfh2GSQ; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2418::625; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XXfh2GSQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2418::625; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20625.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::625])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZM16w26zpz2yKq;
	Tue, 25 Mar 2025 05:00:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nzv60xOGdlVC+osQOnDzFBEPJssAiFGa2LyGe8Wpixit++e+O66AnfX9g694j2+1ziRHrsQy1TIZdCHEFtq67jLgyywHKqRqPjNuA93bKk+oEdoOdBx5ruJbT6xWWlDyzSCROkIGmzMCeCxSJKjmEuIP09KDipFTzyGycg6mGndHFlJBFnlLMvaInrVk2qzQoHFlu8gFJqa/yulFk5pSmWf4gUaxiA4Gfjs+Kl75MI/z+G8eAfP6CIFJpnTh/4UeqRlri0xmcpISQgu4X36ZNSqA7hGZpyM//Ak4YnwQiyvevGvpvJV6qE+A09OeTCY7Iepb/F1uMfRPeEcBpbYOmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yh7mulpSEp//J8Nt/5HDZJnD4mmSHpOlaCmq/LbMp+s=;
 b=bVlp0haBQYD8HOv8CY+W/wBF3JrBGqBbBkqs8kIKQvd7oENArnOo+O8k7Mogbh0OPOvKpVB+NeaZ/lcNkGHQL5cP68KYNbCi2bPfCh2ro3YFvqUqgdxfkb9mLDoTmp7f6fJo6CH0WxIUlToqc/5VJaFcr5g6cLqaWboLKnxpiZmsJ/6rjcJb9VrCHhdex4xXQPX8absHjVS/Avas8WdzLexf+J9dRmFgi3b8yO428ql+1rPxpfqs6HJKnm7vE9/rGT7E4t3HQFNXhe+1vGRizVqIWKFo2MtyqhDkRq5+Om3OSdw0TiwUeCLFTltqxITDJm6q5tm70drr0N3LayIa2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yh7mulpSEp//J8Nt/5HDZJnD4mmSHpOlaCmq/LbMp+s=;
 b=XXfh2GSQLORssSlnaWuUBlRnHcfSmqBVDeMT18GUbHEGobZo3smsdjtNJ2BxmQqNjlAJyLpcNfoOWAX2GqKWcWX2udt+cLzoTXq5jtI4LoBm/8GHVNKqS6sujMfcSOMa7MhzmbBfkvfO+8Kv1QWkJy/NRek/hgzcICUAUyMm38LQsR6pkbJM5iOJnGJtA2ozu0H4dnFi6eaKWEPaYsdQVq6izCdsTW6XhgblBPJY+P6n8Exc31mKQF4j09nAf4a0FL3K/4Kzy5mEIk+kpT55PgCktV6Dly/sadIedDIjVHczlseJtdYLmruxwGFTn4bSn2ToGPe9WJJrbiT1lJw/2A==
Received: from MW4P221CA0024.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::29)
 by CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 18:00:01 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:303:8b:cafe::10) by MW4P221CA0024.outlook.office365.com
 (2603:10b6:303:8b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Mon,
 24 Mar 2025 18:00:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Mon, 24 Mar 2025 18:00:00 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 24 Mar
 2025 10:59:45 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 24 Mar
 2025 10:59:44 -0700
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Mon, 24 Mar 2025 10:59:44 -0700
From: Willie Thai <wthai@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <kees@kernel.org>,
	<tony.luck@intel.com>, <gpiccoli@igalia.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>
Subject: [PATCH v4 2/3] dt-bindings: pinctrl: aspeed,ast2600-pinctrl
Date: Mon, 24 Mar 2025 17:59:25 +0000
Message-ID: <20250324175926.222473-3-wthai@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250324175926.222473-1-wthai@nvidia.com>
References: <20250324175926.222473-1-wthai@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|CH3PR12MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: 3661aa81-91b8-4975-e438-08dd6afdb266
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?Babr6yrKC8F3MA9R0ZpDK4rMR3/bHTp4w5rUffsGeDhqXNfOV9WML7ijn3v5?=
 =?us-ascii?Q?XUnLOoBC21X4/Oe32vS//iYR59DnVduqk/tntvCmCfeB5KRwGX+ggh0ogpV7?=
 =?us-ascii?Q?c2MFT+goOJ15bUNF8ZW9NYvIWRaZV2mOUzGbfwvPw4JO65Hd9gO6NhimcZ0f?=
 =?us-ascii?Q?6Ev2QWLKdXC6zEgEPmrATZVCd1CA6xpfiHh4ZYkO1O5YWGECyLSl0u+YMrr0?=
 =?us-ascii?Q?yplxhYaNr5Dcz7sZsPvJCPGH00bGQ/lxTWr+hKg9DiytGgnAi9PUiYUZXAWF?=
 =?us-ascii?Q?vywaByAfp8144pJkTfKNMcdPxTVVthYwUB5Rf6UuQz3xBSABCU2wX8xKzN0y?=
 =?us-ascii?Q?XlvjgY2pKXFeGB8HcX7npmUcua6PNuNUmJYecMAX7TyDgy5ghihhadoPAiBk?=
 =?us-ascii?Q?Fc/M8VfJKpWn079FBNyqyQzMk4uwKLj8340Ip3cXJ1UMW+E7bktfislBvrwu?=
 =?us-ascii?Q?LMoM9iJzOe2o7PgEKfj0hIoPWBMOu7JpffVdYtSDQu2tBUtkShaD9bVZSMw1?=
 =?us-ascii?Q?yYPstycDnDMnTGYC6f9x+pSHzBypyCUHYFuO1+6gLCEy+mMCXEpJT6v7gLOJ?=
 =?us-ascii?Q?dJFQgPGh84VXaQUR6mku/8YBY2v8LgM8DtAaNoAVU/lZCpIo6qCDyCtA195C?=
 =?us-ascii?Q?LwPjqDYKHp3Gxpe89wsPUnHpLYYnhYvfIxOStmYDM+kLyojG6GKgqayc251Y?=
 =?us-ascii?Q?kTHOJsEfgBqvP/rOt3vs8lIQWD4txO8km0kIGSA/PntEmEd1K5KkcmrUAAvz?=
 =?us-ascii?Q?6lRgn/gj+nJV74NIu3kQUWuZLFK8cb/gYssnYeJZhuAu+n5gFagRIR77P6Vb?=
 =?us-ascii?Q?w2MVXiTZ4hRwEXD9hz+fwY6sLssUpSPi/cwrpFyqhj4n6oOukR7j5Ji6oiZP?=
 =?us-ascii?Q?/diujCuTfx3qZ983IFiGLUwWjhiEJ2ZFxx1vw0BG4xg05KHFpo2bEuEQ6me+?=
 =?us-ascii?Q?PtytnxM7Ky/SK8duP8BEFm7qCD89hz/NwAityvgJKDMuNGF/XWluUN7d1cya?=
 =?us-ascii?Q?nyjH68UnlO6Omnt8qQaexLaKKKV1ksfTyqofnI36bgoV6qFDeEH2hFJ658f9?=
 =?us-ascii?Q?MRZnG/Ju4Z4D1dQUmRsKbVyG4Y9tc0Fh1XfrI2xG08nrU1f/FYFLJOqEEWsg?=
 =?us-ascii?Q?5QZSN1z65lyNST1LdULwRjIi+GCHCdBKAMmZiEmiRncS8SwSewDCJ6oXfknp?=
 =?us-ascii?Q?aKmNzWy8Tbl8u2OO56QaPoi294dQBUagIi2YBx+SKJRSIn4nyL3GEuCO60nM?=
 =?us-ascii?Q?qLVWCCqbBU7M7Hg2vgw662ipgQqe5PuNN1uY5TEpgHmfgGfsaFTvUiL4qhOS?=
 =?us-ascii?Q?APjyMNep48omJVTskSju3XkxY4kI6x+GPh0yqlC6SchvuLVjh5hj8YgjPUgg?=
 =?us-ascii?Q?ZxAscUa1lGtDwfiCGw89JxBq4pOyh8x2C6pV8a9BBjNAHioSngua4lpPXJso?=
 =?us-ascii?Q?lsQBkWtXpzCwNU/29OECtqupqOaxZSt2L5TqeR9SjeCFS5jeIkYB4KxUN38A?=
 =?us-ascii?Q?FgrdQvTH0roiW5EihB2bgiXhTLnknme63mwP?=
X-Forefront-Antispam-Report: 	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 18:00:00.7586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3661aa81-91b8-4975-e438-08dd6afdb266
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 	SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8658
X-Spam-Status: No, score=-1.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: leohu@nvidia.com, dkodihalli@nvidia.com, tingkaic@nvidia.com, wthai@nvidia.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add EMMCG5 enum to compatible list of pinctrl binding for emmc enabling.

Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
Signed-off-by: Willie Thai <wthai@nvidia.com>
---
 .../devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
index 80974c46f3ef..cb75e979f5e0 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
@@ -276,6 +276,7 @@ additionalProperties:
         - BMCINT
         - EMMCG1
         - EMMCG4
+        - EMMCG5
         - EMMCG8
         - ESPI
         - ESPIALT
-- 
2.25.1

