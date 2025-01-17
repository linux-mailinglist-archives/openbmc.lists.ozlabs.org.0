Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C7FA16685
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2025 07:01:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yc05h313Xz89Tp
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2025 16:59:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:d0a:203a::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737125518;
	cv=none; b=TJmWs2gdD52hjezrgtrZl1jfRXHCK3vuGH6yHbFOXPSu33z5quc/BfYdv6NL8l8GTfO4lbZ+/rACiCBNv2AFCwroon9QcLfeKNB2/J00jcf4++150ceUkxKh6r7CctqS9zQh515RRSOM3ONIYSEs6T/N+IqSbL3sreZhGNgT2mbd+EfwI2fr2jBTWQ/jhfKo/oFs+qGezaBufdXBnygZFOGDxSQQvcCLNjXX8S8Khtim9cSHsSSwUIUhOAi5QRxWSpvJ7iYy12xfofM+riFbPPYWbMIEQYYy5Uv4LZoH+8aIEblpS82f8VDkKWSsips7GFWX9sJQH++DduwsMiRfOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737125518; c=relaxed/relaxed;
	bh=CTOd3w4tbVo5GAhOrqMRxDh01CsEZMg9oO+KV9AHh9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DggkvMMgfppbOHn/yo7dp+KK66EgS8astYS28qIGcmezaUc2ofCYAW9asqUhB1jWkj+duidqKmKrtQTERMi/+DQQUFwuAXLBfsVC1QbuVdxSzg40mOXdFVSX2y/8UF6XdKJV05JO6wh/kS8blWGHDQ2UgasYKyik6U5/z2COXkaJbN1YLbzEEr5jtTW0XISzgVZsLrfbZth/0Vd2d3RdJxrY8iXx/SS4Xo6+8H1kZeOfnkkvPEBJte7y8/bOmWHVLm2sZrsDQMLc34T8wLpxkmesr25TNRW3Ln9HsAo5GLSHfrK23VRd2413DBDzOaiqo8d2uvTv3AiCYPWFgbUM4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=hetzner.com; dkim=pass (2048-bit key; unprotected) header.d=hetzner.com header.i=@hetzner.com header.a=rsa-sha256 header.s=lms2212 header.b=eIghtBHj; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:d0a:203a::1; helo=mail.hetzner.company; envelope-from=tan.siewert@hetzner.com; receiver=lists.ozlabs.org) smtp.mailfrom=hetzner.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=hetzner.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hetzner.com header.i=@hetzner.com header.a=rsa-sha256 header.s=lms2212 header.b=eIghtBHj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hetzner.com (client-ip=2a01:4f8:d0a:203a::1; helo=mail.hetzner.company; envelope-from=tan.siewert@hetzner.com; receiver=lists.ozlabs.org)
