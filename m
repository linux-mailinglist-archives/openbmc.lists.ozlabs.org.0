Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9954C3C04
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 03:57:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4ZFY7347z3bT5
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 13:57:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=F4qAj+Ea;
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
 header.s=selector2-quantacorp-onmicrosoft-com header.b=F4qAj+Ea; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20703.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::703])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Ywp1lHtz3bbG
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 13:43:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F6nJu1QiQmmnoUkzUzl+Rfl4kXFq/teUKcJoInm9fyvHKKtmyhcB5pOTMThVaNTHBvI77GP+F4AEkz/SL0AXIcX+2qzTbSQOLVn6TEzodA8X7K9C76SrUhDe1ilnyVESlLF3eUARP6IuzyZkuSPiBfA/XNLDYZiRBzQFiVItoxVoCYtAEgJspnUE1uaLK6oUYrheiJsBH8QCTyWKwtVVr0hjUvHnm1hERE7TPZoffC5EOBE1aPnqfMZ3OZb7nc/3pRvVs23GZikKk3j7Ud8JOi35/oQ+sQcRjFIBiSQe9QNYrwAvpA0vTla8GAVLSwAl78emwq4R+BXZLrnv5Wg2eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNC3qnsBNIuq+iwwSNACIhpYQd+ZbJQB+0A+8l9EAeY=;
 b=m+DMG7FQfcoLjXzKN4BtS9DSkIbRJT+YlnHNkppD2KVwCsPo+x/vbzo57q+qwwQXmoE+naHTy8uLn/fVzjp/5JKBQ+74BU7/izRKhfurwJkLawWnmpWuQEeH65BeYUU5ZZT90+7AIEEDWDB/mbZKpaGvOGzBal0MP97rzc0Naltfg6leqc5DaYWp9hmwZ0WQ13Hqukys+K4TvbG8iPQSh1chCitHY2p7nJBiyuSKDav++ZUrXZyKuLfqox6SGV3t5hZ+Ft6A7yGEJFP4ck/9ygDBf2DrkD2ibOsDCdqYeiiMAhtrYTU1Y1SHtEx3O5j/zjq4HA5IvlbtI1RwANpllg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNC3qnsBNIuq+iwwSNACIhpYQd+ZbJQB+0A+8l9EAeY=;
 b=F4qAj+EarL033pxH+KWdaXkUESGFUgQ3w76OvWHhhDjIpncft8kRL3iF7JuTDsoSPtjGJW8uJDoznQdiTEN4ml/t185ncP5tGlXf8kfguwiM6AIgSakAe7war7FkVhC9+Ao6iPDPObZyOFy9TlbVHMOjcMiRIHihWcFzA4RyVcA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by KL1PR0401MB4147.apcprd04.prod.outlook.com (2603:1096:820:28::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Fri, 25 Feb
 2022 02:42:45 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 02:42:44 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 17/26] mtd: spi-nor: Rework the flash_info flags
