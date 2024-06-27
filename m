Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5B2919C04
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 02:46:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=I4v0+kIR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8fyQ1ZRWz3fpb
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 10:46:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=I4v0+kIR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8fsV2TDWz3cW5
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 10:42:06 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5295e488248so8630136e87.2
        for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 17:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719448923; x=1720053723; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEjeTMFoJBv+1cocMj3lNi4jSjrQ54Kw3PRV3mrle98=;
        b=I4v0+kIRU554wheyuC0+JWRuFdHn+801yGSixnQTZX8N2wxXU3P52jApVXJ3ZNuKYF
         NF7Dc+wQyVu6HxAuIVg8YUuAY8Aq6Ds8fULYkE8nEvK3cZLiZ4tBye4Wy6PJbuw4UN1T
         nAjhSo8SJxBnnt+aSZSwYYCNFUTy6zSEYAhTDJZ7qe9u9W98SFbHZHzcVS4miPgmRg59
         jibKO4Vy0bnfcW/AzqkSTL5OqHC/RwnmIZXkm1n4B0cc2p8lkHe9PDxZCJ88FrgLikAP
         BN3uWiuGpACFCPbQgqt+EmVfyydybbKcOnpQNKkz8HzpdhZ+LsHfagPDdyzs83Zkl7W0
         Jrhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719448923; x=1720053723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEjeTMFoJBv+1cocMj3lNi4jSjrQ54Kw3PRV3mrle98=;
        b=mp9wgidPKlqDmIOvh3HAiqiYL00o2RnkX5cOif6RVfnNCQpB/McdW83/jXotc0XKGe
         4g0/spl9vNellTWRrf95CD/jwSqraoWd+NQo29SDwbCblo9pRhKnf5jf2rspvI6iPqvc
         3XI9VSXJfXi7/UFMaRL1AEIsHMFmv6Mgb+AIy5AviXJg/QYx7gK8yv//34+vo4mWg5AY
         nziJ+pFEb4OLXTzndgmzLBIMwwNmP/D4WYhPgYIsDWe00prw0+e/pzSNxfLhrIkfFoWc
         BHsZxsTkK5XhXCmdgd3XHnzXrOUeyezeb8iSKWfV+wtb03s5BTJm4t7CNPk6Irjsy8ie
         jifA==
X-Forwarded-Encrypted: i=1; AJvYcCWUtXoS+yKFV8FaxAEx4Hwh7/tDhG4BTN1gbQNiv3p8VSIyBdNvvZik0etfgcv82ztpfZyAA+1fr6aOmahMRiYfxWsmioOHOug=
X-Gm-Message-State: AOJu0Yx/2OJieWtv6p8nGgRh0VTgf1pojQsO7OE+S2P7pgpMe4cSRZv7
	XfvjOcj5zTchAL6gf+T2C2uQuUfgk9xHe5+kOcHo2m3LnuXsHsy4
X-Google-Smtp-Source: AGHT+IEZnBCiwa5u+MnhrS3/N8ElIrju/03EKXOXmPVOF2Oo/pX2oZFXj1lh00CEXzHr/qqGlGTW4A==
X-Received: by 2002:a05:6512:3a2:b0:52c:df8c:72cc with SMTP id 2adb3069b0e04-52ce185de61mr6706016e87.43.1719448923455;
        Wed, 26 Jun 2024 17:42:03 -0700 (PDT)
