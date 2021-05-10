Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F37B3779F3
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 03:43:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdkNl42lxz3078
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 11:43:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=BcJBeeuB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=BcJBeeuB; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdkMb4nWrz2yXv;
 Mon, 10 May 2021 11:42:51 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 183ED8F;
 Sun,  9 May 2021 18:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1620610970;
 bh=vlGnGVyK4iFE6i7gI1NT1WgH61NFI88Q9/7ZXsupdiM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BcJBeeuBZhCyfsh+6VtodsMsGjgttD050iuoW+DjcsfZwUq9YJoupO5dkk4gCEBhT
 /u+oLwGTOUEvBh/StNpzXuSr4TFtsf8SqImRyj7l3Pm/xfLbKHVQ3GF0zL/ivJtGmv
 UGaGxYsqHAaf9H6OB5gRsfDvsy9GuBwJy8lf4DzM=
From: Zev Weiss <zev@bewilderbeest.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 2/3] serial: 8250_aspeed_vuart: initialize vuart->port in
 aspeed_vuart_probe()
Date: Sun,  9 May 2021 20:42:30 -0500
Message-Id: <20210510014231.647-3-zev@bewilderbeest.net>
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

Previously this had only been initialized if we hit the throttling path
in aspeed_vuart_handle_irq(); moving it to the probe function is a
slight consistency improvement and avoids redundant reinitialization in
the interrupt handler.  It also serves as preparation for converting the
driver's I/O accesses to use port->port.membase instead of its own
vuart->regs.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/tty/serial/8250/8250_aspeed_vuart.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 9e8b2e8e32b6..249164dc397b 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -349,11 +349,9 @@ static int aspeed_vuart_handle_irq(struct uart_port *port)
 			struct aspeed_vuart *vuart = port->private_data;
 			__aspeed_vuart_set_throttle(up, true);
 
-			if (!timer_pending(&vuart->unthrottle_timer)) {
-				vuart->port = up;
+			if (!timer_pending(&vuart->unthrottle_timer))
 				mod_timer(&vuart->unthrottle_timer,
 					  jiffies + unthrottle_timeout);
-			}
 
 		} else {
 			count = min(space, 256);
@@ -511,6 +509,7 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 		goto err_clk_disable;
 
 	vuart->line = rc;
+	vuart->port = serial8250_get_port(vuart->line);
 
 	rc = of_parse_phandle_with_fixed_args(
 		np, "aspeed,sirq-polarity-sense", 2, 0,
-- 
2.31.1

