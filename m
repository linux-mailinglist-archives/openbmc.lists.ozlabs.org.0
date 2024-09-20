Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C82097D414
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2024 12:19:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X97dX4QRZz3cdV
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2024 20:18:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::532"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726827516;
	cv=none; b=Mq+urQY65QpVhgd/6pg8J/WX1vLIwtx7mARFn8K74Q/sAKn25usKucHefNKoVa2j5YZGy986a59LlcefZ3CX0TnqBVcq4ldYIn3OYzMloKQWS4oGm68jg+L0qf1XBlsLe/u2IkAj0o8CDuKWXMsYcYGn/XGj7fqLI0y2PvhT7SvsfyL1YiBQkeNQA6sxtdljAr0Sb+T+mp+Ub45DGt4QREyJWMHQ12FxZzf782MdMFR8QtHwp7lyKmqddcOCAETs/4zrXWq3sauFyzYOxDDFl1sU+9zzwEkgW5RQagqHvvDBYCJ5mESZw3jEWMhxmAgVGwRnBLUD459LByMleXYCaw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726827516; c=relaxed/relaxed;
	bh=b5x6COaWYuBZ+I/ktGSPVnQK2t9IfKl2Gymo5GZUYVM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=BJ7tv6IC47W9V54VY47l0izmXUMv3oRY9MC8sC1SNFEg5c2jEnXGHYXDBakwd6yLjXAlu+lYbk09BvCnUMW15w4krcdXpKdhENlgQJB87L6e2Pz8HR7iuy2Tv0ZxaA10UpZaKt7YqIMDULEa02BBY4bYVioYOvHeUCijKq+YZ7/ZZwqTzFR+KfwoYFDiCU+Nj3LLkiiMedcKoCX+HMsK41Yf5ivmIgwa1vUBmOBSO44fVGzyHv2egUFGB0BwxDxG0RL02BSBoIljeTIBnNQwTP4FrTU/PpZDT7+TMRCTfW7Z7YyxTsLDxxh/wmKDECJ3DkrL3PTJJWUrniNmLkBfEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=K3v27Rgy; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=K3v27Rgy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X97dS5Xmjz3c6P
	for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2024 20:18:36 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7d666fb3fb9so942734a12.0
        for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2024 03:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726827514; x=1727432314; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b5x6COaWYuBZ+I/ktGSPVnQK2t9IfKl2Gymo5GZUYVM=;
        b=K3v27Rgy2AGSWHYWLlcLOBRBIznV9O6Qb6w1NaBroAFjbi5cstgC9uJcY2lMVhvtLo
         uRSqCge8O9ErhmKUuykz0bY6eJ/Ze1CB3FJ8oek7gjFshfJIJ1bKZaMEn9pfpazfrtIj
         HHdn4fv1qaDQSTSXCVTU68m5qiSC9bcfs9dCx/UPAXo0Qs2bbqi66ewENEmyM/23WR9R
         gMIBKCsbqJBs5onFA8m0BdZb0xYF7ck1tDNb64vVjVP3Q5k2dp6tUbeItBozYRk4Zp9F
         VnW2bv2IyyVF2oq/ypgHIl5SdffPs+fiFDLt0O58eaV8gBVQVdAEl4p2dbvuV0DDIf8G
         ivNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726827514; x=1727432314;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b5x6COaWYuBZ+I/ktGSPVnQK2t9IfKl2Gymo5GZUYVM=;
        b=RH9i2KD6TY2dKT4Qo3gVIIrAJMdSXT8Be1fgIKZQfxythTc6BoTWlJ8Wp75UAmqmNr
         OM2DxF1xA8XP+bTyCDsPjAYuTfFohFNHrQAGc53pwJV+z0mU/B/YpVyTFPnWlur018Jf
         734HCMnfOxpwYPMWwV1W3LGnP3JF0+kAaSfrWQ0dUvNWQ/NbtcHT/mkdHL4ZDStcwLcZ
         AhZqFWk8nVWR+1jWuRafVTueh4d+IQIZu0/wqaUBNNjJks5xchZUngwTsq20J5rwPWIR
         VoKDKCh0c7eIEdPNaV+iftfLxmQDJTpZZibCNBrUpeJewr6txjJG2BckMxiSjZf3/pUb
         9fMQ==
X-Gm-Message-State: AOJu0Yzo0jccHnpIiMCdGS5HeV5+r8U8q90VOnEUnt0otqbqL3kTZKwe
	6dRQy/QNOPvssAkz/LlvDRshHj0FAyWeHzYMYXy33ObV9yNTUCo=
X-Google-Smtp-Source: AGHT+IEHwBHrwTHTEv0Pp/iXOeAFo6lVrY7n+mRIq3slFlGs00IXkri4xKe99XIYbrrJH0TpeFpgOA==
X-Received: by 2002:a05:6a21:83:b0:1ce:d403:612d with SMTP id adf61e73a8af0-1d2fca71fe1mr6873701637.13.1726827513723;
        Fri, 20 Sep 2024 03:18:33 -0700 (PDT)
Received: from localhost (2001-b400-e35c-9cc2-447a-d760-d4f6-01f4.emome-ip6.hinet.net. [2001:b400:e35c:9cc2:447a:d760:d4f6:1f4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db4998b4f3sm10636251a12.72.2024.09.20.03.18.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Sep 2024 03:18:33 -0700 (PDT)
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
Subject: [PATCH v4 1/6] i2c: npcm: correct the read/write operation procedure
Date: Fri, 20 Sep 2024 18:18:15 +0800
Message-Id: <20240920101820.44850-2-kfting@nuvoton.com>
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

Originally the driver uses the XMIT bit in SMBnST register to decide
the upcoming i2c transaction. If XMIT bit is 1, then it will be an i2c
write operation. If it's 0, then a read operation will be executed.

In slave mode the XMIT bit can simply be used directly to set the state.
XMIT bit can be used as an indication to the current state of the state
machine during slave operation. (meaning XMIT = 1 during writing and
XMIT = 0 during reading).

In master operation XMIT is valid only if there are no bus errors.
For example: in a multi master where the same module is switching from
master to slave at runtime, and there are collisions, the XMIT bit
cannot be trusted.

However the maser already "knows" what the bus state is, so this bit
is not needed and the driver can just track what it is currently doing.

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index bbcb4d6668ce..2b76dbfba438 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1628,13 +1628,10 @@ static void npcm_i2c_irq_handle_sda(struct npcm_i2c *bus, u8 i2cst)
 			npcm_i2c_wr_byte(bus, bus->dest_addr | BIT(0));
 	/* SDA interrupt, after start\restart */
 	} else {
-		if (NPCM_I2CST_XMIT & i2cst) {
-			bus->operation = I2C_WRITE_OPER;
+		if (bus->operation == I2C_WRITE_OPER)
 			npcm_i2c_irq_master_handler_write(bus);
-		} else {
-			bus->operation = I2C_READ_OPER;
+		else if (bus->operation == I2C_READ_OPER)
 			npcm_i2c_irq_master_handler_read(bus);
-		}
 	}
 }
 
-- 
2.34.1

