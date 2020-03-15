Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE478185F91
	for <lists+openbmc@lfdr.de>; Sun, 15 Mar 2020 20:23:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48gTqS2xd4zDqHX
	for <lists+openbmc@lfdr.de>; Mon, 16 Mar 2020 06:23:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hdX3ezZp; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gTh32d6czDqC4;
 Mon, 16 Mar 2020 06:16:51 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id m15so8340387pgv.12;
 Sun, 15 Mar 2020 12:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3ftgzhaTcHumF1wl+zxzORyRVylT4QiROgG963NJrxE=;
 b=hdX3ezZpi2YDHwnAS48I6J3zhHF57KyVQEBULjcqbwkHFINN8RzdAuYHF+cUFowEes
 mdKXHoyh+/52Pe0RTFxqWSExz0pu/J1uqEIGvu19LZNHKRFNhFNrAjO0vGFl7ju3D8N8
 77cefLPQeOOi6MRIAHATQ6Av1T4CfP7YABlRNQ3VuqYtLcHIensCUFskH3AjIFmx2/No
 fGKi2qeuqm79wR+0YyTzJx+aLGCbK/llUxsSLHGJ1DP2USQs7vPJ4jdTOmPbFlxHNCgo
 jKyeGjUFj/HvPHvWh6CeAiC2JdKCGtyNRN6JWKOVXQOdGlv8azQgRm7fvYfyDcK+L3sy
 iEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3ftgzhaTcHumF1wl+zxzORyRVylT4QiROgG963NJrxE=;
 b=BvWKTkfucYm0ZPeqdNOowWV/Wvqdk7Ru4U4cDh6uUTchCkOOWbsBFkV/Yn1mPI/rw2
 H3e/xf4KY4seJKvDpbwqMrz2Fsv+2Lnn6+xIrKREHWAGNkCZY2awfRt5YpHrxhb+a6Hb
 jw7Ia+gdf/l22PAxjcYHzjHKFNwhLQA9hp6WsteQtultuBbC2Ag3yQmXPdOX/bQWhk3e
 z/sQ0oXGwKdRuiShFha3G+i6ygse8vHZla1yf1DPWes1oUGilB97rnVIh3tBbDx8Y6bM
 OgVMLTcRFPU/oiXX6sWwaVzqFrqg0+i5zfyb3cUS695j60yd21RPnomGkqrx+Vq8IW7c
 ptYw==
X-Gm-Message-State: ANhLgQ3EGQ2OMWQ85rHuTLNsJud04JiSstkw74HcVzJEslVBeqZGrbB6
 IVMnLM1BVhBgcT+LT1y5p4M=
X-Google-Smtp-Source: ADFU+vsIuGJ6NC3/lmhKrZurUH9P1d3lFbOZv5wVLK0E+vEjIvVQ8KXp+19oTFLLGwyXkL+Y/LD/kg==
X-Received: by 2002:a63:3d45:: with SMTP id k66mr23203589pga.56.1584299808334; 
 Sun, 15 Mar 2020 12:16:48 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-24-4-25-55.hsd1.ca.comcast.net. [24.4.25.55])
 by smtp.gmail.com with ESMTPSA id 13sm61431882pgo.13.2020.03.15.12.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 12:16:47 -0700 (PDT)
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
Subject: [PATCH v2 5/6] usb: gadget: aspeed: fixup usb1 device descriptor at
 init time
Date: Sun, 15 Mar 2020 12:16:31 -0700
Message-Id: <20200315191632.12536-6-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200315191632.12536-1-rentao.bupt@gmail.com>
References: <20200315191632.12536-1-rentao.bupt@gmail.com>
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

This patch moves patch-usb1-dev-desc logic from get-descriptor handler
to "ast_vhub_fixup_usb1_dev_desc" function so the code is executed only
once (at vhub initial time).

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 Changes in v2:
   - update per-vhub device descriptor instance instead of the global
     default descriptor.

 drivers/usb/gadget/udc/aspeed-vhub/hub.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/hub.c b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
index 13fba91aad6a..6497185ec4e7 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
@@ -73,13 +73,6 @@ static const struct usb_device_descriptor ast_vhub_dev_desc = {
 	.bNumConfigurations	= 1,
 };
 
-/* Patches to the above when forcing USB1 mode */
-static void ast_vhub_patch_dev_desc_usb1(struct usb_device_descriptor *desc)
-{
-	desc->bcdUSB = cpu_to_le16(0x0100);
-	desc->bDeviceProtocol = 0;
-}
-
 /*
  * Configuration descriptor: same comments as above
  * regarding handling USB1 mode.
@@ -303,10 +296,6 @@ static int ast_vhub_rep_desc(struct ast_vhub_ep *ep,
 	if (len > dsize)
 		len = dsize;
 
-	/* Patch it if forcing USB1 */
-	if (desc_type == USB_DT_DEVICE && ep->vhub->force_usb1)
-		ast_vhub_patch_dev_desc_usb1(ep->buf);
-
 	/* Shoot it from the EP buffer */
 	return ast_vhub_reply(ep, NULL, len);
 }
@@ -907,6 +896,12 @@ static void ast_vhub_of_parse_dev_desc(struct ast_vhub *vhub,
 	}
 }
 
+static void ast_vhub_fixup_usb1_dev_desc(struct ast_vhub *vhub)
+{
+	vhub->vhub_dev_desc.bcdUSB = cpu_to_le16(0x0100);
+	vhub->vhub_dev_desc.bDeviceProtocol = 0;
+}
+
 static struct usb_gadget_string_container*
 ast_vhub_str_container_alloc(struct ast_vhub *vhub)
 {
@@ -1021,6 +1016,8 @@ static int ast_vhub_init_desc(struct ast_vhub *vhub)
 	memcpy(&vhub->vhub_dev_desc, &ast_vhub_dev_desc,
 		sizeof(vhub->vhub_dev_desc));
 	ast_vhub_of_parse_dev_desc(vhub, vhub_np);
+	if (vhub->force_usb1)
+		ast_vhub_fixup_usb1_dev_desc(vhub);
 
 	/* Initialize vhub Configuration Descriptor. */
 	memcpy(&vhub->vhub_conf_desc, &ast_vhub_conf_desc,
-- 
2.17.1

