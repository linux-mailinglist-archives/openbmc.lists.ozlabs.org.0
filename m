Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDF596CF6A
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2024 08:36:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzqQ869kxz3cb5
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2024 16:36:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725518186;
	cv=pass; b=cvj3foLqrgjFgImzlePw2Rs0z7ySkp4RHKNHnFw+yp7pmZ7MYk5F2SIkM3Gx0YGd8iuqGp6MX6BB/vVXvWIk5II8A96LxAZs31KfcAr3kV0Vu3zny0YG74t0v/iwQqJ999eJNWT/GkNOx+sgOiomG2cgsGbzn79vOU1r+PKdj4y4m4/yLA9g5C7n9M6kkKwvLv4qwZoImqZ1xmPAxhpm9VdCK+OZeAvkvU7LImD9VUIlErTA5VNvY01DLiwqU1gGNL2icnoVqPc9OXb3c1P9oi4c3DvwUAeLuHM9myc0t6EmXbDGD0P9d02RpX9V7QFtsRlMk28qExH9T3yMqixKHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725518186; c=relaxed/relaxed;
	bh=2JrZ4dq+nY71EBw43LLUzo7swY5JU3vAdHSQmbRFCXE=;
	h=ARC-Authentication-Results:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:Content-Type:MIME-Version; b=VTgipvZON+iwW+jE6aLZYaAIvmytO60ebuAkR7Z8aF6pL53G05mhMpxjSD9BsEIAmVvh8DeXCZu1zgSYIA/4+2cGKEE5ono0daIkvjp3U437HHICnffayHQ4hCqHbKlgVwgxxL5kqfs4ZpnQrAGTq9Gsf2imJUg+XKpbFi+wj69rN+aX9Urim0NF//v1WN1xRluDK2DK5RnOmNuTwTco01yBrQ9gmQ+qqrMBQUdaALaRWmKlkV63VtkFPyK+Tj6npW6M5GiM5h0EnSbFNSVSmiaTBfPYW+D2klyczwZ7p0zl9m75xHwlrOFzKNg5sUDb5S0ixTuaY4SqH86/q8W/vw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=TmYZWsbY; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org) smtp.mailfrom=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=TmYZWsbY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzqQ16WZKz2yn2;
	Thu,  5 Sep 2024 16:36:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kKtgrU7kKtuwYjgT8IjAsiLfX+/JzbrWxgPN7z7qMaKzocNsoPmPrRSG9lgw759a6YNNbwV3DZ+Q4W59IyGIpGGZWtQ0oqDZRomCMHqVSbr719IBvqUuhID1VRVB11sIxvBTf9+LMyCpF+mqViXAjytR7MiLwY6r3s0Fg4ofv6J4U5JjN4vuN8ONyzXqUNakRAWTaqCTpaWrvdzcQZHC3UaK4S7JozSM18tBWNLHXjzEVM4cU0soaO1ed1LwTBSfUDL7q2xGZsjZvKNP9m/KRhIYlrU0jETPYTyNCnE6+d3G2aPh2b4pAW/DLLRSUVpdk6PrjYfQ9j6Q5Xf2qQiEiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JrZ4dq+nY71EBw43LLUzo7swY5JU3vAdHSQmbRFCXE=;
 b=mJgO3LpL9BcmCAMWt25Z6m+sjdLTdvAh4fXWCFyVb/x9BtDuVl5QTFVhJRSfNe6X7/9mhVwkbW6W+VKT++3cDl6LpSrSmcd0XG9dEvn53mneZ/S0zE6zaPlgkeFKaqY1khbwuEwEWiCoehm7VmylM1XrLpAEusqUJvlSdRb1TlxOpDYZs/L7NQZyYG4M4zy3BE7BQXITsRJgs9NcqQASIflyEAkeboYJa9JxjHlk0XDpl2bCiVhJ8OnpzXByhjd1Mgrp7uMd/jHbfEEzZzjB110PAalU2EzuiRY8KtkRwUeWd5flt5SqMYRUp/dyfryPQIXsMXXRReVbaiqtE9TMPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JrZ4dq+nY71EBw43LLUzo7swY5JU3vAdHSQmbRFCXE=;
 b=TmYZWsbYT4Zzg2hUMYu9VuyQ9g+WHWDWZ7PgGFsRF2qQfjQ3D/h/HfLZmPIRVz1+Z6a6h48f/tdOkJGgJzQSS5ylfpBFJgb3h0zS4mrof2wWOoO9Q4hUdhu3S2lmYY5+fIDTK/2upMClRN/r5SxPh2AmdKGvAGUBeAIM+9YWz/E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 SJ2PR01MB8079.prod.exchangelabs.com (2603:10b6:a03:4f5::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.25; Thu, 5 Sep 2024 06:36:02 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 06:36:01 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH 1/2] ARM: dts: aspeed: mtmitchell: Add I2C FAN controllers
