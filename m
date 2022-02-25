Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B44F34C3BE4
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 03:45:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4Z036wRvz3bSq
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 13:45:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=RwBc+Zcw;
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
 header.s=selector2-quantacorp-onmicrosoft-com header.b=RwBc+Zcw; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20707.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::707])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Ywg0cmZz2y7M
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 13:42:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A4PZrxkbCjBfVysDuA69QSiEBKW7Eea9XafcBDmPmnn1hQ3RYjlOZ/MwLvyrD+AR321eTVABi3XRwr1DgZzXGPv1AvlFZxltNC9CVyOaTBAG3dVK1zUQWl+zikTGKZ/0A1mRJoezCGMCo4ED34/+Jtir+cYfhw5DM4N7tojMea1mitHDuu1/l9DYkPafhJdM1Z7lm0RZyztTZrOUA7e8tqme/X7n5y4W4opmNlv+cc0eMK3ZC61VffdFT02HMJqzs/eGNWzuC03RmViotDweQh9TUO7TAkiAR6lqcaEftscM8oLQbPhojKp297ct5BSa7laFpaeygleJXi3neiWCYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHVe6EXGDgmc4K3kakz6mUHbv0BqGglHiE6jLV3ADe8=;
 b=PekMlvbpwF+V+p1tCNJlsdm0gGkCi96SmObh7Ii2bafYDEoInfoUZ7XvxqMC0NrAPH8MhFK9uyYglEspR+HsZl5Lz5wP3TQ9MkT0JHAl2hgO25L/omkXNtVDOoyrWNH1nAd+EWCvr6Yta1UHAnRu3beVk/RBQOswUZo2fh/z3gBTDy7Nz2T81Ovz/hj6F9BV2j8om40v1WyEdO3GyzjW/QuQBtzW9WFqtqVHUkiilr/oouxMxqFxiKzt4GS+1/eKz0qrFR7m439apnVJ1dlBPSuGvLAM7Ey+r+vmUchw/OHTVyrrrKmIUwweete40rZKZXkWiwdddkHAcit4yJQsXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHVe6EXGDgmc4K3kakz6mUHbv0BqGglHiE6jLV3ADe8=;
 b=RwBc+ZcwMjOLagtMa/hG6eoZMfgx9cRmhs28xkKml1W4iFq5P3f5s4syTAONwsQr23z7EjoB7JXd0Wfj8wT7qX7nwBnoqAcFhvqNY0t8hwyKOko+ljPHVr6LbWbfs0v++TNyUcx0vkKXrwoCQgCLm7NMXuJWa6iZRYTMWjJyZa8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SI2PR04MB4507.apcprd04.prod.outlook.com (2603:1096:4:122::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Fri, 25 Feb
 2022 02:42:38 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 02:42:38 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 05/26] mtd: spi-nor: core: Introduce the
 late_init() hook
