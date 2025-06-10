Return-Path: <openbmc+bounces-138-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56091AD364E
	for <lists+openbmc@lfdr.de>; Tue, 10 Jun 2025 14:33:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGp9j6DJ9z30GV;
	Tue, 10 Jun 2025 22:33:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749558809;
	cv=none; b=oPNfpd0T4mb1+oLFxBrz21rvPc7g0FYk/Q5cYFAhND5zOTC85yksVlDVlivdtLBd45AMjIqF8c2mORtzRLl8AajWWMRvbWah+wB0S35ayhjzbExsbP7wEHkVhRREXyx7HBf+W83T/P41/xLjn0v6COpX5lqta6HRvgxJrIZidNzp07LhB/zWipGn07ET1w3IfQbyjSXOwdxmxWRJ0lhSiHYW79ayphdN+XpsaR/1QmKzxfSvK7gHYEJ4+zOW2eewUMHN/0VZGDBMSCwsMz/GNsLIwO8/1gBjQBUuPf+jyWal4ZyeBWG8GHz0DeBtUNptZd7g661Ur6Sc/8b9jBSFyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749558809; c=relaxed/relaxed;
	bh=KaZhNfmNZvFczCK3uYFfm4lqI7dzagVSWDi4ZRPJnwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f1NAnKM8gh/b7sn5sneRWenTvBC0eLA7fTX13rm18iikIqKu2KeLAVsyT0nYvfbVjtpLMMOcOTTXdZ8Nl52tMkC0mrA5YKtky7fztCkCbP2knQWL3lTlAuNl2gu4HRDPDJQkjhunxHxSofSz9XLChzO7RBFaCDIXCyS8Q4zX7XvJcmlWbAmj1gzFeidSGFco1zRMxB4T68djWixuphiRwOEOg5MbfxuA4NeNCmzaF9ElCKxN7sSeyGj8U76+T0kqhD5dszGjcihI718atD8hjsnxbVgjCUrULZpwj+Vsc8XeT2kBdvxrXhTzHGxI9d7rtux0AzsPPLmF/6VYn+pm/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=U7Q9XGcu; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=U7Q9XGcu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGp9g5ZPgz307q
	for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 22:33:27 +1000 (AEST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4530921461aso20492315e9.0
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 05:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558805; x=1750163605; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KaZhNfmNZvFczCK3uYFfm4lqI7dzagVSWDi4ZRPJnwI=;
        b=U7Q9XGcuy7ATFfEjbzL0pOhPlN4b2o+8izV6wMqyDSWlD3qXxE5RvQcoOK501hEkyg
         nT31VxCLhgxmH144siCDWrDiesJesoUZnlbcc1BaEWOTOR81zpWODaquNS8ETSEIqSei
         u05tr3ORWMb0LbD4GLpp4UxitIMIwvfdQbuQSLER4Br+yNCS0UCZxB5qDFJ/DLF71u7f
         jfFoPEZNVXSjZN0xWhfksrxPVY3kPnnLk7+l9HvLuHRrQoaTO4NmAkTCYNUWE2A1qhoC
         2zX67TeHde1Px0Mr2p2CbP/9H8Wptk2MwwoJ3k7IIBBMqzphSl2xa4dY49rh4dG0SwHU
         KwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558805; x=1750163605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KaZhNfmNZvFczCK3uYFfm4lqI7dzagVSWDi4ZRPJnwI=;
        b=Ht2rGp4MBifmrdZNDlbY0XQFQaWKBlOshM/xrCHjX5/+gNxOQvXSPY2elTjM8TZhPL
         cRjQL3HlZNpVh0K4VrHBU+6PE+6AQ3IneVdB9zrcYxvpBKe7wig4fH0SrZnuviugHw48
         jW253O/IuEY8Qbi+vr6+U2jEmx93wMqpxHoxoumv3uFjlrs5V2tLR6qmA9yJUm5gpBJc
         Kqf+wulX2Uhmt4zsbDSp0b8TR5awgVFM060rmpXUJfcjgL5PDqI3QpRXPZ2y7z/0nvpT
         g6GytlbHZwf4StphKTPKOjk1HZOvd1kGyjxc4s4JuruX2461w+SeNldAZ/73rzSKdfEQ
         ckxg==
X-Forwarded-Encrypted: i=1; AJvYcCVmd79k35axUvPALy6jOiqbn486DQljjw/5vVEcxADaThApGsuoqm69VkgZAdz5myjOTEo7YJ3f@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyVR+Rc4E9g54sglzMKa6tCfFdz0Vyfp4DFpFbKzmDc/a6j+22v
	bq3NcY4WsomAjgGbUOwxe+54pAewpFtMXYqzFzeud4EnCVaLtn/2Ei76jNxRfD64ZWM=
X-Gm-Gg: ASbGncsizeMjDZRhMv8gz0N8LCyoO1MDQC/42mBYbORK6ndQ41s6GuQDW0EIJYyfDHH
	NJV+icTStwslbAAhY4NkMlW0+LmLGZ97Eu8EyWPEFG+wb7DL4EyrgG3FW1WTIxSjqxEJxMcyUTj
	ajSLX2AMZR/uqU0KGkpj5+QZmeB2SXn13yWILONl8djo6bDys3PkrQMOIWfg6mg0Shp8WOXcJbX
	ZFQcZq0MQx1XBZlGB9e5aF00pieM94Z96gJ8P5WqGITIU6muqwKsBf7KE9yeB//7dRLuv+1DUjL
	r26Mj+APCsF6skdXVrf3855p1p5flamGVmdAeXv65u38TdUDupUoWA==
X-Google-Smtp-Source: AGHT+IFSBusLtZEhcB35bdsLhsIDJKEdI0B2x6nuBuQEbHF1Ukz5MK6AfplwzfpXypgWmTNJf64szw==
X-Received: by 2002:a05:6000:2283:b0:3a4:ef2c:2e03 with SMTP id ffacd0b85a97d-3a5318a90cbmr15138062f8f.33.1749558804571;
        Tue, 10 Jun 2025 05:33:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:12 +0200
Subject: [PATCH 02/12] gpio: mm-lantiq: use new GPIO line value setter
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
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-2-3a9a3c1472ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1909;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=h//lpMqxpm+YSvksV4b6ru3A6OjJcjH0LPneHhPANFI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYOyVxQ6f3OBK/aG05w0mHNnvJLnDT+orDrz
 CyfWJIjJ4KJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmDgAKCRARpy6gFHHX
 ciHSEACbAaLEpy3rIEg/INTnqZRSZcKjIFtdWlKQuLFDeybOyeiSxsXh2wVCKE9HyLBM4Pe4aOe
 VeJn1Gr92epXjzFOgr9ljMI5XuvfDKiUaJ+rYkq7/Zs0doHxU2JdVUOZ56W/ksVaQRwyC8wCRBr
 1Wli4N7JwPdD4t/y88MkdyHuplV05Azu8GK/HebhanaJmAdKsKGHxR/A4RYuWfrffEarVVAQ688
 yj7fctEZEtajQVjw+qCP5GBjsONGyfRiTciEzFZk2Eo6IIQCZEYQq3wc8Gd6b/7f7x1mHHGRecY
 DySlDOvl/blSxGU/19Rk59Ji7N0jIHlFGoRdOlEfDYsyxYcQ1YGhBm/EWbwy7C7TVwwmYmhRHjQ
 6U0crUDECD+RHZf8ESHp1fzD0gQD6M87Z2n5Qqj/iXDfT7F3+/E0NCfX2MGjJEoG9D+gFkzNSqN
 ovpcvq/yrRt4BiP+N/+81NwzARAgmNtA4arZxeyh5i4OqTMZtaMMgDsKwlZxHweLeCJzeHU2c01
 Gd0uc8Rd+iWf1vbf/mnnIHTHyTaSYWwYmVxa/FJSj98NsXYkeE2f9VoTVKzBj/b4ltLuEiTBWHq
 cm2Kz0AGsiu4qJ7PmhkesDqXdEvXX8g0I9jum1a/5pvlAwYSlfyl1w9eyBKPjCur8y1vx+5atSV
 t1BHqk4gNTPA4rA==
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
 drivers/gpio/gpio-mm-lantiq.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-mm-lantiq.c b/drivers/gpio/gpio-mm-lantiq.c
index 14ae257834381186faba94446ea326cb3be99ca2..897a1e004681c085217bcf295bd971f3424011b1 100644
--- a/drivers/gpio/gpio-mm-lantiq.c
+++ b/drivers/gpio/gpio-mm-lantiq.c
@@ -55,9 +55,9 @@ static void ltq_mm_apply(struct ltq_mm *chip)
  * @gpio:   GPIO signal number.
  * @val:    Value to be written to specified signal.
  *
- * Set the shadow value and call ltq_mm_apply.
+ * Set the shadow value and call ltq_mm_apply. Always returns 0.
  */
-static void ltq_mm_set(struct gpio_chip *gc, unsigned offset, int value)
+static int ltq_mm_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct ltq_mm *chip = gpiochip_get_data(gc);
 
@@ -66,6 +66,8 @@ static void ltq_mm_set(struct gpio_chip *gc, unsigned offset, int value)
 	else
 		chip->shadow &= ~(1 << offset);
 	ltq_mm_apply(chip);
+
+	return 0;
 }
 
 /**
@@ -78,9 +80,7 @@ static void ltq_mm_set(struct gpio_chip *gc, unsigned offset, int value)
  */
 static int ltq_mm_dir_out(struct gpio_chip *gc, unsigned offset, int value)
 {
-	ltq_mm_set(gc, offset, value);
-
-	return 0;
+	return ltq_mm_set(gc, offset, value);
 }
 
 /**
@@ -111,7 +111,7 @@ static int ltq_mm_probe(struct platform_device *pdev)
 
 	chip->mmchip.gc.ngpio = 16;
 	chip->mmchip.gc.direction_output = ltq_mm_dir_out;
-	chip->mmchip.gc.set = ltq_mm_set;
+	chip->mmchip.gc.set_rv = ltq_mm_set;
 	chip->mmchip.save_regs = ltq_mm_save_regs;
 
 	/* store the shadow value if one was passed by the devicetree */

-- 
2.48.1


