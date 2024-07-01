Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D5491E799
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2024 20:32:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HFUXgHDj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCZQt1RJ7z3fqR
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2024 04:32:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HFUXgHDj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCZMD4knKz3dHt
	for <openbmc@lists.ozlabs.org>; Tue,  2 Jul 2024 04:29:28 +1000 (AEST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5295e488248so4271255e87.2
        for <openbmc@lists.ozlabs.org>; Mon, 01 Jul 2024 11:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719858564; x=1720463364; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvlJk8oP+tmHFi1mC8gnmikt6FGOAr8ZwLY+NpWyHOQ=;
        b=HFUXgHDj9qFwUTSFgcVU67gbgPkIKxX1c0YU319UCiNeNx+Zg5xUIRny7eLsxNmbBC
         5UCJy5wqJoPuBjQkkzsZx47Pwbog99iu4AJejWlHUFkpxupT6uk0TAk6lBm3DFH2gW5i
         vfBe0NjZk3fug7K24rAXbSzs1Htuws/33DsWVrvgnMnPrPqhsbeg1cT2cDxD5NxaYJuK
         tyJnxCnPonXdLVZ0fny9JW5xMcEBsd8DugR90sesyqs7GdSTaWBZ3ESlpNvVOMMTwhRb
         Kt9K8h+JFXm6liUdpQ/ydBnbz4PKm62lrDjRppPiwXq8c8mtf3obSmgfkGO9YKHZ0gau
         wzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719858564; x=1720463364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvlJk8oP+tmHFi1mC8gnmikt6FGOAr8ZwLY+NpWyHOQ=;
        b=vpq37l5epr1Z2PwWwXxs4LBtmpYeMX+CUUgUOIVCiHz8YkdQHP5cSdqyky/Dt0M674
         d6zpYo5JrFvBjFTAGGcOlmgieOn0hTvn9RZ0UU64mKFYpHgxJKDthFdwvfvXDm6JwVW8
         +oX8GMFfHz8/MKyL4jGq9LCiiEVSKQ3ozpHKkZ6xp4dvZ6FhMz+u5WWd2ZPFyFWkhdsA
         1Z6Kxgx0gbQ4oWHgFuQSNPwBdNXtB4CO4BckLLwUEJcoLJDf7EU9E35jisr/aEjSorjO
         TYkNkX6B9UQYd26hN4MPZ7Ygxp5QAZdusqHReTU6UfUU7R+jxZgpShteTSfOzY2K3qbE
         vh7g==
X-Forwarded-Encrypted: i=1; AJvYcCX3H9VYEWqIsjVaqlY2PhaBld1wyUEVuLfUin13Cnb/+Te/b+VOXWQn8SfyZvm/q2bP+LhOfi1skZHhR0f/KVFwAPCwNN+EITc=
X-Gm-Message-State: AOJu0YxUnCfxv2wNHurK87QjsilUndNSSvUAeO/oKHeF/hZ++mOspDCd
	xh/JI7Up4jmrxCSzUiS7J4Aen6dsWC4w6uWyKUSm6MGnAIvu4zIf
X-Google-Smtp-Source: AGHT+IGqL6/dCwF3L6iDrxmgBaANQBOWFRcd6ouou8X4pnSp7jsDRzM2DgR/vflHym+AIxFL9iW86A==
X-Received: by 2002:a05:6512:6c3:b0:52c:def3:44b with SMTP id 2adb3069b0e04-52e8268b40amr4149294e87.31.1719858563288;
        Mon, 01 Jul 2024 11:29:23 -0700 (PDT)
Received: from localhost ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab27837sm1501644e87.140.2024.07.01.11.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 11:29:22 -0700 (PDT)
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
Subject: [PATCH net-next v4 03/10] net: pcs: xpcs: Convert xpcs_id to dw_xpcs_desc
Date: Mon,  1 Jul 2024 21:28:34 +0300
Message-ID: <20240701182900.13402-4-fancer.lancer@gmail.com>
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

A structure with the PCS/PMA MMD IDs data is being introduced in one of
the next commits. In order to prevent the names ambiguity let's convert
the xpcs_id structure name to dw_xpcs_desc. The later version is more
suitable since the structure content is indeed the device descriptor
containing the data and callbacks required for the driver to correctly set
the device up.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>

---

Changelog v2:
- This is a new patch introduced on v2 stage of the review.

Changelog v4:
- Rename "entry" local variable to "desc". (@Andrew)
---
 drivers/net/pcs/pcs-xpcs.c   | 32 ++++++++++++++++----------------
 include/linux/pcs/pcs-xpcs.h |  4 ++--
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 2dcfd0ff069a..4ed29df8c963 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -151,19 +151,19 @@ struct xpcs_compat {
 	int (*pma_config)(struct dw_xpcs *xpcs);
 };
 
-struct xpcs_id {
+struct dw_xpcs_desc {
 	u32 id;
 	u32 mask;
 	const struct xpcs_compat *compat;
 };
 
-static const struct xpcs_compat *xpcs_find_compat(const struct xpcs_id *id,
-						  phy_interface_t interface)
+static const struct xpcs_compat *
+xpcs_find_compat(const struct dw_xpcs_desc *desc, phy_interface_t interface)
 {
 	int i, j;
 
 	for (i = 0; i < DW_XPCS_INTERFACE_MAX; i++) {
-		const struct xpcs_compat *compat = &id->compat[i];
+		const struct xpcs_compat *compat = &desc->compat[i];
 
 		for (j = 0; j < compat->num_interfaces; j++)
 			if (compat->interface[j] == interface)
@@ -177,7 +177,7 @@ int xpcs_get_an_mode(struct dw_xpcs *xpcs, phy_interface_t interface)
 {
 	const struct xpcs_compat *compat;
 
-	compat = xpcs_find_compat(xpcs->id, interface);
+	compat = xpcs_find_compat(xpcs->desc, interface);
 	if (!compat)
 		return -ENODEV;
 
@@ -612,7 +612,7 @@ static int xpcs_validate(struct phylink_pcs *pcs, unsigned long *supported,
 	int i;
 
 	xpcs = phylink_pcs_to_xpcs(pcs);
-	compat = xpcs_find_compat(xpcs->id, state->interface);
+	compat = xpcs_find_compat(xpcs->desc, state->interface);
 	if (!compat)
 		return -EINVAL;
 
@@ -633,7 +633,7 @@ void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces)
 	int i, j;
 
 	for (i = 0; i < DW_XPCS_INTERFACE_MAX; i++) {
-		const struct xpcs_compat *compat = &xpcs->id->compat[i];
+		const struct xpcs_compat *compat = &xpcs->desc->compat[i];
 
 		for (j = 0; j < compat->num_interfaces; j++)
 			__set_bit(compat->interface[j], interfaces);
@@ -853,7 +853,7 @@ int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
 	const struct xpcs_compat *compat;
 	int ret;
 
-	compat = xpcs_find_compat(xpcs->id, interface);
+	compat = xpcs_find_compat(xpcs->desc, interface);
 	if (!compat)
 		return -ENODEV;
 
@@ -1118,7 +1118,7 @@ static void xpcs_get_state(struct phylink_pcs *pcs,
 	const struct xpcs_compat *compat;
 	int ret;
 
-	compat = xpcs_find_compat(xpcs->id, state->interface);
+	compat = xpcs_find_compat(xpcs->desc, state->interface);
 	if (!compat)
 		return;
 
@@ -1341,7 +1341,7 @@ static const struct xpcs_compat nxp_sja1110_xpcs_compat[DW_XPCS_INTERFACE_MAX] =
 	},
 };
 
-static const struct xpcs_id xpcs_id_list[] = {
+static const struct dw_xpcs_desc xpcs_desc_list[] = {
 	{
 		.id = DW_XPCS_ID,
 		.mask = DW_XPCS_ID_MASK,
@@ -1395,18 +1395,18 @@ static int xpcs_init_id(struct dw_xpcs *xpcs)
 
 	xpcs_id = xpcs_get_id(xpcs);
 
-	for (i = 0; i < ARRAY_SIZE(xpcs_id_list); i++) {
-		const struct xpcs_id *entry = &xpcs_id_list[i];
+	for (i = 0; i < ARRAY_SIZE(xpcs_desc_list); i++) {
+		const struct dw_xpcs_desc *desc = &xpcs_desc_list[i];
 
-		if ((xpcs_id & entry->mask) != entry->id)
+		if ((xpcs_id & desc->mask) != desc->id)
 			continue;
 
-		xpcs->id = entry;
+		xpcs->desc = desc;
 
 		break;
 	}
 
-	if (!xpcs->id)
+	if (!xpcs->desc)
 		return -ENODEV;
 
 	ret = xpcs_dev_flag(xpcs);
@@ -1420,7 +1420,7 @@ static int xpcs_init_iface(struct dw_xpcs *xpcs, phy_interface_t interface)
 {
 	const struct xpcs_compat *compat;
 
-	compat = xpcs_find_compat(xpcs->id, interface);
+	compat = xpcs_find_compat(xpcs->desc, interface);
 	if (!compat)
 		return -EINVAL;
 
diff --git a/include/linux/pcs/pcs-xpcs.h b/include/linux/pcs/pcs-xpcs.h
index 8dfe90295f12..e706bd16b986 100644
--- a/include/linux/pcs/pcs-xpcs.h
+++ b/include/linux/pcs/pcs-xpcs.h
@@ -28,11 +28,11 @@
 /* dev_flag */
 #define DW_DEV_TXGBE			BIT(0)
 
-struct xpcs_id;
+struct dw_xpcs_desc;
 
 struct dw_xpcs {
+	const struct dw_xpcs_desc *desc;
 	struct mdio_device *mdiodev;
-	const struct xpcs_id *id;
 	struct phylink_pcs pcs;
 	phy_interface_t interface;
 	int dev_flag;
-- 
2.43.0

