Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B1F919BF7
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 02:44:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ja9FdY+A;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8fvr4DLtz3dWZ
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 10:44:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ja9FdY+A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8fsQ09Kqz3by2
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 10:42:01 +1000 (AEST)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2ec002caf3eso110585391fa.1
        for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 17:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719448919; x=1720053719; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNtSE/Sz58dIQftFvxUpsZScMic73JvgAp5RjxHCtMo=;
        b=ja9FdY+AfT4fwsDAoRtSgCgN85vERjqxwIoYtzwbqPeX1lm+0xpTfkgKXSwDVeE8yL
         JCNYFIXWygKYnMIn5B7z4B0vF7NvqQp+Y/salS4ZkHUhH7+ZJOdDdgQcjvh+6YrhxOkx
         fyOgAzLk6UVVnmrKBpgI2lIHDhZLhv1+SLIx4qtyf1ZwsQ78UKT9RDBvPfaUTQXep93S
         V4NihXmSjkwzWST+AkJifVs4bukV7A2mhwozGN/lZKHiqNmAsHoawhOZNZHeO4vAcgIC
         Tc4cWM8szchCTrZ3x6CHnIhmS/X/9uYkidxtT7shgdlI9H6Y74AuPAVlt3dM3SManJrC
         6zeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719448919; x=1720053719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hNtSE/Sz58dIQftFvxUpsZScMic73JvgAp5RjxHCtMo=;
        b=PvHJsKgnbA5V86MH4Eir+6Agv4y50SvYe+ikB0V0JG7qXTGTncomYDx2ghTKfgeQO/
         0DSmyDyv8DPfPkT+KDvfsNb1HRpevSozC3Zqw4IwXrwAftRr/17nkEGRs/NSfk1ba2bX
         abSkenlkFh+PrdA4gcx3SNeCwSd9CIXVe5L57xPvzMtjtSkApbflFOMbEqmBIHth2wxS
         THi+H0JnLljwNkZx6iBZQT25TuEvu51anocPUzEJAe2Dx2u9TNBKPihq5Ao8OzBimdNM
         1JrPV4SpMXymUvoMHnPdPe7DnD8k0vT9QdxV9rltROz9eTznPy6lpTeXnWG9dWpDI9po
         CJUg==
X-Forwarded-Encrypted: i=1; AJvYcCULe+fpiGNd3ZgxxS9JpD5fyGs+c/oDIGDCiQlfE9iJGXqNnO6WWdRHp6+IbTtwnKUITXx37s+uPnsNpJNQdrqVnX0Z+nSuDgQ=
X-Gm-Message-State: AOJu0YyI2ykNmcKV97kEdOvpAJK+DWN/3sMHVWnLSVnZD9bIz47omxBu
	vvGBOH+gHK/SLbXpqUejwuxyx+gTwytlOqu93ln0DWcLXqVtV2bz
X-Google-Smtp-Source: AGHT+IGAhcT2eDUDZ74rH2P1sJ+J3V9c645Xhl4Ny+tSWQtCeAge7CY5C26plvvwf483sutA61JRHw==
X-Received: by 2002:a2e:b687:0:b0:2ec:57c7:c735 with SMTP id 38308e7fff4ca-2ec5b31d5fbmr85897281fa.35.1719448918966;
        Wed, 26 Jun 2024 17:41:58 -0700 (PDT)
Received: from localhost ([89.113.147.248])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee4a4bee20sm453591fa.104.2024.06.26.17.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 17:41:58 -0700 (PDT)
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
Subject: [PATCH net-next v3 02/10] net: pcs: xpcs: Split up xpcs_create() body to sub-functions
Date: Thu, 27 Jun 2024 03:41:22 +0300
Message-ID: <20240627004142.8106-3-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240627004142.8106-1-fancer.lancer@gmail.com>
References: <20240627004142.8106-1-fancer.lancer@gmail.com>
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

As an initial preparation before adding the fwnode-based DW XPCS device
support let's split the xpcs_create() function code up to a set of the
small sub-functions. Thus the xpcs_create() implementation will get to
look simpler and turn to be more coherent. Further updates will just touch
the new sub-functions a bit: add platform-specific device info, add the
reference clock getting and enabling.

The xpcs_create() method will now contain the next static methods calls:

xpcs_create_data() - create the DW XPCS device descriptor, pre-initialize
it' fields and increase the mdio device refcount-er;

xpcs_init_id() - find XPCS ID instance and save it in the device
descriptor;

xpcs_init_iface() - find MAC/PCS interface descriptor and perform
basic initialization specific to it: soft-reset, disable polling.

The update doesn't imply any semantic change but merely makes the code
looking simpler and more ready for adding new features support.

Note the xpcs_destroy() has been moved to being defined below the
xpcs_create_mdiodev() function as the driver now implies having the
protagonist-then-antagonist functions definition order.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

