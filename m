Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EDBC1EBA
	for <lists+openbmc@lfdr.de>; Mon, 30 Sep 2019 12:14:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hdYS2qYfzDqMV
	for <lists+openbmc@lfdr.de>; Mon, 30 Sep 2019 20:14:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.44.197; helo=3.mo178.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 470 seconds by postgrey-1.36 at bilbo;
 Mon, 30 Sep 2019 20:14:07 AEST
Received: from 3.mo178.mail-out.ovh.net (3.mo178.mail-out.ovh.net
 [46.105.44.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hdXv1Kw8zDqDV
 for <openbmc@lists.ozlabs.org>; Mon, 30 Sep 2019 20:14:06 +1000 (AEST)
Received: from player779.ha.ovh.net (unknown [10.108.35.232])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 3655075D52
 for <openbmc@lists.ozlabs.org>; Mon, 30 Sep 2019 12:06:12 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player779.ha.ovh.net (Postfix) with ESMTPSA id 22341A45D6E9;
 Mon, 30 Sep 2019 10:06:07 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 1/3] mtd: spi-nor: aspeed: fix training of multiple CS on the
 AST2600
Date: Mon, 30 Sep 2019 12:05:54 +0200
Message-Id: <20190930100556.26489-2-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190930100556.26489-1-clg@kaod.org>
References: <20190930100556.26489-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15245810638804781826
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrgedvgddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Each CE has its own read timing compensation register.

Fixes: c62871befcdb ("mtd: spi-nor: aspeed: add support for AST2600 training")
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index e9bc89755912..ad9e04fdb8ad 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -1114,12 +1114,13 @@ static int aspeed_smc_optimize_read(struct aspeed_smc_chip *chip,
 
 #define TIMING_DELAY_DI         BIT(3)
 #define TIMING_DELAY_HCYCLE_MAX     5
+#define TIMING_REG_AST2600(chip)					\
+	((chip)->controller->regs + (chip)->controller->info->timing +	\
+	 (chip)->cs * 4)
 
 static int aspeed_smc_calibrate_reads_ast2600(struct aspeed_smc_chip *chip, u32 hdiv,
 					      const u8 *golden_buf, u8 *test_buf)
 {
-	struct aspeed_smc_controller *controller = chip->controller;
-	const struct aspeed_smc_info *info = controller->info;
 	int hcycle;
 	u32 shift = (hdiv - 2) << 3;
 	u32 mask = ~(0xfu << shift);
@@ -1133,7 +1134,7 @@ static int aspeed_smc_calibrate_reads_ast2600(struct aspeed_smc_chip *chip, u32
 		fread_timing_val |= hcycle << shift;
 
 		/* no DI input delay first  */
-		writel(fread_timing_val, controller->regs + info->timing);
+		writel(fread_timing_val, TIMING_REG_AST2600(chip));
 		pass = aspeed_smc_check_reads(chip, golden_buf, test_buf);
 		dev_dbg(chip->nor.dev,
 			"  * [%08x] %d HCLK delay, DI delay none : %s",
@@ -1149,7 +1150,7 @@ static int aspeed_smc_calibrate_reads_ast2600(struct aspeed_smc_chip *chip, u32
 			fread_timing_val &= ~(0xf << (4 + shift));
 			fread_timing_val |= delay_ns << (4 + shift);
 
-			writel(fread_timing_val, controller->regs + info->timing);
+			writel(fread_timing_val, TIMING_REG_AST2600(chip));
 			pass = aspeed_smc_check_reads(chip, golden_buf, test_buf);
 			dev_dbg(chip->nor.dev,
 				"  * [%08x] %d HCLK delay, DI delay %d.%dns : %s",
-- 
2.21.0

