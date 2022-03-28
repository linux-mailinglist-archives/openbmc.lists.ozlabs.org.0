Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 886CC4E9359
	for <lists+openbmc@lfdr.de>; Mon, 28 Mar 2022 13:20:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRqxn3b5hz3073
	for <lists+openbmc@lfdr.de>; Mon, 28 Mar 2022 22:20:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=k3ICO+WN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=k3ICO+WN; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRqxQ5dgDz2x9S
 for <openbmc@lists.ozlabs.org>; Mon, 28 Mar 2022 22:20:26 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EE4E4611B5;
 Mon, 28 Mar 2022 11:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0391C34110;
 Mon, 28 Mar 2022 11:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648466422;
 bh=GtXm7TP4FiF7Hh17CXHOhSXHFwXsRaUDFmn/WhLxqg0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k3ICO+WNoa5yijS2fSjs0ArYy2OCgkRbKKJFFcNE6P9MqBjJzids26ouXDz6FCEvg
 HOUYx6HkrTjzwiNgUpOFAj9YPPJ+DTSMw4zhfO6KjRSw+IGWOvIxULUwtb1QXSRgi9
 wly/ouONedlBzDjIk0dzMawP/8L2Qn7syKc2xIUxsfLyBqfqj33pSkq2l1SG6CN8Th
 pIgh2D/FD4gHNDUbvY2zORlSQvdY1SydfEG4MowF8KKsp+qAiirJO8Ce7ldHGTGgpl
 cJc0fRjVmyDwav68Y2xeoZ1LEc5o879Cy8jQCpgE83qrjbtDqO2cVnf1LgHUUSH9A/
 W4YRwu2bq0mNA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 06/35] pinctrl: npcm: Fix broken references to
 chip->parent_device
Date: Mon, 28 Mar 2022 07:19:42 -0400
Message-Id: <20220328112011.1555169-6-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220328112011.1555169-1-sashal@kernel.org>
References: <20220328112011.1555169-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, tmaimon77@gmail.com,
 avifishman70@gmail.com, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, openbmc@lists.ozlabs.org,
 tali.perry1@gmail.com, linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Marc Zyngier <maz@kernel.org>

[ Upstream commit f7e53e2255808ca3abcc8f38d18ad0823425e771 ]

The npcm driver has a bunch of references to the irq_chip parent_device
field, but never sets it.

Fix it by fishing that reference from somewhere else, but it is
obvious that these debug statements were never used. Also remove
an unused field in a local data structure.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>
Link: https://lore.kernel.org/r/20220201120310.878267-11-maz@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 25 +++++++++++------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 4d81908d6725..ba536fd4d674 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -78,7 +78,6 @@ struct npcm7xx_gpio {
 	struct gpio_chip	gc;
 	int			irqbase;
 	int			irq;
-	void			*priv;
 	struct irq_chip		irq_chip;
 	u32			pinctrl_id;
 	int (*direction_input)(struct gpio_chip *chip, unsigned offset);
@@ -226,7 +225,7 @@ static void npcmgpio_irq_handler(struct irq_desc *desc)
 	chained_irq_enter(chip, desc);
 	sts = ioread32(bank->base + NPCM7XX_GP_N_EVST);
 	en  = ioread32(bank->base + NPCM7XX_GP_N_EVEN);
