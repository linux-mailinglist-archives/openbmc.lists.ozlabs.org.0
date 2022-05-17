Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6DE52A22A
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 14:56:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2bjT2ZyCz3byS
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 22:56:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=akU7xpus;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=akU7xpus; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2X3T4hXKz3bqk
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 20:12:05 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id
 z7-20020a17090abd8700b001df78c7c209so1984184pjr.1
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 03:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=U1ZOSVbfziWWzBVab8oIymA4zFffiNgJBszalmSIU3k=;
 b=akU7xpusbKsA9jTmK+AAyLyo3rt7dAfD4QOXvkQKPbsihQBY5zGhMZ77fsPR0iyYP7
 6/4OvwldWiQMbhtwJAG32VI5vOlsoUSB4g5cWOuAL8OBAqWbEjNIH40ScuxOFjNTX6CU
 vQU8KAuxOuUoo3TsPQmU57J6Fdb1rGZ4TIa8W+l/8Aq8yWCu3FXcYWrIjpwaAh59Gytm
 EEfvCFYQ74mOupaWH0bsBWliZJCU4NqxwhvJ+sw7jI5Lts4ji6fUTn9gDhVXnQiHYbWM
 7V1WFejCLCVSIf70vJZbmnO1ozfHreF4+5JDU8m9wtryATaFVf7viwUkgukCDLnbhUBE
 X15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=U1ZOSVbfziWWzBVab8oIymA4zFffiNgJBszalmSIU3k=;
 b=7ru/g/15cSKnrz7w+kJeaFJazu/eTyf8CB/1HWP1xO4nMl6aZgcdrXsvN6t7tlVxWm
 72RaQgTceB9nNaesg3DUA4k6ai1oEkHijGZ8p/JIVPwjv3jlihaDhovLClcQJh7LoRxV
 K9b8ZyN5lB3IJAm+q2ivnyI0lMk0VRw/gBtpucIGH9L9gK8Qdlo/7wHSqsj/VUMWHcNF
 8bvPu3LX7sNx5s74f/ZC+CiMs9XJoCpCiX0vyAEgaDFCohf69JckCyWmjq6wdaVx6h8D
 g59V1UfFMQr8UbP8dfAoAy6FdnRQ23mSxXPWRn1kV50uL/9QxBEsY/jMiIM0MHw28LrE
 u+yw==
X-Gm-Message-State: AOAM532GXqiTEmyym3UPLMt+wT3bRfXQeMo7kEHpASP/oNX5dpzU/Vcc
 wVez5flxrmXZcmhljMq6aQ==
X-Google-Smtp-Source: ABdhPJyAXOqyldvFMK3vjOTZD00Ehx7QEsZQs96nfoiU0wOGfteyQdSkh+t/73y31GLrpaARikiIig==
X-Received: by 2002:a17:90a:8807:b0:1df:78c7:c215 with SMTP id
 s7-20020a17090a880700b001df78c7c215mr5295386pjn.234.1652782323316; 
 Tue, 17 May 2022 03:12:03 -0700 (PDT)
Received: from localhost (220-133-130-217.hinet-ip.hinet.net.
 [220.133.130.217]) by smtp.gmail.com with ESMTPSA id
 b12-20020a17090a5a0c00b001ded49491basm1909954pjd.2.2022.05.17.03.12.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 17 May 2022 03:12:03 -0700 (PDT)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, wsa@kernel.org,
 andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
 semen.protsenko@linaro.org, rafal@milecki.pl, sven@svenpeter.dev,
 jsd@semihalf.com, jie.deng@intel.com, lukas.bulwahn@gmail.com,
 arnd@arndb.de, olof@lixom.net, warp5tw@gmail.com, tali.perry@nuvoton.com,
 Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com,
 JJLIU0@nuvoton.com, kfting@nuvoton.com
Subject: [PATCH v5 04/10] i2c: npcm: Fix timeout calculation
Date: Tue, 17 May 2022 18:11:36 +0800
Message-Id: <20220517101142.28421-5-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220517101142.28421-1-warp5tw@gmail.com>
References: <20220517101142.28421-1-warp5tw@gmail.com>
X-Mailman-Approved-At: Tue, 17 May 2022 22:52:11 +1000
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tali Perry <tali.perry1@gmail.com>

Use adap.timeout for timeout calculation instead of hard-coded
value of 35ms.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 550e4a4d1e01..489b4c8ad0ee 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2047,7 +2047,7 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	u16 nwrite, nread;
 	u8 *write_data, *read_data;
 	u8 slave_addr;
-	int timeout;
+	unsigned long timeout;
 	int ret = 0;
 	bool read_block = false;
 	bool read_PEC = false;
@@ -2099,13 +2099,13 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	 * 9: bits per transaction (including the ack/nack)
 	 */
 	timeout_usec = (2 * 9 * USEC_PER_SEC / bus->bus_freq) * (2 + nread + nwrite);
-	timeout = max(msecs_to_jiffies(35), usecs_to_jiffies(timeout_usec));
+	timeout = max_t(unsigned long, bus->adap.timeout, usecs_to_jiffies(timeout_usec));
 	if (nwrite >= 32 * 1024 || nread >= 32 * 1024) {
 		dev_err(bus->dev, "i2c%d buffer too big\n", bus->num);
 		return -EINVAL;
 	}
 
-	time_left = jiffies + msecs_to_jiffies(DEFAULT_STALL_COUNT) + 1;
+	time_left = jiffies + timeout + 1;
 	do {
 		/*
 		 * we must clear slave address immediately when the bus is not
@@ -2268,7 +2268,7 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
 	adap = &bus->adap;
 	adap->owner = THIS_MODULE;
 	adap->retries = 3;
-	adap->timeout = HZ;
+	adap->timeout = msecs_to_jiffies(35);
 	adap->algo = &npcm_i2c_algo;
 	adap->quirks = &npcm_i2c_quirks;
 	adap->algo_data = bus;
-- 
2.17.1

