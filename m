Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCF431FAB7
	for <lists+openbmc@lfdr.de>; Fri, 19 Feb 2021 15:29:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dhv8r1sJtz3cQ7
	for <lists+openbmc@lfdr.de>; Sat, 20 Feb 2021 01:29:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=GBIevE0q;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=aFR4zNHk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=GBIevE0q; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=aFR4zNHk; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dhv5Z538kz3cG5;
 Sat, 20 Feb 2021 01:26:26 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id C994058037F;
 Fri, 19 Feb 2021 09:26:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 19 Feb 2021 09:26:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Wz3rX2JLSP5Um
 Nsodg+6xxFvrCs/exUmWb2IW/KKfH8=; b=GBIevE0qUmg7yG7Po5bnyawiRA5Jx
 sgf7eey621kylHh7nI/lxxBW5ONVU5O60nauiBuTBq7/TKkoEEqc3KfZFZ1xegJo
 552tI19Wx/i6hIf/scSgBom8/xW0hVR54F5v9Bpg9dGIEmLpG3kLM3ntxxiCx0xs
 lb5MrEb7ZVTvMxZIi4BS9vtwPixW1hORusVzjfVHDfh8YTZJtuawDZGgv0pHYBQT
 Vd0irPLME4z615Sudgkuio47nlSn3dO6iQgZrbJVrQkKCe9Ojnb9OiuDpBaBYHL0
 AlyvH+YHwoNsS3gzofnI49ov9E7BuFbSJ1Z/4nHhXkjMgnINV96HTyzqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Wz3rX2JLSP5UmNsodg+6xxFvrCs/exUmWb2IW/KKfH8=; b=aFR4zNHk
 rbxP2mzGl6iG0BJns4R2dF0UB60/1T1dvDefSxl1fPaWDZVr/DuwiBd9Fwv47QpK
 Tdmx1i6MajStQGgbldReYnilVzxCqllWiKVeh0nxxrjVTAKwG5SQY01yisiK8Lju
 Wviai5E/L+3r8yrQmlgk/JPBykTCxcSMCb7dzMMapX4ZtUyj+uhdZjixNKo+sfny
 KUdMVsphxNdGATjZ0avppy5/EjTlnTjVxG50N+XPp8mRPmYMyYZknAdy1AhOY9at
 /c01Ra6gsSSlDjXhcIMMhnMJGjqwEF3fWyLZgns5jPiDKwJFCa8vX52N01m+uFWw
 NNK97DChvrtvug==
X-ME-Sender: <xms:kMovYDWpJZS0G4Qg3Tbq2s0jnEvg4jlp54O03BdoNCkPaV0v-c0pfg>
 <xme:kMovYLnF4CSvZ-dFxQX8LPnhpcaUghEI4QLweoKi2jiGt6S5f5cI_cbi1rpPOD4cg
 3PDm8mg_I8DZ6R2GQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
 ejffelffdvudduveeiffegteelvefhteenucfkphepudegrddvrdeluddrfeejnecuvehl
 uhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifse
 grjhdrihgurdgruh
X-ME-Proxy: <xmx:kMovYPa9RFEqMzNuzXqzbESfmAlT2-Zo5jj1dTsCW8JmxLUEInBTKA>
 <xmx:kMovYOVRmxRXQmiSYeT9FZmT2-_bWDnVV8bsErGw-KYDT3YrPoxZQw>
 <xmx:kMovYNlgFaNfLgP6TkgCK7p4nFV839VP56cc0X3LEAK09TlZ_GAz6w>
 <xmx:kMovYP07RGA1J_6zLBYkSLv2wwZJLE7-wdZMmZ8DH41i-CGNJC2dLA>
