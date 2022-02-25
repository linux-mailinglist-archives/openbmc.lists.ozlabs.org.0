Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A69DE4C3C0B
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 03:59:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4ZHB6s8Nz2y7M
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 13:59:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=lG7BiC6+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:feae::717;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=lG7BiC6+; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20717.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::717])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Ywp67ctz3bc6
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 13:43:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HlHEEtUH2eacvu5tGV1KlHazumVxaP4W5M3HFN4JSs/5V9wjDCYO5mFOZrphZYWtP1kX1of2HO/FijeaEvn3/UetCRzgbJ0yFalDoOsCwU40XFuxKL4A/QdnSTtkivuYLkkEiH9sNp266Glg81K5okB5rrAH/jj0WAtibwWI8ev5gWznvJ4ERMwA8eyTgl0MrVjy38QRijg3J1HrAxcxVYK3+MWFgE7dkfRFvjMuJktGqMxJQvOR0e6PnQobDJje50Tr6U9tqCB9ejFCqOyfe5hrOnrwRGkvkhb4RiOUCwzeKmLIbn0r77ok5wtdCHgoRAqg9/BrDvBQGzoKyNppHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CaX+1MLTPCW6/252xgeJ704mG7zL5/8Rdy6ywTi19Y=;
 b=PdR1Qm9TAoALO4bnxmvCMe9Y9yyJWu2kf5Y5mJ556b1tlQyAXq2PQOQbli/jZbPCp53gdkNN5nIhzaQvGLlHS1SOY51/TUpoLtrHc+UTK4HrrDHyDEwRSYKoiV04OjzZkUz1Cl5bl79ULah2hRK1MXp9bRNKTI56R3JXbqV9w0sE//xrUFVekdpX4G3ZSCXxA28zEiqaPXklLR8V6IGwkay3whyxr7rZ/2dgU8b65ms41rmnbvCPGQzWc3qu1fKSrs4EkvT5meuJThMLWv7DGmMOIPqpmh+Sf4b6Z0aRwqWBp1hmopmV5nbvCdBMlrI5R8Lje6rVE/3cOb+5Xqd9Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5CaX+1MLTPCW6/252xgeJ704mG7zL5/8Rdy6ywTi19Y=;
 b=lG7BiC6+BeDj/jGWe2IgijOJpT/TSLpoyGyjykP+whsOyrUCuO7epE+5A5WNJNwfj7fhcKRMiKdrPp24wCycS/S5nuQS8ZA9zN4m8Lc8kg2futBgUL69yN14aR8a7BYXtlpQbHC1zj1F4IsSZ76cN/wWOeFyN8SkAz4r6C3kZOk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SEYPR04MB5644.apcprd04.prod.outlook.com (2603:1096:101:51::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Fri, 25 Feb
 2022 02:42:47 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 02:42:47 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 20/26] mtd: spi-nor: core: Init all flash
 parameters based on SFDP where possible
