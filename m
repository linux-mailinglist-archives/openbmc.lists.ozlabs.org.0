Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D0480512D
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 11:52:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MmqvYDND;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sky610Glhz3cTF
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 21:52:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MmqvYDND;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Skxm43jdyz3cRF
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 21:36:36 +1100 (AEDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2ca0715f0faso24566131fa.0
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 02:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701772592; x=1702377392; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjKEFhPSgLN5vGtDlHZQvN1ZMYBQW2UNIHEU4iW11KA=;
        b=MmqvYDNDu6Ih+u/mssEkiSVI6eLv9FXL5owkY04Ajm1YvsUebtXx/buiN2Vg4fymXd
         htTVG/e6xqyGxysWAI9jAThEZR3eCCxNiQ3BME+Qd4QTLph9VKj2NY23HW/dxQsOHndY
         69aSgN8/jXJJe+Fh92iF4yKeIHvl2kzgqlFFpYmo6osZkYnDeBRoHctnzJSJkKjAwu1Q
         XNWW91enAvmjINJ/stloPfcxoYcmPN4XrPljroaB4Edmw9UHIhxndAXARC3RZXPw8pbJ
         2/Gr2nrc5hV77h0167EZ3TyrFiePitEtQCu3oq9WoIDRQcO0mHMxXi0QLOhCWMQ+TLfc
         G0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701772592; x=1702377392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KjKEFhPSgLN5vGtDlHZQvN1ZMYBQW2UNIHEU4iW11KA=;
        b=n218nLU+rR9oUC53vSsrBVJwba8wnCW7yOHoYsJKky1BKOkig9Y3IcJ00YW03q7kS+
         qdvCBLFdihov7L5uVDRh+jBKbMsAxmF4B5nogmGlrPP70ULj6O3cCxLvkCa7oeTJ2q3H
         +esegFwea293nZn1CD0QdFPPTU8+Y2KxSQ6snqsP3JWLC+kfkEbACsndIdk7tUkOr105
         I9xYluJWp0k83bQZXjbYNuubTiZ74bT6wXc5eIESs7Q7QMregH/UviwWFI39ZxEVSdJE
         HrdFkt+gY2zI2rcdYJ0tkIWVDo7VUroNYV/4WPhDFRR6r42e5Yu6iOpzj7+yL4q+kEMx
         3Q8Q==
X-Gm-Message-State: AOJu0YyyZBbC+PfwACfyK/SV+X42tbnuXRyLO2KzDtzPp8YVHvcfnaX4
	NHxmByXMngls4JDS8mhtlO4=
X-Google-Smtp-Source: AGHT+IEV4/NEvKyiG2pISjXXhGEzBDyRRwcjqLkOq0cFAE1HY0eO+MjW4de0kYE72+xi26ZTN01x/w==
X-Received: by 2002:a05:651c:85:b0:2ca:30a:8390 with SMTP id 5-20020a05651c008500b002ca030a8390mr1586235ljq.85.1701772592265;
        Tue, 05 Dec 2023 02:36:32 -0800 (PST)
Received: from localhost ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id a21-20020a05651c031500b002c9e9c29670sm1153531ljp.47.2023.12.05.02.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 02:36:31 -0800 (PST)
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
Subject: [PATCH net-next 16/16] net: stmmac: Add externally detected DW XPCS support
Date: Tue,  5 Dec 2023 13:35:37 +0300
Message-ID: <20231205103559.9605-17-fancer.lancer@gmail.com>
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

It's possible to have the DW XPCS device accessible over an external bus
(external MDIO or DW XPCS management interface). Thus it will be futile to
try to detect the device on the local SMA interface. Besides such platform
setup isn't supported by the STMMAC driver anyway since the
stmmac_mdio_bus_data instance might not be created and even if it is there
is no code path which would set the stmmac_mdio_bus_data.has_xpcs flag
thus activating the XPCS device setup.

So in order to solve the denoted problem a pretty much standard approach
is implemented: DT "pcs-handle" property is used to get the phandle
referencing the DT-node describing the DW XPCS device; device node will be
parsed by the xpcs_create_bynode() method implemented in the DW XPCS
driver in a way as it's done for PHY-node; the node is used to find the
MDIO-device instance, which in its turn will be used to create the XPCS
descriptor.

Note as a nice side effect of the provided change the conditional
stmmac_xpcs_setup() method execution can be converted to the conditional
statements implemented in the function itself. Thus the stmmac_open() will
turn to look a bit simpler meanwhile stmmac_xpcs_setup() will provide the
optional XPCS device semantic.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  8 ++---
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 34 ++++++++++++-------
 2 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 379552240ac9..a33ba00d091d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7604,11 +7604,9 @@ int stmmac_dvr_probe(struct device *device,
 	if (priv->plat->speed_mode_2500)
 		priv->plat->speed_mode_2500(ndev, priv->plat->bsp_priv);
 
-	if (priv->plat->mdio_bus_data && priv->plat->mdio_bus_data->has_xpcs) {
-		ret = stmmac_xpcs_setup(ndev);
-		if (ret)
-			goto error_xpcs_setup;
-	}
+	ret = stmmac_xpcs_setup(ndev);
+	if (ret)
+		goto error_xpcs_setup;
 
 	ret = stmmac_phy_setup(priv);
 	if (ret) {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 101fa50c3c96..b906be363b61 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -499,25 +499,33 @@ int stmmac_xpcs_setup(struct net_device *ndev)
 {
 	struct stmmac_priv *priv;
 	struct dw_xpcs *xpcs;
-	int mode, addr;
+	int ret, mode, addr;
 
 	priv = netdev_priv(ndev);
 	mode = priv->plat->phy_interface;
 
-	/* Try to probe the XPCS by scanning all addresses. */
-	for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
-		xpcs = xpcs_create_byaddr(priv->mii, addr, mode);
-		if (IS_ERR(xpcs))
-			continue;
-
-		priv->hw->xpcs = xpcs;
-		break;
+	/* If PCS-node is specified use it to create the XPCS descriptor */
+	if (fwnode_property_present(priv->plat->port_node, "pcs-handle")) {
+		xpcs = xpcs_create_bynode(priv->plat->port_node, mode);
+		ret = PTR_ERR_OR_ZERO(xpcs);
+	} else if (priv->plat->mdio_bus_data && priv->plat->mdio_bus_data->has_xpcs) {
+		/* Try to probe the XPCS by scanning all addresses */
+		for (ret = -ENODEV, addr = 0; addr < PHY_MAX_ADDR; addr++) {
+			xpcs = xpcs_create_byaddr(priv->mii, addr, mode);
+			if (IS_ERR(xpcs))
+				continue;
+
+			ret = 0;
+			break;
+		}
+	} else {
+		return 0;
 	}
 
-	if (!priv->hw->xpcs) {
-		dev_warn(priv->device, "No xPCS found\n");
-		return -ENODEV;
-	}
+	if (ret)
+		return dev_err_probe(priv->device, ret, "No xPCS found\n");
+
+	priv->hw->xpcs = xpcs;
 
 	return 0;
 }
-- 
2.42.1

