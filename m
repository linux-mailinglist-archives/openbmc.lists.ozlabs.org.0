Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D7D4C3BED
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 03:50:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4Z5W04Qfz3bYh
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 13:50:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=ajtnxmbr;
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
 header.s=selector2-quantacorp-onmicrosoft-com header.b=ajtnxmbr; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20707.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::707])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Ywj1YTvz3bPK
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 13:43:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nruQmQowuXItSsq6SIudCTOpyiJcaork03stpoElC3L/ZvmFwD5tWa47Rwvf1OGUeylnTtCu4cC5rFtwWI2QAb0YBk+yBEsfKk8q+UAtmNhu99rwEroBntT6Vv8dtLO5S7a6xkVQqVAgPc2RoEiFqaG60uyyl0t75Qs9AgePAZhq5fxhVfRcP8KLFUMFGX9Yb2v1RRN/nR3Sz0CwDke+euxUs25xQCVzwvDNLa580nPfanfRxXMgSlYxn3segGYbIXtOrzCIL1YOmzSbsFyLFtkJyuzAflNm9Rm0iPHxiGs9925swl5+S0WSWLXlAv0P6iXvXd4pKPi6saagklHzYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7JyB05y+SyUDSD4oBNExuuWr2vcwa2wdJSSNIRDBUY=;
 b=IKFyNgruWYga42u2lk2XfQ6rvYtKOTWqNAmOSsKWlv3zakmMAynvymslPNCfZxi/SDZRIUyHKpfVw1Zk9uuzc1hQCB777wYQX6kO/7l8eDyRXHPw5KqgHnKUr6H1Njqrl2TYFeHoWGuVMGCSti38PFjlnJDu8MnEp0ZBIqWttaiwQe6Xk2NojxOymXN4LNFeRPIaaBNgphbMyZ7zgl0r+bRnpvIyDQ+WHjUHWsMeObdBv0TnV0xxPJXgZ/sJ5fOmYIFDJxIMrZCQ1xnP5crDqUamYCdZ9VxbCOJsoSTmGKXt4EFZsCituSOHsNLNMhuQ+SYtY3iAVhq/UIr27fRiSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7JyB05y+SyUDSD4oBNExuuWr2vcwa2wdJSSNIRDBUY=;
 b=ajtnxmbr29t/L021HxQ/LZkzYZJfvhXhCaFuAYIoJDY+1m9zibhH4HehovUkdEXQsdfMdvpwqSQeDSfsID6PlJ1vwoCmWeOYbDFGQtfJIurB5oHh/HqIJpeVgJ2rMgn2J6r1HkTPaSdG606yp6n+dJb9YUPbyXJaE0VK6R1Qfb4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SI2PR04MB4507.apcprd04.prod.outlook.com (2603:1096:4:122::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Fri, 25 Feb
 2022 02:42:41 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 02:42:41 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 11/26] mtd: spi-nor: spansion: Use manufacturer
 late_init()
