Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D6A17B26B
	for <lists+openbmc@lfdr.de>; Fri,  6 Mar 2020 00:49:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YSBk06l6zDqS1
	for <lists+openbmc@lfdr.de>; Fri,  6 Mar 2020 10:49:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=i7M9+ENa; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YS9X6G5wzDqRq;
 Fri,  6 Mar 2020 10:47:58 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id n7so169208pfn.0;
 Thu, 05 Mar 2020 15:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=z2HXeME5Gk76DY5Zvh5p+H88p8YEhHXH5Ad0akNZ4Go=;
 b=i7M9+ENaqIDSGbdccu/70MshUdaM1GY6nsyiIOXyVdqlfp9GO06/CNeuQdJClQ1T6f
 5jbaLtuZpia8nMNur+hSQ6ow4hDRQwvgoF8qc+Bryi/Nr/upfoM54W3KzGR8ZN2FOYgk
 xnljo4UgHyDYzQCkhGO1LwezK5GZxjQFAVX3QIHKHV4wh/fHQwalTOOQ/1fAL2SanSNb
 uIr/xP/KzI6mZdLcbL0ZrG9k0V9AYHqlu8Z+DKlKQL3hl5CWc7XpM8Jr9lx4ag8HIlt4
 lg/fRzNEcVzS6qC+h49hpllj4NQJ8xACHPV3OeRjR+OQV0sG1lzyONqNqt24oNq3sVe+
 podA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=z2HXeME5Gk76DY5Zvh5p+H88p8YEhHXH5Ad0akNZ4Go=;
 b=HWMgBwssENnPJh0AUmI/nfHey0bGOBIZpeRzQj9YHyeNTVwg0cXFZ1Os5M/8vhJaHP
 x9ufG3IVIq13Tx4Sdf8oYVhYTx9YJCwID7RL7meWIRfCRhbQxMqSQhM2/GHwVK0p0EV8
 FBq+Xbsog0PUAfJFW/UNEblCozqz0r0TNqTXiObQTMqYJ7eTIyCk9MBivaxhY9de8MKr
 Papx1b6I8NMR8VOgJS5tbyFxnkI78fawsGOOb73c11hLO7ouIYOxr53/uDPSdUzujcT6
 LRp28IZHbE3UlA6uZoWSbFl/nSSZd/hNJeLXjJu2mPWQTR1rq5g7H+FgD8XCXsoG6YNA
 cH1A==
X-Gm-Message-State: ANhLgQ1aUucbb9JytMepicwdT9rrRcFrKwl3ktvlbe6oWkSaBqOE+yiC
 lEzW2QMXrvWi8jZfyfO4j40=
X-Google-Smtp-Source: ADFU+vuXtvzxvdAVnsjaChDBJL3af8XnJtk33bP+uqfR/WxN2Ya4fj+d8he6j7TKb31ahpsc05YQvw==
X-Received: by 2002:a63:8042:: with SMTP id j63mr581107pgd.224.1583452074966; 
 Thu, 05 Mar 2020 15:47:54 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:500::5:788])
 by smtp.gmail.com with ESMTPSA id s21sm4490620pfd.99.2020.03.05.15.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 15:47:54 -0800 (PST)
From: rentao.bupt@gmail.com
To: Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Stephen Boyd <swboyd@chromium.org>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH v2] usb: gadget: aspeed: improve vhub port irq handling
Date: Thu,  5 Mar 2020 15:47:46 -0800
Message-Id: <20200305234746.1002-1-rentao.bupt@gmail.com>
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
 Changes in v2:
   - use "for_each_set_bit" to speed up port irq handling.

 drivers/usb/gadget/udc/aspeed-vhub/core.c | 11 ++++++++---
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h |  8 +++-----
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
index f8d35dd60c34..af2dbd405361 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
@@ -134,11 +134,14 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
 	}
 
 	/* Handle device interrupts */
-	for (i = 0; i < vhub->max_ports; i++) {
-		u32 dev_mask = VHUB_IRQ_DEVICE1 << i;
+	if (istat & vhub->port_irq_mask) {
+		int offset = VHUB_IRQ_DEV1_BIT;
+		int size = VHUB_IRQ_DEV1_BIT + vhub->max_ports;
 
-		if (istat & dev_mask)
+		for_each_set_bit_from(offset, (unsigned long *)&istat, size) {
+			i = offset - VHUB_IRQ_DEV1_BIT;
 			ast_vhub_dev_irq(&vhub->ports[i].dev);
+		}
 	}
 
 	/* Handle top-level vHub EP0 interrupts */
@@ -332,6 +335,8 @@ static int ast_vhub_probe(struct platform_device *pdev)
 
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

