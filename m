Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 539D64C3BF5
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 03:53:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4Z8h3Rcyz3bSh
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 13:53:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=Hv1cq3M0;
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
 header.s=selector2-quantacorp-onmicrosoft-com header.b=Hv1cq3M0; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20707.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::707])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Ywk4pvLz3bPD
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 13:43:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8XdrHurkD0Z6z+AOjTu6GwTE0Huj7+FsKt6KJ1G3DsUwbVOh8jwQ3eIMEsMs+xvcpDOGMsM3ACxWOc3U11Z3Kp2oQKOgiWT+p/YnrdH+IIf/elqkgm1MyyS3IUpydYZjPx2IcyUPI2THwgzhRdniVoNc2y6Lj3KRXuSwwZvYUWrTEuJxl2Gawl5wS8THG0TZZlHMvscMmwPbabWDeQ5AzbbtWOsr9F1MHNvBtk5ytXCG9wD/wikPA2nV+9qHyz1fxwnZDWUTcpZVemrwXf+F/nGMVMaw9pyTAoXrqfYkfvKM0Gr1XCwDWP9fh0yuaBAvXZNaznFY0SfC3jD73378A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRvQvUPzXCbO2HGzAuXRsqZ4r74YsqcJamf1/q4ZwTo=;
 b=SIinybDQNIx/3IoD38zTQ+ixPK6VtyjPJgytlj+LWzyX5N/zi3ACvxuAjeQd272NC+3nZiGEeExBksmyepTrvyOat2+rwE/pnTPAyG8XgMEZnOqJ4Bf7SD0/UCUuTdyjwLucdKrTtY9F/OXVzaryopeCxVH39urIBTj1eRLCGCZ7xwp0Jkcj7TCZMW8OQFCEQZ3t/CmVaUHUiYxnckoq0e6vHNdov5fFuzwkSQ/BPt+SYND9l7bRnoa59wQIVgKjAzsZjJItsciEmoerei6IbU/jX9Zf5cU9/iCsayzSGcPORSMUb7vSgQYpJ/rMQUacqTw8fIWMp71wDy/FMuCgzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRvQvUPzXCbO2HGzAuXRsqZ4r74YsqcJamf1/q4ZwTo=;
 b=Hv1cq3M0DrwqjYJ85LaK8/92twD5U63Fh3eeRJYdmCHSDwDEOuzmB1XtDOW8v7KKVaWur5wnZJYx5dOA241b67OiRJ0d0jkZHs8dXgtyEnu8wtrrynuaRLhfaBrIRdqznLWHQvaVKf9ta5kSYRwiqhxD0pgGo9Jvy8mpb4n2xHE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SI2PR04MB4507.apcprd04.prod.outlook.com (2603:1096:4:122::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Fri, 25 Feb
 2022 02:42:44 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 02:42:43 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 15/26] mtd: spi-nor: core: Call
 spi_nor_post_sfdp_fixups() only when SFDP is defined
