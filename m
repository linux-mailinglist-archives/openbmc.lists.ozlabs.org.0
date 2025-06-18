Return-Path: <openbmc+bounces-248-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 445CCADED44
	for <lists+openbmc@lfdr.de>; Wed, 18 Jun 2025 15:02:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMkRH0Q3lz2xPc;
	Wed, 18 Jun 2025 23:02:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750251739;
	cv=none; b=kaVEcuG+7+3AbPsaBfbtGHZKwM9e1D+y8hYJUaMY61NkRxi1giGVgVXWBliHDPswjDbBuTYHTG866bw6yA0R/smrv5Vo8G0Jt5yhJk+UWvktsSsfSD4wGhWIR61pUN9ZZQvUKY7x5xmZMLcEB6eKqGxCMPDtmdZ1nf4WcLWggao6YF/OS73hMrM5cxK2k5CzX4xuUBdiHWPZNdUXk4IXMqsxG32SFxbYgXADv8jOr17H3+qiR2aG4YKXffBn28neNsYAwFlNseIe6waB5ef/eUYKV6UwChMWtVyUC50gJfXu7uMiTPJliaL/d8fCU6piQD0+HJ9h1otRFFagM4pvyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750251739; c=relaxed/relaxed;
	bh=AH0Steq2qqIiSJsDn+92JXuGk7wz9S22mj+i5N9AA4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gnhoQSkMqj0VYX3D8nKnAr64XheAtvA9/BADgD41fFzo0qWMUliRDm1E/mja7jxslmhmVIckK4jjMRUxqgSxJM6UyQRC4NJGTvVXdrqrNuOzLGeoTb+k6NNG6br3bOQtAnx6LYAy1t6pT1cWRGaWNiBAMuZGBYkfKuQM4CrmDHsorZn6AFeG4pXzJfBbviDXGVsMoftwGdUB5S+f76AQo5+b8rIs2lB02El3u3PII7Ni07VfWmUluGCW110q6RptLVerUgQyLM3B0+82AdmoTPljxZMLRG4j52jkSWSJcGec+aEOTCnZCD51AkRazymboPAQrRyXcUa7IDVsxX9dAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=wvbhDrPH; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=wvbhDrPH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMkRG01hrz30RJ
	for <openbmc@lists.ozlabs.org>; Wed, 18 Jun 2025 23:02:17 +1000 (AEST)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a525eee2e3so5127129f8f.2
        for <openbmc@lists.ozlabs.org>; Wed, 18 Jun 2025 06:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750251735; x=1750856535; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AH0Steq2qqIiSJsDn+92JXuGk7wz9S22mj+i5N9AA4k=;
        b=wvbhDrPHgPklujZZ+ODaPVoAPm1tAWhL1TJyuqxefxDL/CYKGEd+QeKLLlXfVHFSki
         AJ6i49x4BJhgE3LuTREuqBBPk1tAlU0ZsmcAyXkCBnY4CDARIC8q6yBZ7CwauR3XdXGg
         SxYyVpCce/L82grpnik9Ag9E0UEBbmGyumb7TKAQ9hmUvUN/3oNhTYAxxnM+ZiCkbNpc
         mWqrMTqKzNEF84EA5gG4qB96dpLuVKWwkIZxtEMO2gUZKfDelfbv1KHPB5gl+liBewsY
         vuUmURYcnx3fvdPIxffQR3gnvv+ct2GWIQPD2Ltgk0vJZ6rR4VbBndonMklBFHXK4kGW
         XxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251735; x=1750856535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AH0Steq2qqIiSJsDn+92JXuGk7wz9S22mj+i5N9AA4k=;
        b=xKAciGZW43AM507rBJQVjPholy7r2ag6GkG2h/+v9gfL/0/6uiEOoxLhuMBlOSMBsh
         rSo3uWWVZcXZtwdVAskK1jHGHVK+O5q7/9+DdTZLCLWFooeDWDaf69xjaCAZ+0sIZYqP
         f/3/jE40JpJftNErNzkNKdVJ5HM6jON6Tn5nx5P4wvBfqrKa3dUPOCFi7NQRgTeCSktM
         6+qT4wrq3iJqqBFYmm4RThKjlraOelLWHG+oSL3dPrtzEn+wr/Z95WVr4k3GPou3qCPz
         wZjww2dj9S1Yw5M4+G0yDf+fTz91GyI7iWMqKcmQSYG2WFrZD8dR3n6w3/r6vv3A9Bvc
         eaSQ==
