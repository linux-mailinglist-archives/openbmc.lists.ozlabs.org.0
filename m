Return-Path: <openbmc+bounces-429-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BD6B20CE0
	for <lists+openbmc@lfdr.de>; Mon, 11 Aug 2025 17:03:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c0yXr20kdz3d89;
	Tue, 12 Aug 2025 01:02:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754924540;
	cv=none; b=epsphSNgwgaNYp7Jy635Y1oo+hf/EDkGF5/5CcYWnZI3wyVz5ZbxZ7Jm4lWkCqW25lx/qDQNWCxqyyiGNodwpE0g+BlfJaW1koFjjqmpHlflW40OBRfb45rMWdcTs+tSydmiccDAfG88wMJ0XqufXLySFXPimHvrNQKXpaiEsd+0Lb0tLm7lrnlM6QxZeuCZlVLySodFuzGXKXwejaIr02OnhBBhy/k068+bQVa0uqxTwVSjA/HwyKnGXnSnM9xk9zV+yj5qvZMeaT+dZsCwJ0tR7KT6yOzuTehClB94jg4Ezw2LL/jK/KzsjpXkotL4CuOvpB3CqWxdTr3+c5kJ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754924540; c=relaxed/relaxed;
	bh=oQU4/cpC7C/NCX7LSPoWn8KwFr+mblMjEw9u9UNyQPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LOMEsUl+pk+OHIx7YlIAWl6rtyhn4gC/QiCLD+cKrm8mTBgfIR0H7UfKf0jhJXa2E1B6v9A5x8Pu8ECUkE/eHhwHXuRkDXKQPj4QQquBB5kRucRwyhPDYHI0LplT+hfbVvIesB2lZb4XjzSFDBHcocWB5lsirzVa1O3uDCB+vN7MptnDRT5P+Yt90DsfVbl1sLyR7aUnejDjISmGbm5Bc9geZKXlXTHnnn4/P6JtbghKp6nGG/SagH190x63w56pxVzTZvm5W9dacrP6/usVtogFCXsjPFiHGqizVLATIFZQU4D7Fp83E/0OfLYIAc2GA0+emk2Xj70yzsOX8+hTAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ETBelg06; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ETBelg06;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c0yXm0Bs0z3d44
	for <openbmc@lists.ozlabs.org>; Tue, 12 Aug 2025 01:02:15 +1000 (AEST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-458bc3ce3beso27133485e9.1
        for <openbmc@lists.ozlabs.org>; Mon, 11 Aug 2025 08:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754924530; x=1755529330; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQU4/cpC7C/NCX7LSPoWn8KwFr+mblMjEw9u9UNyQPs=;
        b=ETBelg06SVYQ6J18vE0PTsieBv5BjXqXXqG0NDYePzALPDBWSX9wl0YxGmMfQz0XdH
         G97pW1AkGoo+pBV1/gArOZSw5/DvC4yqWBIuIhaEJVSzcS8nT3ccHWEIUkZhf84qUb8E
         0peaRsMdgbzI6Bmslz9o+Przv76I+RfC/TUPSzkiTenxb34sfekNG48m+ONhgvlY3hKF
         AehlxrD1zRlaFd7Lwriaa/elbebYEJPxUD0evO7q7x5w29iUQUUei45QiY498WPgIMtV
         dU5rQ0N4JtKQQZfyN1gxmy3Lvhm8VkORlKlWaJTfmUWEE3tCFeffNRVkErIa1i8ggK9b
         X7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754924530; x=1755529330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQU4/cpC7C/NCX7LSPoWn8KwFr+mblMjEw9u9UNyQPs=;
        b=OQi5zKcjQW4J7m7NbKPMbt59u1n/z4K76Xmmy+qgRwVioMv85ZCOyRMoC77ee+6QF7
         z8yHnMCbjKIaWQ9qf/pxkXmpuiC6jW8j1FXgSK9VJQ1qMUBtZpcaFFxheyQcliL9klxd
         pXC09vHlTPV82OJqCDbvFAz/5xSrameS8ZnhRpOByFYfxo9ykfGOsi/0PFhyx2tP09wP
         uc+e/Sf8Grqm9V2pV6z+kuB8u/dOQrtsSidxDtUrjcyRo5Duigm887EVJULIPLjo8zUW
         7dlVLdVrg7Fedlau0vLoQwVr1Un9hfROwy7eVzBUg4jZOshpkgcML023+jWtaZAp6PKs
         AT/w==
X-Forwarded-Encrypted: i=1; AJvYcCWw0NP17gfwwnZj0pUEgeOcXKJTu8UqscIwxeUNTLUj+hqWZvPhHGFa7nPJM0/6M8T/nN0/SOpR@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzBAb1A2LMZm4cKqPRIS4C71ZUGc30Z8yUXVGiqT61Lc85/0nNZ
	c1XSLzSjm3nMVqvb78XQd149MH0ehWSu//oWvglrKOJxxfZdY7QQX/CEdKA8s0HIcFQ=
X-Gm-Gg: ASbGncvZZMUrq+9AJKYbr+Io0q8tbgcLGBFcCeD3JH60QFH/V8eb8MVwbU/uM9wG7KZ
	5BlA/4Wb0FEMQBF53BthHfk5MnKZjtwQtnhszuCqULqpCQgoQQJWsqoJE6b90B+Vf8WaGpEEk26
	x+JlFnUOXmWwZDFGYD0PXeM92PDR7NJgyK0r+WySdLuZS+6ODK8vpYIFnMHAEDQpNXeSbndsfrI
	LbbmDUoh1RaptkfslGpKxPACh9SdHueFW5EZu88ck3cTTItz9hXDGBBwf3JjCoBMA9ML74ExDjg
	owNM4kJiCB2bouBsUWaU+8Ot2kYR7wRa9DTK8tYdFv2zIhZxd+5G2eStdW7GnbQTRXJwZkvjnSj
	2Gp6PH7D1qcxc6TFg
X-Google-Smtp-Source: AGHT+IGuRkJqXSehCHbSdsJW5I33/Fn2ULOWbTPFQOZm6vceKVH1dj+vd6G7mjfXDQfCQnwSEMY/9Q==
X-Received: by 2002:a05:600c:6286:b0:439:86fb:7340 with SMTP id 5b1f17b1804b1-459f5687c58mr137162945e9.30.1754924529892;
        Mon, 11 Aug 2025 08:02:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6841:8926:4410:c880])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459eff7918csm192649605e9.25.2025.08.11.08.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:02:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 11 Aug 2025 17:02:01 +0200
