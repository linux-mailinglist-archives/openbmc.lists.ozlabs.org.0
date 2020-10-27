Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC80029B301
	for <lists+openbmc@lfdr.de>; Tue, 27 Oct 2020 15:49:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLF3h3Gk6zDqF3
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 01:49:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=a4uiTkwL; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLDyK0mWNzDqQP
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 01:45:12 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id B934941314;
 Tue, 27 Oct 2020 14:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1603809907; x=1605624308; bh=8r8fT1hmR7P3/lh5cS89Huk+jVa85mnmOJ8
 qG/YnPok=; b=a4uiTkwLIIeBjtKuCUc/kpDOYHIo+2tOeQ7MsO9UP3EZ2HddNBD
 t4uiqwJ0ehNOrZoIORAmr9LKj3/0/ZAB8PhCaF0ubb+aPqm4AcGanXBd8/1UZfqT
 MGNCYgOuqqgxi6UFv7szkHL66KNHNe5b+hiKRV5GSxs3oik9VA12PgI8=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xPBY6Y39MVs8; Tue, 27 Oct 2020 17:45:07 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id C72F5412DF;
 Tue, 27 Oct 2020 17:45:07 +0300 (MSK)
Received: from localhost.dev.yadro.com (10.199.0.215) by
 T-EXCH-04.corp.yadro.com (172.17.100.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Tue, 27 Oct 2020 17:45:03 +0300
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Po-Yu Chuang <ratbert@faraday-tech.com>
Subject: [PATCH v2 2/2] net: ftgmac100: add handling of mdio/phy nodes for
 ast2400/2500
Date: Tue, 27 Oct 2020 17:49:24 +0300
Message-ID: <20201027144924.22183-3-i.mikhaylov@yadro.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20201027144924.22183-1-i.mikhaylov@yadro.com>
References: <20201027144924.22183-1-i.mikhaylov@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.199.0.215]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
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
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Ivan Mikhaylov <i.mikhaylov@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

phy-handle can't be handled well for ast2400/2500 which has an embedded
MDIO controller. Add ftgmac100_mdio_setup for ast2400/2500 and initialize
PHYs from mdio child node with of_mdiobus_register.

Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
---
 drivers/net/ethernet/faraday/ftgmac100.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index ffad79050713..62bafd4b22e1 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -1631,6 +1631,7 @@ static int ftgmac100_setup_mdio(struct net_device *netdev)
 	struct ftgmac100 *priv = netdev_priv(netdev);
 	struct platform_device *pdev = to_platform_device(priv->dev);
 	struct device_node *np = pdev->dev.of_node;
+	struct device_node *mdio_np;
 	int i, err = 0;
 	u32 reg;
 
@@ -1662,12 +1663,16 @@ static int ftgmac100_setup_mdio(struct net_device *netdev)
 	for (i = 0; i < PHY_MAX_ADDR; i++)
 		priv->mii_bus->irq[i] = PHY_POLL;
 
-	err = mdiobus_register(priv->mii_bus);
+	mdio_np = of_get_child_by_name(np, "mdio");
+
+	err = of_mdiobus_register(priv->mii_bus, mdio_np);
 	if (err) {
 		dev_err(priv->dev, "Cannot register MDIO bus!\n");
 		goto err_register_mdiobus;
 	}
 
+	of_node_put(mdio_np);
+
 	return 0;
 
 err_register_mdiobus:
@@ -1830,11 +1835,22 @@ static int ftgmac100_probe(struct platform_device *pdev)
 	} else if (np && of_get_property(np, "phy-handle", NULL)) {
 		struct phy_device *phy;
 
+		/* Support "mdio"/"phy" child nodes for ast2400/2500 with
+		 * an embedded MDIO controller. Automatically scan the DTS for
+		 * available PHYs and register them.
+		 */
+		if (of_device_is_compatible(np, "aspeed,ast2400-mac") ||
+		    of_device_is_compatible(np, "aspeed,ast2500-mac")) {
+			err = ftgmac100_setup_mdio(netdev);
+			if (err)
+				goto err_setup_mdio;
+		}
+
 		phy = of_phy_get_and_connect(priv->netdev, np,
 					     &ftgmac100_adjust_link);
 		if (!phy) {
 			dev_err(&pdev->dev, "Failed to connect to phy\n");
-			goto err_setup_mdio;
+			goto err_phy_connect;
 		}
 
 		/* Indicate that we support PAUSE frames (see comment in
-- 
2.21.1

