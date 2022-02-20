Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF004BD500
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 06:16:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K29WP1Kdgz2yQC
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 16:16:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YFsNLhOG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YFsNLhOG; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K1Wpj3X7wz3cC7
 for <openbmc@lists.ozlabs.org>; Sun, 20 Feb 2022 14:57:17 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id
 v8-20020a17090a634800b001bb78857ccdso13508724pjs.1
 for <openbmc@lists.ozlabs.org>; Sat, 19 Feb 2022 19:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tO9gUxk8ScG394Fv1F7MLR3Gf0mTFyKLln3kWcROujg=;
 b=YFsNLhOGDEWxYVO1KI8dOBszZn9ragwhXM72tBXopH5oO5WrTkbDhoPx4ViCfsBQoA
 kk0MWgjbt+T5j7MmgtbE/ICMJtl5ytH1iCa3p0dVTp0tNQgXu3c3MTtPse/ErAxxPxik
 0QL+zpv0Stdox96CTeTEpXDwwheA2R08Yeok1kz6f8O6+RW1tOusC3Js/2l2ugUVY/sc
 +H2eosuYZVau3+JqaR+/6CqBTZXhOj09Kpr847R1AkVQLpeRPa2HX5njkpmS6FFk5jrJ
 TejyIJ0kHTI+46tCBULxFGJcV/0FgA2sOgXI125GzRSlemYB3wdH10NaOVlNExt2D3yd
 hBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tO9gUxk8ScG394Fv1F7MLR3Gf0mTFyKLln3kWcROujg=;
 b=z4qxbGib25ZxMB3B0elyhwVDRKlUBsQZOj1PL4JoWUE8gHLOVYsCQNXr+NPjp/mP2T
 v8tv8BgM1wBC8CwE0t4CcUzQB/wZwt8Oe3V1HqlPGIoqHqQ4v0z4UqcZDnV+X0COL25s
 M/DD49UCbvqRT28KRULv7aL39WYjSqNlRmQj63NINymEp0kBVTNZJLiYCxciSjoHXRjC
 GHLkcetIBKptqvzUppqvgC1G/lfPEoP/xQFzSSqWtCfKn/Zv8aKKc78qdrb0XRk+SSF8
 axKrwNI4hNPKgAzijX7dmTzBnlkcBlq9A17wjAoPppnm9r+QPv2UurITPYVxQjz3m4JE
 svKg==
X-Gm-Message-State: AOAM533WByuLQN5AnGy5I22wsTVj/mmDQOiGWoen+DrAd37nTzOpqQZ3
 pA15kfkhYXJyCvJso76Cdg==
X-Google-Smtp-Source: ABdhPJyzNDl29XEZLKC0BF1F3I3EyAerQqcpv4UGlDkGWU+P5WDIdIwvWdSabKdi4LswRecqbam9JQ==
X-Received: by 2002:a17:902:f54b:b0:14d:6612:428c with SMTP id
 h11-20020a170902f54b00b0014d6612428cmr13947967plf.54.1645329436310; 
 Sat, 19 Feb 2022 19:57:16 -0800 (PST)
Received: from localhost ([2401:e180:8842:e799:9593:a6f2:788b:a48c])
 by smtp.gmail.com with ESMTPSA id np11sm3457962pjb.25.2022.02.19.19.57.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 19 Feb 2022 19:57:16 -0800 (PST)
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
Subject: [PATCH v2 07/11] i2c: npcm: Add tx complete counter
Date: Sun, 20 Feb 2022 11:53:17 +0800
Message-Id: <20220220035321.3870-8-warp5tw@gmail.com>
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
index 1e6e3f7f59a3..ee4757eff4b3 100644
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

