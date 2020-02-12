Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB40E15B349
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2020 23:00:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HtqP4SFTzDqMN
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 09:00:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uBxxufH2; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HtmB1GSJzDq9L;
 Thu, 13 Feb 2020 08:57:29 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id p11so1457107plq.10;
 Wed, 12 Feb 2020 13:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4tjReg1lKs1fiF+Bw+voT3e/60NS6rAfZNC8eRItwu4=;
 b=uBxxufH2TXDNmGTqq+C5wD0GGdpyuCRtnmznd9noZd4cRbu7OXTY/p2UMCPhY8W/AV
 7/3wAbv/UaiTLiAxmW/cZjxRqmes7gR2zVWrh4oUj3CLtMTeVGLB2nuJZ1eV3V+ASnqC
 +SGs1CG6gdSwu1FZ5sEuznNXN0dP0dKGFfJV0lYt6fylP0A0TgZqMzddE8qMvCBc7d5I
 vg3PSxC2EeJG1DT0z61QtZHmVRCAY4KTBZEceK/y/rp2+IquzLjOlBQhEbxNHM3kmsMW
 wZhEnewRYxx8rqzH3wTv7Wwp32/5sNXmrtbqi6vcg6fY0ukSPwU6sOi4vA1dzcwMDxZM
 yO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4tjReg1lKs1fiF+Bw+voT3e/60NS6rAfZNC8eRItwu4=;
 b=gw/LgBtzAsNyoXAEH+MqSTuIw7Q0LzOWuNrTfynfXSu9mzx8ska9w8UY7VfWj0fWW0
 Rl+qSd83lb+VTmH8SI38Q8xyAEnmeYj8Ro4iLAJDyco3QfiuIf48CcJDqQtTds08tIH8
 QvMinhNRxOXYt+uofwA0jZgUSLUlELLBRfPKBoAi1JkvV5CFFmfP1a/+TEfZ5f6KvidQ
 ombH0w6Hhg1JfsaVAUovq+Kk8IzxbixXpsUNtKJ9OeUYI7FqOhED18ssstqgBSFx3u3Q
 DBFZs5w4CEnUOF4yZMvb4AkdWMs2GXIJXh24/yPJuiR9QJ+5FPOOqnTKMxt9KyoDn0tr
 uNsw==
X-Gm-Message-State: APjAAAV157m5tjz0ivLzX4Otocx1Qquo6PTVZ3ojnr3KDzMtUKoJCc6r
 K6reYnzjTouo1AVpFaffZyA=
X-Google-Smtp-Source: APXvYqwMgat7Gk1D6frRVSn6oMuL1szqmix2RnpoqBNodIThX9cLtAzCbjNrA5Yzb14UMaEO1pjWoQ==
X-Received: by 2002:a17:90a:8043:: with SMTP id
 e3mr1281673pjw.24.1581544647745; 
 Wed, 12 Feb 2020 13:57:27 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:200::3:533f])
 by smtp.gmail.com with ESMTPSA id r6sm214431pfh.91.2020.02.12.13.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 13:57:27 -0800 (PST)
From: rentao.bupt@gmail.com
To: Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Colin Ian King <colin.king@canonical.com>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH v2 1/5] usb: gadget: aspeed: read vhub properties from device
 tree
Date: Wed, 12 Feb 2020 13:57:13 -0800
Message-Id: <20200212215717.9474-2-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212215717.9474-1-rentao.bupt@gmail.com>
References: <20200212215717.9474-1-rentao.bupt@gmail.com>
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

The patch introduces 2 DT properties ("aspeed,vhub-downstream-ports" and
"aspeed,vhub-generic-endpoints") which replaces hardcoded port/endpoint
number. It is to make it more convenient to add support for newer vhub
revisions with different number of ports and endpoints.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 Changes in v2:
   - removed ast_vhub_config structure and moved vhub port/endpoint
     number into device tree.

 drivers/usb/gadget/udc/aspeed-vhub/core.c | 68 ++++++++++++++---------
 drivers/usb/gadget/udc/aspeed-vhub/dev.c  | 30 +++++++---
 drivers/usb/gadget/udc/aspeed-vhub/epn.c  |  4 +-
 drivers/usb/gadget/udc/aspeed-vhub/hub.c  | 26 ++++++---
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h | 23 +++-----
 5 files changed, 91 insertions(+), 60 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
