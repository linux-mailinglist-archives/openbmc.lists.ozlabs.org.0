Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A05C44C3C03
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 03:56:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4ZDj68vxz3bZC
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 13:56:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=4GR9KbrE;
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
 header.s=selector2-quantacorp-onmicrosoft-com header.b=4GR9KbrE; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20708.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::708])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Ywn3kFtz3bZX
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 13:43:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJgoaY+BN/9ACvIvPQv+YWtSYQGJALaw1+ziniqJP8o1STyszM+ymOBJ9EGORn3Rm6Np+dxgEKtwEnMz2OB3WBKWjNFYtPU8mRVnU7YPk0pGfOdyHT0EebdgGuOxx8SvIcZDW5RQUYOjiqWxYsNtvaXEREiyV+gtIcGRf0Gpl9X94HTkZ3r44Eht/4EqRQfPp0dAYtrET/aLD+B00DAL/+Be3RhFnVYlnoW3a59XGdMc/TY/PGtgakIh6xnXUf8U1jWf8ScyOo9iPrIyMu8FCdhyITy2Kf36F/mBU2oA2hs32LgMWHb7x7yqecVPTi/IPMRPjoH90R8rK42p4mKNVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlUr9XXqPb44EYeyqKg9N6TPTgUMJDOwRCZimpNeeSA=;
 b=ma73WiJqmMR2XluQ70ni13kek9OUff+lyZv5gQmmbkDsSbYSsYMMVQxxW5zF1qKchatk1HJRjtMSJFU5bRoA2WGGEH12f5uwulDhhrFb6VVYoDQJO9dU8hrS82GIpgDbEAUDdPULvsjYWYLFXAHuqqiNU8oDVyTKyJL5mzaIQoXmja6JO0TdXC9Qjx9HEY3P2Kyw9LMCWb82vRvX7Fwxc+wUQfJO6y0eR98V/+rZPm1NfJs0xWggIuN6BbPZKpPVebPAuJA3MyK74I0z/0W5gWEZLpwsyiXsPyga0RgTkOXk3/1Y1mtSw87QE8PlPTfHv22GbR7pGQvZggkxxKRJng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlUr9XXqPb44EYeyqKg9N6TPTgUMJDOwRCZimpNeeSA=;
 b=4GR9KbrES8q3ph3GD60bgUBDjEIAgLIjYGXJ43Y34TUtdYLNAqa0F0/H8hYWUz11CSGhITT4NQ5oh6ksZIRYfGTTzuYaqtWo1IyKnEmhDtUPfSVmHNNhxYuBBmvG3Xiy1UGlgskOOSg8NEwyB5qaHHtxo/n3/EEJIOaehb+tIFo=
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
Subject: [PATCH linux dev-5.15 21/26] mtd: spi-nor: core: Move
 spi_nor_set_addr_width() in spi_nor_setup()
