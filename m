Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E24F4C3BF0
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 03:52:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4Z753SS9z3bcY
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 13:52:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=PSbtEitX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:feab::707;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=PSbtEitX; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20707.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::707])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Ywj6tC6z3bPK
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 13:43:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5dV4R71UQO/p82Dk+loX/izMEFkz5XlSUsMSZYOpEUMMC4nymw83DtQh4XrEKlbUuE4N7Z+Wl+fxz+gkUbKKdasJPCAim2VFl3dII9QuwhfP3XOMRgoT6ZRGA9mscDX18z/Kx6ZA8IoxHE+Vm9NaXbgaZT9C/76iTJvNwkO8TH4zCbG86gqsqS1kQEuZoJzb8reHVsLhrak0+nw8FNfDrNPOV705btYRxEa4omwBMuJUkHqtg8cuo1svL22Fhx+pCGlEYGXkZrFU3yFuXrEdlbvEoVH/YAXINnnTc4HB2oMiKhG/vYUe1cXY7kHGoo76UgxB1vip1KpGBcXzpX9nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBfNKECKgcQ4qHYKW65ncW8LrUGn1QofO3YYHaIa2MM=;
 b=YxhIIeGJaefkh1OdpOem35fKnE8UjgSLtKvOQB0pbHBhyKlvl7E5tleDQhyj/LuttNwMVMmNXy/C7Bj6eWHb9M7uNvIzLcikML/gZq9XBqr9PQ50oLaIHQ1mQscG63kmuyIbKOS/1D7ElaiShMIRdmNX3MmLJSG6+RsabJ3k9uaMxfBasTRMteMZ41LENIUZf3FlqhUVLh55yYMlzwaJ+mW+OQ2gGa8yPoxRLkb1GnhVJoVe56p2DvBbFFD268kcZ+D8kQBfs4Pnp3r+IPu5NhiJk6Fy+VK2Emd08Lltg4Ohvtc+uL93GHPO9act6kXAyEaEFrxGKpgOBic4UitEcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBfNKECKgcQ4qHYKW65ncW8LrUGn1QofO3YYHaIa2MM=;
 b=PSbtEitX5IaA6NHPWjeAkivLbpuaW5IYWUWjy3GFMA6RpvMG6YzqMT/oX9xfiYyGtMEfYPZcQt3NY0Bjhfu2/xOJ5WSCj8HnD2T0L3lbZgopOYuoxNYlWvoKl2ZoWccW6B5PZ5db9RPL1IowMsGT9/5F6258rqexJJeygEaM6Bk=
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
 02:42:43 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 14/26] mtd: spi-nor: Introduce
 spi_nor_set_mtd_info()
