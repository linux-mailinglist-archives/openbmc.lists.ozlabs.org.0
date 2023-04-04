Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4676D5C4A
	for <lists+openbmc@lfdr.de>; Tue,  4 Apr 2023 11:46:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrNFB51MNz3cMT
	for <lists+openbmc@lfdr.de>; Tue,  4 Apr 2023 19:46:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VMkSf/30;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VMkSf/30;
	dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrN9d46RBz3cJY
	for <openbmc@lists.ozlabs.org>; Tue,  4 Apr 2023 19:43:17 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id h11so34639916lfu.8
        for <openbmc@lists.ozlabs.org>; Tue, 04 Apr 2023 02:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680601393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MyI3cyYnrYsvyUY9zGwb5dqwePkLtUbYm7n0o21VTww=;
        b=VMkSf/30AORqPOlLZAvb5ejw7HZDEOIFzuFDKLf8ZeDEbmAan3qaO3LYScbQc9IBrD
         z3KNKoxPvP9VCHdV5C1q+HqWqDfxyxemBOlop94fOEmJJAqCmY0oOVPnFBk/nPhvPtlD
         05cg/JC4v30mUyeoMFa3DQ6+i5PU3zMgNTANV7m80Kypa8rJcPZdaNVj3Clv+EbQyGmv
         20gkxiqQIEK12gDQhJezK2Wcd1NquYFNF6ihh9EykeA70XyhRIhFy+LA8cGAM1Xw96Hv
         c/pB1pihxmAgDsslQ7maLWBZQr3ZHcuEuY1ABY9GS6J6GKEhEMqQyUCBCfLTQXiMlf+F
         QDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680601393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MyI3cyYnrYsvyUY9zGwb5dqwePkLtUbYm7n0o21VTww=;
        b=SRUHJYgrLeWMOOGPFEHaARWZ2ui+u/xM+1d7V1P4o9Ce8+MP+BLX3g45UMb12v7b2g
         lD5Zerqhb/mmUq8iXpYwmJfTPeP/DCnsWUuQ/PTIaFokXhtFCClV+tTwDVuk2wGZrxQf
         p50nPXCa03cZLZ+YQzA+MWCW8Iv48wBcr0+783ag31YG7svtdzQSACR3aBNzld4msGry
         mGIl5/Xf5jDKtYN9Omw7CgzH+8uEmsLRZ9aR4l1tc1Eovq/5Xf7XvLcILYWVqhsAK0pP
         bnmbu6VCzBMAf6vnyBxTJeWKbYi9tkrLaAQS2RqKJvni+gyszgjiSeXjPWLBpso4/yWv
         tNWg==
X-Gm-Message-State: AAQBX9dbY1/Be2GbayLp13fNFLkCfoQXhIP25wHGNLFRgU7tUS5yOybN
	ZWd/7r2Omhk0t6ytWGTRldEEPQ==
X-Google-Smtp-Source: AKy350bAzs+k3GfXqrHrUh46WUwBaaa8Kv09rrmTTSTImYh5z6/205iT1zyUw8YZhG01/6vEVWpsVQ==
X-Received: by 2002:ac2:4422:0:b0:4cc:73ff:579a with SMTP id w2-20020ac24422000000b004cc73ff579amr549570lfl.38.1680601393741;
        Tue, 04 Apr 2023 02:43:13 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id l25-20020a19c219000000b004eb258f73a9sm2218443lfc.163.2023.04.04.02.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 02:43:13 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 04 Apr 2023 11:43:06 +0200
Subject: [PATCH 4/9] pinctrl: npcm7xx: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230403-immutable-irqchips-v1-4-503788a7f6e6@linaro.org>
References: <20230403-immutable-irqchips-v1-0-503788a7f6e6@linaro.org>
In-Reply-To: <20230403-immutable-irqchips-v1-0-503788a7f6e6@linaro.org>
To: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.1
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
Cc: Marc Zyngier <maz@kernel.org>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Convert the driver to immutable irq-chip with a bit of
intuition.

