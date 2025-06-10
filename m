Return-Path: <openbmc+bounces-145-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CC6AD3669
	for <lists+openbmc@lfdr.de>; Tue, 10 Jun 2025 14:35:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGp9q7292z30Tm;
	Tue, 10 Jun 2025 22:33:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749558815;
	cv=none; b=WdSx2jYiLGCg8Mh/hNn49eE1caBX8Ec3jHAhrOhxN4cHL29I/vyhseVH6OaDkMctxrXq6hPNmH8+MAJMRljOdR9s5f4S69BXIYduLVLLd7wawiNF+GYCso+ZJX3lHw4lkXZuUybqqs2r8RQKU7KGACIA5oYIJwwDiAlgREOG7CuOFZ8UgJD5KvKP0mcAJJ0EvoZGEtf1uUtUQW6l6UaU/q3mC8WX6GZzoHsEnoSKQZgn1TYLllAPV95P3SLzvMD9T1RH4yACvcsqoEEbbKmg6ord13+11jyZTbnKzcs8642P97tawMLisYdsNpHD1ll4Tyx0EzEcJ25jTZ3xhD7l3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749558815; c=relaxed/relaxed;
	bh=4aASIZHuidOjhLiw96O1OXVywQzoanXq7WKY8AyplZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kJsNU+lbgiWKQCd8mFuZLihgVDQuqKvTFy/oCVjd/EDEaLkZHx/u3NzQzj7BfkQujJRZDEW/W8iV6iqMCpxmiMOZxS82rGeF18vt5IQ8Z8FA0D84x3ur5rTIRysrvum2LuQO1yrA8Qjds1iensUvUc7ljK5ZK5kbrOyTRwNanJ7JLtjTjQiW+w1MA81RVAZN0I+GlDeDMJj9ucERLksTPA8flznqcddIMmv3XgQOlXUBhvyfAaec9xtTq92hC9XX+Q0/MHoZHpcUJRhb7YI/1M62mAgqidInoXxVfMZlKRExPiDdSHlhqDyFh0pKxgFY08Thh5fXYzeE+CFmbztBVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=BWy51quX; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=BWy51quX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGp9q0n7Dz30Sy
	for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 22:33:35 +1000 (AEST)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a522224582so3307337f8f.3
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 05:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558812; x=1750163612; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4aASIZHuidOjhLiw96O1OXVywQzoanXq7WKY8AyplZE=;
        b=BWy51quX2SEZMG5KaAXamvhRwg9OJtUpi9qB7WkLSer4jNUhS8qQPV8WPA+vwUJqXR
         PSRvBCVLqUocN2N6u3fWfcm6wIVjheBioYP7nZCOQ43MxVHJqg6EU1vCcOglWdgjdhzC
         tauuT1ED9AddGQ0+5H6jcck9ahMgMdYYBjPQC16rl/H6r8KJdhMOvkQTWz7ml25fDyep
         zCKpUpQwtd2kA1LgcxHhrUAflGWx0qZyi2f0AEtguexLnaFxBWRM/OShut6qIByy5MCV
         f50W5mi+vI4bvCyDwfbr4QBhQVa2PrGyc4JaTVlOTc99TxU6qlP9lLeKMWRA9TOFSvZt
         wNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558812; x=1750163612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4aASIZHuidOjhLiw96O1OXVywQzoanXq7WKY8AyplZE=;
        b=uAq/IMFBWKHqAcxhoDrxd+9L1Y1UDqQK5lIuqhXgrVwvbfxEHG1ofL+IhFsGHGIErp
         6rqdgzUrb/bDQrLDot1vD58/VngiMPPr3Xu9meRT5HFP1tbmhUBQOpk90D1PRCcdxJBT
         cVP6kN2CDqEDvfKer56YtLZCZamIJwtnHqinieeC4/piW2ERrSjhGHyrb/DjqhEWiGlo
         RrXpCisOY9DBaKg5GNRnlTf9XrZbohgz4iFaVJQvowmdxZXcsPTsfbFJZF3WcJxcfzvy
         UTVkrcMa2WRTUwnor8UyfJzc59hNQxFZIBJC1a6QvHWmRGsVNTzbJxoOVzrmRNw7Q1x0
         IWnw==
X-Forwarded-Encrypted: i=1; AJvYcCU9q2jZhH/rN8o7/mY2IAZvrbnkYK+gbXAsmQ/NHC+0a3ZKl+NBLIoOKn/Q99VDzUl9OAmFlcF6@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwXJw1kW+7AQhVCnOgSboyf1Ir+A2nyWCL8bMtwNcvkyg25FkQv
	DWE9Cl3t01AMEBxL8CE8QJiWl/12TQgQn4iXKtWqCAGrXF2jC4LwPyGu9Nh5TZgeGpI=
