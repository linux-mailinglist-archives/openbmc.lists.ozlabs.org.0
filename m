Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C964A52BA
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 23:59:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jnk5q4xG8z3bTt
	for <lists+openbmc@lfdr.de>; Tue,  1 Feb 2022 09:59:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=ByG/QgM9;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=fwVle7bF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=ByG/QgM9; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=fwVle7bF; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jnk5S0VcPz2ybK
 for <openbmc@lists.ozlabs.org>; Tue,  1 Feb 2022 09:59:07 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 16FEA3202056;
 Mon, 31 Jan 2022 17:59:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 31 Jan 2022 17:59:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; bh=QZydiwxkoHdggem/2L9cZuXRJY9q6DVG49v3cduCXZc=; b=ByG/Q
 gM9obnlgsx38AMiUQeP+rRYsjNp6lkif+mpSgCkJBM8eVAvECiUqb4Ab4F+F8/dO
 MvaRVrlFzS5shdive6EwhzHjt143WQpoewQPcSfEcIG6KQmYUYnIbsWRAJukza1d
 GipEm5hgwSTdZw/QcAz/YxOtujtx7gfkTuz2fyJt58uQDWEtRkP5+VTNiaTr3Dhb
 9/9GtB4GcAMxKs8lJOf2qm87Xjgzaz/1wT4Sg7C0nteJ7faD9sDN40Gx8asiGq0h
 vjFa+ElvxhQSzjL/HZxfIG+NnwcYx7it/QcgL33Ata2moGFCbNx/Gp3aFFEHx5Gt
 tPoaF4IxtkWE382WQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=QZydiwxkoHdggem/2L9cZuXRJY9q6
 DVG49v3cduCXZc=; b=fwVle7bFXfAuQqLaSy9zaIfbfWQP2GpFV0VpO3zhJJGpM
 u/16Tt0oKwg0J0F3oZWmoh4wtE0AfEjb8KZIbRh6kVZRR4yicaTSuB1irK1zbrox
 h3ow+Rli+CKgjHnEyxRzXTVF3NQi+uvbvb7mzi6cLyebWvU1Jss8vLneobTeogSU
 M+SFc/oWXLOMamxqn/KOxpScKDWXwtTYCvs3g7NhjaIRwePlB8AN4jIj9LOIbXTg
 aVCEeySa2hrOopQt7d//ipGvsSh7BNYNbPEc5zEygX6RYerKG6jNYuKZ3oaff6Wz
 aA8n66ayBx/yQs1JPOu3+1UyGnHvLhmSogcw1/y/g==
X-ME-Sender: <xms:uWn4Ye6KTvYf_hYlYkR7w0Db8-nXphRvJGju3giBuk_7axHwmIf63g>
 <xme:uWn4YX4XoS_l-mWaqn6RpW2jnXJppxxlrPESNtVktLywvTJ7yb7jOKdC96mEqfBd9
 p_srcSf-699eL3_DuU>
X-ME-Received: <xmr:uWn4YdeMOubmKtmDk9ZB7VkoLfakXRWXyDt6GcQ6YOKePyPmXl4jihgaZmo9YWULTf-j2qjNoZrxBj1M8OMN2xcqImGiP33su2YArg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgedvgddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculddvfedmnecujfgurhephffvuf
 ffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghm
 shcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpedvfe
 etvddtgfeutdegkeegtdeigfduudfgiedutdegkefftdduueeugfelgeffheenucffohhm
 rghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:uWn4YbKNji7ZLsU0FbrcyWhewsWBwlIMLIGlF4ZZzXgYi03IAFV82g>
 <xmx:uWn4YSIFXB4_IBKHgqzO4jB94pYxiNzITc903DXe13pA3WY6eTgLjA>
 <xmx:uWn4YcxXCVI8h-nkCmOg3eQtdl8xdks1haMz8D2ArXI-q8p8OdtKfA>
 <xmx:uWn4YczNZRdt0iuiiiDEwv-KQhHECSheEx_gHZe5ctKboncl_Bxfww>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Jan 2022 17:59:05 -0500 (EST)
From: Patrick Williams <patrick@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH dev-5.15] mtd: aspeed-smc: improve probe resilience
Date: Mon, 31 Jan 2022 16:59:04 -0600
Message-Id: <20220131225904.137769-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.34.1
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The aspeed-smc can have multiple SPI devices attached to it in the
device tree.  If one of the devices is missing or failing the entire
probe will fail and all MTD devices under the controller will be
removed.  On OpenBMC this results in a kernel panic due to missing
rootfs:

