Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7224B377C9B
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 08:55:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdsJZ31r5z3bsW
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 16:55:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=BAMGxF6o;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=GEiFpOwd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=BAMGxF6o; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=GEiFpOwd; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdsC163Pnz2yjL
 for <openbmc@lists.ozlabs.org>; Mon, 10 May 2021 16:50:53 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id ED1BF1683;
 Mon, 10 May 2021 02:50:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 10 May 2021 02:50:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=2p+OdmD+CEIRF
 cxKvg3kFDRJRbjMiCYTvM+hHq+7Nv0=; b=BAMGxF6oUjG356k0iSCEMxgUGrvXK
 7fo/URizAcMIrT2wI7pQYw2oyKLeVhzShIjuVqOXi+/woeD60Tll19slD61KxNWd
 bGzHL7ZlQYJ6uWpXe0xiM+DIxrBjdUfWNDwTGUzf+fkSnzE05sVljRDgyXww8Esh
 6bwvoZx8QubGiRVG2+LHgaD9iMmCjomc1gF+AQkl0u7cAHAlRKgWpxaHTEKFFQsb
 2U+tVOz42x84z3aZUq8YhKhX/+zCcH7iVATLS2YhwCwli3ApciBAWxGus4mTrZ7l
 8zYtXikaVABamTanoce4kWXC32KxpTI8JB6Xgkk6HlNNLx/qNSZXTUqsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=2p+OdmD+CEIRFcxKvg3kFDRJRbjMiCYTvM+hHq+7Nv0=; b=GEiFpOwd
 C1YRtUqh05qdJMbK0nXaevONogBlnIiei07JF6a+jmYHcMtNgmtJO5lB42Ox940L
 Au0ZNLlaaCkGhyM9JfmJ3VTV+CV0aGKfM/JBgt83t9O/wq4t69wBrlLZYDbce8Hi
 2S6tzwkOwt+sBrZOqKckFMnkHRDpicMGJ0oHwlVRNmOdHHH5wrjf1vq/V9E7Hj85
 W71zduDKvTtQmI1nFlTG/LNr+T//20fZ9+oOp6O34PeNabhchGZgWU/I3CfKE2hl
 RQUYTbzuFaFBrLFuvFWm+FypeSglvgQAOPY7MxOXfhSsOJ9eN1xiQTe65UkwUK1n
 OnBdMk5sDdibAQ==
X-ME-Sender: <xms:y9eYYAZO8QOu3mkBUCwViHmGJ7n6tW2tRhv0xX1qMi1gUzhnxi_Q3g>
 <xme:y9eYYLa4VeNUQnVLTCsuKO7Hp1yLPWx6xq8q2WfQxEy3p2DerYYvUB8PXZj7g35si
 b0jQaDDGWVKCw5gog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegjedguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfies
 rghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgle
 etteejffelffdvudduveeiffegteelvefhteenucfkphepvddtfedrheejrddvudehrdek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnug
 hrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:y9eYYK-Bm-KBsYQb9I1g_uv7QZTymbhLU1KQD2uUwyRuceiNXaF1qw>
 <xmx:y9eYYKrd8MYX3zdqylgQKNFZpaAuGi02aULln18mKqq0iJ78-eEHPA>
 <xmx:y9eYYLrhsBy8Tl12gHIQ2lUD1HgsDpW_oVIU4wpZRyhIqE9l-4ehtQ>
 <xmx:y9eYYFEM2Ldphf0sTErhBw2s5HhGa52tUQFuCO3xiTZ8eO-Q0fJgPg>
Received: from localhost.localdomain (203-57-215-8.dyn.iinet.net.au
 [203.57.215.8]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 10 May 2021 02:50:49 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.10 v3 09/18] ipmi: kcs_bmc: Allow clients to
 control KCS IRQ state
Date: Mon, 10 May 2021 16:19:46 +0930
Message-Id: <20210510064955.1704652-10-andrew@aj.id.au>
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

Add a mechanism for controlling whether the client associated with a
KCS device will receive Input Buffer Full (IBF) and Output Buffer Empty
(OBE) events. This enables an abstract implementation of poll() for KCS
devices.

