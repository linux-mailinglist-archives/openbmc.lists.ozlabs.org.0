Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEDB29B307
	for <lists+openbmc@lfdr.de>; Tue, 27 Oct 2020 15:52:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLF6q3PHfzDqQh
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 01:52:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=dnuOY010; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLDyK0jPzzDqMy
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 01:45:12 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 28BBE41339;
 Tue, 27 Oct 2020 14:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1603809907; x=1605624308; bh=t+z0ROLXdlZq+LG60woWFTlAjZZrXWSiFlz
 38lB2Hns=; b=dnuOY010Y8GcTiB/LbUdxqEFeuvBMbIQTtjIEwzOF32wRycWjeF
 FBJo3gz70gi5AhR2d+bVkkCRogxpaNTWbOKxl6INmLD4BcI3ervIy3uvFBsbm4ru
 kb5EYoXLvCnw4PmRLInbyqkq9ao8IareQ3AvPJXwHJThgZPKBi3O7rAg=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m3UNPvY55GaR; Tue, 27 Oct 2020 17:45:07 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id E463641314;
 Tue, 27 Oct 2020 17:45:04 +0300 (MSK)
Received: from localhost.dev.yadro.com (10.199.0.215) by
 T-EXCH-04.corp.yadro.com (172.17.100.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Tue, 27 Oct 2020 17:45:03 +0300
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Po-Yu Chuang <ratbert@faraday-tech.com>
Subject: [PATCH v2 1/2] net: ftgmac100: move phy connect out from
 ftgmac100_setup_mdio
Date: Tue, 27 Oct 2020 17:49:23 +0300
Message-ID: <20201027144924.22183-2-i.mikhaylov@yadro.com>
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

Split MDIO registration and PHY connect into ftgmac100_setup_mdio and
ftgmac100_mii_probe.

Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
---
 drivers/net/ethernet/faraday/ftgmac100.c | 104 ++++++++++++-----------
 1 file changed, 54 insertions(+), 50 deletions(-)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 87236206366f..ffad79050713 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -1044,10 +1044,39 @@ static void ftgmac100_adjust_link(struct net_device *netdev)
 	schedule_work(&priv->reset_task);
 }
 
-static int ftgmac100_mii_probe(struct ftgmac100 *priv, phy_interface_t intf)
+static int ftgmac100_mii_probe(struct net_device *netdev)
 {
-	struct net_device *netdev = priv->netdev;
+	struct ftgmac100 *priv = netdev_priv(netdev);
+	struct platform_device *pdev = to_platform_device(priv->dev);
+	struct device_node *np = pdev->dev.of_node;
 	struct phy_device *phydev;
+	phy_interface_t phy_intf;
+	int err;
+
+	/* Default to RGMII. It's a gigabit part after all */
+	err = of_get_phy_mode(np, &phy_intf);
+	if (err)
+		phy_intf = PHY_INTERFACE_MODE_RGMII;
+
+	/* Aspeed only supports these. I don't know about other IP
+	 * block vendors so I'm going to just let them through for
+	 * now. Note that this is only a warning if for some obscure
+	 * reason the DT really means to lie about it or it's a newer
+	 * part we don't know about.
+	 *
+	 * On the Aspeed SoC there are additionally straps and SCU
+	 * control bits that could tell us what the interface is
+	 * (or allow us to configure it while the IP block is held
+	 * in reset). For now I chose to keep this driver away from
+	 * those SoC specific bits and assume the device-tree is
+	 * right and the SCU has been configured properly by pinmux
+	 * or the firmware.
+	 */
+	if (priv->is_aspeed && !(phy_interface_mode_is_rgmii(phy_intf))) {
+		netdev_warn(netdev,
+			    "Unsupported PHY mode %s !\n",
+			    phy_modes(phy_intf));
+	}
 
 	phydev = phy_find_first(priv->mii_bus);
 	if (!phydev) {
@@ -1056,7 +1085,7 @@ static int ftgmac100_mii_probe(struct ftgmac100 *priv, phy_interface_t intf)
 	}
 
 	phydev = phy_connect(netdev, phydev_name(phydev),
-			     &ftgmac100_adjust_link, intf);
+			     &ftgmac100_adjust_link, phy_intf);
 
 	if (IS_ERR(phydev)) {
 		netdev_err(netdev, "%s: Could not attach to PHY\n", netdev->name);
@@ -1601,7 +1630,6 @@ static int ftgmac100_setup_mdio(struct net_device *netdev)
 {
 	struct ftgmac100 *priv = netdev_priv(netdev);
 	struct platform_device *pdev = to_platform_device(priv->dev);
-	phy_interface_t phy_intf = PHY_INTERFACE_MODE_RGMII;
 	struct device_node *np = pdev->dev.of_node;
 	int i, err = 0;
 	u32 reg;
@@ -1623,39 +1651,6 @@ static int ftgmac100_setup_mdio(struct net_device *netdev)
 		iowrite32(reg, priv->base + FTGMAC100_OFFSET_REVR);
 	}
 
-	/* Get PHY mode from device-tree */
-	if (np) {
-		/* Default to RGMII. It's a gigabit part after all */
-		err = of_get_phy_mode(np, &phy_intf);
-		if (err)
-			phy_intf = PHY_INTERFACE_MODE_RGMII;
-
-		/* Aspeed only supports these. I don't know about other IP
-		 * block vendors so I'm going to just let them through for
-		 * now. Note that this is only a warning if for some obscure
-		 * reason the DT really means to lie about it or it's a newer
-		 * part we don't know about.
-		 *
-		 * On the Aspeed SoC there are additionally straps and SCU
-		 * control bits that could tell us what the interface is
-		 * (or allow us to configure it while the IP block is held
-		 * in reset). For now I chose to keep this driver away from
-		 * those SoC specific bits and assume the device-tree is
-		 * right and the SCU has been configured properly by pinmux
-		 * or the firmware.
-		 */
-		if (priv->is_aspeed &&
-		    phy_intf != PHY_INTERFACE_MODE_RMII &&
-		    phy_intf != PHY_INTERFACE_MODE_RGMII &&
-		    phy_intf != PHY_INTERFACE_MODE_RGMII_ID &&
-		    phy_intf != PHY_INTERFACE_MODE_RGMII_RXID &&
-		    phy_intf != PHY_INTERFACE_MODE_RGMII_TXID) {
-			netdev_warn(netdev,
-				   "Unsupported PHY mode %s !\n",
-				   phy_modes(phy_intf));
-		}
-	}
-
 	priv->mii_bus->name = "ftgmac100_mdio";
 	snprintf(priv->mii_bus->id, MII_BUS_ID_SIZE, "%s-%d",
 		 pdev->name, pdev->id);
@@ -1673,29 +1668,28 @@ static int ftgmac100_setup_mdio(struct net_device *netdev)
 		goto err_register_mdiobus;
 	}
 