Date: Fri, 25 Feb 2022 10:42:00 +0800
Message-Id: <20220225024221.19422-6-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225024221.19422-1-potin.lai@quantatw.com>
References: <20220225024221.19422-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:202:16::19) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0015fbe0-aa97-4f1d-c22c-08d9f8087c15
X-MS-TrafficTypeDiagnostic: SI2PR04MB4507:EE_
X-Microsoft-Antispam-PRVS: <SI2PR04MB4507492778E9DBDEC3A112518E3E9@SI2PR04MB4507.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ESSNEbXVtr1Tuhr3SY0G+2hslaCp3n5x4DH6uvOoCdAeJI3Mz++I6HnOoiq9tFhqg3JQroXiWklwUZ3m7+vQ4BG3w7jLwbgZ204gnRpDo8KMRkvc2n51e2SXWKCmKPWvOroNLbFOScy2ux86lVbq6eDZgmRqRNAhDGDmCvCruB9khNBvqrL5ea4zvFLOjgq0R2zdPE3afPLBM6OqJYlHhb5bjOrUH+MfJ1Xu71wVmDvfuA+5TmOBKpYlG8aRVImyOfynl4AZXsz5Yj+CAE5jz+7nHDtFtkQOFMzYjsFtqLBmLo1lJvQuOn1+eCtBA5Ia0/INXx+jcx2E4jSc6DMkyvVW2oZaix4l9NtUKMdD8id9//jrQdEXIz5sorc30O0c6hEob5gJSI+Z6o/SYZjgObA6NIVgOfZh46Oj0APKIMu4qBzBYm1MO9sGyFxfwxuWC74QWrwF64qk2mDKFTv5C9H6IKIuntR26BYcjdFScTFqDkmvL6KhVW8UFwDras8f3xfWd8WfuUzp0hRngOo1ev2dc7YTHjz1hI44LDJQ0fwPSuPTQPyPS2CkGwQ8XZb/8lQD1LEvBas8bfGoEH8pPpMxkDEVaHd4STWcbbE23jdh6IpvKSKPu/fvAaGpAsnIcWmIq5S6bAeefZIxRE0IkQ7wv/WSeOljNNwtLinnyYCADJi2nxUg9D817JTmoVrOnADpJ3BadbY6JsVY23Tu493U5h+Sv+Vszn8ZoxrLykXJhqF9SrV6IaaZ2Up7V+bTNTqQn9OCECt6LUODXcHNWNRWOhc8h0tMt2H7otD0fW8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(26005)(186003)(36756003)(1076003)(6512007)(38100700002)(38350700002)(86362001)(83380400001)(8936002)(4326008)(6486002)(966005)(508600001)(8676002)(54906003)(66476007)(66946007)(66556008)(5660300002)(6506007)(6666004)(52116002)(44832011)(316002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HgSo583odcCtju290JXhFvtkrt3mF5HcDtk7K0m3FiPbbV+e4W1VrIwjCrMj?=
 =?us-ascii?Q?SY3AuED+57ANQ1mgubA1yw/Edec6imM16ad6bYwi85LIdIs5/a5YegKmNdKw?=
 =?us-ascii?Q?hA5StKhRrA+3FHyT+UeuDMx4Sahht0Krb5A+/op8Hzsg/ZDrxOPzPfUdKsmR?=
 =?us-ascii?Q?Apo+sNf26W2nOj+3+eYsRN/vQgzqxOoHbZUSemSp2rfN/vTWzlK78vmZjfRK?=
 =?us-ascii?Q?4lDogpi0LOwylQAWTpQZcUdxG+zT7dswzi15ySSOiKYWBT2AI5S0oh0T9LPo?=
 =?us-ascii?Q?gzLuZMBcw7kJ8PTLV1d9V75A5p7lD6oe83m7CVv6F8vxeTmTVYG6d3EZG8z4?=
 =?us-ascii?Q?LZuvdd6R3wrwUUEHR+BADXnPMVpOjp40JrN82vlfJnnGQj+NK5pKxf4/Y/kB?=
 =?us-ascii?Q?5exFWDeD1GQpAlM+eomo/eIXvFLE2m6K4hLgnhrfGP29W23B+AZHXFNBRmcT?=
 =?us-ascii?Q?WZ2mhOCeKiWs/ajxaipXciR8RTdN51qyNMA4bP6P1ZU5zcqxomtnBmWzA0HE?=
 =?us-ascii?Q?EiroRoWBHHECjir02u8Bue81wZd+KxJBI7V/nVR/J/j9cpyxdCIwT9y5XKpg?=
 =?us-ascii?Q?MMrvyBTB0P4pzO2/53S6FMJdhtOSsomB9drf4CiFYX/6ihtI3k6c7/iGyWFa?=
 =?us-ascii?Q?iLoLzxmjKaaAF7SGkCoTsXjkz73j4cpNO3Fa2Qj4kCeAc/wga9SGujpaO6Dw?=
 =?us-ascii?Q?adCoHWRgcpCnHkupS2SR3Mn3XLGbLeMFMjqKN98kprAhLTaTnZGJEkj62Zir?=
 =?us-ascii?Q?WwzGely2K2wnWna0ul22DvQKEE0ngk1USCnz/UtAkZ/btwlDtXcYfgXDX/QB?=
 =?us-ascii?Q?8Yjo/EoDKxZtrLY8Cr1c4Pe6X0Wr+GkB50K1fByjm3Cshjir+FFGwk1UvwSh?=
 =?us-ascii?Q?06IHQcjks37r6q4H8aQL1dqG1eixB7vYg/FUyKXvpEUOsuyndq516X3ROb5Z?=
 =?us-ascii?Q?aVNCWYTBPaGiVLDil8lkxsetflDq5fg7geyczPrGJk2M0fJc02ia+KNYq3d/?=
 =?us-ascii?Q?02DXMrQcdyj1k/SXvgCieRFei9VRgbEn5z4ELbvYFW9flY3pZTlnpqhxZDWp?=
 =?us-ascii?Q?9SJvvHG14Lu6a+VGwe2TDGGvmTFGlf1RLUGP8pdF6JFL/ojKHFKf/HCXWTyS?=
 =?us-ascii?Q?D7+xlwSvmPxQ4LEsTLLJBcmYTWBHEd74s3K7QKcLac+yJHOM7nwXPedfrvpN?=
 =?us-ascii?Q?j0IsB0f7rbt50m+Te9O/9SmNU8O1SPp3r527ST5exZeLMJF4XqQUIwbZDAcU?=
 =?us-ascii?Q?Zh4XyNYhPnNwLComqE+JmHIszPkMCwAkfZNIHJTI00/3yX2j3bgEeL0vGUIz?=
 =?us-ascii?Q?+5AiESLEQa8+gRyjyJiyaYuxamIZzNctuYHIexas6s5naaE8kJ3eAsHbZ/Zr?=
 =?us-ascii?Q?Wb2glf0Xv/Hy0OXzNEJ2Vl5P4hL6fEVF3a9h31c/dqtF/j6j6hTZ/O1Hw9VF?=
 =?us-ascii?Q?GTOEH2Og2i7/B5qUkyxBPTkTLebI91mV3KTWvFFledA5ECI2TxTfbMVniBDj?=
 =?us-ascii?Q?9e5+Uia7nRC6BPuljI2Yi008HrO4TNd8LF5iRelQS3KGDoUu3AgkrkZf7mpR?=
 =?us-ascii?Q?DaMMzUSINCsUFCXQNfK4ULGAS8wu2ZGWAvIT1EjrClri7iHuW2vGQ0rca0xA?=
 =?us-ascii?Q?py33scwXxmwUDXeY4qAUhaQ=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0015fbe0-aa97-4f1d-c22c-08d9f8087c15
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 02:42:37.5957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DLjRhnJbz0Om4W6w5Lqv6xlmesEqG5NA5GPyorqd0iEBirpZVMTc2IXFd9MpscaZrOiIYkd8aNeIYoRbThV/dg==
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

