Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D705210AF
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 11:20:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyCFF2d5hz3brl
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 19:20:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BAXVn1St;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=BAXVn1St; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyCBF6H7sz3c7d
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 19:17:57 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id fv2so15357934pjb.4
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 02:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gP+plLDk5yRb5409QMGK9yKqiV4kS1Q3uENsLgiEyTQ=;
 b=BAXVn1StiszzHdVHviFtH5Hte/TEN5MOeyi4GE/2WZ0SNMYUUhi0CsGZT+GYssUHLi
 AhkqE9amGi8afYY2HrUpWhYcp7MZEdu2RY5ifmyyHhLlJ7D+H6vrujE5TQ/1exNZ57u6
 nTnSGDeULUqrGsavvzJL/4lV7V8zLzldtNK9Tx2kGFsFr99hbBTBFe6Gx7IkpQq/v9I3
 9h8RtQRrZaB3WpO+mggig4GN5S2+LkBGEP4ALKphdxHcatykoEAK3Jn/4zUYUP+xOBpM
 NOgbmUyMwsvL4ckJuE2de2Mc2JPiEFgkoKGYyAL9pg2CCJY7fB5Plojt3X0HbsTHYJWC
 SwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gP+plLDk5yRb5409QMGK9yKqiV4kS1Q3uENsLgiEyTQ=;
 b=SYvwlL4NTwkUZsGFw2XSw1Qoz0DBZUhzMdoyhzmDBFdj2w9lXMKed0eMYtqrmMLq3b
 W9b8ioCB+aGYNlRttywnMazLnaGlLX6k20uxoEDtZ6/lVh86bp+pcA7OloyBRQCK2ulT
 F/ZbkWVizlovBu/KVE6j88DgpkaZPL3+x0YxAqXPB0tv2dCWG8rMWVEooI2jIcnmTbjw
 E2yOfWQd2VQ/VhMkJTo/2wK/vJgnPMArzQt9fx+mabu17SJlEAobv1TTTRz848whJy/G
 vfEjnir88jPVN5OrDlu9KjlqXTK8b/323kMl+5Cy7gpjpx6LIkODwPBYq7SBLwADyFXy
 sPug==
X-Gm-Message-State: AOAM5337pPb9rOwUz9t8h1KOzjELBrBVDaf7f9nWETMBVwgEKItTPZmz
 J/unQZVk8kUQJ2TAnxvLdw==
X-Google-Smtp-Source: ABdhPJypBGg9EMs+QxwC/Cjl5JuSGPx3TLdDHACzF4DheFO9FblAs+6ZM6y9BiuOWNwGHQ49bIG1uA==
X-Received: by 2002:a17:903:41c3:b0:15e:b690:bedc with SMTP id
 u3-20020a17090341c300b0015eb690bedcmr20056657ple.161.1652174275389; 
 Tue, 10 May 2022 02:17:55 -0700 (PDT)
Received: from localhost
 (2001-b011-7010-358e-c990-a8c9-85a7-1d3e.dynamic-ip6.hinet.net.
 [2001:b011:7010:358e:c990:a8c9:85a7:1d3e])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a170902b48500b0015e8d4eb26fsm1447231plr.185.2022.05.10.02.17.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 10 May 2022 02:17:55 -0700 (PDT)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski@canonical.com, wsa@kernel.org,
 andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
 semen.protsenko@linaro.org, sven@svenpeter.dev, jie.deng@intel.com,
 jsd@semihalf.com, lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
 warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
 kfting@nuvoton.com
Subject: [PATCH v4 4/9] i2c: npcm: Fix timeout calculation
Date: Tue, 10 May 2022 17:16:49 +0800
Message-Id: <20220510091654.8498-5-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220510091654.8498-1-warp5tw@gmail.com>
References: <20220510091654.8498-1-warp5tw@gmail.com>
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
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 1f92c84317e4..eaec051e080d 100644
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

