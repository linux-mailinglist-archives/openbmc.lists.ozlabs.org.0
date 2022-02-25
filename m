Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3834C3C01
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 03:55:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4ZC610q7z3bTd
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 13:55:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=I/rijaXU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:feae::708;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=I/rijaXU; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20708.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::708])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Ywm4wfGz3bXg
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 13:43:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Obwp8V0q2UaBOFSdzeKMsi1yScb0DuULJMUJfo8b6k3GiKBCjLsImusdVNEdSFfgtHViIBbMfdTmIpHNtk74MXDUCIUH5ssxTqn8zFAFytxnxzlHZNe1dxG6YVxdX3QwCqD/8mM8FXx2g3tuzIw2cCO7SHhKHIwI4h3K9LKgOxdk6ueQppOouJ07KR7ns9Vw1cwpc5DiXKnYHcwDQDURtX58L42Yn/H8bmqQ/Z5WPr4mFwnATOsw1ZVGrRmBSqdGz2lqqxu+twwJj/KmmCDVdjJYCUE3E1r8lTHiGtW/IHtLeFByLatuIHLMnsudJ3Znf5eBXA7LcGMCHzheWiqG8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNDuOqvBcbZbgNIfk79qED9SF8LMzsZKJdecw6/N9KA=;
 b=AMH2a+abJf/WVX69h+DM83gdhTbBXyyMwxMVx8nrdV/LO4dEMOYTRX7FDyC+Qse9/NnhHCVsH/mbSH5BDxCquhXpmiOJaszCNP7kzTXbJT1KkycUbSmcTH474SFanq7YlWFhhcn8rUww02ghc/e+jYamwsnDke/l1htkIStyPUL+M0N+edf4Biao36qMSoZ5Kv2F5aC+Ltl1Mr60VR39VA8Mv1Iga35zPEylWFLlnHMBILKLyDKRm59ae4RCV3S7NhESYrt9yi7KozrTU8soMb1jeKrDZGMfeqrfPmIPa3zV9IwdqKmPdBKs5ABuiy3Nixpv4MA0JJo3X5grgLl8UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNDuOqvBcbZbgNIfk79qED9SF8LMzsZKJdecw6/N9KA=;
 b=I/rijaXUb5AjXuhLfTpmgILuLgPQ7hjmXLOC0FB+mTD6dMR77dzfstewSto06aZtslWyTE97f+FXBLXZR4FOARGO54uNV78JQIK5qZKP2e4n2kBhyuw8EN/C4Na4HZBb/SptOjuSNdB8YDEZuNFfXOGAB72I1C+kP14dSXV6KDs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SEYPR04MB5644.apcprd04.prod.outlook.com (2603:1096:101:51::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Fri, 25 Feb
 2022 02:42:46 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 02:42:46 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 19/26] mtd: spi-nor: Introduce
 spi_nor_init_fixup_flags()