X-Gm-Message-State: AOJu0YzgruvroueLpyEhvcRe5f4rdnD4aNh2NmPIpz9hhuvbh1pZQPiw
	TDRKoPyRCsAcEOA5+KFAddichH6AF3DrPMt3z9PBpW/0IUS7YHeibehguxUruqBDFf0=
X-Gm-Gg: ASbGncttI2Gjk7AXisJF6RiQyDVmbRGdFE1xSYLVMhAI2WlwlxeTOkLUKW8SN7KMi96
	0VdJOW/xh627+TkppI2vu7wBvMGhMc9uxYeM4zHqNwXJSU8MrokAdKBM77RkD4Wt6mXSjRsIQB2
	YG/0h/IF6U57esLmly7KhG2nvDCUwpFiHZDqAI5kx3PHK6lFyNI7qppfUugrZ9AG+1Hs8t+ZKpc
	JoMBr2FLXUCnZvEC/vwgXvafZw+BVnnl0+UTyyeGvTCXKyyEkKJdljH9NztrY70Lf5eI6btsa7G
	mgB7hkfxGiTpYKGzaghTqnE9srQQh9ZHI0gfEf5Jea71P25GocNu9RM=
X-Google-Smtp-Source: AGHT+IEhGYD8rPoQTR0NvIwKKBaqZP1caPoUwsbeD3e3vlQF0mkMGzzBTiVfbGBa/VJ+41wnK7MJUg==
X-Received: by 2002:adf:9c83:0:b0:3a5:7944:c9b with SMTP id ffacd0b85a97d-3a579440d3cmr11204956f8f.16.1750251733814;
        Wed, 18 Jun 2025 06:02:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ad8:9ec2:efc8:7797])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08c99sm17043595f8f.63.2025.06.18.06.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 06:02:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:02:07 +0200
Subject: [PATCH 2/2] gpio: mmio: don't use legacy GPIO chip setters
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
Message-Id: <20250618-gpio-mmio-fix-setter-v1-2-2578ffb77019@linaro.org>
References: <20250618-gpio-mmio-fix-setter-v1-0-2578ffb77019@linaro.org>
In-Reply-To: <20250618-gpio-mmio-fix-setter-v1-0-2578ffb77019@linaro.org>
To: Klara Modin <klarasmodin@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2884;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=TIwebD7wWsPr3/j9GB3hInJeu/m3jlEpiVULpw4XriU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUrjS9dqDSVf56sYvtxzf3Ws9zK0fSUjUmTabo
 KhnPcnNcHKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFK40gAKCRARpy6gFHHX
 ch/ED/wNMcjqlojE5KBbR+JsUmiuDzwcVj6yuSnCRbCpxWsSXAMMlFMhO9zKtuf8vg0dymZ01Sq
 MC25JKpSkIzRvrNgYQLkqboSYhL9VJt09I3LleYYmPUarepFnaXytWA4Y65xSGFi1wOocDhjuwg
 MbryYqSN2rbASkUemBSu7xlw5Q14zu5aVDy5B14G5E2zlpQBmK7N38bTbmOYzOUmw1uT3iIJ8gE
 7ZgC8CQCCb3Wv1FFO7XQ8dbTQYRx8nYTmYIicwG03jOSuFMcbA3ut6cr6v7DbwaqczJmrdFiM9W
 e2pk1QPvT8AUQtpjhl5n7PJOCjvHfdR4RWPNSD8CP4ZktU5DWh0tlKuKOT3h4CK6Uaf2l6hpZAG
 o4AIl6BrOI9tlfq25/STr4+iwYZI8TXyaerb0jVBI/jca8jFcy6w82u6n9lUMwOv20Vbc0wWkfD
 tOA5thyYPx8dUWPiKNvYZ+MDx+bj6KR32pv/N+H+EB9b+FePtPGLV0wWG4t4WOZzJLoWTiJo8PJ
 6c4RMPk4zz4hDiAMYLjm0x11/on5zwI6Nk0yvxvrnA6QpBqV0jcfCEyoHmHwA9092qWAAmu81WE
 cguN5YUlVGfb2/iqqzVQw/7XDN7I7APpPpurpadJrcWtFB6Fo3f7AUfrl2WMh1Dh5q4DVBVy/BV
 PVnTLVUOLeIsk5g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We've converted this driver to using the new GPIO line value setters but
