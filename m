Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10397172C00
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 00:08:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48T7dH2N9tzDr69
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 10:08:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DWvdFySm; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48T7YY44mdzDr7M;
 Fri, 28 Feb 2020 10:05:21 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id 6so468482pgk.0;
 Thu, 27 Feb 2020 15:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/6/5Jq8OX92b4HSNwKuaLqEuRxrbSYjBA5MrEijDT54=;
 b=DWvdFySm5O/Ij3fF20zWJZu4mrx+xEVpJuYsMloOUbcldQzIzUT8i21Py7kj3YqH9r
 h6C/hF+q841FVqXqlu81HDHicuIl5CEr7Y9MARaw8yf1AvTVKknjnt/5f4UsG1We8dh9
 MiHGsVL/f+KYu2U7JUECo+Y7KrsSZbPG2Lvkz2W4QeDzOM2ZnpIgNjRtVOYLBrZU4Fsc
 Ufjj7nCsUkhW75vAEZClRrMO48Lm+cVJT5cVLCMP0SF9uCHvgcC4vNIk1SOOXcShNCK6
 z5PdJplVKv8y4Bmxsxv5ewzjVnaPEr5QriP358ruaykqeObyYyIXCOPeYl+xj0EgfL4v
 yhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/6/5Jq8OX92b4HSNwKuaLqEuRxrbSYjBA5MrEijDT54=;
 b=Iy0X4p0J92xE5p60n28lyL+D8OIYmAKAFTNxv9mRkV5h1UfD0NLuB36yJZSIRcp1BL
 lEBwY83gIZ/LF1vWY9qgFgtAl5GUifhR49xGpai1lmLaL7A4Dl9IYImJyd+9z75r9UN5
 jPg8JRpJMxyrtmHLNs3Xq8GRs2/xbzCjAiEB9hY9ee49tcq6tIxIPFnfBMJGvxezKNFF
 govck8p2PEhSOxlmXjjQi8miR5x8VmmJPIBstwT0tbYgMc3ndWBr5FhmAdpvfKJ556WG
 +cKbkWn3mGaSv+7bkp7jxxhh7CmGTtilbXcvRVtF5xs0l+rVV5nnkKkGcegyxH8BlDU8
 anVw==
X-Gm-Message-State: APjAAAVw4ceuSvL+FWNl6nAyueMacPwibPwUqXLVx3cLBx4P8hWQr759
 kG3EZ8PY55E6ZtKiM0eEe8M=
X-Google-Smtp-Source: APXvYqz3DVM3OnkDUThhWnwP4pN5ZxKaxQKl7l+u0ECD+5kom/QMNC8W67pYN7UsiWXKk0UtP7t2Iw==
X-Received: by 2002:a62:1883:: with SMTP id 125mr1342541pfy.166.1582844717409; 
 Thu, 27 Feb 2020 15:05:17 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:500::4:d8f5])
 by smtp.gmail.com with ESMTPSA id w2sm8275975pfw.43.2020.02.27.15.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 15:05:17 -0800 (PST)
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
Subject: [PATCH v5 1/7] usb: gadget: aspeed: support per-vhub usb descriptors
Date: Thu, 27 Feb 2020 15:05:01 -0800
Message-Id: <20200227230507.8682-2-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200227230507.8682-1-rentao.bupt@gmail.com>
References: <20200227230507.8682-1-rentao.bupt@gmail.com>
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

This patch store vhub's standard usb descriptors in struct "ast_vhub" so
it's more convenient to customize descriptors and potentially support
multiple vhub instances in the future.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 No change in v2/v3/v4/v5:
   - the patch is added to the patch series since v4.

 drivers/usb/gadget/udc/aspeed-vhub/hub.c  | 43 ++++++++++++++++-------
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h | 15 ++++++++
 2 files changed, 46 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/hub.c b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
index 19b3517e04c0..9c3027306b15 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
@@ -93,11 +93,7 @@ static void ast_vhub_patch_dev_desc_usb1(struct usb_device_descriptor *desc)
 				 USB_DT_INTERFACE_SIZE + \
 				 USB_DT_ENDPOINT_SIZE)
 
