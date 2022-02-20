Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4144BD4FF
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 06:15:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K29Vj1Dgwz2yph
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 16:15:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YN+Kd6rE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YN+Kd6rE; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K1Wpg50W0z3bd4
 for <openbmc@lists.ozlabs.org>; Sun, 20 Feb 2022 14:57:15 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id
 m1-20020a17090a668100b001bc023c6f34so1960172pjj.3
 for <openbmc@lists.ozlabs.org>; Sat, 19 Feb 2022 19:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=z9lZGtb8cFLHmXYWpgnPlQ7M1L50cRGAk9IcCvdjsP8=;
 b=YN+Kd6rE4uJcnrXwSFKrFOhJvAT1AxzyAZOmWxSP44CsIjlcP1d+NMtG6qE5pvWy0m
 eqrVCTcgcpgJnaZvnZOOckCaPcOPVCoepZfrUVPbEGqky4HPDCkiK7wO6wIoPnCVHODQ
 mS+yFIiMsHnLx9shj/lEI0pep6RloMCGebATEEq+qXibp1iPMsCOsvcwZkl0dFZAT83z
 WawiDjZxjEBWSWqJO5IbHCnEPL6/PdLHWSjqHhDJGirvKkTeMleQZmSdANywKDMsvNCq
 L1HtsvFbukeKFzTvKaEbvEbw0ZP8hsW44C+K/OQLjgBPMg292NisP3KfE5puZq3U/K0R
 PPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=z9lZGtb8cFLHmXYWpgnPlQ7M1L50cRGAk9IcCvdjsP8=;
 b=49xFZO9HIRRqmtjNOSMnG2Lr5MjOpKrWFzj75vNSt0zySAStHzTDb5ubFVOiK00ORP
 v8CLgJntgJkwjqD/47167Q5z2CbbQjw1D2hfbxOvScg4zR329mKmW2GhVNPPwnw5W2eF
 vQ7HwCEgCa48w6Vwc8aXrpVlIu5ppkV/UY/GpS9G9mqCnLTx2Xf83aDZEsY7KfzSGlFH
 OePWcGXtwpSc3Z4Ep86zAuxUej7ovJwY0PMMvXfuCoSqd/DWkVnIGXxF1FXq7BwBkBb2
 ljkdJphNYyuNlZnsqqAkGIrpTT9p3JoPfNzucU6tGY9xmC2FCaaevVRBY5ie7G0Nt6av
 GUDg==
X-Gm-Message-State: AOAM533s35ejoLodzY2WhHOxfKDV8OlvSdU0qGKXOk1KnGwiO/+6bM6a
 RFqBopO+n0YN+qMUIuHpDA==
X-Google-Smtp-Source: ABdhPJzhOQoXseYyF3hYCk4WIgcQp5Y8MuKzDj2R4zdZgzqfwFtNnB1cBghRkA35TttX/k58tiBOAw==
X-Received: by 2002:a17:902:6b0c:b0:14f:3a39:ad3d with SMTP id
 o12-20020a1709026b0c00b0014f3a39ad3dmr13674261plk.113.1645329434011; 
 Sat, 19 Feb 2022 19:57:14 -0800 (PST)
Received: from localhost ([2401:e180:8842:e799:9593:a6f2:788b:a48c])
 by smtp.gmail.com with ESMTPSA id h16sm7910793pfh.40.2022.02.19.19.57.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 19 Feb 2022 19:57:13 -0800 (PST)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
 semen.protsenko@linaro.org, yangyicong@hisilicon.com, wsa@kernel.org,
 jie.deng@intel.com, sven@svenpeter.dev, bence98@sch.bme.hu,
 christophe.leroy@csgroup.eu, lukas.bulwahn@gmail.com, olof@lixom.net,
 arnd@arndb.de, digetx@gmail.com, andriy.shevchenko@linux.intel.com,
 warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
 kfting@nuvoton.com
Subject: [PATCH v2 06/11] i2c: npcm: Fix timeout calculation
Date: Sun, 20 Feb 2022 11:53:16 +0800
Message-Id: <20220220035321.3870-7-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220220035321.3870-1-warp5tw@gmail.com>
References: <20220220035321.3870-1-warp5tw@gmail.com>
X-Mailman-Approved-At: Mon, 21 Feb 2022 16:10:35 +1100
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
index 9ccb9958945e..1e6e3f7f59a3 100644
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
@@ -2265,7 +2265,7 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
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

