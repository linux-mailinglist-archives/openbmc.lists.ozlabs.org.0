Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 986569655F1
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2024 05:50:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ww3zr6wBpz3fyx
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2024 13:49:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::430"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724989747;
	cv=none; b=CPpy153+/AVUw8lkS2r3gfXdedSw8ryotrJQQMYPHs5YNd6aUyvr23BOZiE2TA1rMumA5tUPgHcG4wqvMTqCxP9v+XPspAKocqH9zQ/TDj1luSQyn6EXnQBqa1lhHH31E0jrfWgdz4I7B2vTAGbC/3eBVKxRz7rQdn38pZU9v/wBCdOSefT1IpY+IATf6d3IRcI8Kmax9KtFt3F/xvSmz+6HmRg0QkCR+h0UZJvakPdNU9WifGWafO/kf6WjBpNJjdpNlnJgJnvsXEp8SC5Hc3aLSV7KxAiyLC8bkeK8GLKH5sXjtILCVqo2sNpo6QGroZwi/x2I5JzKenvrG1sNCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724989747; c=relaxed/relaxed;
	bh=cFFhN9HcVpSrQjxOStAWMyvSooZCtuwnj1m4QBUIlEc=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References; b=lv+mrFyKdhhjtA/CRD58XE1we9CTqsOlsucJAHBZm18k4iqF43wpRd7r1YEgZ4t/rlBz8vVDnfdFEG5fgMz3Mz/9snQDVw8AXtmblux756pezN6E1x3sI0wiauXhHndGFVulf51RmWUVmZim6Z8N7oWV0OXJq8l7ifZtTecegjQZ6qmRCy8fwJgPTZtsw49pQbIILi4KP2VBH7RgUHjY6MGELfzPo2fwE+Yg/Aw1hQcq5GQjAscyhr/ew7keKG3zbBKD8rhDsdb7i6W+TY+nbkXwIxoyjICs7dVo4/Iey1OfTUjTd+2wfOIquicdxuFFSZXohbIVSltdFy0ZLzYh+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=khq7AvsY; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=khq7AvsY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ww3zl29mvz3dBb
	for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2024 13:49:07 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-715e3e03831so1302897b3a.2
        for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2024 20:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724989745; x=1725594545; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cFFhN9HcVpSrQjxOStAWMyvSooZCtuwnj1m4QBUIlEc=;
        b=khq7AvsYgfbXesS6EPgM3AJXVR/RkyiyhObNsLS6B1wWo2rzZL70KKRvCNQXeEpQ9v
         5GQ+YNmIeRZz0B5RtcQDlY8fet7sZwJ4iZyb13MTJMy1bKbwQT7NeeNr2g2mm8xRM2oo
         d7oUQ3owxXJzbzTQEZpziGuRrcVGU2nUob/TEv8rnykttVEbCWj+6Hm0OQyrtIFn6OGA
         y2JWrUk027DNnp3ZISJYEyEJEAZQXR++hJ0Qu17lHmRbyIam3beEQ88HaE9kMkUVNEs6
         rItFu6Eji5Du11vDRxJQG0UaPubJGgNmfwuZ33zzTMMiBBUoP7nnVLiUECxVmpWjohor
         UGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724989745; x=1725594545;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cFFhN9HcVpSrQjxOStAWMyvSooZCtuwnj1m4QBUIlEc=;
        b=ir2sTbHZLryUDY7jMNrtgM7IIGdqnf/vQmzIX8tnHToUTddDhvsW4XR17ZhXBC8c8V
         L8A3vqg6PWc/tMNJ/ClXkW5t5ktZb72SmZxRA+LLqTZhJmhd3nss7eqHRBawo9l0EFlL
         lnnjXNuJCepdNSdrgCaUKc1eBekV9DEVnrS9zIUrGN6lB5NY5ekZ5TUu1n4qnTtLRoII
         +ugNBtoRrNCujTSlGQaf2U9qSeeDUWg7NRGUEwASyOnf//zi9Wl1ouryUR548kXABmms
         ZbGi+AawEAJqRf54/bfbJw+CXpd0lB1xoX58iOF1f7+O+kx9Wz4KXh0Mb1XjrRSey9Du
         eFaA==
X-Gm-Message-State: AOJu0YxS6B5JbRuVtOUDy17HHdXiWA5DIhk5CN49eS6knkbAnXMVFKkX
	PJVvq01IJIiKUwnpwXqV+v1YZSkhiAt0CzNjZRfh1ThSq6ErRk8=
X-Google-Smtp-Source: AGHT+IHEpVXKGjF2LZ1pVuYVBlpa86aRvwDx4kouHAiEOcK2KSzv5yMkj9qgS93kkIrDko4JqIg0wA==
X-Received: by 2002:a05:6a20:d046:b0:1c4:944c:41c5 with SMTP id adf61e73a8af0-1cce0fe9b8cmr5467725637.8.1724989745036;
        Thu, 29 Aug 2024 20:49:05 -0700 (PDT)
Received: from localhost (2001-b400-e338-dab5-746d-1a82-f21e-bb0a.emome-ip6.hinet.net. [2001:b400:e338:dab5:746d:1a82:f21e:bb0a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20515544c78sm18342555ad.201.2024.08.29.20.49.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2024 20:49:04 -0700 (PDT)
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
Subject: [PATCH v2 4/7] i2c: npcm: Modify timeout evaluation mechanism
Date: Fri, 30 Aug 2024 11:46:37 +0800
Message-Id: <20240830034640.7049-5-kfting@nuvoton.com>
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

Increase the timeout and treat it as the total timeout, including retries.
The total timeout is 2 seconds now.

The i2c core layer will have chances to retry to call the i2c driver
transfer function if the i2c driver reports that the bus is busy and
returns EAGAIN.

Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_reg_slave")
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 2d034503d8bc..68f3d47323ab 100644
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
@@ -2183,6 +2176,14 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
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
 
@@ -2308,7 +2309,7 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
 	adap = &bus->adap;
 	adap->owner = THIS_MODULE;
 	adap->retries = 3;
-	adap->timeout = msecs_to_jiffies(35);
+	adap->timeout = 2 * HZ;
 	adap->algo = &npcm_i2c_algo;
 	adap->quirks = &npcm_i2c_quirks;
 	adap->algo_data = bus;
-- 
2.34.1

