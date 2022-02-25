Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D354C3C19
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 04:01:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4ZKZ2Hd7z3bb9
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 14:01:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=oUbNO9uF;
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
 header.s=selector2-quantacorp-onmicrosoft-com header.b=oUbNO9uF; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20708.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::708])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Ywr0Cpvz3bZL
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 13:43:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIILEzXSI5oJPBlv0ekoqRDJjgc5MpzhnhZEsd0IVH0kmHmEjdX0H4+UqCup8aescHCF+5AFs2apnctRslPMykxmPNWPPxeyJMvXkDVRwBa6ivziOzMhI+kTiK2uZb0ITUnodid1oqAcg69cWKc80mxrT56r1U1DzhsvNojYDIHiM6/QT0w10gXSDH6qNjppYcpqeaFFQL9H+yT0KwQPzUtsdgs7aa550JPubqfz1ZR0qHuXC+rfT23yWGvoxZdJeDJrcJ9mSGUDlf8mvnMlqWZuU80lWTHVIVHtGGEAJvhOaplyTAcQJqzoJNtD4TuhK1zxcdXBTuRDRF5XPYTcjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nCAbJVlbzcGCOpl99wLfO8+wzAf/iIVwVebFfYco7A=;
 b=FcEZBM2Q7D9BvARfj5YOp3FA8wH93fZCnEzPP6vk64+Rl4FZhL/mZ58LMFmrfCrjhp0dxtKndIyVSGEUuWkYKGj+QWprPvV6bqM9zPdJNWSjW41RghTG8CVfGrybDBVMOGJt8KR5DS05ZRMWrpRMDOQ8SwzNsmXTAkt9vgun0gfkHhlLG46YghGOuNGw37hcvAW21BYhoJS4gQlDppg1YkTVotYDMYpRSFJZbS3blgYRB1bzguL072xVNL92W6cxcfrWKpAlWXsWW5ghJ3cdwde2J8RzZmtFYuHUUsKW7gTbW2+hFzo+MTtlBI97Y36wivbliJvsryMLa9PArUFVjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nCAbJVlbzcGCOpl99wLfO8+wzAf/iIVwVebFfYco7A=;
 b=oUbNO9uFwyBbnmdMSYrW9eB/blRSeegNYzsWhjh16lqsLVpTqfYVCS3Wb22Pxa2darDhOAmZgctCPR+3Q6gUzUXdzD1J6osLKc0pa8gNPWEU8mPjOJlh1CIKg54r4VKlST8U9O/0k8odwmfnnC1y3Q0MEG4Hms5HEDHyWIEG5X4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SEYPR04MB5644.apcprd04.prod.outlook.com (2603:1096:101:51::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Fri, 25 Feb
 2022 02:42:50 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 02:42:50 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 25/26] mtd: spi-nor: issi: is25lp256: Init
 flash based on SFDP