I refactored the way the state container was accessed in
the irq_chip callbacks to all look the same and switch to
use irqd_to_hwirq() while we are at it.

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 34 ++++++++++++++++---------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index ff5bcea172e8..05d39f9111c2 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -82,7 +82,6 @@ struct npcm7xx_gpio {
 	struct gpio_chip	gc;
 	int			irqbase;
 	int			irq;
-	struct irq_chip		irq_chip;
 	u32			pinctrl_id;
 	int (*direction_input)(struct gpio_chip *chip, unsigned int offset);
 	int (*direction_output)(struct gpio_chip *chip, unsigned int offset,
@@ -240,9 +239,9 @@ static void npcmgpio_irq_handler(struct irq_desc *desc)
 
 static int npcmgpio_set_irq_type(struct irq_data *d, unsigned int type)
 {
-	struct npcm7xx_gpio *bank =
-		gpiochip_get_data(irq_data_get_irq_chip_data(d));
-	unsigned int gpio = BIT(d->hwirq);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct npcm7xx_gpio *bank = gpiochip_get_data(gc);
+	unsigned int gpio = BIT(irqd_to_hwirq(d));
 
 	dev_dbg(bank->gc.parent, "setirqtype: %u.%u = %u\n", gpio,
 		d->irq, type);
@@ -288,9 +287,9 @@ static int npcmgpio_set_irq_type(struct irq_data *d, unsigned int type)
 
 static void npcmgpio_irq_ack(struct irq_data *d)
 {
-	struct npcm7xx_gpio *bank =
-		gpiochip_get_data(irq_data_get_irq_chip_data(d));
-	unsigned int gpio = d->hwirq;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct npcm7xx_gpio *bank = gpiochip_get_data(gc);
+	unsigned int gpio = irqd_to_hwirq(d);
 
 	dev_dbg(bank->gc.parent, "irq_ack: %u.%u\n", gpio, d->irq);
 	iowrite32(BIT(gpio), bank->base + NPCM7XX_GP_N_EVST);
@@ -299,23 +298,25 @@ static void npcmgpio_irq_ack(struct irq_data *d)
 /* Disable GPIO interrupt */
 static void npcmgpio_irq_mask(struct irq_data *d)
 {
-	struct npcm7xx_gpio *bank =
-		gpiochip_get_data(irq_data_get_irq_chip_data(d));
-	unsigned int gpio = d->hwirq;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct npcm7xx_gpio *bank = gpiochip_get_data(gc);
+	unsigned int gpio = irqd_to_hwirq(d);
 
 	/* Clear events */
 	dev_dbg(bank->gc.parent, "irq_mask: %u.%u\n", gpio, d->irq);
 	iowrite32(BIT(gpio), bank->base + NPCM7XX_GP_N_EVENC);
+	gpiochip_disable_irq(gc, gpio);
 }
 
 /* Enable GPIO interrupt */
 static void npcmgpio_irq_unmask(struct irq_data *d)
 {
-	struct npcm7xx_gpio *bank =
-		gpiochip_get_data(irq_data_get_irq_chip_data(d));
-	unsigned int gpio = d->hwirq;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct npcm7xx_gpio *bank = gpiochip_get_data(gc);
+	unsigned int gpio = irqd_to_hwirq(d);
 
 	/* Enable events */
+	gpiochip_enable_irq(gc, gpio);
 	dev_dbg(bank->gc.parent, "irq_unmask: %u.%u\n", gpio, d->irq);
 	iowrite32(BIT(gpio), bank->base + NPCM7XX_GP_N_EVENS);
 }
@@ -323,7 +324,7 @@ static void npcmgpio_irq_unmask(struct irq_data *d)
 static unsigned int npcmgpio_irq_startup(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	unsigned int gpio = d->hwirq;
+	unsigned int gpio = irqd_to_hwirq(d);
 
 	/* active-high, input, clear interrupt, enable interrupt */
 	dev_dbg(gc->parent, "startup: %u.%u\n", gpio, d->irq);
@@ -341,6 +342,8 @@ static const struct irq_chip npcmgpio_irqchip = {
 	.irq_mask = npcmgpio_irq_mask,
 	.irq_set_type = npcmgpio_set_irq_type,
 	.irq_startup = npcmgpio_irq_startup,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 /* pinmux handing in the pinctrl driver*/
@@ -1906,7 +1909,6 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 			return -EINVAL;
 		}
 		pctrl->gpio_bank[id].irq = ret;
-		pctrl->gpio_bank[id].irq_chip = npcmgpio_irqchip;
 		pctrl->gpio_bank[id].irqbase = id * NPCM7XX_GPIO_PER_BANK;
 		pctrl->gpio_bank[id].pinctrl_id = args.args[0];
 		pctrl->gpio_bank[id].gc.base = args.args[1];
@@ -1941,7 +1943,7 @@ static int npcm7xx_gpio_register(struct npcm7xx_pinctrl *pctrl)
 		struct gpio_irq_chip *girq;
 
 		girq = &pctrl->gpio_bank[id].gc.irq;
-		girq->chip = &pctrl->gpio_bank[id].irq_chip;
+		gpio_irq_chip_set_chip(girq, &npcmgpio_irqchip);
 		girq->parent_handler = npcmgpio_irq_handler;
 		girq->num_parents = 1;
 		girq->parents = devm_kcalloc(pctrl->dev, 1,

-- 
2.34.1

