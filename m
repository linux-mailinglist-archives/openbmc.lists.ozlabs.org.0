Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4E54CB933
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 09:38:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8PWW1Rqdz3c12
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 19:37:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Kgsi7iUY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Kgsi7iUY; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8PNq1bMZz3c2C
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 19:32:11 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id
 z12-20020a17090ad78c00b001bf022b69d6so3068093pju.2
 for <openbmc@lists.ozlabs.org>; Thu, 03 Mar 2022 00:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qOEfOSH6mq1w9Hu4uBFPzuICi7f6vzZi0+0B/HT6/pg=;
 b=Kgsi7iUYno4LkDba06GQU72hXPZjVynObjMYfMpDcqVR0V/bCVDEn+bd969mDIn7wu
 sHkVuYFtrmUIA0A1svf0d19ASEMB6oXvjJEX2dWISEwW1dnqLtIb/hRqxDfitV5+dba3
 xE45VZ4OO5/hpnKNe59mO6wFOJ3qvw6swtQH3XP5DGnQgK5KdE+CFOmNuVFogfAt5zDD
 X+NYAZi9GUDZkthp3EbYUDKRy+r1d0gyFjnuOLyclL+Pv4fNzBh4KSAP8xoEAT+wjGaO
 6nPg4Qllvp6w4PYslOH7GG0MObp2q5YXwYMpplTe0zhURT6NNRvjJpix6PlUQTPk9wc5
 +TuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qOEfOSH6mq1w9Hu4uBFPzuICi7f6vzZi0+0B/HT6/pg=;
 b=6U3H0wp8Zy7AKGqFDdhXd//XLM3RjT8n54BcpZIXVkwBpaqJikANNqyMoxL7ZYUQnG
 as/xFZORuVzhXzRG5/MzOEjVTgV6kG5xzipnoDYzYP54zSpYQIJJ8iXe0yiLABGE7gU1
 qZ6cpKl0D5f21R/cHMa9mhGUxNJvlOyNWuMHQYl4j8RhHkri2rdwYKMHlm00ruIczZQb
 U5B8bSuystaL/6zWxuYocDSUlwIXDaSa7OaSxfh6qAtH8p224GWVnachLVmzFLqZINN0
 MpAYe4RzGp511LzpgjO+OLM3gy/GrZ5xu2iB/azOG6lKYdS7rWHYKlP8fmpy7XMSxIWK
 2+mQ==
X-Gm-Message-State: AOAM532RnciamJ5EfKt7SOQ2bAsBXqV3G/U6q2XBgm9W3wPYWa5g+AlE
 wTy79pyzIKIT+Ov4rg8fpw==
X-Google-Smtp-Source: ABdhPJyYVuzqJUWtRo80Jcyw0IREP0E7L5pdM3JLUCPEUh7W/N00fPKcJsbt9DXhAis7ZsLSYvQHIQ==
X-Received: by 2002:a17:902:cec1:b0:14f:d4d3:58c0 with SMTP id
 d1-20020a170902cec100b0014fd4d358c0mr34994882plg.62.1646296330029; 
 Thu, 03 Mar 2022 00:32:10 -0800 (PST)
Received: from localhost ([2401:e180:8860:3b30:e4a0:392a:996e:c525])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a63f94b000000b00373c5319642sm1335011pgk.93.2022.03.03.00.32.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 03 Mar 2022 00:32:09 -0800 (PST)
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
Subject: [PATCH v3 09/11] i2c: npcm: Handle spurious interrupts
Date: Thu,  3 Mar 2022 16:31:39 +0800
Message-Id: <20220303083141.8742-10-warp5tw@gmail.com>
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
index 66532c680338..73cef76127c9 100644
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

