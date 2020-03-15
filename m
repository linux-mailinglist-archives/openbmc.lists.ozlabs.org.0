Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AC0185F76
	for <lists+openbmc@lfdr.de>; Sun, 15 Mar 2020 20:19:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48gTkc0QgRzDqFp
	for <lists+openbmc@lfdr.de>; Mon, 16 Mar 2020 06:19:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cBdghDbS; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gTgv4GSWzDqBg;
 Mon, 16 Mar 2020 06:16:43 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id t14so6885943plr.8;
 Sun, 15 Mar 2020 12:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DnIYVnf76ZNYZmrCVx2GCWCcgip2tcoobJFeUKy9s0c=;
 b=cBdghDbSno8+tc3fAGbBrhpYDRGvvF6/pdJn7N2K5P+DXxpLN45Nid6Vo4hmYqvNg+
 uYJFLF8ZAs5J6RDOlKufIch4Ui9XNGkccMZhf7egBfA7UKMZHiOWMWgqG23xwi0qN1Hx
 RFKXy/pE735kBc/VjIbUlkNBqujo/vhgTit0V+HfRxadiEDHeRHjLBr09SdWfz4XiYhc
 yhaWrtu6L8+dWcrMPz4kUD2Io3eOB9FiYYW4dTkSSYz3NCtaqS2Lp8XiQgMXSiXwokxr
 ZBxry4sS7FRqxEghb0EqCs29YR7cor2vscxDCVmpV+Av4a4PPwpxA1x3O+BYu0wshOMF
 h3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DnIYVnf76ZNYZmrCVx2GCWCcgip2tcoobJFeUKy9s0c=;
 b=d6L41EoVIxDPpc/v8Yivqm5lAK+dSdQP+TloRvWk++SIVucbvul+d3CXBHTPNX02VW
 /3uH1xeFH9IL/EhSNryvuHLISsds4G+hY4e4XWmU/OGR0UG3zXtHab1xoNHEI0RNERvt
 Mx/ivQKut66zSZ1DlDc/cFBdpIHwW1RVijmhA50qytCwPsT3/CR90A3dSUz9jcGHpMRH
 m9vSF6PPWMzwem2nT6Djv7gMPtmrGvHFa3e/nS40DxlfT0hbbZIYDPaf433go34e/VJ6
 SqB4wAqTlqxnXE+3xnXl0Yr6UZ4cQvT9WmeuEGQ27TrBDjNtMCFNBimjP2ZL1pmSfj3K
 1JYw==
X-Gm-Message-State: ANhLgQ0R5l1tb/Ml628dHCtvJhxQlhsWNlLlfknFuK5bcZsKg25gEhDu
 tRmYFK/BLrCkzWVSrY/0QK0=
X-Google-Smtp-Source: ADFU+vuho5YTWP6Ui5j7Fvi2auem5iPekXPLrXAnf6AP/wcV8sPiITmyw3QAB1hrpSgd6/bImz2nzg==
X-Received: by 2002:a17:902:343:: with SMTP id
 61mr23536939pld.332.1584299801405; 
 Sun, 15 Mar 2020 12:16:41 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-24-4-25-55.hsd1.ca.comcast.net. [24.4.25.55])
 by smtp.gmail.com with ESMTPSA id 13sm61431882pgo.13.2020.03.15.12.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 12:16:40 -0700 (PDT)
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
Subject: [PATCH v2 1/6] usb: gadget: aspeed: support multiple language strings
Date: Sun, 15 Mar 2020 12:16:27 -0700
Message-Id: <20200315191632.12536-2-rentao.bupt@gmail.com>
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

This patch introduces a link list to store string descriptors with
different languages, and "ast_vhub_rep_string" function is also improved
to support multiple language usb strings.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 No change in v2:
   - the patch is added into the series since v2.

 drivers/usb/gadget/udc/aspeed-vhub/core.c |   4 +-
 drivers/usb/gadget/udc/aspeed-vhub/hub.c  | 140 +++++++++++++++++++---
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h |   4 +-
 3 files changed, 131 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
index 555e8645fb1e..cdf96911e4b1 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
@@ -408,7 +408,9 @@ static int ast_vhub_probe(struct platform_device *pdev)
 		goto err;
 
 	/* Init hub emulation */
