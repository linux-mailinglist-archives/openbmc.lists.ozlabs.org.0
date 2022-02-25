Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FFA4C3BE6
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 03:47:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4Z1f356qz3bTP
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 13:47:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=zyE/KX/g;
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
 header.s=selector2-quantacorp-onmicrosoft-com header.b=zyE/KX/g; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20707.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::707])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Ywg5lmGz3bNs
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 13:42:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OniHpLLac+vCJY7srD306/aCoLieV7qSXGOP9E1xDQ6ZoDyNjhlY7gpQLFn8UXiFMnr2zJ9e4n9KLru9zy2h8K6YgkMZlc0dJ8qH1vwGfqarymyWMuUtZGIYZRLqLrcFZ4obSpvA3ey309aONUw6PDAPZXS5ImIEZMs3S2uG9e9XhZs5wGdAgJDuxAd/ExoyA0vS3YPwV5bYqiXIPYXUEu6QzhOL/HTzlvLCVigzlq+mNCO4ZZfEoFuYFRlF8ZZUZiNiueBtCZnwgkG+XTuUjqiv7k6j1ecvkDbzkPsS9JNF8mKgwrrC+6pdyFy64+NlzECKDRgDOmLVj/6ORzoDnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0T6g8gObsfPsP+z29HYZAiGfNHSMl2z2QLZ891WvFM=;
 b=fwwm+m7qV5Jj4rgxdTZFzJaIgdTAwMLC/JHJ7SM/u4mxEbhpklg255iDMFACKS2uYlLks3J9GSyjUlEBeiU5dY6Gxzqdyq/vFJn8mVbvq8JXCIbV2qOf6uU4SnJhcITpIgaboyAPz8+xh62yFASisYepidglevjP518kYQsCcHobJuv98nRwGaKD8LozeIPI4/qOR7qMDCey2y/kXh9+RXexB1XvQ2csU+mnLrdWa6v5nWx/cuXr8lE2rzWRmSEB2SCCHsVkySybUKAzr3i5X+7fqxU76k8rKZlQFWJ9hzYOhM9cyd0Xte5f57Vf6EyVptaHeYhC32EOa6N4HfQzug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0T6g8gObsfPsP+z29HYZAiGfNHSMl2z2QLZ891WvFM=;
 b=zyE/KX/g9rUBFjLnHTJKA3OQ/zM3Szkpsg+SVfKRcSs8fT3OuYBr4POmy6leP/3VTjSyLKmSPH+sX1JEoo8bC1fDtiQg+AXZsC0YELKShc1gypBU26hNn0yEqhVHHkpXQhreUoahyPojHsSlmuSNbNBHqYg4Qna7Hl4wk+JS0Is=
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
Subject: [PATCH linux dev-5.15 07/26] mtd: spi-nor: sst: Use flash late_init()
 for locking
