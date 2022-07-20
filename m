Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA9A57B342
	for <lists+openbmc@lfdr.de>; Wed, 20 Jul 2022 10:53:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnqHX6b0Cz3bqx
	for <lists+openbmc@lfdr.de>; Wed, 20 Jul 2022 18:53:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=vM5tFHX5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.94.111; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=vM5tFHX5;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2111.outbound.protection.outlook.com [40.107.94.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LnqGz5xdwz2xn3;
	Wed, 20 Jul 2022 18:53:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ttas4Vea5hOE+JQ4u29xglfSiSGYv6XH4cmE/+CRlSrV66dcqRhoKBN3R2sSOXPG9+k3488HqB06o5cn9fF//ioXFD2AxOdcvkO+x94QYYDYb3mJ+7UcofroAG/RD9XtROYFVTIYK5IfxU0AZdX3YuX20u6holLDzeWMemxQ4e+M4yjVpjSYWKjZPMye8NxUz/CyNMwar1epwIRMamyVLpyQA2k2HzFOGq8HoN2t6YM9g0N34OSUptliif7dLp7Ik/7vwnbxkxV0cN7DPZYcn4A2fx7+NNrhDV7kw/ngZ9mBCW7jEnb6/z3tNObBu62MS5X4+3lLdsivOA3Mpbq3vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=To1G1FEBPYFr58GlU/ov47m3x9qZj+aQh5Sv+w5JJFQ=;
 b=fHaqwAd6qOcZWKWzL8bEYEsvhkMP5im7z5nU5ExL+DzF/OHX3UlSqYY4cdH4xCchvr6Y4hxiOxeHrfGEQ0SfNabUr64pGLQbmgtjKEl6+gVS3UsuWllqEult5TClbYe7CEDALlvapl2fd5+N2tHvdOq2hc+UtWd0w4UHX53JiIyvidr0FmGXmCN7PNzjAwddWjdaOgADoiwCa2p7486AtLn5WZupegObo/cQfKT4JDLZ1Yqa8GmH699WwHNFdz9wio7NA1ZYwfmrTXkWSaPplqCXipJnX+xFuq8HVgnTUWA03MzPhS5v0QDLBgfKe/+2iIhVxMiFzCFmND8cMKfb6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=To1G1FEBPYFr58GlU/ov47m3x9qZj+aQh5Sv+w5JJFQ=;
 b=vM5tFHX58b6MjMHQDFD5WZ1MM+yvVEes+IP4aFbE/QECq0tNY74u9+q8lt8BVVzvmaB7IsZlbRG2D1vIpn9SRs51VuCG9o7iRU+Q6hT9TT0uSGmih78a+o4pcfvPZitdNrrCZF0Yw/CgFivhCTNX1yZyi3drDBXmtwHrqGwfM6E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 DM6PR01MB5289.prod.exchangelabs.com (2603:10b6:5:63::16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.17; Wed, 20 Jul 2022 08:52:55 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e%9]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 08:52:55 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Quan Nguyen <quan@os.amperecomputing.com>,
	openbmc@lists.ozlabs.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH v2 0/2] Add device tree for Ampere's Mt. Mitchell BMC
