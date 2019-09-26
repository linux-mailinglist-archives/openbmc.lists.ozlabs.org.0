Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B6BBF47C
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 15:54:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fGd44Gv1zDqCc
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 23:54:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="FGKqwAgk"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gIj6AiSa"; dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fGCK55gzzDqnW
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 23:35:41 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 91D4F711;
 Thu, 26 Sep 2019 09:35:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 26 Sep 2019 09:35:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=KfBRrhFBf9c8i
 MsygybgqXbOkUXr/sjlQli8oIqtUDA=; b=FGKqwAgkkZg4wgARzOdFMu9Ll1Kla
 +3vIEP746D5es/BdlE580Z2GFlTjduQLWEvLO1jE8vwKHNFvLJrLdAwh59PP+dNf
 es1L2WQlzL5nsw9cjlvdOjMoJvLn8mUsnOPxd9kgX5wkTy++/H/AYhSaEh/jcLL0
 81AdVaV30Ww0G5KgLt7m4GGtKE7/GLLsfddUrGZYap3oRkg+OHT6Z+GGosPYwoOi
 B/TRFRGt+7OexYy5OzwMzltb3vaiK99jiZk5gRSUHUmHFp/UgGmllyvwraC1hVCH
 u77FEeX1UaX7b8Vy2oAMskHjgLGCHiFiRl+TzOXteKYEbvoggW1ZEWubQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=KfBRrhFBf9c8iMsygybgqXbOkUXr/sjlQli8oIqtUDA=; b=gIj6AiSa
 cWSKXQKj/df8WldNeZYz7wg0cZ0fVjucHQmSBJAu1OTj6R8w12K8HSNOUPx+sETY
 fHA7iEL1SkJTQ4xRiHHoXGqxqKt9RLICJUdaNqqP2I/YY0+4c0Q7kKHSWKYfqh3h
 RjuNe5mZnuPfUKmvSmfJk15JXjUAHXzdRLq/dRvjneR0YvbqWHCDGVEzwYcW5B7/
 CjSyvJjjwB199tmeoHgm7Du+W24QlE8LCjSYwQ9O3TPkY5z0mhW3AJN/yEmXRns3
 3uw+9ym1OWV+Z/yZMYXRE/Zqho+GGr/BqRzFqIn7GkCU94sGODKaSB4pWzBvffzz
 QC1uDu4+kxw+wA==
X-ME-Sender: <xms:q76MXekwxfZlKVn8Nus1s_fSQUYwtUx3gr56kgO_wBvaI4odEZy3KQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeeggdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgepje
X-ME-Proxy: <xmx:q76MXcvu-ApN3x49hHqmHpx2Sl5ar9MrENDCHtmcbCsAUNPa00GL1Q>
 <xmx:q76MXeSyX7If2rsUKuBYX1XWG8Zg3H8nO5sKzLJ48FsypLu5grVYOw>
 <xmx:q76MXZxUkA7HQGuZ9up9saZdz8aK--9AsMUdqSn0TVa3MlRbVtgeMA>
 <xmx:q76MXcpHG1uN3O7cCjqX1G9lPYH8hbu7YDbsOoVc2tAIzkMZ16Qq9Q>