Date: Fri, 25 Feb 2022 10:42:12 +0800
Message-Id: <20220225024221.19422-18-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225024221.19422-1-potin.lai@quantatw.com>
References: <20220225024221.19422-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:202:16::19) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c97552f-532c-4288-f356-08d9f8087eff
X-MS-TrafficTypeDiagnostic: KL1PR0401MB4147:EE_
X-Microsoft-Antispam-PRVS: <KL1PR0401MB4147B4D748741766B6F8AE798E3E9@KL1PR0401MB4147.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u5QURvVu52cbaVaYJAADQP++CjHJRbeNmCeBfzJz8sGVnvQPXvtQgYzbrQvg0X6lCoNDaHoedpYPE7vH56mxOG2fJGByLHGxpx4N5q8E0imn/tHJIi8FcdhW7oD/sTGuxSx5Qv8pZHBzWFIErWZeDvoC5qGVWz+8aLvfqpmuSmSFvnhwKf+a8kG6VXJIXxmgI+O2ZNLs+KDOdU6Nr4WF9Tsdg+0CLrYhtgNcuBKslBinMGkSaCxUaKAxZBY7aZNq4Ocgpwe8f7zphkTfMrqgF8XiSbvZ8/ehOEMojoLOguOczU0q7VYVEnIjFcbM1h0194JFLaOe7wPqGYFQQz3rsWnX+7gDLR3r+l50RFSSct/BsraJat7EoakcY6Ri/j581q2ViaSx3oFPMSxxppG5ACwE50xKa0OAjtP7Pov9lkHSlTWsC1TBQkY2qJHwIqPec6VL1aAAG5ZgNbb524UWESv0yOQV0huxwJQdUzOs8Se6S6E00cC6ytIriH+7ooraTL4wyk+ylSfzto4Urt/p3WKfHIznGrBOAGpDVDAAz767J2inHsvu2TKDqZiI04WrcDzx95u061h2ZFRkTTtW8UlmZh+Bsc5dCYy9YT9y4o+4O1JhapXiWYQFRHGEQMQkNQDElxAWhpKo+luOgt13vPQ0S8uSRcAN+kaNELfpcVV56CAJDWOdm6UfiJMYZRKuUt0w00qS8wu0vU3WtYjKxhB+LoCNfGFwNpieYqmtWWlHXTEKq8KvE9rkxB/H19XzUzjHtPNWy7ecbTN62GzLT/eAuVTUPf8q33Z9mAy2sh0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(66556008)(5660300002)(52116002)(36756003)(8676002)(8936002)(6506007)(6512007)(6666004)(66946007)(4326008)(316002)(30864003)(44832011)(54906003)(1076003)(2616005)(186003)(83380400001)(6486002)(966005)(86362001)(2906002)(26005)(38100700002)(38350700002)(508600001)(579004)(559001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S7lHTUiUAnG/iQeaT/QOOFg3cAbQDeR5XCw2KDpxayizsuqlGVF3TCHVLjWo?=
 =?us-ascii?Q?Khu7cG8hwXuzhpd0Y4T9ICpYB6xn4XZRXxJ7CxpiDv4JH8TsokGwYvUjmlTD?=
 =?us-ascii?Q?dUT2Hxs9pOKCPTO/lih17Nmd0hs0zQQ+qdLtxB+qDPoIjgK3yzGoqMoLT04b?=
 =?us-ascii?Q?pHWiJgt2H7Kpv+k8VaNhprMjQaFPyv8LjDRAKtnCghSaBrqN/QzHfSuvYLOb?=
 =?us-ascii?Q?8HtOK68cLH7Qzo8gAT4HSjg1vbg1nc668yD3LfNqCyxy1WGFuFngVRBo3LXP?=
 =?us-ascii?Q?3xiFeOS5DvaeyIFJ41MkOsvYdbMKa2Xa9T904ZlmpD3KqH8mjsmkHUp5b7/t?=
 =?us-ascii?Q?9aXpoAe0cpH8TVi5ohewPsQWp/AVMXQawx274BX10grKxSnEBR2j51XVJ/YZ?=
 =?us-ascii?Q?LTjRH0GqEJ9Ht73b85yBzo5drRBNDxwqx7tUsMOWMMt1HuLR7PpUMw5MkoNI?=
 =?us-ascii?Q?/S8+nA92y9epckozVy0G3LTUJZhgx/0cAkFmqXqorC/GnG4f3wvd2kIAvBS5?=
 =?us-ascii?Q?YFfx2TWR1142yfB7/YoCRpRuQXnC0O6Nn00WdwjGc/ecbj3q/6vZDYE3qcWx?=
 =?us-ascii?Q?vD41hCpuu4qHdEP5q4Hwk7NkjRgIf+bJ79v+VlyA2BtBrweBv/N/+Z2b0u00?=
 =?us-ascii?Q?iLfuFJJMHd4iAeza4nkING8qcx3IbQ3ZD2KiddNVxg+wZM1BtAVp4akb7WNC?=
 =?us-ascii?Q?wJVEtwQfaJLoSgRJ+QP2ph53xgx7bzcaXfiEZ60yBTzrm8e7C9uF/XNODz2y?=
 =?us-ascii?Q?YvZj2n/ljhm/qiMfNbW8gDEnemYkWc6ZafHw+NkKRUtDzZw0J8NqAqrm4DOB?=
 =?us-ascii?Q?BXFWYpj9TPKrhVgQiHbRz0zMCaxk1vCYeuLZaVMRvkKQGaMhJ+6epDMrV/hh?=
 =?us-ascii?Q?gksb3/lHNPUvYKxv8OgSgwGm1v8Tw5QDTOwfAwoc+Oo+g4XU+WtuxRL8+Hqk?=
 =?us-ascii?Q?DxZGtMTay+vFOanFdsrcsld1vdxmVzmP5O8bWeRUlW0w8m9HRun6rVzUNXvg?=
 =?us-ascii?Q?LBIVMWLB6WrWmi7BaL4QObss3cWMZHjdiGRKJkjprG5lCUbjN9e/qxVvuTdD?=
 =?us-ascii?Q?ckBWcgwg0gCRjFjj1lEzGYcbNNTzC+TxKBeqrCoEr5VUIfYbhCy7yRY1UlQU?=
 =?us-ascii?Q?SceJAymFifXhNWlgqB3yALk+Pqe6QlqHgkiNsqy6gk9ECPCYBKTmreGyFMgG?=
 =?us-ascii?Q?TvAKbTKZOj3tiDw/PZEK0N401p7uAYak+1XMV2Oz6tTJZ0q40SaGzNBrm2Q5?=
 =?us-ascii?Q?fLyQ763Jb0+OEW7cI9oMnuGUaD0LzyZgGy/3YtmVncZ7Uobz+tHQQIkTHhyj?=
 =?us-ascii?Q?Al60IQ9A05gm1fGN80LWhHwdMiOzeCvwgwOmj6asN62kVbffbVZ48GNEcScs?=
 =?us-ascii?Q?D5wJGnC5HGTZlwfRioJDDz4LwUkWJ8aM0lrayMK494SURLcPJzKtnPfo18n5?=
 =?us-ascii?Q?pORTpTnpHR1bWr2b67xBgasJysJf/Ikw1F4ROAr/2sNrK1jKGHmgT0V671h1?=
 =?us-ascii?Q?fWd8SIa2NOzRi4LTIYiY9V5vBBOfVqJfhOGzW+beYWOmJ2Y7kMcOyp6sB7Ib?=
 =?us-ascii?Q?OCxHcpTsdcqoX/BJlr1b+V/nbA+t9ivifHN9Y2ehrdX/y//xmywwRV1L1GMr?=
 =?us-ascii?Q?3vFNfjSGDFq9d5uOLSxAYJY=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c97552f-532c-4288-f356-08d9f8087eff
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 02:42:42.5328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nBEvFv9AEkhTEM4DKOXJBzVokRn7nhCF8r+Jv5zmjtzU10FqXLEYUNM9f1rAbc4OApLncXfjcy4pGE4lPVMhMw==
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

Clarify for what the flash_info flags are used for. Split them in
four categories and a bool:
1/ FLAGS: flags that indicate support that is not defined by the JESD216
   standard in its SFDP tables.
2/ NO_SFDP_FLAGS: these flags are used when the flash does not define the
   SFDP tables. These flags indicate support that can be discovered via
   SFDP. Used together with SPI_NOR_SKIP_SFDP flag.
3/ FIXUP_FLAGS: flags that indicate support that can be discovered
   via SFDP ideally, but can not be discovered for this particular flash
   because the SFDP table that indicates this support is not defined by
   the flash. In case the table for this support is defined but has wrong
   values, one should instead use a post_sfdp() hook to set the SNOR_F
   equivalent flag.
4/ MFR_FLAGS: manufacturer private flags. Used in the manufacturer
   fixup hooks to differentiate support between flashes of the same
   manufacturer.
5/ PARSE_SFDP: sets info->parse_sfdp to true. All flash_info entries
   that support SFDP should be converted to set info->parse_sfdp to true.

SPI NOR flashes that statically declare one of the
SPI_NOR_{DUAL, QUAD, OCTAL, OCTAL_DTR}_READ flags and do not support
the RDSFDP command are gratuiously receiving the RDSFDP command
in the attempt of parsing the SFDP tables. It is not desirable to issue
commands that are not supported, so introduce PARSE_SFDP to help on this
situation.

New flash additions/updates should be declared/updated to use either
PARSE_SFDP or SPI_NOR_SKIP_SFDP.  Once all the flash_info entries are
converted to use SPI_NOR_SKIP_SFDP or PARSE_SFDP, we can get rid of the
SPI_NOR_SKIP_SFDP flag and use just the bool nor->info->parse_sfdp to
determine whether to parse SFDP or not. SPI_NOR_SKIP_SFDP flag is kept
just as a way to differentiate whether a flash is converted to the new
flags logic or not.
Support that can be discovered when parsing SFDP should not be duplicated
by explicit flags at flash declaration. All the flash parameters will be
discovered when parsing SFDP. Sometimes manufacturers wrongly define some
fields in the SFDP tables. If that's the case, SFDP data can be amended
with the fixups() hooks. It is not common, but if the SFDP tables are
entirely wrong, and it does not worth the hassle to tweak the SFDP
parameters by using the fixups hooks, or if the flash does not define the
SFDP tables at all, then statically init the flash with the
SPI_NOR_SKIP_SFDP flag and specify the rest of flash capabilities with
the flash info flags.

With time, we want to convert all flashes to use PARSE_SFDP and
stop triggering the SFDP parsing with the
SPI_NOR_{DUAL, QUAD, OCTAL*}_READ flags. Getting rid of the
SPI_NOR_{OCTAL, OCTAL_DTR}_READ trigger is easily achievable,
the rest are a long term goal.

Manufacturer specific flags like USE_CLSR, USE_FSR, SPI_NOR_XSR_RDY,
will be removed in a future series.

No functional changes intended in this patch.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Link: https://lore.kernel.org/r/20211207140254.87681-7-tudor.ambarus@microchip.com
---
 drivers/mtd/spi-nor/atmel.c      |  71 ++++++-----
 drivers/mtd/spi-nor/catalyst.c   |  15 +--
 drivers/mtd/spi-nor/core.c       |  52 ++++----
 drivers/mtd/spi-nor/core.h       | 204 +++++++++++++++++-------------
 drivers/mtd/spi-nor/eon.c        |  33 ++---
 drivers/mtd/spi-nor/esmt.c       |  15 ++-
 drivers/mtd/spi-nor/everspin.c   |  12 +-
 drivers/mtd/spi-nor/fujitsu.c    |   3 +-
 drivers/mtd/spi-nor/gigadevice.c |  57 +++++----
 drivers/mtd/spi-nor/intel.c      |  12 +-
 drivers/mtd/spi-nor/issi.c       |  60 ++++-----
 drivers/mtd/spi-nor/macronix.c   | 105 +++++++++-------
 drivers/mtd/spi-nor/micron-st.c  | 210 ++++++++++++++++---------------
 drivers/mtd/spi-nor/spansion.c   | 157 ++++++++++++-----------
 drivers/mtd/spi-nor/sst.c        |  83 ++++++------
 drivers/mtd/spi-nor/winbond.c    | 168 ++++++++++++++-----------
 drivers/mtd/spi-nor/xmc.c        |  10 +-
 17 files changed, 699 insertions(+), 568 deletions(-)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index d0e7883b38e3..d6d889ce8876 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -157,39 +157,48 @@ static const struct spi_nor_fixups atmel_global_protection_fixups = {
 
 static const struct flash_info atmel_parts[] = {
 	/* Atmel -- some are (confusingly) marketed as "DataFlash" */
-	{ "at25fs010",  INFO(0x1f6601, 0, 32 * 1024,   4, SECT_4K | SPI_NOR_HAS_LOCK)
+	{ "at25fs010",  INFO(0x1f6601, 0, 32 * 1024,   4)
+		FLAGS(SPI_NOR_HAS_LOCK)
+		NO_SFDP_FLAGS(SECT_4K)
 		.fixups = &atmel_at25fs_fixups },
-	{ "at25fs040",  INFO(0x1f6604, 0, 64 * 1024,   8, SECT_4K | SPI_NOR_HAS_LOCK)
+	{ "at25fs040",  INFO(0x1f6604, 0, 64 * 1024,   8)
+		FLAGS(SPI_NOR_HAS_LOCK)
+		NO_SFDP_FLAGS(SECT_4K)
 		.fixups = &atmel_at25fs_fixups },
-
-	{ "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8,
-			     SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-			.fixups = &atmel_global_protection_fixups },
-	{ "at25df321",  INFO(0x1f4700, 0, 64 * 1024,  64,
-			     SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-			.fixups = &atmel_global_protection_fixups },
-	{ "at25df321a", INFO(0x1f4701, 0, 64 * 1024,  64,
-			     SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-			.fixups = &atmel_global_protection_fixups },
-	{ "at25df641",  INFO(0x1f4800, 0, 64 * 1024, 128,
-			     SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-			.fixups = &atmel_global_protection_fixups },
-
-	{ "at25sl321",	INFO(0x1f4216, 0, 64 * 1024, 64,
-			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-
-	{ "at26f004",   INFO(0x1f0400, 0, 64 * 1024,  8, SECT_4K) },
-	{ "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16,
-			     SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-			.fixups = &atmel_global_protection_fixups },
-	{ "at26df161a", INFO(0x1f4601, 0, 64 * 1024, 32,
-			     SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-			.fixups = &atmel_global_protection_fixups },
-	{ "at26df321",  INFO(0x1f4700, 0, 64 * 1024, 64,
-			     SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-			.fixups = &atmel_global_protection_fixups },
-
-	{ "at45db081d", INFO(0x1f2500, 0, 64 * 1024, 16, SECT_4K) },
+	{ "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
+		NO_SFDP_FLAGS(SECT_4K)
+		.fixups = &atmel_global_protection_fixups },
+	{ "at25df321",  INFO(0x1f4700, 0, 64 * 1024,  64)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
+		NO_SFDP_FLAGS(SECT_4K)
+		.fixups = &atmel_global_protection_fixups },
+	{ "at25df321a", INFO(0x1f4701, 0, 64 * 1024,  64)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
+		NO_SFDP_FLAGS(SECT_4K)
+		.fixups = &atmel_global_protection_fixups },
+	{ "at25df641",  INFO(0x1f4800, 0, 64 * 1024, 128)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
+		NO_SFDP_FLAGS(SECT_4K)
+		.fixups = &atmel_global_protection_fixups },
+	{ "at25sl321",	INFO(0x1f4216, 0, 64 * 1024, 64)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "at26f004",   INFO(0x1f0400, 0, 64 * 1024,  8)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
+		NO_SFDP_FLAGS(SECT_4K)
+		.fixups = &atmel_global_protection_fixups },
+	{ "at26df161a", INFO(0x1f4601, 0, 64 * 1024, 32)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
+		NO_SFDP_FLAGS(SECT_4K)
+		.fixups = &atmel_global_protection_fixups },
+	{ "at26df321",  INFO(0x1f4700, 0, 64 * 1024, 64)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
+		NO_SFDP_FLAGS(SECT_4K)
+		.fixups = &atmel_global_protection_fixups },
+	{ "at45db081d", INFO(0x1f2500, 0, 64 * 1024, 16)
+		NO_SFDP_FLAGS(SECT_4K) },
 };
 
 const struct spi_nor_manufacturer spi_nor_atmel = {
diff --git a/drivers/mtd/spi-nor/catalyst.c b/drivers/mtd/spi-nor/catalyst.c
index 011b83e99e95..ae4d67e01bb3 100644
--- a/drivers/mtd/spi-nor/catalyst.c
+++ b/drivers/mtd/spi-nor/catalyst.c
@@ -10,16 +10,11 @@
 
 static const struct flash_info catalyst_parts[] = {
 	/* Catalyst / On Semiconductor -- non-JEDEC */
-	{ "cat25c11", CAT25_INFO(16, 8, 16, 1,
-				 SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
-	{ "cat25c03", CAT25_INFO(32, 8, 16, 2,
-				 SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
-	{ "cat25c09", CAT25_INFO(128, 8, 32, 2,
-				 SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
-	{ "cat25c17", CAT25_INFO(256, 8, 32, 2,
-				 SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
-	{ "cat25128", CAT25_INFO(2048, 8, 64, 2,
-				 SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
+	{ "cat25c11", CAT25_INFO(16, 8, 16, 1) },
+	{ "cat25c03", CAT25_INFO(32, 8, 16, 2) },
+	{ "cat25c09", CAT25_INFO(128, 8, 32, 2) },
+	{ "cat25c17", CAT25_INFO(256, 8, 32, 2) },
+	{ "cat25128", CAT25_INFO(2048, 8, 64, 2) },
 };
 
 const struct spi_nor_manufacturer spi_nor_catalyst = {
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 115261f0e904..25e2b4889093 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2540,6 +2540,7 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 	struct spi_nor_erase_map *map = &params->erase_map;
 	const struct flash_info *info = nor->info;
 	struct device_node *np = spi_nor_get_flash_node(nor);
+	const u8 no_sfdp_flags = info->no_sfdp_flags;
 	u8 i, erase_mask;
 
 	/* Initialize default flash parameters and settings. */
@@ -2576,28 +2577,28 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 					  0, 8, SPINOR_OP_READ_FAST,
 					  SNOR_PROTO_1_1_1);
 
-	if (info->flags & SPI_NOR_DUAL_READ) {
+	if (no_sfdp_flags & SPI_NOR_DUAL_READ) {
 		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_2;
 		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_2],
 					  0, 8, SPINOR_OP_READ_1_1_2,
 					  SNOR_PROTO_1_1_2);
 	}
 
-	if (info->flags & SPI_NOR_QUAD_READ) {
+	if (no_sfdp_flags & SPI_NOR_QUAD_READ) {
 		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_4;
 		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_4],
 					  0, 8, SPINOR_OP_READ_1_1_4,
 					  SNOR_PROTO_1_1_4);
 	}
 
-	if (info->flags & SPI_NOR_OCTAL_READ) {
+	if (no_sfdp_flags & SPI_NOR_OCTAL_READ) {
 		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_8;
 		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_8],
 					  0, 8, SPINOR_OP_READ_1_1_8,
 					  SNOR_PROTO_1_1_8);
 	}
 
-	if (info->flags & SPI_NOR_OCTAL_DTR_READ) {
+	if (no_sfdp_flags & SPI_NOR_OCTAL_DTR_READ) {
 		params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
 		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_8_8_8_DTR],
 					  0, 20, SPINOR_OP_READ_FAST,
@@ -2609,7 +2610,7 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP],
 				SPINOR_OP_PP, SNOR_PROTO_1_1_1);
 
-	if (info->flags & SPI_NOR_OCTAL_DTR_PP) {
+	if (no_sfdp_flags & SPI_NOR_OCTAL_DTR_PP) {
 		params->hwcaps.mask |= SNOR_HWCAPS_PP_8_8_8_DTR;
 		/*
 		 * Since xSPI Page Program opcode is backward compatible with
@@ -2625,12 +2626,12 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 	 */
 	erase_mask = 0;
 	i = 0;
-	if (info->flags & SECT_4K_PMC) {
+	if (no_sfdp_flags & SECT_4K_PMC) {
 		erase_mask |= BIT(i);
 		spi_nor_set_erase_type(&map->erase_type[i], 4096u,
 				       SPINOR_OP_BE_4K_PMC);
 		i++;
-	} else if (info->flags & SECT_4K) {
+	} else if (no_sfdp_flags & SECT_4K) {
 		erase_mask |= BIT(i);
 		spi_nor_set_erase_type(&map->erase_type[i], 4096u,
 				       SPINOR_OP_BE_4K);
@@ -2712,9 +2713,12 @@ static int spi_nor_init_params(struct spi_nor *nor)
 
 	spi_nor_manufacturer_init_params(nor);
 
-	if ((nor->info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-				 SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ)) &&
-	    !(nor->info->flags & SPI_NOR_SKIP_SFDP))
+	if ((nor->info->parse_sfdp ||
+	     (nor->info->no_sfdp_flags & (SPI_NOR_DUAL_READ |
+					  SPI_NOR_QUAD_READ |
+					  SPI_NOR_OCTAL_READ |
+					  SPI_NOR_OCTAL_DTR_READ))) &&
+	    !(nor->info->no_sfdp_flags & SPI_NOR_SKIP_SFDP))
 		spi_nor_sfdp_init_params(nor);
 
 	spi_nor_late_init_params(nor);
@@ -3093,6 +3097,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	struct device_node *np = spi_nor_get_flash_node(nor);
 	int ret;
 	int i;
+	u16 flags;
+	u8 fixup_flags;
 
 	ret = spi_nor_check(nor);
 	if (ret)
@@ -3122,6 +3128,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		return PTR_ERR(info);
 
 	nor->info = info;
+	flags = info->flags;
 
 	spi_nor_debugfs_init(nor, info);
 
@@ -3132,10 +3139,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	 * spi_nor_wait_till_ready(). Xilinx S3AN share MFR
 	 * with Atmel SPI NOR.
 	 */
-	if (info->flags & SPI_NOR_XSR_RDY)
+	if (flags & SPI_NOR_XSR_RDY)
 		nor->flags |=  SNOR_F_READY_XSR_RDY;
 
-	if (info->flags & SPI_NOR_HAS_LOCK)
+	if (flags & SPI_NOR_HAS_LOCK)
 		nor->flags |= SNOR_F_HAS_LOCK;
 
 	/* Init flash parameters based on flash_info struct and SFDP */
@@ -3143,24 +3150,24 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (ret)
 		return ret;
 
-	if (info->flags & USE_FSR)
+	if (flags & USE_FSR)
 		nor->flags |= SNOR_F_USE_FSR;
-	if (info->flags & SPI_NOR_HAS_TB) {
+	if (flags & SPI_NOR_HAS_TB) {
 		nor->flags |= SNOR_F_HAS_SR_TB;
-		if (info->flags & SPI_NOR_TB_SR_BIT6)
+		if (flags & SPI_NOR_TB_SR_BIT6)
 			nor->flags |= SNOR_F_HAS_SR_TB_BIT6;
 	}
 
-	if (info->flags & NO_CHIP_ERASE)
+	if (flags & NO_CHIP_ERASE)
 		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
-	if (info->flags & USE_CLSR)
+	if (flags & USE_CLSR)
 		nor->flags |= SNOR_F_USE_CLSR;
-	if (info->flags & SPI_NOR_SWP_IS_VOLATILE)
+	if (flags & SPI_NOR_SWP_IS_VOLATILE)
 		nor->flags |= SNOR_F_SWP_IS_VOLATILE;
 
-	if (info->flags & SPI_NOR_4BIT_BP) {
+	if (flags & SPI_NOR_4BIT_BP) {
 		nor->flags |= SNOR_F_HAS_4BIT_BP;
-		if (info->flags & SPI_NOR_BP3_SR_BIT6)
+		if (flags & SPI_NOR_BP3_SR_BIT6)
 			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
 	}
 
@@ -3177,10 +3184,11 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (ret)
 		return ret;
 
-	if (info->flags & SPI_NOR_4B_OPCODES)
+	fixup_flags = info->fixup_flags;
+	if (fixup_flags & SPI_NOR_4B_OPCODES)
 		nor->flags |= SNOR_F_4B_OPCODES;
 
-	if (info->flags & SPI_NOR_IO_MODE_EN_VOLATILE)
+	if (fixup_flags & SPI_NOR_IO_MODE_EN_VOLATILE)
 		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
 
 	ret = spi_nor_set_addr_width(nor);
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index a9fd956eed4e..2afb610853a9 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -313,92 +313,118 @@ struct spi_nor_fixups {
 	void (*late_init)(struct spi_nor *nor);
 };
 
+/**
+ * struct flash_info - SPI NOR flash_info entry.
+ * @name: the name of the flash.
+ * @id:             the flash's ID bytes. The first three bytes are the
+ *                  JEDIC ID. JEDEC ID zero means "no ID" (mostly older chips).
+ * @id_len:         the number of bytes of ID.
+ * @sector_size:    the size listed here is what works with SPINOR_OP_SE, which
+ *                  isn't necessarily called a "sector" by the vendor.
+ * @n_sectors:      the number of sectors.
+ * @page_size:      the flash's page size.
+ * @addr_width:     the flash's address width.
+ *
+ * @parse_sfdp:     true when flash supports SFDP tables. The false value has no
+ *                  meaning. If one wants to skip the SFDP tables, one should
+ *                  instead use the SPI_NOR_SKIP_SFDP sfdp_flag.
+ * @flags:          flags that indicate support that is not defined by the
+ *                  JESD216 standard in its SFDP tables. Flag meanings:
+ *   SPI_NOR_HAS_LOCK:        flash supports lock/unlock via SR
+ *   SPI_NOR_HAS_TB:          flash SR has Top/Bottom (TB) protect bit. Must be
+ *                            used with SPI_NOR_HAS_LOCK.
+ *   SPI_NOR_TB_SR_BIT6:      Top/Bottom (TB) is bit 6 of status register.
+ *                            Must be used with SPI_NOR_HAS_TB.
+ *   SPI_NOR_4BIT_BP:         flash SR has 4 bit fields (BP0-3) for block
+ *                            protection.
+ *   SPI_NOR_BP3_SR_BIT6:     BP3 is bit 6 of status register. Must be used with
+ *                            SPI_NOR_4BIT_BP.
+ *   SPI_NOR_SWP_IS_VOLATILE: flash has volatile software write protection bits.
+ *                            Usually these will power-up in a write-protected
+ *                            state.
+ *   SPI_NOR_NO_ERASE:        no erase command needed.
+ *   NO_CHIP_ERASE:           chip does not support chip erase.
+ *   SPI_NOR_NO_FR:           can't do fastread.
+ *   USE_CLSR:                use CLSR command.
+ *   USE_FSR:                 use flag status register
+ *   SPI_NOR_XSR_RDY:         S3AN flashes have specific opcode to read the
+ *                            status register.
+ *
+ * @no_sfdp_flags:  flags that indicate support that can be discovered via SFDP.
+ *                  Used when SFDP tables are not defined in the flash. These
+ *                  flags are used together with the SPI_NOR_SKIP_SFDP flag.
+ *   SPI_NOR_SKIP_SFDP:       skip parsing of SFDP tables.
+ *   SECT_4K:                 SPINOR_OP_BE_4K works uniformly.
+ *   SECT_4K_PMC:             SPINOR_OP_BE_4K_PMC works uniformly.
+ *   SPI_NOR_DUAL_READ:       flash supports Dual Read.
+ *   SPI_NOR_QUAD_READ:       flash supports Quad Read.
+ *   SPI_NOR_OCTAL_READ:      flash supports Octal Read.
+ *   SPI_NOR_OCTAL_DTR_READ:  flash supports octal DTR Read.
+ *   SPI_NOR_OCTAL_DTR_PP:    flash supports Octal DTR Page Program.
+ *
+ * @fixup_flags:    flags that indicate support that can be discovered via SFDP
+ *                  ideally, but can not be discovered for this particular flash
+ *                  because the SFDP table that indicates this support is not
+ *                  defined by the flash. In case the table for this support is
+ *                  defined but has wrong values, one should instead use a
+ *                  post_sfdp() hook to set the SNOR_F equivalent flag.
+ *
+ *   SPI_NOR_4B_OPCODES:      use dedicated 4byte address op codes to support
+ *                            memory size above 128Mib.
+ *   SPI_NOR_IO_MODE_EN_VOLATILE: flash enables the best available I/O mode
+ *                            via a volatile bit.
+ * @mfr_flags:      manufacturer private flags. Used in the manufacturer fixup
+ *                  hooks to differentiate support between flashes of the same
+ *                  manufacturer.
+ * @otp_org:        flash's OTP organization.
+ * @fixups:         part specific fixup hooks.
+ */
 struct flash_info {
-	char		*name;
-
-	/*
-	 * This array stores the ID bytes.
-	 * The first three bytes are the JEDIC ID.
-	 * JEDEC ID zero means "no ID" (mostly older chips).
-	 */
-	u8		id[SPI_NOR_MAX_ID_LEN];
-	u8		id_len;
-
-	/* The size listed here is what works with SPINOR_OP_SE, which isn't
-	 * necessarily called a "sector" by the vendor.
-	 */
-	unsigned	sector_size;
-	u16		n_sectors;
-
-	u16		page_size;
-	u16		addr_width;
-
-	u32		flags;
-#define SECT_4K			BIT(0)	/* SPINOR_OP_BE_4K works uniformly */
-#define SPI_NOR_NO_ERASE	BIT(1)	/* No erase command needed */
-#define SPI_NOR_NO_FR		BIT(3)	/* Can't do fastread */
-#define SECT_4K_PMC		BIT(4)	/* SPINOR_OP_BE_4K_PMC works uniformly */
-#define SPI_NOR_DUAL_READ	BIT(5)	/* Flash supports Dual Read */
-#define SPI_NOR_QUAD_READ	BIT(6)	/* Flash supports Quad Read */
-#define USE_FSR			BIT(7)	/* use flag status register */
-#define SPI_NOR_HAS_LOCK	BIT(8)	/* Flash supports lock/unlock via SR */
-#define SPI_NOR_HAS_TB		BIT(9)	/*
-					 * Flash SR has Top/Bottom (TB) protect
-					 * bit. Must be used with
-					 * SPI_NOR_HAS_LOCK.
-					 */
-#define SPI_NOR_XSR_RDY		BIT(10)	/*
-					 * S3AN flashes have specific opcode to
-					 * read the status register.
-					 */
-#define SPI_NOR_4B_OPCODES	BIT(11)	/*
-					 * Use dedicated 4byte address op codes
-					 * to support memory size above 128Mib.
-					 */
-#define NO_CHIP_ERASE		BIT(12) /* Chip does not support chip erase */
-#define SPI_NOR_SKIP_SFDP	BIT(13)	/* Skip parsing of SFDP tables */
-#define USE_CLSR		BIT(14)	/* use CLSR command */
-#define SPI_NOR_OCTAL_READ	BIT(15)	/* Flash supports Octal Read */
-#define SPI_NOR_TB_SR_BIT6	BIT(16)	/*
-					 * Top/Bottom (TB) is bit 6 of
-					 * status register. Must be used with
-					 * SPI_NOR_HAS_TB.
-					 */
-#define SPI_NOR_4BIT_BP		BIT(17) /*
-					 * Flash SR has 4 bit fields (BP0-3)
-					 * for block protection.
-					 */
-#define SPI_NOR_BP3_SR_BIT6	BIT(18) /*
-					 * BP3 is bit 6 of status register.
-					 * Must be used with SPI_NOR_4BIT_BP.
-					 */
-#define SPI_NOR_OCTAL_DTR_READ	BIT(19) /* Flash supports octal DTR Read. */
-#define SPI_NOR_OCTAL_DTR_PP	BIT(20) /* Flash supports Octal DTR Page Program */
-#define SPI_NOR_IO_MODE_EN_VOLATILE	BIT(21) /*
-						 * Flash enables the best
-						 * available I/O mode via a
-						 * volatile bit.
-						 */
-#define SPI_NOR_SWP_IS_VOLATILE	BIT(22)	/*
-					 * Flash has volatile software write
-					 * protection bits. Usually these will
-					 * power-up in a write-protected state.
-					 */
-	u8 mfr_flags;			/*
-					 * Manufacturer private flags. Used in
-					 * the manufacturer fixup hooks to
-					 * differentiate support between flashes
-					 * of the same manufacturer.
-					 */
+	char *name;
+	u8 id[SPI_NOR_MAX_ID_LEN];
+	u8 id_len;
+	unsigned sector_size;
+	u16 n_sectors;
+	u16 page_size;
+	u16 addr_width;
+
+	bool parse_sfdp;
+	u16 flags;
+#define SPI_NOR_HAS_LOCK		BIT(0)
+#define SPI_NOR_HAS_TB			BIT(1)
+#define SPI_NOR_TB_SR_BIT6		BIT(2)
+#define SPI_NOR_4BIT_BP			BIT(3)
+#define SPI_NOR_BP3_SR_BIT6		BIT(4)
+#define SPI_NOR_SWP_IS_VOLATILE		BIT(5)
+#define SPI_NOR_NO_ERASE		BIT(6)
+#define NO_CHIP_ERASE			BIT(7)
+#define SPI_NOR_NO_FR			BIT(8)
+#define USE_CLSR			BIT(9)
+#define USE_FSR				BIT(10)
+#define SPI_NOR_XSR_RDY			BIT(11)
+
+	u8 no_sfdp_flags;
+#define SPI_NOR_SKIP_SFDP		BIT(0)
+#define SECT_4K				BIT(1)
+#define SECT_4K_PMC			BIT(2)
+#define SPI_NOR_DUAL_READ		BIT(3)
+#define SPI_NOR_QUAD_READ		BIT(4)
+#define SPI_NOR_OCTAL_READ		BIT(5)
+#define SPI_NOR_OCTAL_DTR_READ		BIT(6)
+#define SPI_NOR_OCTAL_DTR_PP		BIT(7)
+
+	u8 fixup_flags;
+#define SPI_NOR_4B_OPCODES		BIT(0)
+#define SPI_NOR_IO_MODE_EN_VOLATILE	BIT(1)
+
+	u8 mfr_flags;
 
 	const struct spi_nor_otp_organization otp_org;
-
-	/* Part specific fixup hooks. */
 	const struct spi_nor_fixups *fixups;
 };
 
 /* Used when the "_ext_id" is two bytes at most */
-#define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
+#define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors)		\
 		.id = {							\
 			((_jedec_id) >> 16) & 0xff,			\
 			((_jedec_id) >> 8) & 0xff,			\
@@ -410,9 +436,8 @@ struct flash_info {
 		.sector_size = (_sector_size),				\
 		.n_sectors = (_n_sectors),				\
 		.page_size = 256,					\
-		.flags = (_flags),
 
-#define INFO6(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
+#define INFO6(_jedec_id, _ext_id, _sector_size, _n_sectors)		\
 		.id = {							\
 			((_jedec_id) >> 16) & 0xff,			\
 			((_jedec_id) >> 8) & 0xff,			\
@@ -425,14 +450,13 @@ struct flash_info {
 		.sector_size = (_sector_size),				\
 		.n_sectors = (_n_sectors),				\
 		.page_size = 256,					\
-		.flags = (_flags),
 
-#define CAT25_INFO(_sector_size, _n_sectors, _page_size, _addr_width, _flags)	\
+#define CAT25_INFO(_sector_size, _n_sectors, _page_size, _addr_width)	\
 		.sector_size = (_sector_size),				\
 		.n_sectors = (_n_sectors),				\
 		.page_size = (_page_size),				\
 		.addr_width = (_addr_width),				\
-		.flags = (_flags),
+		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,		\
 
 #define S3AN_INFO(_jedec_id, _n_sectors, _page_size)			\
 		.id = {							\
@@ -455,6 +479,18 @@ struct flash_info {
 			.n_regions = (_n_regions),			\
 		},
 
+#define PARSE_SFDP							\
+	.parse_sfdp = true,						\
+
+#define FLAGS(_flags)							\
+		.flags = (_flags),					\
+
+#define NO_SFDP_FLAGS(_no_sfdp_flags)					\
+		.no_sfdp_flags = (_no_sfdp_flags),			\
+
+#define FIXUP_FLAGS(_fixup_flags)					\
+		.fixup_flags = (_fixup_flags),				\
+
 #define MFR_FLAGS(_mfr_flags)						\
 		.mfr_flags = (_mfr_flags),				\
 
diff --git a/drivers/mtd/spi-nor/eon.c b/drivers/mtd/spi-nor/eon.c
index ddb8e3650835..4f3ee6331f37 100644
--- a/drivers/mtd/spi-nor/eon.c
+++ b/drivers/mtd/spi-nor/eon.c
@@ -10,21 +10,24 @@
 
 static const struct flash_info eon_parts[] = {
 	/* EON -- en25xxx */
-	{ "en25f32",    INFO(0x1c3116, 0, 64 * 1024,   64, SECT_4K) },
-	{ "en25p32",    INFO(0x1c2016, 0, 64 * 1024,   64, 0) },
-	{ "en25q32b",   INFO(0x1c3016, 0, 64 * 1024,   64, 0) },
-	{ "en25p64",    INFO(0x1c2017, 0, 64 * 1024,  128, 0) },
-	{ "en25q64",    INFO(0x1c3017, 0, 64 * 1024,  128, SECT_4K) },
-	{ "en25q80a",   INFO(0x1c3014, 0, 64 * 1024,   16,
-			     SECT_4K | SPI_NOR_DUAL_READ) },
-	{ "en25qh16",   INFO(0x1c7015, 0, 64 * 1024,   32,
-			     SECT_4K | SPI_NOR_DUAL_READ) },
-	{ "en25qh32",   INFO(0x1c7016, 0, 64 * 1024,   64, 0) },
-	{ "en25qh64",   INFO(0x1c7017, 0, 64 * 1024,  128,
-			     SECT_4K | SPI_NOR_DUAL_READ) },
-	{ "en25qh128",  INFO(0x1c7018, 0, 64 * 1024,  256, 0) },
-	{ "en25qh256",  INFO(0x1c7019, 0, 64 * 1024,  512, 0) },
-	{ "en25s64",	INFO(0x1c3817, 0, 64 * 1024,  128, SECT_4K) },
+	{ "en25f32",    INFO(0x1c3116, 0, 64 * 1024,   64)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "en25p32",    INFO(0x1c2016, 0, 64 * 1024,   64) },
+	{ "en25q32b",   INFO(0x1c3016, 0, 64 * 1024,   64) },
+	{ "en25p64",    INFO(0x1c2017, 0, 64 * 1024,  128) },
+	{ "en25q64",    INFO(0x1c3017, 0, 64 * 1024,  128)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "en25q80a",   INFO(0x1c3014, 0, 64 * 1024,   16)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
+	{ "en25qh16",   INFO(0x1c7015, 0, 64 * 1024,   32)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
+	{ "en25qh32",   INFO(0x1c7016, 0, 64 * 1024,   64) },
+	{ "en25qh64",   INFO(0x1c7017, 0, 64 * 1024,  128)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
+	{ "en25qh128",  INFO(0x1c7018, 0, 64 * 1024,  256) },
+	{ "en25qh256",  INFO(0x1c7019, 0, 64 * 1024,  512) },
+	{ "en25s64",	INFO(0x1c3817, 0, 64 * 1024,  128)
+		NO_SFDP_FLAGS(SECT_4K) },
 };
 
 const struct spi_nor_manufacturer spi_nor_eon = {
diff --git a/drivers/mtd/spi-nor/esmt.c b/drivers/mtd/spi-nor/esmt.c
index cfc9218c1053..ace1da221566 100644
--- a/drivers/mtd/spi-nor/esmt.c
+++ b/drivers/mtd/spi-nor/esmt.c
@@ -10,12 +10,15 @@
 
 static const struct flash_info esmt_parts[] = {
 	/* ESMT */
-	{ "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64,
-			   SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
-	{ "f25l32qa", INFO(0x8c4116, 0, 64 * 1024, 64,
-			   SECT_4K | SPI_NOR_HAS_LOCK) },
-	{ "f25l64qa", INFO(0x8c4117, 0, 64 * 1024, 128,
-			   SECT_4K | SPI_NOR_HAS_LOCK) },
+	{ "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "f25l32qa", INFO(0x8c4116, 0, 64 * 1024, 64)
+		FLAGS(SPI_NOR_HAS_LOCK)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "f25l64qa", INFO(0x8c4117, 0, 64 * 1024, 128)
+		FLAGS(SPI_NOR_HAS_LOCK)
+		NO_SFDP_FLAGS(SECT_4K) },
 };
 
 const struct spi_nor_manufacturer spi_nor_esmt = {
diff --git a/drivers/mtd/spi-nor/everspin.c b/drivers/mtd/spi-nor/everspin.c
index 04a177a32283..f6c6fb36a428 100644
--- a/drivers/mtd/spi-nor/everspin.c
+++ b/drivers/mtd/spi-nor/everspin.c
@@ -10,14 +10,10 @@
 
 static const struct flash_info everspin_parts[] = {
 	/* Everspin */
-	{ "mr25h128", CAT25_INFO(16 * 1024, 1, 256, 2,
-				 SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
-	{ "mr25h256", CAT25_INFO(32 * 1024, 1, 256, 2,
-				 SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
-	{ "mr25h10",  CAT25_INFO(128 * 1024, 1, 256, 3,
-				 SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
-	{ "mr25h40",  CAT25_INFO(512 * 1024, 1, 256, 3,
-				 SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
+	{ "mr25h128", CAT25_INFO(16 * 1024, 1, 256, 2) },
+	{ "mr25h256", CAT25_INFO(32 * 1024, 1, 256, 2) },
+	{ "mr25h10",  CAT25_INFO(128 * 1024, 1, 256, 3) },
+	{ "mr25h40",  CAT25_INFO(512 * 1024, 1, 256, 3) },
 };
 
 const struct spi_nor_manufacturer spi_nor_everspin = {
diff --git a/drivers/mtd/spi-nor/fujitsu.c b/drivers/mtd/spi-nor/fujitsu.c
index e385d93e756c..5fa8f04f2e35 100644
--- a/drivers/mtd/spi-nor/fujitsu.c
+++ b/drivers/mtd/spi-nor/fujitsu.c
@@ -10,7 +10,8 @@
 
 static const struct flash_info fujitsu_parts[] = {
 	/* Fujitsu */
-	{ "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1, SPI_NOR_NO_ERASE) },
+	{ "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1)
+		FLAGS(SPI_NOR_NO_ERASE) },
 };
 
 const struct spi_nor_manufacturer spi_nor_fujitsu = {
diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index 447d84bb2128..0c32e029b975 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -24,31 +24,38 @@ static struct spi_nor_fixups gd25q256_fixups = {
 };
 
 static const struct flash_info gigadevice_parts[] = {
-	{ "gd25q16", INFO(0xc84015, 0, 64 * 1024,  32,
-			  SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			  SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
-	{ "gd25q32", INFO(0xc84016, 0, 64 * 1024,  64,
-			  SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			  SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
-	{ "gd25lq32", INFO(0xc86016, 0, 64 * 1024, 64,
-			   SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			   SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
-	{ "gd25q64", INFO(0xc84017, 0, 64 * 1024, 128,
-			  SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			  SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
-	{ "gd25lq64c", INFO(0xc86017, 0, 64 * 1024, 128,
-			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
-	{ "gd25lq128d", INFO(0xc86018, 0, 64 * 1024, 256,
-			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			     SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
-	{ "gd25q128", INFO(0xc84018, 0, 64 * 1024, 256,
-			   SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			   SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
-	{ "gd25q256", INFO(0xc84019, 0, 64 * 1024, 512,
-			   SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			   SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK |
-			   SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
+	{ "gd25q16", INFO(0xc84015, 0, 64 * 1024,  32)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "gd25q32", INFO(0xc84016, 0, 64 * 1024,  64)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "gd25lq32", INFO(0xc86016, 0, 64 * 1024, 64)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "gd25q64", INFO(0xc84017, 0, 64 * 1024, 128)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "gd25lq64c", INFO(0xc86017, 0, 64 * 1024, 128)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "gd25lq128d", INFO(0xc86018, 0, 64 * 1024, 256)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "gd25q128", INFO(0xc84018, 0, 64 * 1024, 256)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "gd25q256", INFO(0xc84019, 0, 64 * 1024, 512)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		.fixups = &gd25q256_fixups },
 };
 
diff --git a/drivers/mtd/spi-nor/intel.c b/drivers/mtd/spi-nor/intel.c
index 8ece9cceb3cf..d64e114e9fb4 100644
--- a/drivers/mtd/spi-nor/intel.c
+++ b/drivers/mtd/spi-nor/intel.c
@@ -10,12 +10,12 @@
 
 static const struct flash_info intel_parts[] = {
 	/* Intel/Numonyx -- xxxs33b */
-	{ "160s33b",  INFO(0x898911, 0, 64 * 1024,  32,
-			   SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
-	{ "320s33b",  INFO(0x898912, 0, 64 * 1024,  64,
-			   SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
-	{ "640s33b",  INFO(0x898913, 0, 64 * 1024, 128,
-			   SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
+	{ "160s33b",  INFO(0x898911, 0, 64 * 1024,  32)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
+	{ "320s33b",  INFO(0x898912, 0, 64 * 1024,  64)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
+	{ "640s33b",  INFO(0x898913, 0, 64 * 1024, 128)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
 };
 
 const struct spi_nor_manufacturer spi_nor_intel = {
diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 1e5bb5408b68..6707fcfda055 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -31,38 +31,42 @@ static struct spi_nor_fixups is25lp256_fixups = {
 
 static const struct flash_info issi_parts[] = {
 	/* ISSI */
-	{ "is25cd512",  INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },
-	{ "is25lq040b", INFO(0x9d4013, 0, 64 * 1024,   8,
-			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "is25lp016d", INFO(0x9d6015, 0, 64 * 1024,  32,
-			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "is25lp080d", INFO(0x9d6014, 0, 64 * 1024,  16,
-			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "is25lp032",  INFO(0x9d6016, 0, 64 * 1024,  64,
-			     SECT_4K | SPI_NOR_DUAL_READ) },
-	{ "is25lp064",  INFO(0x9d6017, 0, 64 * 1024, 128,
-			     SECT_4K | SPI_NOR_DUAL_READ) },
-	{ "is25lp128",  INFO(0x9d6018, 0, 64 * 1024, 256,
-			     SECT_4K | SPI_NOR_DUAL_READ) },
-	{ "is25lp256",  INFO(0x9d6019, 0, 64 * 1024, 512,
-			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			     SPI_NOR_4B_OPCODES)
+	{ "is25cd512",  INFO(0x7f9d20, 0, 32 * 1024,   2)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "is25lq040b", INFO(0x9d4013, 0, 64 * 1024,   8)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "is25lp016d", INFO(0x9d6015, 0, 64 * 1024,  32)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "is25lp080d", INFO(0x9d6014, 0, 64 * 1024,  16)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "is25lp032",  INFO(0x9d6016, 0, 64 * 1024,  64)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
+	{ "is25lp064",  INFO(0x9d6017, 0, 64 * 1024, 128)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
+	{ "is25lp128",  INFO(0x9d6018, 0, 64 * 1024, 256)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
+	{ "is25lp256",  INFO(0x9d6019, 0, 64 * 1024, 512)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		.fixups = &is25lp256_fixups },
-	{ "is25wp032",  INFO(0x9d7016, 0, 64 * 1024,  64,
-			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "is25wp064",  INFO(0x9d7017, 0, 64 * 1024, 128,
-			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256,
-			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 512,
-			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			    SPI_NOR_4B_OPCODES)
+	{ "is25wp032",  INFO(0x9d7016, 0, 64 * 1024,  64)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "is25wp064",  INFO(0x9d7017, 0, 64 * 1024, 128)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 512)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		.fixups = &is25lp256_fixups },
 
 	/* PMC */
-	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
-	{ "pm25lv010",   INFO(0,        0, 32 * 1024,    4, SECT_4K_PMC) },
-	{ "pm25lq032",   INFO(0x7f9d46, 0, 64 * 1024,   64, SECT_4K) },
+	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2)
+		NO_SFDP_FLAGS(SECT_4K_PMC) },
+	{ "pm25lv010",   INFO(0,        0, 32 * 1024,    4)
+		NO_SFDP_FLAGS(SECT_4K_PMC) },
+	{ "pm25lq032",   INFO(0x7f9d46, 0, 64 * 1024,   64)
+		NO_SFDP_FLAGS(SECT_4K) },
 };
 
 static void issi_default_init(struct spi_nor *nor)
diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 27498ed0cc0d..67aaa83038b6 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -34,59 +34,72 @@ static struct spi_nor_fixups mx25l25635_fixups = {
 
 static const struct flash_info macronix_parts[] = {
 	/* Macronix */
-	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
-	{ "mx25l2005a",  INFO(0xc22012, 0, 64 * 1024,   4, SECT_4K) },
-	{ "mx25l4005a",  INFO(0xc22013, 0, 64 * 1024,   8, SECT_4K) },
-	{ "mx25l8005",   INFO(0xc22014, 0, 64 * 1024,  16, 0) },
-	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32, SECT_4K) },
-	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
-	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
-	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
-	{ "mx25u2033e",  INFO(0xc22532, 0, 64 * 1024,   4, SECT_4K) },
-	{ "mx25u3235f",	 INFO(0xc22536, 0, 64 * 1024,  64,
-			      SECT_4K | SPI_NOR_DUAL_READ |
+	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "mx25l2005a",  INFO(0xc22012, 0, 64 * 1024,   4)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "mx25l4005a",  INFO(0xc22013, 0, 64 * 1024,   8)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "mx25l8005",   INFO(0xc22014, 0, 64 * 1024,  16) },
+	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "mx25u2033e",  INFO(0xc22532, 0, 64 * 1024,   4)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "mx25u3235f",	 INFO(0xc22536, 0, 64 * 1024,  64)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
-	{ "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
-	{ "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
-	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
-	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SECT_4K |
-			      SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
-	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
-	{ "mx25r1635f",  INFO(0xc22815, 0, 64 * 1024,  32,
-			      SECT_4K | SPI_NOR_DUAL_READ |
+	{ "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256) },
+	{ "mx25r1635f",  INFO(0xc22815, 0, 64 * 1024,  32)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
-	{ "mx25r3235f",  INFO(0xc22816, 0, 64 * 1024,  64,
-			      SECT_4K | SPI_NOR_DUAL_READ |
+	{ "mx25r3235f",  INFO(0xc22816, 0, 64 * 1024,  64)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
-	{ "mx25u12835f", INFO(0xc22538, 0, 64 * 1024, 256,
-			      SECT_4K | SPI_NOR_DUAL_READ |
+	{ "mx25u12835f", INFO(0xc22538, 0, 64 * 1024, 256)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
-	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512,
-			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512)
+		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		.fixups = &mx25l25635_fixups },
-	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512,
-			      SECT_4K | SPI_NOR_4B_OPCODES) },
-	{ "mx25u51245g", INFO(0xc2253a, 0, 64 * 1024, 1024,
-			      SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
-	{ "mx25v8035f",  INFO(0xc22314, 0, 64 * 1024,  16,
-			      SECT_4K | SPI_NOR_DUAL_READ |
+	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512)
+		NO_SFDP_FLAGS(SECT_4K)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "mx25u51245g", INFO(0xc2253a, 0, 64 * 1024, 1024)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "mx25v8035f",  INFO(0xc22314, 0, 64 * 1024,  16)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
-	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
-	{ "mx66l51235f", INFO(0xc2201a, 0, 64 * 1024, 1024,
-			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			      SPI_NOR_4B_OPCODES) },
-	{ "mx66u51235f", INFO(0xc2253a, 0, 64 * 1024, 1024,
-			      SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
-	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048,
-			      SECT_4K | SPI_NOR_DUAL_READ |
+	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512) },
+	{ "mx66l51235f", INFO(0xc2201a, 0, 64 * 1024, 1024)
+		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "mx66u51235f", INFO(0xc2253a, 0, 64 * 1024, 1024)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
-	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048,
-			      SPI_NOR_QUAD_READ) },
-	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096,
-			      SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048)
+		NO_SFDP_FLAGS(SPI_NOR_QUAD_READ) },
+	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 };
 
 static void macronix_default_init(struct spi_nor *nor)
diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index f3d19b716b7b..2f3054b2f0b2 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -119,110 +119,122 @@ static struct spi_nor_fixups mt35xu512aba_fixups = {
 };
 
 static const struct flash_info micron_parts[] = {
-	{ "mt35xu512aba", INFO(0x2c5b1a, 0, 128 * 1024, 512,
-			       SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
-			       SPI_NOR_4B_OPCODES | SPI_NOR_OCTAL_DTR_READ |
-			       SPI_NOR_OCTAL_DTR_PP |
-			       SPI_NOR_IO_MODE_EN_VOLATILE)
-	  .fixups = &mt35xu512aba_fixups},
-	{ "mt35xu02g", INFO(0x2c5b1c, 0, 128 * 1024, 2048,
-			    SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
-			    SPI_NOR_4B_OPCODES) },
+	{ "mt35xu512aba", INFO(0x2c5b1a, 0, 128 * 1024, 512)
+		FLAGS(USE_FSR)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_READ |
+			   SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE)
+		.fixups = &mt35xu512aba_fixups},
+	{ "mt35xu02g", INFO(0x2c5b1c, 0, 128 * 1024, 2048)
+		FLAGS(USE_FSR)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_READ)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 };
 
 static const struct flash_info st_parts[] = {
-	{ "n25q016a",	 INFO(0x20bb15, 0, 64 * 1024,   32,
-			      SECT_4K | SPI_NOR_QUAD_READ) },
-	{ "n25q032",	 INFO(0x20ba16, 0, 64 * 1024,   64,
+	{ "n25q016a",	 INFO(0x20bb15, 0, 64 * 1024,   32)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
+	{ "n25q032",	 INFO(0x20ba16, 0, 64 * 1024,   64)
+		NO_SFDP_FLAGS(SPI_NOR_QUAD_READ) },
+	{ "n25q032a",	 INFO(0x20bb16, 0, 64 * 1024,   64)
+		NO_SFDP_FLAGS(SPI_NOR_QUAD_READ) },
+	{ "n25q064",     INFO(0x20ba17, 0, 64 * 1024,  128)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
+	{ "n25q064a",    INFO(0x20bb17, 0, 64 * 1024,  128)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
+	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+		      SPI_NOR_BP3_SR_BIT6 | USE_FSR)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
+	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+		      SPI_NOR_BP3_SR_BIT6 | USE_FSR)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
+	{ "mt25ql256a",  INFO6(0x20ba19, 0x104400, 64 * 1024,  512)
+		FLAGS(USE_FSR)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512)
+		FLAGS(USE_FSR)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
-	{ "n25q032a",	 INFO(0x20bb16, 0, 64 * 1024,   64,
+	{ "mt25qu256a",  INFO6(0x20bb19, 0x104400, 64 * 1024,  512)
+		FLAGS(USE_FSR)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "n25q256ax1",  INFO(0x20bb19, 0, 64 * 1024,  512)
+		FLAGS(USE_FSR)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
+	{ "mt25ql512a",  INFO6(0x20ba20, 0x104400, 64 * 1024, 1024)
+		FLAGS(USE_FSR)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+		      SPI_NOR_BP3_SR_BIT6 | USE_FSR)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
+	{ "mt25qu512a",  INFO6(0x20bb20, 0x104400, 64 * 1024, 1024)
+		FLAGS(USE_FSR)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+		      SPI_NOR_BP3_SR_BIT6 | USE_FSR)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
+	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+		      SPI_NOR_BP3_SR_BIT6 | NO_CHIP_ERASE | USE_FSR)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
+	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048)
+		FLAGS(NO_CHIP_ERASE | USE_FSR)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
+	{ "mt25ql02g",   INFO(0x20ba22, 0, 64 * 1024, 4096)
+		FLAGS(NO_CHIP_ERASE | USE_FSR)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
+	{ "mt25qu02g",   INFO(0x20bb22, 0, 64 * 1024, 4096)
+		FLAGS(NO_CHIP_ERASE | USE_FSR)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
-	{ "n25q064",     INFO(0x20ba17, 0, 64 * 1024,  128,
-			      SECT_4K | SPI_NOR_QUAD_READ) },
-	{ "n25q064a",    INFO(0x20bb17, 0, 64 * 1024,  128,
-			      SECT_4K | SPI_NOR_QUAD_READ) },
-	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256,
-			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
-			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
-			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
-	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256,
-			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
-			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
-			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
-	{ "mt25ql256a",  INFO6(0x20ba19, 0x104400, 64 * 1024,  512,
-			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
-			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
-	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K |
-			      USE_FSR | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "mt25qu256a",  INFO6(0x20bb19, 0x104400, 64 * 1024,  512,
-			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
-			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
-	{ "n25q256ax1",  INFO(0x20bb19, 0, 64 * 1024,  512,
-			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
-	{ "mt25ql512a",  INFO6(0x20ba20, 0x104400, 64 * 1024, 1024,
-			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
-			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
-	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024,
-			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
-			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
-			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
-	{ "mt25qu512a",  INFO6(0x20bb20, 0x104400, 64 * 1024, 1024,
-			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
-			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
-	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024,
-			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
-			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
-			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
-	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048,
-			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
-			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
-			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6 |
-			      NO_CHIP_ERASE) },
-	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048,
-			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
-			      NO_CHIP_ERASE) },
-	{ "mt25ql02g",   INFO(0x20ba22, 0, 64 * 1024, 4096,
-			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
-			      NO_CHIP_ERASE) },
-	{ "mt25qu02g",   INFO(0x20bb22, 0, 64 * 1024, 4096,
-			      SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
-
-	{ "m25p05",  INFO(0x202010,  0,  32 * 1024,   2, 0) },
-	{ "m25p10",  INFO(0x202011,  0,  32 * 1024,   4, 0) },
-	{ "m25p20",  INFO(0x202012,  0,  64 * 1024,   4, 0) },
-	{ "m25p40",  INFO(0x202013,  0,  64 * 1024,   8, 0) },
-	{ "m25p80",  INFO(0x202014,  0,  64 * 1024,  16, 0) },
-	{ "m25p16",  INFO(0x202015,  0,  64 * 1024,  32, 0) },
-	{ "m25p32",  INFO(0x202016,  0,  64 * 1024,  64, 0) },
-	{ "m25p64",  INFO(0x202017,  0,  64 * 1024, 128, 0) },
-	{ "m25p128", INFO(0x202018,  0, 256 * 1024,  64, 0) },
-
-	{ "m25p05-nonjedec",  INFO(0, 0,  32 * 1024,   2, 0) },
-	{ "m25p10-nonjedec",  INFO(0, 0,  32 * 1024,   4, 0) },
-	{ "m25p20-nonjedec",  INFO(0, 0,  64 * 1024,   4, 0) },
-	{ "m25p40-nonjedec",  INFO(0, 0,  64 * 1024,   8, 0) },
-	{ "m25p80-nonjedec",  INFO(0, 0,  64 * 1024,  16, 0) },
-	{ "m25p16-nonjedec",  INFO(0, 0,  64 * 1024,  32, 0) },
-	{ "m25p32-nonjedec",  INFO(0, 0,  64 * 1024,  64, 0) },
-	{ "m25p64-nonjedec",  INFO(0, 0,  64 * 1024, 128, 0) },
-	{ "m25p128-nonjedec", INFO(0, 0, 256 * 1024,  64, 0) },
-
-	{ "m45pe10", INFO(0x204011,  0, 64 * 1024,    2, 0) },
-	{ "m45pe80", INFO(0x204014,  0, 64 * 1024,   16, 0) },
-	{ "m45pe16", INFO(0x204015,  0, 64 * 1024,   32, 0) },
-
-	{ "m25pe20", INFO(0x208012,  0, 64 * 1024,  4,       0) },
-	{ "m25pe80", INFO(0x208014,  0, 64 * 1024, 16,       0) },
-	{ "m25pe16", INFO(0x208015,  0, 64 * 1024, 32, SECT_4K) },
-
-	{ "m25px16",    INFO(0x207115,  0, 64 * 1024, 32, SECT_4K) },
-	{ "m25px32",    INFO(0x207116,  0, 64 * 1024, 64, SECT_4K) },
-	{ "m25px32-s0", INFO(0x207316,  0, 64 * 1024, 64, SECT_4K) },
-	{ "m25px32-s1", INFO(0x206316,  0, 64 * 1024, 64, SECT_4K) },
-	{ "m25px64",    INFO(0x207117,  0, 64 * 1024, 128, 0) },
-	{ "m25px80",    INFO(0x207114,  0, 64 * 1024, 16, 0) },
+
+	{ "m25p05",  INFO(0x202010,  0,  32 * 1024,   2) },
+	{ "m25p10",  INFO(0x202011,  0,  32 * 1024,   4) },
+	{ "m25p20",  INFO(0x202012,  0,  64 * 1024,   4) },
+	{ "m25p40",  INFO(0x202013,  0,  64 * 1024,   8) },
+	{ "m25p80",  INFO(0x202014,  0,  64 * 1024,  16) },
+	{ "m25p16",  INFO(0x202015,  0,  64 * 1024,  32) },
+	{ "m25p32",  INFO(0x202016,  0,  64 * 1024,  64) },
+	{ "m25p64",  INFO(0x202017,  0,  64 * 1024, 128) },
+	{ "m25p128", INFO(0x202018,  0, 256 * 1024,  64) },
+
+	{ "m25p05-nonjedec",  INFO(0, 0,  32 * 1024,   2) },
+	{ "m25p10-nonjedec",  INFO(0, 0,  32 * 1024,   4) },
+	{ "m25p20-nonjedec",  INFO(0, 0,  64 * 1024,   4) },
+	{ "m25p40-nonjedec",  INFO(0, 0,  64 * 1024,   8) },
+	{ "m25p80-nonjedec",  INFO(0, 0,  64 * 1024,  16) },
+	{ "m25p16-nonjedec",  INFO(0, 0,  64 * 1024,  32) },
+	{ "m25p32-nonjedec",  INFO(0, 0,  64 * 1024,  64) },
+	{ "m25p64-nonjedec",  INFO(0, 0,  64 * 1024, 128) },
+	{ "m25p128-nonjedec", INFO(0, 0, 256 * 1024,  64) },
+
+	{ "m45pe10", INFO(0x204011,  0, 64 * 1024,    2) },
+	{ "m45pe80", INFO(0x204014,  0, 64 * 1024,   16) },
+	{ "m45pe16", INFO(0x204015,  0, 64 * 1024,   32) },
+
+	{ "m25pe20", INFO(0x208012,  0, 64 * 1024,  4) },
+	{ "m25pe80", INFO(0x208014,  0, 64 * 1024, 16) },
+	{ "m25pe16", INFO(0x208015,  0, 64 * 1024, 32)
+		NO_SFDP_FLAGS(SECT_4K) },
+
+	{ "m25px16",    INFO(0x207115,  0, 64 * 1024, 32)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "m25px32",    INFO(0x207116,  0, 64 * 1024, 64)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "m25px32-s0", INFO(0x207316,  0, 64 * 1024, 64)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "m25px32-s1", INFO(0x206316,  0, 64 * 1024, 64)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "m25px64",    INFO(0x207117,  0, 64 * 1024, 128) },
+	{ "m25px80",    INFO(0x207114,  0, 64 * 1024, 16) },
 };
 
 /**
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index a3ea0135f7b1..f2a2995a7718 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -198,81 +198,90 @@ static const struct flash_info spansion_parts[] = {
 	/* Spansion/Cypress -- single (large) sector size only, at least
 	 * for the chips listed here (without boot sectors).
 	 */
-	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64,
-			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128,
-			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25fl128s0", INFO6(0x012018, 0x4d0080, 256 * 1024, 64,
-			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			      USE_CLSR) },
-	{ "s25fl128s1", INFO6(0x012018, 0x4d0180, 64 * 1024, 256,
-			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			      USE_CLSR) },
-	{ "s25fl256s0", INFO6(0x010219, 0x4d0080, 256 * 1024, 128,
-			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			      USE_CLSR) },
-	{ "s25fl256s1", INFO6(0x010219, 0x4d0180, 64 * 1024, 512,
-			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			      USE_CLSR) },
-	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256,
-			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			      SPI_NOR_HAS_LOCK | USE_CLSR) },
-	{ "s25fs128s1", INFO6(0x012018, 0x4d0181, 64 * 1024, 256,
-			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
-	  .fixups = &s25fs_s_fixups, },
-	{ "s25fs256s0", INFO6(0x010219, 0x4d0081, 256 * 1024, 128,
-			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			      USE_CLSR) },
-	{ "s25fs256s1", INFO6(0x010219, 0x4d0181, 64 * 1024, 512,
-			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			      USE_CLSR) },
-	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256,
-			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
-	  .fixups = &s25fs_s_fixups, },
-	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
-	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
-	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64,
-			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			     USE_CLSR) },
-	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256,
-			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			     USE_CLSR) },
-	{ "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8, 0) },
-	{ "s25sl008a",  INFO(0x010213,      0,  64 * 1024,  16, 0) },
-	{ "s25sl016a",  INFO(0x010214,      0,  64 * 1024,  32, 0) },
-	{ "s25sl032a",  INFO(0x010215,      0,  64 * 1024,  64, 0) },
-	{ "s25sl064a",  INFO(0x010216,      0,  64 * 1024, 128, 0) },
-	{ "s25fl004k",  INFO(0xef4013,      0,  64 * 1024,   8,
-			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25fl008k",  INFO(0xef4014,      0,  64 * 1024,  16,
-			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25fl016k",  INFO(0xef4015,      0,  64 * 1024,  32,
-			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25fl064k",  INFO(0xef4017,      0,  64 * 1024, 128,
-			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25fl116k",  INFO(0x014015,      0,  64 * 1024,  32,
-			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25fl132k",  INFO(0x014016,      0,  64 * 1024,  64, SECT_4K) },
-	{ "s25fl164k",  INFO(0x014017,      0,  64 * 1024, 128, SECT_4K) },
-	{ "s25fl204k",  INFO(0x014013,      0,  64 * 1024,   8,
-			     SECT_4K | SPI_NOR_DUAL_READ) },
-	{ "s25fl208k",  INFO(0x014014,      0,  64 * 1024,  16,
-			     SECT_4K | SPI_NOR_DUAL_READ) },
-	{ "s25fl064l",  INFO(0x016017,      0,  64 * 1024, 128,
-			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			     SPI_NOR_4B_OPCODES) },
-	{ "s25fl128l",  INFO(0x016018,      0,  64 * 1024, 256,
-			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			     SPI_NOR_4B_OPCODES) },
-	{ "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512,
-			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			     SPI_NOR_4B_OPCODES) },
-	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1,
-			      SPI_NOR_NO_ERASE) },
-	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256,
-			     SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64)
+		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128)
+		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25fl128s0", INFO6(0x012018, 0x4d0080, 256 * 1024, 64)
+		FLAGS(USE_CLSR)
+		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25fl128s1", INFO6(0x012018, 0x4d0180, 64 * 1024, 256)
+		FLAGS(USE_CLSR)
+		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25fl256s0", INFO6(0x010219, 0x4d0080, 256 * 1024, 128)
+		FLAGS(USE_CLSR)
+		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25fl256s1", INFO6(0x010219, 0x4d0180, 64 * 1024, 512)
+		FLAGS(USE_CLSR)
+		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256)
+		FLAGS(SPI_NOR_HAS_LOCK | USE_CLSR)
+		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25fs128s1", INFO6(0x012018, 0x4d0181, 64 * 1024, 256)
+		FLAGS(USE_CLSR)
+		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		.fixups = &s25fs_s_fixups, },
+	{ "s25fs256s0", INFO6(0x010219, 0x4d0081, 256 * 1024, 128)
+		FLAGS(USE_CLSR)
+		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25fs256s1", INFO6(0x010219, 0x4d0181, 64 * 1024, 512)
+		FLAGS(USE_CLSR)
+		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256)
+		FLAGS(USE_CLSR)
+		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		.fixups = &s25fs_s_fixups, },
+	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64) },
+	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256) },
+	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64)
+		FLAGS(USE_CLSR)
+		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256)
+		FLAGS(USE_CLSR)
+		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8) },
+	{ "s25sl008a",  INFO(0x010213,      0,  64 * 1024,  16) },
+	{ "s25sl016a",  INFO(0x010214,      0,  64 * 1024,  32) },
+	{ "s25sl032a",  INFO(0x010215,      0,  64 * 1024,  64) },
+	{ "s25sl064a",  INFO(0x010216,      0,  64 * 1024, 128) },
+	{ "s25fl004k",  INFO(0xef4013,      0,  64 * 1024,   8)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "s25fl008k",  INFO(0xef4014,      0,  64 * 1024,  16)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "s25fl016k",  INFO(0xef4015,      0,  64 * 1024,  32)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "s25fl064k",  INFO(0xef4017,      0,  64 * 1024, 128)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "s25fl116k",  INFO(0x014015,      0,  64 * 1024,  32)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "s25fl132k",  INFO(0x014016,      0,  64 * 1024,  64)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "s25fl164k",  INFO(0x014017,      0,  64 * 1024, 128)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "s25fl204k",  INFO(0x014013,      0,  64 * 1024,   8)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
+	{ "s25fl208k",  INFO(0x014014,      0,  64 * 1024,  16)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
+	{ "s25fl064l",  INFO(0x016017,      0,  64 * 1024, 128)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "s25fl128l",  INFO(0x016018,      0,  64 * 1024, 256)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1)
+		FLAGS(SPI_NOR_NO_ERASE) },
+	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ |
 			      SPI_NOR_OCTAL_DTR_PP)
-	  .fixups = &s28hs512t_fixups,
+		.fixups = &s28hs512t_fixups,
 	},
 };
 
diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 8f1ebb8fd05f..30183e9189b9 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -60,55 +60,60 @@ static const struct spi_nor_fixups sst26vf_fixups = {
 
 static const struct flash_info sst_parts[] = {
 	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
-	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8,
-			      SECT_4K | SPI_NOR_HAS_LOCK |
-			      SPI_NOR_SWP_IS_VOLATILE)
+	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
+		NO_SFDP_FLAGS(SECT_4K)
 		MFR_FLAGS(SST_WRITE) },
-	{ "sst25vf080b", INFO(0xbf258e, 0, 64 * 1024, 16,
-			      SECT_4K | SPI_NOR_HAS_LOCK |
-			      SPI_NOR_SWP_IS_VOLATILE)
+	{ "sst25vf080b", INFO(0xbf258e, 0, 64 * 1024, 16)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
+		NO_SFDP_FLAGS(SECT_4K)
 		MFR_FLAGS(SST_WRITE) },
-	{ "sst25vf016b", INFO(0xbf2541, 0, 64 * 1024, 32,
-			      SECT_4K | SPI_NOR_HAS_LOCK |
-			      SPI_NOR_SWP_IS_VOLATILE)
+	{ "sst25vf016b", INFO(0xbf2541, 0, 64 * 1024, 32)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
+		NO_SFDP_FLAGS(SECT_4K)
 		MFR_FLAGS(SST_WRITE) },
-	{ "sst25vf032b", INFO(0xbf254a, 0, 64 * 1024, 64,
-			      SECT_4K | SPI_NOR_HAS_LOCK |
-			      SPI_NOR_SWP_IS_VOLATILE)
+	{ "sst25vf032b", INFO(0xbf254a, 0, 64 * 1024, 64)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
+		NO_SFDP_FLAGS(SECT_4K)
 		MFR_FLAGS(SST_WRITE) },
-	{ "sst25vf064c", INFO(0xbf254b, 0, 64 * 1024, 128,
-			      SECT_4K | SPI_NOR_4BIT_BP | SPI_NOR_HAS_LOCK |
-			      SPI_NOR_SWP_IS_VOLATILE) },
-	{ "sst25wf512",  INFO(0xbf2501, 0, 64 * 1024,  1,
-			      SECT_4K | SPI_NOR_HAS_LOCK |
-			      SPI_NOR_SWP_IS_VOLATILE)
+	{ "sst25vf064c", INFO(0xbf254b, 0, 64 * 1024, 128)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP |
+		      SPI_NOR_SWP_IS_VOLATILE)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "sst25wf512",  INFO(0xbf2501, 0, 64 * 1024,  1)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
+		NO_SFDP_FLAGS(SECT_4K)
 		MFR_FLAGS(SST_WRITE) },
-	{ "sst25wf010",  INFO(0xbf2502, 0, 64 * 1024,  2,
-			      SECT_4K | SPI_NOR_HAS_LOCK |
-			      SPI_NOR_SWP_IS_VOLATILE)
+	{ "sst25wf010",  INFO(0xbf2502, 0, 64 * 1024,  2)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
+		NO_SFDP_FLAGS(SECT_4K)
 		MFR_FLAGS(SST_WRITE) },
-	{ "sst25wf020",  INFO(0xbf2503, 0, 64 * 1024,  4,
-			      SECT_4K | SPI_NOR_HAS_LOCK |
-			      SPI_NOR_SWP_IS_VOLATILE)
+	{ "sst25wf020",  INFO(0xbf2503, 0, 64 * 1024,  4)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
+		NO_SFDP_FLAGS(SECT_4K)
 		MFR_FLAGS(SST_WRITE) },
-	{ "sst25wf020a", INFO(0x621612, 0, 64 * 1024,  4, SECT_4K | SPI_NOR_HAS_LOCK) },
-	{ "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8, SECT_4K | SPI_NOR_HAS_LOCK) },
-	{ "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8,
-			      SECT_4K | SPI_NOR_HAS_LOCK |
-			      SPI_NOR_SWP_IS_VOLATILE)
+	{ "sst25wf020a", INFO(0x621612, 0, 64 * 1024,  4)
+		FLAGS(SPI_NOR_HAS_LOCK)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8)
+		FLAGS(SPI_NOR_HAS_LOCK)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
+		NO_SFDP_FLAGS(SECT_4K)
 		MFR_FLAGS(SST_WRITE) },
-	{ "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16,
-			      SECT_4K | SPI_NOR_HAS_LOCK |
-			      SPI_NOR_SWP_IS_VOLATILE)
+	{ "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
+		NO_SFDP_FLAGS(SECT_4K)
 		MFR_FLAGS(SST_WRITE) },
-	{ "sst26wf016b", INFO(0xbf2651, 0, 64 * 1024, 32,
-			      SECT_4K | SPI_NOR_DUAL_READ |
+	{ "sst26wf016b", INFO(0xbf2651, 0, 64 * 1024, 32)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
-	{ "sst26vf016b", INFO(0xbf2641, 0, 64 * 1024, 32,
-			      SECT_4K | SPI_NOR_DUAL_READ) },
-	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128,
-			      SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			      SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
+	{ "sst26vf016b", INFO(0xbf2641, 0, 64 * 1024, 32)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
+	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		.fixups = &sst26vf_fixups },
 };
 
diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index f0f73e1cc403..f5e723c2d482 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -34,76 +34,104 @@ static struct spi_nor_fixups w25q256_fixups = {
 
 static const struct flash_info winbond_parts[] = {
 	/* Winbond -- w25x "blocks" are 64K, "sectors" are 4KiB */
-	{ "w25x05", INFO(0xef3010, 0, 64 * 1024,  1,  SECT_4K) },
-	{ "w25x10", INFO(0xef3011, 0, 64 * 1024,  2,  SECT_4K) },
-	{ "w25x20", INFO(0xef3012, 0, 64 * 1024,  4,  SECT_4K) },
-	{ "w25x40", INFO(0xef3013, 0, 64 * 1024,  8,  SECT_4K) },
-	{ "w25x80", INFO(0xef3014, 0, 64 * 1024,  16, SECT_4K) },
-	{ "w25x16", INFO(0xef3015, 0, 64 * 1024,  32, SECT_4K) },
-	{ "w25q16dw", INFO(0xef6015, 0, 64 * 1024,  32,
-			   SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			   SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
-	{ "w25x32", INFO(0xef3016, 0, 64 * 1024,  64, SECT_4K) },
-	{ "w25q16jv-im/jm", INFO(0xef7015, 0, 64 * 1024,  32,
-				 SECT_4K | SPI_NOR_DUAL_READ |
-				 SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK |
-				 SPI_NOR_HAS_TB) },
-	{ "w25q20cl", INFO(0xef4012, 0, 64 * 1024,  4, SECT_4K) },
-	{ "w25q20bw", INFO(0xef5012, 0, 64 * 1024,  4, SECT_4K) },
-	{ "w25q20ew", INFO(0xef6012, 0, 64 * 1024,  4, SECT_4K) },
-	{ "w25q32", INFO(0xef4016, 0, 64 * 1024,  64, SECT_4K) },
-	{ "w25q32dw", INFO(0xef6016, 0, 64 * 1024,  64,
-			   SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			   SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-			   OTP_INFO(256, 3, 0x1000, 0x1000)
-	},
-
-	{ "w25q32jv", INFO(0xef7016, 0, 64 * 1024,  64,
-			   SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			   SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-	},
-	{ "w25q32jwm", INFO(0xef8016, 0, 64 * 1024,  64,
-			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-			    OTP_INFO(256, 3, 0x1000, 0x1000) },
-	{ "w25q64jwm", INFO(0xef8017, 0, 64 * 1024, 128,
-			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
-	{ "w25q128jwm", INFO(0xef8018, 0, 64 * 1024, 256,
-			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
-	{ "w25q256jwm", INFO(0xef8019, 0, 64 * 1024, 512,
-			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
-	{ "w25x64", INFO(0xef3017, 0, 64 * 1024, 128, SECT_4K) },
-	{ "w25q64", INFO(0xef4017, 0, 64 * 1024, 128,
-			 SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "w25q64dw", INFO(0xef6017, 0, 64 * 1024, 128,
-			   SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			   SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
-	{ "w25q64jvm", INFO(0xef7017, 0, 64 * 1024, 128, SECT_4K) },
-	{ "w25q128fw", INFO(0xef6018, 0, 64 * 1024, 256,
-			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
-	{ "w25q128jv", INFO(0xef7018, 0, 64 * 1024, 256,
-			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
-	{ "w25q80", INFO(0xef5014, 0, 64 * 1024,  16, SECT_4K) },
-	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16, SECT_4K) },
-	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256, SECT_4K) },
-	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512,
-			  SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-	  .fixups = &w25q256_fixups },
-	{ "w25q256jvm", INFO(0xef7019, 0, 64 * 1024, 512,
-			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "w25q256jw", INFO(0xef6019, 0, 64 * 1024, 512,
-			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "w25q512jv", INFO(0xef4020, 0, 64 * 1024, 1024, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
-	{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
-			    SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
-	{ "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024,
-			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "w25x05", INFO(0xef3010, 0, 64 * 1024,  1)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "w25x10", INFO(0xef3011, 0, 64 * 1024,  2)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "w25x20", INFO(0xef3012, 0, 64 * 1024,  4)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "w25x40", INFO(0xef3013, 0, 64 * 1024,  8)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "w25x80", INFO(0xef3014, 0, 64 * 1024,  16)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "w25x16", INFO(0xef3015, 0, 64 * 1024,  32)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "w25q16dw", INFO(0xef6015, 0, 64 * 1024,  32)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "w25x32", INFO(0xef3016, 0, 64 * 1024,  64)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "w25q16jv-im/jm", INFO(0xef7015, 0, 64 * 1024,  32)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "w25q20cl", INFO(0xef4012, 0, 64 * 1024,  4)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "w25q20bw", INFO(0xef5012, 0, 64 * 1024,  4)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "w25q20ew", INFO(0xef6012, 0, 64 * 1024,  4)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "w25q32", INFO(0xef4016, 0, 64 * 1024,  64)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "w25q32dw", INFO(0xef6016, 0, 64 * 1024,  64)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		OTP_INFO(256, 3, 0x1000, 0x1000) },
+	{ "w25q32jv", INFO(0xef7016, 0, 64 * 1024,  64)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "w25q32jwm", INFO(0xef8016, 0, 64 * 1024,  64)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		OTP_INFO(256, 3, 0x1000, 0x1000) },
+	{ "w25q64jwm", INFO(0xef8017, 0, 64 * 1024, 128)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "w25q128jwm", INFO(0xef8018, 0, 64 * 1024, 256)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "w25q256jwm", INFO(0xef8019, 0, 64 * 1024, 512)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "w25x64", INFO(0xef3017, 0, 64 * 1024, 128)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "w25q64", INFO(0xef4017, 0, 64 * 1024, 128)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "w25q64dw", INFO(0xef6017, 0, 64 * 1024, 128)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "w25q64jvm", INFO(0xef7017, 0, 64 * 1024, 128)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "w25q128fw", INFO(0xef6018, 0, 64 * 1024, 256)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "w25q128jv", INFO(0xef7018, 0, 64 * 1024, 256)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "w25q80", INFO(0xef5014, 0, 64 * 1024,  16)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256)
+		NO_SFDP_FLAGS(SECT_4K) },
+	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		.fixups = &w25q256_fixups },
+	{ "w25q256jvm", INFO(0xef7019, 0, 64 * 1024, 512)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "w25q256jw", INFO(0xef6019, 0, 64 * 1024, 512)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "w25q512jv", INFO(0xef4020, 0, 64 * 1024, 1024)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ)},
+	{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ |
+			      SPI_NOR_DUAL_READ) },
+	{ "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
 };
 
 /**
diff --git a/drivers/mtd/spi-nor/xmc.c b/drivers/mtd/spi-nor/xmc.c
index 2c7773b68993..2992af03cb0a 100644
--- a/drivers/mtd/spi-nor/xmc.c
+++ b/drivers/mtd/spi-nor/xmc.c
@@ -10,10 +10,12 @@
 
 static const struct flash_info xmc_parts[] = {
 	/* XMC (Wuhan Xinxin Semiconductor Manufacturing Corp.) */
-	{ "XM25QH64A", INFO(0x207017, 0, 64 * 1024, 128,
-			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "XM25QH128A", INFO(0x207018, 0, 64 * 1024, 256,
-			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "XM25QH64A", INFO(0x207017, 0, 64 * 1024, 128)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "XM25QH128A", INFO(0x207018, 0, 64 * 1024, 256)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
 };
 
 const struct spi_nor_manufacturer spi_nor_xmc = {
-- 
2.17.1

