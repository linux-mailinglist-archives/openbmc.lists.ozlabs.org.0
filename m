Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2488BA1667B
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2025 06:59:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yc05P2yRWz3vdv
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2025 16:58:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:d0a:203a::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737107084;
	cv=none; b=Ljqa4msb0fEfUjkOgkk+ZJ7CdepNJuJMRqTU9NeMUsHc8AHVXkwxLobD4gCGaUhD1XjGfdYXT6t5KFwgvlM2SydK76l83l54rI8D88QFH17E8phyXh8rQ5AMjBFShOdT+ExZQ/iWVPIdHM1l6gsgoPde4BFjDlE0wGnMuoz9yfkqH0EI7V0eTRTezjwCIRJxZMZZZkLmbHuxRfEdv/yxE7FBvux5egl7y3+B5sUCzS1qAZhVp+VCtPNDyW0clfoxwPBlSw2SbpAPYYklNaMAj7uAVKjaO7W9OVZlb0a0FKHBr8LtYaRck3D/EZgwv2gS6D4HHg3HausInYufAJFaBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737107084; c=relaxed/relaxed;
	bh=9qygVYBCXmz9QiUQB7oNR3lAqDbArdaqC5sPIaCI/Wg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bo379Hpw6TGTIs+tNtpxnLL3biqF30fUKqmB8rVd0lnQmeeV9GC9SakYyaI0gN8FXes3DoDw36AikTfsbu8pVHXZ1dwtZvAdFPJrzs6n7b9q3ndhIfGunpT3BRk1XZS2cMc+IoE6JDMsRnuUGwdCrX0nlWmuioqJzFwZKiIcGQFTw18XxKtML9c7Wcj6MDuT1pvAEJcMNNUwd/DDKwAH5aHJRgDttEVxITQ3IVkKTbi93tk1wdRcGNg4eRWenRQjZ2tIxOvWvAcx7pFx2ARHQo2GG+AdDTHc5YsS3DLMnhpcfaiFkNEz1GUSAVwITifv/h+A65tN/Bk6t82xr8BdVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=hetzner.com; dkim=pass (2048-bit key; unprotected) header.d=hetzner.com header.i=@hetzner.com header.a=rsa-sha256 header.s=lms2212 header.b=oLnWpEb+; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:d0a:203a::1; helo=mail.hetzner.company; envelope-from=tan.siewert@hetzner.com; receiver=lists.ozlabs.org) smtp.mailfrom=hetzner.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=hetzner.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hetzner.com header.i=@hetzner.com header.a=rsa-sha256 header.s=lms2212 header.b=oLnWpEb+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hetzner.com (client-ip=2a01:4f8:d0a:203a::1; helo=mail.hetzner.company; envelope-from=tan.siewert@hetzner.com; receiver=lists.ozlabs.org)
