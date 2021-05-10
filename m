Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76407377BF4
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 07:52:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fdqvf3mCRz3c2m
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 15:52:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=aAyZNcO1;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=FrmDWdZO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=aAyZNcO1; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=FrmDWdZO; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fdqkn4SwYz307Q;
 Mon, 10 May 2021 15:44:49 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5B78B5803EE;
 Mon, 10 May 2021 01:44:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 10 May 2021 01:44:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=WcWLsIVd7FBaV
 pMfmIuuKOIgK8kxwBSDHbabyxefQ2A=; b=aAyZNcO12+sQBN9IYuW333tWOLpYD
 ivdpU6xr9pkGxiSoJ3/ERzB7rxJDEihLIwL17hU55Im1u46uDZij3Qn59oVW0l1h
 TtCOlDC2JNtJsPleZj1E8pgvfMkivkMaFnRDTQvQyRJG/4PPNV8x/SCB7tQm6f74
 KYTjGMMqSJE2Ydfi+4LZqfTeMVi3/8gqRTB4igWRZ1L/XW2DoTlZfzPWRKrhe50a
 RSTytmerxBrSsink7S2Hv6xdOo0O79C03EXioPHmM+Y35JpvZJICjCxQI6STuYoq
 ksr61f/5q/q1H6cgSqfgJSvmBxzRiMIAvemiYKzIRozoa0MoEUEcqXAXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=WcWLsIVd7FBaVpMfmIuuKOIgK8kxwBSDHbabyxefQ2A=; b=FrmDWdZO
 xfFL021Yrm8QBWfY5wI6rI4hTj23Hiy4XBUTX0QjccAUBmwuzx4K95Eu+FybileB
 5ZXWiAiOFTuz32MLrJVOYAjXjWSIBttbt2IYW0qt01RW8ZOuz0n87ztLeqofzP/k
 CdkEQI9ozU+k3AhNfoUIlKP8YPjyrIWxFUFTzcPPAHjy2zV07mf01/zrHE4jo0R+
 Z8KFnf60RgCGr/1rQiARxoyMrOsJ6uiBlrlww+ryBLph80mxVX1TTCXKwAmr0lT2
 zNNvKOyCccojgXrFKp9blklECwEqis/pMXWhMVHEo3WJNFFttIcrsPJEQkxWo8xK
 kBb1QTzTiRj/Ww==
X-ME-Sender: <xms:T8iYYDfWYRQmjmBtgHYTuVvoFPLIvQAfDT5jwJclmR53Fslxk4SM_A>
 <xme:T8iYYJO7xwhdEIH_LHVGMIFA1-V2TNir9q0VcK71lW37dAbXLagUiMlSD5cyMtJx_
 yvtuK2xKlIRScPvYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegjedgleeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppedvtdefrdehjedrvdduhedrkeen
 ucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurh
 gvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:T8iYYMhHdYy13Q5u79AseoKClvbXi79vhj4G7gjvqzD5bYmG2M28hg>
 <xmx:T8iYYE-ssA2X01mwXShfDNUjR0bnyLoS57JBKwt0AuF5T2gY9M8Hnw>
 <xmx:T8iYYPsbICY8-hqbTQ8oH2PIR06nUtSw282Ii2ewVZUtd5Azmx9hGQ>
 <xmx:T8iYYIMPa7Bgq1lslYh-qpg-D3RGF0NyXjVjruH31oRQmR1VGw2wDA>
Received: from localhost.localdomain (unknown [203.57.215.8])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 10 May 2021 01:44:41 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 minyard@acm.org
Subject: [PATCH v3 16/16] ipmi: kcs_bmc_aspeed: Optionally apply status address
Date: Mon, 10 May 2021 15:12:13 +0930
Message-Id: <20210510054213.1610760-17-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210510054213.1610760-1-andrew@aj.id.au>
References: <20210510054213.1610760-1-andrew@aj.id.au>
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
 linux-aspeed@lists.ozlabs.org, avifishman70@gmail.com, venture@google.com,
 chiawei_wang@aspeedtech.com, linux-kernel@vger.kernel.org,
 tali.perry1@gmail.com, robh+dt@kernel.org, arnd@arndb.de, zweiss@equinix.com,
 linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Some Aspeed KCS devices can derive the status register address from the
address of the data register. As such, the address of the status
register can be implicit in the configuration if desired. On the other
hand, sometimes address schemes might be requested that are incompatible
with the default addressing scheme. Allow these requests where possible
if the devicetree specifies the status register address.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
---
 drivers/char/ipmi/kcs_bmc_aspeed.c | 110 ++++++++++++++++++++---------
 1 file changed, 78 insertions(+), 32 deletions(-)

diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index 558132b2b9f7..f6c58eb2883e 100644
--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
@@ -83,6 +83,8 @@
 #define LPC_STR2             0x040
 #define LPC_STR3             0x044
 #define LPC_HICRB            0x100
+#define     LPC_HICRB_EN16LADR2      BIT(5)
+#define     LPC_HICRB_EN16LADR1      BIT(4)
 #define     LPC_HICRB_IBFIE4         BIT(1)
 #define     LPC_HICRB_LPC4E          BIT(0)
 #define LPC_HICRC            0x104
@@ -96,6 +98,11 @@
 #define LPC_IDR4             0x114
 #define LPC_ODR4             0x118
 #define LPC_STR4             0x11C
+#define LPC_LSADR12	     0x120
+#define     LPC_LSADR12_LSADR2_MASK  GENMASK(31, 16)
+#define     LPC_LSADR12_LSADR2_SHIFT 16
+#define     LPC_LSADR12_LSADR1_MASK  GENMASK(15, 0)
+#define     LPC_LSADR12_LSADR1_SHIFT 0
 
 #define OBE_POLL_PERIOD	     (HZ / 2)
 
@@ -123,7 +130,7 @@ struct aspeed_kcs_bmc {
 
 struct aspeed_kcs_of_ops {
 	int (*get_channel)(struct platform_device *pdev);
-	int (*get_io_address)(struct platform_device *pdev);
+	int (*get_io_address)(struct platform_device *pdev, u32 addrs[2]);
 };
 
 static inline struct aspeed_kcs_bmc *to_aspeed_kcs_bmc(struct kcs_bmc_device *kcs_bmc)
@@ -217,38 +224,64 @@ static void aspeed_kcs_updateb(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 mask,
  *     C. KCS4
  *        D / C : CA4h / CA5h
  */
-static void aspeed_kcs_set_address(struct kcs_bmc_device *kcs_bmc, u16 addr)
+static int aspeed_kcs_set_address(struct kcs_bmc_device *kcs_bmc, u32 addrs[2], int nr_addrs)
 {
 	struct aspeed_kcs_bmc *priv = to_aspeed_kcs_bmc(kcs_bmc);
 
-	switch (kcs_bmc->channel) {
+	if (WARN_ON(nr_addrs < 1 || nr_addrs > 2))
+		return -EINVAL;
+
+	switch (priv->kcs_bmc.channel) {
 	case 1:
-		regmap_update_bits(priv->map, LPC_HICR4,
-				LPC_HICR4_LADR12AS, 0);
-		regmap_write(priv->map, LPC_LADR12H, addr >> 8);
-		regmap_write(priv->map, LPC_LADR12L, addr & 0xFF);
+		regmap_update_bits(priv->map, LPC_HICR4, LPC_HICR4_LADR12AS, 0);
+		regmap_write(priv->map, LPC_LADR12H, addrs[0] >> 8);
+		regmap_write(priv->map, LPC_LADR12L, addrs[0] & 0xFF);
+		if (nr_addrs == 2) {
+			regmap_update_bits(priv->map, LPC_LSADR12, LPC_LSADR12_LSADR1_MASK,
+					   addrs[1] << LPC_LSADR12_LSADR1_SHIFT);
+
+			regmap_update_bits(priv->map, LPC_HICRB, LPC_HICRB_EN16LADR1,
+					   LPC_HICRB_EN16LADR1);
+		}
 		break;
 
 	case 2:
-		regmap_update_bits(priv->map, LPC_HICR4,
-				LPC_HICR4_LADR12AS, LPC_HICR4_LADR12AS);
-		regmap_write(priv->map, LPC_LADR12H, addr >> 8);
-		regmap_write(priv->map, LPC_LADR12L, addr & 0xFF);
+		regmap_update_bits(priv->map, LPC_HICR4, LPC_HICR4_LADR12AS, LPC_HICR4_LADR12AS);
+		regmap_write(priv->map, LPC_LADR12H, addrs[0] >> 8);
+		regmap_write(priv->map, LPC_LADR12L, addrs[0] & 0xFF);
+		if (nr_addrs == 2) {
+			regmap_update_bits(priv->map, LPC_LSADR12, LPC_LSADR12_LSADR2_MASK,
+					   addrs[1] << LPC_LSADR12_LSADR2_SHIFT);
+
+			regmap_update_bits(priv->map, LPC_HICRB, LPC_HICRB_EN16LADR2,
+					   LPC_HICRB_EN16LADR2);
+		}
 		break;
 
 	case 3:
-		regmap_write(priv->map, LPC_LADR3H, addr >> 8);
-		regmap_write(priv->map, LPC_LADR3L, addr & 0xFF);
+		if (nr_addrs == 2) {
+			dev_err(priv->kcs_bmc.dev,
+				"Channel 3 only supports inferred status IO address\n");
+			return -EINVAL;
+		}
+
+		regmap_write(priv->map, LPC_LADR3H, addrs[0] >> 8);
+		regmap_write(priv->map, LPC_LADR3L, addrs[0] & 0xFF);
 		break;
 
 	case 4:
-		regmap_write(priv->map, LPC_LADR4, ((addr + 1) << 16) |
-			addr);
+		if (nr_addrs == 1)
+			regmap_write(priv->map, LPC_LADR4, ((addrs[0] + 1) << 16) | addrs[0]);
+		else
+			regmap_write(priv->map, LPC_LADR4, (addrs[1] << 16) | addrs[0]);
+
 		break;
 
 	default:
-		break;
+		return -EINVAL;
 	}
+
+	return 0;
 }
 
 static inline int aspeed_kcs_map_serirq_type(u32 dt_type)
@@ -457,18 +490,18 @@ static int aspeed_kcs_of_v1_get_channel(struct platform_device *pdev)
 	return channel;
 }
 
-static int aspeed_kcs_of_v1_get_io_address(struct platform_device *pdev)
+static int
+aspeed_kcs_of_v1_get_io_address(struct platform_device *pdev, u32 addrs[2])
 {
-	u32 slave;
 	int rc;
 
-	rc = of_property_read_u32(pdev->dev.of_node, "kcs_addr", &slave);
-	if (rc || slave > 0xffff) {
+	rc = of_property_read_u32(pdev->dev.of_node, "kcs_addr", addrs);
+	if (rc || addrs[0] > 0xffff) {
 		dev_err(&pdev->dev, "no valid 'kcs_addr' configured\n");
 		return -EINVAL;
 	}
 
-	return slave;
+	return 1;
 }
 
 static int aspeed_kcs_of_v2_get_channel(struct platform_device *pdev)
@@ -504,16 +537,24 @@ static int aspeed_kcs_of_v2_get_channel(struct platform_device *pdev)
 	return -EINVAL;
 }
 
-static int aspeed_kcs_of_v2_get_io_address(struct platform_device *pdev)
+static int
+aspeed_kcs_of_v2_get_io_address(struct platform_device *pdev, u32 addrs[2])
 {
-	uint32_t slave;
 	int rc;
 
-	rc = of_property_read_u32(pdev->dev.of_node, "aspeed,lpc-io-reg", &slave);
-	if (rc || slave > 0xffff)
+	rc = of_property_read_variable_u32_array(pdev->dev.of_node,
+						 "aspeed,lpc-io-reg",
+						 addrs, 1, 2);
+	if (rc < 0)
+		return rc;
+
+	if (addrs[0] > 0xffff)
+		return -EINVAL;
+
+	if (rc == 2 && addrs[1] > 0xffff)
 		return -EINVAL;
 
-	return slave;
+	return rc;
 }
 
 static int aspeed_kcs_probe(struct platform_device *pdev)
@@ -522,9 +563,11 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 	struct kcs_bmc_device *kcs_bmc;
 	struct aspeed_kcs_bmc *priv;
 	struct device_node *np;
-	int rc, channel, addr;
 	bool have_upstream_irq;
 	u32 upstream_irq[2];
+	int rc, channel;
+	int nr_addrs;
+	u32 addrs[2];
 
 	np = pdev->dev.of_node->parent;
 	if (!of_device_is_compatible(np, "aspeed,ast2400-lpc-v2") &&
@@ -542,9 +585,9 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 	if (channel < 0)
 		return channel;
 
-	addr = ops->get_io_address(pdev);
-	if (addr < 0)
-		return addr;
+	nr_addrs = ops->get_io_address(pdev, addrs);
+	if (nr_addrs < 0)
+		return nr_addrs;
 
 	np = pdev->dev.of_node;
 	rc = of_property_read_u32_array(np, "aspeed,lpc-interrupts", upstream_irq, 2);
@@ -573,7 +616,9 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 	priv->obe.remove = false;
 	timer_setup(&priv->obe.timer, aspeed_kcs_check_obe, 0);
 
-	aspeed_kcs_set_address(kcs_bmc, addr);
+	rc = aspeed_kcs_set_address(kcs_bmc, addrs, nr_addrs);
+	if (rc)
+		return rc;
 
 	/* Host to BMC IRQ */
 	rc = aspeed_kcs_config_downstream_irq(kcs_bmc, pdev);
@@ -596,7 +641,8 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 
 	kcs_bmc_add_device(&priv->kcs_bmc);
 
-	dev_info(&pdev->dev, "Initialised channel %d at 0x%x\n", kcs_bmc->channel, addr);
+	dev_info(&pdev->dev, "Initialised channel %d at 0x%x\n",
+			kcs_bmc->channel, addrs[0]);
 
 	return 0;
 }
-- 
2.27.0

