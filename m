Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5850A26110
	for <lists+openbmc@lfdr.de>; Mon,  3 Feb 2025 18:13:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YmtMj4LY5z3vqy
	for <lists+openbmc@lfdr.de>; Tue,  4 Feb 2025 04:12:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.199.177.27
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738602716;
	cv=none; b=UXVR8fY5PD6ET4MS+IUjua/xuPuPJHf4bPETSu+gv76NlpmgwYJi8ppkWUOUO3x8wwIevYKO5zdobH3sz4KmFsnJQDC9vLppjaCGn1bJ1WiMHUr4Ckt6WLGQoDeLPpRW98AAN8dvQEqffajm4T/sXSKPT6TTyjjOE8W7wWYuKeRv0dJH78zEtOxZIYFb8TfemkoS9nc5IhdaHbxcRMLU6U95pG9vuSkzHUktU0dsBiSvrQDgaDKaTqUZg1NTCP5p8qFW1UGHCbQd9HVhrDlWiwthBmOUCcsVAFpKI2VvMFHa26ZONhdDX4qs/GRF2nZMDZcWk5mdCtSNDiC0lPbx9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738602716; c=relaxed/relaxed;
	bh=kmuQgi79lF688NYeGFUbnfblDpQENl9sh5zBdZKGYdw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NZqwRcDCaQKPGLqZqMwnHeEr96syJjiyVem9Rl0ZHSNFSUARBNv/WwRpvNzJ7HG+XoVi9Wmapcc5//YRrVojjxa8IucQHerQGWbL6ZCsX1WvCS8a1blX+d9WVrGUDHKywjQ4BGcOtdTk1VgDQNsAGM6jLrnHZtJ2qtNw4E4kgltMb4ZM4R4C8GLD0N+zFDnOuj0JP9e/R8DFwKqjMUAPMlcDnls8mKgJp/JmaiYW715qKB09Oi61fZy42117AgHvip49bFF/cAPNWrPBdJZXgbSUvAftxikJcQfLFm5HD8xdbb0XiLhgBup3EQi4ViiXhqZFQ9O6eKonTayRq1l8vg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org) smtp.mailfrom=taln60.nuvoton.co.il
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YmtMZ2Db7z3g88
	for <openbmc@lists.ozlabs.org>; Tue,  4 Feb 2025 04:11:53 +1100 (AEDT)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 513GExER006481
	for <openbmc@lists.ozlabs.org>; Mon, 3 Feb 2025 18:15:00 +0200
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.43; Mon, 3 Feb
 2025 18:14:58 +0200
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Feb
 2025 00:14:57 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 4 Feb 2025 00:14:57 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 6F1095F654;
	Mon,  3 Feb 2025 18:14:55 +0200 (IST)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 6F421DC3281; Mon,  3 Feb 2025 18:14:55 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-6.6 v1 6/8] i2c: npcm: Assign client address earlier for `i2c_recover_bus()`
Date: Mon, 3 Feb 2025 18:14:48 +0200
Message-ID: <20250203161450.265480-7-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203161450.265480-1-tmaimon77@gmail.com>
References: <20250203161450.265480-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-Spam-Status: No, score=2.9 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,KHOP_HELO_FCRDNS,MAY_BE_FORGED,
	NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: Tyrone Ting <kfting@nuvoton.com>, Andi Shyti <andi.shyti@kernel.org>, Joel Stanley <joel@jms.id.au>, Tali Perry <tali.perry1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tyrone Ting <kfting@nuvoton.com>

Store the client address earlier since it might get called in
the i2c_recover_bus() logic flow at the early stage of
npcm_i2c_master_xfer().

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
Link: https://lore.kernel.org/r/20241219090859.18722-3-kfting@nuvoton.com
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index bef27c517b38..f9ec1f59e03b 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2036,7 +2036,7 @@ static irqreturn_t npcm_i2c_bus_irq(int irq, void *dev_id)
 }
 
 static bool npcm_i2c_master_start_xmit(struct npcm_i2c *bus,
-				       u8 slave_addr, u16 nwrite, u16 nread,
+				       u16 nwrite, u16 nread,
 				       u8 *write_data, u8 *read_data,
 				       bool use_PEC, bool use_read_block)
 {
@@ -2044,7 +2044,6 @@ static bool npcm_i2c_master_start_xmit(struct npcm_i2c *bus,
 		bus->cmd_err = -EBUSY;
 		return false;
 	}
-	bus->dest_addr = slave_addr << 1;
 	bus->wr_buf = write_data;
 	bus->wr_size = nwrite;
 	bus->wr_ind = 0;
@@ -2087,7 +2086,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	unsigned long time_left, flags;
 	u16 nwrite, nread;
 	u8 *write_data, *read_data;
-	u8 slave_addr;
 	unsigned long timeout;
 	bool read_block = false;
 	bool read_PEC = false;
@@ -2100,7 +2098,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	}
 
 	msg0 = &msgs[0];
-	slave_addr = msg0->addr;
 	if (msg0->flags & I2C_M_RD) { /* read */
 		nwrite = 0;
 		write_data = NULL;
@@ -2156,6 +2153,21 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 	} while (time_is_after_jiffies(time_left) && bus_busy);
 
+	/*
+	 * Store the address early in a global position to ensure it is
+	 * accessible for a potential call to i2c_recover_bus().
+	 *
+	 * Since the transfer might be a read operation, remove the I2C_M_RD flag
+	 * from the bus->dest_addr for the i2c_recover_bus() call later.
+	 *
+	 * The i2c_recover_bus() uses the address in a write direction to recover
+	 * the i2c bus if some error condition occurs.
+	 *
+	 * Remove the I2C_M_RD flag from the address since npcm_i2c_master_start_xmit()
+	 * handles the read/write operation internally.
+	 */
+	bus->dest_addr = i2c_8bit_addr_from_msg(msg0) & ~I2C_M_RD;
+
 	/*
 	 * Check the BER (bus error) state, when ber_state is true, it means that the module
 	 * detects the bus error which is caused by some factor like that the electricity
@@ -2173,7 +2185,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	}
 
 	npcm_i2c_init_params(bus);
-	bus->dest_addr = slave_addr;
 	bus->msgs = msgs;
 	bus->msgs_num = num;
 	bus->cmd_err = 0;
@@ -2183,7 +2194,7 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 	npcm_i2c_int_enable(bus, true);
 
-	if (npcm_i2c_master_start_xmit(bus, slave_addr, nwrite, nread,
+	if (npcm_i2c_master_start_xmit(bus, nwrite, nread,
 				       write_data, read_data, read_PEC,
 				       read_block)) {
 		/*
-- 
2.34.1

