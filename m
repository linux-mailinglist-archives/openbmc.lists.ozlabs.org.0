Return-Path: <openbmc+bounces-144-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5914AD3667
	for <lists+openbmc@lfdr.de>; Tue, 10 Jun 2025 14:35:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGp9q1FHtz30VZ;
	Tue, 10 Jun 2025 22:33:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749558815;
	cv=none; b=JGKuxvSNQw2DsXg9cFPTFdkiavXzlE1LXY+tjc6BdPiZ7HYqpu4rHy9KPGsp6cAGLDmLG5OGIx8Y1TVS2tUUhcqrMhR0tZFp4yTkPvTG8dIzeedaA9d+/woHXg2za9R9j7DYa4AJy8ko6nCz/ywdo4n1E7EiZmZjjcdSB8yAd1yfWMzNgv7HrA1vq3Uge3ssuaM9ead2qU5Di4jrJwQdLNF5CqvnV3P37J4EL7UVuwEJW/jJLJB+wXJNX8hDovdIra/5f/yIEVAoaw9y6RbZpSN+k+TwA0B8CadxY1nagtxXiKBdka7jexODnjljUt4UzxjnJTTT3MPVX1uJNzSokQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749558815; c=relaxed/relaxed;
	bh=nL73BX48X8AKgopehjQyiYACuD4u/nSLpuXvgAof4w8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NO0g5sZ6h0YVkELc49oeKCFMl/tWe/7hZ9O5quuyK96S2M+R7nHiOesl2MMV4q1WTvDzoN7bXetWdyGBF7lMSEzpwXQio0l+kbIql+bRoWnnHETjIFpbO4cHUT+l/GtgcG/HKj387/zEHuCvDMc4RHjcjjeIwUj3M3suR+a9anSk3hdMPqlRPoUkcap3nEyNQtEYpEDhFlGF0RAFs1/dccb5wO7js73lZAMKoKFEuciLjHzxed0XEANYCVnYr/CT3W3LEsGQ4/qlbW34aQwZsM2tgRhzS+af91RajqCnr8wal8W0Ns3dJfjTIqVBjs6hCnaLPHoBc//vnHnuG2kwXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=fbHuXqWF; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=fbHuXqWF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGp9p23YNz30Tm
	for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 22:33:34 +1000 (AEST)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a52874d593so5188530f8f.0
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 05:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558811; x=1750163611; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nL73BX48X8AKgopehjQyiYACuD4u/nSLpuXvgAof4w8=;
        b=fbHuXqWFR3TFXXfJ42WTELNEQrDksQsOW5jGApN/ak1/xeTTtZQlaiPeEuXwH9gWhC
         3A4k0TRaT3MDJApBBYnGbe2xWo8SrEbib/JTXwmOiGHPXErUaB0FiyIO4MVhxqieWkdM
         5i/wKqtcsE7aGphpJpAGITLhJLJvLTcbfQSweP755ADecTFt+dFhgA+zpu6NRgJT+ppt
         z6HC/WwSp4jN1uZHUm2hASLSZnCKz66SJjzmbTS2UzxSK8nc535GSwcIT7VvleWsBlC6
         Z7wJavAM0aVwbImWWiKB70iucl8D5M5fJRr9vM+4D/gDSJQUmvzCMytOTFquv7g4FXDP
         ZPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558811; x=1750163611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nL73BX48X8AKgopehjQyiYACuD4u/nSLpuXvgAof4w8=;
        b=O3B1viOD4Ctz1W/gv+SF0VkMgRB11HrZKnX2Jkuoc7eLWTQe2MMor14CzXpgFNl9F9
         x3q6IYmBexU2h4khWO4FNh0kOPWFzh4wrTDMwo/WCG6jix1lZKRrw1Nj40+dwVi9GCK9
         g0F2LeN6lFbDgmmfs+0mshfmRw9yFVU1cf9jk6VdjS/Un49BUOsCH9UtNzdxe3YqCzbP
         uZhf6Tf4soo4aldEGpl69k1jKnkKbzyCHV88RbhLWIJO1lJ39CxIb06XDF52C2ML1P7h
         mfdNW1GZF2pYgsKXFncIAtk9+0c4IMLh248BzwlEEO2FRfgPA7q5eO4K3D4DtGntKFWi
         xgFw==
X-Forwarded-Encrypted: i=1; AJvYcCWNJNcctFnh1EMTYpRcVqVlS4oE6UjxstyO1f966c6MhGQjAWfOz54wCsBC2I4qJoJI6V4Uado6@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxGF7IeC5zhOkUoFt5cBV/l8xZsgCRdQStIXopAjJWqQEjgY5L3
	KbrX5jLYY+IGv3a6f+qqqcwvChr8iWdN1sH8po+OkkLdOPtAEqwTZ2ZGdgmPFyTnfvs=
