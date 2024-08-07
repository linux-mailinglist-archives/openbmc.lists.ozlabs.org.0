Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F96E94A511
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2024 12:07:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UcWSFysn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wf5T01BCyz3cNB
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2024 20:07:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UcWSFysn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wf5Nf2nL2z3d2S
	for <openbmc@lists.ozlabs.org>; Wed,  7 Aug 2024 20:03:46 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1fc66fc35f2so5553125ad.0
        for <openbmc@lists.ozlabs.org>; Wed, 07 Aug 2024 03:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723025024; x=1723629824; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=65hWRo84ajW0lRVkSWXUeq2TzEhPxVKIyrTffKYFoGM=;
        b=UcWSFysngbZqFa5whAtdo0RNTjHj6qztwYGCjolh7NFd0i2hVzDA9uLgdycBsWA4Si
         0VKnLDoK8JawRzl6pCSvrTznXeJtamHK1LHRi9dFfGDBNP7MUIIOsRwpveEyrni4xNjm
         8pIXMYVvUjvCqQU2U7BQuBq5EcYJf0ggNOmXUzZOy0s/kByvwQzFW+Hkobz1QMEdfghm
         Z6uaeLzB+6qiYPgJo/DsBTI40og8Wms1f8BerLGmyobouVpJZJnk65f+h74GdJXS/UCJ
         kZg5YWYeLPPZAtOvdxxrMW4wmIWfCzwRn3j2jb7SaL2oao5x0Emmh6BSJlmFGxVxGJk1
         61gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723025024; x=1723629824;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=65hWRo84ajW0lRVkSWXUeq2TzEhPxVKIyrTffKYFoGM=;
        b=gQwp3AnvXEX9uYciuviy15fu2kDeSjBploz5lAuHR/o8JvLvrugUEvwB0MGTZkgPqA
         TfLP67lVi80I1X3BWxF4ivkCZLZO70JT6g0QlWz/rAkh6duBa+YoJan6tytz4pVMf8Ln
         46CYaczoE927AZDGzbUBXJyiTDamP2ExUqNRUslH4rFXa5MjnlVRTEsUfHfWKLG8DiiZ
         jMx+ZxTLtfcAK1zcOKqbY8qnYKgDDgqSV0k69DUsYnO2IqlIkrKN7lKE+UOH0Iip5uYo
         I2v1JwKiijZ1NEJMw+9vJRBVPOiOyyWHKGYVcCSyw/g4pPKLztiwBDSGOiW53pkfwYk4
         Z0kw==
X-Forwarded-Encrypted: i=1; AJvYcCX8Ts9/zia/j2+VP1AP6SzJ5MT5UymU/+ZBDSg7NwVEsSpmV0f2QY4AoUukLjSeKeq0tcjVdQSadjNHqsHzHfwa2Q+XH2f+J5A=
X-Gm-Message-State: AOJu0Yx1Mgb0p1bxJ5pxecfkQnisHNAJMnLkhZcspnYE11jgIVB0S0uW
	mONRvZMJ6bVMykeSvsJbRu2CRcovB5hZ44tytzdzyn3DretwohU=
X-Google-Smtp-Source: AGHT+IFUAvPzPEGgfDcOWxF5s64WDqDfWyHHIPJ5yd/HojF5g7uCqnKGmgzEpjnXwTeU7xoKYdeSfg==
X-Received: by 2002:a17:902:f64f:b0:1fb:7654:4a40 with SMTP id d9443c01a7336-20085492a0cmr22836605ad.14.1723025023921;
        Wed, 07 Aug 2024 03:03:43 -0700 (PDT)
Received: from localhost (2001-b400-e352-b705-880f-4661-e7a1-4abb.emome-ip6.hinet.net. [2001:b400:e352:b705:880f:4661:e7a1:4abb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59053847sm103141165ad.170.2024.08.07.03.03.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2024 03:03:43 -0700 (PDT)
From: warp5tw@gmail.com
X-Google-Original-From: kfting@nuvoton.com
To: tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com,
	rand.sec96@gmail.com,
	kwliu@nuvoton.com,
	jjliu0@nuvoton.com,
	kfting@nuvoton.com,
	warp5tw@gmail.com
Subject: [PATCH v1 4/7] i2c: npcm: Modify the client address assignment
Date: Wed,  7 Aug 2024 18:02:41 +0800
Message-Id: <20240807100244.16872-5-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240807100244.16872-1-kfting@nuvoton.com>
References: <20240807100244.16872-1-kfting@nuvoton.com>
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

Store the client address earlier since it's used in the i2c_recover_bus
logic flow.

Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_reg_slave")
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index d115ac659900..c6f72c0e3464 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2153,6 +2153,7 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 	} while (time_is_after_jiffies(time_left) && bus_busy);
 
+	bus->dest_addr = slave_addr << 1;
 	if (bus_busy || bus->ber_state) {
 		iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
 		npcm_i2c_reset(bus);
@@ -2161,7 +2162,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	}
 
 	npcm_i2c_init_params(bus);
-	bus->dest_addr = slave_addr;
 	bus->msgs = msgs;
 	bus->msgs_num = num;
 	bus->cmd_err = 0;
-- 
2.34.1

