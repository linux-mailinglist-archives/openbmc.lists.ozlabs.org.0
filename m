Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1050592BD74
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2024 16:51:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJP7v5sbrz3cZB
	for <lists+openbmc@lfdr.de>; Wed, 10 Jul 2024 00:51:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJP7S21V6z2yvx
	for <openbmc@lists.ozlabs.org>; Wed, 10 Jul 2024 00:50:57 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 469EokAr029569
	for <openbmc@lists.ozlabs.org>; Tue, 9 Jul 2024 17:50:47 +0300
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 9 Jul
 2024 17:50:45 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 9 Jul
 2024 22:50:42 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 9 Jul 2024 22:50:42 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 4297A5F5B9;
	Tue,  9 Jul 2024 17:50:41 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 33357DC0BB8; Tue,  9 Jul 2024 17:50:41 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [linux dev-6.6 v1] net: stmmac: Add NCSI support for STMMAC
Date: Tue, 9 Jul 2024 17:50:39 +0300
Message-ID: <20240709145039.1910298-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
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
Cc: Marvin Lin <milkfafa@gmail.com>, Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add NCSI support for STMMAC.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |   2 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 196 ++++++++++++------
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  27 ++-
 include/linux/stmmac.h                        |   1 +
 4 files changed, 158 insertions(+), 68 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index b8c93b881a65..02db099e29b2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -332,6 +332,8 @@ struct stmmac_priv {
 	/* XDP BPF Program */
 	unsigned long *af_xdp_zc_qps;
 	struct bpf_prog *xdp_prog;
+
+	struct ncsi_dev *ncsidev;
 };
 
 enum stmmac_state {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 19c58ad8df34..d79f1ff40d39 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -50,6 +50,7 @@
 #include "dwmac1000.h"
 #include "dwxgmac2.h"
 #include "hwif.h"
+#include <net/ncsi.h>
 
 /* As long as the interface is active, we keep the timestamping counter enabled
  * with fine resolution and binary rollover. This avoid non-monotonic behavior
@@ -2937,10 +2938,12 @@ static int stmmac_init_dma_engine(struct stmmac_priv *priv)
 	if (priv->extend_desc && (priv->mode == STMMAC_RING_MODE))
 		atds = 1;
 
-	ret = stmmac_reset(priv, priv->ioaddr);
-	if (ret) {
-		dev_err(priv->device, "Failed to reset the dma\n");
-		return ret;
+	if (!priv->plat->use_ncsi) {
+		ret = stmmac_reset(priv, priv->ioaddr);
+		if (ret) {
+			dev_err(priv->device, "Failed to reset the dma\n");
+			return ret;
+		}
 	}
 
 	/* DMA Configuration */
@@ -3454,6 +3457,15 @@ static void stmmac_hw_teardown(struct net_device *dev)
 	clk_disable_unprepare(priv->plat->clk_ptp_ref);
 }
 