Date: Thu,  5 Sep 2024 06:35:20 +0000
Message-ID: <20240905063521.319416-2-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240905063521.319416-1-chanh@os.amperecomputing.com>
References: <20240905063521.319416-1-chanh@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0129.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::33) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|SJ2PR01MB8079:EE_
X-MS-Office365-Filtering-Correlation-Id: 51165051-f70a-48b4-6437-08dccd7501f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?3ANaER134hCSVUR/6N8lwZSuyyCPNozRinqs+MBUhKyQz6MkeL17dFxtErM2?=
 =?us-ascii?Q?9wrWBvwmxF8Pk54i06zGfRKTmD1VUO4glyTagm+u2bHh2Kx4HP1XAYmid652?=
 =?us-ascii?Q?XEcaYP0MJzXl/fuGGLE3MQq/As205FzI5UDnK7DSyuxwogu3d63JUym2MmWc?=
 =?us-ascii?Q?XtGtlVSe+R7kxgkftIIvTCOPRox6RvcdSzb8EaGhldX9cNHJe0/Rl2twysLp?=
 =?us-ascii?Q?RkRvnQKlvpO3P+BBmGCc5k6BaGsy4XOdBnif+GUX9P9sRWV0ZtsmtMftYDMq?=
 =?us-ascii?Q?pRv4xKpjLSE6UmhuP+hjRjn52hNFWdilOG/DHLAJX1ynHNx6Vpu33p9cJym2?=
 =?us-ascii?Q?XmoUclHv82K9QdqA/My2RbscDReD8hvMQKY9qPjzrkhgHuijXGSYzB2SLt1b?=
 =?us-ascii?Q?xORXVj9HxzQJsU3k83rym8m1ABY8B8BqOXmficQYaJxxFUHJg7D0xNzEmuPt?=
 =?us-ascii?Q?lNKCelNemOaCMa87CpVJvLROCy1ziwlHZOYD4o/wrzOJ20TyDSy6izC1XkTn?=
 =?us-ascii?Q?WN+e8/qFijFK3LcXETNYavdBTsSrkBcK4uMdBL6a1alK3hgUcWQqJyCyVEs5?=
 =?us-ascii?Q?A1fSPZIDErkPQGek8Nq1QY77cPwaVE20XO9Bj1FLxqDFDNcofH+OnxPUFnOU?=
 =?us-ascii?Q?bg4QVICUMYvxJ5vpGNQSXMFkNiVmTWO137NecNWYoJrXvD2uDgRk5DCxdRZp?=
 =?us-ascii?Q?wbqljWFOQmWsOBQUk9KR6MWC2INJ1oe+Jxc1STIiD9E2QwzZWabTeTDqjO/E?=
 =?us-ascii?Q?wGMK7ANhJomZPXuriv0wJQ5XsMhEOvmwOznNOfRk1EC95Dl1V7OCpB5rv1+S?=
 =?us-ascii?Q?k1casMaDSrhkJg0ayPzRBnHXOx1TPiDwp11whw7gDAZ6K+Xb0m6h7hUGiDd5?=
 =?us-ascii?Q?v9M7ki8VeZUL0D3En6KVrUntsm5Aj4owIn883rMzChUBuxmlK1b5S56aHmQ2?=
 =?us-ascii?Q?Zcy7BUd8b4i4SfSjySQ2owZfX1hEWeRSdE51JI7ZBnU73KHUwumZ8ELd+dqp?=
 =?us-ascii?Q?jqDtGBfg+fcl5v56RDlVt7WoSUuaJjPH0jpM6i9h0z9Qi6QP1qyV+dygG7pu?=
 =?us-ascii?Q?517ffBiLhdp47m1cbki9AZBDKglTnbxl4Ehvq4GqiyZuPMF3fgGcS7vnn+fb?=
 =?us-ascii?Q?pm8DhgiC5bUQBjmVGZnUsZspZzV9SyLKkO3vFsTdCbLKGJkvoBJJT93V+YLL?=
 =?us-ascii?Q?PgsOJsDDqC8SYLZm/xhe59Ex87WIR2uHGBDowPShDcOHEDHj6Aok/TQWqEin?=
 =?us-ascii?Q?3mzumGOLeapDlAcU3lzAQE4mfUT73H0PIY7s2sA/qyvuX5e6oEP50LKtvbAs?=
 =?us-ascii?Q?7hftsw0EvpU1DLIGEV8wda4a97gH5QMDKMluBVmsgKro8USu1vfmyK7HeWW2?=
 =?us-ascii?Q?p8kLUTdPNeKBJw9o4b0oV710diCpWyP8K7sIEkNTJGzl6jmrkju9xRqQU0V1?=
 =?us-ascii?Q?Du9RapPK3Nw=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(7416014)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Pt0/+76L6HVc0Rgr5fsaFuf9L85T/C3XHzCNo7Bux9DaYjRQS+V9waYiJaCn?=
 =?us-ascii?Q?YyYUp/z2CdlDX6H85Il1A8TxhJeLG0TxVS7W1tFpxiRP4M/FOwkcEAweh743?=
 =?us-ascii?Q?5PRqVrZCz7FDcSe2A95WskFK0xbCxS13nbodPJ4j37fVYId7F3d6nJJXCJZN?=
 =?us-ascii?Q?p5l1j0l1jSJgEUswDGThyRt7bnmzP5VteXF8CVAXagGl80+M/hWcBNmY6E9Q?=
 =?us-ascii?Q?HC3etPwf6CvJuYXyryaEJQr40tjZx/CSAkGXBPinhu1qdWmtPb7G0WJeCssK?=
 =?us-ascii?Q?vgaDvGWSzZFZUYt5IdYiMNYSvpjqOuef9DXyQH9g0d7UonvXOsXxjDsM+GxB?=
 =?us-ascii?Q?3riCD9blcvnDpxq+aHEv03bZHOrGdkB1h/zvykMuUI5uxYFTJZjUk8L1k11n?=
 =?us-ascii?Q?FF1YK3q3LGf2FARjvXc/JH/aXkSBFU6lXOQAnj8Ur5QAuPNTAx3uz9rCm3ko?=
 =?us-ascii?Q?zz4DMfHsvhqr4kqnjQStkRwUIccsa7CAX25nlaNoo6hcib88rnFyUxCBMlyP?=
 =?us-ascii?Q?cmJoO7H4pvLukTH2LncG5m7GATrQbZbXlYEZzEXLv8WeqxPTH2+uARjUrugP?=
 =?us-ascii?Q?9XacHtNNVys654RUunAsg9upIRfBrfc4k3Jq0HyGJ1fZeKRSeZLPjh4FLfvE?=
 =?us-ascii?Q?gm75Agx1HTGOwTa0FvgsWb+7J/S1E4K1a4ei+BIParL2QTNwX6EYQ87YTprL?=
 =?us-ascii?Q?7v4RLAFhD0CTPDX1o1RLssz/mFo8fR+SN8Uamzzgyw8vQw7XsNRBQzUzGC8h?=
 =?us-ascii?Q?oxAretpvBxY7a914G2tLJoq2Xi2SH97cPUHjKWIRYOaGkMk/eLOYvAUrwvwh?=
 =?us-ascii?Q?tZ6YrQuTaX8LMSAH6V1wdeqW377aYdLgZqj3sqmFSkEcjoIfVRXsSQbxFIax?=
 =?us-ascii?Q?YKnQOmM2I1XE6drQHHPvwYetWJ4cpPsMoIiw3+2A5z+l3Jl+lyqdXVpk22pS?=
 =?us-ascii?Q?yNXCLlGBeBbeET/8HozigNZLDRg5PBuP22W9g2OILu5CCEaqTGNwDOfpBBEw?=
 =?us-ascii?Q?V5gQuQfV4q9HJSb/uB0kOIeUMdryvLnXyzmCKDwb3MHEZSev4U1rdnJJ3Ygj?=
 =?us-ascii?Q?a+52E/L4fTC9ZXIZ9xK7LiU2iy7bVrZlAbpTZzDy8+ud5oOMbbB8L2yLJGel?=
 =?us-ascii?Q?2P0bcfZLSUGhUkZ1u6PpctMXlqtWG/r3RUwv8uVGpanrfWPHnoYUCZIKOm8b?=
 =?us-ascii?Q?40iQvuCklbisTO9Ai8jMOOpXBo0pgDolQS5a3Wt4iHfh1yJXDLtxV05En2uI?=
 =?us-ascii?Q?l8iURffGbLDMwBuQJXjH/WNOTkoi+asIHLExMGGpBoUi+EEy/ELvIOzAZMnS?=
 =?us-ascii?Q?j+QPKz9CiCs4nREdyntp4e3M02jD+dIh0p13cmR1QsPaGaYGtmdremVq7iw/?=
 =?us-ascii?Q?j+zaY34zutaxKZtAaPaL+6c9jNh+MoVTRuNbzGbeqx4+bc5jvr4CTUCm0PlR?=
 =?us-ascii?Q?ap5sayvnl5neQ8G6XUqugp7kvtW8Zjbq9HMN1pJT+IuhoXNvQn51AJ/ZdQsE?=
 =?us-ascii?Q?69SUqCgeQvq+JqfspEHNM4iB0PCZ1twj7y20BMe+3hyTVtr8RhmnCcZZP6yE?=
 =?us-ascii?Q?wrt8/GmtiE2QsN3QGjEN5FeJwRq90Ymdx8gGmFL08bWki4LP8lgYyTDi28s2?=
 =?us-ascii?Q?w9QoSbeE5m4fAe8KY6ykP1w=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51165051-f70a-48b4-6437-08dccd7501f8
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 06:36:01.2403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uITgdOLA6BInoa+hbHisN3u8vqRJUa5ENXzMXfH4+N77yC2t/8grYkhxKa6x7N9+wOkwV4JmUbNBwFf3T+sNY4JQux5B/B0Wa9RXQSWX1cKfSPA5jJgUxRRvwX7aWJFM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR01MB8079
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
Cc: Chanh Nguyen <chanh@os.amperecomputing.com>, Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add the MAX31790 nodes as i2c fan controllers.

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
 .../boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts   | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
index 0295f5adcfbc..da181f9ae820 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
@@ -684,6 +684,16 @@ bmc-ocp0-en-hog {
 			line-name = "bmc-ocp0-en-n";
 		};
 	};
+
+	fan-controller0@20 {
+		compatible = "maxim,max31790";
+		reg = <0x20>;
+	};
+
+	fan-controller1@2f {
+		compatible = "maxim,max31790";
+		reg = <0x2f>;
+	};
 };
 
 &i2c9 {
-- 
2.43.0

