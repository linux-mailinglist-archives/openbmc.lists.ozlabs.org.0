Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7754C3C02
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 03:56:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4ZCw2c55z3bTd
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 13:56:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=y7RwRUeb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:feae::703;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=y7RwRUeb; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20703.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::703])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Ywn0Wdxz3bZ2
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 13:43:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAmkgqsdLOyXxueDrHxL5VBKeUK34UcvgoMEWMFP6ClVGcYsevbP1SLLEBWO0FJUuF6B0PEV4G+bJNUCUeOULynAL8s7645mxmZBVumeOLofSOMNpQUBAax9TnimZzots2WDYEXPCqKaKSSqCraqRAPFvU/qKpRsiB7Mcpahj1HZh8jaBVMs+gWhkWtENHetV1Z4Ohm8hBZndys/mb1i4aapVF9H9mvB1z91ro+hj5hy6LcI7oF+jOg8jw/Ysb4arxLLmze3C0ai27yVOu3NQCQZZkzDxb7y3av6OwpO8wmfRA6vo0Fiv01waTbH3XViugsvqdimae+qELVT7Ugx2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kmesm0lueSJ31FmjfR/aiiEtx66yRVDtHS9TuOYHBA=;
 b=A0CDaBWQbsxlwBV4scq/K/JDa2hrX2buB8ThP6NbH23n4fzAq1ucKOMvck5DzRk1MWpb55spN7ogCLqbgQQrjLKoU/iy7LhAfywTLEW5+HDwvdD9ixU8vP8VqfR//Q9xpJnE74UF3pyKeaacwKYmfTY+84/OQpnDrIOLt2pBFgZOz/hAErmvM3ku4zTaySmSwYAqid98Ou5nyPiTen1oatAJcozVWr/0bA+azqJ/oGjWSxfUiWIXJGdNMLlOkRJptTCVACLmLtvX3LTmEEyzl6SArk+02QWkTtFqvuRL/8bBwd94WK5ZiSFy8D3qgWG5iz2C6Y6z/Sjieb57LDFStQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kmesm0lueSJ31FmjfR/aiiEtx66yRVDtHS9TuOYHBA=;
 b=y7RwRUebpHselH49redBlNQy/IPzXpd19D0xVuHCT/iZiScowtbesUdb3BXHpsdhwbvyfb8IyTWTE4jzbgjgfpfDRx3fl44e9QtJQ0Y3xurY3VOsS3pdl7oqc7O8Jlkg1icKcFIMXJcBXo2phFqaUNc4i1uQ/PD156/PGjt83f8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by KL1PR0401MB4147.apcprd04.prod.outlook.com (2603:1096:820:28::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Fri, 25 Feb
 2022 02:42:45 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 02:42:45 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 18/26] mtd: spi-nor: Introduce
 spi_nor_init_flags()
