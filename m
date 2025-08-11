Return-Path: <openbmc+bounces-427-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78ADDB20CDB
	for <lists+openbmc@lfdr.de>; Mon, 11 Aug 2025 17:02:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c0yXq2LKxz3d9t;
	Tue, 12 Aug 2025 01:02:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754924539;
	cv=none; b=XJrGVeAnXdecmXAslI42K5mPN65iLL9zCmmNeQysiBojMB1EVUEyaV8XcrUXCcoAyxptTgnszoEm1DeDK+RsJ8ZNHK9XJmHbm5/Kx1I1TfFiwii54oAaLaWd27dSNqZI/DHvGCSvGxfvSPO1+7nmhx/1MvLrrj7QloJIZxao3iPyYbjTSLWhnb7/dZBy8cXSBup1NV7wVhsQ3q8uAKANiHaNDqIXSm1BnLtcEMJ03Xfx0OFap/50uskhex3/faJtXjRSritY2yztskpTCUvmrT+N43hXbyZo/gSv73JNysAKIQWSSg/Fx0a42+EicFD694kZMohqmwNZjXFmnUbx7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754924539; c=relaxed/relaxed;
	bh=8ByyWaTXTyJrckg8cOfuMo8GOaUzuD+Yig9XtQDp6Ro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ivSntuXIHybQGM4QnhLEM5qPtVY6tKnOInJ5pFQtI6qf9ZdgJPI5nocinJe7tk+0tVvZGb3PJM500ne7rOWSPc5C4ZHZ8ixusKY/kX4n26l6NSX7HV4u7SqiJbD6v5ftkm9y9GhsyExwJCBLXn8FvfOV1PCWuqMoKtuCiBAOlibgbzIbZEna6QK/AXL4B0Nxu6byt+jat+Jg6T75HAvDkOWS6w5shCOzZoxjRzJGF7VOJjaQvhMQyOnvjP/NoOJWSkL639rp5pSlRU/a/VX18KQRsxtphsjVtDfleFvcKQj/O6scJDyB2PojrDlT9up6Y5Dd8V1E6QhP+NaOY3fJoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=oZCqJv2j; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=oZCqJv2j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c0yXm0LHLz3d89
	for <openbmc@lists.ozlabs.org>; Tue, 12 Aug 2025 01:02:15 +1000 (AEST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45994a72356so35537175e9.0
        for <openbmc@lists.ozlabs.org>; Mon, 11 Aug 2025 08:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754924533; x=1755529333; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ByyWaTXTyJrckg8cOfuMo8GOaUzuD+Yig9XtQDp6Ro=;
        b=oZCqJv2jH360yG1YY40eUzrou5RC5zKwhTLFAKBIRpjmWKZ5qSYPk+a6OzXBkNnyFA
         EL4Yb2jV697hNxGUofn9NoFXJBU0KC1ps+ypAdVqo4uui9JP4T7P5P5nVdeVgJlsimBY
         S8VEV0LVVs2LUUbGy0ZCgINf3ZtRz4aaO1jP7iQMDbHnWE5PdvIbljZyW8yzMHF7H00R
         w3i2biDgzoCHrkjqz6FGGF6TZECFBr2m60rGWW5P5ici9K1js5/wSeKdSOGSuHT3VBdb
         aHv714VsIlpR3LMIidc/BUFVovgAXV1ZmC7fso69edtTs55XTTfQHrE4XO5VGKk8PKID
         OwBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754924533; x=1755529333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ByyWaTXTyJrckg8cOfuMo8GOaUzuD+Yig9XtQDp6Ro=;
        b=iNkh6cwQArnY3jSh864EV+5x2bOcrA2EufUMDKEN+Wbyxh6KaykJeUwBbRVQELrGhH
         rAjBvu2Y74dPyRzVsvo19uJO25rQEQ9KlC2sYr4tFdOBr323UqipOb+MAAQ88rHRUIMR
         6gmG147tfsp+7RWTFuGCt6RKrenIvYvGQl+bl/I5V/NGQo3yV/KpCg8FubASWOEGz4vf
         iKh6nvrraOGc0ND40Pxd9mJ7k6c2cZ9ivCn9Hyg6vzn4OgM3lvebdxtoyOVxvenfOWqb
         q6THgV9nMu2ukiXmZ7bt5dJKJuajytIYfZbVWtEZ2vLYJHrffqVcIMu66ghqKNBoJqwh
         +xBA==
X-Forwarded-Encrypted: i=1; AJvYcCUAHTf5jnjDIaZmqP7Iu5o3RhE3N/HZM7q3l8C7IwfrNbmhY4Q0hx1f9W8coo81p1MMJ1ZyYaDt@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywa0pcuLKFz1M8c4gu1ly4n+GXbNbUY/j3YXjh96KkO7mpRCf0v
	+bvY47Y4nvW+ZjJnqKPU1vIRgqstmPpsBYe7yj2O3N3PCf2TxZ5Pwdz+6Wget6A4xdE=
X-Gm-Gg: ASbGnctU5TsoGb4NdYT5GU7Tg2W15s1PJ5yZXURkRjRcCy7eGgcl/fNZ6TnDzdb8ZJM
	4VnN0dQePQhkG5yvCURFZyRj6dxtC5UYutvmaZ2Qenkxo3xgBhZpvQcheKAPIa+jjA4wDuMgRZJ
	PLrZBLh4qtispJWxB2ZYq1Cn/yK1xQvntAJu/KbccYKQempWDlDjHEr/N25KkWiY9tLmB7KXZ6Z
	+aJWRpm2zCUW2sJMQH9NmRZw5m9MvKv6ZNzPcNf21CJbtGNSosxpLIchjoy7iEppMeyW/loxClb
	O9PQ9avadoSCUWWjdXughYh/an22rjlaNQZz8L8BV7EFv4hwjqY4TmPSjdYuAbJq4wK8L2R7AR6
	TqrQzxWyKW2TzT1eGFy9bnRYzOCA=
X-Google-Smtp-Source: AGHT+IG98jVPofl4wprxoCs8/tFHz5fzJRjh8wYTClXnDHRT8UgVJn2uumhMmWY1kRfUQCXeD2vyzQ==
X-Received: by 2002:a05:600c:198f:b0:456:1157:59ac with SMTP id 5b1f17b1804b1-45a109e7dd2mr1677105e9.7.1754924532739;
        Mon, 11 Aug 2025 08:02:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6841:8926:4410:c880])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459eff7918csm192649605e9.25.2025.08.11.08.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:02:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 11 Aug 2025 17:02:03 +0200
