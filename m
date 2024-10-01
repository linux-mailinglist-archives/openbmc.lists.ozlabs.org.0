Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D9B98B45B
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2024 08:30:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHp2T264Kz3dHw
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2024 16:29:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1031"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727764189;
	cv=none; b=jIfWuysGgW5ktsAQL+xrQMRKUxsbExptH1K1WvSNVE+wM6yivm9KdmlFB2KLe5EH6hnouJrbVO3t5TzqY3PIY2H7NykUdwwNXt4iKjeVgZoicRG/O0LcBjWLcs47nirYhQ9gIRUEYHgI/SSiEkKENBLv5a17HVQ5sb/Navn3eEL8/T9px5TzvCGD43u4+JMHzNAdAieMLPy5QdSYHFloaoUiNfOTqdrOFu8OfDiLnc9Brky2yPbslx536r5ve830rAee8lTF2OLuzPEe8w1+gNrNlQ4CSISXnWhX7h0zN/qtfXNa9kwiwdN1fr2l+qhGuiU6OJ3T7sb+ObvZKDuSSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727764189; c=relaxed/relaxed;
	bh=oZTR7VWZlUhx2yQtNiZmirEwYuAooSCpN3CWuoP2Uac=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ncxvkXBQvtQjGe8V/qVJBTvEUJFVIpIsNVfBZ/62GluLvwabk7S1ctLrykjcF3Gl3tfc1Z5yPWEqDymwBsHGjR/xnWhbNHP2WZRBYazBhKZ4ghkSVAACRiyub/cbtjwM+YhsotFjt5krttXZjAUsM5mR9aTNO+LoctuXddT6PaX6NqFif81RYIndBy7U5lrDUPj2oWRrwDajEG5ZaaQGwBFIJ678gvzTruMAkrFFoDQQ8uogSwDKiZ0VEUaTSW9s4pe/jK00aluldwykcRPah3VLOLA3fbO3DY8b8z74A6ENr0XDVJMqa+Qd/24tT8rIJVwSJ843QB/ExTmo/IymHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eigy4Bk1; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eigy4Bk1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHp2P4FcDz3cQL
	for <openbmc@lists.ozlabs.org>; Tue,  1 Oct 2024 16:29:49 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2e07d91f78aso3918724a91.1
        for <openbmc@lists.ozlabs.org>; Mon, 30 Sep 2024 23:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727764187; x=1728368987; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oZTR7VWZlUhx2yQtNiZmirEwYuAooSCpN3CWuoP2Uac=;
        b=eigy4Bk15o+ZHIuluwKQSx1aAZI2fsyXRuRQgbqBhe+0LCOo0MHFu0EUs5QtkBlsaP
         l2ZzHM7hZARlup5Idhh19Sjg889jNrTspDrhkQ4l75+alAvFzmxOImsqzwUJlTnQpDu3
         uHcTZXDbGR11HdElSeKgLLtHP9fONZjLiv21qG10VxuFQWsbXwo/bh7StsCYec5ucqWH
         kzvFfVE+OBHcFFo38wrSsTYO40R6tThRXRZwEoxMdP7sO4UPNOqV3X0cRchUSqdiks0Q
         fspN9KdynNjI3pUpBor+neNvYElona3owbfoYu5ZVM/YsfUyQU6jN9ZWAtTUcBE/JZSk
         7L1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727764187; x=1728368987;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oZTR7VWZlUhx2yQtNiZmirEwYuAooSCpN3CWuoP2Uac=;
        b=FurpWmVcTzIEp91ZaHuNMAuZP04CFdFTQJFCmm5gRBm8Xc0VqkSk8jJfmn0ZCKLWes
         J2y+6hN9ssgFJDXG5EVad96s+jzx10wZikEpZmpt+tI0Xs3Kl2upA1Ly8ffpMyOSAKv1
         VxPy/5p9PXs1j2e2BmtFTdcyYbFpmiPlvUSw3kz2LnaX+sn2XZqlTmLY4ZGm/idw5IgR
         aWWvdH6otnOXm6yX3IHp938Q/K64S4iHXpwxo3xRa9LefM3W7NLrB7fezfiefL433iyB
         hx1sx+wqwBlEnKnUAluktKkR393TItGtVU+Y21VQp+9THCvnSeeeOzY3kRNm1jLA9+Qx
         CA8w==
