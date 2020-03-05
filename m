Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD7E179DF6
	for <lists+openbmc@lfdr.de>; Thu,  5 Mar 2020 03:40:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Xw2r1NQjzDqk7
	for <lists+openbmc@lfdr.de>; Thu,  5 Mar 2020 13:40:20 +1100 (AEDT)
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
 header.s=20161025 header.b=rwg0PwY/; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Xw1l12jpzDqjp;
 Thu,  5 Mar 2020 13:39:22 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id p7so1956505pli.5;
 Wed, 04 Mar 2020 18:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=YW1iAxgihWa7R1z2LZ0jq4L5SHYbV/y2Cl+4YB22Nq0=;
 b=rwg0PwY/pBMBBCdKXuCPnAOK+gKG8fWRjtLb8qoZDbY2XJir4nAN2j81+pu+Zm2ChD
 hCn10l37f12AqtrZmjlcBD/nXxilTi1O5VC6L/m9NC3V/T+XjjprVRilKGBmuIXjF1Ha
 Q+f7PNBgvDLKzBGbFa9qfE2bK1jHst3TZcW69C7NNScimVRub52WWTe497P8RrB74WRd
 bGLkqLKdi19e02DtQArGXu1Z8c2QS/J4wF3IRXj0U5poiJ/Oremq2M7A07gOQhv5yO6i
 ysJSDXEThmhWBDGfdo1hLCVBFb5PwWZ9dozA5wIqkKl6M0Cumh/IyVeNoEDEZDDr5Eqm
 vz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=YW1iAxgihWa7R1z2LZ0jq4L5SHYbV/y2Cl+4YB22Nq0=;
 b=CwyPSqGRaL72xylyoI4Tmw6q1I1AIJZeHjpTdZgUywGprkI+0RMSg5ujZSC89YvBhE
 Sz0Q/iyBMXg6fdf0N8VMyYKFM248dAaZN9i6wkhtYKsU4LLPPnps6Cyl8JTrJh5vqqYs
 rBXWsP1ly347bTYwQTUiAUE5jj9E0e33SqIUFixY58dWw3wZU7+FpPzwEjizWQrk0yzk
 2o0+9l5bbl3jq7N+Ob3poEDImM52t3d5NW6LDWR4lJgWKHZpnY+wqU5SGwh1/V4Lv06v
 EqCNtr9e0fD8zfBVXSOCrSmpLUTKPUOZIi2bG+suFw7cZoGqkggYXZoGfl10wkihyxxc
 rl0w==
X-Gm-Message-State: ANhLgQ0iI1Vrww/ZJjiWnycv4gOb7kwuw1XtFaP1jGDEdu+SddtsufHt
 wkMy9CHo4OgRe9QzYtUOTTE=
X-Google-Smtp-Source: ADFU+vvNfv1O4y+T8xjWDrOY/eMq3S4rz6h3FPkm/6Mv8mQrQ0af/lXw9Wl/PKse4xev/7IwPhvWKg==
X-Received: by 2002:a17:90a:e012:: with SMTP id
 u18mr6415803pjy.190.1583375959117; 
 Wed, 04 Mar 2020 18:39:19 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:500::5:7dc6])
 by smtp.gmail.com with ESMTPSA id i197sm26750447pfe.137.2020.03.04.18.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 18:39:18 -0800 (PST)
From: rentao.bupt@gmail.com
To: Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Stephen Boyd <swboyd@chromium.org>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH] usb: gadget: aspeed: improve vhub port irq handling
Date: Wed,  4 Mar 2020 18:38:59 -0800
Message-Id: <20200305023859.21057-1-rentao.bupt@gmail.com>
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
 drivers/usb/gadget/udc/aspeed-vhub/core.c | 11 ++++++-----
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h |  8 ++++----
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
index f8d35dd60c34..a03e4e4ea401 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
@@ -134,11 +134,11 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
 	}
 
 	/* Handle device interrupts */
-	for (i = 0; i < vhub->max_ports; i++) {
-		u32 dev_mask = VHUB_IRQ_DEVICE1 << i;
-
-		if (istat & dev_mask)
-			ast_vhub_dev_irq(&vhub->ports[i].dev);
+	if (istat & vhub->port_irq_mask) {
+		for (i = 0; i < vhub->max_ports; i++) {
+			if (istat & VHUB_DEV_IRQ(i))
+				ast_vhub_dev_irq(&vhub->ports[i].dev);
+		}
 	}
 
 	/* Handle top-level vHub EP0 interrupts */
@@ -332,6 +332,7 @@ static int ast_vhub_probe(struct platform_device *pdev)
 
 	spin_lock_init(&vhub->lock);
 	vhub->pdev = pdev;
+	vhub->port_irq_mask = GENMASK(vhub->max_ports + 8, 9);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	vhub->regs = devm_ioremap_resource(&pdev->dev, res);
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
index fac79ef6d669..e49924ec7e58 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
+++ b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
@@ -54,10 +54,6 @@
 #define VHUB_IRQ_USB_CMD_DEADLOCK		(1 << 18)
 #define VHUB_IRQ_EP_POOL_NAK			(1 << 17)
 #define VHUB_IRQ_EP_POOL_ACK_STALL		(1 << 16)
-#define VHUB_IRQ_DEVICE5			(1 << 13)
-#define VHUB_IRQ_DEVICE4			(1 << 12)
-#define VHUB_IRQ_DEVICE3			(1 << 11)
-#define VHUB_IRQ_DEVICE2			(1 << 10)
 #define VHUB_IRQ_DEVICE1			(1 << 9)
 #define VHUB_IRQ_BUS_RESUME			(1 << 8)
 #define VHUB_IRQ_BUS_SUSPEND 			(1 << 7)
@@ -70,6 +66,9 @@
 #define VHUB_IRQ_HUB_EP0_SETUP			(1 << 0)
 #define VHUB_IRQ_ACK_ALL			0x1ff
 
+/* Downstream device IRQ mask. */
+#define VHUB_DEV_IRQ(n)				(VHUB_IRQ_DEVICE1 << (n))
+
 /* SW reset reg */
 #define VHUB_SW_RESET_EP_POOL			(1 << 9)
 #define VHUB_SW_RESET_DMA_CONTROLLER		(1 << 8)
@@ -402,6 +401,7 @@ struct ast_vhub {
 	/* Per-port info */
 	struct ast_vhub_port		*ports;
 	u32				max_ports;
+	u32				port_irq_mask;
 
 	/* Generic EP data structures */
 	struct ast_vhub_ep		*epns;
-- 
2.17.1