Flash parameters init is done in a spaghetti way right now.
There is the init based on the flash_info data, then there is the
default_init() hook, then SFDP init, an intermediary post_bft(),
then post_sfdp() and a spi_nor_late_init_params(). Each method can
overwrite previuosly initialized parameters.

We want to separate what is SFDP and non-SFDP specific. late_init()
will replace the default_init() hook and will be used only to initialize
flash parameters that are not declared in the JESD216 SFDP standard, or
where SFDP tables are not defined at all.
We cut a member in the chain of initializing parameters by getting rid
of the default_init() hook, and we make it clear that everything that is
in late_init() is not covered by the SFDP tables defined by the flash.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Michael Walle <michael@walle.cc>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Link: https://lore.kernel.org/r/20211029172633.886453-6-tudor.ambarus@microchip.com
---
 drivers/mtd/spi-nor/core.c | 17 +++++++++++++----
 drivers/mtd/spi-nor/core.h |  4 ++++
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 3ec0959ffc20..88dd0908d172 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2666,11 +2666,19 @@ static void spi_nor_post_sfdp_fixups(struct spi_nor *nor)
  * spi_nor_late_init_params() - Late initialization of default flash parameters.
  * @nor:	pointer to a 'struct spi_nor'
  *
- * Used to set default flash parameters and settings when the ->default_init()
- * hook or the SFDP parser let voids.
+ * Used to initialize flash parameters that are not declared in the JESD216
+ * SFDP standard, or where SFDP tables are not defined at all.
+ * Will replace the spi_nor_manufacturer_init_params() method.
  */
 static void spi_nor_late_init_params(struct spi_nor *nor)
 {
+	if (nor->manufacturer && nor->manufacturer->fixups &&
+	    nor->manufacturer->fixups->late_init)
+		nor->manufacturer->fixups->late_init(nor);
+
+	if (nor->info->fixups && nor->info->fixups->late_init)
+		nor->info->fixups->late_init(nor);
+
 	/*
 	 * NOR protection support. When locking_ops are not provided, we pick
 	 * the default ones.
@@ -2712,8 +2720,9 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
  *    wrong).
  *		spi_nor_post_sfdp_fixups()
  *
- * 5/ Late default flash parameters initialization, used when the
- * ->default_init() hook or the SFDP parser do not set specific params.
+ * 5/ Late flash parameters initialization, used to initialize flash
+ * parameters that are not declared in the JESD216 SFDP standard, or where SFDP
+ * tables are not defined at all.
  *		spi_nor_late_init_params()
  */
 static int spi_nor_init_params(struct spi_nor *nor)
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 223a03769950..50bae06bc024 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -297,6 +297,9 @@ struct spi_nor_flash_parameter {
  *             parameters that could not be extracted by other means (i.e.
  *             when information provided by the SFDP/flash_info tables are
  *             incomplete or wrong).
+ * @late_init: used to initialize flash parameters that are not declared in the
+ *             JESD216 SFDP standard, or where SFDP tables not defined at all.
+ *             Will replace the default_init() hook.
  *
  * Those hooks can be used to tweak the SPI NOR configuration when the SFDP
  * table is broken or not available.
@@ -307,6 +310,7 @@ struct spi_nor_fixups {
 			 const struct sfdp_parameter_header *bfpt_header,
 			 const struct sfdp_bfpt *bfpt);
 	void (*post_sfdp)(struct spi_nor *nor);
+	void (*late_init)(struct spi_nor *nor);
 };
 
 struct flash_info {
-- 
2.17.1