Date: Fri, 25 Feb 2022 10:42:15 +0800
Message-Id: <20220225024221.19422-21-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225024221.19422-1-potin.lai@quantatw.com>
References: <20220225024221.19422-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:202:16::19) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f780eb7a-6425-49c1-84c3-08d9f8087fb7
X-MS-TrafficTypeDiagnostic: SEYPR04MB5644:EE_
X-Microsoft-Antispam-PRVS: <SEYPR04MB56447959DC1FB67868C9005F8E3E9@SEYPR04MB5644.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iJiOp7ggop6KPy6SzAFPwSFqCEpA9b3ndrG86jVcL1ayXqooHIoOM/Du0rqcpmH0sSp+yYCutJu750LrKxpP1yS+MG158tsBgMglfxsTPFPW5A59tJKlIlQdt9BOS7LH6xle2ssiCMUdThmJk5zt0FaKRir4llpIaoDlBFoNeUL41uyZeA7GMF+NoE2H1uyZZUFNVAmvhAQEp3i9Uk2bmuc6y3g43uR2qTnqhQreTqmKiQeZM/r9dkXfh1WW3jji6aRVkdbywjYR5S+2HB4MEz7xR5JQMvbdEZBNGQJuNT19XeJU3HoRRisMtOLFVbiWmPAA2boi4Jx46NBGuue7pIx1LzE9xnTz7Fb7C0KlR9FfFA2ITofzVDtojyzSN/pRYCMX2jQAdNKkVcERlrccfh2QSWe/4XNa+sqmfRdtMvRfOZ190LBJ7WJdzLG7Xj/2sqWN8UhGHlz5Hn7gqfsHQE844MDSzOZFuDCf1xyEvfPF3vI5lqqgU1UIeJyvxdriXSFviUKjXsQsi6N6ePIhec2smInSlGS2p2kU/bf2UKRhXnogxhrGsuNdr1wVjZfub4PnY0CdQ/L4E2CjjlUlaMAwTsEYCBjAnvDLSjDSRjFo51S4jSusFhVqYxNnfcctQA3N8OkjYcya25oaoEkB3mtJnd2k9q7JAcm7/HJaseYXlr0YvV/ZNd6PkQp2jzzWeR2oUBygUqADTag+FhOUtgD/QiJYVxQzJAlZluY6bsXsAQPwvYgMjv2zIqAEmhyV82Lj0xjpk7DMjY5tff1OVF0GfnsJEcsvOLFPCPE/Eo8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(44832011)(36756003)(54906003)(2906002)(6512007)(316002)(30864003)(86362001)(6506007)(6666004)(6486002)(966005)(186003)(38350700002)(52116002)(5660300002)(8936002)(2616005)(8676002)(66476007)(66946007)(66556008)(26005)(38100700002)(508600001)(1076003)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xy/n2lrv/8hct1f3zBRGBuQHhf5yVUoqf1wf/cg4Vb2x7oV8CgLgoabOsRoT?=
 =?us-ascii?Q?6W7o4Qss0k+BEmJ0UYll6OXSgePlJtIuXrZIZ1LHuY/bjxpQD6X/XiIaE3op?=
 =?us-ascii?Q?1aywz2FzGFkItaTgv0Z47KUiE+c6LNlYZuKgGrC7tyw2PACY553DhQ04zKXq?=
 =?us-ascii?Q?AhynrRu8C3N4LGeRses17t4z/QhSRQdPZdx8RhTR2igGvyOu2gozY/o3jWNQ?=
 =?us-ascii?Q?inXpjzO9F7DMr3NJGCLFwgHBmdStCsf3ORHGyFlCjzKXjNFmyIS8/V864hkd?=
 =?us-ascii?Q?1fvKGh7eUa7h9aJpiPRMcUgytmRUxCCukzZ7rwiVuGJiOM3r0w8xACQdw1A0?=
 =?us-ascii?Q?vPSqJpO71xVLqBohv8Inj5wFga+MTMKHN8iS772mNRFnzGlYmNIp0fIW4RSg?=
 =?us-ascii?Q?OICwYSzsfeS7W+447X0D03gKL/cnfYDcyRoYyJz1twlQpNLnM2Bv8psItrag?=
 =?us-ascii?Q?+tms5fErQqlKyZ7eui6ih2I2TNP4xovaWGJKgjANsfLYMGoO964nSqiZLsu6?=
 =?us-ascii?Q?fqcmWjF3dKPBmyFws9sTu7H1953u1/jGQ8Q7MUrHNUQnmShlWw6SvZF2+hqu?=
 =?us-ascii?Q?KCQqzfHHQ/HZJ1vOLmyuHQSOMpHjAwT3ek3G6gBDpMzw22UodIQ7gcU0vFeT?=
 =?us-ascii?Q?rAPAQD5CerkOk/RooRl7+VH8Ak62xcUrEEI5d5XBv7WPmmEBJTl+l1XqEGbn?=
 =?us-ascii?Q?wyHbgqskuporebj9IUX8cJ7Kzp3FIMye7o17p9RUbq0B4g8z/6e7MZ2mdSf4?=
 =?us-ascii?Q?sowrKKSG08nQ1nxE/jbkmmAIdar7LbWzicK0US++3LqgFA49yMn3DREG+KR+?=
 =?us-ascii?Q?w0/BfhWd5t5NfNiq10zOmBPX3D76n1zlUtaaXBJKZ7BE3IG1TLHK/xrhJJdq?=
 =?us-ascii?Q?TXntUHQ67CPSzTwYuOtDKubIx0G2EGjO3yH/Djl5JtwzeWWw6W28ghS3rxCC?=
 =?us-ascii?Q?W9lfKonFjH2nOSXS6MFIQEsU4O0zpGS9UfsPrtp+199qsdGCjv6BbvZQggoC?=
 =?us-ascii?Q?Evo25birVoNapuHuF3SMyW3WvDbHU7Zx/vXr9QT5hGd5IxcXLCrrFyCvt0tp?=
 =?us-ascii?Q?h/5+jOnzE0TZ70TiQ3nrRy+2QuoRyzAWIGdzFVhZn5dn4u96A8wd0Knytb29?=
 =?us-ascii?Q?6h/9xNuQBBZwoSoDxBHd+sHFPpl8OofRmXU7KhczBmfn2fhdap4UsUP1Z1wu?=
 =?us-ascii?Q?fkOF/c9nzykh7vu+oodLf9r4LivZvuhJyTOvWKNbN95EEmE9OkGB79VCllLQ?=
 =?us-ascii?Q?86UI2dpMmfRKqHG2uQlU78V//eqdEaItzFtPehwGjlxCkruwL8H+YLYwQzvp?=
 =?us-ascii?Q?VL/ssPdqQ9NtEa7xySH0xLW/8aQFLQsUMTZ9H9R+kukFTHLl6/IM08yreb53?=
 =?us-ascii?Q?QojRbkV5vzA47xzi5x5ewhMApUVrfhm2GGFmzo/c+BBT3QU2fwdH66tox3tm?=
 =?us-ascii?Q?rcRYj0dMbVpELjWp300WY52028/AJn69CKIcwDEXnXxEyBwwkZ/5fi+B8EAc?=
 =?us-ascii?Q?KIbAPRN30g60cdLad3hn24xWiDvUTOdhg2KKgHWEJr3MxSCutBWTKJo1YD0z?=
 =?us-ascii?Q?YjRJMkRi9TH/+x6lHyJTJ1HWvfo+/GYoZSJUYbL3CjhFjkCXr8Fl7yQCmWEo?=
 =?us-ascii?Q?KZntZUxyAPNn9fI/0pjtAEY=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f780eb7a-6425-49c1-84c3-08d9f8087fb7
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 02:42:43.7514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: syb+uBSBHIQR7eAxMM8UX7At2xpVye6XI2aycwfRDWNkMIJ2A6D/syS7DvACFKWSZOP5SBN6beFeCV34NSAJNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB5644
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

