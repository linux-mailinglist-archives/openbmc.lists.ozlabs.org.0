Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F067977D14
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2024 12:16:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4qtt3YKjz3g6s
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2024 20:15:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726222513;
	cv=none; b=eC4uAFRDCIIJSq8A3q99SyUpzPx6ccNfOi46DDlK8xT/GffIqjCmL3B7lMxz8iaHftyY29UJf7JN35hFw5JOXHVSPF4H4TgDvWAoYtetdGSTtePuGjjUinWgqXjqVdBWSVQygZAaL2SJQWhCnUJ36WJMQ06Vo6myQoHre+vF3brrAH8c4voGfsXMnRONVYCy65Lh1JK5p16LZNtPODIBLjTiBvLyroTnGMVwteR9gC1dLDIh8w8p78Bl+6vhZHXrDNqAH6RwQkqmN9zVfgT/RgNoNC563nVrg9HMOaLgqLCGH5xOyT8SVZhzHIxY3Xoq5BDwfcXClIm4ahtBhkltLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726222513; c=relaxed/relaxed;
	bh=Ld5dlQNPUQTUFF/Ssx2WQipHo3yFKCbKn/t6dhaVrDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=mmMgM8FuAEZcoJ3yaSHu8d/CvDIOTpJOo4iYbF69rrvbigkA4O9TVJsX+98SfgmCKAimFaHqk1Txs7dE1OAbKQqsu4RVIJnP1+k7bvhuGvJrjGWZ/6Z4rg2HX0rIQJNnwJb8GRr5aY6Jc3i9Vmf8QJC+1pd7gcIErevKfw11O1NFgbAHA0N94nSlmsCdwY6gjNqyyzWOup7d8OdRCt5pqVQn6A7AuQLr/5/HOTHEdxZw/zfQj3Djt4JLMl0UB8OB/DxpXzUvd/yu8U5YIuKI36bGZqvLK9g81UVg0BFIM8lIf07+0vhJHn0qb/yR8MhQ0Z4mq0hDVYcok9lMsRqrZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SAuPpvtg; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SAuPpvtg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4qtn1gkxz3c8H
	for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2024 20:15:13 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-718e9c8bd83so2232877b3a.1
        for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2024 03:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726222510; x=1726827310; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ld5dlQNPUQTUFF/Ssx2WQipHo3yFKCbKn/t6dhaVrDQ=;
        b=SAuPpvtgUFyQ7L+qnxXRszN3qH8AnzvNL35uzj/Efnt3YWn9YxeunS9nPn/9HMj69N
         K4K7uvNPBagITnSs2ymA1ceTMB6ckXYTb2Sa3mwriWBvjg7qtCvxdXQIHSemFVkQD6SR
         34uwLVJd+K5Kvp0ShGSFOAP6Rc26DrN76FVrcimRPH3IVksq3HYjFqVoICnHO0INHLmw
         u5E1iyjZ07pSbJO4z+3/vypl7RoT0USEqivD2gUODcyHJ/Hg5d+5ty2qORz0qM/znPUg
         dwDGAs8MpEguLxtDQoSkUlMp06CsCB4iBpPTzrfAp0SwLqHyzzN4eL/cpPYNHW4yHW8t
         J/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726222510; x=1726827310;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ld5dlQNPUQTUFF/Ssx2WQipHo3yFKCbKn/t6dhaVrDQ=;
        b=Wfn4nMkSV2ijc/Snq+yFixrSQ7ukUBTUniKgN6YpNmAyxO6StXypveSNWYuCeXHEeP
         83TUSInnNmRH0B/pXA9V42klzwv9CYVxWWE5FkZ/jLbpZzL/5RQe9r700qZS7lFgVE9Q
         NUnAMaxycs5gMKvxwQpcol07NritsHV/E5SaOtN+qOlIj3YqYM/uoLQb4DjsJ35xQ7lF
         Tg2RmNgtGn3SbiG78aGYHkp0rp7+PlX0lgdb8qsIe5sfZ0Z799bLeO6/hyM/BQ3f1I0p
         bbv1+HVoYByLliQLhpetxMCOCt2LQMRZXAryvJ7PmbM3x37dCUwN/oYUczAtD4idUG7x
         c4Qg==
X-Gm-Message-State: AOJu0YwUtnyLN7LlHMWGWoXaNuTd9vizNAuXJtn5vPf//MTiAqWK8M8z
	Ze7LG0VIU13D/srqyDEfZ4YDyHNB6Gu3RFI+T1vFfUqoIC7sY7o=
X-Google-Smtp-Source: AGHT+IGt26oOAshFJlW/po5/WtDlvLOL1IGJhw4CdzWN+MaBv+2N3YYu0lqY/H1NjONEpq76mTw+/w==
X-Received: by 2002:a05:6a00:6f18:b0:717:98e7:3d0 with SMTP id d2e1a72fcca58-71907ba053fmr23661051b3a.0.1726222510134;
        Fri, 13 Sep 2024 03:15:10 -0700 (PDT)
Received: from localhost (2001-b400-e334-c33a-b4cd-4a8f-209a-cf54.emome-ip6.hinet.net. [2001:b400:e334:c33a:b4cd:4a8f:209a:cf54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003c57sm5813143b3a.89.2024.09.13.03.15.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Sep 2024 03:15:09 -0700 (PDT)
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
Subject: [PATCH v3 4/6] i2c: npcm: Modify the client address assignment
Date: Fri, 13 Sep 2024 18:14:44 +0800
Message-Id: <20240913101445.16513-5-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240913101445.16513-1-kfting@nuvoton.com>
References: <20240913101445.16513-1-kfting@nuvoton.com>
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

Store the client address earlier since it might get called in
the i2c_recover_bus logic flow at the early stage of the function
npcm_i2c_master_xfer.

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 68f3d47323ab..e52e65e63600 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2155,6 +2155,18 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 	} while (time_is_after_jiffies(time_left) && bus_busy);
 
+	/*
+	 * Previously, the address was stored w/o left-shift by one bit and
+	 * with that shift in the following call to npcm_i2c_master_start_xmit.
+	 *
+	 * Since there are cases that the i2c_recover_bus gets called at the
+	 * early stage of the function npcm_i2c_master_xfer, the address is
+	 * stored with the shift and used in the i2c_recover_bus call.
+	 *
+	 * The address is stored from bit 1 to bit 7 in the register for
+	 * sending the i2c address later so it's left-shifted by 1 bit.
+	 */
+	bus->dest_addr = slave_addr << 1;
 	if (bus_busy || bus->ber_state) {
 		iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
 		npcm_i2c_reset(bus);
@@ -2163,7 +2175,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	}
 
 	npcm_i2c_init_params(bus);
-	bus->dest_addr = slave_addr;
 	bus->msgs = msgs;
 	bus->msgs_num = num;
 	bus->cmd_err = 0;
-- 
2.34.1

