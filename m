Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C153586D46
	for <lists+openbmc@lfdr.de>; Mon,  1 Aug 2022 16:51:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxLfh08P9z3c9B
	for <lists+openbmc@lfdr.de>; Tue,  2 Aug 2022 00:51:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxLcZ0qjLz2xG5
	for <openbmc@lists.ozlabs.org>; Tue,  2 Aug 2022 00:49:32 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 271EnM0d024220
	for <openbmc@lists.ozlabs.org>; Mon, 1 Aug 2022 17:49:22 +0300
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 1 Aug
 2022 17:49:22 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Mon, 1 Aug 2022
 22:49:20 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 1 Aug 2022 22:49:20 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id A0CDE63A24; Mon,  1 Aug 2022 17:49:18 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.15 v1 7/7] spi: npcm-fiu: Add NPCM8XX support
Date: Mon, 1 Aug 2022 17:49:14 +0300
Message-ID: <20220801144914.126075-8-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220801144914.126075-1-tmaimon77@gmail.com>
References: <20220801144914.126075-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: andrew@aj.id.au, joel@jms.id.au, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Adding FIU NPCM8XX support to NPCM FIU driver.
NPCM8XX FIU supports four controllers.

As part of adding NPCM8XX support:
- Add NPCM8XX specific compatible string.
- Using an internal burst configuration register instead of a GCR
  register.
- Support FIU1 controller.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/spi/spi-npcm-fiu.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-npcm-fiu.c b/drivers/spi/spi-npcm-fiu.c
index f17932e3e816..cd11b4632f2f 100644
--- a/drivers/spi/spi-npcm-fiu.c
+++ b/drivers/spi/spi-npcm-fiu.c
@@ -36,6 +36,7 @@
 #define NPCM_FIU_UMA_DR1		0x34
 #define NPCM_FIU_UMA_DR2		0x38
 #define NPCM_FIU_UMA_DR3		0x3C
+#define NPCM_FIU_CFG			0x78
 #define NPCM_FIU_MAX_REG_LIMIT		0x80
 
 /* FIU Direct Read Configuration Register */
@@ -151,6 +152,9 @@
 #define NPCM_FIU_UMA_DR3_RB13		GENMASK(15, 8)
 #define NPCM_FIU_UMA_DR3_RB12		GENMASK(7, 0)
 
+/* FIU Configuration Register */
+#define NPCM_FIU_CFG_FIU_FIX		BIT(31)
+
 /* FIU Read Mode */
 enum {
 	DRD_SINGLE_WIRE_MODE	= 0,
@@ -187,6 +191,7 @@ enum {
 	FIU0 = 0,
 	FIU3,
 	FIUX,
+	FIU1,
 };
 
 struct npcm_fiu_info {
@@ -201,7 +206,7 @@ struct fiu_data {
 	int fiu_max;
 };
 
-static const struct npcm_fiu_info npxm7xx_fiu_info[] = {
+static const struct npcm_fiu_info npcm7xx_fiu_info[] = {
 	{.name = "FIU0", .fiu_id = FIU0,
 		.max_map_size = MAP_SIZE_128MB, .max_cs = 2},
 	{.name = "FIU3", .fiu_id = FIU3,
@@ -209,11 +214,26 @@ static const struct npcm_fiu_info npxm7xx_fiu_info[] = {
 	{.name = "FIUX", .fiu_id = FIUX,
 		.max_map_size = MAP_SIZE_16MB, .max_cs = 2} };
 
-static const struct fiu_data npxm7xx_fiu_data = {
-	.npcm_fiu_data_info = npxm7xx_fiu_info,
+static const struct fiu_data npcm7xx_fiu_data = {
+	.npcm_fiu_data_info = npcm7xx_fiu_info,
 	.fiu_max = 3,
 };
 
+static const struct npcm_fiu_info npxm8xx_fiu_info[] = {
+	{.name = "FIU0", .fiu_id = FIU0,
+		.max_map_size = MAP_SIZE_128MB, .max_cs = 2},
+	{.name = "FIU3", .fiu_id = FIU3,
+		.max_map_size = MAP_SIZE_128MB, .max_cs = 4},
+	{.name = "FIUX", .fiu_id = FIUX,
+		.max_map_size = MAP_SIZE_16MB, .max_cs = 2},
+	{.name = "FIU1", .fiu_id = FIU1,
+		.max_map_size = MAP_SIZE_16MB, .max_cs = 4} };
+
+static const struct fiu_data npxm8xx_fiu_data = {
+	.npcm_fiu_data_info = npxm8xx_fiu_info,
+	.fiu_max = 4,
+};
+
 struct npcm_fiu_spi;
 
 struct npcm_fiu_chip {
@@ -624,6 +644,10 @@ static int npcm_fiu_dirmap_create(struct spi_mem_dirmap_desc *desc)
 		regmap_update_bits(gcr_regmap, NPCM7XX_INTCR3_OFFSET,
 				   NPCM7XX_INTCR3_FIU_FIX,
 				   NPCM7XX_INTCR3_FIU_FIX);
+	} else {
+		regmap_update_bits(fiu->regmap, NPCM_FIU_CFG,
+				   NPCM_FIU_CFG_FIU_FIX,
+				   NPCM_FIU_CFG_FIU_FIX);
 	}
 
 	if (desc->info.op_tmpl.data.dir == SPI_MEM_DATA_IN) {
@@ -663,7 +687,8 @@ static const struct spi_controller_mem_ops npcm_fiu_mem_ops = {
 };
 
 static const struct of_device_id npcm_fiu_dt_ids[] = {
-	{ .compatible = "nuvoton,npcm750-fiu", .data = &npxm7xx_fiu_data  },
+	{ .compatible = "nuvoton,npcm750-fiu", .data = &npcm7xx_fiu_data  },
+	{ .compatible = "nuvoton,npcm845-fiu", .data = &npxm8xx_fiu_data  },
 	{ /* sentinel */ }
 };
 
-- 
2.33.0