Date: Fri, 25 Feb 2022 10:42:16 +0800
Message-Id: <20220225024221.19422-22-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225024221.19422-1-potin.lai@quantatw.com>
References: <20220225024221.19422-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:202:16::19) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 772133b0-c124-4535-8f03-08d9f8088046
X-MS-TrafficTypeDiagnostic: SEYPR04MB5644:EE_
X-Microsoft-Antispam-PRVS: <SEYPR04MB5644903FC80F15432970A2818E3E9@SEYPR04MB5644.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hZv02KP0oGwGE8FBJLoXSIyBE793kscIjV/ikz1lIo/oyiKoffytQunuDO3EgeMqXTECDAUh8Utq0L4P8gr4rVHLvC2H9BVajAPwUV1yf3d19ifbcCSETYWcFcO7agq7pddHA8wvCt9nvEnOQhfp3ZA5vhmro26+x9Jk7gxVY6Pv+C3P5CIhGPaTk8cFAH6KMxnN4HXZJub7J4PUvPxi6HmTu5fbmDmbx00H7fk9XnIcAAY1Vc8FbrHOp65CrTzjGEcwN/TkmNOaAW3H/b1HRGY/C4thGhbjh5XzWFKPGvARquruYIFLkyVrKbSnFGkAbu+VkuZBZ/36qdhtR96xKkwDnAYePRMZUIbbKKwpL2+POSyqbUKyBcQef6BKHhLyrnpI0fjCxBqx7l/2fBvaO1xUX716R8Y++mDh4ORBJik73j3SzqqIjV0MFmi8ISiCA1GSQeXkpLLkhIxYwWjrQYXQoZhb8Ux4mPsTXtHWBGSHe998vL0/EbSLqb5pGgDhdrZA/xH5zdl/6XkGQglAxj1ethFUxddPilWZPmuxx3buGIaXsLjhBwqsrIACiYmpXpnzPuG5V9HI43XQknnrlXq267kdruIz3sE+W8aWoEQH4YGGAw240i3kwIrAo+/oJP7CvnyWb7mC2e+TOY01qMkTnO4wOEM9QHFZqj5DGxfypPCNoZtJxdrtcMxvisZXHnEi+pfGNEBfA2Wc3kCvYHub2FBceGzYwXMjzfWcgyCbYj/toHXTh6WhfuEATQa4Y46B6bCTKt4ZAQY354simkIiBBBFXzDYfEmJKemfUf0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(44832011)(36756003)(54906003)(2906002)(6512007)(316002)(86362001)(6506007)(6666004)(6486002)(966005)(186003)(38350700002)(52116002)(5660300002)(8936002)(2616005)(8676002)(66476007)(66946007)(66556008)(26005)(38100700002)(508600001)(1076003)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1sLgG1JUk28tNMoAoJj1vMLGZcXHz6cXCcPClxTz1R0aT9Jv1SO0JErEPd+b?=
 =?us-ascii?Q?88jUt6HWY7bJFQDxBw7qFfTrGi6OpgBb5j+Wbvj49NDYTSTNlRnlWGN7Mc9/?=
 =?us-ascii?Q?vXP1bYz2bdCAPGmmZTyb4yhvSd77yx9wQl/aUeqC4m8DAJVQnXVFWplixjLN?=
 =?us-ascii?Q?Mmw7TFD3g9hQAR8sAJ119ldstnYEsSwWUha2gTvGlktJ5o3Ed0abQhwq16a9?=
 =?us-ascii?Q?63WHFJCi0PwaosmWbLcY6NswBtZHpbbCt8es0Z+fF5UcWPxRoDTwtSR1V6q/?=
 =?us-ascii?Q?4sTtLkayb+oPtgir4h3QjkdXAIc5yILYsKM6o9eO7xalz+Ugr3DRJivec+4y?=
 =?us-ascii?Q?ddhTs3a+AGAv9+oprAb07m8jVMrLBkNmVO7pZpnJNHB9biOETazqJIZo+m+m?=
 =?us-ascii?Q?eFnaqhAX2ziyS3c+4RT4iKo632iKPyw1YtttOYbi+D0aWJgUbRJ7zsd7c4hp?=
 =?us-ascii?Q?O30h8tajpyHVHy8DB/Zao4QzzrTvehVhwXR1xs2gCFnsmd+wSNVCX9IPisDf?=
 =?us-ascii?Q?QqgjvqvC9sNJcgyQl7umz1Ma+FVCv5GVbyjjFCz8GhjCZX9NXxCfUupE0P0P?=
 =?us-ascii?Q?9seCAuQfiFzV4DTtnnx/IiBKSOTRYJoNSHpDgMqokEJ6oDZtM8R3FVKJU3xQ?=
 =?us-ascii?Q?JQ9gU0iD1e3/dgVwisfOJb6Pt8sILYoL2z12dThGKi1wwSlvN15a40pETEF0?=
 =?us-ascii?Q?H5Gee4HhvBwQ3ra+1kVAXkTRII0OMgJ3hFX2J8ODRVuDoT+V9vghJTNqe1dx?=
 =?us-ascii?Q?kywwxLJ66UNHBmsnqPbB3jNCWEKYphK/v2Om9XDVeXuYgSbZd8OyWhX441pg?=
 =?us-ascii?Q?BHn4lOjtN3QqIVxAs8JitpgYVPvPEQYWBOzAW8UnX4mb2uCnFaFG8MMsmk0x?=
 =?us-ascii?Q?8l9frL16MwlMYdtCfABFkkr4eJlUX1o9g1xCpb7NcXzG90/Ux88zPIrmXykq?=
 =?us-ascii?Q?A8r4pTG1aNRPYFE2lL32j0pr3l3n3MrEa/4ay5Ak+azaiifRluin/uetBXQ6?=
 =?us-ascii?Q?MtK+a1AZDy4OLV+MujP8kqjd/vudaA+1c5foRK+zJREF5aiSOEfzA6iH6apb?=
 =?us-ascii?Q?fyAdAtE5Om3nnPZt1pxZKUkynAdDvZe2dn6qHRvQf0FrAiAndnJIUkKrql+C?=
 =?us-ascii?Q?kCVm2VumjiKgCwrMo4t1zZxgnJHtdGpZ9pNo9vc6kpRQIolc343P/sfQDqKh?=
 =?us-ascii?Q?nfabM9ao0FNgJfq0hM0OrDsqvh+1RZJ7oyJLqgs0lhuXqSkj3ZWgLnqxA65D?=
 =?us-ascii?Q?Ee5P124YEuIJAxaS6xeCWzWHe8x2EDiEU3dlFjjdxDZ/NoVuuCTzyUTnYNtF?=
 =?us-ascii?Q?GjfVBwsHbqY4nogI0/aeizu53TMFuZbJ8qu3PSQQEy3J4E7IKzl37d9w+0Y3?=
 =?us-ascii?Q?ZF86/z4MlqW49zUYBVbTj/5rMA3bDym6OKcDriljPQJRl/5KBxejpbSZMdsG?=
 =?us-ascii?Q?qUDthCUfTiCtmM2jAajGTdavWquPkSLdCqJ1tr7Q8KeMwT7xyMEuiIHLV1MT?=
 =?us-ascii?Q?1/QJnM0wU8FiPTdGa3MA1ma68sM1Od3sQIULU5kq/4onDDFdbKud2y4xKrui?=
 =?us-ascii?Q?t/N3DbCD1z4cjUFswnCLXW8078sgO1x2DbPrKV2MH5hze+wJF6IcGjsPk6KA?=
 =?us-ascii?Q?J5Q1jAYmlUD8brYBZ2rg/iw=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 772133b0-c124-4535-8f03-08d9f8088046
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 02:42:44.6264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: exaH8PqaAkSXtSNVsd4Q/S/lIjxfsB4YCCZP+/lCsRx2GD+C9YbOHYRs5i4Wo3Jvq6oUoQqaJSM6aZwLnm/4Bg==
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

