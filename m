Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 40098BDF29
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 15:40:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dfLr0rlVzDqBl
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 23:40:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.36.150; helo=17.mo6.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 2924 seconds by postgrey-1.36 at bilbo;
 Wed, 25 Sep 2019 23:38:55 AEST
Received: from 17.mo6.mail-out.ovh.net (17.mo6.mail-out.ovh.net
 [46.105.36.150])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dfKW2ym4zDqj1
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 23:38:51 +1000 (AEST)
Received: from player698.ha.ovh.net (unknown [10.109.146.137])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 926F01DF439
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 14:43:47 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player698.ha.ovh.net (Postfix) with ESMTPSA id 318ABA33E070;
 Wed, 25 Sep 2019 12:43:42 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 10/13] mtd: spi-nor: aspeed: Introduce training
 operations per platform
Date: Wed, 25 Sep 2019 14:42:36 +0200
Message-Id: <20190925124239.27897-11-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925124239.27897-1-clg@kaod.org>
References: <20190925124239.27897-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6990431048097368834
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgdehiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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

The read timing compensation register is different on the AST2600 and
training will be slightly more complex.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index ea9b4a157677..768394068bd4 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -41,9 +41,13 @@ struct aspeed_smc_info {
 	u8 we0;			/* shift for write enable bit for CE0 */
 	u8 ctl0;		/* offset in regs of ctl for CE0 */
 	u8 timing;		/* offset in regs of timing */
+	u32 hdiv_max;           /* Max HCLK divisor on read timing reg */
 
 	void (*set_4b)(struct aspeed_smc_chip *chip);
 	int (*optimize_read)(struct aspeed_smc_chip *chip, u32 max_freq);
+	int (*calibrate)(struct aspeed_smc_chip *chip, u32 hdiv,
+			 const u8 *golden_buf, u8 *test_buf);
+
 	u32 (*segment_start)(struct aspeed_smc_controller *controller, u32 reg);
 	u32 (*segment_end)(struct aspeed_smc_controller *controller, u32 reg);
 	u32 (*segment_reg)(struct aspeed_smc_controller *controller,
@@ -54,6 +58,9 @@ static void aspeed_smc_chip_set_4b_spi_2400(struct aspeed_smc_chip *chip);
 static void aspeed_smc_chip_set_4b(struct aspeed_smc_chip *chip);
 static int aspeed_smc_optimize_read(struct aspeed_smc_chip *chip,
 				     u32 max_freq);
+static int aspeed_smc_calibrate_reads(struct aspeed_smc_chip *chip, u32 hdiv,
+			 const u8 *golden_buf, u8 *test_buf);
+
 static u32 aspeed_smc_segment_start(
 	struct aspeed_smc_controller *controller, u32 reg);
 static u32 aspeed_smc_segment_end(
@@ -68,8 +75,10 @@ static const struct aspeed_smc_info fmc_2400_info = {
 	.we0 = 16,
 	.ctl0 = 0x10,
 	.timing = 0x94,
+	.hdiv_max = 1,
 	.set_4b = aspeed_smc_chip_set_4b,
 	.optimize_read = aspeed_smc_optimize_read,
+	.calibrate = aspeed_smc_calibrate_reads,
 	.segment_start = aspeed_smc_segment_start,
 	.segment_end = aspeed_smc_segment_end,
 	.segment_reg = aspeed_smc_segment_reg,
@@ -82,8 +91,10 @@ static const struct aspeed_smc_info spi_2400_info = {
 	.we0 = 0,
 	.ctl0 = 0x04,
 	.timing = 0x14,
+	.hdiv_max = 1,
 	.set_4b = aspeed_smc_chip_set_4b_spi_2400,
 	.optimize_read = aspeed_smc_optimize_read,
+	.calibrate = aspeed_smc_calibrate_reads,
 	/* No segment registers */
 };
 
@@ -94,8 +105,10 @@ static const struct aspeed_smc_info fmc_2500_info = {
 	.we0 = 16,
 	.ctl0 = 0x10,
 	.timing = 0x94,
+	.hdiv_max = 1,
 	.set_4b = aspeed_smc_chip_set_4b,
 	.optimize_read = aspeed_smc_optimize_read,
+	.calibrate = aspeed_smc_calibrate_reads,
 	.segment_start = aspeed_smc_segment_start,
 	.segment_end = aspeed_smc_segment_end,
 	.segment_reg = aspeed_smc_segment_reg,
@@ -108,8 +121,10 @@ static const struct aspeed_smc_info spi_2500_info = {
 	.we0 = 16,
 	.ctl0 = 0x10,
 	.timing = 0x94,
+	.hdiv_max = 1,
 	.set_4b = aspeed_smc_chip_set_4b,
 	.optimize_read = aspeed_smc_optimize_read,
+	.calibrate = aspeed_smc_calibrate_reads,
 	.segment_start = aspeed_smc_segment_start,
 	.segment_end = aspeed_smc_segment_end,
 	.segment_reg = aspeed_smc_segment_reg,
@@ -984,7 +999,8 @@ static const uint32_t aspeed_smc_hclk_divs[] = {
 	0x6, /* HCLK/4 */
 	0xd, /* HCLK/5 */
 };
-#define ASPEED_SMC_HCLK_DIV(i) (aspeed_smc_hclk_divs[(i) - 1] << 8)
+#define ASPEED_SMC_HCLK_DIV(i) \
+	(aspeed_smc_hclk_divs[(i) - 1] << CONTROL_CLOCK_FREQ_SEL_SHIFT)
 
 static u32 aspeed_smc_default_read(struct aspeed_smc_chip *chip)
 {
@@ -1015,6 +1031,8 @@ static u32 aspeed_smc_default_read(struct aspeed_smc_chip *chip)
 static int aspeed_smc_optimize_read(struct aspeed_smc_chip *chip,
 				     u32 max_freq)
 {
+	struct aspeed_smc_controller *controller = chip->controller;
+	const struct aspeed_smc_info *info = controller->info;
 	u8 *golden_buf, *test_buf;
 	int i, rc, best_div = -1;
 	u32 save_read_val = chip->ctl_val[smc_read];
@@ -1047,7 +1065,7 @@ static int aspeed_smc_optimize_read(struct aspeed_smc_chip *chip,
 	}
 
 	/* Now we iterate the HCLK dividers until we find our breaking point */
-	for (i = ARRAY_SIZE(aspeed_smc_hclk_divs); i > 0; i--) {
+	for (i = ARRAY_SIZE(aspeed_smc_hclk_divs); i > info->hdiv_max - 1; i--) {
 		u32 tv, freq;
 
 		/* Compare timing to max */
@@ -1058,8 +1076,8 @@ static int aspeed_smc_optimize_read(struct aspeed_smc_chip *chip,
 		/* Set the timing */
 		tv = chip->ctl_val[smc_read] | ASPEED_SMC_HCLK_DIV(i);
 		writel(tv, chip->ctl);
-		dev_dbg(chip->nor.dev, "Trying HCLK/%d...", i);
-		rc = aspeed_smc_calibrate_reads(chip, i, golden_buf, test_buf);
+		dev_dbg(chip->nor.dev, "Trying HCLK/%d [%08x] ...", i, tv);
+		rc = info->calibrate(chip, i, golden_buf, test_buf);
 		if (rc == 0)
 			best_div = i;
 	}
-- 
2.21.0

