Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F74BDED0
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 15:21:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ddwx0bGnzDqWM
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 23:21:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.34.195; helo=11.mo4.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 11.mo4.mail-out.ovh.net (11.mo4.mail-out.ovh.net
 [46.105.34.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ddvy5nRBzDqWc
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 23:20:13 +1000 (AEST)
Received: from player698.ha.ovh.net (unknown [10.108.42.75])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 0B85C208233
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 14:43:27 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player698.ha.ovh.net (Postfix) with ESMTPSA id EC1A4A33DF76;
 Wed, 25 Sep 2019 12:43:21 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 06/13] mtd: spi-nor: aspeed: Introduce a field
 for the AHB physical address
Date: Wed, 25 Sep 2019 14:42:32 +0200
Message-Id: <20190925124239.27897-7-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925124239.27897-1-clg@kaod.org>
References: <20190925124239.27897-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6984801549959727874
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

On the AST2600, we will use it to compute the address of the chip AHB
window from the Segment Register value. It also removes the need of
aspeed_smc_ahb_base_phy() helper.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 1cc89c965687..b3a128ada320 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -121,7 +121,8 @@ struct aspeed_smc_controller {
 	struct mutex mutex;			/* controller access mutex */
 	const struct aspeed_smc_info *info;	/* type info of controller */
 	void __iomem *regs;			/* controller registers */
-	void __iomem *ahb_base;			/* per-chip windows resource */
+	void __iomem *ahb_base;			/* per-chip window resource */
+	u32 ahb_base_phy;			/* phys addr of AHB window  */
 	u32 ahb_window_size;			/* full mapping window size */
 
 	unsigned long	clk_frequency;
@@ -533,21 +534,13 @@ static void __iomem *aspeed_smc_chip_base(struct aspeed_smc_chip *chip,
 	return controller->ahb_base + offset;
 }
 
-static u32 aspeed_smc_ahb_base_phy(struct aspeed_smc_controller *controller)
-{
-	u32 seg0_val = readl(SEGMENT_ADDR_REG(controller, 0));
-
-	return SEGMENT_ADDR_START(seg0_val);
-}
-
 static u32 chip_set_segment(struct aspeed_smc_chip *chip, u32 cs, u32 start,
 			    u32 size)
 {
 	struct aspeed_smc_controller *controller = chip->controller;
 	void __iomem *seg_reg;
-	u32 seg_oldval, seg_newval, ahb_base_phy, end;
-
-	ahb_base_phy = aspeed_smc_ahb_base_phy(controller);
+	u32 seg_oldval, seg_newval, end;
+	u32 ahb_base_phy = controller->ahb_base_phy;
 
 	seg_reg = SEGMENT_ADDR_REG(controller, cs);
 	seg_oldval = readl(seg_reg);
@@ -636,7 +629,7 @@ static u32 aspeed_smc_chip_set_segment(struct aspeed_smc_chip *chip)
 			 chip->cs, size >> 20);
 	}
 
-	ahb_base_phy = aspeed_smc_ahb_base_phy(controller);
+	ahb_base_phy = controller->ahb_base_phy;
 
 	/*
 	 * As a start address for the current segment, use the default
@@ -1154,6 +1147,7 @@ static int aspeed_smc_probe(struct platform_device *pdev)
 		return PTR_ERR(controller->regs);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	controller->ahb_base_phy = res->start;
 	controller->ahb_base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(controller->ahb_base))
 		return PTR_ERR(controller->ahb_base);
-- 
2.21.0

