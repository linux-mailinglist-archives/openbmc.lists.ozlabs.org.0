Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0583D13FD96
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 00:28:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zL440jpQzDql8
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 10:28:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OX4sFzXZ; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zL0b1HHQzDr9L
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2020 10:25:47 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id x6so10994435pfo.10
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jan 2020 15:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dJT3XEPh1wulXBsm2BcIKCL8ANO/IhYPq3d8NdbYXjw=;
 b=OX4sFzXZVM8EcHpNTfABKpyWtSeAKZPXLlb+V5c+eTznJFQcHgb8DG9OvHKRNsVdMu
 cSV2rtanLMmiW4u/EwPZ2l8GE9MwdvbbqHbd+2Yo1ir2aN+EAHhP6Ig/WoREcVxyzzs7
 ogC54ZEMc5oIFwkT84GC/A6vZDkBB0Z/YExp0n25qG8X2FpZiMbpiNMfzWPZqXYzLplp
 okulHZkY8ZGQ8JzdKAVSIYYNZnitLDFRL//w9D+wmkZ3XOkYSUvuS9WR1TCBcZJgn5cp
 b6GrbZN8IDERNpNvTBoc+f6MKVCDdlxA4AGkBIXTF2Ls56E2hhonljo8KTi3fVLUCtaL
 tpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dJT3XEPh1wulXBsm2BcIKCL8ANO/IhYPq3d8NdbYXjw=;
 b=byUN1vsUBMhXvr0SS40yyI4ZFdMU6wrfMrFhB3Gge0Z6xIfqMnfbayMNiDz+PC+mX+
 1xrjGkF3tdrLtm3p109/JqkcOEVW0kkYMqXkf+7U5DpvVmd81GdX65I1DD4LMT4Jz265
 1jAy7JUSisfzrbld1aVbGuRWWdHzvcO4zM1xdbtF7wNAx2yEUMeyN6Xev3lDnhYvCPBM
 /9fHBWy0SXQfvAHFtjgACYH4kODUVO12AV3yph9O4LtiWjtjlTUeCM3KR+kpNAMlvBwu
 ZGuoNqP69Owyo6+ZUQZ3mXCw+UAdSRz7iq2v7h/y8+LzZcj3fTzFhCqeMcDexSLMbicm
 yV4A==
X-Gm-Message-State: APjAAAV1D7EuNc+FbIqacGhVVBia31BSUgNehrFNyo9VUROPH9xJJDw4
 FG1eq4ubnRPvlK1cP4+56MA=
X-Google-Smtp-Source: APXvYqzi1fkwVgTVIuLmurx8lL1yKC3T0LUzbo1/SYGMN6bcCSSGQhaNx1crtJDMCSS5u/drGJxsJw==
X-Received: by 2002:a65:68c8:: with SMTP id k8mr42321932pgt.216.1579217145287; 
 Thu, 16 Jan 2020 15:25:45 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:200::1:7c0c])
 by smtp.gmail.com with ESMTPSA id o6sm25532204pgg.37.2020.01.16.15.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 15:25:44 -0800 (PST)
From: rentao.bupt@gmail.com
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 taoren@fb.com, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 1/2] usb: gadget: aspeed: add ast2600 vhub
 support
Date: Thu, 16 Jan 2020 15:25:24 -0800
Message-Id: <20200116232525.2819-2-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200116232525.2819-1-rentao.bupt@gmail.com>
References: <20200116232525.2819-1-rentao.bupt@gmail.com>
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

Add AST2600 support in aspeed-vhub driver.

There are 3 major differences between AST2500 and AST2600 vhub:
  - AST2600 supports 7 downstream devices while AST2500 supports 5.
  - AST2600 supports 21 programmable endpoints while AST2500 supports 15.
  - EP0 data buffer's 8-byte DMA alignment restriction is removed from
    AST2600.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 drivers/usb/gadget/udc/aspeed-vhub/Kconfig |  4 +--
 drivers/usb/gadget/udc/aspeed-vhub/core.c  | 25 ++++++-----------
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h  | 32 ++++++++++++++++------
 3 files changed, 35 insertions(+), 26 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/Kconfig b/drivers/usb/gadget/udc/aspeed-vhub/Kconfig
index 83ba8a2eb6af..605500b19cf3 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/Kconfig
+++ b/drivers/usb/gadget/udc/aspeed-vhub/Kconfig
@@ -4,5 +4,5 @@ config USB_ASPEED_VHUB
 	depends on ARCH_ASPEED || COMPILE_TEST
 	depends on USB_LIBCOMPOSITE
 	help