-	dev_dbg(chip->parent_device, "==> got irq sts %.8x %.8x\n", sts,
+	dev_dbg(bank->gc.parent, "==> got irq sts %.8x %.8x\n", sts,
 		en);
 
 	sts &= en;
@@ -241,33 +240,33 @@ static int npcmgpio_set_irq_type(struct irq_data *d, unsigned int type)
 		gpiochip_get_data(irq_data_get_irq_chip_data(d));
 	unsigned int gpio = BIT(d->hwirq);
 
-	dev_dbg(d->chip->parent_device, "setirqtype: %u.%u = %u\n", gpio,
+	dev_dbg(bank->gc.parent, "setirqtype: %u.%u = %u\n", gpio,
 		d->irq, type);
 	switch (type) {
 	case IRQ_TYPE_EDGE_RISING:
-		dev_dbg(d->chip->parent_device, "edge.rising\n");
+		dev_dbg(bank->gc.parent, "edge.rising\n");
 		npcm_gpio_clr(&bank->gc, bank->base + NPCM7XX_GP_N_EVBE, gpio);
 		npcm_gpio_clr(&bank->gc, bank->base + NPCM7XX_GP_N_POL, gpio);
 		break;
 	case IRQ_TYPE_EDGE_FALLING:
-		dev_dbg(d->chip->parent_device, "edge.falling\n");
+		dev_dbg(bank->gc.parent, "edge.falling\n");
 		npcm_gpio_clr(&bank->gc, bank->base + NPCM7XX_GP_N_EVBE, gpio);
 		npcm_gpio_set(&bank->gc, bank->base + NPCM7XX_GP_N_POL, gpio);
 		break;
 	case IRQ_TYPE_EDGE_BOTH:
-		dev_dbg(d->chip->parent_device, "edge.both\n");
+		dev_dbg(bank->gc.parent, "edge.both\n");
 		npcm_gpio_set(&bank->gc, bank->base + NPCM7XX_GP_N_EVBE, gpio);
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
-		dev_dbg(d->chip->parent_device, "level.low\n");
+		dev_dbg(bank->gc.parent, "level.low\n");
 		npcm_gpio_set(&bank->gc, bank->base + NPCM7XX_GP_N_POL, gpio);
 		break;
 	case IRQ_TYPE_LEVEL_HIGH:
-		dev_dbg(d->chip->parent_device, "level.high\n");
+		dev_dbg(bank->gc.parent, "level.high\n");
 		npcm_gpio_clr(&bank->gc, bank->base + NPCM7XX_GP_N_POL, gpio);
 		break;
 	default:
-		dev_dbg(d->chip->parent_device, "invalid irq type\n");
+		dev_dbg(bank->gc.parent, "invalid irq type\n");
 		return -EINVAL;
 	}
 
@@ -289,7 +288,7 @@ static void npcmgpio_irq_ack(struct irq_data *d)
 		gpiochip_get_data(irq_data_get_irq_chip_data(d));
 	unsigned int gpio = d->hwirq;
 
-	dev_dbg(d->chip->parent_device, "irq_ack: %u.%u\n", gpio, d->irq);
+	dev_dbg(bank->gc.parent, "irq_ack: %u.%u\n", gpio, d->irq);
 	iowrite32(BIT(gpio), bank->base + NPCM7XX_GP_N_EVST);
 }
 
@@ -301,7 +300,7 @@ static void npcmgpio_irq_mask(struct irq_data *d)
 	unsigned int gpio = d->hwirq;
 
 	/* Clear events */
-	dev_dbg(d->chip->parent_device, "irq_mask: %u.%u\n", gpio, d->irq);
+	dev_dbg(bank->gc.parent, "irq_mask: %u.%u\n", gpio, d->irq);
 	iowrite32(BIT(gpio), bank->base + NPCM7XX_GP_N_EVENC);
 }
 
@@ -313,7 +312,7 @@ static void npcmgpio_irq_unmask(struct irq_data *d)
 	unsigned int gpio = d->hwirq;
 
 	/* Enable events */
-	dev_dbg(d->chip->parent_device, "irq_unmask: %u.%u\n", gpio, d->irq);
+	dev_dbg(bank->gc.parent, "irq_unmask: %u.%u\n", gpio, d->irq);
 	iowrite32(BIT(gpio), bank->base + NPCM7XX_GP_N_EVENS);
 }
 
@@ -323,7 +322,7 @@ static unsigned int npcmgpio_irq_startup(struct irq_data *d)
 	unsigned int gpio = d->hwirq;
 
 	/* active-high, input, clear interrupt, enable interrupt */
-	dev_dbg(d->chip->parent_device, "startup: %u.%u\n", gpio, d->irq);
+	dev_dbg(gc->parent, "startup: %u.%u\n", gpio, d->irq);
 	npcmgpio_direction_input(gc, gpio);
 	npcmgpio_irq_ack(d);
 	npcmgpio_irq_unmask(d);
-- 
2.34.1

