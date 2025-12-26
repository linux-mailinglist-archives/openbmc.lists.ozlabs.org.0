Return-Path: <openbmc+bounces-1064-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C0ECE5A76
	for <lists+openbmc@lfdr.de>; Mon, 29 Dec 2025 02:16:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dfdZz5SV9z2yFb;
	Mon, 29 Dec 2025 12:16:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.43.109 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766714329;
	cv=pass; b=i0EGO94frFNq2f3DpAnrdygJUya2lBHEda9iO8yYYsjzCCa+3EBeE3z/6kD/GxH5oseTBezXUDEKWEQP7gYASW3TohQL7Luz1XjmEfn5z58Cc2j8nB4lpTwGAyiukbvF5KUWoASZy2xDFVB2V0F4ywkZq+702Emqi5rXPBYOsHUFKXTYOC4w3EfQfOWyklxS5Cwy+7o70nKlyHouqNPb5k3EqtbEH0so2koy191khBShLEqS5zW6/GnnwUbJHAC0ZOl8hfrDw7R+3GdPBfNuGbJ7qmTLVxUh/VOzlu+TD1JgWcIUQHcsPH5FOQAFDvK/Oji8tCoJh89CuBBFwSTVDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766714329; c=relaxed/relaxed;
	bh=P19GMmMlxMCIA69+lOheBDRth5D76pewwckfFsLdVN4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cVFZdd7UDDQBJRc/bCmO6YiPMXUn1VlstcXTqmjx79Ei5BTAokcgC6yLKSb1bRX+XeE3YDC3g1+PQ2d73QmSeN6gMm3Y6TE+oDdvakoZpNsC5xgcocuoErSGdce7MZq5qKodfl2x3kFkXKpXktEs514hKSIVXi/7beGzUpeFWU656Aot3hxauU2WY0nj1/VtFTrP8at5y46Cwg4cbX+x7rYSdcstSIuppwRPYEb3YrPRbLvuBdxciwzDbk/EGe9lXb4lcf+ZunuaKH3Dx3DCVKbcXAIfHaY+fxEO5N/Z+QvyAwL2L/mN7UOlt5lXIAoljoDMynHBWJDdiSeGn3nG2Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=EC0J5HUd; dkim-atps=neutral; spf=pass (client-ip=52.101.43.109; helo=sj2pr03cu001.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=EC0J5HUd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=52.101.43.109; helo=sj2pr03cu001.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11022109.outbound.protection.outlook.com [52.101.43.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dcpgX6ds9z2yFq
	for <openbmc@lists.ozlabs.org>; Fri, 26 Dec 2025 12:58:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2yK5JpAT0Dgmls7NZ81nLH3rAumkPS9DSHLUTNeCAyRT7njWpPISwwihPKb1FMrQDV+vUjDfA/uD7tIkzKnfyIc4dWU1Yi9ACOrsTmGP2f5xP6DmMGspflZ56iDXissH+ZjMW/dgEmewKbsTRxBLk6ye8x2X4mCrx7SAhqdYDwVG3ekO7BFj2u/9wa6xwvdJoACokXq0XER5/zrx8dNzEGhkKFEXdnOKNdt9HbxLbfoBZTClUuEhMIwLSN1BNz/Dr4PRH5qnG0htf0pELoOUTTbiCbNP1RmZBgpWzqLN0leqAyJjERzZDQp/qdeOn2nVLZtCA8zMwWeo1M9dhRC9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P19GMmMlxMCIA69+lOheBDRth5D76pewwckfFsLdVN4=;
 b=WWnH9mCJV78JDNVJZAGptDB1KPpby0ARYnCpTfeN18G7EzMbUo7a87eS3Gm7v+UHIAJAa4lLqwSeIqGzX0GNMmay/HCROAhK/ncOumLFezdyURhyRIkhBN1IhDES1E1DEwqkAL7Iwddcke9f1vr/FRuIPbO4FSEPR5358toEFRgo10/k/wSGajKGPEAfbFaGqSzrC87MJSJItpd6dHZvzDndNR38qB9cju6SZD2DSr0CDBjxSsOqmyRjLAIq246Rwvis0zFYSHs7nGaCLn+QT1RvErpl9SYGiO9+3iJFrK1y+Yg7jqO8hUBc2111Cf9Tevd3DrbrS5QGtqbWSZl+yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 4.227.125.105) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P19GMmMlxMCIA69+lOheBDRth5D76pewwckfFsLdVN4=;
 b=EC0J5HUd0cuVilWUc67vSC5vzxJJr1Gk/7wFSUg5+cLdmfXizQfEYicTtJhB2NCyruzsz+4kLTXtn+lUlyZE3kdyTe3z6lhdJkC+4vQhAs3pVQXzh8keAwzdlC2it0ufW5cbVLTvpRmIhvNdQCFRdoPtP12SV9QCCTwrF/V9quQJpUdQVbPxdXNj4+KpdZoN4wK42413g9w/rayHYXzwmhayg5lJ6b1gd7HlNGx/VDlwVpaT5KkeMZvLS1FB11XZQEW3ghtVdlJpIuCmQvub9cedRVEUZ+xmBwxVjED+LSah3l95iUQveOgD6xvNtDtmLcYZ/0ptZ4oRbU9CVdqqKA==
Received: from SJ0PR13CA0004.namprd13.prod.outlook.com (2603:10b6:a03:2c0::9)
 by LV3PR18MB5780.namprd18.prod.outlook.com (2603:10b6:408:1ad::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 26 Dec
 2025 01:58:06 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::61) by SJ0PR13CA0004.outlook.office365.com
 (2603:10b6:a03:2c0::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.2 via Frontend Transport; Fri,
 26 Dec 2025 01:58:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.227.125.105)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 4.227.125.105 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.227.125.105; helo=axiado.com;
Received: from axiado.com (4.227.125.105) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.9
 via Frontend Transport; Fri, 26 Dec 2025 01:58:05 +0000
From: Kuan-Jui Chiu <kchiu@axiado.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: Harshit Shah <hshah@axiado.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH linux dev-6.12 5/6] arm64: dts: axiado: Add initial support for AX3000 SoC and eval board
Date: Thu, 25 Dec 2025 17:57:49 -0800
Message-Id: <20251226015750.377679-5-kchiu@axiado.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251226015750.377679-1-kchiu@axiado.com>
References: <20251226015750.377679-1-kchiu@axiado.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|LV3PR18MB5780:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aa864a8-f387-42d0-255b-08de44223643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RkZ0TkkvSmNyZkFuazN2NVA5bUN3UUR3dGdCaTJha2h4SHVHQ1JnWjJQUEZJ?=
 =?utf-8?B?K21Wc2tvQ3RpZlFLRTN0U0p3dk0yZmNPRndMYVdZNXd6cE5STXlYbjJCSGVY?=
 =?utf-8?B?dW1rVTJtTUhVWUFBRGhhc2xMMXB1TmZLaW4zbjBjWElrdk92Q2NKL2JqV2c3?=
 =?utf-8?B?Tnhoa2prTzZqRVpRWm9Wckk4bWVLY3RNU0Q1UjdVa0FwT2MrVWJXWWJVSFc3?=
 =?utf-8?B?SjJvb2FmYXBFK1NudUI5aE05Zi8rUkI0c0lDaytxeTB0TGFVb2tRUVJSTTYv?=
 =?utf-8?B?RElBSW91eTdwNGVGVkgvaXJCMzlkM3VmV3lVK3NWOG9vaXgwRGFoaTdwTjB3?=
 =?utf-8?B?aG1oWlRIN25JL2cwQzB0QURJSzd5UWFmRjcyaVN6VnBXMFJYYlgzNWljM1pS?=
 =?utf-8?B?UVpXSWtCQzhCQXJLdzRJR0RMblhNTk0zY2pna3hNWmZhek1BSVNobGpBaGoz?=
 =?utf-8?B?STJaTDMyU0o1WEEyQTdiOS9TTjllR0tKZjBQSzhoVEV0amlNYjRYRm1ndGpI?=
 =?utf-8?B?YXc1cklZejNUTGppUGRwcGRvUlZzRXJsOGNZeWM1ZWRaVEU5ZW5hMXNkY0xr?=
 =?utf-8?B?YS9ZL3lKREg2d0Q1QVlOTWhkY2NRa29IdytYenNhM1MxS0JrM3dTaDgxcTlU?=
 =?utf-8?B?NzFaV0wwRUg5ZlhDaTlwVURnUytNWXNFVktTZ2xEb1hRbVQvZ1JRTVpZbCtT?=
 =?utf-8?B?NXJLMlpNWExCYVVXSXdpREYrNjVCNmVUdzU3bGE1VzhlNFE2WEEwUXdUcXAw?=
 =?utf-8?B?bU5ZYmdsd3E3TzJ1enhpeFc4NFdRVVRBaFNrcEZ0R21waURZVStUalhTRUZO?=
 =?utf-8?B?TDZsSVM1UzVaQzRPcmNwYWIrYjZKd3VCSEtTdTBHeFZldStHbGh4clNWcGlo?=
 =?utf-8?B?Zi95Z1YwRm91NC9uUHQzdUNRdExxNDhHQk8yOFBMZGFQTWY4M0U2all1QVdy?=
 =?utf-8?B?VUdJLy9GNDMvT25kZ2NJV29GeGRCQ01TRTJiN1VKVDloSVlQeWorZ1dFNjQ1?=
 =?utf-8?B?UE9ITUtseEZsK0F1YU9KOTNQSi9WOXYxR2lIeHlDM2puWTIxQVVwdElMb2V5?=
 =?utf-8?B?bnZxSE1uVU1VNVlTSHhaT1NNL0k1MFJCUE5YbHZhR2dwM3VtN09aVjVrUW5Q?=
 =?utf-8?B?TytZQkJvd1ptZ2MzazlXZEl2empQSzZPdFhPZXcwLzFnVXMxSVpYWEpCdG85?=
 =?utf-8?B?YUloTHlRSmdmdi83ZHA4TWpXRTUxd2dwNy95Mm9zbTh1Q3dCYjJxSUViNWtR?=
 =?utf-8?B?WDVLU21WL2NWNlpuTWxwK01lWTBpWTJlS0d4L3pSS2FLcER2L0pjc3F6dlFU?=
 =?utf-8?B?clBhcVZHQXRpZ1Y3ak92NlpkdzBwbG1CWFlrQVY5RVg2TEE4dFJZUDdJT09m?=
 =?utf-8?B?dWdJYW0yWjdlcERyWEo2Tm5CcEprQXpHOGI1c0E0UHlPeE1yc2lXZGNBTDNm?=
 =?utf-8?B?L2VVZGpWK3habDhWVnRQekxLRlRmOG1GWlQvd09NTHpQV01YUm04K3JUQlg5?=
 =?utf-8?B?dUFRM3ZoWGF5c3RWdzk2aFpycUw4TWd5dmI0U1h4L2U3ZEFXc1luY212WnpW?=
 =?utf-8?B?ZVZFc2hQei9JN3VDNTdxbGgwMXU0YzBURWVDZmN5T3VaT3BuQ0gxeGFlVHo4?=
 =?utf-8?B?UmY3b3g5OHgvRzVOL1BZak5kdDlCOWhHKysyZEJNVFhFS1ZZaTFNc0NvNjRY?=
 =?utf-8?B?amlGdHN6MXBiMlVTalYveUxFR0dDZzdCZzhCMFN2NmdHU2dMRGh6Z01NSGxN?=
 =?utf-8?B?bE9kUjd6T2tDS1hvZXVYaWtOdHptbHVoVW5RbGtVeDMyVFh2a0lRZnpPTFZN?=
 =?utf-8?B?YVJ2azdldEVMV0VDaXk3MUpJVzFXZGwxcUhxcW5xY09OVHdLMkdON0pGRDRk?=
 =?utf-8?B?NEVsbEQ2KzRWVENkQi81SjZhaWo5eE1LL3FGd08vYXV0d2l5MUdXSjFzZzY5?=
 =?utf-8?B?dHhkMnF2VTNtTlNENUl1MjF1V0tZVXBmZ1FjK1ZLTWNDNEFBaHZ4aWZkY2cy?=
 =?utf-8?B?a0F6ZGtKZElxWVIrOWpKT0RJMG03RjdBdWxib1dGT0V0cDQ1b3VHQU9SWUpR?=
 =?utf-8?B?Z09kR09uVk44QnBBbXl0THhXNkU0NW1nWnN3WDBwdnVxNnpaRHZsRjNmdkZB?=
 =?utf-8?Q?n7Ec=3D?=
