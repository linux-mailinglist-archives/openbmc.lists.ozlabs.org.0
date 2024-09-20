Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D8F97D420
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2024 12:19:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X97dt4VBmz3fyw
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2024 20:18:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726827532;
	cv=none; b=RsvLE61mQnV6wt4ZpUuvoVZYCYMPom+t5hFK4oaD2a2lDYcNXI+D78ypk4t4TgfqQI3EXfNEPEPazyNu8rNJWODRCTr7NjRX2Q99srAGBAyBpltBBEGQe10JDgzhlgW2ldvDYce0eb9CU/vEZkcSRNpUFnjShduJj+ojmyxR3AANatc9ln234daUFkwg1/eZdzdGvK+pT8nJzb2kM18LBpMVHPBG3RwmHcNln/t56/jtuDdHY7QJNyRguRqrt3AAdfzbGkKuNlgUS4MciLJVkJVHWaebb1/3zll8+Tv0+9QEvnFr0wKHL7wznEGgVCOC1LCHbOoJ4O4cxPtQS1r48Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726827532; c=relaxed/relaxed;
	bh=R0BORBW6QOc0S5wwx7/xMWlE8WZqalSOuRW0pFDdCkk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=KZxHHc43iZPD3nDHnUbvx5HcGxUSHVjmZQDCvLJkmpJwgo4hTj5Kdx4yLYVcUz/TYE3YkKKMrWtPDgMcX3OSK/L9zyoZZE47B9seDmsmVG5NCJtOan3TrIvt+c6iXp/ZFid3mIhpqgBHsyNs7DN8db07mpyOR9hH9O2FLjIIUu9TcoqoWvTfAMYfvetHFTovC+RR9NB0lRqytr4W1uZtRLRc8oTp0XWmWJvotKNV1yR2Z02PQxSCGBFIEN2XfUiY8yQW/nw77am73n+0oYKIcKuWTvjxgNK/th3V0bigsiQY8MFtlnz7Lg37/pzWL3spQ9umjySsf9nxvUMmfKmBiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fA+Fcg6E; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fA+Fcg6E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X97dm51YRz3cP8
	for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2024 20:18:52 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-70b2421471aso1204163a12.0
        for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2024 03:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726827531; x=1727432331; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R0BORBW6QOc0S5wwx7/xMWlE8WZqalSOuRW0pFDdCkk=;
        b=fA+Fcg6ERLAQiqB0vSbn6cBrA03/gFkfSLKEl5Ke+gQMlCkT4fGmcdeObBh4XzdBE8
         7Wn+IiJuh/1DRIy5lkj74Z6xXfhSbw4KMAM64NWQ31BE/8Sp8F2WE2m6yqeRuv3LW5Q6
         OzSjMfLSICsMhv1ahF6PJD0qLueYmAZQw8uZP2qIeFOh+RcZzNwqPjuXEKuCE8xqJgjX
         UUGxe41DYEmK5DbA2cN1ahx906BPmSsKmuXim0b0wodTnFr8+xFHKADk1YHDqxhL4Y0i
         tPggWDLoP99mqkuRpIxcDepvwUU6ehvpdSBsSrGPUeg3tgU+tsQCtHYagZsInDeS/Dbq
         V4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726827531; x=1727432331;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0BORBW6QOc0S5wwx7/xMWlE8WZqalSOuRW0pFDdCkk=;
        b=EbatCUoN66SU9jSAAOvPhz4km2chJMEDOO7XcHwebWeO3+3Zhu10gxBvaUz1NK3L6+
         U3FJ+JF+5K0kXBvaKnA0D2CSaLvH7Ak87NrIOoEqHRVBJkETBU3xUy3ymcUCVOjuZAjl
         KAlDJWXwfMiuJ2F6cbebg84r920YHyC+nJ4cCKC/R5q39IBYGlw0x0fvSi9lHu5kfZG2
         12rl+VSWAKFAea4kU5l5j6pPyGbWCb/miYa6XdDSuuEkdcO1LfgYEVRfG2m1rbqZZWSg
         rFR5LdWjGgbiWkxKjUPS6ymcaQ6bSHxweCaB/ATtsHzCEko3PbpBiy8UUIU29wyIrE2C
         0l7w==
X-Gm-Message-State: AOJu0Yy1Wa7mjU71kCwP4avrYdFWKqmKV17SWq6lTjJV5BGCDkWnRyiL
	Xp2FbmSjVR57t0X7DAWDEWmSQXQcHTHXLYyqdUhepCj1IndjYqK3gQMvoSY=
X-Google-Smtp-Source: AGHT+IG4FpRxofnrPdGJ9W7cgP0YW7D7iB+Tp3jNOdzdQP8ud98xgyHONsXPA7bEu1klbUawA9o4yQ==
X-Received: by 2002:a05:6a21:30cc:b0:1d0:7df2:cf39 with SMTP id adf61e73a8af0-1d30a8bbfa8mr3321659637.7.1726827530660;
        Fri, 20 Sep 2024 03:18:50 -0700 (PDT)
Received: from localhost (2001-b400-e35c-9cc2-447a-d760-d4f6-01f4.emome-ip6.hinet.net. [2001:b400:e35c:9cc2:447a:d760:d4f6:1f4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b9a144sm9846698b3a.178.2024.09.20.03.18.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Sep 2024 03:18:49 -0700 (PDT)
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
Subject: [PATCH v4 4/6] i2c: npcm: Modify the client address assignment
Date: Fri, 20 Sep 2024 18:18:18 +0800
Message-Id: <20240920101820.44850-5-kfting@nuvoton.com>
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

Store the client address earlier since it might get called in
the i2c_recover_bus logic flow at the early stage of the func()
npcm_i2c_master_xfer.

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 68f3d47323ab..248835220c86 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2155,6 +2155,18 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 	} while (time_is_after_jiffies(time_left) && bus_busy);
 
+	/*
+	 * Previously, the address was stored w/o left-shift by one bit and
+	 * with that shift in the following call to npcm_i2c_master_start_xmit.
+	 *
+	 * Since there are cases that the i2c_recover_bus gets called at the
+	 * early stage of the func() npcm_i2c_master_xfer, the address is
+	 * stored with the shift and used in the i2c_recover_bus call.
+	 *
+	 * The address is stored from bit 1 to bit 7 in the register for
+	 * sending the i2c address later so it's left-shifted by 1 bit.
+	 */
+	bus->dest_addr = slave_addr << 1;
 	if (bus_busy || bus->ber_state) {
 		iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
 		npcm_i2c_reset(bus);
@@ -2163,7 +2175,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	}
 
 	npcm_i2c_init_params(bus);
-	bus->dest_addr = slave_addr;
 	bus->msgs = msgs;
 	bus->msgs_num = num;
 	bus->cmd_err = 0;
-- 
2.34.1

