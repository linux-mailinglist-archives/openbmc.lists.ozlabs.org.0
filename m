Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC374BD505
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 06:17:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K29Xp3j6fz3bN6
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 16:17:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pGJQIb5S;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pGJQIb5S; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K1Wpp1Mrwz3bdF
 for <openbmc@lists.ozlabs.org>; Sun, 20 Feb 2022 14:57:22 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id
 gf13-20020a17090ac7cd00b001bbfb9d760eso2196263pjb.2
 for <openbmc@lists.ozlabs.org>; Sat, 19 Feb 2022 19:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Eea663Vh+A9s2Pn/PdKfDipFrDHlN+d9vfHdyhMN9pY=;
 b=pGJQIb5SWdpTs2XVBKhvXgS7lJ1mskr6rWM0mHhNPB+B7+52xcSu9OCfdBG0rZK7MS
 tOVANivdu/8DvCxVe9PBAYS54P4HmIKRY8EqZ8tWA5ZWQjtOg2nFNWrEkb37LzI5DmT2
 17ZKXZGuhVZCpoaDSUNq5iSYfjY8+LZxLOuNdcRcsJIrNIrgHKz/ByzRYuboG7y+islz
 C/FM7nvD20pmFAwAc1ASZn5U4PcrJlIuxUksG039arq4Xil3RClhy9okMSdHtTwQAKHh
 ++ag4HPG+Qzs2W3uFNAxIFbTpjII+8jqGJt1K4FJPbq1POlxoDk9LeoHOm827C1/1EnO
 HkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Eea663Vh+A9s2Pn/PdKfDipFrDHlN+d9vfHdyhMN9pY=;
 b=yM59kTHn0mgt6LHMCM3q0yBl70OWzsFb19J/cgOrkuSRv05wp9JcyZ0AADXahGiapY
 t2pQbOWmaNjNR+zGDIfj2C7KfbT5En7Z3RiBw40u8CWs0+N9e5EaoE5+xE++8IKVqalK
 xBNfa7YfIs62n7WCSdI9qc7QANa5CXSeY8GeMSpISiK6vfVQfDfEaNJcx+SttRvoG8Cs
 uRj+QEfOh8MqRQqwZmN8e9VO1X9a5JBHfZizPngm5Mw3TI6DaePbNwLPReOKFv7RIy/W
 Al55nvTB8kw8HdmmiKQXowuyA46wBqMy3HKqpBijMYxNjveaZLF/Fp4+qk/yJ43vdF2r
 oOww==
X-Gm-Message-State: AOAM532QetZXwv7Z0hvl7InwUrwX1IsRkCwW+TLx6sPmC4JLdFOsxDTn
 VKvJBTgcTfDQlsfbQzHE8A==
X-Google-Smtp-Source: ABdhPJwIHykjEeX9ufbcQ9YeqHpQTdsNFUcI4Gnd0T7jWuyVwhZnFsqSjYro6LtHv+su1zvtxjG/kw==
X-Received: by 2002:a17:902:8509:b0:14e:f9b7:6cab with SMTP id
 bj9-20020a170902850900b0014ef9b76cabmr13964923plb.162.1645329440978; 
 Sat, 19 Feb 2022 19:57:20 -0800 (PST)
Received: from localhost ([2401:e180:8842:e799:9593:a6f2:788b:a48c])
 by smtp.gmail.com with ESMTPSA id c9sm8023588pfv.70.2022.02.19.19.57.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 19 Feb 2022 19:57:20 -0800 (PST)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
 semen.protsenko@linaro.org, yangyicong@hisilicon.com, wsa@kernel.org,
 jie.deng@intel.com, sven@svenpeter.dev, bence98@sch.bme.hu,
 christophe.leroy@csgroup.eu, lukas.bulwahn@gmail.com, olof@lixom.net,
 arnd@arndb.de, digetx@gmail.com, andriy.shevchenko@linux.intel.com,
 warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
 kfting@nuvoton.com
Subject: [PATCH v2 09/11] i2c: npcm: Handle spurious interrupts
Date: Sun, 20 Feb 2022 11:53:19 +0800
Message-Id: <20220220035321.3870-10-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220220035321.3870-1-warp5tw@gmail.com>
References: <20220220035321.3870-1-warp5tw@gmail.com>
X-Mailman-Approved-At: Mon, 21 Feb 2022 16:10:35 +1100
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

In order to better handle spurious interrupts:
1. Disable incoming interrupts in master only mode.
2. Clear end of busy (EOB) after every interrupt.
3. Return correct status during interrupt.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 92 ++++++++++++++++++++++----------
 1 file changed, 63 insertions(+), 29 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 4715afcf9ac4..a265f6fdbf5c 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -564,6 +564,15 @@ static inline void npcm_i2c_nack(struct npcm_i2c *bus)
 	iowrite8(val, bus->reg + NPCM_I2CCTL1);
 }
 