Date: Fri, 25 Feb 2022 10:42:10 +0800
Message-Id: <20220225024221.19422-16-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225024221.19422-1-potin.lai@quantatw.com>
References: <20220225024221.19422-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:202:16::19) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 604b8bfe-343e-457b-4b65-08d9f8087e73
X-MS-TrafficTypeDiagnostic: SI2PR04MB4507:EE_
X-Microsoft-Antispam-PRVS: <SI2PR04MB45079530E2DDF8D4883A0C8C8E3E9@SI2PR04MB4507.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O2uBmggnEHNXymoCIMoB98MztjNNvuYaPsdf85rW7vmExpyFfDYqhWjpQyd1XHztD2wqAKeYCzTT61VPzHVaRIIUPGr+Ba8klX5qg9fVP+bYXocqfpU9eamaA/D90mIP/t+jwiTuA2fBhODcQVjbHl3GMdrTEfI/nF/RBe/vXvTnTgAHcUgnfaj6YThmOR8O+tWiRVvF/Q8ME1Af5ts+rqDvq+0D3tBqeYhndMNT2uAw+RzpCDNEQVM1ZBn9C1gheP5hZYOMrXB3NYQhpVkc86jl0ui3zvbEZ/iMA6GKVeyPsqg9429WEex3YAIsIcxta2Wf3pvMJ1ovZXbiXZ+eUbyDwSQJAwRPJM7H5+au1Tx0VKh+jRtGw/0sxjlCJlH8LElLOVd8TaJpEoKnETnEo3coNtA33xJN20FFS2GDodnJct6Isvd2t6nqjglZji57BYPStq1qJUh769atE3KblN/edb/O6TctVAABQltrobBUDFM/4GyvxZsPtQv+BiuZmd8OgKZKy6VCX0NaE5QYAE7VzRplK+uj0gejVQYbMBudfDwGm69XMVGUs80xufTzf0eplbjDYAIu9rWreIHUt0D2ruBwCHIj4JmCWpBE+sRdirtzMKkLpSeuy+ang6yYp+eDEemrcCe21ekLo72f3SnNoRhKS648JgasxBo3UxP5n6pcTBvr3F6WaxXU0VXvJqnUynbDABsP/92Zfj/d+ryfeOJv8PCJJKZeolZ0NB/L2+yk4lLDhpvkWN2F9ytzZ3ae7hdBm1reCXhNzSSA7d+1RfY8HWcHizaYMo3D8UA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(26005)(186003)(36756003)(1076003)(6512007)(38100700002)(38350700002)(86362001)(83380400001)(8936002)(4326008)(6486002)(966005)(508600001)(8676002)(54906003)(66476007)(66946007)(66556008)(5660300002)(6506007)(6666004)(52116002)(44832011)(316002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l2VU96ZRO/9oQ7/R9kNUIxWewpOWd8hdzZQHXJvSMi4OEotRdilDsVoNUf/n?=
 =?us-ascii?Q?pUsSyYxwZI5MRdJgNS05T6E1kawEXP62R70uXkhIsZVb/LB+T0dJfPKVCK/W?=
 =?us-ascii?Q?+qrsvYFnUEUN7k3FRSe9MDEc/7silAsaKPJutvSOWNZ/AzHcyQkuSk/iFPLz?=
 =?us-ascii?Q?cejMQ6OVeqVDd3jm6u9EVKruJnKkvIdINmhqKm8xUILbUXLkYRuGZp10sV4v?=
 =?us-ascii?Q?v1ACs5/uxLi/zbyIqvCsxsOOhe+3+aTqzoajdkHAlf7pnFoLTa629cjMESAW?=
 =?us-ascii?Q?v5PVoPLausUykxCNTFTwpry7DHN5c44TnazSPeU4a7RXS22//RP43p/MGS5a?=
 =?us-ascii?Q?kCCpjbVkqNYYeQfW/VfBAnbV4XMSs81ofiKP1EoMWMv44RmT9uu3ys02T6n7?=
 =?us-ascii?Q?t9C+fzmB2np1bZuv9zJ2N2mOZcSwmeQ9v9/Bzac8td8I8mlXCfJrswRuq9HL?=
 =?us-ascii?Q?ykjNOtsgN8ji7l+Fefi2gaZfJhW8sySVRpQhdNaN3xlcUMedFU7ylun1Io1L?=
 =?us-ascii?Q?qkhCRuqlDhINfjA/OH+jp8GdeoM9dKeF8Lbw2vUB0ZQzZmb3fkCAysB7QPtR?=
 =?us-ascii?Q?b3SiKdsHmnzQV7HF/t3pMzTizqpWAcmh+RFJoriUQpbQ3JBLWTwx3NPIOOHN?=
 =?us-ascii?Q?BT5FqMwoUlEbP0HUMix+nTu8jHtOTr2yUmBj9HAA1xmiBvlbIrvyZcJGMSkP?=
 =?us-ascii?Q?yPLJdAM/5ZuOHmm9lYaQob6KA0VzmgSUKjResG0Rtk0SdGLxDs0tntagxOtM?=
 =?us-ascii?Q?wbjtcquRCKA/KPHNrQz3yteBsztISF38XkGRWCJyGjbLqO/VkbtCZRN8RCY3?=
 =?us-ascii?Q?jprlRa+ocus9PSKZ6A5Igx5mSyaS0txJD4eglneJtp7oF1b3tqKFTIOmaArA?=
 =?us-ascii?Q?KWBTwzmwp/m2xDjTP5Cr31kYZ3fZ9cIASJhZIRmwBUFSgtwUO6j7Qb+efBoB?=
 =?us-ascii?Q?tCeJXi7bbtkX7nNkx4cExmhGR/oB3ROqD0SOafmbLbUPZhC1hi4jM5atbHo6?=
 =?us-ascii?Q?Fth6tczeoelHGBiY9fEZ5PTM8E4M8R/v7rVNExnFjVwQglRcM3kSlGaXczzV?=
 =?us-ascii?Q?PCgcAHolgLDgP7/EoNtjmuxwHupeFU1gBGalux6Rp7KS95YX3KTyqvpvW/tD?=
 =?us-ascii?Q?WIeF2czMyBIyXXtts+wRfcBmbkiZQHoHWm36OZRXTkEIpFVBrVrl7LW1okmR?=
 =?us-ascii?Q?jZOK0NXcT50358+7v+38T9X6fse7jYtzq4cakZUmuh9TJByWjslYfuGrQhH0?=
 =?us-ascii?Q?ClkKg6SBLunQFm1XcycwA2qp405qOGMKNh6/CwfxxG5Z+wnx+d14j80JhhqP?=
 =?us-ascii?Q?ub87+rRJzGl5JJshYIQBGywTIU7S+WG/PQdzY5YmhiIkw8OP0r1XvClLnZJl?=
 =?us-ascii?Q?TsFCTDqM5CliqiSwecdhbNZzc0dt8ZDZu10IzBWrLJx7EpdPBCaqU0uiK/Df?=
 =?us-ascii?Q?+RgwWJ+GFDkH1JqdtpD5tkze6UVQQeymE/tq4ud2r8MC2ujbSFSabLKQjQLr?=
 =?us-ascii?Q?62CYHfaBFCSXgBzr63WYybJKwFQLLVTAXuxhcdEj7ANU1+SlefMuLQIGyCPM?=
 =?us-ascii?Q?f48mRs5WkFGiFt+R6Wg2jCSYTNeY1CEWPTBG6NfwacTERmRB38/TdUaBsbz/?=
 =?us-ascii?Q?2eC8QjCDtKmF5a88QQeGgd8=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 604b8bfe-343e-457b-4b65-08d9f8087e73
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 02:42:41.5953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fmhMq9INtjgrZDDXtwPxrCVD80ZlnerWhwk8k1VvhfH6UG0VJzG1wQzpY49EPHqOOOt4SoQ8CxsseKsmah3FgQ==
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

spi_nor_post_sfdp_fixups() was called even when there were no SFDP
tables defined. late_init() should be instead used for flashes that
do not define SFDP tables.

Use spi_nor_post_sfdp_fixups() just to fix SFDP data. post_sfdp()
hook is as of now used just by s28hs512t, mt35xu512aba, and both
support SFDP, there's no functional change with this patch.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Link: https://lore.kernel.org/r/20211207140254.87681-5-tudor.ambarus@microchip.com
---
 drivers/mtd/spi-nor/core.c | 33 ++++-----------------------------
 drivers/mtd/spi-nor/sfdp.c | 20 ++++++++++++++++++++
 2 files changed, 24 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index dbb2c98c0366..115261f0e904 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2642,26 +2642,6 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 	spi_nor_init_uniform_erase_map(map, erase_mask, params->size);
 }
 
