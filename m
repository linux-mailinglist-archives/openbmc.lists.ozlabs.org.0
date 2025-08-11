Return-Path: <openbmc+bounces-430-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB451B20CE2
	for <lists+openbmc@lfdr.de>; Mon, 11 Aug 2025 17:03:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c0yXr3XXjz3dBx;
	Tue, 12 Aug 2025 01:02:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754924540;
	cv=none; b=U4YNeldZvUPAu9u0W0/zOE0BRcvXmFAYJurvoRqscpUAnfYuj87yxYxkEooH8djZirAIlHllTVRwuEBOaqQ3a39oNui6xDGzcoKYVKs8o4U43yKC6r2IxwUy5OrBM2ZivGDpyVimcp8N8W0bKHDOrkgSvtaVuGE/hCiRK3t3L6Wo5lrZ9QBnjkgUUdGE6DMSU66G1XMOsy+/gdgn49hoP/aNgIUNjq/yA0h6UHXX2+zXIFnriM88R9s3ob0untcQA+t/ac/hQukXvul+n+UdwC3E92dwQX+X4zGHlWIdPwYvTJrlv1+Vp9whm8oV80x4O2x3WE3sHS2UeLBkrUlKxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754924540; c=relaxed/relaxed;
	bh=ysJS8u8Fhvri8S6AtBehkn2Zfsj3AWbxJ9fTcztcrag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lg7Cd5ceZzrESt4khzHjPl1HXSEgeIatk2UB4E4sJGbOtHDHCKuwRgtvF+F0nFJWw67va2BRvCW5LUwkvwuO/JQnefdd4y6EcVilHB1nTo5CcNb7Lg8M6lLVH8Np+u2Y+7Gv+x+eN7fDUkuRdvhDKJ1ULoP3SxCCg74+1RvnjXp0MomfQ7gGfSk4sYxe+FTYm7B1OJ5ImgV9+Ra2R5Kl4J7HVc37irvt3Gw6CLtEZSdev1IKlLFrz39f2F2+o/SkHGnoby7NCFVFZoRo3MHaeY73ianXrmuX0RJXNSUp8iYy4n65KJBJKe1cxqVI0IORFu4EdCqweWTAMa/AwS8umw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=EkD97Nyk; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=EkD97Nyk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c0yXp2jwmz3dBD
	for <openbmc@lists.ozlabs.org>; Tue, 12 Aug 2025 01:02:18 +1000 (AEST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-458bdde7dedso30344445e9.0
        for <openbmc@lists.ozlabs.org>; Mon, 11 Aug 2025 08:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754924535; x=1755529335; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ysJS8u8Fhvri8S6AtBehkn2Zfsj3AWbxJ9fTcztcrag=;
        b=EkD97NykZ1/Q1nkbDEmjgVxpa0zWaB4mYZUDZvZAVi7SdcLY1becKW3xCGCKvV563Y
         wRBz0CeEZjz9dSpMo8zBgqHexlvGaWOuIZy2NJ/y64grkvbP0nZGXbkDNx9jC44bQTx8
         IFtDQfnwPes7weQvZ5C0obGhat6rDgKqx1BtBrp1ySfNZuLWk0TMgir/vAUmPjpiAb0E
         j230rFeaohju1iGKUqqIAxpVleb0glR+4CUxhruNakwzkXn/2E3Ew3Gh/Ez9AZ06G8cg
         zQKOX2b547mpUnidh9RTV2jUIkDREbSknNLKBMxt1djHatodR1Ui71UAEbfUET17+0gi
         lXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754924535; x=1755529335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ysJS8u8Fhvri8S6AtBehkn2Zfsj3AWbxJ9fTcztcrag=;
        b=dXlAjfyCkE/zGLp5Y3k/veqkxNTPtlQkL7UvnpTJsvYyP4zm2GNJlWaMS6rLmCmfar
         JhWxBr9xaRAUay/5valiYaKVuK37sYvLTmet2K6DPq5iyFjzybb6vAuRvGwxa62znahp
         NQjrlU1cLvZH/GDyha8hAaMaUK+emkosHzadEouljwH5HDhQamHH3mcI0egEsiNbWmrd
         9Xn18YeQ2fnU5Da15zZVqRP8LEZQ7HJX9DlG6aFgLPmX8jvTRcnNryQ6NToYjGBw/vIE
         qcTu9XwsRDuEdWd6AQQCXr+tPl/Q1bxQ3cGv8KMiRumemQn60gWGCOVse3fjqhiHBTjD
         ww3w==
X-Forwarded-Encrypted: i=1; AJvYcCVXXplhpRPnTo7FB1owR+ne9673/cMN9ruacIQEmmw0qK4wMCbZPj4cwZknvwojkOcC7dLlQIb0@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxiDgl3TlkPWutGZQminx99qno9JoKl2GZxnHruS8ZTI+L9mXNy
	FyaKFHOhg0+4XS9SGVajfgZiCzLR87pD1F66VjaH+cMGlORa+CjLpb/cMnO6lF9djSwH4vC11d2
	YcwIP
X-Gm-Gg: ASbGncvSwb2SMppw4d/DL2Z8/EjjJsCkcoR61N5nFOZ1EdkOeLEFMwMzE6fUyyxcr/A
	cHGIafhuWiG8FhbJEDvO/EZWmF5PVFQVu/hlMZWtOTCAhOGrUp9jBYKTwvj/Qo/aTY0Nzh328YE
	XLAxEkMTtDF2l638hbKwhThIWBVQUVNGDGUIOpk1eCtAtxB6XNtnuw7+5/J8kjlZM/o4IN0i0BZ
	pMEh676KIxCefEEnXi8F9JBufOBR2qwuzOOfh+P3Z/S5VXQlM9BhTF61j9W43aRUf5e98QQtB+i
	DdI5rqbVwN66M9A4aUN2b6iomArSBN1iOm/HUeK4sH+dqS3t7PbYBi5iC0TTX8cM8KCepUfJ6+u
	OoOk8m5KwSgABlj8t
X-Google-Smtp-Source: AGHT+IFiSDH4dTGzeIV+hH7h6pQJ8LcJq0Po1XDJ2GeMsEQEPO5rZY2CszDqq2FuZ2ThQvFn+PGHwg==
X-Received: by 2002:a05:600c:35c3:b0:456:1a69:94fd with SMTP id 5b1f17b1804b1-45a10b3a3edmr905615e9.0.1754924535221;
        Mon, 11 Aug 2025 08:02:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6841:8926:4410:c880])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459eff7918csm192649605e9.25.2025.08.11.08.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:02:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 11 Aug 2025 17:02:04 +0200
