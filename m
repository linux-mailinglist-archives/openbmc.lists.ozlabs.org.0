Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8262A52A24E
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 14:58:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2blZ3LlKz3bwr
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 22:58:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Z5ItwttS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Z5ItwttS; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2X3Z548Xz3brH
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 20:12:10 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id n10so16927625pjh.5
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 03:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DpH1r47zBu9XBaEC3XzpZc30x8PoKwhY90v7CcNTZ9k=;
 b=Z5ItwttS8X2v/ZAv+sn2UBs+rUbd8mpv9njPTkkk+9XHTBvBT/an/BBmnhowIj9251
 zxKzu73pAWChdo5f2Dnbbf8J35VpLQSPMFBdKZuOrgifVHKCdvrLy6l7x45TZ+qw0O9L
 OwGq3gtzCoTA89I8HnfrHnw97QsA/4yAwES6ixo884qdpoaAQ25aZPbHAhwRREu1qqVA
 KSwOUyPikl5/UyWc8Zga0AcA44miLDoxuEbPI7i4S2QCq7SVdMhAV6WKrMb+T1Mky5LL
 u/G40oB/WIR8UcNvK0lRobW82WKOI6/0yoCLdDFGvTjLby/DeYkgiOLVyU9TLdvxLlTa
 Z22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DpH1r47zBu9XBaEC3XzpZc30x8PoKwhY90v7CcNTZ9k=;
 b=1x5S5xgqIzfYI4xkwsx4R2prHb3NsVQ2fCOAdd+4G0DPImk5QhYwvvwhrG4sicFlMe
 CXI9AKCcA33aOslTc1KmifF4ti93HnWwMg0cGK/nvoHKbzyXCddzC/LK2qLEuD62vQvR
 4i+xyOZRuj+ckw8P/X9OTsT4pQyyQogTYeIcLunnt2zNQ3eFsmdUaL1CIVrxKgHWrf01
 A5yHcwJr6HoIm3Ts0YQKCqPxcVSCQah1pWZwRaiL3iDKhbxEUPiwQBD5MyqLFzCBjdUw
 PW4c2y+eOA2Gd1duAHX4OaCVpp32lJsH8Fw0dX7Z4zmqH818udccP+SFqf6hpWb+8yuP
 jCeg==
X-Gm-Message-State: AOAM532NnudFFGe1LNmOjwR0RPBj1Z8GYjmM9rU3N1wWx7qX5dm8nyVv
 AvtHEVe3U5CKwRNcZUV9mg==
X-Google-Smtp-Source: ABdhPJxPxClHtFUL8QSVd7yGdwvvruXuS0eYZlJDOPgIV/8pqauSl6GgGxWOdG9omaAx+nJtsF5BPA==
X-Received: by 2002:a17:903:2411:b0:161:39ef:57f7 with SMTP id
 e17-20020a170903241100b0016139ef57f7mr18597146plo.136.1652782328365; 
 Tue, 17 May 2022 03:12:08 -0700 (PDT)
Received: from localhost (220-133-130-217.hinet-ip.hinet.net.
 [220.133.130.217]) by smtp.gmail.com with ESMTPSA id
 a29-20020a62d41d000000b0050dc7628154sm8571992pfh.46.2022.05.17.03.12.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 17 May 2022 03:12:08 -0700 (PDT)
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
Subject: [PATCH v5 07/10] i2c: npcm: Handle spurious interrupts
Date: Tue, 17 May 2022 18:11:39 +0800
Message-Id: <20220517101142.28421-8-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220517101142.28421-1-warp5tw@gmail.com>
References: <20220517101142.28421-1-warp5tw@gmail.com>
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

From: Tali Perry <tali.perry1@gmail.com>

On some platforms in rare cases (1 to 100,000 transactions),
the i2c gets a spurious interrupt which means that we enter an interrupt
but in the interrupt handler we don't find any status bit that points to
the reason we got this interrupt.

This may be a case of a rare HW issue or signal integrity issue that is
still under investigation.

In order to overcome this we are doing the following:
1. Disable incoming interrupts in master mode only when slave mode is not
   enabled.
2. Clear end of busy (EOB) after every interrupt.
3. Clear other status bits (just in case since we found them cleared)
4. Return correct status during the interrupt that will finish the
   transaction.

On next xmit transaction if the bus is still busy the master will issue a
recovery process before issuing the new transaction.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 91 ++++++++++++++++++++++----------
 1 file changed, 62 insertions(+), 29 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 58d7175f0362..5960ccde6574 100644
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
@@ -1940,10 +1958,17 @@ static int npcm_i2c_init_module(struct npcm_i2c *bus, enum i2c_mode mode,
 	val = (val | NPCM_I2CCTL1_NMINTE) & ~NPCM_I2CCTL1_RWS;
 	iowrite8(val, bus->reg + NPCM_I2CCTL1);
 
-	npcm_i2c_int_enable(bus, true);
-
 	npcm_i2c_reset(bus);
 
+	/* check HW is OK: SDA and SCL should be high at this point. */
+	if ((npcm_i2c_get_SDA(&bus->adap) == 0) || (npcm_i2c_get_SCL(&bus->adap) == 0)) {
+		dev_err(bus->dev, "I2C%d init fail: lines are low\n", bus->num);
+		dev_err(bus->dev, "SDA=%d SCL=%d\n", npcm_i2c_get_SDA(&bus->adap),
+			npcm_i2c_get_SCL(&bus->adap));
+		return -ENXIO;
+	}
+
+	npcm_i2c_int_enable(bus, true);
 	return 0;
 }
 
@@ -1991,10 +2016,14 @@ static irqreturn_t npcm_i2c_bus_irq(int irq, void *dev_id)
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
@@ -2051,7 +2080,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	u8 *write_data, *read_data;
 	u8 slave_addr;
 	unsigned long timeout;
-	int ret = 0;
 	bool read_block = false;
 	bool read_PEC = false;
 	u8 bus_busy;
@@ -2141,12 +2169,12 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
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
 
@@ -2160,26 +2188,31 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
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

