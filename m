Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C20A1667D
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2025 07:00:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yc05V4PLLz3wWL
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2025 16:58:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:d0a:203a::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737107084;
	cv=none; b=InuRCPnhzcT0F8xZl10l57TSqJqc6H+kvy3Hx5+lh35Rz5imLSrlBmeuNE++bE8rN2P/Nho+SIslvHBV7mAiA/yVdBLRHyRxynnHVs5A96Xv5sP8yQVJeppgZvqG32FjjQ+UwsnxudhEmVFNilLkUGSF6kptM551C58Xx+UD0Zjg0v/yPHZ4MXnAAp6c0qIVD3uZSVi3ZOyMs4nj67ZxjPXCwoOOmnvkStNNsewddVG26+sWI4XsYM8dKx+iK3zv8luGhRRYFple4gOCgx7vTt4mQ6tM8YqJHJ9qAdligly1wPM0LwDu3E1gG+Cxo8EVtFpUna6gqhxhPnncTYTvEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737107084; c=relaxed/relaxed;
	bh=k3PAuO3z1fhay62QPiMPBkZ0BTwW4VaVO2K1hqky2IY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZSZimpaVssrwAAKVG/RS7bu7KF9yjzD9V0NAEtKXEsbxHFBKJPQz6qs7/ZjB7RIw/+kiCpCiRJvkLXglqshioxtrlDtTcZy2VM7uzVbIAaf1+J8BJQrf/KZQpM4z7pUSvwY3ARJTFPOYVHO2jUKb4Ije2SxJdWj2VdW0WZP1aYhxB0rlxNQeMHtjr8M0+3vfrofUHN5987mqziohKA7j1BSQdi8lVPGSn3rRn2vr9kJZkJvFh/dk66EdaXdUYzOw6eGMMNinxpQ8Kqvu46A4HOIPf3kkXQUtGTKe292e2VUJKmUQz9GzXm4FQOEnL91vcacuWtxbTkxLYueAM/1z5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=hetzner.com; dkim=pass (2048-bit key; unprotected) header.d=hetzner.com header.i=@hetzner.com header.a=rsa-sha256 header.s=lms2212 header.b=lroTULNP; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:d0a:203a::1; helo=mail.hetzner.company; envelope-from=tan.siewert@hetzner.com; receiver=lists.ozlabs.org) smtp.mailfrom=hetzner.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=hetzner.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hetzner.com header.i=@hetzner.com header.a=rsa-sha256 header.s=lms2212 header.b=lroTULNP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hetzner.com (client-ip=2a01:4f8:d0a:203a::1; helo=mail.hetzner.company; envelope-from=tan.siewert@hetzner.com; receiver=lists.ozlabs.org)
