Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01900577D44
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 10:13:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmZV56b3Tz3c9L
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 18:13:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmZTH5Z2Pz2xmw
	for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 18:12:48 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 26I8ChvB015562
	for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 11:12:43 +0300
Received: from NTHCCAS03.nuvoton.com (10.1.20.28) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 18 Jul
 2022 11:12:43 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS03.nuvoton.com
 (10.1.20.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Mon, 18 Jul
 2022 16:12:41 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Mon, 18 Jul 2022 16:12:41 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 58E7563A20; Mon, 18 Jul 2022 11:12:40 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <avifishman70@gmail.com>, <tali.perry1@gmail.com>, <joel@jms.id.au>,
        <venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
        <broonie@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v1 3/3] spi: npcm-fiu: Add NPCM8XX support
Date: Mon, 18 Jul 2022 11:11:46 +0300
Message-ID: <20220718081146.256070-4-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220718081146.256070-1-tmaimon77@gmail.com>
References: <20220718081146.256070-1-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
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
 drivers/spi/spi-npcm-fiu.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/spi/spi-npcm-fiu.c b/drivers/spi/spi-npcm-fiu.c
index d5b4fe7b9b62..49f6424e35af 100644
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
@@ -214,6 +219,21 @@ static const struct fiu_data npcm7xx_fiu_data = {
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
@@ -664,6 +688,7 @@ static const struct spi_controller_mem_ops npcm_fiu_mem_ops = {
 
 static const struct of_device_id npcm_fiu_dt_ids[] = {
 	{ .compatible = "nuvoton,npcm750-fiu", .data = &npcm7xx_fiu_data  },
+	{ .compatible = "nuvoton,npcm845-fiu", .data = &npxm8xx_fiu_data  },
 	{ /* sentinel */ }
 };
 
-- 
2.33.0

