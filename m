Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A26377CA4
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 08:58:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdsMC5Nzsz309F
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 16:57:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=Ogfov7fh;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=XN8Vcxe6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=Ogfov7fh; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=XN8Vcxe6; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdsCH6q3gz301J
 for <openbmc@lists.ozlabs.org>; Mon, 10 May 2021 16:51:07 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 0F687FB1;
 Mon, 10 May 2021 02:51:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 10 May 2021 02:51:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=YVCBtVy4KNk1s
 i8WoyTdyUVSn9eziUYwJgS2SVvmNqQ=; b=Ogfov7fhoPhj4VoYiwG6Pi8mPJl2i
 zXBiwDWuH5SYokeSBrJSMH+i7QYdPZQ9Q/yHREYoQ7Q1Gi9YTnU1EDQybN6Ev15e
 vAeJ8MuXYdP3DuKIy9bxh8ZaxmXQUbmxlY8c1A609+mXR9APSz/Ar5qRzkj/MlQe
 Hnv1yyjqwbAHihGkb9CDqfqWr5AnJ4ceGulMZt2/ia7UL+9QtTa05pIZ6D0uc61V
 F6e9T+k4PU15YbvY9ke/n4D4/ks875zUHXT1qo+5sqE7CECRC6CnojpM6SYMDf/w
 pYLvSwXKLbwJfLxp2tD2PBxWbLUflUVZAjhAF84SiexP9ZiXzux7VWY2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=YVCBtVy4KNk1si8WoyTdyUVSn9eziUYwJgS2SVvmNqQ=; b=XN8Vcxe6
 FU8lcPv4g5e8i109YAGZAI5NSe7QDv0Tq6uns+ulxEHhwCth9FR7KriiPn70WeQw
 b6z9TYfGv9m20qaQ46E48nBkmFZWG7+WHjZ/Iaizg40hfJjwFNi37KL/8fEveV01
 aXVVN6iwXufI1u7wNjgfofBHZo+btbPHZDhX+TkAk3pTlirda+0Yxad9Llqddg4K
 wgFOoI3/yc2MMuU0gW/P2r4vEGeVZinc5tf6H6nO/VmTrd5XQc6QtGC34BkPa2nR
 NeBTBSbmrlN4L4VeVoqp8uWVZdPpJxuBQEXzCDRBOcjdItU4/Z+LlVfr8JKQ693+
 SAIavRiGguW/qw==
X-ME-Sender: <xms:2deYYDJhgRnkj0IvRJ9bsycb0SAIjJmhCExysCnOzSa0aO-HZGhIYA>
 <xme:2deYYHJqd1e17FX_lcof4gHLtYsFaMBqiCzGBuP1VGmjMT_7K589MktaqYBdYTrJa
 K85FarshqEkSVslIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegjedguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfies
 rghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgle
 etteejffelffdvudduveeiffegteelvefhteenucfkphepvddtfedrheejrddvudehrdek
 necuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomheprghnug
 hrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:2deYYLsW83tGuLyLlsg8rzyWdCjTT-1YzHH1hRLgreCfy-2v-QdEmw>
 <xmx:2deYYMYbNJDULdkm1pWPNkBWiUHHRZSOnEDxMQG0uIVMff51j2FC8Q>
 <xmx:2deYYKZ778EAboMTbTMWwsYjusoJEsdVwkGh0Edw_yadJ450zhlagg>
 <xmx:2deYYI25vxEUq7xnENohO4UScfSVk40m27BUG85CoAMPJhi6LozK3Q>
Received: from localhost.localdomain (203-57-215-8.dyn.iinet.net.au
 [203.57.215.8]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 10 May 2021 02:51:04 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.10 v3 14/18] ipmi: kcs_bmc_aspeed: Implement KCS
 SerIRQ configuration
Date: Mon, 10 May 2021 16:19:51 +0930
Message-Id: <20210510064955.1704652-15-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210510064955.1704652-1-andrew@aj.id.au>
References: <20210510064955.1704652-1-andrew@aj.id.au>
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

Apply the SerIRQ ID and level/sense behaviours from the devicetree if
provided.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/char/ipmi/kcs_bmc_aspeed.c | 182 ++++++++++++++++++++++++++++-
 1 file changed, 180 insertions(+), 2 deletions(-)

diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index 2c88b34b803c..5ef9f50ceff3 100644
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
@@ -28,6 +29,22 @@
 
 #define KCS_CHANNEL_MAX     4
 