Subject: [PATCH 4/5] pinctrl: npcm7xx: use new generic GPIO chip API
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-gpio-mmio-pinctrl-conv-v1-4-a84c5da2be20@linaro.org>
References: <20250811-gpio-mmio-pinctrl-conv-v1-0-a84c5da2be20@linaro.org>
In-Reply-To: <20250811-gpio-mmio-pinctrl-conv-v1-0-a84c5da2be20@linaro.org>
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=18077;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=93WVHev07ZUCejCf0kwiUjBiEk+LZ3uM81qrtlfjA1c=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomgXt9uGgkd1OHHiFLtiWvcvXtAI++KwFXdCp/
 sVjM553Kz+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJoF7QAKCRARpy6gFHHX
 chD/D/9rJHkDt6S5t6Idxvl9LC8QPYwKbx+60eh9SkD0/KLgzkqZfMUHQ0LTAonLIvBr2+UNIgT
 z3FLmgmzByTGWH+REzVoPuSgjRhUwpxCrifYM7HmGXqTlp5BVG98zN9gSLnTCFmdjlQqdHvKet+
 x0x8SnUXKki+T9qpR5604goxP2IxT3RanF9OyL45Bc7n7m4G1JrozglXRNzuf5CRFuMqpThkPMR
 4BX1FeNX8rOphXVf+qX54WuZd2B0YRY2xBpZYe0vPKPwa984fDP4+7AmomzZXDyqtsRNGSixEtQ
 EtD6CiTM+E3/35yZ1kOb5eAXvgWSbU4Ynr6pfjMBJcTRE2j8bt0ilxKLn7eD+Y3qJF/QMoKMw6v
 U35RJAyBYt98bMe2NB3LW4zhENse7o3fNrdTDimBrkRNnA7No7Wd0d/r+gMyFHWml2+CBnQY/cO
 YUVwnYNYA07BmPrP3eZZg7nHCsabM2WDLbP+3DNYH+8qX5YAGshu14Onn2GZkUvAnripMEBkE9Q
 Ai3mzdnYlsanmqFD9lCpS1cX8ci44iYUXgMRilfm20a0tuzkYiv4AcGARa4faPWvGvU49kTHEoO
 iWeojjyFp62A/brfyTJ5K11OXroMdyzAm0EuHmmmplev6Qk/NMT3Qu1iem6blP2z3GSrSsFRYt/
 O14Dtz19cgp/qmg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 181 +++++++++++++++---------------
 1 file changed, 90 insertions(+), 91 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index b8872d8f5930ad931dad208afec4e08a23c3d653..c2ca71ebb9736d1b3043fa6626767811a67e61f2 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -4,6 +4,7 @@
 
 #include <linux/device.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/mfd/syscon.h>
