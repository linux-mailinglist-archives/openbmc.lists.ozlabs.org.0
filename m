Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C1F9A5A51
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2024 08:28:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XX52w4yLSz3cfR
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2024 17:27:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::c29"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729492069;
	cv=none; b=is6Qa1T3WNp8RIOR0q0LstNudkuTpCIcA/BoymXAjjlp/AcU8I85P4iLgPu2EuK6X3OnUW0tzi5daYOVlJL5B2D1rdMxI+OGUadwrteelQH3K6GlxzdNEH12QUaqo4kgzPDJsMChIAvGKYGaxBQlg/VwW33Vk8PaejZrQWljouH9I8bBoQ1wWd3f+2DyPLTz832Ac4ZIckGnssXGmCT5S7pwBzEXrVOgbk8K7RzHzxJPGWnaD8Y4QMVO/6kEriN/Li0M2JtSBbf2f+ncpiA6v0g2ugFCl8Ei86pWVb2+9q7DORYdxO0w10rLQP7GTZP4HGzDWYcNKy3j6qVSXdji3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729492069; c=relaxed/relaxed;
	bh=sUTvgfGYPu+IPYUs2nFsjwTZ63vlpmHE9eVnRYu8l/s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Wf7CySfUN8+4odzi8Cq70TNsRd6l7tzHpKsNxrnWyx73O3Ng2XfEV3zOaMGr0p5nMSm5FiT2Br8qiXwCLYjBCbtg0azzu9ORXkfyb9u8ES/ROzL2GZOodXVkj2KC5TN8TVSEHo75WHUbeBoOOAR5JGA7AnIGMWBQXnwueXRi5wdqoMG48CvczI1FaGF/eDEOo4uNR3shtqKvIwbu/3Bd1subeoMJW/BQbpDWx4ZxEIfA+MwBkx+CytwFv/qrUV0amHdZ8Sf+iouBiQBdsTFnPwUyqPYVWxp0Q6r8tX3gEqomsgDz04olD9WLisOYf7aW8lPvia+0yVcEcVoGHubjfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fbZez3WI; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::c29; helo=mail-oo1-xc29.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fbZez3WI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c29; helo=mail-oo1-xc29.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XX52r6njwz2xt7
	for <openbmc@lists.ozlabs.org>; Mon, 21 Oct 2024 17:27:48 +1100 (AEDT)
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-5ebab72da05so780365eaf.0
        for <openbmc@lists.ozlabs.org>; Sun, 20 Oct 2024 23:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729492066; x=1730096866; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sUTvgfGYPu+IPYUs2nFsjwTZ63vlpmHE9eVnRYu8l/s=;
        b=fbZez3WIQ9CVlkukQzRJzjJL8zCkyXOVgVdx+fV9CQe4DmpmwVJq9iROoGP0v069IE
         oXXoCIpHCRUh+JNJZYxrTYRwlN5sNrGgGehawwEioNdODpbY4FwQtKOUFhufura1hgnC
         x/vi1kDJMeaTabhH5I09EjKG2R4caUaS2IapY7hwT2PfNOMUynlYigG3WdmMAoEpASrO
         Mppm2HXLOA8QyG7Ja5sP8ZlPlh/TF9nK8XRvzknoyHfB8oPkZbQylU1ac34yCE6Z5H1E
         hMBLfjb75W/BjeSXGXKH1XfG+osZr77GezhTFec23GKrh5R98opErOv49Rkjj55Ena2/
         pXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729492066; x=1730096866;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sUTvgfGYPu+IPYUs2nFsjwTZ63vlpmHE9eVnRYu8l/s=;
        b=vT5wB+WanJ0Ql5zsqiVsRoV5GI61ipglkx2/R/4yKtxDByLbcBA0lHB7/01bvc6/te
         AnfjiK0XV+wwmO1oXrByFgG4+VnTJxQTi75rRtVJstrdJqy0qXXNPyxgZMVqiqLRAoym
         mgGeSbyOCO9mM/2qAZk/RkVzjk8SnceXvrf7pJHVx1SM+McEmGTjWcfdObzNRKlDwHYY
         9gUdOWFwxKgjH7oooqfkrFJ6FPMAj6pHQKSN8LNFE0K11x1UGMjP7l0y1vwpqtRfmeH+
         dBt/x0igGs/DaY6yKIA/ek6d3A7eSk8nrnd2gxdFH30WSSlCkSnIA7TUrpDFq4YbJPgq
         U1dQ==
X-Gm-Message-State: AOJu0YzkfCXIENRViWZqBH26GCj5h2AS2LC4ViI2zCEutPRooXfz+rPK
	VHKudn6ikQJsgCfZKCFQl1Zvmbh7BFlHDfgmWlRG8wpN1nou9yc=
X-Google-Smtp-Source: AGHT+IHXFpGt4iiRUIlGVH5w+pBnrMBboGpG2Ymd4qdxmuGSF5e5EeGMAmpyycMQlxG1eWqKT1viLA==
X-Received: by 2002:a05:6870:b015:b0:27b:55af:ca2b with SMTP id 586e51a60fabf-2892c2fb8ebmr7399401fac.11.1729492065808;
        Sun, 20 Oct 2024 23:27:45 -0700 (PDT)
Received: from localhost (2001-b400-e38e-c9a7-dd38-775c-4093-c057.emome-ip6.hinet.net. [2001:b400:e38e:c9a7:dd38:775c:4093:c057])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13139a9sm2169152b3a.12.2024.10.20.23.27.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2024 23:27:45 -0700 (PDT)
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
Subject: [PATCH v7 1/4] i2c: npcm: Modify timeout evaluation mechanism
Date: Mon, 21 Oct 2024 14:27:29 +0800
Message-Id: <20241021062732.5592-2-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241021062732.5592-1-kfting@nuvoton.com>
References: <20241021062732.5592-1-kfting@nuvoton.com>
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

