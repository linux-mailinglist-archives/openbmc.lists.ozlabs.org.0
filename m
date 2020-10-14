Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB7928D9CF
	for <lists+openbmc@lfdr.de>; Wed, 14 Oct 2020 08:08:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CB25h2R0NzDqn4
	for <lists+openbmc@lfdr.de>; Wed, 14 Oct 2020 17:08:08 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CB24b2BfSzDqnM
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2020 17:07:10 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 09E64Qjt047726;
 Wed, 14 Oct 2020 14:04:26 +0800 (GMT-8)
 (envelope-from dylan_hung@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.9) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 14 Oct
 2020 14:06:44 +0800
From: Dylan Hung <dylan_hung@aspeedtech.com>
To: <davem@davemloft.net>, <kuba@kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <ratbert@faraday-tech.com>,
 <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>
Subject: [PATCH 1/1] net: ftgmac100: Fix Aspeed ast2600 TX hang issue
Date: Wed, 14 Oct 2020 14:06:32 +0800
Message-ID: <20201014060632.16085-2-dylan_hung@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201014060632.16085-1-dylan_hung@aspeedtech.com>
References: <20201014060632.16085-1-dylan_hung@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 09E64Qjt047726
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

The new HW arbitration feature on Aspeed ast2600 will cause MAC TX to
hang when handling scatter-gather DMA.  Disable the problematic feature
by setting MAC register 0x58 bit28 and bit27.

Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
---
 drivers/net/ethernet/faraday/ftgmac100.c | 5 +++++
 drivers/net/ethernet/faraday/ftgmac100.h | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 87236206366f..00024dd41147 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -1817,6 +1817,11 @@ static int ftgmac100_probe(struct platform_device *pdev)
 		priv->rxdes0_edorr_mask = BIT(30);
 		priv->txdes0_edotr_mask = BIT(30);
 		priv->is_aspeed = true;
+		/* Disable ast2600 problematic HW arbitration */
+		if (of_device_is_compatible(np, "aspeed,ast2600-mac")) {
+			iowrite32(FTGMAC100_TM_DEFAULT,
+				  priv->base + FTGMAC100_OFFSET_TM);
+		}
 	} else {
 		priv->rxdes0_edorr_mask = BIT(15);
 		priv->txdes0_edotr_mask = BIT(15);
diff --git a/drivers/net/ethernet/faraday/ftgmac100.h b/drivers/net/ethernet/faraday/ftgmac100.h
index e5876a3fda91..63b3e02fab16 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.h
+++ b/drivers/net/ethernet/faraday/ftgmac100.h
@@ -169,6 +169,14 @@
 #define FTGMAC100_MACCR_FAST_MODE	(1 << 19)
 #define FTGMAC100_MACCR_SW_RST		(1 << 31)
 
+/*
+ * test mode control register
+ */
+#define FTGMAC100_TM_RQ_TX_VALID_DIS (1 << 28)
+#define FTGMAC100_TM_RQ_RR_IDLE_PREV (1 << 27)
+#define FTGMAC100_TM_DEFAULT                                                   \
+	(FTGMAC100_TM_RQ_TX_VALID_DIS | FTGMAC100_TM_RQ_RR_IDLE_PREV)
+
 /*
  * PHY control register
  */
-- 
2.17.1

