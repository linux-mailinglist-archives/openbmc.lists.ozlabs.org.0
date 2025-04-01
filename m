Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 857DDA77FD7
	for <lists+openbmc@lfdr.de>; Tue,  1 Apr 2025 18:06:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZRtCp6ltrz3c8G
	for <lists+openbmc@lfdr.de>; Wed,  2 Apr 2025 03:06:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:200a::60e" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743523587;
	cv=pass; b=PKmeZKBR/Ug6lwOo8KRfuNYuDfo3dqa+0qqOLN4zHkNKESTMKA9TQlVzrThhhf2moog9IXvMVXkI28eEK8R+VxAn1AMM58E0U6pz9kauKcOnACAh7wsx1/wuXeray6EGLounu8TiL3qRj9eDpmQv+9eEUAemj4n3Rt86jalBsGh36XWBiAIWP6CEifjNBf83xY7B5p1COpmpyG32ngfiXQtKnsrfwBDExv4cT6Yc5GUQlkO3w2pj0zt/43XZcCseGLIclt5XbXjAhgqixtDzhagAG/sWcLQqwkwRBzxDLUQGFllaeK5MpTyUT22/5pKOemLXGy8+qdUMl5iMbV5K1Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743523587; c=relaxed/relaxed;
	bh=cexKPN6R9+KKQb6rMvVCqOTaSLaGQSEC1N4bRKEa7S0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B34w5Kntqhw4H6SFvygsLabF01jGWnyzrwVwt2WC1siHx+tNJHTaW1sXtlim54+vAPiWWKBe9ZrNJGv89wLeFoh4lQAEGR+3ovfVauti6TIM1ltKwqpYEu6l1mym9d3np4bWdw0gR4vgd0cOubok33BWK0BnE880sJwGeG24ObPJXeG5Df4BfxamC7hkILroktmuQ95UPG1TwKPSLzGu5Uw9wpZ+FulnH+asWsaeJyV9zuCFCfiv3o1miF/ALPkZrjENEI2hd2utFuk8hXm/VHrELtfz0tYjUR3iExBjXNeLK9St8ndKwuhDKzdAcezPvdKDRuDlvBeKrQUzkTlqGg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HT+/RRcA; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:200a::60e; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HT+/RRcA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:200a::60e; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060e.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::60e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZRtCk0nkHz2yr0;
	Wed,  2 Apr 2025 03:06:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m6bFuTPrB1b0EOKxz4FOGq1Qkzb+zo4LmylRGCAAx7F1e8rYq2PNKHDCQU/vB7t7SmnVOlwibbPTZGZ1Smn+Rg4TG0UZ+pTMWhzezkVrd3wdlWNgsx6IidDTsQ5vhBBhoLKi1CiFWtHn0sBRDCydc/SeZD9BMpPDVzi5ZnAWqEpJYN/T+c8cNtkmYLZnzxudXUHjf8kMRn84fXrLcui2ViLZPDLchAyWL/olCKNDw/Lu/t+5zoFwjDUSdY49VSVIgExTyKQUJOskUv+bZJStDwVEbzS0oQgTihTwt4S02x81p/Uj+sHltDw+8cU+X2G3iV9MMUfyhkwVNHFb8JqLBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cexKPN6R9+KKQb6rMvVCqOTaSLaGQSEC1N4bRKEa7S0=;
 b=BivmjUUPTFLDtD/d7dI38Qfz8fFAKx0S2owmo60jv1Xu1jXwM4R7mFoqkqnxvfWWurVBowjAyd+ITmY7ycAib5g+8oCQQc8ZXOVwAPOKNksJFOrMkeDr9nqXxr7QsrJrytajrbjx76+tO1+oxYYdmDBM/wmXWYkrAUTUNiKnQZ2e8MAKzHnHl92O2+xeIVYwHPLk7kgoJY/muK/xh94O4Gd5BP+MzUv7SBcE1TvBKMpX+M1SKBV/wRgzVrY4Hs4OqUtkVYKU7/gPeCUK0/SSEIkwvKSlG/9P2Kc/WBZcfyV1GZTk6SkF+Pfs0F/K953Kv9ybxotPWAB8sIJTx3sAXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cexKPN6R9+KKQb6rMvVCqOTaSLaGQSEC1N4bRKEa7S0=;
 b=HT+/RRcAR4aW2f3WcNxv7q1pxGgSDHniAPoRLoyGLkIrJURAm/zCw0BRQW5sedSiv2Yc5B11b7gvd2QRBAXgiXjotEO2TNwqggoZNMIp5DJPGORcpzpTsO+MdAn95Vr6WoRYzzt7PqE0z6DQENdNWoYfA1q6In2egXUwAkfGr6uRtiiXw+kruLBNS18SESgqqJAlAsdVusJc6P1bTLtI7COqXq1v+WWnDNJJmBedhss5J+UnY0BT3qgj7I0x/d5wNTNUwIiuohTb2asEh5jK6kTvDdLBMi01+8ThUx8nXFBrP+fW3HiKyHoLz/WuOlhSM0dK5OEsDk0nPId6P8Wa2w==
