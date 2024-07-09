Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 417D692C380
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2024 20:49:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJVQ23FN5z3cLL
	for <lists+openbmc@lfdr.de>; Wed, 10 Jul 2024 04:48:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJVPd2wTzz3cLL
	for <openbmc@lists.ozlabs.org>; Wed, 10 Jul 2024 04:48:33 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 469ImIju001790
	for <openbmc@lists.ozlabs.org>; Tue, 9 Jul 2024 21:48:19 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 9 Jul
 2024 21:48:18 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 10 Jul
 2024 02:48:15 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 10 Jul 2024 02:48:15 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id B33745F5B9;
	Tue,  9 Jul 2024 21:48:14 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 9F649DC1EB3; Tue,  9 Jul 2024 21:48:14 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [linux dev-6.6 v1] spi: npcm-fiu: add dual and quad write support
Date: Tue, 9 Jul 2024 21:48:13 +0300
Message-ID: <20240709184813.1946724-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
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
Cc: Stanley Chu <yschu@nuvoton.com>, Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add dual and quad write support by writing the command write in the UMA
register first and then write the data in chunks of 16 bytes.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/spi/spi-npcm-fiu.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-npcm-fiu.c b/drivers/spi/spi-npcm-fiu.c
index e42248519688..a999614340d6 100644
--- a/drivers/spi/spi-npcm-fiu.c
+++ b/drivers/spi/spi-npcm-fiu.c
@@ -392,7 +392,7 @@ static int npcm_fiu_uma_write(struct spi_mem *mem,
 {
 	struct npcm_fiu_spi *fiu =
 		spi_controller_get_devdata(mem->spi->controller);
-	u32 uma_cfg = BIT(10);
+	u32 uma_cfg = cmd ? BIT(10) : 0;
 	u32 data_reg[4] = {0};
 	u32 val;
 	u32 i;
@@ -402,8 +402,11 @@ static int npcm_fiu_uma_write(struct spi_mem *mem,
 			   (spi_get_chipselect(mem->spi, 0) <<
 			    NPCM_FIU_UMA_CTS_DEV_NUM_SHIFT));
 
-	regmap_update_bits(fiu->regmap, NPCM_FIU_UMA_CMD,
-			   NPCM_FIU_UMA_CMD_CMD, cmd);
+	if (cmd)
+		regmap_update_bits(fiu->regmap, NPCM_FIU_UMA_CMD,
+				   NPCM_FIU_UMA_CMD_CMD, cmd);
+	else
+		uma_cfg |= ilog2(op->data.buswidth) << NPCM_FIU_UMA_CFG_WDBPCK_SHIFT;
 
 	if (data_size) {
 		memcpy(data_reg, data, data_size);
@@ -463,8 +466,7 @@ static int npcm_fiu_manualwrite(struct spi_mem *mem,
 
 	/* Starting the data writing loop in multiples of 8 */
 	for (idx = 0; idx < num_data_chunks; ++idx) {
-		ret = npcm_fiu_uma_write(mem, op, data[0], false,
-					 &data[1], CHUNK_SIZE - 1);
+		ret = npcm_fiu_uma_write(mem, op, 0, false, &data[0], CHUNK_SIZE);
 		if (ret)
 			return ret;
 
@@ -473,8 +475,7 @@ static int npcm_fiu_manualwrite(struct spi_mem *mem,
 
 	/* Handling chunk remains */
 	if (remain_data > 0) {
-		ret = npcm_fiu_uma_write(mem, op, data[0], false,
-					 &data[1], remain_data - 1);
+		ret = npcm_fiu_uma_write(mem, op, 0, false, &data[0], remain_data);
 		if (ret)
 			return ret;
 	}
-- 
2.34.1