New flash additions that support SFDP should be declared with
PARSE_SFDP and with all the other flags that are not SFDP
discoverable.

Keep the old way of initializing the flash, until all the flashes
are converted to use either PARSE_SFDP or SPI_NOR_SKIP_SFDP.

Flashes that declare PARSE_SFDP do not have a roll-back mechanism
because if spi_nor_parse_sfdp() returns an error it means that either
BFPT is not supported, thus SFDP is not supported and the user didn't
correctly declared the flash_info entry, or some memalloc failed.
Either way we should return an error. The rest of the SFDP tables are
optional, if one of the optional SFDP tables fails, we just continue.
We would like to get rid of the default_init() hook, so the
spi_nor_manufacturer_init_params() is not called in the new sequnce
of flash initialization.

Split spi_nor_info_init_params() in spi_nor_init_default_params()
and spi_nor_no_sfdp_init_params(). spi_nor_init_default_params() is
called for all the flashes regardless if they support SFDP or not.
spi_nor_no_sfdp_init_params() is called just for the flashes that
do not define SFDP and initializes parameters and setting solely
based on flash_info data.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Link: https://lore.kernel.org/r/20211207140254.87681-10-tudor.ambarus@microchip.com
---
 drivers/mtd/spi-nor/core.c | 197 ++++++++++++++++++++++---------------
 1 file changed, 119 insertions(+), 78 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 86bbd1ca22fc..c5a5844e98c5 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2509,74 +2509,21 @@ static void spi_nor_manufacturer_init_params(struct spi_nor *nor)
 }
 
 /**
- * spi_nor_sfdp_init_params() - Initialize the flash's parameters and settings
- * based on JESD216 SFDP standard.
- * @nor:	pointer to a 'struct spi_nor'.
- *
- * The method has a roll-back mechanism: in case the SFDP parsing fails, the
- * legacy flash parameters and settings will be restored.
- */
-static void spi_nor_sfdp_init_params(struct spi_nor *nor)
-{
-	struct spi_nor_flash_parameter sfdp_params;
-
-	memcpy(&sfdp_params, nor->params, sizeof(sfdp_params));
-
-	if (spi_nor_parse_sfdp(nor)) {
-		memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
-		nor->addr_width = 0;
-		nor->flags &= ~SNOR_F_4B_OPCODES;
-	}
-}
-
-/**
- * spi_nor_info_init_params() - Initialize the flash's parameters and settings
- * based on nor->info data.
+ * spi_nor_no_sfdp_init_params() - Initialize the flash's parameters and
+ * settings based on nor->info->sfdp_flags. This method should be called only by
+ * flashes that do not define SFDP tables. If the flash supports SFDP but the
+ * information is wrong and the settings from this function can not be retrieved
+ * by parsing SFDP, one should instead use the fixup hooks and update the wrong
+ * bits.
  * @nor:	pointer to a 'struct spi_nor'.
  */
