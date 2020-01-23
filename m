Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AC71462E8
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2020 08:53:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483Dz90vfbzDqVN
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2020 18:53:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dvw5egxV; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483Dvn1rn1zDqTg
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jan 2020 18:50:12 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id d5so817411pjz.5
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jan 2020 23:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0F2pWw99tzuTCOcTxJSdgdKWdZIVN+97/QkUGOimXRw=;
 b=dvw5egxVDVguCSjSgoYsABmwYpO6kfdlgKqvzdnJxhmpmfX+vunLwLuElqFwkuNT3g
 CniUUwMMyekJsKzm2KxaoM0RXrH8kFlH7gRgoUQK+3JMVfM2mbET+EVGbHymG31D6v91
 tWnnlYFvWAFK4DfLHb0THqgY+re4GR+yp27q3nlxCG7enH9d9SOuuPfqpEKxIk6tzoVf
 B55p6T+CMTxkBHe3gCdeSXSSle8Hu28Mh4Ofj4cnG1L4lqVdmycyW/7WmmRF8iEEH+9G
 o8Z4dwOgEM4KHnjvqdvr2JrikJNunYj9f4fplM44bSYpVKwB9Km0QxE5jYwJFTkp+daB
 iNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0F2pWw99tzuTCOcTxJSdgdKWdZIVN+97/QkUGOimXRw=;
 b=VNYiSDmg1qJEjW2M332VZc2bz4oKTgRKcaXjgxN8ULnOxELH7dLWdllD61P9trkAdS
 da6LQ+ovS3Gw/z0SKTlbrxNxOKll753eUXFMKtN/vfS+QyCgHD8DwGsj6ln/jtrdXZiK
 +t27ZIrmN5Q1h2qXs3JwXImacIgmoOd+/16Xmwr/gSZRt0Fr9RdwWvwGtispk/skUkDi
 EvRumo5eXL0POchupfavhiKFCY1EH+pUXfXftvP3dJ8KLB5xthNXOFfCtGrP/EuvaW5E
 HeuIE/P9UHuYcJDL7rWgc0NpWsjDnmA8N0XsTp0/rGXcP2SRxqvJaffcVNlt1gl0tU2q
 PVmw==
X-Gm-Message-State: APjAAAU7IQ7UhZr+FoIZ/SVjaNI3nhqBz7fU/hAeFi9TQxosmJg4PLxu
 8jOgsZYd7kp7f1FFTK+pGc4HKhO9CaI=
X-Google-Smtp-Source: APXvYqz6CDKozGz/WVwSRlWvRghGLr63YKNYerdhxJZ029dCYlpitKN11UBqfsQp9W3JoekToXdX9A==
X-Received: by 2002:a17:902:ab82:: with SMTP id
 f2mr6738454plr.36.1579765810587; 
 Wed, 22 Jan 2020 23:50:10 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-24-4-25-55.hsd1.ca.comcast.net. [24.4.25.55])
 by smtp.gmail.com with ESMTPSA id 3sm1526755pjg.27.2020.01.22.23.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 23:50:10 -0800 (PST)
From: rentao.bupt@gmail.com
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 taoren@fb.com, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 v2 2/3] usb: gadget: aspeed: add ast2600 vhub
 support
Date: Wed, 22 Jan 2020 23:49:55 -0800
Message-Id: <20200123074956.21482-3-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200123074956.21482-1-rentao.bupt@gmail.com>
References: <20200123074956.21482-1-rentao.bupt@gmail.com>
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

Add AST2600 support in aspeed-vhub driver. There are 3 major differences
between AST2500 and AST2600 vhub:
  - AST2600 supports 7 downstream ports while AST2500 supports 5.
  - AST2600 supports 21 generic endpoints while AST2500 supports 15.
  - EP0 data buffer's 8-byte DMA alignment restriction is removed from
    AST2600.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 Changes in v2:
  - all the ports/endpoints handling logic are moved to patch #1.

 drivers/usb/gadget/udc/aspeed-vhub/Kconfig | 4 ++--
 drivers/usb/gadget/udc/aspeed-vhub/core.c  | 9 +++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

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
index 9efbfdffad30..8caa6f6bd3d5 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
@@ -42,6 +42,11 @@ static const struct ast_vhub_config ast2400_config = {
 	.max_epns = 15,
 };
 
+static const struct ast_vhub_config ast2600_config = {
+	.max_ports = 7,
+	.max_epns = 21,
+};
+
 static const struct of_device_id ast_vhub_dt_ids[] = {
 	{
 		.compatible = "aspeed,ast2400-usb-vhub",
@@ -51,6 +56,10 @@ static const struct of_device_id ast_vhub_dt_ids[] = {
 		.compatible = "aspeed,ast2500-usb-vhub",
 		.data = &ast2400_config,
 	},
+	{
+		.compatible = "aspeed,ast2600-usb-vhub",
+		.data = &ast2600_config,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ast_vhub_dt_ids);
-- 
2.17.1