Date: Fri, 25 Feb 2022 10:42:02 +0800
Message-Id: <20220225024221.19422-8-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225024221.19422-1-potin.lai@quantatw.com>
References: <20220225024221.19422-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:202:16::19) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e444e76a-db50-43e5-57aa-08d9f8087c8f
X-MS-TrafficTypeDiagnostic: SI2PR04MB4507:EE_
X-Microsoft-Antispam-PRVS: <SI2PR04MB4507066B19A82FEF762AFC448E3E9@SI2PR04MB4507.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZeUKXM1fI455nTKW4xrIzNLnZ8Y11LsLPsBE/qo2r8x5d0Zbh3EbvdJd1Jg7n2jTmkRWs1PaSeO/aQ70nB9zSI8f9zkNJj62xF8q3sUf7ZqSmwd6WPVoZKD/XJ6DPOpOd0v6hTqBM9Vk/jzGOISoScKQVs4pJAHsbjmgEOgJecyTJ8tpJblunT9GecaKhl3ttnUgg19Ee+WPfYcdyjk/jRfLFWEDf9ola3Fj4QC3wXVn+TUc/XwhtGcm1++YuQBlI8hAqXRBpHn+VXeT6a5af3B4YNmnfi8rcU1YyY1MgC67W47jar/dGK2QyrBBEgBMthOVDO98lCF3gIs/dguk7OUiXFoJJtfxg1l77Up88EBjdqwrSVhd0J0dm8kNUyBtN/3Sx69m1gxDlUjsQ+DQ7arcgRmvVme+q32+N1d2UuKXSbVAc95uBRs4oHYSznrc7MWih2S69wryGQQG+J+tDYTcnvf+TtphgL//A0+ED9h6g79FZmjCVUIlpoiZ8LxsqD8374sWZSy8yXnsspZ8H3yZjKchqKBJEz20siTSFUc8rDKddziENaiFp8MaKflHRkG3YjY/6ddxpy5LaVdCRYQDfXpDUzINLPXwJ9jQzVsRqbLnvxkKEGZkq2uXxlI5kKV2fzfdkzzFMepxSwRx6OCjoAPN2UgUUiwMruiJL9tZ/9Chd/YJyDB4P59lGcdjM1q+ek9a5U1n8xib6YN06loHA2EAgoAy3aeIkhS3+oqxYbcTzo1qNaX7MuY3ylo4hr9UCw9E5/AfIAK/t6FAc+qSGjK1/kdnPBg6TmRs1Rk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(26005)(186003)(36756003)(1076003)(6512007)(38100700002)(38350700002)(86362001)(83380400001)(8936002)(4326008)(6486002)(966005)(508600001)(8676002)(54906003)(66476007)(66946007)(66556008)(5660300002)(6506007)(6666004)(52116002)(44832011)(316002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RHOxBYXokI/pKZY+GrfX2TeMcOkY86AMxdxDT6gcY6SUG8/qBJvWieONyf1O?=
 =?us-ascii?Q?H4WS+oxDuT0oAgCQOgi0ZoIlIC6nAjmpmAXPCrVWpeR963YbOfTr8RvSCzVf?=
 =?us-ascii?Q?keZwbdrapTlYV8rcx9vGciisSGdzBPv6Epb0HZGRulxsMl6iKcr+mfImZIQA?=
 =?us-ascii?Q?RsYkrQEPHjGk7i809YUVOQX5AgiwHZi9XU469Z19wz8thtS2q3raDbkPZBpn?=
 =?us-ascii?Q?VvNqw4WhlrZ7+EjeEr8J9RAkFc+cHcD7Kt1EUHvxtdGB4BxVz+QNkae6uJjo?=
 =?us-ascii?Q?AzXR5n1czsn1uMDcjaSrSXL8Q5L3Bi7J19aSOii/Xl1yceaxO6beYK/USSQE?=
 =?us-ascii?Q?GIzNcaObbpG+rTwoSCgGZxublLlLboY7lThowujHwXbkZeB0imllMgXTJ1yV?=
 =?us-ascii?Q?7GA8AmL/IpQZkwzk5ODeJFnMizd/BjncjbNNMxLai5v763SDAjrFD2pMRRgW?=
 =?us-ascii?Q?OPNAA/XdM6F4HlLsODuhX9hDCCFuc79wxo+RQYwx0YWHm0yCppkgK9j2xyAl?=
 =?us-ascii?Q?dvRBcILrzbuBnKeDALUu/OT/ZhgogELfUlNrGRwte9yVYldys8Z2jJxoZ+bX?=
 =?us-ascii?Q?roWoQkcPRfoyXwKgPYYKAr/NL/S+FbW/SSy5LcNwjx9EmzWjFhx+LKwzaAFS?=
 =?us-ascii?Q?wkGomSrCR+q/8oa0xU4hZ5mirpW0sQrIhRYy3+KpONJwiz+F00LlDBhM5yFI?=
 =?us-ascii?Q?mue287zu0s4aUWGkGzH5LSNxAMjVmadDRrBWfh7Fbg2+KCLIg4Qv6mgchtbe?=
 =?us-ascii?Q?aSxIZFBZotxxNeXjIcTDmnzGpH8dKpudKaXZPdji4yxSUAn7e/39QGC+y2VJ?=
 =?us-ascii?Q?2wAXb7s4mQecaOqRo8ICwOx9XY0ynxZqFWNJy29pAT5pZnlay6shs5QhDFQx?=
 =?us-ascii?Q?wbomsiHHEsC0vltwNRnaDu3XtTEnZ0MhVbEO+GtWNVi7IJRv0/36+WbXbmAL?=
 =?us-ascii?Q?o2thzJ8aXruBABNRjMUB49+bgiRJcVpwtw8s84k/To4jIIzO72K+sjTJr2as?=
 =?us-ascii?Q?CJJaUjxAY6Sy3SIA6j/7On85MDl7imlV4NsrHJdoGtLTiduv/eVvsBipeLjN?=
 =?us-ascii?Q?yJlnMeNSzydKVTmhNcOxezzSTc/wYCYaF8UGSqJE780P9nRAYI5fXY6pw18G?=
 =?us-ascii?Q?+8eo1PfArBmkr+A0Lbc8+2wiVS6KXDOvVWbV7Grfpgv5t+pSF1VK+TEmPYiY?=
 =?us-ascii?Q?B/btJQswYMHA4EHm/UrSQkzm0vMsV312vlHBIWGvc/GhzFl807mcm+pJFs6l?=
 =?us-ascii?Q?xid3gvz4SzRe4DAUc8WvAdOl03tcGKDvX+2zrGFoge71w+90iM+6tfGdFkTX?=
 =?us-ascii?Q?NyfUVJme+6+XTAeYuQfegDMpXN4CrIyZ8uB+ZNm/jBOAdtbb3mvXFiilccrb?=
 =?us-ascii?Q?npHHi8eH/g3UcOvIRZdnr6DnuPSgtVzVM/xB2e7F6HKiKGjaytp192r4MjW4?=
 =?us-ascii?Q?Qga4tqyCJISC+756sdLAZY7MCHASSkCxfIyZTjsDLZciIHqERvRCkOQB37sv?=
 =?us-ascii?Q?UhhkaZ9hTAuPmVScHuhK/J04rVL+ivVi42tmAEBh2ZQP2h/5X+Rv5/b9q7aP?=
 =?us-ascii?Q?q5IvMcZUfCZNliPDA9LKQ1nZBwk1pOv08A40loBwAzDc43jSwAjtkdc06siX?=
 =?us-ascii?Q?31WE9vmGN0qmJ5XKFFkOscc=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e444e76a-db50-43e5-57aa-08d9f8087c8f
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 02:42:38.3925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FeRoN8PXAbSltOoR9sBooZ/OZGP2vnt11fRq9/P+iluYnaWzRfea/rRg7a+lY/UK0iWpgiq5niuwDeWaNMe3zg==
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
Link: https://lore.kernel.org/r/20211029172633.886453-8-tudor.ambarus@microchip.com
---
 drivers/mtd/spi-nor/sst.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 980f4c09c91d..660aabde477a 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -46,13 +46,13 @@ static const struct spi_nor_locking_ops sst26vf_locking_ops = {
 	.is_locked = sst26vf_is_locked,
 };
 
-static void sst26vf_default_init(struct spi_nor *nor)
+static void sst26vf_late_init(struct spi_nor *nor)
 {
 	nor->params->locking_ops = &sst26vf_locking_ops;
 }
 
 static const struct spi_nor_fixups sst26vf_fixups = {
-	.default_init = sst26vf_default_init,
+	.late_init = sst26vf_late_init,
 };
 
 static const struct flash_info sst_parts[] = {
-- 
2.17.1

