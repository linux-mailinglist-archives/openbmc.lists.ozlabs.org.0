Return-Path: <openbmc+bounces-137-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2320AD3647
	for <lists+openbmc@lfdr.de>; Tue, 10 Jun 2025 14:33:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGp9j0ncJz30BG;
	Tue, 10 Jun 2025 22:33:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749558808;
	cv=none; b=bCVlqrMkkd2xUJfCLCf7ws5jawBLoR5O8TIFnoWnLCK92cADSF3vUZLFEyU746ppTe3cw0U2FCs9WLzs4Eod/OsmAE5MHLkmq/4RyVq84Hxp0cX3ERzjRO4xFgDViiHojaEusL3mnlkgeCv9npNHKMxpGVMJtXEhjAS1dbknmoANGEID6UNNF7q6i19VYluysoDZQONsQLsyK0Z5QSrwezngIi9RdVEU4wnCJ5ZnbczbOGUzkG4UfbZmzeRSHLG1dM5v36a7gzUV3Fsqd79gxLUVantiS3CYWRK8m9oAGnJjAh+ojscsP97y7aTGkDLQJWFp/58ztRUSbJZ2qd67ig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749558808; c=relaxed/relaxed;
	bh=RNc8thwf36Hc/crv6zEElCG/dHhZG4znGHrJi9L7hvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V/ELYT5bmckAD3GRY5Z8I/H2tbwOnDzivWzyix2Ezv+gQRSzXyIB0Yg99J+qRpyiL3QsvaKqHD7bBXA2l7+HPlbp1/c2DRTLUr2bt61KgBvVxZPqAccvioO7ZIldiTrjbCDb7J3er4QSHWn91bSWftb7Pn/hA9fQJCZMoNVXFoKQQFxdrlI3tT2ejyyP11i5trL2EhpL6qFVhZ8MJ0e3B1r8ZJuf50QQizI+j4wj/UgF2AJ02bvl60QMpIakUEPoCMB7PvQypSFjyV1FqOj1CmWvvjWMM67sDzzgBAIsYOXIq7NW+mb2nW+8D407ZKL6qKJcb+5njjErOme2TV7b/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=kpb5zrxW; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=kpb5zrxW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGp9g0YTnz306d
	for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 22:33:26 +1000 (AEST)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a36748920cso4817764f8f.2
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 05:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558804; x=1750163604; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RNc8thwf36Hc/crv6zEElCG/dHhZG4znGHrJi9L7hvE=;
        b=kpb5zrxW5TeDNUBKW7cYqwRcVqhe9dnWB9+76yQ0ToD2DvG7Cskq6KNrsPQdnzuowp
         LiIuYo2Yg5Uapt5fn6ManZB2EsxnjZtKcjfmWJ4171Z+Ygxekqa9QCczv6/UnjWUFGAl
         voO1pk9X4m+/5/eMWhdVS4uxOw90ZbrNX2YNnsKKpDrSaxFxfB0O2CFfpj9/B5dgGYN3
         A42X8ciayIzOYdiCRl/wnhmXtT+2dl5Rc5ZDbc0fTC0MXzSirbhuqW4y4ox2eOYmT6tK
         nOct1tXwwRPTdOATptYqOb3LQtg/9mZnuLvbjg+K4kPjHChtQqSTQPxG2W5n1FPQFZMC
         EWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558804; x=1750163604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RNc8thwf36Hc/crv6zEElCG/dHhZG4znGHrJi9L7hvE=;
        b=DSL8u8jrE/SYrZYDIEwbuP6zbP5EARmj0gcukmSGrV7FWn1me0YaiEtdw7qdk4YtxC
         ZwTcvObAAxJaGPVFNaWba8j3lHo2HtSWeKD4h+iGJL/EaBliK1wgAFPwKGwGiAo0D0MK
         oqHkiszBjnhbxc1fWiVNUv5+FPnDPOFCQIZjWkNEDfLMSui2oQH58xgKgtbb+pKI8GDV
         776ncSd8G+LhLWu5oEUt7zlflz1FeacJnP8h2YOY91TS4T6EBVYlhSzgQ5aW3UwY72Dd
         vzaePNS7oHY8XnVh3ib+RVnRvNuhyr7JJBoCcSPCp252jGOJ4AIgbm8gr0NLu4lPez2t
         5gsg==