[    0.538774] aspeed-smc 1e620000.spi: Using 50 MHz SPI frequency
[    0.540471] aspeed-smc 1e620000.spi: w25q01jv-iq (131072 Kbytes)
[    0.540750] aspeed-smc 1e620000.spi: CE0 window [ 0x20000000 - 0x28000000 ] 128MB
[    0.540943] aspeed-smc 1e620000.spi: CE1 window [ 0x28000000 - 0x2c000000 ] 64MB
[    0.541143] aspeed-smc 1e620000.spi: read control register: 203b0041
[    0.581442] 5 fixed-partitions partitions found on MTD device bmc
[    0.581625] Creating 5 MTD partitions on "bmc":
[    0.581854] 0x000000000000-0x0000000e0000 : "u-boot"
[    0.584472] 0x0000000e0000-0x000000100000 : "u-boot-env"
[    0.586468] 0x000000100000-0x000000a00000 : "kernel"
[    0.588465] 0x000000a00000-0x000006000000 : "rofs"
[    0.590552] 0x000006000000-0x000008000000 : "rwfs"
[    0.592605] aspeed-smc 1e620000.spi: Using 50 MHz SPI frequency
[    0.592801] aspeed-smc 1e620000.spi: unrecognized JEDEC id bytes: 00 00 00 00 00 00
[    0.593039] Deleting MTD partitions on "bmc":
[    0.593175] Deleting u-boot MTD partition
[    0.637929] Deleting u-boot-env MTD partition
[    0.829527] Deleting kernel MTD partition
[    0.856902] Freeing initrd memory: 1032K
[    0.866428] Deleting rofs MTD partition
[    0.906264] Deleting rwfs MTD partition
[    0.986628] aspeed-smc 1e620000.spi: Aspeed SMC probe failed -2
[    0.986929] aspeed-smc: probe of 1e620000.spi failed with error -2
...
[    2.936719] /dev/mtdblock: Can't open blockdev
mount: mounting /dev/mtdblock on run/initramfs/ro failed: No such file or directory
[    2.963030] MTD: Couldn't look up '/dev/mtdblock': -2
mount: mounting /dev/mtdblock on run/initramfs/rw failed: No such file or directory

Mounting read-write /dev/mtdblock filesystem failed.  Please fix and run
	mount /dev/mtdblock run/initramfs/rw -t jffs2 -o rw
or perform a factory reset with the clean-rwfs-filesystem option.
Fatal error, triggering kernel panic!
[    3.013047] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000100

Many BMC designs have two flash chips so that they can handle a hardware
failure of one of them.  If one chip failed, it doesn't do any good to
have redundancy if they all get removed anyhow.

Improve the resilience of the probe function to handle one of the
children being missing or failed.  Only in the case where all children
fail to probe should the controller be failed out.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Link: https://lore.kernel.org/linux-mtd/20211229143334.297305-1-patrick@stwcx.xyz
---
 drivers/mtd/spi-nor/controllers/aspeed-smc.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/controllers/aspeed-smc.c b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
index c421fad4b3f5..416ea247f843 100644
--- a/drivers/mtd/spi-nor/controllers/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
@@ -1246,6 +1246,7 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
 	struct device_node *child;
 	unsigned int cs;
 	int ret = -ENODEV;
+	bool found_one = false;
 
 	for_each_available_child_of_node(np, child) {
 		struct aspeed_smc_chip *chip;
@@ -1311,8 +1312,17 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
 		 * by of property.
 		 */
 		ret = spi_nor_scan(nor, NULL, &hwcaps);
-		if (ret)
-			break;
+		/*
+		 * If we fail to scan the device it might not be present or
+		 * broken.  Don't fail the whole controller if others work.
+		 */
+		if (ret) {
+			if (found_one)
+				ret = 0;
+
+			devm_kfree(controller->dev, chip);
+			continue;
+		}
 
 		ret = aspeed_smc_chip_setup_finish(chip);
 		if (ret)
@@ -1323,6 +1333,7 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
 			break;
 
 		controller->chips[cs] = chip;
+		found_one = true;
 	}
 
 	if (ret) {
-- 
2.34.1

