Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C207367C0
	for <lists+openbmc@lfdr.de>; Tue, 20 Jun 2023 11:30:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=ogRd2yit;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlhDz4q68z30h1
	for <lists+openbmc@lfdr.de>; Tue, 20 Jun 2023 19:30:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=ogRd2yit;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e89::711; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20711.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::711])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qlh8m3WZnz30dn;
	Tue, 20 Jun 2023 19:26:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hUv915J9aLyk1drZSlFs5CHX9g81GCFQm8GcNrVGjg/2gTUTlYtCVeQdmJYoXwNYjGhtuVaO6jPivm3ofUVf4qMwgUvu3WyD3+gtoVKSAB00K9YZ8tz2TzDPRLRQsb7lM68JVSf7Gnv0wIuu/Yo4SUvrAJx6ICfjslbYqrQ1/rAiewM25k3I1PT/HZlaPt47Q1fLdU8k/4sr0uDggZwCkTmLulnuTm510GSWF2LFtCv45kZR4h2TdnydH/qzSJY8Y/mrK7SBOZxTJC1Qwum3XPUmcQ8S1TpY4EkOV82iOgH7fkw30E2a1jzQY4jiXwrAn/RP1RooM/NoQp2dXfiFtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MXYIShmzKc6iX1Ya2XtjZkTj2meSkEmWrQ0G2iPJRX8=;
 b=fKTMZjL4WJr+TWHgUQpuznS918e7LtECRJRQA2JHeb7OYGio6th6WS/f9vBrf3eZoikLgYs1Ng+5H6Qsw0m2rmqDyCrH+UYLZ7Re2jHoePcW1DvARhY2w1PQm//NU+CUgP4hGYHA6W11KKKx+fcCqNXf4isAK0DjTwrMF9UO8/tRPx581Z4ji5xNUpsSM0qpXJSmF7kQ9veXyj9iySjDEIPi9gDYxqS3mmz69q7GW5RgRTVSHKokV9rgTj6dAnpJuL/niMMp6zy5Oe6Ar7+rPOt1d1TrOSWJudUR5ZN49btcVCNPJ8AoCAFXWfgpwu5Y68oVInfajOPBbNFQGP/YWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXYIShmzKc6iX1Ya2XtjZkTj2meSkEmWrQ0G2iPJRX8=;
 b=ogRd2yitUzLqN39rDj/xrZ0edpL/p496fJ3ICQ/t3QimhgX6weGCL0SzLIhzyWWvPZrQkzFv/QiRC5mk6S82ILlI+Z45n8xOHT7BKj2PKPa3KsC0P+9l5LLJard6fQEXuIiW5ekJRUESzwPF4YmxB3Pvbh1HgVLogeQUZ+RJygI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DS0PR01MB8010.prod.exchangelabs.com (2603:10b6:8:151::19) by
 IA0PR01MB8237.prod.exchangelabs.com (2603:10b6:208:48d::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.35; Tue, 20 Jun 2023 09:26:24 +0000
Received: from DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::e439:70c2:7d19:45e]) by DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::e439:70c2:7d19:45e%6]) with mapi id 15.20.6521.020; Tue, 20 Jun 2023
 09:26:24 +0000
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
Subject: [PATCH v3 3/3] ARM: dts: aspeed: mtmitchell: Add MCTP
Date: Tue, 20 Jun 2023 16:25:37 +0700
Message-Id: <20230620092537.20007-4-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230620092537.20007-1-chanh@os.amperecomputing.com>
References: <20230620092537.20007-1-chanh@os.amperecomputing.com>
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:195::11) To DS0PR01MB8010.prod.exchangelabs.com
 (2603:10b6:8:151::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR01MB8010:EE_|IA0PR01MB8237:EE_
X-MS-Office365-Filtering-Correlation-Id: a1129a9e-8afd-46e6-8e73-08db71706a88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	XosDScFzosVWpDUsEWtdBlS4eDrJzD/4MQP0GeWgamowlvxOQLGnh3edpKhe2GqiGjRRb60iK5HH0AxpB58zFtjgzueUpMRypnALRLgLxRMM92WkohGWraFPKgCEjjGAoHk879MkbS8HAajnkvSujdYgvh5RRcPRR6dyR/py1MC5heJpYytWv0Zo5cwouHRZKwdbbxNImgwqZx+ju+7aalcuWpHYgfAKvsJrbZq4RvUzaX+bWsZlHlAO8/eQQCEhWVSuKYH9ygNFjxxOoVKXemWSvZdYbdCR5kGk3rOwBNqK+DqhmwKtEADmUx5fmyWH7zv6NuB/JbAeN1k6xDKFE1dJLe1AVVOV+lCeVELoI8KQdn8NkP/7chyrLaVpGBjOm5eDYGhp1C8uYTuH5hrwLOMnOwZXgLVFiBmMXbIQMCsNKZLYVGtKxdaIangfavr/v3k3rAGX/E9SjnhGwLEEnMWzwWbRvE01pfn8ftdlFvfNvwgq0WTn5W+gntUYJHU7A3tj4AdwdoyMNxHgCjZguj1H1gsChaIyhsn6C5V5xuHHyoVhpefIysreD3gBKoutCN3P7fNo40c/cuk1YhLsRiqVJRbjWBzZs6Gor2Gltdh44si1mttfCTQSqyS43QAg
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR01MB8010.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199021)(6666004)(6486002)(478600001)(107886003)(1076003)(6506007)(52116002)(5660300002)(86362001)(4744005)(2906002)(110136005)(8676002)(41300700001)(8936002)(66476007)(66556008)(66946007)(316002)(2616005)(38100700002)(38350700002)(83380400001)(4326008)(26005)(6512007)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?6Ememkd3bNkMp77jjxTEJOS5+96aUegFV/wqZXE89C38hqfUvr9ybMfhYB2u?=
 =?us-ascii?Q?S6XUz5gkG0pTkV/vKHb0oLvdZyoNw8nrrlEiYs6Z9Nov1IJe6TcXSlKeJpWD?=
 =?us-ascii?Q?6uxo9lDbywmLz6Ef9BpQr4U1dsrpjV/2lzIJwmHjIMCMrYZr+Lh6jpTCwU8T?=
 =?us-ascii?Q?Zul0ImKS23Q/RD+5EzYYEql31BPzQr7X/iLq6b9rm2se91uPcXkaFPB5CrMY?=
 =?us-ascii?Q?Tq+BVxN3uNiD4Dut+xrxKMKTMn87HxDSJUU73m2L6gRo81AuwOBBG9+RiIlO?=
 =?us-ascii?Q?JGA3lUwSiqAu3jMkuiuXR9JEGHa5zxC3Odfrv+ORuu8VowM9cMpXNxHQhE8I?=
 =?us-ascii?Q?sq2CrTY4vL7q7X3crgH6pNyK+ADjrCtukVj6AAJflP6cl4bsqxXE8E2TspE3?=
 =?us-ascii?Q?DwU9jcVmKqgf4R6NiTKS+qY+D17a+Vaq4HK5dDmTd8eDr/ahqGpqtENzrbIa?=
 =?us-ascii?Q?hg5MFxPPcYZUAJwGExHppRFm9kYPQZuNooKnMQxtkQAgadBCh8s+je6fz9IQ?=
 =?us-ascii?Q?6KSSEDHlXPc+T6aggYn+GapbUt0amizexQXB86YtUtqgtyfib6Gkaay9QTB4?=
 =?us-ascii?Q?bFdqoyGVH++d+t25gxbvqoNIgL7lSSE2sOXYNGA22E0QJDPChPfUIY81+h0P?=
 =?us-ascii?Q?gkb6SXKZPbALT/vjV/9/RXH9T1OxpDNFeOl2FsF+I+T28re5T0G58Sj3GZ1i?=
 =?us-ascii?Q?a7NJnwdbay+hU6HSpNzSXGmkG5F1iTydEz7Y07DvYw8rItDV5z+rDFQ3SQfT?=
 =?us-ascii?Q?Dr44QXC3+ziDIQuIN+ZeVxhadig03hmkN2JAkdJN89QF7XmU12Qm2U/AP/Zl?=
 =?us-ascii?Q?KckXIgJiMb39xOB81v+w38RhHd0k/DTudQ2dC0FjsoMOEmEk/vp52f1YeL9g?=
 =?us-ascii?Q?r36zT2et7jQn9Q9BSbQgxEPn4SBUtdLnyfXGtcwWyezBIJ56vecmyN1vDBvi?=
 =?us-ascii?Q?qOkqpPZOI22QdnWLzc5yJdDYbMlAg1Zh0W/wk1Des2lqkRBLQ0hKgQkn4Jyv?=
 =?us-ascii?Q?hyV2iMm7J2JgURuebp4x9CD8+hluLxp3KwCErgIGD2FVt6rrKgE3nP6tRf7i?=
 =?us-ascii?Q?n/zd+/w3n+8yGYHlZkPdIfDMb62NZFaQVo/pkVtTf+wNylV1/1CGcYC7aIGF?=
 =?us-ascii?Q?XMOqFJRjFC9vVJ/JJqQGdedT7EsxCEHaYIcKetfLz19+7BpGKk7rlL01iTwa?=
 =?us-ascii?Q?QYcCzJ01QhPmx2E/0czfiGHbJz5Mkr4J1/Z9VRa1ljK0VKAuZ/yy/kzZn9+D?=
 =?us-ascii?Q?xnj9lbMQ0hLnWyYrcnPUSQb5TY2ICVIF1b4f59w+1VrK8Ki45Ocq7IEvvSjk?=
 =?us-ascii?Q?ti86ct/4vc37YfOcWwQVjFX4L25X5fvy4kOKFHTDd3xURPyY7iyAxhGeqyLv?=
 =?us-ascii?Q?N52ngLMCMzxM5rAeD+GqXX4kDhplh18bfoonQJpkyqDexlgBbDaabEGzVRlA?=
 =?us-ascii?Q?hKtH8SThwmROoMQSoVfi7GSUO6YP3lCCJo3DRRfVYIk7aPmQ2z25ExBGff7U?=
 =?us-ascii?Q?7e4Imv25LiJ8l64XPcjhHpx/b2Y0ouythkNxhO6mo50Oig93k4W+ZvDJCZO3?=
 =?us-ascii?Q?N+Kj1A+n6djbt8kL+iXhAPF0IOdgk5F7YzwLmSyKe3zCa1QKOGgVihKzr9in?=
 =?us-ascii?Q?tMCNiINTXkpiCASZZaXe8Ns=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1129a9e-8afd-46e6-8e73-08db71706a88
X-MS-Exchange-CrossTenant-AuthSource: DS0PR01MB8010.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 09:26:24.4020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1PemejnUr7qQT8KOrETpIKjFZGazdbRXdDk9KzbIAMiqlU6kMbK55RLq0QxpBZb5omDGW+sMQ338yDMOvsLIH+Qtc/u33KbDvWcN4OhV9UuWtIzkybjTz1HyaWpYk4VW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR01MB8237
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
Changes in v3:
  - Fix build error                            [kernel test robot]
Changes in v2:
  - Update reg for mctp node.                  [Andrew]
---
 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
index d3c7e7c0fd25..2f240a88b382 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
@@ -4,6 +4,7 @@
 /dts-v1/;
 
 #include "aspeed-g6.dtsi"
+#include <dt-bindings/i2c/i2c.h>
 #include <dt-bindings/gpio/aspeed-gpio.h>
 
 / {
@@ -366,6 +367,13 @@
 
 &i2c3 {
 	status = "okay";
+	bus-frequency = <1000000>;
+	multi-master;
+	mctp-controller;
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
 };
 
 &i2c4 {
-- 
2.17.1

