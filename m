Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E1797D41A
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2024 12:19:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X97dd32Jdz3dTs
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2024 20:18:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::535"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726827522;
	cv=none; b=WRq5I1aE6+u9mzp9QeKQPB1BauerW6TJbaK3I3ghW+SetZsgbTKNH3lEqjuDz6znnXZ717GPi+5ss3HMf0buUzZ+JEfP9VVnIK9cd6dGjm/Kc1Eps78hF4zNcXIYkoGS9AZTQ/n33OANS5JWaMkytEvfLDQZv2n4B9eFMFBp9bZbRFsBMWEk+eabDpqy/Juj8yzAprPyibUqLWd/8JzlNZ+BLcSOihqeADltqgowjbGN25i5GulzQz4qTdqxLhKHe6ziUNpZkRAmLtENSt/IGuqKJrE/rAYl3BbQIDeNJFawtHuk9+pXNPompHCI9NBaZwOYxDEqFYTir+kWgrJHJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726827522; c=relaxed/relaxed;
	bh=Hqji9tGtt8x3XWnj49TDJpJlGjDL6hysOmPTOIryTb0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=D1+GsVnE9Yrqv8RZZHkgRVUWE0SMrMHXwrcY0OwrFJ5Ev0SL3ZXKckYjLBkXMiAuVV6XxFDnA4dJNP0Bk2FkymdP12Iq5WRHnt0xmyFgcYorvbSKcCarcS9p6eQ5i3R/v2tR8CHckzNQcfSAgTX7WApWUmokGOCxfUpuGMGX4dm6hKmK/K7rtI+KsW30AatEYy1DDh2TjZdnNdxwPHYzkYp6x8dUdtWqTLd+mbXXF7PRbBBu1WIzg5zTq6Fyqz+hkBeQ6n0fgrKz1mP3Ym7Se3U7u1XzTTq5UVk7ocpSJ06yC0vfDXUdIycctPqhuZBn6jzQQ/ErR5mM37LEYi2elg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cmeQhGTl; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cmeQhGTl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X97dZ3RP8z2yRF
	for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2024 20:18:42 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7db53a20d1fso1228580a12.0
        for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2024 03:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726827520; x=1727432320; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hqji9tGtt8x3XWnj49TDJpJlGjDL6hysOmPTOIryTb0=;
        b=cmeQhGTltRmH5CxMZN+vwKKoZHe7Swi8FSUfiQh7LhxWbAO8gD0M3vM8TJTE6oaI/N
         vU6feEfMoFBum+RLu+pzoummrcUBtr9KQg9I7xM9u/r2GB3dSbUSErWDep2Ac+3Hb1Qr
         Tx+52HtTMG7S12Fv/LnWieDDfL9aSGecRMvTt5/XmF5ZP+OJLR90QXKT4Jm8CDY7dOWI
         mXc2cAeOhkXMiMuCjDOM2NJiGNlRle0r6s0ou2RQkPJIPGXvSW6KSllf6t3i39iVm1v6
         2faYMltQl7cPX+0hDRHez+xllsUQ5p5KqgO1F77SJNh0fWMFsL3qaEsj13Wr9lmtyNxF
         AqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726827520; x=1727432320;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hqji9tGtt8x3XWnj49TDJpJlGjDL6hysOmPTOIryTb0=;
        b=xVbmocpsuB+Cy9gLwIvR2fzRz/UelYcAs6+wu3ShwIXJnnS+9nQ0KvsFO5uwSbbOMw
         uiwFQpZguZvzIYDhZ4BAftaDPXZb0siGmf/sayrQP4u85hQGbSNGZphPhUoAp88wcmXN
         W+7vc2pGRUMkUkczRhuJ77lFwJ0HuAO9RaAmKaZ2pkE3ia2pY3tkGl/JDt3yTcsWEqNm
         UJ6YgJVfxe7CmTZskbZ2y6+MfAbLGhWtewg7vBBcxzxR/xT2BeSn/7H5CVd6Qh1zB1XL
         Xl5Ik9WuNL5nyxJj1K6aLJxFKDcc+kBbPiXcAQNWyIErD3y1zs5UOp2a6kcW1m+82rkR
         6Fog==
X-Gm-Message-State: AOJu0YyUyyQWlbMQ4xXTqCzPrK3OdiOKkhEy+0GNNzfHrIpmYiATevOa
	p1dTiN7+zzZZlli8x0YDjRqA/iATO3dvm0ihXLMhWFDvleQ+pozJsXa+8y4=
X-Google-Smtp-Source: AGHT+IFHbMVlFKHZ2gmmAnVDb59au+HAvbAe/HCOI0X6F2Mkg0p9TL07e1HiiSAyfNluOEgtpfy6Xw==
X-Received: by 2002:a17:90b:4f8b:b0:2c8:64a:5f77 with SMTP id 98e67ed59e1d1-2dd80e7191emr2734760a91.37.1726827519832;
        Fri, 20 Sep 2024 03:18:39 -0700 (PDT)
Received: from localhost (2001-b400-e35c-9cc2-447a-d760-d4f6-01f4.emome-ip6.hinet.net. [2001:b400:e35c:9cc2:447a:d760:d4f6:1f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dd7f9004fcsm1496423a91.44.2024.09.20.03.18.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Sep 2024 03:18:39 -0700 (PDT)
From: warp5tw@gmail.com
X-Google-Original-From: kfting@nuvoton.com
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
Subject: [PATCH v4 2/6] i2c: npcm: use a software flag to indicate a BER condition
Date: Fri, 20 Sep 2024 18:18:16 +0800
Message-Id: <20240920101820.44850-3-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240920101820.44850-1-kfting@nuvoton.com>
References: <20240920101820.44850-1-kfting@nuvoton.com>
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

