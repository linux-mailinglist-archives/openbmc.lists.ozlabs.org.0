Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB5D41C3F1
	for <lists+openbmc@lfdr.de>; Wed, 29 Sep 2021 13:56:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKFFV1ffJz305W
	for <lists+openbmc@lfdr.de>; Wed, 29 Sep 2021 21:55:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=TPHBvzSo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=TPHBvzSo; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKFCl3Zzwz2yPK;
 Wed, 29 Sep 2021 21:54:27 +1000 (AEST)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 5AD49C20;
 Wed, 29 Sep 2021 04:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1632916465;
 bh=gWhuqV+M1Tlbi05phPKIzczuXxjec79mm6Htp3ec2Fc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TPHBvzSoAHCSQnD3bL2UL4TNhvWQeplNlEAzdi66LW/EUSsZHaD8j+grZQ+lI2rPL
 eCkgGN+VYhA8AV5DkC4Shr4g/Hu70PSi+JCPV/MV1HNEtnkphvooWRgWmWSiRA5E23
 67EO2AZnjt3cdiI2zXmGhZBitG81BlaRm1fHmeno=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 3/6] mtd: spi-nor: aspeed: Refactor registration/unregistration
Date: Wed, 29 Sep 2021 04:54:05 -0700
Message-Id: <20210929115409.21254-4-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210929115409.21254-1-zev@bewilderbeest.net>
References: <20210929115409.21254-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Zev Weiss <zev@bewilderbeest.net>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Jeremy Kerr <jk@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org,
 Pratyush Yadav <p.yadav@ti.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

We now have separate functions for registering and unregistering
individual flash chips, instead of the entire controller.  This is a
preparatory step for allowing userspace to request that a specific
chip be attached or detached at runtime.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/mtd/spi-nor/controllers/aspeed-smc.c | 73 ++++++++++++--------
 1 file changed, 45 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/spi-nor/controllers/aspeed-smc.c b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
index 7225870e8b18..3c153104a905 100644
--- a/drivers/mtd/spi-nor/controllers/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
@@ -107,9 +107,10 @@ struct aspeed_smc_controller {
 	const struct aspeed_smc_info *info;	/* type info of controller */
 	void __iomem *regs;			/* controller registers */
 	void __iomem *ahb_base;			/* per-chip windows resource */
+	struct resource *ahb_res;		/* resource for AHB address space */
 	u32 ahb_window_size;			/* full mapping window size */
 
-	struct aspeed_smc_chip *chips[];	/* pointers to attached chips */
+	struct aspeed_smc_chip *chips[];	/* pointers to connected chips */
 };
 
 /*
@@ -399,15 +400,24 @@ static ssize_t aspeed_smc_write_user(struct spi_nor *nor, loff_t to,
 	return len;
 }
 
+static int aspeed_smc_unregister_chip(struct aspeed_smc_chip *chip)
+{
+	return mtd_device_unregister(&chip->nor.mtd);
+}
+
 static int aspeed_smc_unregister(struct aspeed_smc_controller *controller)
 {
 	struct aspeed_smc_chip *chip;
-	int n;
+	int n, ret;
 
 	for (n = 0; n < controller->info->nce; n++) {
 		chip = controller->chips[n];
-		if (chip)
-			mtd_device_unregister(&chip->nor.mtd);
+		if (chip) {
+			ret = aspeed_smc_unregister_chip(chip);
+			if (ret)
+				dev_warn(controller->dev, "failed to unregister CS%d: %d\n",
+				         n, ret);
+		}
 	}
 
 	return 0;
@@ -756,14 +766,39 @@ static const struct spi_nor_controller_ops aspeed_smc_controller_ops = {
 	.write = aspeed_smc_write_user,
 };
 
-static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
-				  struct device_node *np, struct resource *r)
+static int aspeed_smc_register_chip(struct aspeed_smc_chip *chip)
 {
-	const struct spi_nor_hwcaps hwcaps = {
+	static const struct spi_nor_hwcaps hwcaps = {
 		.mask = SNOR_HWCAPS_READ |
 			SNOR_HWCAPS_READ_FAST |
 			SNOR_HWCAPS_PP,
 	};
+	int ret;
+
+	ret = aspeed_smc_chip_setup_init(chip, chip->controller->ahb_res);
+	if (ret)
+		goto out;
+
+	/*
+	 * TODO: Add support for Dual and Quad SPI protocols attach when board
+	 * support is present as determined by of property.
+	 */
+	ret = spi_nor_scan(&chip->nor, NULL, &hwcaps);
+	if (ret)
+		goto out;
+
+	ret = aspeed_smc_chip_setup_finish(chip);
+	if (ret)
+		goto out;
+
+	ret = mtd_device_register(&chip->nor.mtd, NULL, 0);
+out:
+	return ret;
+}
+
+static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
+				  struct device_node *np, struct resource *r)
+{
 	const struct aspeed_smc_info *info = controller->info;
 	struct device *dev = controller->dev;
 	struct device_node *child;
@@ -773,7 +808,6 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
 	for_each_available_child_of_node(np, child) {
 		struct aspeed_smc_chip *chip;
 		struct spi_nor *nor;
-		struct mtd_info *mtd;
 
 		/* This driver does not support NAND or NOR flash devices. */
 		if (!of_device_is_compatible(child, "jedec,spi-nor"))
@@ -810,35 +844,17 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
 		chip->cs = cs;
 
 		nor = &chip->nor;
-		mtd = &nor->mtd;
 
 		nor->dev = dev;
 		nor->priv = chip;
 		spi_nor_set_flash_node(nor, child);
 		nor->controller_ops = &aspeed_smc_controller_ops;
 
-		ret = aspeed_smc_chip_setup_init(chip, r);
-		if (ret)
-			break;
-
-		/*
-		 * TODO: Add support for Dual and Quad SPI protocols
-		 * attach when board support is present as determined
-		 * by of property.
-		 */
-		ret = spi_nor_scan(nor, NULL, &hwcaps);
-		if (ret)
-			break;
-
-		ret = aspeed_smc_chip_setup_finish(chip);
-		if (ret)
-			break;
+		controller->chips[cs] = chip;
 
-		ret = mtd_device_register(mtd, NULL, 0);
+		ret = aspeed_smc_register_chip(chip);
 		if (ret)
 			break;
-
-		controller->chips[cs] = chip;
 	}
 
 	if (ret) {
@@ -881,6 +897,7 @@ static int aspeed_smc_probe(struct platform_device *pdev)
 		return PTR_ERR(controller->regs);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	controller->ahb_res = res;
 	controller->ahb_base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(controller->ahb_base))
 		return PTR_ERR(controller->ahb_base);
-- 
2.33.0

