Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADFB4C3BEE
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 03:51:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4Z6J4CxKz3cBH
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 13:51:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=qe/+k10S;
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
 header.s=selector2-quantacorp-onmicrosoft-com header.b=qe/+k10S; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20729.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::729])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Ywj1Y3Nz3bPD
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 13:43:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f7CImHmYp4oChcUnF3ZmrBSPVJgRyPaIFKl22X62FKRZk7Ls6pMsQgytbI45rtakRuHVox2KWBTg9QEOAU5aK+kZWe6+etXwwuI0AGeC6kINAyrzArgHSx/vA69PV+VFBrzwfdG+d1jaFr+dtpSdCOuCaNfLWP5MGSWLG+1U1e81lq+ETXfTHtZjdn1C1nKwwj7my5o2vrbxfzQVmqtCSjCClyiELtdxn/jVhFugBGGwRU9NI5ci4X+BfPeaVR3xSY233+uDf/QHDEu6OJDa08pg1YlcZ1NBpG1p2ZF3bJlEuFf6d08u+QIXbFkV3slxSr2IqcqGCeaTEfjfGN/P3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BA/r0c4FYja8O5bO5310Jk5CVt+f8qozLM4UUEaQ4Dw=;
 b=alClyvgfzYvjdjABtwhvtjuK2Rz5wjDqDiwr/x3jcyuIEoAUY1SeSNetOy/zjrgxPls8/YF95+2pRZlRyM8PsTjsVFCKA5hb4uFmjPcwDByaEJSgvTGu8mYdoSIhuCEv5TL9kvDirxo4zPykO3IEJ02c3W+q+tSvqbxee6mgw6XA76DeGTQ8zaYxYbA2ZPCUC18WHmIhv3ZO40dRzONAxrYoDFUuQBz1NICiGQzDLHk4pEwhBqMaQqt9vWpYeCYcl/Ycdb9YXg1D2+TyDq1zV5wZTqZQTUoW+1bLgCIeLPD9+OKWpUItYHWgsYVkVUel7ciASac85P+CXeXOkJMpog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BA/r0c4FYja8O5bO5310Jk5CVt+f8qozLM4UUEaQ4Dw=;
 b=qe/+k10S5OxYBcupbxc6mKZQoYCjmNgpdirQjvSoLzRebYdlZCSm7PMjJk2MwABx91isk28DikXd/5fTOWfpPmIrUR7jjvM1B03KRtbTACdEJG+OAoA32CLnVwshgRN+GjMtrMjLbwx49mVy3qngTTSrKiiQVU+AaJzqyz2d63A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SI2PR04MB4507.apcprd04.prod.outlook.com (2603:1096:4:122::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Fri, 25 Feb
 2022 02:42:42 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 02:42:42 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 12/26] mtd: spi-nor: Fix mtd size for s3an
 flashes
