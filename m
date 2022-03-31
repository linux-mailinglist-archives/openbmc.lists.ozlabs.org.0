Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D91CE4ED0DC
	for <lists+openbmc@lfdr.de>; Thu, 31 Mar 2022 02:30:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTPMw5pVJz2yY7
	for <lists+openbmc@lfdr.de>; Thu, 31 Mar 2022 11:30:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=SwdSuetl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:feae::70c;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=SwdSuetl; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2070c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::70c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTPMN2rhtz2xrx;
 Thu, 31 Mar 2022 11:29:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E0Y3XSMGjdemxRrVblTafErTp2Wl7rMP5p0gJ2BCkFcMXsgSjXWH5B8gWzJE4C5MBASjzQ17kqq7kmzEeo+TmIk+4yOWOuDvVxmY8t363Ol7i/y6ccjWRHOAa8QmVZvXOof5URO02+Z1asg67KECTnC/dB0UHA/JERaWVPmT7gVq+R64Y6qeI3z92GPrshyVgerg8OgxQ0TJewHNRNT1z53JxM1cJg6BSzxx6bCwEaIH1lyD/tbnJeayXzbqAbtDp7JAz0PtLPLPqP/PMsOI1R5X6UrzzEEkRzB0+WJbkDc5lp+ewXzC3sWnjioUbX5jT7kcv/Nxj58RbSLpk7x5xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XC2w7DMnS86RxCpDlb8R4qIxlLyZBo2ymKFWoAh4NCc=;
 b=bu8ePdvCFJ42XxWLkiZvbmYSaKtFH6sok2/jNswrzHgFD6loybghhZscCjsF68TDZ0pS3KxJZZBlJ5H5NLnuLYjb30/5mlvJYhTOOMN7mp0STCWvrXYlKBpzXH9ItpWG2q53iSvG3T4ROUtmodPmep62YnuYZj4+FQsz5dL8ctfDnGyGJHLdxT3WdnF+JKM/sORFhl2pz5RJOzSbaZesk1pn36DWkZfUWrwPb/BeGZIsO44B1mHkTYVmTUnCiUG1bmR1HBcnI8P9AYhfkCx1nu2WZaJFTB8p+4reKZ+ue7TrGpMOAfQT2iUoj0T05rLFZWbcKppYCCqZg4JjdbtGLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XC2w7DMnS86RxCpDlb8R4qIxlLyZBo2ymKFWoAh4NCc=;
 b=SwdSuetllttCjm5Qi7S9DVaVXBATEqKBTkoijp5o6GgL0w3X6xg/lHfO2Gqp8MOJXqotKzJGisXX+Gg0PIC1UrkIhEwRSZGCgOcI8PoE6sQ1Bj5YyTTIdcrJ0j0ppafaViQbbNyuDXHrg/fKTrOZxQD1VhT33PpUWnbK3dsYAwE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by KL1PR0401MB4641.apcprd04.prod.outlook.com (2603:1096:820:56::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Thu, 31 Mar
 2022 00:29:27 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::7cfe:c9ba:7793:f42]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::7cfe:c9ba:7793:f42%7]) with mapi id 15.20.5102.023; Thu, 31 Mar 2022
 00:29:27 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: joel@jms.id.au, clg@kaod.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Subject: [RESEND][PATCH linux dev-5.15 v2 1/1] mtd: spi-nor: aspeed: set the
 decoding size to at least 2MB for AST2600
Date: Thu, 31 Mar 2022 08:29:14 +0800
Message-Id: <20220331002914.30495-1-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0140.apcprd02.prod.outlook.com
 (2603:1096:202:16::24) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fa8334f-1aa4-45a2-bbd8-08da12ad839f
