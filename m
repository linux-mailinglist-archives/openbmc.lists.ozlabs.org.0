Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAE06EDC08
	for <lists+openbmc@lfdr.de>; Tue, 25 Apr 2023 09:02:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5Cc324K0z3f6R
	for <lists+openbmc@lfdr.de>; Tue, 25 Apr 2023 17:02:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=j1n61RUF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eb2::72f; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=j1n61RUF;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2072f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eb2::72f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5CWz46Fxz3cdj;
	Tue, 25 Apr 2023 16:58:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n2pzIfBZQgCM8hDlCqtPKJUyq18RzQjO+1a4iNkq3Vd9UvXh3kTIFWNh0tmQy05ybM+ckHhytyR4+am/ifI0FeQrSGCE0TllPLLXkJA3hY97o0XHS7AqUbVrONxpQJ+xrKdCR/Bnin9YIfNR5R7G1lG+LRFWnniypM6vxPdJ4WcRfw3g+7n6hKgAJeSfUweaCPfqlO8LHupMV3ge4rSQn/8gWfJzqntI9BkGjqAXHtSlFZ5VWmYbi8/A5pAwcL7dLein694OCfIUKFtk7p+qxd/ZyNpDQ0AyRZQeTbq6BRBllEEFhSi0Rq44YHXf7Xo0pCrPqIwEQZtpbks+Up9uSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrErqXJC53VxM2wB/OXNQ/V63QIPSlJVlK1UaYSJrmQ=;
 b=KGvN5QjhWIh6C/vWvLWQm0qrBqdM5VhKWF98ssxkH3b2ms6UAtGbgA9IksUna6Jlq6thF4f4ed2mDu6dnFrYaGbjagE8r7n3es+USTynFzfCZcdRZ77kE5QosBZI85ejig1dOA2DbNAZzxWzocomUphPlXie2sf0UPB1KDV4RQ/y6/ZXWalBM8TuF2xmXyldBY2iDLMXDwaX2Bv8KBQrTqpwcaAKLcvy3ZWeHGmty11nfXn0oDeAURgBIFKV2YFmrjxLTAbV1eJqQvi1b/zgA/c2ctEkokb2pVgV0LdT0Zw08p51IKQuxe5m1bPVppja6ZlOiRzu54hRpkb35vPphA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrErqXJC53VxM2wB/OXNQ/V63QIPSlJVlK1UaYSJrmQ=;
 b=j1n61RUF3cJ6ecrjD1P4JyRH/Adua5yDftsTcwyFXqKdjn3w6TwGX7bvJZkNWU+7mubw2lSklthNecClHkfLRdsJ+qtdAqTtvhK9ONo1E+CxknvyD9xh2rC6C8zacGPo1kjyjXK6Amn6cTsAghv3LmWtYx/8lcljrBtUY+CwZAA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BYAPR01MB4966.prod.exchangelabs.com (2603:10b6:a03:7e::28) by
 PH0PR01MB6504.prod.exchangelabs.com (2603:10b6:510:b::14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.19; Tue, 25 Apr 2023 06:58:24 +0000
Received: from BYAPR01MB4966.prod.exchangelabs.com
 ([fe80::46c3:3b44:d2f8:4c3]) by BYAPR01MB4966.prod.exchangelabs.com
 ([fe80::46c3:3b44:d2f8:4c3%4]) with mapi id 15.20.6340.019; Tue, 25 Apr 2023
 06:58:24 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] ARM: dts: aspeed: mtmitchell: Add MCTP
