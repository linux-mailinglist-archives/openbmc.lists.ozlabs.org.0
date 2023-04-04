Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA81C6D5C57
	for <lists+openbmc@lfdr.de>; Tue,  4 Apr 2023 11:50:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrNL84x0Rz30Bp
	for <lists+openbmc@lfdr.de>; Tue,  4 Apr 2023 19:50:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=soPMTVlc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=soPMTVlc;
	dkim-atps=neutral
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrN9j2gFdz3cJK
	for <openbmc@lists.ozlabs.org>; Tue,  4 Apr 2023 19:43:21 +1000 (AEST)
Received: by mail-lf1-x134.google.com with SMTP id k37so41666135lfv.0
        for <openbmc@lists.ozlabs.org>; Tue, 04 Apr 2023 02:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680601398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qbp5jveZuzO4r+Wb5Hve1cqOR9sHInUuZ3dFCFmIV6M=;
        b=soPMTVlcwLFSs/PtZ3xuloR1YprIJgq5gnITeQFsZZ0gFh8y81eUPT66DmPN1Ioph6
         ZwBOqwfx8CdK8ca/r3w2gNgIfi7tQzoVbuAxkFg+uo2Nc+DhRNA0cXXo7zQ52ILg8+/E
         aW2LqJCckiXThRcvxfrV7Tz6wakK5dDXqbUs8y/zAtswTW/RqkLtPIYxRnB9UB/pn/6+
         KHGGIZL0443cRzjzYCB2w4rkdnWVZbBLVpmf75qQRKZKjj4X1sj4F38KWomG9kk6HhDs
         eJdX8+4RaBVDgo4D21ZXyn84AYqQoCxu+fksVURS7Up9i008GG19+MEL9NjwDsVc8me3
         clVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680601398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbp5jveZuzO4r+Wb5Hve1cqOR9sHInUuZ3dFCFmIV6M=;
        b=31PViu9KnG4btEMV+IC0Nf9y/I+OxBWFdjRn/Qw5Ms3/fqPnJ/klFIndtOIFYXoLQe
         K6Gf22YiDYzJG8M/nM32wKBaQdAe6tVX32Rrdhv57jg4yyXhdK00qDhmvLMsBn8r9CNy
         MV0dh6qTM6tP9pC4cTmgG0mXW9+7P0+e95ShzHM4MV51u9Vxoip0fGMCzZjncwU6uPjE
         7ElN2fVqnEVinMm510IRq6JSRzSEG0q1GAGn6ZD/SxRX1yTlV/aLpiz+KZjiI8h/DFUd
         g+V+98REETPUu4NO5t48K5kdOjkHL0QVg3bX2Q3wriefePatrEO6yyw/nRpPY7iDljlE
         s2mg==
X-Gm-Message-State: AAQBX9eaAbvdZfAIQkJgdb+6xyed/UBFd/ZgnQraM5/ffj6mi8kYoeBf
	dwW3ZTEFDzEsvhB55xpnPZwuyg==
X-Google-Smtp-Source: AKy350aaSf2WBwWmJ44plhwCi9IO+IsKnfCj7W2KXi50QhxuaoXCfqADvAQkBEz1VIBbYXmZlXoj7Q==
X-Received: by 2002:ac2:424d:0:b0:4d8:71dd:5c5e with SMTP id m13-20020ac2424d000000b004d871dd5c5emr409630lfl.37.1680601398122;
        Tue, 04 Apr 2023 02:43:18 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id l25-20020a19c219000000b004eb258f73a9sm2218443lfc.163.2023.04.04.02.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 02:43:17 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 04 Apr 2023 11:43:10 +0200
Subject: [PATCH 8/9] pinctrl: stmfx: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230403-immutable-irqchips-v1-8-503788a7f6e6@linaro.org>
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