X-MS-TrafficTypeDiagnostic: KL1PR0401MB4641:EE_
X-Microsoft-Antispam-PRVS: <KL1PR0401MB4641A11DBF9EE343907A49FF8EE19@KL1PR0401MB4641.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3eQQBeVEcSFNUDeOqXFAJXwxHAFz/EeWNXrS2zQgmS4Yphcum4Ph1E2iO4J6lFdGIToid1rvCJmHVysWMmxLgB9fR8tVl4hF6jv5OOCORsObzTllOJl8M1Bpbp/O8yb+ePvr28tJEU2VXX6YJg6rA0x+hBPBmCTojnZZ7DLtdpO/l2mLBUb8D19ljdaVjeDmPFUsIxCrGbVbK5MiyWhzHJGM1HHH4SO3b9xMmaHbhg+bbVW9IYwu84FpsTrCxUSCfckOHEtSSN6fSmmcTk1HEwCErKnSFO2a443IbgQXuKva0Bsms33uZFfPCZRNNdW5uggqDiEu/m+6V8uVofW10YInjWoTxiIC2fjoiyyd8Id18tSnfppTdI1UY9EIlOgbI3Vxh4LeHfsHp+95JDFw3DrT9+xGXvfHk7CKi4V3ByV3jJmB6ATUy7bt55uuF1jijhIecMU28Ysfl3YI90prkCeakD9IdhgbsyhCmAzY8xvwnjff4HvZw5imw3PPSJI3iq5X36xZSAqMGOOmrKn24wT4n6pP+We83JYjPybSgTi76PLKyw12/Oqr5ZBFitaECqZDYwDhfYDZFG9p7J10tS91qIYHX0hFYpZoH09EHJJsikhgDSFCsOsZp0V98eV1Sw/zSqyUheNjlrHjUO2k04o+w1/acwVxXE75FN+y8Op1S/a9d8aJJ69Bc3c2aFGpzcCmWzfkbyJp5zWDrSD9mAmISdsToGDNwv2doSy8dTR+VcH9kQIYgVOUf7SnH/SYMTRmGAEqzC30JL704btFdOw2BsqJnUMyLEK6LeNA8Qg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(44832011)(508600001)(107886003)(66476007)(8936002)(66946007)(2906002)(8676002)(66556008)(4326008)(36756003)(52116002)(38350700002)(966005)(6486002)(38100700002)(6512007)(6666004)(26005)(316002)(6506007)(186003)(86362001)(1076003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K0WPRK+UXWWGnnGkFIxnlORT/VIQrslz6aR8X1Qa7fPrEUhtMadzZRsawHWf?=
 =?us-ascii?Q?ydA3yA5/4DM2s7DJrW/nBx7AmMhuilHRG3QbGataF7XoJcrI3S50U+OQ5RqF?=
 =?us-ascii?Q?44+y+b+kq9sS5mJLMc3reLiWHNKgugz/WT8r/D2cIEW6JSiuTLMOMPJ5dD+M?=
 =?us-ascii?Q?MHjQ8dAYed188pZjfVdPNOHFM5+39lvPviIk2r7Zapmlh1qZwa/QywWleBws?=
 =?us-ascii?Q?SHitBcNbhGY1TKWpWC2vWpNkRgsFL9spFbe9rJVP1V1VYv+gFtloSNl1duLv?=
 =?us-ascii?Q?c/aDhnMHzFrdaKcpUyPhvo3Dxya8CMV6XzznYar+bBFLH0m+/eRnMMk9ykWH?=
 =?us-ascii?Q?QAizQ2pqerB0SAuSokVQuH/REcWebFHOk24YuKkRpA2zcR8q5MQTfz8Ug/NG?=
 =?us-ascii?Q?10VN9KJm7xID+1JnLkY7+B0QwyX1I5ead568d53V2ZyBDsJCgTdsORqE/ak8?=
 =?us-ascii?Q?VAVEfU1yCII7TxEaa2hl1wsc/FMNfvb/yNXKkk70mPp9QocTIzZY/ClJsVcq?=
 =?us-ascii?Q?DwFqe8kVHW0jYXsEdg6UmpwAKPMQaulEAVHr/bFZa3/EZxdk4Pfbx26MKBL8?=
 =?us-ascii?Q?Vnd4sS88Z8PLd+fnPrHVyQIFygtz7l8VkV3R6Oy9iACsXb5UzCG5iovuqh6j?=
 =?us-ascii?Q?eyXYc2+nxTHH/ZE2Pp5AHHYxEPP3FNv+tU4gCexdNALqZYuVRmbmOcAqLlYq?=
 =?us-ascii?Q?k/s+mRINmZWlukBUzAcEW0R6LEf4AdFIVH0Jt9JwBkdttBP6DOdFjXpK1XVU?=
 =?us-ascii?Q?x8fH+FKJxeyP8f508J+TC2wUc3o+dATW7nddE0Emh/F0mwatYw0bi/Ko8ull?=
 =?us-ascii?Q?kDnojbzsia/o8FdoP17+N8kFisgpf6zT7fzHuvEpa5AiO3Tr/d6+G7qV7EbE?=
 =?us-ascii?Q?ZZE7nquBP25fVGNOGcdjHYsBI4WjV8H0tDdMSNwJpnbAesxVi6qLMHDn8mTr?=
 =?us-ascii?Q?s9AgwNYEybMEg9p2suYXz7S/CJPOORJ+H639VsBSMV65tZszxA1Gv4Cq0KQz?=
 =?us-ascii?Q?mi6WgpIAG5sjQ1Km2I2c2eptCgUSw2bp1EvdxUI8smn3s0u8tZSuMyuTvIVZ?=
 =?us-ascii?Q?rJvGrijiBLfhAuzw8L56L/uMf8qULQIErvCZ8/5EgaBoF6V/8rcGTLhC9haa?=
 =?us-ascii?Q?ricwDiGs6fEkOnD7WfKu/74hMC5hT76u/4iSBjWELfjtA9Z4aDA++8o+9Z9i?=
 =?us-ascii?Q?AQch4RTGbGfJAWLpQey4P7sFYNjuCOjYzSqidQifvg0P5aSxpOmtKK9RJBzx?=
 =?us-ascii?Q?aMOg8thj2eSawlUjyu1KL4aPrrlz53coG/f2kqOlsD0qRzR+NjGH4lWWQceK?=
 =?us-ascii?Q?FWhEAA+U1r8dDDZS2whRr19y8Pu5CUcd2PF3M/W09S2JrCe2Cc9J6agJAMbM?=
 =?us-ascii?Q?sKVFpsqy8FiqUsgeg8K2o5bzdo+PBrObNck+ORopfmBWC+vLvIB98xMiFA8s?=
 =?us-ascii?Q?TeX9uJd0nVi6G626ce5wGSMkd+s8XlC4S04iVqYzjcNpLuUeobsilavZbvhc?=
 =?us-ascii?Q?CC/uaYmxGWaOCRCBiQaiifZZkepqQT13NSrT1HxJfr9lFOLfky9mMOya+3iw?=
 =?us-ascii?Q?2EbRdit/Fns2ZtAGx+RNVi5RX4ZMxrX5oQtrN8YHK5ObF1bM71EKGM8IkFK9?=
 =?us-ascii?Q?eUpSdZ8bA8WBuuSVuVToblMYPBXLIXCJL4bvICkjt3F6BatgpRHW6i5iw6iT?=
 =?us-ascii?Q?Usi6NyLWHp1DCw1ALIq5C/z2TyxSR4lU3n3vhZFZ+iraq/3b/OYK4HnJd086?=
 =?us-ascii?Q?ndUHXmFyYKaf5+9H6s2iFMuwDIyFY0A=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa8334f-1aa4-45a2-bbd8-08da12ad839f
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 00:29:27.4678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HnWJgtRWHQlNsyGfL/fTxGW/A33lFLLffCIql8BRbSR741q43fVUEuT2L57ueXS+cDB9V9tXQ3Y5gqsLARneZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB4641
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
[v1]: https://lore.kernel.org/all/20220304170757.16924-1-potin.lai@quantatw.com/

Changes v1 --> v2:
- add fmc controller into decoding range resize checking
---
 drivers/mtd/spi-nor/controllers/aspeed-smc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mtd/spi-nor/controllers/aspeed-smc.c b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
index 416ea247f843..74fa46439246 100644
--- a/drivers/mtd/spi-nor/controllers/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
@@ -781,6 +781,18 @@ static u32 aspeed_smc_chip_set_segment(struct aspeed_smc_chip *chip)
 			 chip->cs, size >> 20);
 	}
 
+	/*
+	 * The decoding size of AST2600 SPI controller should set at
+	 * least 2MB.
+	 */
+	if ((controller->info == &spi_2600_info ||
+	     controller->info == &fmc_2600_info) && size < SZ_2M) {
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