Received: from mail.hetzner.company (mail.hetzner.company [IPv6:2a01:4f8:d0a:203a::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZFFQ2Sctz30TQ
	for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2025 20:44:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hetzner.com
	; s=lms2212; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=k3PAuO3z1fhay62QPiMPBkZ0BTwW4VaVO2K1hqky2IY=; b=lroTUL
	NPayj/ej7xEw+MyzESOMhCMwPt5i9iH+tljFzakaSDahHcKGwk+ZMotGEddmEfEeQgdHjcEeOdAsK
	04Z88moJ9kedTROpBkIAUywOg5JmiJuQFucUH95ty5+X5hvQucaIznD+17PK3s/Ro4bOPp1Om1A3K
	4f/FUOavVoTJOT84ZlxG/tQwwTDPH8OyRMKw9AgF4/4n8jEAhr1Mx8UkBTA1/OuUZNxhPDfYQjfFv
	spE4Zu3lh8bYGhH7vKvqgfik20NgAHq6jM0zcJqdCUHFpM+VEzNchLa+0KliEzskuVPWccQ1QNo87
	vkaregXF1BZdDJYgzGFrjeaf2lpw==;
Received: from [2a01:4f8:0:a0a7::4c:0] (helo=localhost.localdomain)
	by mail.hetzner.company with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.94.2)
	(envelope-from <tan.siewert@hetzner.com>)
	id 1tYiu2-000A1S-RT; Fri, 17 Jan 2025 10:44:34 +0100
From: Tan Siewert <tan.siewert@hetzner.com>
To: openbmc@lists.ozlabs.org,
	andrew@aj.id.au
Subject: [PATCH u-boot, v2019.04-aspeed-openbmc 01/12] i2c: add support for offset overflow in to address
Date: Fri, 17 Jan 2025 10:44:20 +0100
Message-ID: <20250117094434.16641-2-tan.siewert@hetzner.com>
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

Some devices (2 wire eeproms for example) use some bits from the chip
address to represent the high bits of the offset instead of or as well
as using multiple bytes for the offset, effectively stealing chip
addresses on the bus.

Add a chip offset mask that can be set for any i2c chip which gets
filled with the offset overflow during offset setup.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Signed-off-by: Ian Ray <ian.ray@ge.com>
Reviewed-by: Heiko Schocher <hs@denx.de>
(cherry picked from commit 85968522b928e19a27aa79f0cb186c80b8b82e47)
Signed-off-by: Tan Siewert <tan.siewert@hetzner.com>
---
 drivers/i2c/i2c-uclass.c | 34 +++++++++++++++++++++++++++-------
 include/i2c.h            | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/i2c-uclass.c b/drivers/i2c/i2c-uclass.c
index 49e23a0a4bf..8c9abca175a 100644
--- a/drivers/i2c/i2c-uclass.c
+++ b/drivers/i2c/i2c-uclass.c
@@ -52,16 +52,19 @@ void i2c_dump_msgs(struct i2c_msg *msg, int nmsgs)
 static int i2c_setup_offset(struct dm_i2c_chip *chip, uint offset,
 			    uint8_t offset_buf[], struct i2c_msg *msg)
 {
-	int offset_len;
+	int offset_len = chip->offset_len;
 
 	msg->addr = chip->chip_addr;
+	if (chip->chip_addr_offset_mask)
+		msg->addr |= (offset >> (8 * offset_len)) &
+			chip->chip_addr_offset_mask;
 	msg->flags = chip->flags & DM_I2C_CHIP_10BIT ? I2C_M_TEN : 0;
 	msg->len = chip->offset_len;
 	msg->buf = offset_buf;
-	if (!chip->offset_len)
+	if (!offset_len)
 		return -EADDRNOTAVAIL;
-	assert(chip->offset_len <= I2C_MAX_OFFSET_LEN);
-	offset_len = chip->offset_len;
+	assert(offset_len <= I2C_MAX_OFFSET_LEN);
+
 	while (offset_len--)
 		*offset_buf++ = offset >> (8 * offset_len);
 
@@ -83,7 +86,7 @@ static int i2c_read_bytewise(struct udevice *dev, uint offset,
 		if (i2c_setup_offset(chip, offset + i, offset_buf, msg))
 			return -EINVAL;
 		ptr = msg + 1;
-		ptr->addr = chip->chip_addr;
+		ptr->addr = msg->addr;
 		ptr->flags = msg->flags | I2C_M_RD;
 		ptr->len = 1;
 		ptr->buf = &buffer[i];
@@ -139,7 +142,7 @@ int dm_i2c_read(struct udevice *dev, uint offset, uint8_t *buffer, int len)
 		ptr++;
 
 	if (len) {
-		ptr->addr = chip->chip_addr;
+		ptr->addr = msg->addr;
 		ptr->flags = chip->flags & DM_I2C_CHIP_10BIT ? I2C_M_TEN : 0;
 		ptr->flags |= I2C_M_RD;
 		ptr->len = len;
@@ -323,7 +326,8 @@ int i2c_get_chip(struct udevice *bus, uint chip_addr, uint offset_len,
 		struct dm_i2c_chip *chip = dev_get_parent_platdata(dev);
 		int ret;
 
-		if (chip->chip_addr == chip_addr) {
+		if (chip->chip_addr == (chip_addr &
+					~chip->chip_addr_offset_mask)) {
 			ret = device_probe(dev);
 			debug("found, ret=%d\n", ret);
 			if (ret)
@@ -465,6 +469,22 @@ int i2c_get_chip_offset_len(struct udevice *dev)
 	return chip->offset_len;
 }
 
+int i2c_set_chip_addr_offset_mask(struct udevice *dev, uint mask)
+{
+	struct dm_i2c_chip *chip = dev_get_parent_platdata(dev);
+
+	chip->chip_addr_offset_mask = mask;
+
+	return 0;
+}
+
+uint i2c_get_chip_addr_offset_mask(struct udevice *dev)
+{
+	struct dm_i2c_chip *chip = dev_get_parent_platdata(dev);
+
+	return chip->chip_addr_offset_mask;
+}
+
 #ifdef CONFIG_DM_GPIO
 static void i2c_gpio_set_pin(struct gpio_desc *pin, int bit)
 {
diff --git a/include/i2c.h b/include/i2c.h
index ccffc195527..b4a46c9823b 100644
--- a/include/i2c.h
+++ b/include/i2c.h
@@ -45,12 +45,26 @@ struct udevice;
  *		represent up to 256 bytes. A value larger than 1 may be
  *		needed for larger devices.
  * @flags:	Flags for this chip (dm_i2c_chip_flags)
+ * @chip_addr_offset_mask: Mask of offset bits within chip_addr. Used for
+ *			   devices which steal addresses as part of offset.
+ *			   If offset_len is zero, then the offset is encoded
+ *			   completely within the chip address itself.
+ *			   e.g. a devce with chip address of 0x2c with 512
+ *			   registers might use the bottom bit of the address
+ *			   to indicate which half of the address space is being
+ *			   accessed while still only using 1 byte offset.
+ *			   This means it will respond to  chip address 0x2c and
+ *			   0x2d.
+ *			   A real world example is the Atmel AT24C04. It's
+ *			   datasheet explains it's usage of this addressing
+ *			   mode.
  * @emul: Emulator for this chip address (only used for emulation)
  */
 struct dm_i2c_chip {
 	uint chip_addr;
 	uint offset_len;
 	uint flags;
+	uint chip_addr_offset_mask;
 #ifdef CONFIG_SANDBOX
 	struct udevice *emul;
 	bool test_mode;
@@ -259,6 +273,25 @@ int i2c_set_chip_offset_len(struct udevice *dev, uint offset_len);
  */
 int i2c_get_chip_offset_len(struct udevice *dev);
 
+/**
+ * i2c_set_chip_addr_offset_mask() - set mask of address bits usable by offset
+ *
+ * Some devices listen on multiple chip addresses to achieve larger offsets
+ * than their single or multiple byte offsets would allow for. You can use this
+ * function to set the bits that are valid to be used for offset overflow.
+ *
+ * @mask: The mask to be used for high offset bits within address
+ * @return 0 if OK, other -ve value on error
+ */
+int i2c_set_chip_addr_offset_mask(struct udevice *dev, uint mask);
+
+/*
+ * i2c_get_chip_addr_offset_mask() - get mask of address bits usable by offset
+ *
+ * @return current chip addr offset mask
+ */
+uint i2c_get_chip_addr_offset_mask(struct udevice *dev);
+
 /**
  * i2c_deblock() - recover a bus that is in an unknown state
  *
-- 
2.47.0

