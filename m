Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1B4BDE39
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 14:44:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dd6x0nXCzDqkg
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 22:44:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.47.167; helo=11.mo5.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 11.mo5.mail-out.ovh.net (11.mo5.mail-out.ovh.net
 [46.105.47.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dd655shfzDqjJ
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 22:43:56 +1000 (AEST)
Received: from player698.ha.ovh.net (unknown [10.108.42.170])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 140E924B6C6
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 14:43:51 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player698.ha.ovh.net (Postfix) with ESMTPSA id 7092EA33E0B1;
 Wed, 25 Sep 2019 12:43:47 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 11/13] mtd: spi-nor: aspeed: Introduce a HCLK
 mask for training
Date: Wed, 25 Sep 2019 14:42:37 +0200
Message-Id: <20190925124239.27897-12-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925124239.27897-1-clg@kaod.org>
References: <20190925124239.27897-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6991556950043298562
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

The AST2600 handles more HCLK divisors than its predecessors.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 768394068bd4..c6a80fdf51ef 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -41,6 +41,7 @@ struct aspeed_smc_info {
 	u8 we0;			/* shift for write enable bit for CE0 */
 	u8 ctl0;		/* offset in regs of ctl for CE0 */
 	u8 timing;		/* offset in regs of timing */
+	u32 hclk_mask;          /* clock frequency mask in CEx Control reg */
 	u32 hdiv_max;           /* Max HCLK divisor on read timing reg */
 
 	void (*set_4b)(struct aspeed_smc_chip *chip);
@@ -75,6 +76,7 @@ static const struct aspeed_smc_info fmc_2400_info = {
 	.we0 = 16,
 	.ctl0 = 0x10,
 	.timing = 0x94,
+	.hclk_mask = 0xfffff0ff,
 	.hdiv_max = 1,
 	.set_4b = aspeed_smc_chip_set_4b,
 	.optimize_read = aspeed_smc_optimize_read,
@@ -91,6 +93,7 @@ static const struct aspeed_smc_info spi_2400_info = {
 	.we0 = 0,
 	.ctl0 = 0x04,
 	.timing = 0x14,
+	.hclk_mask = 0xfffff0ff,
 	.hdiv_max = 1,
 	.set_4b = aspeed_smc_chip_set_4b_spi_2400,
 	.optimize_read = aspeed_smc_optimize_read,
@@ -105,6 +108,7 @@ static const struct aspeed_smc_info fmc_2500_info = {
 	.we0 = 16,
 	.ctl0 = 0x10,
 	.timing = 0x94,
+	.hclk_mask = 0xfffff0ff,
 	.hdiv_max = 1,
 	.set_4b = aspeed_smc_chip_set_4b,
 	.optimize_read = aspeed_smc_optimize_read,
@@ -121,6 +125,7 @@ static const struct aspeed_smc_info spi_2500_info = {
 	.we0 = 16,
 	.ctl0 = 0x10,
 	.timing = 0x94,
+	.hclk_mask = 0xfffff0ff,
 	.hdiv_max = 1,
 	.set_4b = aspeed_smc_chip_set_4b,
 	.optimize_read = aspeed_smc_optimize_read,
@@ -1053,7 +1058,7 @@ static int aspeed_smc_optimize_read(struct aspeed_smc_chip *chip,
 	memcpy_fromio(golden_buf, chip->ahb_base, CALIBRATE_BUF_SIZE);
 
 	/* Establish our read mode with freq field set to 0 (HCLK/16) */
-	chip->ctl_val[smc_read] = save_read_val & 0xfffff0ff;
+	chip->ctl_val[smc_read] = save_read_val & info->hclk_mask;
 
 	/* Check if calibration data is suitable */
 	if (!aspeed_smc_check_calib_data(golden_buf, CALIBRATE_BUF_SIZE)) {
-- 
2.21.0

