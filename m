Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A0EA16679
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2025 06:59:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yc05J1ThPz3g9Y
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2025 16:58:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:d0a:203a::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737107083;
	cv=none; b=A/e/OV4SS3bZF5hMccZxolFnYaw0Zz1FQ6nrl+3yU+ljGazXaz1wwha2CA+rWfzL5CJf+MJOhfM0rFCgXbss4d3mY+qawD89vJC2XcirUaD5OsXZyJdUwv3EZXorOx77VTriWh/5bsFIT3+S7NxlCmCxWmRXQgmorUAKwdKgGr/fQGVv5FP5l7PAxRkFn1lLw4a+RAFyE8fsJOu6sVLjk2NYdMF+1CCKkaS2owVnFbWSWOuPJJfIqhtw5SoCT78xR2JX6GZlFn4NujI+swgnH9sXWhrZylGmyWA3r+dQ80xJWsupHCDriUsisq9qMSHDiJOHx6wNlMkDvQOIcNJCmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737107083; c=relaxed/relaxed;
	bh=M8f8ztbpw4gcAapr6nvoWJJwmYA+RXqkZImpKg6Copk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RUFjunvaMuTchAVQEAri5CS+hiBl8fANZlV9zhqu3XivitHHF0+CtwkWXX9DK366LkXoC4RRi7dGz2ZVtEbym3VlYuAluYLY+ndX20GZgsAm1dTuGlFbmswcRT8CEIwN/XK6wq5d0Hq8bKqRWBNA+9lZMPctAZDH+M2VJyiKXdvSRzvPs7W2s2ABT4TGTNgNHoy8xVIMHZieTS/3bzHCEz5HK4Natq5+vleFMmS3UMglEZMIcf+2dr1zhl9ODr5ZmEWHoxyTJxWTmDnAFylp2nr2300Pe/H2MJ4Ne7JV1CUligYjE5kFZJvgStjoikaTUHNssrFGkOvx1dbVMUR06A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=hetzner.com; dkim=pass (2048-bit key; unprotected) header.d=hetzner.com header.i=@hetzner.com header.a=rsa-sha256 header.s=lms2212 header.b=rdCu5hjC; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:d0a:203a::1; helo=mail.hetzner.company; envelope-from=tan.siewert@hetzner.com; receiver=lists.ozlabs.org) smtp.mailfrom=hetzner.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=hetzner.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hetzner.com header.i=@hetzner.com header.a=rsa-sha256 header.s=lms2212 header.b=rdCu5hjC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hetzner.com (client-ip=2a01:4f8:d0a:203a::1; helo=mail.hetzner.company; envelope-from=tan.siewert@hetzner.com; receiver=lists.ozlabs.org)
