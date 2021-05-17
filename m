Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5C038233E
	for <lists+openbmc@lfdr.de>; Mon, 17 May 2021 06:02:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fk57x60kzz307F
	for <lists+openbmc@lfdr.de>; Mon, 17 May 2021 14:02:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=VGCgsP0r;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.101.139;
 helo=nam04-mw2-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=VGCgsP0r; 
 dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2139.outbound.protection.outlook.com [40.107.101.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fk55y6JnZz2xfn;
 Mon, 17 May 2021 14:01:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TScIQod+knMiwSuUDfTlzLhem/Uyljyl594zqhSFgOTc+QpRJ5u0T2N9fetYMxw+89D/TJiFe90OrM5BZugSg0B4CMcSgMS/4b+9CLf7lzNswwb7mkNaZ6YyfaEME1CeqyiPJLl9kL370vlQBXyKpjZ52CTrwSaLCxpJ2hZqi6iMONUUR8/xdUfYneXXSlBxduaJLto1oDvEMo5wdyypsFO6PZbdzVFi+N3c1Vu8jV5C8RnciA7Cxt5bDgipQbfzJzX8yt5jqwS74IjNhqdPccqGzejdNrktEEXVkAKiF1NfLgoqzRenkkL1FsnjijHTxyQT2bSB1NYet02ooB44mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Pqi31ZQNKFyayjGR8MZbuQmsRWdGhkG0kbWnIGgksQ=;
 b=XCR9rLADgMlf7hatL/JUHLKJGbijndZ2PaEJObV+RUyzbXpobKz99HUkVcUr4sRgRXNKTvzoRf++1IioLPly2zU2tjDTfqZGqEpvePJuvrbDVoCilqNvc1Cp8n+ZGz5+Dg9y6tPscNvIkvNJuReISj+l3hAZ5aKPEcN+9OGHcETtbso0gHLU3MaOrhYrk4+Wxc79HlGwL65hJZrQgqw5MMK32abjSdbL8DNsyFlHA2PXtXOHFnAkUvUImk+p1qzKyBtkd7T3Lc025Jf3K7tjYl2IBdL/OVpDZdacpSQ3sv2Q9nRiPZUhBdnb5dXwB4tYpLaZF4YA4UvC/Z30vtVWng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Pqi31ZQNKFyayjGR8MZbuQmsRWdGhkG0kbWnIGgksQ=;
 b=VGCgsP0rci5PeDhNaxSY48js3A1w+/jPbI/JB6zqp5Ehy1ayWyyF7xMybfg/DYDZqUxRfe6ZPQN4eyBqksTNcOhNPrwUgREYRIxZRKK1I0RSFweMk35E6soA3PNkU80dO7LmGEx4xluSI1OX2zEXr86Jl1EZU+rFef/7MdCw3lk=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 CO2PR01MB2006.prod.exchangelabs.com (2603:10b6:102:9::12) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.26; Mon, 17 May 2021 04:01:07 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 04:01:07 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ARM: dts: aspeed: mtjade: switch to 64MB flash layout
Date: Mon, 17 May 2021 11:00:36 +0700
Message-Id: <20210517040036.13667-4-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210517040036.13667-1-quan@os.amperecomputing.com>
References: <20210517040036.13667-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: CH2PR05CA0036.namprd05.prod.outlook.com (2603:10b6:610::49)
 To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 CH2PR05CA0036.namprd05.prod.outlook.com (2603:10b6:610::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.11 via Frontend Transport; Mon, 17 May 2021 04:01:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20645155-8abc-42b2-4786-08d918e8658a
X-MS-TrafficTypeDiagnostic: CO2PR01MB2006:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO2PR01MB20061E573A64081F62B7EDECF22D9@CO2PR01MB2006.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rwtT3KwBWsCWo+MYOoPWmYIK7qEwcZth1fgIjggm+Nl2yQsvTpzPlMS5xo/H9SIobvhW5aNGK8F+58w+8Yhush/JJBodv8D3EcPH/c+pFsfH5ZrWNMNOnyRIGnX4qk+Bpu/0R/o8Jpydx+WIwgpPZbANQaUQPxaWgj4TBUu7VdH5xpi6VqU+tx/2lyzocKL5N/TKux5eFSG4acOT/8YQ8nMBEXQ0Hui15AsNHF5RPPj3DbMnFvFGZO/wMNWKhS1UpT+6xMJidlb5cE5yt3cAE28RmkQPnoeKEeqRTY9yzZfkQ8jREGz1b0fU2RA0qW7wTTbEta/aR8X8YGkBruVpjyQMQjJ7otZCveeib2P72pOhvB1OkZU0k7bCMOhz/HMk3j3ZdheRr0EHE1hK0DkLCOUHF+dhEOQlxALtVCr6gRCs7FEHrzvcBQW9BmmF09Pbb8LpFvH6wMur4cnQTeFxH2UgC5f1oEG0hxND+bh+ssCAI1KUTioKTuAcosbJ5fsuds2ic8ckhiU18FbOHUK6amJCau6xwfQ2xplubsqkL1HaIvvjNKDKFAKHY8wq4KKRej8976U5BTyptiTSPlvRYHy2VTJ6HPWLz2Trlog7Kqo1/kfrRmDC1Y4L1PAJ5Y6UdzCd8lyMkIJjwfa0coTwRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39850400004)(396003)(376002)(136003)(110136005)(1076003)(86362001)(38100700002)(16526019)(186003)(38350700002)(52116002)(83380400001)(316002)(956004)(26005)(107886003)(4744005)(2616005)(8676002)(54906003)(5660300002)(6666004)(8936002)(6506007)(4326008)(6512007)(66556008)(66476007)(66946007)(478600001)(6486002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Q1UROAN/seaqjx621orN3Caybc9yvWXXqqqFw84dGIZNtc44DEZ6l5e/bVeR?=
 =?us-ascii?Q?Nn0FCLgAZRfbKAorSATceb47U3GnXmc8jOFsdCd7o9vtxCEgTAbl7BpUs+vc?=
 =?us-ascii?Q?UIVI/j1VrjoQT9qJUX9LJKDPzW5JA6dpjg3RHPdSPKX9YSrqxbGAbCCAsUDF?=
 =?us-ascii?Q?ow1DSCzlTjw70mxzOQzYULMKdJw2IEiLZOVN4tBwvhGWYKRNLy4Pp3qV8DYw?=
 =?us-ascii?Q?eQf7xaAnrjBzUtQdkgc3ptAQufDoAfEUPj0AulbKb2YvTY4eQIKcNabzzlgw?=
 =?us-ascii?Q?DPkWJa5Gfig4T4scYlFwKEH+BqUsgPR5M/MIr5T+m68pqjwHMAU4BRZg6LE6?=
 =?us-ascii?Q?AtOQsHzCCF5l50jzJLgTg4Cdv3VIFO4cecUBvT2AGU+Qx499/SypSY5AoE75?=
 =?us-ascii?Q?SNEli9fHTJyvVr+Nb76QSo2oMxBS25mfy05M8ajxjvII16Yo09MbRKiNcCvu?=
 =?us-ascii?Q?/cS7awx6ZoAD5MDBQzD8piY7ZT2kjCmRxocL/PrWykw+agQna4+QAOJExPKR?=
 =?us-ascii?Q?OVhiIOtkrGxwHh2BhENVoaCRs0BKa7Z+o4FOe4SIjeR/tK+sm8T6fi25kkVw?=
 =?us-ascii?Q?b1cYvhK7dLica8tJ8/O1xNSzsVCOMcvS36hYUGQZxx9zy5AVYIgu2/xPqv4p?=
 =?us-ascii?Q?qmKj3X2k+SHUvY18OwbtQU6TbfjuhXc4Xz1diMH0x2BWURQM3HL+MAjqPQyr?=
 =?us-ascii?Q?FgFVUG1kL2CVkO+vkfWshEhBV/PWY3CW7gHFPbOqD94UqTKd21vOrfOtb7b6?=
 =?us-ascii?Q?jpbjkYpSYfbieOXUMkw/7jzwKmqbrOT3XmTsrMeIPOhmG8Mtf1mddwjle3rA?=
 =?us-ascii?Q?NkrUubdda2okj58vMLh3BDNJ0KIwQNKdAx+n3kucYoA/iIMMR/oMHPjBRviD?=
 =?us-ascii?Q?C6dmEVqbEJpnvftnv9Rpz+yC9Q3V/M3rsCPF9jGzGgIuIc3D2WmPhaXdkytZ?=
 =?us-ascii?Q?imEPct1eS2fASn2HU9VfkMGvZVqO1pEux5CmAHLUCbbopLmAVd5ZUr9JkXUt?=
 =?us-ascii?Q?Co4t9fP4BdwXrBzb/lhTpeeio6RmDBHQXyTeKcbS995daTEMDaS33WWqK79+?=
 =?us-ascii?Q?VLEVJjLD4WzmfzQyE2Wi5n0s2gdrEajPbne+3s+irWjwxqbs/r9343HP0dWJ?=
 =?us-ascii?Q?LjJGgMb7QLpQTmz/5thS5YtSZKdrpG0vLB3FFDhdy/fKugF5xlPGfJ8PaAIk?=
 =?us-ascii?Q?GXxMAtqABP1jXpOOHKiFiFcE3XgO/T2x5JuwRVtPCsUrR4BdwNR0OeIDY6xa?=
 =?us-ascii?Q?w45zzGukGW75fkYvbrX0oJMVGz3HtWwu6ecoHt5QNmMoPDCuogHe25yLABCD?=
 =?us-ascii?Q?zx6DTOnkAr5SVa28Yjg0u/do?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20645155-8abc-42b2-4786-08d918e8658a
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 04:01:07.0782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KIW+xzhlj4a7KfSrSGO38lhn5grvPy5smhx25bDDUpf705egpcIXlcTOYJQmn8Qe54LoPSoJihzGyUvnW2MX9xYs/W3a7xcEVLuqyRT3j54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR01MB2006
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
Cc: openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Open Source Submission <patches@amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

As the 32MB flash layout will soon be exhausted, switch to 64MB layout.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
Signed-off-by: Phong Vo <phong@os.amperecomputing.com>
Signed-off-by: Thang Q. Nguyen <thang@os.amperecomputing.com>
---
 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
index 364293e6ca76..0879f3917178 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
@@ -304,7 +304,7 @@ flash@0 {
 		m25p,fast-read;
 		label = "bmc";
 		/* spi-max-frequency = <50000000>; */
-#include "openbmc-flash-layout.dtsi"
+#include "openbmc-flash-layout-64.dtsi"
 	};
 };
 
-- 
2.28.0