-static const struct ast_vhub_full_cdesc {
-	struct usb_config_descriptor	cfg;
-	struct usb_interface_descriptor intf;
-	struct usb_endpoint_descriptor	ep;
-} __attribute__ ((packed)) ast_vhub_conf_desc = {
+static const struct ast_vhub_full_cdesc ast_vhub_conf_desc = {
 	.cfg = {
 		.bLength		= USB_DT_CONFIG_SIZE,
 		.bDescriptorType	= USB_DT_CONFIG,
@@ -266,6 +262,7 @@ static int ast_vhub_rep_desc(struct ast_vhub_ep *ep,
 			     u8 desc_type, u16 len)
 {
 	size_t dsize;
+	struct ast_vhub *vhub = ep->vhub;
 
 	EPDBG(ep, "GET_DESCRIPTOR(type:%d)\n", desc_type);
 
@@ -281,20 +278,20 @@ static int ast_vhub_rep_desc(struct ast_vhub_ep *ep,
 	switch(desc_type) {
 	case USB_DT_DEVICE:
 		dsize = USB_DT_DEVICE_SIZE;
-		memcpy(ep->buf, &ast_vhub_dev_desc, dsize);
-		BUILD_BUG_ON(dsize > sizeof(ast_vhub_dev_desc));
+		memcpy(ep->buf, &vhub->vhub_dev_desc, dsize);
+		BUILD_BUG_ON(dsize > sizeof(vhub->vhub_dev_desc));
 		BUILD_BUG_ON(USB_DT_DEVICE_SIZE >= AST_VHUB_EP0_MAX_PACKET);
 		break;
 	case USB_DT_CONFIG:
 		dsize = AST_VHUB_CONF_DESC_SIZE;
-		memcpy(ep->buf, &ast_vhub_conf_desc, dsize);
-		BUILD_BUG_ON(dsize > sizeof(ast_vhub_conf_desc));
+		memcpy(ep->buf, &vhub->vhub_conf_desc, dsize);
+		BUILD_BUG_ON(dsize > sizeof(vhub->vhub_conf_desc));
 		BUILD_BUG_ON(AST_VHUB_CONF_DESC_SIZE >= AST_VHUB_EP0_MAX_PACKET);
 		break;
 	case USB_DT_HUB:
 		dsize = AST_VHUB_HUB_DESC_SIZE;
-		memcpy(ep->buf, &ast_vhub_hub_desc, dsize);
-		BUILD_BUG_ON(dsize > sizeof(ast_vhub_hub_desc));
+		memcpy(ep->buf, &vhub->vhub_hub_desc, dsize);
+		BUILD_BUG_ON(dsize > sizeof(vhub->vhub_hub_desc));
 		BUILD_BUG_ON(AST_VHUB_HUB_DESC_SIZE >= AST_VHUB_EP0_MAX_PACKET);
 		break;
 	default:
@@ -317,7 +314,8 @@ static int ast_vhub_rep_string(struct ast_vhub_ep *ep,
 			       u8 string_id, u16 lang_id,
 			       u16 len)
 {
-	int rc = usb_gadget_get_string (&ast_vhub_strings, string_id, ep->buf);
+	int rc = usb_gadget_get_string(&ep->vhub->vhub_str_desc,
+					string_id, ep->buf);
 
 	/*
 	 * This should never happen unless we put too big strings in
@@ -834,9 +832,30 @@ void ast_vhub_hub_reset(struct ast_vhub *vhub)
 	writel(0, vhub->regs + AST_VHUB_EP1_STS_CHG);
 }
 
+static void ast_vhub_init_desc(struct ast_vhub *vhub)
+{
+	/* Initialize vhub Device Descriptor. */
+	memcpy(&vhub->vhub_dev_desc, &ast_vhub_dev_desc,
+		sizeof(vhub->vhub_dev_desc));
+
+	/* Initialize vhub Configuration Descriptor. */
+	memcpy(&vhub->vhub_conf_desc, &ast_vhub_conf_desc,
+		sizeof(vhub->vhub_conf_desc));
+
+	/* Initialize vhub Hub Descriptor. */
+	memcpy(&vhub->vhub_hub_desc, &ast_vhub_hub_desc,
+		sizeof(vhub->vhub_hub_desc));
+
+	/* Initialize vhub String Descriptors. */
+	memcpy(&vhub->vhub_str_desc, &ast_vhub_strings,
+		sizeof(vhub->vhub_str_desc));
+}
+
 void ast_vhub_init_hub(struct ast_vhub *vhub)
 {
 	vhub->speed = USB_SPEED_UNKNOWN;
 	INIT_WORK(&vhub->wake_work, ast_vhub_wake_work);
+
+	ast_vhub_init_desc(vhub);
 }
 
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
index 761919e220d3..191f9fae7420 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
+++ b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
@@ -2,6 +2,9 @@
 #ifndef __ASPEED_VHUB_H
 #define __ASPEED_VHUB_H
 
+#include <linux/usb.h>
+#include <linux/usb/ch11.h>
+
 /*****************************
  *                           *
  * VHUB register definitions *
@@ -373,6 +376,12 @@ struct ast_vhub_port {
 	struct ast_vhub_dev	dev;
 };
 
+struct ast_vhub_full_cdesc {
+	struct usb_config_descriptor	cfg;
+	struct usb_interface_descriptor intf;
+	struct usb_endpoint_descriptor	ep;
+} __packed;
+
 /* Global vhub structure */
 struct ast_vhub {
 	struct platform_device		*pdev;
@@ -409,6 +418,12 @@ struct ast_vhub {
 
 	/* Upstream bus speed captured at bus reset */
 	unsigned int			speed;
+
+	/* Standard USB Descriptors of the vhub. */
+	struct usb_device_descriptor	vhub_dev_desc;
+	struct ast_vhub_full_cdesc	vhub_conf_desc;
+	struct usb_hub_descriptor	vhub_hub_desc;
+	struct usb_gadget_strings	vhub_str_desc;
 };
 
 /* Standard request handlers result codes */
-- 
2.17.1