Date: Tue, 25 Apr 2023 13:57:15 +0700
Message-Id: <20230425065715.21871-5-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230425065715.21871-1-chanh@os.amperecomputing.com>
References: <20230425065715.21871-1-chanh@os.amperecomputing.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:54::15) To BYAPR01MB4966.prod.exchangelabs.com
 (2603:10b6:a03:7e::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR01MB4966:EE_|PH0PR01MB6504:EE_
X-MS-Office365-Filtering-Correlation-Id: 30bba879-403e-43d9-897c-08db455a76c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	weDf+Qln3h2ISa/Mgs8IQVTeru+ZdJpJ2+wUolOTCCeIH8sSDibVCeDHPVLWLgsWzBY5sBN2lk7+81CIEhvW6F+/IhhrqjmXgkANgrlx0zmA7e33d1VGI6L1HYZ1NhlmjJdPJlZ+h1KfN5cdfyOcmcOxHPUfSMQg3qoRfa2sJMFErYTyaqDjEpeqyAVXoDpyV5EfUKqaGuCMYA73BvuH8IxoIhZSgSh1bJmqJGQnRZU6LfxUG9Mz8C/2+JhaMZBZmT2/LcAq01vH8OGegDYjNIoD/LS8ytklK2l2eKkYoDsojHG2oosCWZ5uQWiRLgh7SleBz+j1K9viURuiDNEvsKVgx0lxO48GIeO0MTNYRF3PSLK1KV9os8XMoHQTjQZToS8rZUuC+gaq5mKdhes8Tj5Z8wtWy5+NvdtVbrjBbCP4ZKJhEDw/f0vFZsvz913vsP1NRDsWU4fk+Xeou6TqpZnGV10xRBxg2U0WE1lkItmx620cYDw9wkMyup9PUIO+Wlr8IbtgtWE2bV+6iJnksCg8JibJ1d5kRnqSol9ZOANkcEzoYYHVxiJxxNow4ZTTGHDVz2Y3j7QTPLwA9Hc6S3KlhOVg071s5tU1/+udBeRkO/su9j8EDSDxC3395hJt
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR01MB4966.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(346002)(39850400004)(376002)(136003)(451199021)(107886003)(6506007)(1076003)(26005)(6512007)(2616005)(186003)(38350700002)(38100700002)(66946007)(478600001)(86362001)(66556008)(66476007)(8676002)(8936002)(110136005)(5660300002)(52116002)(6486002)(41300700001)(2906002)(4744005)(4326008)(6666004)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?yWsTi82feKNNXNI2DJkbuS49cBtIARX7I3yxgKPFd+t4St26Jog7CoEylAix?=
 =?us-ascii?Q?NrDX+1rKX9LfqgnKyDd79ImoxgCdem8iHPK/fEUx+sYeAh9cElB5nrFbWIim?=
 =?us-ascii?Q?T2yjwN9qwFXFD0auJFnGfkG5QLsE/gAbOBQ8PVWw3mBNSdatofKHBvhFbcSz?=
 =?us-ascii?Q?i86iqcS5dNRNN8kHbVdHZkrdYX4amCT0PiBXfo315z6EMD8EXZNvW08uQnUc?=
 =?us-ascii?Q?SODqTlM1v3cMhiP1CfQNIvzGbH3SiVo8idhksrHBLz9EIklwtZbEp17rghlA?=
 =?us-ascii?Q?eOFjJdX2TwdFVBxAAY5j4zEW70L8NZyVnKjSpVg86CAfq5o11NnVu8Zka4GX?=
 =?us-ascii?Q?oGzwcR/QdHHbClrmCeTZRjM2b0T9pnK00Pk5w7uLP6+RpTWWc0mRPkVfDyiy?=
 =?us-ascii?Q?ZtiWuE3QmaYfFnHlk0i63TSdCwQe9fPqPw+cPmJot1g5A72C62FVqRAyhvLQ?=
 =?us-ascii?Q?XnMidu3oCGCKjIg1rCksrlCd5VKbDrYj+xi0RgAYcdTwpJ5/eoHj7L5ejc68?=
 =?us-ascii?Q?gB2nn14wDzbVp2kSMR2Wr5/nxwsvJ+Ekl77/d3bzZjzwwzQT6Lk7JEBxUz83?=
 =?us-ascii?Q?4PhQFZQCxilb2On7YAXEZPfNbkH5txZ2MEYMF4T7C0foRCaIIEZy9ypSg41u?=
 =?us-ascii?Q?uSoHlcYyWiRgOTOlNfSI2pVNJ/miyNyVAg2uYrvleyH9vfn1rbYj66+AJR3z?=
 =?us-ascii?Q?zjAic9qKx3mNozwFNITvgO4c3NoJIrDhIpq48Acjn9nSoGJxzVtU34WWgCFF?=
 =?us-ascii?Q?pCths9ZUsciJ3/omJsIlK96BBMGsXOU8S8MRDq4d8hU3RVKLhsMl5ljPZybk?=
 =?us-ascii?Q?mU3q3oGoa/2al/rrikYKGPoMwU4C/bvf1xSFL/uMiK7diMD6INBIxzezFy7I?=
 =?us-ascii?Q?+/G5+Xs0aNpJGTCgr5I/+SiKGwfCFNSY2awDHNBXieCW91G2rLvZ8x3yLz1h?=
 =?us-ascii?Q?iUuLbkS8KqCoHjLAvIaJXfEvs2oO/cXzwBLqUjCA6Rve47Ol6lCAmPfElPHj?=
 =?us-ascii?Q?rm+Tz9CDEUDKlVR9Irlfm6oyiULtS5FkcM9LoOwRD3xB8E+7R5G6aqTg2VeI?=
 =?us-ascii?Q?i/A1Vb+Uii77KZ44b33myWRFVX6ctckYTr9MB94scSR2wWuskvbWqFsGIlhf?=
 =?us-ascii?Q?FRaUfP+2tNin/pK0tK5nNyfQNl7mUeVyFnDuOnZVMdkJh5ZUcXEFY/cEJPaM?=
 =?us-ascii?Q?nNnqFwDFOg5P25/y6/QFpmT2Vf/z5veExi0v0v0qBIH/c2hx1fkoUCsNxssP?=
 =?us-ascii?Q?A/YyVeVDjQTu2HRRtxyUGx+KcAwMetuZRr9CbjqRhMBNXLM5PZikscqa1027?=
 =?us-ascii?Q?uALUoTGnfrdtEB57NQpUN4JpHeIQA/vemZxJMzwEolZnIo75mV1u1msKCuLy?=
 =?us-ascii?Q?4Hei/H5OZQ3nt0ZB0JzubV483elhT1QVe7vsSSOuhir/hOgJCyxjJpio2hMZ?=
 =?us-ascii?Q?0fDKnFNIZc3VH4b9pfYyD9OzuaHqymZUDwsMwXpKMWog2Jnu0W6r4QmcMoxh?=
 =?us-ascii?Q?0pu81yP3COzWQGeyQx642jQmcvEYBiJVElFMHaEOEWRxKi5+jWI9OFV4KZZM?=
 =?us-ascii?Q?X5Y+kT9xP1J6KmoArziVLv6b9L6GEt9tL+p2ZHAVSd7lnXQTUOxW201igjig?=
 =?us-ascii?Q?h3yeUKJlC7KV7FVuozFryf8=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30bba879-403e-43d9-897c-08db455a76c5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4966.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 06:58:24.8583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jZJj5hf+uYrgVCoa2kHXcZuZpom0h/fVXzvuRsuRuvppo0W11SRu1pIZlmeFZFrQsYb7ZsSXG7OD6T0g4AXyPMLAkE2wyq3MjTNTnqCNaO+jL+xvxR25ZRNPBfR7zO3u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB6504
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
Cc: Chanh Nguyen <chanh@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Enable MCTP driver on I2C3 bus for MCTP transaction

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
index 0b5ea8620063..33e06eafed31 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
@@ -366,6 +366,13 @@
 
 &i2c3 {
 	status = "okay";
+	bus-frequency = <1000000>;
+	multi-master;
+	mctp-controller;
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <0x10>;
+	};
 };
 
 &i2c4 {
-- 
2.17.1