A wart in the implementation is that the ASPEED KCS devices don't
support an OBE interrupt for the BMC. Instead we pretend it has one by
polling the status register waiting for the Output Buffer Full (OBF) bit
to clear, and generating an event when OBE is observed.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/char/ipmi/kcs_bmc.c         |   6 ++
 drivers/char/ipmi/kcs_bmc.h         |   3 +
 drivers/char/ipmi/kcs_bmc_aspeed.c  | 150 ++++++++++++++++++----------
 drivers/char/ipmi/kcs_bmc_client.h  |   2 +
 drivers/char/ipmi/kcs_bmc_device.h  |   1 +
 drivers/char/ipmi/kcs_bmc_npcm7xx.c |  25 ++++-
 6 files changed, 130 insertions(+), 57 deletions(-)

diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
index 2ec8312ce766..7081541bb6ce 100644
--- a/drivers/char/ipmi/kcs_bmc.c
+++ b/drivers/char/ipmi/kcs_bmc.c
@@ -176,6 +176,12 @@ void kcs_bmc_unregister_driver(struct kcs_bmc_driver *drv)
 }
 EXPORT_SYMBOL(kcs_bmc_unregister_driver);
 
+void kcs_bmc_update_event_mask(struct kcs_bmc_device *kcs_bmc, u8 mask, u8 events)
+{
+	kcs_bmc->ops->irq_mask_update(kcs_bmc, mask, events);
+}
+EXPORT_SYMBOL(kcs_bmc_update_event_mask);
+
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
 MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
diff --git a/drivers/char/ipmi/kcs_bmc.h b/drivers/char/ipmi/kcs_bmc.h
index 3f0cce315b4f..fa408b802c79 100644
--- a/drivers/char/ipmi/kcs_bmc.h
+++ b/drivers/char/ipmi/kcs_bmc.h
@@ -8,6 +8,9 @@
 
 #include <linux/list.h>
 
+#define KCS_BMC_EVENT_TYPE_OBE	BIT(0)
+#define KCS_BMC_EVENT_TYPE_IBF	BIT(1)
+
 #define KCS_BMC_STR_OBF		BIT(0)
 #define KCS_BMC_STR_IBF		BIT(1)
 #define KCS_BMC_STR_CMD_DAT	BIT(3)
diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index 009cb434becb..fade0e2faf2c 100644
--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
@@ -60,10 +60,18 @@
 #define LPC_ODR4             0x118
 #define LPC_STR4             0x11C
 
