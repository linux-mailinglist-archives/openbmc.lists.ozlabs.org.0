Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F15448050FF
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 11:46:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SCHxaSOP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkxzQ2mYYz3cTh
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 21:46:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SCHxaSOP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Skxlt62tBz3cTh
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 21:36:26 +1100 (AEDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c9f413d6b2so33426741fa.1
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 02:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701772583; x=1702377383; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIQUz6kTrVuZdOXLZo+ge/Lp9pWSfj/oMDcXilwbtBU=;
        b=SCHxaSOPYlGouNK5Akuyt0FU1xNum61A7STqh9kYCGYY2T/u7G26KkEBsfykwy6NPL
         /bTIC9QYHDOJWPaGv0QHEthO90eHX1rFHhFIiy/7iEt9Zfh7+p9NmpEB1/3Jfz1Ht84j
         ubR+mNx2PZ+RpzgHgMaSPCGZDBDzzMxHfsu1d8xIq4rWwIEsfj9pWZvrWPoiPiNmK7Az
         La2rSlaRoeWOxOVEJLUXrsvEKjSfJDtv9XEre9JvVxbSRad1moOk1/N0H/75MKCJjeib
         875gqpfhy8EEjCFMACA+9QLfBGfdL+hpPKyR/gRdyWh79s6OtuN+5wecbIcxVtCc6FUr
         IRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701772583; x=1702377383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WIQUz6kTrVuZdOXLZo+ge/Lp9pWSfj/oMDcXilwbtBU=;
        b=PHGbWKR/R9xFnYNFoXVroT4/leF5AHJPFWrKmc42qsuhTK+3sI7j/zpG4qQxPe12jH
         EWNPIJvqsm1wkkR8PfA5PwHbqwf4/M5/dgd/+mUqupWxNx0qe8qUguErFbxLgmNrB0r6
         +zVtjTLU75eooLw1bDxiQUzwqp3RfXcd0Nc+fzC85xK9AHMLO/tDmfYS2BjiovZFoWrR
         Zeh+cdU+LcCJVlzgIDn2L50Nh+D/E2tZy4HEmlp+rVSsP5JTO3wOkUQAtuc3gg2gCkfU
         igVxXN7JBQQpC5gU8B3g7Bv1LA+J+lpEfdekXF6JEEEvRt9mQVZp6LJqFHT7hpd49pkz
         miPg==
X-Gm-Message-State: AOJu0YwvvhCLvVYSRqO/oUrCvilT+0v1Q/DRh4cJaDy6ari855pOWqBw
	+8tpa1CYGB30nmp8XnzkTLk=
X-Google-Smtp-Source: AGHT+IGX6hxolloUWCXauP85aEGl4KFj8FADRPvac0Qo990dFIzZotJOwEw2Nm39AzLMj98ISD+EcQ==
X-Received: by 2002:ac2:5a50:0:b0:50b:fea2:4cdc with SMTP id r16-20020ac25a50000000b0050bfea24cdcmr583327lfn.172.1701772582731;
        Tue, 05 Dec 2023 02:36:22 -0800 (PST)
Received: from localhost ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id c10-20020ac25f6a000000b0050c0514fdf4sm146106lfc.127.2023.12.05.02.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 02:36:22 -0800 (PST)
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
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [PATCH net-next 11/16] net: pcs: xpcs: Change xpcs_create_mdiodev() suffix to "byaddr"
Date: Tue,  5 Dec 2023 13:35:32 +0300
Message-ID: <20231205103559.9605-12-fancer.lancer@gmail.com>
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

The fwnode-based way of creating XPCS descriptor is about to be added. In
order to have a function name distinguishable from the already implemented
xpcs_create_mdiodev() method convert the later name to be
xpcs_create_byaddr() which BTW better describes the method semantic in
anyway.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/net/dsa/sja1105/sja1105_mdio.c            | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 2 +-
 drivers/net/pcs/pcs-xpcs.c                        | 6 +++---
 include/linux/pcs/pcs-xpcs.h                      | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/dsa/sja1105/sja1105_mdio.c b/drivers/net/dsa/sja1105/sja1105_mdio.c
index 833e55e4b961..9101079e365d 100644
--- a/drivers/net/dsa/sja1105/sja1105_mdio.c
+++ b/drivers/net/dsa/sja1105/sja1105_mdio.c
@@ -409,7 +409,7 @@ static int sja1105_mdiobus_pcs_register(struct sja1105_private *priv)
 		    priv->phy_mode[port] != PHY_INTERFACE_MODE_2500BASEX)
 			continue;
 
-		xpcs = xpcs_create_mdiodev(bus, port, priv->phy_mode[port]);
+		xpcs = xpcs_create_byaddr(bus, port, priv->phy_mode[port]);
 		if (IS_ERR(xpcs)) {
 			rc = PTR_ERR(xpcs);
 			goto out_pcs_free;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index fa9e7e7040b9..aa75e4f1e212 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -507,7 +507,7 @@ int stmmac_xpcs_setup(struct mii_bus *bus)
 
 	/* Try to probe the XPCS by scanning all addresses. */
 	for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
-		xpcs = xpcs_create_mdiodev(bus, addr, mode);
+		xpcs = xpcs_create_byaddr(bus, addr, mode);
 		if (IS_ERR(xpcs))
 			continue;
 
diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 183a37929b60..e376e255f1d3 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -1511,8 +1511,8 @@ static struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev,
 	return ERR_PTR(ret);
 }
 
-struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr,
-				    phy_interface_t interface)
+struct dw_xpcs *xpcs_create_byaddr(struct mii_bus *bus, int addr,
+				   phy_interface_t interface)
 {
 	struct mdio_device *mdiodev;
 	struct dw_xpcs *xpcs;
@@ -1535,7 +1535,7 @@ struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr,
 
 	return xpcs;
 }
-EXPORT_SYMBOL_GPL(xpcs_create_mdiodev);
+EXPORT_SYMBOL_GPL(xpcs_create_byaddr);
 
 void xpcs_destroy(struct dw_xpcs *xpcs)
 {
diff --git a/include/linux/pcs/pcs-xpcs.h b/include/linux/pcs/pcs-xpcs.h
index 53adbffb4c0a..b11bbb5e820a 100644
--- a/include/linux/pcs/pcs-xpcs.h
+++ b/include/linux/pcs/pcs-xpcs.h
@@ -73,8 +73,8 @@ int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
 void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces);
 int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns,
 		    int enable);
-struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr,
-				    phy_interface_t interface);
+struct dw_xpcs *xpcs_create_byaddr(struct mii_bus *bus, int addr,
+				   phy_interface_t interface);
 void xpcs_destroy(struct dw_xpcs *xpcs);
 
 #endif /* __LINUX_PCS_XPCS_H */
-- 
2.42.1

