Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA359A1277
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 09:18:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Jv911qr8zDqby
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 17:18:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="EHmXLhKd"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="HGuxF0et"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Jv8019CpzDqnR;
 Thu, 29 Aug 2019 17:17:35 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EFFA32235F;
 Thu, 29 Aug 2019 03:17:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 29 Aug 2019 03:17:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=fNZ4xh9uT1X3X9+GMF7S9M4Khb
 ZuAQ0dU82+LfdKRIU=; b=EHmXLhKdqEQBUyL306orSymEN4gb3qidnBa9u0FxOq
 zd0YytrNno08Kqv5NSjc38Pr+Lr/jHcl8rGOr9jgksKhxt7iJHzoF3oHrdlou1le
 eGEdsY8S3rAUCZJd8rhMlGPKH3FDTgvQP9L5vtXfTQDCI9bqf4eVjoDVoAcRN5M6
 gDL/NkA/TEYP251tUEDLugtVheOKGHkgtWYZpnm5fGbQ1gDZ5TdTyWg2r5kRKSBu
 sE5HQAf3utvq++HcB/AJBS8YGl+Lr7Vd4BDBtBsAlh9ykmytk1cG3gcgUiHIvfBF
 vfhjF97n7OQaNeBZlQn8ukokVsL/dQpGPJvnTdfre7vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=fNZ4xh9uT1X3X9+GM
 F7S9M4KhbZuAQ0dU82+LfdKRIU=; b=HGuxF0etWnXEN6y4boSnGGQXpJH7ly3Eq
 Ez0ulWry3Yo98dj/8yqbpwFnaajas3Wtx/Jah2C+neEDDsjWkEOGifv6LumpomAN
 85lln7PI1lRXjMNNFPu4RjenLEXOJarR1qzet0OLketJRs5FT62VNvCYcYtcvOGq
 8hxK0IjaOvZb0sxlE4PM8EAIHaR6vC/d3QaSuhxzbvlNfpqJ3tFx6COEUekxfc3s
 c1Jhy0obR8leSFKNUWmYSsU3aa2898nhm2UvbdAjG3oRqt1QyIZKvGqfCgA2HXoR
 roZ7D9AuQaCBB0+fE3vp5U5gRFF7Izya6kPh2AWv0bqgrxg4rtkgw==
X-ME-Sender: <xms:C3xnXR5TNsg2nfSkDmIJdHg-sBClwUmgNEp3HiP0nlCg5X0yjIkmig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeiuddguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheptehnughrvgif
 ucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecukfhppedvtdefrd
 ehjedrvdduhedrudejkeenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegr
 jhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:C3xnXWVPSGN_N4m99OBLSxYNVhByx2iL3arujMGJK5q4fDY6RIurlw>
 <xmx:C3xnXV2UuDik2kCDKF1TGivDCpdlJ_22fKEJZnjxGl17oAVQ5HFXkQ>
 <xmx:C3xnXT09aVDRCJ9IvAZhY18NPHbvMgkAFCBYkMcKggnkf7G1i5rb-g>
 <xmx:C3xnXeuKEklshHhzeEVxMLz14cBWL7fN9Dvh3fO1L_Ha2DAkiLxeZg>
