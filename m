Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2404AB555
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 07:58:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JscRJ44jmz30jV
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 17:58:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=P5bnYBJf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=P5bnYBJf; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JsbvY56YJz30NP
 for <openbmc@lists.ozlabs.org>; Mon,  7 Feb 2022 17:34:01 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id
 r64-20020a17090a43c600b001b8854e682eso4545600pjg.0
 for <openbmc@lists.ozlabs.org>; Sun, 06 Feb 2022 22:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+MqqM6tGyjbKjTboDXjFmiWET4pIP1qrQBFIZ6c46cU=;
 b=P5bnYBJfDsOkUTYIaJSy2VvWW6Wvh+nbRYCQSGnR2534RfjwGkvzzMq4LHkL2/jvmL
 IGGGq5CA3TPG8U3jqleottZ+CMFBfuUOjh5soppe68jXg92Z2Gq/EHXhqaSbR4TbSNjc
 Sn/dOR7lMKK9jfaaFuAfp9LrNl3FnJiYagFq/S30TNOh49id2d83TOe9VOHVhr8Nl2IR
 cbptwC0i/cY2aoZZDSP23ZLSGUaPLVRE7ZJtmdOGFoBPIzMuQ0pAx0aLHIlg2D7cxD1f
 JlGfOEXt1DSzUFGy6PJkxGN9H/9ALtDSKzXH2nD+dHDWUwX+D+it29GLEwPa5RdCVAAb
 bh4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+MqqM6tGyjbKjTboDXjFmiWET4pIP1qrQBFIZ6c46cU=;
 b=hT8TM84tRQKIMFKf0p7L2q0KQTwW8ju6ItX7CKUgBs6qnwIrKVnJdZIZa4hfbM51EU
 wsS7tU74bM62lTE85eR1Wuywo4cNEb8qzrrCmsP8F5CLhFq5+x66ncIfC/72yR/xBrbN
 lvxnvh3b79f7q3vRlANL9PMCz8UqJwReOFMWI9jhR+mwCVvgWV0SsXzQnfYRoyVfkLuy
 1C16enE7JsxfIpkALT5gQVn+JQg48af8yuuux8/A4VJnTEyQbSeteUCR9qXDr45FZJMB
 zHgif4lz7JP3olo3hsOXtB6lfFcMIRM8UKsWQUst4RdhWVOvZHXDidxSQZRjvXyMDqxJ
 J8+w==
X-Gm-Message-State: AOAM532YIG+hQJ4T1zJYAkaDjguPAMEkwJOs9hArvqsU3CpOd+/glsOz
 pDRzUgYJl4zJe+5e4+AnQw==
X-Google-Smtp-Source: ABdhPJxlUUaid24a39E6u5RfKpUrqK+tScS5xaa9m6Q/VX1CeNlx7GBM6zh5bvKdVgUmtzRktoxi6g==
X-Received: by 2002:a17:902:d641:: with SMTP id
 y1mr14826366plh.64.1644215639633; 
 Sun, 06 Feb 2022 22:33:59 -0800 (PST)
Received: from localhost ([2401:e180:8894:9737:7848:1ec7:b697:7d50])
 by smtp.gmail.com with ESMTPSA id e14sm10546295pfv.219.2022.02.06.22.33.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 06 Feb 2022 22:33:59 -0800 (PST)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
 semen.protsenko@linaro.org, yangyicong@hisilicon.com, wsa@kernel.org,
 jie.deng@intel.com, sven@svenpeter.dev, bence98@sch.bme.hu,
 lukas.bulwahn@gmail.com, arnd@arndb.de, olof@lixom.net,
 andriy.shevchenko@linux.intel.com, warp5tw@gmail.com,
 tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com
Subject: [PATCH v1 5/6] i2c: npcm: Remove own slave addresses 2:10
Date: Mon,  7 Feb 2022 14:33:37 +0800
Message-Id: <20220207063338.6570-6-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220207063338.6570-1-warp5tw@gmail.com>
References: <20220207063338.6570-1-warp5tw@gmail.com>
X-Mailman-Approved-At: Mon, 07 Feb 2022 17:54:48 +1100
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

NPCM can support up to 10 own slave addresses.
In practice, only one address is actually being used.
In order to access addresses 2 and above, need to switch
register banks. The switch needs spinlock.
To avoid using spinlock for this useless feature
removed support of SA >= 2.

