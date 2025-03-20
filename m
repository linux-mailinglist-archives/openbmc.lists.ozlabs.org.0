Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C055A6A308
	for <lists+openbmc@lfdr.de>; Thu, 20 Mar 2025 10:55:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJLYM1NbPz3c7b
	for <lists+openbmc@lfdr.de>; Thu, 20 Mar 2025 20:55:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:200a::62d" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742464530;
	cv=pass; b=FkDDPdZ0miH+B7xszI4WtF6jhjOK5qG1xG8kLVP8rz8yUEZy7eD7VlsJU3VYR+pzM7J5bT0Bo4EQ/AlPp9F/RF7ttJrYPmFuNtDOiDxUf6cxBa4gIh3WGK0e0UjTVWgoyfTktyA2gouzdmnbch2Iun/STMCwBeGlCen/IifVvD/DdcDPd9fUmp/9yDJatfjWMtQ2b+Xw3qxo52QGGhRF6QJmJYliIls8ZfTuu/DcwQNCCU2p817iD1HM9cq7psA9ZV6Y8W4v4xumficyACg0uQ2TvHf1dNDBZ3gTMFuxmmv+t19FEeFdR8o8r71pP+G4t9TR+lS55I4I11v7uhZtzw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742464530; c=relaxed/relaxed;
	bh=C84KRbnTiAgbtppkPmlo0OEBWM2psE3fOov+Eg8qFJg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V89KoVeKTGtyQTE/5VAPak1v5ge4t7J1RJLPKLl7BQl4UPnvPHI3e+zdrizx6zlRH8LfTFSs5CX5xZYMTwymmxrtewWi81JsBIQ67FErMzvFsTDc//9vovNAvgYCyGKyNAvYgrFzBaMmE3TqRGeVTL35pT5X2AZsEJCGu205bre+r3zM1L8BmIinFJ+H/EVZ6ewt9UuX+CWGUlXUeAMeJEs8s8UpC05pkSsl/sX5Knob1itu6syz103YzyJ6mNDOBM7MmqZGod3X/Xa3GvI4iqh5Y3PlLXY+f95qQrEraDYby1LOYuit04HxRqL0ptVv4F+s71ZMwGS4XCs2l6rP3g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Yh9bqwvm; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:200a::62d; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Yh9bqwvm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:200a::62d; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2062d.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJLYD3Dmvz2yf4;
	Thu, 20 Mar 2025 20:55:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XqVkwX7KKc5Gw80ZnCdQrHBU64zObHtxxsKdDZdfhleg8+s7q5/OX3Yrssn2B3ovvYsVnsSS7INEYJOfxIqAw+MQPRKLd6C6FYJUeTIY77NxV/4KCwvtiqggud97LFllbsmH4PYtTUY9w1K6q7nLmebzmyE2hE523p07qUO5laMdtWZrxgDClsjy1lKld8yVfYFH5lybrzq7w1RYNmpsVZRSeL3NnU1GSlaI9YWYWVFwe/pn3wHFHwAvEDS6jLle+nb++hR+j5sW7+sEZMTHBuk9ic84vD7gelWxDwzQkE6UA/CmdNvQtXMb2jTjJZMQVv3i8FaToZCO4/BbvsfL+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C84KRbnTiAgbtppkPmlo0OEBWM2psE3fOov+Eg8qFJg=;
 b=r3re3QAaM4PzsiIO2TrDr7Nusv3Srewvb/+OoNoW7wCrToC9A/icl+4UvmQd5Qr579Oaul++/DV88QTrqba1NLbJeRlNNB2CHBrxL2mWJHY87x9QjXLL9/9872VQDTqfQ8ArM07VliT/AkOw0SuOFfRP9c8RHOQFXX1yYlsbC6Xuy3aywDyaBO7LNO/3H0FVLk1S1qCniRFvN33l+quR8GHTC7namqd/7Rc095xD/+9jV9qDbYvJWyQ6XdI0GTzlE+/LdkC6A4YHQS4pHvK/CqKZuWQhhCAxImypzEBY78XBFEqhHhasWF3evwLrKYPFWM7Wg8DNozzMeWk/4CQafw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=molgen.mpg.de smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C84KRbnTiAgbtppkPmlo0OEBWM2psE3fOov+Eg8qFJg=;
 b=Yh9bqwvmX+t1by+JZMUjVxK4yYKe71tUOXOH7LHlDl9Gqhr1lrADkDAr/Cm0tbLD5KVQCnc+0fT/SH3aptiAPqGzRSndUnUgQ5mDVJ4qeMVG7zgmfkvoYEIIJJL9os+uj1M0Yq7zj0Mv7gv52Gt48uHk3PO+uFEqxnAl/EV08ai/2qsONVR0bQUZogSSWLCrOGjPhuF1kBLP6IXlWag7g29nLg0IBtGlZU/qdgjR0OpQXqyoTXs17GGIBAQx2vk467Azpus79Z29KiWaof4TN61KuGbOeJ25v4ddRQ5ZwEHaEmOjKHf5hRMBQnfE3PwoWqn34uq4vnDCb/vUKgx5Pg==
