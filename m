Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEFD38838F
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 02:08:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlCrr5m5gz2yYW
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 10:08:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=IKPVqJBm;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=KmPyWLyj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=IKPVqJBm; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=KmPyWLyj; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlCqW2mTcz303Q;
 Wed, 19 May 2021 10:07:35 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 67976580606;
 Tue, 18 May 2021 20:07:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 18 May 2021 20:07:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ZQpdzM6dhzIiO
 h3RhOhjIn/n8lrCmQ0vCBUyJ0+aRkQ=; b=IKPVqJBmeeRPT6yogAckd50jDOtYl
 ASjua4ps+81wElBClHLR97lY+/88nl/CSXw5v36lHlfB/camtJ7iMRc0HdifGMwu
 u9InIkmuHmu9BMOyXCgYRR74q6FDu76EqI2ovEE8riZvZJEoCN8lZeT0PEPicpHo
 1bNpVNzIF2ei98ZEsUhXUKlCZx2Sc08fiqmLz+tuXttyfZlgm4rcwazvKpRu24XS
 AGAYbX38y7bJ58ifwg8Kziy0zBd1ceWwZR366a1h1vMjK7ODmeOfEOauL4j9rjNs
 tAmprJ5P9NX5EcfBAFYNtlFzLK+A6LqkJGX5EBZwiPkkudUqJR+dp0kIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=ZQpdzM6dhzIiOh3RhOhjIn/n8lrCmQ0vCBUyJ0+aRkQ=; b=KmPyWLyj
 p81p0WFqTojCk1HRIrnLle1REIsGa+96bQt6Ht8W+jyNv7qq6UmazfHETqHf+SIZ
 ujon10qASwWtDGeTCq/+h1BDw7bGNvB5MhBzHiBxwMgBy+SJoHcdGQkAZQHr5YXB
 PVhAY/cE2R9tc/aJJeVOkMq2iIqpHcJ3IRZqi4YRa68bN24pDfPCyQEuAid4O046
 RdyBKpovuNdB71CMdbleMrlWxGuWZFd0boDR+P3wLk7gOldkRvvIN97CDqVpejCR
 IsDQ+hEfmKKKuVf46L4dryx9GVnVUXhn4WEvV4et+SiP6XdeUvtzNrDPAr2z4GZA
 ovLH6BvjdNtvkw==
X-ME-Sender: <xms:xVakYD-pURYG3AZMnL2Z6Rlq0_u_ldHIshdCKWirp0Oxwx0aGS-Z6Q>
 <xme:xVakYPvF3c7s6n1RU2FRq1r3Zg2WsYkBkUC16-K6n3v6b_uBDXui2UBMBEUE9airW
 ojnjCmCzz8YA6pV2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeikedgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppedvtdefrdehjedrvdduhedrkeen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurh
 gvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:xVakYBAmEXnzUdCzS1BMweWcttcCLsTE3fL3_j9PPNjkYOrynYn0YQ>
 <xmx:xVakYPcAIzAnWHkPvvrkvEVNKlFG4fmO75td2uoWg4tHWpMAvV64Dw>
 <xmx:xVakYIMXvUOcwxCgY3dzY-YNC4w3ImJmtf90Eo3II6RBtiXKjPkPyQ>
 <xmx:xVakYJiylVYsiTPGDGew5uqtrmGuBAkJ-Sen3L0B67sIjymkurCy0w>
Received: from mistburn.lan (203-57-215-8.dyn.iinet.net.au [203.57.215.8])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 18 May 2021 20:07:29 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-serial@vger.kernel.org
Subject: [PATCH v2 2/2] serial: 8250: Use BIT(x) for UART_{CAP,BUG}_*
Date: Wed, 19 May 2021 09:37:04 +0930
Message-Id: <20210519000704.3661773-3-andrew@aj.id.au>
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
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

BIT(x) improves readability and safety with respect to shifts.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/tty/serial/8250/8250.h | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 34aa2714f3c9..4fbf1088fad8 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -7,6 +7,7 @@
  *  Copyright (C) 2001 Russell King.
  */
 
+#include <linux/bitops.h>
 #include <linux/serial_8250.h>
 #include <linux/serial_reg.h>
 #include <linux/dmaengine.h>
@@ -70,25 +71,25 @@ struct serial8250_config {
 	unsigned int	flags;
 };
 
-#define UART_CAP_FIFO	(1 << 8)	/* UART has FIFO */
-#define UART_CAP_EFR	(1 << 9)	/* UART has EFR */
-#define UART_CAP_SLEEP	(1 << 10)	/* UART has IER sleep */
-#define UART_CAP_AFE	(1 << 11)	/* MCR-based hw flow control */
-#define UART_CAP_UUE	(1 << 12)	/* UART needs IER bit 6 set (Xscale) */
-#define UART_CAP_RTOIE	(1 << 13)	/* UART needs IER bit 4 set (Xscale, Tegra) */
-#define UART_CAP_HFIFO	(1 << 14)	/* UART has a "hidden" FIFO */
-#define UART_CAP_RPM	(1 << 15)	/* Runtime PM is active while idle */
-#define UART_CAP_IRDA	(1 << 16)	/* UART supports IrDA line discipline */
-#define UART_CAP_MINI	(1 << 17)	/* Mini UART on BCM283X family lacks:
+#define UART_CAP_FIFO	BIT(8)	/* UART has FIFO */
+#define UART_CAP_EFR	BIT(9)	/* UART has EFR */
+#define UART_CAP_SLEEP	BIT(10)	/* UART has IER sleep */
+#define UART_CAP_AFE	BIT(11)	/* MCR-based hw flow control */
+#define UART_CAP_UUE	BIT(12)	/* UART needs IER bit 6 set (Xscale) */
+#define UART_CAP_RTOIE	BIT(13)	/* UART needs IER bit 4 set (Xscale, Tegra) */
+#define UART_CAP_HFIFO	BIT(14)	/* UART has a "hidden" FIFO */
+#define UART_CAP_RPM	BIT(15)	/* Runtime PM is active while idle */
+#define UART_CAP_IRDA	BIT(16)	/* UART supports IrDA line discipline */
+#define UART_CAP_MINI	BIT(17)	/* Mini UART on BCM283X family lacks:
 					 * STOP PARITY EPAR SPAR WLEN5 WLEN6
 					 */
 
-#define UART_BUG_QUOT	(1 << 0)	/* UART has buggy quot LSB */
-#define UART_BUG_TXEN	(1 << 1)	/* UART has buggy TX IIR status */
-#define UART_BUG_NOMSR	(1 << 2)	/* UART has buggy MSR status bits (Au1x00) */
-#define UART_BUG_THRE	(1 << 3)	/* UART has buggy THRE reassertion */
-#define UART_BUG_PARITY	(1 << 4)	/* UART mishandles parity if FIFO enabled */
-#define UART_BUG_TXRACE	(1 << 5)	/* UART Tx fails to set remote DR */
+#define UART_BUG_QUOT	BIT(0)	/* UART has buggy quot LSB */
+#define UART_BUG_TXEN	BIT(1)	/* UART has buggy TX IIR status */
+#define UART_BUG_NOMSR	BIT(2)	/* UART has buggy MSR status bits (Au1x00) */
+#define UART_BUG_THRE	BIT(3)	/* UART has buggy THRE reassertion */
+#define UART_BUG_PARITY	BIT(4)	/* UART mishandles parity if FIFO enabled */
+#define UART_BUG_TXRACE	BIT(5)	/* UART Tx fails to set remote DR */
 
 
 #ifdef CONFIG_SERIAL_8250_SHARE_IRQ
-- 
2.30.2

