Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C86984CB930
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 09:36:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8PTN5r1Mz3bt8
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 19:36:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=h9EnuvlR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=h9EnuvlR; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8PNg5rFVz3c1Q
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 19:32:03 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id c9so3925585pll.0
 for <openbmc@lists.ozlabs.org>; Thu, 03 Mar 2022 00:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1s01zZHFACuhxfR/67Ujv9UUKWNEX0HdJ3GBxp+74ek=;
 b=h9EnuvlRu+k08wZ1xmmTF7IwWtV1tRvstde2NDAaEbS56B9/cC/dSXvnvUBF6aRql9
 qvZiDBiUnKnw4I3xtb+d6T/2oQrSGzXP2q9ZSoU5PoJAsK4qVaGWN2onX7xTFzGqXUVR
 +uOAJ44Op79v5MUpssAOvimujokoJvGT3cdnrOOpnoxwDmle3LZvzEnT5dpVtKxZrRu+
 70OIkS+GazTu4nwfZYN4GUyQyukAi6edfEOCxkkndauTLiv7FmPBq+37rvepySBCqkom
 LuijPPb3oQz9FWMUAcaCfQfNqIKQ5KKdaaCno0Dd074Sed3PJoJXfh3jh28LH+EzyU+8
 2NFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1s01zZHFACuhxfR/67Ujv9UUKWNEX0HdJ3GBxp+74ek=;
 b=5wZaPzgZ6DOZP3mPNoMEv2oGrVMyXbJU24oGzwtxSrA96OTod8to12kMf4iNKdXjNp
 SvOJQFCeOKyNRFJGyrd+ICoY1K0EnTHe37CVd5CYPkz8sXc+Z70p5ps7xgMhtEmt/+JN
 1/xOCbe0osdz/sX0z1YF6Qzc7V6hM2T2pcEO9EvuZbzm6Pv/9u5n4rojG0IIT5c9LHr/
 P5EXnOIh22GXZKAKUHOtRaRve7d6qtw8dHcQuvh9oZNknIpHUnhyNHvAtMebacS1w2NZ
 ulPBeHhahM5EMKHC+UmT07dC150hYHFTc0OoFG0PHOEOeyOyLoHjq9aE9Agt+xvlWuHM
 N4wA==
X-Gm-Message-State: AOAM53127ro7sCH/YAbnFUhXaPPBcCY+iPX/euf5HvdkTuPQlpILG2Il
 NFH3zsRvtOIRD0hfWy4BQkQgWf+0oG+7
X-Google-Smtp-Source: ABdhPJzu1aZd+ZXqRi3c3bMSPY4hVoGU7gtwGYWJfi/4yzvj++fhZP6zPrDm68RRtnvJ/7UlG0piNQ==
X-Received: by 2002:a17:902:b210:b0:14f:d0ff:46bb with SMTP id
 t16-20020a170902b21000b0014fd0ff46bbmr34893256plr.47.1646296322428; 
 Thu, 03 Mar 2022 00:32:02 -0800 (PST)
Received: from localhost ([2401:e180:8860:3b30:e4a0:392a:996e:c525])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a17090acd0500b001b9c05b075dsm7348851pju.44.2022.03.03.00.32.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 03 Mar 2022 00:32:02 -0800 (PST)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
 yangyicong@hisilicon.com, semen.protsenko@linaro.org, wsa@kernel.org,
 jie.deng@intel.com, sven@svenpeter.dev, bence98@sch.bme.hu,
 lukas.bulwahn@gmail.com, arnd@arndb.de, olof@lixom.net,
 andriy.shevchenko@linux.intel.com, warp5tw@gmail.com,
 tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com
Subject: [PATCH v3 06/11] i2c: npcm: Fix timeout calculation
Date: Thu,  3 Mar 2022 16:31:36 +0800
Message-Id: <20220303083141.8742-7-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303083141.8742-1-warp5tw@gmail.com>
References: <20220303083141.8742-1-warp5tw@gmail.com>
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
index c41de3afcf38..3fd30c38b3bf 100644
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

