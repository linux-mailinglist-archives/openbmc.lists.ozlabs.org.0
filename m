Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE2E39F44C
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 12:53:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FznCX37YFz3by9
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 20:53:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=YToE0GhA;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=WyR4iwzG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=YToE0GhA; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=WyR4iwzG; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fzn6r5WJ0z3049;
 Tue,  8 Jun 2021 20:49:24 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 42AB858060C;
 Tue,  8 Jun 2021 06:49:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 08 Jun 2021 06:49:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=2HxDV1faTieSg
 imDQh9u0Ko/9qPvvSpyaD8jRuFoY0c=; b=YToE0GhARfyeczXxRPaZlveFpIJvm
 9xOGdlP8mwZZcmHX+bSIoF/Omc+c+C14RjpAOUErNg9gtBKR0Qlx6jAyWRwWZt7z
 Flou/HBwzMZdzdZXmZ0OWLIsFyVQdI1r3DyGzf6exr7bgG1Du4BJyqnWqvepiHRD
 VFhRwDWuMqRN7mV+sDp79jFalDGM0L6Q9n+rfKHnrOQNykEx4GaSJnz/3Tttlu7S
 H0cd5pbxEnw+wzoy9EDGafXQqx3k25ODEqEhS4x8YjtXtWvGIjIpixNSNsNrEN3C
 RN9eYbJyFZ5BeW/cWfZHox4AmIC4fJsc4aTVqFcoDa+Z3cYTxqbv5x/Fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=2HxDV1faTieSgimDQh9u0Ko/9qPvvSpyaD8jRuFoY0c=; b=WyR4iwzG
 q+cabo4AtbxF4h8OIcbHFxQJCvy7Bxsnjdm1FkH0+USz8CH2HbAgYiOhuElB8Wbd
 SjuB+RcOspSf4kcxvXDs2Jrv3FPTK/gsMlTIzKJWkMFGFqYjxeq2l08ahKkz4qAk
 aEBBG3ZXZt8dHDCxouJaUAOqoAkPPXu6x70cNs7TTsHz3mHI4EdlSp/Zm0YWncxQ
 FBrQU2bPB0i+y58yyDIMR/8+bCMunlHTR6xxQofcZcxoZvrh8c6yf5TQ7PjKi6ft
 TJl168Ok7i2pDQk5TnXMEp9e1OKDtJ9ARmAkClj0wHBcYGZaERo7Ng1cN9BLlNBY
 IiHhuyETxiIgqA==
X-ME-Sender: <xms:Mku_YFSXGbMfN62ogtx4CtDb39nnbD3YIvd_I4COlRNrTldJuo2CUg>
 <xme:Mku_YOwCQeHtlVWvlG5ApSqJi6lHzzAtUnJ8QT_Ao3mmvQ3QqriiC34fLFpKmyDgD
 oxse5k5s_TtC7xy0A>
X-ME-Received: <xmr:Mku_YK2ePqJrlYKa7hlf7mZRzVJa1AWJLq96_7CdoHxRCTLBi5_8skrhh0UORoK2beWpvbIJV_2Nh6QyncKFVWv6ey1AXZ7Skv0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtledgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecuvehluhhsthgvrhfuihiivgepfeenucfr
 rghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:Mku_YNBpmOli_Y4Yo8Uz8cgbJyMDFUzT16qBNOtFIDMho2nlf4u9sg>
 <xmx:Mku_YOix-YxzFq1lXcPS0FS6TtL4OJLpCHydDvaUwhhEMO5AEHEYtQ>
 <xmx:Mku_YBrM7Q7lye2d9SneBYPc0axFVGMe10w-fPlXDCKi0MUgRkyJ3A>
 <xmx:Mku_YFQw1I4iYh-ThXftK9dmOXODzfmR0NTksywe0QKJhQoVM7ajmg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Jun 2021 06:49:15 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 minyard@acm.org
Subject: [PATCH v4 09/16] ipmi: kcs_bmc: Allow clients to control KCS IRQ state
Date: Tue,  8 Jun 2021 20:17:50 +0930
Message-Id: <20210608104757.582199-10-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210608104757.582199-1-andrew@aj.id.au>
References: <20210608104757.582199-1-andrew@aj.id.au>
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
 linux-aspeed@lists.ozlabs.org, KWLIU@nuvoton.com, avifishman70@gmail.com,
 venture@google.com, chiawei_wang@aspeedtech.com, linux-kernel@vger.kernel.org,
 tali.perry1@gmail.com, robh+dt@kernel.org, arnd@arndb.de, zweiss@equinix.com,
 linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
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

