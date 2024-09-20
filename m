Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEEC97D41E
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2024 12:19:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X97dm5YNqz3fTy
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2024 20:18:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726827528;
	cv=none; b=Y1Xnekc0JRs9PJlrihS8vT/Mifuibdf+Or/9Hu2hRQbaSO3reFbuM/EJWoHAT0xq4fc6xvEkeatJPqXMvDlETAxbYtvPCCV+NMtKpr5ixf4jCeEJPPgh+LDyZozn8sHnKtIVt+QCFNMBWbczHewgboq7T2SSar18WOryexXNvyidsJEFBx0sHpm3Hc6Nlx1VvYMy5/ZMD7jopUu+efvguVLpTqnTXRp5W2WHnMWnHctTokKitKzikjmioxwfVm75ZpXnc5OdvgYNyQWzxv5MbGCW+efllk2lVeZQGq90+WpTczy/JONHVNTWTIMEN3Hao56dydJDznq2Pa7wPc54Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726827528; c=relaxed/relaxed;
	bh=lZSv8oOEI8/EIuYdQcnCnzx+K0Uspaq3vNp+9LNmgdQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=GFhaJQMw2Woth6K/ovPVz5OJeTRu8U+HVSVtTECztHr5UBWeFP7epGCHpbitinsUFbxlD9aKVh5GdH87QiZFlCAhxD3fHTFeUDlXhOMZpiYvDfNsuMublksWu1aCd4S7HSLwpwREGzlfaCN7B5d0ANTSYzt0ZTMSRWG7mcWWLnsazewOLjTcz3sl6FQ7dzwXa8eYgNufdZQ+pOdZOP/z5GBcHCPSCn8sSilIX4Zt9TlqpftV7DgREoapQ2HKf3xyxvPI5yEOX1kb3HAxrbH++OvSN0uUAyoFX1U84J4yA96KTftnnFyrg3T9+3NB2IRNH3KWiaP1qkMfVkvuV17Pog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cdfBWtvC; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cdfBWtvC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X97dh3Gy0z2yZd
	for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2024 20:18:48 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7198de684a7so1359577b3a.2
        for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2024 03:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726827526; x=1727432326; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lZSv8oOEI8/EIuYdQcnCnzx+K0Uspaq3vNp+9LNmgdQ=;
        b=cdfBWtvC2A9HaZdJQx23NYmFJBet/F64oVTCn/Y/ssJNNYfkLHedguMkdbodMVjGH2
         funbKSKhoWcUobJy1EnMMPky+Ax03o1B3PubW4hiRCDQ16JqAEXK4OsMTFlfQsKrYNoW
         i74r2MbkKITDL5BVrVOQGmpZGGD3VjEeK73r7TJrNB8zIBipQ7hiwAVRcTM8laUaVYkM
         g+R589YVl/sOTqLu741Gtw/cax14kM4Fq88+VmBoIflVpSTChsdA0dWZ/8YFedVvRLDW
         sUP3r9KwCC2pL1gb9wTI0Dau43UVaBpqQcGDkkgqKZjSMSnwn8K6vQqt93Jt2w6vJjc+
         6iUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726827526; x=1727432326;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lZSv8oOEI8/EIuYdQcnCnzx+K0Uspaq3vNp+9LNmgdQ=;
        b=nQJZzwWWDDwtgHeK4BRp2IXKGzMbN5CppuPF7Z8l/TrhIFVZhsmCQArGVTlyrJBGUn
         mjS+YeSHUe4j21iJD5DMJ954hZCbhn+d+thj5P/XvBQqrh/8KpAglEJ+bZYl4A+W42jv
         GEmLuXo/V2FMw46QPs9ZhJCav8Zl1N6Fg9T/QxCGjuZKLAXL6ifGsRJ+BPjyAN/1alMo
         oeQQYEWh6aou2xIsKi4R8BAOUn7oahL/aZUBiZ8lL34+5FfytFaRV7ZrpSkCYFbCiiME
         C4T4uF+6E5mHfQfCH15ZTQ0fQ9xzWiAaR7dwrMBuWs0Z50rFxNVqVPe0xAn9ZN91ww3R
         yd1w==
X-Gm-Message-State: AOJu0Yy+HZ3ePrx1U3S2JkynBMejagefJeYAtFF7Bm0TzeraFVO/zTvZ
	6yrpeOnvyKSjgXQNjBXZJa++ndBTSe7NRpFNmgTnmRP+8QAiNHg=
X-Google-Smtp-Source: AGHT+IHSDCa/ky7wcHHV42EjmxrVc3NqFczZgvBBAeriIPMSqpxv8ezg6gAsrGgsDVcTzPcy7dQWKg==
X-Received: by 2002:a05:6a00:1956:b0:719:7475:f07e with SMTP id d2e1a72fcca58-7199cd7abe1mr3335249b3a.4.1726827525919;
        Fri, 20 Sep 2024 03:18:45 -0700 (PDT)
Received: from localhost (2001-b400-e35c-9cc2-447a-d760-d4f6-01f4.emome-ip6.hinet.net. [2001:b400:e35c:9cc2:447a:d760:d4f6:1f4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944ab50cbsm9550284b3a.53.2024.09.20.03.18.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Sep 2024 03:18:45 -0700 (PDT)
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
Subject: [PATCH v4 3/6] i2c: npcm: Modify timeout evaluation mechanism
Date: Fri, 20 Sep 2024 18:18:17 +0800
Message-Id: <20240920101820.44850-4-kfting@nuvoton.com>
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