Received: from CH0PR03CA0383.namprd03.prod.outlook.com (2603:10b6:610:119::18)
 by PH0PR12MB7080.namprd12.prod.outlook.com (2603:10b6:510:21d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 09:55:04 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::c) by CH0PR03CA0383.outlook.office365.com
 (2603:10b6:610:119::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.34 via Frontend Transport; Thu,
 20 Mar 2025 09:55:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Thu, 20 Mar 2025 09:55:02 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 20 Mar
 2025 02:54:49 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Mar 2025 02:54:49 -0700
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 20 Mar 2025 02:54:48 -0700
From: Willie Thai <wthai@nvidia.com>
To: <pmenzel@molgen.mpg.de>
Subject: [PATCH] ARM: dts: aspeed: Add device tree for Nvidia's GB200NVL BMC
Date: Thu, 20 Mar 2025 09:54:48 +0000
Message-ID: <20250320095448.55851-1-wthai@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <66608647-0ac8-44ad-b1af-f9bd0e120696@molgen.mpg.de>
References: <66608647-0ac8-44ad-b1af-f9bd0e120696@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|PH0PR12MB7080:EE_
X-MS-Office365-Filtering-Correlation-Id: 1323b41e-bb37-43a2-671a-08dd679548d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?VXBDQnBnMnljandtR0hpU1dkSTlJaFhmRHlrSGlhd205MkpuckFMM2d4OXdV?=
 =?utf-8?B?MkVnWDIwTjB2RnVEZVlLN2V3eE5nZWRuNG83bHYyb3MvUktVcHg4SDRWb0l2?=
 =?utf-8?B?K05UYUY0VW9jUnoxcWlMU05MdGxncTdzbll3VEVVOEhib0hGRm0vRnZSZE5s?=
 =?utf-8?B?SlR0Mjdva3RGdW02bE1vODIvaGRxUGc0dUltRGw5S2tXcDQvaUk5WGFTME1W?=
 =?utf-8?B?M0kvbU9mZ2ZXYnBZcWJxOTBabUN1NnRWZWpleGtJZWUwVEowbjJNUmpiUVdY?=
 =?utf-8?B?TGlpNWJ0cHBJbDE3Wk1PNXlHQjY1TUN0SFZHRkdkNGNRNTNEQ0lPTVU0YlJx?=
 =?utf-8?B?WUM3S05PNkwrSVpRR3B3UVBINTk3NW11UkJGMkMrWDd5cTRjYkllZDk4L3pt?=
 =?utf-8?B?TnVYWXRjOE9Xc3NFNkFqc1A3cDludE1oeTdKVFlTQjRCNitzazFOU0hRVkV2?=
 =?utf-8?B?S2xjYzM3RXljT0hXT0FuTS9hZHhzSVdoMnh1VklpOTR1S0JKYmJGL0Q5dWM2?=
 =?utf-8?B?T2p5Q1c2T0lRenBWdVVMeHVhcmtqblVJNkhZRkxBRWp3ZC95cno4czliQjNV?=
 =?utf-8?B?OUp2L2wzOU8wVXhkV0IvdHZUblcxL3BNdUFGOEZQOWZSenMyemQ0ek1Uc2t4?=
 =?utf-8?B?UHNVVG5Nd05UVG5JMnAyWkVDWUR4ZHFRWTJEUER1SXRlNVM0b0o3VVRDNmJI?=
 =?utf-8?B?Ym5VZjNGT2d0UWFzZnJXSlN1Y0hxZVpHbGc3SGNCNmN6OU1QWFVHSWw1dXBl?=
 =?utf-8?B?ZlhMZzE4Qk1NLzdmYUpxQ2JlVUJjMEZqdUJTeWZ3Y3RwN093NkNJR0YwdEt4?=
 =?utf-8?B?QWVtOWNWUVZpa0xQVlc5aldPOXpxY1psRWlqQzBMZEpETk9WTi8wTzZHV3Bp?=
 =?utf-8?B?dDE3ZDY0VmtjN0hsRDR3d0t3K0xURUhETHJGMGRTczl2T0gyRmxKZ0YrTWNs?=
 =?utf-8?B?bDhER0ExT3dCRjVkbUNDa05hR1p4TVJFcU4yNjhkbWovZ3pTWnhOR055YThl?=
 =?utf-8?B?VjVhemZXRkpFM1NDUXVWL0RTckpIdUk0TFpxRzM1d3ZOWWZiM0laVUdPK3FQ?=
 =?utf-8?B?cFlBWC9zSGxmWVZEM3Rod2d3eFlTNHk2UndQSVZqOHNVNGJraHlYeGJodC9s?=
 =?utf-8?B?OXArTVJreENXbkRuc09WbXFTRXd2b2JWZUgyNVpLSmJ0RzljNkJTU0JhN1Jq?=
 =?utf-8?B?SUwrdkM2ZVVJTExVVVpxYk8rVzg3WVRnOTVGSjNFT21KY2s0MEE5cmxxK3R1?=
 =?utf-8?B?L0hNSmhaOTBodXNmNDkzbkdaa01OUzBMOTN3eDhVdFN6WWNEZWQxT2dYc1RE?=
 =?utf-8?B?aG9UOFQ2MHk4UmRkcUtpU2w4MWdwQXdoN2N0c0RxT2Y3TTJEN3N1czRnazVC?=
 =?utf-8?B?WlhYeFpqUHNVaTdzSWs3T1FSWlIxc0dJbS8wbTBwb2s5Zm5vVVhmK1U4Y01J?=
 =?utf-8?B?eG5jZTBYZ0x6N0tvbUxtdVRRcFN1ZHhnTytTN2xTajFBUGtFQTd1eHB0Yk83?=
 =?utf-8?B?QmtDckVLbGRjYUJ1bTMwUjNOSjd6RWQrN0lVam1YTElrR0MwVXRGaG0yT0h3?=
 =?utf-8?B?ZHF1eVZQbGhydURjOVB4NU9jV0F5a1N1c3Q4Q2s5NlVyWTRhT0dXN0VUcnk1?=
 =?utf-8?B?VmMvKzBQd0FwRC92Y3lSQkxwSGt0NU1FOXN5WmY0cVIvWXRac3JHVFZnS2Q3?=
 =?utf-8?B?RkFPSVB4azY5NmExM3AyUlMxNDFPWXBDaDRKb2NEVmRLalA2R1VKcTg1SkFo?=
 =?utf-8?B?VnVGVjRHV1RWUUs3Sm03dHF4dHZycDRxdUQzcTVMdlVTM2JXVTQ4dlRHMGJL?=
 =?utf-8?B?WTBTb3hrdHFYYkF2WHhoeFFhbmkzYWswZmpoUHdkeXVGYUU5SXE1N2lBaWNq?=
 =?utf-8?B?N2lUenlGOUUwV0VGSjYvb212Zi9CU1EyNnlOL0Y0bEVWUVNQbm4vUlo5b3RU?=
 =?utf-8?B?SjNSay9waFY4cVBTOTJUSjJpQUhMbDMxenZmSGlFR3FEZGdGTjN1cDVaWldm?=
 =?utf-8?Q?aIIakzqkK7EtIKDszwqGYuhWh5YLAY=3D?=
X-Forefront-Antispam-Report: 	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 09:55:02.4649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1323b41e-bb37-43a2-671a-08dd679548d5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7080
X-Spam-Status: No, score=-1.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS,WEIRD_QUOTING autolearn=disabled version=4.0.1
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
Cc: wthai@nvidia.com, devicetree@vger.kernel.org, conor+dt@kernel.org, tingkaic@nvidia.com, linux-aspeed@lists.ozlabs.org, robh@kernel.org, kees@kernel.org, openbmc@lists.ozlabs.org, leohu@nvidia.com, linux-kernel@vger.kernel.org, gpiccoli@igalia.com, tony.luck@intel.com, joel@jms.id.au, dkodihalli@nvidia.com, krzk+dt@kernel.org, wthai@willie-obmc-builder.nvidia.com, linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear  Paul,

Sorry I respond to your feedback late.

> Dear Willie,
> 
> 
> Thank you for the patch.
> 
> Am 24.01.25 um 06:18 schrieb Willie Thai:
>> From: wthai <wthai@willie-obmc-builder.nvidia.com>
> 
> Please use your full name.
> 
>      $ git config --global user.name "Willie Thai"
>      $ git commit --amend --author="Willie Thai <wthai@nvidia.com>"
> 
> Also is this the wanted email address?
> 
>> The GB200NVL BMC is an Aspeed Ast2600 based BMC
> 
> AST [1]
> 
> [1]: https://www.aspeedtech.com/server_ast2600/
> 
>> for Nvidia Blackwell GB200NVL platform.
> 
> If possible, please add reference to datasheets.
> 
>> Signed-off-by: wthai <wthai@nvidia.com>
> 
> Ditto, regarding the name.
> 
>> ---
>>   .../bindings/arm/aspeed/aspeed.yaml           |    1 +
>>   arch/arm/boot/dts/aspeed/Makefile             |    1 +
>>   .../aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts | 1352 +++++++++++++++++
>>   3 files changed, 1354 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
>> 
>> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
>> index 2f92b8ab08fa..0a6f3654dcb5 100644
>> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
>> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
>> @@ -96,6 +96,7 @@ properties:
>>                 - inventec,starscream-bmc
>>                 - inventec,transformer-bmc
>>                 - jabil,rbp-bmc
>> +              - nvidia,gb200nvl-bmc
>>                 - qcom,dc-scm-v1-bmc
>>                 - quanta,s6q-bmc
>>                 - ufispace,ncplite-bmc
>> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
>> index c4f064e4b073..0dc5240866f3 100644
>> --- a/arch/arm/boot/dts/aspeed/Makefile
>> +++ b/arch/arm/boot/dts/aspeed/Makefile
>> @@ -48,6 +48,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>   	aspeed-bmc-lenovo-hr630.dtb \
>>   	aspeed-bmc-lenovo-hr855xg2.dtb \
>>   	aspeed-bmc-microsoft-olympus.dtb \
>> +	aspeed-bmc-nvidia-gb200nvl-bmc.dtb \
>>   	aspeed-bmc-opp-lanyang.dtb \
>>   	aspeed-bmc-opp-mowgli.dtb \
>>   	aspeed-bmc-opp-nicole.dtb \
>> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
>> new file mode 100644
>> index 000000000000..91d025229aba
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
>> @@ -0,0 +1,1352 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/dts-v1/;
>> +
>> +#include "aspeed-g6.dtsi"
>> +#include <dt-bindings/gpio/aspeed-gpio.h>
>> +#include <dt-bindings/leds/common.h>
>> +
>> +&gpio0 {
>> +	gpio-line-names =
>> +
>> +	/* gpio-line-names are the combination of <signal>-<I/O> , "" is the placeholder for the unused pins
>> +	*/
>> +
>> +	/* 208 (26*8) 3.3V GPIOs */
>> +
>> +	/*A0-A7*/
>> +	"", "", "", "", "", "", "", "",
> 
> Other files seem to put it in one line.

Mostly, we can put all the definitions in one line, but some will exceed the line length limit.
That will create a warning in checkpatch.pl, I will try to put them in one line except those exceed the length limit.

> 
>> +
>> +	/*B0-B7*/
>> +	"", "", "", "", "", "", "", "",
>> +
>> +	/*C0-C7*/
>> +	"SGPIO_I2C_MUX_SEL-O",
>> +	"", "", "", "", "", "", "",
>> +
>> +	/*D0-D7*/
>> +	"", "", "",
>> +	"UART1_MUX_SEL-O",
>> +	"",
>> +	"FPGA_PEX_RST_L-O",
>> +	"", "",
>> +
>> +	/*E0-E7*/
>> +	"RTL8221_PHY_RST_L-O",
>> +	"RTL8211_PHY_INT_L-I",
>> +	"",
>> +	"UART3_MUX_SEL-O",
>> +	"", "", "",
>> +	"SGPIO_BMC_EN-O",
>> +
>> +	/*F0-F7*/
>> +	"", "", "", "", "", "", "", "",
>> +
>> +	/*G0-G7*/
>> +	"", "", "", "", "", "", "", "",
>> +
>> +	/*H0-H7*/
>> +	"", "", "", "", "", "", "", "",
>> +
>> +	/*I0-I7*/
>> +	"", "", "", "", "",
>> +	"QSPI2_RST_L-O",
>> +	"GLOBAL_WP_BMC-O",
>> +	"BMC_DDR4_TEN-O",
>> +
>> +	/*J0-J7*/
>> +	"", "", "", "", "", "", "", "",
>> +
>> +	/*K0-K7*/
>> +	"", "", "", "", "", "", "", "",
>> +
>> +	/*L0-L7*/
>> +	"", "", "", "", "", "", "", "",
>> +
>> +	/*M0-M7*/
>> +	"PCIE_EP_RST_EN-O",
>> +	"BMC_FRU_WP-O",
>> +	"HMC_RESET_L-O",
>> +	"STBY_POWER_EN-O",
>> +	"STBY_POWER_PG-I",
>> +	"PCIE_EP_RST_L-O",
>> +	"", "",
>> +
>> +	/*N0-N7*/
>> +	"", "", "", "", "", "", "", "",
>> +
>> +	/*O0-O7*/
>> +	"", "", "", "", "", "", "", "",
>> +
>> +	/*P0-P7*/
>> +	"", "", "", "", "", "", "", "",
>> +
>> +	/*Q0-Q7*/
>> +	"", "", "", "", "", "", "", "",
>> +
>> +	/*R0-R7*/
>> +	"", "", "", "", "", "", "", "",
>> +
>> +	/*S0-S7*/
>> +	"", "", "", "", "", "", "", "",
>> +
>> +	/*T0-T7*/
>> +	"", "", "", "", "", "", "", "",
>> +
>> +	/*U0-U7*/
>> +	"", "", "", "", "", "", "", "",
>> +
>> +	/*V0-V7*/
>> +	"AP_EROT_REQ-O",
>> +	"EROT_AP_GNT-I",
>> +	"",
>> +	"",
>> +	"PCB_TEMP_ALERT-I",
>> +	"", "", "",
>> +
>> +	/*W0-W7*/
>> +	"", "", "", "", "", "", "", "",
>> +
>> +	/*X0-X7*/
>> +	"", "",
>> +	"TPM_MUX_SEL-O",
>> +	"", "", "", "", "",
>> +
>> +	/*Y0-Y7*/
>> +	"", "", "",
>> +	"EMMC_RST-O",
>> +	"","", "", "",
>> +
>> +	/*Z0-Z7*/
>> +	"BMC_READY-O",
>> +	"", "", "", "", "", "", "";
>> +};
>> +
>> +&sgpiom0 {
>> +	status="okay";
>> +	ngpios = <128>;
>> +
>> +	gpio-line-names =
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"RUN_POWER_FAULT_L-I",
>> +	"SYS_RST_IN_L-O",
>> +	"RUN_POWER_PG-I",
>> +	"PWR_BRAKE_L-O",
>> +	"SYS_RST_OUT_L-I",
>> +	"RUN_POWER_EN-O",
>> +	"L0L1_RST_REQ_OUT_L-I",
>> +	"SHDN_FORCE_L-O",
>> +	"L2_RST_REQ_OUT_L-I",
>> +	"SHDN_REQ_L-O",
>> +	"SHDN_OK_L-I",
>> +	"UID_LED_N-O",
>> +	"BMC_I2C1_FPGA_ALERT_L-I",
>> +	"SYS_FAULT_LED_N-O",
>> +	"BMC_I2C0_FPGA_ALERT_L-I",
>> +	"PWR_LED_N-O",
>> +	"FPGA_RSVD_FFU3-I",
>> +	"",
>> +	"FPGA_RSVD_FFU2-I",
>> +	"",
>> +	"FPGA_RSVD_FFU1-I",
>> +	"",
>> +	"FPGA_RSVD_FFU0-I",
>> +	"BMC_I2C_SSIF_ALERT_L-O",
>> +	"CPU_BOOT_DONE-I",
>> +	"JTAG_MUX_SELECT-O",
>> +	"SPI_BMC_FPGA_INT_L-I",
>> +	"RTC_CLR_L-O",
>> +	"THERM_BB_WARN_L-I",
>> +	"UART_MUX_SEL-O",
>> +	"THERM_BB_OVERT_L-I",
>> +	"",
>> +	"CPU0_UPHY3_PRSNT1_L-I",
>> +	"IOBRD0_RUN_POWER_EN-O",
>> +	"CPU0_UPHY3_PRSNT0_L-I",
>> +	"IOBRD1_RUN_POWER_EN-O",
>> +	"CPU0_UPHY2_PRSNT1_L-I",
>> +	"FPGA_RSVD_FFU4-O",
>> +	"CPU0_UPHY2_PRSNT0_L-I",
>> +	"FPGA_RSVD_FFU5-O",
>> +	"CPU0_UPHY1_PRSNT1_L-I",
>> +	"FPGA_RSVD_FFU6-O",
>> +	"CPU0_UPHY1_PRSNT0_L-I",
>> +	"FPGA_RSVD_FFU7-O",
>> +	"CPU0_UPHY0_PRSNT1_L-I",
>> +	"RSVD_NV_PLT_DETECT-O",
>> +	"CPU0_UPHY0_PRSNT0_L-I",
>> +	"SPI1_INT_L-O",
>> +	"CPU1_UPHY3_PRSNT1_L-I",
>> +	"",
>> +	"CPU1_UPHY3_PRSNT0_L-I",
>> +	"HMC_EROT_MUX_STATUS",
>> +	"CPU1_UPHY2_PRSNT1_L-I",
>> +	"",
>> +	"CPU1_UPHY2_PRSNT0_L-I",
>> +	"",
>> +	"CPU1_UPHY1_PRSNT1_L-I",
>> +	"",
>> +	"CPU1_UPHY1_PRSNT0_L-I",
>> +	"",
>> +	"CPU1_UPHY0_PRSNT1_L-I",
>> +	"",
>> +	"CPU1_UPHY0_PRSNT0_L-I",
>> +	"",
>> +	"FAN1_PRESENT_L-I",
>> +	"",
>> +	"FAN0_PRESENT_L-I",
>> +	"",
>> +	"",
>> +	"",
>> +	"IPEX_CABLE_PRSNT_L-I",
>> +	"",
>> +	"M2_1_PRSNT_L-I",
>> +	"",
>> +	"M2_0_PRSNT_L-I",
>> +	"",
>> +	"CPU1_UPHY4_PRSNT1_L-I",
>> +	"",
>> +	"CPU0_UPHY4_PRSNT0_L-I",
>> +	"",
>> +	"",
>> +	"",
>> +	"I2C_RTC_ALERT_L-I",
>> +	"",
>> +	"FAN7_PRESENT_L-I",
>> +	"",
>> +	"FAN6_PRESENT_L-I",
>> +	"",
>> +	"FAN5_PRESENT_L-I",
>> +	"",
>> +	"FAN4_PRESENT_L-I",
>> +	"",
>> +	"FAN3_PRESENT_L-I",
>> +	"",
>> +	"FAN2_PRESENT_L-I",
>> +	"",
>> +	"IOBRD0_IOX_INT_L-I",
>> +	"",
>> +	"IOBRD1_PRSNT_L-I",
>> +	"",
>> +	"IOBRD0_PRSNT_L-I",
>> +	"",
>> +	"IOBRD1_PWR_GOOD-I",
>> +	"",
>> +	"IOBRD0_PWR_GOOD-I",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"FAN_FAIL_IN_L-I",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"PDB_CABLE_PRESENT_L-I",
>> +	"",
>> +	"",
>> +	"",
>> +	"CHASSIS_PWR_BRK_L-I",
>> +	"",
>> +	"",
>> +	"",
>> +	"IOBRD1_IOX_INT_L-I",
>> +	"",
>> +	"10GBE_SMBALRT_L-I",
>> +	"",
>> +	"PCIE_WAKE_L-I",
>> +	"",
>> +	"I2C_M21_ALERT_L-I",
>> +	"",
>> +	"I2C_M20_ALERT_L-I",
>> +	"",
>> +	"TRAY_FAST_SHDN_L-I",
>> +	"",
>> +	"UID_BTN_N-I",
>> +	"",
>> +	"PWR_BTN_L-I",
>> +	"",
>> +	"PSU_SMB_ALERT_L-I",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"NODE_LOC_ID[0]-I",
>> +	"",
>> +	"NODE_LOC_ID[1]-I",
>> +	"",
>> +	"NODE_LOC_ID[2]-I",
>> +	"",
>> +	"NODE_LOC_ID[3]-I",
>> +	"",
>> +	"NODE_LOC_ID[4]-I",
>> +	"",
>> +	"NODE_LOC_ID[5]-I",
>> +	"",
>> +	"FAN10_PRESENT_L-I",
>> +	"",
>> +	"FAN9_PRESENT_L-I",
>> +	"",
>> +	"FAN8_PRESENT_L-I",
>> +	"",
>> +	"FPGA1_READY_HMC-I",
>> +	"",
>> +	"DP_HPD-I",
>> +	"",
>> +	"HMC_I2C3_FPGA_ALERT_L-I",
>> +	"",
>> +	"HMC_I2C2_FPGA_ALERT_L-I",
>> +	"",
>> +	"FPGA0_READY_HMC-I",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"LEAK_DETECT_ALERT_L-I",
>> +	"",
>> +	"MOD1_B2B_CABLE_PRESENT_L-I",
>> +	"",
>> +	"MOD1_CLINK_CABLE_PRESENT_L-I",
>> +	"",
>> +	"FAN11_PRESENT_L-I",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"",
>> +	"RSVD_SGPIO_IN_CRC[0]",
>> +	"RSVD_SGPIO_O_CRC[7]",
>> +	"RSVD_SGPIO_IN_CRC[1]",
>> +	"RSVD_SGPIO_O_CRC[6]",
>> +	"RSVD_SGPIO_IN_CRC[2]",
>> +	"RSVD_SGPIO_O_CRC[5]",
>> +	"RSVD_SGPIO_IN_CRC[3]",
>> +	"RSVD_SGPIO_O_CRC[4]",
>> +	"RSVD_SGPIO_IN_CRC[4]",
>> +	"RSVD_SGPIO_O_CRC[3]",
>> +	"RSVD_SGPIO_IN_CRC[5]",
>> +	"RSVD_SGPIO_O_CRC[2]",
>> +	"RSVD_SGPIO_IN_CRC[6]",
>> +	"RSVD_SGPIO_O_CRC[1]",
>> +	"RSVD_SGPIO_IN_CRC[7]",
>> +	"RSVD_SGPIO_O_CRC[0]";
>> +};
>> +
>> +// EMMC group that excludes WP pin
>> +&pinctrl {
>> +	pinctrl_emmcg5_default: emmcg5_default {
>> +		function = "EMMC";
>> +		groups = "EMMCG5";
>> +	};
>> +};
>> +
>> +/ {
>> +	model = "AST2600 GB200NVL BMC";
>> +	compatible = "nvidia,gb200nvl-bmc", "aspeed,ast2600";
>> +
>> +	aliases {
>> +		serial2 = &uart3;
>> +		serial4 = &uart5;
>> +		i2c16   = &imux16;
>> +		i2c17   = &imux17;
>> +		i2c18   = &imux18;
>> +		i2c19   = &imux19;
>> +		i2c20   = &imux20;
>> +		i2c21   = &imux21;
>> +		i2c22   = &imux22;
>> +		i2c23   = &imux23;
>> +		i2c24   = &imux24;
>> +		i2c25   = &imux25;
>> +		i2c26   = &imux26;
>> +		i2c27   = &imux27;
>> +		i2c28   = &imux28;
>> +		i2c29   = &imux29;
>> +		i2c30   = &imux30;
>> +		i2c31   = &imux31;
>> +		i2c32   = &imux32;
>> +		i2c33   = &imux33;
>> +		i2c34   = &imux34;
>> +		i2c35   = &imux35;
>> +		i2c36   = &imux36;
>> +		i2c37   = &imux37;
>> +		i2c38   = &imux38;
>> +		i2c39   = &imux39;
>> +		i2c40	= &e1si2c0;
>> +		i2c41	= &e1si2c1;
>> +		i2c42	= &e1si2c2;
>> +		i2c43	= &e1si2c3;
>> +		i2c44	= &e1si2c4;
>> +		i2c45	= &e1si2c5;
>> +		i2c46	= &e1si2c6;
>> +		i2c47	= &e1si2c7;
>> +		i2c48	= &i2c5mux0;
>> +		i2c49   = &m2riser;
>> +		i2c50	= &i2c5mux2;
>> +		i2c51	= &i2c5mux3;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = &uart5;
>> +		bootargs = "console=tty0 console=ttyS4,115200n8 earlyprintk";
>> +	};
>> +
>> +	memory@80000000 {
>> +		device_type = "memory";
>> +		reg = <0x80000000 0x80000000>;
>> +	};
>> +
>> +	reserved-memory {
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ranges;
>> +
>> +		vga_memory: framebuffer@9f000000 {
>> +			no-map;
>> +			reg = <0x9f000000 0x01000000>; /* 16M */
>> +		};
>> +
>> +		ramoops@a0000000 {
>> +			compatible = "ramoops";
>> +			reg = <0xa0000000 0x100000>; /* 1MB */
>> +			record-size = <0x10000>; /* 64KB */
>> +			max-reason = <2>; /* KMSG_DUMP_OOPS */
>> +		};
>> +
>> +		gfx_memory: framebuffer {
>> +			size = <0x01000000>;
>> +			alignment = <0x01000000>;
>> +			compatible = "shared-dma-pool";
>> +			reusable;
>> +		};
>> +
>> +		video_engine_memory: jpegbuffer {
>> +			size = <0x02000000>;	/* 32M */
>> +			alignment = <0x01000000>;
>> +			compatible = "shared-dma-pool";
>> +			reusable;
>> +		};
>> +	};
>> +
>> +	power-gpios{
>> +		n2-gpios = <&gpio0 ASPEED_GPIO(N, 2) (GPIO_ACTIVE_HIGH|GPIO_PULL_UP)>;
>> +		n3-gpios = <&gpio0 ASPEED_GPIO(N, 3) (GPIO_ACTIVE_HIGH|GPIO_PULL_UP)>;
>> +	};
>> +
>> +	leds {
>> +		compatible = "gpio-leds";
>> +		uid_led {
>> +			gpios = <&sgpiom0 27 GPIO_ACTIVE_LOW>;
>> +		};
>> +		fault_led {
>> +			gpios = <&sgpiom0 29 GPIO_ACTIVE_LOW>;
>> +		};
>> +		power_led {
>> +			gpios = <&sgpiom0 31 GPIO_ACTIVE_LOW>;
>> +		};
>> +
>> +		// Non-LEDs:
>> +		//   BMC_READY-O GPIO pin (not an LED) is being bound to the GPIO LED driver.
>> +		// Notes:
>> +		// * This is a workaround and leverages the GPIO LED driver to enable control of
>> +		//   reset tolerance and still allow the GPIO to be controlled from user space.
> 
> Add this also to the commit message?
> 
>> +		// * The standard Linux GPIO driver allows control of reset tolerance, however
>> +		//   does not expose user space APIs for user space control of the GPIO pin.
>> +		// * GPIO_TRANSITORY = reset tolerance is disabled
>> +		// * Any non-leds should be added below this line.
> 
> Use C89 style comments? (Though it’s inconsistent and I do not know if 
> there is a guideline.)

Sure, will fix.

> 
>> +		bmc_ready_noled {
>> +			gpios = <&gpio0 ASPEED_GPIO(Z, 0) (GPIO_ACTIVE_HIGH|GPIO_TRANSITORY)>;
>> +		};
>> +	};
>> +
>> +	buttons {
>> +		power-btn {
>> +			gpio = <&sgpiom0 156 GPIO_ACTIVE_LOW>;
>> +		};
>> +		uid-btn {
>> +			gpio = <&sgpiom0 154 GPIO_ACTIVE_LOW>;
>> +		};
>> +	};
>> +};
>> +
>> +// Enabled Primary flash on FMC for bring up activity
> 
> Imperative mood: Enable.

Sure, will fix.

> 
>> +&fmc {
>> +	status = "okay";
>> +	flash@0 {
>> +		status = "okay";
>> +		compatible = "jedec,spi-nor";
>> +		label = "bmc";
>> +		spi-max-frequency = <50000000>;
>> +		partitions {
>> +			compatible = "fixed-partitions";
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +
>> +			u-boot@0 {
>> +				reg = <0x0 0xe0000>; // 896KB
>> +				label = "u-boot";
>> +			};
>> +
>> +			kernel@100000 {
>> +				reg = <0x100000 0x900000>; // 9MB
>> +				label = "kernel";
>> +			};
>> +
>> +			rofs@a00000 {
>> +				reg = <0xa00000 0x35FF000>; // 55292KB (extends to end of 64MB SPI - 4KB)
>> +				label = "rofs";
> 
> Just my ignorance about how the calculations are done, and why some 
> holes are left.

We reserved some space for security feature.

> 
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&fmcraw {
>> +	status = "okay";
>> +	spidev@0 {
>> +		compatible = "hgx,glacier";
>> +		status = "okay";
>> +	};
>> +};
>> +
>> +&spi1raw {
>> +	status = "okay";
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_spi1_default>;
>> +	spidev@0 {
>> +		spi-max-frequency = <25000000>;
>> +		compatible = "hgx,glacier";
>> +		status = "okay";
>> +	};
>> +};
>> +
>> +&spi2 {
>> +	status = "okay";
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_spi2_default>;
>> +
>> +	// Data SPI is 64MB in size
>> +	flash@0 {
>> +		status = "okay";
>> +		label = "config";
>> +		spi-max-frequency = <50000000>;
>> +		partitions {
>> +			compatible = "fixed-partitions";
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +
>> +			u-boot-env@0 {
>> +				reg = <0x0 0x40000>;            // 256KB at offset 0
>> +				label = "u-boot-env";
>> +			};
>> +
>> +			rwfs@40000 {
>> +				reg = <0x40000 0x1000000>;      // 16MB at offset 0x40000
>> +				label = "rwfs";
>> +			};
>> +
>> +			log@0x1040000 {
>> +				reg = <0x1040000 0x2800000>;    // 40MB at offset 0x1040000
>> +				label = "log";                  // Move log to EMMC, make this unused
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&uart1 {
>> +	status = "okay";
>> +};
>> +
>> +&uart3 {
>> +	//Enabling SOL
> 
> Add space after //.

Sure, will fix.

> 
>> +	status = "okay";
>> +};
>> +
>> +&uart5 {
>> +	// BMC Debug Console
>> +	status = "okay";
>> +};
>> +
>> +&uart_routing {
>> +	status = "okay";
>> +};
>> +
>> +// MAC1 (per schematics, 1-based MAC1-MAC4) of AST2600 connected to external PHY
>> +// This is "mac0" in zero-based DTS
>> +&mdio0 {
>> +	status = "okay";
>> +	ethphy0: ethernet-phy@0 {
>> +		compatible = "ethernet-phy-ieee802.3-c22";
>> +		reg = <0>;
>> +	};
>> +
>> +};
>> +
>> +&mdio3 {
>> +	status = "okay";
>> +	ethphy3: ethernet-phy@2 {
>> +		compatible = "ethernet-phy-ieee802.3-c22";
>> +		reg = <2>;
>> +	};
>> +};
>> +
>> +&mac0 {
>> +	status = "okay";
>> +	pinctrl-names = "default";
>> +	phy-mode = "rgmii-rxid";
>> +	max-speed = <1000>;
>> +	phy-handle = <&ethphy3>;
>> +	pinctrl-0 = <&pinctrl_rgmii1_default>;
>> +};
>> +
>> +&mac2 {
>> +	status = "okay";
>> +	phy-mode = "rmii";
>> +	use-ncsi;
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_rmii3_default>;
>> +};
>> +
>> +// Enable emmc
>> +&emmc_controller {
>> +	status = "okay";
>> +};
>> +
>> +&emmc {
>> +	non-removable;
>> +	pinctrl-0 = <&pinctrl_emmcg5_default>;
>> +	bus-width = <4>;
>> +	max-frequency = <52000000>;
>> +	clk-phase-mmc-hs200 = <9>, <225>;
>> +};
>> +
>> +/*
>> +* Enable USB port A as device (via the virtual hub) to host
>> +*/
> 
> Please align.
> 

Sure, will fix.

>> +&vhub {
>> +	status = "okay";
>> +	pinctrl-names = "default";
>> +	/*
>> +	Uncomment below line to enable internal EHCI controller
>> +	Current config uses xHCI Port1
>> +	*/
> 
> Use common comment styles?
> 

Sure, will fix.

>> +	// pinctrl-0 = <&pinctrl_usb2adp_default>;
>> +};
>> +
>> +&video {
>> +	status = "okay";
>> +	memory-region = <&video_engine_memory>;
>> +};
>> +
>> +// USB 2.0 to HMC, on USB Port B
>> +&ehci1 {
>> +	status = "okay";
>> +};
>> +
>> +// USB 1.0
>> +&uhci {
>> +	status = "okay";
>> +};
>> +
>> +// I2C1, SSIF IPMI interface
>> +&i2c0 {
>> +	status = "okay";
>> +	clock-frequency = <400000>;
>> +	disable-master = <1>;
>> +	i2c-tck-thddat-config = <0x0099EC00>;
>> +	ssif-bmc@10 {
>> +		compatible = "ssif-bmc";
>> +		alert-gpio = <&sgpiom0 39 GPIO_ACTIVE_LOW>;
>> +		pulse_width_us = <5>;
>> +		timeout_ms = <4995>;
>> +		reg = <0x10>;
>> +	};
>> +};
>> +
>> +// I2C2
>> +// BMC_I2C1_FPGA - Secondary FPGA
>> +// HMC EROT
>> +&i2c1 {
>> +	status = "okay";
>> +	clock-frequency = <400000>;
>> +	multi-master;
>> +	i2c-scl-clk-low-timeout-us = <32000>;
>> +	i2c-tck-thddat-config = <0x0099EC00>;
>> +};
>> +
>> +// I2C4
>> +&i2c3 {
>> +	status = "disabled";
>> +};
>> +
>> +// I2C5
>> +// RTC Driver
>> +// IO Expander
>> +&i2c4 {
>> +	status = "okay";
>> +	clock-frequency = <400000>;
>> +	i2c-tck-thddat-config = <0x0099EC00>;
>> +	// Module 0, Expander @0x21
>> +	exp4: pca9555@21 {
>> +		compatible = "nxp,pca9555";
>> +		reg = <0x21>;
>> +		gpio-controller;
>> +		#gpio-cells = <2>;
>> +
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		interrupt-controller;
>> +		#interrupt-cells = <2>;
>> +		interrupt-parent = <&gpio1>;
>> +		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
>> +
>> +		gpio-line-names =
>> +			"RTC_MUX_SEL-O",
>> +			"PCI_MUX_SEL-O",
>> +			"TPM_MUX_SEL-O",
>> +			"FAN_MUX-SEL-O",
>> +			"SGMII_MUX_SEL-O",
>> +			"DP_MUX_SEL-O",
>> +			"UPHY3_USB_SEL-O",
>> +			"NCSI_MUX_SEL-O",
>> +			"BMC_PHY_RST-O",
>> +			"RTC_CLR_L-O",
>> +			"BMC_12V_CTRL-O",
>> +			"PS_RUN_IO0_PG-I",
>> +			"",
>> +			"",
>> +			"",
>> +			"";
>> +	};
>> +};
>> +
>> +// I2C6
>> +// Module 0/1 I2C MUX x3
>> +&i2c5 {
>> +	status = "okay";
>> +	clock-frequency = <400000>;
>> +	multi-master;
>> +	i2c-scl-clk-low-timeout-us = <32000>;
>> +	i2c-tck-thddat-config = <0x0099EC00>;
>> +
>> +	i2c-switch@71 {
>> +		compatible = "nxp,pca9546";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		reg = <0x71>;
>> +		i2c-mux-idle-disconnect;
>> +
>> +		imux16: i2c@0 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0>;
>> +		};
>> +
>> +		imux17: i2c@1 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <1>;
>> +		};
>> +
>> +		imux18: i2c@2 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <2>;
>> +		};
>> +
>> +		imux19: i2c@3 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <3>;
>> +		};
>> +	};
>> +
>> +	i2c-switch@72 {
>> +		compatible = "nxp,pca9546";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		reg = <0x72>;
>> +		i2c-mux-idle-disconnect;
>> +
>> +		imux20: i2c@0 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0>;
>> +		};
>> +
>> +		imux21: i2c@1 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <1>;
>> +		};
>> +
>> +		imux22: i2c@2 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <2>;
>> +		};
>> +
>> +		imux23: i2c@3 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <3>;
>> +		};
>> +	};
>> +
>> +	i2c-switch@73 {
>> +		compatible = "nxp,pca9546";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		reg = <0x73>;
>> +		i2c-mux-idle-disconnect;
>> +
>> +		imux24: i2c@0 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0>;
>> +		};
>> +
>> +		imux25: i2c@1 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <1>;
>> +		};
>> +
>> +		imux26: i2c@2 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <2>;
>> +		};
>> +
>> +		imux27: i2c@3 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <3>;
>> +		};
>> +	};
>> +
>> +	//A MUX for a riser with a secondary M.2 installed.
> 
> Add a space.
> 

