Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE5739EAE8
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 02:42:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzWfT3tM1z305n
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 10:42:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=XXYQ0vSW;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=cPT8aJ1S;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=XXYQ0vSW; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=cPT8aJ1S; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzWf82fGhz2xvH;
 Tue,  8 Jun 2021 10:42:08 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id A4532580521;
 Mon,  7 Jun 2021 20:42:05 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Mon, 07 Jun 2021 20:42:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=2Dz5T6DYy+fXN4aKeq2FKpMfs4yt9Xw
 PZiHKWRrEE4U=; b=XXYQ0vSWUlxeC3BHESxT2pAlOB0ljlZQWPP4lHXsUxOmuCj
 DCa+8ewD5oDWY221BH10V6wRCQrWId/D6bwy69d720h0ne7bLdQoNnE1/vM/PA10
 YvZeNbnAkz32ILq9MfhGoaNAekd2u3Pcd7ScMMEojB2TwTNa/OCorcO+N8FhgaAM
 Ruswz67iv0rFY7kMEq9qq82BAoTEMhmzo2YNt8mIryG8FlkTwz93jZI2UIqaSO9O
 VfvuXfjWRK/uTdb/leMhs4auC1T7Tmb2c7pojFCQX0p+Nl5UvTeFH4jsjp2lK+ra
 Of9kjsJpAO79diPOWZkgy1BqG2YUAGEj1nH4yRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=2Dz5T6
 DYy+fXN4aKeq2FKpMfs4yt9XwPZiHKWRrEE4U=; b=cPT8aJ1SZs0xbE5uM9ol7Y
 QSisSRaPx3ENK0bVSQOAHi5PZQisPyDZJpewXmXgO+3fcatiWrvk5OhPfX5FJV5c
 5APHksuOkS1afFKnZUEeg2ZjD+hdQJ/tClqIuX4EuqjPfXFR+fdh3Y3aoWzdh3jd
 WpdR9jDzM5EGObI5rS8Izl/5CfCBlcDMl8xY+DYHWpwJPkOO+Ii2rGT/Vz5Ay2n7
 zw8iL0dbNVbUKOBJWguhWmwGLXkBEmZY4xZ8GL6PhJE1LRyy950mkEPGYgv3hPJx
 crQFSYusos45UXbIbMWuxTXZLipRv36dIhW9EYG/IpVEbho8N4bqWr8pTq1y42JQ
 ==
X-ME-Sender: <xms:2ry-YG7IM9sTYEgWWfALNuL4fgaV2r7d08Bby6GzlZqHMXubdcr6rg>
 <xme:2ry-YP5GfUxB4GOpXK027O6oqHuvND--LIX2YOa9_ygVcaQJLWc8UVkqyQyrF13Ba
 MAUUNPUmTm_bQK_yw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtkedgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:2ry-YFfGp8zxCNjGS8vUdkxFBARMsfujJKA6adS_VeI8mXj8dIzrBg>
 <xmx:2ry-YDIJuW68DzY4XqqIEI3JxnQlJ0K7DKMLSRWaKr0y6xk1yuaElg>
 <xmx:2ry-YKKaZ3XYbMiuC3Ox6ScVZZc7B4LfY5Ks8s05tdyRTsGyGGXpfg>
 <xmx:3by-YFaiexj72tssGHVuS-R02iaG1wrm9y4doX44vCxUYX2jD29vMQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 87753AC0062; Mon,  7 Jun 2021 20:42:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-519-g27a961944e-fm-20210531.001-g27a96194
Mime-Version: 1.0
Message-Id: <df0d31e9-c4e1-4cf0-b800-c5dadfb43420@www.fastmail.com>
In-Reply-To: <YKdfeJJM/4LYFKe4@packtop>
References: <20210510054213.1610760-1-andrew@aj.id.au>
 <20210510054213.1610760-15-andrew@aj.id.au> <YKdfeJJM/4LYFKe4@packtop>
Date: Tue, 08 Jun 2021 10:11:42 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Zev Weiss" <zweiss@equinix.com>
Subject: =?UTF-8?Q?Re:_[PATCH_v3_14/16]_ipmi:_kcs=5Fbmc=5Faspeed:_Implement_KCS_S?=
 =?UTF-8?Q?erIRQ_configuration?=