Date: Fri, 25 Feb 2022 10:42:06 +0800
Message-Id: <20220225024221.19422-12-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225024221.19422-1-potin.lai@quantatw.com>
References: <20220225024221.19422-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:202:16::19) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 180d74e6-c854-4fba-5bcc-08d9f8087d7b
X-MS-TrafficTypeDiagnostic: SI2PR04MB4507:EE_
X-Microsoft-Antispam-PRVS: <SI2PR04MB450709EF3F1433E83789168E8E3E9@SI2PR04MB4507.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6pmBN5y2MnexRblbcAh9ROL8Wx2mKclEY0DVecrPBC/pVpoAbuBJXWhzmIhBO3JMzK8ndMSBF46sYfPdkZx+nFSpVwrzxDQGi3SPDDD1Kgrqqf7UoEzCchjviqAmmaTnpwIXpEOTkx8hkl4GN7EeKWa+aqGIUcn3sUYyWB0dMeczng3gjAd24DmZ8YcfDV69m+LgOQdefFIaqaPnp7lsEsFdXAzgT6g4cBsuQ0nI0IMMW9COCPLyrf9AHKum/uyOAoxVrHM/McIZhXcVR4i7DnCgYzAuvrisDf5xBKk9WKYsNZFp9WV31YJyp0VYYeJF0ktLlKM2Q75Om5cM+ZrqW+DJzhaOMEBZFoNvcp5zvNZhrFhucK3UndCb8bfqG+4EdU2kFbQDpwzdfOHfN46Tocvqftybfm17lIhrgEfLRTTdb1fL3BSXIf5khu75vMsEddehR0t88h40gbVmGKHMSKDcuT+ajXvRMtWPZJ+0Qa6q5brPfYKdbGPj7aMIA+bMnyXjj75IOY/0DyY0i0wF8S9VR+y8hoXO+6MFTq1Y30DQGJGQrAeCB7yQHMLWDE4O81oQBECNLhLyV2gUmzWIszpklgsWR29ZgN5GGYEW1gkpV4zuYqN2cAc01DHQZKlTB4CppfhxgfNS8OcTkjXVckA1lOmhlvgndOnwA9GyWwV6RDZDFdKmr9qVVXWtOzwALcbac6LRh/3YVhjILE13bhDNPBvJ+ILELOSrW9QRadEycBV2bKwy9Mj6//sZC+SPem4xCyu3p2wQPXgnwTmVqqSmHzz/+lqLSn6h0RecoDM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(26005)(186003)(36756003)(1076003)(6512007)(38100700002)(38350700002)(86362001)(83380400001)(8936002)(4326008)(6486002)(966005)(508600001)(8676002)(54906003)(66476007)(66946007)(66556008)(5660300002)(6506007)(6666004)(52116002)(44832011)(316002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+PjQy61i37m3IGP7omkYOvbiimfgBpot57AdvHcaKhx59QEu2s3OmUMssMp7?=
 =?us-ascii?Q?2/GeVDm9YOyMePzA9K/DMvSh9jARcukhuoCQAoyVjx/ZJRzQ4Cyu1joxJMi3?=
 =?us-ascii?Q?HT6Vb6gqo1asOi+1R6QJYMz1HCTFn7SQxhJfl8kibokOhrwkPHWsqJy8V6VX?=
 =?us-ascii?Q?B+wynju12oi/aVgDJHySb0V6R56MYuKdNsnQ3ogBd74MxJk9l/wc/2A7RHRq?=
 =?us-ascii?Q?VitEbK1SG0ku3Dn3EvvZDQ7lcydbjRsleTgXSFL+oN/rvRv+p7tn5cNXQImx?=
 =?us-ascii?Q?NLF2ua1bp2HrMCGLBu+IPn3MdxjPBVWRdad0UWT2vr8d/K4WcWfmoa89eu7c?=
 =?us-ascii?Q?K9T23FFmrnx66wa2VWyiH/fA/0hzi7a5KZlHfs/0sMvVt18OG4cH2Y7GfLV7?=
 =?us-ascii?Q?ZvQeiPoMQLG2IuQn5tAkvR+FH6ACpVNVVBqmbSgncIhxNrXJ3LFo600tESAN?=
 =?us-ascii?Q?kum5RE443GLPI6eepIx+0Ua71ushg/MDqLX82CHECMjozYNUotmNnbv9WWhu?=
 =?us-ascii?Q?l+jhAlmnN/J7VdSfywdOtl3GAR6Mb/8ilnq6fN3/9b7V7AHno1Rn0kJji4/G?=
 =?us-ascii?Q?3f/EOwTo/zBwnNDEsfW6jANj76RuJv2ifSCu5wqozaBx/dyIOUlw4ZUrwHrw?=
 =?us-ascii?Q?AvL7YqVwUpxO7+v9B32moexQnYmvNLGMzm9G9inKMDo7SnaKyaXSHbhHAbVN?=
 =?us-ascii?Q?FItbRbtX8QwxiC3v4o31QWhu9LElF6XNk9hNPM8gS4u7Gl9z4ae7Y2HrTE6M?=
 =?us-ascii?Q?JDRIDvWn971HxWlt96xKxUtExqPX6PzTGcwcGkxIn3bzEgz/FdYCaRyBNiuq?=
 =?us-ascii?Q?5npuYaVEMSMv0tikIkLjDTWni87o+VEvzj8xLuv/vZSyCGhkY+6ZPaAccQPN?=
 =?us-ascii?Q?aAoUYVuijDFekgN9jhQoyilXWNe63uR3q+ySvkDxFqGX9emuy128qAaH8ceJ?=
 =?us-ascii?Q?D4E2k5xmnk/xcL8Kcl9YVHPJOoCLOSp6l4nBg95+dMkyUKZtSjykQEqreKlE?=
 =?us-ascii?Q?sv22KVBlikBMpUf7ut+8FUBKktYkSahGABIljkwPFV2CXekJdX5RJgJqlYv2?=
 =?us-ascii?Q?krOW7km1WUEfNbHUeL3XGW0vHZGduTeVfPCw2tsGBEhL9x2qD6/ID7bCoLxS?=
 =?us-ascii?Q?1fwB5rM3IW8Z6i4B/RK/i5FeuzKMowoeqzEeqnCFAsjcW2Mngtcwl0MeOSp+?=
 =?us-ascii?Q?B6jBz5c5fQXW9h6TNsmNayEpbsFjO4wKxl08sUiRyTRqLfP8t0/PwevtnmGs?=
 =?us-ascii?Q?3NugMNnf8DKj46wBnpWB6CHUoGzSm/C0yvqCAyEtVUm25NTjRRLWKMNg7IPR?=
 =?us-ascii?Q?Ui+dSHVU3bsZMC4oqI7geg+dkFgqmc723oeuBiULiyHPh/oPONDWsp6ZIJP8?=
 =?us-ascii?Q?cyZ9HTcjfZNJdCgu9BHAJDErXS/I5QoOnzvQwAdV4+6/KYLd5e0FCjLZWOAn?=
 =?us-ascii?Q?UVTiJPZhlEMusNORlySLqFY67tNOoVHMu7i32t4zDLpVEMrxzlAx28d8S5BT?=
 =?us-ascii?Q?k0n6v6PJQaCO7ZSyCoS9C8hcmYnuh/WPqV0iwfnybNJAtfHcKcmTv0IHKjYt?=
 =?us-ascii?Q?rtuaIrQUvWHHI5C+Dy3ruCWnX3W3Tw/aLNAZGJMcSDBrHHo5fCKjJMYmebjR?=
 =?us-ascii?Q?0p/8hIoeocPHKLhuAKMPh5A=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 180d74e6-c854-4fba-5bcc-08d9f8087d7b
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 02:42:39.9705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CbIf8Z+d8cchdldaphDDhdlGtX8sHGO9hwSmdo2Ju80c86dfKrj0MKAwRsGif7keb0jM/4/8Yi/UegE62lEZyQ==
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

