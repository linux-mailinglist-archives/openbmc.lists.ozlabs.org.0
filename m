Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A1F9A5A53
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2024 08:28:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XX53043Kqz3dW9
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2024 17:27:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1030"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729492074;
	cv=none; b=SQxdKKQpTCWZfmfNoDmNj/sy4j/6Yr7XIFqT5AUq+C8RFFnbd3hIbw+NBUr0xHI6dB5xyEM2xAdg5sT4v4eGUMF9LgrgkbxcW+hS1hQbnfkXCxaOyZedFxC02/VQ7BuIFzvqVLiRg+AI5rGc5OZ+rvwIKJcxWzcEBgrH5QOFPSaCZW3JQSLmo8EdL5xAJWLHtn5kHwg0Z8qEgooI+P2/dTnSLjfA2cx/hkXUn2pA+luBXoVtZx5OR9N/ajWfkRRBKjJb/jtqQkD5fcgFwUmBu29Hkpo+LDIErN+GJSH86FUEknR1Q3Q/k3JdVd7vIvYqGlDtuQCQyjwR/NVnoE1uVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729492074; c=relaxed/relaxed;
	bh=CYjjxH/6sVW4vPAuNqG1v24L702GKNztR3YORCVScdw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=SYd5ALuVojJdcvcbp7rvxHRf/qLhThuBt7ALA1+yoprEoOxikzBCqXlqR7H+N+0YkZbJF6oYxF8xaUC/sXmOopFSKC9OX2qqZQEOkcKkoRwyxc8qhMznIavmKLXvFDPE2s7+TcQA8uuSzk0rIcqH2CuSD+kShlfzIHF0H0E6XqAkYWikGdkFzOl79o56qZq5uSwydYP8JL7/OL3X3m1+naoejhviqq+yy2SaYo7drNZ9UDYzNynqRenmXde2LgZ858DLc3nIl2VmuePMAfyD7VAcasN/8q5ly809xqEojOLSyJq9jk0tV/UxbnYiGLjvS0aO9BC1djObgaE9A1Syhg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W9Ar4y9I; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W9Ar4y9I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XX52x0DGmz3clY
	for <openbmc@lists.ozlabs.org>; Mon, 21 Oct 2024 17:27:53 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2e2dc61bc41so2737495a91.1
        for <openbmc@lists.ozlabs.org>; Sun, 20 Oct 2024 23:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729492070; x=1730096870; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CYjjxH/6sVW4vPAuNqG1v24L702GKNztR3YORCVScdw=;
        b=W9Ar4y9I4EqnS9TfBSctoJzpdduTgROqGrviBQZk0/AoiMHuQ3don+38nyj2iVRmna
         k3vg8YACkd1xGE8Nwu+OZfjK/icPUBJ6/F3JLf78ynH2mvgfLJhiYE3VjIE9woeE/qFs
         Sqw4bWjtZqZIxfQ8T3lX4d27zzq4DxLhMnrQakPa736CHE6h7/qbTmCbxinNcvtfekP3
         yqH2CQAJsBHgf9LCXtF5RGabooZLXyYPPip7skft6FqkTyExvuKX6tavyqBnh3csj2Wk
         pIoE0H2/vUWLFbE9xNpT1POujCsaLX9d7OhJ+tex1Iv2qPUCqQQrZmNw3qZCg9jBaVjX
         PUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729492070; x=1730096870;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CYjjxH/6sVW4vPAuNqG1v24L702GKNztR3YORCVScdw=;
        b=PrFxMM1E8nAK/QegcsW2Zr2FM/n4LBqNJtRg+f0uTuomrC9NlRYPRT7WzdqALg/QPj
         //0U7y9g67tJEU1fLY6Qw1634/prbMsFQ3AvukZ9jJ07XMSPC5bgEi/YHOwarazEe0ko
         3wpl5jvmWPqVq+5K8EG1Q5v8QaZ58FwKz7h+mcA6DvA+N2Ij/8S/EZZsHFhmxZrSQMzF
         pSwVAoPtO5TJXWbpqxLJkz/BFI5onLZ/a64eWmHlWgL1D/DL6I6H3OLBMRPZ412SsfiW
         tTrwYdLGXrXImNsasFULh3h58MxlcxHzJR/xyy9KIxRji9oyxrD7w2639Oyz4FLTztiu
         NUlw==
X-Gm-Message-State: AOJu0YzYw7zwQ+J5gEE8K4YagLEGU72qHqk1M57OdzwuTDiMprkyQ3BJ
	C1fK5bf9yCPApzKJZ2/ZGv1mZ3+MFz69zATv199BllPfg/2IfxM=
X-Google-Smtp-Source: AGHT+IFFpVgdw28i4FRp0IbBH2AXunBvqGNfnBaxFYwBvnU1BFlVOQU2Chz5Ii9cWnEzNwKwGduwAA==
X-Received: by 2002:a17:90a:d386:b0:2e0:8719:5f00 with SMTP id 98e67ed59e1d1-2e5617570e4mr11165488a91.22.1729492070322;
        Sun, 20 Oct 2024 23:27:50 -0700 (PDT)
Received: from localhost (2001-b400-e38e-c9a7-dd38-775c-4093-c057.emome-ip6.hinet.net. [2001:b400:e38e:c9a7:dd38:775c:4093:c057])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad389d04sm2734545a91.31.2024.10.20.23.27.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2024 23:27:49 -0700 (PDT)
From: Tyrone Ting <warp5tw@gmail.com>
X-Google-Original-From: Tyrone Ting <kfting@nuvoton.com>
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
Subject: [PATCH v7 2/4] i2c: npcm: Modify the client address assignment
Date: Mon, 21 Oct 2024 14:27:30 +0800
Message-Id: <20241021062732.5592-3-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241021062732.5592-1-kfting@nuvoton.com>
References: <20241021062732.5592-1-kfting@nuvoton.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

Store the client address earlier since it might get called in
the i2c_recover_bus() logic flow at the early stage of
npcm_i2c_master_xfer().

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index c96a25d37c14..a9a9b21f1f0b 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2155,6 +2155,16 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 	} while (time_is_after_jiffies(time_left) && bus_busy);
 
+	/*
+	 * Previously, the 7-bit address was stored and being converted to
+	 * the address of event in the following call to npcm_i2c_master_start_xmit().
+	 *
+	 * Since there are cases that the i2c_recover_bus() gets called at the
+	 * early stage of npcm_i2c_master_xfer(), the address of event is stored
+	 * and then used in the i2c_recover_bus().
+	 */
+	bus->dest_addr = i2c_8bit_addr_from_msg(msg0);
+
 	/*
 	 * Check the BER (bus error) state, when ber_state is true, it means that the module
 	 * detects the bus error which is caused by some factor like that the electricity
@@ -2165,6 +2175,15 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	 * bus is busy.
 	 */
 	if (bus_busy || bus->ber_state) {
+		/*
+		 * Since the transfer might be a read operation, remove the I2C_M_RD flag
+		 * from the bus->dest_addr for the i2c_recover_bus() call later.
+		 *
+		 * The i2c_recover_bus() uses the address in a write direction to recover
+		 * the i2c bus if some error condition occurs.
+		 */
+		bus->dest_addr &= ~I2C_M_RD;
+
 		iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
 		npcm_i2c_reset(bus);
 		i2c_recover_bus(adap);
@@ -2172,7 +2191,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	}
 
 	npcm_i2c_init_params(bus);
-	bus->dest_addr = slave_addr;
 	bus->msgs = msgs;
 	bus->msgs_num = num;
 	bus->cmd_err = 0;
-- 
2.34.1