Received: from localhost.localdomain
 (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3AC8A24005A;
 Fri, 19 Feb 2021 09:26:17 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 minyard@acm.org
Subject: [PATCH 06/19] ipmi: kcs_bmc_aspeed: Use of match data to extract KCS
 properties
Date: Sat, 20 Feb 2021 00:55:10 +1030
Message-Id: <20210219142523.3464540-7-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210219142523.3464540-1-andrew@aj.id.au>
References: <20210219142523.3464540-1-andrew@aj.id.au>
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com,
 linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 avifishman70@gmail.com, venture@google.com, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org,
 lee.jones@linaro.org, chiawei_wang@aspeedtech.com,
 linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Unpack and remove the aspeed_kcs_probe_of_v[12]() functions to aid
rearranging how the private device-driver memory is allocated.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/char/ipmi/kcs_bmc_aspeed.c | 146 ++++++++++++++---------------
 1 file changed, 68 insertions(+), 78 deletions(-)

diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index eefe362f65f0..061f53676206 100644
--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/poll.h>
 #include <linux/regmap.h>
@@ -63,6 +64,10 @@ struct aspeed_kcs_bmc {
 	struct regmap *map;
 };
 
+struct aspeed_kcs_of_ops {
+	int (*get_channel)(struct platform_device *pdev);
+	int (*get_io_address)(struct platform_device *pdev);
+};
 
 static u8 aspeed_kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)
 {
@@ -231,13 +236,10 @@ static const struct kcs_ioreg ast_kcs_bmc_ioregs[KCS_CHANNEL_MAX] = {
 	{ .idr = LPC_IDR4, .odr = LPC_ODR4, .str = LPC_STR4 },
 };
 
-static struct kcs_bmc *aspeed_kcs_probe_of_v1(struct platform_device *pdev)
+static int aspeed_kcs_of_v1_get_channel(struct platform_device *pdev)
 {
-	struct aspeed_kcs_bmc *priv;
 	struct device_node *np;
-	struct kcs_bmc *kcs;
 	u32 channel;
-	u32 slave;
 	int rc;
 
 	np = pdev->dev.of_node;
@@ -245,105 +247,78 @@ static struct kcs_bmc *aspeed_kcs_probe_of_v1(struct platform_device *pdev)
 	rc = of_property_read_u32(np, "kcs_chan", &channel);
 	if ((rc != 0) || (channel == 0 || channel > KCS_CHANNEL_MAX)) {
 		dev_err(&pdev->dev, "no valid 'kcs_chan' configured\n");
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 	}
 
-	kcs = kcs_bmc_alloc(&pdev->dev, sizeof(struct aspeed_kcs_bmc), channel);
-	if (!kcs)
-		return ERR_PTR(-ENOMEM);
+	return channel;
+}
 
-	priv = kcs_bmc_priv(kcs);
-	priv->map = syscon_node_to_regmap(pdev->dev.parent->of_node);
-	if (IS_ERR(priv->map)) {
-		dev_err(&pdev->dev, "Couldn't get regmap\n");
-		return ERR_PTR(-ENODEV);
-	}
+static int aspeed_kcs_of_v1_get_io_address(struct platform_device *pdev)
+{
+	u32 slave;
+	int rc;
 
-	rc = of_property_read_u32(np, "kcs_addr", &slave);
-	if (rc) {
+	rc = of_property_read_u32(pdev->dev.of_node, "kcs_addr", &slave);
+	if (rc || slave > 0xffff) {
 		dev_err(&pdev->dev, "no valid 'kcs_addr' configured\n");
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 	}
 
-	kcs->ioreg = ast_kcs_bmc_ioregs[channel - 1];
-	aspeed_kcs_set_address(kcs, slave);
-
-	return kcs;
-}
-
-static int aspeed_kcs_calculate_channel(const struct kcs_ioreg *regs)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(ast_kcs_bmc_ioregs); i++) {
-		if (!memcmp(&ast_kcs_bmc_ioregs[i], regs, sizeof(*regs)))
-			return i + 1;
-	}
-
-	return -EINVAL;
+	return slave;
 }
 
