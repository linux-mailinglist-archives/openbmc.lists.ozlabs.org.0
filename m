Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C094C3BF6
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 03:54:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4Z9W4jhLz3bTd
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 13:54:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=KMvNhDAw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:feab::71e;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=KMvNhDAw; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2071e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::71e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Ywk5k4rz3bPK
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 13:43:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GCK1ZqXs0ytmFhbq6A8ijfMJgFgOilGRRfeuqpLkC3YoQ19z1g7Z8N9+dd8lH6nEaPC9C7pyM0cM6xylGbOy42Gum0/BMAgTjg+MYjT0WzAXcE8G6NOjh1N/lrjOBy4ZZHxtmtby3JtBrtTMfrhu1ztM9UF3Ld7RFsQ2yjezdWugMr1RScmQnz5q2k+pe9rbS8UUGyb/8Qird4Sk6R+0/XeAW9C/+C/deIG+zbPltYAXiABcphztyvEJUY+rjfmPY7oJTuYZb/WBDMQkQLl88w+ZXnSquzh2Dmtp5LGYOt0OZQtx7ArB6Q2S+a6bIfzDaDsFE/r7fYOsoTf/qe9x0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JhP8JUIXGVei434EI8OY+9ruJdvfZsBgyCOlM9xc3o0=;
 b=iwe6vYSOxH2zbibqDC0KOa7SNWcO/aYQ0+BcxKDca1zS7HDjDRlG8YmSVkU5p6wtRy73ZTNNLyJltHCbD4gQIKu1y1ak5en/VDdpzCzlbMQh8DRJ5bBRjvXXzimMn3RWqB6NNBuRySUC9hhCEON80YSbODQdCsxIsLbKuG1W5P6WwTPz+R/pOVPSfTOhNhiY5Xz5T6XX/8RleKWeX8IQ4qd2ntyq0XXmCVr7A47VAMTLohwr034MNRY1jfz9G+kv98SgNyc4z7MziG5Jc2FX+n8QoIdy5Lj4k5KyAxVecfCE7T/HB53ADPfCNCnLF5eEcyd7grHpSU6xPbRDF9jITg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhP8JUIXGVei434EI8OY+9ruJdvfZsBgyCOlM9xc3o0=;
 b=KMvNhDAwvir1hxH1wfWjM2caD4na+DuzctrvhJJ4HISsKpZ33xTu+xUyWls1T1kOgbRGfAtvqdIyuyHXkUZiDCTTFdD3duBUpbRFm6VdC3pG8dv40LGXUBnDfHfne7g+xkF1k/XiUzMC4V95ISLbZopAJyvLkiJLBIw7HTXBICs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SI2PR04MB4507.apcprd04.prod.outlook.com (2603:1096:4:122::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Fri, 25 Feb
 2022 02:42:37 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 02:42:36 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 02/26] mtd: spi-nor: core: Fix
 spi_nor_flash_parameter otp description