Cc: CS20 KWLiu <KWLIU@nuvoton.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Zev Weiss <zweiss@equinix.com>
---
 drivers/char/ipmi/kcs_bmc.c         |   6 ++
 drivers/char/ipmi/kcs_bmc.h         |   3 +
 drivers/char/ipmi/kcs_bmc_aspeed.c  | 150 ++++++++++++++++++----------
 drivers/char/ipmi/kcs_bmc_client.h  |   2 +
 drivers/char/ipmi/kcs_bmc_device.h  |   1 +
 drivers/char/ipmi/kcs_bmc_npcm7xx.c |  26 ++++-
 6 files changed, 131 insertions(+), 57 deletions(-)

diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
index 9860c7b75157..91eb43746cef 100644
--- a/drivers/char/ipmi/kcs_bmc.c
+++ b/drivers/char/ipmi/kcs_bmc.c
@@ -182,6 +182,12 @@ void kcs_bmc_unregister_driver(struct kcs_bmc_driver *drv)
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
index 08d4290464d8..5bf8d013e4ae 100644
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
@@ -375,6 +404,10 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	spin_lock_init(&priv->obe.lock);
+	priv->obe.remove = false;
+	timer_setup(&priv->obe.timer, aspeed_kcs_check_obe, 0);
+
 	aspeed_kcs_set_address(kcs_bmc, addr);
 
 	rc = aspeed_kcs_config_irq(kcs_bmc, pdev);
@@ -383,6 +416,8 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
+	aspeed_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE),
+				   KCS_BMC_EVENT_TYPE_IBF);
 	aspeed_kcs_enable_channel(kcs_bmc, true);
 
 	rc = kcs_bmc_add_device(&priv->kcs_bmc);
@@ -403,6 +438,15 @@ static int aspeed_kcs_remove(struct platform_device *pdev)
 
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
index 814ad8e052ef..6fdcde0a7169 100644
--- a/drivers/char/ipmi/kcs_bmc_client.h
+++ b/drivers/char/ipmi/kcs_bmc_client.h
@@ -35,6 +35,8 @@ void kcs_bmc_unregister_driver(struct kcs_bmc_driver *drv);
 int kcs_bmc_enable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_client *client);
 void kcs_bmc_disable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_client *client);
 
+void kcs_bmc_update_event_mask(struct kcs_bmc_device *kcs_bmc, u8 mask, u8 events);
+
 u8 kcs_bmc_read_data(struct kcs_bmc_device *kcs_bmc);
 void kcs_bmc_write_data(struct kcs_bmc_device *kcs_bmc, u8 data);
 u8 kcs_bmc_read_status(struct kcs_bmc_device *kcs_bmc);
diff --git a/drivers/char/ipmi/kcs_bmc_device.h b/drivers/char/ipmi/kcs_bmc_device.h
index c9a4237bbf40..17c572f25c54 100644
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
index 3b96486c25c3..ef81a715f88a 100644
--- a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
+++ b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
@@ -38,6 +38,7 @@
 #define KCS2CTL		0x2A
 #define KCS3CTL		0x3C
 #define    KCS_CTL_IBFIE	BIT(0)
+#define    KCS_CTL_OBEIE	BIT(1)
 
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
+	if (mask & KCS_BMC_EVENT_TYPE_OBE)
+		regmap_update_bits(priv->map, priv->reg->ctl, KCS_CTL_OBEIE,
+				   !!(state & KCS_BMC_EVENT_TYPE_OBE) * KCS_CTL_OBEIE);
+
+	if (mask & KCS_BMC_EVENT_TYPE_IBF)
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
@@ -186,11 +198,14 @@ static int npcm7xx_kcs_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
-	npcm7xx_kcs_enable_channel(kcs_bmc, true);
 	rc = npcm7xx_kcs_config_irq(kcs_bmc, pdev);
 	if (rc)
 		return rc;
 
+	npcm7xx_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE),
+				    KCS_BMC_EVENT_TYPE_IBF);
+	npcm7xx_kcs_enable_channel(kcs_bmc, true);
+
 	rc = kcs_bmc_add_device(kcs_bmc);
 	if (rc) {
 		dev_warn(&pdev->dev, "Failed to register channel %d: %d\n", kcs_bmc->channel, rc);
@@ -211,6 +226,9 @@ static int npcm7xx_kcs_remove(struct platform_device *pdev)
 
 	kcs_bmc_remove_device(kcs_bmc);
 
+	npcm7xx_kcs_enable_channel(kcs_bmc, false);
+	npcm7xx_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE), 0);
+
 	return 0;
 }
 
-- 
2.30.2

