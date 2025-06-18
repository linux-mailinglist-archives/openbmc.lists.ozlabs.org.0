Return-Path: <openbmc+bounces-242-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CBAADE882
	for <lists+openbmc@lfdr.de>; Wed, 18 Jun 2025 12:22:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMftF4Rq8z2xS2;
	Wed, 18 Jun 2025 20:21:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750242117;
	cv=none; b=WDkNX79zej/IfqvTwSI+AFvuizWfetdOghWlziqoXyu5MwmNO3tMlMw/lhuMEXuovzdLYekHz7LUWyHY+Fx0sRfTxZ7gdATY0F0GsthdKpLRL5uT4L1oWL/G9Rxz4X093RoQB99jQuOKVVFsrgnzu+5xYZrGsxEi0Gg5Kk/4tFnOVg70ym2K+HdHKdfK9EzxeOkvIeGOVKR9qUEZwrEAaQoWNyNsyil45qwqVlCKJpCe7GmR1pNr5dfJ7J49BrnkRFogP4Y7goUwnFGl/E9zKm/VDcR/1UHYIsekn84E6oqmXYIZud0krGgxROJfRIX2YuYdRCfFp74ucx7Gcs6eSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750242117; c=relaxed/relaxed;
	bh=GjmzlSMJGThF/X6xEUPvfYdLDsdkYToZuOGOEJIFwyo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=meNtFJgMlSAauHMlzLJgC6ESa3V0voeXS91gRomvwDlcHAEy5UaEjDlsHldecb8t4Wv9nxjwYaxr+VzUbpTJN/8xO9vB49118IeUncFf58gjn00RKv03sSIs60cDJVDgP14bxGaz9he8acUUGDSYnaETjD0sQwVmIypSjXufok8KhJQyqOGLRPL89j7PorB8aqkqY/cMblH7aeWjdrBVsWk+6q07DY3r9/mj/VjHWd5VZvYVsEydODn/Uh3H5EEDgoOOY0EL+VDMtUfDVT2gritg97ApzkWs/d4mDXUxrNSXRAAIVMJzK3U3L2c/aWCUN3v9yKL4Ngx5oyDXimun2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=B5jQV495; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=zhangjian.3032@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=B5jQV495;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=zhangjian.3032@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMftC5JQPz2xRt
	for <openbmc@lists.ozlabs.org>; Wed, 18 Jun 2025 20:21:54 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-23508d30142so79966315ad.0
        for <openbmc@lists.ozlabs.org>; Wed, 18 Jun 2025 03:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750242113; x=1750846913; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GjmzlSMJGThF/X6xEUPvfYdLDsdkYToZuOGOEJIFwyo=;
        b=B5jQV495vSLYqruHkuVMAVk0AWBdQylNh8bPns1Rm/+jBPAsnttSBn5Rp4fRLXGzE+
         xXSKXOEuEk/cZAcw8JapI8KueRVCEYZ7ijBl3+qHqj6yBrC1FltkVkiWhuBtTqTY+ZpR
         zPa8Sa/sZa3SFO3Q8v1lZxt91Cya2WXWl7n/T27In6+NsvWcPzrrVUvzPJqttqdjk5P1
         bGd57P6+qdGj3RyGfrqBADvO7qDf1f0A1XtE584HNmeOazTxehk7QuM431p2eaiS9o6y
         Q+Kf29Aj1Gr++y4NbI/C4/kQfJgl4LU66BLLSqJMBXFsGYXR+DhntKhGZdeA9e9H6t4u
         7YTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750242113; x=1750846913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GjmzlSMJGThF/X6xEUPvfYdLDsdkYToZuOGOEJIFwyo=;
        b=o12c7f6v1SgfHlSEGYp0s5Q3EPFmACqFzHBtWKANmj3A1XubmuVqKaSDv45bEm0XJ4
         fmaoB2s5vtKP4J8ny6ei+BLka99zNWrXxqd1iPw3OtcOybCvWwh5Ru/IT8RzVnOq7HI2
         Wo3U4wZN2FO4tQT/OJhZd6bhMbTGX93mRjz4kY9rWMZQ22A7UiP5LCfIwgeIvjTaipvq
         FVh+tFfHwhdLt/KES+JsMgW753+xHn6hh5PDdgmuGB5XGHzbhegVafDeGwfeMY2MOmrj
         QwSgh7zMu1znw+uWFTeO572veVZlfwBVvY9G/DHtRvwfj+cA5G27Dpm0nXi+zVwkLxO/
         dcTA==
