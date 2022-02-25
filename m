Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3104C3BE3
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 03:45:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4YzH6y4bz3bT3
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 13:45:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=e9pRCENa;
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
 header.s=selector2-quantacorp-onmicrosoft-com header.b=e9pRCENa; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20729.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::729])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Ywf4Xmfz2y7M
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 13:42:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X6zWdngX6V8kK18tZQRl6AVgGnZTThNNZVJwF7DHrH45WUM1EaO2MSy9cq1g64UTW0UrU2I309fZLdhrzrZvE6Gm7ctmFYB8i2jhePV09znvOnWaDnMP8nrH4j8rdju6ApRIefQUWPcb9SifLslPJPNkn8vfwjW/FqmA2VJMZ3k0rPyLm2M0UEq9vXv49u7jFVEJgHp4cl8nC+EFi87/Gkjd61ggMjv36qn5rQaLP7gqH78zBaZ9+E8Q5pu2df1RoLoKM9RiKE0BvPz1o+1rxMSQAj24FDgc4c3Qy2SkdGGX45T+UBah4RUbJ2VNS/53aSsasz3sEKzX2uaqtQ4akw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQGUG9Co/zOO3hnnGx1qLLWyw2Xb0Fe0Vj2zoFpDzMo=;
 b=k5uKZ6Hj6MRuxtDqewDwZB5WFOdPtywbdNdbiV1GBWX2hQM99fdrqFXjGDN80URLl56dx+EHevkIIrD972UBw1H9oIisF3JsD3e/osoHyncZeHWVi1Mu9w0Hq5Ht0e7KA6A1XVCFkrABnRaaQLEH6YxrLgTwhKt6BLTtJXaGCfv0fhydqdW2He2wQN9Hc8O/kNuC5uO6zv22XwIsX8/Fa0zRyt2MlRvb9ll+PBog8RDi/EGejsEk58Vz5Yf9jWcH0ppkwS703fvrO52+i5dSbOIySkJnGpx4iAxHgLLtd0Ww+rEX+sVDGEZztG26q5NsrIKaqsQV7gpyL8nga67G+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQGUG9Co/zOO3hnnGx1qLLWyw2Xb0Fe0Vj2zoFpDzMo=;
 b=e9pRCENaDEUCpEl0Vsb3yZkVflqg+EGz7yLcflWlLWxCxOKbR2LyP+ygV7jz0jnmYI1p+ZJnR6eogymqIEkLlrwvtadAeuJjyhRaeHO/kszxoalNsJa5m9bqn8nik5yUUJBtTBk13Pg87yUAqzxzK8WwrGSGJfeLjaPd61GRreU=
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
Subject: [PATCH linux dev-5.15 04/26] mtd: spi-nor: Get rid of nor->page_size
Date: Fri, 25 Feb 2022 10:41:59 +0800
Message-Id: <20220225024221.19422-5-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225024221.19422-1-potin.lai@quantatw.com>
References: <20220225024221.19422-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:202:16::19) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85b3a8a7-38f2-484d-2894-08d9f8087bda
X-MS-TrafficTypeDiagnostic: SI2PR04MB4507:EE_
X-Microsoft-Antispam-PRVS: <SI2PR04MB4507FE654B4EBAC7ABFFDB6F8E3E9@SI2PR04MB4507.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p96hZUvPVwzicqqGylYQp9FREgz/nNZk69X15GpsrRqSGuPs8qBmRPpAj4swWCcmdiqgD/HOw3QTTH+6PbhxXJ7tOnIEWe97D4BYpOnni9Pr3WH/88JTQHy7YEqSF5TGUbfDoQ+OPppniDxCJFqL97XAD99T78L9cK8+gGxSIftB6XXFaif0e+GHJNm+qHizAe1GdpuHhyJo7THpTr3VsKAfcDklkUq5vSUXQj97JPsGR9ytwLbuW+arGuMQlMNSPtjNuj3nj9OqbmUUfzWtgBewzhRG1hOoIcd5m6LkI13Uq3lfMQHjTTj2/wRdx2vrWBzb55gpV/XIytMRVGDbQMBtFFLdq+LfapumohBNF2ZcWntITRyUnDt3awpY0itTe/zkLLiffeJD04qxw8RCsmWOExOerdxCHjOooXD9OM9wysk26snDYxL8dBhRbTCdmCFXv0icncJws8Yi5t28flslUPzPtU+vPmpaMN31vcBCL/vWuj2XDSi97EmUB3iN0GcGRhaGZbgocyn/tA6PwS8Z9uv+mX1W64d3FWZWSHMelkfOt8cefDCZ1dfpqYzBHGBjumdHcuUkyd1bMSOqTEcVMppz3ONNhqqq6ZdS2HxBKFSU6ytqhIxJnhoO1dSEchmGsowCZ5i8gTvZupFIQDrvv24exh/qN7uIpT4b35utmUj9P3c1uLicAHl/o/WbfU0AYlH+y5kPKdUmNb7I613BTfVS7l7e8bPF2FXVjImQ+lX64uA9QBegrqkkjgBUkp8kGJ+mkedLILkjnWmjI/dqkGH0dPzknTlJTBIWFsUcwsseZlt1C+++WNHDbQC3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(26005)(186003)(36756003)(1076003)(6512007)(38100700002)(38350700002)(86362001)(83380400001)(8936002)(4326008)(6486002)(966005)(508600001)(8676002)(54906003)(66476007)(66946007)(66556008)(5660300002)(6506007)(6666004)(52116002)(44832011)(316002)(2616005)(26583001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nkvpNanb7Iv4jFr1tROudNgYe8+JmCy+1UPsCnMeS781/7IE86FHRiWVN+VZ?=
 =?us-ascii?Q?cd9w9KTgE4OJBTdFdLiy3EnrZslV2pOkN5g8muEcRnQqyp9dwYk77BqtV6gs?=
 =?us-ascii?Q?onWdAc6FOcUu08bJXRZEzeOpy7gMs8HsqUEY3seCU0aOMsFPuuE4mXr4Bvg0?=
 =?us-ascii?Q?GDdbS/7j5MZ+ECdCcgopYvEdgQdYmuHvZ3CHe9r6rmdmQd5NOvN7i/FAT9+9?=
 =?us-ascii?Q?kiaV/FvPjycpYhGvy5PTUJPGxsF/L1adpMrXLz2A9FPDgfmuDdkHUqWQSy4x?=
 =?us-ascii?Q?s8gyYCITlsiFPrhzCltytllxU2+/pvsbIH/a//m/R5b8/p5Tsid8z8ZtP2lA?=
 =?us-ascii?Q?lZDWay4jfhppFZ9mrqdDh2YZgy7fRzTAY80bFBVmIcsPBdR9XG7d/SojVwjU?=
 =?us-ascii?Q?q/yivN9fNbZLlbrgXXuVVmaPcW1nw5H2VRs7cRRMwRvVBBFQTocMviRV1R1K?=
 =?us-ascii?Q?f+j4nDPPMacVq68gFmXieVAquB7QGXD7/UBxifZDiciOW3q1nUrwS23Oiafc?=
 =?us-ascii?Q?sFLNawqYvw3HmhnCYB4HGMqwecRWhvjaJnTlg4Uw7eJAekEwAQYnEB2OUs1U?=
 =?us-ascii?Q?7YSHfDKhCskag2OK1yBvO7ozmwzPqxIW06mXT/hbYhFfgilfBFqWEK+rCML8?=
 =?us-ascii?Q?pCKsLixJ3+ldyySw//jXpC1zLDCLJbH+x9u/6uJPBY6a6ML/TFDyCHJu4wO4?=
 =?us-ascii?Q?SZumhCA5OLyX9CoKZ8DSpGY/4nrrdDmoh+nxtikuzqwrDFVPaS5tdVFa3ls+?=
 =?us-ascii?Q?rhlG0Ts0kWecelgZOEKljXR2LVylZK6I1cKGhVbL3ziR9fZ9FQbSUQKCIgcg?=
 =?us-ascii?Q?X/E0D43+kemJ/0fcQ/V6eeJKzg2RU93hPICqdsn/ZpbgUDkHJmVuRP4c/8KM?=
 =?us-ascii?Q?p4huIEb/EukYa58jt3BKoFvEN+MLNr0MqBCk3+85M8GO9d2DIiM/9QAKAREE?=
 =?us-ascii?Q?fZ2319aO2WfGp6WndVN6gsbrul2u1gfuvexIR2iG3XIZ1OOx7rPS5swI/54r?=
 =?us-ascii?Q?6KYFawfhtlj8fxwRrLHhtXCqB2ydPsR04H+T50XeDk5+F4AvFwmp6yZj3/+M?=
 =?us-ascii?Q?L6+wgB0Doy18mmUaJadh6Pt7wK2/gizW9u6KYgAP6JBOsnY7MVjcflwYgL2y?=
 =?us-ascii?Q?SL/+9QgISov7JyZktDxhEiazOXL3WGj2LivH3gEZHYcwz0AoPHdqKv5I2pot?=
 =?us-ascii?Q?b1r00xvmnU3Bk1YKvlRkwBxNTbbeZqEzdgeFYnAS+xjqi6t/wZljxyy72tYd?=
 =?us-ascii?Q?YzJGjrvgBFy08+8YGa+z21bK/GcUb4+yTtQzdMF53jjvqn4Gi5MA2n2M5fz4?=
 =?us-ascii?Q?kO2/yrwSu2sw3sCE6aJaqidmUF9uchjlQe7BKsjDKOjotQvI6UROmsGbNVIj?=
 =?us-ascii?Q?Kl0PT6i3iBRKjMDshOFO/1eRxg+FH9dOtIeyXru5Dm9J853NJCqFL5LjXjo+?=
 =?us-ascii?Q?K3w0aIghjrHB/P8EOgijB6MFYE6VdkGFsZp49OV0GWd8Zm8o039P8vYSJJJn?=
 =?us-ascii?Q?3uVxqxiNOMsALoaphM/BqFqffMxxrX7bPZFWS2fQU/3T6+/fiz8xMUFmdKrG?=
 =?us-ascii?Q?FKByxdVJTszKhF4fBzBG+OQgrvbSU8kNEK2vuFRBsrtjiq9RF9EkWkkog+Qo?=
 =?us-ascii?Q?7ho0guP6D5jFgmBll7rsxDY=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b3a8a7-38f2-484d-2894-08d9f8087bda
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 02:42:37.2207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3d7iCIxzYoTEeqWz/+EEa9TKumZ1K7G1kGFzoL1c/zwzaWVYh+p0pTP4SbMdqU4rQ7cFgGWbdAtggMhPU1769g==
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

nor->page_size duplicated what nor->params->page_size indicates
for no good reason. page_size is a flash parameter of fixed value
and it is better suited to be found in nor->params->page_size.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Reviewed-by: Michael Walle <michael@walle.cc>
Link: https://lore.kernel.org/r/20211029172633.886453-5-tudor.ambarus@microchip.com
---
 drivers/mtd/spi-nor/core.c   | 19 +++++++++----------
 drivers/mtd/spi-nor/xilinx.c | 17 ++++++++++-------
 include/linux/mtd/spi-nor.h  |  2 --
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 277d1fde84c8..3ec0959ffc20 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1952,6 +1952,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
 	size_t page_offset, page_remain, i;
 	ssize_t ret;
+	u32 page_size = nor->params->page_size;
 
 	dev_dbg(nor->dev, "to 0x%08x, len %zd\n", (u32)to, len);
 
@@ -1968,16 +1969,15 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 		 * calculated with an AND operation. On the other cases we
 		 * need to do a modulus operation (more expensive).
 		 */
-		if (is_power_of_2(nor->page_size)) {
-			page_offset = addr & (nor->page_size - 1);
+		if (is_power_of_2(page_size)) {
+			page_offset = addr & (page_size - 1);
 		} else {
 			uint64_t aux = addr;
 
-			page_offset = do_div(aux, nor->page_size);
+			page_offset = do_div(aux, page_size);
 		}
 		/* the size of data remaining on the first page */
-		page_remain = min_t(size_t,
-				    nor->page_size - page_offset, len - i);
+		page_remain = min_t(size_t, page_size - page_offset, len - i);
 
 		addr = spi_nor_convert_addr(nor, addr);
 
@@ -3094,7 +3094,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	 * We need the bounce buffer early to read/write registers when going
 	 * through the spi-mem layer (buffers have to be DMA-able).
 	 * For spi-mem drivers, we'll reallocate a new buffer if
-	 * nor->page_size turns out to be greater than PAGE_SIZE (which
+	 * nor->params->page_size turns out to be greater than PAGE_SIZE (which
 	 * shouldn't happen before long since NOR pages are usually less
 	 * than 1KB) after spi_nor_scan() returns.
 	 */
@@ -3170,8 +3170,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		mtd->flags |= MTD_NO_ERASE;
 
 	mtd->dev.parent = dev;
-	nor->page_size = nor->params->page_size;
-	mtd->writebufsize = nor->page_size;
+	mtd->writebufsize = nor->params->page_size;
 
 	if (of_property_read_bool(np, "broken-flash-reset"))
 		nor->flags |= SNOR_F_BROKEN_RESET;
@@ -3340,8 +3339,8 @@ static int spi_nor_probe(struct spi_mem *spimem)
 	 * and add this logic so that if anyone ever adds support for such
 	 * a NOR we don't end up with buffer overflows.
 	 */
-	if (nor->page_size > PAGE_SIZE) {
-		nor->bouncebuf_size = nor->page_size;
+	if (nor->params->page_size > PAGE_SIZE) {
+		nor->bouncebuf_size = nor->params->page_size;
 		devm_kfree(nor->dev, nor->bouncebuf);
 		nor->bouncebuf = devm_kmalloc(nor->dev,
 					      nor->bouncebuf_size,
diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
index 1138bdbf4199..0658e47564ba 100644
--- a/drivers/mtd/spi-nor/xilinx.c
+++ b/drivers/mtd/spi-nor/xilinx.c
@@ -28,11 +28,12 @@ static const struct flash_info xilinx_parts[] = {
  */
 static u32 s3an_convert_addr(struct spi_nor *nor, u32 addr)
 {
+	u32 page_size = nor->params->page_size;
 	u32 offset, page;
 
-	offset = addr % nor->page_size;
-	page = addr / nor->page_size;
-	page <<= (nor->page_size > 512) ? 10 : 9;
+	offset = addr % page_size;
+	page = addr / page_size;
+	page <<= (page_size > 512) ? 10 : 9;
 
 	return page | offset;
 }
@@ -40,6 +41,7 @@ static u32 s3an_convert_addr(struct spi_nor *nor, u32 addr)
 static int xilinx_nor_setup(struct spi_nor *nor,
 			    const struct spi_nor_hwcaps *hwcaps)
 {
+	u32 page_size;
 	int ret;
 
 	ret = spi_nor_xread_sr(nor, nor->bouncebuf);
@@ -64,10 +66,11 @@ static int xilinx_nor_setup(struct spi_nor *nor,
 	 */
 	if (nor->bouncebuf[0] & XSR_PAGESIZE) {
 		/* Flash in Power of 2 mode */
-		nor->page_size = (nor->page_size == 264) ? 256 : 512;
-		nor->mtd.writebufsize = nor->page_size;
-		nor->mtd.size = 8 * nor->page_size * nor->info->n_sectors;
-		nor->mtd.erasesize = 8 * nor->page_size;
+		page_size = (nor->params->page_size == 264) ? 256 : 512;
+		nor->params->page_size = page_size;
+		nor->mtd.writebufsize = page_size;
+		nor->mtd.size = 8 * page_size * nor->info->n_sectors;
+		nor->mtd.erasesize = 8 * page_size;
 	} else {
 		/* Flash in Default addressing mode */
 		nor->params->convert_addr = s3an_convert_addr;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index f67457748ed8..fc90fce26e33 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -371,7 +371,6 @@ struct spi_nor_flash_parameter;
  * @bouncebuf_size:	size of the bounce buffer
  * @info:		SPI NOR part JEDEC MFR ID and other info
  * @manufacturer:	SPI NOR manufacturer
- * @page_size:		the page size of the SPI NOR
  * @addr_width:		number of address bytes
  * @erase_opcode:	the opcode for erasing a sector
  * @read_opcode:	the read opcode
@@ -401,7 +400,6 @@ struct spi_nor {
 	size_t			bouncebuf_size;
 	const struct flash_info	*info;
 	const struct spi_nor_manufacturer *manufacturer;
-	u32			page_size;
 	u8			addr_width;
 	u8			erase_opcode;
 	u8			read_opcode;
-- 
2.17.1

