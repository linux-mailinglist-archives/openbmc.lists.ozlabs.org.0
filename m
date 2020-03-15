Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9F3185F85
	for <lists+openbmc@lfdr.de>; Sun, 15 Mar 2020 20:20:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48gTlx2q6WzDqHh
	for <lists+openbmc@lfdr.de>; Mon, 16 Mar 2020 06:20:13 +1100 (AEDT)
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
 header.s=20161025 header.b=rjbNEwM/; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gTgx2ztVzDqBM;
 Mon, 16 Mar 2020 06:16:45 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id bo3so5862933pjb.5;
 Sun, 15 Mar 2020 12:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5gxpV7JB+0bFUt/kU5rYLHIq/2ry55hJR4QU1nC9mRw=;
 b=rjbNEwM/XgZEinoND9gGIEJmVXVX0IanV6iiJpzvEKbgkrF/FYCqlwIoWUXcBa2+c/
 yIYS7nZrQpACubLkCOlWVSzJcvGltPWfy6osRa8MiOCJFO74iwIYa5oAq2deqKWDAgx5
 vJIwK1bDlkX8vEKx+6vXlGCoz+VaAiKCmyBGkVphf8x4yOueYmEXIfKIxNm16CN5cwv+
 FN8kwokDMxYMHUGamnUhx3PK1KVr2j2v89KLITk1XOPZNqYqEZhBEkX0hDlHGROA/nV+
 lztSZKFuoprzHWSvFf7mXNvbijq/sQRLZA2zHQqdbfuCJ8Bgw5MiF1ijls/NIobvhsop
 riIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5gxpV7JB+0bFUt/kU5rYLHIq/2ry55hJR4QU1nC9mRw=;
 b=D8PSyCFY12a6XqwGiJ8nIpNDCwihUoy6U6rEzELXBwFQoIB9cGaVXzFeUq/3SNazST
 F4hi9KoE9HkVul5tEQyN6kNuhTlPr2wJvxG7pHMdFeUUn9PeqCnbIDRg45hRu73KlV4G
 UtPdA78DcfBamx9PeQwexzGVQjeF7u1ZZXNQB6pGcs68hShBxgRciSbW/b6nijolxOsq
 gPi144r/Vg3fbA1KgGU5VaR/o9a+k19ch97rYX/izuA8M7WGz5m/PzGF1rZ5rP67PWsk
 xdhRYnrJHgcDJt2TB6FZy+ipiqyBAVV4Rap16J3UytmgrjLC1s3KCTBQb8SFkHKWuieg
 e47g==
X-Gm-Message-State: ANhLgQ2cAEpRHHBYlSl7VJV2maKxO7eVk6jjAhhEty8hNIG4BeHR39pZ
 e5ZHbiZjVLyquBbVxNq8gpk=
X-Google-Smtp-Source: ADFU+vvPigWemmbDaZCwov3VlDQsV3Pr9WZu55/E9xaVXXoXBXL4qctLgdHRc/GF5GsrKHAcIT2RcA==
X-Received: by 2002:a17:902:ee93:: with SMTP id
 a19mr11882497pld.258.1584299802773; 
 Sun, 15 Mar 2020 12:16:42 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-24-4-25-55.hsd1.ca.comcast.net. [24.4.25.55])
 by smtp.gmail.com with ESMTPSA id 13sm61431882pgo.13.2020.03.15.12.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 12:16:42 -0700 (PDT)
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
Subject: [PATCH v2 2/6] usb: gadget: add "usb_validate_langid" function
Date: Sun, 15 Mar 2020 12:16:28 -0700
Message-Id: <20200315191632.12536-3-rentao.bupt@gmail.com>
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

The USB LANGID validation code in "check_user_usb_string" function is
moved to "usb_validate_langid" function which can be used by other usb
gadget drivers.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 No change in v2:
   - the patch is added into the series since v2.

 drivers/usb/gadget/configfs.c  | 14 +-------------
 drivers/usb/gadget/usbstring.c | 24 ++++++++++++++++++++++++
 include/linux/usb/gadget.h     |  3 +++
 3 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 32b637e3e1fa..822ef0470c5f 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -13,8 +13,6 @@
 int check_user_usb_string(const char *name,
 		struct usb_gadget_strings *stringtab_dev)
 {
-	unsigned primary_lang;
-	unsigned sub_lang;
 	u16 num;
 	int ret;
 
@@ -22,17 +20,7 @@ int check_user_usb_string(const char *name,
 	if (ret)
 		return ret;
 
-	primary_lang = num & 0x3ff;
-	sub_lang = num >> 10;
-
-	/* simple sanity check for valid langid */
-	switch (primary_lang) {
-	case 0:
-	case 0x62 ... 0xfe:
-	case 0x100 ... 0x3ff:
-		return -EINVAL;
-	}
-	if (!sub_lang)
+	if (!usb_validate_langid(num))
 		return -EINVAL;
 
 	stringtab_dev->language = num;
diff --git a/drivers/usb/gadget/usbstring.c b/drivers/usb/gadget/usbstring.c
index 7c24d1ce1088..58a4d3325090 100644
--- a/drivers/usb/gadget/usbstring.c
+++ b/drivers/usb/gadget/usbstring.c
@@ -65,3 +65,27 @@ usb_gadget_get_string (const struct usb_gadget_strings *table, int id, u8 *buf)
 	return buf [0];
 }
 EXPORT_SYMBOL_GPL(usb_gadget_get_string);
+
+/**
+ * usb_validate_langid - validate usb language identifiers
+ * @lang: usb language identifier
+ *
+ * Returns true for valid language identifier, otherwise false.
+ */
+bool usb_validate_langid(u16 langid)
+{
+	u16 primary_lang = langid & 0x3ff;	/* bit [9:0] */
+	u16 sub_lang = langid >> 10;		/* bit [15:10] */
+
+	switch (primary_lang) {
+	case 0:
+	case 0x62 ... 0xfe:
+	case 0x100 ... 0x3ff:
+		return false;
+	}
+	if (!sub_lang)
+		return false;
+
+	return true;
+}
+EXPORT_SYMBOL_GPL(usb_validate_langid);
diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 124462d65eac..1a05227bdfae 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -773,6 +773,9 @@ struct usb_gadget_string_container {
 /* put descriptor for string with that id into buf (buflen >= 256) */
 int usb_gadget_get_string(const struct usb_gadget_strings *table, int id, u8 *buf);
 
+/* check if the given language identifier is valid */
+bool usb_validate_langid(u16 langid);
+
 /*-------------------------------------------------------------------------*/
 
 /* utility to simplify managing config descriptors */
-- 
2.17.1