-static void spi_nor_info_init_params(struct spi_nor *nor)
+static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 	struct spi_nor_erase_map *map = &params->erase_map;
-	const struct flash_info *info = nor->info;
-	struct device_node *np = spi_nor_get_flash_node(nor);
-	const u8 no_sfdp_flags = info->no_sfdp_flags;
+	const u8 no_sfdp_flags = nor->info->no_sfdp_flags;
 	u8 i, erase_mask;
 
-	/* Initialize default flash parameters and settings. */
-	params->quad_enable = spi_nor_sr2_bit1_quad_enable;
-	params->set_4byte_addr_mode = spansion_set_4byte_addr_mode;
-	params->setup = spi_nor_default_setup;
-	params->otp.org = &info->otp_org;
-
-	/* Default to 16-bit Write Status (01h) Command */
-	nor->flags |= SNOR_F_HAS_16BIT_SR;
-
-	/* Set SPI NOR sizes. */
-	params->writesize = 1;
-	params->size = (u64)info->sector_size * info->n_sectors;
-	params->page_size = info->page_size;
-
-	if (!(info->flags & SPI_NOR_NO_FR)) {
-		/* Default to Fast Read for DT and non-DT platform devices. */
-		params->hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
-
-		/* Mask out Fast Read if not requested at DT instantiation. */
-		if (np && !of_property_read_bool(np, "m25p,fast-read"))
-			params->hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
-	}
-
-	/* (Fast) Read settings. */
-	params->hwcaps.mask |= SNOR_HWCAPS_READ;
-	spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ],
-				  0, 0, SPINOR_OP_READ,
-				  SNOR_PROTO_1_1_1);
-
-	if (params->hwcaps.mask & SNOR_HWCAPS_READ_FAST)
-		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_FAST],
-					  0, 8, SPINOR_OP_READ_FAST,
-					  SNOR_PROTO_1_1_1);
-
 	if (no_sfdp_flags & SPI_NOR_DUAL_READ) {
 		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_2;
 		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_2],
@@ -2605,11 +2552,6 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 					  SNOR_PROTO_8_8_8_DTR);
 	}
 
