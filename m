Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D19E58D005
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 00:10:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1r3X4F7dz2xGk
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 08:10:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm2 header.b=hXHzswZh;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=NjleArE2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pjd.dev (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com; envelope-from=peter@pjd.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm2 header.b=hXHzswZh;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=NjleArE2;
	dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1r2K3PbJz2xGk
	for <openbmc@lists.ozlabs.org>; Tue,  9 Aug 2022 08:08:55 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailnew.nyi.internal (Postfix) with ESMTP id 8A0585815F3;
	Mon,  8 Aug 2022 18:08:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 08 Aug 2022 18:08:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
	:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1659996532; x=
	1660000132; bh=EpLPn7T857RRZQMkmbajXU/vKyJG2sXII7PkgKssnfc=; b=h
	XHzswZhuP5jPzy+L/Ls2ykSfu2UItIrdmYCYxEW3LxYmAjc1nRGk21NNU/RYicMH
	fUfTkT4VjiLWtstdO1FaR/n93XRNXxYn1YiCei8+06SZGV8uIlA6RxUuYVl7LDuv
	AIdIFyIILmfUQcCBuz8bvSvoVNDTBP+FUnPFz/wZGWNtN8waqufY31dx7cdTB0mD
	IY5c8UdM7wugR7YKwNwBKb/NQsBVaVSCgBArx+xGhiDFlYLM3ssBfxA0GGckLmKm
	pkSOtht9UD8HZkpT/Pr8PENNKVwuXq/FtHRnlnCv2TcXtkB7fWD4fXBdVJsR72I5
	bYkKXvU0sVy60clO9MMeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1659996532; x=
	1660000132; bh=EpLPn7T857RRZQMkmbajXU/vKyJG2sXII7PkgKssnfc=; b=N
	jleArE2DgtnGJJHN3gxHyz/p7s19x0MSwLwpdzbVjtURjY7vjrPW1wNF/CGur/7K
	Rtt003kVi/DO/uHu8JYB3mfvcO5AigLveEIs7CrKI7Kf03nTvBiYrm6Vnfk5nZw9
	EzK+ke3SC/eUCWrXP6BDur6Ch3LAWHI1ncmY6LJC5O6S/WZgNus0KQt8rBwMi9Po
	1eSFdf3nqsPGKCTAu27Q0HYGaWqDMYGjCBmA/m+ViEXJBtIwktVvrnZgIV26XNw6
	XXGuzFSKrD7TZaBuT+99yAqhk0PgbRTXf37aJ1J2atOABxBShMkRqX/abC6kD7JI
	xjmsS74arXJ1PsSrJPjoQ==
X-ME-Sender: <xms:dInxYvArF7OHLcQu6BKm4fRlgaGBSNUWlB1XcfJvXTYwTtNQFTWTYQ>
    <xme:dInxYlhxjfvOIcazgr9rnG683gHd7xsPPis4URMyftAuELbn0711dZisDiVnRowDz
    vtKdbI6bFTw5-dCN8A>
X-ME-Received: <xmr:dInxYqmqjvNlg2HnyqCsbFn8tZpJq5rU5S71S35ArnKCelfs-OeoxVEo5HnzkQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefledgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
    dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgjfhggtgfgseht
    keertdertdejnecuhfhrohhmpefrvghtvghrucffvghlvghvohhrhigrshcuoehpvghtvg
    hrsehpjhgurdguvghvqeenucggtffrrghtthgvrhhnpeektdethfdvheegtdegteeuueeu
    geehtdehveeukeekjeetueetieeludetveelffenucffohhmrghinhepkhgvrhhnvghlrd
    horhhgpdhtrhhushhtvggutghomhhpuhhtihhnghhgrhhouhhprdhorhhgnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjug
    druggvvh
X-ME-Proxy: <xmx:dInxYhzswQfWpwwgw9uoJQrKhbLdaIBwxssJn9HnxREvtkHKOFOA1A>
    <xmx:dInxYkR0xrUM0Swv0GIbEWFB1fk4l-7KgmgUnv7-N8buHi5EZyA9lg>
    <xmx:dInxYkY1i1kJZWFz-2yVYmuQylvS9j5VSz8piwkZF2woAwKLKSjPqw>
    <xmx:dInxYqe9zhMnr4UEpoRc3MIp6E1N_pFP4xSqpy66SOd2AW5gPf4jTg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Aug 2022 18:08:51 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Subject: [PATCH 1/7] Revert "tpm: tpm_tis: Add tpm_tis_i2c driver"
Date: Mon,  8 Aug 2022 15:08:33 -0700
Message-Id: <20220808220839.1006341-2-peter@pjd.dev>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808220839.1006341-1-peter@pjd.dev>
References: <20220808220839.1006341-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Alexander.Steffen@infineon.com, peter@pjd.dev, joel@jms.id.au, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This reverts commit 1caa2f764dc9d49d5a85eef9585fc6d2717c28bb.

Nuvoton is not planning on maintaining this driver, and Infineon has
submitted a new version, so we'll remove this one and add Infineon's.

See this mail thread for more details:

https://lore.kernel.org/openbmc/20220725225151.393384-1-peter@pjd.dev/

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 drivers/char/tpm/Kconfig       |  12 --
 drivers/char/tpm/Makefile      |   1 -
 drivers/char/tpm/tpm_tis_i2c.c | 263 ---------------------------------
 3 files changed, 276 deletions(-)
 delete mode 100644 drivers/char/tpm/tpm_tis_i2c.c

diff --git a/drivers/char/tpm/Kconfig b/drivers/char/tpm/Kconfig
index f07ae63298ec..d6ba644f6b00 100644
--- a/drivers/char/tpm/Kconfig
+++ b/drivers/char/tpm/Kconfig
@@ -86,18 +86,6 @@ config TCG_TIS_SYNQUACER
 	  To compile this driver as a module, choose  M here;
 	  the module will be called tpm_tis_synquacer.
 
-config TCG_TIS_I2C
-	tristate "TPM I2C Interface Specification"
-	depends on I2C
-	select CRC_CCITT
-	select TCG_TIS_CORE
-	help
-	  If you have a TPM security chip, compliant with the TCG TPM PTP
-	  (I2C interface) specification and connected to an I2C bus master,
-	  say Yes and it will be accessible from within Linux.
-	  To compile this driver as a module, choose M here;
-	  the module will be called tpm_tis_i2c.
-
 config TCG_TIS_I2C_CR50
 	tristate "TPM Interface Specification 2.0 Interface (I2C - CR50)"
 	depends on I2C
diff --git a/drivers/char/tpm/Makefile b/drivers/char/tpm/Makefile
index 0222b1ddb310..66d39ea6bd10 100644
--- a/drivers/char/tpm/Makefile
+++ b/drivers/char/tpm/Makefile
@@ -29,7 +29,6 @@ tpm_tis_spi-$(CONFIG_TCG_TIS_SPI_CR50) += tpm_tis_spi_cr50.o
 
 obj-$(CONFIG_TCG_TIS_I2C_CR50) += tpm_tis_i2c_cr50.o
 
-obj-$(CONFIG_TCG_TIS_I2C) += tpm_tis_i2c.o
 obj-$(CONFIG_TCG_TIS_I2C_ATMEL) += tpm_i2c_atmel.o
 obj-$(CONFIG_TCG_TIS_I2C_INFINEON) += tpm_i2c_infineon.o
 obj-$(CONFIG_TCG_TIS_I2C_NUVOTON) += tpm_i2c_nuvoton.o
diff --git a/drivers/char/tpm/tpm_tis_i2c.c b/drivers/char/tpm/tpm_tis_i2c.c
deleted file mode 100644
index 12984a3be327..000000000000
--- a/drivers/char/tpm/tpm_tis_i2c.c
+++ /dev/null
@@ -1,263 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (c) 2014-2021 Nuvoton Technology corporation
- *
- * TPM TIS I2C Device Driver Interface for devices that implement the TPM
- * I2C Interface defined by "TCG PC Client Platform TPM Profile (PTP)
- * Specification version 01.05 r14" and "TCG PC Client Device Driver
- * Design Principles version 1.0 r27" for TPM 2.0 at
- * www.trustedcomputinggroup.org
- */
-
-#include <linux/init.h>
-#include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/slab.h>
-#include <linux/interrupt.h>
-#include <linux/wait.h>
-#include <linux/acpi.h>
-#include <linux/freezer.h>
-
-#include <linux/module.h>
-#include <linux/i2c.h>
-#include <linux/gpio.h>
-#include <linux/of_irq.h>
-#include <linux/of_gpio.h>
-#include <linux/tpm.h>
-#include "tpm_tis_core.h"
-
-#define TPM_LOC_SEL			0x04
-#define TPM_I2C_INTERFACE_CAPABILITY	0x30
-#define TPM_I2C_DEVICE_ADDRESS		0x38
-#define TPM_DATA_CSUM_ENABLE		0x40
-#define TPM_I2C_DID_VID			0x48
-#define TPM_I2C_RID			0x4C
-
-struct tpm_tis_i2c_phy {
-	struct tpm_tis_data priv;
-	struct i2c_client *i2c_client;
-	u8 *iobuf;
-};
-
-static inline struct tpm_tis_i2c_phy *to_tpm_tis_i2c_phy(struct tpm_tis_data *data)
-{
-	return container_of(data, struct tpm_tis_i2c_phy, priv);
-}
-
-static u8 address_to_register(u32 addr)
-{
-	addr &= 0xFFF;
-
-	switch (addr) {
-		// adapt register addresses that have changed compared to
-		// older TIS versions
-	case TPM_ACCESS(0):
-		return 0x04;
-	case TPM_LOC_SEL:
-		return 0x00;
-	case TPM_DID_VID(0):
-		return 0x48;
-	case TPM_RID(0):
-		return 0x4C;
-	default:
-		return addr;
-	}
-}
-
-static int tpm_tis_i2c_read_bytes(struct tpm_tis_data *data, u32 addr, u16 len, u8 *result)
-{
-	struct tpm_tis_i2c_phy *phy = to_tpm_tis_i2c_phy(data);
-	u8 reg = address_to_register(addr);
-	int ret;
-	int i = 0;
-	struct i2c_msg msgs[] = {
-		{
-			.addr = phy->i2c_client->addr,
-			.len = sizeof(reg),
-			.buf = &reg,
-		},
-		{
-			.addr = phy->i2c_client->addr,
-			.len = len,
-			.buf = result,
-			.flags = I2C_M_RD,
-		},
-	};
-
-	do {
-		ret = i2c_transfer(phy->i2c_client->adapter, msgs,
-				   ARRAY_SIZE(msgs));
-		usleep_range(250, 300); // wait default GUARD_TIME of 250µs
-
-	} while (ret < 0 && i++ < TPM_RETRY);
-
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
-static int tpm_tis_i2c_write_bytes(struct tpm_tis_data *data, u32 addr,
-				   u16 len, const u8 *value)
-{
-	struct tpm_tis_i2c_phy *phy = to_tpm_tis_i2c_phy(data);
-	int ret = 0;
-	int i = 0;
-
-	if (phy->iobuf) {
-		if (len > TPM_BUFSIZE - 1)
-			return -EIO;
-
-		phy->iobuf[0] = address_to_register(addr);
-		memcpy(phy->iobuf + 1, value, len);
-
-		struct i2c_msg msgs[] = {
-			{
-				.addr = phy->i2c_client->addr,
-				.len = len + 1,
-				.buf = phy->iobuf,
-			},
-		};
-
-		do {
-			ret = i2c_transfer(phy->i2c_client->adapter,
-					   msgs, ARRAY_SIZE(msgs));
-			// wait default GUARD_TIME of 250µs
-			usleep_range(250, 300);
-		} while (ret < 0 && i++ < TPM_RETRY);
-	} else {
-		u8 reg = address_to_register(addr);
-
-		struct i2c_msg msgs[] = {
-			{
-				.addr = phy->i2c_client->addr,
-				.len = sizeof(reg),
-				.buf = &reg,
-			},
-			{
-				.addr = phy->i2c_client->addr,
-				.len = len,
-				.buf = (u8 *)value,
-				.flags = I2C_M_NOSTART,
-			},
-		};
-
-		do {
-			ret = i2c_transfer(phy->i2c_client->adapter, msgs,
-					   ARRAY_SIZE(msgs));
-			// wait default GUARD_TIME of 250µs
-			usleep_range(250, 300);
-		} while (ret < 0 && i++ < TPM_RETRY);
-	}
-
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
-int tpm_tis_i2c_read16(struct tpm_tis_data *data, u32 addr, u16 *result)
-{
-	__le16 result_le;
-	int rc;
-
-	rc = data->phy_ops->read_bytes(data, addr, sizeof(u16),
-				       (u8 *)&result_le);
-	if (!rc)
-		*result = le16_to_cpu(result_le);
-
-	return rc;
-}
-
-int tpm_tis_i2c_read32(struct tpm_tis_data *data, u32 addr, u32 *result)
-{
-	__le32 result_le;
-	int rc;
-
-	rc = data->phy_ops->read_bytes(data, addr, sizeof(u32),
-				       (u8 *)&result_le);
-	if (!rc)
-		*result = le32_to_cpu(result_le);
-
-	return rc;
-}
-
-int tpm_tis_i2c_write32(struct tpm_tis_data *data, u32 addr, u32 value)
-{
-	__le32 value_le;
-	int rc;
-
-	value_le = cpu_to_le32(value);
-
-	rc = data->phy_ops->write_bytes(data, addr, sizeof(u32),
-					(u8 *)&value_le);
-
-	return rc;
-}
-
-static SIMPLE_DEV_PM_OPS(tpm_tis_pm, tpm_pm_suspend, tpm_tis_resume);
-
-static const struct tpm_tis_phy_ops tpm_i2c_phy_ops = {
-	.read_bytes = tpm_tis_i2c_read_bytes,
-	.write_bytes = tpm_tis_i2c_write_bytes,
-	.read16 = tpm_tis_i2c_read16,
-	.read32 = tpm_tis_i2c_read32,
-	.write32 = tpm_tis_i2c_write32,
-};
-
-static int tpm_tis_i2c_probe(struct i2c_client *dev, const struct i2c_device_id *id)
-{
-	struct tpm_tis_i2c_phy *phy;
-	const u8 loc_init = 0;
-	int rc;
-
-	phy = devm_kzalloc(&dev->dev, sizeof(struct tpm_tis_i2c_phy),
-			   GFP_KERNEL);
-	if (!phy)
-		return -ENOMEM;
-
-	phy->i2c_client = dev;
-
-	if (!i2c_check_functionality(dev->adapter, I2C_FUNC_NOSTART)) {
-		phy->iobuf = devm_kmalloc(&dev->dev, TPM_BUFSIZE, GFP_KERNEL);
-		if (!phy->iobuf)
-			return -ENOMEM;
-	}
-
-	/*select locality 0 (the driver will access only via locality 0)*/
-	rc = tpm_tis_i2c_write_bytes(&phy->priv, TPM_LOC_SEL, 1, &loc_init);
-	if (rc < 0)
-		return rc;
-
-	return tpm_tis_core_init(&dev->dev, &phy->priv, -1, &tpm_i2c_phy_ops,
-					NULL);
-}
-
-static const struct i2c_device_id tpm_tis_i2c_id[] = {
-	{"tpm_tis_i2c", 0},
-	{}
-};
-MODULE_DEVICE_TABLE(i2c, tpm_tis_i2c_id);
-
-static const struct of_device_id of_tis_i2c_match[] = {
-	{ .compatible = "nuvoton,npct75x", },
-	{ .compatible = "tcg,tpm-tis-i2c", },
-	{}
-};
-MODULE_DEVICE_TABLE(of, of_tis_i2c_match);
-
-static struct i2c_driver tpm_tis_i2c_driver = {
-	.driver = {
-		.owner = THIS_MODULE,
-		.name = "tpm_tis_i2c",
-		.pm = &tpm_tis_pm,
-		.of_match_table = of_match_ptr(of_tis_i2c_match),
-	},
-	.probe = tpm_tis_i2c_probe,
-	.id_table = tpm_tis_i2c_id,
-};
-
-module_i2c_driver(tpm_tis_i2c_driver);
-
-MODULE_DESCRIPTION("TPM Driver");
-MODULE_LICENSE("GPL");
-- 
2.37.1

