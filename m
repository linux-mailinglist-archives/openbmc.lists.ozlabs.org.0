Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 037DD8D7664
	for <lists+openbmc@lfdr.de>; Sun,  2 Jun 2024 16:40:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l9yaDIi8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VsffY5sk1z2ysg
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2024 00:40:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l9yaDIi8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VsfZD5c5Nz3c2t
	for <openbmc@lists.ozlabs.org>; Mon,  3 Jun 2024 00:36:52 +1000 (AEST)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2e95a1eff78so47006861fa.0
        for <openbmc@lists.ozlabs.org>; Sun, 02 Jun 2024 07:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717339009; x=1717943809; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEjeTMFoJBv+1cocMj3lNi4jSjrQ54Kw3PRV3mrle98=;
        b=l9yaDIi8hgTfM6LG3hgZjDRS4sOyqgNY24rsKjZxSfml3e+lgtnzQ4x3yY/I65TVi8
         HQZiyAcRd2zJ5VrkCuYnSPsTwhpuAG0cZ5q3rbzloqR7X2RB3q/NBt6fzGv55eSQLKdX
         edDZjJzElqZROdQwoCxOPLcOUqineDukGmZkuOlcOnLMYjYtY7vQzxn1BkczPVfUZeTd
         dJ561rERe/ij+p6lWhgc1bsiD9wJs+2Uj48L/GEiH9VP9iR+fAKUjuebIHmaylTk1qGE
         y8w+pLB9DgJcN4IBAfWtaeAlkukmSyPg9Mo3WU6BLPQKNxYX2GgNk3KV74FR7CfyBGW3
         fUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717339009; x=1717943809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEjeTMFoJBv+1cocMj3lNi4jSjrQ54Kw3PRV3mrle98=;
        b=XqthR7veDFpIKwx6KzGlpKjEYczjg9fcN8CLuyEj1240RK/Z20uCLfpo5YyI6cSmau
         BjAKc2cRkuLqdxxaLyjM6qcPIG251ZwXvuohLI9EvGeFxBFLbHEyH7VK6eCSEKjR7a3Z
         So8Y+2mCaBETxc/0C/qTG41f1DLen8N0x3BZ+U6VTg05dhuEVRSWb1TZuFXBm+kCuWVK
         ptTeJEK3kgGrmtmYrl34Y3bZWNW/pQjbvNzo8612OWc5OyUMA0VtldbBAbBtRQN1Crrm
         yE5ChJ9WZSgW3vHGl0Tg2fD1y+cosMul32wU68Jy4A9WbAu+gs5KcjZVRzA6x1Axxc5v
         4TAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQchuLEJEmuNhECs5k/1uDqCriOaXW7fT2TiC8rUebLaT+ui43KmRNU0y4oY6j9vomLeUbbub+HT3LMQDN60qntiwCaG4fpEU=
X-Gm-Message-State: AOJu0YyNDUA63sn+UuxqbFNEVvmU4X6PUypOAUm+A5BpEiXBGE511FXt
	Roywroce+3LLdEF2qSgzEUlzSRBzDCdffCoiBmxij+LuElYwwxpV
X-Google-Smtp-Source: AGHT+IECFWr2eN8AS3zjjnqwWdWxEdkSN5s216Gg8Y6ZUNUm8wBCeEqyvFu7aGOr2W1PCG7UzKs+oQ==
X-Received: by 2002:a2e:b5a9:0:b0:2ea:8e94:a2ea with SMTP id 38308e7fff4ca-2ea95108166mr50557881fa.6.1717339009135;
        Sun, 02 Jun 2024 07:36:49 -0700 (PDT)
Received: from localhost ([178.178.142.64])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91bb49ebsm9383051fa.34.2024.06.02.07.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 07:36:48 -0700 (PDT)
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
Subject: [PATCH net-next v2 04/10] net: pcs: xpcs: Convert xpcs_compat to dw_xpcs_compat
Date: Sun,  2 Jun 2024 17:36:18 +0300
Message-ID: <20240602143636.5839-5-fancer.lancer@gmail.com>
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