Subject: [PATCH 2/5] pinctrl: equilibrium: use new generic GPIO chip API
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
Message-Id: <20250811-gpio-mmio-pinctrl-conv-v1-2-a84c5da2be20@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3628;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=8Yc3Q+1qQoLBEOdwvJ5ov1cATZZZnKh5I0syYOGIftg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomgXt7zodHeDBKguKwa7IUu7mcb1ZhND7UMYHE
 Y3heyY/C7KJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJoF7QAKCRARpy6gFHHX
 ctoEEACcZAO8D6d3VypQQR63kLzYUCVUIk8a+J2FDJHx39O6IWus2qEipgONFpBz4wzudLzRqo5
 uTDCIgtDBb4+xJv641uKV8GWW3kJDVL/zaEWQ1Cf2Nf+yZvVNDEpUvV/VHI1d5FW0zgB7aatJkD
 kIfjKQcNA9wAf3mrbhjOWyi8dGvn5t3h1GxP+h1zpkki5kt4wDiJiXKnh++Ff4Ms9vMsQHUAVi6
 Fag9N8dquoInaui2BKJA/kw8qg7mJUwafO9F+/3tIV7qtJ95GeT2HIF/UXJkfF4TmmkN89PxnHc
 97wGuk/NY91jcfhI3KJj/hX34dOLANgeSYSH7c+Tpl03qrvmhQMA3LYu9Saa3UeO38Zj6Dx/3zg
 RazSoMS1zXdV+ejLnGNXLXtUtNXfk4H3DYEaDL7AlIHaaFLk1Lz1TZK0Wld7XemwDSyeif5/wY0
 6jl7HI/GWCSq/YKqrUqtnKVbK6TX8vHIEWYhS11f9U6maRkQTH2dYj8xa24n85cmVEtwKYsFv1R
 WO7dmB3Fh6fEzDpmTeE4q5VclBBN7g0ryWyWTw3Tqz/jegXUkYHK+3E9ygCq2v9KPTWGDjbsETw
 sFh/2j2L3ozuxpUBA9WEzEKEfGXqVs89vl0sjRB3eXyg2Do+3VVbsLLwztT5sfHuJ7xhq5Rh8kP
 4qhIiw2vIrQy7EQ==
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
 drivers/pinctrl/pinctrl-equilibrium.c | 26 ++++++++++++++++----------
 drivers/pinctrl/pinctrl-equilibrium.h |  2 +-
 2 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index fce804d42e7d7f9233b2da0fb26e482170629424..210044185679384d03278e200d8f7723324487cd 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -2,6 +2,7 @@
 /* Copyright (C) 2019 Intel Corporation */
 
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -179,7 +180,7 @@ static int gpiochip_setup(struct device *dev, struct eqbr_gpio_ctrl *gctrl)
 	struct gpio_irq_chip *girq;
 	struct gpio_chip *gc;
 
