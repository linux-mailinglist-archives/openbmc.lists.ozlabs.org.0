Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6696D5C53
	for <lists+openbmc@lfdr.de>; Tue,  4 Apr 2023 11:48:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrNJ91t0Yz3cMy
	for <lists+openbmc@lfdr.de>; Tue,  4 Apr 2023 19:48:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WULO+ov5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WULO+ov5;
	dkim-atps=neutral
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrN9g4XSXz3cJK
	for <openbmc@lists.ozlabs.org>; Tue,  4 Apr 2023 19:43:19 +1000 (AEST)
Received: by mail-lf1-x134.google.com with SMTP id h11so34640031lfu.8
        for <openbmc@lists.ozlabs.org>; Tue, 04 Apr 2023 02:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680601396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZI0FMzsrAMmwpsYMT9sQehFdyel4tmSQAHLWGYELRs8=;
        b=WULO+ov5ZvN0aMdbSFLuRHF9Hg/nArG1Z86PpBV0FmeBEfJHhwhWpuirvHLQEj8yX1
         s6e2TO5fbOL42dXzptwaOszI/zOBZmLNSA+QEekdE2WUaTmO8cFjGrv4Lj0ry4sBrTaj
         TC0yQsgT2ENf3XxEPrPOZnXWAbkyzVhTcICME/O6u0W2JxdrY+BIXdqibYNnQpsAoKBV
         ocjTbmDv0t4TAa/xwGJKuJuP0/Whyp4sRVtOLTZSuQH+vpdkQErWF5wGTP6cwhXjn0CP
         3l5Gdryn9atZ9gPxMUIYgD/kql2Jdu76PrZmSX360TsFPr0iLD45f6PLc7wfvquKEquX
         5AxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680601396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZI0FMzsrAMmwpsYMT9sQehFdyel4tmSQAHLWGYELRs8=;
        b=TELZfl57RcRfqZ+MKrwmzMihFVHd5A67Br7r3qLPNzG3XVmWETI2jW6e6ECKygqG7f
         v6LzZXLzHPRVWWh0aSvZTHvxY9V3oAsl8Apzy7GyxdxyrO8w2IC4hlGff0q+KmBnXQ3W
         ejMUy3S/OQkH4JwVR/eEaplj1eSkj3EnIlaloa56Wre7bHMIpWPQCwhqzIerc9srT6cP
         K0ilGvA0+tpTQEn5XERO+p3zANx8r5riA8mLuQ6JK6ABzJU8A7RqqF+x75SpyDC+GY2T
         pcIj00dHunvhBlLW82Q7+WevzIldnhCGAtfM+fyfrDKjCRHvXmR6S84WGRR8pSTN5MTc
         dI/w==
X-Gm-Message-State: AAQBX9dkkDarBgs4T7g5u1+LcNHRS43bqQHmBiXRHJXOmA3sm6I7e5+1
	Rlk2ZF3G3IKOQZ+fVn9xDAhTVQ==
X-Google-Smtp-Source: AKy350Z2HFJtQJta6/+neaHmwGqoNe/plLSFJpnmh0+koaTH205JmdH3/LyK+YRNYhtTGY9axiebiA==
X-Received: by 2002:a05:6512:32ab:b0:4db:971:82cd with SMTP id q11-20020a05651232ab00b004db097182cdmr5913134lfe.17.1680601395927;
        Tue, 04 Apr 2023 02:43:15 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id l25-20020a19c219000000b004eb258f73a9sm2218443lfc.163.2023.04.04.02.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 02:43:15 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 04 Apr 2023 11:43:08 +0200
Subject: [PATCH 6/9] pinctrl: mcp23s08: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230403-immutable-irqchips-v1-6-503788a7f6e6@linaro.org>
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

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 36 ++++++++++++++++++++++++++----------
 drivers/pinctrl/pinctrl-mcp23s08.h |  1 -
 2 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 5f356edfd0fd..7b7764c04327 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -10,6 +10,7 @@
 #include <linux/export.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/consumer.h>
