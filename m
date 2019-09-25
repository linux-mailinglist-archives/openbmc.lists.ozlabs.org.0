Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 660D7BDEBE
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 15:16:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ddqM1M5RzDqQ3
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 23:16:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=188.165.43.173; helo=6.mo3.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 895 seconds by postgrey-1.36 at bilbo;
 Wed, 25 Sep 2019 22:59:05 AEST
Received: from 6.mo3.mail-out.ovh.net (6.mo3.mail-out.ovh.net [188.165.43.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ddRY3rhfzDqn4
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 22:59:04 +1000 (AEST)
Received: from player698.ha.ovh.net (unknown [10.108.57.95])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id AFC5422204E
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 14:44:01 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player698.ha.ovh.net (Postfix) with ESMTPSA id 4E827A33E12C;
 Wed, 25 Sep 2019 12:43:56 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 13/13] mtd: spi-nor: aspeed: add support for
 AST2600 training
Date: Wed, 25 Sep 2019 14:42:39 +0200
Message-Id: <20190925124239.27897-14-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925124239.27897-1-clg@kaod.org>
References: <20190925124239.27897-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6994371699591121666
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

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 68 ++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 48164d819a37..e9bc89755912 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -142,6 +142,9 @@ static u32 aspeed_smc_segment_end_ast2600(
 static u32 aspeed_smc_segment_reg_ast2600(
 	struct aspeed_smc_controller *controller, u32 start, u32 end);
 
+static int aspeed_smc_calibrate_reads_ast2600(struct aspeed_smc_chip *chip,
+	      u32 hdiv, const u8 *golden_buf, u8 *test_buf);
+
 static const struct aspeed_smc_info fmc_2600_info = {
 	.maxsize = 256 * 1024 * 1024,
 	.nce = 3,
@@ -149,7 +152,11 @@ static const struct aspeed_smc_info fmc_2600_info = {
 	.we0 = 16,
 	.ctl0 = 0x10,
 	.timing = 0x94,
+	.hclk_mask = 0xf0fff0ff,
+	.hdiv_max = 2,
 	.set_4b = aspeed_smc_chip_set_4b,
+	.optimize_read = aspeed_smc_optimize_read,
+	.calibrate = aspeed_smc_calibrate_reads_ast2600,
 	.segment_start = aspeed_smc_segment_start_ast2600,
 	.segment_end = aspeed_smc_segment_end_ast2600,
 	.segment_reg = aspeed_smc_segment_reg_ast2600,
@@ -162,7 +169,11 @@ static const struct aspeed_smc_info spi_2600_info = {
 	.we0 = 16,
 	.ctl0 = 0x10,
 	.timing = 0x94,
+	.hclk_mask = 0xf0fff0ff,
+	.hdiv_max = 2,
 	.set_4b = aspeed_smc_chip_set_4b,
+	.optimize_read = aspeed_smc_optimize_read,
+	.calibrate = aspeed_smc_calibrate_reads_ast2600,
 	.segment_start = aspeed_smc_segment_start_ast2600,
 	.segment_end = aspeed_smc_segment_end_ast2600,
 	.segment_reg = aspeed_smc_segment_reg_ast2600,
@@ -1101,6 +1112,63 @@ static int aspeed_smc_optimize_read(struct aspeed_smc_chip *chip,
 	return 0;
 }
 
+#define TIMING_DELAY_DI         BIT(3)
+#define TIMING_DELAY_HCYCLE_MAX     5
+
+static int aspeed_smc_calibrate_reads_ast2600(struct aspeed_smc_chip *chip, u32 hdiv,
+					      const u8 *golden_buf, u8 *test_buf)
+{
+	struct aspeed_smc_controller *controller = chip->controller;
+	const struct aspeed_smc_info *info = controller->info;
+	int hcycle;
+	u32 shift = (hdiv - 2) << 3;
+	u32 mask = ~(0xfu << shift);
+	u32 fread_timing_val = 0;
+
+	for (hcycle = 0; hcycle <= TIMING_DELAY_HCYCLE_MAX; hcycle++) {
+		int delay_ns;
+		bool pass = false;
+
+		fread_timing_val &= mask;
+		fread_timing_val |= hcycle << shift;
+
+		/* no DI input delay first  */
+		writel(fread_timing_val, controller->regs + info->timing);
+		pass = aspeed_smc_check_reads(chip, golden_buf, test_buf);
+		dev_dbg(chip->nor.dev,
+			"  * [%08x] %d HCLK delay, DI delay none : %s",
+			fread_timing_val, hcycle, pass ? "PASS" : "FAIL");
+		if (pass)
+			return 0;
+
+		/* Add DI input delays  */
+		fread_timing_val &= mask;
+		fread_timing_val |= (TIMING_DELAY_DI | hcycle) << shift;
+
+		for (delay_ns = 0; delay_ns < 0x10; delay_ns++) {
+			fread_timing_val &= ~(0xf << (4 + shift));
+			fread_timing_val |= delay_ns << (4 + shift);
+
+			writel(fread_timing_val, controller->regs + info->timing);
+			pass = aspeed_smc_check_reads(chip, golden_buf, test_buf);
+			dev_dbg(chip->nor.dev,
+				"  * [%08x] %d HCLK delay, DI delay %d.%dns : %s",
+				fread_timing_val, hcycle, (delay_ns + 1)/2,
+				(delay_ns + 1) & 1 ? 5 : 5, pass ? "PASS" : "FAIL");
+			/*
+			 * TODO: This is optimistic. We should look
+			 * for a working interval and save the middle
+			 * value in the read timing register.
+			 */
+			if (pass)
+				return 0;
+		}
+	}
+
+	/* No good setting for this frequency */
+	return -1;
+}
+
 static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
 {
 	struct aspeed_smc_controller *controller = chip->controller;
-- 
2.21.0