index 90b134d5dca9..d6f737fac4e2 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
@@ -99,7 +99,7 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
 {
 	struct ast_vhub *vhub = data;
 	irqreturn_t iret = IRQ_NONE;
-	u32 istat;
+	u32 i, istat;
 
 	/* Stale interrupt while tearing down */
 	if (!vhub->ep0_bufs)
@@ -121,10 +121,10 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
 
 	/* Handle generic EPs first */
 	if (istat & VHUB_IRQ_EP_POOL_ACK_STALL) {
-		u32 i, ep_acks = readl(vhub->regs + AST_VHUB_EP_ACK_ISR);
+		u32 ep_acks = readl(vhub->regs + AST_VHUB_EP_ACK_ISR);
 		writel(ep_acks, vhub->regs + AST_VHUB_EP_ACK_ISR);
 
-		for (i = 0; ep_acks && i < AST_VHUB_NUM_GEN_EPs; i++) {
+		for (i = 0; ep_acks && i < vhub->max_epns; i++) {
 			u32 mask = VHUB_EP_IRQ(i);
 			if (ep_acks & mask) {
 				ast_vhub_epn_ack_irq(&vhub->epns[i]);
@@ -134,21 +134,11 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
 	}
 
 	/* Handle device interrupts */
-	if (istat & (VHUB_IRQ_DEVICE1 |
-		     VHUB_IRQ_DEVICE2 |
-		     VHUB_IRQ_DEVICE3 |
-		     VHUB_IRQ_DEVICE4 |
-		     VHUB_IRQ_DEVICE5)) {
-		if (istat & VHUB_IRQ_DEVICE1)
-			ast_vhub_dev_irq(&vhub->ports[0].dev);
-		if (istat & VHUB_IRQ_DEVICE2)
-			ast_vhub_dev_irq(&vhub->ports[1].dev);
-		if (istat & VHUB_IRQ_DEVICE3)
-			ast_vhub_dev_irq(&vhub->ports[2].dev);
-		if (istat & VHUB_IRQ_DEVICE4)
-			ast_vhub_dev_irq(&vhub->ports[3].dev);
-		if (istat & VHUB_IRQ_DEVICE5)
-			ast_vhub_dev_irq(&vhub->ports[4].dev);
+	for (i = 0; i < vhub->max_ports; i++) {
+		u32 dev_mask = VHUB_IRQ_DEVICE1 << i;
+
+		if (istat & dev_mask)
+			ast_vhub_dev_irq(&vhub->ports[i].dev);
 	}
 
 	/* Handle top-level vHub EP0 interrupts */
@@ -182,7 +172,7 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
 
 void ast_vhub_init_hw(struct ast_vhub *vhub)
 {
-	u32 ctrl;
+	u32 ctrl, port_mask, epn_mask;
 
 	UDCDBG(vhub,"(Re)Starting HW ...\n");
 
@@ -222,15 +212,20 @@ void ast_vhub_init_hw(struct ast_vhub *vhub)
 	}
 
 	/* Reset all devices */
-	writel(VHUB_SW_RESET_ALL, vhub->regs + AST_VHUB_SW_RESET);
+	port_mask = GENMASK(vhub->max_ports, 1);
+	writel(VHUB_SW_RESET_ROOT_HUB |
+	       VHUB_SW_RESET_DMA_CONTROLLER |
+	       VHUB_SW_RESET_EP_POOL |
+	       port_mask, vhub->regs + AST_VHUB_SW_RESET);
 	udelay(1);
 	writel(0, vhub->regs + AST_VHUB_SW_RESET);
 
 	/* Disable and cleanup EP ACK/NACK interrupts */
+	epn_mask = GENMASK(vhub->max_epns - 1, 0);
 	writel(0, vhub->regs + AST_VHUB_EP_ACK_IER);
 	writel(0, vhub->regs + AST_VHUB_EP_NACK_IER);
-	writel(VHUB_EP_IRQ_ALL, vhub->regs + AST_VHUB_EP_ACK_ISR);
-	writel(VHUB_EP_IRQ_ALL, vhub->regs + AST_VHUB_EP_NACK_ISR);
+	writel(epn_mask, vhub->regs + AST_VHUB_EP_ACK_ISR);
+	writel(epn_mask, vhub->regs + AST_VHUB_EP_NACK_ISR);
 
 	/* Default settings for EP0, enable HW hub EP1 */
 	writel(0, vhub->regs + AST_VHUB_EP0_CTRL);
@@ -273,7 +268,7 @@ static int ast_vhub_remove(struct platform_device *pdev)
 		return 0;
 
 	/* Remove devices */
-	for (i = 0; i < AST_VHUB_NUM_PORTS; i++)
+	for (i = 0; i < vhub->max_ports; i++)
 		ast_vhub_del_dev(&vhub->ports[i].dev);
 
 	spin_lock_irqsave(&vhub->lock, flags);
@@ -295,7 +290,7 @@ static int ast_vhub_remove(struct platform_device *pdev)
 	if (vhub->ep0_bufs)
 		dma_free_coherent(&pdev->dev,
 				  AST_VHUB_EP0_MAX_PACKET *
-				  (AST_VHUB_NUM_PORTS + 1),
+				  (vhub->max_ports + 1),
 				  vhub->ep0_bufs,
 				  vhub->ep0_bufs_dma);
 	vhub->ep0_bufs = NULL;
@@ -309,11 +304,32 @@ static int ast_vhub_probe(struct platform_device *pdev)
 	struct ast_vhub *vhub;
 	struct resource *res;
 	int i, rc = 0;
+	const struct device_node *np = pdev->dev.of_node;
 
 	vhub = devm_kzalloc(&pdev->dev, sizeof(*vhub), GFP_KERNEL);
 	if (!vhub)
 		return -ENOMEM;
 
+	rc = of_property_read_u32(np, "aspeed,vhub-downstream-ports",
+				  &vhub->max_ports);
+	if (rc < 0)
+		return -ENODEV;
+
+	vhub->ports = devm_kcalloc(&pdev->dev, vhub->max_ports,
+				   sizeof(*vhub->ports), GFP_KERNEL);
+	if (!vhub->ports)
+		return -ENOMEM;
+
+	rc = of_property_read_u32(np, "aspeed,vhub-generic-endpoints",
+				  &vhub->max_epns);
+	if (rc < 0)
+		return -ENODEV;
+
+	vhub->epns = devm_kcalloc(&pdev->dev, vhub->max_epns,
+				  sizeof(*vhub->epns), GFP_KERNEL);
+	if (!vhub->epns)
+		return -ENOMEM;
+
 	spin_lock_init(&vhub->lock);
 	vhub->pdev = pdev;
 
@@ -366,7 +382,7 @@ static int ast_vhub_probe(struct platform_device *pdev)
 	 */
 	vhub->ep0_bufs = dma_alloc_coherent(&pdev->dev,
 					    AST_VHUB_EP0_MAX_PACKET *
-					    (AST_VHUB_NUM_PORTS + 1),
+					    (vhub->max_ports + 1),
 					    &vhub->ep0_bufs_dma, GFP_KERNEL);
 	if (!vhub->ep0_bufs) {
 		dev_err(&pdev->dev, "Failed to allocate EP0 DMA buffers\n");
@@ -380,7 +396,7 @@ static int ast_vhub_probe(struct platform_device *pdev)
 	ast_vhub_init_ep0(vhub, &vhub->ep0, NULL);
 
 	/* Init devices */
-	for (i = 0; i < AST_VHUB_NUM_PORTS && rc == 0; i++)
+	for (i = 0; i < vhub->max_ports && rc == 0; i++)
 		rc = ast_vhub_init_dev(vhub, i);
 	if (rc)
 		goto err;
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/dev.c b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
index 4008e7a51188..d268306a7bfe 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/dev.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
@@ -77,7 +77,7 @@ static void ast_vhub_dev_enable(struct ast_vhub_dev *d)
 	writel(d->ep0.buf_dma, d->regs + AST_VHUB_DEV_EP0_DATA);
 
 	/* Clear stall on all EPs */
-	for (i = 0; i < AST_VHUB_NUM_GEN_EPs; i++) {
+	for (i = 0; i < d->max_epns; i++) {
 		struct ast_vhub_ep *ep = d->epns[i];
 
 		if (ep && (ep->epn.stalled || ep->epn.wedged)) {
@@ -137,7 +137,7 @@ static int ast_vhub_ep_feature(struct ast_vhub_dev *d,
 	     is_set ? "SET" : "CLEAR", ep_num, wValue);
 	if (ep_num == 0)
 		return std_req_complete;
-	if (ep_num >= AST_VHUB_NUM_GEN_EPs || !d->epns[ep_num - 1])
+	if (ep_num >= d->max_epns || !d->epns[ep_num - 1])
 		return std_req_stall;
 	if (wValue != USB_ENDPOINT_HALT)
 		return std_req_driver;
@@ -181,7 +181,7 @@ static int ast_vhub_ep_status(struct ast_vhub_dev *d,
 
 	DDBG(d, "GET_STATUS(ep%d)\n", ep_num);
 
-	if (ep_num >= AST_VHUB_NUM_GEN_EPs)
+	if (ep_num >= d->max_epns)
 		return std_req_stall;
 	if (ep_num != 0) {
 		ep = d->epns[ep_num - 1];
@@ -299,7 +299,7 @@ static void ast_vhub_dev_nuke(struct ast_vhub_dev *d)
 {
 	unsigned int i;
 
-	for (i = 0; i < AST_VHUB_NUM_GEN_EPs; i++) {
+	for (i = 0; i < d->max_epns; i++) {
 		if (!d->epns[i])
 			continue;
 		ast_vhub_nuke(d->epns[i], -ESHUTDOWN);
@@ -416,10 +416,10 @@ static struct usb_ep *ast_vhub_udc_match_ep(struct usb_gadget *gadget,
 	 * that will allow the generic code to use our
 	 * assigned address.
 	 */
-	for (i = 0; i < AST_VHUB_NUM_GEN_EPs; i++)
+	for (i = 0; i < d->max_epns; i++)
 		if (d->epns[i] == NULL)
 			break;
-	if (i >= AST_VHUB_NUM_GEN_EPs)
+	if (i >= d->max_epns)
 		return NULL;
 	addr = i + 1;
 
@@ -526,6 +526,7 @@ void ast_vhub_del_dev(struct ast_vhub_dev *d)
 
 	usb_del_gadget_udc(&d->gadget);
 	device_unregister(d->port_dev);
+	kfree(d->epns);
 }
 
 static void ast_vhub_dev_release(struct device *dev)
@@ -546,14 +547,25 @@ int ast_vhub_init_dev(struct ast_vhub *vhub, unsigned int idx)
 
 	ast_vhub_init_ep0(vhub, &d->ep0, d);
 
+	/*
+	 * A USB device can have up to 30 endpoints besides control
+	 * endpoint 0.
+	 */
+	d->max_epns = min_t(u32, vhub->max_epns, 30);
+	d->epns = kcalloc(d->max_epns, sizeof(*d->epns), GFP_KERNEL);
+	if (!d->epns)
+		return -ENOMEM;
+
 	/*
 	 * The UDC core really needs us to have separate and uniquely
 	 * named "parent" devices for each port so we create a sub device
 	 * here for that purpose
 	 */
 	d->port_dev = kzalloc(sizeof(struct device), GFP_KERNEL);
-	if (!d->port_dev)
-		return -ENOMEM;
+	if (!d->port_dev) {
+		rc = -ENOMEM;
+		goto fail_alloc;
+	}
 	device_initialize(d->port_dev);
 	d->port_dev->release = ast_vhub_dev_release;
 	d->port_dev->parent = parent;
@@ -584,6 +596,8 @@ int ast_vhub_init_dev(struct ast_vhub *vhub, unsigned int idx)
 	device_del(d->port_dev);
  fail_add:
 	put_device(d->port_dev);
+ fail_alloc:
+	kfree(d->epns);
 
 	return rc;
 }
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/epn.c b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
index 7475c74aa5c5..0bd6b20435b8 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/epn.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
@@ -800,10 +800,10 @@ struct ast_vhub_ep *ast_vhub_alloc_epn(struct ast_vhub_dev *d, u8 addr)
 
 	/* Find a free one (no device) */
 	spin_lock_irqsave(&vhub->lock, flags);
-	for (i = 0; i < AST_VHUB_NUM_GEN_EPs; i++)
+	for (i = 0; i < vhub->max_epns; i++)
 		if (vhub->epns[i].dev == NULL)
 			break;
-	if (i >= AST_VHUB_NUM_GEN_EPs) {
+	if (i >= vhub->max_epns) {
 		spin_unlock_irqrestore(&vhub->lock, flags);
 		return NULL;
 	}
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/hub.c b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
index 19b3517e04c0..9c7e57fbd8ef 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
@@ -133,10 +133,13 @@ static const struct ast_vhub_full_cdesc {
 
 #define AST_VHUB_HUB_DESC_SIZE	(USB_DT_HUB_NONVAR_SIZE + 2)
 
-static const struct usb_hub_descriptor ast_vhub_hub_desc = {
+/*
+ * "bNbrPorts" field is updated in "ast_vhub_init_hub" function based on
+ * "max_ports" of the vhub.
+ */
+static struct usb_hub_descriptor ast_vhub_hub_desc = {
 	.bDescLength			= AST_VHUB_HUB_DESC_SIZE,
 	.bDescriptorType		= USB_DT_HUB,
-	.bNbrPorts			= AST_VHUB_NUM_PORTS,
 	.wHubCharacteristics		= cpu_to_le16(HUB_CHAR_NO_LPSM),
 	.bPwrOn2PwrGood			= 10,
 	.bHubContrCurrent		= 0,
@@ -504,7 +507,7 @@ static void ast_vhub_wake_work(struct work_struct *work)
 	 * we let the normal host wake path deal with it later.
 	 */
 	spin_lock_irqsave(&vhub->lock, flags);
-	for (i = 0; i < AST_VHUB_NUM_PORTS; i++) {
+	for (i = 0; i < vhub->max_ports; i++) {
 		struct ast_vhub_port *p = &vhub->ports[i];
 
 		if (!(p->status & USB_PORT_STAT_SUSPEND))
@@ -587,7 +590,7 @@ static enum std_req_rc ast_vhub_set_port_feature(struct ast_vhub_ep *ep,
 	struct ast_vhub *vhub = ep->vhub;
 	struct ast_vhub_port *p;
 
-	if (port == 0 || port > AST_VHUB_NUM_PORTS)
+	if (port == 0 || port > vhub->max_ports)
 		return std_req_stall;
 	port--;
 	p = &vhub->ports[port];
@@ -630,7 +633,7 @@ static enum std_req_rc ast_vhub_clr_port_feature(struct ast_vhub_ep *ep,
 	struct ast_vhub *vhub = ep->vhub;
 	struct ast_vhub_port *p;
 
-	if (port == 0 || port > AST_VHUB_NUM_PORTS)
+	if (port == 0 || port > vhub->max_ports)
 		return std_req_stall;
 	port--;
 	p = &vhub->ports[port];
@@ -676,7 +679,7 @@ static enum std_req_rc ast_vhub_get_port_stat(struct ast_vhub_ep *ep,
 	struct ast_vhub *vhub = ep->vhub;
 	u16 stat, chg;
 
-	if (port == 0 || port > AST_VHUB_NUM_PORTS)
+	if (port == 0 || port > vhub->max_ports)
 		return std_req_stall;
 	port--;
 
@@ -757,7 +760,7 @@ void ast_vhub_hub_suspend(struct ast_vhub *vhub)
 	 * Forward to unsuspended ports without changing
 	 * their connection status.
 	 */
-	for (i = 0; i < AST_VHUB_NUM_PORTS; i++) {
+	for (i = 0; i < vhub->max_ports; i++) {
 		struct ast_vhub_port *p = &vhub->ports[i];
 
 		if (!(p->status & USB_PORT_STAT_SUSPEND))
@@ -780,7 +783,7 @@ void ast_vhub_hub_resume(struct ast_vhub *vhub)
 	 * Forward to unsuspended ports without changing
 	 * their connection status.
 	 */
-	for (i = 0; i < AST_VHUB_NUM_PORTS; i++) {
+	for (i = 0; i < vhub->max_ports; i++) {
 		struct ast_vhub_port *p = &vhub->ports[i];
 
 		if (!(p->status & USB_PORT_STAT_SUSPEND))
@@ -814,7 +817,7 @@ void ast_vhub_hub_reset(struct ast_vhub *vhub)
 	 * Clear all port status, disable gadgets and "suspend"
 	 * them. They will be woken up by a port reset.
 	 */
-	for (i = 0; i < AST_VHUB_NUM_PORTS; i++) {
+	for (i = 0; i < vhub->max_ports; i++) {
 		struct ast_vhub_port *p = &vhub->ports[i];
 
 		/* Only keep the connected flag */
@@ -838,5 +841,10 @@ void ast_vhub_init_hub(struct ast_vhub *vhub)
 {
 	vhub->speed = USB_SPEED_UNKNOWN;
 	INIT_WORK(&vhub->wake_work, ast_vhub_wake_work);
+
+	/*
+	 * Fixup number of ports in hub descriptor.
+	 */
+	ast_vhub_hub_desc.bNbrPorts = vhub->max_ports;
 }
 
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
index 761919e220d3..e46980fe66f2 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
+++ b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
@@ -76,17 +76,9 @@
 #define VHUB_SW_RESET_DEVICE2			(1 << 2)
 #define VHUB_SW_RESET_DEVICE1			(1 << 1)
 #define VHUB_SW_RESET_ROOT_HUB			(1 << 0)
-#define VHUB_SW_RESET_ALL			(VHUB_SW_RESET_EP_POOL | \
-						 VHUB_SW_RESET_DMA_CONTROLLER | \
-						 VHUB_SW_RESET_DEVICE5 | \
-						 VHUB_SW_RESET_DEVICE4 | \
-						 VHUB_SW_RESET_DEVICE3 | \
-						 VHUB_SW_RESET_DEVICE2 | \
-						 VHUB_SW_RESET_DEVICE1 | \
-						 VHUB_SW_RESET_ROOT_HUB)
+
 /* EP ACK/NACK IRQ masks */
 #define VHUB_EP_IRQ(n)				(1 << (n))
-#define VHUB_EP_IRQ_ALL				0x7fff	/* 15 EPs */
 
 /* USB status reg */
 #define VHUB_USBSTS_HISPEED			(1 << 27)
@@ -210,8 +202,6 @@
  *                                      *
  ****************************************/
 
-#define AST_VHUB_NUM_GEN_EPs	15	/* Generic non-0 EPs */
-#define AST_VHUB_NUM_PORTS	5	/* vHub ports */
 #define AST_VHUB_EP0_MAX_PACKET	64	/* EP0's max packet size */
 #define AST_VHUB_EPn_MAX_PACKET	1024	/* Generic EPs max packet size */
 #define AST_VHUB_DESCS_COUNT	256	/* Use 256 descriptor mode (valid
@@ -342,7 +332,7 @@ struct ast_vhub_dev {
 	struct ast_vhub			*vhub;
 	void __iomem			*regs;
 
-	/* Device index (0...4) and name string */
+	/* Device index (zero-based) and name string */
 	unsigned int			index;
 	const char			*name;
 
@@ -358,7 +348,8 @@ struct ast_vhub_dev {
 
 	/* Endpoint structures */
 	struct ast_vhub_ep		ep0;
-	struct ast_vhub_ep		*epns[AST_VHUB_NUM_GEN_EPs];
+	struct ast_vhub_ep		**epns;
+	u32				max_epns;
 
 };
 #define to_ast_dev(__g) container_of(__g, struct ast_vhub_dev, gadget)
@@ -393,10 +384,12 @@ struct ast_vhub {
 	bool				ep1_stalled : 1;
 
 	/* Per-port info */
-	struct ast_vhub_port		ports[AST_VHUB_NUM_PORTS];
+	struct ast_vhub_port		*ports;
+	u32				max_ports;
 
 	/* Generic EP data structures */
-	struct ast_vhub_ep		epns[AST_VHUB_NUM_GEN_EPs];
+	struct ast_vhub_ep		*epns;
+	u32				max_epns;
 
 	/* Upstream bus is suspended ? */
 	bool				suspended : 1;
-- 
2.17.1

