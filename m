Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE3D8D766D
	for <lists+openbmc@lfdr.de>; Sun,  2 Jun 2024 16:43:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TQnHWgV9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VsfkK34sdz3cXJ
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2024 00:43:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TQnHWgV9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VsfZR00Y6z3cTb
	for <openbmc@lists.ozlabs.org>; Mon,  3 Jun 2024 00:37:02 +1000 (AEST)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2e95a1eff78so47008041fa.0
        for <openbmc@lists.ozlabs.org>; Sun, 02 Jun 2024 07:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717339019; x=1717943819; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4aGTiAPBTBiXTU5Af6ILBXeRCSgwACWrEB026RZEFk=;
        b=TQnHWgV93z1eP0AmhfDsyj1gomvvO+DaguomiwSmjLbr7nzR7EVZG+7Rm85vq9D31y
         ICXckvoLAJ8qCiK3lFiFD/QYFbiUv7YVw8zzORESHUU4q7kJukLA9vLtZvrNkcI6MmNQ
         +SX+9HrPfvi+tSt9NL0SA8BTl8aZXRRk8TIhtHfK9aYQrDzTqqutnVUwCLpe73ozROlt
         9gzisYAlF2Tod7C06+W+b4r3pE5QxDFaPwNPGmrl2MARh+OHd9COSnaP6R+R7M8QMjkl
         c3vOeyD/jEZNTvu41jzLFoTrEa65fSALG8J1Lvu1O1p2R5HDJ0wHctQBiyXqf7moyLBe
         5o3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717339019; x=1717943819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4aGTiAPBTBiXTU5Af6ILBXeRCSgwACWrEB026RZEFk=;
        b=iGysL7dptRh8P1ryi1apVnXQdHersAOU7igR3nJpAkOlzho4FmxxWk440clsFXbp0P
         hCZdwexXQUiAYQ/uo7eQnKytK49cwceiwJkrMQhDzRG6pr0eB0PE4dBLIxo2hnDzj1xS
         2eUvuD5ltBB8eawk5s9gSTTbuF1brSH/QcFcNjB2nPoT1NPp8LdMoPV+URZoamIcLdMS
         XXgI5Mk824fSShWTaqULubnMlUYQCGQLkQ5DDWC0mfPXlaejt7pC8iwYDujqwgZpibNj
         GSK3AS4m69qsG0hMTABYZo3HudtZpgvg7+uoCxiti1rnFpINGT2zKHLfnDEOLPclHSuO
         YxIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLmqZ17K6JIFip+xuVPoYuYca+1hCxkNDjTh5upea4xudaOuV+6UXq6DUoBzEPuj2t+Pl/prL8qyEofOCU3e2l2GkfL03YsOo=
X-Gm-Message-State: AOJu0YxIHY/iYBpTrsj0a6HJoSwsxx7k2QiPdWiVHoE7FezdIvUjhwsO
	9C7TU6rJrPoNorCy75V3xopfNtaUatKOxaquVOiRPEwoK0NoGPfI
X-Google-Smtp-Source: AGHT+IF+oobCAxds4AhiGxi+LGxB+KYDlBE57HkX5WVkoQfOlVO4ykFSLc4rqzw0TKa2a6kiImbqSA==
X-Received: by 2002:ac2:4354:0:b0:52b:404:914f with SMTP id 2adb3069b0e04-52b8958aed8mr4401137e87.34.1717339019150;
        Sun, 02 Jun 2024 07:36:59 -0700 (PDT)