+/*
+ * Field class descriptions
+ *
+ * LPCyE	Enable LPC channel y
+ * IBFIEy	Input Buffer Full IRQ Enable for LPC channel y
+ * IRQxEy	Assert SerIRQ x for LPC channel y (Deprecated, use IDyIRQX, IRQXEy)
+ * IDyIRQX	Use the specified 4-bit SerIRQ for LPC channel y
+ * SELyIRQX	SerIRQ polarity for LPC channel y (low: 0, high: 1)
+ * IRQXEy	Assert the SerIRQ specified in IDyIRQX for LPC channel y
+ */
+
+#define LPC_TYIRQX_LOW       0b00
+#define LPC_TYIRQX_HIGH      0b01
+#define LPC_TYIRQX_RSVD      0b10
+#define LPC_TYIRQX_RISING    0b11
+
 #define LPC_HICR0            0x000
 #define     LPC_HICR0_LPC3E          BIT(7)
 #define     LPC_HICR0_LPC2E          BIT(6)
@@ -39,6 +56,19 @@
 #define LPC_HICR4            0x010
 #define     LPC_HICR4_LADR12AS       BIT(7)
 #define     LPC_HICR4_KCSENBL        BIT(2)
+#define LPC_SIRQCR0	     0x070
+/* IRQ{12,1}E1 are deprecated as of AST2600 A3 but necessary for prior chips */
+#define     LPC_SIRQCR0_IRQ12E1	     BIT(1)
+#define     LPC_SIRQCR0_IRQ1E1	     BIT(0)
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
@@ -55,6 +85,13 @@
 #define LPC_HICRB            0x100
 #define     LPC_HICRB_IBFIF4         BIT(1)
 #define     LPC_HICRB_LPC4E          BIT(0)
+#define LPC_HICRC            0x104
+#define     LPC_HICRC_ID4IRQX_MASK   GENMASK(7, 4)
+#define     LPC_HICRC_ID4IRQX_SHIFT  4
+#define     LPC_HICRC_TY4IRQX_MASK   GENMASK(3, 2)
+#define     LPC_HICRC_TY4IRQX_SHIFT  2
+#define     LPC_HICRC_OBF4_AUTO_CLR  BIT(1)
+#define     LPC_HICRC_IRQXE4         BIT(0)
 #define LPC_LADR4            0x110
 #define LPC_IDR4             0x114
 #define LPC_ODR4             0x118
@@ -62,11 +99,21 @@
 
 #define OBE_POLL_PERIOD	     (HZ / 2)
 
+enum aspeed_kcs_irq_mode {
+	aspeed_kcs_irq_none,
+	aspeed_kcs_irq_serirq,
+};
+
 struct aspeed_kcs_bmc {
 	struct kcs_bmc_device kcs_bmc;
 
 	struct regmap *map;
 
+	struct {
+		enum aspeed_kcs_irq_mode mode;
+		int id;
+	} upstream_irq;
+
 	struct {
 		spinlock_t lock;
 		bool remove;
@@ -103,6 +150,49 @@ static void aspeed_kcs_outb(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 data)
 
 	rc = regmap_write(priv->map, reg, data);
 	WARN(rc != 0, "regmap_write() failed: %d\n", rc);
+
+	/* Trigger the upstream IRQ on ODR writes, if enabled */
+
+	switch (reg) {
+	case LPC_ODR1:
+	case LPC_ODR2:
+	case LPC_ODR3:
+	case LPC_ODR4:
+		break;
+	default:
+		return;
+	}
+
+	if (priv->upstream_irq.mode != aspeed_kcs_irq_serirq)
+		return;
+
+	switch (kcs_bmc->channel) {
+	case 1:
+		switch (priv->upstream_irq.id) {
+		case 12:
+			regmap_update_bits(priv->map, LPC_SIRQCR0, LPC_SIRQCR0_IRQ12E1,
+					   LPC_SIRQCR0_IRQ12E1);
+			break;
+		case 1:
+			regmap_update_bits(priv->map, LPC_SIRQCR0, LPC_SIRQCR0_IRQ1E1,
+					   LPC_SIRQCR0_IRQ1E1);
+			break;
+		default:
+			break;
+		}
+		break;
+	case 2:
+		regmap_update_bits(priv->map, LPC_HICR5, LPC_HICR5_IRQXE2, LPC_HICR5_IRQXE2);
+		break;
+	case 3:
+		regmap_update_bits(priv->map, LPC_HICR5, LPC_HICR5_IRQXE3, LPC_HICR5_IRQXE3);
+		break;
+	case 4:
+		regmap_update_bits(priv->map, LPC_HICRC, LPC_HICRC_IRQXE4, LPC_HICRC_IRQXE4);
+		break;
+	default:
+		break;
+	}
 }
 
 static void aspeed_kcs_updateb(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 mask, u8 val)
@@ -161,6 +251,73 @@ static void aspeed_kcs_set_address(struct kcs_bmc_device *kcs_bmc, u16 addr)
 	}
 }
 
