Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E615194A500
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2024 12:05:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J8zroKdA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wf5Qf633dz3dC1
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2024 20:05:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J8zroKdA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wf5NT39VBz3cyg
	for <openbmc@lists.ozlabs.org>; Wed,  7 Aug 2024 20:03:37 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1fc65329979so14668815ad.0
        for <openbmc@lists.ozlabs.org>; Wed, 07 Aug 2024 03:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723025015; x=1723629815; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BDqYPFDQ8C1Tp5b7bagIZayk3yRE5OYklUz/hGN2mSE=;
        b=J8zroKdA9kpXhIZ38OUMVDUDqPlhUJ+Ke6rysSTnAZ+jrwKsHhsPyI+R4jXv7WfNUs
         RXHhrIGP9FcVqFQsAj/Ws4XVDmJQqfndAYiabthWldZVJR337ai+4HJLLH6xru214L5p
         g2fRh4ONL6vczte03dJ4Izlk8ntjqr6x1aGMranKm+lSe/6d37WKOxXxsldwoiYVhFg0
         I21l9J2++6wbtc0u1qsjRV56sHwAkX+4IwQOrddb9oVitaJH8IRtqXacbErz4/qNO3u6
         pX1lli+E0/Bxl49gqj8HKcPpZxT6F/oK/WSR544oCutjtYv+p2hy/iJ0DslWdiWLhASV
         X+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723025015; x=1723629815;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BDqYPFDQ8C1Tp5b7bagIZayk3yRE5OYklUz/hGN2mSE=;
        b=TowBi20gMzRP3TEkHNOKQ8PlFwIjly6gUJ8cyLmiupEg0ki7zRBLqdrY/5IQoSZ4VO
         fWHAAye1xlnVjMUc9nlZm1QlTZ91/1UNnatTL5Ir5UtThaOeUmE4EO/RtxMi1eAPYISp
         BDKF/I/6ZoFbqWcB6dn2khwWkqp5ETRasK8WKToc0Q/9WCtfvKO00z3b/2I+7edI3L9i
         m9kRKDOtZm1nQ2x+DW2qqi7zyu5BiFj25cXQ4PBKzhDgXxihyRViv+FEslUVFZ0YVLal
         JYUtSBFSV9euxI/aTjEDLqXRTXCwD+AT2yUlXrIgDX6hD29CI/wVMY+b0dnqiXiA9xYl
         GhRg==
X-Forwarded-Encrypted: i=1; AJvYcCV+R1HDlBxJrRbFn4POrJZBOK1XUcmcXFD0kP/O2m+Q/PbfDFnGMg9FFtcxvg/ovlxgbmTerG4zGL19a7OSRyY8tTZkUl1BfCg=
X-Gm-Message-State: AOJu0Yz/vsleY7dJ8P9ZSmz/+hapluuuWXlA51reAA9oofCXbA+/XQhb
	6xoVvOJti2PfJJfqC2b6+ek00CmIDw57LRtd2NnwPkpRbdlpAII=
X-Google-Smtp-Source: AGHT+IF6/COrwRqAiRFSVZRZmy72Ongk1XUuk5O7KX5dNirXd8DXP6iFhlCT6mU3VemP2quJG039bA==
X-Received: by 2002:a17:902:f691:b0:1fb:8e98:4468 with SMTP id d9443c01a7336-1ff573f4efbmr191271825ad.50.1723025014926;
        Wed, 07 Aug 2024 03:03:34 -0700 (PDT)
Received: from localhost (2001-b400-e352-b705-880f-4661-e7a1-4abb.emome-ip6.hinet.net. [2001:b400:e352:b705:880f:4661:e7a1:4abb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f6d80csm102373675ad.119.2024.08.07.03.03.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2024 03:03:34 -0700 (PDT)
From: warp5tw@gmail.com
X-Google-Original-From: kfting@nuvoton.com
To: tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com,
	rand.sec96@gmail.com,
	kwliu@nuvoton.com,
	jjliu0@nuvoton.com,
	kfting@nuvoton.com,
	warp5tw@gmail.com
Subject: [PATCH v1 2/7] i2c: npcm: use a software flag to indicate a BER condition
Date: Wed,  7 Aug 2024 18:02:39 +0800
Message-Id: <20240807100244.16872-3-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240807100244.16872-1-kfting@nuvoton.com>
References: <20240807100244.16872-1-kfting@nuvoton.com>
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

Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_reg_slave")
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index c8503acdaff8..bd444ff83a8c 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -332,6 +332,7 @@ struct npcm_i2c {
 	u64 nack_cnt;
 	u64 timeout_cnt;
 	u64 tx_complete_cnt;
+	bool ber_state;
 };
 
 static inline void npcm_i2c_select_bank(struct npcm_i2c *bus,
@@ -1519,6 +1520,7 @@ static void npcm_i2c_irq_handle_ber(struct npcm_i2c *bus)
 	if (npcm_i2c_is_master(bus)) {
 		npcm_i2c_master_abort(bus);
 	} else {
+		bus->ber_state = true;
 		npcm_i2c_clear_master_status(bus);
 
 		/* Clear BB (BUS BUSY) bit */
@@ -1697,6 +1699,7 @@ static int npcm_i2c_recovery_tgclk(struct i2c_adapter *_adap)
 		dev_dbg(bus->dev, "bus%d-0x%x recovery skipped, bus not stuck",
 			bus->num, bus->dest_addr);
 		npcm_i2c_reset(bus);
+		bus->ber_state = false;
 		return 0;
 	}
 
@@ -1761,6 +1764,7 @@ static int npcm_i2c_recovery_tgclk(struct i2c_adapter *_adap)
 		if (bus->rec_succ_cnt < ULLONG_MAX)
 			bus->rec_succ_cnt++;
 	}
+	bus->ber_state = false;
 	return status;
 }
 
@@ -2156,7 +2160,7 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 	} while (time_is_after_jiffies(time_left) && bus_busy);
 
-	if (bus_busy) {
+	if (bus_busy || bus->ber_state) {
 		iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
 		npcm_i2c_reset(bus);
 		i2c_recover_bus(adap);
-- 
2.34.1

