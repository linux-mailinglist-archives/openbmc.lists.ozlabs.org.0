Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BD231FAF5
	for <lists+openbmc@lfdr.de>; Fri, 19 Feb 2021 15:35:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhvJN4S3Zz3cTZ
	for <lists+openbmc@lfdr.de>; Sat, 20 Feb 2021 01:35:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=qAW333sn;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ovFpiPRP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=qAW333sn; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=ovFpiPRP; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dhv7B2j8Dz3cRY;
 Sat, 20 Feb 2021 01:27:50 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 76A9C5803C7;
 Fri, 19 Feb 2021 09:27:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 19 Feb 2021 09:27:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=qbH62si7fZofL
 8qBiF9TdRVx1jIFWTr/Ce2qQHbzWB0=; b=qAW333sn3u2g4N/YAc/OQGZxDs5eq
 eCKdBJ/wBTDXlPk9zFNE1IIdgboGDTMqvlT8NTQ/dNeVXEknGvykuXQ9G9uxiYsD
 KxYIaZ0HTglcR2qQvWj0O/s05/I1n4vMw2/soNsGipqEQWMguzluJkjGu00NdpIB
 nL4HJ+cUFuKoqlm7rB1PWHOrpA2jal9nQc1yA9lF1Ykw/5yEWmUTKwiZJPVMzh3I
 ykDef/5tpjsKQ7HQ7rfdPjH0JIQFUO7uzfiqRJUja4L1And33t0V3OrQwVQ0s0iJ
 6wJ+hTPWa+3ncE+HbqIIj8Bjc/KyO7GL3sQvNU9S1uUsTKZzJ9+L8t68w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=qbH62si7fZofL8qBiF9TdRVx1jIFWTr/Ce2qQHbzWB0=; b=ovFpiPRP
 +Y0TZ0ShYgsz3NzdMXbjm+6S6G/G7iKLDflP9LiViBE1X39y/e2Flka2vTceC8yw
 Bd9pXzj6/9Dnfz0JoxstJhjvUKZIVIQDyt+fReK9iFdbT6sccz9koZhXI6GmNOZw
 eBTCyLUIOlDsnyITb7PinXP0W+hqiGxbCKOMLYU6hkLJNNjJA2RYGy7bAPM+fvrv
 AOzFOwYQ81zrRkUbdS9uT5CSR34OjkCgEN0aSun8s1bOgR1KB6OO/lDWD+FXqWcc
 ztZPBwRK7Z4OukNkbCAsT2a2LmRV3lnwvg3NjUqzHeO28x+LrNESG9sKY68e2D2t
 tq0AK2l5XCfDMA==
X-ME-Sender: <xms:5MovYErrmDdE5BZgEgnn-MZbIK4vbpLDvmCgeqezRw3fjsl8flRPsg>
 <xme:5MovYKrGrmv2IFs1K1bmtqI8rQ1LhDx2hI-5TCEVeizHWH64MT50eqtzjEltpxdPO
 A2oVUhGPtcR1fKIxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
 ejffelffdvudduveeiffegteelvefhteenucfkphepudegrddvrdeluddrfeejnecuvehl
 uhhsthgvrhfuihiivgepuddtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfi
 esrghjrdhiugdrrghu
X-ME-Proxy: <xmx:5MovYJOq_2fbS9P2zzdwOh1r6Da5L44Em1yUupsQKHEt5pNuIRNtQA>
 <xmx:5MovYL4eg_nKxUaJDe_AUyZxSe0Fv_fO3ipbexF0vSIHRp_-EdlyAg>
 <xmx:5MovYD6P3mG4VJYGEILsTIsPqWxid4gppwU4Uni1M6jPCCPQq20ktw>
 <xmx:5MovYHqIbiIupDU4pTmnphywoLbKo-2fvwfvyHjoGm75oulorktwaw>
