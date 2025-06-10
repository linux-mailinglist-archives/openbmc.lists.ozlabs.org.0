Return-Path: <openbmc+bounces-140-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 986A7AD3657
	for <lists+openbmc@lfdr.de>; Tue, 10 Jun 2025 14:34:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGp9l71dsz30CB;
	Tue, 10 Jun 2025 22:33:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749558811;
	cv=none; b=Yf18rESyJ9LoTTckLuWdK9TGYsRugtnOQVGNcgmMVNo5G+b6maKFBiE+S3N26AmGi/rfRXRuXG0OHcaxB52hBLtPgiOaR4PnLkI6hwyKdB+8G48usHOOdqzR3VHJer2RBiRTcsO7V9uDhFx/YHl1VLiqiDfMexMm9hrGK7tEo9tZHwVbURquIOSsVD9ukTJtYFMRsY8mdZEgrQqndbpGP9367CFroV6+ReTw9455spJ69XFt0dXItrcLSAs0nPnsynr7tBkBPpTteIakUS7gfzjl5hc0US6Dgs5t97uTzZGo3bJvDhRQzx52RQM5kwAeDflE0xQGtHT1X+qgKMfXVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749558811; c=relaxed/relaxed;
	bh=nnifVKNx6vZMoi8BKrChG7bpgI/OQHUHoxljl9BN6O4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WA/ev89ZxZB65yjt2cMD7ctBW6a1IoaO/dVCjolFXW70b2TMEMlx996bwBplA003ZOGdqELvzlEQjhkxwByFx4GMAjGFQYvTB01QxtoD4NCS68JlGnGMEeBwDkR4S7CqdXYo5FAToeYKPg3BTk0/474jLEPgJBiVesw2OFQEUkE0zDQpCJtCqTRs+Gfs3PVJtxil5yabNYJxIKxRUlh7b6ptpAlhhYFgUNvbMqvbEoy1vviQH/a5xGzB1tJ5Q44W2H9Dk4nyI1BqmsGYuKNXbe/USQnxFKle/Is4tVBGK66Iq6k0YH4naLveKfaBnc2ZaRPQ8Ilv8GI0YzqWVUDEkA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Sm7cMhue; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Sm7cMhue;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGp9k3rwNz30MZ
	for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 22:33:29 +1000 (AEST)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a35c894313so4836747f8f.2
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 05:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558807; x=1750163607; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnifVKNx6vZMoi8BKrChG7bpgI/OQHUHoxljl9BN6O4=;
        b=Sm7cMhueJfj9haiM5GR4hy1NCk/+lAcnFYhDNs9G0/5Jg11s72yzn9Xh7dDjrHRMgT
         QraZQ0IJQF9WnCALrLgPeJ9xng57o+pWGlqeQiadFkJx76Llf003IA6lVone1AV1u2aN
         dKQLy9xTnSqjUJ+J2cPB5pziDg/H16KA/QNzIo86DH8dXQTB3qh8NU10pZYLpNxp1rbP
         BEkFn2mZNB1OeOk4WXaKNwF3bQ3bYH0u44FLr2c0KiP9rVriCqP0tEBw3E1XoLCw3Gt+
         qqamNNdhzJIMlqp6KMI6EkmJbNmLocW9yk9qrZq0HOVrKd0gEiktmuzBgnd8WDoTycmm
         f8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558807; x=1750163607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnifVKNx6vZMoi8BKrChG7bpgI/OQHUHoxljl9BN6O4=;
        b=N1wHV46wzESNPzwgAc8p6N2EFN3GxCCOqLnfnWZN6TPEXZiAmj4S/WFrVvAp0cAsOg
         wAj62WaMrOvkL9BGdV9oaxnmCpVJibuY5L4boCiQ58URWWUY/5G0CLRRz4JUu8swYed8
         2+0DC6U7X3g1YmNFxLd/HNrGGjbekrrVv0W3oFO0PyYSxu8imo6uIToGKpYT+TrFjo3z
         6DI46kCHf6JwUrll9GeHfAI8fTx0+g6v9wbn2zDZmgcgC1O0xmnujzRXEPxInFNKMcvq
         Kl/LPAW1AkiQI8BvyYuG5z3hqDFkFTKnCu6V9y9JAkeuVuq6CQpjQkvfS8ZhPbnhsXpz
         PZcA==
X-Forwarded-Encrypted: i=1; AJvYcCUlAkfDRrWKpngHqv3NbQ1kjX9dHiqYPviNWCw1e9QngAY/Oz3j2I49fhRZa5YjzF2GmI6KQjGh@lists.ozlabs.org
X-Gm-Message-State: AOJu0YypMus+hH7Wo9Gf6MJcED/YeB861HrMTDd6xeZPMNggDFQFwiLT
	Sv7AU5vaiR9lmJxFD1eOUDhCbiEZDCraxqiCSKOse0kkA75/E8OpmNN/T3PSg0xFxVI=
X-Gm-Gg: ASbGncsX1pureXgA35OShFdaEcclDD+dXa7HHK8+3dn0uy1zi813+398XxZJ7/PCw+R
	GhQbpYVvv2keo7o7rttGbIFDxuNYbXYv96eX7F4wfoY9FQNRhBegySXwscJCnPvO0q50+qR/Ztg
	pE8PKvyEHjIOopBv0CGXcfoO40do+yTdBKOZzHdsCHTskGRg/hhkk+LW5GnkbhQgTZeKtn1T/Lu
	gUeeOKroZnSP/g3a6gcHBHq3VOFhhP13lAlfco8MhiE/vfoEX/GjZCtUlS1hrDzS2fqIYHt7ws3
	HRrFCr7qUa+YHAORrF2POpbW4PofgCaHlBbhir+Z6KmEziEJFeXHuA==
