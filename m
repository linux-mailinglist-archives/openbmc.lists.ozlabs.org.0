Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C39824C3C05
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 03:58:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4ZGP0HFnz3bNs
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 13:58:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=ShgszPlu;
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
 header.s=selector2-quantacorp-onmicrosoft-com header.b=ShgszPlu; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20708.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::708])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Ywp2tTpz3bbT
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 13:43:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jfuc898z85XMu+wl3mSUPiDTo7LFzN9yxtPoMO4gNJt5br8xSTRaRxGoyDP36Jv92hIO7Ks9XFvSU7RWvCoeBdkjdaRSxRYbHaaSN4H2eQ4aVA3P4tYy5ZaRelOpTjplJpA1+co+VCYcWiwu4UdfXWRKzj7pMNz+CifWon8M471xkvnk5ubRWb9is4bKxvcEY/7ShYLIc0GvnYdDKKbfpUDzi4sCwN70HOZCJWGymoOAnp8Sh14e45PcCr07CDQboy8/zQbGWADbaeHriC5rKR3MBOfDqRR3NYkASyKWm3CeDL/2vfbkYnU9zVc8Th8LLGm75J4+YA5llsNdLAjtzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+k8ueILEfKGwReOdQN5AOJqdUeprPdoOaWbBc1WDHOE=;
 b=ZzsUDZoAuS/1wIpqOGB49jbq10jKFhZOGcq4fSrVyzIh2Z6qaHWjaKgelObIqiwBGDmwhUFYZdKGtI5gObKt6zjQsRhEU5zWGY7NppR6wv5H0JtXyVrFAHQ7jJViwP8p59gEWeJVUyn3byvka2qP4VrJ845m3vVfGI6asMnSpmNMR6F4itO1doqsgXTlRgIrWrnnFZRn7PK8j1o8mvImnTJXnoAz/SmmRnzVrIV2jPBRoLqloJ+w2UKckkmg9NS7RF6fgxac/H15jZkvHewp3yoKaSQh8FnEb76+zkKSoU1YxU15wKRiOG+4cxadoxXUPconr1nD1zvfXCUQQDOddQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+k8ueILEfKGwReOdQN5AOJqdUeprPdoOaWbBc1WDHOE=;
 b=ShgszPlup1BesmT7OfxrZeBWdlx/ith8Drd63HpsAz8OryndvMEfV0XqXa9mMN25QyQIfOetlva+4txHiUUK7WsxTpzo5sqG9oo5765ExPbZ0HNF+0TsmvFY69m3LrWaMRi84RsA0BppidIPxCCpQHEr9ygQLw+DSGxc3XAfJcg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SEYPR04MB5644.apcprd04.prod.outlook.com (2603:1096:101:51::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Fri, 25 Feb
 2022 02:42:48 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 02:42:48 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 22/26] mtd: spi-nor: winbond: w25q256jvm: Init
 flash based on SFDP