Received: from mail.hetzner.company (mail.hetzner.company [IPv6:2a01:4f8:d0a:203a::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZFFN1P3Tz3cjf
	for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2025 20:44:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hetzner.com
	; s=lms2212; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=M8f8ztbpw4gcAapr6nvoWJJwmYA+RXqkZImpKg6Copk=; b=rdCu5h
	jCoojAvzKxGL+Pl4UDpvNwKE7RtYTErHrkf9jXtwAF1MyZ3eJu07ghl1aF1uaYYu9wvoUecDxCktM
	lRJRZDkXNnF953OhDL7hPbayRu1q+Hb768KS+t4nHgfXU0RGn024/fvgYYJhn/w1JYcfx6I66dSHl
	axDMwzN1K+KBc6YAK35sS1kY5asOhNhRaM6DxdCbLrLh0pmMavFwrUHIL/Q/lv3Q3KIH6Qe7CfWMz
	BFsiyuxjMD8cH7e42LcBMq+ewqXUIefwQDNoUulnksQg2kzjdx1DFX0W8hFyI4UpHuguCxT4JnhLI
	fvFQW4zMcVvrQc8Xx5fKRZNUk6KA==;
Received: from [2a01:4f8:0:a0a7::4c:0] (helo=localhost.localdomain)
	by mail.hetzner.company with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.94.2)
	(envelope-from <tan.siewert@hetzner.com>)
	id 1tYiu3-000A1S-Pl; Fri, 17 Jan 2025 10:44:35 +0100
From: Tan Siewert <tan.siewert@hetzner.com>
To: openbmc@lists.ozlabs.org,
	andrew@aj.id.au
Subject: [PATCH u-boot, v2019.04-aspeed-openbmc 08/12] misc: i2c_eeprom: set offset len and chip addr offset mask
Date: Fri, 17 Jan 2025 10:44:27 +0100
Message-ID: <20250117094434.16641-9-tan.siewert@hetzner.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>, Tan Siewert <tan.siewert@hetzner.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Robert Beckett <bob.beckett@collabora.com>

Set the correct offset length and chip address offset mask for each
device to allow correct access to total capacity of the devices.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
(cherry picked from commit 821c982e359a383c8b95106e135da9fd98f16d2b)
Signed-off-by: Tan Siewert <tan.siewert@hetzner.com>
---
 drivers/misc/i2c_eeprom.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/misc/i2c_eeprom.c b/drivers/misc/i2c_eeprom.c
index 934f82074d5..6c0459dc555 100644
--- a/drivers/misc/i2c_eeprom.c
+++ b/drivers/misc/i2c_eeprom.c
@@ -15,6 +15,8 @@
 struct i2c_eeprom_drv_data {
 	u32 size; /* size in bytes */
 	u32 pagewidth; /* pagesize = 2^pagewidth */
+	u32 addr_offset_mask; /* bits in addr used for offset overflow */
+	u32 offset_len; /* size in bytes of offset */
 };
 
 int i2c_eeprom_read(struct udevice *dev, int offset, uint8_t *buf, int size)
@@ -140,6 +142,11 @@ static int i2c_eeprom_std_probe(struct udevice *dev)
 {
 	u8 test_byte;
 	int ret;
+	struct i2c_eeprom_drv_data *data =
+		(struct i2c_eeprom_drv_data *)dev_get_driver_data(dev);
+
+	i2c_set_chip_offset_len(dev, data->offset_len);
+	i2c_set_chip_addr_offset_mask(dev, data->addr_offset_mask);
 
 	/* Verify that the chip is functional */
 	ret = i2c_eeprom_read(dev, 0, &test_byte, 1);
@@ -152,71 +159,99 @@ static int i2c_eeprom_std_probe(struct udevice *dev)
 static const struct i2c_eeprom_drv_data eeprom_data = {
 	.size = 0,
 	.pagewidth = 0,
+	.addr_offset_mask = 0,
+	.offset_len = 1,
 };
 
 static const struct i2c_eeprom_drv_data mc24aa02e48_data = {
 	.size = 256,
 	.pagewidth = 3,
+	.addr_offset_mask = 0,
+	.offset_len = 1,
 };
 
 static const struct i2c_eeprom_drv_data atmel24c01a_data = {
 	.size = 128,
 	.pagewidth = 3,
+	.addr_offset_mask = 0,
+	.offset_len = 1,
 };
 
 static const struct i2c_eeprom_drv_data atmel24c02_data = {
 	.size = 256,
 	.pagewidth = 3,
+	.addr_offset_mask = 0,
+	.offset_len = 1,
 };
 
 static const struct i2c_eeprom_drv_data atmel24c04_data = {
 	.size = 512,
 	.pagewidth = 4,
+	.addr_offset_mask = 0x1,
+	.offset_len = 1,
 };
 
 static const struct i2c_eeprom_drv_data atmel24c08_data = {
 	.size = 1024,
 	.pagewidth = 4,
+	.addr_offset_mask = 0x3,
+	.offset_len = 1,
 };
 
 static const struct i2c_eeprom_drv_data atmel24c08a_data = {
 	.size = 1024,
 	.pagewidth = 4,
+	.addr_offset_mask = 0x3,
+	.offset_len = 1,
 };
 
 static const struct i2c_eeprom_drv_data atmel24c16a_data = {
 	.size = 2048,
 	.pagewidth = 4,
+	.addr_offset_mask = 0x7,
+	.offset_len = 1,
 };
 
 static const struct i2c_eeprom_drv_data atmel24mac402_data = {
 	.size = 256,
 	.pagewidth = 4,
+	.addr_offset_mask = 0,
+	.offset_len = 1,
 };
 
 static const struct i2c_eeprom_drv_data atmel24c32_data = {
 	.size = 4096,
 	.pagewidth = 5,
+	.addr_offset_mask = 0,
+	.offset_len = 2,
 };
 
 static const struct i2c_eeprom_drv_data atmel24c64_data = {
 	.size = 8192,
 	.pagewidth = 5,
+	.addr_offset_mask = 0,
+	.offset_len = 2,
 };
 
 static const struct i2c_eeprom_drv_data atmel24c128_data = {
 	.size = 16384,
 	.pagewidth = 6,
+	.addr_offset_mask = 0,
+	.offset_len = 2,
 };
 
 static const struct i2c_eeprom_drv_data atmel24c256_data = {
 	.size = 32768,
 	.pagewidth = 6,
+	.addr_offset_mask = 0,
+	.offset_len = 2,
 };
 
 static const struct i2c_eeprom_drv_data atmel24c512_data = {
 	.size = 65536,
 	.pagewidth = 6,
+	.addr_offset_mask = 0,
+	.offset_len = 2,
 };
 
 static const struct udevice_id i2c_eeprom_std_ids[] = {
-- 
2.47.0