spansion_post_sfdp_fixups() was called regardless if the flash defined
SFDP tables or not. A better place for this kind of parameters init is
in manufacturer's late_init() hook. post_sfdp() should be called only
when SFDP is defined. No functional change in this patch.

Instead of doing the 4b opcodes settings at manufacturer level, thus
also for every flash that will be introduced, this should be done
just where it is needed, per flash. I'll let this for other patch.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Michael Walle <michael@walle.cc>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Link: https://lore.kernel.org/r/20211029172633.886453-12-tudor.ambarus@microchip.com
---
 drivers/mtd/spi-nor/spansion.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index ee82dcd75310..a3ea0135f7b1 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -276,7 +276,7 @@ static const struct flash_info spansion_parts[] = {
 	},
 };
 
-static void spansion_post_sfdp_fixups(struct spi_nor *nor)
+static void spansion_late_init(struct spi_nor *nor)
 {
 	if (nor->params->size <= SZ_16M)
 		return;
@@ -288,7 +288,7 @@ static void spansion_post_sfdp_fixups(struct spi_nor *nor)
 }
 
 static const struct spi_nor_fixups spansion_fixups = {
-	.post_sfdp = spansion_post_sfdp_fixups,
+	.late_init = spansion_late_init,
 };
 
 const struct spi_nor_manufacturer spi_nor_spansion = {
-- 
2.17.1