Received: from localhost ([89.113.147.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e712b3656sm20207e87.90.2024.06.26.17.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 17:42:03 -0700 (PDT)
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
Subject: [PATCH net-next v3 04/10] net: pcs: xpcs: Convert xpcs_compat to dw_xpcs_compat
Date: Thu, 27 Jun 2024 03:41:24 +0300
Message-ID: <20240627004142.8106-5-fancer.lancer@gmail.com>
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

The xpcs_compat structure has been left as the only dw-prefix-less
structure since the previous commit. Let's unify at least the structures
naming in the driver by adding the dw_-prefix to it.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

---

Changelog v2:
- This is a new patch introduced on v2 stage of the review.
---
 drivers/net/pcs/pcs-xpcs.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 48c61975db22..0af6b5995113 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -143,7 +143,7 @@ enum {
 	DW_XPCS_INTERFACE_MAX,
 };
 
-struct xpcs_compat {
+struct dw_xpcs_compat {
 	const int *supported;
 	const phy_interface_t *interface;
 	int num_interfaces;
@@ -154,16 +154,16 @@ struct xpcs_compat {
 struct dw_xpcs_desc {
 	u32 id;
 	u32 mask;
-	const struct xpcs_compat *compat;
+	const struct dw_xpcs_compat *compat;
 };
 
-static const struct xpcs_compat *
+static const struct dw_xpcs_compat *
 xpcs_find_compat(const struct dw_xpcs_desc *desc, phy_interface_t interface)
 {
 	int i, j;
 
 	for (i = 0; i < DW_XPCS_INTERFACE_MAX; i++) {
-		const struct xpcs_compat *compat = &desc->compat[i];
+		const struct dw_xpcs_compat *compat = &desc->compat[i];
 
 		for (j = 0; j < compat->num_interfaces; j++)
 			if (compat->interface[j] == interface)
@@ -175,7 +175,7 @@ xpcs_find_compat(const struct dw_xpcs_desc *desc, phy_interface_t interface)
 
 int xpcs_get_an_mode(struct dw_xpcs *xpcs, phy_interface_t interface)
 {
-	const struct xpcs_compat *compat;
+	const struct dw_xpcs_compat *compat;
 
 	compat = xpcs_find_compat(xpcs->desc, interface);
 	if (!compat)
@@ -185,7 +185,7 @@ int xpcs_get_an_mode(struct dw_xpcs *xpcs, phy_interface_t interface)
 }
 EXPORT_SYMBOL_GPL(xpcs_get_an_mode);
 
-static bool __xpcs_linkmode_supported(const struct xpcs_compat *compat,
+static bool __xpcs_linkmode_supported(const struct dw_xpcs_compat *compat,
 				      enum ethtool_link_mode_bit_indices linkmode)
 {
 	int i;
@@ -277,7 +277,7 @@ static int xpcs_poll_reset(struct dw_xpcs *xpcs, int dev)
 }
 
 static int xpcs_soft_reset(struct dw_xpcs *xpcs,
-			   const struct xpcs_compat *compat)
+			   const struct dw_xpcs_compat *compat)
 {
 	int ret, dev;
 
@@ -418,7 +418,7 @@ static void xpcs_config_usxgmii(struct dw_xpcs *xpcs, int speed)
 }
 
 static int _xpcs_config_aneg_c73(struct dw_xpcs *xpcs,
-				 const struct xpcs_compat *compat)
+				 const struct dw_xpcs_compat *compat)
 {
 	int ret, adv;
 
@@ -463,7 +463,7 @@ static int _xpcs_config_aneg_c73(struct dw_xpcs *xpcs,
 }
 
 static int xpcs_config_aneg_c73(struct dw_xpcs *xpcs,
-				const struct xpcs_compat *compat)
+				const struct dw_xpcs_compat *compat)
 {
 	int ret;
 
@@ -482,7 +482,7 @@ static int xpcs_config_aneg_c73(struct dw_xpcs *xpcs,
 
 static int xpcs_aneg_done_c73(struct dw_xpcs *xpcs,
 			      struct phylink_link_state *state,
-			      const struct xpcs_compat *compat, u16 an_stat1)
+			      const struct dw_xpcs_compat *compat, u16 an_stat1)
 {
 	int ret;
 
@@ -607,7 +607,7 @@ static int xpcs_validate(struct phylink_pcs *pcs, unsigned long *supported,
 			 const struct phylink_link_state *state)
 {
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(xpcs_supported) = { 0, };
-	const struct xpcs_compat *compat;
+	const struct dw_xpcs_compat *compat;
 	struct dw_xpcs *xpcs;
 	int i;
 
@@ -633,7 +633,7 @@ void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces)
 	int i, j;
 
 	for (i = 0; i < DW_XPCS_INTERFACE_MAX; i++) {
-		const struct xpcs_compat *compat = &xpcs->desc->compat[i];
+		const struct dw_xpcs_compat *compat = &xpcs->desc->compat[i];
 
 		for (j = 0; j < compat->num_interfaces; j++)
 			__set_bit(compat->interface[j], interfaces);
@@ -850,7 +850,7 @@ static int xpcs_config_2500basex(struct dw_xpcs *xpcs)
 int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
 		   const unsigned long *advertising, unsigned int neg_mode)
 {
-	const struct xpcs_compat *compat;
+	const struct dw_xpcs_compat *compat;
 	int ret;
 
 	compat = xpcs_find_compat(xpcs->desc, interface);
@@ -915,7 +915,7 @@ static int xpcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
 
 static int xpcs_get_state_c73(struct dw_xpcs *xpcs,
 			      struct phylink_link_state *state,
-			      const struct xpcs_compat *compat)
+			      const struct dw_xpcs_compat *compat)
 {
 	bool an_enabled;
 	int pcs_stat1;
@@ -1115,7 +1115,7 @@ static void xpcs_get_state(struct phylink_pcs *pcs,
 			   struct phylink_link_state *state)
 {
 	struct dw_xpcs *xpcs = phylink_pcs_to_xpcs(pcs);
-	const struct xpcs_compat *compat;
+	const struct dw_xpcs_compat *compat;
 	int ret;
 
 	compat = xpcs_find_compat(xpcs->desc, state->interface);
@@ -1269,7 +1269,7 @@ static u32 xpcs_get_id(struct dw_xpcs *xpcs)
 	return 0xffffffff;
 }
 
-static const struct xpcs_compat synopsys_xpcs_compat[DW_XPCS_INTERFACE_MAX] = {
+static const struct dw_xpcs_compat synopsys_xpcs_compat[DW_XPCS_INTERFACE_MAX] = {
 	[DW_XPCS_USXGMII] = {
 		.supported = xpcs_usxgmii_features,
 		.interface = xpcs_usxgmii_interfaces,
@@ -1314,7 +1314,7 @@ static const struct xpcs_compat synopsys_xpcs_compat[DW_XPCS_INTERFACE_MAX] = {
 	},
 };
 
-static const struct xpcs_compat nxp_sja1105_xpcs_compat[DW_XPCS_INTERFACE_MAX] = {
+static const struct dw_xpcs_compat nxp_sja1105_xpcs_compat[DW_XPCS_INTERFACE_MAX] = {
 	[DW_XPCS_SGMII] = {
 		.supported = xpcs_sgmii_features,
 		.interface = xpcs_sgmii_interfaces,
@@ -1324,7 +1324,7 @@ static const struct xpcs_compat nxp_sja1105_xpcs_compat[DW_XPCS_INTERFACE_MAX] =
 	},
 };
 
-static const struct xpcs_compat nxp_sja1110_xpcs_compat[DW_XPCS_INTERFACE_MAX] = {
+static const struct dw_xpcs_compat nxp_sja1110_xpcs_compat[DW_XPCS_INTERFACE_MAX] = {
 	[DW_XPCS_SGMII] = {
 		.supported = xpcs_sgmii_features,
 		.interface = xpcs_sgmii_interfaces,
@@ -1418,7 +1418,7 @@ static int xpcs_init_id(struct dw_xpcs *xpcs)
 
 static int xpcs_init_iface(struct dw_xpcs *xpcs, phy_interface_t interface)
 {
-	const struct xpcs_compat *compat;
+	const struct dw_xpcs_compat *compat;
 
 	compat = xpcs_find_compat(xpcs->desc, interface);
 	if (!compat)
-- 
2.43.0