Sure, will fix.

>> +	i2c-switch@74 {
>> +		compatible = "nxp,pca9546";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		reg = <0x74>;
>> +		i2c-mux-idle-disconnect;
>> +
>> +		i2c5mux0: i2c@0 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0>;
>> +		};
>> +
>> +		//Optional/secondary M.2 drive slot
> 
> Ditto.
> 

Sure, will fix.

>> +		m2riser: i2c@1 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <1>;
>> +		};
>> +
>> +		i2c5mux2: i2c@2 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <2>;
>> +		};
>> +
>> +		i2c5mux3: i2c@3 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <3>;
>> +		};
>> +	};
>> +
>> +	i2c-switch@75 {
>> +		compatible = "nxp,pca9546";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		reg = <0x75>;
>> +		i2c-mux-idle-disconnect;
>> +
>> +		imux28: i2c@0 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0>;
>> +		};
>> +
>> +		imux29: i2c@1 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <1>;
>> +		};
>> +
>> +		imux30: i2c@2 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <2>;
>> +		};
>> +
>> +		imux31: i2c@3 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <3>;
>> +		};
>> +	};
>> +
>> +	i2c-switch@76 {
>> +		compatible = "nxp,pca9546";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		reg = <0x76>;
>> +		i2c-mux-idle-disconnect;
>> +
>> +		imux32: i2c@0 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0>;
>> +		};
>> +
>> +		imux33: i2c@1 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <1>;
>> +		};
>> +
>> +		imux34: i2c@2 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <2>;
>> +		};
>> +
>> +		imux35: i2c@3 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <3>;
>> +		};
>> +	};
>> +
>> +	i2c-switch@77 {
>> +		compatible = "nxp,pca9546";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		reg = <0x77>;
>> +		i2c-mux-idle-disconnect;
>> +
>> +		imux36: i2c@0 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0>;
>> +		};
>> +
>> +		imux37: i2c@1 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <1>;
>> +		};
>> +
>> +		imux38: i2c@2 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <2>;
>> +		};
>> +
>> +		imux39: i2c@3 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <3>;
>> +		};
>> +	};
>> +};
>> +
>> +// I2C7
>> +// Module 0/1 Leak Sensors
>> +// Module 0/1 Fan Controllers
>> +&i2c6 {
>> +	status = "okay";
>> +	clock-frequency = <400000>;
>> +	i2c-tck-thddat-config = <0x0099EC00>;
>> +	hsc@12 {
>> +		compatible = "ti,lm5066i";
>> +		reg = <0x12>;
>> +		shunt-resistor-micro-ohms = <190>;
>> +		status = "okay";
>> +	};
>> +	hsc@14 {
>> +		compatible = "ti,lm5066i";
>> +		reg = <0x14>;
>> +		shunt-resistor-micro-ohms = <190>;
>> +		status = "okay";
>> +	};
>> +	max31790_1 {
>> +		compatible = "maxim,max31790";
>> +		reg = <0x20>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +	};
>> +	max31790_2 {
>> +		compatible = "maxim,max31790";
>> +		reg = <0x23>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +	};
>> +	max31790_3 {
>> +		compatible = "maxim,max31790";
>> +		reg = <0x2c>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +	};
>> +	max31790_4 {
>> +		compatible = "maxim,max31790";
>> +		reg = <0x2f>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +	};
>> +};
>> +
>> +// I2C9
>> +// M.2
>> +&i2c8 {
>> +	status = "okay";
>> +	clock-frequency = <400000>;
>> +	multi-master;
>> +	i2c-scl-clk-low-timeout-us = <32000>;
>> +	i2c-tck-thddat-config = <0x0099EC00>;
>> +};
>> +
>> +// I2C10
>> +// HMC IO Expander
>> +// Module 0/1 IO Expanders
>> +&i2c9 {
>> +	status = "okay";
>> +	clock-frequency = <400000>;
>> +	i2c-tck-thddat-config = <0x0099EC00>;
>> +	// Module 0, Expander @0x20
>> +	exp0: pca9555@20 {
>> +		compatible = "nxp,pca9555";
>> +		reg = <0x20>;
>> +		gpio-controller;
>> +		#gpio-cells = <2>;
>> +
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		interrupt-controller;
>> +		#interrupt-cells = <2>;
>> +		interrupt-parent = <&gpio1>;
>> +		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
>> +
>> +		gpio-line-names =
>> +		"FPGA_THERM_OVERT_L-I",
>> +		"FPGA_READY_BMC-I",
>> +		"HMC_BMC_DETECT-O",
>> +		"HMC_PGOOD-O",
>> +		"",
>> +		"BMC_STBY_CYCLE-O",
>> +		"FPGA_EROT_FATAL_ERROR_L-I",
>> +		"WP_HW_EXT_CTRL_L-O",
>> +		"EROT_FPGA_RST_L-O",
>> +		"FPGA_EROT_RECOVERY_L-O",
>> +		"BMC_EROT_FPGA_SPI_MUX_SEL-O",
>> +		"USB_HUB_RESET_L-O",
>> +		"NCSI_CS1_SEL-O",
>> +		"SGPIO_EN_L-O",
>> +		"B2B_IOEXP_INT_L-I",
>> +		"I2C_BUS_MUX_RESET_L-O";
>> +	};
>> +
>> +	// Module 1, Expander @0x21
>> +	exp1: pca9555@21 {
>> +		compatible = "nxp,pca9555";
>> +		reg = <0x21>;
>> +		gpio-controller;
>> +		#gpio-cells = <2>;
>> +
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		interrupt-controller;
>> +		#interrupt-cells = <2>;
>> +		interrupt-parent = <&gpio1>;
>> +		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
>> +
>> +		gpio-line-names =
>> +		"SEC_FPGA_THERM_OVERT_L-I",
>> +		"SEC_FPGA_READY_BMC-I",
>> +		"",
>> +		"",
>> +		"",
>> +		"",
>> +		"SEC_FPGA_EROT_FATAL_ERROR_L-I",
>> +		"SEC_WP_HW_EXT_CTRL_L-O",
>> +		"SEC_EROT_FPGA_RST_L-O",
>> +		"SEC_FPGA_EROT_RECOVERY_L-O",
>> +		"SEC_BMC_EROT_FPGA_SPI_MUX_SEL-O",
>> +		"",
>> +		"",
>> +		"",
>> +		"",
>> +		"SEC_I2C_BUS_MUX_RESET_L-O";
>> +	};
>> +
>> +	// HMC Expander @0x27
>> +	exp2: pca9555@27 {
>> +		compatible = "nxp,pca9555";
>> +		reg = <0x27>;
>> +		gpio-controller;
>> +		#gpio-cells = <2>;
>> +
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		interrupt-controller;
>> +		#interrupt-cells = <2>;
>> +		interrupt-parent = <&gpio1>;
>> +		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
>> +
>> +		gpio-line-names =
>> +		"HMC_PRSNT_L-I",
>> +		"HMC_READY-I",
>> +		"HMC_EROT_FATAL_ERROR_L-I",
>> +		"I2C_MUX_SEL-O",
>> +		"HMC_EROT_SPI_MUX_SEL-O",
>> +		"HMC_EROT_RECOVERY_L-O",
>> +		"HMC_EROT_RST_L-O",
>> +		"GLOBAL_WP_HMC-O",
>> +		"FPGA_RST_L-O",
>> +		"USB2_HUB_RST-O",
>> +		"CPU_UART_MUX_SEL-O",
>> +		"",
>> +		"",
>> +		"",
>> +		"",
>> +		"";
>> +	};
>> +	// HMC Expander @0x74
>> +	exp3: pca9555@74 {
>> +		compatible = "nxp,pca9555";
>> +		reg = <0x74>;
>> +		gpio-controller;
>> +		#gpio-cells = <2>;
>> +
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		interrupt-controller;
>> +		#interrupt-cells = <2>;
>> +		interrupt-parent = <&gpio1>;
>> +		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
>> +
>> +		gpio-line-names =
>> +		"IOB_PRSNT_L",
>> +		"IOB_DP_HPD",
>> +		"IOX_BMC_RESET",
>> +		"IOB_IOEXP_INT_L",
>> +		"IOB_UID_LED_L",
>> +		"IOB_UID_BTN_L",
>> +		"IOB_SYS_RST_BTN_L",
>> +		"IOB_PWR_LED_L",
>> +		"IOB_PWR_BTN_L",
>> +		"IOB_PHY_RST",
>> +		"CPLD_JTAG_MUX_SEL",
>> +		"",
>> +		"",
>> +		"",
>> +		"",
>> +		"";
>> +	};
>> +};
>> +
>> +// I2C11
>> +// BMC FRU EEPROM
>> +// BMC Temp Sensor
>> +&i2c10 {
>> +	status = "okay";
>> +	clock-frequency = <400000>;
>> +	i2c-tck-thddat-config = <0x0099EC00>;
>> +	// BMC FRU EEPROM - 256 bytes
>> +	eeprom@50 {
>> +		compatible = "atmel,24c02";
>> +		reg = <0x50>;
>> +		pagesize = <8>;
>> +	};
>> +};
>> +
>> +// I2C12
>> +&i2c11 {
>> +	status = "disabled";
>> +};
>> +
>> +// I2C13
>> +&i2c12 {
>> +	status = "disabled";
>> +};
>> +
>> +// I2C14
>> +// Module 0 UPHY3 SMBus
>> +&i2c13 {
>> +	status = "disabled";
>> +};
>> +
>> +// I2C15
>> +// Module 1 UPHY3 SMBus
>> +&i2c14 {
>> +	status = "okay";
>> +	clock-frequency = <100000>;
>> +	multi-master;
>> +	i2c-scl-clk-low-timeout-us = <32000>;
>> +	i2c-tck-thddat-config = <0x00EFD000>;
>> +
>> +	//E1.S drive slot 0-3
>> +	i2c-switch@77 {
>> +		compatible = "nxp,pca9546";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		reg = <0x77>;
>> +		i2c-mux-idle-disconnect;
>> +
>> +		e1si2c0: i2c@0 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0>;
>> +		};
>> +
>> +		e1si2c1: i2c@1 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <1>;
>> +		};
>> +
>> +		e1si2c2: i2c@2 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <2>;
>> +		};
>> +
>> +		e1si2c3: i2c@3 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <3>;
>> +		};
>> +	};
>> +};
>> +
>> +// I2C16
>> +&i2c15 {
>> +	status = "okay";
>> +	clock-frequency = <100000>;
>> +	multi-master;
>> +	i2c-scl-clk-low-timeout-us = <32000>;
>> +	i2c-tck-thddat-config = <0x00EFD000>;
>> +
>> +	//E1.S drive slot 4-7
>> +	i2c-switch@77 {
>> +		compatible = "nxp,pca9546";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		reg = <0x77>;
>> +		i2c-mux-idle-disconnect;
>> +
>> +		e1si2c4: i2c@0 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0>;
>> +		};
>> +
>> +		e1si2c5: i2c@1 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <1>;
>> +		};
>> +
>> +		e1si2c6: i2c@2 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <2>;
>> +		};
>> +
>> +		e1si2c7: i2c@3 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <3>;
>> +		};
>> +	};
>> +};
>> +
>> +// PCIe RC
>> +&pcie {
>> +	status = "okay";
>> +
>> +	interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +	pcie_intc0: legacy-interrupt-controller {
>> +		interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
>> +	};
>> +};
>> +
>> +// Bridge between AHB bus and PCIe RC.
> 
> No dot/period needed at the end.
> 
>> +&h2x {
>> +	status = "okay";
>> +};
>> +
>> +&mctp {
>> +	status = "okay";
>> +};
>> +
>> +&jtag0 {
>> +	status = "okay";
>> +};
>> +
>> +&jtag1 {
>> +	mux-gpios = <&sgpiom0 41 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>;
>> +	status = "okay";
>> +};
>> +
>> +&rng {
>> +	status = "okay";
>> +};
>> +
