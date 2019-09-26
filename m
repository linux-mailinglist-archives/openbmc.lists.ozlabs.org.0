Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEFEBF47A
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 15:53:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fGbl4WShzDqXM
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 23:53:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="LAFdS5QQ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="q89mVW8W"; dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fGCH4wnszDqpJ
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 23:35:39 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 291C671C;
 Thu, 26 Sep 2019 09:35:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 26 Sep 2019 09:35:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=o4SgjvFhP06qE
 MYFVcEyg35wWX80rlCKP3ooHrBZfDo=; b=LAFdS5QQJsnrZK/MxwHohVv1tPytA
 Pas2ZAVJfWjyDfVD4FLWPX1Uhsf+/3eFEVhwH4ApML+xRBpRudMK71V5SCwovMud
 oO4Rv4ToOGVbn5mkKGrlvxBeVqBaDaR6oRR+mBwyLZfj72RDZSZu6thlOxX5GJnr
 z0Gk6IDAw3MV9z0cXz485A1PO7cYHpS8MsBibGfc9EwD1WFyhWX/vbuxgUDRs0af
 3qqBRI4VcpWWo3wMT/DUemM2mZBpWk/n4ZUdN1fqlhbhOLkUsjarp3klTtblsZPg
 l8MvU7ooy5fyFi+BbWZUTem4HnDhf0/agoFKYqiPFq9zPJKOod5Z0DhGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=o4SgjvFhP06qEMYFVcEyg35wWX80rlCKP3ooHrBZfDo=; b=q89mVW8W
 Yr5+UZACA0sCHpC+h6hnMc7Y73kS6plXclUtuuLSaWdC721hEsFrwKA5ESvmMKNS
 13K4tdoE3k0KeqzIKgZHqsR6eJH+tu/DiTy7QKlUAxnJo2b2WI0BLSXIQYXUa4uL
 OOd/fxHjclclwuIpXQ69KWHiVsZzsRLfyVrGtJg3sz+rMVs+DP4TyWR7fTD5NidQ
 MCJjJ2BNrjgRIw+PDiWxwMf2G86rZ3CJbgwzAvo2b2OTcKesnE6HJ2tD/1nBRq/6
 wO/gQcgdPX5mou31vgPA+9Q1a1UZNIwriYtxwMMZ+OZzI0wWLnKdQqE3TGt7dFSW
 MNhJx+64Gihc5Q==
X-ME-Sender: <xms:qL6MXTEi5L907gnMAzpCcRUZOQeZ4UUl8Nfk3NlUpQ4JrELvBGi8-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeeggdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgepje
X-ME-Proxy: <xmx:qL6MXbImP305UNWv2GM3YPJkvg64zC7_RP9WTvVvnd_gFeCxAC-T9w>
 <xmx:qL6MXTYy5-oOHOLPAK6EmRMt1EV23wlbSOlDb7mJYK6sd_d0KFZhUA>
 <xmx:qL6MXQqdPOMO9xvyW1VzCI_ura7DmUP5hZitJLU82_X5giiSG3MylA>
 <xmx:qL6MXREyeX6InqXMzTSKQFx3KA7c44BVP4k2BxNH0QJDUPTR0v03KQ>