-	/* Page Program settings. */
-	params->hwcaps.mask |= SNOR_HWCAPS_PP;
-	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP],
-				SPINOR_OP_PP, SNOR_PROTO_1_1_1);
-
 	if (no_sfdp_flags & SPI_NOR_OCTAL_DTR_PP) {
 		params->hwcaps.mask |= SNOR_HWCAPS_PP_8_8_8_DTR;
 		/*
@@ -2638,7 +2580,7 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 		i++;
 	}
 	erase_mask |= BIT(i);
-	spi_nor_set_erase_type(&map->erase_type[i], info->sector_size,
+	spi_nor_set_erase_type(&map->erase_type[i], nor->info->sector_size,
 			       SPINOR_OP_SE);
 	spi_nor_init_uniform_erase_map(map, erase_mask, params->size);
 }
@@ -2739,6 +2681,99 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
 		spi_nor_init_default_locking_ops(nor);
 }
 
+/**
+ * spi_nor_sfdp_init_params_deprecated() - Deprecated way of initializing flash
+ * parameters and settings based on JESD216 SFDP standard.
+ * @nor:	pointer to a 'struct spi_nor'.
+ *
+ * The method has a roll-back mechanism: in case the SFDP parsing fails, the
+ * legacy flash parameters and settings will be restored.
+ */
+static void spi_nor_sfdp_init_params_deprecated(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter sfdp_params;
+
+	memcpy(&sfdp_params, nor->params, sizeof(sfdp_params));
+
+	if (spi_nor_parse_sfdp(nor)) {
+		memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
+		nor->addr_width = 0;
+		nor->flags &= ~SNOR_F_4B_OPCODES;
+	}
+}
+
+/**
+ * spi_nor_init_params_deprecated() - Deprecated way of initializing flash
+ * parameters and settings.
+ * @nor:	pointer to a 'struct spi_nor'.
+ *
+ * The method assumes that flash doesn't support SFDP so it initializes flash
+ * parameters in spi_nor_no_sfdp_init_params() which later on can be overwritten
+ * when parsing SFDP, if supported.
+ */
+static void spi_nor_init_params_deprecated(struct spi_nor *nor)
+{
+	spi_nor_no_sfdp_init_params(nor);
+
+	spi_nor_manufacturer_init_params(nor);
+
+	if (nor->info->no_sfdp_flags & (SPI_NOR_DUAL_READ |
+					SPI_NOR_QUAD_READ |
+					SPI_NOR_OCTAL_READ |
+					SPI_NOR_OCTAL_DTR_READ))
+		spi_nor_sfdp_init_params_deprecated(nor);
+}
+
+/**
+ * spi_nor_init_default_params() - Default initialization of flash parameters
+ * and settings. Done for all flashes, regardless is they define SFDP tables
+ * or not.
+ * @nor:	pointer to a 'struct spi_nor'.
+ */
+static void spi_nor_init_default_params(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
+	const struct flash_info *info = nor->info;
+	struct device_node *np = spi_nor_get_flash_node(nor);
+
+	params->quad_enable = spi_nor_sr2_bit1_quad_enable;
+	params->set_4byte_addr_mode = spansion_set_4byte_addr_mode;
+	params->setup = spi_nor_default_setup;
+	params->otp.org = &info->otp_org;
+
+	/* Default to 16-bit Write Status (01h) Command */
+	nor->flags |= SNOR_F_HAS_16BIT_SR;
+
+	/* Set SPI NOR sizes. */
+	params->writesize = 1;
+	params->size = (u64)info->sector_size * info->n_sectors;
+	params->page_size = info->page_size;
+
+	if (!(info->flags & SPI_NOR_NO_FR)) {
+		/* Default to Fast Read for DT and non-DT platform devices. */
+		params->hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
+
+		/* Mask out Fast Read if not requested at DT instantiation. */
+		if (np && !of_property_read_bool(np, "m25p,fast-read"))
+			params->hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
+	}
+
+	/* (Fast) Read settings. */
+	params->hwcaps.mask |= SNOR_HWCAPS_READ;
+	spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ],
+				  0, 0, SPINOR_OP_READ,
+				  SNOR_PROTO_1_1_1);
+
+	if (params->hwcaps.mask & SNOR_HWCAPS_READ_FAST)
+		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_FAST],
+					  0, 8, SPINOR_OP_READ_FAST,
+					  SNOR_PROTO_1_1_1);
+	/* Page Program settings. */
+	params->hwcaps.mask |= SNOR_HWCAPS_PP;
+	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP],
+				SPINOR_OP_PP, SNOR_PROTO_1_1_1);
+}
+
 /**
  * spi_nor_init_params() - Initialize the flash's parameters and settings.
  * @nor:	pointer to a 'struct spi_nor'.
@@ -2759,7 +2794,7 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
  * which can be overwritten by:
  * 3/ SFDP flash parameters initialization. JESD216 SFDP is a standard and
  *    should be more accurate that the above.
- *		spi_nor_sfdp_init_params()
+ *		spi_nor_parse_sfdp() or spi_nor_no_sfdp_init_params()
  *
  *    Please note that there is a ->post_bfpt() fixup hook that can overwrite
  *    the flash parameters and settings immediately after parsing the Basic
@@ -2773,24 +2808,30 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
  * parameters that are not declared in the JESD216 SFDP standard, or where SFDP
  * tables are not defined at all.
  *		spi_nor_late_init_params()
+ *
+ * Return: 0 on success, -errno otherwise.
  */
 static int spi_nor_init_params(struct spi_nor *nor)
 {
+	int ret;
+
 	nor->params = devm_kzalloc(nor->dev, sizeof(*nor->params), GFP_KERNEL);
 	if (!nor->params)
 		return -ENOMEM;
 
-	spi_nor_info_init_params(nor);
-
-	spi_nor_manufacturer_init_params(nor);
+	spi_nor_init_default_params(nor);
 
-	if ((nor->info->parse_sfdp ||
-	     (nor->info->no_sfdp_flags & (SPI_NOR_DUAL_READ |
-					  SPI_NOR_QUAD_READ |
-					  SPI_NOR_OCTAL_READ |
-					  SPI_NOR_OCTAL_DTR_READ))) &&
-	    !(nor->info->no_sfdp_flags & SPI_NOR_SKIP_SFDP))
-		spi_nor_sfdp_init_params(nor);
+	if (nor->info->parse_sfdp) {
+		ret = spi_nor_parse_sfdp(nor);
+		if (ret) {
+			dev_err(nor->dev, "BFPT parsing failed. Please consider using SPI_NOR_SKIP_SFDP when declaring the flash\n");
+			return ret;
+		}
+	} else if (nor->info->no_sfdp_flags & SPI_NOR_SKIP_SFDP) {
+		spi_nor_no_sfdp_init_params(nor);
+	} else {
+		spi_nor_init_params_deprecated(nor);
+	}
 
 	spi_nor_late_init_params(nor);
 
-- 
2.17.1

