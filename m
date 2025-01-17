Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F02A1667A
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2025 06:59:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yc05L4y5dz3gL9
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2025 16:58:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:d0a:203a::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737107083;
	cv=none; b=aYNNMi2pnFhYptsGMY4ctSlF0HnX689rPPsUjj9g0P6SY2+IMGCDPdEoAIp8eE/y0yasOGNDA5JK8z6xtLswUbRiZlFZQOuhTdc+reWfTV4DDa8ZT/Ypcod21URL33YwmsDJ/W6OEM+cM9bC5Wa++cZ+0Uu2MxroOPsYfyLNWWZO5moMDewNfcb2a0egsjP8tN58mf0Ax8aIcUq8g2GF95UBhUsQfR8FOvbYsJa8q08dV59q1+QQGp19bLIPZvOH4WqH3UEXwX1GFwfNoDdkclcnnwVoJCb3+0CtgdhmBhrjySfUnp3A7h7X2WLE4WBxzUqpJJ5dv+bp4zlUYNtY7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737107083; c=relaxed/relaxed;
	bh=3bNf/aK4PAsr+B+gFJdiDxoEd+bmo5HRn/UANYoViAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GODuoE8f3HvdLNZ/Ksd9Qe5ao1puBsmqbGFfQ9HmA+L69/EP+WvxrsaFS9YBcFR95aplzNXslHBbVxlipTZEirtUUy6MFzTPGYs+N4RmzAQm5Y7NTX/kwmlmpVjLBBdM3jwg0ukRejAzY/Y6S8aRWftLUvAzIf//3WF/oTYo707xUIOfVrbLIMw66QD11OUXcsb3TBuS/pUm37P534+dKfRSXQr30qtuDl72B5eNWwMX5PdALyJ1URtKYueO4+LkFJMbQJrF26hObG6raXLheL1+8pcJ31pygF2ym3YP3LMUMhBwI2VUxH71EKpTqs6VUm6f8V1mluxqEsCj8xBzMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=hetzner.com; dkim=pass (2048-bit key; unprotected) header.d=hetzner.com header.i=@hetzner.com header.a=rsa-sha256 header.s=lms2212 header.b=S0ikgglc; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:d0a:203a::1; helo=mail.hetzner.company; envelope-from=tan.siewert@hetzner.com; receiver=lists.ozlabs.org) smtp.mailfrom=hetzner.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=hetzner.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hetzner.com header.i=@hetzner.com header.a=rsa-sha256 header.s=lms2212 header.b=S0ikgglc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hetzner.com (client-ip=2a01:4f8:d0a:203a::1; helo=mail.hetzner.company; envelope-from=tan.siewert@hetzner.com; receiver=lists.ozlabs.org)
Received: from mail.hetzner.company (mail.hetzner.company [IPv6:2a01:4f8:d0a:203a::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZFFN1Xbmz3cjm
	for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2025 20:44:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hetzner.com
	; s=lms2212; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=3bNf/aK4PAsr+B+gFJdiDxoEd+bmo5HRn/UANYoViAM=; b=S0ikgg
	lcUYBPeWZtwbl4Ye+3oew9aXwTajKhpHO6GAA6NZ2cFKwrJPmx3BLXvR7BURfgjhzXM4EsaDGFtmC
	fhXkJClQp4Yg/Mp9ZB4b1lT0GchyicpHbfy0Mp9oELWcnhD3jJ4Um/dsjJMZhnIRPbKTvo+WsNQli
	JE873T+aMKz5rYSgzFRgSF5HmXHrWpyYY047UZNEb2/qhujPnIM1MJLsauTFLW6ZfmY5sadG3hc1J
	ltVznb6z+S7XwBUeKWvxG+MTkGCiA26TLOSVVzWturUDZeKJ/Fc+WF97QAzjjssm6QAUgclGi10Sa
	a3Paf5yhuqM70z4wlfL21k04VVEA==;
Received: from [2a01:4f8:0:a0a7::4c:0] (helo=localhost.localdomain)
	by mail.hetzner.company with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.94.2)
	(envelope-from <tan.siewert@hetzner.com>)
	id 1tYiu3-000A1S-H8; Fri, 17 Jan 2025 10:44:35 +0100
From: Tan Siewert <tan.siewert@hetzner.com>
To: openbmc@lists.ozlabs.org,
	andrew@aj.id.au
Subject: [PATCH u-boot, v2019.04-aspeed-openbmc 06/12] misc: i2c_eeprom: add fixed partitions support
Date: Fri, 17 Jan 2025 10:44:25 +0100
Message-ID: <20250117094434.16641-7-tan.siewert@hetzner.com>
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

Add ability to partition eeprom via devicetree bindings

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Reviewed-by: Heiko Schocher <hs@denx.de>
(cherry picked from commit 1a59cb426d50082821df941146a9ec20decd118f)
Signed-off-by: Tan Siewert <tan.siewert@hetzner.com>
---
 drivers/misc/i2c_eeprom.c | 98 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/drivers/misc/i2c_eeprom.c b/drivers/misc/i2c_eeprom.c
index 3755dbf74bb..741bae27275 100644
--- a/drivers/misc/i2c_eeprom.c
+++ b/drivers/misc/i2c_eeprom.c
@@ -8,6 +8,7 @@
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <dm.h>
+#include <dm/device-internal.h>
 #include <i2c.h>
 #include <i2c_eeprom.h>
 
@@ -83,6 +84,29 @@ static int i2c_eeprom_std_ofdata_to_platdata(struct udevice *dev)
 	return 0;
 }
 
