Return-Path: <openbmc+bounces-148-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C05FCAD3677
	for <lists+openbmc@lfdr.de>; Tue, 10 Jun 2025 14:36:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGp9w22GRz3bVW;
	Tue, 10 Jun 2025 22:33:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749558820;
	cv=none; b=coKh5O0zBrdoM3aNPCuA29AtbdTPr1G8oEKJYcpP2DM2jVd3dJ+l30Ci9X+mYcXgTcz/C91FxV60Paq/Ja5koiJHoE5wA8hXGjGAcT/zJoIEnBG4axwiU0+45xuJ918ZUuGzQk1BTqvnH6NK0+23A1IFIZnmeGyMhdE2Eof04RUxRrPBMnSAJ8T+MCQz3/L0UT1cA4dhvp2Z1/w3NNiC1AsWyNjVvri7wudBm32ls3bFf07u30FGP0oZNuAaFVkOz/ZKtTkdgObhWxr1B2twim29+JUa1MWxKK8ziez78DAL5u6U8NSWczajFRphpuaLDoEMiNBKN8hmqMKjbnRGKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749558820; c=relaxed/relaxed;
	bh=v8UnWEBUMwJQl9FRSZdvSbH7HNUPtGYFMHksq5VfCCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G4P2ahbXIvpwdw4mQmnOOpLWpX5xkVK04xp+kCLyMr7ZABkeHhR1YS3zygYPxZq8jMZzim5Mwzh6LhFtRFWemK6QXmAzWLZ3Per60PJy7aooMe9kMlGL+kmHsnWR4uV5cW7cTiAxvOEF2DstGJ2s8r07v/acgUqGd4EZnu6YuM4xTgtqj3rG+ePK67wGHt8kW7IJ49OSxN+ikbJbd82ulPjXTYw1q8SL+bCu+++JicIMx1BK8jvXlMwtbwAdvaC1gSc/wG+fHn1BbAgArmvf302YLc7944+5rS+mrXoX0XI3KTtOWnUDT+n0wbM2W00F/HXz9d8deEv5x/UtnHmKEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ufimrRsm; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ufimrRsm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGp9v2Rlqz30WQ
	for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 22:33:39 +1000 (AEST)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so29143845e9.0
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 05:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558816; x=1750163616; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8UnWEBUMwJQl9FRSZdvSbH7HNUPtGYFMHksq5VfCCE=;
        b=ufimrRsmj3RGuPeBq/9PxDVwkcNpsZdme2K46bYt0koTRE82MpZUWd3pzfm+KK8Qp1
         /DQ4ybj9YLKTBiT0adKdNoD8DiuyWJhSaqKmgUCJsOPVTYSnScw2KNqDTfIcWfJdv8t2
         1n7isQL3WxYpiMf4n9Di+uBleiY2I9LmYsA/+7VEjm+Ire2d5I3YUW5gxGgQeXYtYlpY
         qyIUSsCG48li1j//QCQ8sz7seu/nwX/Rq0SMxsAQ8MkR/Rd/F5D5H/eCldg584Jmiwkr
         7x3ogwDmLPtqMwbdWYMWA0FtupIzT8zOZa93rtAt8hq2cPwxa2SSXeSrg7TLAOfzGPMg
         ZeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558816; x=1750163616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8UnWEBUMwJQl9FRSZdvSbH7HNUPtGYFMHksq5VfCCE=;
        b=PelMUVdNpVS5zc2vWHJTj30Bz/If2N6cmQvIu6Yp68uOEF+0DDr6Ji4nuRwJA2p2lW
         RD5OjR/afb+2OheZbTF3vntGwdlx6xZdOHsk9co1rgw5DqLjkTTV5RspOIOyaHoSP3UD
         61sGVWML41FRo5M7zeJzyyuvMvAx7vOFbnk/OZZaDfjJ/jtzkkuYDE7y4KUS55XwPwdh
         54BHo5vKEdOKeYfDbGq9u4p1urGTbFZduN2IUb2YSAcbJKvDKJuFUPNN0h4kdaRMACj8
         hVlxs+3f5RL+VMOHqNKnEW3A08VvJbs8uEDzD/1+8ngnOLfBtptrwErQw0EHD47slJ35
         PzdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUAD5krVl1Dis2ucU8UtmSB91U8nJkr8NR8SE7ZD5hUlv3XTMN7Y7fmXZsaFufA7rkxjDJPxX4@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxGtWsHyl3HonLvBJX/cUql92CdkXX/dL0zy688sVvecMs62FFH
	bFRC/k6MIZkJHWilFdxwAmGEsRusWrBLe4ms20zMDCVbPnrRoUKN41x88TEMAP8jc5U=
X-Gm-Gg: ASbGncuSrHzK8Z7C/kSH0FX23CgzjxTNYWyujplEKIFoBYQdeym7gE5LPhITm68zx3q
	KIiHEJx9EesOIDKteZtd/RFCzJg1LtYsfiS2ej40S3YtzMOZY1prKGqKDmt7j91ufOsbWbq3pKc
	iq03B4IPh8c4DjPx/j8fkWwMLV0EK2mBb/+C+OBoS+2kUpo4sLnkmwlsTajLQ6IXenUFlpUpwbM
	XvnJiLNN7fupCHGPpx5yzrtlkmrd5wN4fJ2bUSABYeIZSJzMefKQJJmrikPu/xwxULURyuQT7Gr
	aN5tBhMtLWch6BYWj7vIZqzLV5r02VC+QCko2D5lxggBd4TktmJotg==
