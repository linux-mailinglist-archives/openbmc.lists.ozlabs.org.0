Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9A8ED829
	for <lists+openbmc@lfdr.de>; Mon,  4 Nov 2019 05:03:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 475zfh6R24zF4w2
	for <lists+openbmc@lfdr.de>; Mon,  4 Nov 2019 15:03:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PQPTphPN"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 475zf35qhpzF3FX
 for <openbmc@lists.ozlabs.org>; Mon,  4 Nov 2019 15:02:35 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id s23so7008370pgo.9
 for <openbmc@lists.ozlabs.org>; Sun, 03 Nov 2019 20:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HDu1Mnrk8UHMKxhR/I1GDuB723YpM3QNS8OYs+/eYUA=;
 b=PQPTphPN/Z9vlZs2dnE8NZ/GLJHhFYCJFgUkDIeDZroqBRJ5rGgMmuc40ZNJYdMN9+
 YupP9lKcP4KBQEpMBWOCmJnEseC3HHbovebHmOpaBmkzJ8gU+FN5jCzfZo0KfHR+3K4L
 H/ffYo7npBijzc4MGaDEn/uyNW7MO5JpT0Mu5U0j2I6PRv68Gyxt4k+uSJhp0+kDICJI
 WsofIWU+njNRJX5fxpGPdJCjJqMFOyf5Fglk1Fst/Fi8ab39rnoy9K/ve/nKMOTpTExt
 Befv6DqxCUY34gfU6+drPBBY6FZ9phG1GfNPTC0+e1sljf4WEtPtqt4vr9HZ6b3bG/aW
 6UyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=HDu1Mnrk8UHMKxhR/I1GDuB723YpM3QNS8OYs+/eYUA=;
 b=Qp50n3p0DKnu1bONvZ+EavfcJUAJPVw0xa8brIRk0jQupiKcJS85sVcOIRTWmLRZj5
 W9v5K+01/uqjxHcIvv0R7OBt8zqQJHPKle/pR6QaaAqxcj2qy6YmoeCZfhPP6KCBv98Q
 kvZ2wV6RCouASpY+cb0vfrlqHEUO1dkgyyC+TebMqYSpYlMsPrTbiywjOY8R+/I2/+XM
 84dsTiXiMAF2oJfTO9csPHtvA4AojPh9dnvkotiuQKX/Z9GH8a2eu4Y3ClktCVFfseB1
 A3CqU2+anHTkS3N3J8dQk1FUdzhCBCdvvYfnksNFVOa89nAfAE+5Q+zOnbtQRG8qQdti
 LGsg==
X-Gm-Message-State: APjAAAWzHsTdHRWivS8A15skdPBfx5pXLDeGZPAtYpt8dP6AhFnmQ2pR
 lqiXiVLWX1XDPpw5b/+Fl0o=
X-Google-Smtp-Source: APXvYqxBgsiuPLjCubM7IHLm+JBYR8UyVhMZ0++ZIXbd/RM3vQMqeRwnHt9qkpxe1GPc5NqGk9DO6Q==
X-Received: by 2002:a17:90a:9a9:: with SMTP id
 38mr33087354pjo.45.1572840153201; 
 Sun, 03 Nov 2019 20:02:33 -0800 (PST)
Received: from voyager.iinet.net.au ([2001:44b8:802:1100:aaa0:58a6:9d5:10b8])
 by smtp.gmail.com with ESMTPSA id
 s7sm12326730pgv.61.2019.11.03.20.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Nov 2019 20:02:32 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Jeremy Kerr <jk@ozlabs.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.3] fsi: aspeed: Clean up defines and documentation
Date: Mon,  4 Nov 2019 14:32:26 +1030
Message-Id: <20191104040226.24376-1-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Some of the registers lacked documetation but now can be properly named.

Rename FW to FULLWORD so no one thinks it means 'firmware'.

The "enable DMA" comment was setting the FSI access direction for DMA.
As the driver does not yet use DMA it can be removed without effect.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 34 ++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 94e9b4f3418a..8da29fb9a69e 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -63,15 +63,23 @@ static const u32 fsi_base = 0xa0000000;
 #define OPB0_FSI_ADDR	0x1c
 #define OPB0_FSI_DATA_W	0x20
 #define OPB0_STATUS	0x80
-/* half world */
-#define  STATUS_HW_ACK	BIT(0)
-/* full word */
-#define  STATUS_FW_ACK	BIT(1)
-#define  STATUS_ERR_ACK	BIT(2)
 #define OPB0_FSI_DATA_R	0x84
 
-#define OPB0_W_ENDIAN	0x4c
-#define OPB0_R_ENDIAN	0x5c
+#define OPB0_WRITE_ORDER1	0x4c
+#define OPB0_WRITE_ORDER2	0x50
+#define OPB1_WRITE_ORDER1	0x54
+#define OPB1_WRITE_ORDER2	0x58
+#define OPB0_READ_ORDER1	0x5c
+#define OPB1_READ_ORDER2	0x60
+
+#define OPB_RETRY_COUNTER	0x64
+
+/* OPBn_STATUS */
+#define  STATUS_HALFWORD_ACK	BIT(0)
+#define  STATUS_FULLWORD_ACK	BIT(1)
+#define  STATUS_ERR_ACK		BIT(2)
+#define  STATUS_RETRY		BIT(3)
+#define  STATUS_TIMEOUT		BIT(4)
 
 /* OPB_IRQ_MASK */
 #define OPB1_XFER_ACK_EN BIT(17)
@@ -575,19 +583,19 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	writel(0x1, aspeed->base + OPB_CLK_SYNC);
 	writel(OPB1_XFER_ACK_EN | OPB0_XFER_ACK_EN,
 			aspeed->base + OPB_IRQ_MASK);
-	/* TODO: Try without this */
-	writel(0x10, aspeed->base + 0x64); // Retry counter number ???
-	writel(0x0f, aspeed->base + 0xe4); // DMA Enable
+
+	/* TODO: determine an appropriate value */
+	writel(0x10, aspeed->base + OPB_RETRY_COUNTER);
 
 	writel(ctrl_base, aspeed->base + OPB_CTRL_BASE);
 	writel(fsi_base, aspeed->base + OPB_FSI_BASE);
 
 	/* Set read data order */
-	writel(0x00030b1b, aspeed->base + OPB0_R_ENDIAN);
+	writel(0x00030b1b, aspeed->base + OPB0_READ_ORDER1);
 
 	/* Set write data order */
-	writel(0x0011101b, aspeed->base + OPB0_W_ENDIAN);
-	writel(0x0c330f3f, aspeed->base + 0x50);
+	writel(0x0011101b, aspeed->base + OPB0_WRITE_ORDER1);
+	writel(0x0c330f3f, aspeed->base + OPB0_WRITE_ORDER2);
 
 	/*
 	 * Select OPB0 for all operations.
-- 
2.24.0.rc1

