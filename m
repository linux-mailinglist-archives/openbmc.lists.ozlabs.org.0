Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF085A7DEF3
	for <lists+openbmc@lfdr.de>; Mon,  7 Apr 2025 15:24:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWVKM6Cqjz3c6c
	for <lists+openbmc@lfdr.de>; Mon,  7 Apr 2025 23:23:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2407::60a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744032227;
	cv=pass; b=EEkcdrUPg6cltHd9/em8iuJaL0jeiAwz1ap8VgMQzo/n1Whx5KlM67foK5f0HV9H09Kc0KJmYOHms+L1YDySfflMx/k8juuQxPZiVF/ulE8dxOcpIxvswfE85eWskFZultbbyT8iTdY3ByYyjXeYmQp/suw47KhzsW7gpHNYmh92OTQX0dqD8EtTaVVuQc81xNA29hOddnJ9WYHds6So/mc/2Vk02MYs3WqEgkjYTVRYPXcBwAS1ulGkQbT1begAbxXQ9jnwFp/y63rI/ODHyX0KePISSlCGVDcZ294yk8Ck+aXp9wuDzoI7gESksX513nxoiEcgHWAq/x/RQus+lA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744032227; c=relaxed/relaxed;
	bh=CVgM58un3cCtD3jqVbcyvq2wq7hPlyYn9rgEReqakus=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fnzJtKffLWZIv/FzEykbmxQiwzIV/pANNiAR4dIW3D8thrH+rk3wBKtRB8F62xzHNEekJXTSxiQDEmBrjK3JboWlC8vOB6CUkp31TzNp2bmiBJKVlqJoWxH8FkhuDb7QYT+Knqdmow0VL1e+p8jyQpxOMq9V1CRV7Cj321NUdDPccNLOgZ5WR6rjvt2jdeJ8ZGV2GpPgIBwm5yfNIrkkTPIePpekrkhVGSagIYHDTemv1k5XFrfo1I1XJdNRPADGtWbtdf0f8YxWE4FAyV6lYv4S08huGDkH4i4K2auTaUF2j4q2N1PfU8ePX3VIK98mwzFna0nB7/gw043HqaC/OA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nGMf8AAz; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2407::60a; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nGMf8AAz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2407::60a; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f403:2407::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWVKG04mKz2yKr;
	Mon,  7 Apr 2025 23:23:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JNd6rrhhx74Dk4N/FAmSM2rG46HMeeYx23V1FF3aIyucgWYphxU0FQffuc73WdwnddBvPKrBVxTbFDdOgeS0sujmlPZWhrSVrMliJh7rU/QGjZl13253r7/pix7alk9bX44nNtpiE/t9tpWpU6C6vX1WllpwQjU/9Vs3nBLBmWuHumd8CF2rjdwwka2tANPKrxHKyUyWijCKTYfaaeKpQI0vx9k8i1sh0Kku6nlBvY9+9GddArqE2XRiekcFMcR9J9u2hN4RaI5TMVicTiaYvBIe3G+Jw/2OTbw6IeWL4cD20etBlgJv+eborvYr+ZpNH9ws+apLBfDCP/G3Gj3JwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVgM58un3cCtD3jqVbcyvq2wq7hPlyYn9rgEReqakus=;
 b=BlGoWt2dr2WZ3J99KPPOaVpMZG3VK0S6M02yfI+hXJdsiGBnswR4kIrsz9KGzsa2FFYSzbT3rfPnhImlL6Wn/omvHAvvBTZrDSIKGeY5gy2EDnUcO3PjswqqxOfApu7nHKGuaN+jh9cAueHCmllRmdFZzS7V6RXDMkh3p3ntcGLrONQ0cVhbVFX5ModunYEfwQ54QCbGWD9xCTMP4Ls/X+nGsH82kBCD+i53epPpGvcWqexh0h7wKww5kkQZI/kqlB+4rH4ZpE+cay1j4DhDQpKc0e54HWQyJv7gdo/sr+k9eTnZFDiXKy2mAUv4eSbij6xKgszeOumq+QFSxEfWuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=codeconstruct.com.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVgM58un3cCtD3jqVbcyvq2wq7hPlyYn9rgEReqakus=;
 b=nGMf8AAzjfNnEfOpvrVJeNTumdqDHwxBR0d71pZDA+rOibUIe1uUmyGE4OA+XPVGSNWT9orASs6IMuz42gj8qL3aY+P7jcfNo987jv2cbNy5WH0Ds7x8h+O5DW+nYYEwpJD7W/pwLaFprJT4JbOXpgYIjKa5zCK06/EILzMOiYUTzfn7AmJXgMPf0eCvMWB7DdwcpmJX5wgFtKXIvLdQdtIEFR6fR2wbUaNsexV7AoGSvBYExFDebsMcAzlNhxa3OJ5FCXHoFS1n1reWINTzI2GVK6Nc0/zqrb/dk2zdnKRrBW5gd6LUq0VtxdP/z6UWKPZLFkSLglIfzMXkZRUjSA==
