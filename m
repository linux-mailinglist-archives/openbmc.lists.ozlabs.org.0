Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAC6341591
	for <lists+openbmc@lfdr.de>; Fri, 19 Mar 2021 07:30:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1vCD74V2z3bwt
	for <lists+openbmc@lfdr.de>; Fri, 19 Mar 2021 17:30:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=hODnRte/;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=jWpyY1GC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=hODnRte/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=jWpyY1GC; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1v9S4vsTz3bxF;
 Fri, 19 Mar 2021 17:28:44 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id C1F40580A7F;
 Fri, 19 Mar 2021 02:28:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 19 Mar 2021 02:28:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=sic3qYlOCrq3L
 +pvEQYeldSvAa2Qy+Xy8lgLaF/EF40=; b=hODnRte/FtT1Aaf25m+nUpIsfLOmq
 E2bOshf1RD+Trr8qtHai6iDdVPuW7zrzuzHHlg9nNbAZlBdYiPVbshOFMSLIp+8q
 NmfqJ42/HFi+eMBC62U5XOWqFV1MUKX5TzEytDNP5gMduhXnjuwtq7HpxFbtTG4l
 SPcsCJorPa0cPgAYrSdWph0rz+yclBaCZ5eAwbv/838XKITSUFhE21W9CyXqyknm
 +MFkL76NTghRogIVKEjAzUlrHlWInB1RROymNdgXg1u9cnPf6tfNmGjkS+N1IDdI
 iF+S4CEAVxw2D433EvA0ZECL4H4v84MRVquQyImJ4jMZkSJzWqm+rmwkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=sic3qYlOCrq3L+pvEQYeldSvAa2Qy+Xy8lgLaF/EF40=; b=jWpyY1GC
 mffDjfEx9SJn4iKY3jQDrqEq9y9dGlgfQrzBQM+sohwMnweR+7e47e3B8Rx90+JS
 Erwm5BSONeYAAk12IxKsgRFVFSwgX3NJVgWBhs7alXB2TF832R81DPTvaWFVe4VW
 SJ2DETmEDM7pU31vur+PW3t2KnsBiNY0uShBu/boWy2cYUtosT94V8H02peakQQC
 nEAPcVekVqp+If4guezmhbkD3+pUbwAZSIWqQeud67Gh78+ZiPDAAsPuFhjSaEUd
 rYxz+ipAvCwl40RKsbX11TPVsGSJobqyKeI85xXztOr4/7SFxq80JVfc49+UHjFK
 p5iSy3NBG1c8Mw==
X-ME-Sender: <xms:mkRUYCIq35iFQKpVxZTfyNRsePp9Sgi7V-JtyrjK1TIMIOdD2RURYg>
 <xme:mkRUYKKYLTIbgWr1G8s1fewV9h0vPH-iXv99_voTiQdgpbG1ojrubJHQ1p7e0ajO7
 9znTXBhR8QB7xpZag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefjedgleehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgv
 ficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrghtth
 gvrhhnpeejgfdvveehteekveeggeellefgleetteejffelffdvudduveeiffegteelvefh
 teenucfkphepuddukedrvddutddrudekuddrheehnecuvehluhhsthgvrhfuihiivgepvd
 enucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:mkRUYCvhQ33mQqgNLMcOv2yGmKaG9zfUg6gI3nXWsiWATaYr3lTnjQ>
 <xmx:mkRUYHbtunRPZGfXQm-ONk6dCbWObR-F9ybB5M5KzBO6KB35afaDng>
 <xmx:mkRUYJbj-h3e92wCRxmu1OxU_FXTzFZfuuSzOwA4Cr96gAVUV-8Dvw>
 <xmx:mkRUYBKQuUTsmBKmbMnO3rPrlTaBJ_7BaWLygMttcou72b71zJ5ktw>
Received: from localhost.localdomain
 (ppp118-210-181-55.adl-adc-lon-bras34.tpg.internode.on.net [118.210.181.55])
 by mail.messagingengine.com (Postfix) with ESMTPA id 35E67240054;
 Fri, 19 Mar 2021 02:28:36 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 minyard@acm.org
Subject: [PATCH v2 04/21] pinctrl: aspeed-g5: Adapt to new LPC device tree
 layout
Date: Fri, 19 Mar 2021 16:57:35 +1030
Message-Id: <20210319062752.145730-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319062752.145730-1-andrew@aj.id.au>
References: <20210319062752.145730-1-andrew@aj.id.au>
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
Cc: devicetree@vger.kernel.org, ryan_chen@aspeedtech.com, tmaimon77@gmail.com,
 linux-aspeed@lists.ozlabs.org, avifishman70@gmail.com, venture@google.com,
 "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>, linux-kernel@vger.kernel.org,
 tali.perry1@gmail.com, linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 lee.jones@linaro.org, linus.walleij@linaro.org,
 linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>

Add check against LPC device v2 compatible string to
ensure that the fixed device tree layout is adopted.
The LPC register offsets are also fixed accordingly.

Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 0cab4c2576e2..996ebcba4d38 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -60,7 +60,7 @@
 #define COND2		{ ASPEED_IP_SCU, SCU94, GENMASK(1, 0), 0, 0 }
 
 /* LHCR0 is offset from the end of the H8S/2168-compatible registers */
-#define LHCR0		0x20
+#define LHCR0		0xa0
 #define GFX064		0x64
 
 #define B14 0
@@ -2648,14 +2648,19 @@ static struct regmap *aspeed_g5_acquire_regmap(struct aspeed_pinmux_data *ctx,
 	}
 
 	if (ip == ASPEED_IP_LPC) {
-		struct device_node *node;
+		struct device_node *np;
 		struct regmap *map;
 
-		node = of_parse_phandle(ctx->dev->of_node,
+		np = of_parse_phandle(ctx->dev->of_node,
 					"aspeed,external-nodes", 1);
-		if (node) {
-			map = syscon_node_to_regmap(node->parent);
-			of_node_put(node);
+		if (np) {
+			if (!of_device_is_compatible(np->parent, "aspeed,ast2400-lpc-v2") &&
+			    !of_device_is_compatible(np->parent, "aspeed,ast2500-lpc-v2") &&
+			    !of_device_is_compatible(np->parent, "aspeed,ast2600-lpc-v2"))
+				return ERR_PTR(-ENODEV);
+
+			map = syscon_node_to_regmap(np->parent);
+			of_node_put(np);
 			if (IS_ERR(map))
 				return map;
 		} else
-- 
2.27.0