-	ast_vhub_init_hub(vhub);
+	rc = ast_vhub_init_hub(vhub);
+	if (rc)
+		goto err;
 
 	/* Initialize HW */
 	ast_vhub_init_hw(vhub);
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/hub.c b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
index 6e565c3dbb5b..35edf37553f0 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
@@ -50,6 +50,7 @@
 #define KERNEL_VER	bin2bcd(((LINUX_VERSION_CODE >> 8) & 0x0ff))
 
 enum {
+	AST_VHUB_STR_INDEX_MAX = 4,
 	AST_VHUB_STR_MANUF = 3,
 	AST_VHUB_STR_PRODUCT = 2,
 	AST_VHUB_STR_SERIAL = 1,
@@ -310,23 +311,77 @@ static int ast_vhub_rep_desc(struct ast_vhub_ep *ep,
 	return ast_vhub_reply(ep, NULL, len);
 }
 
+static struct usb_gadget_strings*
+ast_vhub_str_of_container(struct usb_gadget_string_container *container)
+{
+	return (struct usb_gadget_strings *)container->stash;
+}
+
+static int ast_vhub_collect_languages(struct ast_vhub *vhub, void *buf,
+				      size_t size)
+{
+	int rc, hdr_len, nlangs, max_langs;
+	struct usb_gadget_strings *lang_str;
+	struct usb_gadget_string_container *container;
+	struct usb_string_descriptor *sdesc = buf;
+
+	nlangs = 0;
+	hdr_len = sizeof(struct usb_descriptor_header);
+	max_langs = (size - hdr_len) / sizeof(sdesc->wData[0]);
+	list_for_each_entry(container, &vhub->vhub_str_desc, list) {
+		if (nlangs >= max_langs)
+			break;
+
+		lang_str = ast_vhub_str_of_container(container);
+		sdesc->wData[nlangs++] = cpu_to_le16(lang_str->language);
+	}
+
+	rc = hdr_len + nlangs * sizeof(sdesc->wData[0]);
+	sdesc->bLength = rc;
+	sdesc->bDescriptorType = USB_DT_STRING;
+
+	return rc;
+}
+
+static struct usb_gadget_strings *ast_vhub_lookup_string(struct ast_vhub *vhub,
+							 u16 lang_id)
+{
+	struct usb_gadget_strings *lang_str;
+	struct usb_gadget_string_container *container;
+
+	list_for_each_entry(container, &vhub->vhub_str_desc, list) {
+		lang_str = ast_vhub_str_of_container(container);
+		if (lang_str->language == lang_id)
+			return lang_str;
+	}
+
+	return NULL;
+}
+
 static int ast_vhub_rep_string(struct ast_vhub_ep *ep,
 			       u8 string_id, u16 lang_id,
 			       u16 len)
 {
-	int rc = usb_gadget_get_string(&ep->vhub->vhub_str_desc,
-					string_id, ep->buf);
+	int rc;
+	u8 buf[256];
+	struct ast_vhub *vhub = ep->vhub;
+	struct usb_gadget_strings *lang_str;
 
-	/*
-	 * This should never happen unless we put too big strings in
-	 * the array above
-	 */
-	BUG_ON(rc >= AST_VHUB_EP0_MAX_PACKET);
+	if (string_id == 0) {
+		rc = ast_vhub_collect_languages(vhub, buf, sizeof(buf));
+	} else {
+		lang_str = ast_vhub_lookup_string(vhub, lang_id);
+		if (!lang_str)
+			return std_req_stall;
+
+		rc = usb_gadget_get_string(lang_str, string_id, buf);
+	}
 
-	if (rc < 0)
+	if (rc < 0 || rc >= AST_VHUB_EP0_MAX_PACKET)
 		return std_req_stall;
 
 	/* Shoot it from the EP buffer */
+	memcpy(ep->buf, buf, rc);
 	return ast_vhub_reply(ep, NULL, min_t(u16, rc, len));
 }
 
@@ -832,8 +887,64 @@ void ast_vhub_hub_reset(struct ast_vhub *vhub)
 	writel(0, vhub->regs + AST_VHUB_EP1_STS_CHG);
 }
 