+static inline void npcm_i2c_clear_master_status(struct npcm_i2c *bus)
+{
+	u8 val;
+
+	/* Clear NEGACK, STASTR and BER bits */
+	val = NPCM_I2CST_BER | NPCM_I2CST_NEGACK | NPCM_I2CST_STASTR;
+	iowrite8(val, bus->reg + NPCM_I2CST);
+}
+
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 static void npcm_i2c_slave_int_enable(struct npcm_i2c *bus, bool enable)
 {
@@ -643,8 +652,8 @@ static void npcm_i2c_reset(struct npcm_i2c *bus)
 	iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
 	iowrite8(0xFF, bus->reg + NPCM_I2CST);
 
-	/* Clear EOB bit */
-	iowrite8(NPCM_I2CCST3_EO_BUSY, bus->reg + NPCM_I2CCST3);
+	/* Clear and disable EOB */
+	npcm_i2c_eob_int(bus, false);
 
 	/* Clear all fifo bits: */
 	iowrite8(NPCM_I2CFIF_CTS_CLR_FIFO, bus->reg + NPCM_I2CFIF_CTS);
@@ -656,6 +665,9 @@ static void npcm_i2c_reset(struct npcm_i2c *bus)
 	}
 #endif
 
+	/* clear status bits for spurious interrupts */
+	npcm_i2c_clear_master_status(bus);
+
 	bus->state = I2C_IDLE;
 }
 
@@ -818,15 +830,6 @@ static void npcm_i2c_read_fifo(struct npcm_i2c *bus, u8 bytes_in_fifo)
 	}
 }
 
-static inline void npcm_i2c_clear_master_status(struct npcm_i2c *bus)
-{
-	u8 val;
-
-	/* Clear NEGACK, STASTR and BER bits */
-	val = NPCM_I2CST_BER | NPCM_I2CST_NEGACK | NPCM_I2CST_STASTR;
-	iowrite8(val, bus->reg + NPCM_I2CST);
-}
-
 static void npcm_i2c_master_abort(struct npcm_i2c *bus)
 {
 	/* Only current master is allowed to issue a stop condition */
@@ -1234,7 +1237,16 @@ static irqreturn_t npcm_i2c_int_slave_handler(struct npcm_i2c *bus)
 		ret = IRQ_HANDLED;
 	} /* SDAST */
 
-	return ret;
+	/*
+	 * if irq is not one of the above, make sure EOB is disabled and all
+	 * status bits are cleared.
+	 */
+	if (ret == IRQ_NONE) {
+		npcm_i2c_eob_int(bus, false);
+		npcm_i2c_clear_master_status(bus);
+	}
+
+	return IRQ_HANDLED;
 }
 
 static int npcm_i2c_reg_slave(struct i2c_client *client)
@@ -1470,6 +1482,9 @@ static void npcm_i2c_irq_handle_nack(struct npcm_i2c *bus)
 		npcm_i2c_eob_int(bus, false);
 		npcm_i2c_master_stop(bus);
 
+		/* Clear SDA Status bit (by reading dummy byte) */
+		npcm_i2c_rd_byte(bus);
+
 		/*
 		 * The bus is released from stall only after the SW clears
 		 * NEGACK bit. Then a Stop condition is sent.
@@ -1477,6 +1492,8 @@ static void npcm_i2c_irq_handle_nack(struct npcm_i2c *bus)
 		npcm_i2c_clear_master_status(bus);
 		readx_poll_timeout_atomic(ioread8, bus->reg + NPCM_I2CCST, val,
 					  !(val & NPCM_I2CCST_BUSY), 10, 200);
+		/* verify no status bits are still set after bus is released */
+		npcm_i2c_clear_master_status(bus);
 	}
 	bus->state = I2C_IDLE;
 
@@ -1675,10 +1692,10 @@ static int npcm_i2c_recovery_tgclk(struct i2c_adapter *_adap)
 	int              iter = 27;
 
 	if ((npcm_i2c_get_SDA(_adap) == 1) && (npcm_i2c_get_SCL(_adap) == 1)) {
-		dev_dbg(bus->dev, "bus%d recovery skipped, bus not stuck",
-			bus->num);
+		dev_dbg(bus->dev, "bus%d-0x%x recovery skipped, bus not stuck",
+			bus->num, bus->dest_addr);
 		npcm_i2c_reset(bus);
-		return status;
+		return 0;
 	}
 
 	npcm_i2c_int_enable(bus, false);
