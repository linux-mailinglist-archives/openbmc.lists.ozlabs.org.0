Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0ED35B927
	for <lists+openbmc@lfdr.de>; Mon, 12 Apr 2021 05:48:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJZTx18y3z30MK
	for <lists+openbmc@lfdr.de>; Mon, 12 Apr 2021 13:48:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=njJTMX/K;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=njJTMX/K; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJZSQ05fdz30BJ;
 Mon, 12 Apr 2021 13:47:33 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 84736690;
 Sun, 11 Apr 2021 20:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1618199252;
 bh=fvG+KhGr56hUUimTU+sIx4n7YvDI7UPAddjCieqejpg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=njJTMX/KmoKkVAeUPHntoS+o7bdvrqN+M/JrYaMRLZvG0M4hhEJAyuQbDTdEm4/0x
 fkLEwDJYOgoGpO1PpR+BxaIyRV2k/GsbMpNl243A3KzZtngu2yRsgps9zT9gUF9tDP
 yP9ZNZyv0UWmKLq0No2pazYEkPVafxa4/DYazbmc=
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH v6 2/4] serial: 8250_aspeed_vuart: refactor sirq and lpc
 address setting code
Date: Sun, 11 Apr 2021 22:47:10 -0500
Message-Id: <20210412034712.16778-3-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210412034712.16778-1-zev@bewilderbeest.net>
References: <20210412034712.16778-1-zev@bewilderbeest.net>
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
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This splits dedicated aspeed_vuart_set_{sirq,lpc_address}() functions
out of the sysfs store functions in preparation for adding DT
properties that will be poking the same registers.  While we're at it,
these functions now provide some basic bounds-checking on their
arguments.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/tty/serial/8250/8250_aspeed_vuart.c | 51 ++++++++++++++-------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index c33e02cbde93..8433f8dbb186 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -72,22 +72,31 @@ static ssize_t lpc_address_show(struct device *dev,
 	return snprintf(buf, PAGE_SIZE - 1, "0x%x\n", addr);
 }
 
+static int aspeed_vuart_set_lpc_address(struct aspeed_vuart *vuart, u32 addr)
+{
+	if (addr > U16_MAX)
+		return -EINVAL;
+
+	writeb(addr >> 8, vuart->regs + ASPEED_VUART_ADDRH);
+	writeb(addr >> 0, vuart->regs + ASPEED_VUART_ADDRL);
+
+	return 0;
+}
+
 static ssize_t lpc_address_store(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
 {
 	struct aspeed_vuart *vuart = dev_get_drvdata(dev);
-	unsigned long val;
+	u32 val;
 	int err;
 
-	err = kstrtoul(buf, 0, &val);
+	err = kstrtou32(buf, 0, &val);
 	if (err)
 		return err;
 
-	writeb(val >> 8, vuart->regs + ASPEED_VUART_ADDRH);
-	writeb(val >> 0, vuart->regs + ASPEED_VUART_ADDRL);
-
-	return count;
+	err = aspeed_vuart_set_lpc_address(vuart, val);
+	return err ? : count;
 }
 
 static DEVICE_ATTR_RW(lpc_address);
@@ -105,27 +114,37 @@ static ssize_t sirq_show(struct device *dev,
 	return snprintf(buf, PAGE_SIZE - 1, "%u\n", reg);
 }
 
+static int aspeed_vuart_set_sirq(struct aspeed_vuart *vuart, u32 sirq)
+{
+	u8 reg;
+
+	if (sirq > (ASPEED_VUART_GCRB_HOST_SIRQ_MASK >> ASPEED_VUART_GCRB_HOST_SIRQ_SHIFT))
+		return -EINVAL;
+
+	sirq <<= ASPEED_VUART_GCRB_HOST_SIRQ_SHIFT;
+	sirq &= ASPEED_VUART_GCRB_HOST_SIRQ_MASK;
+
+	reg = readb(vuart->regs + ASPEED_VUART_GCRB);
+	reg &= ~ASPEED_VUART_GCRB_HOST_SIRQ_MASK;
+	reg |= sirq;
+	writeb(reg, vuart->regs + ASPEED_VUART_GCRB);
+
+	return 0;
+}
+
 static ssize_t sirq_store(struct device *dev, struct device_attribute *attr,
 			  const char *buf, size_t count)
 {
 	struct aspeed_vuart *vuart = dev_get_drvdata(dev);
 	unsigned long val;
 	int err;
-	u8 reg;
 
 	err = kstrtoul(buf, 0, &val);
 	if (err)
 		return err;
 
-	val <<= ASPEED_VUART_GCRB_HOST_SIRQ_SHIFT;
-	val &= ASPEED_VUART_GCRB_HOST_SIRQ_MASK;
-
-	reg = readb(vuart->regs + ASPEED_VUART_GCRB);
-	reg &= ~ASPEED_VUART_GCRB_HOST_SIRQ_MASK;
-	reg |= val;
-	writeb(reg, vuart->regs + ASPEED_VUART_GCRB);
-
-	return count;
+	err = aspeed_vuart_set_sirq(vuart, val);
+	return err ? : count;
 }
 
 static DEVICE_ATTR_RW(sirq);
-- 
2.31.1

