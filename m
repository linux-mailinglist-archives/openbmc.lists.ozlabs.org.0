Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6ECC185F52
	for <lists+openbmc@lfdr.de>; Sun, 15 Mar 2020 20:15:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48gTfV1p5DzDqN1
	for <lists+openbmc@lfdr.de>; Mon, 16 Mar 2020 06:15:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sANpO3aj; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gTdd0lF9zDqBg;
 Mon, 16 Mar 2020 06:14:42 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id h11so6890430plk.7;
 Sun, 15 Mar 2020 12:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=QJPqyWkxe0FvdCujVYrv8IN7juT6CFWXSWYBT76q9+w=;
 b=sANpO3ajZY3xjd0/k5q4rDelXESgjIkMWTO+p4kXH7fYWkGB7cYw4Qk3k1aKpvrfDw
 LI0ZMEDjgt8aoOkf7GtZkLwFrtingsW+Z0udRO1WLjWzmMp/tNFPv1jp/Or/dUgxo3Ux
 ikywRVWGd6NDrL+A2btSdotr41flUCEuAHWZE+cF5s6UPI+AZyry5DI01kEK29tFXEvw
 XS5k0uonygKubgiJR+2ibb/5miv39jalJ5gKmopKknFBrdnDJjp5lc75U+fsdO5UVOzt
 RAxAF5h5ioz0nhSs0cVRKPjtdNziOkxUd4QtZ9s6TWvlwHeImvMOv4fYRXz2vT1clUaT
 SuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=QJPqyWkxe0FvdCujVYrv8IN7juT6CFWXSWYBT76q9+w=;
 b=FWJAAh1IoTPhSNUsXnUDc5Jn3EViwkei3eypxZO5hEFxF8WEKi7gsLds59vpsxS0wc
 v4yT7YxCqebNbpgSfU6g8zMbpuiQl4Jqc2kk3cz8O7HksXWCHStT+X9IEiWwIdgTTmTl
 S7jNIu1fKZLd036wq7W9qUDfSEZUpcUNaWI6m9oeCJr9JNPdx28Vi8QA2Ge4/dGNMcwa
 usl2UK9s6LE3veY2+ImqD1oxEUEP+Qc/jChy3iHZb04cT9jwWD3gVEgNVevUKHgVzGG1
 il2jWIDjZipqmyGyIuS+8oj20Gi2Oo+nImKzZ+i2DkZUk5efRFGx1+SaOUuRLXlYx8IH
 ZVeA==
X-Gm-Message-State: ANhLgQ1YXwuWiu5Sbyv8KNaayICAI+AbHi8SHtHtwRorgrO+JrPc1nQc
 lvt25hUyUsP0MTrook4YXNE=
X-Google-Smtp-Source: ADFU+vsYz8bmmqz+GFTxMop+sYVx/jLaNj6ejge3qbhBfCf1tOnqa7+uPrV8Zs+/qlZLiYPfrd+otw==
X-Received: by 2002:a17:90a:d081:: with SMTP id
 k1mr22621148pju.57.1584299678766; 
 Sun, 15 Mar 2020 12:14:38 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-24-4-25-55.hsd1.ca.comcast.net. [24.4.25.55])
 by smtp.gmail.com with ESMTPSA id z22sm41859247pgn.19.2020.03.15.12.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 12:14:37 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Stephen Boyd <swboyd@chromium.org>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH v3] usb: gadget: aspeed: improve vhub port irq handling
Date: Sun, 15 Mar 2020 12:14:30 -0700
Message-Id: <20200315191430.12379-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Tao Ren <rentao.bupt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

This patch evaluates vhub ports' irq mask before going through per-port
irq handling one by one, which helps to speed up irq handling in case
there is no port interrupt.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 Changes in v3:
   - assign istat to (unsigned long) bitmap before calling
     "for_each_set_bit_from".
 Changes in v2:
   - use "for_each_set_bit" to speed up port irq handling.

 drivers/usb/gadget/udc/aspeed-vhub/core.c | 12 +++++++++---
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h |  8 +++-----
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
index f8d35dd60c34..555e8645fb1e 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
@@ -134,11 +134,15 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
 	}
 
 	/* Handle device interrupts */
-	for (i = 0; i < vhub->max_ports; i++) {
-		u32 dev_mask = VHUB_IRQ_DEVICE1 << i;
+	if (istat & vhub->port_irq_mask) {
+		unsigned long bitmap = istat;
+		int offset = VHUB_IRQ_DEV1_BIT;
+		int size = VHUB_IRQ_DEV1_BIT + vhub->max_ports;
 
-		if (istat & dev_mask)
+		for_each_set_bit_from(offset, &bitmap, size) {
+			i = offset - VHUB_IRQ_DEV1_BIT;
 			ast_vhub_dev_irq(&vhub->ports[i].dev);
+		}
 	}
 
 	/* Handle top-level vHub EP0 interrupts */
@@ -332,6 +336,8 @@ static int ast_vhub_probe(struct platform_device *pdev)
 
 	spin_lock_init(&vhub->lock);
 	vhub->pdev = pdev;
+	vhub->port_irq_mask = GENMASK(VHUB_IRQ_DEV1_BIT + vhub->max_ports - 1,
+				      VHUB_IRQ_DEV1_BIT);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	vhub->regs = devm_ioremap_resource(&pdev->dev, res);
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
index fac79ef6d669..23a1ac91f8d2 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
+++ b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
@@ -51,14 +51,11 @@
 #define VHUB_CTRL_UPSTREAM_CONNECT		(1 << 0)
 
 /* IER & ISR */
+#define VHUB_IRQ_DEV1_BIT			9
 #define VHUB_IRQ_USB_CMD_DEADLOCK		(1 << 18)
 #define VHUB_IRQ_EP_POOL_NAK			(1 << 17)
 #define VHUB_IRQ_EP_POOL_ACK_STALL		(1 << 16)
-#define VHUB_IRQ_DEVICE5			(1 << 13)
-#define VHUB_IRQ_DEVICE4			(1 << 12)
-#define VHUB_IRQ_DEVICE3			(1 << 11)
-#define VHUB_IRQ_DEVICE2			(1 << 10)
-#define VHUB_IRQ_DEVICE1			(1 << 9)
+#define VHUB_IRQ_DEVICE1			(1 << (VHUB_IRQ_DEV1_BIT))
 #define VHUB_IRQ_BUS_RESUME			(1 << 8)
 #define VHUB_IRQ_BUS_SUSPEND 			(1 << 7)
 #define VHUB_IRQ_BUS_RESET 			(1 << 6)
@@ -402,6 +399,7 @@ struct ast_vhub {
 	/* Per-port info */
 	struct ast_vhub_port		*ports;
 	u32				max_ports;
+	u32				port_irq_mask;
 
 	/* Generic EP data structures */
 	struct ast_vhub_ep		*epns;
-- 
2.17.1

