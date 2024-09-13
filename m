Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A58977D11
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2024 12:15:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4qtn3QQxz3frs
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2024 20:15:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726222508;
	cv=none; b=QfGOBuhHRMnq+f5jfrLwCNmkZdux9l61HYESVOFraAESiiPUbFLmcDoJ4wwRBzNejvz+rzWAaqWWehS1OhK44wugARH30+cQNBBKSVdkOBsBktK6BRoq5NwEJu03VK+B47jfsrLsTkpF3c07Wy6NJJHbD00hB5ube+A1Bu+DuxOkC5qrTUWcVx/OjKpw/HGwheB990mbNvEIbjZZ2ib3xbpzzg4uD6fLTYnBLYfAdgBpgASSGUkiFkQxcL8IL721W3ULVWfBI7Fb5gLNSBq4t9t6qN5zAiT8I26L+uoLLxub6rYKHL69/bkXkDmILa7bNnzHzSjGSsR1aipFENldzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726222508; c=relaxed/relaxed;
	bh=+lNWH+DWa3eDq8AH3LvUTVIxzt2zHamk6bE/zjqY3t4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=aiVZdxKVyH1W48e+63sryFk3QcJz0DOx0oQd8hKjfxqUlShy2w6ScqB4+7M2lMy8cwetJJXUArqdI//MwTVDaRS1F+h+zigvlEC2TBxsjI/Ti783F2VSpr07R++ScdJ+Xeo582gJybSCGJM2wdsTkOiYTBQgKYZC5lK/hjsVZY7yeqb1XVW/AUDGREVXbFSSNNRXcHkM3E/BZz0boATyqa1+ikHkq89c1UoZXlFkyL3uN9gkk/m0wKEOkNr8wpMPc2KHJZFDIo0NgB114AJSkPhbacLsxnldNBlxfFKjS+BvmruI0CyzpnjJBP/vFIsRBG9BR9lvoOuEPfvVqoI1sQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gvcHt3Ms; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gvcHt3Ms;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4qth3ytYz2yvn
	for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2024 20:15:08 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-718e1ce7e84so1454585b3a.1
        for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2024 03:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726222506; x=1726827306; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+lNWH+DWa3eDq8AH3LvUTVIxzt2zHamk6bE/zjqY3t4=;
        b=gvcHt3Mscz1EPhYthIfHkDc01DYSbLjkILCDMu3UQVIePVKu8TQKsYnjH0APiq5BBT
         z1SbKjBSJMv61knJ8YaU631AVWP3fLaFLB3V3xSsK6R4kwvZYlFbzhoUzCcDEBKAxLD0
         sW76Z6DXwp2vtbrcG4+r84Z23d6Z1Ots4w58s4bXOUkRHGb62k7KWEfPWTWpGJYUW3Ki
         3eOybq0fk0Dklg6hGQaFg/o3yKFfoJt57WlCPXjqPR1B7GVqhLadHz1Pp6O3BAvzzFBO
         wvPepT91RcEGQwlMLdjCVPD2zyD1CK4i1U17E/151I3BXJK/W2Vv96mD5t2B6r0uj5Cm
         AR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726222506; x=1726827306;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+lNWH+DWa3eDq8AH3LvUTVIxzt2zHamk6bE/zjqY3t4=;
        b=qh9AbB/dzbNqOM1fikLuwo/DEmjb9CDJOFqVcqwL0ao1m8AmRaZ/E1tTXxSGN9YqgO
         7YPuzQgCn51dnlWXroBxOYG3msQvcLb2Nra8LosASasxvCfPLZYWQ7uaQhr6vwaJ6+4c
         oxkHLt7/gy8HqmHtjDpZI/ErRCuCrLcHDwUvqlITJEfsvJhWBPXa25orAB6BPXhF/rGv
         p8ddLS/NdqcGvfvwZIibXKooEd0vWwtsR2T5SZcDbueChIYZkn40f8uyj5LT/y5zl7IT
         hj9d8EwzognK5KGN6b0xIw+UDnaxuu85NsHJG17DkAM3irGsJwF2DCp7mOP51zlI9p2G
         Hutw==
X-Gm-Message-State: AOJu0YxfBVnPElNhPtvhY0yvegqnWyiuIBhOfuWUEa3E5HcDs4X3Zxz4
	dCeDv4HHfsSN8Qo3ixTLBfJT4TTB4/vyTGspiz0rIyeRRrKk7yM=
X-Google-Smtp-Source: AGHT+IFkQIjgXHiTd94AxNDF3ip5YtwQx/bfdofzs4R3oG35nn/iGiGqXD6Kv+age9FTZZNr2xySig==
X-Received: by 2002:a05:6a00:139d:b0:714:28eb:ff5d with SMTP id d2e1a72fcca58-7192606bc67mr9246021b3a.8.1726222505742;
        Fri, 13 Sep 2024 03:15:05 -0700 (PDT)
Received: from localhost (2001-b400-e334-c33a-b4cd-4a8f-209a-cf54.emome-ip6.hinet.net. [2001:b400:e334:c33a:b4cd:4a8f:209a:cf54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm6008428b3a.93.2024.09.13.03.15.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Sep 2024 03:15:05 -0700 (PDT)
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
Subject: [PATCH v3 3/6] i2c: npcm: Modify timeout evaluation mechanism
Date: Fri, 13 Sep 2024 18:14:43 +0800
Message-Id: <20240913101445.16513-4-kfting@nuvoton.com>
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

