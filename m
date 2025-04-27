Return-Path: <openbmc+bounces-10-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C183A9E3BF
	for <lists+openbmc@lfdr.de>; Sun, 27 Apr 2025 17:30:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZlrBc4CwLz2ygk;
	Mon, 28 Apr 2025 01:30:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::430"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745767848;
	cv=none; b=J9RPcrXH5ihN7c+X2uxnYf+cae5s2gQdJwUVaE+YgOCnJOWgZPel9qjrZtOeaIscgwOn33WmS0aCsqo6a7+f9YJnzTdaAVixvH+kTbOs1agSfE5F6Sujrt0xeFGCJAi4ES6ViP2mFdfPcbedjqlcBN3XoQ9/arrn3aGcYaNoB7l1/CPk5tIpTVy7wGP2D5A3Zcz8BM2CT33EDMp0B6kFo6wG4cy/wGkyZZUrcaOwPVqASsF2AH6MaUDeHtEU2u+SkW25nXzOlXhAUoId11iTTrm9DU84gM72Ytd0bH6U8VCKSQCF3+sXpbz4dD7nOiIeTXDNAQ/dVN/T53DFlU+WfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745767848; c=relaxed/relaxed;
	bh=h4Hy3rarohJzSKsjT7TUHiAWHqnISAInF75bzVocRPk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SLgMYPSScKREYhj/TaMPh+tf+E2DFAotgzHmNlKYsZ/JLFj0VJIEovwuDwjQ7csu5Wl0jZ+Ao+9zT5966EDt/QGRMnbK9B+GXnDpOGt1yKIEVWXEr2Jwc2KN79NTPn1c76jDK8BNB/5ksrbbbOoO2NlgqQBw1Zv1OJtoblpZk/qlWst/NK3AhFFISeaSb1YaNDlHZ0ExgTG9VkkPwrekVGhIDSlSOdfLgORAC96f7J5ZPV80wLW3X2SbJ3Ojww1w0wiUgsdP9dZsiIZAGNPlMkrHO4Enlp1nElPVibFJOBNszBjr4qRWuYpQO0VJzxfq8RUEkn926lHAvuMLkMwDig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QEpiK/Uh; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=santosh.puranik.ibm@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QEpiK/Uh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=santosh.puranik.ibm@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZlrBb0K2yz2yNG
	for <openbmc@lists.ozlabs.org>; Mon, 28 Apr 2025 01:30:46 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-736bfa487c3so3243097b3a.1
        for <openbmc@lists.ozlabs.org>; Sun, 27 Apr 2025 08:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745767844; x=1746372644; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h4Hy3rarohJzSKsjT7TUHiAWHqnISAInF75bzVocRPk=;
        b=QEpiK/UhAzQ1VuVkPhvGbWaP0oSuXHmX/9uPTvCkiEH3ed6yAmTdMU8mEONVxEIf+I
         6+go+rdU1rumxmjhWEOdGTmJAS2VSILyABubFTde978Gw3Bycil4eqDA8XqQiIlsg2+V
         bFdLN9LUlnCaJCdO+RPsKrAP2wmjxThquw9pIj9a/Jzx5BE0XO7Jk1nCnfpRdO4TukrD
         KnE7mhOdhwWap75+v2NvtNN72H9/bLu1pJNZUY2GWMU/vftWO0NFALKUkLBY222jwxvK
         EfnF58p2vJDe/wUfzSretBeQp53ZwhzwW3o/qcqn7b+ofuk1osvFN5J05S8Rkh9sfr9U
         ZQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745767844; x=1746372644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4Hy3rarohJzSKsjT7TUHiAWHqnISAInF75bzVocRPk=;
        b=nTI/vFFGVXTDmyBetzZJ0D33c4aIlq+H5yOtwxuUeGsXijNttVZ4eLVXsZXAiIA0RK
         +6VNwNX/SonAJMgOUSKzSgJn6YH1Xc/NtoXNrbP5glUr2w0AqZRn+ip4yDr2cXNckATi
         TvI9jJgZCT9T0zS8TGjDvZIIQYHZufQduztkxoL796q3OGtrUcvYRPrlCH2R97CEy29E
         WkmjFHFQxcUotdCGqln+P7ivi8aIOPQUbdzY3I02K45pGo9ac4qAcTN36i8fHePoKAg+
         2faBOm0+F2c1o/maqKjHkznmzxyzmDYUg2mTULhfQ3khNHLD7ZUAJoe7DCCzJID9mJG3
         JtzQ==
X-Gm-Message-State: AOJu0YwNtnzGIkQ666lHzztL5jD1sjHcbo8znL+3ESWPu5pyMx7v7zSR
	ZHsDn/uqGTGUQfyut/OAGr9iwOXyKKTUIeN+cUto0npItxGLv1lrC1FIAA==
