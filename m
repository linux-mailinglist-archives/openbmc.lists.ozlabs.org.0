Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7206B4C3BE1
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 03:44:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4YyW4zH6z3bV6
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 13:44:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=gL+3aU8z;
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
 header.s=selector2-quantacorp-onmicrosoft-com header.b=gL+3aU8z; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20707.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::707])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Ywf2bvBz2y7M
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 13:42:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PIJ/mPzcmeXxax7IhYsX61X8jSZDheLo6auDxxH9FHAm7sVwP/0z8Cb6uv0JRMN1ol7a1/KkYVbLU+qEGjurYO53ylGy6WzJ3/0B07y3y6de6KX4zsSsLZHH8i5XCbsyFRW2/iPqgQsnujtSh4eYCSkTlgkHxpPTl9NGwsbaSIMU9bKHXEAsFqOC6xge6dwg4iet2kvcYNoVMuPNLQMMvVJ3VIFOQSOt+L+ATctBB8/T5/B2qsI2E0rSzhrq4ePv+hUnwDAkIyTl3Z+M45yxJfSMeWZqhnRw4M39Zm6g3PKUhpU0QvgKKt2K8CFr6fcpOyF9H62rCPq47djkTyxedQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xT0yaNQuBiEDIRBrOg+7bZgSXHwaXFeB3veP9LE7hMI=;
 b=k+KkyQ5U2RBJOEPPDYs+2OtNttuWL6kIAnIAjrYabeSLvyj6ZWBUHeSFbsSFIf492I/d24njWxibm0HvGFDpLj579gDv16r8paNkF+rT93nmpEghMNLXBJQeFqPnzarpGudrp8sM8XqaDkviI+g19x0qIfV3RlNgfvyw/ALTzk+0gVQIlVxY2kg/MWTsAC0HY8mPZxaCQBSHiw1AemrYtxrCJ3P5xr2i45vMTKHzkaaB/xhjnz9Vq3dDe0R23mY62ITsLe0/G+FUyXzS7rZZ/QFu/RwzrRPyD6BL/k6VhO0B+Xy5IPfFbuDG6HcY6mvegK0R/EGhnQ4R9c5qf3uZ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xT0yaNQuBiEDIRBrOg+7bZgSXHwaXFeB3veP9LE7hMI=;
 b=gL+3aU8zd2/qmuG0fv2igc2AiO5xPY1/kADoLXEk2D/c/T0v76HkJf7EBZq+yMAQJR0GQPxHeVYSNR1shqxJZwFCWQ8/Mozp+GttrFwagLb3mk6NIBW6FE4W0UpZvdIp5iJ3jWX17fLgLfhnis5NCOVLhFjuaOIaACM+1LDwW2o=
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
 02:42:37 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 03/26] mtd: spi-nor: core: Use container_of to
 get the pointer to struct spi_nor
