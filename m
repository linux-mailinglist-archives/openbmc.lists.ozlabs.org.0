Return-Path: <openbmc+bounces-336-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C230FB035D7
	for <lists+openbmc@lfdr.de>; Mon, 14 Jul 2025 07:36:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bgWJH2NFrz3brB;
	Mon, 14 Jul 2025 15:35:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752471358;
	cv=none; b=Ldv5T3iPTYEJiCf2xeqtHoKTOWC1Bzi1p1um0MYRRgiCTwm4iFRfKLZQepBUdlzwnxD3c1hNRiRwvDY0x2h/7yXFj+50NEq98Ij7UhAc9BmqgnOBIxVjSaCjkRFmQrekpsn0c5spB0NYM2tcPfpqb2w9Hmj8DPuazCZ1Lx8S4Niu8fsUbB1c0RGsBZeYawEwNBnsskC0x+1H71fDHKVxQ38axVIZ0BssBLUxcJn5KbbFsWhNLscj0jUYtNtaqwLIHd+x/RntDwQMlXbRYolAtbYRY9JlicYOw5on9ccB/xPuR9frJr7fGm6wOmPvv/nauQ/NcYG4Ppgp6roQZmjtdg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752471358; c=relaxed/relaxed;
	bh=/L7P3oE1hGMJob/q7nnm2/8i/ZXnhCgY+G2gViu30n8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PRiyucYKZdIKCyiWPQueZRnMfYtjzBlKp/mSW6L0D3hQYfSErjiaH+EVx9WrRc0u8SOjQvCKyozEBTC4TVW2PeHf+7g14fFv94UqNhueqW96D1mjpqSNjoltM8LP3GeqJmHea6z2LfcRORZBiPAka/7V4njilap0z8nTmTVeZ5VhFxj5bwxxkdU7Usqtn7cLQBRAvQaT2whRsnO4vgRN2AQMJ+l1wxXoznzuviHVS/oQP1UySx2Nu1tpIVMHwd3A3R8wTP9I/l0Rbplfui0nEqX6jCNEDbT1qQmBZczz/s/AJg02CIg7BdvyBw7kbFdy/KLUT897jNkYSrjjQb93/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gosoluDj; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=milkfafa@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gosoluDj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=milkfafa@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bgWJD0sgxz3bmY
	for <openbmc@lists.ozlabs.org>; Mon, 14 Jul 2025 15:35:55 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-73c17c770a7so4753167b3a.2
        for <openbmc@lists.ozlabs.org>; Sun, 13 Jul 2025 22:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752471352; x=1753076152; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/L7P3oE1hGMJob/q7nnm2/8i/ZXnhCgY+G2gViu30n8=;
        b=gosoluDjFl3CMHdgCW/0/CcOJfKJiOTV+818ZzrWhM5fn6ww5kVlTXeZWoC4MMbdXJ
         qQXnRT0iED3GjZLDsM4+l4nRY2jct26n9YfyGnvvGiQ9joMKXGCsVeBNigTw8y50S2+N
         g3qFGU4OEoLbQ9EACYPJc/tdyCQDJDFc8XkUoKMdG7DAUDjz6eiZcoF4pb80EqS3NbiB
         D6fBuTGwGP6Dr+tmV1OUifgLKnJ4Gy6dB4MLuLp7jTXq/dM8GKPB3y3cddW2wYXY3q++
         BaJLc+jzY3LMN9HtyE6cnRhOAxhpXXxXljMAyaA5p1nqKEGQFnYpPuEUEL1b2JmLOgzk
         uIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752471352; x=1753076152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/L7P3oE1hGMJob/q7nnm2/8i/ZXnhCgY+G2gViu30n8=;
        b=bdq9m1aaWWhXcNNTexehb5Q3OGX3rC4L/IFn+PPUivrjCNoNMWSKsVkTe1EUiC9bID
         XBO7gUw8Mjn8q/aFvpKHPdztYT1Q5jAasYBHdGDVfHQ6eZT+NTCGB/GLToEC5YRDJlEI
         9RIo/kD1R42rSxAwrPcf2OzZjYD5GS1JrxyQlMaEHWiePT5WxU4DiALr1c+JfB58on1z
         zlqPVPEffldDXT9XbNJ3D0yuniQD4vMIwIzNG5+3Euh2uKjw5s3KuPVjtmcVO+5aF4PQ
         UylgNUiun+IHGiLtW/eBqpxZDEQj23kQyNKVRzkpGqsn5fkgS0p7r2Z2oV8qGgojLKTI
         ISeg==