+static inline int aspeed_kcs_map_serirq_type(u32 dt_type)
+{
+	switch (dt_type) {
+	case IRQ_TYPE_EDGE_RISING:
+		return LPC_TYIRQX_RISING;
+	case IRQ_TYPE_LEVEL_HIGH:
+		return LPC_TYIRQX_HIGH;
+	case IRQ_TYPE_LEVEL_LOW:
+		return LPC_TYIRQX_LOW;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int aspeed_kcs_config_upstream_irq(struct aspeed_kcs_bmc *priv, u32 id, u32 dt_type)
+{
+	unsigned int mask, val, hw_type;
+
+	if (id > 15)
+		return -EINVAL;
+
+	hw_type = aspeed_kcs_map_serirq_type(dt_type);
+	if (hw_type < 0)
+		return hw_type;
+
+	priv->upstream_irq.mode = aspeed_kcs_irq_serirq;
+	priv->upstream_irq.id = id;
+
+	switch (priv->kcs_bmc.channel) {
+	case 1:
+		/* Needs IRQxE1 rather than (ID1IRQX, SEL1IRQX, IRQXE1) before AST2600 A3 */
+		break;
+	case 2:
+		if (!(hw_type == LPC_TYIRQX_LOW || hw_type == LPC_TYIRQX_HIGH))
+			return -EINVAL;
+
+		mask = LPC_HICR5_SEL2IRQX | LPC_HICR5_ID2IRQX_MASK;
+		val = (id << LPC_HICR5_ID2IRQX_SHIFT);
+		val |= (hw_type == LPC_TYIRQX_HIGH) ? LPC_HICR5_SEL2IRQX : 0;
+		regmap_update_bits(priv->map, LPC_HICR5, mask, val);
+
+		break;
+	case 3:
+		if (!(hw_type == LPC_TYIRQX_LOW || hw_type == LPC_TYIRQX_HIGH))
+			return -EINVAL;
+
+		mask = LPC_HICR5_SEL3IRQX | LPC_HICR5_ID3IRQX_MASK;
+		val = (id << LPC_HICR5_ID3IRQX_SHIFT);
+		val |= (hw_type == LPC_TYIRQX_HIGH) ? LPC_HICR5_SEL3IRQX : 0;
+		regmap_update_bits(priv->map, LPC_HICR5, mask, val);
+
+		break;
+	case 4:
+		mask = LPC_HICRC_ID4IRQX_MASK | LPC_HICRC_TY4IRQX_MASK | LPC_HICRC_OBF4_AUTO_CLR;
+		val = (id << LPC_HICRC_ID4IRQX_SHIFT) | (hw_type << LPC_HICRC_TY4IRQX_SHIFT);
+		regmap_update_bits(priv->map, LPC_HICRC, mask, val);
+		break;
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
@@ -262,7 +419,7 @@ static irqreturn_t aspeed_kcs_irq(int irq, void *arg)
 	return kcs_bmc_handle_event(kcs_bmc);
 }
 
-static int aspeed_kcs_config_irq(struct kcs_bmc_device *kcs_bmc,
+static int aspeed_kcs_config_downstream_irq(struct kcs_bmc_device *kcs_bmc,
 			struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -366,6 +523,8 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 	struct aspeed_kcs_bmc *priv;
 	struct device_node *np;
 	int rc, channel, addr;
+	bool have_upstream_irq;
+	u32 upstream_irq[2];
 
 	np = pdev->dev.of_node->parent;
 	if (!of_device_is_compatible(np, "aspeed,ast2400-lpc-v2") &&
@@ -374,6 +533,7 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "unsupported LPC device binding\n");
 		return -ENODEV;
 	}
+
 	ops = of_device_get_match_data(&pdev->dev);
 	if (!ops)
 		return -EINVAL;
@@ -386,6 +546,13 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 	if (addr < 0)
 		return addr;
 
+	np = pdev->dev.of_node;
+	rc = of_property_read_u32_array(np, "aspeed,lpc-interrupts", upstream_irq, 2);
+	if ((rc && rc != -EINVAL))
+		return -EINVAL;
+
+	have_upstream_irq = !rc;
+
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
@@ -408,10 +575,20 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 
 	aspeed_kcs_set_address(kcs_bmc, addr);
 
-	rc = aspeed_kcs_config_irq(kcs_bmc, pdev);
+	/* Host to BMC IRQ */
+	rc = aspeed_kcs_config_downstream_irq(kcs_bmc, pdev);
 	if (rc)
 		return rc;
 
+	/* BMC to Host IRQ */
+	if (have_upstream_irq) {
+		rc = aspeed_kcs_config_upstream_irq(priv, upstream_irq[0], upstream_irq[1]);
+		if (rc < 0)
+			return rc;
+	} else {
+		priv->upstream_irq.mode = aspeed_kcs_irq_none;
+	}
+
 	platform_set_drvdata(pdev, priv);
 
 	aspeed_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE), 0);
@@ -475,4 +652,5 @@ module_platform_driver(ast_kcs_bmc_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
+MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
 MODULE_DESCRIPTION("Aspeed device interface to the KCS BMC device");
-- 
2.27.0