missed the instances where the legacy callback is accessed directly using
the function pointer. This will lead to a NULL-pointer dereference as
this pointer is no longer populated. The issue needs fixing locally as
well as in the already converted previously users of gpio-mmio.

Fixes: b908d35d0003 ("gpio: mmio: use new GPIO line value setter callbacks")
Reported-by: Klara Modin <klarasmodin@gmail.com>
Closes: https://lore.kernel.org/all/2rw2sncevdiyirpdovotztlg77apcq2btzytuv5jnm55aqhlne@swtts3hl53tw/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-74xx-mmio.c | 2 +-
 drivers/gpio/gpio-en7523.c    | 2 +-
 drivers/gpio/gpio-mmio.c      | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-74xx-mmio.c b/drivers/gpio/gpio-74xx-mmio.c
index c7ac5a9ffb1fd1cc9439e3320d54574bf0cebbf6..3ba21add3a1c669171578ceaf9cc1728c060d401 100644
--- a/drivers/gpio/gpio-74xx-mmio.c
+++ b/drivers/gpio/gpio-74xx-mmio.c
@@ -100,7 +100,7 @@ static int mmio_74xx_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	struct mmio_74xx_gpio_priv *priv = gpiochip_get_data(gc);
 
 	if (priv->flags & MMIO_74XX_DIR_OUT) {
-		gc->set(gc, gpio, val);
+		gc->set_rv(gc, gpio, val);
 		return 0;
 	}
 
diff --git a/drivers/gpio/gpio-en7523.c b/drivers/gpio/gpio-en7523.c
index 69834db2c1cf26be379c0deca38dda889202f706..c08069d0d1045e9df4a76cad4600bf25d4e3a7c5 100644
--- a/drivers/gpio/gpio-en7523.c
+++ b/drivers/gpio/gpio-en7523.c
@@ -50,7 +50,7 @@ static int airoha_dir_set(struct gpio_chip *gc, unsigned int gpio,
 	iowrite32(dir, ctrl->dir[gpio / 16]);
 
 	if (out)
-		gc->set(gc, gpio, val);
+		gc->set_rv(gc, gpio, val);
 
 	iowrite32(output, ctrl->output);
 
diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 9169eccadb238efe944d494054b1e009f16eee7f..57622f45d33e0695f97c7e0fa40e64f9fd5df1e0 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -362,7 +362,7 @@ static int bgpio_dir_out_err(struct gpio_chip *gc, unsigned int gpio,
 static int bgpio_simple_dir_out(struct gpio_chip *gc, unsigned int gpio,
 				int val)
 {
-	gc->set(gc, gpio, val);
+	gc->set_rv(gc, gpio, val);
 
 	return bgpio_dir_return(gc, gpio, true);
 }
@@ -427,14 +427,14 @@ static int bgpio_dir_out_dir_first(struct gpio_chip *gc, unsigned int gpio,
 				   int val)
 {
 	bgpio_dir_out(gc, gpio, val);
-	gc->set(gc, gpio, val);
+	gc->set_rv(gc, gpio, val);
 	return bgpio_dir_return(gc, gpio, true);
 }
 
 static int bgpio_dir_out_val_first(struct gpio_chip *gc, unsigned int gpio,
 				   int val)
 {
-	gc->set(gc, gpio, val);
+	gc->set_rv(gc, gpio, val);
 	bgpio_dir_out(gc, gpio, val);
 	return bgpio_dir_return(gc, gpio, true);
 }

-- 
2.48.1