X-Gm-Gg: ASbGncudJPWJchl2ZWJqiTRX77+uZqGGV0ZLAu3sKUgHKXZ0sxbDkmvDU3/mHP+0ZO3
	2e86CVkxeMmK6lKBZRY2zT0fAf0sdQh0pL6ycbr3BaGvW7iQkKWhjCsg9onfit8TpyZiOZCBBPL
	MkLJvi+HqCxz/R3cFHf115/1X8hAGllHhkMjEsNPlKJkSh7we0qJ+bKZ1uJgHAc+kcS25U0ntwk
	BpJ+Y+qVZw/I1BTQUjiNoRUejuF+LzAxSMp0+LyioW1o3Ib3DpmqnK30AU3oZ+11pCzSMyq6HpU
	HxVBgYWTjGAv9z+WV6dOqhW5DUsraDoV7X1HakMUAnvl9HbgOZoEnw==
X-Google-Smtp-Source: AGHT+IEbu/ISHzm391WeAgpZgQpxCQMU7l5sRhpe0Dp2uNZQ9BZI4WIWzmuf7o2/3fpe+9gfV/kFtg==
X-Received: by 2002:a05:6000:40de:b0:3a5:26eb:b4af with SMTP id ffacd0b85a97d-3a53189b56fmr12109336f8f.18.1749558812389;
        Tue, 10 Jun 2025 05:33:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:19 +0200
Subject: [PATCH 09/12] gpio: npcm-sgpio: use new GPIO line value setter
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
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-9-3a9a3c1472ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1639;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=i/xwhpR2l/6SdoE5H3/TW1iFI1pUsif0v71k7JJeqSc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYQx97BIIpnbWW8Jl0scOnlXA7m5aZIgz1E2
 ednyGv/bMaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmEAAKCRARpy6gFHHX
 cq0GEACXL/OUOB5vGKp6qF7twwq2LopBjxJ+a5zMR6wQvdYfBG9QBDMmaPSjuf2kmkUtUbYu7HA
 Z1FBKLRGSyx1X3/aaozewD1qjyFA6BkSTZNtKnHHfFciGdkPfYwzAX9dewnRrjYmGX2RAk9ab4e
 VC9jF4zGQI+ngGuFjOCR9B0GScsixBBssQZWPx/+mzwukpk5PSJhpPvOSlfJzvaG3S7/9LenY3i
 pIK9rDUEeMNityyi7CSMetFo905zRiQvyOHu42Wn4GMCKaJgXg/wVA2eFw3JOFTg1S9deQKieKa
 LE2ed9MQ9rCTGm11TRojU7n44J9uERZp2a3XOuVBWzzyL7woBfFsFkzlB4IGf0whMN72a8zT18k
 wvRyZKhQPTk9EDwIQrqjDA+BhifztuHVUog4jPZq4XzFYBhGmE3SjABwmAdeoJxLCO/vbmNhLPk
 843qnKqNHnzQaryTQggkzqEB+E7vcapL8cNvyCLhIP3Tu7PPt0ucxtKA/gTsjLQ5BCoy7qvv6md
 4ZAH+iSl/g/8OCXIpZ8susfIxxvVBcI+FtWCvNWRFB3GwFz/GVm0eZC4SYWn+8kzCc2tvzN7mHq
 f4OvLY1WFa2WQtksGlajI7JxVWIJlosIN7MPl/2Fh1XVD9Zl+evDL2mc6wIWcMGBUyCJql3EvIK
 KZdOoABhp/23yRA==
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
 drivers/gpio/gpio-npcm-sgpio.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-npcm-sgpio.c b/drivers/gpio/gpio-npcm-sgpio.c
index 26057061454348d383129267e8bb0b8c506ea5c1..b3953d1ae8af45f4bce9b799434547cd8770d9df 100644
--- a/drivers/gpio/gpio-npcm-sgpio.c
+++ b/drivers/gpio/gpio-npcm-sgpio.c
@@ -226,7 +226,7 @@ static int npcm_sgpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	return GPIO_LINE_DIRECTION_IN;
 }
 
-static void npcm_sgpio_set(struct gpio_chip *gc, unsigned int offset, int val)
+static int npcm_sgpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 {
 	struct npcm_sgpio *gpio = gpiochip_get_data(gc);
 	const struct  npcm_sgpio_bank *bank = offset_to_bank(offset);
@@ -242,6 +242,8 @@ static void npcm_sgpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 		reg &= ~BIT(GPIO_BIT(offset));
 
 	iowrite8(reg, addr);
+
+	return 0;
 }
 
 static int npcm_sgpio_get(struct gpio_chip *gc, unsigned int offset)
@@ -546,7 +548,7 @@ static int npcm_sgpio_probe(struct platform_device *pdev)
 	gpio->chip.direction_output = npcm_sgpio_dir_out;
 	gpio->chip.get_direction = npcm_sgpio_get_direction;
 	gpio->chip.get = npcm_sgpio_get;
-	gpio->chip.set = npcm_sgpio_set;
+	gpio->chip.set_rv = npcm_sgpio_set;
 	gpio->chip.label = dev_name(&pdev->dev);
 	gpio->chip.base = -1;
 

-- 
2.48.1