-/**
- * spi_nor_post_sfdp_fixups() - Updates the flash's parameters and settings
- * after SFDP has been parsed (is also called for SPI NORs that do not
- * support RDSFDP).
- * @nor:	pointer to a 'struct spi_nor'
- *
- * Typically used to tweak various parameters that could not be extracted by
- * other means (i.e. when information provided by the SFDP/flash_info tables
- * are incomplete or wrong).
- */
-static void spi_nor_post_sfdp_fixups(struct spi_nor *nor)
-{
-	if (nor->manufacturer && nor->manufacturer->fixups &&
-	    nor->manufacturer->fixups->post_sfdp)
-		nor->manufacturer->fixups->post_sfdp(nor);
-
-	if (nor->info->fixups && nor->info->fixups->post_sfdp)
-		nor->info->fixups->post_sfdp(nor);
-}
-
 /**
  * spi_nor_late_init_params() - Late initialization of default flash parameters.
  * @nor:	pointer to a 'struct spi_nor'
@@ -2712,15 +2692,12 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
  *    Please note that there is a ->post_bfpt() fixup hook that can overwrite
  *    the flash parameters and settings immediately after parsing the Basic
  *    Flash Parameter Table.
+ *    spi_nor_post_sfdp_fixups() is called after the SFDP tables are parsed.
+ *    It is used to tweak various flash parameters when information provided
+ *    by the SFDP tables are wrong.
  *
  * which can be overwritten by:
- * 4/ Post SFDP flash parameters initialization. Used to tweak various
- *    parameters that could not be extracted by other means (i.e. when
- *    information provided by the SFDP/flash_info tables are incomplete or
- *    wrong).
- *		spi_nor_post_sfdp_fixups()
- *
- * 5/ Late flash parameters initialization, used to initialize flash
+ * 4/ Late flash parameters initialization, used to initialize flash
  * parameters that are not declared in the JESD216 SFDP standard, or where SFDP
  * tables are not defined at all.
  *		spi_nor_late_init_params()
@@ -2740,8 +2717,6 @@ static int spi_nor_init_params(struct spi_nor *nor)
 	    !(nor->info->flags & SPI_NOR_SKIP_SFDP))
 		spi_nor_sfdp_init_params(nor);
 
-	spi_nor_post_sfdp_fixups(nor);
-
 	spi_nor_late_init_params(nor);
 
 	return 0;
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index c500c2118a5d..a5211543d30d 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1228,6 +1228,25 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
 	return ret;
 }
 
+/**
+ * spi_nor_post_sfdp_fixups() - Updates the flash's parameters and settings
+ * after SFDP has been parsed. Called only for flashes that define JESD216 SFDP
+ * tables.
+ * @nor:	pointer to a 'struct spi_nor'
+ *
+ * Used to tweak various flash parameters when information provided by the SFDP
+ * tables are wrong.
+ */
+static void spi_nor_post_sfdp_fixups(struct spi_nor *nor)
+{
+	if (nor->manufacturer && nor->manufacturer->fixups &&
+	    nor->manufacturer->fixups->post_sfdp)
+		nor->manufacturer->fixups->post_sfdp(nor);
+
+	if (nor->info->fixups && nor->info->fixups->post_sfdp)
+		nor->info->fixups->post_sfdp(nor);
+}
+
 /**
  * spi_nor_parse_sfdp() - parse the Serial Flash Discoverable Parameters.
  * @nor:		pointer to a 'struct spi_nor'
@@ -1408,6 +1427,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 		}
 	}
 
+	spi_nor_post_sfdp_fixups(nor);
 exit:
 	kfree(param_headers);
 	return err;
-- 
2.17.1

