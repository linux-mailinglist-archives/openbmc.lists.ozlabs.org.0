Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B9F3779F2
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 03:43:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdkNK73kyz2ysk
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 11:43:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=jZVKVgOy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=jZVKVgOy; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdkMZ15CXz2yXv;
 Mon, 10 May 2021 11:42:49 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id B6D86500;
 Sun,  9 May 2021 18:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1620610966;
 bh=9BI4KzEc5P9h+jLSDHe3pKEvL0KLoXMseWebG6t328Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jZVKVgOys2r+Jn2clKpXyO0wv7s5kFPPRMy+wbSr5U/ypvSfGb+Q2W4atukLWtL9w
 MCg3LTBnFnqrXeoFctt8Yh037/uFMhPwQj0L2aSwAMh078UFqcLtk6kgwOlvPC+KpD
 VIl2A0QiZhPEgQFDERIrp/Jb3XPYmBFhcdIObMhU=
From: Zev Weiss <zev@bewilderbeest.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 1/3] serial: 8250_aspeed_vuart: factor out aspeed_vuart_{read,
 write}b() helper functions
Date: Sun,  9 May 2021 20:42:29 -0500
Message-Id: <20210510014231.647-2-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510014231.647-1-zev@bewilderbeest.net>
References: <20210510014231.647-1-zev@bewilderbeest.net>
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
Cc: linux-aspeed@lists.ozlabs.org, Zev Weiss <zev@bewilderbeest.net>,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a small prepatory step for changing the way this driver does
its I/O accesses.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/tty/serial/8250/8250_aspeed_vuart.c | 38 +++++++++++++--------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 61550f24a2d3..9e8b2e8e32b6 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -64,14 +64,24 @@ static const int unthrottle_timeout = HZ/10;
  * different system (though most of them use 3f8/4).
  */
 
+static inline u8 aspeed_vuart_readb(struct aspeed_vuart *vuart, u8 reg)
+{
+	return readb(vuart->regs + reg);
+}
+
+static inline void aspeed_vuart_writeb(struct aspeed_vuart *vuart, u8 val, u8 reg)
+{
+	writeb(val, vuart->regs + reg);
+}
+
 static ssize_t lpc_address_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
 	struct aspeed_vuart *vuart = dev_get_drvdata(dev);
 	u16 addr;
 
-	addr = (readb(vuart->regs + ASPEED_VUART_ADDRH) << 8) |
-		(readb(vuart->regs + ASPEED_VUART_ADDRL));
+	addr = (aspeed_vuart_readb(vuart, ASPEED_VUART_ADDRH) << 8) |
+		(aspeed_vuart_readb(vuart, ASPEED_VUART_ADDRL));
 
 	return snprintf(buf, PAGE_SIZE - 1, "0x%x\n", addr);
 }
@@ -81,8 +91,8 @@ static int aspeed_vuart_set_lpc_address(struct aspeed_vuart *vuart, u32 addr)
 	if (addr > U16_MAX)
 		return -EINVAL;
 
-	writeb(addr >> 8, vuart->regs + ASPEED_VUART_ADDRH);
-	writeb(addr >> 0, vuart->regs + ASPEED_VUART_ADDRL);
+	aspeed_vuart_writeb(vuart, addr >> 8, ASPEED_VUART_ADDRH);
+	aspeed_vuart_writeb(vuart, addr >> 0, ASPEED_VUART_ADDRL);
 
 	return 0;
 }
