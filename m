Return-Path: <openbmc+bounces-364-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB4BB07CCD
	for <lists+openbmc@lfdr.de>; Wed, 16 Jul 2025 20:23:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bj4Dc2N0Hz3bVW;
	Thu, 17 Jul 2025 04:23:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2009::61d" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752690192;
	cv=pass; b=d21F/crM9ZBQD7FT/9h3dfNNGKqEaESbAuVLn0eKpkr3FihKuG1A0eiDH4ewtale2bTAlzX780wz7TNkJL1UhcwbNJEM6/8WFwoy6mN2iKgOEOz59lQQwzgoTJX+MlgiLjdgMmp+grCuaPfM8hCRV4XnDb9zmYodvUPfZd3uKklrcoGLe6iimhC2GPxjVCtVh2ruDlFlHdT7OAulZTihCXHfwguIRPBsbV4eQvIVa/3ZC6Yj4mg5DH2K1sOi6wpo0raZoOAE7JKgijTFT7GIjkZXdQ/4XLFlu6QYSpqCYKAR7+s4AFIYPP7JkL1Pa8GKt61nWs/LA2KIfLJuFbIAjw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752690192; c=relaxed/relaxed;
	bh=s5+xgvktZP1gnfMj7MRWLXEkFOIow0kXg8Y+3Vgk7xc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=iJ0+1Ei2ZHY/v7PWDf4mGcCdQRHwkkWZyjzNvVrZdirZudMZMAMti0TzhXc6cwgPAVSfQ9wW7JjZDzWKYZA4Vrl+t9v7AIEWHEZIR3L5IOmLHZ8Y4F1nqRaL7GvL82UvVrW9UKgVszNz+FSdK7wrRlaI7RjKvL/0yMshLc3w8qlnrrmtc5MY7jOQcfUyTINj1iwkQ320QtHrd0CytE+wTlPwM9borCpWLw28FbTRQX/TJKY2A4a99ZuIPZhixieg7hecxiizKFkagKLSdTqYDzJTqZVN9n3+gveIbBD0C0Vcfm36z9uHdFRJmFYjPCG+uffgYp51k32Cfxlp8UphAA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ha/y6PaJ; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2009::61d; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ha/y6PaJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2009::61d; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2061d.outbound.protection.outlook.com [IPv6:2a01:111:f403:2009::61d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bj4Db508yz30Vb;
	Thu, 17 Jul 2025 04:23:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ID7ekbrh/HWdVvTz2qwwL2KwONRqf0vh0KteJDJd0cq6AYJy9IkfcEzk5DCG+mx6H77n1P9SOWQmGJRjPgk8At7XeoeaJMjl+GUd/DdkWgw3owr6P9CuxCndRVqlO80BhRATWZErJOgmZBCEabJFz8+OVnxYVBnLrP+GLFgS+ZBZcAnADWwIO4F5lCfwmYrX1+oZBoPcIhXgFEy3k3+arv+nIiuMSk4UHvUzx9qFKcSc6l3EjcPkYlNvAIxOt53WF8gjsNQjvTjXrFQzNaye6wEIE8uDoo3dmG1uUoTzV4OrQNH+pI5PmSQAx9fQ92RXuB8+L5T17N+KAZ8V7g+S6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5+xgvktZP1gnfMj7MRWLXEkFOIow0kXg8Y+3Vgk7xc=;
 b=UL4dOkkdmU2gT/5tdzHJIFC404MzHvPT6DzLXn2R5I3UTtQeHpf+8Fe2VzggHI02w9a47gRroYiuiVaax5oCqRfAevchlYKk85AdywT3ovVoI4yTX3PZbAHq/eJ9Nui+RJ5Din5cGTnuUxZDIdW11nQny1tvQoC1yr0Hvw6ArNLa6oc/ephxh+L2iSTb/hrc2jbksgRmi+GzI4bjuT4w3RNCRJKHKmt3Lle7dJpIePqy9W0J3sKzZ1RDaR+8wulatZrDXH9c1OFWg6Dd9VWbrmJxgvUy745TL1SzjJlZjl4W6a+RknDIUNKtJ+4XGN51kwNsu+kPl1ihoUMEhu4jEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5+xgvktZP1gnfMj7MRWLXEkFOIow0kXg8Y+3Vgk7xc=;
 b=ha/y6PaJWFT6P8Hujq/W8YjaI7KQg1AHw1BAFYXMAOrV2d3383P/GxRuHr60v+nGbQ9Vd4l5vDXEwRxrEADCxeBSaVfA5J1wGw0hreBa09roRmKAHwvmEtdmX7w24v4GKEtVwdzQe0P+2/v1QnU2S6gil2PUtg1PNFF4HZ2vCjJaUPtq0+JOXXxqrgMrxRDWiNTAgBVMXCeDB8CGatfnMKJUMiDfowuF0RfXf0jBF9klZdcTp3Xo0y6VDuWcj7Y7wbiIMPSjzo2NTKLMcHIfQgF2/hQnnjXFya5tzs0uwi9IyskR76M9pnfnpcK1AMs/ORenLubR3D1QmAkbUZCxiA==
Received: from BY3PR10CA0008.namprd10.prod.outlook.com (2603:10b6:a03:255::13)
 by DS0PR12MB6582.namprd12.prod.outlook.com (2603:10b6:8:d2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.36; Wed, 16 Jul
 2025 18:22:51 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2603:10b6:a03:255:cafe::51) by BY3PR10CA0008.outlook.office365.com
 (2603:10b6:a03:255::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Wed,
 16 Jul 2025 18:22:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.1 via Frontend Transport; Wed, 16 Jul 2025 18:22:50 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 16 Jul
 2025 11:22:30 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 16 Jul
 2025 11:22:29 -0700
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 16 Jul 2025 11:22:28 -0700
From: Willie Thai <wthai@nvidia.com>
Date: Wed, 16 Jul 2025 18:21:55 +0000
Subject: [PATCH v2 1/4] ARM: dts: aspeed: nvidia: gb200nvl: Add VCC Supply
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
Message-ID: <20250716-update-gb200nvl-dts-for-new-hardware-v2-1-9a1a916f461d@nvidia.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752690148; l=4653;
 i=wthai@nvidia.com; s=20250525; h=from:subject:message-id;
 bh=4YKBGVin4fIcApqjT83lHdFPoOly2P5FAdZ6KRKPWyE=;
 b=p+jTzZEttrSScjMtx93YGTlBqptXLHHQRSuAJ9Rs1be60cOdKnExIYUvJrwVtxRbctjDb2ebp
 8Uximazj/szD/0I1GI018Q1qF/tMypSNExSeAy8rG9N/N5dSd5A9oaT
X-Developer-Key: i=wthai@nvidia.com; a=ed25519;
 pk=i/6dxnUqKdr7Z6GA0KECRkwz5HX4RCiodw0v6kB9fbs=
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|DS0PR12MB6582:EE_
X-MS-Office365-Filtering-Correlation-Id: fa69de80-359a-4804-c23a-08ddc495c5cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWhZM0hvWlpSRkhVRVhIcDFGZHJXZDlQMGVVZ040dVNBV0h4Um5rc25VaTFt?=
 =?utf-8?B?ZFJuZy9OMkhvN05sTXhGa25vd25QT29CRmlidmhUWjdvYnJOTmplQ0Z3aXJU?=
 =?utf-8?B?M0Z3V2lPNlY1Vm13L2gyNldjMkJNY2JjSFZCN1JGc05MWW11MlJBSkNuNWRI?=
 =?utf-8?B?VTN3Mjh2UGpoRm1mVkI4QWRyZTR5b1dMQlBXaHRlaFhqVnVhUTNWbzFRTnF0?=
 =?utf-8?B?V0FnUTg3ZHp1OVo5UlBTYVc4b3JvbVlVSmExYlhVN0I1K3pNQ1hiSlVhQXhp?=
 =?utf-8?B?WlBEV3l6dU9jK3E1eFZpTWlqYWFpQytaNElNVCtUZkhvcHFpS1BDVStKY3dT?=
 =?utf-8?B?ZGhMYTd1WEh0anZyNlZmOGVZc2hQbHRKNExkMCsxYlBnVTRnbE8wVURFaExS?=
 =?utf-8?B?UG1BMGtEUzcvc2VOaHRMU01FVEd0RWRFaFhidzk5Z3hoMXdOYXc3T3c2L2hi?=
 =?utf-8?B?MlNQNWprUThBVERBZElDLytBNngrQ3Q3bGE5OVBGU1c3c21uQm1lc3J4Z1U3?=
 =?utf-8?B?WTNKcENJUnY1WWdMWXZXOFdzZXlnTzNxM1RUc0JjOFE5UEtYbGovd3lKUWhr?=
 =?utf-8?B?b09iOXNyb0s5b0R3SkVoM1RWWkxiWHpDa0dmVGpWQUROOXppUGF4VW9wSC9t?=
 =?utf-8?B?R0dsRjM0eENvbElyNWxXVWVFaEtxUkNVekp2YU9vbHlXRXJmdGtlWEhFTmxL?=
 =?utf-8?B?OHp6S2VzcWFjYm81eWxDcE5VUHlCV3UxNFd6aTJnQlRvTzZWelU2eDY0R3J5?=
 =?utf-8?B?UXBjSE01eWxBWE1ZL09lcmVZQm1ta2VOZzc3M1B0SExrdElMT2t2M2NkemY1?=
 =?utf-8?B?UnFtZzVEclE3dzhqdURXWVRsWkx3YWlQdXN5aDZ2UmpVWEtrTTFYNnkzbXdq?=
 =?utf-8?B?MDQrZmFCaWFTdnFsV2owZ3ZGeUhNaWRsNHpQNHV3aWVBTjFvcmhGaUUwZEJO?=
 =?utf-8?B?dDg4YWZ6c3hnbkhCMDlJNFRRME5LQURyai9SUFJuOTRJUTVjL0kvUlkzbnVm?=
 =?utf-8?B?UGJ3NTlabzJUcldGWGFxeXpkSFIrbVZ0TVRkRi9JVkJFM2hkWk5jTTgwMUNC?=
 =?utf-8?B?dkZ2eWg3eDl3N0VnNTgvcEhWTUVCSDZlZS85aXdxTWdrUnZoeHhRQm1RNkRa?=
 =?utf-8?B?UHloODNIU2tuQm5IbmFaY2VjdWI1dTlxa0ZhakhPSW96THdtMU00bE1zNi95?=
 =?utf-8?B?NVB2QXd4STVBNXkySExkZTRWRjg1KytWK2lJUWswWTVXRnVIdUx0ajFmVXBT?=
 =?utf-8?B?azE1bjQ0NWtmL09xU1VxWDdsRWFSUjdxTHNCRVduUW9tdXA1cndjZnU0THdG?=
 =?utf-8?B?TXE5UzFKdmRHRGt2aWM2K0o3cWZEbjZNMTMvMlp1bXNBR0xpUWNzWXZDZXMr?=
 =?utf-8?B?UlRHTlBzKzhqVXpqRG44TEFUZlJLOHM1RXVHc3ZuMzRlc0ZYNHQwdXQ0a3hj?=
 =?utf-8?B?enpxZG9VQWRLaUxLQjhWWU53ZWpIbk1jYVMxSGlTSE1VdnFZL3pHZDNISnBB?=
 =?utf-8?B?Yy91VTJHZVdkdHhidjA3VTE4NVIrWktIQ25EYzBrWmxTRU4yMFVldC8rTlNv?=
 =?utf-8?B?eDlQQUczS1VMa1hzRTFGOW1oY3lQVkVEKzM4WFhjOVBPQUc4UldSNjVyUE5Z?=
 =?utf-8?B?NHlab2ZiWTgzR3YwVmZaWWM2anozZUJqM29HeG1iUFR6dXVvL3lwV0ZCRHNz?=
 =?utf-8?B?anR0b05yM3BxWDFCai9nVlVpU1dFRWZPYnBkWUIwV05SM2w3ZWFra3o3VTVs?=
 =?utf-8?B?L1UwRllXZzZiVmt5czVyVjdPRmNEaDZzaXR3TlBCaWVwV002dGhlMExLZkRk?=
 =?utf-8?B?aFdGUjc4emtIUzRtd2w5M0lGMG50dVpxTmI5bHlrRFJ3WFlDcVAwYmF2Z3Rp?=
 =?utf-8?B?RG05UFA4QVF2aXNJMEFIUktYYnBYaVI0clpGNFNhYVlHZi83NFM0K0tETCs1?=
 =?utf-8?B?dVFqeDYxL2xqVmtQczFUb2Z3eVY5b3NKMGxRVGYvRFRaU2RNMVB3NmJnQUkv?=
 =?utf-8?B?aUtjRzlZd2ZjODVUMFYwVGtBTUFtazg2OUp4eXcwWVVOd0tKODFlK0Q4aWNN?=
 =?utf-8?Q?AuYiQN?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 18:22:50.2730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa69de80-359a-4804-c23a-08ddc495c5cf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6582
X-Spam-Status: No, score=-3.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add Vcc supply to avoid probing the devices before they have power.

Signed-off-by: Deepak Kodihalli <dkodihalli@nvidia.com>
Signed-off-by: Ed Tanous <etanous@nvidia.com>
Signed-off-by: Willie Thai <wthai@nvidia.com>
---
Changes v1 -> v2:
   - Fix unevaluated vcc-supply properties [Rob Herring]
---
---
 .../dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts  | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
index 41e3e9dd85f571254a08d40e68c0d8f8f049256b..bd9395a194137ea70d184665ad6cb659541ef175 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
@@ -126,6 +126,17 @@ button-uid {
 			gpio = <&sgpiom0 154 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	standby_power_regulator: standby-power-regulator {
+		status = "okay";
+		compatible = "regulator-fixed";
+		regulator-name = "standby_power";
+		gpio = <&gpio0 ASPEED_GPIO(M, 3) GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		enable-active-high;
+		regulator-always-on;
+	};
 };
 
 // Enable Primary flash on FMC for bring up activity
@@ -431,6 +442,7 @@ exp4: gpio@21 {
 		#interrupt-cells = <2>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&standby_power_regulator>;
 		gpio-line-names =
 			"RTC_MUX_SEL-O",
 			"PCI_MUX_SEL-O",
@@ -464,6 +476,7 @@ i2c-mux@71 {
 		#size-cells = <0>;
 		reg = <0x71>;
 		i2c-mux-idle-disconnect;
+		vdd-supply = <&standby_power_regulator>;
 
 		imux16: i2c@0 {
 			#address-cells = <1>;
@@ -528,6 +541,7 @@ i2c-mux@72 {
 		#size-cells = <0>;
 		reg = <0x72>;
 		i2c-mux-idle-disconnect;
+		vdd-supply = <&standby_power_regulator>;
 
 		imux20: i2c@0 {
 			#address-cells = <1>;
@@ -545,6 +559,7 @@ gpio@21 {
 				reg = <0x21>;
 				gpio-controller;
 				#gpio-cells = <2>;
+				vcc-supply = <&standby_power_regulator>;
 				gpio-line-names =
 					"RST_CX_0_L-O",
 					"RST_CX_1_L-O",
@@ -584,6 +599,7 @@ i2c-mux@73 {
 		#size-cells = <0>;
 		reg = <0x73>;
 		i2c-mux-idle-disconnect;
+		vdd-supply = <&standby_power_regulator>;
 
 		imux24: i2c@0 {
 			#address-cells = <1>;
@@ -602,6 +618,7 @@ i2c-mux@70 {
 				#size-cells = <0>;
 				reg = <0x70>;
 				i2c-mux-idle-disconnect;
+				vdd-supply = <&standby_power_regulator>;
 
 				i2c25mux0: i2c@0 {
 					#address-cells = <1>;
@@ -648,6 +665,7 @@ i2c-mux@75 {
 		#size-cells = <0>;
 		reg = <0x75>;
 		i2c-mux-idle-disconnect;
+		vdd-supply = <&standby_power_regulator>;
 
 		imux28: i2c@0 {
 			#address-cells = <1>;
@@ -712,6 +730,7 @@ i2c-mux@76 {
 		#size-cells = <0>;
 		reg = <0x76>;
 		i2c-mux-idle-disconnect;
+		vdd-supply = <&standby_power_regulator>;
 
 		imux32: i2c@0 {
 			#address-cells = <1>;
@@ -729,6 +748,7 @@ gpio@21 {
 				reg = <0x21>;
 				gpio-controller;
 				#gpio-cells = <2>;
+				vcc-supply = <&standby_power_regulator>;
 				gpio-line-names =
 					"SEC_RST_CX_0_L-O",
 					"SEC_RST_CX_1_L-O",
@@ -768,6 +788,7 @@ i2c-mux@77 {
 		#size-cells = <0>;
 		reg = <0x77>;
 		i2c-mux-idle-disconnect;
+		vdd-supply = <&standby_power_regulator>;
 
 		imux36: i2c@0 {
 			#address-cells = <1>;
@@ -862,6 +883,7 @@ exp0: gpio@20 {
 		#interrupt-cells = <2>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&standby_power_regulator>;
 		gpio-line-names =
 			"FPGA_THERM_OVERT_L-I",
 			"FPGA_READY_BMC-I",
@@ -891,6 +913,7 @@ exp1: gpio@21 {
 		#interrupt-cells = <2>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&standby_power_regulator>;
 		gpio-line-names =
 			"SEC_FPGA_THERM_OVERT_L-I",
 			"SEC_FPGA_READY_BMC-I",
@@ -949,6 +972,7 @@ exp3: gpio@74 {
 		#interrupt-cells = <2>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&standby_power_regulator>;
 		gpio-line-names =
 			"IOB_PRSNT_L",
 			"IOB_DP_HPD",
@@ -1014,6 +1038,7 @@ i2c-mux@77 {
 		#size-cells = <0>;
 		reg = <0x77>;
 		i2c-mux-idle-disconnect;
+		vdd-supply = <&standby_power_regulator>;
 
 		e1si2c0: i2c@0 {
 			#address-cells = <1>;
@@ -1054,6 +1079,7 @@ i2c-mux@77 {
 		#size-cells = <0>;
 		reg = <0x77>;
 		i2c-mux-idle-disconnect;
+		vdd-supply = <&standby_power_regulator>;
 
 		e1si2c4: i2c@0 {
 			#address-cells = <1>;

-- 
2.25.1


