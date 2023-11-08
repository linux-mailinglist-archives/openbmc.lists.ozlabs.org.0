Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A217E6054
	for <lists+openbmc@lfdr.de>; Wed,  8 Nov 2023 23:06:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=Wxvq3Oet;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SQfLv2mZvz3vt0
	for <lists+openbmc@lfdr.de>; Thu,  9 Nov 2023 09:06:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=Wxvq3Oet;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQf1p41XTz3vgV
	for <openbmc@lists.ozlabs.org>; Thu,  9 Nov 2023 08:51:58 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:7e5d:5300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id ABB994AA;
	Wed,  8 Nov 2023 13:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1699480312;
	bh=ce+e/cLGrXRo9aIQWFbzk2+wy+ScHzyTz/gaOCm0ezQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Wxvq3Oet+D8+JH2yvGtysja1culrzUhWyXyfy/0IjGFQl1ufVgJS3u37/qsyy50GF
	 BOHY6ReJW5q7hAnA1XeRfed9ScrIQBVjwjMTZNkw2XM8H76hj/5hywW/QyF14opprI
	 i9RooLZZpX678g/HmBCaZAHhw2gU+YC+IHRdcsOg=
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH linux dev-6.5] net: ftgmac100: support getting MAC address from NVMEM
Date: Wed,  8 Nov 2023 13:50:51 -0800
Message-ID: <20231108215050.11121-2-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.42.0
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
Cc: Paul Fertser <fercerpav@gmail.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Paul Fertser <fercerpav@gmail.com>

Make use of of_get_ethdev_address() to support reading MAC address not
only from the usual DT nodes but also from an NVMEM provider (e.g. using
a dedicated area in an FRU EEPROM).

Signed-off-by: Paul Fertser <fercerpav@gmail.com>
Link: https://lore.kernel.org/r/20230713095743.30517-1-fercerpav@gmail.com
Signed-off-by: Paolo Abeni <pabeni@redhat.com>
(cherry picked from commit 2cee73cef253a333c7d48a0f8edda53e3cca990c)
---
 drivers/net/ethernet/faraday/ftgmac100.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 0e7fd1a6299f..27d2e2311bad 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -177,16 +177,20 @@ static void ftgmac100_write_mac_addr(struct ftgmac100 *priv, const u8 *mac)
 	iowrite32(laddr, priv->base + FTGMAC100_OFFSET_MAC_LADR);
 }
 
-static void ftgmac100_initial_mac(struct ftgmac100 *priv)
+static int ftgmac100_initial_mac(struct ftgmac100 *priv)
 {
 	u8 mac[ETH_ALEN];
 	unsigned int m;
 	unsigned int l;
+	int err;
 
-	if (!device_get_ethdev_address(priv->dev, priv->netdev)) {
+	err = of_get_ethdev_address(priv->dev->of_node, priv->netdev);
+	if (err == -EPROBE_DEFER)
+		return err;
+	if (!err) {
 		dev_info(priv->dev, "Read MAC address %pM from device tree\n",
 			 priv->netdev->dev_addr);
-		return;
+		return 0;
 	}
 
 	m = ioread32(priv->base + FTGMAC100_OFFSET_MAC_MADR);
@@ -207,6 +211,8 @@ static void ftgmac100_initial_mac(struct ftgmac100 *priv)
 		dev_info(priv->dev, "Generated random MAC address %pM\n",
 			 priv->netdev->dev_addr);
 	}
+
+	return 0;
 }
 
 static int ftgmac100_set_mac_addr(struct net_device *dev, void *p)
@@ -1853,7 +1859,9 @@ static int ftgmac100_probe(struct platform_device *pdev)
 	priv->aneg_pause = true;
 
 	/* MAC address from chip or random one */
-	ftgmac100_initial_mac(priv);
+	err = ftgmac100_initial_mac(priv);
+	if (err)
+		goto err_phy_connect;
 
 	np = pdev->dev.of_node;
 	if (np && (of_device_is_compatible(np, "aspeed,ast2400-mac") ||
-- 
2.42.0

