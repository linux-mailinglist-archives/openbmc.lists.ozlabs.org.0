Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3264DDFCE0
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 06:51:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46y1Lt3X2BzDqJs
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 15:51:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="gAtuImzk"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="C0J9DPpr"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46y1FK43RYzDqKh
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 15:47:01 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2C74A217FC;
 Tue, 22 Oct 2019 00:46:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 22 Oct 2019 00:46:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=FepmVOzPSIXDZ
 ZICnAFKiAbAKjA418KvsrV5+4ioUcM=; b=gAtuImzksVqoSLwl6OAzR1tK9Vj85
 5dPbfEMQX5GwXq61gkjkqDTN6gapHqcyhrwU4edKhs/bcEJrTvepJ4S8BxXLQb/n
 nUJ2+ISzy3NZc0l1XPSmIfnDahgqNqQBw3i26ToKEKDJhNRPpEpdn4XLon944LvB
 y84P0EjSjRswxJj7Re+mXeuhlfgzWmWsNnkxdN33YlyfyjeLsaRqMELo4fjRxbJc
 iG/2TLpDj5bfdUUBpv0FEPZF6DQUsy/WsANn6dYQc5sKxeoVCMCMNBTiaVmirLJc
 FdoJw85pUXBjlKqPoff/tMvYfaFpil3JnO8T6pXVtrgwKrpPFq5J9/b+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=FepmVOzPSIXDZZICnAFKiAbAKjA418KvsrV5+4ioUcM=; b=C0J9DPpr
 oswlQxcPyX0c2WAvOwor2ieFwh2y3WCj9IBG4CgOQUDloXtnMROOZ/VYVX8oJtlq
 cDK1uOnoe5VWxvZQrtvPnmkwfvI0I6IXkLsreiFhFU6B60m8W1Cf+0Qv+ZujIezc
 HK9Bi1AldizerD1/Q3p9f+v5CY7Iynd4+KF9PUE8OYMZr+KBk/U1RxJYemhSwsRt
 h56w7z5nQVPmzf9juDIoEvueziaf+D/yhGC9umsbNF0Bk2bg6uqqGZV1I+O2H8b7
 uxa3oTMSRFEeoPEAero0m8jA1ZU7h0RfZfd0ZR6LnMCEJRwwcADqYD5Xipqa4SuF
 ODPCCJ3lPAiTBQ==
X-ME-Sender: <xms:w4muXde7Hz13BZBiVKN-Fwfx0kLqTvwfeapDhhX6p0mAJKALAnOgnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrkeeigdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtvddrkedurddukedrvdeknecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgep
 vd
X-ME-Proxy: <xmx:w4muXSLfTifK3M3N5qdc1bNVqdj1N72Ddp1DUAwNd7ngwx7WoJwEwQ>
 <xmx:w4muXffC2JIZ_EzzEfBIbNXkWcZnpdB3JpsuFfeEGqvP98vF0wCCqg>
 <xmx:w4muXezk9o_r5K_sZ8d5NDek1J-iLY0FItshUSKCFH3gsiUaDiOR5Q>
 <xmx:w4muXRt2D0D3Amgn22tvfniuK_a9BVxX6ZqB1PqfPIDSvNN78etUQQ>
Received: from mistburn.bha-au.ibmmobiledemo.com (unknown [202.81.18.28])
 by mail.messagingengine.com (Postfix) with ESMTPA id DBD6F80060;
 Tue, 22 Oct 2019 00:46:57 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 4/4] pinctrl: aspeed: Improve debug output
Date: Tue, 22 Oct 2019 15:47:37 +1100
Message-Id: <20191022044737.15103-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191022044737.15103-1-andrew@aj.id.au>
References: <20191022044737.15103-1-andrew@aj.id.au>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

We need to iterate over each pin in a group for a function and
disable higher priority mux configurations on the pin before finally
muxing the relevant function's signal. With the current debug output it
is hard to track what register output is relevant to which operation, so
break up the actions in the debug output by providing some more context.

