Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7134E161F5D
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 04:15:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48M5bB0nkyzDqVj
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 14:15:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.215.195;
 helo=mail-pg1-f195.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=C4Dz20e0; dkim-atps=neutral
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48M5Yj1HFlzDqT3;
 Tue, 18 Feb 2020 14:14:32 +1100 (AEDT)
Received: by mail-pg1-f195.google.com with SMTP id g3so10090968pgs.11;
 Mon, 17 Feb 2020 19:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JlrTFZcXaXEEafeSE3nImbB0vbUzyWCyCcfm1wOyiLc=;
 b=C4Dz20e0ry953A10oUBIOcW9uU42YAT3MsW18oEofB/y7Cj1Yzfgs2Da0xAXUflgep
 r0yWRItnmYjTUZNPeZO2H33x5ZLOnG9u4euuSZocYgymgfN0rNXGJ98TcH3l0ozuh5TY
 KGTAt3bsAzxNDNSWjZWMrkS5zmp1MHlk+9sQwlpIRlgf6HcLjcuuGkdFa9yu3eFMB8g1
 4Xp8pfRYiG9+1LIMPUJUV1e2nMcu9z8sDtNrTqiUa8M84SUF8xU+QuVAgusPC6HRx1vt
 rnkYezB5D34oE4SOKSNImOPxqpn19oKeaFkaFcPBp2uk5NuaGK8Cb33a56fhrZQkbqCI
 doFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JlrTFZcXaXEEafeSE3nImbB0vbUzyWCyCcfm1wOyiLc=;
 b=e1oyKl++RlAACOebdZRpPIrq4lVWYTKAA2F/Q0GqU1WZZvHqLpGk4TfbV+5/WQmjqo
 t85oLotWq+bWRUAKqT2tNCyqUpD5ZLHHqrPDDFOWi55SUx/dJ+7GbbTlq5kaEoz/3UxM
 l9YHpEYcJe+CRynDNWAs3bem5H8KiUsmBfFRZ0tVKUZTQ0RQgAXlgQVrRln2eiO40izD
 inxYc7wGevh3aci1+Sv5A+Z4j5DvX1TStEoXR7CTHoxsofq7wwBzotmebSS8y4AG+4us
 PbGJ+28d6Uz6JSzP0P8m89SsgeUwbXPetHXCvNKc2ocpZVDRsREgLUl8Co/f+H1MFwAR
 yujw==
X-Gm-Message-State: APjAAAVX54XO1ZZXJ+M3zH3R68DjfD5eixCIRmcDSpY5piMOK3X2jNpe
 /zo65mQIkWfzdAD8yKYIPRA=
X-Google-Smtp-Source: APXvYqzfYZcx45jDrw2b3lwZ9VtKORLiesbinZG49d5O6n/fZzIx4Lq9J4RL2j09kiOMrlAzng+MMw==
X-Received: by 2002:a63:ce03:: with SMTP id y3mr21577884pgf.427.1581995608638; 
 Mon, 17 Feb 2020 19:13:28 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:180::6f94])
 by smtp.gmail.com with ESMTPSA id b18sm1812595pfd.63.2020.02.17.19.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 19:13:28 -0800 (PST)
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
Subject: [PATCH v3 2/5] usb: gadget: aspeed: add ast2600 vhub support
Date: Mon, 17 Feb 2020 19:13:12 -0800
Message-Id: <20200218031315.562-3-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200218031315.562-1-rentao.bupt@gmail.com>
References: <20200218031315.562-1-rentao.bupt@gmail.com>
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
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 Changes in v3:
   - None.
 Changes in v2:
   - removed "ast_vhub_config" related logic.

 drivers/usb/gadget/udc/aspeed-vhub/Kconfig | 4 ++--
 drivers/usb/gadget/udc/aspeed-vhub/core.c  | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

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
index e4395813df35..442845a64660 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
@@ -431,6 +431,9 @@ static const struct of_device_id ast_vhub_dt_ids[] = {
 	{
 		.compatible = "aspeed,ast2500-usb-vhub",
 	},
+	{
+		.compatible = "aspeed,ast2600-usb-vhub",
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ast_vhub_dt_ids);
-- 
2.17.1