X-Forwarded-Encrypted: i=1; AJvYcCXlrgjhHo5zpwrTkrq9iX3/qlqSk7cW4oOK9gh/s5GzyTJuJr9LQ8CY0ruROx06Uyip0za5cMgT@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy4NgNcDlqS7qz3LK5UUW+SZxMS8QkLSy+CikFo+csf5dF1EXFu
	A2CLq65drnYHGYr5aNSlVtb09AGzOY0ElXt1d9zXWgRdJgOi5ad44oeMHrwvtPg5Cx8=
X-Gm-Gg: ASbGncvMtzq7z81LeJiyOX4LuummCCgv/jyB65wQ+7x2LEaPkx8GBPQKFoSKap7Y9lv
	TufwPiHHtgbD8NcX+JQqK6bAnU6JlTKcyCNeQ/mjIZsnphMxm3FZh2iZz+0v+nVI2PFDka6Pt7n
	xeaJ9aHrakNEWNx2kBt4vhg9dJsIrUNYCfN51Rw3x+PeI9I9k0nedviJ5daUEksxdsTBbXNzAyw
	y9BZu3eDFEZu39Naj+aYY5YTIrPAGXRkmBYL/4ZI8LywwGMdR1rFzkZEKT8RmfUKZH4RFmZTt+e
	7wi8UsRtZt1ksY0hMnN8ap2k614XpmnvCAjNH57LObOxWMf8EYyCsyxT4bth+pi58cBNMCQbaeV
	vEgy3sbo=
X-Google-Smtp-Source: AGHT+IFazvSPNlbUxR4VYiAlmcTE9A4W+7BMiVTRCRXWqUGSyQF3kdAvM4//0ZOLw44KbimyVMMUYw==
X-Received: by 2002:a17:902:c946:b0:234:d292:be95 with SMTP id d9443c01a7336-2366b149f20mr223382045ad.42.1750242112586;
        Wed, 18 Jun 2025 03:21:52 -0700 (PDT)
Received: from localhost ([106.38.221.150])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781dfsm96547735ad.131.2025.06.18.03.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 03:21:52 -0700 (PDT)
From: Jian Zhang <zhangjian.3032@bytedance.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: aspeed: change debug level in irq handler
Date: Wed, 18 Jun 2025 18:21:48 +0800
Message-ID: <20250618102148.3085214-1-zhangjian.3032@bytedance.com>
X-Mailer: git-send-email 2.47.0
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

In interrupt context, using dev_err() can potentially cause latency
or affect system responsiveness due to printing to console.

In our scenario, under certain conditions, i2c1 repeatedly printed
"irq handled != irq. expected ..." around 20 times within 1 second.
Each dev_err() log introduced approximately 10ms of blocking time,
which delayed the handling of other interrupts — for example, i2c2.

At the time, i2c2 was performing a PMBus firmware upgrade. The
target device on i2c2 was time-sensitive, and the upgrade protocol
was non-retryable. As a result, the delay caused by frequent error
logging led to a timeout and ultimately a failed firmware upgrade.

