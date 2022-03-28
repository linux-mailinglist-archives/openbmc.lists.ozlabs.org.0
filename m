Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A83604E9406
	for <lists+openbmc@lfdr.de>; Mon, 28 Mar 2022 13:24:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRr233p9fz3c2K
	for <lists+openbmc@lfdr.de>; Mon, 28 Mar 2022 22:24:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OU6x7Wns;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=sashal@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OU6x7Wns; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRr1R1bFFz3c1X
 for <openbmc@lists.ozlabs.org>; Mon, 28 Mar 2022 22:23:55 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E0E8DB81059;
 Mon, 28 Mar 2022 11:23:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F339C340ED;
 Mon, 28 Mar 2022 11:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648466632;
 bh=HsY3DRjCKJW8f2PgxoHQHpP1seqO9d0yvMdx77Gtv/o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OU6x7WnsQphFlY4lZ3nbB0ZsiwAxavCA+hItLXp5zQxkxlE+TJq5WTD4mPnkZVu1S
 kniqSiV6a1DzA37e10pLqcVmeSe70pLeG6QgydDeHMWnhpdP8p3AhjyuoNlgZUoxeU
 YNEC0ummmC794UY5N1GOGT6U5VynzuZDvhD+rWTsSp29VDvzqELpQieHkpBuk4lSqZ
 NwIb5xdPfvFb+7SzPZcppKUIFPdvVzfS+v4997fMu+d9JVjJXMidI4v3HM75OQdPPz
 HeqdANqzpnPRrddW1kIm1au1IutiyB98gbZ1u6/Ea9NCW0xptXpyeWse7GaDibaRmq
 cO3q+Lh+DBdfA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 03/16] pinctrl: npcm: Fix broken references to
 chip->parent_device
Date: Mon, 28 Mar 2022 07:23:32 -0400
Message-Id: <20220328112345.1556601-3-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220328112345.1556601-1-sashal@kernel.org>
References: <20220328112345.1556601-1-sashal@kernel.org>
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
index 17f909d8b63a..e7dc97e099f2 100644
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