Received: from BL1P223CA0036.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:5b6::18)
 by DS7PR12MB6167.namprd12.prod.outlook.com (2603:10b6:8:98::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 13:23:21 +0000
Received: from BN2PEPF000044A7.namprd04.prod.outlook.com
 (2603:10b6:208:5b6:cafe::80) by BL1P223CA0036.outlook.office365.com
 (2603:10b6:208:5b6::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.34 via Frontend Transport; Mon,
 7 Apr 2025 13:23:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN2PEPF000044A7.mail.protection.outlook.com (10.167.243.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.22 via Frontend Transport; Mon, 7 Apr 2025 13:23:20 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 7 Apr 2025
 06:23:08 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 7 Apr 2025 06:23:07 -0700
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Mon, 7 Apr 2025 06:23:07 -0700
From: Willie Thai <wthai@nvidia.com>
To: <andrew@codeconstruct.com.au>
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: aspeed: add Nvidia's GB200NVL BMC
Date: Mon, 7 Apr 2025 13:23:06 +0000
Message-ID: <20250407132306.355343-1-wthai@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ca1f5dc3d0dd53dfe6abd9d6bea98838980f0840.camel@codeconstruct.com.au>
References: <ca1f5dc3d0dd53dfe6abd9d6bea98838980f0840.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A7:EE_|DS7PR12MB6167:EE_
X-MS-Office365-Filtering-Correlation-Id: 015495dc-59c9-4672-5217-08dd75d75d71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?2/z03BCqdgviRnAcEcgjEwAQVTCWJ+84ccb76O4Yr/TOhyco6OD9r8AJQnBH?=
 =?us-ascii?Q?AnqnW0eAK4RMfi0KQGGlUDbG85l5WBfQU0XbR7wTiKTL0GbNwZEyNVFyq8LP?=
 =?us-ascii?Q?SUhvDvr/hBzwmuEO8yHSURmiplzTvgIrWPue47G25SFCaWzHSv5Dd5nRslUA?=
 =?us-ascii?Q?H7+nFxukChPb7qEj4urDO0nT2bBfaIwJRUTIHVWOn3H99mZdooVfWAyDCspI?=
 =?us-ascii?Q?/M/b9AfHNpDNrmq5xxOPytt0l/q1T4EU4uxD74GfOg8DCER0rebc22jzwaG+?=
 =?us-ascii?Q?rxxTajxqHcYffw8ewDoiVFLXAgWn//uyzZJ7fQ/sXkhwbNoFHB3rFW3YJHWY?=
 =?us-ascii?Q?NbcUajfL/vG0ixAQzCB+aaC6DSo3sJuU2/evOWz6NWdRN9rDLUkkmlZElpPz?=
 =?us-ascii?Q?Q6FQjNpmhnf+6PEppisPGyX6Jjpolq1D9ZeR9o0tobbTwYsCT4AH5O1eLCE5?=
 =?us-ascii?Q?zZnRv5jOfsTZe5pq0lqpeCnIluWyl1YYttMhR1fTgwSRTXIpRo0GcGjo7mFn?=
 =?us-ascii?Q?TymCNCraZH5mn16cjODKmJRCQgjYZ8cx21UH2JDFfFw0FZZLZ19BP4flxjYg?=
 =?us-ascii?Q?0sjE2nv5nBfdjQRMGiC+IgF9QPE5c8RRKfxziBMPeh2UUfqbOI7fRftAxafF?=
 =?us-ascii?Q?+jW3+seky/0dqIlSHSr5YlLV7/8q08rFcLU3F44nvicPnExr795DdIW8ULap?=
 =?us-ascii?Q?2TteIi9199joaIc8v/wLsbNekA6GqsmfrAwd/2z+YHI9tRlUUhSF4ThwunzG?=
 =?us-ascii?Q?7oCp22znc08OOhlklZZfK+BgPsXEwXoCQ8XkiRGuAfueVHlrQmIeVhrlJxvi?=
 =?us-ascii?Q?JJMDnJkmdKgP1nj8N16TnNroDKadw4QyFl69r/WxHedzMn3QPOxgxAJLCsF6?=
 =?us-ascii?Q?tmwnkep1YsS/2JSt+jpG0p2eBRvumw6QrGSd+gzeGiL3gpZc3nA9M853pFUH?=
 =?us-ascii?Q?1ZsMT4730dMPxE15LEDfEJO4u0gKaWMNOD69f6tB161fg/6AVjiqK4NbfJdE?=
 =?us-ascii?Q?CmdNq94z57sB9iSluCHbrEMfXu+Ebfryqj9fanoiWDJfi7uwUojM92y1Ax3m?=
 =?us-ascii?Q?7I9g8ug7/ZUt2/jLk8ELMwMRh77aJ60+zXTzumviNbaQ9CYLaSw91/nP/BhV?=
 =?us-ascii?Q?9JT+RAyF2c26qFY2Zbt0KXAfCcOrYKmNxgGfoiUPX9dZxqVP+1huaZMeVl2x?=
 =?us-ascii?Q?Qxl4nbvP8PYK9/GW3ML7pdqeVfh2DByEgSDAnlFqhhTMmtWvCyiFYQ5rDWOe?=
 =?us-ascii?Q?NfEI1LzSY568X/DaDtoNX8wpiVQf3ok2Uj/1uRakSyZQ9bquk+vfWQxY93U2?=
 =?us-ascii?Q?zz+h8HnJjMkNcBGCh8/pl47fJy2QwHouTcUn1pXufM6TSK0ghmy9K/pklzrM?=
 =?us-ascii?Q?wn9SK3BvF/LzxassfZTrx/V508EiqwSTJ09LetKTjNvWWU3otu7LbFOp4WDT?=
 =?us-ascii?Q?ViXB1i+YHebBd0CImrAOrBdqdDbhuZcVpdC8vdzPVC3YtgqIV3pumAZ5X1dc?=
 =?us-ascii?Q?pyAZo7ja4tdtO+w=3D?=
X-Forefront-Antispam-Report: 	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 13:23:20.1198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 015495dc-59c9-4672-5217-08dd75d75d71
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BN2PEPF000044A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6167
X-Spam-Status: No, score=1.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SORTED_RECIPS,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Level: *
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
Cc: tony.luck@intel.com, devicetree@vger.kernel.org, conor+dt@kernel.org, tingkaic@nvidia.com, linux-aspeed@lists.ozlabs.org, robh@kernel.org, kees@kernel.org, openbmc@lists.ozlabs.org, leohu@nvidia.com, linux-kernel@vger.kernel.org, krzk@kernel.org, wthai@nvidia.com, gpiccoli@igalia.com, maryang@nvidia.com, joel@jms.id.au, dkodihalli@nvidia.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

>  On Tue, 2025-04-01 at 17:51 +0200, Krzysztof Kozlowski wrote:
> > On 01/04/2025 17:39, Willie Thai wrote:
> > > Add Nvidia's  GB200NVL BMC board compatible.
> > > 
> > > Co-developed-by: Mars Yang <maryang@nvidia.com>
> > > Signed-off-by: Mars Yang <maryang@nvidia.com>
> > > Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> > 
> > Why are you faking tags/email addresses? Read carefully submitting
> > patches. I really suggest using b4 instead of manually editing
> > things.
> > And if you decide for manual way, you must never, *never* edit
> > people's
> > tag. You can only copy and paste it.
>  
>  I've applied the series, fixing the tag in the process, along with the
>  line-wrapping of the commit message in the second patch.
>  
>  Willie: scripts/checkpatch.pl warns of some of these things. Please
>  make sure to use it in the future, or if you adopt b4 as Krzysztof
>  suggests, use `b4 prep --check`.

Thanks Andrew !