Date: Fri, 25 Feb 2022 10:41:57 +0800
Message-Id: <20220225024221.19422-3-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225024221.19422-1-potin.lai@quantatw.com>
References: <20220225024221.19422-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:202:16::19) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9d5d37d-0045-4e6d-bc0e-08d9f8087b48
X-MS-TrafficTypeDiagnostic: SI2PR04MB4507:EE_
X-Microsoft-Antispam-PRVS: <SI2PR04MB45070D3BCCD2C04ECBFF25CA8E3E9@SI2PR04MB4507.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 30YEM1sqYqvI2F3DQ//FNJVncYyQp99oeV3GMyjIAUtcmwpHNzN1QZ/PFyTVspbLss0KzSqBVFIvxc3z5E7ia/CigvIn0enxZEsbzVEgPoeGoHXxVnVgbHoxCK2xnIIe0yj652xhQI5zeg0KSo5Kl6KBybSavvn7vEDVSx41GL9lSR7oRkqheNnhebSAXk91GyqoCad9yI0EOKNi1gLoVemeF8f4YgyhKepb7rY14syXe2bSFxvYLRwcMDjhDs1ChWgdMBkmyrjAvSZWu//iviURZdzY4GKbx8EfHjAcjmZiWl4tpLmLC3S0wTqwEcsJwXEP/teOYwF3FXBsjXg0qhu4gdDCSJmoZMYQa36M8E7/5vUXXAn0Pxtz9TGP6hFvxyzKSOYjj6RZP7mZNGeYzvlJelpwa9odGL+H9nqDOD2m01cWFjN/iyqllOLC/p4I/6dwq/4Um/FYwpuD3ldvV9UfSAg/8mmq1OzzJIeQnHuO3eIa0id22lwSOZwkzIuIiJ16+iGvnNcvqNEijpNn4Itp/suF9FVAXMXF9DMXphULpFUQB3EPDJ8Jdls7NRaEBd7eCuEqSyCAA/p0MCuM3iQbZbA+d0+m119wj2DZf4dKKI5PbxScVBAY45hGOhMtafGRHu1bzzyvRsYRVEkMYIuNujXHNfgbt/CHVP+F0OIJR01COje9RzqUN9C+70J7o5WhrA+T8ecDCCsLNcbZFue6HZWUEp45Aq+FovnlEdLlY1vsZDmooXrIhzCWPgpm76SC0NhJNx0rUGt20Y/gO8xwNh7meEFQpfHU1HSUbjA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(26005)(186003)(36756003)(1076003)(6512007)(38100700002)(38350700002)(86362001)(83380400001)(8936002)(4326008)(6486002)(966005)(508600001)(8676002)(54906003)(66476007)(66946007)(66556008)(5660300002)(6506007)(6666004)(52116002)(44832011)(316002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kLKXHlWcPruli42pwjZpzydUcw+IdJllg1PHWKa9VhQM4GHZn7ZdlFsCRLj/?=
 =?us-ascii?Q?SOmqqUdIZAVSvZLg3v5228Mhgazjba1vivvS97X32cn4DNMnn+JP4LeVICcs?=
 =?us-ascii?Q?BlRVmWzbyrxzTm3FQd7T/CJn1WsnRV2DicinKWGHuqgtEUesX469aJZeL+wS?=
 =?us-ascii?Q?RfgFHrJBDF4jrCpuAIsB/bK/cesTbZIs3GSrlgbJm7+P+0z0o2UKUuO1W+UR?=
 =?us-ascii?Q?zCG7GTq2HvOppwFGGG/FEyZr51Nt7bjByiP3siRoqo9hArD1esksnKwxqT48?=
 =?us-ascii?Q?PTQv6Rkoxs//ROdaHe+F6/cPndKG8DLsNV6VRRF/U9WuVAraQXU4sxkLsllD?=
 =?us-ascii?Q?CVKpFyR/jQECTl5fC7iGSRprGhg0MZbPAGhfHNoc/gryAh6XvcN8a1BUdL4C?=
 =?us-ascii?Q?qIvwCNxN4x1u7cZj9ayiaMuX84ZFGHigImAMKU91Y8pcVh1Bgfh8efqxXzZi?=
 =?us-ascii?Q?pxRDnENnwYUjcvgMksEUve6lGBaNXtMewl2j125pHWewqp+g7yqq6dpOyYh4?=
 =?us-ascii?Q?uPWZltxIXC8LnbrSD+AEPXWLQQAmA5btsJLm+nOuBuPoZi2qwpCOmBkduQ6Q?=
 =?us-ascii?Q?w1jXat2dAu7wNManm26mrIwGvtEFIX5bWDKWTDkb0w3RB2Iv7T1zAvGkCB09?=
 =?us-ascii?Q?RwrY/kvmgDJRohGdk5B7Tc1BHTIIQuUYSTQjpewu4zgahqBCHvBVIjb1w74Q?=
 =?us-ascii?Q?M3lJL1uG2ykcpUYq44XoCdLJzkeDiFHLFFpMK6yxSvd+n4BJcYWTEMpAwCfd?=
 =?us-ascii?Q?8uqt4ouKYGRVTW83bfhldIPzqdqrhlwKU0O6ggvPtXir9EtZ12AA1yIuAjkd?=
 =?us-ascii?Q?PQSx6/rYCkMuO928uf2XFzOIRMWV+srexzIuKCxOLCoJiubEqh47iLNYrCku?=
 =?us-ascii?Q?8mqXHeyV4ti0OyyWlPfcjzv+JzqOHWkdsjFB+IGyr0mfYvqHD0A51HU/SijG?=
 =?us-ascii?Q?RS1GhMCgG/OvS0uV1bax4v+oR6ysiAhGg2I8yAAxFleD3iPqtZ1XdaeULpJt?=
 =?us-ascii?Q?+9HFP3s2QxZt3yWn+F85Yk3j1CGJlDSnGlS2lcFFsWPjXoUeRXkFCHl/hnmG?=
 =?us-ascii?Q?9ZAH9Oz/qlwLulTE91pQOwDtZJixd05+mPFPPPl1MVejW2v1N5e/B8K47Sj3?=
 =?us-ascii?Q?pZhTWGa3CRBqwgo/WDXbsW1XLW8TLrxpKIjRStiHIHZDuXZyXem44hLOOxEg?=
 =?us-ascii?Q?YBaJ/EBBRvsjqCGYRJt9k1Y3VKBLkffZKmLK3K7zCM/EG+Va4LWlJdBvdzuK?=
 =?us-ascii?Q?v1D3Wy5B+D//vAwVMfDkTR0psKb5+wKTEobDz58A+ecoLaMb2xXVBqJPLwsg?=
 =?us-ascii?Q?PnOQTaWmVQE8fW9uYl+qMPySFB2RmnZU2LFwEL4Ma6lYGgtwV9xCblZoaYyT?=
 =?us-ascii?Q?z4TpFAZLct5UQxLfWaE7Vxx3PWeC87Oc3Ukr+tdKcNFknpT4DO0NY1gdocxB?=
 =?us-ascii?Q?ecm8tV5q2A42axE9Q49sinStn6VJVlozRSR0aPQjOOHUaNgeMs5LaF12LTCl?=
 =?us-ascii?Q?V6D2KNDk9ps3P9j37iPhSvMV0KNPScOF2V4XF/Uirqe1ZTbVWVFc8Z1cQbVe?=
 =?us-ascii?Q?/RA7bZRDTp19XZXsWaKpoaanH03me+ghXVWclzBs5j1YK62kyZsYzwGdENfM?=
 =?us-ascii?Q?2acGiw+F0rofl8M0gGFbyjE=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d5d37d-0045-4e6d-bc0e-08d9f8087b48
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 02:42:36.2520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KIlsrTdKrWFAi+QB1A4IPdP8k8l3HDgcC6kYGTwIcoYIW0xlFMvMQrnEIJsCKd6adpQLwADGXqQ57f/3aRkGZQ==
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

Update the description of the otp member of the
struct spi_nor_flash_parameter.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Reviewed-by: Michael Walle <michael@walle.cc>
Link: https://lore.kernel.org/r/20211029172633.886453-2-tudor.ambarus@microchip.com
---
 drivers/mtd/spi-nor/core.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 3348e1dd1445..da3fd3636d3c 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -250,7 +250,7 @@ struct spi_nor_otp {
  *                      higher index in the array, the higher priority.
  * @erase_map:		the erase map parsed from the SFDP Sector Map Parameter
  *                      Table.
- * @otp_info:		describes the OTP regions.
+ * @otp:		SPI NOR OTP info.
  * @octal_dtr_enable:	enables SPI NOR octal DTR mode.
  * @quad_enable:	enables SPI NOR quad mode.
  * @set_4byte_addr_mode: puts the SPI NOR in 4 byte addressing mode.
@@ -262,7 +262,6 @@ struct spi_nor_otp {
  *                      e.g. different opcodes, specific address calculation,
  *                      page size, etc.
  * @locking_ops:	SPI NOR locking methods.
- * @otp:		SPI NOR OTP methods.
  */
 struct spi_nor_flash_parameter {
 	u64				size;
-- 
2.17.1