Before:

    [    5.446656] aspeed-g6-pinctrl 1e6e2000.syscon:pinctrl: request pin 37 (B26) for 1e780000.gpio:341
    [    5.447377] Want SCU414[0x00000020]=0x1, got 0x0 from 0x00000000
    [    5.447854] Want SCU4B4[0x00000020]=0x1, got 0x0 from 0x00000000
    [    5.448340] Want SCU4B4[0x00000020]=0x1, got 0x0 from 0x00000000

After:

    [    5.298053] Muxing pin 37 for GPIO
    [    5.298294] Disabling signal NRI4 for NRI4
    [    5.298593] Want SCU414[0x00000020]=0x1, got 0x0 from 0x00000000
    [    5.298983] Disabling signal RGMII4RXD1 for RGMII4
    [    5.299309] Want SCU4B4[0x00000020]=0x1, got 0x0 from 0x00000000
    [    5.299694] Disabling signal RMII4RXD1 for RMII4
    [    5.300014] Want SCU4B4[0x00000020]=0x1, got 0x0 from 0x00000000
    [    5.300396] Enabling signal GPIOE5 for GPIOE5
    [    5.300687] Muxed pin 37 as GPIOE5

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index b625a657171e..53f3f8aec695 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -76,6 +76,9 @@ static int aspeed_sig_expr_enable(struct aspeed_pinmux_data *ctx,
 {
 	int ret;
 
+	pr_debug("Enabling signal %s for %s\n", expr->signal,
+		 expr->function);
+
 	ret = aspeed_sig_expr_eval(ctx, expr, true);
 	if (ret < 0)
 		return ret;
@@ -91,6 +94,9 @@ static int aspeed_sig_expr_disable(struct aspeed_pinmux_data *ctx,
 {
 	int ret;
 
+	pr_debug("Disabling signal %s for %s\n", expr->signal,
+		 expr->function);
+
 	ret = aspeed_sig_expr_eval(ctx, expr, true);
 	if (ret < 0)
 		return ret;
@@ -229,7 +235,7 @@ int aspeed_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 		const struct aspeed_sig_expr **funcs;
 		const struct aspeed_sig_expr ***prios;
 
-		pr_debug("Muxing pin %d for %s\n", pin, pfunc->name);
+		pr_debug("Muxing pin %s for %s\n", pdesc->name, pfunc->name);
 
 		if (!pdesc)
 			return -EINVAL;
@@ -269,6 +275,9 @@ int aspeed_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 		ret = aspeed_sig_expr_enable(&pdata->pinmux, expr);
 		if (ret)
 			return ret;
+
+		pr_debug("Muxed pin %s as %s for %s\n", pdesc->name, expr->signal,
+			 expr->function);
 	}
 
 	return 0;
@@ -317,6 +326,8 @@ int aspeed_gpio_request_enable(struct pinctrl_dev *pctldev,
 	if (!prios)
 		return -ENXIO;
 
+	pr_debug("Muxing pin %s for GPIO\n", pdesc->name);
+
 	/* Disable any functions of higher priority than GPIO */
 	while ((funcs = *prios)) {
 		if (aspeed_gpio_in_exprs(funcs))
@@ -346,14 +357,22 @@ int aspeed_gpio_request_enable(struct pinctrl_dev *pctldev,
 	 * lowest-priority signal type. As such it has no associated
 	 * expression.
 	 */
-	if (!expr)
+	if (!expr) {
+		pr_debug("Muxed pin %s as GPIO\n", pdesc->name);
 		return 0;
+	}
 
 	/*
 	 * If GPIO is not the lowest priority signal type, assume there is only
 	 * one expression defined to enable the GPIO function
 	 */
-	return aspeed_sig_expr_enable(&pdata->pinmux, expr);
+	ret = aspeed_sig_expr_enable(&pdata->pinmux, expr);
+	if (ret)
+		return ret;
+
+	pr_debug("Muxed pin %s as %s\n", pdesc->name, expr->signal);
+
+	return 0;
 }
 
 int aspeed_pinctrl_probe(struct platform_device *pdev,
-- 
2.20.1