Received: from CH0PR08CA0010.namprd08.prod.outlook.com (2603:10b6:610:33::15)
 by DS7PR12MB5912.namprd12.prod.outlook.com (2603:10b6:8:7d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Tue, 1 Apr
 2025 16:06:06 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:33:cafe::41) by CH0PR08CA0010.outlook.office365.com
 (2603:10b6:610:33::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.39 via Frontend Transport; Tue,
 1 Apr 2025 16:06:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.22 via Frontend Transport; Tue, 1 Apr 2025 16:06:05 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 1 Apr 2025
 09:05:46 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 1 Apr
 2025 09:05:45 -0700
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 1 Apr 2025 09:05:45 -0700
From: Willie Thai <wthai@nvidia.com>
To: <krzk@kernel.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: aspeed: add Nvidia's GB200NVL BMC
Date: Tue, 1 Apr 2025 16:05:45 +0000
Message-ID: <20250401160545.315380-1-wthai@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <f563b33e-f552-4a3c-bb45-6b7add876fdd@kernel.org>
References: <f563b33e-f552-4a3c-bb45-6b7add876fdd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|DS7PR12MB5912:EE_
X-MS-Office365-Filtering-Correlation-Id: ab61b4bd-cbb5-4581-777d-08dd71371bcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?x+8i5epfxxIVXfs1cxy2q3CbAm5hig3ps8RjuRuTKp//EmQfc6b9o+f4NWMb?=
 =?us-ascii?Q?DGjN1WD6UQBa5EhrdvDDMeuPgaQnaNvxeEC4owfW0R6F1l6j1qYlMxrL5y0S?=
 =?us-ascii?Q?7sI05skPfVG05yHL9hYQiWAjo+WydakENJ/fQYTknKViOKi8dPpouR9VSywd?=
 =?us-ascii?Q?kUanOZ0Ozj4cmQUQ0LfSBfFfj9govo2tLDxo+E1Xt7dk/CkUSKs/H3p8ZX+1?=
 =?us-ascii?Q?Fn4PATEIfWtfKgFn9sw8HyPMe2iXydTxy7GBtabAFJu0QPjbr7s7z/I7732P?=
 =?us-ascii?Q?nPP78KMpFrDGUuboQFsnuNwNPEKuJJfkpJFoINTZw9TT+ssG8MFEc73sVffK?=
 =?us-ascii?Q?qOLE7EWYoONUul+tGbcln/8laJorROLPwVUDM37ffQTGxsGDoXhbUK8ShwpK?=
 =?us-ascii?Q?PwOKrctXRML/J8JnLhx/PHqyLAID9SRzDMTUsLVO6QFpItQdmxrtAdx4JBXJ?=
 =?us-ascii?Q?T8vJkXFxPrJt84hYM9UFkKjNdirIiF4HlwAwK/iJ9FGJdAmesefgnSCpbZPa?=
 =?us-ascii?Q?GXKXnQGBWGUlV+rVfgbures9yEZlo+GZwBeCyK13NC19TKxHfocwuWW99qJ1?=
 =?us-ascii?Q?Ccgw3i8RhBVOF4zD+Xd2s1jwDm6LcH22+ZwahouJhdhm1ix7M8Ljw/QR9qrp?=
 =?us-ascii?Q?qyL4rbxoZidgKnpHrMxsHzv/aTko949i3cwpOpDO+ggXEOyckvdZY3crZv4a?=
 =?us-ascii?Q?UpTGTA9XZop2Dqe8JFLcjKtJk3PsC4wvWwer+Pp5XmRR+c03f1j8CuSdXRhl?=
 =?us-ascii?Q?fRGTmr/K0JfwpXe+0BiZGWX3gmv71AXNwBYKIt0/+13ABMqKGKQYr9otbeB5?=
 =?us-ascii?Q?lfFmt5sX1mEAKA0O7qfCYHMSNqikAq2iuG31vZ7M0Y7Zed7jQ07wGwGIkr0y?=
 =?us-ascii?Q?C+eBx0dTZbZCqpa3BDo8P/4S/oR2GLn3voWI+anhXXomDJMo3ugJYlSlRXSQ?=
 =?us-ascii?Q?AcYcr02hJ/Xoj8vzK3LdDphB+y6LAT120ROUIlna6zCNVe5LFHkoOT+U1Io9?=
 =?us-ascii?Q?yXSuHZA4FY7yrXLdr1Gl2lYlHNHliE/Kw4mgDIdONnu4k7dolG8PdTTZ+M7V?=
 =?us-ascii?Q?Mf77g/rMTi43seTY3cmXnezwIW/HxjkxdPvAf02Y1q5baGwcjvHxaopP1KTV?=
 =?us-ascii?Q?AaBXmAAhOWV6QmhLjRdCuwytYW65bbWn+/pTc6daTFu3tv6ZLkkgVZgqCzoF?=
 =?us-ascii?Q?3H2B5zILuFjr111Wb4wb+wEiGXDQXc8M9uUhKt6O8B/FyL5DS2QAgjL/GR76?=
 =?us-ascii?Q?gSsihxfHZoqFUUmRacYp/mJWselHNLxuty0WymFBZViO1RWl1pl8f2wHKOkw?=
 =?us-ascii?Q?DGCSlIHzg6dBkwVBDcRPKJzwlevDpBmY86x+mc11j2zG2Ttp3FRz/shUj3fj?=
 =?us-ascii?Q?LqL4qYdSGaBOl0X9Mf143T4lH5n6XRyb6UQRnbHZ0WEstXhCBGjiKXwSHPUK?=
 =?us-ascii?Q?uCJJg0e2GWEYFV7eZuZJDPvzW1eSMagJNyk/FUABfzdW9ujRoBI02C4Mdg1j?=
 =?us-ascii?Q?WpGKtzGsvlTmtoM=3D?=
X-Forefront-Antispam-Report: 	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 16:06:05.8375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab61b4bd-cbb5-4581-777d-08dd71371bcb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5912
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
Cc: tony.luck@intel.com, devicetree@vger.kernel.org, conor+dt@kernel.org, tingkaic@nvidia.com, linux-aspeed@lists.ozlabs.org, robh@kernel.org, kees@kernel.org, openbmc@lists.ozlabs.org, leohu@nvidia.com, linux-kernel@vger.kernel.org, wthai@nvidia.com, gpiccoli@igalia.com, maryang@nvidia.com, joel@jms.id.au, dkodihalli@nvidia.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> On 01/04/2025 17:39, Willie Thai wrote:
>> Add Nvidia's  GB200NVL BMC board compatible.
>> 
>> Co-developed-by: Mars Yang <maryang@nvidia.com>
>> Signed-off-by: Mars Yang <maryang@nvidia.com>
>> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Why are you faking tags/email addresses? Read carefully submitting patches. I really suggest using b4 instead of manually editing things.
> And if you decide for manual way, you must never, *never* edit people's tag. You can only copy and paste it.
> 

Thanks for the quick response, this is not faking tags/email address, I should have copied your whole ack tag.
