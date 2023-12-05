Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17828805121
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 11:49:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T51VdFYe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sky2z3y2zz3dB7
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 21:49:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T51VdFYe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Skxm03qzrz3cTF
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 21:36:32 +1100 (AEDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50be10acaf9so3449264e87.1
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 02:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701772588; x=1702377388; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSce1rQ1um+oY77DdZG8yrBJ6NEyKdJwNZU1ix0Nv7k=;
        b=T51VdFYeYBn/aQ4ziWm36XqRQQ6nrPpjqPv6qCNMKJ1GMB1OMjM6bGf/zYjloFGmZ4
         GFxKlELPZDtE/i7Wsal6rtq6ePiADlTWTYBCA2T0j7Gthy0zXCCIVT5xP/2kjMMrPp0B
         dIqNCYHmFeMAg8ITl6ObDHzs8/QkQk+BavwNyjHpcWSjhQSPDpJQJ233J4HUl2h24sCp
         kwxYA8o1aeHKxaFNiF5s/andkvT5S72pgjIRhLtk9E0R+vcvnwq4eW8Vg2CdPeVrM4Ix
         UBjP8eZE/K4zrGkaJ6VYvRtnQxtKvRyc9YUwvAYCRCtKoceHJ2veSpCZ3t/kOCr4EJqK
         22FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701772588; x=1702377388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eSce1rQ1um+oY77DdZG8yrBJ6NEyKdJwNZU1ix0Nv7k=;
        b=uhan+N4u0j380k8mS6UuUX7p5PNV2uee83XMxmf4BmkbGXJVB9PlSQsI25GkOjJAo/
         bEpdOSn4nEZM8hIzr2DRkZ32MMTgO1dVaTryVkt5dn5uM9+JQGsdhk+0JpHGYRpnVKw6
         ss/BT3T8Q0RngLfOLzYIYGcvxcw2Cx74Qhd05uH9uOLKxL5kZXAGpboNfoNsi6Iu81/d
         dR3959x2QnHRxtpeTk90dLpNKhepg+liKxPuOxPYfASGgpbcMaXYgl5otAhpn711Y/vZ
         4Pv800yQ5FlUqfiNaYEQXceeMyHfZ+pZNpZND6seR0e6dVZrNf59xBpGU/MNrk2nIAQk
         RPFw==
X-Gm-Message-State: AOJu0YwrkMf3blXyi5b/z75/ToBdeueyj5qcyh9V2hadoRdmqo1cYyJZ
	pAmkE3qZ5qQAQ3db4MNxjD8=
X-Google-Smtp-Source: AGHT+IHCPdpPY0zKceA3SRi5ga/xIyMFSxmCiObH9MLWtgGsZTqmrUo8sVBhomQ2MmR96xpeV6v2vw==
X-Received: by 2002:a05:6512:2809:b0:50b:f0a9:1e3e with SMTP id cf9-20020a056512280900b0050bf0a91e3emr834935lfb.3.1701772588437;
        Tue, 05 Dec 2023 02:36:28 -0800 (PST)
Received: from localhost ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id x3-20020a056512046300b0050c0215a806sm185275lfd.83.2023.12.05.02.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 02:36:27 -0800 (PST)
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
Subject: [PATCH net-next 14/16] net: stmmac: Pass netdev to XPCS setup function
Date: Tue,  5 Dec 2023 13:35:35 +0300
Message-ID: <20231205103559.9605-15-fancer.lancer@gmail.com>
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

It's possible to have the XPCS device accessible over a dedicated
management interface which makes the XPCS device available over the MMIO
space. In that case the management interface will be registered as a
separate MDIO bus and the DW xGMAC device will be equipped with the
"pcs-handle" property pointing to the XPCS device instead of
auto-detecting it on the internal MDIO bus. In such configurations the SMA
interface (embedded into the DW xGMAC MDIO interface) might be absent.
Thus passing the MII bus interface handler to the stmmac_xpcs_setup()
method won't let us reach the externally supplied XPCS device especially
if the SMA bus isn't configured. Let's fix it by converting the
stmmac_xpcs_setup(struct mii_bus *bus) prototype to
stmmac_xpcs_setup(struct net_device *ndev).

Note this is a preparation patch before adding the support of the XPCS
devices specified via the "pcs-handle" property.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 5 ++---
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index cd7a9768de5f..d8a1c84880c5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -343,7 +343,7 @@ enum stmmac_state {
 int stmmac_mdio_unregister(struct net_device *ndev);
 int stmmac_mdio_register(struct net_device *ndev);
 int stmmac_mdio_reset(struct mii_bus *mii);
-int stmmac_xpcs_setup(struct mii_bus *mii);
+int stmmac_xpcs_setup(struct net_device *ndev);
 void stmmac_set_ethtool_ops(struct net_device *netdev);
 
 int stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32 systime_flags);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3e50fd53a617..c3641db00f96 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7605,7 +7605,7 @@ int stmmac_dvr_probe(struct device *device,
 		priv->plat->speed_mode_2500(ndev, priv->plat->bsp_priv);
 
 	if (priv->plat->mdio_bus_data && priv->plat->mdio_bus_data->has_xpcs) {
-		ret = stmmac_xpcs_setup(priv->mii);
+		ret = stmmac_xpcs_setup(ndev);
 		if (ret)
 			goto error_xpcs_setup;
 	}
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index aa75e4f1e212..e6133510e28d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -495,9 +495,8 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 	return 0;
 }
 
-int stmmac_xpcs_setup(struct mii_bus *bus)
+int stmmac_xpcs_setup(struct net_device *ndev)
 {
-	struct net_device *ndev = bus->priv;
 	struct stmmac_priv *priv;
 	struct dw_xpcs *xpcs;
 	int mode, addr;
@@ -507,7 +506,7 @@ int stmmac_xpcs_setup(struct mii_bus *bus)
 
 	/* Try to probe the XPCS by scanning all addresses. */
 	for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
-		xpcs = xpcs_create_byaddr(bus, addr, mode);
+		xpcs = xpcs_create_byaddr(priv->mii, addr, mode);
 		if (IS_ERR(xpcs))
 			continue;
 
-- 
2.42.1

