Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 385184C3BE5
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 03:46:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4Z0s340rz3bT3
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 13:46:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=aKIr4/W5;
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
 header.s=selector2-quantacorp-onmicrosoft-com header.b=aKIr4/W5; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20729.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::729])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Ywg1xx2z3bNs
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 13:42:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jOZT4++DHK/pkGQ+XY2koFvLC4gZHUF3YRpMi0EAEp6Fn3uOd5xkvwLGMVKY5nH5IACKvQu0CJNk88uaYwNY7nJw42NU5/+C6TRe1uttuF2G6jUAhN2WfQ4aAsjeK3uGTHsZQamrczAZSAdCijt9qf83of7oZnijvPwgzcWCKNg3W+hktiWhkZ7Q03DTIJgAtudcq5BdmxHmGcuwrOa+fAfRjwATff0FyRwj1Jb43FhGP9EowiG2x9XoERTYpvGEsGAP+A92qbmtSr+IfPI8hUpSu8tFY4V9mkzeNHVLFZCyKTzf2+VRjtN1ogJ4fbO9YVMlV98tIdeCWB+wau281Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7STmyKXv/q8XXqWrtmiQd5qgOJCIN5fbiFpIOwr43Ys=;
 b=UhRE0mi714aenjq/iglpvpTlMOqT4vLS88ulf1ftuhqC4WejF3fDEslCVG5VmkfXCKxpjQZNK0Hk40PXsSLj+pDB7FHtM2r3Uw/kpMW6ZQh+ikVGtiQhwQolga1XNFEN9XeaM4CTvCvXNWFFGfqW2sAYOrMDnseZyrS9Wgt0l5KlnpdvxdBPe0Qz65cVArEVlP4GpxJ5Npn8CLOmMjgas9ER0AKlsL63w2NXA5tHda/Ptd5lC2sC3SQEeVbXCZ9swBliB8N2IyasoNU/h9gzRXXvtu9usRNe/z2KiMBLCil86CLJNsTZxNiQowaNEwmeCOs1Bdv2/nExjlihCfusJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7STmyKXv/q8XXqWrtmiQd5qgOJCIN5fbiFpIOwr43Ys=;
 b=aKIr4/W5rkMNm6Hp+ypeXAf0I0U7Y9UAcklQtA4M1yjlaxPwXuiyqBWquYie62muv/iWaIvFdGsz7g29Dh0VdJvHcGOEwcGov6t0/lyWnozlx5CoqqDJAXzhuMMEr3sDAaqd7Nl7N04S774gd+Awm0GqSg1BiocpuTcYbv5nETo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SI2PR04MB4507.apcprd04.prod.outlook.com (2603:1096:4:122::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Fri, 25 Feb
 2022 02:42:39 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 02:42:39 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 06/26] mtd: spi-nor: atmel: Use flash
 late_init() for locking