This driver rolls it's own resource handling and does not
use GPIOCHIP_IRQ_RESOURCE_HELPERS.

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-stmfx.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index 1181c4b506b1..eba7d8d9c753 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -85,7 +85,6 @@ struct stmfx_pinctrl {
 	struct pinctrl_dev *pctl_dev;
 	struct pinctrl_desc pctl_desc;
 	struct gpio_chip gpio_chip;
-	struct irq_chip irq_chip;
 	struct mutex lock; /* IRQ bus lock */
 	unsigned long gpio_valid_mask;
 	/* Cache of IRQ_GPI_* registers for bus_lock */
@@ -427,6 +426,7 @@ static void stmfx_pinctrl_irq_mask(struct irq_data *data)
 	u32 mask = get_mask(data->hwirq);
 
 	pctl->irq_gpi_src[reg] &= ~mask;
+	gpiochip_disable_irq(gpio_chip, irqd_to_hwirq(data));
 }
 
 static void stmfx_pinctrl_irq_unmask(struct irq_data *data)
@@ -436,6 +436,7 @@ static void stmfx_pinctrl_irq_unmask(struct irq_data *data)
 	u32 reg = get_reg(data->hwirq);
 	u32 mask = get_mask(data->hwirq);
 
+	gpiochip_enable_irq(gpio_chip, irqd_to_hwirq(data));
 	pctl->irq_gpi_src[reg] |= mask;
 }
 
@@ -592,6 +593,26 @@ static irqreturn_t stmfx_pinctrl_irq_thread_fn(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static void stmfx_pinctrl_irq_print_chip(struct irq_data *d, struct seq_file *p)
+{
+	struct gpio_chip *gpio_chip = irq_data_get_irq_chip_data(d);
+	struct stmfx_pinctrl *pctl = gpiochip_get_data(gpio_chip);
+
+	seq_printf(p, dev_name(pctl->dev));
+}
+
+static const struct irq_chip stmfx_pinctrl_irq_chip = {
+	.irq_mask = stmfx_pinctrl_irq_mask,
+	.irq_unmask = stmfx_pinctrl_irq_unmask,
+	.irq_set_type = stmfx_pinctrl_irq_set_type,
+	.irq_bus_lock = stmfx_pinctrl_irq_bus_lock,
+	.irq_bus_sync_unlock = stmfx_pinctrl_irq_bus_sync_unlock,
+	.irq_request_resources = stmfx_gpio_irq_request_resources,
+	.irq_release_resources = stmfx_gpio_irq_release_resources,
+	.irq_print_chip = stmfx_pinctrl_irq_print_chip,
+	.flags = IRQCHIP_IMMUTABLE,
+};
+
 static int stmfx_pinctrl_gpio_function_enable(struct stmfx_pinctrl *pctl)
 {
 	struct pinctrl_gpio_range *gpio_range;
@@ -678,17 +699,8 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
 	pctl->gpio_chip.ngpio = pctl->pctl_desc.npins;
 	pctl->gpio_chip.can_sleep = true;
 
-	pctl->irq_chip.name = dev_name(pctl->dev);
-	pctl->irq_chip.irq_mask = stmfx_pinctrl_irq_mask;
-	pctl->irq_chip.irq_unmask = stmfx_pinctrl_irq_unmask;
-	pctl->irq_chip.irq_set_type = stmfx_pinctrl_irq_set_type;
-	pctl->irq_chip.irq_bus_lock = stmfx_pinctrl_irq_bus_lock;
-	pctl->irq_chip.irq_bus_sync_unlock = stmfx_pinctrl_irq_bus_sync_unlock;
-	pctl->irq_chip.irq_request_resources = stmfx_gpio_irq_request_resources;
-	pctl->irq_chip.irq_release_resources = stmfx_gpio_irq_release_resources;
-
 	girq = &pctl->gpio_chip.irq;
-	girq->chip = &pctl->irq_chip;
+	gpio_irq_chip_set_chip(girq, &stmfx_pinctrl_irq_chip);
 	/* This will let us handle the parent IRQ in the driver */
 	girq->parent_handler = NULL;
 	girq->num_parents = 0;
@@ -710,7 +722,7 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
 	ret = devm_request_threaded_irq(pctl->dev, irq, NULL,
 					stmfx_pinctrl_irq_thread_fn,
 					IRQF_ONESHOT,
-					pctl->irq_chip.name, pctl);
+					dev_name(pctl->dev), pctl);
 	if (ret) {
 		dev_err(pctl->dev, "cannot request irq%d\n", irq);
 		return ret;

-- 
2.34.1

