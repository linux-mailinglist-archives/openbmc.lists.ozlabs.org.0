Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DFF4B1A99
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 01:42:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvvwJ0Nf7z3bbS
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 11:42:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=cQ5QUebw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=cQ5QUebw; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jvvvs1QNqz2yPp;
 Fri, 11 Feb 2022 11:42:17 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 55E2162B;
 Thu, 10 Feb 2022 16:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1644540133;
 bh=Ta0bKrnVBjEojR4M2PA4jcJfw31PpTOxYdrRpm+5yrU=;
 h=From:To:Cc:Subject:Date:From;
 b=cQ5QUebwav7+E00VUUvtPQjJwWOFt8RGUU0OwNxWEgWknPhevFmwHsmcVCo5C77y+
 Q9kK4/TPJp8aMdbqUfEt+ijPkTPg5diOzdgEfakGyWkalKQgeZqpk1xGWob0a4AlYX
 HJ0uauMmF3rGoTLP3cBEfGexM/imzM0HP+92URj4=
From: Zev Weiss <zev@bewilderbeest.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2] serial: 8250_aspeed_vuart: add PORT_ASPEED_VUART port type
Date: Thu, 10 Feb 2022 16:42:03 -0800
Message-Id: <20220211004203.14915-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.35.1
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
 Konstantin Aladyshev <aladyshev22@gmail.com>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Oskar Senft <osk@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Commit 54da3e381c2b ("serial: 8250_aspeed_vuart: use UPF_IOREMAP to
set up register mapping") fixed a bug that had, as a side-effect,
prevented the 8250_aspeed_vuart driver from enabling the VUART's
FIFOs.  However, fixing that (and hence enabling the FIFOs) has in
turn revealed what appears to be a hardware bug in the ASPEED VUART in
which the host-side THRE bit doesn't get if the BMC-side receive FIFO
trigger level is set to anything but one byte.  This causes problems
for polled-mode writes from the host -- for example, Linux kernel
console writes proceed at a glacial pace (less than 100 bytes per
second) because the write path waits for a 10ms timeout to expire
after every character instead of being able to continue on to the next
character upon seeing THRE asserted.  (GRUB behaves similarly.)

As a workaround, introduce a new port type for the ASPEED VUART that's
identical to PORT_16550A as it had previously been using, but with
UART_FCR_R_TRIG_00 instead to set the receive FIFO trigger level to
one byte, which (experimentally) seems to avoid the problematic THRE
behavior.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Tested-by: Konstantin Aladyshev <aladyshev22@gmail.com>
Fixes: 54da3e381c2b ("serial: 8250_aspeed_vuart: use UPF_IOREMAP to set up register mapping")
---

Changes since v1 [0]:
 - Added Fixes: tag
 - Shifted PORT_* constant down into an unused gap

[0] https://lore.kernel.org/all/20220209203414.23491-1-zev@bewilderbeest.net/

 drivers/tty/serial/8250/8250_aspeed_vuart.c | 2 +-
 drivers/tty/serial/8250/8250_port.c         | 8 ++++++++
 include/uapi/linux/serial_core.h            | 3 +++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 2350fb3bb5e4..c2cecc6f47db 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -487,7 +487,7 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 	port.port.irq = irq_of_parse_and_map(np, 0);
 	port.port.handle_irq = aspeed_vuart_handle_irq;
 	port.port.iotype = UPIO_MEM;
-	port.port.type = PORT_16550A;
+	port.port.type = PORT_ASPEED_VUART;
 	port.port.uartclk = clk;
 	port.port.flags = UPF_SHARE_IRQ | UPF_BOOT_AUTOCONF | UPF_IOREMAP
 		| UPF_FIXED_PORT | UPF_FIXED_TYPE | UPF_NO_THRE_TEST;
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 3b12bfc1ed67..973870ebff69 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -307,6 +307,14 @@ static const struct serial8250_config uart_config[] = {
 		.rxtrig_bytes	= {1, 32, 64, 112},
 		.flags		= UART_CAP_FIFO | UART_CAP_SLEEP,
 	},
+	[PORT_ASPEED_VUART] = {
+		.name		= "ASPEED VUART",
+		.fifo_size	= 16,
+		.tx_loadsz	= 16,
+		.fcr		= UART_FCR_ENABLE_FIFO | UART_FCR_R_TRIG_00,
+		.rxtrig_bytes	= {1, 4, 8, 14},
+		.flags		= UART_CAP_FIFO,
+	},
 };
 
 /* Uart divisor latch read */
diff --git a/include/uapi/linux/serial_core.h b/include/uapi/linux/serial_core.h
index c4042dcfdc0c..8885e69178bd 100644
--- a/include/uapi/linux/serial_core.h
+++ b/include/uapi/linux/serial_core.h
@@ -68,6 +68,9 @@
 /* NVIDIA Tegra Combined UART */
 #define PORT_TEGRA_TCU	41
 
+/* ASPEED AST2x00 virtual UART */
+#define PORT_ASPEED_VUART	42
+
 /* Intel EG20 */
 #define PORT_PCH_8LINE	44
 #define PORT_PCH_2LINE	45
-- 
2.35.1

