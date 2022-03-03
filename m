Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E68134CB931
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 09:36:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8PV50BQRz2yLv
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 19:36:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=c98mF/Vv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=c98mF/Vv; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8PNk2HWFz3c3R
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 19:32:06 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id s11so4122993pfu.13
 for <openbmc@lists.ozlabs.org>; Thu, 03 Mar 2022 00:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qR3k7tR7j/5S7kicq9024I41lOgKh8ZbJEsbrDlOUpc=;
 b=c98mF/VvcIKJ4ZkueVOL/DOQ8xsIvjH+GALr1n3psM9il/GzMYEKvoKwbq/+nLSToG
 qN65D5ikBc9Q2ZQUsVOAlQMw0A/kjvrQJAU15vWqr66JYOptvG4fGErDzCNvBOO62BaY
 Rc/4jl/alYAWiSXVbQQvOh6ZV3d9Dl5yxogCTFReuha6bEIdT/Xtyddz6L8mwL+D9p7i
 ls8Qek37dK2+/jSeF7Zkk6gbN8CVP4SaLjN8KlNxSTIflox3Rv86cViqAvN9Q8I3w0cD
 KAalSgjFKzM7fSY9Heh/2NdYIlN24E4nJb4pAm+X22nukzi91EhfUljKvc/bhSQgIhRt
 zSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qR3k7tR7j/5S7kicq9024I41lOgKh8ZbJEsbrDlOUpc=;
 b=2iypjCV6bLEFup5AcFBK97/Deijjp/ig9oHPqUTghoPnjHCMYB2vlEdb7/9rwAGKAO
 uDqoNyd0TKt7mW27fnfrQ6JLbW5QlT3vxJJA0fbdQ2pVzqQC1PrtULzm05/3DwNTqOLw
 3i5x5SA3daH3ydcrTi0v/Np07H8OCkuFNFb2UBXxJraQUtTcGt4k8AYzPhJOKbJj6KgJ
 /Ehwc7XveTrcQJnX17P4wxUJV6UAPWg6exL7Spurp/sCLn0JZaDxtdsW/EBSVOxHQo48
 nQgbO7zWMy21DZuYnYqHNuWEjtp+FXTjtRpPfDMmM2zQHmcrzihML5G7PE0u3oZp6RLu
 5BRg==
X-Gm-Message-State: AOAM5329bq0a9iGEr0XTOPl3GzYUT1aG+7R0nNNGAEPgwX+tdHppYSQM
 6YUmWZnyh3l2AbQ92+E7hA==
X-Google-Smtp-Source: ABdhPJyekVB8f/Lh31XYkdJZut/jLW5LPwfmaUGnArpYhYDTba9LNre+0K88OWQ6Q0MGKmMPF+9MmA==
X-Received: by 2002:a65:4687:0:b0:373:a276:767 with SMTP id
 h7-20020a654687000000b00373a2760767mr29267201pgr.409.1646296324954; 
 Thu, 03 Mar 2022 00:32:04 -0800 (PST)
Received: from localhost ([2401:e180:8860:3b30:e4a0:392a:996e:c525])
 by smtp.gmail.com with ESMTPSA id
 r12-20020a63a54c000000b00376047bf784sm1383972pgu.23.2022.03.03.00.32.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 03 Mar 2022 00:32:04 -0800 (PST)
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
Subject: [PATCH v3 07/11] i2c: npcm: Add tx complete counter
Date: Thu,  3 Mar 2022 16:31:37 +0800
Message-Id: <20220303083141.8742-8-warp5tw@gmail.com>
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
index 3fd30c38b3bf..237da0ef32ca 100644
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

