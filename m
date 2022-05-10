Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8352C5210B2
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 11:21:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyCFx2zd2z2xCp
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 19:21:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YWlQ11nZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YWlQ11nZ; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyCBV2G6Kz3c7p
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 19:18:10 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id v11so14441738pff.6
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 02:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VnQelYMKjVBHrVTpQi4LelIGs3/pDFcP4b0unjHuL9k=;
 b=YWlQ11nZJlHg2PEfUsZRnDdN2Y7O4SmXoTqZkSUDVYhlzs0tY55OW6zn6mKq2YXQOP
 miVOmqyFjSuTbqWMOVODy2QhlgyfpLpdEV0tRIDyDar9k+eKUs6vuGUuA2LUZp9yA9rS
 jiayj0M7qbRk3I8c34WAlhuv6enjD3jwYiGbARRZxpujoq759uxFpifXYysuDmbSUoMQ
 qSijrVPj0phm24w94vTf7gAsX0nBcYCoM52QCu0KQlmFr1mW2tnPejel+JYRBW3dsJoX
 3INKpH1/O7yy72AqJ1RRMJxGnQH2H14HSrVXIHVZlhIKd/LiyC0mYhZPxkqafLaFPhRG
 MU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VnQelYMKjVBHrVTpQi4LelIGs3/pDFcP4b0unjHuL9k=;
 b=tlds7RJ3C1XrTSBF93NLlaYWAYgQARn5pFz1zspqepdKzWoyHB9zc3+lwSSHkN+j/N
 ogZkrcMWdR/0O1IX8AvAkw1/Std9QyxqLB8oFjWCiLDgSjO3I6lqVIcjwEhjG99w+woE
 rKd7UG+DM0wdE8P5gFB1MN3GQwPabdkRYkP1iVyUm7GMrebOFxPOfdS/p9fjnR0mNy+d
 jvmU0PMNFNWDmIQXEjum/Gmi/5klmat7wJpbBf46D8czzSf6MDHraHZEpj+/MYeDEFfv
 cVZzH2HA7MeWN98yu9u9M6iq5Dyxyq9EOMY2z8lnfLoLRpOpOnR9qolxpSpDrNiWNvcq
 g2ZA==
X-Gm-Message-State: AOAM530Q86gPNEVcor0t7hckignr2wauqorfGhuAWfs4DKa2VYebe9t0
 HVfWrheFG/ZUSOSI+kxJfA==
X-Google-Smtp-Source: ABdhPJzLH7yfVzJK9FA+HiKIZOajcWkEVzxgG48lIMgSZKODiXP/rLrp5Advh5OGWdjV+5Fa+ykhuw==
X-Received: by 2002:a63:df0f:0:b0:3db:2d4:ded9 with SMTP id
 u15-20020a63df0f000000b003db02d4ded9mr579198pgg.267.1652174288073; 
 Tue, 10 May 2022 02:18:08 -0700 (PDT)
Received: from localhost
 (2001-b011-7010-358e-c990-a8c9-85a7-1d3e.dynamic-ip6.hinet.net.
 [2001:b011:7010:358e:c990:a8c9:85a7:1d3e])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a627b06000000b0050dc7628185sm10428968pfc.95.2022.05.10.02.17.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 10 May 2022 02:18:07 -0700 (PDT)
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
Subject: [PATCH v4 5/9] i2c: npcm: Add tx complete counter
Date: Tue, 10 May 2022 17:16:50 +0800
Message-Id: <20220510091654.8498-6-warp5tw@gmail.com>
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

tx_complete counter is used to indicate successful transaction
count.
Similar counters for failed tx were previously added.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index eaec051e080d..56af571f65c1 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -314,6 +314,7 @@ struct npcm_i2c {
 	u64 rec_fail_cnt;
 	u64 nack_cnt;
 	u64 timeout_cnt;
+	u64 tx_complete_cnt;
 };
 
 static inline void npcm_i2c_select_bank(struct npcm_i2c *bus,
@@ -684,6 +685,8 @@ static void npcm_i2c_callback(struct npcm_i2c *bus,
 	switch (op_status) {
 	case I2C_MASTER_DONE_IND:
 		bus->cmd_err = bus->msgs_num;
+		if (bus->tx_complete_cnt < ULLONG_MAX)
+			bus->tx_complete_cnt++;
 		fallthrough;
 	case I2C_BLOCK_BYTES_ERR_IND:
 		/* Master tx finished and all transmit bytes were sent */
@@ -2223,6 +2226,7 @@ static void npcm_i2c_init_debugfs(struct platform_device *pdev,
 	debugfs_create_u64("rec_succ_cnt", 0444, d, &bus->rec_succ_cnt);
 	debugfs_create_u64("rec_fail_cnt", 0444, d, &bus->rec_fail_cnt);
 	debugfs_create_u64("timeout_cnt", 0444, d, &bus->timeout_cnt);
+	debugfs_create_u64("tx_complete_cnt", 0444, d, &bus->tx_complete_cnt);
 
 	bus->debugfs = d;
 }
-- 
2.17.1

