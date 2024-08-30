Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 947369655EC
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2024 05:49:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ww3zm2HHnz3dV5
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2024 13:49:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724989745;
	cv=none; b=RaKA01WqY9PytWNuta2N+xCLTIitc97eOXQ279y2tpoxsLZrTa8C0O6n+pqdW5b02+e/MQX1DommxsPEIw0q7JABbgB791VNp9C+6tXjBegVVpvN/Ui0hMzMXjvbLwv/+sitrz95zwUlBTjUaoR/ayjmRNLtAE3H4p71yWSk2BNVPdnJiPGZemHT1+8G6kErQfhP7ZNWnsciPcEn/zCsslqRuwumAb7b3rDVeJXCvwVEhbw4RvJxk9zHE+pKZc/OUTAAsnEZtpSTJH/WX1k8uCAiHEYsKYn2v9WvEayGy5bpfOquTXG7dWPZoCcuEARm3Q6Hyvwo4k0D2ewCYWObvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724989745; c=relaxed/relaxed;
	bh=VnrTLojAZPBUqXV+IxATkeEOOYkS6IQOxRjyLV//KxQ=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References; b=mfoTy+S5qi+qL0N7pJfJKQezKcrRtS9iRxxSkOXItkAzOT81hwCpcseI8IwR9AMjdrthtv7gTLj5wCXoLJFJdwmFo6kdl3yqmREO9weA6mBccB0pRSrx4P34C5OSoMdS4uXHIOjkdAZi6x5hsUGEIZ+1IQGJyxzg4JKPGoHeFh25bphLTDVkAdxYIozsy6hjNVBHLptbPDqXe1Y6C0bQlJxsBD2NNCiwZau9Gwe9LifMYRAGR4LNvq4gQPhw79kYqOemy9H3/X4ZoeMVaJcFHZ+ZafalqmUI5TFqWTCFjy6p3xKwjoNPO7r0aokxqmmE4S2lrlAVXCD9pA2l3Fo4pw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LxQc5yQ1; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LxQc5yQ1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ww3zh6QhNz3cQH
	for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2024 13:49:04 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-71431524f33so1031774b3a.1
        for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2024 20:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724989742; x=1725594542; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VnrTLojAZPBUqXV+IxATkeEOOYkS6IQOxRjyLV//KxQ=;
        b=LxQc5yQ1F9VSLEs3nIEacoKiCXHxcb7UlO1xiMtqyg2mGTCsfQMhraF0YcP/wCgXEs
         sm6ivSUJAgbDtpW3QWkFiTXDBv5npO2CtmfieHFd8XJ3wrQi8fb+g6gFMpDnlNdqy+fp
         M39ua3KS8yIkOMgXSf1hZ50Q7pyAj6e2W9UbdFCy0DCrDOtxHIPWZ+VTT5stv9+vYBLy
         mvbA5ev2edKicWm/pnwpe+vpD8iwu7elegRN2ovf1/+/zM79NIY5yuNtKRGmcrH41p4K
         Nfo26vLFZ80j5GbH99XuZD23v2uGKqiMre/SqWtMQQB7dvY6fVwQ4oR7iLWOULK4JvjQ
         fa3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724989742; x=1725594542;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VnrTLojAZPBUqXV+IxATkeEOOYkS6IQOxRjyLV//KxQ=;
        b=LVQiwYb1n7vqFH9WVlLSq9dQ42Pl0758eqPyCIZj1CqArvnEFMdGr+XXhxwk0yRDqa
         4HJ6FF+rBqJPgdcErN8a4D1Xt4aaDn/yp7puoN5+PX06MjmX12KWhbbxgRNwejOnTjvK
         fZ27CeNJ1IJlbYK86RUHwlF42D9/TeMjRJ4YhdOADQay44rQgXzzwcNQgvcooGswSWbP
         k0rKsJ4t6m5mzznzREXcd6ylT23z+HTFnrznTrGy6kptCpxmhZuZzU41iMQgm1Rrtg9z
         IHPANPbxSNQ+M6P9kpnY4Q3KE1hkkXLdKmQdK81OHPBShwS8keQ3Wv5V5vzZFBTDgjyt
         2VYg==
X-Gm-Message-State: AOJu0YyPILxiS5l5DnVqmOprld2EET9d87ToDudx/HFqdmcagYkcLIzn
	tYqN5GLnfN5VWnbwy+7OBqXoLBm+q7m1S4AkbR3R45rV1S3gTB8=
X-Google-Smtp-Source: AGHT+IGG8X0DXHUFSFQGLI9Izd2j/MNhoYs9RHnKyE5Q3GWJUcqI+sbWLul0dVdBJ9mmrPY4THzgpw==
X-Received: by 2002:a05:6a20:4f9a:b0:1cc:e4be:5fae with SMTP id adf61e73a8af0-1cce4be5fd5mr3165746637.7.1724989741837;
        Thu, 29 Aug 2024 20:49:01 -0700 (PDT)
Received: from localhost (2001-b400-e338-dab5-746d-1a82-f21e-bb0a.emome-ip6.hinet.net. [2001:b400:e338:dab5:746d:1a82:f21e:bb0a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e55b9cf0sm1907320b3a.96.2024.08.29.20.49.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2024 20:49:01 -0700 (PDT)
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
Subject: [PATCH v2 3/7] i2c: npcm: use a software flag to indicate a BER condition
Date: Fri, 30 Aug 2024 11:46:36 +0800
Message-Id: <20240830034640.7049-4-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240830034640.7049-1-kfting@nuvoton.com>
References: <20240830034640.7049-1-kfting@nuvoton.com>
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

If not clearing the BB (bus busy) condition in the BER (bus error)
interrupt, the driver causes a timeout and hence the i2c core
doesn't do the i2c transfer retry but returns the driver's return
value to the upper layer instead.

Clear the BB condition in the BER interrupt and a software flag is
used. The driver does an i2c recovery without causing the timeout
if the flag is set.

Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_reg_slave")
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 2b76dbfba438..2d034503d8bc 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -334,6 +334,7 @@ struct npcm_i2c {
 	u64 nack_cnt;
 	u64 timeout_cnt;
 	u64 tx_complete_cnt;
+	bool ber_state;
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
 
@@ -2158,7 +2162,7 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 	} while (time_is_after_jiffies(time_left) && bus_busy);
 
-	if (bus_busy) {
+	if (bus_busy || bus->ber_state) {
 		iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
 		npcm_i2c_reset(bus);
 		i2c_recover_bus(adap);
-- 
2.34.1

