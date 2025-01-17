Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5EAA16683
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2025 07:00:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yc05b2qLZz899H
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2025 16:58:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:d0a:203a::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737116620;
	cv=none; b=UfMwiT0KHfXyDqzYCR4a1XfRCjEIZXaWmHOFlb3R+jFdHtfpaJQb7N0MJoAbBUWoiWqoZC+rpfc9HiK/RTj/cNq8lc4hwGvKHM+wxXV6UKNg45zjqGB5ig8SW61wC0SkMXZ0KjR6q62ASo6do9davwwv4DeZbG5Gcz+QHQjMlKRivC7lkgxF7zPxYcedQ7Tec0U4fzrDl62EqV2qFaBkqPLoITIG9LcLSi4jOP5koTfBcy0CG/vtFTAiiDUAdRXMsHUxWTjPcnzKdl9Ema9QxV+cbAzuEh6zreR7OxaTQPNJBnmYHkLeTyjz/RvU7Vf1xxEMM7rYO/vamao4O3kjnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737116620; c=relaxed/relaxed;
	bh=o412VQi5VnPenCQ9BHqCWuF/dYRpI1jXyENNZVzR5m4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jnoH6IyLA95la68iuftJ52Hj4kbY+Oq9MF0HQtYBicf3XgQKWXFDVkBCu4Pt9dccTN/orSlOgO6Ewh3o2HHYokP0eHC0JGrJFQ5goa5ZRmB/Sa9k6CDB80z3HmePlT5POs9DFOo9fZ20+Pxr7+ZWaSaj+RJyhY2mJ9js6VNFcnAmb0Hb4ZuD38Fm+/DXJUnKVkHQGoDzSif07uFpNCGrdeDGdksuYZtgkPbdjMF6Pheddib8XZnxPyB0Umzdja+NeLwkfafgkUjzvi/Rft1/uhqcARhHQe+S415QpwFepNrLV3gJCYyuwTN63FAqdwZ997XYr7gU3Pe7dn0BMFEIcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=hetzner.com; dkim=pass (2048-bit key; unprotected) header.d=hetzner.com header.i=@hetzner.com header.a=rsa-sha256 header.s=lms2212 header.b=KevtarBa; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:d0a:203a::1; helo=mail.hetzner.company; envelope-from=tan.siewert@hetzner.com; receiver=lists.ozlabs.org) smtp.mailfrom=hetzner.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=hetzner.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hetzner.com header.i=@hetzner.com header.a=rsa-sha256 header.s=lms2212 header.b=KevtarBa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hetzner.com (client-ip=2a01:4f8:d0a:203a::1; helo=mail.hetzner.company; envelope-from=tan.siewert@hetzner.com; receiver=lists.ozlabs.org)
Received: from mail.hetzner.company (mail.hetzner.company [IPv6:2a01:4f8:d0a:203a::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZJmn5x67z30Vd
	for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2025 23:23:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hetzner.com
	; s=lms2212; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=o412VQi5VnPenCQ9BHqCWuF/dYRpI1jXyENNZVzR5m4=; b=Kevtar
	BaB2pOjdok7bjQ7SKPn/4ocOWFYi/J5hR0wsSNSbpwo/HBG5TS9z3hXAJFUgh+qMeKDn7a+PlcknX
	oVHkLkZgfZS02DLuQVXf6RxBeKaDCMbcvsDelZA7VwLw/Kp7jltOoENCP8V2ZkmpAc4RmHssQu9jK
	DUwRW584nbqipQ/rgAFeqYr+S0s21P9YMvkKa1FL6ZHrgwsgXZCCMP3Y0HJTvON+tDWzRycUFPJbn
	op7jRuy3HXbsUCCvUeJ1kRHxowl01UiBUY7QNPx43MpGXKFtFidfRlHMzNpf8Hc8BCoPrziK767U4
	JPaO/HoMfWJOYLD+0V7MGLieODHA==;
Received: from [2a01:4f8:0:a0a7::4c:0] (helo=localhost.localdomain)
	by mail.hetzner.company with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.94.2)
	(envelope-from <tan.siewert@hetzner.com>)
	id 1tYiu4-000A1S-6C; Fri, 17 Jan 2025 10:44:36 +0100
From: Tan Siewert <tan.siewert@hetzner.com>
To: openbmc@lists.ozlabs.org,
	andrew@aj.id.au
Subject: [PATCH u-boot, v2019.04-aspeed-openbmc 11/12] misc: i2c_eeprom: implement different probe test eeprom offset
Date: Fri, 17 Jan 2025 10:44:30 +0100
Message-ID: <20250117094434.16641-12-tan.siewert@hetzner.com>
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
Cc: Eugen Hristev <eugen.hristev@microchip.com>, Heiko Schocher <hs@denx.de>, Tan Siewert <tan.siewert@hetzner.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Eugen Hristev <eugen.hristev@microchip.com>

Because of this commit :
5ae84860b0 ("misc: i2c_eeprom: verify that the chip is functional at probe()")
at probe time, each eeprom is tested for read at offset 0.

The Atmel AT24MAC402 eeprom has different mapping. One i2c slave address is
used for the lower 0x80 bytes and another i2c slave address is used for the
upper 0x80 bytes. Because of this basically the i2c master sees 2 different
slaves. We need the upper bytes because we read the unique MAC address from
this EEPROM area.

However this implies that our slave address will return error on reads
from address 0x0 to 0x80.

To solve this, implemented an offset field inside platform data that is by
default 0 (as it is used now), but can be changed in the compatible table.

The probe function will now read at this offset and use it, instead of blindly
checking offset 0.

This will fix the regression noticed on these EEPROMs since the commit
abovementioned that introduces the probe failed issue.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
Reviewed-by: Heiko Schocher <hs@denx.de>
(cherry picked from commit b24dc83f156604f253ef6521776444188c5bff9b)
Signed-off-by: Tan Siewert <tan.siewert@hetzner.com>
---
 drivers/misc/i2c_eeprom.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/i2c_eeprom.c b/drivers/misc/i2c_eeprom.c
index ef5f103c98e..32a1b208567 100644
--- a/drivers/misc/i2c_eeprom.c
+++ b/drivers/misc/i2c_eeprom.c
@@ -17,6 +17,7 @@ struct i2c_eeprom_drv_data {
 	u32 pagesize; /* page size in bytes */
 	u32 addr_offset_mask; /* bits in addr used for offset overflow */
 	u32 offset_len; /* size in bytes of offset */
+	u32 start_offset; /* valid start offset inside memory, by default 0 */
 };
 
 int i2c_eeprom_read(struct udevice *dev, int offset, uint8_t *buf, int size)
@@ -147,7 +148,11 @@ static int i2c_eeprom_std_probe(struct udevice *dev)
 	i2c_set_chip_addr_offset_mask(dev, data->addr_offset_mask);
 
 	/* Verify that the chip is functional */
-	ret = i2c_eeprom_read(dev, 0, &test_byte, 1);
+	/*
+	 * Not all eeproms start from offset 0. Valid offset is available
+	 * in the platform data struct.
+	 */
+	ret = i2c_eeprom_read(dev, data->start_offset, &test_byte, 1);
 	if (ret)
 		return -ENODEV;
 
@@ -215,6 +220,7 @@ static const struct i2c_eeprom_drv_data atmel24mac402_data = {
 	.pagesize = 16,
 	.addr_offset_mask = 0,
 	.offset_len = 1,
+	.start_offset = 0x80,
 };
 
 static const struct i2c_eeprom_drv_data atmel24c32_data = {
-- 
2.47.0

