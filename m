Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A01591637E2
	for <lists+openbmc@lfdr.de>; Wed, 19 Feb 2020 00:59:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MdBR69MFzDqdV
	for <lists+openbmc@lfdr.de>; Wed, 19 Feb 2020 10:59:43 +1100 (AEDT)
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
 header.s=20161025 header.b=iRujqTRI; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Md6Q6qm8zDqcG;
 Wed, 19 Feb 2020 10:56:14 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id t6so8744989plj.5;
 Tue, 18 Feb 2020 15:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=i3Cj6jCmg8Re6HCriaAPvQ8Bt49I/I/XDNaSdtPwqac=;
 b=iRujqTRISwGHP3FrC4HAQHsTqDffJ+OB/WFIZ8dqRIiGjwCWFYx4CFAxupO5MWnQXa
 d3rVvJuJ5l8SnEwqdviSYlBmdGgcTPNrJ+HoZjxBX3FD5N5KwNg6Uf6tqtQXnUncRDOq
 jLIj/xFZWknt1R9cPThVquMLLvfvrcYv2Uf7hJeZvSTPJhIDGCqxRfPs2bnTyR2epNpd
 UEgRa+bMcUOxFlXK1TxWRcNJZ4NPwbm3OoPBi0oKhBT+TiNY9TualZ12pSy/JimnF80b
 ZlgWdEDQin+GsFR91+qUeWx8iM7XRGb92vgjdn/oUQsUiZ2adrDA3p3WXLX9iW+rZHR0
 dbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=i3Cj6jCmg8Re6HCriaAPvQ8Bt49I/I/XDNaSdtPwqac=;
 b=JNz8GDzZH7Vt9cKv+OOp7P+KQixpJeA0xu0Lfu+R0NYPnAgSmpkLPaWgFRnXW+wz7w
 qs8hQ3S0BcYNCtu+30bsMVg4BnoIKUXS3xWPOGyA8+OftifLOS2MmO1fBxPF7yWK8baA
 CUwka+VRM6NSztpQfuNAXP4BnIkGHQV6n0QRoQImC3aKxHNpWkyzXR7VH8GtCu9uTQG7
 K5e73eIbwVH95aAVkWsQlS8a4v0+rHN8tCicV/tWkcv0MbSqm3f5aWLJNNJ3tK+jSoSn
 kQRxHQk1CB4kK47P0OAa3937M3dz4JrKbS/5p5L4ZQkHYO4eklfOd1mXN1hRUnOeOXJs
 bfmw==
X-Gm-Message-State: APjAAAUZMVVJu4iLNCLnz7vnrcBcX/Yy/EUw1KZPvxSsAvFSjMtNVzw0
 E3dJdKzHMsyoDl0dqpzoy9w=
X-Google-Smtp-Source: APXvYqwisrukoS6yd93rdtw5m0FL5P7Ha4WhyctQfgcrYnU5l7WoT8AAOrF4pDzWWvOMx6BXpKzm0Q==
X-Received: by 2002:a17:902:aa0b:: with SMTP id
 be11mr22317242plb.181.1582070172122; 
 Tue, 18 Feb 2020 15:56:12 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:500::5:1718])
 by smtp.gmail.com with ESMTPSA id d3sm80558pjx.10.2020.02.18.15.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 15:56:11 -0800 (PST)
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
Subject: [PATCH 2/2] usb: gadget: aspeed: fixup usb1 device descriptor at init
 time
Date: Tue, 18 Feb 2020 15:56:00 -0800
Message-Id: <20200218235600.6763-3-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200218235600.6763-1-rentao.bupt@gmail.com>
References: <20200218235600.6763-1-rentao.bupt@gmail.com>
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

This patch moves fixup-usb1-device-descriptor logic from get_descriptor
handler to "ast_vhub_fixup_dev_desc" function so the device descriptor
is only patched once (at vhub init time).

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 drivers/usb/gadget/udc/aspeed-vhub/hub.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/hub.c b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
index 4e3ef83283a6..b8bf54b12adc 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
@@ -76,13 +76,6 @@ static struct usb_device_descriptor ast_vhub_dev_desc = {
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
@@ -316,10 +309,6 @@ static int ast_vhub_rep_desc(struct ast_vhub_ep *ep,
 	if (len > dsize)
 		len = dsize;
 
-	/* Patch it if forcing USB1 */
-	if (desc_type == USB_DT_DEVICE && ep->vhub->force_usb1)
-		ast_vhub_patch_dev_desc_usb1(ep->buf);
-
 	/* Shoot it from the EP buffer */
 	return ast_vhub_reply(ep, NULL, len);
 }
@@ -878,6 +867,15 @@ static void ast_vhub_fixup_dev_desc(struct ast_vhub *vhub)
 		if (of_str[id])
 			ast_vhub_str_array[i].s = of_str[id];
 	}
+
+	/*
+	 * Update USB Release Number and Protocol code if vhub is running
+	 * at USB 1.x speed.
+	 */
+	if (vhub->force_usb1) {
+		ast_vhub_dev_desc.bcdUSB = cpu_to_le16(0x0100);
+		ast_vhub_dev_desc.bDeviceProtocol = 0;
+	}
 }
 
 void ast_vhub_init_hub(struct ast_vhub *vhub)
-- 
2.17.1

