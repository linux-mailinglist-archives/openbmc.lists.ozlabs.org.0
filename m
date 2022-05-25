Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E545335C5
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 05:25:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7Gg30PGlz2xKh
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 13:25:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fNBFiUKl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fNBFiUKl; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7GdL3Wtqz3bbV
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2022 13:24:22 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id 31so17840999pgp.8
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 20:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wHBp9QnqH/tjk3SXwINVbP3RweD3cBoDf4EfzPLLtdI=;
 b=fNBFiUKlpKIxyGJZvI0uX+HBUBj+QfngKb8DmXACjcba45H7uzizIr8jCBbXk6HpJv
 EkwruyuWEGhCyE5vmZ6GJChN8dJcmhKDzAB7QUuwyeznTcMp+AUaCAEH3F1VvGJglyrW
 2KT0+/XWKurwchH5Vc9GOPMo6zNmhOTRHs8/+kmEVJGtbNfFRGujZMI6EJrKrafrb7x1
 h09jkoXzq53WMBZjc0nhspW2x3HteiOZEZ3x2kXjpQzxTwvhOU3qi9EAAH2sP3mjC07N
 9fzH/GFkL1aGOCP+V1S/4D2IK3DHj7pEj6WrloC42k9BdE+3kbel7kTAfhbzTukEOeGu
 94wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wHBp9QnqH/tjk3SXwINVbP3RweD3cBoDf4EfzPLLtdI=;
 b=PgfWpbzNFa01s51fQ4TAc/1qUw5oWNCBSBvMVJ2NHyOTSC6bGg4fs+LKxyGsBIxvtB
 tOzMkJ3VolljMN1YwlN4mgHqQVhIX/akfF376Oy1eZgwMEDWIBRlXN0t6wvjfKBjrpfB
 qDAu29Ii5fVSYcoYWi3fI0Ge60kbtpHMOyM0F6TRqt8OYv4MuM12ndYfePdxHD8DQYv7
 7iHATL/TwDrjrZP3ir1QJ4hOdhacsUmAePvqGWcnwhe1/1fTsiAhhCjNTONsAVPkuf/z
 soP8REP3x0AlhqgzPupR4g4+yeG1owGc0OS5KJQJVLmrEOeGGDSQmsCUZwvWeFAIaYuv
 QoRw==
X-Gm-Message-State: AOAM532eDtmx5zdvEQUe5r/RcZeRGEz3fKV+WGqPfW4fOZ/7RhECOUPM
 qpuvIlPTpMy9gkcL7R1WrQ==
X-Google-Smtp-Source: ABdhPJxa8vJIr5qyiq99KNOmQoXdVeta0mlKAEHonS3Wg0JV3UGwIJ2FjdIKoBhvdIqTXlSP8WhU2w==
X-Received: by 2002:a63:2117:0:b0:3c2:85f9:1b6f with SMTP id
 h23-20020a632117000000b003c285f91b6fmr26742199pgh.66.1653449060045; 
 Tue, 24 May 2022 20:24:20 -0700 (PDT)
Received: from localhost (220-133-130-217.hinet-ip.hinet.net.
 [220.133.130.217]) by smtp.gmail.com with ESMTPSA id
 gx3-20020a17090b124300b001df6ccdf3f6sm461772pjb.47.2022.05.24.20.24.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 24 May 2022 20:24:19 -0700 (PDT)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, wsa@kernel.org,
 andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
 semen.protsenko@linaro.org, jie.deng@intel.com, jsd@semihalf.com,
 sven@svenpeter.dev, lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
 warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
 kfting@nuvoton.com
Subject: [PATCH v6 2/5] i2c: npcm: Remove own slave addresses 2:10
Date: Wed, 25 May 2022 11:23:38 +0800
Message-Id: <20220525032341.3182-3-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220525032341.3182-1-warp5tw@gmail.com>
References: <20220525032341.3182-1-warp5tw@gmail.com>
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

From: Tali Perry <tali.perry1@gmail.com>

NPCM can support up to 10 own slave addresses. In practice, only one
address is actually being used. In order to access addresses 2 and above,
need to switch register banks. The switch needs spinlock.
To avoid using spinlock for this useless feature removed support of SA >=
2. Also fix returned slave event enum.

Remove some comment since the bank selection is not required. The bank
selection is not required since the supported slave addresses are reduced.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 41 +++++++++++++-------------------
 1 file changed, 16 insertions(+), 25 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 5960ccde6574..b5cc83e51029 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -123,11 +123,11 @@ enum i2c_addr {
  * Since the addr regs are sprinkled all over the address space,
  * use this array to get the address or each register.
  */
-#define I2C_NUM_OWN_ADDR 10
+#define I2C_NUM_OWN_ADDR 2
+#define I2C_NUM_OWN_ADDR_SUPPORTED 2
+
 static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
-	NPCM_I2CADDR1, NPCM_I2CADDR2, NPCM_I2CADDR3, NPCM_I2CADDR4,
-	NPCM_I2CADDR5, NPCM_I2CADDR6, NPCM_I2CADDR7, NPCM_I2CADDR8,
-	NPCM_I2CADDR9, NPCM_I2CADDR10,
+	NPCM_I2CADDR1, NPCM_I2CADDR2,
 };
 #endif
 