+static void stmmac_ncsi_handler(struct ncsi_dev *nd)
+{
+	if (unlikely(nd->state != ncsi_dev_state_functional))
+		return;
+
+	netdev_info(nd->dev, "NCSI interface %s\n",
+		    nd->link_up ? "up" : "down");
+}
+
 static void stmmac_free_irq(struct net_device *dev,
 			    enum request_irq_err irq_err, int irq_idx)
 {
@@ -3819,17 +3831,19 @@ static int __stmmac_open(struct net_device *dev,
 	if (ret < 0)
 		return ret;
 
-	if (priv->hw->pcs != STMMAC_PCS_TBI &&
-	    priv->hw->pcs != STMMAC_PCS_RTBI &&
-	    (!priv->hw->xpcs ||
-	     xpcs_get_an_mode(priv->hw->xpcs, mode) != DW_AN_C73) &&
-	    !priv->hw->lynx_pcs) {
-		ret = stmmac_init_phy(dev);
-		if (ret) {
-			netdev_err(priv->dev,
-				   "%s: Cannot attach to PHY (error: %d)\n",
-				   __func__, ret);
-			goto init_phy_error;
+	if (!priv->plat->use_ncsi) {
+		if (priv->hw->pcs != STMMAC_PCS_TBI &&
+		    priv->hw->pcs != STMMAC_PCS_RTBI &&
+		    (!priv->hw->xpcs ||
+		     xpcs_get_an_mode(priv->hw->xpcs, mode) != DW_AN_C73) &&
+		    !priv->hw->lynx_pcs) {
+			ret = stmmac_init_phy(dev);
+			if (ret) {
+				netdev_err(priv->dev,
+					   "%s: Cannot attach to PHY (error: %d)\n",
+					   __func__, ret);
+				goto init_phy_error;
+			}
 		}
 	}
 
@@ -3861,9 +3875,23 @@ static int __stmmac_open(struct net_device *dev,
 
 	stmmac_init_coalesce(priv);
 
-	phylink_start(priv->phylink);
-	/* We may have called phylink_speed_down before */
-	phylink_speed_up(priv->phylink);
+	if (priv->plat->use_ncsi) {
+		u32 ctrl;
+		stmmac_mac_flow_ctrl(priv, DUPLEX_FULL);
+		ctrl = readl(priv->ioaddr + MAC_CTRL_REG);
+		ctrl &= ~priv->hw->link.speed_mask;
+		ctrl |= priv->hw->link.speed100;
+		ctrl |= priv->hw->link.duplex;
+		writel(ctrl, priv->ioaddr + MAC_CTRL_REG);
+
+		priv->speed = SPEED_100;
+		/* If using NC-SI subsystem, set our carrier on and start the stack */
+		netif_carrier_on(dev);
+	} else {
+		phylink_start(priv->phylink);
+		/* We may have called phylink_speed_down before */
+		phylink_speed_up(priv->phylink);
+	}
 
 	ret = stmmac_request_irq(dev);
 	if (ret)
@@ -3873,17 +3901,29 @@ static int __stmmac_open(struct net_device *dev,
 	netif_tx_start_all_queues(priv->dev);
 	stmmac_enable_all_dma_irq(priv);
 
-	return 0;
+	/* Start the NCSI device */
+	if (priv->plat->use_ncsi) {
+		ret = ncsi_start_dev(priv->ncsidev);
+		if (ret) {
+			netdev_err(priv->dev, "ERROR: start the ncsi device(%d)\n",ret);
+			goto ncsi_error;
+		}
+	}
 
+	return 0;
+ncsi_error:
+	stmmac_disable_all_queues(priv);
 irq_error:
-	phylink_stop(priv->phylink);
+	if (!priv->plat->use_ncsi)
+		phylink_stop(priv->phylink);
 
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
 
 	stmmac_hw_teardown(dev);
 init_error:
-	phylink_disconnect_phy(priv->phylink);
+	if (!priv->plat->use_ncsi)
+		phylink_disconnect_phy(priv->phylink);
 init_phy_error:
 	pm_runtime_put(priv->device);
 	return ret;
@@ -3930,11 +3970,15 @@ static int stmmac_release(struct net_device *dev)
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u32 chan;
 
-	if (device_may_wakeup(priv->device))
-		phylink_speed_down(priv->phylink, false);
-	/* Stop and disconnect the PHY */
-	phylink_stop(priv->phylink);
-	phylink_disconnect_phy(priv->phylink);
+	if (priv->plat->use_ncsi) {
+		ncsi_stop_dev(priv->ncsidev);
+	} else {
+		if (device_may_wakeup(priv->device))
+			phylink_speed_down(priv->phylink, false);
+		/* Stop and disconnect the PHY */
+		phylink_stop(priv->phylink);
+		phylink_disconnect_phy(priv->phylink);
+	}
 
 	stmmac_disable_all_queues(priv);
 
@@ -6030,7 +6074,8 @@ static int stmmac_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
 	case SIOCGMIIPHY:
 	case SIOCGMIIREG:
 	case SIOCSMIIREG:
-		ret = phylink_mii_ioctl(priv->phylink, rq, cmd);
+		if (!priv->plat->use_ncsi)
+			ret = phylink_mii_ioctl(priv->phylink, rq, cmd);
 		break;
 	case SIOCSHWTSTAMP:
 		ret = stmmac_hwtstamp_set(dev, rq);
@@ -6501,6 +6546,9 @@ static int stmmac_vlan_rx_add_vid(struct net_device *ndev, __be16 proto, u16 vid
 	bool is_double = false;
 	int ret;
 
+	if (priv->plat->use_ncsi)
+		return ncsi_vlan_rx_add_vid(ndev, proto, vid);
+
 	ret = pm_runtime_resume_and_get(priv->device);
 	if (ret < 0)
 		return ret;
@@ -6532,6 +6580,9 @@ static int stmmac_vlan_rx_kill_vid(struct net_device *ndev, __be16 proto, u16 vi
 	bool is_double = false;
 	int ret;
 
+	if (priv->plat->use_ncsi)
+		return ncsi_vlan_rx_kill_vid(ndev, proto, vid);
+
 	ret = pm_runtime_resume_and_get(priv->device);
 	if (ret < 0)
 		return ret;
@@ -7354,7 +7405,9 @@ int stmmac_dvr_probe(struct device *device,
 	if (!priv->xstats.pcpu_stats)
 		return -ENOMEM;
 
-	stmmac_set_ethtool_ops(ndev);
+	if (!plat_dat->use_ncsi)
+		stmmac_set_ethtool_ops(ndev);
+
 	priv->pause = pause;
 	priv->plat = plat_dat;
 	priv->ioaddr = res->addr;
@@ -7468,6 +7521,9 @@ int stmmac_dvr_probe(struct device *device,
 	 * host DMA width for allocation and the device DMA width for
 	 * register handling.
 	 */
+	if (priv->plat->use_ncsi)
+		ndev->hw_features |= NETIF_F_HW_VLAN_CTAG_FILTER;
+
 	if (priv->plat->host_dma_width)
 		priv->dma_cap.host_dma_width = priv->plat->host_dma_width;
 	else
@@ -7576,31 +7632,45 @@ int stmmac_dvr_probe(struct device *device,
 	if (!pm_runtime_enabled(device))
 		pm_runtime_enable(device);
 
-	if (priv->hw->pcs != STMMAC_PCS_TBI &&
-	    priv->hw->pcs != STMMAC_PCS_RTBI) {
-		/* MDIO bus Registration */
-		ret = stmmac_mdio_register(ndev);
-		if (ret < 0) {
-			dev_err_probe(priv->device, ret,
-				      "%s: MDIO bus (id: %d) registration failed\n",
-				      __func__, priv->plat->bus_id);
-			goto error_mdio_register;
+	if (!priv->plat->use_ncsi) {
+		if (priv->hw->pcs != STMMAC_PCS_TBI &&
+		    priv->hw->pcs != STMMAC_PCS_RTBI) {
+			/* MDIO bus Registration */
+			ret = stmmac_mdio_register(ndev);
+			if (ret < 0) {
+				dev_err_probe(priv->device, ret,
+					      "%s: MDIO bus (id: %d) registration failed\n",
+					      __func__, priv->plat->bus_id);
+				goto error_mdio_register;
+			}
 		}
-	}
 
-	if (priv->plat->speed_mode_2500)
-		priv->plat->speed_mode_2500(ndev, priv->plat->bsp_priv);
+		if (priv->plat->speed_mode_2500)
+			priv->plat->speed_mode_2500(ndev, priv->plat->bsp_priv);
 
-	if (priv->plat->mdio_bus_data && priv->plat->mdio_bus_data->has_xpcs) {
-		ret = stmmac_xpcs_setup(priv->mii);
-		if (ret)
-			goto error_xpcs_setup;
-	}
+		if (priv->plat->mdio_bus_data && priv->plat->mdio_bus_data->has_xpcs) {
+			ret = stmmac_xpcs_setup(priv->mii);
+			if (ret)
+				goto error_xpcs_setup;
+		}
 
-	ret = stmmac_phy_setup(priv);
-	if (ret) {
-		netdev_err(ndev, "failed to setup phy (%d)\n", ret);
-		goto error_phy_setup;
+		ret = stmmac_phy_setup(priv);
+		if (ret) {
+			netdev_err(ndev, "failed to setup phy (%d)\n", ret);
+			goto error_phy_setup;
+		}
+	} else {
+		if (!IS_ENABLED(CONFIG_NET_NCSI)) {
+			netdev_err(priv->dev, "CONFIG_NET_NCSI not enabled\n");
+			goto error_phy_setup;
+		}
+		dev_info(priv->device, "register NCSI dev\n");
+		priv->ncsidev = ncsi_register_dev(priv->dev,
+						   stmmac_ncsi_handler);
+		if (!priv->ncsidev)
+			goto error_phy_setup;
+
+		dev_info(priv->device, "Using NCSI interface\n");
 	}
 
 	ret = register_netdev(ndev);
@@ -7625,12 +7695,14 @@ int stmmac_dvr_probe(struct device *device,
 	return ret;
 
 error_netdev_register:
-	phylink_destroy(priv->phylink);
+	if (!priv->plat->use_ncsi)
+		phylink_destroy(priv->phylink);
 error_xpcs_setup:
 error_phy_setup:
-	if (priv->hw->pcs != STMMAC_PCS_TBI &&
-	    priv->hw->pcs != STMMAC_PCS_RTBI)
-		stmmac_mdio_unregister(ndev);
+	if (!priv->plat->use_ncsi)
+		if (priv->hw->pcs != STMMAC_PCS_TBI &&
+		    priv->hw->pcs != STMMAC_PCS_RTBI)
+			stmmac_mdio_unregister(ndev);
 error_mdio_register:
 	stmmac_napi_del(ndev);
 error_hw_init:
@@ -7728,15 +7800,17 @@ int stmmac_suspend(struct device *dev)
 
 	mutex_unlock(&priv->lock);
 
-	rtnl_lock();
-	if (device_may_wakeup(priv->device) && priv->plat->pmt) {
-		phylink_suspend(priv->phylink, true);
-	} else {
-		if (device_may_wakeup(priv->device))
-			phylink_speed_down(priv->phylink, false);
-		phylink_suspend(priv->phylink, false);
+	if (!priv->plat->use_ncsi) {
+		rtnl_lock();
+		if (device_may_wakeup(priv->device) && priv->plat->pmt) {
+			phylink_suspend(priv->phylink, true);
+		} else {
+			if (device_may_wakeup(priv->device))
+				phylink_speed_down(priv->phylink, false);
+			phylink_suspend(priv->phylink, false);
+		}
+		rtnl_unlock();
 	}
-	rtnl_unlock();
 
 	if (priv->dma_cap.fpesel) {
 		/* Disable FPE */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 30d5e635190e..8865a74b6f32 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -417,17 +417,30 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		eth_zero_addr(mac);
 	}
 
-	phy_mode = device_get_phy_mode(&pdev->dev);
-	if (phy_mode < 0)
-		return ERR_PTR(phy_mode);
+	if (of_get_property(pdev->dev.of_node, "use-ncsi", NULL)) {
+		plat->use_ncsi = true;
+		plat->has_xgmac = 0;
+		plat->has_gmac4 = 0;
+		plat->has_gmac = 0;
+	}
+	else
+		plat->use_ncsi = false;
 
-	plat->phy_interface = phy_mode;
+	if (!plat->use_ncsi) {
+		phy_mode = device_get_phy_mode(&pdev->dev);
+		if (phy_mode < 0)
+			return ERR_PTR(phy_mode);
+
+		plat->phy_interface = phy_mode;
+	}
 	rc = stmmac_of_get_mac_mode(np);
 	plat->mac_interface = rc < 0 ? plat->phy_interface : rc;
 
-	/* Some wrapper drivers still rely on phy_node. Let's save it while
-	 * they are not converted to phylink. */
-	plat->phy_node = of_parse_phandle(np, "phy-handle", 0);
+	if (!plat->use_ncsi) {
+		/* Some wrapper drivers still rely on phy_node. Let's save it while
+		 * they are not converted to phylink. */
+		plat->phy_node = of_parse_phandle(np, "phy-handle", 0);
+	}
 
 	/* PHYLINK automatically parses the phy-handle property */
 	plat->port_node = of_fwnode_handle(np);
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 5acb77968902..3e948e685ada 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -285,6 +285,7 @@ struct plat_stmmacenet_data {
 			   void *ctx);
 	void (*dump_debug_regs)(void *priv);
 	void *bsp_priv;
+	int use_ncsi;
 	struct clk *stmmac_clk;
 	struct clk *pclk;
 	struct clk *clk_ptp_ref;
-- 
2.34.1

