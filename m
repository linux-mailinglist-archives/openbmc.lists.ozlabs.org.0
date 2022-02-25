Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCA24C3BD9
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 03:43:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4Yx255KCz3bZF
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 13:43:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=yepyKwvN;
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
 header.s=selector2-quantacorp-onmicrosoft-com header.b=yepyKwvN; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20707.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::707])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Ywd1PG8z2y7M
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 13:42:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XagjONjfO57RjqHRSxVjLxIgKUO1EVW1sFX5ivLyU9Fsof+HE188O7Xz1UyrT48Ht7wqNlquvicP+M9Yn/RqGWzZkYBu7Sfs0pSRkuiAiQC4+hP+9ELEFF7A138kPPA017ZkOHtu0I+g584/CxmJZkbYWP1958wk9DgO3MufNQ/YS+LJMvDz5W3Hez791pmhdRmN1mbzbZeeJKGQjgWXE+6PMC9bsohmNcczP4BLGHaqXpk/EP3Z4+x0bKvWCz30Gez5iRvTlzqLUQ3B/NRb3ku9VKPiFF6j15kb1YStW5LorpuWLuAmVMWQlMZZ5Y6ZtsRerMPB3r7sVcGeYNj7CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ap66HO9aGLIhAshVPgv2FRHFRZgpD16Lz4ywxNgxw7o=;
 b=M/jR5J98qylcaVSqwUqLEzkBhj4y1c5xK/E8kX4m0pMN4+XA5gOKj8e36hu68ItVJipb5BvKWXT0vCMJFKB5U3Gy15Vuyh/x/U45wU82Z1naIm1HYdPSqQmR6HLnRhQwomvL/asriSUM2w1gszdW8CWtDsqF2sKZAfdMORNRQL61lPS1RKGBEbg5SxT5OBQsYZGyVvtie3XoGudQrcVE6Az0mzBOPoWKT7Cv8SV4lEC2zGOynqlhyNeKuQ3NyISVIAWMUWJ6n7gIKbz7Kq1KeBWvasX1fmr/3yBcXyrb5WjvOowBOyoskGHNLcT//EbglVt96cCwK7eWPdh8qyCi/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ap66HO9aGLIhAshVPgv2FRHFRZgpD16Lz4ywxNgxw7o=;
 b=yepyKwvNaP8lgva356LrvvNV7H4437ckfeRdkb5y5inbdnJ425Xb0jGXtPfoWrpYrmDf3qmg1H7iksDgJ+/ChCYO/pvEc8Z5l09/p2zXCctES58rP1jAPUefXQ5yiCvCjqIb4nfoa/cbfaVnR4xTQA4zE4ePuSKYarfJGOPXDlw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SI2PR04MB4507.apcprd04.prod.outlook.com (2603:1096:4:122::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Fri, 25 Feb
 2022 02:42:35 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 02:42:35 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 00/26] Add w25q01jvq and convert flash_info
 format