Date: Fri, 25 Feb 2022 10:42:09 +0800
Message-Id: <20220225024221.19422-15-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225024221.19422-1-potin.lai@quantatw.com>
References: <20220225024221.19422-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:202:16::19) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0248086-6de0-4116-4f87-08d9f8087e35
X-MS-TrafficTypeDiagnostic: SI2PR04MB4507:EE_
X-Microsoft-Antispam-PRVS: <SI2PR04MB4507134B77893499F7F82E4B8E3E9@SI2PR04MB4507.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E0P68OOD5ncBO94/ECp2TBkmycqZ9wJKKzZJC1jD8ignb2toUed4nHoXYQ4FZnOWsAuHhdHtcTd7SM+CeC8ZI2mbH8KtzotgtpqOwSDWb8DIpUgNW2TlBGjSmmDzrz2SdeQGyMK9woSvjG2sdwLZolU4Wx7YrYXEyilMffSqyvyX9AEgYs1ukOHvFo7DUy9nXSObEXqoo/DcVtQusxZqrhFkO4ZdIu2gygsaZxLm8L62u3dcJeEMcDpP9Rjv1wmLUIW2EXKHPSxIADe01FR2p7AURpQA53n/gejSpUUwIV8lOkV6Bs1J6PLsDvLZMi3yUOmkgAPu1UUIdsrWwZWcOz1uYGXFR/q0lv2+pXkS7rOFBqmCnuDZM3hRtkY9OFRyBRbZTfgjHzEKwKn++wYxQl+qNsaKnTB1pX79GRjkv3pXhmHyFZZuPFc6brCPtQFJqtnOeDZJoJ5z5fKiGjRMeMtWl7GY6ubkczHJWd+RNDMX3VKOIi72sMvxUW35AQl5ZjjSCw2n1rJ5ZguHL+mAMT8ZroVLu+aoSpY2lfgJtmNpzAeaQMzyjUX7q5XNBwtOtbmu7T9qfv0xCUSrnN7P2oM8FvZpmt2sxMqHLPR+ajEWeWKn+hJ1XqcV3x8E4l3zYKp76LlmCw0yWwHT/9d86ds6I5QzfjJHMgoHis1B/qAECKpMMoCDBMgXtSHc/fYkFSwu/KK2Ud54bZNbOn6xdNha1tl+pgNnaS6bBbRM5q2i5IKpGrIy56OhmWCwlkJU3E1xJGKUV0E+aN2PBxk3klL85omXrvVZYXcc3J4uczc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(26005)(186003)(36756003)(1076003)(6512007)(38100700002)(38350700002)(86362001)(83380400001)(8936002)(4326008)(6486002)(966005)(508600001)(8676002)(54906003)(66476007)(66946007)(66556008)(5660300002)(6506007)(6666004)(52116002)(44832011)(316002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?caIZBJHAtumTBZ6xXB//7rYk8fU2bOA0pgNQm1X3oB9HiZIisKid5I0J2I8O?=
 =?us-ascii?Q?kcyesimm/L+yPVEjtHRppP7gldnqcBDclaK+6QEjvHUJEM2kFHppio4eU6Q+?=
 =?us-ascii?Q?eHRNdum+Ku7vojhu1BHZHA7Ja1KRTfCL34/xK+PS4sq8XeVH597jQO66B7xI?=
 =?us-ascii?Q?DHEFoYeXpPBEk1QAlWJclBdeinThfL35HO/s+ZNvH9AVLpSHlttU9cAbnk6D?=
 =?us-ascii?Q?0q182yT5IYFo3yekkHoUYvyQcWiO0BwbCj2+7pQGrQnXaRxDjK1uG+B2opZ7?=
 =?us-ascii?Q?mmyJjC+/1iwWblAE3WWbGbUtqsye1RtSdX6KJXznLxQ9Q9TJ7nrmAJvsgkXy?=
 =?us-ascii?Q?egkmkbWECw5c74QBTg2d+vk7jeZf++RQ1LUPvjaRQHkTieZZ8w8/KS4TJI9w?=
 =?us-ascii?Q?70pbLU+G5hzYO8WZGbvcCoAZJIqshSSJ2jqlDYJl38Eq1y+egWWBbZzRY4QD?=
 =?us-ascii?Q?HDy35wkpW9mthJSOa2wZSKgMLxkIgFe9Zb3Nh8n8NBcXUljZGnNb7isQ2Cke?=
 =?us-ascii?Q?otrb/JKuyFqkq3aU1I30CyP4Wv2BpshIDtDbj26lK1Mv3XUTHgaLkpCIgPyb?=
 =?us-ascii?Q?I19aktuG7nXrq0yAyPMtGMWMzN76BWP4LwCD68iOMuIXh1OeVsUuFoCRO9mr?=
 =?us-ascii?Q?guys9PaLoNLabVD4rl76tRD9ew3GSMjHxElge1cMPoRlN1/FzUOZGkhiKEfR?=
 =?us-ascii?Q?NHGdTNlJ7ugZInpqQ9nMOninJmdbFcZVLVaO22iKc48WxiT6TLKTzzlwWg27?=
 =?us-ascii?Q?j3tjMgda80/AbffIwdZISBMtF9V4DcS6jb7/X+SMMR/4nK9lJJ21GUzzTDxg?=
 =?us-ascii?Q?N0pUke633rPs06VL5oeKBpWKISBdE7QsMhAsg9DVKJwVkRlFfbA3vLpxmUN+?=
 =?us-ascii?Q?vY0/N9GLZE6PWD2MhJDhXAFBtYsiHK0zEfu66jFxJNjdThJ5Zvry33dUhwvK?=
 =?us-ascii?Q?N7ugpbonJFhMeYO2UHQ72kHYlA+K/6gyAXLujJCMxSj3oATYkZkR38c4le+F?=
 =?us-ascii?Q?w6zmo+eCyKd0SwzSaIhqhfqFPKPNI7ascHs14lrZPXMRxe+jMKyJTPO277Z9?=
 =?us-ascii?Q?8GuYXrCnvSplBswsSgOY76+9X9woVStRiVaZ5ExCtwaG65O1fmZI1RV4ALnZ?=
 =?us-ascii?Q?8ldBM4uAGftfT/f7WLV/BVpny/i6+ujGChM3qXs7PN+kkYiBD6ZFPj2CTfxR?=
 =?us-ascii?Q?F9cZRzQesLpeLlSP42kZi3wIgk28w3iGhbBqXMyFzGmtEKn9O3bsRoJDcoVj?=
 =?us-ascii?Q?r8OEG/Or4F/+EPpq7tl2n/0P35GB9cpVPH6ILj1cSQinKf4wAn17ijUBvqey?=
 =?us-ascii?Q?vIn185jbC+VyusapUjz+ypKy9Ra4gGDvQrP9jIuyA0WgTa03+8OW6Nh+0utu?=
 =?us-ascii?Q?iyuJ3XqiUmc4gCuXnlnplD1ahctw+IwtKVuGM8hfZeNcEaUmPZFyAlJdI7+3?=
 =?us-ascii?Q?yBGUwVIC1lX9JswduTTv5ckXtxbRYFYudYNoidsGXrEnrpJupR1DLs7AOq41?=
 =?us-ascii?Q?EPT48HZ+OvGTdYomN7nlvgYMRKshJlzFRE7oM4JIMV0iaaL3+7fIE73Nzub2?=
 =?us-ascii?Q?kXj4rY5qLJly9AlZO/qCfqjqK3uQTXqDKQKLlPvKyZceUqYPNpk3l0KxzVRt?=
 =?us-ascii?Q?/AbRHOcP7w8FwthH7274fjY=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0248086-6de0-4116-4f87-08d9f8087e35
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 02:42:41.1891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M7S0hjfTuf53b7TliuE3Sw3CkVC8G7P58eYPUeaexnFGKDnMV40uNcbt+YOeEt/1dtKLuQMWztbD7AdPZWm2Vw==
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

Used to init all the mtd_info fields. Move the mtd_info init
the last thing in the spi_nor_scan(), so that we avoid superfluous
initialization of the mtd_info fields in case of errors.

While here use common naming scheme for functions that are setting
mtd_info fields:
s/spi_nor_register_locking_ops/spi_nor_set_mtd_locking_ops
s/spi_nor_otp_init/spi_nor_set_mtd_otp_ops
The functions names are self explanatory, get rid of the comment
for the OTP function.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Michael Walle <michael@walle.cc>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Link: https://lore.kernel.org/r/20211207140254.87681-4-tudor.ambarus@microchip.com
---
 drivers/mtd/spi-nor/core.c | 56 +++++++++++++++++++++-----------------
 drivers/mtd/spi-nor/core.h |  4 +--
 drivers/mtd/spi-nor/otp.c  |  2 +-
 drivers/mtd/spi-nor/swp.c  |  2 +-
 4 files changed, 35 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 5b9c827d411c..dbb2c98c0366 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3080,6 +3080,35 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
 	return info;
 }
 