-static struct kcs_bmc *aspeed_kcs_probe_of_v2(struct platform_device *pdev)
+static int aspeed_kcs_of_v2_get_channel(struct platform_device *pdev)
 {
-	struct aspeed_kcs_bmc *priv;
 	struct device_node *np;
 	struct kcs_ioreg ioreg;
-	struct kcs_bmc *kcs;
 	const __be32 *reg;
-	int channel;
-	u32 slave;
-	int rc;
+	int i;
 
 	np = pdev->dev.of_node;
 
 	/* Don't translate addresses, we want offsets for the regmaps */
 	reg = of_get_address(np, 0, NULL, NULL);
 	if (!reg)
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 	ioreg.idr = be32_to_cpup(reg);
 
 	reg = of_get_address(np, 1, NULL, NULL);
 	if (!reg)
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 	ioreg.odr = be32_to_cpup(reg);
 
 	reg = of_get_address(np, 2, NULL, NULL);
 	if (!reg)
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 	ioreg.str = be32_to_cpup(reg);
 
-	channel = aspeed_kcs_calculate_channel(&ioreg);
-	if (channel < 0)
-		return ERR_PTR(channel);
-
-	kcs = kcs_bmc_alloc(&pdev->dev, sizeof(struct aspeed_kcs_bmc), channel);
-	if (!kcs)
-		return ERR_PTR(-ENOMEM);
-
-	kcs->ioreg = ioreg;
-
-	priv = kcs_bmc_priv(kcs);
-	priv->map = syscon_node_to_regmap(pdev->dev.parent->of_node);
-	if (IS_ERR(priv->map)) {
-		dev_err(&pdev->dev, "Couldn't get regmap\n");
-		return ERR_PTR(-ENODEV);
+	for (i = 0; i < ARRAY_SIZE(ast_kcs_bmc_ioregs); i++) {
+		if (!memcmp(&ast_kcs_bmc_ioregs[i], &ioreg, sizeof(ioreg)))
+			return i + 1;
 	}
 
-	rc = of_property_read_u32(np, "aspeed,lpc-io-reg", &slave);
-	if (rc)
-		return ERR_PTR(rc);
+	return -EINVAL;
+}
 
-	aspeed_kcs_set_address(kcs, slave);
+static int aspeed_kcs_of_v2_get_io_address(struct platform_device *pdev)
+{
+	uint32_t slave;
+	int rc;
 
-	return kcs;
+	rc = of_property_read_u32(pdev->dev.of_node, "aspeed,lpc-io-reg", &slave);
+	if (rc || slave > 0xffff)
+		return -EINVAL;
+
+	return slave;
 }
 
 static int aspeed_kcs_probe(struct platform_device *pdev)
 {
+	const struct aspeed_kcs_of_ops *ops;
 	struct device *dev = &pdev->dev;
 	struct kcs_bmc *kcs_bmc;
 	struct device_node *np;
-	int rc;
+	int rc, channel, addr;
 
 	np = dev->of_node->parent;
 	if (!of_device_is_compatible(np, "aspeed,ast2400-lpc-v2") &&
@@ -352,23 +327,28 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 		dev_err(dev, "unsupported LPC device binding\n");
 		return -ENODEV;
 	}
-
-	np = dev->of_node;
-	if (of_device_is_compatible(np, "aspeed,ast2400-kcs-bmc") ||
-	    of_device_is_compatible(np, "aspeed,ast2500-kcs-bmc"))
-		kcs_bmc = aspeed_kcs_probe_of_v1(pdev);
-	else if (of_device_is_compatible(np, "aspeed,ast2400-kcs-bmc-v2") ||
-		 of_device_is_compatible(np, "aspeed,ast2500-kcs-bmc-v2"))
-		kcs_bmc = aspeed_kcs_probe_of_v2(pdev);
-	else
+	ops = of_device_get_match_data(&pdev->dev);
+	if (!ops)
 		return -EINVAL;
 
-	if (IS_ERR(kcs_bmc))
-		return PTR_ERR(kcs_bmc);
+	channel = ops->get_channel(pdev);
+	if (channel < 0)
+		return channel;
 
+	kcs_bmc = kcs_bmc_alloc(&pdev->dev, sizeof(struct aspeed_kcs_bmc), channel);
+	if (!kcs_bmc)
+		return -ENOMEM;
+
+	kcs_bmc->ioreg = ast_kcs_bmc_ioregs[channel - 1];
 	kcs_bmc->io_inputb = aspeed_kcs_inb;
 	kcs_bmc->io_outputb = aspeed_kcs_outb;
 
+	addr = ops->get_io_address(pdev);
+	if (addr < 0)
+		return addr;
+
+	aspeed_kcs_set_address(kcs_bmc, addr);
+
 	rc = aspeed_kcs_config_irq(kcs_bmc, pdev);
 	if (rc)
 		return rc;
@@ -400,11 +380,21 @@ static int aspeed_kcs_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct aspeed_kcs_of_ops of_v1_ops = {
+	.get_channel = aspeed_kcs_of_v1_get_channel,
+	.get_io_address = aspeed_kcs_of_v1_get_io_address,
+};
+
+static const struct aspeed_kcs_of_ops of_v2_ops = {
+	.get_channel = aspeed_kcs_of_v2_get_channel,
+	.get_io_address = aspeed_kcs_of_v2_get_io_address,
+};
+
 static const struct of_device_id ast_kcs_bmc_match[] = {
-	{ .compatible = "aspeed,ast2400-kcs-bmc" },
-	{ .compatible = "aspeed,ast2500-kcs-bmc" },
-	{ .compatible = "aspeed,ast2400-kcs-bmc-v2" },
-	{ .compatible = "aspeed,ast2500-kcs-bmc-v2" },
+	{ .compatible = "aspeed,ast2400-kcs-bmc", .data = &of_v1_ops },
+	{ .compatible = "aspeed,ast2500-kcs-bmc", .data = &of_v1_ops },
+	{ .compatible = "aspeed,ast2400-kcs-bmc-v2", .data = &of_v2_ops },
+	{ .compatible = "aspeed,ast2500-kcs-bmc-v2", .data = &of_v2_ops },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ast_kcs_bmc_match);
-- 
2.27.0