Date: Fri, 25 Feb 2022 10:42:14 +0800
Message-Id: <20220225024221.19422-20-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225024221.19422-1-potin.lai@quantatw.com>
References: <20220225024221.19422-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:202:16::19) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f1f4a06-00f9-4893-eb24-08d9f8087f7b
X-MS-TrafficTypeDiagnostic: SEYPR04MB5644:EE_
X-Microsoft-Antispam-PRVS: <SEYPR04MB56449E6F14A2B680165A2C9B8E3E9@SEYPR04MB5644.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c9bvOzCMZHFnhEOjNaMVWg5L3Rjfadz3wYt5/R2FHVm8IqsiZutZy7F476gV9SEr1iV/uUDWUg4FGidQP+zLeSbICihkNxm4ZGPWnwqZJPgOtoQ25ThZ1YLFIXxY+LpRTEj+1x9sYxKiKO4o3zy7pqG3FMsCLMlahe6xkbYKkJzK1UDh5ruF9FbaOhBPPwzOXa+7u0OX6+XrvHajpyqOUXa0BO4eQfMaHQZH9OU/jxi6u7YV1pTAhP0D0SkEgqbg7gk/M0MUkU0Z5XPdfrCnbfvxT0o6e92Kosxt6JlyrN37Qi6X10L3ECBAhRXro09n7AtOckrdN38aSfgpi96aUX5quBuPUrMCsaj5ttedaOterJwq89OuHR3SlcJv/wupqb5UNyVSpLYGahddydUqd8K8Xf2/qzd/aPz8nq9kY3YRx6LCkmbbFL0E9B5Qpf2F8E6mkb04BXKNMP9ri9Lit7zY3UfZIoMj0phtM8cksWZaSeLWhb6RWCicM6+UiDsit0Yzt4NQKSulxM28kyZ5pCptnvma6I672Z57qm69tGCkWUav+fc3lO73SMDgPJ3PSdjQcHbI0QNDj5ePKGKUc8IP+rPlQbTFSdILHFCtwE+6cKPTTG72OkLtizHCysZoKMHeXG33hgO8CU6Pzc+wXVdeR3LJf4yLPT3mZug7iHMg37jTre98hACsT4ieLE4c5Y3+0zyOyfEIVo/Q5mLrMYeMvKD69i4n8fLvyxQIfHwKDNyemVJWiklIRkpo/6kfPqJqSce7OajGpXXB5Txjfeip951DiXo0hP6ChiLkBXE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(44832011)(36756003)(54906003)(2906002)(6512007)(316002)(86362001)(6506007)(6666004)(6486002)(966005)(186003)(38350700002)(52116002)(5660300002)(8936002)(2616005)(8676002)(66476007)(66946007)(66556008)(26005)(38100700002)(508600001)(1076003)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DXBiJbVBvHsh8LZ4YPyJ7rgVv+eAZkDID4nSNrcCQg0QjqPcdbsqjYlhi74s?=
 =?us-ascii?Q?CStMp0ZX+zV4JB4w9vS909srg69bZ9YF/BQ9lk0SIZ+DihZmK3zQ7RXhte2a?=
 =?us-ascii?Q?fsCV5YN2z/yB5PfRSQLHksVU+w8aoD78aIHbOCjNUGTjt4Skzvp0ihBrS4ck?=
 =?us-ascii?Q?idaghCucO3ZpdJ2erV4l3iONlU6/r6gxU3Mch6rbKk5KDRsQCBVoCXGPlXvc?=
 =?us-ascii?Q?q8SI58/TgSwWSaJ0NsuSeig/VpMXQRveIy6YiOtKq/ZIF1xPuRIzQFwiKbmZ?=
 =?us-ascii?Q?l5navbAFIqpjtDWpbxGdE0PbebMwzHkI0oEWGCGn5HWBqsdtkVOtcME67MVO?=
 =?us-ascii?Q?AfFWo2UmJMYxGfc962RntMwZ5e6iqRq6B0V8mjIw+KrdN7LgLI9Rka6zv0iT?=
 =?us-ascii?Q?W/eAB1o/Ju8nGJpMwnM/527+eiL/bCRi91zxWf9uq47EWR19kSluTSiysJtf?=
 =?us-ascii?Q?WoXlMXf3AxPKlzs7Wv988u45bSY/eExglEp00RC6AUsZdX8MiOBDainkK9vT?=
 =?us-ascii?Q?qI/Dy9FqOalyq8JRaICMhxdrdF3vhBBc2NQCpqY6IvzEBku6TXDVsZhKuht/?=
 =?us-ascii?Q?2IHDrTMZuuqU2/E6/BTvBRB4Cc91IA7zqd4wOLVtUa2t+8/93HdrjZeHzmkY?=
 =?us-ascii?Q?0ZL1tp3cioaaSf5ey5ndq0tSn6vw5nUEqKYQFyHWRVbn/OYh5f74dT9p3hI0?=
 =?us-ascii?Q?pVuen7V3YSMB+APP9/qkd5RtHjFFDfHsQb9eh2jo5ZM43UgcjAL2iNca9E65?=
 =?us-ascii?Q?aEEi22ZloSo5HnmvxO+5P6EkPyaZ+RQ0Q/8cV2k4H+jId4cNhvuFZmDUCC/n?=
 =?us-ascii?Q?qcf/dS0h9EWY5kwQiYnH+jhn8TVtgoUg53uQjVu0gHdKVEb4Oz8kmieMqgTW?=
 =?us-ascii?Q?gW2zlJgPq8gSLlNAGtwT591mvZu2U68xy8cXJxiUieB9xIMu5BdgzTYrA14W?=
 =?us-ascii?Q?4zcX8mF/A0qEGr0ViIDf7AFBla9agnp0rnAMJwpYCEO9sN+kYGsX2VbSgtac?=
 =?us-ascii?Q?8/lpzrO3gRh3rPEq5gzZ4yeQgf4FqFfYA2xTmMQEAW3YkOM/YH4JOt/Y+x6g?=
 =?us-ascii?Q?GCqqbectHpdTInnNDUbfFwOLQvVRtxlHA3QhVyCLsgYJU48ZcREtAkOZ2NGh?=
 =?us-ascii?Q?WUSMqQKxjNDI8lePUGaZ9Qjkegr6CTYEVhLtaCME2Tbf+xTAxjNvznCPicyC?=
 =?us-ascii?Q?YLee1wIOYFdLkgMXoDw+OfWZPk2S7ovJbeYz/pNS6ap42o54A9T7YSa26+ts?=
 =?us-ascii?Q?iiRKW9uqj6Ik+uHBQw9phzvtvYJcwGFvD0gZ2m0boBtQx1+7Yz2TmfrAqzu3?=
 =?us-ascii?Q?6h4ZKyiQUJ/Ot8PLcBrikkpsBpqE9xQHJ3OG3HCJiq3w07C4IgrY3rx8dN/y?=
 =?us-ascii?Q?Pngb5yoUhgb9Cv0ESBnXJDHTaJDJZfAk2KgNDkNj+niRLIv0TCpxcDyXFSDi?=
 =?us-ascii?Q?yKWPj+zdZofag1s2t/RKLAU327BtNEPs0pmV2R75BLhEt4Ko9FLa80Ni3N4P?=
 =?us-ascii?Q?aS2VuFRTqjENLdZlg1aLuLRUyX0YU/Wof2wuYIIzxJDrjXFPUgg5n+WS1oWx?=
 =?us-ascii?Q?OD17He/lAU+V/PVAbiv6xxrjMs1kEbrW8e0Sa2EPQb7AQO/tDv0T2Wtncdbw?=
 =?us-ascii?Q?pRrE3CNZVWC/NctjLCnLDK0=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f1f4a06-00f9-4893-eb24-08d9f8087f7b
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 02:42:43.2983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XGmSQ//RFMkf4KJBL9jezyi0mbCrkuA6xiJbYTW9CUWtrzJoyS+HOXT85jwwPQitPX4JZ/PyNIPYjW1EfXRJGg==
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