Date: Fri, 25 Feb 2022 10:41:55 +0800
Message-Id: <20220225024221.19422-1-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:202:16::19) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec25ad44-0a88-424c-2698-08d9f8087acf
X-MS-TrafficTypeDiagnostic: SI2PR04MB4507:EE_
X-Microsoft-Antispam-PRVS: <SI2PR04MB45079208B2351643E97DE0958E3E9@SI2PR04MB4507.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W1kyNxwlUA+697Yu/PCMA46Ef137xY2pXxvRpjvJYHUpwiSPTjdRRqPnvOGUIAOKip+OLpIbNjtd700ew6Bl7zjuqNSgtv5R1N6QUhXYiLEp3pZkbpriBwNOcsgqq7mDm1zWICF9g3iKDzAiJZs1G6pf6gM1QWm88FKxcRDgxAoaR8jJTwx2nGE6C5tRmZX6drxy6X3ghHxtvFZyW+sG8lzlAj9iNgwYlNffjYoXGm5ntYDooKY8j216oQ/Jng7Utf9j0v4L6ZYhyiGC0gG69dTmFFp0uq+QTxQE6pjF1inbfz0trxCA5OzogVOYtpEAJ6CRrTYeuEki2i9zJFYS7eL9dXtbJfvV0h+SIJR5dVCk7cmdlvUQ0c4N40kirNmkwOJDD6jtCg/wbrMGeUOOLoRLfUXdbHNa7EJz4K24X1Gr1+Ld9GjzPLSz9YBKGKz6v9kqkSBzyEDLulJkofH5bg+ohyT8fioYoIhdc0FH3KBK7WE/8W5HTS2hFyMv9jTUbNqQAaeicYNqA4jWtWY6NI+pyo01HqUEkQYqWrUkcARacMW73UsMsA8DtA/x6OFTkj86bDFeVY45iC9+2qiylEwhMW+DIT/X4twhBAsACros3x+b+ET9ltgw0MDSZG5gH0qr15LbiJyitbi8vthO4iJcTuPmtY/VKbTwbdK2k4dwGiVV3dQsFxVmOFuHT3o4DofB3fwdQdMmSmmztxnjiNmINFXZoEoVlmSz0OSPp0iUwuTGHLPHJeHao86otfOxAynN8kTKVNwY38OtHCOkzDId7Shwk+iFtaxrFvjbnfg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(26005)(186003)(36756003)(1076003)(6512007)(38100700002)(38350700002)(86362001)(83380400001)(8936002)(4326008)(6486002)(966005)(107886003)(508600001)(8676002)(54906003)(66476007)(66946007)(66556008)(5660300002)(6506007)(6666004)(52116002)(44832011)(316002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cco3E9mvfZ3FTEwpnM6596TN9T65arfJy11dPWaT5srch2iwmYGX4vXSmpkE?=
 =?us-ascii?Q?W5AMpwARTB9Rx1TyGINkoEVBabWiAR4G/iAl8x4X1JFGoXTegP3OGMGclMOx?=
 =?us-ascii?Q?TF5IpA9SbViz7QzFTOttsEgBdcClUVLlvdlqIVqFrad62huoRh/VlIRGyybD?=
 =?us-ascii?Q?3K2l6LU3dINPscGbO3MyhBlR/zJ8FFjaiL+wgrSbL/swsLSy2DAcxbQqroeF?=
 =?us-ascii?Q?7J5J2x7dNndEdQ+kvygC++LrzLAM9nQgKFLBbWXLZITazCshpQ3IcyfIBaOc?=
 =?us-ascii?Q?CFvGa1ZR4/Ats47Kxi0NWPLWrff4KknHNklmId7dCprh2UbMVKs9pq4UkkW4?=
 =?us-ascii?Q?Ih7stXfKWJYAZt7juFDG++ggCY1s2Fm+xo3y5frPBJTRfsvIe005e9+339V3?=
 =?us-ascii?Q?TqXyLQutRkkG9sO1aXnpwiVSkrFiQEnGrvcfmKEOSV9CrTRQbjX9Q6m5Z8gA?=
 =?us-ascii?Q?uUY6bGNSf1MckVi4ex1OH5rSWh0YxbnDZ5g6/IhZvqcPTDjBwdUvi7HjJMKB?=
 =?us-ascii?Q?HEKM9/XA0WB9asudwrAjs7TOJIHvfH30AMpRVyVvds60Xj4F9IcNs8QaSA+t?=
 =?us-ascii?Q?eefCaCyHX9o1hXF1noeZuOV7FWnnQB+phh6dnTAKIuFALbUgTaffd1QIyX7R?=
 =?us-ascii?Q?Yx6KvZZJ08KGEKt85Fxhyb3X8ltxll/C5Vcgt/V5iBIGnGbylqK0tgsEBvu5?=
 =?us-ascii?Q?8BSnseuLMmqnpIhZkui7tvjWB6tWgNRdPDlUw06rySx4QgT+10vnajJBk4jr?=
 =?us-ascii?Q?EBvCCVxoto3wrlGNCEo4POsqo053M5uDoowi7oR1pYvP2sXquJWk/qRgZKok?=
 =?us-ascii?Q?QXRuFuftiH8V6jxOUVUXaW0lBATD3dm/V0UONhPdPWywrJBKETLoeXU/vNT7?=
 =?us-ascii?Q?SedujN/tcLB6cBgdk2e0p6CnOVQ56Gn9jfzdl2JWZ5IRI5q1jbQpULl+VNW/?=
 =?us-ascii?Q?tK7FaREtAByGfj5U4/zf6lNV0jenc7H7hqRlJcAs7M/BO5qjsYONW1kfXaKe?=
 =?us-ascii?Q?75MgGrXtZpMhqsy3Hokq4iFGgden5UVeT3u0Z0XL92QrNTEPn65+rDjoFPPT?=
 =?us-ascii?Q?rf5NbEBUoqtjYlDW1+gC+E/EJFnrlFy1/8A6U6yx2m2qXMD2fhpSlUEvXiNU?=
 =?us-ascii?Q?3z74dhOVYkHiNw+FKiyBPsHtp2Jj0ZyAkPL6JI9rcXhR0xQ6hZ9ORR2TOd0x?=
 =?us-ascii?Q?+LQ4J40/u7+NMhwBJUfYreK+EC+0TYpSXQ6wfjG9pP052H/gffQnSzRNKRwW?=
 =?us-ascii?Q?TomxJhQJXbghY/W1I1TEc26wU81TLaAuj15mYeVdKEWtH8LjZkNoLxSGCL7o?=
 =?us-ascii?Q?zS6CTrmdNuUjO6JFFItUZ5IrIi++vSjLoyhTgZZqB3OubxqU10wfPEAlXbuH?=
 =?us-ascii?Q?9sDnG0x1AxHPmbJADhsfPpH0saSs0+1UIuNocxZo3akx9jzF+X83zeNMZ8f0?=
 =?us-ascii?Q?hi+e4X6DcF1DfjUVpFo5QOd1sgtsADS6lgIBHedrSQb4ZFv9mQ01ZWy2FHxJ?=
 =?us-ascii?Q?XGeuJFaOH6MDAPSz3bFmDeT9Z/gBceE0VyX4l8jXk+5gaP9NvXB8Zbppl6E9?=
 =?us-ascii?Q?fyjhqaFTBnTynlDbZTThhn6D/o2aFk1lmkRzVJthAFHurU6GJVUk7BeazawB?=
 =?us-ascii?Q?4sJ56HfZCwQ4PxttLcVKyUo=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec25ad44-0a88-424c-2698-08d9f8087acf
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 02:42:35.4864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iMCu0gTH4FD+TDp+UF1MXN7QKoFN69R7IwWyzJRoaBHllCrTaCF7DsXXqiwQNXtw8icLyl0zYsNi2UxLMX9v9Q==
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
Cc: Potin Lai <potin.lai@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch series add winbond w25q01jvq flash info and convert flash_info
flags in new format to align with upstream (v5.17).

The patchs from 01 to 25 are cherry-picked from kernel 5.17, and patch 26
is new patch for adding w25q01jvq flash info.

LINK: https://lore.kernel.org/all/20220222092222.23108-1-potin.lai@quantatw.com/

Jonathan Lemon (1):
  mtd: spi-nor: Enable locking for n25q128a13

Potin Lai (1):
  mtd: spi-nor: winbond: Add support for w25q01jvq

Tudor Ambarus (24):
  mtd: spi-nor: core: Fix spi_nor_flash_parameter otp description
  mtd: spi-nor: core: Use container_of to get the pointer to struct
    spi_nor
  mtd: spi-nor: Get rid of nor->page_size
  mtd: spi-nor: core: Introduce the late_init() hook
  mtd: spi-nor: atmel: Use flash late_init() for locking
  mtd: spi-nor: sst: Use flash late_init() for locking
  mtd: spi-nor: winbond: Use manufacturer late_init() for OTP ops
  mtd: spi-nor: xilinx: Use manufacturer late_init() to set setup method
  mtd: spi-nor: sst: Use manufacturer late_init() to set _write()
  mtd: spi-nor: spansion: Use manufacturer late_init()
  mtd: spi-nor: Fix mtd size for s3an flashes
  mtd: spi-nor: core: Don't use mtd_info in the NOR's probe sequence of
    calls
  mtd: spi-nor: Introduce spi_nor_set_mtd_info()
  mtd: spi-nor: core: Call spi_nor_post_sfdp_fixups() only when SFDP is
    defined
  mtd: spi-nor: core: Introduce flash_info mfr_flags
  mtd: spi-nor: Rework the flash_info flags
  mtd: spi-nor: Introduce spi_nor_init_flags()
  mtd: spi-nor: Introduce spi_nor_init_fixup_flags()
  mtd: spi-nor: core: Init all flash parameters based on SFDP where
    possible
  mtd: spi-nor: core: Move spi_nor_set_addr_width() in spi_nor_setup()
  mtd: spi-nor: winbond: w25q256jvm: Init flash based on SFDP
  mtd: spi-nor: spansion: s25fl256s0: Skip SFDP parsing
  mtd: spi-nor: gigadevice: gd25q256: Init flash based on SFDP
  mtd: spi-nor: issi: is25lp256: Init flash based on SFDP

 drivers/mtd/spi-nor/atmel.c      |  79 +++--
 drivers/mtd/spi-nor/catalyst.c   |  15 +-
 drivers/mtd/spi-nor/core.c       | 536 +++++++++++++++++--------------
 drivers/mtd/spi-nor/core.h       | 217 ++++++++-----
 drivers/mtd/spi-nor/eon.c        |  33 +-
 drivers/mtd/spi-nor/esmt.c       |  15 +-
 drivers/mtd/spi-nor/everspin.c   |  12 +-
 drivers/mtd/spi-nor/fujitsu.c    |   3 +-
 drivers/mtd/spi-nor/gigadevice.c |  57 ++--
 drivers/mtd/spi-nor/intel.c      |  12 +-
 drivers/mtd/spi-nor/issi.c       |  60 ++--
 drivers/mtd/spi-nor/macronix.c   | 105 +++---
 drivers/mtd/spi-nor/micron-st.c  | 208 ++++++------
 drivers/mtd/spi-nor/otp.c        |   2 +-
 drivers/mtd/spi-nor/sfdp.c       |  20 ++
 drivers/mtd/spi-nor/spansion.c   | 162 +++++-----
 drivers/mtd/spi-nor/sst.c        |  96 ++++--
 drivers/mtd/spi-nor/swp.c        |   2 +-
 drivers/mtd/spi-nor/winbond.c    | 174 ++++++----
 drivers/mtd/spi-nor/xilinx.c     |  21 +-
 drivers/mtd/spi-nor/xmc.c        |  10 +-
 include/linux/mtd/spi-nor.h      |   2 -
 22 files changed, 1045 insertions(+), 796 deletions(-)

-- 
2.17.1