Frequent error printing in interrupt context can be dangerous,
as it introduces latency and interferes with time-critical tasks.
This patch changes the log level from dev_err() to dev_dbg() to
reduce potential impact.

Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 1550d3d552ae..38e23c826f39 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -317,7 +317,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 	switch (bus->slave_state) {
 	case ASPEED_I2C_SLAVE_READ_REQUESTED:
 		if (unlikely(irq_status & ASPEED_I2CD_INTR_TX_ACK))
-			dev_err(bus->dev, "Unexpected ACK on read request.\n");
+			dev_dbg(bus->dev, "Unexpected ACK on read request.\n");
 		bus->slave_state = ASPEED_I2C_SLAVE_READ_PROCESSED;
 		i2c_slave_event(slave, I2C_SLAVE_READ_REQUESTED, &value);
 		writel(value, bus->base + ASPEED_I2C_BYTE_BUF_REG);
@@ -325,7 +325,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		break;
 	case ASPEED_I2C_SLAVE_READ_PROCESSED:
 		if (unlikely(!(irq_status & ASPEED_I2CD_INTR_TX_ACK))) {
-			dev_err(bus->dev,
+			dev_dbg(bus->dev,
 				"Expected ACK after processed read.\n");
 			break;
 		}
@@ -354,7 +354,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		/* Slave was just started. Waiting for the next event. */;
 		break;
 	default:
-		dev_err(bus->dev, "unknown slave_state: %d\n",
+		dev_dbg(bus->dev, "unknown slave_state: %d\n",
 			bus->slave_state);
 		bus->slave_state = ASPEED_I2C_SLAVE_INACTIVE;
 		break;
@@ -459,7 +459,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 
 	/* We are in an invalid state; reset bus to a known state. */
 	if (!bus->msgs) {
-		dev_err(bus->dev, "bus in unknown state. irq_status: 0x%x\n",
+		dev_dbg(bus->dev, "bus in unknown state. irq_status: 0x%x\n",
 			irq_status);
 		bus->cmd_err = -EIO;
 		if (bus->master_state != ASPEED_I2C_MASTER_STOP &&
@@ -523,7 +523,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 			irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
 			goto error_and_stop;
 		} else if (unlikely(!(irq_status & ASPEED_I2CD_INTR_TX_ACK))) {
-			dev_err(bus->dev, "slave failed to ACK TX\n");
+			dev_dbg(bus->dev, "slave failed to ACK TX\n");
 			goto error_and_stop;
 		}
 		irq_handled |= ASPEED_I2CD_INTR_TX_ACK;
@@ -546,7 +546,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		fallthrough;
 	case ASPEED_I2C_MASTER_RX:
 		if (unlikely(!(irq_status & ASPEED_I2CD_INTR_RX_DONE))) {
-			dev_err(bus->dev, "master failed to RX\n");
+			dev_dbg(bus->dev, "master failed to RX\n");
 			goto error_and_stop;
 		}
 		irq_handled |= ASPEED_I2CD_INTR_RX_DONE;
@@ -577,7 +577,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		goto out_no_complete;
 	case ASPEED_I2C_MASTER_STOP:
 		if (unlikely(!(irq_status & ASPEED_I2CD_INTR_NORMAL_STOP))) {
-			dev_err(bus->dev,
+			dev_dbg(bus->dev,
 				"master failed to STOP. irq_status:0x%x\n",
 				irq_status);
 			bus->cmd_err = -EIO;
@@ -589,7 +589,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
 		goto out_complete;
 	case ASPEED_I2C_MASTER_INACTIVE:
-		dev_err(bus->dev,
+		dev_dbg(bus->dev,
 			"master received interrupt 0x%08x, but is inactive\n",
 			irq_status);
 		bus->cmd_err = -EIO;
@@ -665,7 +665,7 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
 
 	irq_remaining &= ~irq_handled;
 	if (irq_remaining)
-		dev_err(bus->dev,
+		dev_dbg(bus->dev,
 			"irq handled != irq. expected 0x%08x, but was 0x%08x\n",
 			irq_received, irq_handled);
 
-- 
2.47.0