Date: Fri, 25 Feb 2022 10:42:01 +0800
Message-Id: <20220225024221.19422-7-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225024221.19422-1-potin.lai@quantatw.com>
References: <20220225024221.19422-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:202:16::19) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7f6164d-f4a8-418d-5c6a-08d9f8087c51
X-MS-TrafficTypeDiagnostic: SI2PR04MB4507:EE_
X-Microsoft-Antispam-PRVS: <SI2PR04MB45077EA9ACDB2DB8731D629D8E3E9@SI2PR04MB4507.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Blr2DrWujKH3mG5o9Qya1ICZJkDU3/ZG2HPDrhlCNdJZLX4xcrRqO0L2eMhkcLx0oKRHOrBypNMeY7No9ZqL38Db224hQMw7KNJa4SpBJnOZ4J7jqOlbe6Kv0LdMIC/qRkdyCpW9akYyMnopW2It9f7UwHkE0mVsC63jFhw/iq/jKjnJ0tC3sJFaBsS8DAF7Nm+/kc1VzdFZjexdyTWV6W6vVpvqWIV4WTfaWwcvEC3DpZvGOq4O90RbaUOoDEMheX8R0YPo/4MOoPjPJXYlecqJzVksZfNbZZU8ga9mPuYy/P4TZJPzAvoVl62LrJWDfKWdH4NYGPVUxD+PfI4UfK8igz0IQQq54vs5LC9UUpOMCkRKt8lRWv4m8OPSRMSSUCPoBKqjrnWIOZU4Wc78qw+3jYIxTc6mspjMJcCwyfhWKXyCzQ5meqZMCIEeuQamMe2BoyDldm+JJ+/zu8f5ix4UDykkEKL/C5MUO9RR/FQaeR60B5MDY6IatHPtA6eFG/7D/DK8wARNluQgYhe4Vuxl86UjRbTr5GE5QTGa67fMRM66pytTdR69yVr0N3jylG8CQViBAUefmAm22IlQ6BZ4FhncWxlLiyjBeYh1UP/dBh9INpFKUQui7KXoCWx4FkFGrRVyvbAbhMQF593idfYbduHqThH/L/B6OA/SWdsI8Da4s01yPst5DJrJxqaLGR0M3f4CvhRvCr5lkWWwmkQnVDCL1wRGDnVvB+y/dMzOYhcGdGG/dpArBjzedhjfG5/tkc/51yjS0bV+3i0yrW9MLMZ2FSBUGrgpoDQNSVY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(26005)(186003)(36756003)(1076003)(6512007)(38100700002)(38350700002)(86362001)(83380400001)(8936002)(4326008)(6486002)(966005)(508600001)(8676002)(54906003)(66476007)(66946007)(66556008)(5660300002)(6506007)(6666004)(52116002)(44832011)(316002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+OUE1lSxdOBoYzYqA4tYWyNeunJArwK2AJlFWYtRFIzSN8TgS2Ux5zNAyabb?=
 =?us-ascii?Q?DlcPN6RHDnnd0TmkhT2wO5bl0Zh+K7DUglu9LRuYoa2h7RgvqY6NmpQjRWlV?=
 =?us-ascii?Q?+RGgOCKJJSyU8e0yD154wqvo7NAe6iV1MbauWHBM1sRStxZEv4UoR9L6tJP4?=
 =?us-ascii?Q?Idh4egHbhulPAXvSilsCWjvAWSfgjiqE9jJgcnf003tPDW9TTVeGO99v8Mhm?=
 =?us-ascii?Q?8hmI4s9HaHWyZRz4GSgqMNpX7BPvQ0jC/zC9iWvBF8IUjWwiVMjb1HHZuPc2?=
 =?us-ascii?Q?w2sk5AtgBC4QANM8UmoderKgCjE5+pImB0G/x6QbXnbUXMS+ZItodfK9paTS?=
 =?us-ascii?Q?nYuikkpRaLs8Oh5FpXYSPU2/8gWu4LkXXer2eGQW+rbLH5X+9HcQ/H/qzhYe?=
 =?us-ascii?Q?YPOUJ2Vp19nNJrff5AFg2LwYgLpIphdEvDNm0ZNmp8iBs0NDh+PotTXLZWPT?=
 =?us-ascii?Q?/9bFBJMADXgDW+cmmTSeexqH6k3H6Htizap4HubKBMNqrDMxrmdJnql8y+XN?=
 =?us-ascii?Q?D/ZlfOIG9zGuyA2H7Z3Vk6GSSodO8KC8RyDSpoMtwOu+MGduUTuMQh/6Bd6J?=
 =?us-ascii?Q?oTG2BZQL5MHCYiJ9c+W+QpBQqwaoR+tJ3LDfmBB52cvFNImxhH9baQb21OGy?=
 =?us-ascii?Q?3QR+ez8BQDGi49P8Nr5IUi1ab6zdV6nEE/yWejubRtFDUf9lMFk9fSPTyKtM?=
 =?us-ascii?Q?htJZy+talIZkpjUEM6os0ph7p7/pULzc4YLpzuk00TryjIU/lWX+u2TTDPVM?=
 =?us-ascii?Q?bAttz46e2yWnb9fxd/Tx6PX2LcSyOc2fRqpnezl1uP1Hr9h6zeK/s6/Zb1uZ?=
 =?us-ascii?Q?zufTjlKWTdUymhmxRYNfspqO5cyKGB8iF3L6PGV4rDEz2+LG2O3FLNBPVKpS?=
 =?us-ascii?Q?Q9mwbUwW9PMI08xl67ueOIBefnQhgOVKjN+wpvrXJkPGBFcKSDuAPTk9MKuy?=
 =?us-ascii?Q?6jt6PRtzX8hlznBcJsKZK+e1Qw2mS6MI5ZPOH4LGAXQ0XFmdUzBjVeiR2QOR?=
 =?us-ascii?Q?YrsrXNJGBXUxdy3RBYwIWxemnZQ44SPQbYtX42cTdkY93nW5CB+KU/elbXcT?=
 =?us-ascii?Q?m+gYarmDReDuG266oypBMNixXcLGV2fpR9FL+8sHL2X+69Qz+qsEL+ai/CKy?=
 =?us-ascii?Q?lvv6mxpmJ9VTujblwtd+e7T98Ly4yzHxp2dXrRqstd8MJZ4TvC9D+Zsnh0l4?=
 =?us-ascii?Q?XgMFyZ07EcY3/2VBwMqsCdzCpB427fSSzN61Xhdfir95koVEsJAh2lWxFnzS?=
 =?us-ascii?Q?dUXQMXtXVf6j+Wn3PoKAj6emnEPhit6k/XE45SnYkLlWuqxXezxi4unSCCGI?=
 =?us-ascii?Q?1UZRcUkoMmviIiN6dIrOPsHTZKWfjCLCR+19Wl84WXD5lOpNZA1WVij1RZQ3?=
 =?us-ascii?Q?3tGTBtX42Yot0oAozhRNvJkmeL9qb3sFyFtbIfYs9Gp8TcC6PQjk9auX5zRO?=
 =?us-ascii?Q?CtzrsiiFfFsC8CUc+JAbZXd37liyWhCtgU2qNCU46CCZ9B7FQisD97I+/Ixi?=
 =?us-ascii?Q?89+klyVDt6M0h7ccFtspqYYL26A/qwcW65xtEj9tnMBLa5WvGTK7kuIhtV6e?=
 =?us-ascii?Q?EwyHpEUF2aOSo65dZcLq3gi6PCegKAI21N+p5SuKTP+d5iE8LpkxBc5yLzFG?=
 =?us-ascii?Q?EH+yrF5CigsfrLLCDjYjNlU=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7f6164d-f4a8-418d-5c6a-08d9f8087c51
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 02:42:38.0331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2jhUt1G5IYNlISOPnb8B/QyB6PvrVK8V2UegtSBfxS75YJLSp/imnvdoD2PYZ0Q4J/W98Ub3HwN9gLEyo2nLWA==
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

Locking is not described in JESD216 SFDP standard, place the
locking init in late_init().

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Michael Walle <michael@walle.cc>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Link: https://lore.kernel.org/r/20211029172633.886453-7-tudor.ambarus@microchip.com
---
 drivers/mtd/spi-nor/atmel.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index 1fea5cab492c..d0e7883b38e3 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -48,13 +48,13 @@ static const struct spi_nor_locking_ops atmel_at25fs_locking_ops = {
 	.is_locked = atmel_at25fs_is_locked,
 };
 
-static void atmel_at25fs_default_init(struct spi_nor *nor)
+static void atmel_at25fs_late_init(struct spi_nor *nor)
 {
 	nor->params->locking_ops = &atmel_at25fs_locking_ops;
 }
 
 static const struct spi_nor_fixups atmel_at25fs_fixups = {
-	.default_init = atmel_at25fs_default_init,
+	.late_init = atmel_at25fs_late_init,
 };
 
 /**
@@ -146,13 +146,13 @@ static const struct spi_nor_locking_ops atmel_global_protection_ops = {
 	.is_locked = atmel_is_global_protected,
 };
 
-static void atmel_global_protection_default_init(struct spi_nor *nor)
+static void atmel_global_protection_late_init(struct spi_nor *nor)
 {
 	nor->params->locking_ops = &atmel_global_protection_ops;
 }
 
 static const struct spi_nor_fixups atmel_global_protection_fixups = {
-	.default_init = atmel_global_protection_default_init,
+	.late_init = atmel_global_protection_late_init,
 };
 
 static const struct flash_info atmel_parts[] = {
-- 
2.17.1