+#define OBE_POLL_PERIOD	     (HZ / 2)
+
 struct aspeed_kcs_bmc {
 	struct kcs_bmc_device kcs_bmc;
 
 	struct regmap *map;
+
+	struct {
+		spinlock_t lock;
+		bool remove;
+		struct timer_list timer;
+	} obe;
 };
 
 struct aspeed_kcs_of_ops {
@@ -159,68 +167,89 @@ static void aspeed_kcs_enable_channel(struct kcs_bmc_device *kcs_bmc, bool enabl
 
 	switch (kcs_bmc->channel) {
 	case 1:
-		if (enable) {
-			regmap_update_bits(priv->map, LPC_HICR2,
-					LPC_HICR2_IBFIF1, LPC_HICR2_IBFIF1);
-			regmap_update_bits(priv->map, LPC_HICR0,
-					LPC_HICR0_LPC1E, LPC_HICR0_LPC1E);
-		} else {
-			regmap_update_bits(priv->map, LPC_HICR0,
-					LPC_HICR0_LPC1E, 0);
-			regmap_update_bits(priv->map, LPC_HICR2,
-					LPC_HICR2_IBFIF1, 0);
-		}
-		break;
-
+		regmap_update_bits(priv->map, LPC_HICR0, LPC_HICR0_LPC1E, enable * LPC_HICR0_LPC1E);
+		return;
 	case 2:
-		if (enable) {
-			regmap_update_bits(priv->map, LPC_HICR2,
-					LPC_HICR2_IBFIF2, LPC_HICR2_IBFIF2);
-			regmap_update_bits(priv->map, LPC_HICR0,
-					LPC_HICR0_LPC2E, LPC_HICR0_LPC2E);
-		} else {
-			regmap_update_bits(priv->map, LPC_HICR0,
-					LPC_HICR0_LPC2E, 0);
-			regmap_update_bits(priv->map, LPC_HICR2,
-					LPC_HICR2_IBFIF2, 0);
-		}
-		break;
-
+		regmap_update_bits(priv->map, LPC_HICR0, LPC_HICR0_LPC2E, enable * LPC_HICR0_LPC2E);
+		return;
 	case 3:
-		if (enable) {
-			regmap_update_bits(priv->map, LPC_HICR2,
-					LPC_HICR2_IBFIF3, LPC_HICR2_IBFIF3);
-			regmap_update_bits(priv->map, LPC_HICR0,
-					LPC_HICR0_LPC3E, LPC_HICR0_LPC3E);
-			regmap_update_bits(priv->map, LPC_HICR4,
-					LPC_HICR4_KCSENBL, LPC_HICR4_KCSENBL);
-		} else {
-			regmap_update_bits(priv->map, LPC_HICR0,
-					LPC_HICR0_LPC3E, 0);
-			regmap_update_bits(priv->map, LPC_HICR4,
-					LPC_HICR4_KCSENBL, 0);
-			regmap_update_bits(priv->map, LPC_HICR2,
-					LPC_HICR2_IBFIF3, 0);
-		}
-		break;
-
+		regmap_update_bits(priv->map, LPC_HICR0, LPC_HICR0_LPC3E, enable * LPC_HICR0_LPC3E);
+		regmap_update_bits(priv->map, LPC_HICR4,
+				   LPC_HICR4_KCSENBL, enable * LPC_HICR4_KCSENBL);
+		return;
 	case 4:
-		if (enable)
-			regmap_update_bits(priv->map, LPC_HICRB,
-					LPC_HICRB_IBFIF4 | LPC_HICRB_LPC4E,
-					LPC_HICRB_IBFIF4 | LPC_HICRB_LPC4E);
+		regmap_update_bits(priv->map, LPC_HICRB, LPC_HICRB_LPC4E, enable * LPC_HICRB_LPC4E);
+		return;
+	default:
+		pr_warn("%s: Unsupported channel: %d", __func__, kcs_bmc->channel);
+		return;
+	}
+}
+
+static void aspeed_kcs_check_obe(struct timer_list *timer)
+{
+	struct aspeed_kcs_bmc *priv = container_of(timer, struct aspeed_kcs_bmc, obe.timer);
+	unsigned long flags;
+	u8 str;
+
+	spin_lock_irqsave(&priv->obe.lock, flags);
+	if (priv->obe.remove) {
+		spin_unlock_irqrestore(&priv->obe.lock, flags);
+		return;
+	}
+
+	str = aspeed_kcs_inb(&priv->kcs_bmc, priv->kcs_bmc.ioreg.str);
+	if (str & KCS_BMC_STR_OBF) {
+		mod_timer(timer, jiffies + OBE_POLL_PERIOD);
+		spin_unlock_irqrestore(&priv->obe.lock, flags);
+		return;
+	}
+	spin_unlock_irqrestore(&priv->obe.lock, flags);
+
+	kcs_bmc_handle_event(&priv->kcs_bmc);
+}
+
+static void aspeed_kcs_irq_mask_update(struct kcs_bmc_device *kcs_bmc, u8 mask, u8 state)
+{
+	struct aspeed_kcs_bmc *priv = to_aspeed_kcs_bmc(kcs_bmc);
+
+	/* We don't have an OBE IRQ, emulate it */
+	if (mask & KCS_BMC_EVENT_TYPE_OBE) {
+		if (KCS_BMC_EVENT_TYPE_OBE & state)
+			mod_timer(&priv->obe.timer, jiffies + OBE_POLL_PERIOD);
 		else
-			regmap_update_bits(priv->map, LPC_HICRB,
-					LPC_HICRB_IBFIF4 | LPC_HICRB_LPC4E,
-					0);
-		break;
+			del_timer(&priv->obe.timer);
+	}
 
-	default:
-		break;
+	if (mask & KCS_BMC_EVENT_TYPE_IBF) {
+		const bool enable = !!(state & KCS_BMC_EVENT_TYPE_IBF);
+
+		switch (kcs_bmc->channel) {
+		case 1:
+			regmap_update_bits(priv->map, LPC_HICR2, LPC_HICR2_IBFIF1,
+					   enable * LPC_HICR2_IBFIF1);
+			return;
+		case 2:
+			regmap_update_bits(priv->map, LPC_HICR2, LPC_HICR2_IBFIF2,
+					   enable * LPC_HICR2_IBFIF2);
+			return;
+		case 3:
+			regmap_update_bits(priv->map, LPC_HICR2, LPC_HICR2_IBFIF3,
+					   enable * LPC_HICR2_IBFIF3);
+			return;
+		case 4:
+			regmap_update_bits(priv->map, LPC_HICRB, LPC_HICRB_IBFIF4,
+					   enable * LPC_HICRB_IBFIF4);
+			return;
+		default:
+			pr_warn("%s: Unsupported channel: %d", __func__, kcs_bmc->channel);
+			return;
+		}
 	}
 }
 
 static const struct kcs_bmc_device_ops aspeed_kcs_ops = {
+	.irq_mask_update = aspeed_kcs_irq_mask_update,
 	.io_inputb = aspeed_kcs_inb,
 	.io_outputb = aspeed_kcs_outb,
 	.io_updateb = aspeed_kcs_updateb,
@@ -373,6 +402,10 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	spin_lock_init(&priv->obe.lock);
+	priv->obe.remove = false;
+	timer_setup(&priv->obe.timer, aspeed_kcs_check_obe, 0);
+
 	aspeed_kcs_set_address(kcs_bmc, addr);
 
 	rc = aspeed_kcs_config_irq(kcs_bmc, pdev);
@@ -381,6 +414,8 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
+	aspeed_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE),
+				   KCS_BMC_EVENT_TYPE_IBF);
 	aspeed_kcs_enable_channel(kcs_bmc, true);
 
 	kcs_bmc_add_device(&priv->kcs_bmc);