+static void spi_nor_set_mtd_info(struct spi_nor *nor)
+{
+	struct mtd_info *mtd = &nor->mtd;
+	struct device *dev = nor->dev;
+
+	spi_nor_set_mtd_locking_ops(nor);
+	spi_nor_set_mtd_otp_ops(nor);
+
+	mtd->dev.parent = dev;
+	if (!mtd->name)
+		mtd->name = dev_name(dev);
+	mtd->type = MTD_NORFLASH;
+	mtd->flags = MTD_CAP_NORFLASH;
+	if (nor->info->flags & SPI_NOR_NO_ERASE)
+		mtd->flags |= MTD_NO_ERASE;
+	mtd->writesize = nor->params->writesize;
+	mtd->writebufsize = nor->params->page_size;
+	mtd->size = nor->params->size;
+	mtd->_erase = spi_nor_erase;
+	mtd->_read = spi_nor_read;
+	/* Might be already set by some SST flashes. */
+	if (!mtd->_write)
+		mtd->_write = spi_nor_write;
+	mtd->_suspend = spi_nor_suspend;
+	mtd->_resume = spi_nor_resume;
+	mtd->_get_device = spi_nor_get_device;
+	mtd->_put_device = spi_nor_put_device;
+}
+
 int spi_nor_scan(struct spi_nor *nor, const char *name,
 		 const struct spi_nor_hwcaps *hwcaps)
 {
@@ -3134,26 +3163,11 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (info->flags & SPI_NOR_HAS_LOCK)
 		nor->flags |= SNOR_F_HAS_LOCK;
 
-	mtd->_write = spi_nor_write;
-
 	/* Init flash parameters based on flash_info struct and SFDP */
 	ret = spi_nor_init_params(nor);
 	if (ret)
 		return ret;
 
-	if (!mtd->name)
-		mtd->name = dev_name(dev);
-	mtd->type = MTD_NORFLASH;
-	mtd->writesize = nor->params->writesize;
-	mtd->flags = MTD_CAP_NORFLASH;
-	mtd->size = nor->params->size;
-	mtd->_erase = spi_nor_erase;
-	mtd->_read = spi_nor_read;
-	mtd->_suspend = spi_nor_suspend;
-	mtd->_resume = spi_nor_resume;
-	mtd->_get_device = spi_nor_get_device;
-	mtd->_put_device = spi_nor_put_device;
-
 	if (info->flags & USE_FSR)
 		nor->flags |= SNOR_F_USE_FSR;
 	if (info->flags & SPI_NOR_HAS_TB) {
@@ -3175,12 +3189,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
 	}
 
-	if (info->flags & SPI_NOR_NO_ERASE)
-		mtd->flags |= MTD_NO_ERASE;
-
-	mtd->dev.parent = dev;
-	mtd->writebufsize = nor->params->page_size;
-
 	if (of_property_read_bool(np, "broken-flash-reset"))
 		nor->flags |= SNOR_F_BROKEN_RESET;
 
@@ -3204,15 +3212,13 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (ret)
 		return ret;
 
-	spi_nor_register_locking_ops(nor);
-
 	/* Send all the required SPI flash commands to initialize device */
 	ret = spi_nor_init(nor);
 	if (ret)
 		return ret;
 
-	/* Configure OTP parameters and ops */
-	spi_nor_otp_init(nor);
+	/* No mtd_info fields should be used up to this point. */
+	spi_nor_set_mtd_info(nor);
 
 	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
 			(long long)mtd->size >> 10);
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 50bae06bc024..f6c4b6f4743b 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -552,8 +552,8 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
 
 void spi_nor_init_default_locking_ops(struct spi_nor *nor);
 void spi_nor_try_unlock_all(struct spi_nor *nor);
