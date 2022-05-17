Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9855C52A233
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 14:57:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2bk93k9fz3c8N
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 22:57:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Wej2EPVt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Wej2EPVt; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2X3W1tQ0z3bqk
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 20:12:07 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id s14so16915684plk.8
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 03:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=krLNxO0S/d+QCIpYPvVWVYi5XGTs+BtKLzm4JTRH6tI=;
 b=Wej2EPVtv+g3E5YqfceFbhSCpcOw88Cw6q41HmZNLtWCJJCj8A0mueeN2H9mG2J5GV
 oJ9tSPE2546gKfKptsCpkvicpPJiKqSzEEWKU7SuKQ3MD9hc+2UAPplRSpss12N4J+h6
 IxAIeVUWuNbD4efUsRmAbAt7TkRwvoCVlrYzGy402m02J5a6HUdgCpK9wzMqjyrRX/9Q
 kt5ojaQ46PU5J8fB4Xg2g5qpaHZ8xTGCscmCGkMr3XnMfLnBFp6SGOqMtbqXaJF2H1R5
 qPReM/WUz8VWNXQn/ffxwIXj6i3JBi5dvlB9whRI+MvLB50BKT/ipesqLA+qhZ5ge+M0
 LEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=krLNxO0S/d+QCIpYPvVWVYi5XGTs+BtKLzm4JTRH6tI=;
 b=Ecadj29fupVKvNHhh3sbRFlFPhg+hZwGppcCOZVW8DhsY/t4LDYC3ejsomxKv6udli
 dJviLOpcRmadbiIkn6UNBe3ojZiSJiC1AlrsRfyO51pqJYXxF0zGZm8UM+RjPuEoKtQK
 6DDV4XhZUYVnx1qZJKg7rPTWO8Tk95/Zdg0jMXdgd46JjaQ5JnjVNott9OsPFTlkJMup
 ND4MMiegQmP/DlhiX5bV1nQIHT3uK9bYZmtMMj4c133CX5IHeLQcXmPMK8SN+MkOhyf5
 p6UwkflXU/Ck+Kq3H4X383Ef5UA9n0EgfoGXOT7NZR3qwLQkb5c0WpylIXke4AxT+9g4
 8TSg==
X-Gm-Message-State: AOAM530XQcrcqPguQYN8/e9HfJXG6hOUW5b97QSxy7OGbq/LaecSwoZM
 N46bDPY2SIVO/wKwfOZyMQ==
X-Google-Smtp-Source: ABdhPJwX9+NKY+Vc1jqGFR3i9lcYLVNsUS92nD/cAkPrWGRBDbEQmHTp1Pfr+6u4Ge/WtKQEesW/6A==
X-Received: by 2002:a17:902:bb94:b0:161:60b3:3300 with SMTP id
 m20-20020a170902bb9400b0016160b33300mr12971537pls.97.1652782324968; 
 Tue, 17 May 2022 03:12:04 -0700 (PDT)
Received: from localhost (220-133-130-217.hinet-ip.hinet.net.
 [220.133.130.217]) by smtp.gmail.com with ESMTPSA id
 e17-20020a62ee11000000b0050dc76281b8sm8664208pfi.146.2022.05.17.03.12.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 17 May 2022 03:12:04 -0700 (PDT)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, wsa@kernel.org,
 andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
 semen.protsenko@linaro.org, rafal@milecki.pl, sven@svenpeter.dev,
 jsd@semihalf.com, jie.deng@intel.com, lukas.bulwahn@gmail.com,
 arnd@arndb.de, olof@lixom.net, warp5tw@gmail.com, tali.perry@nuvoton.com,
 Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com,
 JJLIU0@nuvoton.com, kfting@nuvoton.com
Subject: [PATCH v5 05/10] i2c: npcm: Add tx complete counter
Date: Tue, 17 May 2022 18:11:37 +0800
Message-Id: <20220517101142.28421-6-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220517101142.28421-1-warp5tw@gmail.com>
References: <20220517101142.28421-1-warp5tw@gmail.com>
X-Mailman-Approved-At: Tue, 17 May 2022 22:52:11 +1000
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
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 489b4c8ad0ee..36f8aa7ab106 100644
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

