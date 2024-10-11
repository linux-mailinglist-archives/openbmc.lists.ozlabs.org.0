Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4316999C4B
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2024 07:53:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPwl66lb4z3dJs
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2024 16:52:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728625968;
	cv=none; b=jhFQdilR5fZl7ql2RnDhqiytLaLbBViDFR7tehq9O0bjbnaRUfD8BZ7a/ZHBQbfJQHvHOEnDrti5QJzbMgyk1uMhNmpuX+iN3yE7iO9zx5Au6B4mq8G7ZMDApH9Uz1Ol88LMkXuB63adPT0GDPYnvzyzDMpBCn2ZAHzHXvLcZLGgqbWocz/i6IsKS0Fs//9uTYEMWYrIQDKC6n94jGR9/VRGgT9zetVhhcfMU8n9JIigpe8wUf9Gff4njvt4pMPGd2guYyTdP12YilLq4W+dfbNLH7Bci0AhAdxOcc2VK9lI6MApEEMCKTDSBJdBo/dyeCBbzEuD7Ad/Qp44W6+JdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728625968; c=relaxed/relaxed;
	bh=sUTvgfGYPu+IPYUs2nFsjwTZ63vlpmHE9eVnRYu8l/s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=SLz2RJ+24ZjdQOXYpTWYWYOXo6dQqhRohl/fyA1VSXPUnlPnsL3Hx0dvXM/a7kycSseqcg/Shw+fo+fwdQ16Sk7N5gnZgiPGpiuKYgxT1MymRHoYI4XLyaAeKcqRIHBj8e9Ualraj/6b/+XG5oRSEn5B2uaxk9kcACPBm1hIcUKuEF6526uiZbuzq3Im8VLh9b/Gbe/P6XTLTRd7gXjlrqxdTsOAswmoWR0AF18ypNM5NnBo5mXf2Y179IJSXFczU9Tnf/fLEAhnGEUZDBmRksXMjzzMVeFm4hBVCjCnkuOJc1z0TGLathJlx0SpQCBo0UUEegO4LXXw3tsiyGWmpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Z3kU3+eC; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Z3kU3+eC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPwl24Qmrz3cMg
	for <openbmc@lists.ozlabs.org>; Fri, 11 Oct 2024 16:52:46 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-71de9e1f431so1377909b3a.3
        for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2024 22:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728625963; x=1729230763; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sUTvgfGYPu+IPYUs2nFsjwTZ63vlpmHE9eVnRYu8l/s=;
        b=Z3kU3+eCNGNecI0xW6g6hXGFwcwmbvleE2JZsKxQViA0kUlgqInIbEPwVlDBsudOSg
         BPcVIIPdeaEHE+QIUMZF2pc+geVFYwv6ExuUAw9pF9Mz3P1nX1jsaZjopMVpvQzMftBf
         rHKsB+w3mZOmiLyiXTs9Bg5MJ26vuFu30Tdy718wHfJoeTgLMvoOLEzw0Ymz1x1hEu5c
         HhE2dGBIpxuMua+nlSAljDoa7dm+y464XJXy1DD7fcLl8jJzbpTjlL7rqZMb2WJZmVjG
         Tdv3B3jqKQC9NmY+bSxQl2k3VvaVDRgYl74XKmFBI9z6+c1ucuhQFVYULKs1IO09W9Fr
         ZKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728625963; x=1729230763;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sUTvgfGYPu+IPYUs2nFsjwTZ63vlpmHE9eVnRYu8l/s=;
        b=nToAN+2Mb50NHoY6s62+1NZuLhHUOofo6VHaK/WCsHf1D++Q8dF+1SxX4IPNU7HHhE
         Pz37u3AIFdovBtku3KMuY/VNc82I1Buc+HwsS+Pscg239NFByZ2ktPWpNPikRWEJkJJo
         5+CTZexhtIILRJKwGelxePtfRxEEvoW23TBtPgFbiHN7IpS+/GylFrZKSLWhYOJHbrRv
         RR8NSDGkgpjWfgwrnZ71P2OyiM300qKTzXp5O378Nv6f/tukgd/rNU9zZc+YEN4IpTX2
         45ZmEXr8M1WgQwpul2l1196fY4o4sX8GMVDaQ3ikZqhYfntFiOjg/NRBe12z1lmNMxzb
         0jHA==
X-Gm-Message-State: AOJu0Yx7zse6osajAujJegagzUR7xyZFGFYSDV2STg3UMyTEPJhpvdS2
	CHemWAe47ONfvABjDNQAaySAbqyDyso//bEl/+ry6KUE9632YKo=
X-Google-Smtp-Source: AGHT+IFUResKRCt/Fii5kWLbwdloA/fVaIaBv1jKqdZe/ZzANW3Qrd8tnYf+Z9klWGEAE9MrDIuY4w==
X-Received: by 2002:a05:6a00:13a6:b0:71e:5de:ad6d with SMTP id d2e1a72fcca58-71e38095deamr2504286b3a.24.1728625963465;
        Thu, 10 Oct 2024 22:52:43 -0700 (PDT)
Received: from localhost (2001-b400-e38a-6880-f424-8486-7476-9f9d.emome-ip6.hinet.net. [2001:b400:e38a:6880:f424:8486:7476:9f9d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e2aa93876sm1946980b3a.114.2024.10.10.22.52.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Oct 2024 22:52:43 -0700 (PDT)
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
Subject: [PATCH v6 1/4] i2c: npcm: Modify timeout evaluation mechanism
Date: Fri, 11 Oct 2024 13:52:28 +0800
Message-Id: <20241011055231.9826-2-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241011055231.9826-1-kfting@nuvoton.com>
References: <20241011055231.9826-1-kfting@nuvoton.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
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
returns -EAGAIN.

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 482a0074d448..c96a25d37c14 100644
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