X-Forwarded-Encrypted: i=1; AJvYcCV22vPyL9dI1DNgjwM3A0YuCY9KZXr8629T5ge+1qOSfAu8dh7FynhsBvN8N7spRWVIMU8xwoU2@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx17tcRhFcK1/ajIHeAjhglJpDUxD32/Qb/9/Uh7dD+c0DpR8Nb
	dB5xLXCqwIIIANNWcYBnXT+oaBfuFvPN/1mc058qkfg3HWzDjm1AlZk5
X-Gm-Gg: ASbGncs+XTYiXkFkxxFMxJVwqJEXc+zUPM7HC3eeuNhIGfynTHQjsQ1d5sKWxWS+9ST
	dghsoS5U9omFWu0RL4rSbKUKsJPNgFTsgFetvKthwUskLL6O35a1ICd1VqpqQVC6QnhrfJz85KM
	9awYqwBrx+5bnnkh1oyfBTHI5aZT7P16usyG0IYNBIdI44cgm5T9v4MpYdkzTyxzg901zU/4dE3
	Zn1kyW0G4ur43962YCGZ38oO3myklkE9b6E1v1bqv75cYURfAa1WsBRT7peZMc9G7nK2vMcMtfh
	XbLrT8+KeHv1645rwppSdD0qXcV32u5F1pwaOTV/hBsEerE51v+yL7bji5ujh3jhuXj9+v3JcMl
	53tZ/fo6mowmu+Oa0a7wVuWQbVRYrzGgf0xSp7u3z/Ua2oOp44wN1Xsm1LK4HQQ==
X-Google-Smtp-Source: AGHT+IGYbAKtgDLV5NK0ycsP7CBdgSQY5Ow6NeAjujS3go2updOBJ+OdCtl0cFGcZJwkgawkH+4GqQ==
X-Received: by 2002:a05:6a00:a1f:b0:736:a8db:93b4 with SMTP id d2e1a72fcca58-74ee04a9b48mr14846762b3a.2.1752471352312;
        Sun, 13 Jul 2025 22:35:52 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e14e9bsm9313078b3a.49.2025.07.13.22.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 22:35:51 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	openbmc@lists.ozlabs.org,
	KWLIU@nuvoton.com,
	tmaimon77@gmail.com,
	kflin@nuvoton.com,
	Marvin Lin <milkfafa@gmail.com>
Subject: [PATCH] net: stmmac: Add NCSI support
Date: Mon, 14 Jul 2025 13:35:27 +0800
Message-Id: <20250714053527.767380-1-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The NCSI is defined as the interface between BMC and Network
Controller on Host side. The interface is responsible for providing
external network connectivity for BMC.

This patch adds support for NCSI that registers and starts NCSI
device, it also skips PHY-related operations if use-ncsi property is
defined in the DTS.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |   2 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 166 +++++++++++++-----
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  27 ++-
 include/linux/stmmac.h                        |   1 +
 4 files changed, 142 insertions(+), 54 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index cda09cf5dcca..9dc386e0bc6b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -365,6 +365,8 @@ struct stmmac_priv {
 	/* XDP BPF Program */
 	unsigned long *af_xdp_zc_qps;
 	struct bpf_prog *xdp_prog;
+
+	struct ncsi_dev *ncsidev;
 };
 
 enum stmmac_state {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b948df1bff9a..dfe3e588ffb2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -51,6 +51,7 @@
 #include "dwmac1000.h"
 #include "dwxgmac2.h"
 #include "hwif.h"
+#include <net/ncsi.h>
 
 /* As long as the interface is active, we keep the timestamping counter enabled
  * with fine resolution and binary rollover. This avoid non-monotonic behavior
@@ -3131,10 +3132,12 @@ static int stmmac_init_dma_engine(struct stmmac_priv *priv)
 	if (priv->extend_desc && (priv->mode == STMMAC_RING_MODE))
 		priv->plat->dma_cfg->atds = 1;
 
-	ret = stmmac_reset(priv, priv->ioaddr);
-	if (ret) {
-		netdev_err(priv->dev, "Failed to reset the dma\n");
-		return ret;
+	if (!priv->plat->use_ncsi) {
+		ret = stmmac_reset(priv, priv->ioaddr);
+		if (ret) {
+			netdev_err(priv->dev, "Failed to reset the dma\n");
+			return ret;
+		}
 	}
 
 	/* DMA Configuration */
@@ -3643,6 +3646,14 @@ static void stmmac_hw_teardown(struct net_device *dev)
 	clk_disable_unprepare(priv->plat->clk_ptp_ref);
 }
 