@@ -397,6 +432,15 @@ static int aspeed_kcs_remove(struct platform_device *pdev)
 
 	kcs_bmc_remove_device(kcs_bmc);
 
+	aspeed_kcs_enable_channel(kcs_bmc, false);
+	aspeed_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE), 0);
+
+	/* Make sure it's proper dead */
+	spin_lock_irq(&priv->obe.lock);
+	priv->obe.remove = true;
+	spin_unlock_irq(&priv->obe.lock);
+	del_timer_sync(&priv->obe.timer);
+
 	return 0;
 }
 
diff --git a/drivers/char/ipmi/kcs_bmc_client.h b/drivers/char/ipmi/kcs_bmc_client.h
index cb38b56cda85..d14e8e0fa230 100644
--- a/drivers/char/ipmi/kcs_bmc_client.h
+++ b/drivers/char/ipmi/kcs_bmc_client.h
@@ -38,6 +38,8 @@ void kcs_bmc_unregister_driver(struct kcs_bmc_driver *drv);
 int kcs_bmc_enable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_client *client);
 void kcs_bmc_disable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_client *client);
 
+void kcs_bmc_update_event_mask(struct kcs_bmc_device *kcs_bmc, u8 mask, u8 events);
+
 u8 kcs_bmc_read_data(struct kcs_bmc_device *kcs_bmc);
 void kcs_bmc_write_data(struct kcs_bmc_device *kcs_bmc, u8 data);
 u8 kcs_bmc_read_status(struct kcs_bmc_device *kcs_bmc);
