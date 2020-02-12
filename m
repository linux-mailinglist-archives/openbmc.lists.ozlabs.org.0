Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3462915B357
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2020 23:03:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HtvQ6VZ6zDqFF
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 09:03:46 +1100 (AEDT)
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
 header.s=20161025 header.b=osRYjOE+; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HtmG4B2lzDq9L;
 Thu, 13 Feb 2020 08:57:34 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id b22so1454402pls.12;
 Wed, 12 Feb 2020 13:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9R6etbCWA0Xr2BLGZcOqv2B9uQVoWrtEKoDia/3gAmc=;
 b=osRYjOE+S4T3n2NX0HckDlon9Ckir9iwsJmHpigKf1urq1gHixNS0a5L+hQfjn9x4E
 I38sDSoWvbI411/D5L2/GcxtFReZDMVHboDByJoSBq7uXGhrAobi08neBsYuinyuefT7
 U70dh3OWgaDfKIEGnYUq8W7OHi7LiTjCm0+kshx930BsyYCl0BNzzBHy/rdKsQgUU2Os
 dfg7wZWCIxvPqVyD2tQiC1C2IZ3rg3POxvn49shta10lilX9xR4IFt/JkSYnmXBqKH1L
 iGlqednqnHlw1wwYaL0EX7uStpHr6ZGyDi5VQUh60wuIEUXbkR8lVUhhjqtXM1kMVo4G
 CMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9R6etbCWA0Xr2BLGZcOqv2B9uQVoWrtEKoDia/3gAmc=;
 b=oKBaV9WSIc9YZtHl9VSiUJAhpt9EHNnKv6KjjfYE1mPC+gJMhwDsyAdwD02LHd4KPH
 zfGVMC54vsyx/rVo8uQLmxHvAsuP5oH8DKpoNf3PTvJ944ZVq8Zhuk/sbPFokZ0mYX9H
 cFtlLzDcVtwkhBixT90L+B8+b/xmer3l7fJdHk20TWldouOswOmPdT/QorcGyh9+rDhu
 lAxsh3zPrgZ4pSbHq6YdPp907qb/0wz+ds81aHvxsQeh24ZhhOegpQ1Tg9erRhpnr/me
 HRbbIrMWIJkG4lwqcxw0zeqmxTn8KbhoIvb+j/q/6H1uiWkrj+gfeKv9I+sQgLDVPUTt
 kHEg==
X-Gm-Message-State: APjAAAWAGv1jB4pGT8iaNkh5ZJOuxH0aP/CUUoG0cf6fHcBE+t6Jhwzv
 Vy/j3Ickh+tF6vQh63K/qq0=
X-Google-Smtp-Source: APXvYqzMHlXDWxZW/3jPrNt/96ahoooGu6f8sVpoYs+rHds8Honw0tY8c71S8PpAo8bLxh2IziT3yQ==
X-Received: by 2002:a17:90a:8a8d:: with SMTP id
 x13mr1244687pjn.97.1581544651829; 
 Wed, 12 Feb 2020 13:57:31 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:200::3:533f])
 by smtp.gmail.com with ESMTPSA id r6sm214431pfh.91.2020.02.12.13.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 13:57:31 -0800 (PST)
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
Subject: [PATCH v2 4/5] usb: gadget: aspeed: add ast2600 vhub support
Date: Wed, 12 Feb 2020 13:57:16 -0800
Message-Id: <20200212215717.9474-5-rentao.bupt@gmail.com>
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
index d6f737fac4e2..166d7182e2c0 100644
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

