Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0293415E6
	for <lists+openbmc@lfdr.de>; Fri, 19 Mar 2021 07:35:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1vKR55VBz3cK2
	for <lists+openbmc@lfdr.de>; Fri, 19 Mar 2021 17:35:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=HyyBNk57;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=TW01AIRC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=HyyBNk57; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=TW01AIRC; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1vBc6fqvz3bsc;
 Fri, 19 Mar 2021 17:29:44 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0492D580A7C;
 Fri, 19 Mar 2021 02:29:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 19 Mar 2021 02:29:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=sxfUwUAfmIiTx
 B4oKLrv/6yomvqUrbaDxVT8XNHcrM0=; b=HyyBNk57/2Mr3rilrBFvl6jom5mj2
 ADJkN9TJFFE7IN/rxuB90/mchmtEXkuw7mZX1TpuhAP312fQHrNjtcxrgvBpMfaz
 8A+6whmB7HTA9qmvxdzkN+E5hyjv8f6rIeW2PN5seEOIewyRe3sgt5wiJUpSMsi5
 ugYy9iDnh6y/f8ZwcJyVGJI+cvfSUisqvc0mD2/3K14asXOaJiUDL0UltWfbcgOB
 Fpv3ZARkuHM1ZJR0a1MJ161X2UAcD0z6WPCgIf83p0W6egbMxuO54Eq0tMsw406D
 L2h/Vex9B2IaOvOsC7bEpwnFGhLgWLtOD/O3WCGLIndxt7tv4QhPV0qLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=sxfUwUAfmIiTxB4oKLrv/6yomvqUrbaDxVT8XNHcrM0=; b=TW01AIRC
 iRuEDFvAdj4JS4jD5lm3Ejct5/YlSK7xewY1U2TrKYpn1r+wg+5RiIuT7WXAq09g
 zkV6Ds2eGIjLIDtyMlvrZ+UdFf/rBAqm0vYXLJgms9v/NO4Ibv/llxQ8hPwLG3Uv
 vIUzGkhjGmx6Tci6Y6/U0asToJe2QgIzWChYOGKjACOiJ6NKNORRYmfyYJJeJ80T
 +IhDUB8rYOKRRJt6zNJLRb4/rjBHOmXZPTSKYbtb3s2ti2+XTAxwH34PYmLQs0NF
 WlQIB1Sh7vFq+t8aKOGCAJSgYcZua3B1dkamBuU/wnR99RT/+ArFhX39bkkK4mmj
 YMxKUbOLTpZxig==
X-ME-Sender: <xms:1kRUYAn2cnEjWuacPkwFcItyzCe08ptma2on6CPOwhLfcDcJl0CdhQ>
 <xme:1kRUYP3zQH05jF8eKDs7qUstUBnnR9RS4cesRqOKrOdt7jvwjVIznjO60ZMvMXcov
 Cl87dxZY5a5J_jxag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefjedgleeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppeduudekrddvuddtrddukedurdeh
 heenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnh
 gurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:1kRUYOqIefpsNXTUQV3v0c16mtH7prxcQ7Op3nw-agCIkB6QoZOobA>
 <xmx:1kRUYMnzXD9zgErc7pfdGnW4jHNh6cpqYqp_m_Ph0idY0et8ahU0sQ>
 <xmx:1kRUYO0mKsX8_Um3JNqU6dydJrW-n_EMirWnrAV17R4l47i6V4gUuQ>
 <xmx:10RUYHE2TJvr_j_8U1WB-P-On4GqXsPzDaGofVJfWjMLuVdVs6ABnw>
Received: from localhost.localdomain
 (ppp118-210-181-55.adl-adc-lon-bras34.tpg.internode.on.net [118.210.181.55])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4CED5240057;
 Fri, 19 Mar 2021 02:29:37 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 minyard@acm.org
Subject: [PATCH v2 14/21] ipmi: kcs_bmc: Allow clients to control KCS IRQ state
Date: Fri, 19 Mar 2021 16:57:45 +1030
Message-Id: <20210319062752.145730-14-andrew@aj.id.au>
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
index 694db6ee2a92..05bbb72418b2 100644
--- a/drivers/char/ipmi/kcs_bmc.c
+++ b/drivers/char/ipmi/kcs_bmc.c
@@ -184,6 +184,12 @@ int kcs_bmc_unregister_cdev(struct kcs_bmc_cdev *cdev)
 }
 EXPORT_SYMBOL(kcs_bmc_unregister_cdev);
 
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
index 5deb9a0b8e60..11fff935218c 100644
--- a/drivers/char/ipmi/kcs_bmc.h
+++ b/drivers/char/ipmi/kcs_bmc.h
@@ -11,6 +11,9 @@
 #define KCS_BMC_EVENT_NONE	0
 #define KCS_BMC_EVENT_HANDLED	1
 