Content-Type: text/plain
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Corey Minyard <minyard@acm.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Benjamin Fair <benjaminfair@google.com>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 21 May 2021, at 16:51, Zev Weiss wrote:
> On Mon, May 10, 2021 at 12:42:11AM CDT, Andrew Jeffery wrote:
> >Apply the SerIRQ ID and level/sense behaviours from the devicetree if
> >provided.
> >
> >Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >---
> > drivers/char/ipmi/kcs_bmc_aspeed.c | 182 ++++++++++++++++++++++++++++-
> > 1 file changed, 180 insertions(+), 2 deletions(-)
> >
> >diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
> >index 8a0b1e18e945..9b81806b4dcb 100644
> >--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
> >+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
> >@@ -9,6 +9,7 @@
> > #include <linux/errno.h>
> > #include <linux/interrupt.h>
> > #include <linux/io.h>
> >+#include <linux/irq.h>
> > #include <linux/mfd/syscon.h>
> > #include <linux/module.h>
> > #include <linux/of.h>
> >@@ -28,6 +29,22 @@
> >
> > #define KCS_CHANNEL_MAX     4
> >
> >+/*
> >+ * Field class descriptions
> >+ *
> >+ * LPCyE	Enable LPC channel y
> >+ * IBFIEy	Input Buffer Full IRQ Enable for LPC channel y
> >+ * IRQxEy	Assert SerIRQ x for LPC channel y (Deprecated, use IDyIRQX, IRQXEy)
> >+ * IDyIRQX	Use the specified 4-bit SerIRQ for LPC channel y
> >+ * SELyIRQX	SerIRQ polarity for LPC channel y (low: 0, high: 1)
> >+ * IRQXEy	Assert the SerIRQ specified in IDyIRQX for LPC channel y
> >+ */
> >+
> >+#define LPC_TYIRQX_LOW       0b00
> >+#define LPC_TYIRQX_HIGH      0b01
> >+#define LPC_TYIRQX_RSVD      0b10
> >+#define LPC_TYIRQX_RISING    0b11
> >+
> > #define LPC_HICR0            0x000
> > #define     LPC_HICR0_LPC3E          BIT(7)
> > #define     LPC_HICR0_LPC2E          BIT(6)
> >@@ -39,6 +56,19 @@
> > #define LPC_HICR4            0x010
> > #define     LPC_HICR4_LADR12AS       BIT(7)
> > #define     LPC_HICR4_KCSENBL        BIT(2)
> >+#define LPC_SIRQCR0	     0x070
> >+/* IRQ{12,1}E1 are deprecated as of AST2600 A3 but necessary for prior chips */
> >+#define     LPC_SIRQCR0_IRQ12E1	     BIT(1)
> >+#define     LPC_SIRQCR0_IRQ1E1	     BIT(0)
> >+#define LPC_HICR5	     0x080
> >+#define     LPC_HICR5_ID3IRQX_MASK   GENMASK(23, 20)
> >+#define     LPC_HICR5_ID3IRQX_SHIFT  20
> >+#define     LPC_HICR5_ID2IRQX_MASK   GENMASK(19, 16)
> >+#define     LPC_HICR5_ID2IRQX_SHIFT  16
> >+#define     LPC_HICR5_SEL3IRQX       BIT(15)
> >+#define     LPC_HICR5_IRQXE3         BIT(14)
> >+#define     LPC_HICR5_SEL2IRQX       BIT(13)
> >+#define     LPC_HICR5_IRQXE2         BIT(12)
> > #define LPC_LADR3H           0x014
> > #define LPC_LADR3L           0x018
> > #define LPC_LADR12H          0x01C
> >@@ -55,6 +85,13 @@
> > #define LPC_HICRB            0x100
> > #define     LPC_HICRB_IBFIF4         BIT(1)
> > #define     LPC_HICRB_LPC4E          BIT(0)
> >+#define LPC_HICRC            0x104
> >+#define     LPC_HICRC_ID4IRQX_MASK   GENMASK(7, 4)
> >+#define     LPC_HICRC_ID4IRQX_SHIFT  4
> >+#define     LPC_HICRC_TY4IRQX_MASK   GENMASK(3, 2)
> >+#define     LPC_HICRC_TY4IRQX_SHIFT  2
> >+#define     LPC_HICRC_OBF4_AUTO_CLR  BIT(1)
> >+#define     LPC_HICRC_IRQXE4         BIT(0)
> > #define LPC_LADR4            0x110
> > #define LPC_IDR4             0x114
> > #define LPC_ODR4             0x118
> >@@ -62,11 +99,21 @@
> >
> > #define OBE_POLL_PERIOD	     (HZ / 2)
> >
> >+enum aspeed_kcs_irq_mode {
> >+	aspeed_kcs_irq_none,
> >+	aspeed_kcs_irq_serirq,
> >+};
> >+
> > struct aspeed_kcs_bmc {
> > 	struct kcs_bmc_device kcs_bmc;
> >
> > 	struct regmap *map;
> >
> >+	struct {
> >+		enum aspeed_kcs_irq_mode mode;
> >+		int id;
> >+	} upstream_irq;
> >+
> > 	struct {
> > 		spinlock_t lock;
> > 		bool remove;
> >@@ -103,6 +150,49 @@ static void aspeed_kcs_outb(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 data)
> >
> > 	rc = regmap_write(priv->map, reg, data);
> > 	WARN(rc != 0, "regmap_write() failed: %d\n", rc);
> >+
> >+	/* Trigger the upstream IRQ on ODR writes, if enabled */
> >+
> >+	switch (reg) {
> >+	case LPC_ODR1:
> >+	case LPC_ODR2:
> >+	case LPC_ODR3:
> >+	case LPC_ODR4:
> >+		break;
> >+	default:
> >+		return;
> >+	}
> >+
> >+	if (priv->upstream_irq.mode != aspeed_kcs_irq_serirq)
> >+		return;
> >+
> >+	switch (kcs_bmc->channel) {
> >+	case 1:
> >+		switch (priv->upstream_irq.id) {
> >+		case 12:
> >+			regmap_update_bits(priv->map, LPC_SIRQCR0, LPC_SIRQCR0_IRQ12E1,
> >+					   LPC_SIRQCR0_IRQ12E1);
> >+			break;
> >+		case 1:
> >+			regmap_update_bits(priv->map, LPC_SIRQCR0, LPC_SIRQCR0_IRQ1E1,
> >+					   LPC_SIRQCR0_IRQ1E1);
> >+			break;
> >+		default:
> >+			break;
> >+		}
> >+		break;
> >+	case 2:
> >+		regmap_update_bits(priv->map, LPC_HICR5, LPC_HICR5_IRQXE2, LPC_HICR5_IRQXE2);
> >+		break;
> >+	case 3:
> >+		regmap_update_bits(priv->map, LPC_HICR5, LPC_HICR5_IRQXE3, LPC_HICR5_IRQXE3);
> >+		break;
> >+	case 4:
> >+		regmap_update_bits(priv->map, LPC_HICRC, LPC_HICRC_IRQXE4, LPC_HICRC_IRQXE4);
> >+		break;
> >+	default:
> >+		break;
> >+	}
> > }
> >
> > static void aspeed_kcs_updateb(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 mask, u8 val)
> >@@ -161,6 +251,73 @@ static void aspeed_kcs_set_address(struct kcs_bmc_device *kcs_bmc, u16 addr)
> > 	}
> > }
> >
> >+static inline int aspeed_kcs_map_serirq_type(u32 dt_type)
> >+{
> >+	switch (dt_type) {
> >+	case IRQ_TYPE_EDGE_RISING:
> >+		return LPC_TYIRQX_RISING;
> >+	case IRQ_TYPE_LEVEL_HIGH:
> >+		return LPC_TYIRQX_HIGH;
> >+	case IRQ_TYPE_LEVEL_LOW:
> >+		return LPC_TYIRQX_LOW;
> >+	default:
> >+		return -EINVAL;
> >+	}
> >+}
> >+
> >+static int aspeed_kcs_config_upstream_irq(struct aspeed_kcs_bmc *priv, u32 id, u32 dt_type)
> >+{
> >+	unsigned int mask, val, hw_type;
> >+
> >+	if (id > 15)
> >+		return -EINVAL;
> >+
> >+	hw_type = aspeed_kcs_map_serirq_type(dt_type);
> >+	if (hw_type < 0)
> >+		return hw_type;
> >+
> >+	priv->upstream_irq.mode = aspeed_kcs_irq_serirq;
> >+	priv->upstream_irq.id = id;
> >+
> >+	switch (priv->kcs_bmc.channel) {
> >+	case 1:
> >+		/* Needs IRQxE1 rather than (ID1IRQX, SEL1IRQX, IRQXE1) before AST2600 A3 */
> 
> I'm struggling a bit with understanding this comment, and relating it to
> the code -- it sounds like "we need to do things one way on A3 and
> later, and another way on pre-A3", but then...we just break without
> doing anything at all either way.  Can you clarify any further?

Hah! You're struggling because it doesn't make any sense, the code's gone missing :/ I'll fix that up.

Unfortunately due to hardware/firmware limitations I wasn't able to test channel 1.

> 
> >+		break;
> >+	case 2:
> >+		if (!(hw_type == LPC_TYIRQX_LOW || hw_type == LPC_TYIRQX_HIGH))
> >+			return -EINVAL;
> >+
> >+		mask = LPC_HICR5_SEL2IRQX | LPC_HICR5_ID2IRQX_MASK;
> >+		val = (id << LPC_HICR5_ID2IRQX_SHIFT);
> >+		val |= (hw_type == LPC_TYIRQX_HIGH) ? LPC_HICR5_SEL2IRQX : 0;
> >+		regmap_update_bits(priv->map, LPC_HICR5, mask, val);
> >+
> >+		break;
> >+	case 3:
> >+		if (!(hw_type == LPC_TYIRQX_LOW || hw_type == LPC_TYIRQX_HIGH))
> >+			return -EINVAL;
> >+
> >+		mask = LPC_HICR5_SEL3IRQX | LPC_HICR5_ID3IRQX_MASK;
> >+		val = (id << LPC_HICR5_ID3IRQX_SHIFT);
> >+		val |= (hw_type == LPC_TYIRQX_HIGH) ? LPC_HICR5_SEL3IRQX : 0;
> >+		regmap_update_bits(priv->map, LPC_HICR5, mask, val);
> >+
> >+		break;
> >+	case 4:
> >+		mask = LPC_HICRC_ID4IRQX_MASK | LPC_HICRC_TY4IRQX_MASK | LPC_HICRC_OBF4_AUTO_CLR;
> >+		val = (id << LPC_HICRC_ID4IRQX_SHIFT) | (hw_type << LPC_HICRC_TY4IRQX_SHIFT);
> >+		regmap_update_bits(priv->map, LPC_HICRC, mask, val);
> >+		break;
> >+	default:
> >+		dev_warn(priv->kcs_bmc.dev,
> >+			 "SerIRQ configuration not supported on KCS channel %d\n",
> >+			 priv->kcs_bmc.channel);
> >+		return -EINVAL;
> >+	}
> >+
> >+	return 0;
> >+}
> >+
> > static void aspeed_kcs_enable_channel(struct kcs_bmc_device *kcs_bmc, bool enable)
> > {
> > 	struct aspeed_kcs_bmc *priv = to_aspeed_kcs_bmc(kcs_bmc);
> >@@ -262,7 +419,7 @@ static irqreturn_t aspeed_kcs_irq(int irq, void *arg)
> > 	return kcs_bmc_handle_event(kcs_bmc);
> > }
> >
> >-static int aspeed_kcs_config_irq(struct kcs_bmc_device *kcs_bmc,
> >+static int aspeed_kcs_config_downstream_irq(struct kcs_bmc_device *kcs_bmc,
> > 			struct platform_device *pdev)
> > {
> > 	struct device *dev = &pdev->dev;
> >@@ -366,6 +523,8 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
> > 	struct aspeed_kcs_bmc *priv;
> > 	struct device_node *np;
> > 	int rc, channel, addr;
> >+	bool have_upstream_irq;
> >+	u32 upstream_irq[2];
> >
> > 	np = pdev->dev.of_node->parent;
> > 	if (!of_device_is_compatible(np, "aspeed,ast2400-lpc-v2") &&
> >@@ -374,6 +533,7 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
> > 		dev_err(&pdev->dev, "unsupported LPC device binding\n");
> > 		return -ENODEV;
> > 	}
> >+
> > 	ops = of_device_get_match_data(&pdev->dev);
> > 	if (!ops)
> > 		return -EINVAL;
> >@@ -386,6 +546,13 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
> > 	if (addr < 0)
> > 		return addr;
> >
> >+	np = pdev->dev.of_node;
> >+	rc = of_property_read_u32_array(np, "aspeed,lpc-interrupts", upstream_irq, 2);
> >+	if ((rc && rc != -EINVAL))
> 
> I think we could probably get by with slightly fewer parens here...

Yeah, not sure what happened there :)

Andrew