Date: Fri, 25 Feb 2022 10:42:13 +0800
Message-Id: <20220225024221.19422-19-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225024221.19422-1-potin.lai@quantatw.com>
References: <20220225024221.19422-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:202:16::19) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9010f410-6782-4776-7874-08d9f8087f47
X-MS-TrafficTypeDiagnostic: KL1PR0401MB4147:EE_
X-Microsoft-Antispam-PRVS: <KL1PR0401MB41470671ED84B133F45E5D418E3E9@KL1PR0401MB4147.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n4wTNqUP4PXpt5VIzvwWgezkJd8dHqOcZ58jsGwyC8On7ZzdhCMpuhgthXZEUbZTeaAJKwaizT/NOqi6emeH0GkKFjgWjjE8wM9zc0jEKRDnNbwS4eH9oMgicMP3yENtfqYgIzv069rQ1BKl2VEpwSxlZCrI7B1JDaXHLrbVmuejeDpEkYzRqbWocMy5b00irNfnBsWi00DmmTrJqYE0mAl2hFbDdWlUlRfbUHVOUkHuu6/ldcNsPTo+z6bPukTDimlDrfTBmMlSq4Qib7JYB9n1do6+NIZzozroXs54vWTuz2y3bIBqZsvk9nCawsf7IHei7ydDsd617pGlj5SAUZUaMm/tpnB4G9mKPP9/3+p01v6HyEqtnCJ+RUdmkG/RtXEvP7wWw3KUeyPP8i0t6S1kX+4Tx0doYxt+QKCFcKQVbEuUJXlhrpgD8YT9Xgb/0hGOoxfGGmMAPQJGol5drJyHU1Wg8MMc5vhTGuSF0pyTXHgUU36HA9v5pOrhtvCstGduD8jSNarESy7hoEmUs8CgBgvT42CvMc4bKpHL+WxR+LJApe4+o3QstqHdYk+QZ0pT1K++0QUSg5LBhLISSgDAxdO4WRdmjzrN5VU3Cuz8ijVDOv8Oq6kxb6spR6mLufYm5a8lcuJQXU3tzJZ+2cwyDqnI//KJ0FHnLDaiZcJWtcFu/3hGb526uXms8QVHedQ/NLNqFRA6R/4zPuUKL7b1tYZYNTX3OTR0PdCKuvmF6CjvEjB4FyhuST69iMm0d+aSnFhekknpD3vz00aMCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(66556008)(5660300002)(52116002)(36756003)(8676002)(8936002)(6506007)(6512007)(6666004)(66946007)(4326008)(316002)(44832011)(54906003)(1076003)(2616005)(186003)(83380400001)(6486002)(966005)(86362001)(2906002)(26005)(38100700002)(38350700002)(508600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JMGlByT9eAEdKIuH8/SaucTe4UeZQCuVsMeG59c8J5oOsr/RziNI+/PeS2W7?=
 =?us-ascii?Q?zUAyjqbJTQ8CLKDAiH2aTaRZv8rOOlBS4yUNnQfSIujtM4L7lsYgv2SdQvUo?=
 =?us-ascii?Q?vQLAJE99VtWGG7AoPxAUD0p1iVneCpee+4QjvPMbWxNHRlyr7tKr3tMhUWDI?=
 =?us-ascii?Q?8Q7ZaWeZnILV8ldvLwQ6PHSgfFGuKYRAamny3A07lmGUKHemwLPkPQlTsuFf?=
 =?us-ascii?Q?wYEV7ikmgvRFhf9zVQkiSPyFGE99z/AaoZfzEk63O+hUwjfMtZsDMIuyYKhj?=
 =?us-ascii?Q?0ZnPeGqz8+gWE33Fe6i+xrgBqh7nCoG3m9UoH8eyRLm0kWR9i8NpRRKBffIM?=
 =?us-ascii?Q?u8zdHfzz3C25156celApBRAtVKJ4KhyLEbqwrAk3mzvrYb40ePkv8vOqbemL?=
 =?us-ascii?Q?1tIbfT/Iq1Ow7aTssFFICHRam2odc37++MzEM5ZNUZ++xGA9UWjMiTY+D/wf?=
 =?us-ascii?Q?1X8q7lRE+uckWwA5wcdDywpV1idntJJbW93L/IdBj5giGK1HOKlp33J0HN6e?=
 =?us-ascii?Q?KIH5HhDxWdeFxM+uqg5AoQB5ZU0o6lE6xlyTbcnldrhKYxqcbPtNjHONtxMa?=
 =?us-ascii?Q?7bK29Lmuu53vGf0SdsoLhwaDpTlmRNvXRCMtrqUNrsG1Uu+tE3zZyfgYYAsG?=
 =?us-ascii?Q?khmIIgYuKCb38PCuGWqjrfDjSfIcF4ItTkiDnpmhqzyKAv9Agxzo8D7NC7Au?=
 =?us-ascii?Q?RUCzXY5DOC6Cgs11UyxIv8FvtqxYOKdou99VaNsy6CR2XtSIYli8NhZoaR2Q?=
 =?us-ascii?Q?8uYkozMM/ALNWWBHNran/iScyNRQXElas2VFt/x5mTL16nyWiAcuVh2ZhSh2?=
 =?us-ascii?Q?j86xZUnw6EQq0lNnj9D4vSu/Mdx8SZ/ijyEuACAFqX7IehBg1nC0aJ/SqmjM?=
 =?us-ascii?Q?nlgYUs5NTJJP84IR2/hb7A45Oq/ZpUeK3Uqy8vJcNBfar9/zxdrBbu6R6Iqd?=
 =?us-ascii?Q?u7OfWuPsdB0kZ0+YqAHujgYMIccLDQNd9lgM8bF/LjwkWECaHKy7GjmdbZb/?=
 =?us-ascii?Q?ynlI9vxjcS4ACjnRIUqkXRuj84ldy5U295ne1ajqaCl/qVa+q7MFElls0pNQ?=
 =?us-ascii?Q?nbgFngMFq82mM105+gXnwxIZvrcQ+HFVDhvj7XhvS2Ob3NCNtw2KMZBY3X50?=
 =?us-ascii?Q?63vCWUoxn6njXcPtYSLy3ig9P2OZ71gXPkJ6v1Wj++7eaONqMAbMLFLKu24F?=
 =?us-ascii?Q?H4nOcF5izJ1d1W6oTaz9txYfumYtAsP74+68iUFzJYXLuBY/VzMdGhGdCadB?=
 =?us-ascii?Q?E58Muap1168q4hTC2NECjFAtAM1ie2hVGbKz1tesLNDsPJ8NADe9TpTVtsrw?=
 =?us-ascii?Q?bok8ZA6DGzd2P9Q+mqEXaTN0y84gRz/AkuewlSWAHyAdkrrt8os7lty05OrZ?=
 =?us-ascii?Q?jbgjricFgtv09Wf2FTyWpANTiiIDrnHF65wqSBt0c5le8gLzLKPoRdzDT1mV?=
 =?us-ascii?Q?0yV7IBmokhA8w2LdCYOWSCuMBw/U96NOU7tEyErhrkqN4oKIFijBxAeWOh6A?=
 =?us-ascii?Q?xBv2nCFq+FoZcUIgf6RoT+SzhHTRurP79mYH0UJdWmVVtcp+6hE+du6UbjP0?=
 =?us-ascii?Q?tRrCha3o6iVXTj2ZW5QacAe85+vHXMbQqs+KEvq4b9fZ1gC212oHozvm5jQs?=
 =?us-ascii?Q?l6qumko6YGmTO/GLyy2ZhEE=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9010f410-6782-4776-7874-08d9f8087f47
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 02:42:42.9234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IVKxx8Sua09N3ZWwFAGLPt5N0A1dDxBrXjR0vpPcHYZJT7Yj5/2N3A6hXcSuWpuiynqyZGHdZzXAS2UrdSoQ2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB4147
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

