Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FC8E120E
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 08:24:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ygMB0NVjzDqPW
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 17:24:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="p2+nW13w"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ygFL2lHdzDqPv
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 17:19:18 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id p1so11506845pgi.4
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 23:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x0H0fEg0EF+8xKGTwGotZYm/YvtekV706ercyyGK6zs=;
 b=p2+nW13wOGe9v4JkQbNJdxjwb5ytwrjMFoCYcAuDXJEmmIO/RXVXUzyq8jepfZ9hLj
 wAFck2RCQqt1/K+LT+ibjHpLUvC0NrE4oUyeeRnA7HawfoA6bObxf/vNcRe6H3+ct5/U
 gI9jiBcNudWJOJwj6o5Vxqj+/+1MfKi52XdH/POO2p8fcCbKPcj2NdCAmze6jKfZflT3
 JMPuBxhl2bQC1t6Kcbquty1ioRqJFblTt5otFDshHCnGx3TqcgJb/CUUeD/fnjwVkUWj
 wpogmGhYAxjgQ89WDSsYfqi7uLakVpBqIGaGrbBCCTcW61SW7tUiPV7qIih61PmOqVUI
 GpGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=x0H0fEg0EF+8xKGTwGotZYm/YvtekV706ercyyGK6zs=;
 b=Qnm/rB9mCEW9QqCu3WVpXcDw2E5WmY3prg9VNsFu3v55gEQrJjQpNnjfhSd5uQvSXs
 Wy7lbDy+bQnrynersgvrVNoD8IcuQXTXdu97sEsAXTWU2yZlljyXevVVt+wsTC8n/l2L
 glpWmXo37bU1e5AeyGM8TVDNg/0qZ0LyjOyYSiSlsKPwItjV8qM/f6pQgeUtAhN7Mvrr
 jFZu1f2ET+f0D7Y/rmoV2eSCTVmShp15HDQw7ja6sJ51EhHusfxpVOOgjkbf1xJ78T3c
 //HZvb/jps8ZT6Ie4cf4uMEACdAqLh+fTJ9uRewjqkZy9YRth1NdF/oOv/MmnAmj4++e
 hnMg==
X-Gm-Message-State: APjAAAXs9KqpWiv9dr3XVRoW41tiUsSfpwe1I5gNH0p+IVmFnmxFoDSm
 JJL8mYaAKD92HXAZLl3XDjpXVqtVVH0=
X-Google-Smtp-Source: APXvYqzgPyZqbx5f9Gy09yWczNUmkPOBM3XFZnW9wh5qF5YppmcGQ+y5zLbzFrJO7ZpsXMG6pR67zQ==
X-Received: by 2002:a17:90a:cf97:: with SMTP id
 i23mr9507652pju.77.1571811556118; 
 Tue, 22 Oct 2019 23:19:16 -0700 (PDT)
Received: from voyager.au.ibm.com (bh02i525f01.au.ibm.com. [202.81.18.30])
 by smtp.gmail.com with ESMTPSA id 4sm6364598pfz.185.2019.10.22.23.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 23:19:15 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 4/4] fsi: aspeed: Implement byte and half world
 transfers
Date: Wed, 23 Oct 2019 17:18:48 +1100
Message-Id: <20191023061849.16926-5-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191023061849.16926-1-joel@jms.id.au>
References: <20191023061849.16926-1-joel@jms.id.au>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The driver did not previously support non-word size transfers. The
fsi-i2c driver attempts accesses of this size, so we require it now.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 37 +++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 8c5eb2bb1994..a99f9172ffa7 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -164,24 +164,38 @@ static const u32 fsi_base = 0xa0000000;
 #define CMD_WRITE	0
 
 /* OPBx_XFER_SIZE */
-#define XFER_WORD	(BIT(1) | BIT(0))
-#define XFER_NIBBLE	(BIT(0))
+#define XFER_FULLWORD	(BIT(1) | BIT(0))
+#define XFER_HALFWORD	(BIT(0))
 #define XFER_BYTE	(0)
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/fsi_master_aspeed.h>
 
+static u32 get_xfer_size(size_t size) {
+	switch (size) {
+	case 1:
+		return XFER_BYTE;
+	case 2:
+		return XFER_HALFWORD;
+	case 4:
+		return XFER_FULLWORD;
+	default:
+		return -EINVAL;
+	}
+}
+
 static u32 opb_write(void __iomem *base, uint32_t addr, uint32_t val,
 		     size_t size)
 {
-	u32 reg, ret, status;
+	u32 reg, ret, status, xfer_size;
 
-	/* TODO: implement other sizes, see 0x18 */
-	WARN_ON(size != 4);
+	xfer_size = get_xfer_size(size);
+	if (xfer_size < 0)
+		return xfer_size;
 
 	writel(0x1, base + OPB0_SELECT);
 	writel(CMD_WRITE, base + OPB0_RW);
-	writel(XFER_WORD, base + OPB0_XFER_SIZE);
+	writel(xfer_size, base + OPB0_XFER_SIZE);
 	writel(addr, base + OPB0_FSI_ADDR);
 	writel(val, base + OPB0_FSI_DATA_W);
 	writel(0x1, base + OPB_IRQ_CLEAR);
@@ -208,15 +222,16 @@ static u32 opb_write(void __iomem *base, uint32_t addr, uint32_t val,
 
 static int opb_read(void __iomem *base, uint32_t addr, size_t size, u32 *out)
 {
-	u32 result, reg;
+	u32 result, reg, xfer_size;
 	int status, ret;
 
-	/* TODO: implement other sizes, see 0x18 */
-	WARN_ON(size != 4);
+	xfer_size = get_xfer_size(size);
+	if (xfer_size < 0)
+		return xfer_size;
 
 	writel(0x1, base + OPB0_SELECT);
 	writel(CMD_READ, base + OPB0_RW);
-	writel(XFER_WORD, base + OPB0_XFER_SIZE);
+	writel(xfer_size, base + OPB0_XFER_SIZE);
 	writel(addr, base + OPB0_FSI_ADDR);
 	writel(0x1, base + OPB_IRQ_CLEAR);
 	writel(0x1, base + OPB_TRIGGER);
@@ -242,7 +257,7 @@ static int opb_read(void __iomem *base, uint32_t addr, size_t size, u32 *out)
 		return -EIO;
 
 	if (out)
-		*out = result;
+		memcpy(out, &result, size);
 
 	return 0;
 }
-- 
2.23.0