-	gc = &gctrl->chip;
+	gc = &gctrl->chip.gc;
 	gc->label = gctrl->name;
 	gc->fwnode = gctrl->fwnode;
 	gc->request = gpiochip_generic_request;
@@ -191,7 +192,7 @@ static int gpiochip_setup(struct device *dev, struct eqbr_gpio_ctrl *gctrl)
 		return 0;
 	}
 
-	girq = &gctrl->chip.irq;
+	girq = &gctrl->chip.gc.irq;
 	gpio_irq_chip_set_chip(girq, &eqbr_irq_chip);
 	girq->parent_handler = eqbr_irq_handler;
 	girq->num_parents = 1;
@@ -208,6 +209,7 @@ static int gpiochip_setup(struct device *dev, struct eqbr_gpio_ctrl *gctrl)
 
 static int gpiolib_reg(struct eqbr_pinctrl_drv_data *drvdata)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = drvdata->dev;
 	struct eqbr_gpio_ctrl *gctrl;
 	struct device_node *np;
@@ -239,12 +241,16 @@ static int gpiolib_reg(struct eqbr_pinctrl_drv_data *drvdata)
 		}
 		raw_spin_lock_init(&gctrl->lock);
 
-		ret = bgpio_init(&gctrl->chip, dev, gctrl->bank->nr_pins / 8,
-				 gctrl->membase + GPIO_IN,
-				 gctrl->membase + GPIO_OUTSET,
-				 gctrl->membase + GPIO_OUTCLR,
-				 gctrl->membase + GPIO_DIR,
-				 NULL, 0);
+		config = (typeof(config)){
+			.dev = dev,
+			.sz = gctrl->bank->nr_pins / 8,
+			.dat = gctrl->membase + GPIO_IN,
+			.set = gctrl->membase + GPIO_OUTSET,
+			.clr = gctrl->membase + GPIO_OUTCLR,
+			.dirout = gctrl->membase + GPIO_DIR,
+		};
+
+		ret = gpio_generic_chip_init(&gctrl->chip, &config);
 		if (ret) {
 			dev_err(dev, "unable to init generic GPIO\n");
 			return ret;
@@ -254,7 +260,7 @@ static int gpiolib_reg(struct eqbr_pinctrl_drv_data *drvdata)
 		if (ret)
 			return ret;
 
-		ret = devm_gpiochip_add_data(dev, &gctrl->chip, gctrl);
+		ret = devm_gpiochip_add_data(dev, &gctrl->chip.gc, gctrl);
 		if (ret)
 			return ret;
 	}
@@ -499,7 +505,7 @@ static int eqbr_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 					bank->pin_base, pin);
 				return -ENODEV;
 			}
-			gc = &gctrl->chip;
+			gc = &gctrl->chip.gc;
 			gc->direction_output(gc, offset, 0);
 			continue;
 		default:
diff --git a/drivers/pinctrl/pinctrl-equilibrium.h b/drivers/pinctrl/pinctrl-equilibrium.h
index b4d149bde39d8dd08a962bb05ccf026364dd9f68..b56124d7fe9132c875d2768b0af8b939f1a4fbf8 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.h
+++ b/drivers/pinctrl/pinctrl-equilibrium.h
@@ -96,7 +96,7 @@ struct fwnode_handle;
  * @lock: spin lock to protect gpio register write.
  */
 struct eqbr_gpio_ctrl {
-	struct gpio_chip	chip;
+	struct gpio_generic_chip chip;
 	struct fwnode_handle	*fwnode;
 	struct eqbr_pin_bank	*bank;
 	void __iomem		*membase;

-- 
2.48.1