Date: Fri, 25 Feb 2022 10:42:20 +0800
Message-Id: <20220225024221.19422-26-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225024221.19422-1-potin.lai@quantatw.com>
References: <20220225024221.19422-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:202:16::19) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec8bf362-d590-446f-a592-08d9f8088145
X-MS-TrafficTypeDiagnostic: SEYPR04MB5644:EE_
X-Microsoft-Antispam-PRVS: <SEYPR04MB56446261D616B64EA3E0E3308E3E9@SEYPR04MB5644.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KHVEg8J1XRG4s0dqw6Yk6LOQ/tiv98PJbXFtbjWQn+ZlKLjUnhEk/oPuGtEoA0HGaRXn43WQxSXXE0B4iazpEpjc/cfsJIAyjO9ozqEh4sp6IhT25MCgJt2EnNkO0ODdDXvNy1UFsYD6cB9g8EktA3jCxOA8rgHkwBpnhpbebmfgV/vCiVMa5JctafFAbdNsGp19VEytAIhuWL+tf4/G6hJA5yEYciEp/i9H7gsS/nphEZmxH7kQn+8uv2qvPJeQXtQhBYPs6nfpRcfJngD4bgtyTp42TVlPT0SJPx5Wl2VB0GIMjOKR5wCv+TJD63tQ0D7fvtx7AXnmaNvLqPWviSKyAO+JgjMd6W/3iYRTad60xVC31zYG32cwX8flEqFkyaDrllbwbjg07b6qtIRHgWNssmN+RYipB221w5hWmzKDQg1PH7EM5wI2jfEWhi8OQ+YKthq79GquUe+4xBV/rufwQ9zlHRXjMtuXZ7aWFB7s28R9au8ubsSNnXAQvNwCBcWaCfaqmqyX0duREtn8+8fR026+h7QrNEPzLlfHYUJQSDJLzmj6OTOxM9LZdQt1DIKahxGvQOa/SPiSIHuQZNpoHz83TKb6DjT4hFVdTBUsgDE3c0KXGVdPZB4xmevK9nbOxTsillCQ0earFoln50G0vHEmYl7Xk2RXHeziDl4U2XB3149kxY8R/q7rVJ70A3m4srf9hxtuMtLpaiNSu3FjYhS0x+WE+pCkrInY74yeGHySgrS2tgJv5NR5a+DNHI+WScdTuPEwl9La02TjKlz3znkL25C5CeuH+6gyGLI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(44832011)(36756003)(54906003)(2906002)(6512007)(316002)(86362001)(6506007)(6666004)(6486002)(966005)(186003)(38350700002)(52116002)(5660300002)(8936002)(2616005)(8676002)(66476007)(66946007)(66556008)(26005)(38100700002)(508600001)(1076003)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1SK1UyLoa9MzRCFUQmT74VzbZTZYZIH3+TccV7EOj6pN+uiw2iRkvlBoG1hc?=
 =?us-ascii?Q?PKjJodHsPCegHTRJcD9qGnspr5B09UgVNfLTc7X0M01X6HRTli9x6kUiW3Ez?=
 =?us-ascii?Q?1OIKWpnVSebMB4qAKEUdA2KNJd5WePZOq5SXHlyMK7fPbuV3HZ9FjAw/vk9j?=
 =?us-ascii?Q?Vkchm+2cdb9iRClT0VGpbYDIRapU3vhU9Je1zWq9jGrkn6ci9YG6yiNhh/Q4?=
 =?us-ascii?Q?OK52vVfYxNPEfyk3/9ot9imiSBoQjlxFXGmeKFPRY6wFg+AHsi5N/ow89h5T?=
 =?us-ascii?Q?nl8nXVM1VP8P3RpKw40disADZpVjT3qWHUqn00OXAj44wUrz73XiY+k9WNay?=
 =?us-ascii?Q?LVRrNkEXw/R7UdeuCx8IyvZmEM7qPFCnfgFPfBHAPSSAaxJTTyIAqs2x5Hva?=
 =?us-ascii?Q?7odxeRuD+UA7JWRF2m+QV3eFLxBMDJuJB4pKSAZL7/Hz94kMDm5uHX2FJms5?=
 =?us-ascii?Q?ur/JriN1W69muV/TIRgWNK7kZDsSUTZtUhv1jr9or6xl0qd3KIA+y4MsxaxL?=
 =?us-ascii?Q?fvOgmN8n13OGFly36lWWbGlVzzAqxq8aWSid1F9BcYFdTIhto5mdifJRzztp?=
 =?us-ascii?Q?d8n0ATbKzBuWTbt4VuBJyT6RtCVLUKD1JDKBB8ubhstLSqRTjm7pkzbOfdcN?=
 =?us-ascii?Q?5Ci9S2QeuvSHKhm+aUCN9OJRK/7rAnVo/sbbSFQywknoi8Yu8UnvVhhoPzKP?=
 =?us-ascii?Q?K6euZFsq/KHPMLLgP5mLsF2jyEVuN4l9tJicPTeQM1eHV4Uhcn2M3BSC3oks?=
 =?us-ascii?Q?Udq/1q/LtqRJMgdcNukSWXRjJnx81zldZTEQh8i7C4J1qgCBuN1u0CSm83vg?=
 =?us-ascii?Q?W+5lpS0GwgBqEkV4BUGDz3PQMNZbB9gs3ukrO8CgK6l+mba/t8uIgOcRX7oP?=
 =?us-ascii?Q?emKzZlQTasmxtlI0lSk+7m1SZbiABRLiLtv/ZEuqnPdpq9r5tv/Q3Y3EMUVA?=
 =?us-ascii?Q?mgpOddvR54PRDxfRiTVOpYrZ+qbB2+qnlLj5k4aMSBtpZZdTPeWNKRanvZ8z?=
 =?us-ascii?Q?zWcRYFkfQtt0zAHerBOo4BF9K1hQvSF5iWmyqlF2OnmSR1ejiYWVCXEvD2cl?=
 =?us-ascii?Q?vhty+ip1+YaSBf0roS3IencXFtegwRWriggMUU/qU9hMowbchLt4Uc7rqLAE?=
 =?us-ascii?Q?tN1S7HybQxzwg06ZhNsXkG0bDhxifHklinYYNwRx07WADDfmCJ87SLwN4kwm?=
 =?us-ascii?Q?EucFwnvhqyKjP4m1dObiSP+oHppmnEmmNcU2LX4U7TGJEEzu5lmuYSBNb2ED?=
 =?us-ascii?Q?+KKtYf9kaHehiaMaGnSN9p2L8lnYVnLjaJ3a4ThApv+F0Rw2XOjz04DL2EDM?=
 =?us-ascii?Q?qiMPcjXumoO4m9A+hPLLIDNJE73nHz2NaNSmYRARETBGpZ3Q67yxs8N4YA2C?=
 =?us-ascii?Q?+D00XBlUZteBiYwx1ngmsOVv9MaCrWkXjgDAJStrg7Nps1u+wxrigCgRxLsl?=
 =?us-ascii?Q?jauMlPdojmlF0hRuziJX3yDPkV6K5ECZAZOpm0r85+/InJL6+EBUHO2JtxJN?=
 =?us-ascii?Q?XmN4XccZzES/CraRNuNLHkNV4x2GDf9DaQA6E7cgndLcpHyNFWcWeWdlRIV1?=
 =?us-ascii?Q?Jo3YW5SJ8gdxGeDM5RKxBDCwfsYqhFr3YL0iPAwH3Y7AkTFydzlfxhTX6XD1?=
 =?us-ascii?Q?FWQ7ASjDWm1M+dh//DkPvL0=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec8bf362-d590-446f-a592-08d9f8088145
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 02:42:46.2981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1NzEnVg+AYvoClai3KswtX7wA17rzYlG/Vcf7WgNmW/9G7cnK0dycSetRJxQ0qsZbcpzRYAnozKsJHW4uXh6Ew==
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
and compare test. The flash uses for reads SPINOR_OP_READ_1_4_4_4B 0xec,
for erases SPINOR_OP_BE_4K_4B 0x21, and for writes SPINOR_OP_PP_4B 0x12.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Link: https://lore.kernel.org/r/20211207140254.87681-15-tudor.ambarus@microchip.com
---
 drivers/mtd/spi-nor/issi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 6707fcfda055..c4fff3c36356 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -46,7 +46,7 @@ static const struct flash_info issi_parts[] = {
 	{ "is25lp128",  INFO(0x9d6018, 0, 64 * 1024, 256)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "is25lp256",  INFO(0x9d6019, 0, 64 * 1024, 512)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		PARSE_SFDP
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		.fixups = &is25lp256_fixups },
 	{ "is25wp032",  INFO(0x9d7016, 0, 64 * 1024,  64)
-- 
2.17.1

