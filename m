Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FDD14F4AD
	for <lists+openbmc@lfdr.de>; Fri, 31 Jan 2020 23:23:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 488Wvl0JTdzDqgf
	for <lists+openbmc@lfdr.de>; Sat,  1 Feb 2020 09:23:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OvvSE+y8; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 488WtG0tqbzDqgf;
 Sat,  1 Feb 2020 09:22:13 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id t6so3311623plj.5;
 Fri, 31 Jan 2020 14:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wSzJwkvRpdC4ZPPv+f6r9mzu5IB7aUbc0urJg/jNjl0=;
 b=OvvSE+y8ye7N5+THH0qJlSCGi+0ze3TVr0d66Lr4LxVdRTY2dX9KY49MXJGfmPM7hy
 p/AQMRMm+VODOVx7LIykMg9Lx8HultkxI+4uU5egTDebM61K3nQIgGEMATMocCS89oVD
 l+AmaqvNHtr9RA9fD6HKXKB1uf8JKrJGXkcVE/YCXfzuraxGj/8mRdTEDFVgPqYPWbdG
 RTLoBSjLblnzgthVJiaimoGdC8LKr1O06wx4snrajedYITdZmqaH0pxRFNEr1j8OKF1T
 PnEHyjz357A5h7EWqzJhYIERLoUxfBogs8J+8ucqlqky7dmV+irAU4V1r8SMxNfi7b4x
 pLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wSzJwkvRpdC4ZPPv+f6r9mzu5IB7aUbc0urJg/jNjl0=;
 b=Vwe8nVq/ckU88r6KkDCEfmtQKJAn2JN6tiC6XAlxJsgsAsuCIX/+WkIhJil7oiQpn2
 Vrud8jNEPNro1kwNDSgfNKQIVIbdV3B3nZhcNPHI6yJZ0eiZML/gXX5+PoRw1gVHp+rK
 SrgMS+e5WVZsloo9YgzY1enIxfF3yF6xfwhqnS2iaA7gx2oBdBg/uKP2EA1E1tSXT15C
 DwEGC84b1gdZyWApDE3R3jF86kNc0JnXkaoBcFBrbf4Sw5tFeemfnHfdoHBggFQW0mgU
 EIjXQVAHjVKa7rHqwR1Va/XFs5VwS+uEwOZ0Ta8N7r2JNXWUm5P5Gn9fVIBTzn4/Ixzl
 V6xQ==
X-Gm-Message-State: APjAAAVEeYbZmIo+sz9YEt0acTW69W2D+biXj0h23cRdOKEj9ATmghuH
 h3ui6dy2Ri8L/VGsmLbV/zY=
X-Google-Smtp-Source: APXvYqzBLFzKofUIpvT30N4IUyqXxoZIoYk2D6ykKzwAFsGoR/vQ9KOZZzYn8bPITHvNhpplaDsRiA==
X-Received: by 2002:a17:90a:c24c:: with SMTP id
 d12mr15158909pjx.113.1580509330716; 
 Fri, 31 Jan 2020 14:22:10 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:200::1:a521])
 by smtp.gmail.com with ESMTPSA id v8sm11201515pff.151.2020.01.31.14.22.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2020 14:22:10 -0800 (PST)
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
 openbmc@lists.ozlabs.org
Subject: [PATCH 2/3] usb: gadget: aspeed: add ast2600 vhub support
Date: Fri, 31 Jan 2020 14:21:56 -0800
Message-Id: <20200131222157.20849-3-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200131222157.20849-1-rentao.bupt@gmail.com>
References: <20200131222157.20849-1-rentao.bupt@gmail.com>
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

