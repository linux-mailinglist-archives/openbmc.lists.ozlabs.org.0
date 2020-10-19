Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B69D292444
	for <lists+openbmc@lfdr.de>; Mon, 19 Oct 2020 11:05:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CF9nl36TmzDqRv
	for <lists+openbmc@lfdr.de>; Mon, 19 Oct 2020 20:05:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=dylan_hung@aspeedtech.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CF9dJ71B1zDqZq;
 Mon, 19 Oct 2020 19:57:56 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 09J8sp8m046775;
 Mon, 19 Oct 2020 16:54:51 +0800 (GMT-8)
 (envelope-from dylan_hung@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.9) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 19 Oct
 2020 16:57:27 +0800
From: Dylan Hung <dylan_hung@aspeedtech.com>
To: <davem@davemloft.net>, <kuba@kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <ratbert@faraday-tech.com>,
 <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>
Subject: [PATCH 3/4] ftgmac100: Add a dummy read to ensure running sequence
Date: Mon, 19 Oct 2020 16:57:16 +0800
Message-ID: <20201019085717.32413-4-dylan_hung@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201019085717.32413-1-dylan_hung@aspeedtech.com>
References: <20201019085717.32413-1-dylan_hung@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 09J8sp8m046775
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
Cc: BMC-SW@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On the AST2600 care must be taken to ensure writes appear correctly when
modifying the interrupt reglated registers.

Add a function to perform a read after all writes to the IER and ISR registers.

Fixes: 39bfab8844a0 ("net: ftgmac100: Add support for DT phy-handle property")
Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/net/ethernet/faraday/ftgmac100.c | 38 ++++++++++++------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 810bda80f138..0c67fc3e27df 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -111,6 +111,14 @@ struct ftgmac100 {
 	bool is_aspeed;
 };
 
+/* Helper to ensure writes are observed with the correct ordering. Use only
+ * for IER and ISR accesses. */
+static void ftgmac100_write(u32 val, void __iomem *addr)
+{
+	iowrite32(val, addr);
+	ioread32(addr);
+}
+
 static int ftgmac100_reset_mac(struct ftgmac100 *priv, u32 maccr)
 {
 	struct net_device *netdev = priv->netdev;
@@ -1048,7 +1056,7 @@ static void ftgmac100_adjust_link(struct net_device *netdev)
 		return;
 
 	/* Disable all interrupts */
-	iowrite32(0, priv->base + FTGMAC100_OFFSET_IER);
+	ftgmac100_write(0, priv->base + FTGMAC100_OFFSET_IER);
 
 	/* Reset the adapter asynchronously */
 	schedule_work(&priv->reset_task);
@@ -1246,7 +1254,7 @@ static irqreturn_t ftgmac100_interrupt(int irq, void *dev_id)
 
 	/* Fetch and clear interrupt bits, process abnormal ones */
 	status = ioread32(priv->base + FTGMAC100_OFFSET_ISR);
-	iowrite32(status, priv->base + FTGMAC100_OFFSET_ISR);
+	ftgmac100_write(status, priv->base + FTGMAC100_OFFSET_ISR);
 	if (unlikely(status & FTGMAC100_INT_BAD)) {
 
 		/* RX buffer unavailable */
@@ -1266,7 +1274,7 @@ static irqreturn_t ftgmac100_interrupt(int irq, void *dev_id)
 			if (net_ratelimit())
 				netdev_warn(netdev,
 					   "AHB bus error ! Resetting chip.\n");
-			iowrite32(0, priv->base + FTGMAC100_OFFSET_IER);
+			ftgmac100_write(0, priv->base + FTGMAC100_OFFSET_IER);
 			schedule_work(&priv->reset_task);
 			return IRQ_HANDLED;
 		}
@@ -1281,7 +1289,7 @@ static irqreturn_t ftgmac100_interrupt(int irq, void *dev_id)
 	}
 
 	/* Only enable "bad" interrupts while NAPI is on */