Received: from mistburn.lan (203-57-215-178.dyn.iinet.net.au [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id D011CD60066;
 Thu, 26 Sep 2019 09:35:34 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 09/15] pinctrl: aspeed: Move
 aspeed_pin_config_map to separate source file
Date: Thu, 26 Sep 2019 23:06:02 +0930
Message-Id: <20190926133608.30566-10-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190926133608.30566-1-andrew@aj.id.au>
References: <20190926133608.30566-1-andrew@aj.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, johnny_huang@aspeedtech.com,
 openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Johnny Huang <johnny_huang@aspeedtech.com>

The AST2600 pinconf differs from the 2400 and 2500, aspeed_pin_config_map
should define separately, and add @confmaps and @nconfmaps to
aspeed_pinctrl_data structure for that change.

Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 10 ++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 10 ++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed.c    | 38 +++-------------------
 drivers/pinctrl/aspeed/pinctrl-aspeed.h    | 19 +++++++++++
 4 files changed, 44 insertions(+), 33 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
index c56ded0ac57e..62b8aa53b627 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
@@ -2594,6 +2594,14 @@ static int aspeed_g4_sig_expr_set(struct aspeed_pinmux_data *ctx,
 	return 0;
 }
 
+static const struct aspeed_pin_config_map aspeed_g4_pin_config_map[] = {
+	{ PIN_CONFIG_BIAS_PULL_DOWN,  0, 1},
+	{ PIN_CONFIG_BIAS_PULL_DOWN, -1, 0},
+	{ PIN_CONFIG_BIAS_DISABLE,   -1, 1},
+	{ PIN_CONFIG_DRIVE_STRENGTH,  8, 0},
+	{ PIN_CONFIG_DRIVE_STRENGTH, 16, 1},
+};
+
 static const struct aspeed_pinmux_ops aspeed_g4_ops = {
 	.set = aspeed_g4_sig_expr_set,
 };
@@ -2610,6 +2618,8 @@ static struct aspeed_pinctrl_data aspeed_g4_pinctrl_data = {
 	},
 	.configs = aspeed_g4_configs,
 	.nconfigs = ARRAY_SIZE(aspeed_g4_configs),
+	.confmaps = aspeed_g4_pin_config_map,
+	.nconfmaps = ARRAY_SIZE(aspeed_g4_pin_config_map),
 };
 
 static const struct pinmux_ops aspeed_g4_pinmux_ops = {
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index b2fe47b98fa0..2acbcf3d508a 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -2780,6 +2780,14 @@ static int aspeed_g5_sig_expr_set(struct aspeed_pinmux_data *ctx,
 	return 0;
 }
 
+static const struct aspeed_pin_config_map aspeed_g5_pin_config_map[] = {
+	{ PIN_CONFIG_BIAS_PULL_DOWN,  0, 1},
+	{ PIN_CONFIG_BIAS_PULL_DOWN, -1, 0},
+	{ PIN_CONFIG_BIAS_DISABLE,   -1, 1},
+	{ PIN_CONFIG_DRIVE_STRENGTH,  8, 0},
+	{ PIN_CONFIG_DRIVE_STRENGTH, 16, 1},
+};
+
 static const struct aspeed_pinmux_ops aspeed_g5_ops = {
 	.eval = aspeed_g5_sig_expr_eval,
 	.set = aspeed_g5_sig_expr_set,
@@ -2797,6 +2805,8 @@ static struct aspeed_pinctrl_data aspeed_g5_pinctrl_data = {
 	},
 	.configs = aspeed_g5_configs,
 	.nconfigs = ARRAY_SIZE(aspeed_g5_configs),
+	.confmaps = aspeed_g5_pin_config_map,
+	.nconfmaps = ARRAY_SIZE(aspeed_g5_pin_config_map),
 };
 
 static const struct pinmux_ops aspeed_g5_pinmux_ops = {
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 54933665b5f8..fc68aca7b36c 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -411,49 +411,21 @@ static inline const struct aspeed_pin_config *find_pinconf_config(
 	return NULL;
 }
 
-/*
- * Aspeed pin configuration description.
- *
- * @param: pinconf configuration parameter
- * @arg: The supported argument for @param, or -1 if any value is supported
- * @val: The register value to write to configure @arg for @param
- *
- * The map is to be used in conjunction with the configuration array supplied
- * by the driver implementation.
- */
-struct aspeed_pin_config_map {
-	enum pin_config_param param;
-	s32 arg;
-	u32 val;
-};
-
 enum aspeed_pin_config_map_type { MAP_TYPE_ARG, MAP_TYPE_VAL };
 
-/* Aspeed consistently both:
- *
- * 1. Defines "disable bits" for internal pull-downs
- * 2. Uses 8mA or 16mA drive strengths
- */
-static const struct aspeed_pin_config_map pin_config_map[] = {
-	{ PIN_CONFIG_BIAS_PULL_DOWN,  0, 1 },
-	{ PIN_CONFIG_BIAS_PULL_DOWN, -1, 0 },
-	{ PIN_CONFIG_BIAS_DISABLE,   -1, 1 },
-	{ PIN_CONFIG_DRIVE_STRENGTH,  8, 0 },
-	{ PIN_CONFIG_DRIVE_STRENGTH, 16, 1 },
-};
-
 static const struct aspeed_pin_config_map *find_pinconf_map(
+		const struct aspeed_pinctrl_data *pdata,
 		enum pin_config_param param,
 		enum aspeed_pin_config_map_type type,
 		s64 value)
 {
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(pin_config_map); i++) {
+	for (i = 0; i < pdata->nconfmaps; i++) {
 		const struct aspeed_pin_config_map *elem;
 		bool match;
 
-		elem = &pin_config_map[i];
+		elem = &pdata->confmaps[i];
 
 		switch (type) {
 		case MAP_TYPE_ARG:
@@ -491,7 +463,7 @@ int aspeed_pin_config_get(struct pinctrl_dev *pctldev, unsigned int offset,
 	if (rc < 0)
 		return rc;
 
-	pmap = find_pinconf_map(param, MAP_TYPE_VAL,
+	pmap = find_pinconf_map(pdata, param, MAP_TYPE_VAL,
 			(val & BIT(pconf->bit)) >> pconf->bit);
 
 	if (!pmap)
@@ -535,7 +507,7 @@ int aspeed_pin_config_set(struct pinctrl_dev *pctldev, unsigned int offset,
 		if (!pconf)
 			return -ENOTSUPP;
 
-		pmap = find_pinconf_map(param, MAP_TYPE_ARG, arg);
+		pmap = find_pinconf_map(pdata, param, MAP_TYPE_ARG, arg);
 
 		if (WARN_ON(!pmap))
 			return -EINVAL;
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
index a7db31202033..27d3929b6aca 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
@@ -42,6 +42,22 @@ struct aspeed_pin_config {
 	.bit = bit_ \
 }
 
+/*
+ * Aspeed pin configuration description.
+ *
+ * @param: pinconf configuration parameter
+ * @arg: The supported argument for @param, or -1 if any value is supported
+ * @val: The register value to write to configure @arg for @param
+ *
+ * The map is to be used in conjunction with the configuration array supplied
+ * by the driver implementation.
+ */
+struct aspeed_pin_config_map {
+	enum pin_config_param param;
+	s32 arg;
+	u32 val;
+};
+
 struct aspeed_pinctrl_data {
 	struct regmap *scu;
 
@@ -52,6 +68,9 @@ struct aspeed_pinctrl_data {
 	const unsigned int nconfigs;
 
 	struct aspeed_pinmux_data pinmux;
+
+	const struct aspeed_pin_config_map *confmaps;
+	const unsigned int nconfmaps;
 };
 
 /* Aspeed pinctrl helpers */
-- 
2.20.1

