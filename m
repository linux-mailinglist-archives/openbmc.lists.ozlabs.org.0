Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF470BDE52
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 14:52:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ddJB2fS2zDqjh
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 22:52:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.34.219; helo=4.mo173.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 382 seconds by postgrey-1.36 at bilbo;
 Wed, 25 Sep 2019 22:49:49 AEST
Received: from 4.mo173.mail-out.ovh.net (4.mo173.mail-out.ovh.net
 [46.105.34.219])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ddDs3XnBzDqkL
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 22:49:48 +1000 (AEST)
Received: from player698.ha.ovh.net (unknown [10.109.146.173])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id B1D4911AC0A
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 14:43:37 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player698.ha.ovh.net (Postfix) with ESMTPSA id 77F57A33E01A;
 Wed, 25 Sep 2019 12:43:32 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 08/13] mtd: spi-nor: aspeed: add initial support
 for ast2600
Date: Wed, 25 Sep 2019 14:42:34 +0200
Message-Id: <20190925124239.27897-9-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925124239.27897-1-clg@kaod.org>
References: <20190925124239.27897-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6987616297107229442
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

The Segment Registers of the AST2600 have a different encoding. A 1MB
unit is used and the address range of a flash SPI slave is encoded
with offsets in the overall controller window. The previous SoC
AST2400 and AST2500 used absolute addresses. Only bits [27:20] are
relevant and the end address is an upper bound limit.

SPI training yet to come.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 73 ++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 4e768092a965..6c5ecea21882 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -115,6 +115,39 @@ static const struct aspeed_smc_info spi_2500_info = {
 	.segment_reg = aspeed_smc_segment_reg,
 };
 
+static u32 aspeed_smc_segment_start_ast2600(
+	struct aspeed_smc_controller *controller, u32 reg);
+static u32 aspeed_smc_segment_end_ast2600(
+	struct aspeed_smc_controller *controller, u32 reg);
+static u32 aspeed_smc_segment_reg_ast2600(
+	struct aspeed_smc_controller *controller, u32 start, u32 end);
+
+static const struct aspeed_smc_info fmc_2600_info = {
+	.maxsize = 256 * 1024 * 1024,
+	.nce = 3,
+	.hastype = false, /* SPI Only */
+	.we0 = 16,
+	.ctl0 = 0x10,
+	.timing = 0x94,
+	.set_4b = aspeed_smc_chip_set_4b,
+	.segment_start = aspeed_smc_segment_start_ast2600,
+	.segment_end = aspeed_smc_segment_end_ast2600,
+	.segment_reg = aspeed_smc_segment_reg_ast2600,
+};
+
+static const struct aspeed_smc_info spi_2600_info = {
+	.maxsize = 256 * 1024 * 1024,
+	.nce = 2,
+	.hastype = false,
+	.we0 = 16,
+	.ctl0 = 0x10,
+	.timing = 0x94,
+	.set_4b = aspeed_smc_chip_set_4b,
+	.segment_start = aspeed_smc_segment_start_ast2600,
+	.segment_end = aspeed_smc_segment_end_ast2600,
+	.segment_reg = aspeed_smc_segment_reg_ast2600,
+};
+
 enum aspeed_smc_ctl_reg_value {
 	smc_base,		/* base value without mode for other commands */
 	smc_read,		/* command reg for (maybe fast) reads */
@@ -249,6 +282,44 @@ static u32 aspeed_smc_segment_reg(
 {
 	return (((start >> 23) & 0xFF) << 16) | (((end >> 23) & 0xFF) << 24);
 }
+
+/*
+ * The Segment Registers of the AST2600 have a 1MB unit. The address
+ * range of a flash SPI slave is encoded with offsets in the overall
+ * controller window. The previous SoC AST2400 and AST2500 used
+ * absolute addresses. Only bits [27:20] are relevant and the end
+ * address is an upper bound limit.
+ */
+
+#define AST2600_SEG_ADDR_MASK 0x0ff00000
+
+static u32 aspeed_smc_segment_start_ast2600(
+	struct aspeed_smc_controller *controller, u32 reg)
+{
+	uint32_t start_offset = (reg << 16) & AST2600_SEG_ADDR_MASK;
+
+	return controller->ahb_base_phy + start_offset;
+}
+
+static u32 aspeed_smc_segment_end_ast2600(
+	struct aspeed_smc_controller *controller, u32 reg)
+{
+	uint32_t end_offset = reg & AST2600_SEG_ADDR_MASK;
+
+	/* segment is disabled */
+	if (!end_offset)
+		return controller->ahb_base_phy;
+
+	return controller->ahb_base_phy + end_offset + 0x100000;
+}
+
+static u32 aspeed_smc_segment_reg_ast2600(
+	struct aspeed_smc_controller *controller, u32 start, u32 end)
+{
+    return ((start & AST2600_SEG_ADDR_MASK) >> 16) |
+	    ((end - 1) & AST2600_SEG_ADDR_MASK);
+}
+
 /*
  * Switch to turn off read optimisation if needed
  */
@@ -536,6 +607,8 @@ static const struct of_device_id aspeed_smc_matches[] = {
 	{ .compatible = "aspeed,ast2400-spi", .data = &spi_2400_info },
 	{ .compatible = "aspeed,ast2500-fmc", .data = &fmc_2500_info },
 	{ .compatible = "aspeed,ast2500-spi", .data = &spi_2500_info },
+	{ .compatible = "aspeed,ast2600-fmc", .data = &fmc_2600_info },
+	{ .compatible = "aspeed,ast2600-spi", .data = &spi_2600_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, aspeed_smc_matches);
-- 
2.21.0

