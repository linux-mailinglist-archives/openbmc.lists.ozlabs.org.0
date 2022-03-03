Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9574CB946
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 09:39:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8PXd6p41z2yP9
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 19:38:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FxYLMMbz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FxYLMMbz; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8PNs2vgcz3byj
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 19:32:13 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id w37so3900806pga.7
 for <openbmc@lists.ozlabs.org>; Thu, 03 Mar 2022 00:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0GWB2R2tj9cQyYxYQpEaLLWh5AYJ8mREWRMwTFH1ZY8=;
 b=FxYLMMbzHjZCUkl3rR5/1QqA3E5oRmGNjHjq8lKNFEWtkeoeiYSKqHlTAOt45cD38/
 Aab+jquT9cH6O5GsfmZXWEK0tj4oHkou1bktYoKw+06HyL3eWSiw+oLWPMs7mn3Z0tSF
 nqK+gVxCgNwvee4xhJiyp/dvUvYiYB2dx1CC0W8bOAzRULUkVs2fSqUbZZfLo4ZMsqfg
 j8RFPX82yJhBeBIgf3BF8Z2d+MtgDEtJqHVZN46F7zFat9OilnoPAPRedyE3A1yu77J9
 m02OHGSoNGALvVsunzaxX4YW4hQxotzY7fLFoWy94NA6KfUtH+l84Hkg1L6DRSvijUvW
 YYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0GWB2R2tj9cQyYxYQpEaLLWh5AYJ8mREWRMwTFH1ZY8=;
 b=HiWAIOIP5nVjxBkMiGlXLWlka5Gd9s3OnU5n6dBHEZnAI7xPd2xhImJ+EnxG5XR87n
 AwPiE5SK80VnDPXNnjZbGrCXdNm5BqXgiAcci2zmnge0DBm3YK4ytVUUlQeJF8V3OVzA
 zEf/eGt/wi1RBpKpIfCZXvJ+DG6IoAzsoHIPLOSJb3fsxO8+aCRbq1iVaIHDV01el85t
 lTAU0dOIOyJXpTjCoOdS2I5cTwE4+8m4FhAmf8gP5vKZz8jaEgurB9gyS56Z++YZRZ36
 NEyRQyQskmsNJbfLTzTXYQHP872+REqkjNdg0bTMs26eXf7rdfE4DbiITwje8QodXVsw
 XChQ==
X-Gm-Message-State: AOAM530PxyhFU1fUVWKXGuEwiWlV8HL7YamGIQGRPrhMtqopXAOjA2AO
 YZhXrDuY1EzTSbJyVR5gyA==
X-Google-Smtp-Source: ABdhPJzFFn5ZMGXbHeUPbEODBqzFHOZcSd58iz5bXuoRLOWpK1iT8DJtw91DEDG0+vDmmU1yS56Tng==
X-Received: by 2002:a05:6a00:134c:b0:4bc:9423:96b2 with SMTP id
 k12-20020a056a00134c00b004bc942396b2mr37102122pfu.45.1646296332298; 
 Thu, 03 Mar 2022 00:32:12 -0800 (PST)
Received: from localhost ([2401:e180:8860:3b30:e4a0:392a:996e:c525])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a056a00244300b004bc9397d3d0sm1578143pfj.103.2022.03.03.00.32.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 03 Mar 2022 00:32:12 -0800 (PST)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
 yangyicong@hisilicon.com, semen.protsenko@linaro.org, wsa@kernel.org,
 jie.deng@intel.com, sven@svenpeter.dev, bence98@sch.bme.hu,
 lukas.bulwahn@gmail.com, arnd@arndb.de, olof@lixom.net,
 andriy.shevchenko@linux.intel.com, warp5tw@gmail.com,
 tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com
Subject: [PATCH v3 10/11] i2c: npcm: Remove own slave addresses 2:10
Date: Thu,  3 Mar 2022 16:31:40 +0800
Message-Id: <20220303083141.8742-11-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303083141.8742-1-warp5tw@gmail.com>
References: <20220303083141.8742-1-warp5tw@gmail.com>
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

Remove some comment since the bank selection is not
required. The bank selection is not required since
the supported slave addresses are reduced.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 46 ++++++++++++++++----------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 73cef76127c9..5c0bbc134f9d 100644
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
@@ -392,14 +394,10 @@ static void npcm_i2c_disable(struct npcm_i2c *bus)
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
@@ -604,8 +602,7 @@ static int npcm_i2c_slave_enable(struct npcm_i2c *bus, enum i2c_addr addr_type,
 			i2cctl1 &= ~NPCM_I2CCTL1_GCMEN;
 		iowrite8(i2cctl1, bus->reg + NPCM_I2CCTL1);
 		return 0;
-	}
-	if (addr_type == I2C_ARP_ADDR) {
+	} else if (addr_type == I2C_ARP_ADDR) {
 		i2cctl3 = ioread8(bus->reg + NPCM_I2CCTL3);
 		if (enable)
 			i2cctl3 |= I2CCTL3_ARPMEN;
@@ -614,16 +611,18 @@ static int npcm_i2c_slave_enable(struct npcm_i2c *bus, enum i2c_addr addr_type,
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
@@ -846,15 +845,13 @@ static u8 npcm_i2c_get_slave_addr(struct npcm_i2c *bus, enum i2c_addr addr_type)
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
 
@@ -864,12 +861,12 @@ static int npcm_i2c_remove_slave_addr(struct npcm_i2c *bus, u8 slave_add)
 
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
 
@@ -924,11 +921,15 @@ static int npcm_i2c_slave_get_wr_buf(struct npcm_i2c *bus)
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
@@ -976,7 +977,6 @@ static void npcm_i2c_slave_xmit(struct npcm_i2c *bus, u16 nwrite,
 	if (nwrite == 0)
 		return;
 
-	bus->state = I2C_OPER_STARTED;
 	bus->operation = I2C_WRITE_OPER;
 
 	/* get the next buffer */
-- 
2.17.1