-	iowrite32(new_mask, priv->base + FTGMAC100_OFFSET_IER);
+	ftgmac100_write(new_mask, priv->base + FTGMAC100_OFFSET_IER);
 
 	/* Schedule NAPI bh */
 	napi_schedule_irqoff(&priv->napi);
@@ -1320,8 +1328,7 @@ static int ftgmac100_poll(struct napi_struct *napi, int budget)
 		ftgmac100_start_hw(priv);
 
 		/* Re-enable "bad" interrupts */
-		iowrite32(FTGMAC100_INT_BAD,
-			  priv->base + FTGMAC100_OFFSET_IER);
+		ftgmac100_write(FTGMAC100_INT_BAD, priv->base + FTGMAC100_OFFSET_IER);
 	}
 
 	/* As long as we are waiting for transmit packets to be
@@ -1336,13 +1343,7 @@ static int ftgmac100_poll(struct napi_struct *napi, int budget)
 		 * they were masked. So we clear them first, then we need
 		 * to re-check if there's something to process
 		 */
-		iowrite32(FTGMAC100_INT_RXTX,
-			  priv->base + FTGMAC100_OFFSET_ISR);
-
-		/* Push the above (and provides a barrier vs. subsequent
-		 * reads of the descriptor).
-		 */
-		ioread32(priv->base + FTGMAC100_OFFSET_ISR);
+		ftgmac100_write(FTGMAC100_INT_RXTX, priv->base + FTGMAC100_OFFSET_ISR);
 
 		/* Check RX and TX descriptors for more work to do */
 		if (ftgmac100_check_rx(priv) ||
@@ -1353,8 +1354,7 @@ static int ftgmac100_poll(struct napi_struct *napi, int budget)
 		napi_complete(napi);
 
 		/* enable all interrupts */
-		iowrite32(FTGMAC100_INT_ALL,
-			  priv->base + FTGMAC100_OFFSET_IER);
+		ftgmac100_write(FTGMAC100_INT_ALL, priv->base + FTGMAC100_OFFSET_IER);
 	}
 
 	return work_done;
@@ -1382,7 +1382,7 @@ static int ftgmac100_init_all(struct ftgmac100 *priv, bool ignore_alloc_err)
 	netif_start_queue(priv->netdev);
 
 	/* Enable all interrupts */
-	iowrite32(FTGMAC100_INT_ALL, priv->base + FTGMAC100_OFFSET_IER);
+	ftgmac100_write(FTGMAC100_INT_ALL, priv->base + FTGMAC100_OFFSET_IER);
 
 	return err;
 }
@@ -1508,7 +1508,7 @@ static int ftgmac100_open(struct net_device *netdev)
  err_irq:
 	netif_napi_del(&priv->napi);
  err_hw:
-	iowrite32(0, priv->base + FTGMAC100_OFFSET_IER);
+	ftgmac100_write(0, priv->base + FTGMAC100_OFFSET_IER);
 	ftgmac100_free_rings(priv);
 	return err;
 }
@@ -1526,7 +1526,7 @@ static int ftgmac100_stop(struct net_device *netdev)
 	 */
 
 	/* disable all interrupts */
-	iowrite32(0, priv->base + FTGMAC100_OFFSET_IER);
+	ftgmac100_write(0, priv->base + FTGMAC100_OFFSET_IER);
 
 	netif_stop_queue(netdev);
 	napi_disable(&priv->napi);
@@ -1549,7 +1549,7 @@ static void ftgmac100_tx_timeout(struct net_device *netdev, unsigned int txqueue
 	struct ftgmac100 *priv = netdev_priv(netdev);
 
 	/* Disable all interrupts */
-	iowrite32(0, priv->base + FTGMAC100_OFFSET_IER);
+	ftgmac100_write(0, priv->base + FTGMAC100_OFFSET_IER);
 
 	/* Do the reset outside of interrupt context */
 	schedule_work(&priv->reset_task);
-- 
2.17.1

