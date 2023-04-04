Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD546D5C55
	for <lists+openbmc@lfdr.de>; Tue,  4 Apr 2023 11:49:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrNK90wGpz3cRW
	for <lists+openbmc@lfdr.de>; Tue,  4 Apr 2023 19:49:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jYDIjklT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jYDIjklT;
	dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrN9h5pYtz3cJK
	for <openbmc@lists.ozlabs.org>; Tue,  4 Apr 2023 19:43:20 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id br6so41574183lfb.11
        for <openbmc@lists.ozlabs.org>; Tue, 04 Apr 2023 02:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680601397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MNYdQtD12ErxW9Tb9ALuTo8L9TpmlxX4Klxpk5H7jnk=;
        b=jYDIjklTKr8Cj1T9VYHcmDrIMw8h/xDvQ8AMsEyXG+GrHhNO6IT9GJzRVnpgvE4yOr
         bQ0iZBI8TaAJOXFbpWzOtgJL6eO+DTNoYJoUFm1SpNwJRbx4KIdU7BzH5hvCEIQROCfV
         UO7TGmAGOtDwu2qtnobq3CJ12F7/QAEvf9COV1OTAtdZvsQ9njcN3WU1ziJ2Tlk6Hbyv
         DdSrZZcOGKQvQVaF/j5ZLtSOL01ixH6Jb0wKyxDe9LegyLQ/2P6VG5YtKct2uf4iAp3B
         6y8YnqYVJX/tsuFKs/z1r9qs7y/ylL6o40MaYO4Cg+S0mBerit+PSnXLxbzR2a9eNyVi
         l1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680601397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MNYdQtD12ErxW9Tb9ALuTo8L9TpmlxX4Klxpk5H7jnk=;
        b=OLoHmivfphJNuwpehd6MU5l8b63iQxzeeIDkPWTOsVCOMUtirQUTySQPJoVg/EUaYJ
         FTdVmMpNwkJG1qPlQiDJwxua2c/5w8iLLIYmhRLbMwAJhVbjoPERr49Zdvi+HTfVqS95
         1+tJw+15mMqEjz/CwbYEjXRFNhJ6zb+eEB4NO/3ny2uRh9Z/aob5SAPu6yQXO6rgQ/k6
         U3BVove3IFkclbKZHmtXn6gqboNO68XNFHRJA/DZ/ufQtsYGPa97CFclFGd0RUZBQBJm
         05DYasWanH3vLNGNnQ+MWhjJ34aorADFPFSdV1k9Jh3qXlapDN2EGWkkjojgta6shlCv
         3+sw==
X-Gm-Message-State: AAQBX9cGYmc5YhtESVEqtZJfGimlR0Dwb1khBL/QQ4zTJ/2FSGIF+KlU
	xSavJO9eIQzLIVhUfnNlXjP8uQ==
X-Google-Smtp-Source: AKy350aGvdFi+RZKjqDDMQzvmBaZ/OiWcvh3hUJR1pdqaSXWZoxf8OpalMpYOO2vxe4OeQZKqKjv7g==
X-Received: by 2002:ac2:43a5:0:b0:4b0:2a2f:ea6d with SMTP id t5-20020ac243a5000000b004b02a2fea6dmr444334lfl.35.1680601397119;
        Tue, 04 Apr 2023 02:43:17 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id l25-20020a19c219000000b004eb258f73a9sm2218443lfc.163.2023.04.04.02.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 02:43:16 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 04 Apr 2023 11:43:09 +0200
Subject: [PATCH 7/9] pinctrl: st: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230403-immutable-irqchips-v1-7-503788a7f6e6@linaro.org>
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

I switched to using irqd_to_hwirq() consistently while we
are at it.

This driver does not use the GPIOCHIP_IRQ_RESOURCE_HELPERS
as it defines its own resource reservations, simply in
order to turn IRQ lines into inputs on initialization.

Also switched the open coded calls to gpiochip_lock_as_irq()
to gpiochip_reqres_irq() so we also get the right module
reference counting.

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-st.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index 1409339f0279..c1f36b164ea5 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -1313,7 +1313,8 @@ static void st_gpio_irq_mask(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct st_gpio_bank *bank = gpiochip_get_data(gc);
 
-	writel(BIT(d->hwirq), bank->base + REG_PIO_CLR_PMASK);
+	writel(BIT(irqd_to_hwirq(d)), bank->base + REG_PIO_CLR_PMASK);
+	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
 }
 
 static void st_gpio_irq_unmask(struct irq_data *d)
@@ -1321,7 +1322,8 @@ static void st_gpio_irq_unmask(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct st_gpio_bank *bank = gpiochip_get_data(gc);
 
-	writel(BIT(d->hwirq), bank->base + REG_PIO_SET_PMASK);
+	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
+	writel(BIT(irqd_to_hwirq(d)), bank->base + REG_PIO_SET_PMASK);
 }
 
 static int st_gpio_irq_request_resources(struct irq_data *d)
@@ -1330,14 +1332,14 @@ static int st_gpio_irq_request_resources(struct irq_data *d)
 
 	st_gpio_direction_input(gc, d->hwirq);
 
-	return gpiochip_lock_as_irq(gc, d->hwirq);
+	return gpiochip_reqres_irq(gc, d->hwirq);
 }
 
 static void st_gpio_irq_release_resources(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 
-	gpiochip_unlock_as_irq(gc, d->hwirq);
+	gpiochip_relres_irq(gc, d->hwirq);
 }
 
 static int st_gpio_irq_set_type(struct irq_data *d, unsigned type)
@@ -1492,7 +1494,7 @@ static const struct gpio_chip st_gpio_template = {
 	.ngpio			= ST_GPIO_PINS_PER_BANK,
 };
 
-static struct irq_chip st_gpio_irqchip = {
+static const struct irq_chip st_gpio_irqchip = {
 	.name			= "GPIO",
 	.irq_request_resources	= st_gpio_irq_request_resources,
 	.irq_release_resources	= st_gpio_irq_release_resources,
@@ -1500,7 +1502,7 @@ static struct irq_chip st_gpio_irqchip = {
 	.irq_mask		= st_gpio_irq_mask,
 	.irq_unmask		= st_gpio_irq_unmask,
 	.irq_set_type		= st_gpio_irq_set_type,
-	.flags			= IRQCHIP_SKIP_SET_WAKE,
+	.flags			= IRQCHIP_SKIP_SET_WAKE | IRQCHIP_IMMUTABLE,
 };
 
 static int st_gpiolib_register_bank(struct st_pinctrl *info,
@@ -1570,7 +1572,7 @@ static int st_gpiolib_register_bank(struct st_pinctrl *info,
 		}
 
 		girq = &bank->gpio_chip.irq;
-		girq->chip = &st_gpio_irqchip;
+		gpio_irq_chip_set_chip(girq, &st_gpio_irqchip);
 		girq->parent_handler = st_gpio_irq_handler;
 		girq->num_parents = 1;
 		girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),

-- 
2.34.1