Received: from localhost ([178.178.142.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b93500e57sm420576e87.46.2024.06.02.07.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 07:36:58 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 08/10] net: pcs: xpcs: Add fwnode-based descriptor creation method
Date: Sun,  2 Jun 2024 17:36:22 +0300
Message-ID: <20240602143636.5839-9-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240602143636.5839-1-fancer.lancer@gmail.com>
References: <20240602143636.5839-1-fancer.lancer@gmail.com>
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>, Jiawen Wu <jiawenwu@trustnetic.com>, Abhishek Chauhan <quic_abchauha@quicinc.com>, Sagar Cheluvegowda <quic_scheluve@quicinc.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, Andrew Halaney <ahalaney@redhat.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

It's now possible to have the DW XPCS device defined as a standard
platform device for instance in the platform DT-file. Although that
functionality is useless unless there is a way to have the device found by
the client drivers (STMMAC/DW *MAC, NXP SJA1105 Eth Switch, etc). Provide
such ability by means of the xpcs_create_fwnode() method. It needs to be
called with the device DW XPCS fwnode instance passed. That node will be
then used to find the MDIO-device instance in order to create the DW XPCS
descriptor.

Note the method semantics and name is similar to what has been recently
introduced in the Lynx PCS driver.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

---

Changelog v2:
- Use the function name and semantics similar to the Lynx PCS driver.
- Add kdoc describing the DW XPCS create functions.
---
 drivers/net/pcs/pcs-xpcs.c   | 50 ++++++++++++++++++++++++++++++++++++
 include/linux/pcs/pcs-xpcs.h |  3 +++
 2 files changed, 53 insertions(+)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 8f7e3af64fcc..d45fa6514884 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -10,7 +10,9 @@
 #include <linux/delay.h>
 #include <linux/pcs/pcs-xpcs.h>
 #include <linux/mdio.h>
+#include <linux/phy.h>
 #include <linux/phylink.h>
+#include <linux/property.h>
 
 #include "pcs-xpcs.h"
 
@@ -1505,6 +1507,16 @@ static struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev,
 	return ERR_PTR(ret);
 }
 
+/**
+ * xpcs_create_mdiodev() - create a DW xPCS instance with the MDIO @addr
+ * @bus: pointer to the MDIO-bus descriptor for the device to be looked at
+ * @addr: device MDIO-bus ID
+ * @requested PHY interface
+ *
+ * If successful, returns a pointer to the DW XPCS handle. Otherwise returns
+ * -ENODEV if device couldn't be found on the bus, other negative errno related
+ * to the data allocation and MDIO-bus communications.
+ */
 struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr,
 				    phy_interface_t interface)
 {
@@ -1529,6 +1541,44 @@ struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr,
 }
 EXPORT_SYMBOL_GPL(xpcs_create_mdiodev);
 
+/**
+ * xpcs_create_fwnode() - Create a DW xPCS instance from @fwnode
+ * @node: fwnode handle poining to the DW XPCS device
+ * @interface: requested PHY interface
+ *
+ * If successful, returns a pointer to the DW XPCS handle. Otherwise returns
+ * -ENODEV if the fwnode is marked unavailable or device couldn't be found on
+ * the bus, -EPROBE_DEFER if the respective MDIO-device instance couldn't be
+ * found, other negative errno related to the data allocations and MDIO-bus
+ * communications.
+ */
+struct dw_xpcs *xpcs_create_fwnode(struct fwnode_handle *fwnode,
+				   phy_interface_t interface)
+{
+	struct mdio_device *mdiodev;
+	struct dw_xpcs *xpcs;
+
+	if (!fwnode_device_is_available(fwnode))
+		return ERR_PTR(-ENODEV);
+
+	mdiodev = fwnode_mdio_find_device(fwnode);
+	if (!mdiodev)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	xpcs = xpcs_create(mdiodev, interface);
+
+	/* xpcs_create() has taken a refcount on the mdiodev if it was
+	 * successful. If xpcs_create() fails, this will free the mdio
+	 * device here. In any case, we don't need to hold our reference
+	 * anymore, and putting it here will allow mdio_device_put() in
+	 * xpcs_destroy() to automatically free the mdio device.
+	 */
+	mdio_device_put(mdiodev);
+
+	return xpcs;
+}
+EXPORT_SYMBOL_GPL(xpcs_create_fwnode);
+
 void xpcs_destroy(struct dw_xpcs *xpcs)
 {
 	if (!xpcs)
diff --git a/include/linux/pcs/pcs-xpcs.h b/include/linux/pcs/pcs-xpcs.h
index 813be644647f..b4a4eb6c8866 100644
--- a/include/linux/pcs/pcs-xpcs.h
+++ b/include/linux/pcs/pcs-xpcs.h
@@ -8,6 +8,7 @@
 #define __LINUX_PCS_XPCS_H
 
 #include <linux/clk.h>
+#include <linux/fwnode.h>
 #include <linux/mdio.h>
 #include <linux/phy.h>
 #include <linux/phylink.h>
@@ -72,6 +73,8 @@ int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns,
 		    int enable);
 struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr,
 				    phy_interface_t interface);
+struct dw_xpcs *xpcs_create_fwnode(struct fwnode_handle *fwnode,
+				   phy_interface_t interface);
 void xpcs_destroy(struct dw_xpcs *xpcs);
 
 #endif /* __LINUX_PCS_XPCS_H */
-- 
2.43.0

