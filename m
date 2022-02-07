Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9264AB54E
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 07:56:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JscPw3r8Mz30Qy
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 17:56:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nuuiJ2jt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=nuuiJ2jt; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JsbvS51tKz30Mj
 for <openbmc@lists.ozlabs.org>; Mon,  7 Feb 2022 17:33:56 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id i17so11289245pfq.13
 for <openbmc@lists.ozlabs.org>; Sun, 06 Feb 2022 22:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=M8g46qJlsRdWiYs40YKErwbjRD+GvZUoxsx4dYRI7SY=;
 b=nuuiJ2jtZ2/imS93HSBXk9QGWXJQMIOQF2wGEiDUrb8UxkrweOj6a7n32gEiRJ5zaO
 puxgbRLNrBHIDGN5jGgUSE3qHcRpCjKkWQoxvzOLvhN+ZDYlQHNOOg0riw+C+TnnTWqT
 SHFlMKbMKfLiRnR/4K2us0gXrYDzDxowJ6fJyHhiBRJGzmNbzvCF5AiNl7fVQx++DHLy
 jtEKIfmOfUW1+A1su4TDvUT4fyczCXOiF7b8+tgfLWnTs6g/nL1+E2htNxPm+b+LMX2K
 jmgU468Ml9NHCkz3vsOV8YPW9vvGE2L8MzfMaiJIPWGA61WQ9y+g+4tbyIRzKv6Zwexo
 h6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=M8g46qJlsRdWiYs40YKErwbjRD+GvZUoxsx4dYRI7SY=;
 b=XbQUKJag6sOmD/YR4TCVG0yJvOlzF/Y5iJDCvAsKeKXMj+PflJidMw4NLLVHZexsoS
 iiM5MsDIW6hnoDWojPDaJ4tzQO8x3HRbcXD14ihUovodcuxsCBCFwaMx1eN6VHK1oIaH
 UdnVVL7ynF3l4wBkpjAjtPBsaRSyw/tS/G2espIR4XdYc5Tu7CcQd+j4rcZ0WgiN3+d5
 U4eb6HjiYCFsHUoUoFLLmFBr5kjOUACRsAUumkQqfTSt4wXlwhV3V5qFK1cR+BR8lMFu
 hcdxxK7KhjsJzlM2JHkg1YZAKWiLtzctqqfx4VD+qDuSoMzPB7Nufqa/0titP6SVVCFe
 s8OQ==
X-Gm-Message-State: AOAM531s5c3eQLzKbLr3RuMX3HxWDsyQVkQ0fV/1qO/crpOy9q0kSV7T
 EATE5rBSXcmuJfEZcgOt+Q==
X-Google-Smtp-Source: ABdhPJyFovo/KRxuiq9zjQNpksHG8TiAr6Vnn0Z1VF9Y8hw4MjzTkRRt+aY83SX+tgNpYJioziqr5Q==
X-Received: by 2002:a63:d952:: with SMTP id e18mr8329583pgj.290.1644215634685; 
 Sun, 06 Feb 2022 22:33:54 -0800 (PST)
Received: from localhost ([2401:e180:8894:9737:7848:1ec7:b697:7d50])
 by smtp.gmail.com with ESMTPSA id b11sm10732314pfv.192.2022.02.06.22.33.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 06 Feb 2022 22:33:54 -0800 (PST)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
 semen.protsenko@linaro.org, yangyicong@hisilicon.com, wsa@kernel.org,
 jie.deng@intel.com, sven@svenpeter.dev, bence98@sch.bme.hu,
 lukas.bulwahn@gmail.com, arnd@arndb.de, olof@lixom.net,
 andriy.shevchenko@linux.intel.com, warp5tw@gmail.com,
 tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com
Subject: [PATCH v1 3/6] i2c: npcm: Add tx complete counter
Date: Mon,  7 Feb 2022 14:33:35 +0800
Message-Id: <20220207063338.6570-4-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220207063338.6570-1-warp5tw@gmail.com>
References: <20220207063338.6570-1-warp5tw@gmail.com>
X-Mailman-Approved-At: Mon, 07 Feb 2022 17:54:48 +1100
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
index ddeee6f53621..5c22e69afe34 100644
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