X-Forefront-Antispam-Report:
	CIP:4.227.125.105;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2025 01:58:05.8708
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aa864a8-f387-42d0-255b-08de44223643
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[4.227.125.105];Helo=[axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR18MB5780
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Harshit Shah <hshah@axiado.com>

Add initial device tree support for the AX3000 SoC and its evaluation
platform. The AX3000 is a multi-core SoC featuring 4 Cortex-A53 cores,
Secure Vault, AI Engine and Firewall.

It adds support for Cortex-A53 CPUs, timer, UARTs, and I3C
controllers on the AX3000 evaluation board.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Harshit Shah <hshah@axiado.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/boot/dts/Makefile              |   1 +
 arch/arm64/boot/dts/axiado/Makefile       |   2 +
 arch/arm64/boot/dts/axiado/ax3000-evk.dts |  79 ++++
 arch/arm64/boot/dts/axiado/ax3000.dtsi    | 520 ++++++++++++++++++++++
 4 files changed, 602 insertions(+)
 create mode 100644 arch/arm64/boot/dts/axiado/Makefile
 create mode 100644 arch/arm64/boot/dts/axiado/ax3000-evk.dts
 create mode 100644 arch/arm64/boot/dts/axiado/ax3000.dtsi

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 21cd3a87f385..c761140ece0e 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -9,6 +9,7 @@ subdir-y += amlogic
 subdir-y += apm
 subdir-y += apple
 subdir-y += arm
+subdir-y += axiado
 subdir-y += bitmain
 subdir-y += broadcom
 subdir-y += cavium
diff --git a/arch/arm64/boot/dts/axiado/Makefile b/arch/arm64/boot/dts/axiado/Makefile
new file mode 100644
index 000000000000..6676ad07db61
--- /dev/null
+++ b/arch/arm64/boot/dts/axiado/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_AXIADO) += ax3000-evk.dtb
diff --git a/arch/arm64/boot/dts/axiado/ax3000-evk.dts b/arch/arm64/boot/dts/axiado/ax3000-evk.dts
new file mode 100644
index 000000000000..92101c5b534b
--- /dev/null
+++ b/arch/arm64/boot/dts/axiado/ax3000-evk.dts
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2021-25 Axiado Corporation (or its affiliates). All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "ax3000.dtsi"
+
+/ {
+	model = "Axiado AX3000 EVK";
+	compatible = "axiado,ax3000-evk", "axiado,ax3000";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial3 = &uart3;
+	};
+
+	chosen {
+		stdout-path = "serial3:115200";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		/* Cortex-A53 will use following memory map */
+		reg = <0x00000000 0x3d000000 0x00000000 0x23000000>,
+		      <0x00000004 0x00000000 0x00000000 0x80000000>;
+	};
+};
+
+/* GPIO bank 0 - 7 */
+&gpio0 {
+	status = "okay";
+};
+
+&gpio1 {
+	status = "okay";
+};
+
+&gpio2 {
+	status = "okay";
+};
+
+&gpio3 {
+	status = "okay";
+};
+
+&gpio4 {
+	status = "okay";
+};
+
+&gpio5 {
+	status = "okay";
+};
+
+&gpio6 {
+	status = "okay";
+};
+
+&gpio7 {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&uart3 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/axiado/ax3000.dtsi b/arch/arm64/boot/dts/axiado/ax3000.dtsi
new file mode 100644
index 000000000000..792f52e0c7dd
--- /dev/null
+++ b/arch/arm64/boot/dts/axiado/ax3000.dtsi
@@ -0,0 +1,520 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2021-25 Axiado Corporation (or its affiliates). All rights reserved.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/memreserve/ 0x3c0013a0 0x00000008;	/* cpu-release-addr */
+/ {
+	model = "Axiado AX3000";
+	interrupt-parent = <&gic500>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x0>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x3c0013a0>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&l2>;
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x1>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x3c0013a0>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&l2>;
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x2>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x3c0013a0>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&l2>;
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x3>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x3c0013a0>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&l2>;
+		};
+
+		l2: l2-cache0 {
+			compatible = "cache";
+			cache-size = <0x100000>;
+			cache-unified;
+			cache-line-size = <64>;
+			cache-sets = <1024>;
+			cache-level = <2>;
+		};
+	};
+
+	clocks {
+		clk_xin: clock-200000000 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <200000000>;
+			clock-output-names = "clk_xin";
+		};
+
+		refclk: clock-125000000 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <125000000>;
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		interrupt-parent = <&gic500>;
+
+		gic500: interrupt-controller@80300000 {
+			compatible = "arm,gic-v3";
+			reg = <0x00 0x80300000 0x00 0x10000>,
+			      <0x00 0x80380000 0x00 0x80000>;
+			ranges;
+			#interrupt-cells = <3>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			interrupt-controller;
+			#redistributor-regions = <1>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		/* GPIO Controller banks 0 - 7 */
+		gpio0: gpio-controller@80500000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x00 0x80500000 0x00 0x400>;
+			clocks = <&refclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio1: gpio-controller@80580000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x00 0x80580000 0x00 0x400>;
+			clocks = <&refclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio2: gpio-controller@80600000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x00 0x80600000 0x00 0x400>;
+			clocks = <&refclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio3: gpio-controller@80680000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x00 0x80680000 0x00 0x400>;
+			clocks = <&refclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio4: gpio-controller@80700000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x00 0x80700000 0x00 0x400>;
+			clocks = <&refclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio5: gpio-controller@80780000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x00 0x80780000 0x00 0x400>;
+			clocks = <&refclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio6: gpio-controller@80800000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x00 0x80800000 0x00 0x400>;
+			clocks = <&refclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio7: gpio-controller@80880000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x00 0x80880000 0x00 0x400>;
+			clocks = <&refclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		/* I3C Controller 0 - 16 */
+		i3c0: i3c@80500400 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80500400 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c1: i3c@80500800 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80500800 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c2: i3c@80580400 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80580400 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c3: i3c@80580800 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80580800 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c4: i3c@80600400 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80600400 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c5: i3c@80600800 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80600800 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c6: i3c@80680400 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80680400 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c7: i3c@80680800 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80680800 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c8: i3c@80700400 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80700400 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c9: i3c@80700800 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80700800 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c10: i3c@80780400 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80780400 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c11: i3c@80780800 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80780800 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c12: i3c@80800400 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80800400 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c13: i3c@80800800 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80800800 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c14: i3c@80880400 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80880400 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c15: i3c@80880800 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80880800 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c16: i3c@80620400 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80620400 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		uart0: serial@80520000 {
+			compatible = "axiado,ax3000-uart", "cdns,uart-r1p12";
+			reg = <0x00 0x80520000 0x00 0x100>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&refclk &refclk>;
+			status = "disabled";
+		};
+
+		uart1: serial@805a0000 {
+			compatible = "axiado,ax3000-uart", "cdns,uart-r1p12";
+			reg = <0x00 0x805A0000 0x00 0x100>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&refclk &refclk>;
+			status = "disabled";
+		};
+
+		uart2: serial@80620000 {
+			compatible = "axiado,ax3000-uart", "cdns,uart-r1p12";
+			reg = <0x00 0x80620000 0x00 0x100>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&refclk &refclk>;
+			status = "disabled";
+		};
+
+		uart3: serial@80520800 {
+			compatible = "axiado,ax3000-uart", "cdns,uart-r1p12";
+			reg = <0x00 0x80520800 0x00 0x100>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&refclk &refclk>;
+			status = "disabled";
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic500>;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>,
+			   <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>,
+			   <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>,
+			   <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
-- 
2.34.1


