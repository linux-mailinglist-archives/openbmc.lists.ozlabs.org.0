Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A4891E7BC
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2024 20:37:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VDSAfMzj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCZXV3tvTz3g3G
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2024 04:37:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VDSAfMzj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCZMS5vM5z3dRW
	for <openbmc@lists.ozlabs.org>; Tue,  2 Jul 2024 04:29:40 +1000 (AEST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-52e743307a2so3805104e87.0
        for <openbmc@lists.ozlabs.org>; Mon, 01 Jul 2024 11:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719858577; x=1720463377; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hm2aYC8yWwZ1MpEgLfzSQGrNN+4dM8SxGRjO92ATLvs=;
        b=VDSAfMzj5hkcKKZxytu22TRAvdriA4SBhrqbNnYUIAmKAylTiYbT3/wo1W2Ok89n3e
         TYQPDifLQsRIyGG24rYlFQwtgwLXCKoo+bo8iYvUCWkxzY9qnSIR+inn+XvINvZVLTSL
         Yw4nRaHxwhuTkN13DRP5CJPJQkupOdnIyXvgG6vF/C6gCuvlK6Qk3Vhdq1MfuwJASd6+
         Jz3leS0EbuRZg8GxqWIak0ksvc8lBcdcwaXbfS3csky2gxE3TiRJyPaAqD4LVn1Ly+CL
         fFGpemHvUn9gzaGueW6dZDcecnuYQ9c2r/oIDrZN3xz0KwnaXzuG0/UgqUj3roLMUjcm
         f3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719858577; x=1720463377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hm2aYC8yWwZ1MpEgLfzSQGrNN+4dM8SxGRjO92ATLvs=;
        b=bdhVXbN7COxVH4ptavaM/jV4YEkMWTVsjgPhDdZ/B9OSolVLemMXzImxOgkpY6kxS3
         4rGGTlvjn9YpiWBbF14lOaLIP4dOZm9ghyP6gBFpF89p2kSFpFP4q/tTn2EDbsX0dgd5
         idoW3cOgGWtb28UbUq1PkByMCdgRJvyHC7TBr2N8Zy+a+Yj+110SxNrxwymQsCHmoUjG
         IkFP8B89e5E/TBULca0yECdFowvBTP/kTnRyWJAYvBXzALbV2UrLLZm3+tveVdc1PIh0
         c0wY1inHR8bEBpLzZOUkw5jGDUZ8MIjz198m5sSJiF32usYdrJbr7Ffk5BkbynNCbm0Q
         K+Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXds/hkgPvt05AitaxGtO1rf+yey6JXVJCN2AK+TSRtEM02WvPmmkcozKpKHwrUNLj7icWB2zQjDJJxv+zxsBzQUSNLf+UwLhI=
X-Gm-Message-State: AOJu0YwY9HMmTZBWjo+jJEmmviUXY6QzUaJshw7tef7Sf2Nd5OIaYUQS
	8iVj1uLKqIjjejopDIrFg14nSQwpyIzCl6u33Ruppzo4Y5O5yRgL
X-Google-Smtp-Source: AGHT+IEt5gIUeS1X520wxU/94QsvXwHNTg2JU+U1rzcs6/smAEiwqIqEcxkoEO/CYSKcAoR1W4rKbQ==
X-Received: by 2002:a05:6512:ad4:b0:52c:5254:b625 with SMTP id 2adb3069b0e04-52e8270a66dmr5353997e87.52.1719858576708;
        Mon, 01 Jul 2024 11:29:36 -0700 (PDT)
Received: from localhost ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab2ea09sm1514069e87.193.2024.07.01.11.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 11:29:36 -0700 (PDT)
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
Subject: [PATCH net-next v4 08/10] net: pcs: xpcs: Add fwnode-based descriptor creation method
Date: Mon,  1 Jul 2024 21:28:39 +0300
Message-ID: <20240701182900.13402-9-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240701182900.13402-1-fancer.lancer@gmail.com>
References: <20240701182900.13402-1-fancer.lancer@gmail.com>
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

Changelog v3:
- Add the "@interface" argument kdoc to the xpcs_create_mdiodev()
  function. (@Simon)
- Fix the "@fwnode" argument name in the xpcs_create_fwnode() method kdoc.
  (@Simon)
- Move the return value descriptions to the "Return:" section of the
  xpcs_create_mdiodev() and xpcs_create_fwnode() kdoc. (@Simon)
---
 drivers/net/pcs/pcs-xpcs.c   | 50 ++++++++++++++++++++++++++++++++++++
 include/linux/pcs/pcs-xpcs.h |  3 +++
 2 files changed, 53 insertions(+)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index f4425a7c74d5..82463f9d50c8 100644
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
+ * @interface: requested PHY interface
+ *
+ * Return: a pointer to the DW XPCS handle if successful, otherwise -ENODEV if
+ * the PCS device couldn't be found on the bus and other negative errno related
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
+ * @fwnode: fwnode handle poining to the DW XPCS device
+ * @interface: requested PHY interface
+ *
+ * Return: a pointer to the DW XPCS handle if successful, otherwise -ENODEV if
+ * the fwnode device is unavailable or the PCS device couldn't be found on the
+ * bus, -EPROBE_DEFER if the respective MDIO-device instance couldn't be found,
+ * other negative errno related to the data allocations and MDIO-bus
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

