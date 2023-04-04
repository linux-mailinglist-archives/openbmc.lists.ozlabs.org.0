Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DB06D5C4B
	for <lists+openbmc@lfdr.de>; Tue,  4 Apr 2023 11:47:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrNG92kJDz30Kr
	for <lists+openbmc@lfdr.de>; Tue,  4 Apr 2023 19:47:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=x7ppiWby;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=x7ppiWby;
	dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrN9d41LRz3cJK
	for <openbmc@lists.ozlabs.org>; Tue,  4 Apr 2023 19:43:15 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id br6so41573862lfb.11
        for <openbmc@lists.ozlabs.org>; Tue, 04 Apr 2023 02:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680601390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKK9eLgubzxWPHMWxI1yK7d1/+43BWwyQkM2tfuG2Ww=;
        b=x7ppiWbyNyZwwriIorzWRnpZP4rWgQx6yFQbqXqh1OXDLJel4zda/pCcS6POdONcaG
         7Yv3e7fbUTqfjUrHeAtVc5xqJ4Gmz4/GtSFu4grqH+f3gGPtr0jGvRyKK6vRApV0uNNn
         pBO5KB050ARhuPvDhuT2MFcCNRi/fcfb9A8aqygpgQrVbjwJfG7hcodVt+q/oS/Bx9LW
         /fnKSlEVfDctfs5GeV3aYtiORbT1k5+p5mQ5pjXT0uBW89SPhm+5PXh2tDA/qmLebjcZ
         KK5Dn3f/RObhVpTmQsLbGJDuntgJHC8ftHLkH2+hc+DxBbBxb4xgIHwtdQT4P8ohou1j
         CfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680601390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKK9eLgubzxWPHMWxI1yK7d1/+43BWwyQkM2tfuG2Ww=;
        b=oAvJ56rOPAhjFeu2W1wSht1W2DEJ/rpRTCXuagQg0xvEACsWLeSGC+HChv6kQB9zFF
         rpwC2owUpLoPU6whHHgiw/q83Pf62DAhCfTmuo3ep3cVPv/I4/5Bns91YXJmqMYlG7vD
         /i8G+FyJfoL5Y6eu9d3VIIqXLMg+PqneswOYtianGJoiQc5qN+V3JPOoW54gd71rIcoB
         /ofGghglLUO1y7mL6wqIJ8prIEm16YbbJYZt7VjxIGmiLI6wqfJzRl2Qqb1+biAjQsZN
         thSTBywM2VjArJxqT5F75cDBTny4fky6cS5edAh8WlZH8w3UFefubO7qzPvlsNt27JnH
         kV+Q==
X-Gm-Message-State: AAQBX9cDYu+4TywqlUfoK5FJztVGx1k1IoYlroNk9Mvsz4cJX0Y+3hBE
	LO0Kyny2mI9eG88ndyllwPeZUg==
X-Google-Smtp-Source: AKy350bXU9qE5on50GOy/zA3QRbSNFs+CqcTvsLk9DkI3fNquQp8y9IwP/2sQB6t0bTIVTgIgnAjHw==
X-Received: by 2002:ac2:4c92:0:b0:4df:b32b:a2a3 with SMTP id d18-20020ac24c92000000b004dfb32ba2a3mr477734lfl.47.1680601390612;
        Tue, 04 Apr 2023 02:43:10 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id l25-20020a19c219000000b004eb258f73a9sm2218443lfc.163.2023.04.04.02.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 02:43:10 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 04 Apr 2023 11:43:03 +0200
Subject: [PATCH 1/9] pinctrl: iproc: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230403-immutable-irqchips-v1-1-503788a7f6e6@linaro.org>
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
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 38 +++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
index 3df56a4ea510..cc3eb7409ab3 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -23,6 +23,7 @@
 #include <linux/kernel.h>
 #include <linux/of_device.h>
 #include <linux/of_irq.h>
+#include <linux/seq_file.h>
 #include <linux/slab.h>
 
 #include <linux/pinctrl/consumer.h>
@@ -108,7 +109,6 @@ struct iproc_gpio {
 
 	raw_spinlock_t lock;
 
-	struct irq_chip irqchip;
 	struct gpio_chip gc;
 	unsigned num_banks;
 
@@ -217,7 +217,7 @@ static void iproc_gpio_irq_set_mask(struct irq_data *d, bool unmask)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct iproc_gpio *chip = gpiochip_get_data(gc);
-	unsigned gpio = d->hwirq;
+	unsigned gpio = irqd_to_hwirq(d);
 
 	iproc_set_bit(chip, IPROC_GPIO_INT_MSK_OFFSET, gpio, unmask);
 }
@@ -231,6 +231,7 @@ static void iproc_gpio_irq_mask(struct irq_data *d)
 	raw_spin_lock_irqsave(&chip->lock, flags);
 	iproc_gpio_irq_set_mask(d, false);
 	raw_spin_unlock_irqrestore(&chip->lock, flags);
+	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
 }
 
 static void iproc_gpio_irq_unmask(struct irq_data *d)
@@ -239,6 +240,7 @@ static void iproc_gpio_irq_unmask(struct irq_data *d)
 	struct iproc_gpio *chip = gpiochip_get_data(gc);
 	unsigned long flags;
 
+	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
 	raw_spin_lock_irqsave(&chip->lock, flags);
 	iproc_gpio_irq_set_mask(d, true);
 	raw_spin_unlock_irqrestore(&chip->lock, flags);
@@ -302,6 +304,26 @@ static int iproc_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	return 0;
 }
 
+static void iproc_gpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct iproc_gpio *chip = gpiochip_get_data(gc);
+
+	seq_printf(p, dev_name(chip->dev));
+}
+
+static const struct irq_chip iproc_gpio_irq_chip = {
+	.irq_ack = iproc_gpio_irq_ack,
+	.irq_mask = iproc_gpio_irq_mask,
+	.irq_unmask = iproc_gpio_irq_unmask,
+	.irq_set_type = iproc_gpio_irq_set_type,
+	.irq_enable = iproc_gpio_irq_unmask,
+	.irq_disable = iproc_gpio_irq_mask,
+	.irq_print_chip = iproc_gpio_irq_print_chip,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 /*
  * Request the Iproc IOMUX pinmux controller to mux individual pins to GPIO
  */
@@ -852,20 +874,10 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 	/* optional GPIO interrupt support */
 	irq = platform_get_irq_optional(pdev, 0);
 	if (irq > 0) {
-		struct irq_chip *irqc;
 		struct gpio_irq_chip *girq;
 
-		irqc = &chip->irqchip;
-		irqc->name = dev_name(dev);
-		irqc->irq_ack = iproc_gpio_irq_ack;
-		irqc->irq_mask = iproc_gpio_irq_mask;
-		irqc->irq_unmask = iproc_gpio_irq_unmask;
-		irqc->irq_set_type = iproc_gpio_irq_set_type;
-		irqc->irq_enable = iproc_gpio_irq_unmask;
-		irqc->irq_disable = iproc_gpio_irq_mask;
-
 		girq = &gc->irq;
-		girq->chip = irqc;
+		gpio_irq_chip_set_chip(girq, &iproc_gpio_irq_chip);
 		girq->parent_handler = iproc_gpio_irq_handler;
 		girq->num_parents = 1;
 		girq->parents = devm_kcalloc(dev, 1,

-- 
2.34.1

