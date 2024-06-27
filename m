Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F24AE919C00
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 02:45:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OAGV2Tbm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8fwq34Dtz3fmp
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 10:44:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OAGV2Tbm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8fsS75LVz3cV4
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 10:42:04 +1000 (AEST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2ec3f875e68so81365791fa.0
        for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 17:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719448922; x=1720053722; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1aUmiEcMZ+VAXZ9+5FXW90knS868BRwEpAdgXfPTGM=;
        b=OAGV2TbmO0+0leJGV+QSk9ovVrBqHgqj4KgVfuIx/KqGwdfuWHu6mUXJE3S0qNVQOQ
         GJjMdbiOMtYU7CkEPxPypEmvzbByz0lxbB3Ipugnelc6iHdbDHWBSK92uWBVnZ1nx1bG
         V4iO+XeLyCBIQf2ronBoJ1b41C1OTIhdXayd5bRtc5boeFC8CR0cmHicDJ0HDvgsUCm6
         TMZiTv8IH1H3RdakWQHyuFgi5V63Dn+owL10rM7Xwg7K8FyFCzuOEKxfRJIh03tkFY5o
         r1XuNAUSIe2Fr0tOqVh5o8iFzihRNvAXB134FShFusEmUl5nxSOE3FFXRCokS9ea0Wxi
         wuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719448922; x=1720053722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1aUmiEcMZ+VAXZ9+5FXW90knS868BRwEpAdgXfPTGM=;
        b=GQfE9WH3OLao6tpLCyXBj/Bg9pDYj21N2FSoPVfWz9NhJYpyIU79mxzlmqR14rREkB
         FhVh/lPKlcPBK7wG5+Nqqs9jSdzTZIEyGgGyJhhmycQp6piOt6lhCSRJyPvVrsSsp8mx
         6qfBGg6T6d1gwOp99JQ4S+n0dDQpAI/OatPIb+EYPD+FzyC/q4xK/kvwiLnfNwsGcMy2
         whCFXk35bvm2IOJnyO3VD2L7DcwOAp2fr0wKXdmrJ4RCwg5aW4MNWGnrXyEPnD9/jjtx
         FWvVOD5ckDuNLv2tPBsluuClr81t9zmdnaqdull96HZLhUb2o6/xfjb1dLLHt8L1OHbf
         CaIw==
X-Forwarded-Encrypted: i=1; AJvYcCVqCErI4j+VJG0cW2ZkqTnE4+Lyveass+QnrN196SG4Qc8A6eG+Cj2eFlV2UwHmTroz2mNHpScQkLqxNkhM2lGntJJVrlVG/Yw=
X-Gm-Message-State: AOJu0Yy/5apbGtWABsONto+GQR2vMViQSElfmD53m9GOFtiRdXyknITC
	2ikPc+7j9PnrSwYilRlqFHTHItwiXJJwgaD0qatOAT27rLHc8fKj
X-Google-Smtp-Source: AGHT+IFmjRGW10WUGPT7cZAYEVgU7kOFgeFWXkk/1Ljf051iR+iI2oXN70rlPpaeq6HVJuBIApnqgA==
X-Received: by 2002:a05:651c:220e:b0:2ec:5e2e:39a8 with SMTP id 38308e7fff4ca-2ec5e2e3aaamr82947591fa.3.1719448921454;
        Wed, 26 Jun 2024 17:42:01 -0700 (PDT)
Received: from localhost ([89.113.147.248])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee4a4a8ecasm474761fa.88.2024.06.26.17.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 17:42:01 -0700 (PDT)
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
Subject: [PATCH net-next v3 03/10] net: pcs: xpcs: Convert xpcs_id to dw_xpcs_desc
Date: Thu, 27 Jun 2024 03:41:23 +0300
Message-ID: <20240627004142.8106-4-fancer.lancer@gmail.com>
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

A structure with the PCS/PMA MMD IDs data is being introduced in one of
the next commits. In order to prevent the names ambiguity let's convert
the xpcs_id structure name to dw_xpcs_desc. The later version is more
suitable since the structure content is indeed the device descriptor
containing the data and callbacks required for the driver to correctly set
the device up.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

---

Changelog v2:
- This is a new patch introduced on v2 stage of the review.
---
 drivers/net/pcs/pcs-xpcs.c   | 30 +++++++++++++++---------------
 include/linux/pcs/pcs-xpcs.h |  4 ++--
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 2dcfd0ff069a..48c61975db22 100644
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
+		const struct dw_xpcs_desc *entry = &xpcs_desc_list[i];
 
 		if ((xpcs_id & entry->mask) != entry->id)
 			continue;
 
-		xpcs->id = entry;
+		xpcs->desc = entry;
 
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