Used to initialize the NOR flags for settings that are not defined
in the JESD216 SFDP standard, thus can not be retrieved when parsing
SFDP.
This moves the setting of SNOR_F_READY_XSR_RDY and SNOR_F_HAS_LOCK
late in the init call, without any functional change expected.
The rest of the flags were already set after the spi_nor_init_params().

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Link: https://lore.kernel.org/r/20211207140254.87681-8-tudor.ambarus@microchip.com
---
 drivers/mtd/spi-nor/core.c | 89 ++++++++++++++++++++++----------------
 1 file changed, 51 insertions(+), 38 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 25e2b4889093..1ac7e8de4b8e 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2643,6 +2643,55 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 	spi_nor_init_uniform_erase_map(map, erase_mask, params->size);
 }
 
+/**
+ * spi_nor_init_flags() - Initialize NOR flags for settings that are not defined
+ * in the JESD216 SFDP standard, thus can not be retrieved when parsing SFDP.
+ * @nor:	pointer to a 'struct spi_nor'
+ */
+static void spi_nor_init_flags(struct spi_nor *nor)
+{
+	struct device_node *np = spi_nor_get_flash_node(nor);
+	const u16 flags = nor->info->flags;
+
+	if (of_property_read_bool(np, "broken-flash-reset"))
+		nor->flags |= SNOR_F_BROKEN_RESET;
+
+	if (flags & SPI_NOR_SWP_IS_VOLATILE)
+		nor->flags |= SNOR_F_SWP_IS_VOLATILE;
+
+	if (flags & SPI_NOR_HAS_LOCK)
+		nor->flags |= SNOR_F_HAS_LOCK;
+
+	if (flags & SPI_NOR_HAS_TB) {
+		nor->flags |= SNOR_F_HAS_SR_TB;
+		if (flags & SPI_NOR_TB_SR_BIT6)
+			nor->flags |= SNOR_F_HAS_SR_TB_BIT6;
+	}
+
+	if (flags & SPI_NOR_4BIT_BP) {
+		nor->flags |= SNOR_F_HAS_4BIT_BP;
+		if (flags & SPI_NOR_BP3_SR_BIT6)
+			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
+	}
+
+	if (flags & NO_CHIP_ERASE)
+		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
+
+	if (flags & USE_CLSR)
+		nor->flags |= SNOR_F_USE_CLSR;
+
+	if (flags & USE_FSR)
+		nor->flags |= SNOR_F_USE_FSR;
+
+	/*
+	 * Make sure the XSR_RDY flag is set before calling
+	 * spi_nor_wait_till_ready(). Xilinx S3AN share MFR
+	 * with Atmel SPI NOR.
+	 */
+	if (flags & SPI_NOR_XSR_RDY)
+		nor->flags |=  SNOR_F_READY_XSR_RDY;
+}
+
 /**
  * spi_nor_late_init_params() - Late initialization of default flash parameters.
  * @nor:	pointer to a 'struct spi_nor'
@@ -2660,6 +2709,8 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
 	if (nor->info->fixups && nor->info->fixups->late_init)
 		nor->info->fixups->late_init(nor);
 
+	spi_nor_init_flags(nor);
+
 	/*
 	 * NOR protection support. When locking_ops are not provided, we pick
 	 * the default ones.
@@ -3094,10 +3145,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	const struct flash_info *info;
 	struct device *dev = nor->dev;
 	struct mtd_info *mtd = &nor->mtd;
-	struct device_node *np = spi_nor_get_flash_node(nor);
 	int ret;
 	int i;
-	u16 flags;
 	u8 fixup_flags;
 
 	ret = spi_nor_check(nor);
@@ -3128,52 +3177,16 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		return PTR_ERR(info);
 
 	nor->info = info;
-	flags = info->flags;
 
 	spi_nor_debugfs_init(nor, info);
 
 	mutex_init(&nor->lock);
 
-	/*
-	 * Make sure the XSR_RDY flag is set before calling
-	 * spi_nor_wait_till_ready(). Xilinx S3AN share MFR
-	 * with Atmel SPI NOR.
-	 */
-	if (flags & SPI_NOR_XSR_RDY)
-		nor->flags |=  SNOR_F_READY_XSR_RDY;
-
-	if (flags & SPI_NOR_HAS_LOCK)
-		nor->flags |= SNOR_F_HAS_LOCK;
-
 	/* Init flash parameters based on flash_info struct and SFDP */
 	ret = spi_nor_init_params(nor);
 	if (ret)
 		return ret;
 
-	if (flags & USE_FSR)
-		nor->flags |= SNOR_F_USE_FSR;
-	if (flags & SPI_NOR_HAS_TB) {
-		nor->flags |= SNOR_F_HAS_SR_TB;
-		if (flags & SPI_NOR_TB_SR_BIT6)
-			nor->flags |= SNOR_F_HAS_SR_TB_BIT6;
-	}
-
-	if (flags & NO_CHIP_ERASE)
-		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
-	if (flags & USE_CLSR)
-		nor->flags |= SNOR_F_USE_CLSR;
-	if (flags & SPI_NOR_SWP_IS_VOLATILE)
-		nor->flags |= SNOR_F_SWP_IS_VOLATILE;
-
-	if (flags & SPI_NOR_4BIT_BP) {
-		nor->flags |= SNOR_F_HAS_4BIT_BP;
-		if (flags & SPI_NOR_BP3_SR_BIT6)
-			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
-	}
-
-	if (of_property_read_bool(np, "broken-flash-reset"))
-		nor->flags |= SNOR_F_BROKEN_RESET;
-
 	/*
 	 * Configure the SPI memory:
 	 * - select op codes for (Fast) Read, Page Program and Sector Erase.
-- 
2.17.1