-static void ast_vhub_init_desc(struct ast_vhub *vhub)
+static struct usb_gadget_string_container*
+ast_vhub_str_container_alloc(struct ast_vhub *vhub)
+{
+	unsigned int size;
+	struct usb_string *str_array;
+	struct usb_gadget_strings *lang_str;
+	struct usb_gadget_string_container *container;
+
+	size = sizeof(*container);
+	size += sizeof(struct usb_gadget_strings);
+	size += sizeof(struct usb_string) * AST_VHUB_STR_INDEX_MAX;
+	container = devm_kzalloc(&vhub->pdev->dev, size, GFP_KERNEL);
+	if (!container)
+		return ERR_PTR(-ENOMEM);
+
+	lang_str = ast_vhub_str_of_container(container);
+	str_array = (struct usb_string *)(lang_str + 1);
+	lang_str->strings = str_array;
+	return container;
+}
+
+static void ast_vhub_str_deep_copy(struct usb_gadget_strings *dest,
+				   const struct usb_gadget_strings *src)
+{
+	struct usb_string *src_array = src->strings;
+	struct usb_string *dest_array = dest->strings;
+
+	dest->language = src->language;
+	if (src_array && dest_array) {
+		do {
+			*dest_array = *src_array;
+			dest_array++;
+			src_array++;
+		} while (src_array->s);
+	}
+}
+
+static int ast_vhub_str_alloc_add(struct ast_vhub *vhub,
+				  const struct usb_gadget_strings *src_str)
 {
+	struct usb_gadget_strings *dest_str;
+	struct usb_gadget_string_container *container;
+
+	container = ast_vhub_str_container_alloc(vhub);
+	if (IS_ERR(container))
+		return PTR_ERR(container);
+
+	dest_str = ast_vhub_str_of_container(container);
+	ast_vhub_str_deep_copy(dest_str, src_str);
+	list_add_tail(&container->list, &vhub->vhub_str_desc);
+
+	return 0;
+}
+
+static int ast_vhub_init_desc(struct ast_vhub *vhub)
+{
+	int ret;
+
 	/* Initialize vhub Device Descriptor. */
 	memcpy(&vhub->vhub_dev_desc, &ast_vhub_dev_desc,
 		sizeof(vhub->vhub_dev_desc));
@@ -848,15 +959,16 @@ static void ast_vhub_init_desc(struct ast_vhub *vhub)
 	vhub->vhub_hub_desc.bNbrPorts = vhub->max_ports;
 
 	/* Initialize vhub String Descriptors. */
-	memcpy(&vhub->vhub_str_desc, &ast_vhub_strings,
-		sizeof(vhub->vhub_str_desc));
+	INIT_LIST_HEAD(&vhub->vhub_str_desc);
+	ret = ast_vhub_str_alloc_add(vhub, &ast_vhub_strings);
+
+	return ret;
 }
 
-void ast_vhub_init_hub(struct ast_vhub *vhub)
+int ast_vhub_init_hub(struct ast_vhub *vhub)
 {
 	vhub->speed = USB_SPEED_UNKNOWN;
 	INIT_WORK(&vhub->wake_work, ast_vhub_wake_work);
 
-	ast_vhub_init_desc(vhub);
+	return ast_vhub_init_desc(vhub);
 }
-
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
index 23a1ac91f8d2..2e5a1ef14a75 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
+++ b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
@@ -421,7 +421,7 @@ struct ast_vhub {
 	struct usb_device_descriptor	vhub_dev_desc;
 	struct ast_vhub_full_cdesc	vhub_conf_desc;
 	struct usb_hub_descriptor	vhub_hub_desc;
-	struct usb_gadget_strings	vhub_str_desc;
+	struct list_head		vhub_str_desc;
 };
 
 /* Standard request handlers result codes */
@@ -531,7 +531,7 @@ int __ast_vhub_simple_reply(struct ast_vhub_ep *ep, int len, ...);
 			       __VA_ARGS__)
 
 /* hub.c */
-void ast_vhub_init_hub(struct ast_vhub *vhub);
+int ast_vhub_init_hub(struct ast_vhub *vhub);
 enum std_req_rc ast_vhub_std_hub_request(struct ast_vhub_ep *ep,
 					 struct usb_ctrlrequest *crq);
 enum std_req_rc ast_vhub_class_hub_request(struct ast_vhub_ep *ep,
-- 
2.17.1