Group NOR flags initialization. Introduce a dedicated function for
setting the fixup_flags and emphasise when those flash_info flags
should be set: when the SNOR_F_4B_OPCODES/SNOR_F_IO_MODE_EN_VOLATILE
setttings can not be discovered by SFDP for this particular flash
because the SFDP table that indicates this support is not defined
in the flash.
In case the table for his support is defined but has wrong values,
one should instead use a post_sfdp() hook to set the SNOR_F equivalent
flag.

No functional change intended in this patch.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Link: https://lore.kernel.org/r/20211207140254.87681-9-tudor.ambarus@microchip.com
---
 drivers/mtd/spi-nor/core.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1ac7e8de4b8e..86bbd1ca22fc 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2692,6 +2692,25 @@ static void spi_nor_init_flags(struct spi_nor *nor)
 		nor->flags |=  SNOR_F_READY_XSR_RDY;
 }
 
+/**
+ * spi_nor_init_fixup_flags() - Initialize NOR flags for settings that can not
+ * be discovered by SFDP for this particular flash because the SFDP table that
+ * indicates this support is not defined in the flash. In case the table for
+ * this support is defined but has wrong values, one should instead use a
+ * post_sfdp() hook to set the SNOR_F equivalent flag.
+ * @nor:       pointer to a 'struct spi_nor'
+ */
+static void spi_nor_init_fixup_flags(struct spi_nor *nor)
+{
+	const u8 fixup_flags = nor->info->fixup_flags;
+
+	if (fixup_flags & SPI_NOR_4B_OPCODES)
+		nor->flags |= SNOR_F_4B_OPCODES;
+
+	if (fixup_flags & SPI_NOR_IO_MODE_EN_VOLATILE)
+		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
+}
+
 /**
  * spi_nor_late_init_params() - Late initialization of default flash parameters.
  * @nor:	pointer to a 'struct spi_nor'
@@ -2710,6 +2729,7 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
 		nor->info->fixups->late_init(nor);
 
 	spi_nor_init_flags(nor);
+	spi_nor_init_fixup_flags(nor);
 
 	/*
 	 * NOR protection support. When locking_ops are not provided, we pick
@@ -3147,7 +3167,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	struct mtd_info *mtd = &nor->mtd;
 	int ret;
 	int i;
-	u8 fixup_flags;
 
 	ret = spi_nor_check(nor);
 	if (ret)
@@ -3197,13 +3216,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (ret)
 		return ret;
 
-	fixup_flags = info->fixup_flags;
-	if (fixup_flags & SPI_NOR_4B_OPCODES)
-		nor->flags |= SNOR_F_4B_OPCODES;
-
-	if (fixup_flags & SPI_NOR_IO_MODE_EN_VOLATILE)
-		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
-
 	ret = spi_nor_set_addr_width(nor);
 	if (ret)
 		return ret;
-- 
2.17.1