X-Google-Smtp-Source: AGHT+IGEb945pctd/19j/70DlEklbdpCSjS0SXNKlhgiB1IZnKkMVBIGu/KwhCfcg7w0J6nsDegN4g==
X-Received: by 2002:a05:600c:354a:b0:453:aca:4d08 with SMTP id 5b1f17b1804b1-4531ceb5f3bmr32427015e9.1.1749558815837;
        Tue, 10 Jun 2025 05:33:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:22 +0200
Subject: [PATCH 12/12] gpio: palmas: use new GPIO line value setter
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
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-12-3a9a3c1472ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2364;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=EJnUqbYdFsX+B+uS77CC3tICbyCNOST1Ifh9i66zy3o=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYQH0s51YOk3kPi1uWti8T4ohdUn/yx53NBp
 EPSYm2TbnuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmEAAKCRARpy6gFHHX
 cl6HEADDb/gC8UYIxfieGcIPlCLMVRxpN6B1QvZbRdjguBGn2V1R4KRaQVA4VHY6bdnfwHfmTEs
 PyBGCdOw5W7KfEBvAHi1BPRg3jZ3AhPL1MBtsbCUu3wkmJaME0MAZRi/9kTVnBd/90m4ady4fob
 ZiVpTNRYaxU5/agaxspedLUZ8yS4ru+4nvF6UhNZ6xCbzJJ098pcxmRPwL4nP3Kk1aFacQAXgoI
 RlFmAUUCPGcr+/1hQ44LYPBhD9CFSxqmk0/peAbcioUE+37xiupVSMPVtmphojgLgRG39WdsAW6
 wHLIbw8YDioA5qjexp3hLxB9k//QX08V8iDF9H4FALJgdECvDhjcNfqx8yoMW+M1koIJkBDfnZX
 ng84ih0EIA0Wh6fqeKTsbJ4JOE6/eR2EdcuY3FxX2k4O2JDELoEnc/UERh5Y4DHuNtG520m7uyt
 D2MG4nZJAZjiBZ4wZ1bDW0t09L+XCI8V/1vpwCxDVmhkEeUduyWT9w1zTgWQ7at0NdbYAgZ+nG/
 jmrJ7UptwMJ4P1yZmWdfEYXlSODp6TjS+tPzWIXQcLoS3eRRpTav7CIm+nr6xe3tNiOPBqNb1H1
 ZqpzpL7iVd8AuUaR4K75BWnU1tcbiTDFsuLnE8/CZ51sfmEAj0VyEK/pDJgoZj7ekTL7Yr/ve8p
 M8J1VvOFz+l99wA==
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
 drivers/gpio/gpio-palmas.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
index 28dba7048509a3ef9c7972c1be53ea30adddabb0..a076daee00658a9e423a0d78f14ad48d61956d7a 100644
--- a/drivers/gpio/gpio-palmas.c
+++ b/drivers/gpio/gpio-palmas.c
@@ -54,12 +54,11 @@ static int palmas_gpio_get(struct gpio_chip *gc, unsigned offset)
 	return !!(val & BIT(offset));
 }
 
-static void palmas_gpio_set(struct gpio_chip *gc, unsigned offset,
-			int value)
+static int palmas_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			   int value)
 {
 	struct palmas_gpio *pg = gpiochip_get_data(gc);
 	struct palmas *palmas = pg->palmas;
-	int ret;
 	unsigned int reg;
 	int gpio16 = (offset/8);
 
@@ -71,9 +70,7 @@ static void palmas_gpio_set(struct gpio_chip *gc, unsigned offset,
 		reg = (value) ?
 			PALMAS_GPIO_SET_DATA_OUT : PALMAS_GPIO_CLEAR_DATA_OUT;
 
-	ret = palmas_write(palmas, PALMAS_GPIO_BASE, reg, BIT(offset));
-	if (ret < 0)
-		dev_err(gc->parent, "Reg 0x%02x write failed, %d\n", reg, ret);
+	return palmas_write(palmas, PALMAS_GPIO_BASE, reg, BIT(offset));
 }
 
 static int palmas_gpio_output(struct gpio_chip *gc, unsigned offset,
@@ -89,7 +86,9 @@ static int palmas_gpio_output(struct gpio_chip *gc, unsigned offset,
 	reg = (gpio16) ? PALMAS_GPIO_DATA_DIR2 : PALMAS_GPIO_DATA_DIR;
 
 	/* Set the initial value */
-	palmas_gpio_set(gc, offset, value);
+	ret = palmas_gpio_set(gc, offset, value);
+	if (ret)
+		return ret;
 
 	ret = palmas_update_bits(palmas, PALMAS_GPIO_BASE, reg,
 				BIT(offset), BIT(offset));
@@ -166,7 +165,7 @@ static int palmas_gpio_probe(struct platform_device *pdev)
 	palmas_gpio->gpio_chip.direction_input = palmas_gpio_input;
 	palmas_gpio->gpio_chip.direction_output = palmas_gpio_output;
 	palmas_gpio->gpio_chip.to_irq = palmas_gpio_to_irq;
-	palmas_gpio->gpio_chip.set	= palmas_gpio_set;
+	palmas_gpio->gpio_chip.set_rv	= palmas_gpio_set;
 	palmas_gpio->gpio_chip.get	= palmas_gpio_get;
 	palmas_gpio->gpio_chip.parent = &pdev->dev;
 

-- 
2.48.1


