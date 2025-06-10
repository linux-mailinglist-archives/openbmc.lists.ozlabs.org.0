Return-Path: <openbmc+bounces-139-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A98DCAD3651
	for <lists+openbmc@lfdr.de>; Tue, 10 Jun 2025 14:34:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGp9l0cXNz307q;
	Tue, 10 Jun 2025 22:33:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749558811;
	cv=none; b=lTS5XZ7QyuEg9dr785A2oTHmQTf+gDBaGJdTGmElkcbNj7ANv00aIAqeSgHdSTq08maVQEQIQWcOEJblYzqIDfl7r5VZKdZTQCGS0LH8cv/tsUqDdjCic7DcvgTGoZuqws+N+r8/DJlebruwOFkpzovdZtKNobeCac9ziVY99tEHXR6tWrUdqtjDtqaiygP7CA3K9TD8Sej9ajJXqrQRCtBii81NkzDBy7Z08n/e9gK4tUU67T2hKZLAMVGrpUtggHABGWAckFdCdVraDLa70W62th8xm4HAX2z/fxsqW/KSwYXARC/4+27QvxYYeCBJXpmkfzjul6GGFVI8iXOf6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749558811; c=relaxed/relaxed;
	bh=rKbs3ygxvSdMhEMPUeqpo77fDElOIDrrqF0rfeM3cmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lBfA+mtCsCYXQjaafOYTBvA9bs/JhYTRGcdazoAl0wjJYa2/3fDAEYzBChk+aOBS6raF6UxAyRFG/pO0DMhtJH9iWDzynfD7vguQQ1Qj8pLRhEyK8nWPWxnygRxNTq/sdRib8MrHYzqifr6uwCpBwTTN4ueewVow9gUUDQifgqC+yxLvGn4PqruZPbIqUsJ7d05TSNmZ7/rjAdGTAuhs2u3hQYflKIBQSiDyoN5dQWuUHgyyZ3NSYk0VQOXi3JFBiEtJ3CsTUDGTAQe3B0FspwSuNOFjn0QL0Y/IFjzlPEXYg2nwzM6ngasW4Q1V3eosFCvVd6lrfxhcA7s2aMQR7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=hu1vbnz+; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=hu1vbnz+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGp9j1nMWz30CB
	for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 22:33:28 +1000 (AEST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a35c894313so4836734f8f.2
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 05:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558806; x=1750163606; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rKbs3ygxvSdMhEMPUeqpo77fDElOIDrrqF0rfeM3cmM=;
        b=hu1vbnz+v8/0iy7/ktIaFcPUvqG6sBH7XQw6lwwyzrPFlmxajfi2Ifg8w1UA7uQA0o
         05/uvCZhqnaIoLX9ZQYQnoHhIW+4IBDUdPXeriIhopCt+o6NnVjpIFYF2n+V66WbEbQV
         PDJMsArUApuZIaEJGwEC1/m1hjA96EKAPNb33BeYU+n+8tC6rUUMM4MqiVjLUkdr0/K+
         GxqvH2GVIiekbG1wtcXvhTmOhMA+Xn1Fx+jYzcTLuJwqlFm2VEbYv1B9UsBWPNBaTzkL
         OdjlBsWV3Sg3e6kyj2esUdcjdthtjTHaeOQr7Ia/vQe8HQVF2JeblcZ1qosLN+FUChW8
         AEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558806; x=1750163606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKbs3ygxvSdMhEMPUeqpo77fDElOIDrrqF0rfeM3cmM=;
        b=bb+Z7F8CKs0E/I3dJxYtlaEjYx5x7P2elkHuWhVFJ4VmGJNOYtBkupNRtdd4YuNYSC
         ZG4IRojMTLXe3pjohcYE8R3pLOAAWLWXU+NXIDpvhopIR0aeAJkkmRHLchM1l8SQ6Cyb
         ullZl1MNvUhWAvTsD0v0iRRNuAg+9JhizZilniFtKMmL+jn5QE4/5PLR3MSjVvjc2OyY
         gJMuTyLkIweH903bqzlpDlr7EjSKU0yQ6oR2k9MeCAeK1Rv6Olys9LfDoFptUUyelNaS
         mtRCbRvtkHOShVbf9CXtzfEp3G1HJOCLxGZsRPBy1wuhYm7odBZnLFvGmYC5BZVCEZ2D
         P5qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVOY09hvS3DMm5BJ/MIPA/i99MDkqEYiP5t76blExMFj/Wp2HKzaHCDm990Kgn4svpwUejMNAw@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxd4j+5qBGJFgscdThUAEQcOYx0mBIEmVtEQNFgXaYnfIeVyK4R
	r7HtGOXf/Oi3toDduqvviaHvQTkM/3B0Xnh2TSoXp6pre3ZGP9x6+VT47y6PrKoGT0E=
X-Gm-Gg: ASbGncvOzwRQrzFZ2P8nFiULcZCL1eW//QT0XUaYh4gFWxEHYPgRra1U36v+TwszuUF
	oB9eRBOFxiksXFz/SSS3NgY0yN2hq1CajKEt9qnR4jtdmhZxsgyi7Pns6Yxx7d0jGFIL4IswNjC
	b2/0Ae96VEgoIO7RNkcADu1RdKdIScQ5Q9OF026DWxVTPJuoNCZZV6jEzQMPMujQqXSqgBZhgvV
	GbWJtBcc6xdy2YYSjHBcjhNTopjlsHUyy1pyHpM4cN8csoLZU6YJkmYo2Y2AfA8fvl8ui9sgmEI
	9bFnV7HN9fEGsvLyPX7pvZrh24Wb7M9X2s/AqgOuLx5GXCvZYjU3zQ==
X-Google-Smtp-Source: AGHT+IG10zG//yZ1b7GgucOGjVy/SV3P0HD9SPfMOme6APoyX0obpAM9Jiyhiw0LZzEqu8UJWmYDxg==
X-Received: by 2002:a05:6000:220d:b0:3a4:ef70:e0e1 with SMTP id ffacd0b85a97d-3a531ce74b9mr14483221f8f.55.1749558805718;
        Tue, 10 Jun 2025 05:33:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:13 +0200
Subject: [PATCH 03/12] gpio: moxtet: use new GPIO line value setter
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
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-3-3a9a3c1472ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2337;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=cJsz4ZGd9pC00Thnt+wIQZLp3beAzLcJOBBw0b6Px/s=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYO3xnpUc/3u6ssQztvReVrCU8Qq6iiPbgtP
 Z3BmL+TVB2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmDgAKCRARpy6gFHHX
 cgezEADSssm46y31itfRn2QsV4tDRq/1Gvqk5nge7CWtX/usrhs/bK6sOyunBzV2g22yTs/iS3R
 /jcDfbiyCX0hofwExZyBaO6DbsNNGjbsHC8Y9E/WgfQoP808ECbR5jwqWJrOxoDZVIyJNzc6hK5
 olsmhMMw3rIUyfj9aKq5yv4XPuDmSk4ej/ZU1QrqEW0HqEcusEtYAVPi8b/f20VqWqhPsmxv/M+
 ybJk5xp+Q7PkxVKqrK8HwGRzVWlK7cAJUdGO3sRoN+BRPxG3x7XlfUMQHTdddkZGn4OfJf3Nihp
 x9FXOs4fh7m2+AbBNMRNtpLvNa3OuwWuqb8yx1m1ccM7OMpKokqDQiVap9+6bI9y8/CCg5MXOaF
 zf9VR/ogGqpBWtbCiRcOMHo+tMymgF2DsMNHobIwyukBOTY/dg9mok5PIBarL7DrEjmYtSuSMmi
 cR8DEjx8jynKaZuxFTxBQ3ta0s2sUk/h8dmx4KcaVMFAJLzGhm1E0sWKtS/Nos6JjmmjP0KMR1y
 Bbej6eKROTskkW5Fg2F4qL6qf5JfU5C+hpwYN3OEnSgAf54LKIBW0uTweVwGYju5nUEh4Tf8Yiz
 et0rvViK6DvnwoqFOtj5/Fg8i2xE3EpT6OYe9eBqxrkMe/ynuQyCXUbnFLXn45a8ZsWshT4g4FP
 1RApJSs+DO1jHdA==
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
 drivers/gpio/gpio-moxtet.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-moxtet.c b/drivers/gpio/gpio-moxtet.c
index 61f9efd6c64fb4babef5551fb2541659bf5a542b..27dd9c3e7b7717d43cad3d4c6de019c9401d05c7 100644
--- a/drivers/gpio/gpio-moxtet.c
+++ b/drivers/gpio/gpio-moxtet.c
@@ -52,15 +52,15 @@ static int moxtet_gpio_get_value(struct gpio_chip *gc, unsigned int offset)
 	return !!(ret & BIT(offset));
 }
 