Also fix returned slave event enum.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 44 +++++++++++++++++---------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 1ddf309b91a3..0af97f179af2 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -124,6 +124,8 @@ enum i2c_addr {
  * use this array to get the address or each register.
  */
 #define I2C_NUM_OWN_ADDR 10
+#define I2C_NUM_OWN_ADDR_SUPPORTED 2
+
 static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
 	NPCM_I2CADDR1, NPCM_I2CADDR2, NPCM_I2CADDR3, NPCM_I2CADDR4,
 	NPCM_I2CADDR5, NPCM_I2CADDR6, NPCM_I2CADDR7, NPCM_I2CADDR8,
@@ -393,13 +395,11 @@ static void npcm_i2c_disable(struct npcm_i2c *bus)
 	int i;
 
 	/* select bank 0 for I2C addresses */
-	npcm_i2c_select_bank(bus, I2C_BANK_0);
 
 	/* Slave addresses removal */
-	for (i = I2C_SLAVE_ADDR1; i < I2C_NUM_OWN_ADDR; i++)
+	for (i = I2C_SLAVE_ADDR1; i < I2C_NUM_OWN_ADDR_SUPPORTED; i++)
 		iowrite8(0, bus->reg + npcm_i2caddr[i]);
 
-	npcm_i2c_select_bank(bus, I2C_BANK_1);
 #endif
 	/* Disable module */
 	i2cctl2 = ioread8(bus->reg + NPCM_I2CCTL2);
@@ -604,8 +604,7 @@ static int npcm_i2c_slave_enable(struct npcm_i2c *bus, enum i2c_addr addr_type,
 			i2cctl1 &= ~NPCM_I2CCTL1_GCMEN;
 		iowrite8(i2cctl1, bus->reg + NPCM_I2CCTL1);
 		return 0;
-	}
-	if (addr_type == I2C_ARP_ADDR) {
+	} else if (addr_type == I2C_ARP_ADDR) {
 		i2cctl3 = ioread8(bus->reg + NPCM_I2CCTL3);
 		if (enable)
 			i2cctl3 |= I2CCTL3_ARPMEN;
@@ -614,16 +613,18 @@ static int npcm_i2c_slave_enable(struct npcm_i2c *bus, enum i2c_addr addr_type,
 		iowrite8(i2cctl3, bus->reg + NPCM_I2CCTL3);
 		return 0;
 	}
+	if (addr_type > I2C_SLAVE_ADDR2 && addr_type <= I2C_SLAVE_ADDR10) {
+		dev_err(bus->dev,
+			"try to enable more then 2 SA not supported\n");
+	}
 	if (addr_type >= I2C_ARP_ADDR)
 		return -EFAULT;
 	/* select bank 0 for address 3 to 10 */
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
@@ -846,15 +847,13 @@ static u8 npcm_i2c_get_slave_addr(struct npcm_i2c *bus, enum i2c_addr addr_type)
 {
 	u8 slave_add;
 
-	/* select bank 0 for address 3 to 10 */
-	if (addr_type > I2C_SLAVE_ADDR2)
-		npcm_i2c_select_bank(bus, I2C_BANK_0);
+	if (addr_type > I2C_SLAVE_ADDR2 && addr_type <= I2C_SLAVE_ADDR10) {
+		dev_err(bus->dev,
+			"get slave: try to use more then 2 slave addresses not supported\n");
+	}
 
 	slave_add = ioread8(bus->reg + npcm_i2caddr[(int)addr_type]);
 
-	if (addr_type > I2C_SLAVE_ADDR2)
-		npcm_i2c_select_bank(bus, I2C_BANK_1);
-
 	return slave_add;
 }
 
@@ -864,12 +863,12 @@ static int npcm_i2c_remove_slave_addr(struct npcm_i2c *bus, u8 slave_add)
 
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
 
@@ -924,11 +923,15 @@ static int npcm_i2c_slave_get_wr_buf(struct npcm_i2c *bus)
 	for (i = 0; i < I2C_HW_FIFO_SIZE; i++) {
 		if (bus->slv_wr_size >= I2C_HW_FIFO_SIZE)
 			break;
-		i2c_slave_event(bus->slave, I2C_SLAVE_READ_REQUESTED, &value);
+		if (bus->state == I2C_SLAVE_MATCH) {
+			i2c_slave_event(bus->slave, I2C_SLAVE_READ_REQUESTED, &value);
+			bus->state = I2C_OPER_STARTED;
+		} else {
+			i2c_slave_event(bus->slave, I2C_SLAVE_READ_PROCESSED, &value);
+		}
 		ind = (bus->slv_wr_ind + bus->slv_wr_size) % I2C_HW_FIFO_SIZE;
 		bus->slv_wr_buf[ind] = value;
 		bus->slv_wr_size++;
-		i2c_slave_event(bus->slave, I2C_SLAVE_READ_PROCESSED, &value);
 	}
 	return I2C_HW_FIFO_SIZE - ret;
 }
@@ -976,7 +979,6 @@ static void npcm_i2c_slave_xmit(struct npcm_i2c *bus, u16 nwrite,
 	if (nwrite == 0)
 		return;
 
-	bus->state = I2C_OPER_STARTED;
 	bus->operation = I2C_WRITE_OPER;
 
 	/* get the next buffer */
-- 
2.17.1