spi_nor_setup() configures the SPI NOR memory. Setting the addr width
is too a configuration, hence we can move the spi_nor_set_addr_width()
in spi_nor_setup().

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Reviewed-by: Michael Walle <michael@walle.cc>
Link: https://lore.kernel.org/r/20211207140254.87681-11-tudor.ambarus@microchip.com
---
 drivers/mtd/spi-nor/core.c | 102 +++++++++++++++++++------------------
 1 file changed, 52 insertions(+), 50 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index c5a5844e98c5..2e21d5ac0e2d 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2484,13 +2484,61 @@ static int spi_nor_default_setup(struct spi_nor *nor,
 	return 0;
 }
 
+static int spi_nor_set_addr_width(struct spi_nor *nor)
+{
+	if (nor->addr_width) {
+		/* already configured from SFDP */
+	} else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
+		/*
+		 * In 8D-8D-8D mode, one byte takes half a cycle to transfer. So
+		 * in this protocol an odd address width cannot be used because
+		 * then the address phase would only span a cycle and a half.
+		 * Half a cycle would be left over. We would then have to start
+		 * the dummy phase in the middle of a cycle and so too the data
+		 * phase, and we will end the transaction with half a cycle left
+		 * over.
+		 *
+		 * Force all 8D-8D-8D flashes to use an address width of 4 to
+		 * avoid this situation.
+		 */
+		nor->addr_width = 4;
+	} else if (nor->info->addr_width) {
+		nor->addr_width = nor->info->addr_width;
+	} else {
+		nor->addr_width = 3;
+	}
+
+	if (nor->addr_width == 3 && nor->params->size > 0x1000000) {
+		/* enable 4-byte addressing if the device exceeds 16MiB */
+		nor->addr_width = 4;
+	}
+
+	if (nor->addr_width > SPI_NOR_MAX_ADDR_WIDTH) {
+		dev_dbg(nor->dev, "address width is too large: %u\n",
+			nor->addr_width);
+		return -EINVAL;
+	}
+
+	/* Set 4byte opcodes when possible. */
+	if (nor->addr_width == 4 && nor->flags & SNOR_F_4B_OPCODES &&
+	    !(nor->flags & SNOR_F_HAS_4BAIT))
+		spi_nor_set_4byte_opcodes(nor);
+
+	return 0;
+}
+
 static int spi_nor_setup(struct spi_nor *nor,
 			 const struct spi_nor_hwcaps *hwcaps)
 {
-	if (!nor->params->setup)
-		return 0;
+	int ret;
 
-	return nor->params->setup(nor, hwcaps);
+	if (nor->params->setup) {
+		ret = nor->params->setup(nor, hwcaps);
+		if (ret)
+			return ret;
+	}
+
+	return spi_nor_set_addr_width(nor);
 }
 
 /**
@@ -3078,49 +3126,6 @@ static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
 	return NULL;
 }
 
-static int spi_nor_set_addr_width(struct spi_nor *nor)
-{
-	if (nor->addr_width) {
-		/* already configured from SFDP */
-	} else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
-		/*
-		 * In 8D-8D-8D mode, one byte takes half a cycle to transfer. So
-		 * in this protocol an odd address width cannot be used because
-		 * then the address phase would only span a cycle and a half.
-		 * Half a cycle would be left over. We would then have to start
-		 * the dummy phase in the middle of a cycle and so too the data
-		 * phase, and we will end the transaction with half a cycle left
-		 * over.
-		 *
-		 * Force all 8D-8D-8D flashes to use an address width of 4 to
-		 * avoid this situation.
-		 */
-		nor->addr_width = 4;
-	} else if (nor->info->addr_width) {
-		nor->addr_width = nor->info->addr_width;
-	} else {
-		nor->addr_width = 3;
-	}
-
-	if (nor->addr_width == 3 && nor->params->size > 0x1000000) {
-		/* enable 4-byte addressing if the device exceeds 16MiB */
-		nor->addr_width = 4;
-	}
-
-	if (nor->addr_width > SPI_NOR_MAX_ADDR_WIDTH) {
-		dev_dbg(nor->dev, "address width is too large: %u\n",
-			nor->addr_width);
-		return -EINVAL;
-	}
-
-	/* Set 4byte opcodes when possible. */
-	if (nor->addr_width == 4 && nor->flags & SNOR_F_4B_OPCODES &&
-	    !(nor->flags & SNOR_F_HAS_4BAIT))
-		spi_nor_set_4byte_opcodes(nor);
-
-	return 0;
-}
-
 static void spi_nor_debugfs_init(struct spi_nor *nor,
 				 const struct flash_info *info)
 {
@@ -3252,15 +3257,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	 * - select op codes for (Fast) Read, Page Program and Sector Erase.
 	 * - set the number of dummy cycles (mode cycles + wait states).
 	 * - set the SPI protocols for register and memory accesses.
+	 * - set the address width.
 	 */
 	ret = spi_nor_setup(nor, hwcaps);
 	if (ret)
 		return ret;
 
-	ret = spi_nor_set_addr_width(nor);
-	if (ret)
-		return ret;
-
 	/* Send all the required SPI flash commands to initialize device */
 	ret = spi_nor_init(nor);
 	if (ret)
-- 
2.17.1

