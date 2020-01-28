Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2B914AE4C
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 04:07:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486BPd2Cn4zDqGC
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 14:07:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=N9wmUpQX; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486BMz1cxqzDqGF
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jan 2020 14:06:22 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id r67so366546pjb.0
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jan 2020 19:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=x9CyzP5mYGs80vXKnJIP0ABbP5c5hUZVpdm34rV9OJE=;
 b=N9wmUpQX9g1S+Inqs5nS4VtlWHG7XhbKj32iwOYu4Wjr/KMH2DuR09ByfgSM4xj8Yj
 DeA8wwNb9y0GVS+OF8S+XMoFUTY5L0/w/aEl8ZqpYnJqUtd7EYLx3LntAfCsn97/52h3
 Iq36RwBnm6vwdzSEKAOhB4o+Wu35AX1DSAeeQdKiYL27iDbVlnW2xq5t14UABt1PvFpQ
 2ArsCYQc3mI4N29J+CAThvnmQwjLkhG6Ca1CGt3Bh9JmBwEFMQj51dcqwAhuBZI6apUT
 RyyTO8A9qN1HeqRNNh9D9ehXFJWkrbJR2IYjAL1SfY6hMi66llxxrxJ08cvHdvnkvvro
 8lLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=x9CyzP5mYGs80vXKnJIP0ABbP5c5hUZVpdm34rV9OJE=;
 b=hkv0KWbOk9iP62uz5zHCWp2WASe82pjoy3oYI/MtHA2se3uoJZzeKGvA/b6QmndBas
 8wA5oE2gv7mU3dbuWsMMzixNzZKIFAixY8AR9dmKQLix6u3EFSUM9ZeF15cSJtGjNP8K
 U55uaHuDNNbDiM4XhyCgrWod0N3tA4XTa6c1yT6VzLiCCnsuE/a6DUqvlF1hyO2uB4mr
 NZyfrjtZk9TJd6o3pZNHmOlKjEX67WfTBCR3BamBLUjKZemHzB+GVJdtIQ9YGQmikAE6
 bS2sOOv/MHlhqqQA6ldnqzNO/xPGhGfPXuFL0yXO1YOVUfCBS4SMfgXWndpeF/1Qh0mB
 myYQ==
X-Gm-Message-State: APjAAAUv5wAM+n3bLwW/TuQZYvwH9lNw4DbE3ji+nTuYP74HRT+Mw7HY
 lx8IctRqWGqIm8U4mUzSKNo=
X-Google-Smtp-Source: APXvYqyw9JamHQTV1oVWsLX4pesS6/qd90ZlCkaoHmJyzL2NPz0KwvyHrMfpHxtjFocPvFNsKjeqRw==
X-Received: by 2002:a17:902:9a8f:: with SMTP id w15mr53529plp.30.1580180779961; 
 Mon, 27 Jan 2020 19:06:19 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:200::2:ab25])
 by smtp.gmail.com with ESMTPSA id z4sm17357409pfn.42.2020.01.27.19.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 19:06:19 -0800 (PST)
From: rentao.bupt@gmail.com
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 taoren@fb.com, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 v3 2/3] usb: gadget: aspeed: add ast2600 vhub
 support
Date: Mon, 27 Jan 2020 19:06:02 -0800
Message-Id: <20200128030603.32612-3-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200128030603.32612-1-rentao.bupt@gmail.com>
References: <20200128030603.32612-1-rentao.bupt@gmail.com>
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
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 Changes in v3:
  - nothing.
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
index 94081cc04113..c827bf420278 100644
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

