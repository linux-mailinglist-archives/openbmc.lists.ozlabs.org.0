Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D369580512B
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 11:50:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gOoaBZwU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sky4V2Nczz2yLr
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 21:50:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gOoaBZwU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Skxm25n4Bz3cYh
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 21:36:34 +1100 (AEDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50bf3efe2cbso2548866e87.2
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 02:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701772590; x=1702377390; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KnWeBpfqtvqCDqeZAExTorADExkavt7pqbm3ec9WO1c=;
        b=gOoaBZwUvHEbShvsM+gQLlqzCb30Dqg1XQG8mDwf5SRn+0zGDuMJ84eRCScHUVzu1h
         cL96m9QrybNu3xvT0LsZ4TFhrbayxpcV+4UQpnuA0WT2op6K5Jh7fv5B4Q4sHp1P4bIm
         3XeaZgkMZqNged7SGERTTDk+Sl2dWfOT6DD2f8PCTaAEO3YoChEL0uLO7/kCpTA3k85i
         Ndfb9WpqUaDnLAFT52inbNlq4FJGkh5iu5IWbRL01KeG8nFhEOCjJvXcyzV7urD3YpCI
         NhTXKFNkFsGh5IOM5TFagzfBjdlCR8VvyZEIkRQo3IjO+hP9ZrFPfAOyMPBTtRTyplme
         cdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701772590; x=1702377390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KnWeBpfqtvqCDqeZAExTorADExkavt7pqbm3ec9WO1c=;
        b=tZxh4UzVRX+5v6VCMvLKQj01LsNlNy2Z39j92rqgACdAuHURlRiEw87mpQ939QCwAX
         vRU5Ercy4mO/hekYTj1WD8EAEbdM8V13dEcIv6PNkgi0z3S28Lf0eKBs/mwaA1w3ki1y
         1QtkiZvu1XGNxpEbii5/wws/73lpjdchQXXwHwBDn9Zw9Iy1rnWQKv49Fo25I8df7foj
         fdeKY0gL1T8oVEufvwBmHFnNcPGIW89N/OURuBeM3ccZJkdTMfYFddyJo+py3AlI05Ii
         qraSY0bfp9LyP7imHmgp6QfrbiICMe+XCQszQ6vhylkeBOa5yf58ildzr7w9mXpbdmYz
         XAyw==
X-Gm-Message-State: AOJu0YxCCSkL3KHmcB9P/Mqfx4X2OdHO6aInaTrXcbyRhQaDWeWFgLN8
	fsguqhLpYaWbVAkP4nbINyQ=
X-Google-Smtp-Source: AGHT+IFCUWZhdYHhKb8nG0l8H2uVfvXP7CMp59To4aI5jWsBTPXwOd7IoX4cD7Nlfspv3sfeyfBb1A==
X-Received: by 2002:ac2:5f43:0:b0:50b:ccc1:201e with SMTP id 3-20020ac25f43000000b0050bccc1201emr1469322lfz.0.1701772590456;
        Tue, 05 Dec 2023 02:36:30 -0800 (PST)
Received: from localhost ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id d19-20020a196b13000000b0050bf365e8c8sm679554lfa.63.2023.12.05.02.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 02:36:30 -0800 (PST)
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [PATCH net-next 15/16] net: stmmac: Add dedicated XPCS cleanup method
Date: Tue,  5 Dec 2023 13:35:36 +0300
Message-ID: <20231205103559.9605-16-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231205103559.9605-1-fancer.lancer@gmail.com>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Currently the XPCS handler destruction is performed in the
stmmac_mdio_unregister() method. It doesn't look well because the handler
isn't originally created in the corresponding protagonist
stmmac_mdio_unregister(), but in the stmmac_xpcs_setup() function. In
order to have a bit more coherent MDIO and XPCS setup/cleanup procedures
let's move the DW XPCS destruction to the dedicated stmmac_xpcs_clean()
method.

Note besides of that this change is a preparation to adding the PCS device
supplied by means of the "pcs-handle" property. It's required since DW
XPCS IP-core can be synthesized embedded into the chip with directly
accessible CSRs. In that case the SMA interface can be absent so no
corresponding MDIO bus will be registered.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  6 +++++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 14 +++++++++++---
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index d8a1c84880c5..1709de519813 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -344,6 +344,7 @@ int stmmac_mdio_unregister(struct net_device *ndev);
 int stmmac_mdio_register(struct net_device *ndev);
 int stmmac_mdio_reset(struct mii_bus *mii);
 int stmmac_xpcs_setup(struct net_device *ndev);
+void stmmac_xpcs_clean(struct net_device *ndev);
 void stmmac_set_ethtool_ops(struct net_device *netdev);
 
 int stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32 systime_flags);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c3641db00f96..379552240ac9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7639,8 +7639,9 @@ int stmmac_dvr_probe(struct device *device,
 
 error_netdev_register:
 	phylink_destroy(priv->phylink);
-error_xpcs_setup:
 error_phy_setup:
+	stmmac_xpcs_clean(ndev);
+error_xpcs_setup:
 	if (priv->hw->pcs != STMMAC_PCS_TBI &&
 	    priv->hw->pcs != STMMAC_PCS_RTBI)
 		stmmac_mdio_unregister(ndev);
@@ -7682,6 +7683,9 @@ void stmmac_dvr_remove(struct device *dev)
 	if (priv->plat->stmmac_rst)
 		reset_control_assert(priv->plat->stmmac_rst);
 	reset_control_assert(priv->plat->stmmac_ahb_rst);
+
+	stmmac_xpcs_clean(ndev);
+
 	if (priv->hw->pcs != STMMAC_PCS_TBI &&
 	    priv->hw->pcs != STMMAC_PCS_RTBI)
 		stmmac_mdio_unregister(ndev);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index e6133510e28d..101fa50c3c96 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -522,6 +522,17 @@ int stmmac_xpcs_setup(struct net_device *ndev)
 	return 0;
 }
 
+void stmmac_xpcs_clean(struct net_device *ndev)
+{
+	struct stmmac_priv *priv = netdev_priv(ndev);
+
+	if (!priv->hw->xpcs)
+		return;
+
+	xpcs_destroy(priv->hw->xpcs);
+	priv->hw->xpcs = NULL;
+}
+
 /**
  * stmmac_mdio_register
  * @ndev: net device structure
@@ -674,9 +685,6 @@ int stmmac_mdio_unregister(struct net_device *ndev)
 	if (!priv->mii)
 		return 0;
 
-	if (priv->hw->xpcs)
-		xpcs_destroy(priv->hw->xpcs);
-
 	mdiobus_unregister(priv->mii);
 	priv->mii->priv = NULL;
 	mdiobus_free(priv->mii);
-- 
2.42.1

