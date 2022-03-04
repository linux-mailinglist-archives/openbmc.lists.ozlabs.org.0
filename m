Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3255A4CD9C5
	for <lists+openbmc@lfdr.de>; Fri,  4 Mar 2022 18:09:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K9Dq20gRRz30HY
	for <lists+openbmc@lfdr.de>; Sat,  5 Mar 2022 04:09:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=kOm6fwrZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:feae::706;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=kOm6fwrZ; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20706.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::706])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K9DpQ4pjVz2yPF;
 Sat,  5 Mar 2022 04:08:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QYnfwoXROIA2EetyMdNbrIMLqrRvElPQIQByQgoCp64+BEzk7hr1bYcax+RUUslk7vh5kW9lhVOULza7fnZXcOsKSSYvzquHkEIB4tJ/YLckOcwZ2DKf8w2kL0+iLFzq1bu2X9MNOgFfmt9dYkjWDUgf2f/aMoijAEemTBeXrMLrawQJzZWcbtRyIe17rP0ooGqumFHtj2Ee+tiRw+tjUfE/XfHMiLwDgggHL97v+bQBj37uGb4WyOlOQ3g6uIP+Ps6riZ3cHa/D8Nb+bTzrElA5FZX5FWuYKTcPvtWcUmbh4fnpMuMSpaNpF7vLwMK8YJrNiAlJn7PulGdgQ6gUng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gh3esM3Kud7RNcC6G5XItWwVKqAaVCVp+6IDLw3qdYg=;
 b=fUKMKXNltGRBrI5ZX9LVqpFPUa6cg94JdxpPYD0huGlZPcN7D06+KO9s6E9RNgjTUBm+RrnjoxeWABiPrX625DmZ2vqpr0eDfrSR2VBFl1LhJMUOVj+sV6ogp2dKlAlCYzISuxnv9HEAfJY1hPdK0hGkUtFwvo/vVA/GAAL6ar0D53ZMuMOsnbQ6r1oPZgm1Xu9FaA3zqS9y6aztkn3B7GlJ5iM0h9pTLkSLAxWPCXHw1mMoNFNgFhgs1NJ28EzF/uJURSiG5Mcn36WLFU8QNbgfUoEx9xwxxdwjmYdxhR1610YbFnYAWxsHdBVyvSsmJbtDxdrcVXIvvtK6Bq5d+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gh3esM3Kud7RNcC6G5XItWwVKqAaVCVp+6IDLw3qdYg=;
 b=kOm6fwrZIk683agPDdjVmX0M1/tPYQvT11VS9onNIM6VLTTMcj1rgx5bpwiPN1w85J4P+GGHrXkVWkVtbFbO7a1JA8DD9pFf1Z5iBfEiNHByrjYRLL5r/lsQZrbxOgBQYBcxK8JuQ7PooZlFtRsicGYprvm+qNV35TZk2k7TpWA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by HK0PR04MB3091.apcprd04.prod.outlook.com (2603:1096:203:89::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 17:08:18 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::b57e:962a:3820:eab]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::b57e:962a:3820:eab%3]) with mapi id 15.20.5017.031; Fri, 4 Mar 2022
 17:08:18 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: Joel Stanley <joel@jms.id.au>, Cedric Le Goater <clg@kaod.org>,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH 1/1] mtd: spi-nor: aspeed: set the decoding size to at least
 2MB for AST2600
