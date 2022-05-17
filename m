Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EF652A239
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 14:58:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2bkt1vFSz3c7J
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 22:57:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QGDr7Glp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=QGDr7Glp; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2X3Y0NFnz3bqk
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 20:12:08 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id l11so16505245pgt.13
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 03:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zomvFyKwvw6sl1NdObv6Lxmz7g2O8ob0ad1FOsoR+M0=;
 b=QGDr7GlpRtohqnEqHu9NzhS/DN2bjl9VDao1H9pGnSW7NQ1+ZU/kvpuuszSkLE/XS/
 vgXfS5vpbQHyvDVgyjeewc1ALxm1roslp4B6HUnfwqmEApI6g7mJ3bywifFn8ufCTgIn
 bRdvyg2BFue0am5FIkv+cjwQdelM7ANsNh+Y1L20fOy0SWwoV/bCKotMfL+tgGRV2mIf
 ugzf4KUSSjWl3KKmDUEjErxGBmEi6H+8kTpPei8cCM7k7YLf/0SPQgg89eMUR70siRFp
 Ej/NFy+rCGg4VH5ZiwjCXbIsAGPGIBfEhC2/+QoOMqIsxN4sqU9jSnRoWS0rLZtdtiiv
 kj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zomvFyKwvw6sl1NdObv6Lxmz7g2O8ob0ad1FOsoR+M0=;
 b=e6Ib4wj1JIFlqC264o3uv6GG3D2rbDmiC1HWilEwHfwmszHnNpTaSnfpeX1KCRYULV
 c5xGmlgbtAVciip5tJJZKxvB8LnirLt40JVmo0ALJXtejU0Ybf2J2RNLcDfTPRXRuWPA
 9FrwfUcvOLh4fxc8lYXmsyIOfjZ9V2sA7DKRqNV0qqDiIRrs2zMn4EpzVhnWSehAcGxK
 DQJHS/zlPELyKA9JtXIiUWMKt+ZFOCt7rk8861rCAouFQpiFU8/e+G4buI1iIpQTwivt
 9iBa8Nrsfltk/O19JeulL8KtDGmJCdGSXwYBuEUO7+i3XIRKz9lDlGOAZJEQH+aQQQvq
 eSNw==
X-Gm-Message-State: AOAM532sDmZQZ5yDPkYheraoVKHXMZ1sSkDlIzuDhEC+kQT9wRs7Eink
 dOrGD4fGx+BIUI1BqRJPfw==
X-Google-Smtp-Source: ABdhPJyEh0IIwPL85FUQMFt25TSsOVEFYpJ+H5cN9UppcTkM+ikonG1TwLiLRF3hTllzsaIHCB7DiA==
X-Received: by 2002:a65:4007:0:b0:3c6:c6e2:1ccc with SMTP id
 f7-20020a654007000000b003c6c6e21cccmr18499757pgp.500.1652782326658; 
 Tue, 17 May 2022 03:12:06 -0700 (PDT)
Received: from localhost (220-133-130-217.hinet-ip.hinet.net.
 [220.133.130.217]) by smtp.gmail.com with ESMTPSA id
 b1-20020a056a000a8100b0050dc76281c1sm8628069pfl.155.2022.05.17.03.12.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 17 May 2022 03:12:06 -0700 (PDT)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, wsa@kernel.org,
 andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
 semen.protsenko@linaro.org, rafal@milecki.pl, sven@svenpeter.dev,
 jsd@semihalf.com, jie.deng@intel.com, lukas.bulwahn@gmail.com,
 arnd@arndb.de, olof@lixom.net, warp5tw@gmail.com, tali.perry@nuvoton.com,
 Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com,
 JJLIU0@nuvoton.com, kfting@nuvoton.com
Subject: [PATCH v5 06/10] i2c: npcm: Correct register access width
Date: Tue, 17 May 2022 18:11:38 +0800
Message-Id: <20220517101142.28421-7-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220517101142.28421-1-warp5tw@gmail.com>
References: <20220517101142.28421-1-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 17 May 2022 22:52:11 +1000
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tyrone Ting <kfting@nuvoton.com>

The SMBnCTL3 register is 8-bit wide and the 32-bit access was always
incorrect, but simply didn't cause a visible error on the 32-bit machine.

On the 64-bit machine, the kernel message reports that ESR value is
0x96000021. Checking Arm Architecture Reference Manual Armv8 suggests that
it's the alignment fault.

SMBnCTL3's address is 0xE.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 36f8aa7ab106..58d7175f0362 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -360,14 +360,14 @@ static int npcm_i2c_get_SCL(struct i2c_adapter *_adap)
 {
 	struct npcm_i2c *bus = container_of(_adap, struct npcm_i2c, adap);
 
-	return !!(I2CCTL3_SCL_LVL & ioread32(bus->reg + NPCM_I2CCTL3));
+	return !!(I2CCTL3_SCL_LVL & ioread8(bus->reg + NPCM_I2CCTL3));
 }
 
 static int npcm_i2c_get_SDA(struct i2c_adapter *_adap)
 {
 	struct npcm_i2c *bus = container_of(_adap, struct npcm_i2c, adap);
 
-	return !!(I2CCTL3_SDA_LVL & ioread32(bus->reg + NPCM_I2CCTL3));
+	return !!(I2CCTL3_SDA_LVL & ioread8(bus->reg + NPCM_I2CCTL3));
 }
 
 static inline u16 npcm_i2c_get_index(struct npcm_i2c *bus)
-- 
2.17.1