Received: from mail.hetzner.company (mail.hetzner.company [IPv6:2a01:4f8:d0a:203a::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZFFN14zqz3cjX
	for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2025 20:44:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hetzner.com
	; s=lms2212; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=9qygVYBCXmz9QiUQB7oNR3lAqDbArdaqC5sPIaCI/Wg=; b=oLnWpE
	b+NBV4MU7Y03tmNXPJQsbbxHXSY3ZQHh5WvacAty1P5Y3p6ILktQRVAupOaw+iR50EAzWQ9unkrFR
	L3zabF99juYcMyYQte9GrgxhEQRH4cF3VTnL86ewUi9NCHYGTeCzfyOSPBtgEXtZuBoDBf5DW47FB
	zfsmDPSmh13tJHc0YVQb1BsaBOU5EFvhJgJ7HKjGLTkX8SSfcNswQCfOYrqOSCtQwZc4sPTDtCmCA
	G33qPyHD1vw7/+mWs6bxMPP4gUY8XDF0Wl0VneaPb3ytbgJ2Z/AdOd1RVd1DKDEUKPQHxzNKRL4nM
	DUGFEabnW5IWmPakSAw0kWj7IkkQ==;
Received: from [2a01:4f8:0:a0a7::4c:0] (helo=localhost.localdomain)
	by mail.hetzner.company with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.94.2)
	(envelope-from <tan.siewert@hetzner.com>)
	id 1tYiu3-000A1S-LU; Fri, 17 Jan 2025 10:44:35 +0100
From: Tan Siewert <tan.siewert@hetzner.com>
To: openbmc@lists.ozlabs.org,
	andrew@aj.id.au
Subject: [PATCH u-boot, v2019.04-aspeed-openbmc 07/12] misc: i2c_eeprom: add size query
Date: Fri, 17 Jan 2025 10:44:26 +0100
Message-ID: <20250117094434.16641-8-tan.siewert@hetzner.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250117094434.16641-1-tan.siewert@hetzner.com>
References: <20250117094434.16641-1-tan.siewert@hetzner.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: tom.siewert@hetzner.com
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 20 Jan 2025 16:58:31 +1100
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
Cc: Robert Beckett <bob.beckett@collabora.com>, Heiko Schocher <hs@denx.de>, Tan Siewert <tan.siewert@hetzner.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Robert Beckett <bob.beckett@collabora.com>

Add ability to query size of eeprom device and partitions

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Reviewed-by: Heiko Schocher <hs@denx.de>
(cherry picked from commit 033e18b47bd020610f84ca88c5ce3b88215d563a)
Signed-off-by: Tan Siewert <tan.siewert@hetzner.com>
---
 drivers/misc/i2c_eeprom.c | 145 +++++++++++++++++++++++++++++++++-----
 include/i2c_eeprom.h      |  12 ++++
 2 files changed, 138 insertions(+), 19 deletions(-)

diff --git a/drivers/misc/i2c_eeprom.c b/drivers/misc/i2c_eeprom.c
index 741bae27275..934f82074d5 100644
--- a/drivers/misc/i2c_eeprom.c
+++ b/drivers/misc/i2c_eeprom.c
@@ -12,6 +12,11 @@
 #include <i2c.h>
 #include <i2c_eeprom.h>
 
+struct i2c_eeprom_drv_data {
+	u32 size; /* size in bytes */
+	u32 pagewidth; /* pagesize = 2^pagewidth */
+};
+
 int i2c_eeprom_read(struct udevice *dev, int offset, uint8_t *buf, int size)
 {
 	const struct i2c_eeprom_ops *ops = device_get_ops(dev);
@@ -32,6 +37,16 @@ int i2c_eeprom_write(struct udevice *dev, int offset, uint8_t *buf, int size)
 	return ops->write(dev, offset, buf, size);
 }
 
+int i2c_eeprom_size(struct udevice *dev)
+{
+	const struct i2c_eeprom_ops *ops = device_get_ops(dev);
+
+	if (!ops->size)
+		return -ENOSYS;
+
+	return ops->size(dev);
+}
+
 static int i2c_eeprom_std_read(struct udevice *dev, int offset, uint8_t *buf,
 			       int size)
 {
@@ -61,25 +76,39 @@ static int i2c_eeprom_std_write(struct udevice *dev, int offset,
 	return 0;
 }
 
+static int i2c_eeprom_std_size(struct udevice *dev)
+{
+	struct i2c_eeprom *priv = dev_get_priv(dev);
+
+	return priv->size;
+}
+
 static const struct i2c_eeprom_ops i2c_eeprom_std_ops = {
 	.read	= i2c_eeprom_std_read,
 	.write	= i2c_eeprom_std_write,
+	.size	= i2c_eeprom_std_size,
 };
 
 static int i2c_eeprom_std_ofdata_to_platdata(struct udevice *dev)
 {
 	struct i2c_eeprom *priv = dev_get_priv(dev);
-	u64 data = dev_get_driver_data(dev);
+	struct i2c_eeprom_drv_data *data =
+		(struct i2c_eeprom_drv_data *)dev_get_driver_data(dev);
 	u32 pagesize;
+	u32 size;
 
 	if (dev_read_u32(dev, "pagesize", &pagesize) == 0) {
 		priv->pagesize = pagesize;
-		return 0;
+	} else {
+		/* 6 bit -> page size of up to 2^63 (should be sufficient) */
+		priv->pagewidth = data->pagewidth;
+		priv->pagesize = (1 << priv->pagewidth);
 	}
 
-	/* 6 bit -> page size of up to 2^63 (should be sufficient) */
-	priv->pagewidth = data & 0x3F;
-	priv->pagesize = (1 << priv->pagewidth);
+	if (dev_read_u32(dev, "size", &size) == 0)
+		priv->size = size;
+	else
+		priv->size = data->size;
 
 	return 0;
 }
@@ -120,21 +149,91 @@ static int i2c_eeprom_std_probe(struct udevice *dev)
 	return 0;
 }
 
+static const struct i2c_eeprom_drv_data eeprom_data = {
+	.size = 0,
+	.pagewidth = 0,
+};
+
+static const struct i2c_eeprom_drv_data mc24aa02e48_data = {
+	.size = 256,
+	.pagewidth = 3,
+};
+
+static const struct i2c_eeprom_drv_data atmel24c01a_data = {
+	.size = 128,
+	.pagewidth = 3,
+};
+
+static const struct i2c_eeprom_drv_data atmel24c02_data = {
+	.size = 256,
+	.pagewidth = 3,
+};
+
+static const struct i2c_eeprom_drv_data atmel24c04_data = {
+	.size = 512,
+	.pagewidth = 4,
+};
+
+static const struct i2c_eeprom_drv_data atmel24c08_data = {
+	.size = 1024,
+	.pagewidth = 4,
+};
+
+static const struct i2c_eeprom_drv_data atmel24c08a_data = {
+	.size = 1024,
+	.pagewidth = 4,
+};
+
+static const struct i2c_eeprom_drv_data atmel24c16a_data = {
+	.size = 2048,
+	.pagewidth = 4,
+};
+
+static const struct i2c_eeprom_drv_data atmel24mac402_data = {
+	.size = 256,
+	.pagewidth = 4,
+};
+
+static const struct i2c_eeprom_drv_data atmel24c32_data = {
+	.size = 4096,
+	.pagewidth = 5,
+};
+
+static const struct i2c_eeprom_drv_data atmel24c64_data = {
+	.size = 8192,
+	.pagewidth = 5,
+};
+
+static const struct i2c_eeprom_drv_data atmel24c128_data = {
+	.size = 16384,
+	.pagewidth = 6,
+};
+
+static const struct i2c_eeprom_drv_data atmel24c256_data = {
+	.size = 32768,
+	.pagewidth = 6,
+};
+
+static const struct i2c_eeprom_drv_data atmel24c512_data = {
+	.size = 65536,
+	.pagewidth = 6,
+};
+
 static const struct udevice_id i2c_eeprom_std_ids[] = {
-	{ .compatible = "i2c-eeprom", .data = 0 },
-	{ .compatible = "microchip,24aa02e48", .data = 3 },
-	{ .compatible = "atmel,24c01a", .data = 3 },
-	{ .compatible = "atmel,24c02", .data = 3 },
-	{ .compatible = "atmel,24c04", .data = 4 },
-	{ .compatible = "atmel,24c08", .data = 4 },
-	{ .compatible = "atmel,24c08a", .data = 4 },
-	{ .compatible = "atmel,24c16a", .data = 4 },
-	{ .compatible = "atmel,24mac402", .data = 4 },
-	{ .compatible = "atmel,24c32", .data = 5 },
-	{ .compatible = "atmel,24c64", .data = 5 },
-	{ .compatible = "atmel,24c128", .data = 6 },
-	{ .compatible = "atmel,24c256", .data = 6 },
-	{ .compatible = "atmel,24c512", .data = 6 },
+	{ .compatible = "i2c-eeprom", (ulong)&eeprom_data },
+	{ .compatible = "microchip,24aa02e48", (ulong)&mc24aa02e48_data },
+	{ .compatible = "atmel,24c01a", (ulong)&atmel24c01a_data },
+	{ .compatible = "atmel,24c02", (ulong)&atmel24c02_data },
+	{ .compatible = "atmel,24c04", (ulong)&atmel24c04_data },
+	{ .compatible = "atmel,24c08", (ulong)&atmel24c08_data },
+	{ .compatible = "atmel,24c08a", (ulong)&atmel24c08a_data },
+	{ .compatible = "atmel,24c16a", (ulong)&atmel24c16a_data },
+	{ .compatible = "atmel,24mac402", (ulong)&atmel24mac402_data },
+	{ .compatible = "atmel,24c32", (ulong)&atmel24c32_data },
+	{ .compatible = "atmel,24c64", (ulong)&atmel24c64_data },
+	{ .compatible = "atmel,24c128", (ulong)&atmel24c128_data },
+	{ .compatible = "atmel,24c256", (ulong)&atmel24c256_data },
+	{ .compatible = "atmel,24c512", (ulong)&atmel24c512_data },
 	{ }
 };
 
@@ -208,9 +307,17 @@ static int i2c_eeprom_partition_write(struct udevice *dev, int offset,
 				size);
 }
 
