Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 948536D5C41
	for <lists+openbmc@lfdr.de>; Tue,  4 Apr 2023 11:45:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrNDB36kMz2xJN
	for <lists+openbmc@lfdr.de>; Tue,  4 Apr 2023 19:45:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eX5ZeFcr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eX5ZeFcr;
	dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrN9d3wlDz3cG7
	for <openbmc@lists.ozlabs.org>; Tue,  4 Apr 2023 19:43:15 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id h25so41609628lfv.6
        for <openbmc@lists.ozlabs.org>; Tue, 04 Apr 2023 02:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680601391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E1U3mznWUSnJq2x7KzrZeo74yHwZxjse8U63SQkTN4k=;
        b=eX5ZeFcrDyeOZ/+cmIw1GthasxB336QssKMWmkFVFjzUzquTWCGLPH0q1EZGkx57D7
         lMBTV4GQvDuLwdcpX7uMkCsYiT15dsHdEflv9g0w1W+ahbDSVxbyUvz5gUTVJ5sYN5nd
         gGSkMJIKgzuEsvJpz5qvVuUa9tXPAIFLLMxBUS9ZN6aJGEJa88cvLFIhVRzr7cFD3xO4
         V/C0tVGfceLtY5T6HC9Bg5fuMQSPe39vC9gft3my7IAoHhwOGoYe386nE0RCa7Nph0FF
         HFz4nkApA+T03Chl0EFnlvCZrI+HrbjlWiHUeCW0UG/pPXcOb+msKYSk3REigmMJsDvV
         tYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680601391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1U3mznWUSnJq2x7KzrZeo74yHwZxjse8U63SQkTN4k=;
        b=DgvrE6wSNuhD4rNLQZ6dPWCapHCFNkErzFj9YsEPTPr5aR5rLrn6vELT8tU7U4danK
         br5UKSXa9UKVUCH1UsQgzPy6zZmbxfWWe0lAE9UoZwVMSLglFiFNi0w0UDSO2e2SBnno
         md9aEnKrKQxcEBozl9LMyzXpsUncAo/uoW61LWdVVolGvMhpQ6VudkVnEJ5VwfRpxb2v
         E/6Pd9U1gyMnChTpmf0B37aDjzgvdFpUOZgh5pl/cA+WVVV8ME2+ViGp17i0iMYVQuTZ
         auMSo/aj3WgN7byb8ZprKljHxFh0te2UR7ixxN7E9AKaypgc6LkBSYTsq/X3iFNL7ZJo
         YPww==
X-Gm-Message-State: AAQBX9febXSUDl4i0IF7ER4ud1oRqv0PBLD/gErN3RvzUlnmrFvht7N0
	V1aTKSd9my83oSYyRoMTFEZg0g==
X-Google-Smtp-Source: AKy350a7DLDlAx2wATbxYZ+yV4+OnJfCSexEHHMxv0+zsfQNpGxjvujPBQwRFlw396afIThPkSlLDg==
X-Received: by 2002:a05:6512:118d:b0:4eb:2b62:134f with SMTP id g13-20020a056512118d00b004eb2b62134fmr4661753lfr.16.1680601391634;
        Tue, 04 Apr 2023 02:43:11 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id l25-20020a19c219000000b004eb258f73a9sm2218443lfc.163.2023.04.04.02.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 02:43:11 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 04 Apr 2023 11:43:04 +0200
Subject: [PATCH 2/9] pinctrl: nsp: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230403-immutable-irqchips-v1-2-503788a7f6e6@linaro.org>
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
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
index 3c792bf03bda..5045a7e57f1d 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
@@ -60,7 +60,6 @@ struct nsp_gpio {
 	struct device *dev;
 	void __iomem *base;
 	void __iomem *io_ctrl;
-	struct irq_chip irqchip;
 	struct gpio_chip gc;
 	struct pinctrl_dev *pctl;
 	struct pinctrl_desc pctldesc;
@@ -193,6 +192,7 @@ static void nsp_gpio_irq_mask(struct irq_data *d)
 	raw_spin_lock_irqsave(&chip->lock, flags);
 	nsp_gpio_irq_set_mask(d, false);
 	raw_spin_unlock_irqrestore(&chip->lock, flags);
+	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
 }
 
 static void nsp_gpio_irq_unmask(struct irq_data *d)
@@ -201,6 +201,7 @@ static void nsp_gpio_irq_unmask(struct irq_data *d)
 	struct nsp_gpio *chip = gpiochip_get_data(gc);
 	unsigned long flags;
 
+	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
 	raw_spin_lock_irqsave(&chip->lock, flags);
 	nsp_gpio_irq_set_mask(d, true);
 	raw_spin_unlock_irqrestore(&chip->lock, flags);
@@ -258,6 +259,16 @@ static int nsp_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	return 0;
 }
 
+static const struct irq_chip nsp_gpio_irq_chip = {
+	.name = "gpio-a",
+	.irq_ack = nsp_gpio_irq_ack,
+	.irq_mask = nsp_gpio_irq_mask,
+	.irq_unmask = nsp_gpio_irq_unmask,
+	.irq_set_type = nsp_gpio_irq_set_type,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int nsp_gpio_direction_input(struct gpio_chip *gc, unsigned gpio)
 {
 	struct nsp_gpio *chip = gpiochip_get_data(gc);
@@ -650,14 +661,6 @@ static int nsp_gpio_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq > 0) {
 		struct gpio_irq_chip *girq;
-		struct irq_chip *irqc;
-
-		irqc = &chip->irqchip;
-		irqc->name = "gpio-a";
-		irqc->irq_ack = nsp_gpio_irq_ack;
-		irqc->irq_mask = nsp_gpio_irq_mask;
-		irqc->irq_unmask = nsp_gpio_irq_unmask;
-		irqc->irq_set_type = nsp_gpio_irq_set_type;
 
 		val = readl(chip->base + NSP_CHIP_A_INT_MASK);
 		val = val | NSP_CHIP_A_GPIO_INT_BIT;
@@ -673,7 +676,7 @@ static int nsp_gpio_probe(struct platform_device *pdev)
 		}
 
 		girq = &chip->gc.irq;
-		girq->chip = irqc;
+		gpio_irq_chip_set_chip(girq, &nsp_gpio_irq_chip);
 		/* This will let us handle the parent IRQ in the driver */
 		girq->parent_handler = NULL;
 		girq->num_parents = 0;

-- 
2.34.1