@@ -77,7 +78,7 @@
 /* Structure for register banks */
 struct npcm7xx_gpio {
 	void __iomem		*base;
-	struct gpio_chip	gc;
+	struct gpio_generic_chip chip;
 	int			irqbase;
 	int			irq;
 	u32			pinctrl_id;
@@ -99,32 +100,26 @@ struct npcm7xx_pinctrl {
 };
 
 /* GPIO handling in the pinctrl driver */
-static void npcm_gpio_set(struct gpio_chip *gc, void __iomem *reg,
+static void npcm_gpio_set(struct gpio_generic_chip *chip, void __iomem *reg,
 			  unsigned int pinmask)
 {
-	unsigned long flags;
 	unsigned long val;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(chip);
 
 	val = ioread32(reg) | pinmask;
 	iowrite32(val, reg);
-
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 }
 
-static void npcm_gpio_clr(struct gpio_chip *gc, void __iomem *reg,
+static void npcm_gpio_clr(struct gpio_generic_chip *chip, void __iomem *reg,
 			  unsigned int pinmask)
 {
-	unsigned long flags;
 	unsigned long val;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(chip);
 
 	val = ioread32(reg) & ~pinmask;
 	iowrite32(val, reg);
-
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 }
 
 static void npcmgpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
@@ -132,9 +127,9 @@ static void npcmgpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	struct npcm7xx_gpio *bank = gpiochip_get_data(chip);
 
 	seq_printf(s, "-- module %d [gpio%d - %d]\n",
-		   bank->gc.base / bank->gc.ngpio,
-		   bank->gc.base,
-		   bank->gc.base + bank->gc.ngpio);
+		   bank->chip.gc.base / bank->chip.gc.ngpio,
+		   bank->chip.gc.base,
+		   bank->chip.gc.base + bank->chip.gc.ngpio);
 	seq_printf(s, "DIN :%.8x DOUT:%.8x IE  :%.8x OE	 :%.8x\n",
 		   ioread32(bank->base + NPCM7XX_GP_N_DIN),
 		   ioread32(bank->base + NPCM7XX_GP_N_DOUT),
@@ -220,7 +215,7 @@ static void npcmgpio_irq_handler(struct irq_desc *desc)
 	chained_irq_enter(chip, desc);
 	sts = ioread32(bank->base + NPCM7XX_GP_N_EVST);
 	en  = ioread32(bank->base + NPCM7XX_GP_N_EVEN);
-	dev_dbg(bank->gc.parent, "==> got irq sts %.8lx %.8lx\n", sts,
+	dev_dbg(bank->chip.gc.parent, "==> got irq sts %.8lx %.8lx\n", sts,
 		en);
 
 	sts &= en;
@@ -235,42 +230,42 @@ static int npcmgpio_set_irq_type(struct irq_data *d, unsigned int type)
 	struct npcm7xx_gpio *bank = gpiochip_get_data(gc);
 	unsigned int gpio = BIT(irqd_to_hwirq(d));
 
-	dev_dbg(bank->gc.parent, "setirqtype: %u.%u = %u\n", gpio,
+	dev_dbg(bank->chip.gc.parent, "setirqtype: %u.%u = %u\n", gpio,
 		d->irq, type);
 	switch (type) {
 	case IRQ_TYPE_EDGE_RISING:
-		dev_dbg(bank->gc.parent, "edge.rising\n");
-		npcm_gpio_clr(&bank->gc, bank->base + NPCM7XX_GP_N_EVBE, gpio);
-		npcm_gpio_clr(&bank->gc, bank->base + NPCM7XX_GP_N_POL, gpio);
+		dev_dbg(bank->chip.gc.parent, "edge.rising\n");
+		npcm_gpio_clr(&bank->chip, bank->base + NPCM7XX_GP_N_EVBE, gpio);
+		npcm_gpio_clr(&bank->chip, bank->base + NPCM7XX_GP_N_POL, gpio);
 		break;
 	case IRQ_TYPE_EDGE_FALLING:
-		dev_dbg(bank->gc.parent, "edge.falling\n");
-		npcm_gpio_clr(&bank->gc, bank->base + NPCM7XX_GP_N_EVBE, gpio);
-		npcm_gpio_set(&bank->gc, bank->base + NPCM7XX_GP_N_POL, gpio);
+		dev_dbg(bank->chip.gc.parent, "edge.falling\n");
+		npcm_gpio_clr(&bank->chip, bank->base + NPCM7XX_GP_N_EVBE, gpio);
+		npcm_gpio_set(&bank->chip, bank->base + NPCM7XX_GP_N_POL, gpio);
 		break;
 	case IRQ_TYPE_EDGE_BOTH:
-		dev_dbg(bank->gc.parent, "edge.both\n");
-		npcm_gpio_set(&bank->gc, bank->base + NPCM7XX_GP_N_EVBE, gpio);
+		dev_dbg(bank->chip.gc.parent, "edge.both\n");
+		npcm_gpio_set(&bank->chip, bank->base + NPCM7XX_GP_N_EVBE, gpio);
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
-		dev_dbg(bank->gc.parent, "level.low\n");
-		npcm_gpio_set(&bank->gc, bank->base + NPCM7XX_GP_N_POL, gpio);
+		dev_dbg(bank->chip.gc.parent, "level.low\n");
+		npcm_gpio_set(&bank->chip, bank->base + NPCM7XX_GP_N_POL, gpio);
 		break;
 	case IRQ_TYPE_LEVEL_HIGH:
-		dev_dbg(bank->gc.parent, "level.high\n");
-		npcm_gpio_clr(&bank->gc, bank->base + NPCM7XX_GP_N_POL, gpio);
+		dev_dbg(bank->chip.gc.parent, "level.high\n");
+		npcm_gpio_clr(&bank->chip, bank->base + NPCM7XX_GP_N_POL, gpio);
 		break;
 	default:
-		dev_dbg(bank->gc.parent, "invalid irq type\n");
+		dev_dbg(bank->chip.gc.parent, "invalid irq type\n");
 		return -EINVAL;
 	}
 
 	if (type & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) {
-		npcm_gpio_clr(&bank->gc, bank->base + NPCM7XX_GP_N_EVTYP, gpio);
+		npcm_gpio_clr(&bank->chip, bank->base + NPCM7XX_GP_N_EVTYP, gpio);
 		irq_set_handler_locked(d, handle_level_irq);
 	} else if (type & (IRQ_TYPE_EDGE_BOTH | IRQ_TYPE_EDGE_RISING
 			   | IRQ_TYPE_EDGE_FALLING)) {
-		npcm_gpio_set(&bank->gc, bank->base + NPCM7XX_GP_N_EVTYP, gpio);
+		npcm_gpio_set(&bank->chip, bank->base + NPCM7XX_GP_N_EVTYP, gpio);
 		irq_set_handler_locked(d, handle_edge_irq);
 	}
 
@@ -283,7 +278,7 @@ static void npcmgpio_irq_ack(struct irq_data *d)
 	struct npcm7xx_gpio *bank = gpiochip_get_data(gc);
 	unsigned int gpio = irqd_to_hwirq(d);
 
-	dev_dbg(bank->gc.parent, "irq_ack: %u.%u\n", gpio, d->irq);
+	dev_dbg(bank->chip.gc.parent, "irq_ack: %u.%u\n", gpio, d->irq);
 	iowrite32(BIT(gpio), bank->base + NPCM7XX_GP_N_EVST);
 }
 
@@ -295,7 +290,7 @@ static void npcmgpio_irq_mask(struct irq_data *d)
 	unsigned int gpio = irqd_to_hwirq(d);
 
 	/* Clear events */
-	dev_dbg(bank->gc.parent, "irq_mask: %u.%u\n", gpio, d->irq);
+	dev_dbg(bank->chip.gc.parent, "irq_mask: %u.%u\n", gpio, d->irq);
 	iowrite32(BIT(gpio), bank->base + NPCM7XX_GP_N_EVENC);
 	gpiochip_disable_irq(gc, gpio);
 }
@@ -309,7 +304,7 @@ static void npcmgpio_irq_unmask(struct irq_data *d)
 
 	/* Enable events */
 	gpiochip_enable_irq(gc, gpio);
-	dev_dbg(bank->gc.parent, "irq_unmask: %u.%u\n", gpio, d->irq);
+	dev_dbg(bank->chip.gc.parent, "irq_unmask: %u.%u\n", gpio, d->irq);
 	iowrite32(BIT(gpio), bank->base + NPCM7XX_GP_N_EVENS);
 }
 
@@ -1423,7 +1418,7 @@ static int npcm7xx_get_slew_rate(struct npcm7xx_gpio *bank,
 				 struct regmap *gcr_regmap, unsigned int pin)
 {
 	u32 val;
-	int gpio = (pin % bank->gc.ngpio);
+	int gpio = (pin % bank->chip.gc.ngpio);
 	unsigned long pinmask = BIT(gpio);
 
 	if (pincfg[pin].flag & SLEW)
@@ -1443,16 +1438,16 @@ static int npcm7xx_set_slew_rate(struct npcm7xx_gpio *bank,
 				 struct regmap *gcr_regmap, unsigned int pin,
 				 int arg)
 {
-	int gpio = BIT(pin % bank->gc.ngpio);
+	int gpio = BIT(pin % bank->chip.gc.ngpio);
 
 	if (pincfg[pin].flag & SLEW) {
 		switch (arg) {
 		case 0:
-			npcm_gpio_clr(&bank->gc, bank->base + NPCM7XX_GP_N_OSRC,
+			npcm_gpio_clr(&bank->chip, bank->base + NPCM7XX_GP_N_OSRC,
 				      gpio);
 			return 0;
 		case 1:
-			npcm_gpio_set(&bank->gc, bank->base + NPCM7XX_GP_N_OSRC,
+			npcm_gpio_set(&bank->chip, bank->base + NPCM7XX_GP_N_OSRC,
 				      gpio);
 			return 0;
 		default:
@@ -1485,7 +1480,7 @@ static int npcm7xx_get_drive_strength(struct pinctrl_dev *pctldev,
 	struct npcm7xx_pinctrl *npcm = pinctrl_dev_get_drvdata(pctldev);
 	struct npcm7xx_gpio *bank =
 		&npcm->gpio_bank[pin / NPCM7XX_GPIO_PER_BANK];
-	int gpio = (pin % bank->gc.ngpio);
+	int gpio = (pin % bank->chip.gc.ngpio);
 	unsigned long pinmask = BIT(gpio);
 	u32 ds = 0;
 	int flg, val;
@@ -1496,7 +1491,7 @@ static int npcm7xx_get_drive_strength(struct pinctrl_dev *pctldev,
 		val = ioread32(bank->base + NPCM7XX_GP_N_ODSC)
 		& pinmask;
 		ds = val ? DSHI(flg) : DSLO(flg);
-		dev_dbg(bank->gc.parent,
+		dev_dbg(bank->chip.gc.parent,
 			"pin %d strength %d = %d\n", pin, val, ds);
 		return ds;
 	}
@@ -1511,20 +1506,20 @@ static int npcm7xx_set_drive_strength(struct npcm7xx_pinctrl *npcm,
 	int v;
 	struct npcm7xx_gpio *bank =
 		&npcm->gpio_bank[pin / NPCM7XX_GPIO_PER_BANK];
-	int gpio = BIT(pin % bank->gc.ngpio);
+	int gpio = BIT(pin % bank->chip.gc.ngpio);
 
 	v = (pincfg[pin].flag & DRIVE_STRENGTH_MASK);
 	if (!nval || !v)
 		return -ENOTSUPP;
 	if (DSLO(v) == nval) {
-		dev_dbg(bank->gc.parent,
+		dev_dbg(bank->chip.gc.parent,
 			"setting pin %d to low strength [%d]\n", pin, nval);
-		npcm_gpio_clr(&bank->gc, bank->base + NPCM7XX_GP_N_ODSC, gpio);
+		npcm_gpio_clr(&bank->chip, bank->base + NPCM7XX_GP_N_ODSC, gpio);
 		return 0;
 	} else if (DSHI(v) == nval) {
-		dev_dbg(bank->gc.parent,
+		dev_dbg(bank->chip.gc.parent,
 			"setting pin %d to high strength [%d]\n", pin, nval);
-		npcm_gpio_set(&bank->gc, bank->base + NPCM7XX_GP_N_ODSC, gpio);
+		npcm_gpio_set(&bank->chip, bank->base + NPCM7XX_GP_N_ODSC, gpio);
 		return 0;
 	}
 
@@ -1657,9 +1652,9 @@ static int npcm_gpio_set_direction(struct pinctrl_dev *pctldev,
 	struct npcm7xx_pinctrl *npcm = pinctrl_dev_get_drvdata(pctldev);
 	struct npcm7xx_gpio *bank =
 		&npcm->gpio_bank[offset / NPCM7XX_GPIO_PER_BANK];
-	int gpio = BIT(offset % bank->gc.ngpio);
+	int gpio = BIT(offset % bank->chip.gc.ngpio);
 
-	dev_dbg(bank->gc.parent, "GPIO Set Direction: %d = %d\n", offset,
+	dev_dbg(bank->chip.gc.parent, "GPIO Set Direction: %d = %d\n", offset,
 		input);
 	if (input)
 		iowrite32(gpio, bank->base + NPCM7XX_GP_N_OEC);
@@ -1687,7 +1682,7 @@ static int npcm7xx_config_get(struct pinctrl_dev *pctldev, unsigned int pin,
 	struct npcm7xx_pinctrl *npcm = pinctrl_dev_get_drvdata(pctldev);
 	struct npcm7xx_gpio *bank =
 		&npcm->gpio_bank[pin / NPCM7XX_GPIO_PER_BANK];
-	int gpio = (pin % bank->gc.ngpio);
+	int gpio = (pin % bank->chip.gc.ngpio);
 	unsigned long pinmask = BIT(gpio);
 	u32 ie, oe, pu, pd;
 	int rc = 0;
@@ -1750,38 +1745,38 @@ static int npcm7xx_config_set_one(struct npcm7xx_pinctrl *npcm,
 	u16 arg = pinconf_to_config_argument(config);
 	struct npcm7xx_gpio *bank =
 		&npcm->gpio_bank[pin / NPCM7XX_GPIO_PER_BANK];
-	int gpio = BIT(pin % bank->gc.ngpio);
+	int gpio = BIT(pin % bank->chip.gc.ngpio);
 
-	dev_dbg(bank->gc.parent, "param=%d %d[GPIO]\n", param, pin);
+	dev_dbg(bank->chip.gc.parent, "param=%d %d[GPIO]\n", param, pin);
 	switch (param) {
 	case PIN_CONFIG_BIAS_DISABLE:
-		npcm_gpio_clr(&bank->gc, bank->base + NPCM7XX_GP_N_PU, gpio);
-		npcm_gpio_clr(&bank->gc, bank->base + NPCM7XX_GP_N_PD, gpio);
+		npcm_gpio_clr(&bank->chip, bank->base + NPCM7XX_GP_N_PU, gpio);
+		npcm_gpio_clr(&bank->chip, bank->base + NPCM7XX_GP_N_PD, gpio);
 		break;
 	case PIN_CONFIG_BIAS_PULL_DOWN:
-		npcm_gpio_clr(&bank->gc, bank->base + NPCM7XX_GP_N_PU, gpio);
-		npcm_gpio_set(&bank->gc, bank->base + NPCM7XX_GP_N_PD, gpio);
+		npcm_gpio_clr(&bank->chip, bank->base + NPCM7XX_GP_N_PU, gpio);
+		npcm_gpio_set(&bank->chip, bank->base + NPCM7XX_GP_N_PD, gpio);
 		break;
 	case PIN_CONFIG_BIAS_PULL_UP:
-		npcm_gpio_clr(&bank->gc, bank->base + NPCM7XX_GP_N_PD, gpio);
-		npcm_gpio_set(&bank->gc, bank->base + NPCM7XX_GP_N_PU, gpio);
+		npcm_gpio_clr(&bank->chip, bank->base + NPCM7XX_GP_N_PD, gpio);
+		npcm_gpio_set(&bank->chip, bank->base + NPCM7XX_GP_N_PU, gpio);
 		break;
 	case PIN_CONFIG_INPUT_ENABLE:
 		iowrite32(gpio, bank->base + NPCM7XX_GP_N_OEC);
-		bank->direction_input(&bank->gc, pin % bank->gc.ngpio);
+		bank->direction_input(&bank->chip.gc, pin % bank->chip.gc.ngpio);
 		break;
 	case PIN_CONFIG_OUTPUT:
-		bank->direction_output(&bank->gc, pin % bank->gc.ngpio, arg);
+		bank->direction_output(&bank->chip.gc, pin % bank->chip.gc.ngpio, arg);
 		iowrite32(gpio, bank->base + NPCM7XX_GP_N_OES);
 		break;
 	case PIN_CONFIG_DRIVE_PUSH_PULL:
-		npcm_gpio_clr(&bank->gc, bank->base + NPCM7XX_GP_N_OTYP, gpio);
+		npcm_gpio_clr(&bank->chip, bank->base + NPCM7XX_GP_N_OTYP, gpio);
 		break;
 	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
-		npcm_gpio_set(&bank->gc, bank->base + NPCM7XX_GP_N_OTYP, gpio);
+		npcm_gpio_set(&bank->chip, bank->base + NPCM7XX_GP_N_OTYP, gpio);
 		break;
 	case PIN_CONFIG_INPUT_DEBOUNCE:
-		npcm_gpio_set(&bank->gc, bank->base + NPCM7XX_GP_N_DBNC, gpio);
+		npcm_gpio_set(&bank->chip, bank->base + NPCM7XX_GP_N_DBNC, gpio);
 		break;
 	case PIN_CONFIG_SLEW_RATE:
 		return npcm7xx_set_slew_rate(bank, npcm->gcr_regmap, pin, arg);
@@ -1829,6 +1824,7 @@ static const struct pinctrl_desc npcm7xx_pinctrl_desc = {
 
 static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 {
+	struct gpio_generic_chip_config config;
 	int ret = -ENXIO;
 	struct device *dev = pctrl->dev;
 	struct fwnode_reference_args args;
@@ -1840,15 +1836,18 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 		if (!pctrl->gpio_bank[id].base)
 			return -EINVAL;
 
-		ret = bgpio_init(&pctrl->gpio_bank[id].gc, dev, 4,
-				 pctrl->gpio_bank[id].base + NPCM7XX_GP_N_DIN,
-				 pctrl->gpio_bank[id].base + NPCM7XX_GP_N_DOUT,
-				 NULL,
-				 NULL,
-				 pctrl->gpio_bank[id].base + NPCM7XX_GP_N_IEM,
-				 BGPIOF_READ_OUTPUT_REG_SET);
+		config = (typeof(config)){
+			.dev = dev,
+			.sz = 4,
+			.dat = pctrl->gpio_bank[id].base + NPCM7XX_GP_N_DIN,
+			.set = pctrl->gpio_bank[id].base + NPCM7XX_GP_N_DOUT,
+			.dirin = pctrl->gpio_bank[id].base + NPCM7XX_GP_N_IEM,
+			.flags = BGPIOF_READ_OUTPUT_REG_SET,
+		};
+
+		ret = gpio_generic_chip_init(&pctrl->gpio_bank[id].chip, &config);
 		if (ret) {
-			dev_err(dev, "bgpio_init() failed\n");
+			dev_err(dev, "failed to initialize the generic GPIO chip\n");
 			return ret;
 		}
 
@@ -1866,23 +1865,23 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 		pctrl->gpio_bank[id].irq = ret;
 		pctrl->gpio_bank[id].irqbase = id * NPCM7XX_GPIO_PER_BANK;
 		pctrl->gpio_bank[id].pinctrl_id = args.args[0];
-		pctrl->gpio_bank[id].gc.base = args.args[1];
-		pctrl->gpio_bank[id].gc.ngpio = args.args[2];
-		pctrl->gpio_bank[id].gc.owner = THIS_MODULE;
-		pctrl->gpio_bank[id].gc.parent = dev;
-		pctrl->gpio_bank[id].gc.fwnode = child;
-		pctrl->gpio_bank[id].gc.label = devm_kasprintf(dev, GFP_KERNEL, "%pfw", child);
-		if (pctrl->gpio_bank[id].gc.label == NULL)
+		pctrl->gpio_bank[id].chip.gc.base = args.args[1];
+		pctrl->gpio_bank[id].chip.gc.ngpio = args.args[2];
+		pctrl->gpio_bank[id].chip.gc.owner = THIS_MODULE;
+		pctrl->gpio_bank[id].chip.gc.parent = dev;
+		pctrl->gpio_bank[id].chip.gc.fwnode = child;
+		pctrl->gpio_bank[id].chip.gc.label = devm_kasprintf(dev, GFP_KERNEL, "%pfw", child);
+		if (pctrl->gpio_bank[id].chip.gc.label == NULL)
 			return -ENOMEM;
 
-		pctrl->gpio_bank[id].gc.dbg_show = npcmgpio_dbg_show;
-		pctrl->gpio_bank[id].direction_input = pctrl->gpio_bank[id].gc.direction_input;
-		pctrl->gpio_bank[id].gc.direction_input = npcmgpio_direction_input;
-		pctrl->gpio_bank[id].direction_output = pctrl->gpio_bank[id].gc.direction_output;
-		pctrl->gpio_bank[id].gc.direction_output = npcmgpio_direction_output;
-		pctrl->gpio_bank[id].request = pctrl->gpio_bank[id].gc.request;
-		pctrl->gpio_bank[id].gc.request = npcmgpio_gpio_request;
-		pctrl->gpio_bank[id].gc.free = pinctrl_gpio_free;
+		pctrl->gpio_bank[id].chip.gc.dbg_show = npcmgpio_dbg_show;
+		pctrl->gpio_bank[id].direction_input = pctrl->gpio_bank[id].chip.gc.direction_input;
+		pctrl->gpio_bank[id].chip.gc.direction_input = npcmgpio_direction_input;
+		pctrl->gpio_bank[id].direction_output = pctrl->gpio_bank[id].chip.gc.direction_output;
+		pctrl->gpio_bank[id].chip.gc.direction_output = npcmgpio_direction_output;
+		pctrl->gpio_bank[id].request = pctrl->gpio_bank[id].chip.gc.request;
+		pctrl->gpio_bank[id].chip.gc.request = npcmgpio_gpio_request;
+		pctrl->gpio_bank[id].chip.gc.free = pinctrl_gpio_free;
 		id++;
 	}
 
@@ -1897,7 +1896,7 @@ static int npcm7xx_gpio_register(struct npcm7xx_pinctrl *pctrl)
 	for (id = 0 ; id < pctrl->bank_num ; id++) {
 		struct gpio_irq_chip *girq;
 
-		girq = &pctrl->gpio_bank[id].gc.irq;
+		girq = &pctrl->gpio_bank[id].chip.gc.irq;
 		gpio_irq_chip_set_chip(girq, &npcmgpio_irqchip);
 		girq->parent_handler = npcmgpio_irq_handler;
 		girq->num_parents = 1;
@@ -1912,21 +1911,21 @@ static int npcm7xx_gpio_register(struct npcm7xx_pinctrl *pctrl)
 		girq->default_type = IRQ_TYPE_NONE;
 		girq->handler = handle_level_irq;
 		ret = devm_gpiochip_add_data(pctrl->dev,
-					     &pctrl->gpio_bank[id].gc,
+					     &pctrl->gpio_bank[id].chip.gc,
 					     &pctrl->gpio_bank[id]);
 		if (ret) {
 			dev_err(pctrl->dev, "Failed to add GPIO chip %u\n", id);
 			goto err_register;
 		}
 
-		ret = gpiochip_add_pin_range(&pctrl->gpio_bank[id].gc,
+		ret = gpiochip_add_pin_range(&pctrl->gpio_bank[id].chip.gc,
 					     dev_name(pctrl->dev),
 					     pctrl->gpio_bank[id].pinctrl_id,
-					     pctrl->gpio_bank[id].gc.base,
-					     pctrl->gpio_bank[id].gc.ngpio);
+					     pctrl->gpio_bank[id].chip.gc.base,
+					     pctrl->gpio_bank[id].chip.gc.ngpio);
 		if (ret < 0) {
 			dev_err(pctrl->dev, "Failed to add GPIO bank %u\n", id);
-			gpiochip_remove(&pctrl->gpio_bank[id].gc);
+			gpiochip_remove(&pctrl->gpio_bank[id].chip.gc);
 			goto err_register;
 		}
 	}
@@ -1935,7 +1934,7 @@ static int npcm7xx_gpio_register(struct npcm7xx_pinctrl *pctrl)
 
 err_register:
 	for (; id > 0; id--)
-		gpiochip_remove(&pctrl->gpio_bank[id - 1].gc);
+		gpiochip_remove(&pctrl->gpio_bank[id - 1].chip.gc);
 
 	return ret;
 }

-- 
2.48.1


