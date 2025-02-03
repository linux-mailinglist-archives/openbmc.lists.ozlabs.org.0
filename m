Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A690EA2610F
	for <lists+openbmc@lfdr.de>; Mon,  3 Feb 2025 18:13:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YmtMg07mGz3bWH
	for <lists+openbmc@lfdr.de>; Tue,  4 Feb 2025 04:11:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.199.177.27
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738602713;
	cv=none; b=ItaCvNDMt09BCnw4iveC2g/XttSv/HZqPPBrjCj6hDC1nArOh+6bWFMSUFWWOblRUboqXG4qQxUd6BtLrAh7zeDw2sGKaoRrMDoTxMLOrvnZIHxrR2Hz03xRuImbl/brCt8Gp3gqbn21bfMX3Sp5QBBx3JaBnBSWY3RqjXTnR9hVquIMM1MdD1DoZ1NDiVyU5mjJDmzHOmdTCJx+0EVi2uv2bjjU3Emyx7OBwPf86XEWjFggUUAkb/vUx4tKwRYJt34h3ga/+tmb7mZGzUNyENzaEov5yDODK6nqE2J/hVw/OBmgobc28/FLSvOLDK90mj4x9Dt9pN9o1rOUHe6raw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738602713; c=relaxed/relaxed;
	bh=CE48jNRbCMJjzwxvUnZKPr2PP4f6gDslXVSrkY2nmH4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q5mmXuXV3VVZuSozdMHR1wR140qhhQAnfDoA7jeQrP6x3GE+ht29uq1+aZHUHalJWYCGFe2FUB+2ihpTJdx0+b7b0pq4SX7ksOv6/J02Il/CCCdat11X4J/iTn7J7qCP026+SclnypDafpYdgN3ybgXJqH2dkVAbrOq/XNyFppaBPqtCTI0OYWZNEEnlqni9nFuraIdLeVI8QHANJePpE28ZMe/xih15Hsjs313VnRujoMGSXbhaNk5GW4AqoXDSGxXbRYy7RLiCJmA0iGczyVM6k0XC82QGoti/xNADE4Jh1oDsc2I17aIRxSseDKgnRpORpf0aRh7D+deZnUOSww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org) smtp.mailfrom=taln60.nuvoton.co.il
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YmtMW2Ftkz3bTf
	for <openbmc@lists.ozlabs.org>; Tue,  4 Feb 2025 04:11:50 +1100 (AEDT)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 513GF1Sx006493
	for <openbmc@lists.ozlabs.org>; Mon, 3 Feb 2025 18:15:01 +0200
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.43; Mon, 3 Feb
 2025 18:15:00 +0200
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Feb
 2025 00:14:57 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 4 Feb 2025 00:14:57 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 647925F651;
	Mon,  3 Feb 2025 18:14:55 +0200 (IST)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 64AA4DC3281; Mon,  3 Feb 2025 18:14:55 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-6.6 v1 5/8] i2c: npcm: Modify timeout evaluation mechanism
Date: Mon, 3 Feb 2025 18:14:47 +0200
Message-ID: <20250203161450.265480-6-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203161450.265480-1-tmaimon77@gmail.com>
References: <20250203161450.265480-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-Spam-Status: No, score=2.9 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,KHOP_HELO_FCRDNS,MAY_BE_FORGED,
	NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Level: **
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
Cc: Tyrone Ting <kfting@nuvoton.com>, Andi Shyti <andi.shyti@kernel.org>, Joel Stanley <joel@jms.id.au>, Tali Perry <tali.perry1@gmail.com>
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
Link: https://lore.kernel.org/r/20241219090859.18722-2-kfting@nuvoton.com
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 3a695ad24018..bef27c517b38 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2133,19 +2133,12 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
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
@@ -2193,6 +2186,14 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
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
 
@@ -2330,7 +2331,12 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
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

