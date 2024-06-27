Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1158E919C12
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 02:47:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AqrvU80M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8fzM46lmz3fsn
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 10:47:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AqrvU80M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8fsX2mT5z3cXF
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 10:42:08 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-52cdc4d221eso5876308e87.3
        for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 17:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719448926; x=1720053726; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtB2YK+hWybOfhRjGVARuGF16LYCosZHExgsepw9jig=;
        b=AqrvU80MKQsOfdtUi1NwEr8bNlfUF6cvAD7cDYWIiCClqspPoDz7hNgqDTAXt3n9Es
         Vq3l3VNLXnS1t6tjDcCxmNPcrLr7i6LlXbZVx5SqiXKByrlXadCHuv6Ez2bF4XvVHDHs
         5VYxAAh1pU27LcdCCj/voIGmfWfRUL6Joks5faVUo563RVJ2UiD6ZWti/E+nx/0X58zh
         Gy9GTQikpJmOCZMlzEyFpACuL8BNNkWD8hc381xIVJhgChGuZkZm4vGP23JIqhpqoiRn
         8ZLB2SW/w7QXanM+L1OYcT5e5rWpZoIJ02agffzNuX40DhFeQ5rGZiHTjmimtqz27t2j
         AWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719448926; x=1720053726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtB2YK+hWybOfhRjGVARuGF16LYCosZHExgsepw9jig=;
        b=aLWz4WB6NMUtw8X6BCNyxIMei0rBZ33mrjztOjNhyzou9GGvKa0x8BRFrJksmV5CpJ
         z57ixK4pbt4iC4RouIEHgpzcecx0MyF4Ks5kSdkZhoX3DhVgEiNsvnGkYlCyuzDMJ+1z
         bDboihFDqGSeJ+MmjGVfxyGRS5pIcJKSOR8JzFcS3nE4DlJJc/9pMxqVRbq2FawVhFfv
         cYZ747qN2VFyo3hxH/DuZcD6tY/MaXAEgZaMuADK+rXBQXLQDp0e2uqlYVnjKb0rBVvW
         5LhycTwqGDReOwVB+Wxf3FDE28YKFNxPLABgEyOBfUG/GzSMfFjSH1c43UBXuKv5L94T
         Q3Uw==
X-Forwarded-Encrypted: i=1; AJvYcCV0nSlv2B4vC/8GbeD6vf8gdyn7jkXpvdAJqctYdqRruXEMhmh8htMpRVSKXOwlOpC64yDi3ECDtCnacFCFQlOd+jhWVxpImzg=
X-Gm-Message-State: AOJu0Yw0QqrnRljPrcewnuOGtmBswkSIQe0VJhN8Bk8sELJygfURmyUX
	hXY3DAu9weYRlXhZCEfOawKecbKYFx7b8MH8eZ2WVY6InKi21bph
X-Google-Smtp-Source: AGHT+IHxaLCW38kuyRPYtwKtqYnUr1kQ6nnKVnwVgutP5GD+IIil/dNyiX4qqLd7rBsmko9cdS8wMQ==
X-Received: by 2002:a05:6512:20ce:b0:52c:977b:a111 with SMTP id 2adb3069b0e04-52ce18398b8mr6566177e87.30.1719448925748;
        Wed, 26 Jun 2024 17:42:05 -0700 (PDT)