+static int i2c_eeprom_partition_size(struct udevice *dev)
+{
+	struct i2c_eeprom_partition *priv = dev_get_priv(dev);
+
+	return priv->size;
+}
+
 static const struct i2c_eeprom_ops i2c_eeprom_partition_ops = {
 	.read	= i2c_eeprom_partition_read,
 	.write	= i2c_eeprom_partition_write,
+	.size	= i2c_eeprom_partition_size,
 };
 
 U_BOOT_DRIVER(i2c_eeprom_partition) = {
diff --git a/include/i2c_eeprom.h b/include/i2c_eeprom.h
index 0fcdf3831b3..b96254ae79f 100644
--- a/include/i2c_eeprom.h
+++ b/include/i2c_eeprom.h
@@ -10,6 +10,7 @@ struct i2c_eeprom_ops {
 	int (*read)(struct udevice *dev, int offset, uint8_t *buf, int size);
 	int (*write)(struct udevice *dev, int offset, const uint8_t *buf,
 		     int size);
+	int (*size)(struct udevice *dev);
 };
 
 struct i2c_eeprom {
@@ -17,6 +18,8 @@ struct i2c_eeprom {
 	unsigned long pagesize;
 	/* The EEPROM's page width in bits (pagesize = 2^pagewidth) */
 	unsigned pagewidth;
+	/* The EEPROM's capacity in bytes */
+	unsigned long size;
 };
 
 /*
@@ -43,4 +46,13 @@ int i2c_eeprom_read(struct udevice *dev, int offset, uint8_t *buf, int size);
  */
 int i2c_eeprom_write(struct udevice *dev, int offset, uint8_t *buf, int size);
 
+/*
+ * i2c_eeprom_size() - get size of I2C EEPROM chip
+ *
+ * @dev:	Chip to query
+ *
+ * @return +ve size in bytes on success, -ve on failure
+ */
+int i2c_eeprom_size(struct udevice *dev);
+
 #endif
-- 
2.47.0