Received: from localhost.localdomain
 (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
 by mail.messagingengine.com (Postfix) with ESMTPA id EAFA3240066;
 Fri, 19 Feb 2021 09:27:41 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 minyard@acm.org
Subject: [PATCH 18/19] ipmi: kcs_bmc_aspeed: Implement KCS SerIRQ configuration
Date: Sat, 20 Feb 2021 00:55:22 +1030
Message-Id: <20210219142523.3464540-19-andrew@aj.id.au>
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

Apply the SerIRQ ID and level/sense behaviours from the devicetree if
provided.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/char/ipmi/kcs_bmc_aspeed.c | 126 +++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index 17afe9449e72..649d795a5a75 100644
--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
@@ -9,6 +9,7 @@
 #include <linux/errno.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/irq.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -39,6 +40,20 @@
 #define LPC_HICR4            0x010
 #define     LPC_HICR4_LADR12AS       BIT(7)
 #define     LPC_HICR4_KCSENBL        BIT(2)
+#define LPC_SIRQCR2	     0x078
+#define     LPC_SIRQCR2_SEL1IRQX     BIT(13)
+#define     LPC_SIRQCR2_IRQXE1       BIT(12)
+#define     LPC_SIRQCR2_ID1IRQX_MASK GENMASK(11, 8)
+#define     LPC_SIRQCR2_ID1IRQX_SHIFT 8
+#define LPC_HICR5	     0x080
+#define     LPC_HICR5_ID3IRQX_MASK   GENMASK(23, 20)
+#define     LPC_HICR5_ID3IRQX_SHIFT  20
+#define     LPC_HICR5_ID2IRQX_MASK   GENMASK(19, 16)
+#define     LPC_HICR5_ID2IRQX_SHIFT  16
+#define     LPC_HICR5_SEL3IRQX       BIT(15)
+#define     LPC_HICR5_IRQXE3         BIT(14)
+#define     LPC_HICR5_SEL2IRQX       BIT(13)
+#define     LPC_HICR5_IRQXE2         BIT(12)
 #define LPC_LADR3H           0x014
 #define LPC_LADR3L           0x018
 #define LPC_LADR12H          0x01C
@@ -55,6 +70,17 @@
 #define LPC_HICRB            0x100
 #define     LPC_HICRB_IBFIF4         BIT(1)
 #define     LPC_HICRB_LPC4E          BIT(0)
+#define LPC_HICRC            0x104
+#define     LPC_HICRC_ID4IRQX_MASK   GENMASK(7, 4)
+#define     LPC_HICRC_ID4IRQX_SHIFT  4
+#define     LPC_HICRC_TY4IRQX_MASK   GENMASK(3, 2)
+#define     LPC_HICRC_TY4IRQX_SHIFT  2
+#define     LPC_HICRC_TY4IRQX_LOW    0b00
+#define     LPC_HICRC_TY4IRQX_HIGH   0b01
+#define     LPC_HICRC_TY4IRQX_RSVD   0b10
+#define     LPC_HICRC_TY4IRQX_RISING 0b11
+#define     LPC_HICRC_OBF4_AUTO_CLR  BIT(1)
+#define     LPC_HICRC_IRQXE4         BIT(0)
 #define LPC_LADR4            0x110
 #define LPC_IDR4             0x114
 #define LPC_ODR4             0x118
@@ -99,10 +125,37 @@ static u8 aspeed_kcs_inb(struct kcs_bmc_device *kcs_bmc, u32 reg)
 static void aspeed_kcs_outb(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 data)
 {
 	struct aspeed_kcs_bmc *priv = to_aspeed_kcs_bmc(kcs_bmc);
+	unsigned int ier;
 	int rc;
 
 	rc = regmap_write(priv->map, reg, data);
 	WARN(rc != 0, "regmap_write() failed: %d\n", rc);
+
+	/* Trigger the SerIRQ on ODR writes if enabled */
+	switch (kcs_bmc->channel) {
+	case 1:
+		regmap_read(priv->map, LPC_SIRQCR2, &ier);
+		if (reg == LPC_ODR1 && (ier & LPC_SIRQCR2_SEL1IRQX))
+			regmap_write(priv->map, LPC_SIRQCR2, ier | LPC_SIRQCR2_IRQXE1);
+		break;
+	case 2:
+		regmap_read(priv->map, LPC_HICR5, &ier);
+		if (reg == LPC_ODR2 && (ier & LPC_HICR5_SEL2IRQX))
+			regmap_write(priv->map, LPC_HICR5, ier | LPC_HICR5_IRQXE2);
+		break;
+	case 3:
+		regmap_read(priv->map, LPC_HICR5, &ier);
+		if (reg == LPC_ODR3 && (ier & LPC_HICR5_SEL3IRQX))
+			regmap_write(priv->map, LPC_HICR5, ier | LPC_HICR5_IRQXE3);
+		break;
+	case 4:
+		regmap_read(priv->map, LPC_HICRC, &ier);
+		if (reg == LPC_ODR4 && (ier & LPC_HICRC_ID4IRQX_MASK))
+			regmap_write(priv->map, LPC_HICRC, ier | LPC_HICRC_IRQXE4);
+		break;
+	default:
+		break;
+	}
 }
 
 static void aspeed_kcs_updateb(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 mask, u8 val)
@@ -161,6 +214,66 @@ static void aspeed_kcs_set_address(struct kcs_bmc_device *kcs_bmc, u16 addr)
 	}
 }
 
