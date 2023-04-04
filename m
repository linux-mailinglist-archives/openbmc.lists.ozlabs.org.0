Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBE86D5C58
	for <lists+openbmc@lfdr.de>; Tue,  4 Apr 2023 11:51:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrNM82QG3z3cK8
	for <lists+openbmc@lfdr.de>; Tue,  4 Apr 2023 19:51:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IqiscGQI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IqiscGQI;
	dkim-atps=neutral
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrN9k3zWFz3000
	for <openbmc@lists.ozlabs.org>; Tue,  4 Apr 2023 19:43:22 +1000 (AEST)
Received: by mail-lf1-x134.google.com with SMTP id g19so28496913lfr.9
        for <openbmc@lists.ozlabs.org>; Tue, 04 Apr 2023 02:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680601399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RNcW0+JGFul/r7gTdVaVYsY6oiF69IsvdynyWjh+xH4=;
        b=IqiscGQIO7vvpA7PHEppUJtobdxHepbMUx6GNwDfHGIpDOZJG/8BLcmKFApHwQd+cy
         /ZoysvY8PM3jpBWKDq8C3E6DvCqNS24xASrDSBdO/8kEozm+lmFgZ+c0nwK9VZq2uatj
         cDSATL8++/5ds6m+vsT5QFlSjt9bjr17lLmhLW2phdaWVBU5SV32aqsZoT2S/9DaVKx8
         0ua+hmO/doBPifDKuTTcAUAUbRZdQEUH8CuZTIii9/tqyX8mjzjg4S5joY258LjcJbXm
         AeCeL47eYslepdPd7/EPqfSbdDuOvgp95hvVT0lRnFt3kjd6rJi3I2JcozXcUr9E00Wz
         jF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680601399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RNcW0+JGFul/r7gTdVaVYsY6oiF69IsvdynyWjh+xH4=;
        b=ZrBo+x9cAZhUTih9fZ+3fRtpet2oEBFkh+9G13Bky5BXNW/SgKdy1C7UM2BMT4s8tP
         0rHwcUuCTKddVV51Iz6JVg75oOdBItlfBz68FuU/e9zJpTZtAtqb4G59VgEG7qadr7+p
         9GkKfEe3+R4+e06JvreOJ3bLiKBO70REaR0S4B1cQtugSof7BHFgfHRWvJVLgeQ2uzrN
         byvFMgeQ0BvtNRB4BRlXY4yGn3hHzovs1B+vOerbXBC+w1J+XTvmnXmrMfD50b1WPA9T
         tm/I6YWwgYtlhNqscKWfZcraWjV6VOr8jHPvOOdvk8oPwdkQeN3vj5SftdbAYqS6KNFR
         CfDA==
X-Gm-Message-State: AAQBX9fdBVdY7MsNHT2uvJeuXXEUSHIWgtq9t70LGP6lBSauJKClF+nu
	kNn1OhdRy7yMf1WeXNsrEc3ueA==
X-Google-Smtp-Source: AKy350bHtWLWxkw8v/3gtXShSIG6n42OYlnsV/lCyqHmYlMKXuVm423gkCgVUETn229gxABvBap0QQ==
X-Received: by 2002:ac2:59d9:0:b0:4ea:fa87:7a8a with SMTP id x25-20020ac259d9000000b004eafa877a8amr445870lfn.37.1680601399242;
        Tue, 04 Apr 2023 02:43:19 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id l25-20020a19c219000000b004eb258f73a9sm2218443lfc.163.2023.04.04.02.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 02:43:18 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 04 Apr 2023 11:43:11 +0200
Subject: [PATCH 9/9] pinctrl: sx150x: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230403-immutable-irqchips-v1-9-503788a7f6e6@linaro.org>
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

I switched to consistently using irqd_to_hwirq() consistently
while we are at it.

