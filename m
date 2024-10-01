Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C96C98B458
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2024 08:30:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHp2N49wXz3c6b
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2024 16:29:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727764185;
	cv=none; b=FaBwY5/jwDeqlzk1whUFjvnlb5XnX0XNa9loiQLD4FhuIEIGca5E3geJwY8/flkR5ULlDl5o8iogxW7nzWdQOWf35yFhBcbZd8cXB+iLrDliGHETsy/Zua6gSI0F3D0IihpDXxRUN3P/Y/Zuy3Nlrr3SIgj8hj+IRyd2AkrOfQE3xDTvbPO9OCIpW2meaC5HudSOpBlTCccBTlyR8NOIbd3KjOBNDeWtj4XlUf/WZ8092g/1GGt69H9DtIDZMw5XIDhliiSZJIaVWHXLp3ObHnVHmNgEn1QD7IpgCsXkvn9Loh26tska6p5TZr+icB8W1xmsSinLIsDhgiiEDnPfmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727764185; c=relaxed/relaxed;
	bh=WxtrrtK7dkUabLTe2HlhaHOfop29J15CnaNw+gioQGM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=BgTjDA1XQw7ItkXoYwa95WLICxBxkKHiZP8JPNQ2N1Yde0qrieDouEhgT+SgtzFvV9UhUWr2ge6k/di0tJCEV+7gCxd1oMqoLo5Qwi6ISgXnBRKyRUTfJXTtDLyX9779MaTFBFpZO0xQfzEaTAtrao6aVswjfZI+xx3OjCG0vje4nMzBXI/nCygyQemf780rY/hdDe55kQK8qVwf8et1C3tBF5sLQUbYyQ1398PEgGjPyZ+Pnw0G8KWH2EaPYHd+nfiv9yG0btcDCa2QyYMcBdoFSqq8LvNAjRngux0t9iN4gXt12rEeavFa1/vlM11VYhnjnG3Z7dZE3yS1f1/eFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V9sD+/Ye; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V9sD+/Ye;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHp2J6XgQz2yGM
	for <openbmc@lists.ozlabs.org>; Tue,  1 Oct 2024 16:29:44 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20b5fb2e89dso18037025ad.1
        for <openbmc@lists.ozlabs.org>; Mon, 30 Sep 2024 23:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727764183; x=1728368983; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WxtrrtK7dkUabLTe2HlhaHOfop29J15CnaNw+gioQGM=;
        b=V9sD+/YeGY6rg9JiYauHuTa08Amlpfmk9eMIBXGIEE34UJLNl3p1YYDxo6KHUJROyE
         ecyZd8mCJQSGeHzcw5X3i8olY08F3R6hamRarGBhtNKh5ltwXax7XlpZASNBmqG547VC
         3yK8qZyata0ezowryMGfL5ZmGeXT6tKlKU8+0MmmyPaA0IR4s3Fr+SwMbh8GzNkSlUHE
         ynJ3niDFOFdWASCMTTYBdmAKExfsB9OAW1EwnM4cl7X3onKpIm+MNyugKWOhCDCofMra
         2n5I0LPP7idDRNAwVXRq3AtCH6u3f8b+XtVac4g+xW4LG+mPpDqWTQbpj7OPKSwgZFNn
         DbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727764183; x=1728368983;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WxtrrtK7dkUabLTe2HlhaHOfop29J15CnaNw+gioQGM=;
        b=vb194ltGfQkrD3z2MTwzlE25usXXeELUnAzpeN48wfMeoMYNPbX9xdMHelplzsjsDe
         h4N7r7kwpCwuU1fuhug88ER7LQV1W4L1epqsnEBZSuLNmIXCd3FPw7Uo8bwHMc9I+b+P
         UyYySuj5z0u8wzqbGyb7E+/qAHYo8OdMQerRuaAyU+8FBu2wHo2CX17cE1VAtbn75jao
         8GAGBU6Kpr/g1vZwP5/+GW56jGJY2FrxfQH79N/iKMno+WgVanisiPNK3cXMx2M0IHKW
         I53b76kd5UL1GCf+PQMQZsioEEmvYPJXLJlqX2NrhyyL84PEnXRKC9Hk6oQIPaAy+hzv
         3eTg==
