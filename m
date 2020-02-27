Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B397172C07
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 00:11:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48T7h21fmqzDr97
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 10:10:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=G8yUlb/U; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48T7Yb6LMrzDr7M;
 Fri, 28 Feb 2020 10:05:23 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id i11so362061pju.3;
 Thu, 27 Feb 2020 15:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=yJC16zlFSOyxbyka2I18YVaxRbVkz24cosOoXMXos50=;
 b=G8yUlb/UgIGBnsBBBzhuJpYS/b3TODQNj2LCX6Ni0FHusgj/dI6DvMfY3DyLXjCd+4
 7TSd9b1kx4YHRO7u2jVBcK0cxQXp6n5BV8iCLJQ+B3D42RuDg3Hms+Zlt54xOer6ClP7
 IT7OOA6dSTkTInmPaBZ0RaWcvMhuY5KFarW1iRYSDp+kz6SXgyA/kE7EAxmJq7qOPcj0
 urJGWTP9TVVzwIAJnV6kgPEWj3UwU6XdjgbEQ0EALzqp7R1SIEBVb6PGa4hqIYzKkcDi
 p5OtNP8zApxHZPUF+HFvhu4WNzn/UY5Eph9q+gfBudKs+Vq2Yk3i8kl64/RMOmOJZOkH
 T2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=yJC16zlFSOyxbyka2I18YVaxRbVkz24cosOoXMXos50=;
 b=SkmzwBheSyDSqmeRu2RpGbPez2kmEKffV/Y/4wtnbUrM4aYAU2bjJ4W+TVR19fbRRM
 +ggD5LtemjgaLLizl0D26MulF6gYohhSkoR0FDl8vTDqyAHLTK8GrMlKlmd6XsE3ze+2
 zjA3gxIduxJqELdFpQK/rYY4H1KheW6j2Q0NelPnmHlK6na0pL4U1i8F5QGLQgKm/Fgl
 ozkQBEu6gDZfc5FTXektqNa+aAmhbeS2rP2VEhbyNGoQnaUNLnA/pmRK+eOUE2exNiAF
 zM1jpRMr55Lcf/R6EJiagp3daCas8uhFAfFFPPom/kd//hYr0b5s5mZZxAO60TGFz/0A
 8lnQ==
X-Gm-Message-State: APjAAAV7qAtFKs3ao5ccnrfFxv5AgGR3UmyEyqqfnF/jHvSLmuSHT2SS
 bLL7mDB7dtuXGIjjIE0doCU=
X-Google-Smtp-Source: APXvYqwORVgy8DNmPXAm9w8bkqL0l/3lqlTjrEqHlGoRPD+Vd86uBoG6JTIEh5PWgEsQSRCgSNUjwQ==
X-Received: by 2002:a17:90a:d348:: with SMTP id
 i8mr1395591pjx.43.1582844721043; 
 Thu, 27 Feb 2020 15:05:21 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:500::4:d8f5])
 by smtp.gmail.com with ESMTPSA id w2sm8275975pfw.43.2020.02.27.15.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 15:05:20 -0800 (PST)
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
Subject: [PATCH v5 3/7] usb: gadget: aspeed: add ast2600 vhub support
Date: Thu, 27 Feb 2020 15:05:03 -0800
Message-Id: <20200227230507.8682-4-rentao.bupt@gmail.com>
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

Add AST2600 support in aspeed-vhub driver. There are 3 major differences
between AST2500 and AST2600 vhub:
  - AST2600 supports 7 downstream ports while AST2500 supports 5.
  - AST2600 supports 21 generic endpoints while AST2500 supports 15.
  - EP0 data buffer's 8-byte DMA alignment restriction is removed from
    AST2600.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 No Change in v3/v4/v5.
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
index f8ab8e012f34..f8d35dd60c34 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
@@ -423,6 +423,9 @@ static const struct of_device_id ast_vhub_dt_ids[] = {
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

