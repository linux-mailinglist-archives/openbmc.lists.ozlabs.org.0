Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 274025210BC
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 11:22:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyCHL6pLCz3c8S
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 19:22:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XyB/2eRZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=XyB/2eRZ; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyCC42BrWz3bxC
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 19:18:40 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id e5so14156103pgc.5
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 02:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XjXG3xIDffeG6Yr3gXTzQxO8NbIQpwxnGSnV1qj5xi8=;
 b=XyB/2eRZEawHS09iiQroazmeq+eJ1A6yhXXPwFBy3UOUwuWSt0eJLs15p1kJ9mxmEM
 bn+gNZKsV08DgUNY2GzMPKKEj5C3Eq8T6u5ThHK3y/g7brC03MEE3z2TiUH5D25kvbLS
 L0NqAtDnkdi+X/Oc8yNbYvGm9bSzKvFOi10ObThN2uG6/CQ7kV+6Aigx4ypdvcabHyca
 9+owFz3LB3+fsXQpVDqMW65lRnapjqcl64MhRLiOqOudEmXoO/cFuSMtXxEps7Us57dP
 FkNhx6+FOjr6BMXqdyGPzXnRAybyJnVZHVsDS/YrNTfuI2xsUxgY41L/T2h938l4Zcdo
 pAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XjXG3xIDffeG6Yr3gXTzQxO8NbIQpwxnGSnV1qj5xi8=;
 b=qiIYcbFtOqDRmdmeCyDNAfoUwMXP8YP4fqEf+qWYOmV08w6zP+1vioXxmyLcBuuHrR
 SmRDqIKbXKi+HFv6HZ/iJuYTdlR6Hw9halAFCWEGo8XGaM9iI0i0ryIXx09potLJYwCv
 7eS2nMxg8185FdFz0ke6ea3XSjcpsJF1oYQ13iplxAYzIAVfXfArhVUvDwCYCFgz9L/S
 IUDE3qZXQ1DhBUh+ODxkQ2Q9H7Qdj+SLYI4Llav/8w45whPPHTcjexYr3i8hIVW3MjfK
 bzB+PgaYZv9Rc3wVJDCu5wTHRoXVu8MurIj7mliGOeV/A8q52DIw6RB8hukefs0vpa0N
 D4Vg==
X-Gm-Message-State: AOAM531QQgDobVMj8B88PnWhBYBSP77W+wJuJF8n4sqXcSmm5hmfS1j/
 Y+23KqZUiopPWJctZi7ivw==
X-Google-Smtp-Source: ABdhPJyEY0eSDutPUn94PF5hsYSBFF8DSWoK3OGhGStDrxl/Z3EdGLrCGXwnuQsb8X9SMLxzZgByxQ==
X-Received: by 2002:a63:90c7:0:b0:3c6:2bba:a5c0 with SMTP id
 a190-20020a6390c7000000b003c62bbaa5c0mr16576652pge.3.1652174316024; 
 Tue, 10 May 2022 02:18:36 -0700 (PDT)
Received: from localhost
 (2001-b011-7010-358e-c990-a8c9-85a7-1d3e.dynamic-ip6.hinet.net.
 [2001:b011:7010:358e:c990:a8c9:85a7:1d3e])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a63f112000000b003c14af50603sm9927485pgi.27.2022.05.10.02.18.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 10 May 2022 02:18:35 -0700 (PDT)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski@canonical.com, wsa@kernel.org,
 andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
 semen.protsenko@linaro.org, sven@svenpeter.dev, jie.deng@intel.com,
 jsd@semihalf.com, lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
 warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
 kfting@nuvoton.com
Subject: [PATCH v4 7/9] i2c: npcm: Handle spurious interrupts
Date: Tue, 10 May 2022 17:16:52 +0800
Message-Id: <20220510091654.8498-8-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220510091654.8498-1-warp5tw@gmail.com>
References: <20220510091654.8498-1-warp5tw@gmail.com>
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
---
 drivers/i2c/busses/i2c-npcm7xx.c | 92 ++++++++++++++++++++++----------
 1 file changed, 63 insertions(+), 29 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index e3c13f801f1a..82e600c24831 100644
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