@@ -1912,6 +1929,7 @@ static int npcm_i2c_init_module(struct npcm_i2c *bus, enum i2c_mode mode,
 	    bus_freq_hz < I2C_FREQ_MIN_HZ || bus_freq_hz > I2C_FREQ_MAX_HZ)
 		return -EINVAL;
 
+	npcm_i2c_int_enable(bus, false);
 	npcm_i2c_disable(bus);
 
 	/* Configure FIFO mode : */
@@ -1940,10 +1958,18 @@ static int npcm_i2c_init_module(struct npcm_i2c *bus, enum i2c_mode mode,
 	val = (val | NPCM_I2CCTL1_NMINTE) & ~NPCM_I2CCTL1_RWS;
 	iowrite8(val, bus->reg + NPCM_I2CCTL1);
 
-	npcm_i2c_int_enable(bus, true);
-
 	npcm_i2c_reset(bus);
 
+	/* check HW is OK: SDA and SCL should be high at this point. */
+	if ((npcm_i2c_get_SDA(&bus->adap) == 0) ||
+	    (npcm_i2c_get_SCL(&bus->adap) == 0)) {
+		dev_err(bus->dev, "I2C%d init fail: lines are low", bus->num);
+		dev_err(bus->dev, "SDA=%d SCL=%d", npcm_i2c_get_SDA(&bus->adap),
+			npcm_i2c_get_SCL(&bus->adap));
+		return -ENXIO;
+	}
+
+	npcm_i2c_int_enable(bus, true);
 	return 0;
 }
 
@@ -1991,10 +2017,14 @@ static irqreturn_t npcm_i2c_bus_irq(int irq, void *dev_id)
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	if (bus->slave) {
 		bus->master_or_slave = I2C_SLAVE;
-		return npcm_i2c_int_slave_handler(bus);
+		if (npcm_i2c_int_slave_handler(bus))
+			return IRQ_HANDLED;
 	}
 #endif
-	return IRQ_NONE;
+	/* clear status bits for spurious interrupts */
+	npcm_i2c_clear_master_status(bus);
+
+	return IRQ_HANDLED;
 }
 
 static bool npcm_i2c_master_start_xmit(struct npcm_i2c *bus,
@@ -2051,7 +2081,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	u8 *write_data, *read_data;
 	u8 slave_addr;
 	unsigned long timeout;
-	int ret = 0;
 	bool read_block = false;
 	bool read_PEC = false;
 	u8 bus_busy;
@@ -2141,12 +2170,12 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	bus->read_block_use = read_block;
 
 	reinit_completion(&bus->cmd_complete);
-	if (!npcm_i2c_master_start_xmit(bus, slave_addr, nwrite, nread,
-					write_data, read_data, read_PEC,
-					read_block))
-		ret = -EBUSY;
 
-	if (ret != -EBUSY) {
+	npcm_i2c_int_enable(bus, true);
+
+	if (npcm_i2c_master_start_xmit(bus, slave_addr, nwrite, nread,
+				       write_data, read_data, read_PEC,
+				       read_block)) {
 		time_left = wait_for_completion_timeout(&bus->cmd_complete,
 							timeout);
 
@@ -2160,26 +2189,31 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 			}
 		}
 	}
-	ret = bus->cmd_err;
 
 	/* if there was BER, check if need to recover the bus: */
 	if (bus->cmd_err == -EAGAIN)
-		ret = i2c_recover_bus(adap);
+		bus->cmd_err = i2c_recover_bus(adap);
 
 	/*
 	 * After any type of error, check if LAST bit is still set,
 	 * due to a HW issue.
 	 * It cannot be cleared without resetting the module.
 	 */
-	if (bus->cmd_err &&
-	    (NPCM_I2CRXF_CTL_LAST_PEC & ioread8(bus->reg + NPCM_I2CRXF_CTL)))
+	else if (bus->cmd_err &&
+		 (NPCM_I2CRXF_CTL_LAST_PEC & ioread8(bus->reg + NPCM_I2CRXF_CTL)))
 		npcm_i2c_reset(bus);
 
+	/* after any xfer, successful or not, stall and EOB must be disabled */
+	npcm_i2c_stall_after_start(bus, false);
+	npcm_i2c_eob_int(bus, false);
+
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	/* reenable slave if it was enabled */
 	if (bus->slave)
 		iowrite8((bus->slave->addr & 0x7F) | NPCM_I2CADDR_SAEN,
 			 bus->reg + NPCM_I2CADDR1);
+#else
+	npcm_i2c_int_enable(bus, false);
 #endif
 	return bus->cmd_err;
 }
-- 
2.17.1

