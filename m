Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26715777144
	for <lists+openbmc@lfdr.de>; Thu, 10 Aug 2023 09:22:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=cCKBkQQg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLz0G5tKwz30PN
	for <lists+openbmc@lfdr.de>; Thu, 10 Aug 2023 17:22:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=cCKBkQQg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=zhangjian.3032@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLyzd1RLdz2yDh
	for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2023 17:22:04 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6873a30d02eso413383b3a.3
        for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2023 00:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1691652122; x=1692256922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oCsFa++ogn7H/UBzN64O3INdySKF0/YyEIYVfwtbNi4=;
        b=cCKBkQQg3S66/frhBsmAlmRxovXilvClD1MVf+P/F/DowmmK8Ocu/GlQ9T4uPUxv4U
         u12XtTQ0rXPiTyvqbb55WTf+xmwq7qnFLIuoyT5J7YPA1SzpiRY+LCiKiTxbL73hTN3X
         pXOnqtky7JiPc0mU49MbYEH9OWr5oMrktoGi1Y6Fm7MQVTtLRkyRpvZB5AUYp7ILOAuu
         WbmmbVpIZAiQkjMdzY89weCPT3rE+mKG3NuBf2Hizx5BMKmbrYAtF6OhvTbg98urRmp4
         9JwvnEHzcwNDk0FeudEeL8ALFcAtKHd7IFL6MdTqicfcckmSlIdYbKK1ItGJB8uHzoLb
         TEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691652122; x=1692256922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oCsFa++ogn7H/UBzN64O3INdySKF0/YyEIYVfwtbNi4=;
        b=ids6E2iNtWDabfHFw9WuxbYzoWZeQAHrqJTVwDaOjqd+1QggvAXdTL+ksVNcbCFa1I
         v7zecqGbyZabun4RCyYbuwrX0AoTyD9EstwBVcfWoqHuhAJU92K9rfpVq978+llbyglK
         r2wrO+trF8qSjTbXhVVCdSvmMYA1BCQmlEVPM3WLeIN+A/WjJIeX1YYhfW/N+2X/4VL+
         dJ23XA0fIMdjyn/bKBI/K2Q2Ax3ABTC5KdLSW5Qq2+9Rm7nXFssY1SiGM2yM2SYIVeLW
         6KI0PaIBFGXktsQdRRBrmfNQZCIN/H2+SYglO1hD+y5mbPFbhsc2hh6c6tBCJzzyZRld
         pzIA==
X-Gm-Message-State: AOJu0Yyd1+2tQYPdG+jUnZx9Nf7dq/a7rTx09SeafaUT3cpz5jgy4afX
	3NZqPOfrg8eLDNZ/iHVD0y4NBQ==
X-Google-Smtp-Source: AGHT+IEND+WgzSbKSq1IjO2/9yuM5dCUzGFWbXi0PrhVd/2hDTcBqIjIu+42sIy/hJZwuV+CdVSa7A==
X-Received: by 2002:a05:6a20:325a:b0:134:a8a1:3bf with SMTP id hm26-20020a056a20325a00b00134a8a103bfmr1309418pzc.30.1691652122340;
        Thu, 10 Aug 2023 00:22:02 -0700 (PDT)
Received: from localhost ([49.7.199.210])
        by smtp.gmail.com with ESMTPSA id c6-20020a170902c1c600b001b8a3a0c928sm880830plc.181.2023.08.10.00.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 00:22:02 -0700 (PDT)
From: Jian Zhang <zhangjian.3032@bytedance.com>
To: brendan.higgins@linux.dev,
	benh@kernel.crashing.org,
	joel@jms.id.au,
	andrew@aj.id.au
Subject: [PATCH] i2c: aspeed: Fix i2c bus hang in slave read
Date: Thu, 10 Aug 2023 15:21:55 +0800
Message-Id: <20230810072155.3726352-1-zhangjian.3032@bytedance.com>
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
Cc: "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>, yulei.sh@bytedance.com, open list <linux-kernel@vger.kernel.org>, "open list:ARM/ASPEED I2C DRIVER" <linux-i2c@vger.kernel.org>, zhangjian3032@gmail.com, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>, xiexinnan@bytedance.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

When the `CONFIG_I2C_SLAVE` option is enabled and the device operates
as a slave, a situation arises where the master sends a START signal
without the accompanying STOP signal. This action results in a
persistent I2C bus timeout. The core issue stems from the fact that
the i2c controller remains in a slave read state without a timeout
mechanism. As a consequence, the bus perpetually experiences timeouts.

This proposed patch addresses this problem by introducing a status
check during i2c transmit timeouts. In the event that the controller
is in a slave read state, the i2c controller will be reset to restore
proper functionality and allow the I2C bus to resume normal operation.

Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index e76befe3f60f..1a95205fc946 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -113,6 +113,7 @@
 		 ASPEED_I2CD_M_RX_CMD |					       \
 		 ASPEED_I2CD_M_TX_CMD |					       \
 		 ASPEED_I2CD_M_START_CMD)
+#define ASPEED_I2CD_SLAVE_CMDS_MASK			GENMASK(31, 29)
 
 /* 0x18 : I2CD Slave Device Address Register   */
 #define ASPEED_I2CD_DEV_ADDR_MASK			GENMASK(6, 0)
@@ -706,6 +707,22 @@ static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
 		     ASPEED_I2CD_BUS_BUSY_STS))
 			aspeed_i2c_recover_bus(bus);
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+		/*
+		 * If master timed out and bus is in slave mode.
+		 * reset the slave mode.
+		 */
+		if (readl(bus->base + ASPEED_I2C_CMD_REG) & ASPEED_I2CD_SLAVE_CMDS_MASK) {
+			spin_lock_irqsave(&bus->lock, flags);
+			u32 func_ctrl_reg_val = readl(bus->base + ASPEED_I2C_FUN_CTRL_REG);
+
+			writel(0, bus->base + ASPEED_I2C_FUN_CTRL_REG);
+			writel(func_ctrl_reg_val, bus->base + ASPEED_I2C_FUN_CTRL_REG);
+			bus->slave_state = ASPEED_I2C_SLAVE_INACTIVE;
+			spin_unlock_irqrestore(&bus->lock, flags);
+		}
+#endif
+
 		/*
 		 * If timed out and the state is still pending, drop the pending
 		 * master command.
-- 
2.30.2

