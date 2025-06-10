Return-Path: <openbmc+bounces-146-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E153AD366C
	for <lists+openbmc@lfdr.de>; Tue, 10 Jun 2025 14:35:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGp9s68sNz30WS;
	Tue, 10 Jun 2025 22:33:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749558817;
	cv=none; b=k1BPZi9jlUV+wc8TJDV8WbMLeiigmk2nGXWW5MA+lrs9IUi5ZtDMbeW761npt03yuwSLQjsO5PkfFKF8hTrHjlWXO4ZVtVPCPIpwVqqOo/+/CpWNHNjXt1ecNXwQBzpO7lL+nRzJOMZr4YWPKbVBExj3rU7xAzr7ImoebjFRn6j+KWeUJQfOJUzzMfXV8kDVb0PMu2pRsK321mtc5BO0zm6nYphbg3TMX+TeBxMRe3G4UF/PYCx5i6ESlONnZiv9bDH+SoBCMZq9L8psawf4ypoBa7Kh5c0lwL+avLrkAjaRwXnLYz+crOjthHTYMNzBGhEp0pKtaRwnHOC6X2j+3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749558817; c=relaxed/relaxed;
	bh=5efislHrp/JRAcyS3DpceL6NreL8VPyCFAzfIt/z8uY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W33R9ZP9SxttvneVuUZo7jY4fjiTCP1K3mIYoB/0H0n7ViP0amMZNuI/4rZY06+Am7MJXP7KZluqvZKSxhboIvgLjUGTDCODtlXgTICvKtk84EGcZrWo9f0d1vlcDS76g7OK1z1QppEjsPNqxHg+R0XcUOZ1J4vyqo4qYRgG8tjQ7lFkxQsCz5ImFvZp1Ocm2rt0/4CrUDvEXPlxZIauzO3tTw+cBEWI6ZOlK+j3OBNeBW46UPH5I4FfSZ4WiGJwCh5SXotjLRZhsDVuxxFkWRxj9q6TrQZl2jByjbh1n+oOEjyWi+fe7tSB0oJMDZsXt+/pCo99mYWvrYZFRSmp1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=U1dTyxn7; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=U1dTyxn7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGp9r4nkGz30Sy
	for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 22:33:36 +1000 (AEST)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a53359dea5so2245842f8f.0
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 05:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558813; x=1750163613; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5efislHrp/JRAcyS3DpceL6NreL8VPyCFAzfIt/z8uY=;
        b=U1dTyxn7EHzV6VoJ0L42yaEIxjRKEgkLLbCO7YEn5DYGt94G8nd7z/heehClxaQeyy
         7crfobCIbk4TC7/+PXcy05xRvXmZ5ZN5U/qJEasz/dzp75NMqhYUB3gmAEh+dbQbaIJ8
         degnYaNg3TiMW7mkViA4W1GEXfCLXsLQT67FQ1JnnNrE7BN6p8BJWRpHFDoB3/LiAnEN
         fngrT5OkFyInKlScrPJSdBmZQdfey9ut4wJr8y04NE+eVpfR7s0v4GjdWzvuNrhhvHLe
         M18ufFB9XbIobHIcafroDtEU1KWq9ieRF5b+upT/r+W60kb0s3tQIUi3/6S2DBa1ZQMG
         hOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558813; x=1750163613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5efislHrp/JRAcyS3DpceL6NreL8VPyCFAzfIt/z8uY=;
        b=bgNNDuYyijUGrI9kl2WH/FLGDcNpYkvY91tXmwLJbki+ssrn6JKmzLapafbY7XQzzp
         44HiP0drSh6m71K+clRsUAUa9lynO68XxSCielh7rCP5ayaf08Xuws2LDMUxKMj3Iqun
         1wlTJTKVZbaap6gDa1zlnI4ooWxk6ZCMR4/T5j1nZVa4mKGhq53Oq9k60mb9JLCf3bdF
         nt6wUufUFvJ62JHFs+ZvTEC7+yFiI5ElwLb1/q0f/O0YgEj/JlfPIxnTaajE5beTOU+o
         brpyPfg5hlU2iwr8ixAmgZkYnd5pDudxYawfNsEDJuTxldjbdVQkUjyOzq+F45YDCUT4
         1QYA==
X-Forwarded-Encrypted: i=1; AJvYcCXpMJ7Um9yqDAkXpkR7L9tjdmaLrLvNKcMZQhvg6b0AiNZbatalLPk7up+4jkUrPbS9aONomTau@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwVhi66k0QdlieHkSkxwPtv/haJzgKlUGbjY70GZQMJulB4NYyL
	NlgKrrUofRXgDe8oDewOCC2rlADcBh62Nn5Lxvpt4kRJzoWfYRUu2luq4POFVupu3Po=