Date: Fri, 25 Feb 2022 10:41:58 +0800
Message-Id: <20220225024221.19422-4-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225024221.19422-1-potin.lai@quantatw.com>
References: <20220225024221.19422-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:202:16::19) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9eac20b7-0f2a-4168-6817-08d9f8087b97
X-MS-TrafficTypeDiagnostic: SI2PR04MB4507:EE_
X-Microsoft-Antispam-PRVS: <SI2PR04MB45078695682BE679930D76008E3E9@SI2PR04MB4507.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n5KJnXjJ8HbIG72aihhXE3qFINswn5jZxxrm6HyBpcAhZnPDyWMOxL4K2th698lWwzvQv504BYuFdKgA2ktoU0tySBn25o5yEbh0ETzbPxvJKv79KOWK0DmQsFo5TeczubB0WNEUIBsqONJC0VMtqnvhwgVdnLHlqbphzbIXYk8YOBcuesCUSEx1gOTUt6FvsnyTjlZ4cUsYPntL0+kjRiEXAAuy/Nh4/dKtzffEjyr9ESwkmMZmScHI66AWePE7qoo1MH5QByD++FBddKRUYBtknWgWfdxerYRbzJ0r/ztYg+SB3uYktEInf0SBDoAP0ih7xi35xGT3DLwuU1Jl2xWXSHOUFqHb4+9SWF7oUO5SmXDs2HQcNg2pfJ1HMriL8oxjs39mnrynbZd2G/QKO7rQYE9BRMONHZKSFeq4kEZI9vO/0Qg5iuh8feZa70O+1fTr643f7bJHvx1ymv1ec7zRQmzMKdqc92aK4u9v+SiLWdz1LAGX06JcfqRHMpu6lBgd/BR43XZCO32AcyA3hJlSNKsu1vOl7WrtSqHNW2Dv/vvpeoVS0wXWUIf+fws3cAset5Ac3+W4CI99jSztgtHcyD3sb56DDLXx2HDb4EQNyGoj+CPwWTUyy+pl1fYN45mgcUjGoG6+r0qUEOfSyHmCm85vDmauJiDNija69Dva2zgia9phT1JGsyGzjrTda/XgyfAQIdKisa3IqrwgZbw3ZI5T1BpzsHPu082fbZC9p+2AxIOLacoK3KwWQ8ZGmeIq+DbOhk9UysG6NOvyIbzzg8mAvagvNla3oFse+SqkyTF+abrIJc8ZEG+B1s3x
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(26005)(186003)(36756003)(1076003)(6512007)(38100700002)(38350700002)(86362001)(83380400001)(8936002)(4326008)(6486002)(966005)(508600001)(8676002)(54906003)(66476007)(66946007)(66556008)(5660300002)(6506007)(6666004)(52116002)(44832011)(316002)(2616005)(15583001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Buo0M+ojbnRf1GHv8teXKrvo5O//EGrDeAilIsNjHurw8Sb9wr6buP8d4VIP?=
 =?us-ascii?Q?Qg+u5QDIv1uJAWG5LlC4ScX6lqeGdY0H3U2FXdZUwjMOdfxMie9eCU+m08D0?=
 =?us-ascii?Q?QGqGWjJWf5GwmkxQiGlHYyYGE1yaLl7OPyPi5lF+b2aCnNyWapsTCKMTLP4T?=
 =?us-ascii?Q?tV2szaC4NniU5q65FkWC2+byfpkNvtbpGnDFn3RY7humsENyorDWWSDlZ6Ki?=
 =?us-ascii?Q?pgLpuWUlu5Hba3djeRJUn1bGN+OZBpgnHJUD0PpbAXJtrtiTO4TOpdT8u1HV?=
 =?us-ascii?Q?4J72E7QTCIpGgYqOk8c8hgFT9XLMk7NzpLHoxoyTNkgZExd7xymUHJ4SPx0h?=
 =?us-ascii?Q?9TYA7hRqFPoHpOF7aIshsw9ofM3X2WB8s+8RlngQZCrOfwVSaiEQVyV7zp6p?=
 =?us-ascii?Q?VEsx67hxKj5QKYV56a7nT4mukpndJf9lVPipkjjvjAcE21BA/JcnLgi5YU0x?=
 =?us-ascii?Q?mH3VIWuz9B4wWw5RoOov1vkHyVHX7xdB6QfJmq614krUNOvuAeQsiDTOeoxC?=
 =?us-ascii?Q?/AB19Yidp/sh+wqdzeaiOjKzoRTaRmgQKlKWzn0yXG02q9VQoDAt1ilGNQnW?=
 =?us-ascii?Q?POmUBHZiyZLjCwgWZxFQuhn0Qy7/aLjDoCprpk6LkHxlhQyTR3UPbb/GwS0X?=
 =?us-ascii?Q?aMpaPNIVT5MU0GnFo8jmAXZXbOM6O2HAxgcXQJabqTXSdHrdIgUJj/AkAOoP?=
 =?us-ascii?Q?vWCz60JAf5SAxpIYEytb2Z9rlUX9XVfzI0Iy+DJQHGxka5nSqqebmnDZnWiK?=
 =?us-ascii?Q?QHkULx9jYH7mA9uG0XDE2wTCklBF2F7si4eRYDV3dG8tlCqiC65ZwI3k8M4m?=
 =?us-ascii?Q?SGAL1LW0TdioTrT57MzK9AuIv3zPPfam8ORBhs/H2/8NIQNJu2GoDeztgT6U?=
 =?us-ascii?Q?j76NcEP2QsMjqHzsToJDbODVoW4FSO+Lry/RxzSPXNFfZCpgVfVxzCWf20t9?=
 =?us-ascii?Q?J1fUP7E39z7zC6PlV8UaB2o9ngU1XMSSGWvVwIRNRywEJ6HiSwYo47HhuVdt?=
 =?us-ascii?Q?uttnu2khUfa1XNa0LHEXg9A4MleGsbHQM28B72kaqUdMdqhB6TFdqmmFj50i?=
 =?us-ascii?Q?ujXJWoyzHOT+tl/52qWrlQF6mvifTrhQJmxJZhEFIpVskfAD3aLZyGX8avCD?=
 =?us-ascii?Q?84VArEO6NCYzLzmmHU/3t21h3WZwvizTziPBaq0IfH+5AyN0LmS2Oi/e0jQ1?=
 =?us-ascii?Q?fkow3lEM2yxq3l5oNOxUO/KahTP0N/x1SgLu12lxc3pCcZi7O5CM6T31olTa?=
 =?us-ascii?Q?lLlZ7LU+8h06O3esdJWt3zCTwnZWVyAC/RJYVp7QB5LL0DYxXF0stiN2jgoW?=
 =?us-ascii?Q?Dv691g4Ak+M3ZINBdSHtvgz/GRaYksXzb0/1Qc4sGF7DCuypFQ/Ly1k6N3SO?=
 =?us-ascii?Q?YSzxnJZQMezOGsdAJCRn82LRK6loJZlKWZYv2/JNXR6kYo86rmyi+0kLrwTu?=
 =?us-ascii?Q?OudUxnK/bVBBWJVSJPqjsfDHPVNpxrw7YXE2HSY258+AseYoIpEPz2V952PH?=
 =?us-ascii?Q?5Sqvk6b4kBiyzGegTtNfLoc/TQQzZU4YTfyiLhHU2ws+3vLATOPyHm0WO7TE?=
 =?us-ascii?Q?foWUC1Ced6kPV2vTHSR3wloT6O0KPNPtv+0eKVdPs0QaXeoTgfGADhxv+9Na?=
 =?us-ascii?Q?Nk81q9BsUmeuSRODBf3ZnAE=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eac20b7-0f2a-4168-6817-08d9f8087b97
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 02:42:36.7832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oYP+PxKiLR5U1RzhL5vKsHKyPq4FWIl8pukTYI6UTPfANFmPvN6/+DjbSg+S3JHTtBGvfH8E55g0vNyhpT4XgA==
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

"struct mtd_info mtd" is member of "struct spi_nor", there's no need
to use "mtd->priv". Get the pointer to the containing struct spi_nor
by using container_of. While here, make the function inline and
get rid of the __maybe_unused.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Michael Walle <michael@walle.cc>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Link: https://lore.kernel.org/r/20211029172633.886453-3-tudor.ambarus@microchip.com
---
 drivers/mtd/spi-nor/core.c | 1 -
 drivers/mtd/spi-nor/core.h | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index cc08bd707378..277d1fde84c8 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3134,7 +3134,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 
 	if (!mtd->name)
 		mtd->name = dev_name(dev);
-	mtd->priv = nor;
 	mtd->type = MTD_NORFLASH;
 	mtd->writesize = nor->params->writesize;
 	mtd->flags = MTD_CAP_NORFLASH;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index da3fd3636d3c..223a03769950 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -551,9 +551,9 @@ void spi_nor_try_unlock_all(struct spi_nor *nor);
 void spi_nor_register_locking_ops(struct spi_nor *nor);
 void spi_nor_otp_init(struct spi_nor *nor);
 
-static struct spi_nor __maybe_unused *mtd_to_spi_nor(struct mtd_info *mtd)
+static inline struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
 {
-	return mtd->priv;
+	return container_of(mtd, struct spi_nor, mtd);
 }
 
 #endif /* __LINUX_MTD_SPI_NOR_INTERNAL_H */
-- 
2.17.1

