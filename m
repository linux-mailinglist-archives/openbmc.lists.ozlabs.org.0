Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4530D4C3BF1
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 03:52:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4Z7v3gFQz2yJw
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 13:52:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=xil3JAaD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:feab::729;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=xil3JAaD; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20729.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::729])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Ywj6sf8z3bPD
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 13:43:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fiFs/gXYHX+nol6O0HvQIop0fy3LZSl9ahBF6fbnAcTvbMaT178+WW7IVdZcidYUX2gH7M1zq19tmzGxI47+q0/uFnr9J+pWFSMsHru2wvv8NtP+rjCIIyJlPa4KgSY3cdFWHxPgaA1Sjil+xfI37PEBQqbyhzCpy3QfyY/BlVbbeE78uBCoKxDS6LRaPZyziK4XkrI8KlRkr2O70O4IOuAO57Na7f1/7vWzJ0L4KqJLinDHEpuMFYbuqMjWycALSeIgAIxbGtOPBFd/OYpJLFjFpMIULnwnWcbhuh0KSqfnwKa0kQ+C7vFSoBcC8Vta84nmNDqCGqrSYRvx6qbHYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6olh4+QzHepsJPoBek1xxog5B84Hxh+S4+AKQq81OY=;
 b=CPX916IFLTI4G+F/P6qBhb7fJPthShR02XfBUbbCKhkswLrvbDG35ObS47DWSJE6th3oHT5+cu6bu0LRU7wwmvnws35OY360GP76hFVSHlDOdhk6bbBMn4OAdsyBi5tyrEQVlVgjgiTLo9Sk3bOc7XlqlsQ8VGR86yHIEWLjl31BePpljz1mfhDqd0pt5wIbdOJbM0JFgzJLOZSvX2Tzt3XqzqVlUFb1znJyX6xm35ZjbJZ/YzuVK4Q6vdauqJKxS4tmsLM6SorrjP4CY50hg9blOycpUB/soZso9tvHelMMeAfSUgqzlVp3v1qRe/GdMNbm8laQTgK47LFDyjURnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6olh4+QzHepsJPoBek1xxog5B84Hxh+S4+AKQq81OY=;
 b=xil3JAaDT/87SlLcZ4svCg5NvO3Wb5L4b2IVuu/jS3HQDXRb5XQveflHrACmjG5kEPwpQJpzMrSYaX/FO06dqnKlClp9MQWyiJLZ1M2CTAtW0hlkgHmT/uEclkoTvQX8cEehoa0BsrCIVKI4RhN+/kKK5io9yC/USkkAf9F3wZo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SI2PR04MB4507.apcprd04.prod.outlook.com (2603:1096:4:122::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Fri, 25 Feb
 2022 02:42:43 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 02:42:42 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 13/26] mtd: spi-nor: core: Don't use mtd_info
 in the NOR's probe sequence of calls
