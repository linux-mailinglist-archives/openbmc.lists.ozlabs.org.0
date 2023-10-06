Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 578FC7BB045
	for <lists+openbmc@lfdr.de>; Fri,  6 Oct 2023 04:23:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=GJFODh5M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1sfY1pC8z3ckN
	for <lists+openbmc@lfdr.de>; Fri,  6 Oct 2023 13:23:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=GJFODh5M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=zhangjian.3032@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1sdw6fX7z3cB1
	for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2023 13:22:42 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1c3d8fb23d9so12565395ad.0
        for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2023 19:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1696558958; x=1697163758; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MgD2XlWyO1IkxKrZZ4NotDzi7FafWvmObFFGZh4fKtk=;
        b=GJFODh5MsB+tapW+AsMjpVb+8FvE/RY0NA7YFJmcjg4vOwCAirzA/WPfbxf0C2r0Vt
         AxuqnG3LkkiOssbtnYM3FhCTToeaQgGiJ019mXqfABVYF78WiMW/nXiwsrFw0cej2wu7
         EL98CE/v8ABaIii1in63KI2qap71pl4AF3yFGxbKqM/pH8WhFxu3t8+/WYd3oDFc9EJ3
         oW4SG6tYNGO7i/fUiVGepKOg9YLq5KGZKXd9ylbnMXlN2XqfuMK6JFuX7mtnyoprNajE
         SEABuUCU4+Fm8iQgmrWsCry1uankuf6YwfdSvPUWHMM+842pdJYN5C4QRj3f63VK5RUX
         b8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696558958; x=1697163758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MgD2XlWyO1IkxKrZZ4NotDzi7FafWvmObFFGZh4fKtk=;
        b=N3cWGggq+P7ikvwbPQHvb2RIpeESYhbhRKmJzaJxoK4K6H0aVSExEdej+8SKfJdvJc
         KyzBALgXNp8ufDNBAa6VuILKujmQ6ZZKkKbwgDCQRZhI8QBZqt2sVNNAFaQlxG1yVmtz
         YoOtbfg4mg1LccTsApd+qQaxdy2JJvDI1xxkecleIbobYSWPtP2ylewE1tMY9L6nDwy7
         9tEjiaaSGRKWlKo3IjF3P8fP2h2w3WgIk/PH0XylxFLgkFgyWg7nar/wZt1crwqYv9R2
         pNeFQWby1760Uxvq3wXXZyM138qE7j72dT2PFvy8LH1CbxRSwOXTYwkwrFQp/s+GKoxw
         09WA==
X-Gm-Message-State: AOJu0YzoaeZwsv0klTZMKL145doGRpQD1rnoiV3JWftbwZjYxc1atyWP
	BLj/CZx4QGH5CQDj9Sh67Eck4w==
X-Google-Smtp-Source: AGHT+IG+mQuSZhsZ7s1GbN7oZkzhFLn2RCUCg1Is6VpUBCVfYtfZj/tayH7KU48aIsSbMRFm9GPikA==
X-Received: by 2002:a17:902:e542:b0:1c3:d07f:39f7 with SMTP id n2-20020a170902e54200b001c3d07f39f7mr7233603plf.62.1696558958573;
        Thu, 05 Oct 2023 19:22:38 -0700 (PDT)
Received: from localhost ([49.7.199.22])
        by smtp.gmail.com with ESMTPSA id 10-20020a170902c20a00b001ae0152d280sm2487893pll.193.2023.10.05.19.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 19:22:38 -0700 (PDT)
From: Jian Zhang <zhangjian.3032@bytedance.com>
To: brendan.higgins@linux.dev,
	benh@kernel.crashing.org,
	joel@jms.id.au,
	andrew@aj.id.au
Subject: [PATCH v3] i2c: aspeed: Fix i2c bus hang in slave read
Date: Fri,  6 Oct 2023 10:22:33 +0800
Message-Id: <20231006022233.3963590-1-zhangjian.3032@bytedance.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Andi Shyti <andi.shyti@kernel.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>, yulei.sh@bytedance.com, open list <linux-kernel@vger.kernel.org>, Wolfram Sang <wsa@kernel.org>, "open list:ARM/ASPEED I2C DRIVER" <linux-i2c@vger.kernel.org>, Tommy Huang <tommy_huang@aspeedtech.com>, zhangjian3032@gmail.com, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>, xiexinnan@bytedance.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

When the `CONFIG_I2C_SLAVE` option is enabled and the device operates
as a slave, a situation arises where the master sends a START signal
without the accompanying STOP signal. This action results in a
persistent I2C bus timeout. The core issue stems from the fact that
the i2c controller remains in a slave read state without a timeout
mechanism. As a consequence, the bus perpetually experiences timeouts.

In this case, the i2c bus will be reset, but the slave_state reset is
missing.

Fixes: fee465150b45 ("i2c: aspeed: Reset the i2c controller when timeout occurs")
Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
Acked-by: Andi Shyti <andi.shyti@kernel.org>
Tested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

---
Changelog:
 v3 - move to __aspeed_i2c_reg_slave.
 v2 - remove the i2c slave reset and only move the
 `bus->slave_state = ASPEED_I2C_SLAVE_INACTIVE` to the aspeed_i2c_init.
---
 drivers/i2c/busses/i2c-aspeed.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 5a416b39b818..28e2a5fc4528 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -749,6 +749,8 @@ static void __aspeed_i2c_reg_slave(struct aspeed_i2c_bus *bus, u16 slave_addr)
 	func_ctrl_reg_val = readl(bus->base + ASPEED_I2C_FUN_CTRL_REG);
 	func_ctrl_reg_val |= ASPEED_I2CD_SLAVE_EN;
 	writel(func_ctrl_reg_val, bus->base + ASPEED_I2C_FUN_CTRL_REG);
+
+	bus->slave_state = ASPEED_I2C_SLAVE_INACTIVE;
 }
 
 static int aspeed_i2c_reg_slave(struct i2c_client *client)
@@ -765,7 +767,6 @@ static int aspeed_i2c_reg_slave(struct i2c_client *client)
 	__aspeed_i2c_reg_slave(bus, client->addr);
 
 	bus->slave = client;
-	bus->slave_state = ASPEED_I2C_SLAVE_INACTIVE;
 	spin_unlock_irqrestore(&bus->lock, flags);
 
 	return 0;
-- 
2.30.2

