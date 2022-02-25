Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCE14C3C00
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 03:54:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4ZBK5kSwz3bPP
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 13:54:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=d6PHqgDA;
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
 header.s=selector2-quantacorp-onmicrosoft-com header.b=d6PHqgDA; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20703.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::703])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Ywm16Nbz3bVG
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 13:43:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T15RkItU8/JaBAyvhQejefSUUQ71QQdYCyrxpYutpzT+ryU9B21vfy3DKwBmzuCGuB4VNWx3bja0ydZGHAqDg9tG0t4L2K9YlPFwgmkNVt0HCHu4T+LHlO40j9YYWPBM3ARMRrG4w6DC6SHL6ZGtLZXYi5nXjyMNetsZ5+rZErIikr/az3h0KZYZ6gHqlNlKjyqOAE0XsE+S9KyfLUUAn8sKDRolkQG3T5n6xE9ENcP3gHU4aqByZOVdzvBTw5wvzPlak3lxF9NqBpS17UMO+giwTCALvQLGKGcSBD3ljO5x6R1GXMQqb5Ski8PwRJP5WLo84al6FGu4UYayHcWVKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lc/fE00E+Pe4G/spJsGu1uFp817jeUUsUkiiuS+0zoA=;
 b=CmmFk1afhQGd6mV5olaKql8RRYubttNS4MxfBFsJ5pliMhEjURD/+5AayNHMtjHc4L1PC2u+sGXKOieWMaJoVOEql3Xq+WAg2qwWT475V27MmtnjAnA405scMldbs1Ey7V/kYPQcKDrBRQnn333FDUudLb0S5qtufTU5XVG2bjcDduels8VfzYdk9/S78BHWC32Gg7vhxfS87jeNbF5ueSHwOUtP5gizf3f5mTLIwDaoNKi0LnEfK+4ahLm16CQfbVFBwvLcW1BqsxQf1paAzZVi36kF3nayFqN+mFfNxcozaus6Rc8hVij1cr4vFUD3YfqIdAJMSqnGwBfH5ONZ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lc/fE00E+Pe4G/spJsGu1uFp817jeUUsUkiiuS+0zoA=;
 b=d6PHqgDAUgQt2IqRPztmygCujpQesRrRbqo6w22yC7r8NAuhatuuBxPq9+OhsTcvZP58Y7WCQEbOWkppuyJn5A+jrEaY1YwYzd34RCwlg/RIcY+rW5mp9U41r+kNUsumslAFxPgeriQ5xikimvbhJ8iC2RrvPt2cGcMRZh3dLY8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by KL1PR0401MB4147.apcprd04.prod.outlook.com (2603:1096:820:28::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Fri, 25 Feb
 2022 02:42:44 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 02:42:44 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 16/26] mtd: spi-nor: core: Introduce flash_info
 mfr_flags