X-Forwarded-Encrypted: i=1; AJvYcCWEkSqTpy3K6lWbvLMrqomprxbR9Cujss+rypfPEvwAuP0eh8BLyAlbLQEpoMKTuMXCmEOcBFZo@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzXBvuhCZD3q55nz7OrG8f/23My5HdeEiuQZ6ZyRzKBqrNlsHxT
	uUNgLhJPIMdNjxTO/0Du8YUBTP+uFx3jqjPW4uJWxO3Ho34qJu/4mPZHqGnH2J7KsR0=
X-Gm-Gg: ASbGncsb+4CBnRpPjDDiT/lRAxCIWkyrtEeSm1c91p/9HyUyJQCsw1QdhogIRD5pHxU
	ns2m28zyD/+351aHx0bDPbeBI1HjGsiwpkJH6t6cB4jE48j8b2M/uHBTQ1A8HkNxmnA61FvwBOo
	UTws7alFnjI2K439ZE3vJ+EUGCgkgg91RYPOKpf9BaklWGfdJKojqIiN5eEj5BNSCWy71bkrDD1
	HfH0rGmgM9XDBhU1ujqGnYmTv2fwH3zUuwU47Q+VSReBjPhV77MyoU3ZQsdY2rkZJ2INiD2Y0k8
	Aiuv1UfVhJ9XPSMx8KaDxvKedR1Sk5JMnl+F2ql2sZD1+yRDSR0G9Q==
X-Google-Smtp-Source: AGHT+IGV3Vn6yhZaRUVNvlMafFgkrcv+bSXbOKrnS2PqVCasr+PxmHXeoHC+wE2lIVXIMNJyFwWweg==
X-Received: by 2002:a05:6000:2504:b0:3a4:dfa9:ce28 with SMTP id ffacd0b85a97d-3a5318822demr15550216f8f.5.1749558803465;
        Tue, 10 Jun 2025 05:33:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:11 +0200
Subject: [PATCH 01/12] gpio: mmio: use new GPIO line value setter callbacks
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
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4849;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/UH4x/fbI0BIFJX3mIEzmmNo36J/N7bN+pZNnL+oU7M=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYOFAEvwIEsxV1MXfRknm+eXRkQlcJgIZH4/
 +1R9Xhb0bKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmDgAKCRARpy6gFHHX
 cmxBD/4hi6WLQtzhS7/j0anJqFfcC06CXtfOJaLR+lYY6czknEMDeGFb+xLjlYIn4qRsoBWf85I
 drjoL1zNnkc7/SSy+dFT35KteOcWxXiAvJ5iRFuiQbUF0yyNvLP10Ee8/G91k49QfuQ8fRvCT/D
 jQVS1Q8NtvK2xD19vjsPWYvufNHB+CV1QiL/nB9PH5aVCLnrmfqHP7oXIebxMFTd5UyM6CV8u6+
 xxj6tpMDW17Idokc90HfORu+kEHNvJTH6pAiQXPUbN2OH8AGzNSRQnrHBPtSwNg2nNTsCX1kTg/
 JNZzoIy409MxDnaxREy6Zv1bsQv4gjInQXmp2v2IVtiF52H6mxNqydzNCswYmhOaXbjOflt2lT+
 R23/z9U1J1kDbEr2hbA2N8BKFRXNmc1rVTylsrzniQxCyHZIxRNXmA3gJ3zjDqXqH+0xT66ht+2
 QCNpNf2hD/r7aOyJoRRM1biGgO98Y1b5XgTH3Xui51nBMJNGcC75zIay96zEsz5XDv8KehN47xg
 CKLzxQzZtCPVgBe7LRiEmYBdjPJWuW0Rb72XsB4n3gcp4WylME3gGn1SGIAtwcjyUbT8MFoNW4s
 oHaokbunFa/lEpVFYZbi6gW1I28Hkpy4BsFekKQ7s2IZfh39C4/O3IoEx35s8GWtxzvhuhCj/uN
 /FpOY/4Ggy1QTnQ==
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
 drivers/gpio/gpio-mmio.c | 53 ++++++++++++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 4841e4ebe7a67d0f954e9a6f995ec5758f124edd..9169eccadb238efe944d494054b1e009f16eee7f 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -211,11 +211,12 @@ static int bgpio_get_multiple_be(struct gpio_chip *gc, unsigned long *mask,
 	return 0;
 }
 