-	  USB peripheral controller for the Aspeed AST2500 family
-	  SoCs supporting the "vHub" functionality and USB2.0
+	  USB peripheral controller for the Aspeed AST2400, AST2500 and
+	  AST2600 family SoCs supporting the "vHub" functionality and USB2.0
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
index 90b134d5dca9..5fafe91d3619 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
@@ -97,6 +97,7 @@ void ast_vhub_free_request(struct usb_ep *u_ep, struct usb_request *u_req)
 
 static irqreturn_t ast_vhub_irq(int irq, void *data)
 {
+	u32 i;
 	struct ast_vhub *vhub = data;
 	irqreturn_t iret = IRQ_NONE;
 	u32 istat;
@@ -121,7 +122,7 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
 
 	/* Handle generic EPs first */
 	if (istat & VHUB_IRQ_EP_POOL_ACK_STALL) {
-		u32 i, ep_acks = readl(vhub->regs + AST_VHUB_EP_ACK_ISR);
+		u32 ep_acks = readl(vhub->regs + AST_VHUB_EP_ACK_ISR);
 		writel(ep_acks, vhub->regs + AST_VHUB_EP_ACK_ISR);
 
 		for (i = 0; ep_acks && i < AST_VHUB_NUM_GEN_EPs; i++) {
@@ -134,21 +135,10 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
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
+	for (i = 0; i < AST_VHUB_NUM_PORTS; i++) {
+		u32 dev_irq = VHUB_IRQ_DEVICE1 << i;
+		if (istat & dev_irq)
+			ast_vhub_dev_irq(&vhub->ports[i].dev);
 	}
 
 	/* Handle top-level vHub EP0 interrupts */
@@ -407,6 +397,9 @@ static const struct of_device_id ast_vhub_dt_ids[] = {
 	{
 		.compatible = "aspeed,ast2500-usb-vhub",
 	},
+	{
+		.compatible = "aspeed,ast2600-usb-vhub",
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ast_vhub_dt_ids);
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
index 761919e220d3..76935d02decf 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
+++ b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
@@ -2,6 +2,23 @@
 #ifndef __ASPEED_VHUB_H
 #define __ASPEED_VHUB_H
 
+/*****************************
+ *                           *
+ * Maximum devices/endpoints *
+ *                           *
+ *****************************/
+
+#ifdef CONFIG_MACH_ASPEED_G6
+#define AST_VHUB_NUM_GEN_EPs	21	/* Generic non-0 EPs */
+#define AST_VHUB_NUM_PORTS	7	/* vHub ports */
+#else
+#define AST_VHUB_NUM_GEN_EPs	15	/* Generic non-0 EPs */
+#define AST_VHUB_NUM_PORTS	5	/* vHub ports */
+#endif
+
+#define AST_VHUB_GEN_EPS_MASK	((1 << AST_VHUB_NUM_GEN_EPs) - 1)
+#define AST_VHUB_PORTS_MASK	((1 << AST_VHUB_NUM_PORTS) - 1)
+
 /*****************************
  *                           *
  * VHUB register definitions *
@@ -51,6 +68,8 @@
 #define VHUB_IRQ_USB_CMD_DEADLOCK		(1 << 18)
 #define VHUB_IRQ_EP_POOL_NAK			(1 << 17)
 #define VHUB_IRQ_EP_POOL_ACK_STALL		(1 << 16)
+#define VHUB_IRQ_DEVICE7			(1 << 15)
+#define VHUB_IRQ_DEVICE6			(1 << 14)
 #define VHUB_IRQ_DEVICE5			(1 << 13)
 #define VHUB_IRQ_DEVICE4			(1 << 12)
 #define VHUB_IRQ_DEVICE3			(1 << 11)
@@ -70,23 +89,22 @@
 /* SW reset reg */
 #define VHUB_SW_RESET_EP_POOL			(1 << 9)
 #define VHUB_SW_RESET_DMA_CONTROLLER		(1 << 8)
+#define VHUB_SW_RESET_DEVICE7			(1 << 7)
+#define VHUB_SW_RESET_DEVICE6			(1 << 6)
 #define VHUB_SW_RESET_DEVICE5			(1 << 5)
 #define VHUB_SW_RESET_DEVICE4			(1 << 4)
 #define VHUB_SW_RESET_DEVICE3			(1 << 3)
 #define VHUB_SW_RESET_DEVICE2			(1 << 2)
 #define VHUB_SW_RESET_DEVICE1			(1 << 1)
 #define VHUB_SW_RESET_ROOT_HUB			(1 << 0)
+#define VHUB_SW_RESET_DEV_MASK			(AST_VHUB_PORTS_MASK << 1)
 #define VHUB_SW_RESET_ALL			(VHUB_SW_RESET_EP_POOL | \
 						 VHUB_SW_RESET_DMA_CONTROLLER | \
-						 VHUB_SW_RESET_DEVICE5 | \
-						 VHUB_SW_RESET_DEVICE4 | \
-						 VHUB_SW_RESET_DEVICE3 | \
-						 VHUB_SW_RESET_DEVICE2 | \
-						 VHUB_SW_RESET_DEVICE1 | \
+						 VHUB_SW_RESET_DEV_MASK | \
 						 VHUB_SW_RESET_ROOT_HUB)
 /* EP ACK/NACK IRQ masks */
 #define VHUB_EP_IRQ(n)				(1 << (n))
-#define VHUB_EP_IRQ_ALL				0x7fff	/* 15 EPs */
+#define VHUB_EP_IRQ_ALL				AST_VHUB_GEN_EPS_MASK
 
 /* USB status reg */
 #define VHUB_USBSTS_HISPEED			(1 << 27)
@@ -210,8 +228,6 @@
  *                                      *
  ****************************************/
 
-#define AST_VHUB_NUM_GEN_EPs	15	/* Generic non-0 EPs */
-#define AST_VHUB_NUM_PORTS	5	/* vHub ports */
 #define AST_VHUB_EP0_MAX_PACKET	64	/* EP0's max packet size */
 #define AST_VHUB_EPn_MAX_PACKET	1024	/* Generic EPs max packet size */
 #define AST_VHUB_DESCS_COUNT	256	/* Use 256 descriptor mode (valid
-- 
2.17.1

