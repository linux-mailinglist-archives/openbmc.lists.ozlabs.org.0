Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C8A382C66
	for <lists+openbmc@lfdr.de>; Mon, 17 May 2021 14:41:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkJfd3JSHz303t
	for <lists+openbmc@lfdr.de>; Mon, 17 May 2021 22:41:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=Jlc+d3Cs;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=jeRyaiih;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=Jlc+d3Cs; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=jeRyaiih; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkJfD67LCz2yXp;
 Mon, 17 May 2021 22:41:24 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9788E5808A4;
 Mon, 17 May 2021 08:41:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 17 May 2021 08:41:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=MF+FHtIUrSHPdv8pdx7xGvA8pK
 5kMkTH+JjfQNKGQSU=; b=Jlc+d3CsoDg5Dj5AkPN6IPlUwNaL70WXBrBs+dMRN/
 /OsddQIg+KK2RdgrXGSzupNs3yjokIJwzi1HuhnX1d/PU6bClf7yrzx/5Irp3Hac
 aGoQi4XgjX13NH+x5iazvtaGFfR+71YRC/IPT7UdVoZ9N225X4X8Iw8xW7DgA2BA
 KWxVOk2CDBPuYyRtVUbkxRqZ2VBXOBhc/hI9oW1+Y+GZb85HH8iBfmlbWpikux6e
 EokBq4fGwg1wGubtQFks6t1kYfeOSnUrRawjo9qyZH08dgOuj4bZzhsnjWElNAjI
 FrTbnyLuwaJxaPkUeN1geeC3H3hxxF60en+QsztDn3ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=MF+FHtIUrSHPdv8pd
 x7xGvA8pK5kMkTH+JjfQNKGQSU=; b=jeRyaiiheB49PyjYDrrdCFe2KLAqUonB7
 8yVjWW/0KiCkm0XFMq0yoqHbq+gFIbDyF5QPN100JWC/9XhOLgnwTSK0Z812u/tU
 TI+P6QEPcGuaWW9ym7PzWfxPbFN8gQAf/IcyURKfndhWPCcJ2ybVisikvnJCc3v7
 8j5+koqHSsUjS7JrKclMRkrbV0KHn+WMo8EASqHcr9J0Qb9KvyxetSieHMMoX7x4
 jfEyJso3d0RUUvwpeqeqa1BxlyOFxssSgfW75hI8e3pNqH8j7ubglNwcuFEsJ2dA
 XY5BXR8NFLIB79CyPwHzBN0Moi9G5r2GYzmwY1mATbMkDQMmgTqkw==
X-ME-Sender: <xms:b2SiYD8Cfk9dr8VfeBG1c3uoajAlDfkBhldGGsPj2R9RY_IH5nzUtw>
 <xme:b2SiYPuqtQrJK208NsIzpRNBB4Ns8IH8tWbS9q9l0zt7JymRHQeC361taX7eHAwnf
 4HiY1_HUHv674OsNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeihedgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgvficu
 lfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrghtthgvrh
 hnpeegfedttdfhfeegtdejveeivdehtefhveejudeujeevvdeifeegvdduffeigeehhfen
 ucffohhmrghinhepphhorhhtrdguvghvnecukfhppedvtdefrdehjedrvdduhedrkeenuc
 evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgv
 fiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:b2SiYBCnuwf9VGbenYUaOk89dozsHE56pR6YpRHHfawIGphupMERVQ>
 <xmx:b2SiYPftoQrObGOZeY4qvnLnhuY4KyGFx6fhjD8LVjlqI1Z1Kl4A7w>
 <xmx:b2SiYIMAttCZYKkMXb6Pf-5EMPhuj85capD4X5ZD9pqcPqOONOmlzg>
 <xmx:cGSiYHp6-oc-IfnjOVyT_NOomPBBvZYKLzJlgRv-7kpg0IMAMIbZZQ>
Received: from mistburn.lan (203-57-215-8.dyn.iinet.net.au [203.57.215.8])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 17 May 2021 08:41:14 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-serial@vger.kernel.org
Subject: [PATCH] tty: 8250: Add UART_BUG_TXRACE workaround for Aspeed VUART
Date: Mon, 17 May 2021 22:11:05 +0930
Message-Id: <20210517124105.3565860-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
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
Cc: ryan_chen@aspeedtech.com, linux-aspeed@lists.ozlabs.org,
 gregkh@linuxfoundation.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, jenmin_yuan@aspeedtech.com, jirislaby@kernel.org,
 ChiaWei Wang <chiawei_wang@aspeedtech.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Aspeed Virtual UARTs directly bridge e.g. the system console UART on the
LPC bus to the UART interface on the BMC's internal APB. As such there's
no RS-232 signalling involved - the UART interfaces on each bus are
directly connected as the producers and consumers of the one set of
FIFOs.

The APB in the AST2600 generally runs at 100MHz while the LPC bus peaks
at 33MHz. The difference in clock speeds exposes a race in the VUART
design where a Tx data burst on the APB interface can result in a byte
lost on the LPC interface. The symptom is LSR[DR] remains clear on the
LPC interface despite data being present in its Rx FIFO, while LSR[THRE]
remains clear on the APB interface as the host has not consumed the data
the BMC has transmitted. In this state, the UART has stalled and no
further data can be transmitted without manual intervention (e.g.
resetting the FIFOs, resulting in loss of data).

The recommended work-around is to insert a read cycle on the APB
interface between writes to THR.

Cc: ChiaWei Wang <chiawei_wang@aspeedtech.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/tty/serial/8250/8250.h              | 1 +
 drivers/tty/serial/8250/8250_aspeed_vuart.c | 1 +
 drivers/tty/serial/8250/8250_port.c         | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 52bb21205bb6..4d6f5e0ecd4c 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -88,6 +88,7 @@ struct serial8250_config {
 #define UART_BUG_NOMSR	(1 << 2)	/* UART has buggy MSR status bits (Au1x00) */
 #define UART_BUG_THRE	(1 << 3)	/* UART has buggy THRE reassertion */
 #define UART_BUG_PARITY	(1 << 4)	/* UART mishandles parity if FIFO enabled */
+#define UART_BUG_TXRACE (1 << 5)	/* UART Tx fails to set remote DR */
 
 
 #ifdef CONFIG_SERIAL_8250_SHARE_IRQ
diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index a28a394ba32a..4caab8714e2c 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -440,6 +440,7 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 	port.port.status = UPSTAT_SYNC_FIFO;
 	port.port.dev = &pdev->dev;
 	port.port.has_sysrq = IS_ENABLED(CONFIG_SERIAL_8250_CONSOLE);
+	port.bugs |= UART_BUG_TXRACE;
 
 	rc = sysfs_create_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
 	if (rc < 0)
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index d45dab1ab316..6c032abfc321 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -1809,6 +1809,8 @@ void serial8250_tx_chars(struct uart_8250_port *up)
 	count = up->tx_loadsz;
 	do {
 		serial_out(up, UART_TX, xmit->buf[xmit->tail]);
+		if (up->bugs & UART_BUG_TXRACE)
+			serial_in(up, UART_SCR);
 		xmit->tail = (xmit->tail + 1) & (UART_XMIT_SIZE - 1);
 		port->icount.tx++;
 		if (uart_circ_empty(xmit))
-- 
2.30.2