Date: Wed, 20 Jul 2022 15:52:28 +0700
Message-Id: <20220720085230.3801945-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8e5bc83-cb6d-4ea8-c082-08da6a2d3c5d
X-MS-TrafficTypeDiagnostic: DM6PR01MB5289:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	TUJYVH3I6lzBVGlsTr6koP60f9DP/OCDjzuMmiAWKE2NAxeIDOtp+oeW3jkb48OpR8r0IyTdO4KlcH6rJNm10sZph/li4kO3hoJGBdIHTwaUFdyQ7J9Zlscr+Mv1/4z3CnlbHEsr6WDV7F5rSW3mlFmWW41ju7aoOfketbY4Ei7tTrtmmfmsrM8Hwr+Delll4rsjPh75PmCpLRV8UdWFoOW9ZhBc22/9rLPWh5JZlwUIqcUuy+PcI0pDY+magzoZ/0kGHZVqSJHLdZVi8CaJ0SLWJ0griZVRLWKXQaAqd6B5oDdHs4ikc7Ns8y3IHnhKrjbXehnmgl3Rf/J1DpzF8e8ZV8T8L0oRxn9wFbPhe/Gi93HBf/bEYRKnylAE/CUNlCbLcsH2AQI1J4RxlDONMwklrV6+i4WQ211Z201is+SJnQ+0Ze6dkI/mxe2kvAZIed9TRRhBFDe8Hldwfjo8ULGGS/8MdKTwnqFXp0JsCZFTchRftm6JVgUS8E2NEh1U6IksZ/9wLclxV3HwuV3c7IsKtvn+/55wsam4q8F6kFnRNlNofFAEtOlw1cA//YXDYl3yRbKpKOEmD7X/YVsUUoz0vhT13jGXLiXGiXysi5LQZNwnTwko15WQ7ACy8JU2oex4/pAUmp4q1WHMU3MQg8KxYr8oIvnFREvRA5Kbpct5er38Ixfe8fV71RMZeROjTlHzX+2RNNjwDS1Ira7/O64Fi7P5gnAW6vSQ4k9ew1cLXSOKGeIGk/C/QGoeIJszovb+JkA2CncEqHvdr7tXx1zSdzQyRDQlYSNRch63klSg7eTpSUrgCch+7k+GWfgA
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(366004)(376002)(346002)(136003)(396003)(7416002)(110136005)(38350700002)(6506007)(41300700001)(5660300002)(38100700002)(316002)(921005)(66946007)(66574015)(66476007)(8676002)(66556008)(4326008)(2616005)(186003)(52116002)(6486002)(478600001)(86362001)(6666004)(1076003)(8936002)(4744005)(2906002)(26005)(107886003)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?r031WIgWA36ROm1myubz11Bxtc4fCd5H7BUQYpBAT6Zf1yk/yp8zgnIyyARK?=
 =?us-ascii?Q?MF54ldWaknJj/PAAEMGT9iUhsyBJJ1C1YD/EDSKKHwyjW6GuLu+kQunC9sdM?=
 =?us-ascii?Q?jKHQlDZIfEzY+fTPhSK77c34QEGLHIaekxubMYawUlJjo2ePpHsF+w80SQpy?=
 =?us-ascii?Q?uigcAnm5zwNTg/yQGXE+MGsbbUy1CLsE6SX3xCX66hCbkx9nmVFA52UnVEkV?=
 =?us-ascii?Q?7U8+BkrJRHwAqyMok5rmpE2qqPKEfw22fWl2Uw77QjlsXuHlsHyjXEYMZI/P?=
 =?us-ascii?Q?HCktO8UgpQlLIWHIHWVVTxfGOdJl+GA2csnFRE6y+/N6yHLMx4a+yi3FQCci?=
 =?us-ascii?Q?d3nnZngjhraFvKS8iOnEvgKoWoW+WR0FqR/ThXft4DeBONBVhw2xCWnyYvkN?=
 =?us-ascii?Q?RQOadGahi0AUaqPvRncS/YzHYFhhpQDD07qGJGZKVZ9nd4xQB/SwpJ8P6ymr?=
 =?us-ascii?Q?ATBaxTAtj6rxCQqo+QeKIDYhUqBf2afb1oAJQ5a6JDqHrpeHRJb60y/0OM8S?=
 =?us-ascii?Q?K7Owh+nmxh/ditJ0MRFGTlbMmddCyTZhU2tBr+7obP3XrPO9B6Q0ELpA3eSm?=
 =?us-ascii?Q?7lZ4IJzOd63j3Ak+2Kwz1y89pasOeXqvZIw9nMcqeZtD+4ClfX4AbYlIsi4E?=
 =?us-ascii?Q?osoKbqTEcLqTGUxApWHjN3jp935rvHCUJPwo1AWFgIgpQV9Mfrh4JL+UIvoL?=
 =?us-ascii?Q?9acuVmSVDC6vMbWush9r6wFNqxo1MbPUjIkaAaaVJ9z8f5kzvRibWNg2RIxV?=
 =?us-ascii?Q?Qdvl32f+N7WXBFwt5jZiCn2SqQcCTL4QNuT1/Np54/dPpqaHd6a0qgLO1kM3?=
 =?us-ascii?Q?oP669wX5jystJeUVVZz4HDzMajjuDjeJ+bwPPS/QobekmTkjvWVQ9OfAQ2th?=
 =?us-ascii?Q?Nc2xoDumwSwuCh6mz3vevc4vW55dUMWANOaGL5jGoUnoMn22SCV4yE0p+PsJ?=
 =?us-ascii?Q?tfJQgthELD76BZgicHiZnapuEE+c2cRpsoaU40NY2RZPF4191Py56umZAEnQ?=
 =?us-ascii?Q?Bl3d9kFnkMq8NfM6xCXEGrHAotJfa3vAKgPpTVhBNS3lsIPCHqcYk0YCY4Ay?=
 =?us-ascii?Q?6tabvvDzbwXmnWx9cjFE7OdwXWEgxUQ4YCQkdkGqzFhCftGDuODjlskF8Nys?=
 =?us-ascii?Q?rYjGaDQuLcCJbOPhiE/J9Nl9S7arKplcVu3/U5GzHstK21RhdVv2cBnui1L3?=
 =?us-ascii?Q?FGxZFmhbnyqGwL0467xci5Inr2BUOL0CVHvplLmqZ7JpTmotJgCzNpYuFEYQ?=
 =?us-ascii?Q?TBjsi3v2JOlho4QI4KvXeZkdd1xNqdfNvW0RsQL2UFJA8PX+2mfySE1luszL?=
 =?us-ascii?Q?0INnD8ni6iOYmwrgZGNO16IAgYi1jujKMm/c6kCeeCX2iXDDRMSJpHU4M0e7?=
 =?us-ascii?Q?+nwYilaHNLq6RJKBIPBs8xel/BoWJyNZtmIzLWL7yxk19c7Tcd48V4bgsMy4?=
 =?us-ascii?Q?rwnWJMMc6Ftee7vIfy8k1cRQDyxbpMB1mM/Uiywo6PGceFCQflX7OKYo9Dai?=
 =?us-ascii?Q?yAbXwOltMVh/3AXdes/ZZsHH/yqUrEq4+NI6amZRO8F5IB41KwI9XrMoI6py?=
 =?us-ascii?Q?zynSSYES7hugYSMv07bDpUy9uWYKaxUiFbhE/GSQoqe1S9leAbuV/nSbxCYg?=
 =?us-ascii?Q?tMuFYps3mtLm7lhrsGxrUf4=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e5bc83-cb6d-4ea8-c082-08da6a2d3c5d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 08:52:55.0507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DwtpoDcb1IruIjGrg6xNwbZBZFlUEgQx3qVLpJmngwfbGIB4N8vJTMwwlH47E1n5o64dKyJBLmXkFvTTsZLy9lbWwogt5xI84vor6yUCh5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5289
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
Cc: thang@os.amperecomputing.com, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The Mt. Mitchell BMC is an ASPEED AST2600-based BMC for the Mt. Mitchell
hardware reference platform with AmpereOne(TM) processor.

v2 :
  + Add Ampere Mt. Mitchell BMC compatible                [Krzysztof]
  + Remove bootargs                                       [Krzysztof]
  + Fix gpio-keys nodes name to conform with device tree binding
  documents                                               [Krzysztof]
  + Fix some nodes to use generic name                    [Krzysztof]
  + Remove unnecessary blank line                         [Krzysztof]
  + Fix typo "LTC" to "LLC" in license info and corrected license
  info to GPL-2.0-only

Quan Nguyen (2):
  dt-bindings: arm: aspeed: document Ampere Mt.Mitchell BMC compatibles
  ARM: dts: aspeed: Add device tree for Ampere's Mt. Mitchell BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 577 ++++++++++++++++++
 3 files changed, 579 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts

-- 
2.35.1