X-Gm-Message-State: AOJu0YyccOH/ZprBlvca9X7rvgxmQPiCgwZgi6ZlFc9x8AXJG3gzTGkZ
	FPvovW8h44iikhYLie+VYgEYyfdFKXl1dq2aXuprYwcAFQgqWec=
X-Google-Smtp-Source: AGHT+IEfyPM2bsYwU45GdSmrXMiZ6q9HsEacf6Me68JtTyniOZIOco8TVIapaymb385TIN8YRuKDAw==
X-Received: by 2002:a17:90a:8c18:b0:2d8:c17b:5018 with SMTP id 98e67ed59e1d1-2e0b89f0613mr17616802a91.11.1727764187176;
        Mon, 30 Sep 2024 23:29:47 -0700 (PDT)
Received: from localhost (2001-b400-e30e-7f15-c94a-d42b-025a-8ff3.emome-ip6.hinet.net. [2001:b400:e30e:7f15:c94a:d42b:25a:8ff3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0b6e29081sm9228277a91.53.2024.09.30.23.29.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2024 23:29:46 -0700 (PDT)
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
Subject: [PATCH v5 3/6] i2c: npcm: Modify timeout evaluation mechanism
Date: Tue,  1 Oct 2024 14:28:52 +0800
Message-Id: <20241001062855.6928-4-kfting@nuvoton.com>
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

The users want to connect a lot of masters on the same bus.
This timeout is used to determine the time it takes to take bus ownership.
The transactions are very long, so waiting 35ms is not enough.

Increase the timeout and treat it as the total timeout, including retries.
The total timeout is 2 seconds now.

The i2c core layer will have chances to retry to call the i2c driver
transfer function if the i2c driver reports that the bus is busy and
returns EAGAIN.

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 7620bdcdc235..03d6c8702ecf 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2132,19 +2132,12 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		}
 	}
 
-	/*
-	 * Adaptive TimeOut: estimated time in usec + 100% margin:
-	 * 2: double the timeout for clock stretching case
-	 * 9: bits per transaction (including the ack/nack)
-	 */
-	timeout_usec = (2 * 9 * USEC_PER_SEC / bus->bus_freq) * (2 + nread + nwrite);
-	timeout = max_t(unsigned long, bus->adap.timeout, usecs_to_jiffies(timeout_usec));
 	if (nwrite >= 32 * 1024 || nread >= 32 * 1024) {
 		dev_err(bus->dev, "i2c%d buffer too big\n", bus->num);
 		return -EINVAL;
 	}
 
-	time_left = jiffies + timeout + 1;
+	time_left = jiffies + bus->adap.timeout / bus->adap.retries + 1;
 	do {
 		/*
 		 * we must clear slave address immediately when the bus is not
@@ -2192,6 +2185,14 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	if (npcm_i2c_master_start_xmit(bus, slave_addr, nwrite, nread,
 				       write_data, read_data, read_PEC,
 				       read_block)) {
+		/*
+		 * Adaptive TimeOut: estimated time in usec + 100% margin:
+		 * 2: double the timeout for clock stretching case
+		 * 9: bits per transaction (including the ack/nack)
+		 */
+		timeout_usec = (2 * 9 * USEC_PER_SEC / bus->bus_freq) * (2 + nread + nwrite);
+		timeout = max_t(unsigned long, bus->adap.timeout / bus->adap.retries,
+				usecs_to_jiffies(timeout_usec));
 		time_left = wait_for_completion_timeout(&bus->cmd_complete,
 							timeout);
 
@@ -2317,7 +2318,12 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
 	adap = &bus->adap;
 	adap->owner = THIS_MODULE;
 	adap->retries = 3;
-	adap->timeout = msecs_to_jiffies(35);
+	/*
+	 * The users want to connect a lot of masters on the same bus.
+	 * This timeout is used to determine the time it takes to take bus ownership.
+	 * The transactions are very long, so waiting 35ms is not enough.
+	 */
+	adap->timeout = 2 * HZ;
 	adap->algo = &npcm_i2c_algo;
 	adap->quirks = &npcm_i2c_quirks;
 	adap->algo_data = bus;
-- 
2.34.1