X-Gm-Gg: ASbGncvs/sFaEsVeWpFI5evpjfaRjEUMM/pb5BLIWM/uZUUNHJM3urGxFM/T+pPBusZ
	8WeQF8Ry25N1WwZd789oFssL/OfTeuHRcembwLaS0ZDlFtqyLgs163eJod+LVZFgJR/O4bTsSgE
	pY/TD0u+RNvR7fPPLdriDpQoOYeW1rnGDqIMy8l3n5cSRXR+aZBXvSzqoK3P7rssyJU+CCYav4i
	xuT/EF2M43f8K5SqQB7dGa/BZXeBCzFir+XqvpV1Oaw4LcHt11EMiX+u7OMN1Hv2A7lltPVYjMn
	xw0XsRXCgu1zalSFq67GN2jDb15GJzCfYVoC/ndfCdQ744m+n2nJ4g==
X-Google-Smtp-Source: AGHT+IFgyML87FC7sXwU9H5OuYAASfbZLFGVxDzw97GzCafTQDbHfQzd+kDvtAb5xiwbEFxqnYxW+Q==
X-Received: by 2002:a05:6000:250f:b0:3a4:d02e:84af with SMTP id ffacd0b85a97d-3a5319b5ca5mr13136061f8f.58.1749558813586;
        Tue, 10 Jun 2025 05:33:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:20 +0200
Subject: [PATCH 10/12] gpio: octeon: use new GPIO line value setter
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
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-10-3a9a3c1472ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=inYE0B+JIbFcYN8GhgAuP7ekd2fsyKlPqwAEHBeRQ6M=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYQkSSfeELcCg3oaC15IzD7nqU50aRHnj20R
 3Vt+fMHWlqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmEAAKCRARpy6gFHHX
 cqyAD/96GLYr1WlD8IQwvSvdKxhhNMNdPLuDvV+muwAcy6JTo0yVwtFi29APezY85UQRA1fBdH8
 tBj9XT9r93hwmuW1csYQjI0Y+hbNfmuqJcmQBr6Dzc+ADZk0/dhgqr5t3VHtV/Ur5QvhQGvn+k0
 2lsUOiGUQvMHc8A04WFfw6ek64gegW0vBC+68qMehtMzvgGAwtsk3D9VnjQ0GjZmqeVb/r9sGrz
 Eu41NcHjU6rXmgqDfSm2H1qMh+Ak5Dp49H9cDZbQ0wM2ODNFF3rLCiuZSdMco7jGPXJhK+BIvQ4
 hi7fC69+1/XtsXP59x7xhKZjX5bYObsb9oC6CwW5BaOxMmXKR7Pt47oshFdfYmzRxaJDNYTPcdu
 gSxBr29xktm4DI9JI+25hY4hJQpSsrQOKCBxGiU+55W8miBMG8h9pe71LysUt8Fr8AR8LbZG5sa
 Iqj+eIMUujT95lGnffsd7RwYWfvennBwTykRmBumWcA1HNt7m/gzgU8Ktm6ZF8fkNzEtgu5yWrk
 ijJFq/SPI2UnsQcs5HEbTJe7Ujvsck3MfkGILvNmjHgK9NVsdY+Kla3dGFC0oqKxRSxxlo19Vvq
 mg3UGgaOALMKfIcTu1FOeAv+aBJudryS+uU0V2ore5yflhFusBi8OdDuO+BF/7pbSoZ7qOIkPV3
 QRPFnoLRMWGdKnw==
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
 drivers/gpio/gpio-octeon.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-octeon.c b/drivers/gpio/gpio-octeon.c
index afb0e8a791e5a8f1b3029c4ca890a5eb9b8efe44..24966161742a96082baeb850f124c71b894e9057 100644
--- a/drivers/gpio/gpio-octeon.c
+++ b/drivers/gpio/gpio-octeon.c
@@ -47,12 +47,15 @@ static int octeon_gpio_dir_in(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static void octeon_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int octeon_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct octeon_gpio *gpio = gpiochip_get_data(chip);
 	u64 mask = 1ull << offset;
 	u64 reg = gpio->register_base + (value ? TX_SET : TX_CLEAR);
 	cvmx_write_csr(reg, mask);
+
+	return 0;
 }
 
 static int octeon_gpio_dir_out(struct gpio_chip *chip, unsigned offset,
@@ -105,7 +108,7 @@ static int octeon_gpio_probe(struct platform_device *pdev)
 	chip->direction_input = octeon_gpio_dir_in;
 	chip->get = octeon_gpio_get;
 	chip->direction_output = octeon_gpio_dir_out;
-	chip->set = octeon_gpio_set;
+	chip->set_rv = octeon_gpio_set;
 	err = devm_gpiochip_add_data(&pdev->dev, chip, gpio);
 	if (err)
 		return err;

-- 
2.48.1


