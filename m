Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 453E341C3F9
	for <lists+openbmc@lfdr.de>; Wed, 29 Sep 2021 13:58:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKFHy1thDz2yp0
	for <lists+openbmc@lfdr.de>; Wed, 29 Sep 2021 21:58:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=e1JR3ccg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=e1JR3ccg; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKFCq6GpPz2yw0;
 Wed, 29 Sep 2021 21:54:31 +1000 (AEST)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id E8698C81;
 Wed, 29 Sep 2021 04:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1632916470;
 bh=Y009K+RO8RDHvkwOXnnVGdcXcV27deDObF+gK4oQAV0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e1JR3ccgRHn33ud6tMgC1CMeeRisKIlAAgrBRm7eb6hSGpyGrdolKwcy7HVnjgYQk
 PNAz2XS/8sH8jKzNjRq3hHsPjLgkukc3El2ZdjBfGCg1RbDxoUuzgZfUkDPi+piwd/
 RC1TN5yznTetYwWE5qOhl0+22V/KcVmBL31QXIEc=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 5/6] mtd: spi-nor: aspeed: Don't automatically attach reserved
 chips
Date: Wed, 29 Sep 2021 04:54:07 -0700
Message-Id: <20210929115409.21254-6-zev@bewilderbeest.net>
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

With this change, any flash chips under the controller that are marked
with a DT status of "reserved" will be created, but not automatically
attached.  Userspace can later request that they be attached using the
attach_chip sysfs file.

This is to accommodate situations where a chip may be (for example)
shared with another controller external to the SoC and require
userspace to arbitrate access to it prior to actually attaching it.
(such as a firmware SPI flash shared between a BMC and the host
system).

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/mtd/spi-nor/controllers/aspeed-smc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/controllers/aspeed-smc.c b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
index da49192a8220..328b008fafb2 100644
--- a/drivers/mtd/spi-nor/controllers/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
@@ -826,10 +826,14 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
 	unsigned int cs;
 	int ret = -ENODEV;
 
-	for_each_available_child_of_node(np, child) {
+	for_each_child_of_node(np, child) {
 		struct aspeed_smc_chip *chip;
 		struct spi_nor *nor;
 
+		/* Skip disabled nodes, but include reserved ones for later attachment */
+		if (!of_device_is_available(child) && !of_device_is_reserved(child))
+			continue;
+
 		/* This driver does not support NAND or NOR flash devices. */
 		if (!of_device_is_compatible(child, "jedec,spi-nor"))
 			continue;
@@ -873,6 +877,9 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
 
 		controller->chips[cs] = chip;
 
+		if (of_device_is_reserved(child))
+			continue;
+
 		ret = aspeed_smc_register_chip(chip);
 		if (ret)
 			break;
-- 
2.33.0

