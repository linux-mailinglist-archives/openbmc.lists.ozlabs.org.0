Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A815185F88
	for <lists+openbmc@lfdr.de>; Sun, 15 Mar 2020 20:21:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48gTn72QKbzDqHV
	for <lists+openbmc@lfdr.de>; Mon, 16 Mar 2020 06:21:15 +1100 (AEDT)
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
 header.s=20161025 header.b=RRcNDYRs; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gTgy3spPzDqBM;
 Mon, 16 Mar 2020 06:16:46 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id nu11so4040800pjb.1;
 Sun, 15 Mar 2020 12:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=eovzZ3kqQ8LWP7qRD6GFAmQY5h+MQlshBlGVHRZ0WS4=;
 b=RRcNDYRssy/5F/i6fSsXIrzZIurGe7f0t/4Mw66MPPKQffthBAgpxwOksDd9+dfgaQ
 he1hqnwJw8pX6Ae2IXDZ5BqhMoAP75d2X6iQ7XcyCaaxX69+gWFGmBOB0iZeLA0UVMrw
 hiFXCEsTh5j3aQv5+oe4hbvVchgdBGB3bKSFAQN5Da5ytD5w3yciM18yjVivsQfnPRUd
 5Jlu8e4+48mHQUELnWlqVAVetxjKJ1J4pDHPgZQVE9XnBtKeAZ5lQjNlgMBAEFQaNZlM
 Dh5dvjE7eY+FJm9nhWYEe8pkYfHmvZB9mR2zl3De3Tn72c0ffbcD0+cI/o/MG8MxMe8c
 djdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=eovzZ3kqQ8LWP7qRD6GFAmQY5h+MQlshBlGVHRZ0WS4=;
 b=mNU+tQXsx6VKQvDitAnYSK4DIQ/LFfVIgEJvcIz8F51IGJkJqPsX6BDJTuWeGRE53t
 H84cfBBb7SREQxqamblni/j0AofaIcSYf/tGW/mGepZXu1o/9nrKzqOO+D3lo5pNF4EO
 yq7qMO4VFnp4EKbcXQQAIFq24XMfP5nlVZswnlqqy8zydI84pZ3/oc3CFP5CBWaMY8ds
 QQDZL5v2zg3qz82YYGmBHUcNbK3Kt5vuB6EmhRuukVWWmbmncmVHyrrqhCsxeDv8a91+
 4LETInBgFwhBzjRD3Dk4MTsv0k6de5AJ2wwdyr7HxDaGXYs+vh1cmGrrQU771YIWKHby
 /LCg==
X-Gm-Message-State: ANhLgQ1YRrbfMAycUUUc27ssdua85xBPXbs8C8sxDy+SRKdELVIEvAdD
 9SFvxsx2NSuvLbwIEwG+2Q0=
X-Google-Smtp-Source: ADFU+vtGG84O3T3lRIFGnx5viv8DsI8lcGdsQ6bREhmqtjVIuQIaYeJAZgzlqOUyH0BhSNIlodiyAQ==
X-Received: by 2002:a17:902:7c02:: with SMTP id
 x2mr5325875pll.30.1584299804620; 
 Sun, 15 Mar 2020 12:16:44 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-24-4-25-55.hsd1.ca.comcast.net. [24.4.25.55])
 by smtp.gmail.com with ESMTPSA id 13sm61431882pgo.13.2020.03.15.12.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 12:16:44 -0700 (PDT)
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
Subject: [PATCH v2 3/6] usb: gadget: aspeed: allow to set usb strings in
 device tree
Date: Sun, 15 Mar 2020 12:16:29 -0700
Message-Id: <20200315191632.12536-4-rentao.bupt@gmail.com>
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

If "vhub,string-descriptor" device tree property is defined, the driver
will load string descriptors from device tree; otherwise, the default
string descriptors will be used.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 No change in v2:
   - the patch is added into the series since v2.

 drivers/usb/gadget/udc/aspeed-vhub/hub.c | 58 +++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/hub.c b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
index 35edf37553f0..421631d86a17 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
@@ -941,9 +941,61 @@ static int ast_vhub_str_alloc_add(struct ast_vhub *vhub,
 	return 0;
 }
 
+static const struct {
+	const char *name;
+	u8 id;
+} str_id_map[] = {
+	{"manufacturer",	AST_VHUB_STR_MANUF},
+	{"product",		AST_VHUB_STR_PRODUCT},
+	{"serial-number",	AST_VHUB_STR_SERIAL},
+	{},
+};
+
+static int ast_vhub_of_parse_str_desc(struct ast_vhub *vhub,
+				      const struct device_node *desc_np)
+{
+	u32 langid;
+	int ret = 0;
+	int i, offset;
+	const char *str;
+	struct device_node *child;
+	struct usb_string str_array[AST_VHUB_STR_INDEX_MAX];
+	struct usb_gadget_strings lang_str = {
+		.strings = (struct usb_string *)str_array,
+	};
+
+	for_each_child_of_node(desc_np, child) {
+		if (of_property_read_u32(child, "reg", &langid))
+			continue; /* no language identifier specified */
+
+		if (!usb_validate_langid(langid))
+			continue; /* invalid language identifier */
+
+		lang_str.language = langid;
+		for (i = offset = 0; str_id_map[i].name; i++) {
+			str = of_get_property(child, str_id_map[i].name, NULL);
+			if (str) {
+				str_array[offset].s = str;
+				str_array[offset].id = str_id_map[i].id;
+				offset++;
+			}
+		}
+		str_array[offset].id = 0;
+		str_array[offset].s = NULL;
+
+		ret = ast_vhub_str_alloc_add(vhub, &lang_str);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
 static int ast_vhub_init_desc(struct ast_vhub *vhub)
 {
 	int ret;
+	struct device_node *desc_np;
+	const struct device_node *vhub_np = vhub->pdev->dev.of_node;
 
 	/* Initialize vhub Device Descriptor. */
 	memcpy(&vhub->vhub_dev_desc, &ast_vhub_dev_desc,
@@ -960,7 +1012,11 @@ static int ast_vhub_init_desc(struct ast_vhub *vhub)
 
 	/* Initialize vhub String Descriptors. */
 	INIT_LIST_HEAD(&vhub->vhub_str_desc);
-	ret = ast_vhub_str_alloc_add(vhub, &ast_vhub_strings);
+	desc_np = of_get_child_by_name(vhub_np, "vhub-strings");
+	if (desc_np)
+		ret = ast_vhub_of_parse_str_desc(vhub, desc_np);
+	else
+		ret = ast_vhub_str_alloc_add(vhub, &ast_vhub_strings);
 
 	return ret;
 }
-- 
2.17.1

