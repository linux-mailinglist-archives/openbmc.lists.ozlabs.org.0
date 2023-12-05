Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4628050D0
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 11:42:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NTye8OZm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkxtJ49xQz3cgl
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 21:42:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NTye8OZm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Skxlh5njcz3cNt
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 21:36:16 +1100 (AEDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50bf2d9b3fdso3010284e87.3
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 02:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701772572; x=1702377372; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGpa0GtJpSi8L3mCQm30bghRnsn1XAa98foEtQJ/KWs=;
        b=NTye8OZmGFsqCan4QD/X5IC4euxd+EGELwU2mxHwPDS/zdktMdtwz4pMPBDHAat3AK
         6DFLh9GfIWjNoQWUS0b94aJTmnLg9jvmAWj240KW122POaVCLxpiRKq6VLA/2UYZII/t
         8vvgTlrLRpoBGl8UJXl/uQN5ZEg8PPc1RkhdeL9iBJeOPMgGchp1RcT/S2w+PjOSKSrf
         GBufpBCr8/n7iXl0QugArxv1Pp6bQmJGAN6UrD89uA46aH26gIQpo4lAreQUm+2kyvlR
         VOY+yCiA9uxmtiSExTuIOsAs8FafEA3VQxqPhgogMcLOVGUV6ny6p6hbXMaEqrynpK1M
         PWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701772572; x=1702377372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGpa0GtJpSi8L3mCQm30bghRnsn1XAa98foEtQJ/KWs=;
        b=CdjKe/JyFIwriF1lIdsQNFUxB27+OxptdlTyzpgmzfcFzcapyYVjCUlsy1QJLaWgat
         9cbOnlx2TyF6Eqa3U70qjShj92GldOvrLnLjr9hQNLdkMmKZ1AE8H6nmJ8NUJA/UgsqL
         KnuS0Yke2kHKYFv3HA5Eqio5+yvF0h/c+IO9kqOxlglcuyG4BnlCCqDejQRYvOoDxYHE
         BjVowJw+lFpd2+yJzMG318QzIB0oq/zV+Gh7vSBbVxchZD7empd13FDmtSYLF1ZrVOc9
         EIKZ+1f1nOMeDPQxrXF8hoacwgOuoGOMq4AlPYVsmQBgjbYPi3gCIBNiW92LXGTys6hw
         eMUQ==
X-Gm-Message-State: AOJu0YyEW71IIwsa3w0LZ2DjbCbzsqu1uxNEZATOy2hwcDtRkvJHy/5I
	nKNsm8yDN40O3TMBjlvczps=
X-Google-Smtp-Source: AGHT+IFIhxBRZreE0ykFzf7E++LBQs6vRs4czi1iz3uLMDedC+tOqSVXU3dh9yp28YVSHIo1DRs6Rg==
X-Received: by 2002:a05:6512:2343:b0:50b:fcd6:cb10 with SMTP id p3-20020a056512234300b0050bfcd6cb10mr1522544lfu.130.1701772572652;
        Tue, 05 Dec 2023 02:36:12 -0800 (PST)
Received: from localhost ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id t6-20020a199106000000b0050bfdb1392fsm377230lfd.221.2023.12.05.02.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 02:36:12 -0800 (PST)
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
Subject: [PATCH net-next 06/16] net: pcs: xpcs: Avoid creating dummy XPCS MDIO device
Date: Tue,  5 Dec 2023 13:35:27 +0300
Message-ID: <20231205103559.9605-7-fancer.lancer@gmail.com>
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

If the DW XPCS MDIO devices are either left unmasked for being auto-probed
or explicitly registered in the MDIO subsystem by means of the
mdiobus_register_board_info() method there is no point in creating the
dummy MDIO device instance in order to get the DW XPCS handler since the
MDIO core subsystem will create the device during the MDIO bus
registration procedure. All what needs to be done is to just reuse the
MDIO-device instance available in the mii_bus.mdio_map array (using some
getter for it would look better though). It shall prevent the XPCS devices
been accessed over several MDIO-device instances.

Note since the MDIO-device instance might be retrieved from the MDIO-bus
map array its reference counter shall be increased. If the MDIO-device
instance is created in the xpcs_create_mdiodev() method its reference
counter will be already increased. So there is no point in toggling the
reference counter in the xpcs_create() function. Just drop it from there.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/net/pcs/pcs-xpcs.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 2850122f354a..a53376472394 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -1376,7 +1376,6 @@ static struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev,
 	if (!xpcs)
 		return ERR_PTR(-ENOMEM);
 
-	mdio_device_get(mdiodev);
 	xpcs->mdiodev = mdiodev;
 
 	xpcs_id = xpcs_get_id(xpcs);
@@ -1417,7 +1416,6 @@ static struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev,
 	ret = -ENODEV;
 
 out:
-	mdio_device_put(mdiodev);
 	kfree(xpcs);
 
 	return ERR_PTR(ret);
@@ -1437,19 +1435,21 @@ struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr,
 	struct mdio_device *mdiodev;
 	struct dw_xpcs *xpcs;
 
-	mdiodev = mdio_device_create(bus, addr);
-	if (IS_ERR(mdiodev))
-		return ERR_CAST(mdiodev);
+	if (addr >= PHY_MAX_ADDR)
+		return ERR_PTR(-EINVAL);
 
-	xpcs = xpcs_create(mdiodev, interface);
+	if (mdiobus_is_registered_device(bus, addr)) {
+		mdiodev = bus->mdio_map[addr];
+		mdio_device_get(mdiodev);
+	} else {
+		mdiodev = mdio_device_create(bus, addr);
+		if (IS_ERR(mdiodev))
+			return ERR_CAST(mdiodev);
+	}
 
-	/* xpcs_create() has taken a refcount on the mdiodev if it was
-	 * successful. If xpcs_create() fails, this will free the mdio
-	 * device here. In any case, we don't need to hold our reference
-	 * anymore, and putting it here will allow mdio_device_put() in
-	 * xpcs_destroy() to automatically free the mdio device.
-	 */
-	mdio_device_put(mdiodev);
+	xpcs = xpcs_create(mdiodev, interface);
+	if (IS_ERR(xpcs))
+		mdio_device_put(mdiodev);
 
 	return xpcs;
 }
-- 
2.42.1