+static int i2c_eeprom_std_bind(struct udevice *dev)
+{
+	ofnode partitions = ofnode_find_subnode(dev_ofnode(dev), "partitions");
+	ofnode partition;
+	const char *name;
+
+	if (!ofnode_valid(partitions))
+		return 0;
+	if (!ofnode_device_is_compatible(partitions, "fixed-partitions"))
+		return -ENOTSUPP;
+
+	ofnode_for_each_subnode(partition, partitions) {
+		name = ofnode_get_name(partition);
+		if (!name)
+			continue;
+
+		device_bind_ofnode(dev, DM_GET_DRIVER(i2c_eeprom_partition),
+				   name, NULL, partition, NULL);
+	}
+
+	return 0;
+}
+
 static int i2c_eeprom_std_probe(struct udevice *dev)
 {
 	u8 test_byte;
@@ -118,12 +142,86 @@ U_BOOT_DRIVER(i2c_eeprom_std) = {
 	.name			= "i2c_eeprom",
 	.id			= UCLASS_I2C_EEPROM,
 	.of_match		= i2c_eeprom_std_ids,
+	.bind			= i2c_eeprom_std_bind,
 	.probe			= i2c_eeprom_std_probe,
 	.ofdata_to_platdata	= i2c_eeprom_std_ofdata_to_platdata,
 	.priv_auto_alloc_size	= sizeof(struct i2c_eeprom),
 	.ops			= &i2c_eeprom_std_ops,
 };
 
+struct i2c_eeprom_partition {
+	u32 offset;
+	u32 size;
+};
+
+static int i2c_eeprom_partition_probe(struct udevice *dev)
+{
+	return 0;
+}
+
+static int i2c_eeprom_partition_ofdata_to_platdata(struct udevice *dev)
+{
+	struct i2c_eeprom_partition *priv = dev_get_priv(dev);
+	u32 offset, size;
+	int ret;
+
+	ret = dev_read_u32(dev, "offset", &offset);
+	if (ret)
+		return ret;
+
+	ret = dev_read_u32(dev, "size", &size);
+	if (ret)
+		return ret;
+
+	priv->offset = offset;
+	priv->size = size;
+
+	return 0;
+}
+
+static int i2c_eeprom_partition_read(struct udevice *dev, int offset,
+				     u8 *buf, int size)
+{
+	struct i2c_eeprom_partition *priv = dev_get_priv(dev);
+	struct udevice *parent = dev_get_parent(dev);
+
+	if (!parent)
+		return -ENODEV;
+	if (offset + size > priv->size)
+		return -EINVAL;
+
+	return i2c_eeprom_read(parent, offset + priv->offset, buf, size);
+}
+
+static int i2c_eeprom_partition_write(struct udevice *dev, int offset,
+				      const u8 *buf, int size)
+{
+	struct i2c_eeprom_partition *priv = dev_get_priv(dev);
+	struct udevice *parent = dev_get_parent(dev);
+
+	if (!parent)
+		return -ENODEV;
+	if (offset + size > priv->size)
+		return -EINVAL;
+
+	return i2c_eeprom_write(parent, offset + priv->offset, (uint8_t *)buf,
+				size);
+}
+
+static const struct i2c_eeprom_ops i2c_eeprom_partition_ops = {
+	.read	= i2c_eeprom_partition_read,
+	.write	= i2c_eeprom_partition_write,
+};
+
+U_BOOT_DRIVER(i2c_eeprom_partition) = {
+	.name			= "i2c_eeprom_partition",
+	.id			= UCLASS_I2C_EEPROM,
+	.probe			= i2c_eeprom_partition_probe,
+	.ofdata_to_platdata	= i2c_eeprom_partition_ofdata_to_platdata,
+	.priv_auto_alloc_size	= sizeof(struct i2c_eeprom_partition),
+	.ops			= &i2c_eeprom_partition_ops,
+};
+
 UCLASS_DRIVER(i2c_eeprom) = {
 	.id		= UCLASS_I2C_EEPROM,
 	.name		= "i2c_eeprom",
-- 
2.47.0