@@ -111,7 +121,7 @@ static ssize_t sirq_show(struct device *dev,
 	struct aspeed_vuart *vuart = dev_get_drvdata(dev);
 	u8 reg;
 
-	reg = readb(vuart->regs + ASPEED_VUART_GCRB);
+	reg = aspeed_vuart_readb(vuart, ASPEED_VUART_GCRB);
 	reg &= ASPEED_VUART_GCRB_HOST_SIRQ_MASK;
 	reg >>= ASPEED_VUART_GCRB_HOST_SIRQ_SHIFT;
 
@@ -128,10 +138,10 @@ static int aspeed_vuart_set_sirq(struct aspeed_vuart *vuart, u32 sirq)
 	sirq <<= ASPEED_VUART_GCRB_HOST_SIRQ_SHIFT;
 	sirq &= ASPEED_VUART_GCRB_HOST_SIRQ_MASK;
 
-	reg = readb(vuart->regs + ASPEED_VUART_GCRB);
+	reg = aspeed_vuart_readb(vuart, ASPEED_VUART_GCRB);
 	reg &= ~ASPEED_VUART_GCRB_HOST_SIRQ_MASK;
 	reg |= sirq;
-	writeb(reg, vuart->regs + ASPEED_VUART_GCRB);
+	aspeed_vuart_writeb(vuart, reg, ASPEED_VUART_GCRB);
 
 	return 0;
 }
@@ -159,7 +169,7 @@ static ssize_t sirq_polarity_show(struct device *dev,
 	struct aspeed_vuart *vuart = dev_get_drvdata(dev);
 	u8 reg;
 
-	reg = readb(vuart->regs + ASPEED_VUART_GCRA);
+	reg = aspeed_vuart_readb(vuart, ASPEED_VUART_GCRA);
 	reg &= ASPEED_VUART_GCRA_HOST_SIRQ_POLARITY;
 
 	return snprintf(buf, PAGE_SIZE - 1, "%u\n", reg ? 1 : 0);
@@ -168,14 +178,14 @@ static ssize_t sirq_polarity_show(struct device *dev,
 static void aspeed_vuart_set_sirq_polarity(struct aspeed_vuart *vuart,
 					   bool polarity)
 {
-	u8 reg = readb(vuart->regs + ASPEED_VUART_GCRA);
+	u8 reg = aspeed_vuart_readb(vuart, ASPEED_VUART_GCRA);
 
 	if (polarity)
 		reg |= ASPEED_VUART_GCRA_HOST_SIRQ_POLARITY;
 	else
 		reg &= ~ASPEED_VUART_GCRA_HOST_SIRQ_POLARITY;
 
-	writeb(reg, vuart->regs + ASPEED_VUART_GCRA);
+	aspeed_vuart_writeb(vuart, reg, ASPEED_VUART_GCRA);
 }
 
 static ssize_t sirq_polarity_store(struct device *dev,
@@ -210,14 +220,14 @@ static const struct attribute_group aspeed_vuart_attr_group = {
 
 static void aspeed_vuart_set_enabled(struct aspeed_vuart *vuart, bool enabled)
 {
-	u8 reg = readb(vuart->regs + ASPEED_VUART_GCRA);
+	u8 reg = aspeed_vuart_readb(vuart, ASPEED_VUART_GCRA);
 
 	if (enabled)
 		reg |= ASPEED_VUART_GCRA_VUART_EN;
 	else
 		reg &= ~ASPEED_VUART_GCRA_VUART_EN;
 
-	writeb(reg, vuart->regs + ASPEED_VUART_GCRA);
+	aspeed_vuart_writeb(vuart, reg, ASPEED_VUART_GCRA);
 }
 
 static void aspeed_vuart_set_host_tx_discard(struct aspeed_vuart *vuart,
@@ -225,7 +235,7 @@ static void aspeed_vuart_set_host_tx_discard(struct aspeed_vuart *vuart,
 {
 	u8 reg;
 
-	reg = readb(vuart->regs + ASPEED_VUART_GCRA);
+	reg = aspeed_vuart_readb(vuart, ASPEED_VUART_GCRA);
 
 	/* If the DISABLE_HOST_TX_DISCARD bit is set, discard is disabled */
 	if (!discard)
@@ -233,7 +243,7 @@ static void aspeed_vuart_set_host_tx_discard(struct aspeed_vuart *vuart,
 	else
 		reg &= ~ASPEED_VUART_GCRA_DISABLE_HOST_TX_DISCARD;
 
-	writeb(reg, vuart->regs + ASPEED_VUART_GCRA);
+	aspeed_vuart_writeb(vuart, reg, ASPEED_VUART_GCRA);
 }
 
 static int aspeed_vuart_startup(struct uart_port *uart_port)
-- 
2.31.1

