Return-Path: <openbmc+bounces-33-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB339AAE805
	for <lists+openbmc@lfdr.de>; Wed,  7 May 2025 19:39:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zt2ZG5Ybfz30QJ;
	Thu,  8 May 2025 03:39:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746639558;
	cv=none; b=Eb2qEE8XgQ75HxZwFsSnONHez0QgRTdWp0fNOvxXKfZuyLCTLDsqNWWXRlzUGmVUJ5nhqtTqIbIGumKt2BY2MMetU+U6zWacChK3ABfbCotOCcibii8JfuwaG5zlNGEQyNMQdpBI52VOFiEG7YR6ElKKEWj0M4WWnU4Sv8/8ACjnTYQUj0cXRcwE8qOI7tpC8TQwCGN71Hi6dPOq8P8qknrqlfhwlM57d+gwC3VDSuRPwIOSm4l60MhRGQL9rFpN7TCKQPFelOx2hLlF/Alc4MxTXZifWB48KcpAuaC+J+bNH70/bPgczyenLynYnxc/0sT3ErgzXDNjGYLepkUXCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746639558; c=relaxed/relaxed;
	bh=VSqaGOuaIptSAG/ZlfQ+oMHns3r9nWI7LvY58OhjhhA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XDBxsREzIm4d0D+6m0vjWlYKaWy6kbZEs3uyyp6uwPq5x2/L2m/DGwak18Y+X7fmFS2WwohEgXB9TOEgW3Yf2tEJ1fkoxtnOMY2sHRyGmSSf4PXpi8k89Y+xa2Zs4BTSXnmASdr7UE74wVpfabMBlIaa6zan9RGQC+V+EkftNVo81V9KeMaR+4W4fioYBDLmk1+O+aJdgaA55/oNhrvJkhyRPd9d2sck1V5olASMc/TaIsUBqlj5OuXPbkKBJ/AFfOKSZCQkM/PeWmefRAQSyA+ezkq7YkBpU/++y+oxBV1/c5oZSTA90uQc1GMFHcnzj2ZXUW0B9aZvIqNuh22U8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q9Vi2JLk; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=santosh.puranik.ibm@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q9Vi2JLk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=santosh.puranik.ibm@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zt2ZD1jv6z2xRt
	for <openbmc@lists.ozlabs.org>; Thu,  8 May 2025 03:39:16 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22d95f0dda4so1915905ad.2
        for <openbmc@lists.ozlabs.org>; Wed, 07 May 2025 10:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746639552; x=1747244352; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VSqaGOuaIptSAG/ZlfQ+oMHns3r9nWI7LvY58OhjhhA=;
        b=Q9Vi2JLkH9B5HgVL+xvuKGATBOvDB1xPLti+TRYBCX3iwYw2BHTSnxM3lGye/Da5lw
         n9Np+zC3QhxdJpTB7BnpJ8zQ91QxcJDgn7uhGc7wI1/GHOykntU6oAeRNhUMhrD0g1RL
         gbcDb3odP8OzKyO2997GeDsxzlEo3gYmP7FMzAJWjabOdahDHNRnmKkhIYpfSpMb9UR/
         LpjiNsq+b1LygW0B8XBpqVwXkXI9LeVHzuFG3sUiABDco/CG88kqni1St+IkK4ikyJ34
         VRX6xhs+QaTM6CycsjP220FOfTS4wQuhZ5x7aMMXPoXuiqVUPHHyMFHEWnlEkBzd4VGs
         lU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746639552; x=1747244352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VSqaGOuaIptSAG/ZlfQ+oMHns3r9nWI7LvY58OhjhhA=;
        b=J8tjK8Fgge9qrYmDA5ruPLxj9wd5d4FrmeCuQkrPY3T3hGXCgHZowYhkvkLhC42yHB
         JsAcDqPPtYAuddQg0QZwgEDSnCHcdiLj7mDjFUVoMmtKytUxbaffxMRCd5HUVADsx2N/
         9xkVbjl7xhAbIf70gzGp0rhSUo5RAekrLB2IZQVLt5ttRdiaZ1jCRMiwPrGBPKbKeBrq
         FiRqEH5fF45VC3qZZtLWxt7xm5POIdt9ZCklySlB8RTeQJz7+NBq7zmd1HjbsNkY7c68
         FfTWgmx9mttcNZCelW+0cg6qyahGLyiOlAQp25/MZw5VqSMSoGMi4O0K/mSdQFfyER1g
         8fSQ==
X-Gm-Message-State: AOJu0Yyfd2cxh7TaIysKQOZLi3oCmx/y9Smslrlzbwq+8vqFGQvuDqdH
	0d/AsArbYEoSF+lwT4/V2r8j/dS/Gyn1bCX1C5LtekEnJo5QN/U/Di04XA==
X-Gm-Gg: ASbGnctyAMGi6nC8kOnKd1L+1ZuQBzviUoQ8kXBP3cojj6qaS4kYRNZ/z79utBT3Sow
	LpBhRwFRnezUiRwgyZ4auv/UrIoewHQ0BpQkKTZ4DrUvbymcFpxPP7LwtsDVYxR38OAOT7m7YbN
	eq19iNBkxWTV3I38JZwknU/NVBcH09cUyjlsyCs8UbV0uZ6b4Q8XqDJPzQwsbYuihGv3LLL6AWk
	V4xeBv6zg2jlQeUiPCUHLEzH/YBle3RXqNTVCw+QE4l1ACvNAX2nd517rn1P2Qpq0Y8NmX8pcgI
	792LYwvzNm1mhbTrqBdyHwBV4R3Sss6++uyVNEUy5Mo8dQMu73MzSHIePb6y8uxrJiPciPaCg4e
	X
X-Google-Smtp-Source: AGHT+IGWEBpHpkE6Wk268Fl8XbDa7afVNlmfDq0EEizDgmqlvdIi8LIQGYP3FXzpbEIno/EQtnakwg==
X-Received: by 2002:a17:902:e80d:b0:220:ff3f:6cba with SMTP id d9443c01a7336-22e5eccc469mr65562095ad.38.1746639552379;
        Wed, 07 May 2025 10:39:12 -0700 (PDT)
Received: from localhost.localdomain ([49.207.193.52])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-22e15232797sm97751415ad.240.2025.05.07.10.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 10:39:11 -0700 (PDT)
From: Santosh Puranik <santosh.puranik.ibm@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	jk@codeconstruct.com.au
Subject: [PATCH linux dev-6.6 v2 1/3] usb: Add base USB MCTP definitions
Date: Wed,  7 May 2025 23:08:04 +0530
Message-Id: <20250507173806.5371-2-santosh.puranik.ibm@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250507173806.5371-1-santosh.puranik.ibm@gmail.com>
References: <20250507173806.5371-1-santosh.puranik.ibm@gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
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
index 8722a4a851f1..d3e42e21ef65 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12648,6 +12648,7 @@ L:	netdev@vger.kernel.org
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