X-Google-Smtp-Source: AGHT+IEhHGnha6NVSEl35o0rcxk3G2qeby289KOBjHmyRRKU5aBeCt1UnijYGnoa4QSN8RfsoiCifA==
X-Received: by 2002:a05:6000:18a9:b0:3a3:6595:921f with SMTP id ffacd0b85a97d-3a531cdd3e7mr11294329f8f.41.1749558806845;
        Tue, 10 Jun 2025 05:33:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:14 +0200
Subject: [PATCH 04/12] gpio: mpc5200: use new GPIO line value setter
 callbacks
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
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-4-3a9a3c1472ff@linaro.org>
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Grygorii Strashko <grygorii.strashko@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2628;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=90+8j4aZT4JRMp0EAthBl2BT59DR0EH3kEZp8VxRIWQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYPjrlNqxPQXfktePA9fMZKYXcc5Gcy3lEpY
 DiBORdvdEaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmDwAKCRARpy6gFHHX
 cis/D/oDqQbp1iJ/pMrCws3WboSyUKCzDK6Dz2mNVa9MCgOCF8w2qEn77E5kO3REG58Iy8rBevx
 M+rxL411dBx+ddz6YfndpV+vRX8eo+xmA9GhmW+ZYP0QL/6LVN4U81PwhG/h3iXUS7i5XJZn2h2
 aJ70PUm/8zQWSgA2WTs9k92eWe8PaU5791laRMJaZUS+h1tjqQxPywAnfYf0XCHRtPmJ4nXDrPu
 W2NtUQ0DFUxaKw7vs+WkjRRUHWCfKbyguo4jCedPSMQl2nxxTlX1WhFlNQRNUvqLLn4zk6lRfLq
 GbxmNkhls3uxeoFAB2rtvpoD2ti0oeT6dNbmi7Pptx5o3NZ4HCwBEidKmfUghK7L+Q0XPv+f7Dc
 xOOo2HyNAyc8OGoSRG1tEBELuh0ngmvNjU7ad5jlOxts2Kh4l5VuhylUyGCrqsRfY+1EEvWMP3a
 Ns3DoU/3KBau2OAHispj2VLP8s5w3Zbbqf9JC5EBfW946W4x6609uYvF0VX1sjSxkCaq89hLZSF
 Zv2Qm8n5VEeYOHl6sAN7+dY4UB0M+dNgwcVV+Exta6JSnaoAkZSolRXj0z+G3z/5tB1rjuXwUFv
 nb2okeSy3qeLWCX/LEwjSPEtgSGH/EXRfvakYUCD1aUpMjEJT5jrDXFC+BomXspRo+F+w1rOlaN
 n3rbpR6MDIGhl5g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mpc5200.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mpc5200.c b/drivers/gpio/gpio-mpc5200.c
index 091d96f2d682941378d251e95eed88ff16bd39c2..40d587176a754a6277b87b760f562ed5304b6eef 100644
--- a/drivers/gpio/gpio-mpc5200.c
+++ b/drivers/gpio/gpio-mpc5200.c
@@ -69,7 +69,7 @@ __mpc52xx_wkup_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	out_8(&regs->wkup_dvo, chip->shadow_dvo);
 }
 
-static void
+static int
 mpc52xx_wkup_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	unsigned long flags;
@@ -81,6 +81,8 @@ mpc52xx_wkup_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
 	pr_debug("%s: gpio: %d val: %d\n", __func__, gpio, val);
+
+	return 0;
 }
 
 static int mpc52xx_wkup_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
@@ -151,7 +153,7 @@ static int mpc52xx_wkup_gpiochip_probe(struct platform_device *ofdev)
 	gc->direction_input  = mpc52xx_wkup_gpio_dir_in;
 	gc->direction_output = mpc52xx_wkup_gpio_dir_out;
 	gc->get              = mpc52xx_wkup_gpio_get;
-	gc->set              = mpc52xx_wkup_gpio_set;
+	gc->set_rv           = mpc52xx_wkup_gpio_set;
 
 	ret = of_mm_gpiochip_add_data(ofdev->dev.of_node, &chip->mmchip, chip);
 	if (ret)
@@ -228,7 +230,7 @@ __mpc52xx_simple_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	out_be32(&regs->simple_dvo, chip->shadow_dvo);
 }
 
-static void
+static int
 mpc52xx_simple_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	unsigned long flags;
@@ -240,6 +242,8 @@ mpc52xx_simple_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
 	pr_debug("%s: gpio: %d val: %d\n", __func__, gpio, val);
+
+	return 0;
 }
 
 static int mpc52xx_simple_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
@@ -311,7 +315,7 @@ static int mpc52xx_simple_gpiochip_probe(struct platform_device *ofdev)
 	gc->direction_input  = mpc52xx_simple_gpio_dir_in;
 	gc->direction_output = mpc52xx_simple_gpio_dir_out;
 	gc->get              = mpc52xx_simple_gpio_get;
-	gc->set              = mpc52xx_simple_gpio_set;
+	gc->set_rv           = mpc52xx_simple_gpio_set;
 
 	ret = of_mm_gpiochip_add_data(ofdev->dev.of_node, &chip->mmchip, chip);
 	if (ret)

-- 
2.48.1