Date: Fri, 25 Feb 2022 10:42:17 +0800
Message-Id: <20220225024221.19422-23-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225024221.19422-1-potin.lai@quantatw.com>
References: <20220225024221.19422-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:202:16::19) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 672d1859-9a05-4c22-28a4-08d9f8088082
X-MS-TrafficTypeDiagnostic: SEYPR04MB5644:EE_
X-Microsoft-Antispam-PRVS: <SEYPR04MB56447B100887D75FF444B20F8E3E9@SEYPR04MB5644.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QCI3v8GkroFLoUYV8mpmKCXEzkqrS4aZBtSV46YGtqmhXcj9kPWaKtIUZazKFeQ92lNLPVIBeYZjCQGFkQ1H2hu0bsjupZyUEf6zpmq+D+KtILFVuhP4+2ys6slYvv9JfnfOo2LeKxgJi1lBoanIuDqdVaeAzvNXcpeW15zE/SCWSXR+e7FFXyAZs4H0xy0Eewehlc/gFzggApbSbAAtPbE2BiKRdll3G+ueuADiCczIKFQt4k+h5C/ORSbybCAkD/mr75zOG2YDPpFCRRBgoRmtQiUryIGXHlNxnz5Dkh+iwSr/7NisC728bhU33nctdVuaUCJUTS0Q/TQ0xxXMHB6sjLRZMO1AvAA5w2QH78cj/1NsmE3omT7Xs3V5DmE2gy6pTblEnsAN0FmUmhPflrvaE6SKMgvb0vKmJL1DBcBiGkxYkWgT7KsaxuebtMmFZcgX1zGHAd55tauI4WjkQkRqD4CvPQdbVDoCwUxSCtjt2TD1Qa7YCpsJYK7yUAgg9e5wBbJI7nK2ye/jmePLLH6okbODl1xDLGc9saarL4TGJnQ4g4U2cVDv9od9k6BveTTYjUaDe2iI972ZVMz+sd7kaDH3SGjdnxMaewE7j/fY4TFr/D0RXM+cj9C/0hwcv3reyMKjbCOdLIunZN8hRCEZ8aq+0KQnhMVAofCjJL7tOfjAGZrTRq7u6cXg3MzAQFdIq2WfRXbdsXrQwqanKfEeVfEf9qtnf704LJH8U0Cy49Ko5YJnMelpwQBj1RDfZrKGGigncqUm5OajOEjIiXZlmYoklX6E1Hc8mwlNofY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(44832011)(36756003)(54906003)(2906002)(6512007)(316002)(86362001)(6506007)(6666004)(6486002)(966005)(186003)(38350700002)(52116002)(5660300002)(8936002)(2616005)(8676002)(66476007)(66946007)(66556008)(26005)(38100700002)(508600001)(1076003)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yX6447lUhbu+zb/RfHAxyuIZfZtYDdgWbVI9Lp3XuYHixyl+OMVIVH93KCE0?=
 =?us-ascii?Q?zkIo+tHTmG+Eg4v7k89I4R7MsRYAxTqGuM0DZPvnsjy0iniZdsQAXE5mRqyd?=
 =?us-ascii?Q?C4yJUDvYzJ4X7WwRyxOp8fvZdgjayBanki7BVb2DrRDBw72BBDDXZGzdxvbu?=
 =?us-ascii?Q?FtOp0JgROMh80wfhu7bkdBUbO5cFwULhPC1MAwKWx594hZKN3IQA0Yjs7bNh?=
 =?us-ascii?Q?12U3BA9Uk2vcefb25eXSH3lGatdFo9IP/rfrHOMi5yalTUiL5HNZpdtI7bZy?=
 =?us-ascii?Q?L6VsJoA6jZVb7ysZ7XUw64E9ZW1emHDK18mkVd5JNfCqbpYsVBMA5Co0g9He?=
 =?us-ascii?Q?ID5Np+8+4oGFNFAWL1K+41BRwD9glH/fvK7P2BX9HZJPY0eWLzFtpd5IUFFP?=
 =?us-ascii?Q?XDweGTxSq6L/P5INlWMZ6O9qpMrtLD7zuKgfYUrObraacFAoaHTEj0ddXd4a?=
 =?us-ascii?Q?QAEn2T7z7+MTj5CuNyr1GQ1RO7IGIWk/MvgbW/mPhepvJgLIJYheaxsUVYbI?=
 =?us-ascii?Q?xhyqgGFtaJWIbIq7g9MW5jZJiNakiuaT3nJC3Yn9xKiqalk0tbTW52+d1xdu?=
 =?us-ascii?Q?2c8nSMqiutnmbZ4jm3gswPdPyomkuNl65sLU41VZHgXP1CK1J5xABjjPtmRo?=
 =?us-ascii?Q?YdEB1d4Gy8LQ2ADqlmaFruG/umoPkNFQOCxf4+sQYQK6nQfmrZNRUj3783F1?=
 =?us-ascii?Q?F9HWiTVz8xM8b1X45Rbv7JwF5jiLl/0eDHR/spSBTCkTQnPd1UmEnJcsDHPy?=
 =?us-ascii?Q?ElPONm9NRfbCh59tZIXxdcp30Tjr2C65WpyO1SjfMh1yqNqg9szFLImjdj6C?=
 =?us-ascii?Q?Km/76xWBxvkn19pJVgErYBRhuG2ajr/0eoUz5cARK/R9Wm/favt6dz9U4W8V?=
 =?us-ascii?Q?xUU9C+OHr8+OWFfFu+KrOePV60gAvoboAllFvIMo1YRuhyFeE+4cfaSGPk+w?=
 =?us-ascii?Q?5oA+xqqj1X4kokK6ApfOTJzU2jamdAXrmQpe3d2aMTVlRYRMk7rshlw0AVR4?=
 =?us-ascii?Q?g+o6mQe+gDFTTruBkdLkxJnIEe2dlp2oeKW92qMvQ2OJzmkniabjOQjE4UCE?=
 =?us-ascii?Q?rnP9xI4lR1iS1RbdO+8pm/LpFSCiegywnftEpxIa26zA2+R64C7r8x88n15N?=
 =?us-ascii?Q?2LDho9dSi2hgwfv+XDKMsk9xMpW7+QlbfJy5rw+W70NVUTJoDiXnVje+WLqO?=
 =?us-ascii?Q?aQ2qXqOhx3y7U1JmxRQqIcOMoBaW/az0NiKvji2sxMLm3kmozYdS5SrDAW79?=
 =?us-ascii?Q?gYSaFElnMIUOCyDnD18LwJvck/04lIBNp9lS3JQW2mF68fglbR9GnupG81ys?=
 =?us-ascii?Q?MJXHpBc4+MFlgBb0BQ3jYK61CtVGze3KbQQHPwaZ6lXg4Vomg+8VNrwuVf7E?=
 =?us-ascii?Q?MTY122BFATKritgHeAcAZrOt5L7jcSkqX+YkNCkwcbJUPmXDdK0mjm2Dnfta?=
 =?us-ascii?Q?FIXtCdyC3Rql+/hM3qn6qJaXvxqg71cys+tnWdxndc/hzHiAITcigY8WQX+p?=
 =?us-ascii?Q?XSnVlArB2UJutB2VH9iAOv3UERZb9a8fR2Vwq67lqvTQp3kLMCHgbiJyrMnc?=
 =?us-ascii?Q?xXlmAo5Q2d/kH0Ejfpp1rOBDK8ZMXGrbLONfbocBVMRlrnwZgEJAF25Caf/0?=
 =?us-ascii?Q?7mxD02WE5YNLnqdYswA1KpA=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 672d1859-9a05-4c22-28a4-08d9f8088082
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 02:42:45.0170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wCOsv0495i/7Gdac+dzAdoozbrB7CP4ylkAABqd/u+rAqSLSCMw4myG0J96QJqFgWA39CYv6fGPvlPVHabwVNw==
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

Get rid of the static initialization of the flash parameters and
init them when parsing SFDP.
Generated a 256 Kbyte random data and did an erase, write, read back
and compare test. The flash uses for reads SPINOR_OP_READ_1_4_4 0xeb,
for erases SPINOR_OP_BE_4K 0x20, and for writes SPINOR_OP_PP 0x02.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Link: https://lore.kernel.org/r/20211207140254.87681-12-tudor.ambarus@microchip.com
---
 drivers/mtd/spi-nor/winbond.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index f5e723c2d482..59d53b4c39c8 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -117,8 +117,7 @@ static const struct flash_info winbond_parts[] = {
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		.fixups = &w25q256_fixups },
 	{ "w25q256jvm", INFO(0xef7019, 0, 64 * 1024, 512)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		PARSE_SFDP },
 	{ "w25q256jw", INFO(0xef6019, 0, 64 * 1024, 512)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
-- 
2.17.1