+#define KCS_BMC_EVENT_TYPE_OBE	BIT(0)
+#define KCS_BMC_EVENT_TYPE_IBF	BIT(1)
+
 #define KCS_BMC_STR_OBF		BIT(0)
 #define KCS_BMC_STR_IBF		BIT(1)
 #define KCS_BMC_STR_CMD_DAT	BIT(3)
diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index 6f26e7366c0b..5f26471c038c 100644
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
+	if (KCS_BMC_EVENT_TYPE_OBE & mask) {
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
+	if (KCS_BMC_EVENT_TYPE_IBF & mask) {
+		const bool enable = !!(KCS_BMC_EVENT_TYPE_IBF & state);
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
@@ -378,6 +407,10 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	spin_lock_init(&priv->obe.lock);
+	priv->obe.remove = false;
+	timer_setup(&priv->obe.timer, aspeed_kcs_check_obe, 0);
+
 	aspeed_kcs_set_address(kcs_bmc, addr);
 
 	rc = aspeed_kcs_config_irq(kcs_bmc, pdev);
@@ -386,6 +419,8 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
+	aspeed_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE),
+				   KCS_BMC_EVENT_TYPE_IBF);
 	aspeed_kcs_enable_channel(kcs_bmc, true);
 
 	rc = kcs_bmc_add_device(&priv->kcs_bmc);
@@ -404,6 +439,15 @@ static int aspeed_kcs_remove(struct platform_device *pdev)
 
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
index d0a7404ff584..456796da33de 100644
--- a/drivers/char/ipmi/kcs_bmc_client.h
+++ b/drivers/char/ipmi/kcs_bmc_client.h
@@ -37,6 +37,8 @@ int kcs_bmc_unregister_cdev(struct kcs_bmc_cdev *cdev);
 int kcs_bmc_enable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_client *client);
 void kcs_bmc_disable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_client *client);
 
+void kcs_bmc_update_event_mask(struct kcs_bmc_device *kcs_bmc, u8 mask, u8 events);
+
 u8 kcs_bmc_read_data(struct kcs_bmc_device *kcs_bmc);
 void kcs_bmc_write_data(struct kcs_bmc_device *kcs_bmc, u8 data);
 u8 kcs_bmc_read_status(struct kcs_bmc_device *kcs_bmc);
diff --git a/drivers/char/ipmi/kcs_bmc_device.h b/drivers/char/ipmi/kcs_bmc_device.h
index 57b7174b2bac..f1ca8912496a 100644
--- a/drivers/char/ipmi/kcs_bmc_device.h
+++ b/drivers/char/ipmi/kcs_bmc_device.h
@@ -7,6 +7,7 @@
 #include "kcs_bmc.h"
 
 struct kcs_bmc_device_ops {
+	void (*irq_mask_update)(struct kcs_bmc_device *kcs_bmc, u8 mask, u8 enable);
 	u8 (*io_inputb)(struct kcs_bmc_device *kcs_bmc, u32 reg);
 	void (*io_outputb)(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 b);
 	void (*io_updateb)(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 mask, u8 b);
diff --git a/drivers/char/ipmi/kcs_bmc_npcm7xx.c b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
index dce93ec895fc..c2032728a03d 100644
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
+				   !!(KCS_BMC_EVENT_TYPE_IBF & state) * KCS_CTL_IBFIE);
+}
+
 static irqreturn_t npcm7xx_kcs_irq(int irq, void *arg)
 {
 	struct kcs_bmc_device *kcs_bmc = arg;
@@ -151,6 +162,7 @@ static int npcm7xx_kcs_config_irq(struct kcs_bmc_device *kcs_bmc,
 }
 
 static const struct kcs_bmc_device_ops npcm7xx_kcs_ops = {
+	.irq_mask_update = npcm7xx_kcs_irq_mask_update,
 	.io_inputb = npcm7xx_kcs_inb,
 	.io_outputb = npcm7xx_kcs_outb,
 	.io_updateb = npcm7xx_kcs_updateb,
@@ -191,11 +203,13 @@ static int npcm7xx_kcs_probe(struct platform_device *pdev)
 
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
@@ -211,6 +225,9 @@ static int npcm7xx_kcs_remove(struct platform_device *pdev)
 
 	kcs_bmc_remove_device(kcs_bmc);
 
+	npcm7xx_kcs_enable_channel(kcs_bmc, false);
+	npcm7xx_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE), 0);
+
 	return 0;
 }
 
-- 
2.27.0