X-Gm-Gg: ASbGnctdJL4pllyA4Fg/i350bkcoso+JiqSlgqLfuBbpWhr2wKHifDb93jzBQ7AGFMg
	lRHJ9eponVk+OF9jMEFDyfA4VMw7yKd3w98n9zP/dhnBwE+xuD7BZXNEyuHee1D0XnOJp81cjUe
	BV0UMtc8AZQmzvGsX5iJ1syt7ZRN4RN92eYz3qzZOghXE3U0KIu/fzVeH9U0cZ6o5YSFe3RIzMW
	XjW99KNwhkhvJMl7MYAf4f0XExMOGLxYWfNnnUKzpdiZteC1zkRsGNqQL2tLwLU7MqH0NffBWKw
	I9IcHl3cGpf46w0J9gct19+oJvgXzF2soitPdLNBEWcAKYUXRilUA5qJhN0If0DmEJg=
X-Google-Smtp-Source: AGHT+IFy/rda7+MXnttnl/7TGv8QzWJpNbdR2T4svHbw7rajwZpkKMo636ctaJnYB2XrMswXEWGZLQ==
X-Received: by 2002:a05:6a00:4644:b0:736:4d05:2e2e with SMTP id d2e1a72fcca58-73ff7280114mr7600428b3a.6.1745767844496;
        Sun, 27 Apr 2025 08:30:44 -0700 (PDT)
Received: from localhost.localdomain ([49.207.234.167])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73e25912ad3sm6514567b3a.13.2025.04.27.08.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 08:30:43 -0700 (PDT)
From: Santosh Puranik <santosh.puranik.ibm@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	jk@codeconstruct.com.au
Subject: [PATCH linux dev-6.6 1/3] usb: Add base USB MCTP definitions
Date: Sun, 27 Apr 2025 21:00:06 +0530
Message-Id: <20250427153008.3166922-2-santosh.puranik.ibm@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250427153008.3166922-1-santosh.puranik.ibm@gmail.com>
References: <20250427153008.3166922-1-santosh.puranik.ibm@gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Jeremy Kerr <jk@codeconstruct.com.au>

Upcoming changes will add a USB host (and later gadget) driver for the
MCTP-over-USB protocol. Add a header that provides common definitions
for protocol support: the packet header format and a few framing
definitions. Add a define for the MCTP class code, as per
https://usb.org/defined-class-codes.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Link: https://patch.msgid.link/20250221-dev-mctp-usb-v3-1-3353030fe9cc@codeconstruct.com.au
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
(cherry picked from commit dcc35baae732b9079b2c6595cfd86da02b34a4e6)
Signed-off-by: Santosh Puranik <santosh.puranik.ibm@gmail.com>
---
 MAINTAINERS                  |  1 +
 include/linux/usb/mctp-usb.h | 30 ++++++++++++++++++++++++++++++
 include/uapi/linux/usb/ch9.h |  1 +
 3 files changed, 32 insertions(+)
 create mode 100644 include/linux/usb/mctp-usb.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 6afbb4f7b33c..5da10b86be0b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12647,6 +12647,7 @@ L:	netdev@vger.kernel.org
 S:	Maintained
 F:	Documentation/networking/mctp.rst
 F:	drivers/net/mctp/
+F:	include/linux/usb/mctp-usb.h
 F:	include/net/mctp.h
 F:	include/net/mctpdevice.h
 F:	include/net/netns/mctp.h
diff --git a/include/linux/usb/mctp-usb.h b/include/linux/usb/mctp-usb.h
new file mode 100644
index 000000000000..a2f6f1e04efb
--- /dev/null
+++ b/include/linux/usb/mctp-usb.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mctp-usb.h - MCTP USB transport binding: common definitions,
+ * based on DMTF0283 specification:
+ * https://www.dmtf.org/sites/default/files/standards/documents/DSP0283_1.0.1.pdf
+ *
+ * These are protocol-level definitions, that may be shared between host
+ * and gadget drivers.
+ *
+ * Copyright (C) 2024-2025 Code Construct Pty Ltd
+ */
+
+#ifndef __LINUX_USB_MCTP_USB_H
+#define __LINUX_USB_MCTP_USB_H
+
+#include <linux/types.h>
+
+struct mctp_usb_hdr {
+	__be16	id;
+	u8	rsvd;
+	u8	len;
+} __packed;
+
+#define MCTP_USB_XFER_SIZE	512
+#define MCTP_USB_BTU		68
+#define MCTP_USB_MTU_MIN	MCTP_USB_BTU
+#define MCTP_USB_MTU_MAX	(U8_MAX - sizeof(struct mctp_usb_hdr))
+#define MCTP_USB_DMTF_ID	0x1ab4
+
+#endif /*  __LINUX_USB_MCTP_USB_H */
diff --git a/include/uapi/linux/usb/ch9.h b/include/uapi/linux/usb/ch9.h
index 8a147abfc680..dce954da45ac 100644
--- a/include/uapi/linux/usb/ch9.h
+++ b/include/uapi/linux/usb/ch9.h
@@ -327,6 +327,7 @@ struct usb_device_descriptor {
 #define USB_CLASS_AUDIO_VIDEO		0x10
 #define USB_CLASS_BILLBOARD		0x11
 #define USB_CLASS_USB_TYPE_C_BRIDGE	0x12
+#define USB_CLASS_MCTP			0x14
 #define USB_CLASS_MISC			0xef
 #define USB_CLASS_APP_SPEC		0xfe
 #define USB_CLASS_VENDOR_SPEC		0xff
-- 
2.39.5


