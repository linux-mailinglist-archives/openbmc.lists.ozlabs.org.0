Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADFD341604
	for <lists+openbmc@lfdr.de>; Fri, 19 Mar 2021 07:39:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1vPR1vsJz3cnQ
	for <lists+openbmc@lfdr.de>; Fri, 19 Mar 2021 17:39:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=G8nK0j7U;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=EXHv05Ur;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=G8nK0j7U; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=EXHv05Ur; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1vCQ61xQz3c2C;
 Fri, 19 Mar 2021 17:30:26 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id E73E9580A7D;
 Fri, 19 Mar 2021 02:30:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 19 Mar 2021 02:30:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=LKmXDb+OBH8vc
 rQsLHQ/uqSreIyyMcXsaq0h99thI6g=; b=G8nK0j7Uqwpon5XvV7Npcqiz3GTWF
 uAzeceU/Xe8OQod1XLyx/1wZAOFmXZstWmzmPWKHj7AZVKBFh1XpEacubbbf4Nwp
 Wuu6JeP3vvWbibyUPh5dF0+YhErZSCmqjEloTdv1hN4mrmuEZQsVlBZitXqXIX3d
 /5A0gpa94j9IjFopZQo7jh0AIiPckvjIqqrMYA2UPVGOH38AcknNLHWeX0IVTKbh
 kWknSrqT72M/Rcll+J/BuQpDaZuhPLoilb9QoYvVs+8uMbrHTxcQZtZSMxFGgoOA
 tKczu4nPFzTSIcbUUhXWxMgIeELNy8IN0W8dYRXLru+FFYz1WjcTW0LkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=LKmXDb+OBH8vcrQsLHQ/uqSreIyyMcXsaq0h99thI6g=; b=EXHv05Ur
 MamlBSitCbHu1FVmgDkgath0o0S7qIHesS4QPcVr1Zj7LC5hu4xKlicy6mUVgKsg
 Xq8qEW1b0XwGbxKAvY0XIsU3uWvdXaZBnu54QMhSG7Co8xczxo0eAkBR9wY9PN1M
 NzgcgrF1xAfr/lo3hup0zci4pQroWcoWM92sFzptRHW3HQdnsFfJGUYm0JZ0J9+x
 99sh0qyN8Fm2W7Yf2UjwySdhWttumOsxWJfr/YNhQR2StMikhE8QNm9+x8M/guRa
 EStr05v3LdBQ0i5LPu40X/xnQimciaJpPd1cP6Swjc9zQg7aijXwNDy5X0ektT7x
 M0+c+KCGpDiFww==
X-ME-Sender: <xms:AEVUYBDxgylti2QwvCsW-URdkbYbc09ryLHWVWId7XsIIWv9EwA3HA>
 <xme:AEVUYPgfeJqYQZz4IkiLiWl4KtwGaHfk12xLxybAN26x6hUGFmY79_eaRgBx8L7xt
 f6WjGNZaZzVOWSHAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefjedgleeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppeduudekrddvuddtrddukedurdeh
 heenucevlhhushhtvghrufhiiigvpeelnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnh
 gurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:AEVUYMnE3jHQ9Jb3U8274WMLXiXLvtYr2jckrTk4v7st0gmvjGhafQ>
 <xmx:AEVUYLzL1VyqWWE1KhJYbzkTs2vO26kgYv2VoDvBCHwckMCgGBt-BA>
 <xmx:AEVUYGRrprHB1KPSdvqBaui0tlxjqrFcEKr2syDt5WnF7CKTPB4UjQ>
 <xmx:AEVUYPAcjyos8veh7G0EsYBYXcvbiZ5TKAcSUNJykwCdEDa7frMQwg>
Received: from localhost.localdomain
 (ppp118-210-181-55.adl-adc-lon-bras34.tpg.internode.on.net [118.210.181.55])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5A119240057;
 Fri, 19 Mar 2021 02:30:19 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 minyard@acm.org
Subject: [PATCH v2 21/21] ipmi: kcs_bmc_aspeed: Optionally apply status address
Date: Fri, 19 Mar 2021 16:57:52 +1030
Message-Id: <20210319062752.145730-21-andrew@aj.id.au>
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
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com,
 linux-gpio@vger.kernel.org, robh+dt@kernel.org, lee.jones@linaro.org,
 chiawei_wang@aspeedtech.com, linux-arm-kernel@lists.infradead.org,
 benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Some Aspeed KCS devices can derive the status register address from the
address of the data register. As such, the address of the status
register can be implicit in the configuration if desired. On the other
hand, sometimes address schemes might be requested that are incompatible
with the default addressing scheme. Allow these requests where possible
if the devicetree specifies the status register address.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/char/ipmi/kcs_bmc_aspeed.c | 113 +++++++++++++++++++++--------
 1 file changed, 81 insertions(+), 32 deletions(-)

diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index 7334b1f51dcc..98789b837690 100644
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
@@ -462,18 +495,18 @@ static int aspeed_kcs_of_v1_get_channel(struct platform_device *pdev)
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
@@ -509,16 +542,27 @@ static int aspeed_kcs_of_v2_get_channel(struct platform_device *pdev)
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
+	if (WARN_ON(rc == 0))
+		return -EINVAL;
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
@@ -527,9 +571,11 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
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
@@ -547,9 +593,9 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
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
@@ -578,7 +624,9 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 	priv->obe.remove = false;
 	timer_setup(&priv->obe.timer, aspeed_kcs_check_obe, 0);
 
-	aspeed_kcs_set_address(kcs_bmc, addr);
+	rc = aspeed_kcs_set_address(kcs_bmc, addrs, nr_addrs);
+	if (rc)
+		return rc;
 
 	/* Host to BMC IRQ */
 	rc = aspeed_kcs_config_downstream_irq(kcs_bmc, pdev);
@@ -600,7 +648,8 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 	if (rc < 0)
 		return rc;
 
-	dev_info(&pdev->dev, "Initialised channel %d at 0x%x\n", kcs_bmc->channel, addr);
+	dev_info(&pdev->dev, "Initialised channel %d at 0x%x\n",
+			kcs_bmc->channel, addrs[0]);
 
 	return 0;
 }
-- 
2.27.0

