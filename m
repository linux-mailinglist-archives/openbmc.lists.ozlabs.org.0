Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1549F77FF
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2024 10:09:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YDPqz3BKdz3dKb
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2024 20:09:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734599352;
	cv=none; b=fR7C5jkkr3Os1XRsoqDRVX/c9BWxr9bYY468CZMm+/XV683gDagPU3emVxLFN5h5w7DvMtKkGzyxeXLTzUoNd5xl5ZGJ/mF4Kfd4RF2HBaqWSV+RA3PMp/cGfMZE34i+vi2wlz/IEu1jdplwE88tvjXwJFfnRdCV9BI6ZdztpcvXJ1XcKPTh9km+mxXZIg5z72oAVZAO+Zmognxm7ifiW8RQPGLEFfSPq6oE68X/crzJEjE+OyEnscGMfYL3IQZ9jnZ99cbwuWCllwLDmz/f6j9pECQpme+uCBCxEE/R1mu+uU09Ntcvp4aVOCnueWyiY2+ZNo9jbvV5LAUEpBpSPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734599352; c=relaxed/relaxed;
	bh=sUTvgfGYPu+IPYUs2nFsjwTZ63vlpmHE9eVnRYu8l/s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=IFDpCGJ2srGIK0urmRxJJQDmeJomaQZt52ajfa4pUyvz+GGDquOwaruO8LiQUAlV7KcqiAQCefxvdA0/y4hkhhHwcd0wWR6NrHX8HKIdcMrjUHOida7laEgoU58wfPhLvhtQGvHkI2lm1jZK7CNNAJp4thxGJfvBw/1rQai7L/baVliRYy9UBbVPL5nqTcodJjo1Xu8lcqx3TAyFbiQeG+RDxi0DpRnuh3F/WH559+8tseaJhcgIPm6jNG9yPfUrrJw/M76o9Mo6RfiwMiA6itZ3UNPAt2yFIIzkRLsCtsTRUnlbmdmjTRveOEVhnrwcjyz3VCTT9T2VDZNvGOcCig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JOgKmyJL; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JOgKmyJL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YDPqq5bdhz2yNc
	for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2024 20:09:11 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21631789fcdso11091725ad.1
        for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2024 01:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734599349; x=1735204149; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sUTvgfGYPu+IPYUs2nFsjwTZ63vlpmHE9eVnRYu8l/s=;
        b=JOgKmyJLHVHNM2Sxmv0qFTO9xj2uLttcxTnNB887sZcHneTt9ElBiQLB0TaXbyYuZk
         yXPbZVT085PFm1xgsLv9+xtPZKGkB/MFq9SUehHhe7T3JpW+q3mGlsZBK/tu/BYjrWQL
         4NLToj1oXWPgrKdsUADKtpvMXHitBSGO84JKmL94VYVhKcKEQmihJgeRLRhc030TXwK5
         BAP7QNorE5JM3NdZd8+2YbxqZgZ+RTNTkwAb94R9iOxYjqNxIwmVfwq9Zm9vpJ7Ppogk
         Gp9IzOpGAJnGiPNgRCK+x+ujteKbjZ3qrYIOztg/IGh7reoF9mvQJ3uhFtLru65+Mhrl
         jtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734599349; x=1735204149;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sUTvgfGYPu+IPYUs2nFsjwTZ63vlpmHE9eVnRYu8l/s=;
        b=Z6ubuzJzXy+p5KtZTocMy3WsVg9U3AI/dVHCl12v9NcrI8nw3jWehGnqH+6tCPQc71
         bAt1KUMQy9u+xNB3SkyEi9/nJiwZuikqcw4FWNLWR8nF8ghGK4yotaXjWK4df4rfGKrK
         V/8RdkG9plWeH9IMPX+WLMtPCoV8qOPFIud596S4Ayj9ZIo5TIIY/wLSgvUp5QtUYzWe
         fiXqd4yVHXpbBwUPtE6Ixps3eYCNnaJCJf+JhSmD6JlANwB1AYH9+seegzusXuyfwUD5
         gCf8w4A7SqpSE8fvDKIgT2XJQDJYf/SfTbmf8hIAT++2ZG5wH/HIB0YrkyW0QiRTam1G
         FdWA==
X-Gm-Message-State: AOJu0YznSN3NAf9bwpgmmimJt16h0X6/TujTwmg9r9+aVslwFbfJo+05
	6FrZ+T+A2GNl6+/BH6jpQUDShRWBE/l/cmvLXqIB5jJZKXJC2jc=
X-Gm-Gg: ASbGncuybDLDnxvkJcAQ5szMHq7nsIa8fNpIdFccejkgbqQoGkZbK8TzS8yk6pcSd0G
	bAmPOOmuBKuGOaQKsKFdZ2xcTCMcV8qmte2YavAve0v6iGUueA51ZNGay5aaq1kcUXhoTJDJ1CM
	Xe8ANjaOms5Asde9Lwxcd0eIbJ+AWY4grTpNobak7RNT2RgR1OCm9nmVZ13YK3Z/BUdexRJkYnB
	ptNV+W2k5IIg6p7O2rIeB/0DNVP+y47WX/Xv6Na9nOKdSHnxnVZu7d1YCFjp9ZYC3uTPDJX3w08
	o8rCqqxzqrc0CPzR9fbFxtFov0gFzFbwSDTvRy7RT7AElb2I
X-Google-Smtp-Source: AGHT+IG3ozXV/JZXCvMKLY0p+P+fsSoQftBArX2wWb9Rq3a6/vq1cDweO1cvd0cvjFNqium7LTNmfA==
X-Received: by 2002:a17:902:ef03:b0:215:58be:334e with SMTP id d9443c01a7336-219da5d67f4mr41922355ad.10.1734599348454;
        Thu, 19 Dec 2024 01:09:08 -0800 (PST)
Received: from localhost (2001-b400-e356-b45b-f574-35d0-91d3-527b.emome-ip6.hinet.net. [2001:b400:e356:b45b:f574:35d0:91d3:527b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca0194bsm8086265ad.248.2024.12.19.01.09.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Dec 2024 01:09:07 -0800 (PST)
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
Subject: [PATCH v8 1/4] i2c: npcm: Modify timeout evaluation mechanism
Date: Thu, 19 Dec 2024 17:08:56 +0800
Message-Id: <20241219090859.18722-2-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241219090859.18722-1-kfting@nuvoton.com>
References: <20241219090859.18722-1-kfting@nuvoton.com>
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