Received: from mail.hetzner.company (mail.hetzner.company [IPv6:2a01:4f8:d0a:203a::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZN3x1Zt4z2yQL
	for <openbmc@lists.ozlabs.org>; Sat, 18 Jan 2025 01:51:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hetzner.com
	; s=lms2212; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=CTOd3w4tbVo5GAhOrqMRxDh01CsEZMg9oO+KV9AHh9c=; b=eIghtB
	HjG1qAWYkA1SU1sjc8zeyPjQ3GQnqjCaZtwtCE9LMEm4NwV6gnjemSiC8pLPwk6j81IJ/D93Iyvyc
	LJ40chZ1beBcP62qaz7U9NYcwhk3D6tbQwYyWMIBG4EWUjzWnLbozWyL2y8S7n9o7evR8sH7EAKNa
	TR08zfZ9Em7Ks21MV+o/Tb1Rsc1lUfzgZCdmBy5eIc+PyoqTze7tGbYevm6RtnaFxOnNQBRE8dK64
	WmDYVtl1VEUXbKWxTXrdOoGoZFt6uEtwBdoOxVYplpMcgS1z69KUVBMpXhsVhNhtYd5Or8LLYhkE1
	l79OTXOgYJYdGIAGh6Er03fmuS8Q==;
Received: from [2a01:4f8:0:a0a7::4c:0] (helo=localhost.localdomain)
	by mail.hetzner.company with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.94.2)
	(envelope-from <tan.siewert@hetzner.com>)
	id 1tYiu4-000A1S-1q; Fri, 17 Jan 2025 10:44:36 +0100
From: Tan Siewert <tan.siewert@hetzner.com>
To: openbmc@lists.ozlabs.org,
	andrew@aj.id.au
Subject: [PATCH u-boot, v2019.04-aspeed-openbmc 10/12] misc: i2c_eeprom: store pagesize instead of pagewidth in i2c_eeprom_drv_data
Date: Fri, 17 Jan 2025 10:44:29 +0100
Message-ID: <20250117094434.16641-11-tan.siewert@hetzner.com>
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
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Tan Siewert <tan.siewert@hetzner.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Masahiro Yamada <yamada.masahiro@socionext.com>

Associate the pagesize with compatible strings, and copy it to
priv->pagesize. This is more straight-forward.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
(cherry picked from commit 0c17bb1cbe87c5b00880d3445b46c437f3f22e02)
Signed-off-by: Tan Siewert <tan.siewert@hetzner.com>
---
 drivers/misc/i2c_eeprom.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/misc/i2c_eeprom.c b/drivers/misc/i2c_eeprom.c
index 728e0fd79ab..ef5f103c98e 100644
--- a/drivers/misc/i2c_eeprom.c
+++ b/drivers/misc/i2c_eeprom.c
@@ -14,7 +14,7 @@
 
 struct i2c_eeprom_drv_data {
 	u32 size; /* size in bytes */
-	u32 pagewidth; /* pagesize = 2^pagewidth */
+	u32 pagesize; /* page size in bytes */
 	u32 addr_offset_mask; /* bits in addr used for offset overflow */
 	u32 offset_len; /* size in bytes of offset */
 };
@@ -103,7 +103,7 @@ static int i2c_eeprom_std_ofdata_to_platdata(struct udevice *dev)
 		priv->pagesize = pagesize;
 	else
 		/* 6 bit -> page size of up to 2^63 (should be sufficient) */
-		priv->pagesize = 1 << data->pagewidth;
+		priv->pagesize = data->pagesize;
 
 	if (dev_read_u32(dev, "size", &size) == 0)
 		priv->size = size;
@@ -156,98 +156,98 @@ static int i2c_eeprom_std_probe(struct udevice *dev)
 
 static const struct i2c_eeprom_drv_data eeprom_data = {
 	.size = 0,
-	.pagewidth = 0,
+	.pagesize = 1,
 	.addr_offset_mask = 0,
 	.offset_len = 1,
 };
 
 static const struct i2c_eeprom_drv_data mc24aa02e48_data = {
 	.size = 256,
-	.pagewidth = 3,
+	.pagesize = 8,
 	.addr_offset_mask = 0,
 	.offset_len = 1,
 };
 
 static const struct i2c_eeprom_drv_data atmel24c01a_data = {
 	.size = 128,
-	.pagewidth = 3,
+	.pagesize = 8,
 	.addr_offset_mask = 0,
 	.offset_len = 1,
 };
 
 static const struct i2c_eeprom_drv_data atmel24c02_data = {
 	.size = 256,
-	.pagewidth = 3,
+	.pagesize = 8,
 	.addr_offset_mask = 0,
 	.offset_len = 1,
 };
 
 static const struct i2c_eeprom_drv_data atmel24c04_data = {
 	.size = 512,
-	.pagewidth = 4,
+	.pagesize = 16,
 	.addr_offset_mask = 0x1,
 	.offset_len = 1,
 };
 
 static const struct i2c_eeprom_drv_data atmel24c08_data = {
 	.size = 1024,
-	.pagewidth = 4,
+	.pagesize = 16,
 	.addr_offset_mask = 0x3,
 	.offset_len = 1,
 };
 
 static const struct i2c_eeprom_drv_data atmel24c08a_data = {
 	.size = 1024,
-	.pagewidth = 4,
+	.pagesize = 16,
 	.addr_offset_mask = 0x3,
 	.offset_len = 1,
 };
 
 static const struct i2c_eeprom_drv_data atmel24c16a_data = {
 	.size = 2048,
-	.pagewidth = 4,
+	.pagesize = 16,
 	.addr_offset_mask = 0x7,
 	.offset_len = 1,
 };
 
 static const struct i2c_eeprom_drv_data atmel24mac402_data = {
 	.size = 256,
-	.pagewidth = 4,
+	.pagesize = 16,
 	.addr_offset_mask = 0,
 	.offset_len = 1,
 };
 
 static const struct i2c_eeprom_drv_data atmel24c32_data = {
 	.size = 4096,
-	.pagewidth = 5,
+	.pagesize = 32,
 	.addr_offset_mask = 0,
 	.offset_len = 2,
 };
 
 static const struct i2c_eeprom_drv_data atmel24c64_data = {
 	.size = 8192,
-	.pagewidth = 5,
+	.pagesize = 32,
 	.addr_offset_mask = 0,
 	.offset_len = 2,
 };
 
 static const struct i2c_eeprom_drv_data atmel24c128_data = {
 	.size = 16384,
-	.pagewidth = 6,
+	.pagesize = 64,
 	.addr_offset_mask = 0,
 	.offset_len = 2,
 };
 
 static const struct i2c_eeprom_drv_data atmel24c256_data = {
 	.size = 32768,
-	.pagewidth = 6,
+	.pagesize = 64,
 	.addr_offset_mask = 0,
 	.offset_len = 2,
 };
 
 static const struct i2c_eeprom_drv_data atmel24c512_data = {
 	.size = 65536,
-	.pagewidth = 6,
+	.pagesize = 64,
 	.addr_offset_mask = 0,
 	.offset_len = 2,
 };
-- 
2.47.0