-static void bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, int val)
+static int bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, int val)
 {
+	return 0;
 }
 
-static void bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+static int bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	unsigned long mask = bgpio_line2mask(gc, gpio);
 	unsigned long flags;
@@ -230,10 +231,12 @@ static void bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	gc->write_reg(gc->reg_dat, gc->bgpio_data);
 
 	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+
+	return 0;
 }
 
-static void bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
-				 int val)
+static int bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
+				int val)
 {
 	unsigned long mask = bgpio_line2mask(gc, gpio);
 
@@ -241,9 +244,11 @@ static void bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
 		gc->write_reg(gc->reg_set, mask);
 	else
 		gc->write_reg(gc->reg_clr, mask);
+
+	return 0;
 }
 
-static void bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
+static int bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	unsigned long mask = bgpio_line2mask(gc, gpio);
 	unsigned long flags;
@@ -258,6 +263,8 @@ static void bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	gc->write_reg(gc->reg_set, gc->bgpio_data);
 
 	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+
+	return 0;
 }
 
 static void bgpio_multiple_get_masks(struct gpio_chip *gc,
@@ -298,21 +305,25 @@ static void bgpio_set_multiple_single_reg(struct gpio_chip *gc,
 	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 }
 
-static void bgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
+static int bgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 			       unsigned long *bits)
 {
 	bgpio_set_multiple_single_reg(gc, mask, bits, gc->reg_dat);
+
+	return 0;
 }
 
-static void bgpio_set_multiple_set(struct gpio_chip *gc, unsigned long *mask,
-				   unsigned long *bits)
+static int bgpio_set_multiple_set(struct gpio_chip *gc, unsigned long *mask,
+				  unsigned long *bits)
 {
 	bgpio_set_multiple_single_reg(gc, mask, bits, gc->reg_set);
+
+	return 0;
 }
 
-static void bgpio_set_multiple_with_clear(struct gpio_chip *gc,
-					  unsigned long *mask,
-					  unsigned long *bits)
+static int bgpio_set_multiple_with_clear(struct gpio_chip *gc,
+					 unsigned long *mask,
+					 unsigned long *bits)
 {
 	unsigned long set_mask, clear_mask;
 
@@ -322,6 +333,8 @@ static void bgpio_set_multiple_with_clear(struct gpio_chip *gc,
 		gc->write_reg(gc->reg_set, set_mask);
 	if (clear_mask)
 		gc->write_reg(gc->reg_clr, clear_mask);
+
+	return 0;
 }
 
 static int bgpio_dir_return(struct gpio_chip *gc, unsigned int gpio, bool dir_out)
@@ -510,18 +523,18 @@ static int bgpio_setup_io(struct gpio_chip *gc,
 	if (set && clr) {
 		gc->reg_set = set;
 		gc->reg_clr = clr;
-		gc->set = bgpio_set_with_clear;
-		gc->set_multiple = bgpio_set_multiple_with_clear;
+		gc->set_rv = bgpio_set_with_clear;
+		gc->set_multiple_rv = bgpio_set_multiple_with_clear;
 	} else if (set && !clr) {
 		gc->reg_set = set;
-		gc->set = bgpio_set_set;
-		gc->set_multiple = bgpio_set_multiple_set;
+		gc->set_rv = bgpio_set_set;
+		gc->set_multiple_rv = bgpio_set_multiple_set;
 	} else if (flags & BGPIOF_NO_OUTPUT) {
-		gc->set = bgpio_set_none;
-		gc->set_multiple = NULL;
+		gc->set_rv = bgpio_set_none;
+		gc->set_multiple_rv = NULL;
 	} else {
-		gc->set = bgpio_set;
-		gc->set_multiple = bgpio_set_multiple;
+		gc->set_rv = bgpio_set;
+		gc->set_multiple_rv = bgpio_set_multiple;
 	}
 
 	if (!(flags & BGPIOF_UNREADABLE_REG_SET) &&
@@ -654,7 +667,7 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 	}
 
 	gc->bgpio_data = gc->read_reg(gc->reg_dat);
-	if (gc->set == bgpio_set_set &&
+	if (gc->set_rv == bgpio_set_set &&
 			!(flags & BGPIOF_UNREADABLE_REG_SET))
 		gc->bgpio_data = gc->read_reg(gc->reg_set);
 

-- 
2.48.1