-	err = ftgmac100_mii_probe(priv, phy_intf);
-	if (err) {
-		dev_err(priv->dev, "MII Probe failed!\n");
-		goto err_mii_probe;
-	}
-
 	return 0;
 
-err_mii_probe:
-	mdiobus_unregister(priv->mii_bus);
 err_register_mdiobus:
 	mdiobus_free(priv->mii_bus);
 	return err;
 }
 
+static void ftgmac100_phy_disconnect(struct net_device *netdev)
+{
+	if (!netdev->phydev)
+		return;
+
+	phy_disconnect(netdev->phydev);
+}
+
 static void ftgmac100_destroy_mdio(struct net_device *netdev)
 {
 	struct ftgmac100 *priv = netdev_priv(netdev);
 
-	if (!netdev->phydev)
+	if (!priv->mii_bus)
 		return;
 
-	phy_disconnect(netdev->phydev);
 	mdiobus_unregister(priv->mii_bus);
 	mdiobus_free(priv->mii_bus);
 }
@@ -1825,14 +1819,14 @@ static int ftgmac100_probe(struct platform_device *pdev)
 	if (np && of_get_property(np, "use-ncsi", NULL)) {
 		if (!IS_ENABLED(CONFIG_NET_NCSI)) {
 			dev_err(&pdev->dev, "NCSI stack not enabled\n");
-			goto err_ncsi_dev;
+			goto err_phy_connect;
 		}
 
 		dev_info(&pdev->dev, "Using NCSI interface\n");
 		priv->use_ncsi = true;
 		priv->ndev = ncsi_register_dev(netdev, ftgmac100_ncsi_handler);
 		if (!priv->ndev)
-			goto err_ncsi_dev;
+			goto err_phy_connect;
 	} else if (np && of_get_property(np, "phy-handle", NULL)) {
 		struct phy_device *phy;
 
@@ -1860,12 +1854,19 @@ static int ftgmac100_probe(struct platform_device *pdev)
 		err = ftgmac100_setup_mdio(netdev);
 		if (err)
 			goto err_setup_mdio;
+
+		err = ftgmac100_mii_probe(netdev);
+		if (err) {
+			dev_err(priv->dev, "MII probe failed!\n");
+			goto err_ncsi_dev;
+		}
+
 	}
 
 	if (priv->is_aspeed) {
 		err = ftgmac100_setup_clk(priv);
 		if (err)
-			goto err_ncsi_dev;
+			goto err_phy_connect;
 	}
 
 	/* Default ring sizes */
@@ -1901,6 +1902,8 @@ static int ftgmac100_probe(struct platform_device *pdev)
 err_register_netdev:
 	clk_disable_unprepare(priv->rclk);
 	clk_disable_unprepare(priv->clk);
+err_phy_connect:
+	ftgmac100_phy_disconnect(netdev);
 err_ncsi_dev:
 	ftgmac100_destroy_mdio(netdev);
 err_setup_mdio:
@@ -1931,6 +1934,7 @@ static int ftgmac100_remove(struct platform_device *pdev)
 	 */
 	cancel_work_sync(&priv->reset_task);
 
+	ftgmac100_phy_disconnect(netdev);
 	ftgmac100_destroy_mdio(netdev);
 
 	iounmap(priv->base);
-- 
2.21.1