Subject: [PATCH 5/5] pinctrl: wpcm450: use new generic GPIO chip API
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
Message-Id: <20250811-gpio-mmio-pinctrl-conv-v1-5-a84c5da2be20@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4523;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FuIHwRskLSRbzwrVaTM8WNQE9cJKBQppwXKNoQVeoEY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomgXtHEGmnbFBea5WN4RyVzy/ytLzLC9kh6vxq
 DDy5vP9Yv6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJoF7QAKCRARpy6gFHHX
 ch1FEACHNtA8UzYfZDTsRXPIaEfNVsIe/A7suWXcUxzJAJ4wCZsAylvzKkr4JN0hxegkQstolf7
 cqpnmT7yqQ1Qk6wcPN9hZ1SSYHmIrwvaf3mTmEloQV38NDiIm7IGi5WF2anqrWdsXNN3Fqw/Z03
 JdjyJUJ5kL/NyHTWt2wSuJS5hnvdvWygpCfSyzgVrSoOrLyFbcGlnT8I7BNO6P5D84sFm2wi7Jm
 mxORKa6aTz2hN16G9QVmbIatahVLcdG/fcDo/fqSdRfrFH54Sxws3Z1yVZiKcrsVWTD8E0xcIfi
 ah2zKGomVba+cXUDEYljd/xpKApsmMZRcMI7JjiZFjYoOXOGWQk/y66BEo7xGO5cm2Ek7E1c3vb
 cKltTFPFOiJa2IZQm5w2yvy6lA08elwimHnGHoWhZVIzJN/i3zKfcAYeYcM3+Wzv09D9vZIDGa4
 c2jq8H6LaAp67sWaKXv+xE4ZtQpaIDrhcTNQE3EvPDga8ATKWdhmZRx3sX9eaKFUiSdAskTrsxq
 Dr99n5NoKjTUCBXAsZpDkai4eXAliRMhl1omn+dBC7Yu2SOBy23wHHP91AJIGRlZt2CTyMq+9/z
 rvhkL4YUd2ZQIdIRTAOUqWRH/1+EHDZOjJGT66N8dJzDfMyUk55wkaiNTKtvBxo3NxRUbinLL7M
 rPWbiSQMV59HkEA==
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
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 44 ++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
index 8d8314ba0e4cb55db2b1d3adf2de07e6fb93c279..4dd8a3daa83e44b0e2780fedb03ab11fa46a4b7d 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -11,6 +11,7 @@
 
 #include <linux/device.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/mfd/syscon.h>
@@ -47,7 +48,7 @@ struct wpcm450_pinctrl;
 struct wpcm450_bank;
 
 struct wpcm450_gpio {
-	struct gpio_chip	gc;
+	struct gpio_generic_chip chip;
 	struct wpcm450_pinctrl	*pctrl;
 	const struct wpcm450_bank *bank;
 };
