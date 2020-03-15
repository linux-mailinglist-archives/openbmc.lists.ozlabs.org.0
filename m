Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEAC185F8D
	for <lists+openbmc@lfdr.de>; Sun, 15 Mar 2020 20:22:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48gTpK5bVszDqMl
	for <lists+openbmc@lfdr.de>; Mon, 16 Mar 2020 06:22:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZyuiwfM+; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gTh06s98zDqGp;
 Mon, 16 Mar 2020 06:16:48 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id j20so6889269pll.6;
 Sun, 15 Mar 2020 12:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HxxSTtrSU1OUBJi+Btc1qI+H62ceRlYBsDcUYNsAgNo=;
 b=ZyuiwfM+wsd2yK61TSSDV+f3USkgmEfbIMsJUYYfIVC8c3KUfxDklNV+sc5xGoI92Q
 aYJwJvwcwg7CX3P3cb28svAtzHXPL2Riv93ogQLpl19sQ1YJwt2YFv+UdRsmGn7ScnAK
 fF4djxEVIjoezFqgKUev9mCl3WSKcKZqOWcCRIdwLaGdUFtj0OqTLEU+I8HNmQ3ryMTb
 L1dvly+3xZS5sl6Qd8u38FcbsYmY9eMsbc74lTj6EunNXiof4OJDrLudwGNytTHsLSEu
 Xc4yT6pzYO3qBqobjN12+P4/DS112wgehF1bvbOn3k0TR0wVhWZ4BBDc0on/dmFvY793
 dGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HxxSTtrSU1OUBJi+Btc1qI+H62ceRlYBsDcUYNsAgNo=;
 b=gligqbwZVal7VGPjZec+MVX1plJOl1pDTdq9cI/nwQUGxFVDqtt4fx8cnk235pf1x5
 xu/yis7Gzelcg5rTfcUIheCh1jbN8nSnX9YXhsXhqqS1DbQZ7XQBA9QcXxD/SM6cPBjX
 eylKpE0e8zHbclzYStxSnDTlxvlhYk2antlqITdwZQBXxxZPMqpZgNYXVvk5/OSGtZ1U
 lvZfW9cyr1GKm1ENltViiAYx+YSzQRRXFzfEMKCddAfdYhWfxrSBmCdhLplnzAClhYTK
 hjxiYmhnJFH6fRXsqfmX2MXoYbosj8ykyyfOARCpLx4Ok/fOiusLHIRh/UZ8lhLjhaHU
 I1KQ==
X-Gm-Message-State: ANhLgQ1YKWpDVoqDuG7foDjCyYijmph52O1pLFN43mXm23WonIw1iLic
 L8PQ/ALd7QMnIhnqgZ/R1c4=
X-Google-Smtp-Source: ADFU+vvkL4f9mQwxQwHT+G9COHjk//vx+BspxGwPvXJqnCfl+rVs7Od8EQCDULapoatPXSq7AKaI6Q==
X-Received: by 2002:a17:90b:3109:: with SMTP id
 gc9mr7409912pjb.186.1584299806362; 
 Sun, 15 Mar 2020 12:16:46 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-24-4-25-55.hsd1.ca.comcast.net. [24.4.25.55])
 by smtp.gmail.com with ESMTPSA id 13sm61431882pgo.13.2020.03.15.12.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 12:16:45 -0700 (PDT)
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
Subject: [PATCH v2 4/6] usb: gadget: aspeed: allow to set device IDs in device
 tree
Date: Sun, 15 Mar 2020 12:16:30 -0700
Message-Id: <20200315191632.12536-5-rentao.bupt@gmail.com>
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

The patch overrides idVendor, idProduct and bcdDevice fields in vhub
Device Descriptor if according device tree properties are defined.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 Changes in v2:
   - update per-vhub device descriptor instance instead of the global
     default descriptor.

 drivers/usb/gadget/udc/aspeed-vhub/hub.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/hub.c b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
index 421631d86a17..13fba91aad6a 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
@@ -887,6 +887,26 @@ void ast_vhub_hub_reset(struct ast_vhub *vhub)
 	writel(0, vhub->regs + AST_VHUB_EP1_STS_CHG);
 }
 
+static void ast_vhub_of_parse_dev_desc(struct ast_vhub *vhub,
+				       const struct device_node *vhub_np)
+{
+	u16 id;
+	u32 data;
+
+	if (!of_property_read_u32(vhub_np, "vhub-vendor-id", &data)) {
+		id = (u16)data;
+		vhub->vhub_dev_desc.idVendor = cpu_to_le16(id);
+	}
+	if (!of_property_read_u32(vhub_np, "vhub-product-id", &data)) {
+		id = (u16)data;
+		vhub->vhub_dev_desc.idProduct = cpu_to_le16(id);
+	}
+	if (!of_property_read_u32(vhub_np, "vhub-device-revision", &data)) {
+		id = (u16)data;
+		vhub->vhub_dev_desc.bcdDevice = cpu_to_le16(id);
+	}
+}
+
 static struct usb_gadget_string_container*
 ast_vhub_str_container_alloc(struct ast_vhub *vhub)
 {
@@ -1000,6 +1020,7 @@ static int ast_vhub_init_desc(struct ast_vhub *vhub)
 	/* Initialize vhub Device Descriptor. */
 	memcpy(&vhub->vhub_dev_desc, &ast_vhub_dev_desc,
 		sizeof(vhub->vhub_dev_desc));
+	ast_vhub_of_parse_dev_desc(vhub, vhub_np);
 
 	/* Initialize vhub Configuration Descriptor. */
 	memcpy(&vhub->vhub_conf_desc, &ast_vhub_conf_desc,
-- 
2.17.1

