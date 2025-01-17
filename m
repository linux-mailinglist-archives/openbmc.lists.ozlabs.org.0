Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5A3A16681
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2025 07:00:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yc05X72sqz3055
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2025 16:58:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:d0a:203a::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737107084;
	cv=none; b=d8Q8yCAeER6jnesPL74RROKTiC5pkd9VupstantBIclN/eNj+swb7s8GGZFLpMN2hY8uzN73mMvNXSEi60pcyDrBggYT9AdekdYRZmIesPckE6/S5oXfuAF1RmSwYsT53y+cXOJ6V8k3pd08wrdE6TQQX5RgZo9gmNGAO6iluKn1B/V3Fviftv6FQN4GhaNpbkrp5VUHHUBdlg0d4pGjCOwQ5i9nn6tKcv1FaxTZMgWwWQQUtBgFz5Mwo/lwFfgSMOTTy2GFybNkLoy5HJoC2Kp5+FBZujxQ3kJfstgnCESmDSiL5tlH3AbZmAnAoWTAgpSlgITg1RlMWSnF/YrkfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737107084; c=relaxed/relaxed;
	bh=W4GiYbiBCn8Fq2A3KryNO0oxA9LPc1vyyzAsa1FSUFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WTwKHE/IQZuwCpAftOiLvF1qIcy9sW7fJKf1Gv+tjgtHutDx4i4p1Nj+AWDEhFmEO3h1zkroZoRVexm9oTkeYgpOOOlyfdBcV+uMIxmwaoaQTqxO8Gv56vuVKkeEDI+FX2QwrRyZ3FQjsoJLW52aW0RMMt+6Ehg4OzBz7VnFE6OPuABRKSmn8ROcVdY55oAeIzQvBaUa3qDiEB5lq88qYBU6fzT9/vXe1FTvH/DhUJY77GL74kKiryL2A4DYpW9dXOv8Pfe9A4YrTn+ffrkEjm2tlnrNbWcTI0mOVzfvhXhyIbGW+cBHn3JeOyhsoG04GMSUfNg4+aGQx01vZ6tfXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=hetzner.com; dkim=pass (2048-bit key; unprotected) header.d=hetzner.com header.i=@hetzner.com header.a=rsa-sha256 header.s=lms2212 header.b=wLd1iG5K; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:d0a:203a::1; helo=mail.hetzner.company; envelope-from=tan.siewert@hetzner.com; receiver=lists.ozlabs.org) smtp.mailfrom=hetzner.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=hetzner.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hetzner.com header.i=@hetzner.com header.a=rsa-sha256 header.s=lms2212 header.b=wLd1iG5K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hetzner.com (client-ip=2a01:4f8:d0a:203a::1; helo=mail.hetzner.company; envelope-from=tan.siewert@hetzner.com; receiver=lists.ozlabs.org)
Received: from mail.hetzner.company (mail.hetzner.company [IPv6:2a01:4f8:d0a:203a::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZFFQ3LLbz3ck2
	for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2025 20:44:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hetzner.com
	; s=lms2212; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=W4GiYbiBCn8Fq2A3KryNO0oxA9LPc1vyyzAsa1FSUFI=; b=wLd1iG
	5KTM1LhulEqCsvAOTE+DYJdfq8Hb2xRoDZ73wDVQ530ZEsogOkLNGdTND1D0F0ZFMDDyDWZ8TpA6F
	Xaw39SaGCB6DS6ZAn6G4CkN1F+LZPEbdavc4+v/ke1nIkeIvneTsYOJF+vKlVYimJeQyN+5KYuzsy
	Vvwdp10qIEQelgcVImlqahIErX0/HuusXf9+HtJY73egC1elAOA1TCazFmUcFhGa+FEJW4E4/zmkL
	ZEiF8QX6woBoCisadMLtqFS66QX9dTv/hHU6C9/ooNMW5kO2SeXhx9bKvnCcTBvlq48MRdYZvt15/
	yTSOK/ZUWrBQl1S2QGFviIEBGFCw==;
Received: from [2a01:4f8:0:a0a7::4c:0] (helo=localhost.localdomain)
	by mail.hetzner.company with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.94.2)
	(envelope-from <tan.siewert@hetzner.com>)
	id 1tYiu3-000A1S-Tp; Fri, 17 Jan 2025 10:44:35 +0100
From: Tan Siewert <tan.siewert@hetzner.com>
To: openbmc@lists.ozlabs.org,
	andrew@aj.id.au
Subject: [PATCH u-boot, v2019.04-aspeed-openbmc 09/12] misc: i2c_eeprom: remove pagewidth field from i2c_eeprom
Date: Fri, 17 Jan 2025 10:44:28 +0100
Message-ID: <20250117094434.16641-10-tan.siewert@hetzner.com>
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

This struct member is not used in any effective way. Remove it.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
(cherry picked from commit ed6dd4e460bd94150dc09fce547a27e2fcca66eb)
Signed-off-by: Tan Siewert <tan.siewert@hetzner.com>
---
 drivers/misc/i2c_eeprom.c | 8 +++-----
 include/i2c_eeprom.h      | 2 --
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/i2c_eeprom.c b/drivers/misc/i2c_eeprom.c
index 6c0459dc555..728e0fd79ab 100644
--- a/drivers/misc/i2c_eeprom.c
+++ b/drivers/misc/i2c_eeprom.c
@@ -99,13 +99,11 @@ static int i2c_eeprom_std_ofdata_to_platdata(struct udevice *dev)
 	u32 pagesize;
 	u32 size;
 
-	if (dev_read_u32(dev, "pagesize", &pagesize) == 0) {
+	if (dev_read_u32(dev, "pagesize", &pagesize) == 0)
 		priv->pagesize = pagesize;
-	} else {
+	else
 		/* 6 bit -> page size of up to 2^63 (should be sufficient) */
-		priv->pagewidth = data->pagewidth;
-		priv->pagesize = (1 << priv->pagewidth);
-	}
+		priv->pagesize = 1 << data->pagewidth;
 
 	if (dev_read_u32(dev, "size", &size) == 0)
 		priv->size = size;
diff --git a/include/i2c_eeprom.h b/include/i2c_eeprom.h
index b96254ae79f..cd620d519fc 100644
--- a/include/i2c_eeprom.h
+++ b/include/i2c_eeprom.h
@@ -16,8 +16,6 @@ struct i2c_eeprom_ops {
 struct i2c_eeprom {
 	/* The EEPROM's page size in byte */
 	unsigned long pagesize;
-	/* The EEPROM's page width in bits (pagesize = 2^pagewidth) */
-	unsigned pagewidth;
 	/* The EEPROM's capacity in bytes */
 	unsigned long size;
 };
-- 
2.47.0

