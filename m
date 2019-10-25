Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C11E41C3
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 04:48:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zpT62pqhzDql8
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 13:48:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zpSD1Q3rzDqZj;
 Fri, 25 Oct 2019 13:47:39 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x9P2lPkV002163;
 Thu, 24 Oct 2019 21:47:26 -0500
Message-ID: <572a7d510ace5e5a5ba41c4774d330133291c82a.camel@kernel.crashing.org>
Subject: [PATCH] net: ethernet: ftgmac100: Fix DMA coherency issue with SW
 checksum
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: "David S. Miller" <davem@davemloft.net>
Date: Fri, 25 Oct 2019 13:47:24 +1100
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linux-aspeed@lists.ozlabs.org, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

We are calling the checksum helper after the dma_map_single()
call to map the packet. This is incorrect as the checksumming
code will touch the packet from the CPU. This means the cache
won't be properly flushes (or the bounce buffering will leave
us with the unmodified packet to DMA).

This moves the calculation of the checksum & vlan tags to
before the DMA mapping.

This also has the side effect of fixing another bug: If the
checksum helper fails, we goto "drop" to drop the packet, which
will not unmap the DMA mapping.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Fixes: 05690d633f30 ftgmac100: Upgrade to NETIF_F_HW_CSUM
CC: stable@vger.kernel.org [v4.12+]
---
 drivers/net/ethernet/faraday/ftgmac100.c | 25 ++++++++++++------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 9b7af94a40bb..96e9565f1e08 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -727,6 +727,18 @@ static netdev_tx_t ftgmac100_hard_start_xmit(struct sk_buff *skb,
 	 */
 	nfrags = skb_shinfo(skb)->nr_frags;
 
+	/* Setup HW checksumming */
+	csum_vlan = 0;
+	if (skb->ip_summed == CHECKSUM_PARTIAL &&
+	    !ftgmac100_prep_tx_csum(skb, &csum_vlan))
+		goto drop;
+
+	/* Add VLAN tag */
+	if (skb_vlan_tag_present(skb)) {
+		csum_vlan |= FTGMAC100_TXDES1_INS_VLANTAG;
+		csum_vlan |= skb_vlan_tag_get(skb) & 0xffff;
+	}
+
 	/* Get header len */
 	len = skb_headlen(skb);
 
@@ -753,19 +765,6 @@ static netdev_tx_t ftgmac100_hard_start_xmit(struct sk_buff *skb,
 	if (nfrags == 0)
 		f_ctl_stat |= FTGMAC100_TXDES0_LTS;
 	txdes->txdes3 = cpu_to_le32(map);
-
-	/* Setup HW checksumming */
-	csum_vlan = 0;
-	if (skb->ip_summed == CHECKSUM_PARTIAL &&
-	    !ftgmac100_prep_tx_csum(skb, &csum_vlan))
-		goto drop;
-
-	/* Add VLAN tag */
-	if (skb_vlan_tag_present(skb)) {
-		csum_vlan |= FTGMAC100_TXDES1_INS_VLANTAG;
-		csum_vlan |= skb_vlan_tag_get(skb) & 0xffff;
-	}
-
 	txdes->txdes1 = cpu_to_le32(csum_vlan);
 
 	/* Next descriptor */