Received: from mistburn.lan (203-57-215-178.dyn.iinet.net.au [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3C11ED6005F;
 Thu, 26 Sep 2019 09:35:36 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 10/15] pinctrl: aspeed: Use masks to describe
 pinconf bitfields
Date: Thu, 26 Sep 2019 23:06:03 +0930
Message-Id: <20190926133608.30566-11-andrew@aj.id.au>
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

Since some of the AST2600 pinconf setting are not just single bit, modified
aspeed_pin_config @bit to @mask and add @mask to aspeed_pin_config_map to
support configuring multiple bits.

Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>
[AJ: Tweak commit message]
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 10 +++++-----
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 10 +++++-----
 drivers/pinctrl/aspeed/pinctrl-aspeed.c    | 12 ++++++------
 drivers/pinctrl/aspeed/pinctrl-aspeed.h    |  7 ++++---
 4 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
index 62b8aa53b627..bfed0e274643 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
@@ -2595,11 +2595,11 @@ static int aspeed_g4_sig_expr_set(struct aspeed_pinmux_data *ctx,
 }
 
 static const struct aspeed_pin_config_map aspeed_g4_pin_config_map[] = {
-	{ PIN_CONFIG_BIAS_PULL_DOWN,  0, 1},
-	{ PIN_CONFIG_BIAS_PULL_DOWN, -1, 0},
-	{ PIN_CONFIG_BIAS_DISABLE,   -1, 1},
-	{ PIN_CONFIG_DRIVE_STRENGTH,  8, 0},
-	{ PIN_CONFIG_DRIVE_STRENGTH, 16, 1},
+	{ PIN_CONFIG_BIAS_PULL_DOWN,  0, 1, BIT_MASK(0)},
+	{ PIN_CONFIG_BIAS_PULL_DOWN, -1, 0, BIT_MASK(0)},
+	{ PIN_CONFIG_BIAS_DISABLE,   -1, 1, BIT_MASK(0)},
+	{ PIN_CONFIG_DRIVE_STRENGTH,  8, 0, BIT_MASK(0)},
+	{ PIN_CONFIG_DRIVE_STRENGTH, 16, 1, BIT_MASK(0)},
 };
 
 static const struct aspeed_pinmux_ops aspeed_g4_ops = {
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 2acbcf3d508a..0cab4c2576e2 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -2781,11 +2781,11 @@ static int aspeed_g5_sig_expr_set(struct aspeed_pinmux_data *ctx,
 }
 
 static const struct aspeed_pin_config_map aspeed_g5_pin_config_map[] = {
-	{ PIN_CONFIG_BIAS_PULL_DOWN,  0, 1},
-	{ PIN_CONFIG_BIAS_PULL_DOWN, -1, 0},
-	{ PIN_CONFIG_BIAS_DISABLE,   -1, 1},
-	{ PIN_CONFIG_DRIVE_STRENGTH,  8, 0},
-	{ PIN_CONFIG_DRIVE_STRENGTH, 16, 1},
+	{ PIN_CONFIG_BIAS_PULL_DOWN,  0, 1, BIT_MASK(0)},
+	{ PIN_CONFIG_BIAS_PULL_DOWN, -1, 0, BIT_MASK(0)},
+	{ PIN_CONFIG_BIAS_DISABLE,   -1, 1, BIT_MASK(0)},
+	{ PIN_CONFIG_DRIVE_STRENGTH,  8, 0, BIT_MASK(0)},
+	{ PIN_CONFIG_DRIVE_STRENGTH, 16, 1, BIT_MASK(0)},
 };
 
 static const struct aspeed_pinmux_ops aspeed_g5_ops = {
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index fc68aca7b36c..b625a657171e 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -464,7 +464,7 @@ int aspeed_pin_config_get(struct pinctrl_dev *pctldev, unsigned int offset,
 		return rc;
 
 	pmap = find_pinconf_map(pdata, param, MAP_TYPE_VAL,
-			(val & BIT(pconf->bit)) >> pconf->bit);
+			(val & pconf->mask) >> __ffs(pconf->mask));
 
 	if (!pmap)
 		return -EINVAL;
@@ -512,17 +512,17 @@ int aspeed_pin_config_set(struct pinctrl_dev *pctldev, unsigned int offset,
 		if (WARN_ON(!pmap))
 			return -EINVAL;
 
-		val = pmap->val << pconf->bit;
+		val = pmap->val << __ffs(pconf->mask);
 
 		rc = regmap_update_bits(pdata->scu, pconf->reg,
-					BIT(pconf->bit), val);
+					pmap->mask, val);
 
 		if (rc < 0)
 			return rc;
 
-		pr_debug("%s: Set SCU%02X[%d]=%d for param %d(=%d) on pin %d\n",
-				__func__, pconf->reg, pconf->bit, pmap->val,
-				param, arg, offset);
+		pr_debug("%s: Set SCU%02X[%lu]=%d for param %d(=%d) on pin %d\n",
+				__func__, pconf->reg, __ffs(pconf->mask),
+				pmap->val, param, arg, offset);
 	}
 
 	return 0;
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
index 27d3929b6aca..6f0f03395617 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
@@ -24,8 +24,7 @@ struct aspeed_pin_config {
 	enum pin_config_param param;
 	unsigned int pins[2];
 	unsigned int reg;
-	u8 bit;
-	u8 value;
+	u32 mask;
 };
 
 #define ASPEED_PINCTRL_PIN(name_) \
@@ -39,7 +38,7 @@ struct aspeed_pin_config {
 	.param = param_, \
 	.pins = {pin0_, pin1_}, \
 	.reg = reg_, \
-	.bit = bit_ \
+	.mask = BIT_MASK(bit_) \
 }
 
 /*
@@ -48,6 +47,7 @@ struct aspeed_pin_config {
  * @param: pinconf configuration parameter
  * @arg: The supported argument for @param, or -1 if any value is supported
  * @val: The register value to write to configure @arg for @param
+ * @mask: The bitfield mask for @val
  *
  * The map is to be used in conjunction with the configuration array supplied
  * by the driver implementation.
@@ -56,6 +56,7 @@ struct aspeed_pin_config_map {
 	enum pin_config_param param;
 	s32 arg;
 	u32 val;
+	u32 mask;
 };
 
 struct aspeed_pinctrl_data {
-- 
2.20.1