Date: Fri, 25 Feb 2022 10:42:11 +0800
Message-Id: <20220225024221.19422-17-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225024221.19422-1-potin.lai@quantatw.com>
References: <20220225024221.19422-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:202:16::19) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2a3e5af-91e6-47ff-f776-08d9f8087ec1
X-MS-TrafficTypeDiagnostic: KL1PR0401MB4147:EE_
X-Microsoft-Antispam-PRVS: <KL1PR0401MB4147BDDE336DC527802C35B18E3E9@KL1PR0401MB4147.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YozjZ2H6MQdSGdZz6ZvELoX4eT6c3+fCDBCWa9fAlMUkAWU7MQqAC0gIqo8u/LrTQKRcit1LdyQp1lqxgiajIZbnf2zVEtN5BaFcSlQTSDnh/f8U5RhzjtoZuDfCyOe1gokieG/dABdHjXF/gruglLPxNMp+1t0mKc24C303mC4hf5obvMSooaCVYVo7S2QwlVhu142vDT7RWKHy9M+JtlXCBTB/piz08yzKFA8HXgRhoq2cowk93Th+0TMk19Bu15pYXD0V5ny8Uk82PQqe8S+5eYgpHEmfeYu4pXnPtNLvL49KqknmS7wehU7v7wIW6/Cula7Qgg4UaORCMoso4X/mRu7qGUIr+SmFqlA8+q4dBi8wizklQ+zcVdb98f0PlGwE8hXGsoDPTrbQqGvW/WgiiIusCbDpHXa2F9x5aelSwj+nM79qFlZlOPZ5d3FOumHOBjewTFGtky00Vw1torvYwz6xhJN3d4Qi7r99S8bTNXTrY7Rn0DOzWrH6eEOcvDOOVR4N37dGj3WFRIV2qnKil14vyBvPwNAarGpkoRUwkyX/HfpmECT8LzWATBG1spLQPqWX8OSiHNqLsAqRa+7hyddKfNK4jYST/IeUz3Rqtak9ccnGzolSxL0FBxloNIqlSm5EGhlhhXYgLJxeQfQLS4U1q7ntVsdsVc7t4KqKq7vzpUMpDSaZKmbivjVc7XmC3CM6+PEIpY9oUhDRejCrm1hC/ShPdc3aXPqvJRU7hjVpBZaOpnoYcBYxm7iTD5FQWRuAA2/Dg3vBQ77JcFF3YhXp0qa6xCcas8AcRZs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(66556008)(5660300002)(52116002)(36756003)(8676002)(8936002)(6506007)(6512007)(6666004)(66946007)(4326008)(316002)(44832011)(54906003)(1076003)(2616005)(186003)(83380400001)(6486002)(966005)(86362001)(2906002)(26005)(38100700002)(38350700002)(508600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RMjV3MfO+P4vxv0yPfZCD9Xjm3s8xeZswtXrPsF338cd0fuou2nf03Dz8JCn?=
 =?us-ascii?Q?2CPX9p5AvJ72lpmKY2aElxAcPGjrZCD9RPEx27iQSvp+Dy10elomRp5isAzH?=
 =?us-ascii?Q?EAxxQwhfFPfJ31Mc9lH4kZk6WtdDinndw8avOnITS1fEygmHaKanp/tRCJ2U?=
 =?us-ascii?Q?mN+9P4p8bS1vsnu7ZV/bXcKozhD64Ea08LbXZeqLFmsopdCbJVHALm8Ue8A2?=
 =?us-ascii?Q?J7XFp4vSMyysAglhA1aRXiwR/JiRulqHniIjLswyY7X4uDvirSdu/HdPYP0V?=
 =?us-ascii?Q?Zld1gINCsW324D3kPCGPi/F1D3hb57YDLOd8s5EwdpFK13ydW793QQ2sjMVd?=
 =?us-ascii?Q?SvYaONspWKSsYb5fSFd9084QUF/ayVZLLJuDIAdHcn0Ywf/rXSLAhU+k8miw?=
 =?us-ascii?Q?g9Mp1erY5SzGCr3dYeGBYRqk4Tuc91ciidFVXmwJva0cNuVrFZSWOOl+Zzob?=
 =?us-ascii?Q?o/diTWZ4vmM9lRucefSarW4TQvRw2qU/auzyIkpbTTJZXaeu70rPOi0F45f7?=
 =?us-ascii?Q?/5qG90LjHuCAyvnQOElkqgPsH/rDQLMeIAoMZBBqEIBjkEzAC5SmiyrsaDwv?=
 =?us-ascii?Q?1V0zo4ZbyGDMcMmR/LRQEzyjU166zp2vw0qjrgbN23+tkUbvW6wjp+Ny1OhU?=
 =?us-ascii?Q?WIVqoyyXH7ir8QWMJ4uNs9Qm3XpCknQ8O4M7+se9x5rOG4K3UUYS7vPxi7Pi?=
 =?us-ascii?Q?2uAfa1rybBumH1Sajzg9kNkBTSBydjWBhst1vBmFr/DSNP9sg+vaB/jcgAa6?=
 =?us-ascii?Q?5e91tXGvVTw51CeaOHMLtsguQW90cZ3Mi0Sc83g9tjrW+LVNoSoYVXTfnGct?=
 =?us-ascii?Q?ZDyq0dPtsm8tjgR++m0c5U9IsYp/o3NyLN1stncc8uISztN5IhSmamFwFxPo?=
 =?us-ascii?Q?8jf5hpVJv2+5ouGYWk+re3Aj+2hGYOGtWuGSMXq64BNoi+YEaGeBaJs+ttFM?=
 =?us-ascii?Q?P6G+2CiTvv3D22KmGjq/SNwfuS121FfMLBkOOYk1tDmtyAi4nGWTT4n8MSWZ?=
 =?us-ascii?Q?0mUIyUK/Y3QSK/vBlevF3eDA24fN8tWKrT6RtyMPeNlRX7UY4m+X1THXfPVn?=
 =?us-ascii?Q?vozakyN7QmuiMyXC3rDhsC4FvfrXptYZue5sN/Ze3mb28hRLqJ4sq43W4x5T?=
 =?us-ascii?Q?QENSUPPD4g5XxLbnwd8l6I2o8+K7URAXqMp8m59um8jaii1SiDxbbgFhE10+?=
 =?us-ascii?Q?4Uci0p1RQwwadz3vJAhNCjn6dBLNX2aOEvbyIeERrvKMfgvg/+N0By8vrLT1?=
 =?us-ascii?Q?3oALK7erV0CXLqA5DrWmw2nvqtkaiaf4Dr9bJp5RelyAN9SUYW3ckSchOa9X?=
 =?us-ascii?Q?wUrAzpqFj1fuydbsBkp68NtDzgfKb4LuOSo2FCUpboVhOmyJZgEzirE4AS+C?=
 =?us-ascii?Q?jVN1jP1tSCkc+3kus9PGkNmdlN4Y7WsH24LcsMX9HvR0mIXU3eVtkauXG42U?=
 =?us-ascii?Q?GiLoEg0J1/VxNaPiLb8hRTIPZfkYl13SpA6l8uhfwfbGSyzeiUoYDHiLMkpQ?=
 =?us-ascii?Q?SlAIBAuOVp45Kyjoht4WVuEi3BHBcOz2Uggsn0zxxanI6Q4XHYkZ+qnP5InM?=
 =?us-ascii?Q?hapgNGogPwUZDLCI/WlIHX1OesoLziMft5uDHAQAM4yA+D7FfLuKnW71ZBVF?=
 =?us-ascii?Q?cotVF3qxd0HDoxs8c1FmmTU=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a3e5af-91e6-47ff-f776-08d9f8087ec1
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 02:42:42.0797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WR51S7wgQTAIhZ+s1xaJDy8lvQIZmwAZPCOoccB3bXkCE4U7njwhdJfF7sAFgYYkPjfMvOcb4TMS6+nngn6S6w==
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

Used in the manufacturer fixup hooks to differentiate support
between flashes of the same manufacturer. Not used in the
SPI NOR core.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Michael Walle <michael@walle.cc>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Link: https://lore.kernel.org/r/20211207140254.87681-6-tudor.ambarus@microchip.com
---
 drivers/mtd/spi-nor/core.h | 10 +++++++++-
 drivers/mtd/spi-nor/sst.c  | 41 ++++++++++++++++++++++++++++----------
 2 files changed, 40 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index f6c4b6f4743b..a9fd956eed4e 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -336,7 +336,6 @@ struct flash_info {
 	u32		flags;
 #define SECT_4K			BIT(0)	/* SPINOR_OP_BE_4K works uniformly */
 #define SPI_NOR_NO_ERASE	BIT(1)	/* No erase command needed */
-#define SST_WRITE		BIT(2)	/* use SST byte programming */
 #define SPI_NOR_NO_FR		BIT(3)	/* Can't do fastread */
 #define SECT_4K_PMC		BIT(4)	/* SPINOR_OP_BE_4K_PMC works uniformly */
 #define SPI_NOR_DUAL_READ	BIT(5)	/* Flash supports Dual Read */
@@ -385,6 +384,12 @@ struct flash_info {
 					 * protection bits. Usually these will
 					 * power-up in a write-protected state.
 					 */
+	u8 mfr_flags;			/*
+					 * Manufacturer private flags. Used in
+					 * the manufacturer fixup hooks to
+					 * differentiate support between flashes
+					 * of the same manufacturer.
+					 */
 
 	const struct spi_nor_otp_organization otp_org;
 
@@ -450,6 +455,9 @@ struct flash_info {
 			.n_regions = (_n_regions),			\
 		},
 
+#define MFR_FLAGS(_mfr_flags)						\
+		.mfr_flags = (_mfr_flags),				\
+
 /**
  * struct spi_nor_manufacturer - SPI NOR manufacturer object
  * @name: manufacturer name
diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 3593aae0920f..8f1ebb8fd05f 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -8,6 +8,9 @@
 
 #include "core.h"
 
+/* SST flash_info mfr_flag. Used to specify SST byte programming. */
+#define SST_WRITE		BIT(0)
+
 #define SST26VF_CR_BPNV		BIT(3)
 
 static int sst26vf_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
@@ -58,28 +61,46 @@ static const struct spi_nor_fixups sst26vf_fixups = {
 static const struct flash_info sst_parts[] = {
 	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
 	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8,
-			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
+			      SECT_4K | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_SWP_IS_VOLATILE)
+		MFR_FLAGS(SST_WRITE) },
 	{ "sst25vf080b", INFO(0xbf258e, 0, 64 * 1024, 16,
-			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
+			      SECT_4K | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_SWP_IS_VOLATILE)
+		MFR_FLAGS(SST_WRITE) },
 	{ "sst25vf016b", INFO(0xbf2541, 0, 64 * 1024, 32,
-			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
+			      SECT_4K | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_SWP_IS_VOLATILE)
+		MFR_FLAGS(SST_WRITE) },
 	{ "sst25vf032b", INFO(0xbf254a, 0, 64 * 1024, 64,
-			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
+			      SECT_4K | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_SWP_IS_VOLATILE)
+		MFR_FLAGS(SST_WRITE) },
 	{ "sst25vf064c", INFO(0xbf254b, 0, 64 * 1024, 128,
 			      SECT_4K | SPI_NOR_4BIT_BP | SPI_NOR_HAS_LOCK |
 			      SPI_NOR_SWP_IS_VOLATILE) },
 	{ "sst25wf512",  INFO(0xbf2501, 0, 64 * 1024,  1,
-			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
+			      SECT_4K | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_SWP_IS_VOLATILE)
+		MFR_FLAGS(SST_WRITE) },
 	{ "sst25wf010",  INFO(0xbf2502, 0, 64 * 1024,  2,
-			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
+			      SECT_4K | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_SWP_IS_VOLATILE)
+		MFR_FLAGS(SST_WRITE) },
 	{ "sst25wf020",  INFO(0xbf2503, 0, 64 * 1024,  4,
-			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
+			      SECT_4K | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_SWP_IS_VOLATILE)
+		MFR_FLAGS(SST_WRITE) },
 	{ "sst25wf020a", INFO(0x621612, 0, 64 * 1024,  4, SECT_4K | SPI_NOR_HAS_LOCK) },
 	{ "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8, SECT_4K | SPI_NOR_HAS_LOCK) },
 	{ "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8,
-			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
+			      SECT_4K | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_SWP_IS_VOLATILE)
+		MFR_FLAGS(SST_WRITE) },
 	{ "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16,
-			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
+			      SECT_4K | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_SWP_IS_VOLATILE)
+		MFR_FLAGS(SST_WRITE) },
 	{ "sst26wf016b", INFO(0xbf2651, 0, 64 * 1024, 32,
 			      SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
@@ -179,7 +200,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 static void sst_late_init(struct spi_nor *nor)
 {
-	if (nor->info->flags & SST_WRITE)
+	if (nor->info->mfr_flags & SST_WRITE)
 		nor->mtd._write = sst_write;
 }
 
-- 
2.17.1

