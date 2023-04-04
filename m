Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3076D5C50
	for <lists+openbmc@lfdr.de>; Tue,  4 Apr 2023 11:48:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrNH94VWqz2xJN
	for <lists+openbmc@lfdr.de>; Tue,  4 Apr 2023 19:48:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ICxJ7YUe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ICxJ7YUe;
	dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrN9f2zfvz3cJK
	for <openbmc@lists.ozlabs.org>; Tue,  4 Apr 2023 19:43:18 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id h25so41609789lfv.6
        for <openbmc@lists.ozlabs.org>; Tue, 04 Apr 2023 02:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680601394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvdTyVfTrmaDBV4ot+H/Nt1e4zaa23404aJu9Xqb7mA=;
        b=ICxJ7YUe4hMVhguFvpnF1aY1g2Xg4mx4cDsI89BJpwkDMlqLi6qFs0qAm1gH1e7IVc
         H9O3qmNc5Yl380YTtScMkdC5MjYUVycM0Bb98+MNi+509Acfjw7PXF5zmVlmcPvVwWo1
         VSzvfDsF84XJxs79RETY7OSH6rXLO09va/3ONasKuU5gpMrlOEgtpmSU9I3aKMf9hlEZ
         MtI45uH3axyfhRJyE9oc9alpGa86BWOR2IXEDjISPQDnFE2IlXgfA0jpOdqvLwkpHCWf
         /WUJD9ayL7tzb2YqWLxpKOysDqLIUBDz39ffyaPdXGSmgnq+rp9f7iKgRfaZBtCqKQ9z
         kB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680601394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IvdTyVfTrmaDBV4ot+H/Nt1e4zaa23404aJu9Xqb7mA=;
        b=kk2ytfxLMhzESbDSlHFTru9y1R3eRRjJy5lppqV8UPxo0tqZvxTt4NFWPv8zG2a1dh
         6fUPqhfutDBdTV2JFpynGHRfarDyPqei8uerOQu6WaFRvju2MzbgmN3AkgFxiSxTVVUK
         MNMhg5AxhvKDy1R/pWhlV9G7bzdBPYKc1L/VgnMFswk6CPLkE2kJcOXyxJFVErsMsNpj
         8S1Nf0C6IeWSQAecAch2FXiAf050tJ9p30J4dIVAt2Hul4tHRZZT/gG3ZRSddP6pVngN
         OfEsslNi9XhGGk65cgCXZ994npbIIi89khA0u1gYDkEZolI5S47d5oqrD/V7YggWWiJ/
         hxOw==
X-Gm-Message-State: AAQBX9cHi2R5jkebV8943lqL+v1rn2tXlJIcJiKuk+biBTecD5p5cXS/
	eBc6S4kpasr538ap7deQAMzTZQ==
X-Google-Smtp-Source: AKy350aeLsqesUsg+RRQuKpGDi2+iTAe42ueN49XS6nl4LpQF3DdNJ5O0KERzFnZGDFb/T4668h+8A==
X-Received: by 2002:a05:6512:38c2:b0:4dd:cb1d:b3cc with SMTP id p2-20020a05651238c200b004ddcb1db3ccmr446350lft.11.1680601394784;
        Tue, 04 Apr 2023 02:43:14 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id l25-20020a19c219000000b004eb258f73a9sm2218443lfc.163.2023.04.04.02.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 02:43:14 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 04 Apr 2023 11:43:07 +0200
Subject: [PATCH 5/9] pinctrl: equilibrium: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230403-immutable-irqchips-v1-5-503788a7f6e6@linaro.org>
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

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-equilibrium.c | 22 ++++++++++++++--------
 drivers/pinctrl/pinctrl-equilibrium.h |  2 --
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index 99cf24eb67ae..5b5ddf7e5d0e 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -32,6 +32,7 @@ static void eqbr_gpio_disable_irq(struct irq_data *d)
 	raw_spin_lock_irqsave(&gctrl->lock, flags);
 	writel(BIT(offset), gctrl->membase + GPIO_IRNENCLR);
 	raw_spin_unlock_irqrestore(&gctrl->lock, flags);
+	gpiochip_disable_irq(gc, offset);
 }
 
 static void eqbr_gpio_enable_irq(struct irq_data *d)
@@ -42,6 +43,7 @@ static void eqbr_gpio_enable_irq(struct irq_data *d)
 	unsigned long flags;
 
 	gc->direction_input(gc, offset);
+	gpiochip_enable_irq(gc, offset);
 	raw_spin_lock_irqsave(&gctrl->lock, flags);
 	writel(BIT(offset), gctrl->membase + GPIO_IRNRNSET);
 	raw_spin_unlock_irqrestore(&gctrl->lock, flags);
@@ -161,6 +163,17 @@ static void eqbr_irq_handler(struct irq_desc *desc)
 	chained_irq_exit(ic, desc);
 }
 
+static const struct irq_chip eqbr_irq_chip = {
+	.name = "gpio_irq",
+	.irq_mask = eqbr_gpio_disable_irq,
+	.irq_unmask = eqbr_gpio_enable_irq,
+	.irq_ack = eqbr_gpio_ack_irq,
+	.irq_mask_ack = eqbr_gpio_mask_ack_irq,
+	.irq_set_type = eqbr_gpio_set_irq_type,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int gpiochip_setup(struct device *dev, struct eqbr_gpio_ctrl *gctrl)
 {
 	struct gpio_irq_chip *girq;
@@ -176,15 +189,8 @@ static int gpiochip_setup(struct device *dev, struct eqbr_gpio_ctrl *gctrl)
 		return 0;
 	}
 
-	gctrl->ic.name = "gpio_irq";
-	gctrl->ic.irq_mask = eqbr_gpio_disable_irq;
-	gctrl->ic.irq_unmask = eqbr_gpio_enable_irq;
-	gctrl->ic.irq_ack = eqbr_gpio_ack_irq;
-	gctrl->ic.irq_mask_ack = eqbr_gpio_mask_ack_irq;
-	gctrl->ic.irq_set_type = eqbr_gpio_set_irq_type;
-
 	girq = &gctrl->chip.irq;
-	girq->chip = &gctrl->ic;
+	gpio_irq_chip_set_chip(girq, &eqbr_irq_chip);
 	girq->parent_handler = eqbr_irq_handler;
 	girq->num_parents = 1;
 	girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents), GFP_KERNEL);
diff --git a/drivers/pinctrl/pinctrl-equilibrium.h b/drivers/pinctrl/pinctrl-equilibrium.h
index 0c635a5b79f0..83768cc8b3db 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.h
+++ b/drivers/pinctrl/pinctrl-equilibrium.h
@@ -103,7 +103,6 @@ struct fwnode_handle;
  * @fwnode: firmware node of gpio controller.
  * @bank: pointer to corresponding pin bank.
  * @membase: base address of the gpio controller.
- * @ic:   irq chip.
  * @name: gpio chip name.
  * @virq: irq number of the gpio chip to parent's irq domain.
  * @lock: spin lock to protect gpio register write.
@@ -113,7 +112,6 @@ struct eqbr_gpio_ctrl {
 	struct fwnode_handle	*fwnode;
 	struct eqbr_pin_bank	*bank;
 	void __iomem		*membase;
-	struct irq_chip		ic;
 	const char		*name;
 	unsigned int		virq;
 	raw_spinlock_t		lock; /* protect gpio register */

-- 
2.34.1

