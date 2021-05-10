Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E5B3779F6
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 03:44:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdkPG3BVLz2ymV
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 11:44:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=kZ3ek6kK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=kZ3ek6kK; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdkMf5C96z2yx4;
 Mon, 10 May 2021 11:42:54 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 4F5AC8F;
 Sun,  9 May 2021 18:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1620610973;
 bh=cJWOo4TfUzj7t7/dXgttcnTX16/CdJrjTEAU3pw82dw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kZ3ek6kKU43A648ercUBWqvEVh3HZv9sYrQRYDSF84hJPZlSt7VYfxFAtA3sPPw+W
 t2cD3vtJwA6zK7JKdw3alNeHZjeZSYi7Xhxt2CxDFBY/xMUbWsg5hm6d/cMw4kpDZ/
 TkTMIGzanOIQlfLHRqaO2C/H9DenBJ9r9tzLiaAw=
From: Zev Weiss <zev@bewilderbeest.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 3/3] serial: 8250_aspeed_vuart: use UPF_IOREMAP to set up
 register mapping
Date: Sun,  9 May 2021 20:42:31 -0500
Message-Id: <20210510014231.647-4-zev@bewilderbeest.net>
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

Previously this driver's use of devm_ioremap_resource() led to
duplicated calls to __release_region() when unbinding it (one from
serial8250_release_std_resource() and one from devres_release_all()),
the second of which resulted in a warning message:

  # echo 1e787000.serial > /sys/bus/platform/drivers/aspeed-vuart/unbind
  [33091.774200] Trying to free nonexistent resource <000000001e787000-000000001e78703f>

With this change the driver uses the generic serial8250 code's
UPF_IOREMAP to take care of the register mapping automatically instead
of doing its own devm_ioremap_resource(), thus avoiding the duplicate
__release_region() on unbind.

In doing this we eliminate vuart->regs, since it merely duplicates
vuart->port->port.membase, which we now use for our I/O accesses.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Reported-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/tty/serial/8250/8250_aspeed_vuart.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 249164dc397b..2bf1d8582d9a 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -34,7 +34,6 @@
 
 struct aspeed_vuart {
 	struct device		*dev;
-	void __iomem		*regs;
 	struct clk		*clk;
 	int			line;
 	struct timer_list	unthrottle_timer;
@@ -66,12 +65,12 @@ static const int unthrottle_timeout = HZ/10;
 
 static inline u8 aspeed_vuart_readb(struct aspeed_vuart *vuart, u8 reg)
 {
-	return readb(vuart->regs + reg);
+	return readb(vuart->port->port.membase + reg);
 }
 
 static inline void aspeed_vuart_writeb(struct aspeed_vuart *vuart, u8 val, u8 reg)
 {
-	writeb(val, vuart->regs + reg);
+	writeb(val, vuart->port->port.membase + reg);
 }
 
 static ssize_t lpc_address_show(struct device *dev,
@@ -429,13 +428,9 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 	timer_setup(&vuart->unthrottle_timer, aspeed_vuart_unthrottle_exp, 0);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	vuart->regs = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(vuart->regs))
-		return PTR_ERR(vuart->regs);
 
 	memset(&port, 0, sizeof(port));
 	port.port.private_data = vuart;
-	port.port.membase = vuart->regs;
 	port.port.mapbase = res->start;
 	port.port.mapsize = resource_size(res);
 	port.port.startup = aspeed_vuart_startup;
@@ -492,7 +487,7 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 	port.port.iotype = UPIO_MEM;
 	port.port.type = PORT_16550A;
 	port.port.uartclk = clk;
-	port.port.flags = UPF_SHARE_IRQ | UPF_BOOT_AUTOCONF
+	port.port.flags = UPF_SHARE_IRQ | UPF_BOOT_AUTOCONF | UPF_IOREMAP
 		| UPF_FIXED_PORT | UPF_FIXED_TYPE | UPF_NO_THRE_TEST;
 
 	if (of_property_read_bool(np, "no-loopback-test"))
-- 
2.31.1