-void spi_nor_register_locking_ops(struct spi_nor *nor);
-void spi_nor_otp_init(struct spi_nor *nor);
+void spi_nor_set_mtd_locking_ops(struct spi_nor *nor);
+void spi_nor_set_mtd_otp_ops(struct spi_nor *nor);
 
 static inline struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
 {
diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
index 983e40b19134..fa63d8571218 100644
--- a/drivers/mtd/spi-nor/otp.c
+++ b/drivers/mtd/spi-nor/otp.c
@@ -480,7 +480,7 @@ static int spi_nor_mtd_otp_lock(struct mtd_info *mtd, loff_t from, size_t len)
 	return ret;
 }
 
-void spi_nor_otp_init(struct spi_nor *nor)
+void spi_nor_set_mtd_otp_ops(struct spi_nor *nor)
 {
 	struct mtd_info *mtd = &nor->mtd;
 
diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 8594bcbb7dbe..1f178313ba8f 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -414,7 +414,7 @@ void spi_nor_try_unlock_all(struct spi_nor *nor)
 		dev_dbg(nor->dev, "Failed to unlock the entire flash memory array\n");
 }
 
-void spi_nor_register_locking_ops(struct spi_nor *nor)
+void spi_nor_set_mtd_locking_ops(struct spi_nor *nor)
 {
 	struct mtd_info *mtd = &nor->mtd;
 
-- 
2.17.1