As the driver now needs to get the gpio_chip in the .irq_mask
and .irq_unmask callbacks, I switched to a pattern where we
first fetch the gpio_chip and then the state container from
that in two steps. The compiler will do the same thing anyway.

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-sx150x.c | 64 +++++++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 27 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 0b5ff99641e1..e49c7be2b47b 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -99,7 +99,6 @@ struct sx150x_pinctrl {
 	struct pinctrl_dev *pctldev;
 	struct pinctrl_desc pinctrl_desc;
 	struct gpio_chip gpio;
-	struct irq_chip irq_chip;
 	struct regmap *regmap;
 	struct {
 		u32 sense;
@@ -487,19 +486,21 @@ static int sx150x_gpio_direction_output(struct gpio_chip *chip,
 
 static void sx150x_irq_mask(struct irq_data *d)
 {
-	struct sx150x_pinctrl *pctl =
-			gpiochip_get_data(irq_data_get_irq_chip_data(d));
-	unsigned int n = d->hwirq;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct sx150x_pinctrl *pctl = gpiochip_get_data(gc);
+	unsigned int n = irqd_to_hwirq(d);
 
 	pctl->irq.masked |= BIT(n);
+	gpiochip_disable_irq(gc, n);
 }
 
 static void sx150x_irq_unmask(struct irq_data *d)
 {
-	struct sx150x_pinctrl *pctl =
-			gpiochip_get_data(irq_data_get_irq_chip_data(d));
-	unsigned int n = d->hwirq;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct sx150x_pinctrl *pctl = gpiochip_get_data(gc);
+	unsigned int n = irqd_to_hwirq(d);
 
+	gpiochip_enable_irq(gc, n);
 	pctl->irq.masked &= ~BIT(n);
 }
 
@@ -520,14 +521,14 @@ static void sx150x_irq_set_sense(struct sx150x_pinctrl *pctl,
 
 static int sx150x_irq_set_type(struct irq_data *d, unsigned int flow_type)
 {
-	struct sx150x_pinctrl *pctl =
-			gpiochip_get_data(irq_data_get_irq_chip_data(d));
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct sx150x_pinctrl *pctl = gpiochip_get_data(gc);
 	unsigned int n, val = 0;
 
 	if (flow_type & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW))
 		return -EINVAL;
 
-	n = d->hwirq;
+	n = irqd_to_hwirq(d);
 
 	if (flow_type & IRQ_TYPE_EDGE_RISING)
 		val |= SX150X_IRQ_TYPE_EDGE_RISING;
@@ -562,22 +563,42 @@ static irqreturn_t sx150x_irq_thread_fn(int irq, void *dev_id)
 
 static void sx150x_irq_bus_lock(struct irq_data *d)
 {
-	struct sx150x_pinctrl *pctl =
-			gpiochip_get_data(irq_data_get_irq_chip_data(d));
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct sx150x_pinctrl *pctl = gpiochip_get_data(gc);
 
 	mutex_lock(&pctl->lock);
 }
 
 static void sx150x_irq_bus_sync_unlock(struct irq_data *d)
 {
-	struct sx150x_pinctrl *pctl =
-			gpiochip_get_data(irq_data_get_irq_chip_data(d));
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct sx150x_pinctrl *pctl = gpiochip_get_data(gc);
 
 	regmap_write(pctl->regmap, pctl->data->reg_irq_mask, pctl->irq.masked);
 	regmap_write(pctl->regmap, pctl->data->reg_sense, pctl->irq.sense);
 	mutex_unlock(&pctl->lock);
 }
 
+
+static void sx150x_irq_print_chip(struct irq_data *d, struct seq_file *p)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct sx150x_pinctrl *pctl = gpiochip_get_data(gc);
+
+	seq_printf(p, pctl->client->name);
+}
+
+static const struct irq_chip sx150x_irq_chip = {
+	.irq_mask = sx150x_irq_mask,
+	.irq_unmask = sx150x_irq_unmask,
+	.irq_set_type = sx150x_irq_set_type,
+	.irq_bus_lock = sx150x_irq_bus_lock,
+	.irq_bus_sync_unlock = sx150x_irq_bus_sync_unlock,
+	.irq_print_chip = sx150x_irq_print_chip,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int sx150x_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 			      unsigned long *config)
 {
@@ -1181,19 +1202,8 @@ static int sx150x_probe(struct i2c_client *client)
 	if (client->irq > 0) {
 		struct gpio_irq_chip *girq;
 
-		pctl->irq_chip.irq_mask = sx150x_irq_mask;
-		pctl->irq_chip.irq_unmask = sx150x_irq_unmask;
-		pctl->irq_chip.irq_set_type = sx150x_irq_set_type;
-		pctl->irq_chip.irq_bus_lock = sx150x_irq_bus_lock;
-		pctl->irq_chip.irq_bus_sync_unlock = sx150x_irq_bus_sync_unlock;
-		pctl->irq_chip.name = devm_kstrdup(dev, client->name,
-						   GFP_KERNEL);
-		if (!pctl->irq_chip.name)
-			return -ENOMEM;
-
 		pctl->irq.masked = ~0;
 		pctl->irq.sense = 0;
-
 		/*
 		 * Because sx150x_irq_threaded_fn invokes all of the
 		 * nested interrupt handlers via handle_nested_irq,
@@ -1206,7 +1216,7 @@ static int sx150x_probe(struct i2c_client *client)
 		 * called (should not happen)
 		 */
 		girq = &pctl->gpio.irq;
-		girq->chip = &pctl->irq_chip;
+		gpio_irq_chip_set_chip(girq, &sx150x_irq_chip);
 		/* This will let us handle the parent IRQ in the driver */
 		girq->parent_handler = NULL;
 		girq->num_parents = 0;
@@ -1219,7 +1229,7 @@ static int sx150x_probe(struct i2c_client *client)
 						sx150x_irq_thread_fn,
 						IRQF_ONESHOT | IRQF_SHARED |
 						IRQF_TRIGGER_FALLING,
-						pctl->irq_chip.name, pctl);
+						client->name, pctl);
 		if (ret < 0)
 			return ret;
 	}

-- 
2.34.1