+#include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <asm/byteorder.h>
 #include <linux/interrupt.h>
@@ -436,17 +437,19 @@ static void mcp23s08_irq_mask(struct irq_data *data)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct mcp23s08 *mcp = gpiochip_get_data(gc);
-	unsigned int pos = data->hwirq;
+	unsigned int pos = irqd_to_hwirq(data);
 
 	mcp_set_bit(mcp, MCP_GPINTEN, pos, false);
+	gpiochip_disable_irq(gc, pos);
 }
 
 static void mcp23s08_irq_unmask(struct irq_data *data)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct mcp23s08 *mcp = gpiochip_get_data(gc);
-	unsigned int pos = data->hwirq;
+	unsigned int pos = irqd_to_hwirq(data);
 
+	gpiochip_enable_irq(gc, pos);
 	mcp_set_bit(mcp, MCP_GPINTEN, pos, true);
 }
 
@@ -454,7 +457,7 @@ static int mcp23s08_irq_set_type(struct irq_data *data, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct mcp23s08 *mcp = gpiochip_get_data(gc);
-	unsigned int pos = data->hwirq;
+	unsigned int pos = irqd_to_hwirq(data);
 
 	if ((type & IRQ_TYPE_EDGE_BOTH) == IRQ_TYPE_EDGE_BOTH) {
 		mcp_set_bit(mcp, MCP_INTCON, pos, false);
@@ -523,6 +526,25 @@ static int mcp23s08_irq_setup(struct mcp23s08 *mcp)
 	return 0;
 }
 
+static void mcp23s08_irq_print_chip(struct irq_data *d, struct seq_file *p)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct mcp23s08 *mcp = gpiochip_get_data(gc);
+
+	seq_printf(p, dev_name(mcp->dev));
+}
+
+static const struct irq_chip mcp23s08_irq_chip = {
+	.irq_mask = mcp23s08_irq_mask,
+	.irq_unmask = mcp23s08_irq_unmask,
+	.irq_set_type = mcp23s08_irq_set_type,
+	.irq_bus_lock = mcp23s08_irq_bus_lock,
+	.irq_bus_sync_unlock = mcp23s08_irq_bus_unlock,
+	.irq_print_chip = mcp23s08_irq_print_chip,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 /*----------------------------------------------------------------------*/
 
 int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
@@ -538,12 +560,6 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	mcp->addr = addr;
 
 	mcp->irq_active_high = false;
-	mcp->irq_chip.name = dev_name(dev);
-	mcp->irq_chip.irq_mask = mcp23s08_irq_mask;
-	mcp->irq_chip.irq_unmask = mcp23s08_irq_unmask;
-	mcp->irq_chip.irq_set_type = mcp23s08_irq_set_type;
-	mcp->irq_chip.irq_bus_lock = mcp23s08_irq_bus_lock;
-	mcp->irq_chip.irq_bus_sync_unlock = mcp23s08_irq_bus_unlock;
 
 	mcp->chip.direction_input = mcp23s08_direction_input;
 	mcp->chip.get = mcp23s08_get;
@@ -603,7 +619,7 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	if (mcp->irq && mcp->irq_controller) {
 		struct gpio_irq_chip *girq = &mcp->chip.irq;
 
-		girq->chip = &mcp->irq_chip;
+		gpio_irq_chip_set_chip(girq, &mcp23s08_irq_chip);
 		/* This will let us handle the parent IRQ in the driver */
 		girq->parent_handler = NULL;
 		girq->num_parents = 0;
diff --git a/drivers/pinctrl/pinctrl-mcp23s08.h b/drivers/pinctrl/pinctrl-mcp23s08.h
index b8d15939e0c2..b15516af7783 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.h
+++ b/drivers/pinctrl/pinctrl-mcp23s08.h
@@ -36,7 +36,6 @@ struct mcp23s08 {
 	struct mutex		lock;
 
 	struct gpio_chip	chip;
-	struct irq_chip		irq_chip;
 
 	struct regmap		*regmap;
 	struct device		*dev;

-- 
2.34.1