Date: Fri, 25 Feb 2022 10:42:07 +0800
Message-Id: <20220225024221.19422-13-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225024221.19422-1-potin.lai@quantatw.com>
References: <20220225024221.19422-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:202:16::19) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3907140-bc5f-4570-ba0e-08d9f8087dbb
X-MS-TrafficTypeDiagnostic: SI2PR04MB4507:EE_
X-Microsoft-Antispam-PRVS: <SI2PR04MB4507379364A86917D699E5098E3E9@SI2PR04MB4507.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EB6D9QkIvZGr37glPTJAxIBpV/SAbA1kmw9dJIdKF2Zu1qWma56e1+/xesKdAvll/YrsfuuPWw7hEu9nYCVG5/2IPpa7AkG4jIyh7RC7cooS2RVXYC848oDo2KqO3GKFgIgikxAXIX1qjKOfJZlkLsevOnlv0D499dtmVQ/ROGX7rnuL7C7TfkzYDjjLt8mVrRNMFYv1J1PcpqTsduXeYBSlu7Z7/NNQADg5pDV/isCUrrYDWLLnnE9PTST0cmIP7xqFn4e3TNgmvANcGi2fqABrFiz/UsunmTLfmALkND8fRgLU/+1cnPP0wTLO0BnzDOW2uWWabG7o5sYspsRNmoS7lfxEtl/z229qmsgwt84VNsN15FFuLvD+Xfrvv5UbAJMVNKO4mTeYX3CDUG9hov1TefMP/sONHSicNzRZa24/kTwwZRX+TJNbBt6NQUyL9mOFbLj0BOjCalZ8zygV1ErHB2LuP85nBRo755LIp0UnQa/YSwkSRnGWc/f2awGxfLnbzOva3TNyEose5mkNjsmp6v/X5uk8EgpDlclo7qXML7WHv22cs3D7JdqLBVL4V7TEeWbTSPoG6hw+Cv8CZsy0GcNH8JWMzvzdeT7Xx8FUR3LpgKy/hcYBOgxcT3a0pTtEnu7kAmpqorzLhjbQxH4S9SNWNe+eF2SbZl2J6Z/F441SbYU3rdJ8pIFr2swiVlvAm3OK12QDsXy3Jyxcm2i0OJ7mBmYqmDmd+v8+3Nm4meWAloAy4djsuFUOSxxwJvZly6PYlOixSmi/L+6CmxDUVeCQuZP/YBJQNg7f/8IrKtCrAIjbS7W04Ly1ken0aTzHi95P79HOVaSQlBhdng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(26005)(186003)(36756003)(1076003)(6512007)(38100700002)(38350700002)(86362001)(83380400001)(8936002)(4326008)(6486002)(966005)(508600001)(8676002)(54906003)(66476007)(66946007)(66556008)(5660300002)(6506007)(6666004)(52116002)(44832011)(316002)(2616005)(42413004)(32563001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4a9ZWRJgDIHKpmPMpeFS8v0tHaYGVGRaroOBLqSG0iQZQZ6sc41grMScvT3m?=
 =?us-ascii?Q?jdkRzzuYRpoOSjeGeV+4pQTU7HBpW0Alnx4yxs6JzRH5fywlqQ2GOAcyS2K9?=
 =?us-ascii?Q?IMO4kO6r+Bew0SMJM0K5Ii0vRRmU0dXxJ99TdjphL5hWXzusM9j3a8bAqIkP?=
 =?us-ascii?Q?A9P9MFPVYea8cEIvqfhInYT/kSi6kumShOs8b+jwYuPrmSpYNdBuiSDO4LGx?=
 =?us-ascii?Q?hTNfqbdnqb+FFDWOuomIXWr7/0wVmXYEGGNARdI/ImVdI+m7hPbwGJLT06Jx?=
 =?us-ascii?Q?nrrwYjkY6YdrhBiCUX3Hh4rZWf9WrWAkhfYFIwBQXeLkSUCK1TgScuOqjni/?=
 =?us-ascii?Q?m+TAYHRgYEUY6sg3vaXiySPZUigxluau/1mOoWIoDbH3QcxfVjO/2x1Qxi8G?=
 =?us-ascii?Q?FUvlQdPKI2J+/oC7AuW08yXjAWD9t2mVoU/NNpCd6/KzpT4OIZ40VBNs0fLf?=
 =?us-ascii?Q?/rI5YraQZ0BmUAi0b6UKhKvhdT48j0sLLdlqvLjNNoJghdXwOJgrv23AGWyQ?=
 =?us-ascii?Q?EX2isOHH9xovQ+OBhqloO+QpXvji3/TPI7FiryZ+UJpDrYxcUcce3Wj7xQmf?=
 =?us-ascii?Q?eJd0TX3uVBHhE7gEhpFTUEaOzA426rGxgqqY73iZ4LL9bNQIOfywr27sTmdr?=
 =?us-ascii?Q?vs0NQSygDKzh4fEM0lmiLugtWAVhF+oHoYi7W9xlWuCNdGtamf5yXDDYizjc?=
 =?us-ascii?Q?XRICcXdHx8FOJaZsSP8oijGdUzzrqT9ZM6A0cjLHy8lojp0xNJkFQtgROkhC?=
 =?us-ascii?Q?RBDJzzEgXANwuAEZqmhzAjS8s6tOi60TqC9Gie5BbKE3S9SPS/UkFnr9HWP1?=
 =?us-ascii?Q?AEGD5yCaGRpitvIGlL/AEixGSJPPGqoPZYZLWhsFcrn3XGuRy5ukB93XPZhv?=
 =?us-ascii?Q?4L+9gjhGIe4XBtwgr3U8rZM+3CG/LAL+5JTef0v+Y+V0tZFSoYDi0aAF830Q?=
 =?us-ascii?Q?XufOL3UezNJMlQl+fuGqNCZX1iNdyWqAMS8x0NEAmEAZPY3vb0GSCKzhOB87?=
 =?us-ascii?Q?ZENXwZKmWu/HDhABrg50C9100PTL60bPWJKu2SDD6aovj3fUmWRildaPvYmd?=
 =?us-ascii?Q?KSfVryzZ9U3AAbTQcG9+dTLfDHBD8dVYbNw2SqQmqDMdBb+0jnLHEqX89PnP?=
 =?us-ascii?Q?PP0TnI0orhQav5//2lQOgTTwMbxfZsVpRfBMb2fwrr7e+RjdFHjktmE3hPR+?=
 =?us-ascii?Q?BwjRLJSdqOI6e3P5QKiXSTaPro/PL/CeAlUz+xVCrn9C72viNpIJmMg/UIMv?=
 =?us-ascii?Q?7bE4xwaatW3L7BuPvvT3ZY0fgYj0S0edvYUcYQQSj1ey2cJ4FGmd5BSI7/sp?=
 =?us-ascii?Q?/wDC0CBW2fxVFzovRvqwnwKN+xDPniiRj2tF74fm3n1ySx23NcRuMcgu0kUJ?=
 =?us-ascii?Q?+k3mu7nQMlw1M5WVgjD7el4BZY8m6yoohTlee5BhqCYO9J9LsFFUOkD838Zm?=
 =?us-ascii?Q?CPT20/F5ZHxIfgr7LTl0TJRR/Zcc1vROjo05PmrBAxuLCgSr4hwIeeAcCzCQ?=
 =?us-ascii?Q?c9tAhhB3/7MyRT53e/YT/5Xdvdx9xTHLeXp0mDaLqwG9H6VsH1F6d3tDJvtg?=
 =?us-ascii?Q?fq8s/pQn7pEwzEefwGFDZyJDND7PvGKPe/FimBsdhaYxo1g2/K5setuqhBtc?=
 =?us-ascii?Q?NVvqMAFneDC2GCokIXUbF9k=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3907140-bc5f-4570-ba0e-08d9f8087dbb
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 02:42:40.3767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: puFMSCkTH/2IgntnJ3UykVYu1kxhxQDivqSJDlGzEWBn5uJ06cEhg4Iz9SEE7yAbVw6gM1oyQM1is/AYxTHtsg==
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

As it was before the blamed commit, s3an_nor_scan() was called
after mtd size was set with params->size, and it overwrote the mtd
size value with '8 * nor->page_size * nor->info->n_sectors' when
XSR_PAGESIZE was set. With the introduction of
s3an_post_sfdp_fixups(), we missed to update the mtd size for the
s3an flashes. Fix the mtd size by updating both nor->params->size,
(which will update the mtd_info size later on) and nor->mtd.size
(which is used in spi_nor_set_addr_width()).

Fixes: 641edddb4f43 ("mtd: spi-nor: Add s3an_post_sfdp_fixups()")
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Link: https://lore.kernel.org/r/20211207140254.87681-2-tudor.ambarus@microchip.com
---
 drivers/mtd/spi-nor/xilinx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
index 7e970ccf7903..03d3b006a039 100644
--- a/drivers/mtd/spi-nor/xilinx.c
+++ b/drivers/mtd/spi-nor/xilinx.c
@@ -69,7 +69,8 @@ static int xilinx_nor_setup(struct spi_nor *nor,
 		page_size = (nor->params->page_size == 264) ? 256 : 512;
 		nor->params->page_size = page_size;
 		nor->mtd.writebufsize = page_size;
-		nor->mtd.size = 8 * page_size * nor->info->n_sectors;
+		nor->params->size = 8 * page_size * nor->info->n_sectors;
+		nor->mtd.size = nor->params->size;
 		nor->mtd.erasesize = 8 * page_size;
 	} else {
 		/* Flash in Default addressing mode */
-- 
2.17.1