Received: from localhost.localdomain (203-57-215-178.dyn.iinet.net.au
 [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 59BFDD6005A;
 Thu, 29 Aug 2019 03:17:28 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-gpio@vger.kernel.org
Subject: [PATCH pinctrl/fixes] pinctrl: aspeed: Fix spurious mux failures on
 the AST2500
Date: Thu, 29 Aug 2019 16:47:38 +0930
Message-Id: <20190829071738.2523-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 John Wang <wangzqbj@inspur.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Commit 674fa8daa8c9 ("pinctrl: aspeed-g5: Delay acquisition of regmaps")
was determined to be a partial fix to the problem of acquiring the LPC
Host Controller and GFX regmaps: The AST2500 pin controller may need to
fetch syscon regmaps during expression evaluation as well as when
setting mux state. For example, this case is hit by attempting to export
pins exposing the LPC Host Controller as GPIOs.

An optional eval() hook is added to the Aspeed pinmux operation struct
and called from aspeed_sig_expr_eval() if the pointer is set by the
SoC-specific driver. This enables the AST2500 to perform the custom
action of acquiring its regmap dependencies as required.

John Wang tested the fix on an Inspur FP5280G2 machine (AST2500-based)
where the issue was found, and I've booted the fix on Witherspoon
(AST2500) and Palmetto (AST2400) machines, and poked at relevant pins
under QEMU by forcing mux configurations via devmem before exporting
GPIOs to exercise the driver.

Fixes: 7d29ed88acbb ("pinctrl: aspeed: Read and write bits in LPC and GFX controllers")
Fixes: 674fa8daa8c9 ("pinctrl: aspeed-g5: Delay acquisition of regmaps")
Reported-by: John Wang <wangzqbj@inspur.com>
Tested-by: John Wang <wangzqbj@inspur.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

---
Hi Linus,

The timing of merging the AST2600 (g6) driver and 674fa8daa8c9 ("pinctrl:
aspeed-g5: Delay acquisition of regmaps") caused a bit of a rough spot a
few weeks back. This fix doesn't cause any such disruption - I've
developed it on top of pinctrl/fixes and back-merged the result into
pinctrl/devel to test for build breakage (via CONFIG_COMPILE_TEST to
enable all of the g4, g5 and g6 drivers). All three ASPEED pinctrl
drivers built successfully, so it should be enough to simply take this
patch through pinctrl/fixes and leave pinctrl/devel as is for the 5.4
merge window.
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 30 +++++++++++++++++++++-
 drivers/pinctrl/aspeed/pinmux-aspeed.c     |  7 +++--
 drivers/pinctrl/aspeed/pinmux-aspeed.h     |  7 ++---
 3 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index ba6438ac4d72..ff84d1afd229 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -2552,7 +2552,7 @@ static struct regmap *aspeed_g5_acquire_regmap(struct aspeed_pinmux_data *ctx,
 			if (IS_ERR(map))
 				return map;
 		} else
-			map = ERR_PTR(-ENODEV);
+			return ERR_PTR(-ENODEV);
 
 		ctx->maps[ASPEED_IP_LPC] = map;
 		dev_dbg(ctx->dev, "Acquired LPC regmap");
@@ -2562,6 +2562,33 @@ static struct regmap *aspeed_g5_acquire_regmap(struct aspeed_pinmux_data *ctx,
 	return ERR_PTR(-EINVAL);
 }
 
+static int aspeed_g5_sig_expr_eval(struct aspeed_pinmux_data *ctx,
+				   const struct aspeed_sig_expr *expr,
+				   bool enabled)
+{
+	int ret;
+	int i;
+
+	for (i = 0; i < expr->ndescs; i++) {
+		const struct aspeed_sig_desc *desc = &expr->descs[i];
+		struct regmap *map;
+
+		map = aspeed_g5_acquire_regmap(ctx, desc->ip);
+		if (IS_ERR(map)) {
+			dev_err(ctx->dev,
+				"Failed to acquire regmap for IP block %d\n",
+				desc->ip);
+			return PTR_ERR(map);
+		}
+
+		ret = aspeed_sig_desc_eval(desc, enabled, ctx->maps[desc->ip]);
+		if (ret <= 0)
+			return ret;
+	}
+
+	return 1;
+}
+
 /**
  * Configure a pin's signal by applying an expression's descriptor state for
  * all descriptors in the expression.
@@ -2647,6 +2674,7 @@ static int aspeed_g5_sig_expr_set(struct aspeed_pinmux_data *ctx,
 }
 
 static const struct aspeed_pinmux_ops aspeed_g5_ops = {
+	.eval = aspeed_g5_sig_expr_eval,
 	.set = aspeed_g5_sig_expr_set,
 };
 
diff --git a/drivers/pinctrl/aspeed/pinmux-aspeed.c b/drivers/pinctrl/aspeed/pinmux-aspeed.c
index 839c01b7953f..57305ca838a7 100644
--- a/drivers/pinctrl/aspeed/pinmux-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinmux-aspeed.c
@@ -78,11 +78,14 @@ int aspeed_sig_desc_eval(const struct aspeed_sig_desc *desc,
  * neither the enabled nor disabled state. Thus we must explicitly test for
  * either condition as required.
  */
-int aspeed_sig_expr_eval(const struct aspeed_pinmux_data *ctx,
+int aspeed_sig_expr_eval(struct aspeed_pinmux_data *ctx,
 			 const struct aspeed_sig_expr *expr, bool enabled)
 {
+	int ret;
 	int i;
-	int ret;
+
+	if (ctx->ops->eval)
+		return ctx->ops->eval(ctx, expr, enabled);
 
 	for (i = 0; i < expr->ndescs; i++) {
 		const struct aspeed_sig_desc *desc = &expr->descs[i];
diff --git a/drivers/pinctrl/aspeed/pinmux-aspeed.h b/drivers/pinctrl/aspeed/pinmux-aspeed.h
index 52d299b59ce2..db3457c86f48 100644
--- a/drivers/pinctrl/aspeed/pinmux-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinmux-aspeed.h
@@ -702,6 +702,8 @@ struct aspeed_pin_function {
 struct aspeed_pinmux_data;
 
 struct aspeed_pinmux_ops {
+	int (*eval)(struct aspeed_pinmux_data *ctx,
+		    const struct aspeed_sig_expr *expr, bool enabled);
 	int (*set)(struct aspeed_pinmux_data *ctx,
 		   const struct aspeed_sig_expr *expr, bool enabled);
 };
@@ -722,9 +724,8 @@ struct aspeed_pinmux_data {
 int aspeed_sig_desc_eval(const struct aspeed_sig_desc *desc, bool enabled,
 			 struct regmap *map);
 
-int aspeed_sig_expr_eval(const struct aspeed_pinmux_data *ctx,
-			 const struct aspeed_sig_expr *expr,
-			 bool enabled);
+int aspeed_sig_expr_eval(struct aspeed_pinmux_data *ctx,
+			 const struct aspeed_sig_expr *expr, bool enabled);
 
 static inline int aspeed_sig_expr_set(struct aspeed_pinmux_data *ctx,
 				      const struct aspeed_sig_expr *expr,
-- 
2.20.1