Received: from localhost ([89.113.147.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e712a74acsm19574e87.9.2024.06.26.17.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 17:42:05 -0700 (PDT)
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
Subject: [PATCH net-next v3 05/10] net: pcs: xpcs: Introduce DW XPCS info structure
Date: Thu, 27 Jun 2024 03:41:25 +0300
Message-ID: <20240627004142.8106-6-fancer.lancer@gmail.com>
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

The being introduced structure will preserve the PCS and PMA IDs retrieved
from the respective DW XPCS MMDs or potentially pre-defined by the client
drivers. (The later change will be introduced later in the framework of
the commit adding the memory-mapped DW XPCS devices support.)

The structure fields are filled in in the xpcs_get_id() function, which
used to be responsible for the PCS Device ID getting only. Besides of the
PCS ID the method now fetches the PMA/PMD IDs too from MMD 1, which used
to be done in xpcs_dev_flag(). The retrieved PMA ID will be from now
utilized for the PMA-specific tweaks like it was introduced for the
Wangxun TxGBE PCS in the commit f629acc6f210 ("net: pcs: xpcs: support to
switch mode for Wangxun NICs").

Note 1. The xpcs_get_id() error-handling semantics has been changed. From
now the error number will be returned from the function. There is no point
in the next IOs or saving 0xffs and then looping over the actual device
IDs if device couldn't be reached. -ENODEV will be returned if the very
first IO operation failed thus indicating that no device could be found.

Note 2. The PCS and PMA IDs macros have been converted to enum'es. The
enum'es will be populated later in another commit with the virtual IDs
identifying the DW XPCS devices which have some platform-specifics, but
have been synthesized with the default PCS/PMA ID.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

---

Changelog v2:
- This is a new patch introduced due to the commit adding the Wangxun
  TXGbe PCS support.
---
 drivers/net/pcs/pcs-xpcs.c   | 104 +++++++++++++++++------------------
 include/linux/pcs/pcs-xpcs.h |  28 ++++++----
 2 files changed, 67 insertions(+), 65 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 0af6b5995113..e8d5fd43a357 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -237,29 +237,6 @@ int xpcs_write_vpcs(struct dw_xpcs *xpcs, int reg, u16 val)
 	return xpcs_write_vendor(xpcs, MDIO_MMD_PCS, reg, val);
 }
 
-static int xpcs_dev_flag(struct dw_xpcs *xpcs)
-{
-	int ret, oui;
-
-	ret = xpcs_read(xpcs, MDIO_MMD_PMAPMD, MDIO_DEVID1);
-	if (ret < 0)
-		return ret;
-
-	oui = ret;
-
-	ret = xpcs_read(xpcs, MDIO_MMD_PMAPMD, MDIO_DEVID2);
-	if (ret < 0)
-		return ret;
-
-	ret = (ret >> 10) & 0x3F;
-	oui |= ret << 16;
-
-	if (oui == DW_OUI_WX)
-		xpcs->dev_flag = DW_DEV_TXGBE;
-
-	return 0;
-}
-
 static int xpcs_poll_reset(struct dw_xpcs *xpcs, int dev)
 {
 	/* Poll until the reset bit clears (50ms per retry == 0.6 sec) */
@@ -684,7 +661,7 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
 {
 	int ret, mdio_ctrl, tx_conf;
 
-	if (xpcs->dev_flag == DW_DEV_TXGBE)
+	if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID)
 		xpcs_write_vpcs(xpcs, DW_VR_XS_PCS_DIG_CTRL1, DW_CL37_BP | DW_EN_VSMMD1);
 
 	/* For AN for C37 SGMII mode, the settings are :-
@@ -722,7 +699,7 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
 	ret |= (DW_VR_MII_PCS_MODE_C37_SGMII <<
 		DW_VR_MII_AN_CTRL_PCS_MODE_SHIFT &
 		DW_VR_MII_PCS_MODE_MASK);
-	if (xpcs->dev_flag == DW_DEV_TXGBE) {
+	if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID) {
 		ret |= DW_VR_MII_AN_CTRL_8BIT;
 		/* Hardware requires it to be PHY side SGMII */
 		tx_conf = DW_VR_MII_TX_CONFIG_PHY_SIDE_SGMII;
@@ -744,7 +721,7 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
 	else
 		ret &= ~DW_VR_MII_DIG_CTRL1_MAC_AUTO_SW;
 
-	if (xpcs->dev_flag == DW_DEV_TXGBE)
+	if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID)
 		ret |= DW_VR_MII_DIG_CTRL1_PHY_MODE_CTRL;
 
 	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_DIG_CTRL1, ret);
@@ -766,7 +743,7 @@ static int xpcs_config_aneg_c37_1000basex(struct dw_xpcs *xpcs,
 	int ret, mdio_ctrl, adv;
 	bool changed = 0;
 
-	if (xpcs->dev_flag == DW_DEV_TXGBE)
+	if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID)
 		xpcs_write_vpcs(xpcs, DW_VR_XS_PCS_DIG_CTRL1, DW_CL37_BP | DW_EN_VSMMD1);
 
 	/* According to Chap 7.12, to set 1000BASE-X C37 AN, AN must
@@ -857,7 +834,7 @@ int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
 	if (!compat)
 		return -ENODEV;
 
-	if (xpcs->dev_flag == DW_DEV_TXGBE) {
+	if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID) {
 		ret = txgbe_xpcs_switch_mode(xpcs, interface);
 		if (ret)
 			return ret;
@@ -1229,44 +1206,66 @@ static void xpcs_an_restart(struct phylink_pcs *pcs)
 	}
 }
 
-static u32 xpcs_get_id(struct dw_xpcs *xpcs)
+static int xpcs_get_id(struct dw_xpcs *xpcs)
 {
 	int ret;
 	u32 id;
 
-	/* First, search C73 PCS using PCS MMD */
+	/* First, search C73 PCS using PCS MMD 3. Return ENODEV if communication
+	 * failed indicating that device couldn't be reached.
+	 */
 	ret = xpcs_read(xpcs, MDIO_MMD_PCS, MII_PHYSID1);
 	if (ret < 0)
-		return 0xffffffff;
+		return -ENODEV;
 
 	id = ret << 16;
 
 	ret = xpcs_read(xpcs, MDIO_MMD_PCS, MII_PHYSID2);
 	if (ret < 0)
-		return 0xffffffff;
+		return ret;
 
-	/* If Device IDs are not all zeros or all ones,
-	 * we found C73 AN-type device
+	id |= ret;
+
+	/* If Device IDs are not all zeros or ones, then 10GBase-X/R or C73
+	 * KR/KX4 PCS found. Otherwise fallback to detecting 1000Base-X or C37
+	 * PCS in MII MMD 31.
 	 */
-	if ((id | ret) && (id | ret) != 0xffffffff)
-		return id | ret;
+	if (!id || id == 0xffffffff) {
+		ret = xpcs_read(xpcs, MDIO_MMD_VEND2, MII_PHYSID1);
+		if (ret < 0)
+			return ret;
+
+		id = ret << 16;
+
+		ret = xpcs_read(xpcs, MDIO_MMD_VEND2, MII_PHYSID2);
+		if (ret < 0)
+			return ret;
 
-	/* Next, search C37 PCS using Vendor-Specific MII MMD */
-	ret = xpcs_read(xpcs, MDIO_MMD_VEND2, MII_PHYSID1);
+		id |= ret;
+	}
+
+	xpcs->info.pcs = id;
+
+	/* Find out PMA/PMD ID from MMD 1 device ID registers */
+	ret = xpcs_read(xpcs, MDIO_MMD_PMAPMD, MDIO_DEVID1);
 	if (ret < 0)
-		return 0xffffffff;
+		return ret;
 
-	id = ret << 16;
+	id = ret;
 
-	ret = xpcs_read(xpcs, MDIO_MMD_VEND2, MII_PHYSID2);
+	ret = xpcs_read(xpcs, MDIO_MMD_PMAPMD, MDIO_DEVID2);
 	if (ret < 0)
-		return 0xffffffff;
+		return ret;
+
+	/* Note the inverted dword order and masked out Model/Revision numbers
+	 * with respect to what is done with the PCS ID...
+	 */
+	ret = (ret >> 10) & 0x3F;
+	id |= ret << 16;
 
-	/* If Device IDs are not all zeros, we found C37 AN-type device */
-	if (id | ret)
-		return id | ret;
+	xpcs->info.pma = id;
 
-	return 0xffffffff;
+	return 0;
 }
 
 static const struct dw_xpcs_compat synopsys_xpcs_compat[DW_XPCS_INTERFACE_MAX] = {
@@ -1390,15 +1389,16 @@ static void xpcs_free_data(struct dw_xpcs *xpcs)
 
 static int xpcs_init_id(struct dw_xpcs *xpcs)
 {
-	u32 xpcs_id;
 	int i, ret;
 
-	xpcs_id = xpcs_get_id(xpcs);
+	ret = xpcs_get_id(xpcs);
+	if (ret < 0)
+		return ret;
 
 	for (i = 0; i < ARRAY_SIZE(xpcs_desc_list); i++) {
 		const struct dw_xpcs_desc *entry = &xpcs_desc_list[i];
 
-		if ((xpcs_id & entry->mask) != entry->id)
+		if ((xpcs->info.pcs & entry->mask) != entry->id)
 			continue;
 
 		xpcs->desc = entry;
@@ -1409,10 +1409,6 @@ static int xpcs_init_id(struct dw_xpcs *xpcs)
 	if (!xpcs->desc)
 		return -ENODEV;
 
-	ret = xpcs_dev_flag(xpcs);
-	if (ret < 0)
-		return ret;
-
 	return 0;
 }
 
@@ -1424,7 +1420,7 @@ static int xpcs_init_iface(struct dw_xpcs *xpcs, phy_interface_t interface)
 	if (!compat)
 		return -EINVAL;
 
-	if (xpcs->dev_flag == DW_DEV_TXGBE) {
+	if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID) {
 		xpcs->pcs.poll = false;
 		return 0;
 	}
diff --git a/include/linux/pcs/pcs-xpcs.h b/include/linux/pcs/pcs-xpcs.h
index e706bd16b986..1dc60f5e653f 100644
--- a/include/linux/pcs/pcs-xpcs.h
+++ b/include/linux/pcs/pcs-xpcs.h
@@ -9,11 +9,7 @@
 
 #include <linux/phy.h>
 #include <linux/phylink.h>
-
-#define NXP_SJA1105_XPCS_ID		0x00000010
-#define NXP_SJA1110_XPCS_ID		0x00000020
-#define DW_XPCS_ID			0x7996ced0
-#define DW_XPCS_ID_MASK			0xffffffff
+#include <linux/types.h>
 
 /* AN mode */
 #define DW_AN_C73			1
@@ -22,20 +18,30 @@
 #define DW_AN_C37_1000BASEX		4
 #define DW_10GBASER			5
 
-/* device vendor OUI */
-#define DW_OUI_WX			0x0018fc80
+struct dw_xpcs_desc;
 
-/* dev_flag */
-#define DW_DEV_TXGBE			BIT(0)
+enum dw_xpcs_pcs_id {
+	NXP_SJA1105_XPCS_ID = 0x00000010,
+	NXP_SJA1110_XPCS_ID = 0x00000020,
+	DW_XPCS_ID = 0x7996ced0,
+	DW_XPCS_ID_MASK = 0xffffffff,
+};
 
-struct dw_xpcs_desc;
+enum dw_xpcs_pma_id {
+	WX_TXGBE_XPCS_PMA_10G_ID = 0x0018fc80,
+};
+
+struct dw_xpcs_info {
+	u32 pcs;
+	u32 pma;
+};
 
 struct dw_xpcs {
+	struct dw_xpcs_info info;
 	const struct dw_xpcs_desc *desc;
 	struct mdio_device *mdiodev;
 	struct phylink_pcs pcs;
 	phy_interface_t interface;
-	int dev_flag;
 };
 
 int xpcs_get_an_mode(struct dw_xpcs *xpcs, phy_interface_t interface);
-- 
2.43.0