Date: Fri, 25 Feb 2022 10:42:08 +0800
Message-Id: <20220225024221.19422-14-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225024221.19422-1-potin.lai@quantatw.com>
References: <20220225024221.19422-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:202:16::19) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e2e0bdd-826b-44c9-b5e1-08d9f8087df9
X-MS-TrafficTypeDiagnostic: SI2PR04MB4507:EE_
X-Microsoft-Antispam-PRVS: <SI2PR04MB45070B9B8E3C5845C1F882B28E3E9@SI2PR04MB4507.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QdDeom6+QELG8Z+x7Sy1VZdzY2LeyaPcFIwflCxf79IgWo178/OHhBA2PGQRDkgWm6QvFbuEmZE38tKaux4V7p3BVpsnKO6F1330Qk2fEwZ2nmkamMjrqHR4+iBdWoZyOfFxPiTMd1pShleoPjvx3KDDroS12nwck3mUSo0Hkd7Q2NX6Y5w2Bk8MfcsBcJzHubUEAK/tXNcrVu3NtNYwUrBjrF1zOs0n7AMl4pfS8YMlAdiccu9GPqolIqwf9ugFEaBpu4GAiHqm+krfGTRYO3rkPDxrGT9AbvESkKyss1lb8WUkiLjQOEV3yghOIbZdktY7/N8cofFtjsyllCheMQfTC7OQvb3+BRH74duiUzIIkX11F262Y6mnmmObVi7JhJnGUxQky24vQcUqovIXHaS6ReWHEidJ225dj2a0zVCz6Vp78ioTqoCI+hIwvR7uQuVki6j2RiThin9F/AM1aKJ+e0Hl8b1hdJqYN7MLnW5+rE493N5GlPSgBH9eb6wAhVSebu+L5ZYooVOOaXMhxnhxUAtp+fvmH2yD0SniSjASkRASTCYgAXTxmyfbEn0Tq1eV0Cp9WAo5irOWMPJ0Bi6wzmI4uEFEgS1yBSrfWqqkY5nGGP5iGpgZayCdq8iJLsxfTo3ts3SY9W7mimef3Jh7rylC8c75WZ0oqNb87FwE+pm4pVCxoaLbXf30gkLTMSheDAx21xcr7pDr7ctGrwFDlnP2FFXv+EW6ZdoARBXklz7nMXPpjBRtoztBI0dcbOSYtn+/wSna6Ph073L1KQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(26005)(186003)(36756003)(1076003)(6512007)(38100700002)(38350700002)(86362001)(83380400001)(8936002)(4326008)(6486002)(966005)(508600001)(8676002)(54906003)(66476007)(66946007)(66556008)(5660300002)(6506007)(6666004)(52116002)(44832011)(316002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?waIacTDqqHlRt2/kH1b7m3jsUyX96xsBD4wm6UnKhKRk03TckQxSu1OVniNB?=
 =?us-ascii?Q?ReY+yLKfjsgvsKyy+qvnJDC8Kq334r5n2h5BdTO3ZQBjEFNCYSV/KCoN8QwT?=
 =?us-ascii?Q?jztJJ1B6z6F3s58tIzvmzsWV1GVmqwto99KeYrbdHrNO/rqdEAsc4aE+UC41?=
 =?us-ascii?Q?Na5OejLqeiY5K3yUXYBfSxcM7G6OcRM8YL9/03EfwfBbe1U8vmdNm2+n3k3V?=
 =?us-ascii?Q?NiN0HzEkOTZGmdKJiF3lhQlWF5csyff6vmje9BDCc1YhlqG7iLmY9gYeFagH?=
 =?us-ascii?Q?Z8ACdkzqABRbfuhLHAf3ieqT+Js7RKynGgoc7U5hog9cdBjZQYbDQ+mx30IL?=
 =?us-ascii?Q?1oPjgNaeXHrBNd351X6CAUcKDDsURouTjBgY0WufvoV8J8pNxc30szFHX0a8?=
 =?us-ascii?Q?24xXpYAoHCSM4db+x0I1NagBiAOvwP3HUbLYTdUH8Ez2rcmEYWg/q60sAbqx?=
 =?us-ascii?Q?caQMlQ9u1KElY2jBGxqrgN6gz1lAo4WfcsNpr/JeYFWrqLmVQ1aDSiwwgtVJ?=
 =?us-ascii?Q?Kvg+j7nODmN5aWcaRyYZLWT7H2Z73R5fukUEM4NBYWdt9g0Trnb0fkovLXDd?=
 =?us-ascii?Q?GM593jXyct14DC1ZPKDlvntuDUMF8pkJKTmXrgzXwksm0QG5qWLU0he6bQlU?=
 =?us-ascii?Q?M/ggMZI8boqvmtiX9ktk1h2pRLH4WDNC/k4gM47BMhLHjcw5WaDer81bWVQ3?=
 =?us-ascii?Q?bjlKIbOsfunYRNToW0ELi5K4gdwI5b3YzoXzMH5q6tkIMuspv1//bb7cKxmw?=
 =?us-ascii?Q?qoKCbHa6LhUXfW7czdPlzmZE8irUTtsTVpUk2w7A2YOR62gQfG7oVrvPKaal?=
 =?us-ascii?Q?zC09FrRbYWeq4cFrJclUKmuBrCsfkjiO3JK5u4Y2qcH+k9PQBH/zeXA+3k/R?=
 =?us-ascii?Q?7sf8pDj8W3YWtU5ncDwZyY+DweOnf9zA6WeejlheghuL8/8MDHtBSGaQm1B1?=
 =?us-ascii?Q?xyd0snOriJlILwchZtdATov122GBYoL69c43ON8Xz91nubwhuOftDauHx9Ig?=
 =?us-ascii?Q?G4cNTXa5nQ5AM3qeNuZu7BEpWLiKYCGbU47Wpjwxt9QYa6ByHU/BX4dVIVa7?=
 =?us-ascii?Q?73r74F+7ljL9vH8fg2aYJA7lbpgDqCyLrte5BIPnLy2H6OjSUhJgBZC+PjJa?=
 =?us-ascii?Q?E1iZ52bkeF/i8DtTvvy6ULaOaiSVRWE54boRU++5ZSIiPTrjLQ6jzVV9zydr?=
 =?us-ascii?Q?5qpEDgXU+gL4Ub+vRu/U8gyVTXSTh8iMjTmbJMBmUlYgKobBiwR50+aOh5mH?=
 =?us-ascii?Q?rsbyMfQg7u/Mw48qz/e6bsqSAp+5m6atkWI8GH3fBlSexWN7XN3Hk53WXD4H?=
 =?us-ascii?Q?pujmNUHx/szj1+ARDNiKF5WWvhiFDALIbarRQ04RxHsiBDl6374/b3KCWfbq?=
 =?us-ascii?Q?Kot4LPikcrAi5e9XJArTdN7BWb5AOGJf43AYsq0uaQeFjVfTrHVl7zsNDOYs?=
 =?us-ascii?Q?N1Hj96qyml34I5B/Q91/xuvCQQTAO4gL/GfO6VCG50cKarKU0w3Z77+ru9GJ?=
 =?us-ascii?Q?okGDZ4v+g2Awi7db6EOx4E8tT5+IyzA2OrHGoBfDD1w/GTRyog4ScXTZta7N?=
 =?us-ascii?Q?o5+LtlN9iCS9lUx1pBj9yRsPxgco/Og3+qlLDZ+VaYf80/B/HkQNMZbzLAN1?=
 =?us-ascii?Q?A3ZVaa2GMjgMQbdDaK/jF+g=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e2e0bdd-826b-44c9-b5e1-08d9f8087df9
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 02:42:40.7829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k2gwmIXaViOe51CKEYxg5PkA2rAQ4VlZ46zveyxrsKrd9pTEDsgPiB71cdoi+uDpkZYvgWzbRVt+Tv6Ck5gDFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB4507
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tudor Ambarus <tudor.ambarus@microchip.com>

Use NOR parameters in the probe's sequence of calls, thus
nor->params->size instead of nor->mtd.size and let the mtd_info
fields be used by the mtd calls (mtd->_erase, mtd->_read, mtd->_write).
mtd_info fields should not be used during probe because we haven't
registered mtd yet. It's safe to drop xilinx's setting of nor->mtd.size,
now that we use nor->params->size in spi_nor_set_addr_width().

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Michael Walle <michael@walle.cc>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Link: https://lore.kernel.org/r/20211207140254.87681-3-tudor.ambarus@microchip.com
---
 drivers/mtd/spi-nor/core.c   | 8 ++++----
 drivers/mtd/spi-nor/xilinx.c | 1 -
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 88dd0908d172..5b9c827d411c 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2115,7 +2115,7 @@ static int spi_nor_spimem_check_op(struct spi_nor *nor,
 	 */
 	op->addr.nbytes = 4;
 	if (!spi_mem_supports_op(nor->spimem, op)) {
-		if (nor->mtd.size > SZ_16M)
+		if (nor->params->size > SZ_16M)
 			return -EOPNOTSUPP;
 
 		/* If flash size <= 16MB, 3 address bytes are sufficient */
@@ -3011,7 +3011,7 @@ static int spi_nor_set_addr_width(struct spi_nor *nor)
 		nor->addr_width = 3;
 	}
 
-	if (nor->addr_width == 3 && nor->mtd.size > 0x1000000) {
+	if (nor->addr_width == 3 && nor->params->size > 0x1000000) {
 		/* enable 4-byte addressing if the device exceeds 16MiB */
 		nor->addr_width = 4;
 	}
@@ -3245,7 +3245,7 @@ static int spi_nor_create_read_dirmap(struct spi_nor *nor)
 				      SPI_MEM_OP_DUMMY(nor->read_dummy, 0),
 				      SPI_MEM_OP_DATA_IN(0, NULL, 0)),
 		.offset = 0,
-		.length = nor->mtd.size,
+		.length = nor->params->size,
 	};
 	struct spi_mem_op *op = &info.op_tmpl;
 
@@ -3276,7 +3276,7 @@ static int spi_nor_create_write_dirmap(struct spi_nor *nor)
 				      SPI_MEM_OP_NO_DUMMY,
 				      SPI_MEM_OP_DATA_OUT(0, NULL, 0)),
 		.offset = 0,
-		.length = nor->mtd.size,
+		.length = nor->params->size,
 	};
 	struct spi_mem_op *op = &info.op_tmpl;
 
diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
index 03d3b006a039..580562bc1e45 100644
--- a/drivers/mtd/spi-nor/xilinx.c
+++ b/drivers/mtd/spi-nor/xilinx.c
@@ -70,7 +70,6 @@ static int xilinx_nor_setup(struct spi_nor *nor,
 		nor->params->page_size = page_size;
 		nor->mtd.writebufsize = page_size;
 		nor->params->size = 8 * page_size * nor->info->n_sectors;
-		nor->mtd.size = nor->params->size;
 		nor->mtd.erasesize = 8 * page_size;
 	} else {
 		/* Flash in Default addressing mode */
-- 
2.17.1

