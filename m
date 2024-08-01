Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E96789447A2
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2024 11:13:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=C5QhnRwc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZNYf5tG7z3cjX
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2024 19:13:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=C5QhnRwc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c112::; helo=cy4pr05cu001.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from CY4PR05CU001.outbound.protection.outlook.com (mail-westcentralusazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZNY63vq3z3cjX;
	Thu,  1 Aug 2024 19:13:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wP6T7U+7H1ovMpH4wyTaxRqBAdP2oMBawoIYMcrokYAvPDv6qKL5ZBDjnp/mqOWwqdCdM5VqeNjvTBB0g0Lc5vWCr6WIm1lbeu/41BNOJZKhLt1hcZt5cMmgL+/2pKHkX37MQ+xsr7kGVrgaJOvfo+wQiH1hWLiCwoRi1H7bGdfyHUqHXOFxLtwudDwTpQXNishH2IZMeTcTq5+uwrncj5PGzXAE/A39igPj3rfVq3LTGqln3Wevshyxbknfw9va5BW5uKvheF4LirCP/xQcd0+0TEkGQi+jlbInHy8dGovXlHX154C60P6NK3Ohx1Zmn06DzpgZtMfriRio41FuDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRb9xLeS+xutNZtENfP2k3UyTacyvn6FbIq4C+D0F5I=;
 b=xRY6q3ib47zO+nS9ZaTNocRCGGAXPPhlXBf/M+lZR3TyH/tFkv1M8xLj0kxTi0WtDQquiQ1VuYsp0pW/ER8P9J/YueGq8sldT7uVEkTcpBFqMnGuuFKv923KmGuDArYw+bLr9/rvtfs8jKyjiDZdzvxiPLHGaYYwfuJQ26JiQJ+2VCPbRgQosQKFZs2HRSBgBBY8Am3n5rEkT5wVJHFgaBDVeuKu+2LrkUds/XFqSReQl0qxeeE7xdiLFWxcgDr4wnaYZsP2CSFYXIJoc2dna0LdgYha1jtCQTrdc1UdD98Xtsiv7Gser7s+a5LgtgQ06WkGFPz88Fe4RyZYZRM6gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRb9xLeS+xutNZtENfP2k3UyTacyvn6FbIq4C+D0F5I=;
 b=C5QhnRwcC6lvRIBLUmaXsgwNh3x3j6uhw7wRs2VbVWN7typh7ome4Zoygpt+qFECKJ9t8NyKl34H1SFB+Ban2hk4qcWE1r98IA/fsBTGoRAWMZpcto3xKXFmezY/M9QELTmy8PkajZMuljXjj2XYUeV3iORfQd/1ri7molpLRUM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 SA1PR01MB6640.prod.exchangelabs.com (2603:10b6:806:1a4::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7807.28; Thu, 1 Aug 2024 09:12:47 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 09:12:47 +0000
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
Subject: [PATCH 0/6] Update the device tree for Ampere's BMC platform
Date: Thu,  1 Aug 2024 09:12:10 +0000
Message-ID: <20240801091217.1408809-1-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KL1PR01CA0105.apcprd01.prod.exchangelabs.com
 (2603:1096:820:3::21) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|SA1PR01MB6640:EE_
X-MS-Office365-Filtering-Correlation-Id: 77ea84a6-0d12-4dfe-4021-08dcb20a1b94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?zgRif0H3FpDfYxE5ixJpvX4EKyvZhujW25BqKVCuATmHglo9cg9rZAJcyyL6?=
 =?us-ascii?Q?Ko3CfduhquwCDOXQQzpnhKj0Cq2xj18KE9GVNGVYEdIpFZTgR9CU3+smeLrb?=
 =?us-ascii?Q?F5WjDznKKlIEc3a2ifwSuzrvZtsKskksB9QBWbTe/2qHYQD6WKWSkP9lGGem?=
 =?us-ascii?Q?UugelnTbJuO6Rll9XYR3imp42sQJdRQT2v0Ld0NL1UXWeRFmjMX+do9LfEPN?=
 =?us-ascii?Q?3P0sUN+E3d59zr5igdRSK4Mzhx/+vjPmXxa6iZvLkTMtEBo9RIHAQ7f84Unc?=
 =?us-ascii?Q?zqoYf9ynR7tIJcHnvvF/b+s+5njpb+JJn59tYfb+iTsKl77229j7l7VpTBmV?=
 =?us-ascii?Q?/bD2eGtxO3h7kRQjqutLRMflfHHZg/4rENDuNpRVxfsgSoVJhZFWHSyeqsTk?=
 =?us-ascii?Q?D3P/hVJ+0gFJBbY2HIPkRVxnKAuu5eA+Uq848iiVysxVm+FtHxi+oN55byt2?=
 =?us-ascii?Q?l6H0qNvkeCJscLYh5H9g8GUVNqPTxqEEDPxKnv9z42wrs7EMxTsqA+M8soiI?=
 =?us-ascii?Q?zW0Wm4haJZlvIvHEvgsDvYw/vcq9qUbwtjifndR2IGPc3e/kk4OvqVKBxiLw?=
 =?us-ascii?Q?cGeD+BNWk/3uBo4fP+gY9esPGKkBAX/c1WBVTxYpdgiRw3BErulfgJN2dggc?=
 =?us-ascii?Q?1myCLEswvM4X50AT7z9nulbg7xHR/r1KWfj9MRM6G34pGx5CeB7wOpY18Ji8?=
 =?us-ascii?Q?pc135ewoWKN06lVzBas8xKNzTeEOQh7Yfq44TbHOCXdEufryeaCY2dtc/FGQ?=
 =?us-ascii?Q?p1OzpydokUU4VIaeJNdyIhvnV4xMCjmHkmjqBrKDbVvVXvlLM8g8hfgv8IgF?=
 =?us-ascii?Q?mVXuVG+IeBvpaPl7eOlptokAuTSpolQC2m/cjxS3BSAKz2S/vT5UWu5XEFII?=
 =?us-ascii?Q?OjfjR0dSQ92Vo/QZ/h6aZcLVxzK78twgzD2Rm87I+coCPvYIrAv3lvfcADS/?=
 =?us-ascii?Q?00QY9WGVlXeN/qYAXofPWzMNR0nUbZ/OYohBO+GmZEq+gCyqJS1YZeExJj2p?=
 =?us-ascii?Q?AEtqRcJT7NAcp9MiShrVkukfXBLsSVDZ2q5EdxhnV3wudmreFMQI3hgRmAgn?=
 =?us-ascii?Q?jAXSxzmnbPsREZI1vKgFv2Cwj/dZvpjzD+RWVIwaOh+iXMRU2uvrZwPZMhl2?=
 =?us-ascii?Q?VSLaVoUd4Y5GmEpzOlZK29wM50UfDB3Q7fjNqTeOOaEdhwUu29Vn8KALURSM?=
 =?us-ascii?Q?2tG+WJLzQRMKsaHoQ1LD/zPmm7lkn4WHNOW2ceBiDQySmqpxHgyaMPMvsRYQ?=
 =?us-ascii?Q?FRimRRcT614pZf9c6hK4OprjlJEZN+th6kII8CfbW9+Zx6rCARzwoARUdc+N?=
 =?us-ascii?Q?INjdLO8gSmNKXMCV/BZMn8iB5rVm9nsahQHIVdAAxMPDBQ8UsvGhOurzEBso?=
 =?us-ascii?Q?s0oykyqsOOZEQ8PCWRRX7AKrnI2jfGRcGaT4J2AXaeJZMGyOrjCWCrKl1VEb?=
 =?us-ascii?Q?m9IRi5VKqnM=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?DJkzsstaaA5zleXfTR+lnSmv/eWFY5V4iHRxd80MZ+Q0zx5a6pnlVBuJBC39?=
 =?us-ascii?Q?jn09m7+21v7d7WBWSFRMcc5g5q7Vvvve5iRMiBNKKbLDWFTcKgBg9TISLwm8?=
 =?us-ascii?Q?wDDYglFTZmaPV+xmML+JrXNvr1cyDxQgWwvBFHj9+nauG9c7i4UrnlGOcKVG?=
 =?us-ascii?Q?KECLdvQkwmbT1DoEop9W6cAJd54dM2P0IIrLV8dVCnOMTjccmCtIHNCXGLuc?=
 =?us-ascii?Q?Ok1of8tQVVRyitEaPvVEnRSyt1lZYjQGdGhsakP5Dy5tR3sPuXab8jYEcZzA?=
 =?us-ascii?Q?a8Xil9oXBQH+YscozKkIfEu9wNvPFzyYFyQR9WDwfhRzYZO1PdZB6IZ07WSx?=
 =?us-ascii?Q?vSLhL3WwGASHtdb0jlxqfCVC0nPE3eFASHxQ5FboK/lek3mvCl7KG1N3UQdt?=
 =?us-ascii?Q?buEaf5bjHj2IdelXHktuK8GHr0pEKpZHGZ76PGNnOm/UWk6nL92p0X3qCR5e?=
 =?us-ascii?Q?H43q69A+0MGEKRAEmOpfsywpuJHGLozy2g4E5aKEfg9gd/9C22gzLYPIXsgd?=
 =?us-ascii?Q?aoo/B+Vp16n48z1aKefYiwq/a3uzR/f4TpfMeOcuoPY3X5WahCptUwWOwZ9X?=
 =?us-ascii?Q?zUlyBNIs+h7h6hxet7DQ3Cvx9+jnCsVrRD1no+A8eOMFeTdr4Eyfbc0CpOGS?=
 =?us-ascii?Q?3sE+1N6cF/Ikt3SgYF3DumCGMbvCccye9s95wXtSY3Wf2cPccfLm5+6Ve47k?=
 =?us-ascii?Q?6JNGkJdLd98NwjScwW1sSRKhuKXqlVLGTy7/5Ng6nsiD6R+hQgDQ+UqMvNUe?=
 =?us-ascii?Q?OIU/UWebQyYGa6JpGRZfhNApSn0y0Mq3ClZVu+VK7ycj2Xmb0HfElea95lcA?=
 =?us-ascii?Q?nQAxhGj4jZF6W47sKhEfWtj7pVNJZvXbFBkciTnBl3d8ibGFiCyMD47dk71S?=
 =?us-ascii?Q?IFsuScKtqkTuGFX0cYc3GmrcH8ZaxMxNUcmfpXAnWVC4CJzWpb5MkpKsa8hm?=
 =?us-ascii?Q?4617PRYYDHAOYKnJaHL59HJ1nIHUTo1w5QF2S9pwUJvkGJoV9OfWuu+dpG95?=
 =?us-ascii?Q?KtkQbcAyu5dbXUXS2KtRrfn05PpKIvuEZE8hSc2NLVEAWKqJN+aRTE36gGkO?=
 =?us-ascii?Q?wN5ZiAiOWFdglOU660fwa6QgA7Aunx+1bUMf+nkbkxdX636QyuJRZNTNojnO?=
 =?us-ascii?Q?v0ygQ7iJ/CGqlh3YwMCUSuoFj2okFXrcDGhzIDokvPLx5fqrfMmHObTskD6H?=
 =?us-ascii?Q?Q1+NUJfXrdAv2CQgRY4hY1MRUjqDVUrVikdb9RyIGMC7FpmzLybDjRiAcJyl?=
 =?us-ascii?Q?qbru8VNDM78UjYboTLl0LmyeTEPZjpFbk7UFaTLZrsGgqwYTkB/unlROz6Sj?=
 =?us-ascii?Q?lyeosIEdQxOS/Orqa0ovZDvVRMRkBKd+VHOlft3m0U2J30SdVqEcc+UciC1P?=
 =?us-ascii?Q?ubtTBc56+gPaAKLuM8kDUBtKAykCL8o/amL4hXadRptoLiZDzzWpA0b6xY8n?=
 =?us-ascii?Q?/lcGPRcGrShzvf4PDkpGR6IK+23wKKpBgLIU3sU7IgqhEkxXQuyzCbPrm6R+?=
 =?us-ascii?Q?Y2K+lBwRqPhEBq0KOJboEW4mEBviuN0hHhWzN8t7I8p/q6XaflXpvbrWxL7J?=
 =?us-ascii?Q?5JP6OTEmKczuqHiDnvlQXkZkBf9+WuM9qzqFAYtRQNs8QQH9bht04FIKNnXe?=
 =?us-ascii?Q?1/qbjfMMHLqZ/SWFxP67OfI=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ea84a6-0d12-4dfe-4021-08dcb20a1b94
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:12:46.9322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/H4KMp7VuFpao4Sdoe/LWhafrurpMBMw3Wac2mDgPwbzEvSX+PV4Wt4qvCWQTlfFvidvPgoWir73rEaH83ZW1y8RsbTyAkXHzC5B857i4CWM8dzalCRa4x+X1rRWK9i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB6640
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
Cc: Chanh Nguyen <chanh@os.amperecomputing.com>, Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Updates the device tree to support some features on Ampere's
Mt.Mitchell BMC and Ampere's Mt.Jade BMC.

Chanh Nguyen (6):
  ARM: dts: aspeed: mtjade, mtmitchell: Add OCP temperature sensors
  ARM: dts: aspeed: mtmitchell: Add I2C temperature sensor alias ports
  ARM: dts: aspeed: mtmitchell: Add I2C Riser card alias ports
  ARM: dts: aspeed: mtmitchell: Enable i2c10 and i2c15
  ARM: dts: aspeed: mtmitchell: Add LEDs
  ARM: dts: aspeed: mtmitchell: Add I2C FAN controllers

 .../dts/aspeed/aspeed-bmc-ampere-mtjade.dts   |  16 ++
 .../aspeed/aspeed-bmc-ampere-mtmitchell.dts   | 152 ++++++++++++++++++
 2 files changed, 168 insertions(+)

-- 
2.43.0