Date: Sat,  5 Mar 2022 01:07:57 +0800
Message-Id: <20220304170757.16924-1-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:202:16::19) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83951c7b-a1c8-457d-0a82-08d9fe019423
X-MS-TrafficTypeDiagnostic: HK0PR04MB3091:EE_
X-Microsoft-Antispam-PRVS: <HK0PR04MB309144830C2C14E38CCDDE958E059@HK0PR04MB3091.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B76cIeO53qLqWuen9ssLqRD0p/kZrbA3ipqCzfvqQFMsEeJ1s/1bxlidvnOiL4lCV0idtI3pNZz7C1r5Aon2Fd/efIu7a8qEO/8UoVhgxkXyiHth7N8I5Zq1Qow0Asu5sdvoDGKy+hfPO3YUhgzgfQlffO6DryHpOtL5RetpdozY3JWBReVNrO/brV5NkI2pa0DP0jReNJqOtyrwmNUJQQmiDnPInm9BkKiKquf9JS9WO9MUcL7Gaq3n3B6h214vUibyXUnoiwKAGg/wqyBKvF6YKmuR58LsHjqQZyZrB4Om2enHgwB3kKGI2uZ1h8wFr0FqBQnpZLOfw4ImvEAn5RsSeZCko7qEHKsdRpz6S3juza1ntTuKqMnk8x7qB64FE6xCtslnrmy6yWmg/eKI1X72aVxMr5mgUzPBdwqfsZTMIjy65KQHBGIi0kmPcdSozfYOg7maCX+2FpT+t4vQT0TS18Zjg44tRGQv3m5b57cFyy8+2E+DdynKs0uh4xLHD+ZsW0VEa8Oya5U8DWDZtq5P5ZrrxMM6+d/SWDULFNd8UJcR5x1PRZhQChz84WVD4ZoMV9DaVPQ8xB8OKCJSh9jhrzrSCGDFsSyv00Zh5gu+JLFITdD05qGRkT/MreJaRWncyv8gl0Uovh8lLMftNMIxEWkfff4gQGQxt+fUDwoB/W7mIL810n9Jt+1MYJ2YbPgqE2kL8WUVth/OcquV7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(107886003)(66946007)(6486002)(4326008)(26005)(186003)(1076003)(2616005)(38350700002)(8676002)(508600001)(44832011)(66476007)(8936002)(86362001)(36756003)(110136005)(5660300002)(6506007)(6512007)(6666004)(52116002)(38100700002)(316002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WSllK+EaojABRWa1QD6YFIWK/GYyAvzZoK+CHBPgkT5bbtTImOZ3pbMEraDs?=
 =?us-ascii?Q?kenB2a/QXn8g04eWugxTH1G7vIRA/zH9udgxlI4AXY0qYAUFuzpcxO5YVA+9?=
 =?us-ascii?Q?djlqf+WsjkJT/WskCvGKnEn5lMjo0o18d6VEncdhQDiDzOCrxag+TwRQdHE5?=
 =?us-ascii?Q?MjEbTfStmqUWwvFlheZbohtDOIaLs9joB85zgvRBtrzL2vhulRM5z0Gf+3hW?=
 =?us-ascii?Q?+g+SWVeHS5oMAOS1wIg8z92fv9HkGbU4LVaOYXgaMwwq7D2kwLy3aMW0OAGr?=
 =?us-ascii?Q?7L//vlRZKvXXkuC1YP4d8ZOUFEt9E7G5o1LT05M8zfo3q965iTVbr2o+34t7?=
 =?us-ascii?Q?f0EXtsi6DwQ+BBf8q3x7lFIZzxBYkgGz2A4R4rxa/8jBDgLrmwytecYtGnpt?=
 =?us-ascii?Q?UJRKCTuJG9xdkDWjTOzb+j5ZJgB56t5HkmND7czZ30RxhpryoBrAlJS4Z6m/?=
 =?us-ascii?Q?1eNMyVs9w6vqJwSz0w98pJdKD3AkhONG+cy1fqCET6v6ZPb552NRq+FwGZAq?=
 =?us-ascii?Q?va2xuur4wfGfcZeNbXdVpzxW0HGFspQlWOG45RFYuAXye/TYr8CZiE2w/U/V?=
 =?us-ascii?Q?GyENBCo5S/SJ88R+Wbb99kewGwEP+Yl7uuAHNOHxjSxRHoz/AHrblmmSscUK?=
 =?us-ascii?Q?mQD51epAZKsVzAswYPdMh0sQa73tBYGzjL5BYKiihorMvQk5Pnihv8nazlIR?=
 =?us-ascii?Q?igcwZ6ZrQ1nbe71N9GdbxobPZGxAwbvl6jlCUzsSRKf/EceM/irDFb6NHcKj?=
 =?us-ascii?Q?S4DIZLuAhc4j8bOu/vyp+5RHd/Ogn3as6IJT2TlTO/OTf3MZ5WvqXHYsBmUn?=
 =?us-ascii?Q?EQLHgaZt7w6ueRsVbkTdKH7p4monJuLhsYP2TAQl9iyaq9cDEc1RFRiAKZfq?=
 =?us-ascii?Q?Abrl1pkmbWMJ20Fi9hWPPpt1oqsj7F5+kLaQPu9AawZ6b0i+09nPQ+A1fTqL?=
 =?us-ascii?Q?NDCvj45C3lngjt4EWviSagBwnP5dvc+cAxp+9jkgENugYwppqzn+ZGy+885O?=
 =?us-ascii?Q?yaYzUXmGPiTjy/O0zwKTcLmGRYj2h2tJFP5Gjur9g1Ye3QkCMQykfirLnf60?=
 =?us-ascii?Q?KIkDyAH/AToZi4quh5l+4+6MFelcT46dPDhPX44TTfPhM6cYtMufmjT0i1qM?=
 =?us-ascii?Q?P3PEhxTXMdKJvPP65jsG6Q2Syu7rZ+1iS/9kc+lmNQqp65rwVxkIdnGH+AME?=
 =?us-ascii?Q?LAfWawMr8QJVh/ec4244+TKw5UwGVmlmjiNNJmh/E1RlmszZ9GC8Jz/tbnA3?=
 =?us-ascii?Q?7YVf1PgyLVy47nSH+0ft/RKnJetyxq0uEkg3/1aRpSp6+FP8F4ApVHRXiFe5?=
 =?us-ascii?Q?PFnDZqtmX/eoK92UuqTI8Fd8KSLUNejxrw2HuaIjhDPg5BCnoTV3nPXWc2kV?=
 =?us-ascii?Q?5LkDxjVgGdGYOIirVt45KaC9KjgQEs/V3KL4or1++Ke1hkfz3UAHpJMpU8DL?=
 =?us-ascii?Q?l/CFy4346USV6aNqk1fgXmNWMrWa3tDpALQIrD3KFHy4nMq3lvFOnMwKaOm3?=
 =?us-ascii?Q?cA+pvPhpfrvfBCIvCIHBectJgqcm5O4B/tkFY7/0ivzXW1PobikSsvpI7Q7o?=
 =?us-ascii?Q?666tSaSgOftN18RocamEuEOb6andQxJh36hcy+80w8/3GsFT2FpLBDe8dE8M?=
 =?us-ascii?Q?UZmKShBy435Aff41WLtoOc4=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83951c7b-a1c8-457d-0a82-08d9fe019423
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 17:08:18.6351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 68z68O33mToH/PW7jUwem6tOJ8kk87G6D+ZJLJu8/OdytbCQKu+bYatviNfBySuADrcj24GtJKCf0gHeXlxI3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB3091
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
Cc: Potin Lai <potin.lai@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In AST2600, the unit of SPI CEx decoding range register is 1MB, and end
address offset is set to the acctual offset - 1MB. If the flash only has
1MB, the end address will has same value as start address, which will
causing unexpected errors.

This patch set the decoding size to at least 2MB to avoid decoding errors.

Tested:
root@bletchley:~# dmesg | grep "aspeed-smc 1e631000.spi: CE0 window"
[   59.328134] aspeed-smc 1e631000.spi: CE0 window resized to 2MB (AST2600 Decoding)
[   59.343001] aspeed-smc 1e631000.spi: CE0 window [ 0x50000000 - 0x50200000 ] 2MB
root@bletchley:~# devmem 0x1e631030
0x00100000

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 drivers/mtd/spi-nor/controllers/aspeed-smc.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mtd/spi-nor/controllers/aspeed-smc.c b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
index 416ea247f843..6db35732c0fb 100644
--- a/drivers/mtd/spi-nor/controllers/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
@@ -781,6 +781,17 @@ static u32 aspeed_smc_chip_set_segment(struct aspeed_smc_chip *chip)
 			 chip->cs, size >> 20);
 	}
 
+	/*
+	 * The decoding size of AST2600 SPI controller should set at
+	 * least 2MB.
+	 */
+	if (controller->info == &spi_2600_info && size < SZ_2M) {
+		size = SZ_2M;
+		dev_info(chip->nor.dev,
+			 "CE%d window resized to %dMB (AST2600 Decoding)",
+			 chip->cs, size >> 20);
+	}
+
 	ahb_base_phy = controller->ahb_base_phy;
 
 	/*
-- 
2.17.1

