Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B43AB389B44
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 04:14:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fltc15Pzdz2yjc
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 12:14:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=seEJKdzP;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=n5RY+O6i;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=seEJKdzP; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=n5RY+O6i; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FltZw2DB9z3004;
 Thu, 20 May 2021 12:14:00 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1E6525808F3;
 Wed, 19 May 2021 22:13:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 19 May 2021 22:13:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=xaOffRI6alJL3
 rQhNQY1BObEReB1pRx0cFG8v7tgrSo=; b=seEJKdzPx3BjwzX0SXx8TYL4jg0Ph
 +rHEdowVgjI85qIGwzLo1UQUfH2bRp31kd0jiMVh0wgPMk3qPEub2MoZ/mlFH5uY
 d9VyCQg86Rt5SbVnco0RTOkvnhNiXvZth8h+eH01RrxAfjbyoEkGiD8N77DVcwxk
 iJH4owW8y45z7dusmgfmpNscFN66D1dVdb1Cice+Gfl/hp6ZPv2PMxgXV/x9dnFn
 Gl2oAzezRGrdQ6Z7kDOGFCYLtE174z9kB1X4PTUm/keE9RvRHuYRg73GZQ9P9Zvq
 tP6nGUz89tF2aT6leSWWL6bekLUP01xn0voU1z/Yl+j0GD0orYIScKR9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=xaOffRI6alJL3rQhNQY1BObEReB1pRx0cFG8v7tgrSo=; b=n5RY+O6i
 NzDq/Z/wVHnQ5/iEGNsp/hqlsWSbU6cgrhix21FmNdx5BbiNLNON8D/pFrxyBGMd
 e7gwciI2LdnTxdE5mioiQRuswovhCUznBg5S8Op7Z3YHiNhWAYcUEQ+xTP2y2k94
 FzwTskJhFFPDGUGtNF1uvap2Y+bIbK7eEoYfaY4kXux1x6yE/UK3XkJEAXF/P6WD
 M+/e4NtBrKJVCxDIYn+JbJNbyqvaDXdFHk3UnMbH7q8FZc6Hgcb2Mse+BUsWXWAp
 Ww4yF0V2jPu8+0leYwZ5U4Ur/1X6igIA78PU3HuE+C4Q+/4OvvY+Hwb/T1DApvGE
 5zZvIR7i0RCy0Q==
X-ME-Sender: <xms:5sWlYIT_t5sZ7iR7dEo5wEp1vjkhGDFHPOX4hDkNiQlD73aRYTJbpA>
 <xme:5sWlYFx_juqk00ghLOC6Hz4xLUjsdZkpYWBoBxR3lJLx7gQpTVRx6zDhEgei82JYW
 _qoOS9-wAz5Y4aKxw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejtddgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppedvtdefrdehjedrvdduhedrkeen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurh
 gvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:5sWlYF06SQ2uPh8bUyTIQOICtLtxRs-SEMRZLuCJn1lfroAW9FNL1g>
 <xmx:5sWlYMDTPCtd6khe_S0bg8nng-ltMXTCw1qLt1FMFcQXzRJ_HpS3ig>
 <xmx:5sWlYBhtaAD6RAEvi_EmF_Ojuk3t3RopimUU5lmqRBdX6MQSQnRZWg>
 <xmx:5sWlYCV033tKzJ8B-K8DA9PcsM6tQknu06ApnuRwFgAxt6YIUeG7Xg>
Received: from mistburn.lan (203-57-215-8.dyn.iinet.net.au [203.57.215.8])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Wed, 19 May 2021 22:13:54 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-serial@vger.kernel.org
Subject: [PATCH v3 2/2] serial: 8250: Use BIT(x) for UART_{CAP,BUG}_*
Date: Thu, 20 May 2021 11:43:34 +0930
Message-Id: <20210520021334.497341-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520021334.497341-1-andrew@aj.id.au>
References: <20210520021334.497341-1-andrew@aj.id.au>
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
index 34aa2714f3c9..6473361525d1 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -7,6 +7,7 @@
  *  Copyright (C) 2001 Russell King.
  */
 
+#include <linux/bits.h>
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