---

Changelog v2:
- Preserve the strict refcount-ing pattern. (@Russell)
---
 drivers/net/pcs/pcs-xpcs.c | 102 +++++++++++++++++++++++++------------
 1 file changed, 69 insertions(+), 33 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 99adbf15ab36..2dcfd0ff069a 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -1365,12 +1365,9 @@ static const struct phylink_pcs_ops xpcs_phylink_ops = {
 	.pcs_link_up = xpcs_link_up,
 };
 
-static struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev,
-				   phy_interface_t interface)
+static struct dw_xpcs *xpcs_create_data(struct mdio_device *mdiodev)
 {
 	struct dw_xpcs *xpcs;
-	u32 xpcs_id;
-	int i, ret;
 
 	xpcs = kzalloc(sizeof(*xpcs), GFP_KERNEL);
 	if (!xpcs)
@@ -1378,59 +1375,89 @@ static struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev,
 
 	mdio_device_get(mdiodev);
 	xpcs->mdiodev = mdiodev;
+	xpcs->pcs.ops = &xpcs_phylink_ops;
+	xpcs->pcs.neg_mode = true;
+	xpcs->pcs.poll = true;
+
+	return xpcs;
+}
+
+static void xpcs_free_data(struct dw_xpcs *xpcs)
+{
+	mdio_device_put(xpcs->mdiodev);
+	kfree(xpcs);
+}
+
+static int xpcs_init_id(struct dw_xpcs *xpcs)
+{
+	u32 xpcs_id;
+	int i, ret;
 
 	xpcs_id = xpcs_get_id(xpcs);
 
 	for (i = 0; i < ARRAY_SIZE(xpcs_id_list); i++) {
 		const struct xpcs_id *entry = &xpcs_id_list[i];
-		const struct xpcs_compat *compat;
 
 		if ((xpcs_id & entry->mask) != entry->id)
 			continue;
 
 		xpcs->id = entry;
 
-		compat = xpcs_find_compat(entry, interface);
-		if (!compat) {
-			ret = -ENODEV;
-			goto out;
-		}
+		break;
+	}
 
-		ret = xpcs_dev_flag(xpcs);
-		if (ret)
-			goto out;
+	if (!xpcs->id)
+		return -ENODEV;
 
-		xpcs->pcs.ops = &xpcs_phylink_ops;
-		xpcs->pcs.neg_mode = true;
+	ret = xpcs_dev_flag(xpcs);
+	if (ret < 0)
+		return ret;
 
-		if (xpcs->dev_flag != DW_DEV_TXGBE) {
-			xpcs->pcs.poll = true;
+	return 0;
+}
 
-			ret = xpcs_soft_reset(xpcs, compat);
-			if (ret)
-				goto out;
-		}
+static int xpcs_init_iface(struct dw_xpcs *xpcs, phy_interface_t interface)
+{
+	const struct xpcs_compat *compat;
 
-		return xpcs;
+	compat = xpcs_find_compat(xpcs->id, interface);
+	if (!compat)
+		return -EINVAL;
+
+	if (xpcs->dev_flag == DW_DEV_TXGBE) {
+		xpcs->pcs.poll = false;
+		return 0;
 	}
 
-	ret = -ENODEV;
+	return xpcs_soft_reset(xpcs, compat);
+}
+
+static struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev,
+				   phy_interface_t interface)
+{
+	struct dw_xpcs *xpcs;
+	int ret;
+
+	xpcs = xpcs_create_data(mdiodev);
+	if (IS_ERR(xpcs))
+		return xpcs;
+
+	ret = xpcs_init_id(xpcs);
+	if (ret)
+		goto out;
+
+	ret = xpcs_init_iface(xpcs, interface);
+	if (ret)
+		goto out;
+
+	return xpcs;
 
 out:
-	mdio_device_put(mdiodev);
-	kfree(xpcs);
+	xpcs_free_data(xpcs);
 
 	return ERR_PTR(ret);
 }
 
-void xpcs_destroy(struct dw_xpcs *xpcs)
-{
-	if (xpcs)
-		mdio_device_put(xpcs->mdiodev);
-	kfree(xpcs);
-}
-EXPORT_SYMBOL_GPL(xpcs_destroy);
-
 struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr,
 				    phy_interface_t interface)
 {
@@ -1455,5 +1482,14 @@ struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr,
 }
 EXPORT_SYMBOL_GPL(xpcs_create_mdiodev);
 
+void xpcs_destroy(struct dw_xpcs *xpcs)
+{
+	if (!xpcs)
+		return;
+
+	xpcs_free_data(xpcs);
+}
+EXPORT_SYMBOL_GPL(xpcs_destroy);
+
 MODULE_DESCRIPTION("Synopsys DesignWare XPCS library");
 MODULE_LICENSE("GPL v2");
-- 
2.43.0