@@ -184,11 +185,12 @@ static void wpcm450_gpio_irq_unmask(struct irq_data *d)
 }
 
 /*
- * This is an implementation of the gpio_chip->get() function, for use in
- * wpcm450_gpio_fix_evpol. Unfortunately, we can't use the bgpio-provided
- * implementation there, because it would require taking gpio_chip->bgpio_lock,
- * which is a spin lock, but wpcm450_gpio_fix_evpol must work in contexts where
- * a raw spin lock is held.
+ * FIXME: This is an implementation of the gpio_chip->get() function, for use
+ * in wpcm450_gpio_fix_evpol(). It was implemented back when gpio-mmio used a
+ * regular spinlock internally, while wpcm450_gpio_fix_evpol() needed to work
+ * in contexts with a raw spinlock held. Since then, the gpio generic chip has
+ * been switched to using a raw spinlock so this should be converted to using
+ * the locking interfaces provided in linux/gpio/gneneric.h.
  */
 static int wpcm450_gpio_get(struct wpcm450_gpio *gpio, int offset)
 {
@@ -329,7 +331,7 @@ static void wpcm450_gpio_irqhandler(struct irq_desc *desc)
 	for_each_set_bit(bit, &pending, 32) {
 		int offset = wpcm450_irq_bitnum_to_gpio(gpio, bit);
 
-		generic_handle_domain_irq(gpio->gc.irq.domain, offset);
+		generic_handle_domain_irq(gpio->chip.gc.irq.domain, offset);
 	}
 	chained_irq_exit(chip, desc);
 }
@@ -1012,7 +1014,7 @@ static int wpcm450_gpio_add_pin_ranges(struct gpio_chip *chip)
 	struct wpcm450_gpio *gpio = gpiochip_get_data(chip);
 	const struct wpcm450_bank *bank = gpio->bank;
 
-	return gpiochip_add_pin_range(&gpio->gc, dev_name(gpio->pctrl->dev),
+	return gpiochip_add_pin_range(&gpio->chip.gc, dev_name(gpio->pctrl->dev),
 				      0, bank->base, bank->length);
 }
 
@@ -1029,6 +1031,7 @@ static int wpcm450_gpio_register(struct platform_device *pdev,
 				     "Resource fail for GPIO controller\n");
 
 	for_each_gpiochip_node(dev, child) {
+		struct gpio_generic_chip_config config;
 		void __iomem *dat = NULL;
 		void __iomem *set = NULL;
 		void __iomem *dirout = NULL;
@@ -1060,17 +1063,26 @@ static int wpcm450_gpio_register(struct platform_device *pdev,
 		} else {
 			flags = BGPIOF_NO_OUTPUT;
 		}
-		ret = bgpio_init(&gpio->gc, dev, 4,
-				 dat, set, NULL, dirout, NULL, flags);
+
+		config = (typeof(config)){
+			.dev = dev,
+			.sz = 4,
+			.dat = dat,
+			.set = set,
+			.dirout = dirout,
+			.flags = flags,
+		};
+
+		ret = gpio_generic_chip_init(&gpio->chip, &config);
 		if (ret < 0)
 			return dev_err_probe(dev, ret, "GPIO initialization failed\n");
 
-		gpio->gc.ngpio = bank->length;
-		gpio->gc.set_config = wpcm450_gpio_set_config;
-		gpio->gc.fwnode = child;
-		gpio->gc.add_pin_ranges = wpcm450_gpio_add_pin_ranges;
+		gpio->chip.gc.ngpio = bank->length;
+		gpio->chip.gc.set_config = wpcm450_gpio_set_config;
+		gpio->chip.gc.fwnode = child;
+		gpio->chip.gc.add_pin_ranges = wpcm450_gpio_add_pin_ranges;
 
-		girq = &gpio->gc.irq;
+		girq = &gpio->chip.gc.irq;
 		gpio_irq_chip_set_chip(girq, &wpcm450_gpio_irqchip);
 		girq->parent_handler = wpcm450_gpio_irqhandler;
 		girq->parents = devm_kcalloc(dev, WPCM450_NUM_GPIO_IRQS,
@@ -1094,7 +1106,7 @@ static int wpcm450_gpio_register(struct platform_device *pdev,
 			girq->num_parents++;
 		}
 
-		ret = devm_gpiochip_add_data(dev, &gpio->gc, gpio);
+		ret = devm_gpiochip_add_data(dev, &gpio->chip.gc, gpio);
 		if (ret)
 			return dev_err_probe(dev, ret, "Failed to add GPIO chip\n");
 	}

-- 
2.48.1