X-Gm-Gg: ASbGncuOjNyfP5rVqcKXNQhj52eCU7vgo7DmE1KnkrsYfdBc72vwmkYtspSZomFE4Mk
	0+H+QITUOLgGMVhb1hUNcpubRwdHD36mgmM/vd96BjEqFj6VECkTo1uvqGNF1wUkqBu6iewiaoO
	78+fO3+1/D+CzsDwjUFL+b2WcJCVlN+a9Tjx2MlmoHv4Y6YfSijE7JpKyPnkedvqNDNhbd+BVUp
	MBFeJ7VU3DlYKrN2aYn9rC8tdVS/aWOb8YPIz04giBaoxEakioq1WaX46Wb0oULATZUkR+cPyP5
	PSqBk6rHADvaY8hHotxkZO8g0hXyNooyTypYbS3O0fg6I1+71K+hmQ==
X-Google-Smtp-Source: AGHT+IEiNibcNMiVsbQHF+47L41QAAVONmrgvcTQ9HOwW+eRgKNTCeQ/gU2brhJ6L5+0fDStZI1sQg==
X-Received: by 2002:a05:6000:240e:b0:3a5:1c3c:8d8d with SMTP id ffacd0b85a97d-3a531cb237emr14618808f8f.55.1749558811315;
        Tue, 10 Jun 2025 05:33:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:18 +0200
Subject: [PATCH 08/12] gpio: nomadik: use new GPIO line value setter
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
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-8-3a9a3c1472ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1622;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=8SMFcEMP/yadOAddKphU2LRj+bMl3thvtyJ4brm1q7k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYPNZX7SmF68qJHpheQB5Bvy2U+bFuaYHRkk
 DPVGcTa+SWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmDwAKCRARpy6gFHHX
 coOIEACRhw6kCcmI6Qk5Uj1hqmX0byLLYekHcBjVu6C0ctu5rgUkddKMjGT6YzbWLvwnGp/o+az
 B7cu6TULK+CGHrcSoGO/JBAtpG0vLkNjQIDPjUr0j75ifLhmeuE0jvgszHFIFyVSHSOdthyj9w2
 rsEmzCLFLsSXCDgBh2oFj2EhfJhxZI8rkjn3ox02VOjRjDrtAt/aEljk/mSrvKj4Tq9biIjCIgo
 o53nCEEkmYf6kgeNtBRKqfNg0ddAaneqdwzZ7Sh25b72vVSBWwaBVZ6d6S/RsrYndL3woYZ87Xm
 /dePA8YZOs3Ectoylv+V7MZcEGuIZro5nVhzeMBOYZiBUXedMjRsm87FW9+ltwQUiAeZfQz+6zI
 nNOeWzApu4vwd0hMs9rtxT3GRXGaQKpXx+mGZBn1Yq80KptRmM/VUbh9rfGHjmet99x9gtRchCh
 2ACbns1aWtM+B5mgT7GFsDeG46pOv50D5+6uuGsTdssLU10ve6GAQpD6S3ks30fY9kQY8/FsvE2
 RKDd5G0DJ4BmukghAk+CEvLjouL/qWS+JDyjagXehsDB16fWjwSmxOKHF+TmaOC2M1uS9qiz5wS
 /6f3WIunj+fATUaxSl5bQdqcPthCVIh7B8BN296a5zC1QRO20KkJF/m6PNIGSKzstuOJNOLhYE0
 d6QPrHLcpkEmVsw==
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
 drivers/gpio/gpio-nomadik.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index fa19a44943fd7ae167079b34a48f669a38ec4ae7..296d13845b3009a52068ecacd8d2d6a25eede9d6 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -347,8 +347,8 @@ static int nmk_gpio_get_input(struct gpio_chip *chip, unsigned int offset)
 	return value;
 }
 
-static void nmk_gpio_set_output(struct gpio_chip *chip, unsigned int offset,
-				int val)
+static int nmk_gpio_set_output(struct gpio_chip *chip, unsigned int offset,
+			       int val)
 {
 	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(chip);
 
@@ -357,6 +357,8 @@ static void nmk_gpio_set_output(struct gpio_chip *chip, unsigned int offset,
 	__nmk_gpio_set_output(nmk_chip, offset, val);
 
 	clk_disable(nmk_chip->clk);
+
+	return 0;
 }
 
 static int nmk_gpio_make_output(struct gpio_chip *chip, unsigned int offset,
@@ -672,7 +674,7 @@ static int nmk_gpio_probe(struct platform_device *pdev)
 	chip->direction_input = nmk_gpio_make_input;
 	chip->get = nmk_gpio_get_input;
 	chip->direction_output = nmk_gpio_make_output;
-	chip->set = nmk_gpio_set_output;
+	chip->set_rv = nmk_gpio_set_output;
 	chip->dbg_show = nmk_gpio_dbg_show;
 	chip->can_sleep = false;
 	chip->owner = THIS_MODULE;

-- 
2.48.1