-static void moxtet_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
-				  int val)
+static int moxtet_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
+				 int val)
 {
 	struct moxtet_gpio_chip *chip = gpiochip_get_data(gc);
 	int state;
 
 	state = moxtet_device_written(chip->dev);
 	if (state < 0)
-		return;
+		return state;
 
 	offset -= MOXTET_GPIO_INPUTS;
 
@@ -69,7 +69,7 @@ static void moxtet_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
 	else
 		state &= ~BIT(offset);
 
-	moxtet_device_write(chip->dev, state);
+	return moxtet_device_write(chip->dev, state);
 }
 
 static int moxtet_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
@@ -104,13 +104,11 @@ static int moxtet_gpio_direction_output(struct gpio_chip *gc,
 	struct moxtet_gpio_chip *chip = gpiochip_get_data(gc);
 
 	if (chip->desc->out_mask & BIT(offset))
-		moxtet_gpio_set_value(gc, offset, val);
+		return moxtet_gpio_set_value(gc, offset, val);
 	else if (chip->desc->in_mask & BIT(offset))
 		return -ENOTSUPP;
-	else
-		return -EINVAL;
 
-	return 0;
+	return -EINVAL;
 }
 
 static int moxtet_gpio_probe(struct device *dev)
@@ -142,7 +140,7 @@ static int moxtet_gpio_probe(struct device *dev)
 	chip->gpio_chip.direction_input = moxtet_gpio_direction_input;
 	chip->gpio_chip.direction_output = moxtet_gpio_direction_output;
 	chip->gpio_chip.get = moxtet_gpio_get_value;
-	chip->gpio_chip.set = moxtet_gpio_set_value;
+	chip->gpio_chip.set_rv = moxtet_gpio_set_value;
 	chip->gpio_chip.base = -1;
 
 	chip->gpio_chip.ngpio = MOXTET_GPIO_NGPIOS;

-- 
2.48.1


