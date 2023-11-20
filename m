Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 215117F2609
	for <lists+openbmc@lfdr.de>; Tue, 21 Nov 2023 08:02:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C0Xva+9A;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZFgH6s5dz3cbl
	for <lists+openbmc@lfdr.de>; Tue, 21 Nov 2023 18:02:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C0Xva+9A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYhkC18fyz2xdd;
	Mon, 20 Nov 2023 20:17:54 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so3171467a12.1;
        Mon, 20 Nov 2023 01:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700471873; x=1701076673; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tdiBbtmZINpiK2wrkr8560HBNxLICLlfhPzVnTah2sg=;
        b=C0Xva+9AMMa6ClGZlEbpXk61eOrKKHJqqxD3GfpWqQrbz7YtLn2qNV3ATMTe2Gboag
         MTarGk8NmJMRbMzO015NFR96JzmUcNvXR1NZyOQdcNDcoDM6tDnpopU4qv/gjn+2Z1F0
         GOz23MrK3OtEoD3TLKZd0aECGCqPEenANA8DM5IiivIDO7jT0p927PIjXvpk5qPyW7bA
         bGip9rgyzn12dQHCeByVWOnaIOIbm5AU7Zhdt5KAIeed+X5J/dIYonLcR+tdtf9M9x1E
         C0o+FP8fU6Wovjvk5h+QQMlW50qpGNeL+44T8ED+xaqkLN7Zo50M502mENvXSbtRb3eI
         ggyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700471873; x=1701076673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tdiBbtmZINpiK2wrkr8560HBNxLICLlfhPzVnTah2sg=;
        b=vnrWZuUi7WMapQkuCjqojsXcPhBw+0b7heNDedPjMFYqYbZMj6mvPq2hfzRWPVRpRJ
         nmS0Zo/JmZmt+pWePvzQj//D/m+XLuHDl7VbmLjhhBOVBgO+MdLxB9YaDfzAezdQlJ6q
         mlISJlfpDEAdoduA+j0e/eBhDu7D/NdXYrY4nU7v0q5FwdwtCqvEdnfI/vJtwiOJM0Os
         3ea4wTh7V56FFX2jLNhv/rN2cPwk5d8hzD/vV7O3V7l4LnZyHYAPceC/j8GbkdT8cBLl
         AS0vwbuMuoXG6YpXbCEp8Gy8hnfS/lljMIsZl2aSQn+7OS2xPLx0R0Zzx7SFRDf95tKA
         SRCQ==
X-Gm-Message-State: AOJu0YxDSoOvfDnC6zx/lYvYwViscjWRCEqSAGnVSd9DiBQi0GspoZf1
	ygPGIJeDMux05BVIhPhY2YM=
X-Google-Smtp-Source: AGHT+IEp+cuTi7iFRTT+hATic2jTuRdHoJOGZ8nbXlJYs561PX9JAj/1CEyo7iX6uiwbF8PlbiVoTA==
X-Received: by 2002:a05:6a20:4429:b0:188:75c:e69a with SMTP id ce41-20020a056a20442900b00188075ce69amr10006442pzb.4.1700471872866;
        Mon, 20 Nov 2023 01:17:52 -0800 (PST)
Received: from cosmo-ubuntu-2204.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id j12-20020a056a00130c00b0068fece22469sm5582116pfu.4.2023.11.20.01.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 01:17:52 -0800 (PST)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: brendan.higgins@linux.dev,
	benh@kernel.crashing.org,
	joel@jms.id.au,
	andi.shyti@kernel.org,
	andrew@codeconstruct.com.au,
	linux@roeck-us.net,
	wsa@kernel.org,
	jae.hyun.yoo@linux.intel.com
Subject: [PATCH] i2c: aspeed: Acknowledge Tx ack late when in SLAVE_READ_PROCESSED
Date: Mon, 20 Nov 2023 17:17:46 +0800
Message-Id: <20231120091746.2866232-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 21 Nov 2023 18:01:51 +1100
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
Cc: linux-aspeed@lists.ozlabs.org, chou.cosmo@gmail.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, cosmo.chou@quantatw.com, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

commit 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early
in interrupt handler") moved most interrupt acknowledgments to the
start of the interrupt handler to avoid race conditions. However,
slave Tx ack status shouldn't be cleared before SLAVE_READ_PROCESSED
is handled.

Acknowledge Tx ack status after handling SLAVE_READ_PROCESSED to fix
the problem that the next byte is not sent correctly.

Fixes: 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early in interrupt handler")
Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 28e2a5fc4528..c2d74e4b7e50 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -337,6 +337,12 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		break;
 	}
 
+	/* Ack Tx ack */
+	if (irq_handled & ASPEED_I2CD_INTR_TX_ACK) {
+		writel(ASPEED_I2CD_INTR_TX_ACK, bus->base + ASPEED_I2C_INTR_STS_REG);
+		readl(bus->base + ASPEED_I2C_INTR_STS_REG);
+	}
+
 	return irq_handled;
 }
 #endif /* CONFIG_I2C_SLAVE */
@@ -602,13 +608,18 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
 {
 	struct aspeed_i2c_bus *bus = dev_id;
-	u32 irq_received, irq_remaining, irq_handled;
+	u32 irq_received, irq_remaining, irq_handled, irq_acked;
 
 	spin_lock(&bus->lock);
 	irq_received = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
 	/* Ack all interrupts except for Rx done */
-	writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
-	       bus->base + ASPEED_I2C_INTR_STS_REG);
+	irq_acked = irq_received & ~ASPEED_I2CD_INTR_RX_DONE;
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	/* shouldn't ack Slave Tx Ack before it's handled */
+	if (bus->slave_state == ASPEED_I2C_SLAVE_READ_PROCESSED)
+		irq_acked &= ~ASPEED_I2CD_INTR_TX_ACK;
+#endif
+	writel(irq_acked, bus->base + ASPEED_I2C_INTR_STS_REG);
 	readl(bus->base + ASPEED_I2C_INTR_STS_REG);
 	irq_received &= ASPEED_I2CD_INTR_RECV_MASK;
 	irq_remaining = irq_received;
-- 
2.34.1

