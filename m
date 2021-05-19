Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2568C38838C
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 02:08:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlCrM13gWz303k
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 10:08:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=i8j2NcpF;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=o+6g8Gpi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=i8j2NcpF; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=o+6g8Gpi; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlCqR1F6qz3004;
 Wed, 19 May 2021 10:07:30 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id DB98D580606;
 Tue, 18 May 2021 20:07:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 18 May 2021 20:07:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=qbFwjze46/G9L
 HZQ1bh1SZv0oKRVk2i2WcEWwa8CGts=; b=i8j2NcpFjmVgKwQKuI5AkOUR3RZvq
 Z/vnk56+F79Zdk+o6m/LDR8c6Pe6j0P5/AZE9W4cU511/qtuSFfdmJHSJuHyRaci
 8wwdLgXbeO9tWVL4ocz+GQ5DnLsMGWELLWKaHOanjPvuovrTKIRMc5QXWoLeaE2X
 257unsR+BiJyKuA0FuRLHL4ekCzx5EQTXbve+Ru7sgwWNrlbPP/1OOPZOZdsU6Uc
 6u2ke6hYiZLR5Ajdbm+40iNRHMwg5c6EOfMkBJviH+QZyei0cdFekMUGqbgssioX
 apTv2i3bopYFxTyg3DINgqGIP5eIHQnglqigELQxLjcKZBj88aQSvCF8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=qbFwjze46/G9LHZQ1bh1SZv0oKRVk2i2WcEWwa8CGts=; b=o+6g8Gpi
 kHi3XQXfiKtFWcFOgI8h11TLr3N4tLZsQQGVzZIllMdgvywz7yC4WCY4oPEOPNMs
 GnEnglxwKJB26jqq/7nZk7xnmVLNbG2XTmgjL/vPTKHRj2fMCe+vqua4pgy3PKPm
 j/izRfQjyXOkVkfy5WaPUSvAJKHCcygct+4AUBe3Prq2hjjG9f/XokAYAhxRMelq
 gDRbpecYGdI8d8Q63Y1TCCrEjIfdiS6Mg9sSQs11oKJllVmx5wM+SGv0KipgiklD
 0UCM1zKjWfrXe9fLb8kdu2osw+iGau59nW/IZAg6exQWarbKVnXh38fQYSYvv5sK
 0VhkE+ePfvXfLg==
X-ME-Sender: <xms:wFakYFE7Sl6KkHp2G3BGa09V4Ja5ziLsaimkSoI9Rh_Ulaex0gh3BA>
 <xme:wFakYKUjiAtl2q1dtvT8eYvu3cjXcbhto5ce7qK-p8Rt_2lL2BxfMroao9ANsY3X_
 MPip2I_O563YXkjyQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeikedgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgv
 ficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrghtth
 gvrhhnpeehhfegffehvefhieejkedtvedvlefhgfeufedtgfetueevtedvffduffelleef
 heenucffohhmrghinhepphhorhhtrdguvghvnecukfhppedvtdefrdehjedrvdduhedrke
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgu
 rhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:wFakYHLDeSLGAR-q3FcshUPPSrWZ24brZYA78FYifjjzOrrn4ST_YA>
 <xmx:wFakYLEPbGEg9q_0XjZeh04hmxYe4d5xnPmaLrNfGWjqb5u0vIwxfw>
 <xmx:wFakYLV4i8LLFPfYZ8YoIIYmagTvEEJ8zYc09uTz2PosHdiPWFhyow>
 <xmx:wFakYLR-2C3sGIZAIevGPaB4iXK45Eqea7Cr0j5PZwCPXpBcY68lMQ>
Received: from mistburn.lan (203-57-215-8.dyn.iinet.net.au [203.57.215.8])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 18 May 2021 20:07:23 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-serial@vger.kernel.org
Subject: [PATCH v2 1/2] serial: 8250: Add UART_BUG_TXRACE workaround for
 Aspeed VUART
Date: Wed, 19 May 2021 09:37:03 +0930
Message-Id: <20210519000704.3661773-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210519000704.3661773-1-andrew@aj.id.au>
References: <20210519000704.3661773-1-andrew@aj.id.au>
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
 drivers/tty/serial/8250/8250.h              |  1 +
 drivers/tty/serial/8250/8250_aspeed_vuart.c |  1 +
 drivers/tty/serial/8250/8250_port.c         | 10 ++++++++++
 3 files changed, 12 insertions(+)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 52bb21205bb6..34aa2714f3c9 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -88,6 +88,7 @@ struct serial8250_config {
 #define UART_BUG_NOMSR	(1 << 2)	/* UART has buggy MSR status bits (Au1x00) */
 #define UART_BUG_THRE	(1 << 3)	/* UART has buggy THRE reassertion */
 #define UART_BUG_PARITY	(1 << 4)	/* UART mishandles parity if FIFO enabled */
+#define UART_BUG_TXRACE	(1 << 5)	/* UART Tx fails to set remote DR */
 
 
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
index d45dab1ab316..9d44b2b2ff18 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -1809,6 +1809,16 @@ void serial8250_tx_chars(struct uart_8250_port *up)
 	count = up->tx_loadsz;
 	do {
 		serial_out(up, UART_TX, xmit->buf[xmit->tail]);
+		if (up->bugs & UART_BUG_TXRACE) {
+			/* The Aspeed BMC virtual UARTs have a bug where data
+			 * may get stuck in the BMC's Tx FIFO from bursts of
+			 * writes on the APB interface.
+			 *
+			 * Delay back-to-back writes by a read cycle to avoid
+			 * stalling the VUART.
+			 */
+			(void)serial_in(up, UART_SCR);
+		}
 		xmit->tail = (xmit->tail + 1) & (UART_XMIT_SIZE - 1);
 		port->icount.tx++;
 		if (uart_circ_empty(xmit))
-- 
2.30.2

