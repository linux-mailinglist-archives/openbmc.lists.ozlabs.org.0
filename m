Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5FF805112
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 11:47:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jRXoqEZi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sky0R3v7fz3cT9
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 21:47:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jRXoqEZi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Skxlw35ZSz3cVN
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 21:36:28 +1100 (AEDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50bee606265so3004982e87.2
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 02:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701772584; x=1702377384; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hpm9CJMW8yeGqWkPdTKA3BPaZ3J6DVLqALQqXWpKSU=;
        b=jRXoqEZif6JTLKLB/3Hq4e6SCXWW6YgMBDYcvUbU8MZwiVJ1iyo53yMrswD9pCQBXd
         6LDfs/TVPbHZW+wKUYPL3QgRjtxru9LyIc32tWtQs/R5ECKsP3iwAgy6k9SxKyT5J9PE
         Kqn/jnYPfI0/DHtJMSxowgMpioaSVTa+eCRznpsQjvrCNupWoNxxw4xHuegZhJ2fNRPp
         wFt3uyJzD83R1L96VQ+TLTFR7UNHnME2JCZLNecKFMN73cEE75IFJwVUP/37ThNMcrth
         3bcgqlaaZkrsOl4NW7CuwgVj3JDq61UJbMlU5HiKdIiFH9eEBtA66bd4bOTp8UnFRDUm
         6BVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701772584; x=1702377384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hpm9CJMW8yeGqWkPdTKA3BPaZ3J6DVLqALQqXWpKSU=;
        b=E3NMq0gJMmRRBhRvQQ4QBRMc+F50NUukpseClORXNgvhT/UwmsAf9zt1EB6wUSPcdn
         YtrrEvXgw9MwiR9SAdHmrUmfoQudBOGr63FcjS9k9gmvS5TaxRdZOmzISLpXKXX6eus2
         Fvr2mYQubnPZ3TfPrYE5plOFfCugWTOxaNKVnWn4onGAK+5fhhCkgcGRl0i35x5EQUHW
         6JW/RgJo9evmkycq1vN2q/GOpuk1XK4J4CzUPZwsB+luW5g3f6n+hWzhI8Ae85MfAljS
         FpZERhglR9xprpSrzJvmEOuxXxNackQKFQzl6fFXk0J2uLGm6sIsiwqv182o3NVScXxB
         d2fQ==
X-Gm-Message-State: AOJu0YxuaaghPHKw8bNmPapRtc/pYTuxtBEWmenG59kp/lSjLscczK07
	wvAWstbJnjeKfmQvDEH1S4kNgl2wpPlTSg==
X-Google-Smtp-Source: AGHT+IHUCyh6fTgOz+IpheRuxzuTVvMVIazUtogkrsNd/ECy8uXTfUSwsV4TsLItWinwQ4JF0eHc9g==
X-Received: by 2002:a05:6512:3e16:b0:50b:f39d:5204 with SMTP id i22-20020a0565123e1600b0050bf39d5204mr2173050lfv.44.1701772584488;
        Tue, 05 Dec 2023 02:36:24 -0800 (PST)
Received: from localhost ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id d5-20020a0565123d0500b0050bfbc471b0sm442106lfv.18.2023.12.05.02.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 02:36:24 -0800 (PST)
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
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 12/16] net: pcs: xpcs: Add xpcs_create_bynode() method
Date: Tue,  5 Dec 2023 13:35:33 +0300
Message-ID: <20231205103559.9605-13-fancer.lancer@gmail.com>
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
Cc: netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

It's now possible to have the DW XPCS device defined as a standard
platform device for instance in the platform DT-file. Although it's
pointless unless there is a way to have the device found by the client
drivers (STMMAC/DW *MAC, NXP SJA1105 Eth Switch, etc). Provide such
ability by means of the xpcs_create_bynode() method. It needs to be
supplied with the device fwnode which is equipped with the "pcs-handle"
property pointing to the DW XPCS fw-node (in this regards it looks similar
to the phylink interface). That node will be then used to find the
MDIO-device instance in order to create the DW XPCS descriptor.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/net/pcs/pcs-xpcs.c   | 26 ++++++++++++++++++++++++++
 include/linux/pcs/pcs-xpcs.h |  3 +++
 2 files changed, 29 insertions(+)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index e376e255f1d3..c3336895a124 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -9,9 +9,11 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/fwnode.h>
 #include <linux/mdio.h>
 #include <linux/module.h>
 #include <linux/pcs/pcs-xpcs.h>
+#include <linux/phy.h>
 #include <linux/phylink.h>
 #include <linux/property.h>
 
@@ -1511,6 +1513,30 @@ static struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev,
 	return ERR_PTR(ret);
 }
 
+struct dw_xpcs *xpcs_create_bynode(const struct fwnode_handle *fwnode,
+				   phy_interface_t interface)
+{
+	struct fwnode_handle *pcs_node;
+	struct mdio_device *mdiodev;
+	struct dw_xpcs *xpcs;
+
+	pcs_node = fwnode_find_reference(fwnode, "pcs-handle", 0);
+	if (IS_ERR(pcs_node))
+		return ERR_CAST(pcs_node);
+
+	mdiodev = fwnode_mdio_find_device(pcs_node);
+	fwnode_handle_put(pcs_node);
+	if (!mdiodev)
+		return ERR_PTR(-ENODEV);
+
+	xpcs = xpcs_create(mdiodev, interface);
+	if (IS_ERR(xpcs))
+		mdio_device_put(mdiodev);
+
+	return xpcs;
+}
+EXPORT_SYMBOL_GPL(xpcs_create_bynode);
+
 struct dw_xpcs *xpcs_create_byaddr(struct mii_bus *bus, int addr,
 				   phy_interface_t interface)
 {
diff --git a/include/linux/pcs/pcs-xpcs.h b/include/linux/pcs/pcs-xpcs.h
index b11bbb5e820a..2981dcdf65d4 100644
--- a/include/linux/pcs/pcs-xpcs.h
+++ b/include/linux/pcs/pcs-xpcs.h
@@ -8,6 +8,7 @@
 #define __LINUX_PCS_XPCS_H
 
 #include <linux/clk.h>
+#include <linux/fwnode.h>
 #include <linux/mdio.h>
 #include <linux/phy.h>
 #include <linux/phylink.h>
@@ -73,6 +74,8 @@ int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
 void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces);
 int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns,
 		    int enable);
+struct dw_xpcs *xpcs_create_bynode(const struct fwnode_handle *fwnode,
+				   phy_interface_t interface);
 struct dw_xpcs *xpcs_create_byaddr(struct mii_bus *bus, int addr,
 				   phy_interface_t interface);
 void xpcs_destroy(struct dw_xpcs *xpcs);
-- 
2.42.1