diff --git a/drivers/char/ipmi/kcs_bmc_device.h b/drivers/char/ipmi/kcs_bmc_device.h
index dd90f8c2ebd6..a1410eb16308 100644
--- a/drivers/char/ipmi/kcs_bmc_device.h
+++ b/drivers/char/ipmi/kcs_bmc_device.h
@@ -9,6 +9,7 @@
 #include "kcs_bmc.h"
 
 struct kcs_bmc_device_ops {
+	void (*irq_mask_update)(struct kcs_bmc_device *kcs_bmc, u8 mask, u8 enable);
 	u8 (*io_inputb)(struct kcs_bmc_device *kcs_bmc, u32 reg);
 	void (*io_outputb)(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 b);
 	void (*io_updateb)(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 mask, u8 b);
diff --git a/drivers/char/ipmi/kcs_bmc_npcm7xx.c b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
index 9f0b168e487c..f8b7162fb830 100644
--- a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
+++ b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
@@ -38,6 +38,7 @@
 #define KCS2CTL		0x2A
 #define KCS3CTL		0x3C
 #define    KCS_CTL_IBFIE	BIT(0)
+#define    KCS_CTL_OBEIE	BIT(0)
 
 #define KCS1IE		0x1C
 #define KCS2IE		0x2E
@@ -117,13 +118,23 @@ static void npcm7xx_kcs_enable_channel(struct kcs_bmc_device *kcs_bmc, bool enab
 {
 	struct npcm7xx_kcs_bmc *priv = to_npcm7xx_kcs_bmc(kcs_bmc);
 
-	regmap_update_bits(priv->map, priv->reg->ctl, KCS_CTL_IBFIE,
-			   enable ? KCS_CTL_IBFIE : 0);
-
 	regmap_update_bits(priv->map, priv->reg->ie, KCS_IE_IRQE | KCS_IE_HIRQE,
 			   enable ? KCS_IE_IRQE | KCS_IE_HIRQE : 0);
 }
 
+static void npcm7xx_kcs_irq_mask_update(struct kcs_bmc_device *kcs_bmc, u8 mask, u8 state)
+{
+	struct npcm7xx_kcs_bmc *priv = to_npcm7xx_kcs_bmc(kcs_bmc);
+
+	if (KCS_BMC_EVENT_TYPE_OBE & mask)
+		regmap_update_bits(priv->map, priv->reg->ctl, KCS_CTL_OBEIE,
+				   !!(KCS_BMC_EVENT_TYPE_OBE & state) * KCS_CTL_OBEIE);
+
+	if (KCS_BMC_EVENT_TYPE_IBF & mask)
+		regmap_update_bits(priv->map, priv->reg->ctl, KCS_CTL_IBFIE,
+				   !!(state & KCS_BMC_EVENT_TYPE_IBF) * KCS_CTL_IBFIE);
+}
+
 static irqreturn_t npcm7xx_kcs_irq(int irq, void *arg)
 {
 	struct kcs_bmc_device *kcs_bmc = arg;
@@ -146,6 +157,7 @@ static int npcm7xx_kcs_config_irq(struct kcs_bmc_device *kcs_bmc,
 }
 
 static const struct kcs_bmc_device_ops npcm7xx_kcs_ops = {
+	.irq_mask_update = npcm7xx_kcs_irq_mask_update,
 	.io_inputb = npcm7xx_kcs_inb,
 	.io_outputb = npcm7xx_kcs_outb,
 	.io_updateb = npcm7xx_kcs_updateb,
@@ -186,11 +198,13 @@ static int npcm7xx_kcs_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
-	npcm7xx_kcs_enable_channel(kcs_bmc, true);
 	rc = npcm7xx_kcs_config_irq(kcs_bmc, pdev);
 	if (rc)
 		return rc;
 
+	npcm7xx_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE),
+				    KCS_BMC_EVENT_TYPE_IBF);
+	npcm7xx_kcs_enable_channel(kcs_bmc, true);
 
 	pr_info("channel=%u idr=0x%x odr=0x%x str=0x%x\n",
 		chan,
@@ -208,6 +222,9 @@ static int npcm7xx_kcs_remove(struct platform_device *pdev)
 
 	kcs_bmc_remove_device(kcs_bmc);
 
+	npcm7xx_kcs_enable_channel(kcs_bmc, false);
+	npcm7xx_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE), 0);
+
 	return 0;
 }
 
-- 
2.27.0