+static inline int aspeed_kcs_map_serirq_type(u32 dt_type)
+{
+	switch (dt_type) {
+	case IRQ_TYPE_EDGE_RISING:
+		return LPC_HICRC_TY4IRQX_RISING;
+	case IRQ_TYPE_LEVEL_HIGH:
+		return LPC_HICRC_TY4IRQX_HIGH;
+	case IRQ_TYPE_LEVEL_LOW:
+		return LPC_HICRC_TY4IRQX_LOW;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int aspeed_kcs_config_serirq(struct aspeed_kcs_bmc *priv, u32 id, u32 dt_type)
+{
+	unsigned int mask, val;
+
+	if (id > 15)
+		return -EINVAL;
+
+	switch (priv->kcs_bmc.channel) {
+	case 1:
+		mask = LPC_SIRQCR2_SEL1IRQX | LPC_SIRQCR2_ID1IRQX_MASK;
+		val = LPC_SIRQCR2_SEL1IRQX | (id << LPC_SIRQCR2_ID1IRQX_SHIFT);
+		regmap_update_bits(priv->map, LPC_SIRQCR2, mask, val);
+		break;
+	case 2:
+		mask = LPC_HICR5_SEL2IRQX | LPC_HICR5_ID2IRQX_MASK;
+		val = LPC_HICR5_SEL2IRQX | (id << LPC_HICR5_ID2IRQX_SHIFT);
+		regmap_update_bits(priv->map, LPC_HICR5, mask, val);
+		break;
+	case 3:
+		mask = LPC_HICR5_SEL3IRQX | LPC_HICR5_ID3IRQX_MASK;
+		val = LPC_HICR5_SEL3IRQX | (id << LPC_HICR5_ID3IRQX_SHIFT);
+		regmap_update_bits(priv->map, LPC_HICR5, mask, val);
+		break;
+	case 4:
+	{
+		unsigned int hw_type;
+
+		hw_type = aspeed_kcs_map_serirq_type(dt_type);
+		if (hw_type < 0)
+			return hw_type;
+
+		mask = LPC_HICRC_ID4IRQX_MASK | LPC_HICRC_TY4IRQX_MASK | LPC_HICRC_OBF4_AUTO_CLR;
+		val = (id << LPC_HICRC_ID4IRQX_SHIFT) | (hw_type << LPC_HICRC_TY4IRQX_SHIFT);
+		regmap_update_bits(priv->map, LPC_HICRC, mask, val);
+		break;
+	}
+	default:
+		dev_warn(priv->kcs_bmc.dev,
+			 "SerIRQ configuration not supported on KCS channel %d\n",
+			 priv->kcs_bmc.channel);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static void aspeed_kcs_enable_channel(struct kcs_bmc_device *kcs_bmc, bool enable)
 {
 	struct aspeed_kcs_bmc *priv = to_aspeed_kcs_bmc(kcs_bmc);
@@ -371,6 +484,8 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 	struct aspeed_kcs_bmc *priv;
 	struct device_node *np;
 	int rc, channel, addr;
+	bool have_serirq;
+	u32 serirq[2];
 
 	np = pdev->dev.of_node->parent;
 	if (!of_device_is_compatible(np, "aspeed,ast2400-lpc-v2") &&
@@ -379,6 +494,7 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "unsupported LPC device binding\n");
 		return -ENODEV;
 	}
+
 	ops = of_device_get_match_data(&pdev->dev);
 	if (!ops)
 		return -EINVAL;
@@ -391,6 +507,12 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 	if (addr < 0)
 		return addr;
 
+	rc = of_property_read_u32_array(pdev->dev.of_node, "aspeed,lpc-interrupts", serirq, 2);
+	if ((rc && rc != -EINVAL))
+		return -EINVAL;
+
+	have_serirq = !rc;
+
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
@@ -413,6 +535,9 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 
 	aspeed_kcs_set_address(kcs_bmc, addr);
 
+	if (have_serirq)
+		aspeed_kcs_config_serirq(priv, serirq[0], serirq[1]);
+
 	rc = aspeed_kcs_config_irq(kcs_bmc, pdev);
 	if (rc)
 		return rc;
@@ -482,4 +607,5 @@ module_platform_driver(ast_kcs_bmc_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
+MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
 MODULE_DESCRIPTION("Aspeed device interface to the KCS BMC device");
-- 
2.27.0