+static void stmmac_ncsi_handler(struct ncsi_dev *nd)
+{
+	if (unlikely(nd->state != ncsi_dev_state_functional))
+		return;
+
+	netdev_info(nd->dev, "NCSI interface %s\n", nd->link_up ? "up" : "down");
+}
+
 static void stmmac_free_irq(struct net_device *dev,
 			    enum request_irq_err irq_err, int irq_idx)
 {
@@ -4046,14 +4057,16 @@ static int __stmmac_open(struct net_device *dev,
 	if (ret < 0)
 		return ret;
 
-	if ((!priv->hw->xpcs ||
-	     xpcs_get_an_mode(priv->hw->xpcs, mode) != DW_AN_C73)) {
-		ret = stmmac_init_phy(dev);
-		if (ret) {
-			netdev_err(priv->dev,
-				   "%s: Cannot attach to PHY (error: %d)\n",
-				   __func__, ret);
-			goto init_phy_error;
+	if (!priv->plat->use_ncsi) {
+		if ((!priv->hw->xpcs ||
+		     xpcs_get_an_mode(priv->hw->xpcs, mode) != DW_AN_C73)) {
+			ret = stmmac_init_phy(dev);
+			if (ret) {
+				netdev_err(priv->dev,
+					   "%s: Cannot attach to PHY (error: %d)\n",
+					   __func__, ret);
+				goto init_phy_error;
+			}
 		}
 	}
 
@@ -4082,9 +4095,23 @@ static int __stmmac_open(struct net_device *dev,
 
 	stmmac_init_coalesce(priv);
 
-	phylink_start(priv->phylink);
-	/* We may have called phylink_speed_down before */
-	phylink_speed_up(priv->phylink);
+	if (priv->plat->use_ncsi) {
+		u32 ctrl;
+
+		stmmac_mac_flow_ctrl(priv, DUPLEX_FULL, FLOW_AUTO);
+		ctrl = readl(priv->ioaddr + MAC_CTRL_REG);
+		ctrl &= ~priv->hw->link.speed_mask;
+		ctrl |= priv->hw->link.speed100;
+		ctrl |= priv->hw->link.duplex;
+		writel(ctrl, priv->ioaddr + MAC_CTRL_REG);
+
+		/* If using NC-SI subsystem, set our carrier on and start the stack */
+		netif_carrier_on(dev);
+	} else {
+		phylink_start(priv->phylink);
+		/* We may have called phylink_speed_down before */
+		phylink_speed_up(priv->phylink);
+	}
 
 	ret = stmmac_request_irq(dev);
 	if (ret)
@@ -4094,17 +4121,29 @@ static int __stmmac_open(struct net_device *dev,
 	netif_tx_start_all_queues(priv->dev);
 	stmmac_enable_all_dma_irq(priv);
 
-	return 0;
+	/* Start the NCSI device */
+	if (priv->plat->use_ncsi) {
+		ret = ncsi_start_dev(priv->ncsidev);
+		if (ret) {
+			netdev_err(priv->dev, "ERROR: start the ncsi device(%d)\n", ret);
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
@@ -4139,11 +4178,15 @@ static int stmmac_release(struct net_device *dev)
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
 
@@ -6230,7 +6273,8 @@ static int stmmac_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
 	case SIOCGMIIPHY:
 	case SIOCGMIIREG:
 	case SIOCSMIIREG:
-		ret = phylink_mii_ioctl(priv->phylink, rq, cmd);
+		if (!priv->plat->use_ncsi)
+			ret = phylink_mii_ioctl(priv->phylink, rq, cmd);
 		break;
 	default:
 		break;
@@ -6691,6 +6735,9 @@ static int stmmac_vlan_rx_add_vid(struct net_device *ndev, __be16 proto, u16 vid
 	bool is_double = false;
 	int ret;
 
+	if (priv->plat->use_ncsi)
+		return ncsi_vlan_rx_add_vid(ndev, proto, vid);
+
 	ret = pm_runtime_resume_and_get(priv->device);
 	if (ret < 0)
 		return ret;
@@ -6725,6 +6772,9 @@ static int stmmac_vlan_rx_kill_vid(struct net_device *ndev, __be16 proto, u16 vi
 	bool is_double = false;
 	int ret;
 
+	if (priv->plat->use_ncsi)
+		return ncsi_vlan_rx_kill_vid(ndev, proto, vid);
+
 	ret = pm_runtime_resume_and_get(priv->device);
 	if (ret < 0)
 		return ret;
@@ -7504,7 +7554,9 @@ int stmmac_dvr_probe(struct device *device,
 	if (!priv->xstats.pcpu_stats)
 		return -ENOMEM;
 
-	stmmac_set_ethtool_ops(ndev);
+	if (!plat_dat->use_ncsi)
+		stmmac_set_ethtool_ops(ndev);
+
 	priv->pause_time = pause;
 	priv->plat = plat_dat;
 	priv->ioaddr = res->addr;
@@ -7619,6 +7671,9 @@ int stmmac_dvr_probe(struct device *device,
 	 * host DMA width for allocation and the device DMA width for
 	 * register handling.
 	 */
+	if (priv->plat->use_ncsi)
+		ndev->hw_features |= NETIF_F_HW_VLAN_CTAG_FILTER;
+
 	if (priv->plat->host_dma_width)
 		priv->dma_cap.host_dma_width = priv->plat->host_dma_width;
 	else
@@ -7728,22 +7783,35 @@ int stmmac_dvr_probe(struct device *device,
 	if (!pm_runtime_enabled(device))
 		pm_runtime_enable(device);
 
-	ret = stmmac_mdio_register(ndev);
-	if (ret < 0) {
-		dev_err_probe(priv->device, ret,
-			      "MDIO bus (id: %d) registration failed\n",
-			      priv->plat->bus_id);
-		goto error_mdio_register;
-	}
+	if (!priv->plat->use_ncsi) {
+		ret = stmmac_mdio_register(ndev);
+		if (ret < 0) {
+			dev_err_probe(priv->device, ret,
+				      "MDIO bus (id: %d) registration failed\n",
+				      priv->plat->bus_id);
+			goto error_mdio_register;
+		}
 
-	ret = stmmac_pcs_setup(ndev);
-	if (ret)
-		goto error_pcs_setup;
+		ret = stmmac_pcs_setup(ndev);
+		if (ret)
+			goto error_pcs_setup;
 
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
+		priv->ncsidev = ncsi_register_dev(priv->dev, stmmac_ncsi_handler);
+		if (!priv->ncsidev)
+			goto error_phy_setup;
+
+		dev_info(priv->device, "Using NCSI interface\n");
 	}
 
 	ret = register_netdev(ndev);
@@ -7768,9 +7836,11 @@ int stmmac_dvr_probe(struct device *device,
 	return ret;
 
 error_netdev_register:
-	phylink_destroy(priv->phylink);
+	if (!priv->plat->use_ncsi)
+		phylink_destroy(priv->phylink);
 error_phy_setup:
-	stmmac_pcs_clean(ndev);
+	if (!priv->plat->use_ncsi)
+		stmmac_pcs_clean(ndev);
 error_pcs_setup:
 	stmmac_mdio_unregister(ndev);
 error_mdio_register:
@@ -7868,13 +7938,15 @@ int stmmac_suspend(struct device *dev)
 
 	mutex_unlock(&priv->lock);
 
-	rtnl_lock();
-	if (device_may_wakeup(priv->device) && !priv->plat->pmt)
-		phylink_speed_down(priv->phylink, false);
+	if (!priv->plat->use_ncsi) {
+		rtnl_lock();
+		if (device_may_wakeup(priv->device) && !priv->plat->pmt)
+			phylink_speed_down(priv->phylink, false);
 
-	phylink_suspend(priv->phylink,
-			device_may_wakeup(priv->device) && priv->plat->pmt);
-	rtnl_unlock();
+		phylink_suspend(priv->phylink,
+				device_may_wakeup(priv->device) && priv->plat->pmt);
+		rtnl_unlock();
+	}
 
 	if (stmmac_fpe_supported(priv))
 		ethtool_mmsv_stop(&priv->fpe_cfg.mmsv);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index b80c1efdb323..de500e59461f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -447,17 +447,30 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
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
+	} else {
+		plat->use_ncsi = false;
+	}
 
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
index 26ddf95d23f9..668768043f7e 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -288,5 +288,6 @@ struct plat_stmmacenet_data {
 	int msi_tx_base_vec;
 	const struct dwmac4_addrs *dwmac4_addrs;
 	unsigned int flags;
+	int use_ncsi;
 };
 #endif
-- 
2.34.1