X-Gm-Message-State: AOJu0YwptELY67FTNehJA4MHHtXRbdjh2vlcYYkAGvXc2EVu7UbI7TXC
	iKBHX5rZkaf8JyKsV+c+cgtxaqNZI8Xc0PXMgDromAilTQPnDnQ=
X-Google-Smtp-Source: AGHT+IE37FEF80rldr/cNKepWtQJ5ahhtOq33h6U28/y3zagN8dDe1+p1X3DN/bUulyLUI9t1XyGBw==
X-Received: by 2002:a17:902:ce12:b0:205:8275:768 with SMTP id d9443c01a7336-20b36aee9edmr213250335ad.21.1727764183341;
        Mon, 30 Sep 2024 23:29:43 -0700 (PDT)
Received: from localhost (2001-b400-e30e-7f15-c94a-d42b-025a-8ff3.emome-ip6.hinet.net. [2001:b400:e30e:7f15:c94a:d42b:25a:8ff3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e65a48sm63454465ad.297.2024.09.30.23.29.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2024 23:29:42 -0700 (PDT)
From: Tyrone Ting <warp5tw@gmail.com>
X-Google-Original-From: Tyrone Ting <kfting@nuvoton.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org,
	andriy.shevchenko@linux.intel.com,
	wsa@kernel.org,
	rand.sec96@gmail.com,
	wsa+renesas@sang-engineering.com,
	warp5tw@gmail.com,
	tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com,
	JJLIU0@nuvoton.com,
	kfting@nuvoton.com
Subject: [PATCH v5 2/6] i2c: npcm: use a software flag to indicate a BER condition
Date: Tue,  1 Oct 2024 14:28:51 +0800
Message-Id: <20241001062855.6928-3-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241001062855.6928-1-kfting@nuvoton.com>
References: <20241001062855.6928-1-kfting@nuvoton.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
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
Cc: openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tyrone Ting <kfting@nuvoton.com>

If not clearing the BB (bus busy) condition in the BER (bus error)
interrupt, the driver causes a timeout and hence the i2c core
doesn't do the i2c transfer retry but returns the driver's return
value to the upper layer instead.

Clear the BB condition in the BER interrupt and a software flag is
used. The driver does an i2c recovery without causing the timeout
if the flag is set.

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 2b76dbfba438..7620bdcdc235 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -334,6 +334,7 @@ struct npcm_i2c {
 	u64 nack_cnt;
 	u64 timeout_cnt;
 	u64 tx_complete_cnt;
+	bool ber_state; /* Indicate the bus error state */
 };
 
 static inline void npcm_i2c_select_bank(struct npcm_i2c *bus,
@@ -1521,6 +1522,7 @@ static void npcm_i2c_irq_handle_ber(struct npcm_i2c *bus)
 	if (npcm_i2c_is_master(bus)) {
 		npcm_i2c_master_abort(bus);
 	} else {
+		bus->ber_state = true;
 		npcm_i2c_clear_master_status(bus);
 
 		/* Clear BB (BUS BUSY) bit */
@@ -1699,6 +1701,7 @@ static int npcm_i2c_recovery_tgclk(struct i2c_adapter *_adap)
 		dev_dbg(bus->dev, "bus%d-0x%x recovery skipped, bus not stuck",
 			bus->num, bus->dest_addr);
 		npcm_i2c_reset(bus);
+		bus->ber_state = false;
 		return 0;
 	}
 
@@ -1763,6 +1766,7 @@ static int npcm_i2c_recovery_tgclk(struct i2c_adapter *_adap)
 		if (bus->rec_succ_cnt < ULLONG_MAX)
 			bus->rec_succ_cnt++;
 	}
+	bus->ber_state = false;
 	return status;
 }
 
@@ -2158,7 +2162,16 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 	} while (time_is_after_jiffies(time_left) && bus_busy);
 
-	if (bus_busy) {
+	/*
+	 * Check the BER (bus error) state, when ber_state is true, it means that the module
+	 * detects the bus error which is caused by some factor like that the electricity
+	 * noise occurs on the bus. Under this condition, the module is reset and the bus
+	 * gets recovered.
+	 *
+	 * While ber_state is false, the module reset and bus recovery also get done as the
+	 * bus is busy.
+	 */
+	if (bus_busy || bus->ber_state) {
 		iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
 		npcm_i2c_reset(bus);
 		i2c_recover_bus(adap);
-- 
2.34.1