@@ -392,14 +392,10 @@ static void npcm_i2c_disable(struct npcm_i2c *bus)
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	int i;
 
-	/* select bank 0 for I2C addresses */
-	npcm_i2c_select_bank(bus, I2C_BANK_0);
-
 	/* Slave addresses removal */
-	for (i = I2C_SLAVE_ADDR1; i < I2C_NUM_OWN_ADDR; i++)
+	for (i = I2C_SLAVE_ADDR1; i < I2C_NUM_OWN_ADDR_SUPPORTED; i++)
 		iowrite8(0, bus->reg + npcm_i2caddr[i]);
 
-	npcm_i2c_select_bank(bus, I2C_BANK_1);
 #endif
 	/* Disable module */
 	i2cctl2 = ioread8(bus->reg + NPCM_I2CCTL2);
@@ -604,8 +600,7 @@ static int npcm_i2c_slave_enable(struct npcm_i2c *bus, enum i2c_addr addr_type,
 			i2cctl1 &= ~NPCM_I2CCTL1_GCMEN;
 		iowrite8(i2cctl1, bus->reg + NPCM_I2CCTL1);
 		return 0;
-	}
-	if (addr_type == I2C_ARP_ADDR) {
+	} else if (addr_type == I2C_ARP_ADDR) {
 		i2cctl3 = ioread8(bus->reg + NPCM_I2CCTL3);
 		if (enable)
 			i2cctl3 |= I2CCTL3_ARPMEN;
@@ -614,16 +609,16 @@ static int npcm_i2c_slave_enable(struct npcm_i2c *bus, enum i2c_addr addr_type,
 		iowrite8(i2cctl3, bus->reg + NPCM_I2CCTL3);
 		return 0;
 	}
+	if (addr_type > I2C_SLAVE_ADDR2 && addr_type <= I2C_SLAVE_ADDR10)
+		dev_err(bus->dev, "try to enable more than 2 SA not supported\n");
+
 	if (addr_type >= I2C_ARP_ADDR)
 		return -EFAULT;
-	/* select bank 0 for address 3 to 10 */
-	if (addr_type > I2C_SLAVE_ADDR2)
-		npcm_i2c_select_bank(bus, I2C_BANK_0);
+
 	/* Set and enable the address */
 	iowrite8(sa_reg, bus->reg + npcm_i2caddr[addr_type]);
 	npcm_i2c_slave_int_enable(bus, enable);
-	if (addr_type > I2C_SLAVE_ADDR2)
-		npcm_i2c_select_bank(bus, I2C_BANK_1);
+
 	return 0;
 }
 #endif
@@ -846,15 +841,11 @@ static u8 npcm_i2c_get_slave_addr(struct npcm_i2c *bus, enum i2c_addr addr_type)
 {
 	u8 slave_add;
 
-	/* select bank 0 for address 3 to 10 */
-	if (addr_type > I2C_SLAVE_ADDR2)
-		npcm_i2c_select_bank(bus, I2C_BANK_0);
+	if (addr_type > I2C_SLAVE_ADDR2 && addr_type <= I2C_SLAVE_ADDR10)
+		dev_err(bus->dev, "get slave: try to use more than 2 SA not supported\n");
 
 	slave_add = ioread8(bus->reg + npcm_i2caddr[(int)addr_type]);
 
-	if (addr_type > I2C_SLAVE_ADDR2)
-		npcm_i2c_select_bank(bus, I2C_BANK_1);
-
 	return slave_add;
 }
 
@@ -864,12 +855,12 @@ static int npcm_i2c_remove_slave_addr(struct npcm_i2c *bus, u8 slave_add)
 
 	/* Set the enable bit */
 	slave_add |= 0x80;
-	npcm_i2c_select_bank(bus, I2C_BANK_0);
-	for (i = I2C_SLAVE_ADDR1; i < I2C_NUM_OWN_ADDR; i++) {
+
+	for (i = I2C_SLAVE_ADDR1; i < I2C_NUM_OWN_ADDR_SUPPORTED; i++) {
 		if (ioread8(bus->reg + npcm_i2caddr[i]) == slave_add)
 			iowrite8(0, bus->reg + npcm_i2caddr[i]);
 	}
-	npcm_i2c_select_bank(bus, I2C_BANK_1);
+
 	return 0;
 }
 
-- 
2.17.1

