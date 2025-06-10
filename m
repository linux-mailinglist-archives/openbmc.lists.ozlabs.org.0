Return-Path: <openbmc+bounces-143-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AE0AD3661
	for <lists+openbmc@lfdr.de>; Tue, 10 Jun 2025 14:35:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGp9p2Vfvz30QJ;
	Tue, 10 Jun 2025 22:33:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749558814;
	cv=none; b=K2J1Cn1G1sveRnR7wwyAdupE72o5BHXld1MeuatDXaEOQeAkwEEzXBwJlAqLhu5P+dwglPMpPtCztNnlFx0qensmaHERyEWU8jZwFkPNKzMxb3VoRQNiC4LtyDAMYUJQw+lEdRAtVBMY/l01mhcaFLKhLfr6rYiM/gCECeh9arA+zSaj1+YaiKqPzPu0MlvvsklXYk2OQLSRxcEARSD8F1AK5k8vJiNzFv3ube+eRREybyDc0Z97o8572Gi+ddSwpkd6PTl/kzdxtv9FiC/s+cdfld/pjvY727sZKhg32ASZyxiaanpAyUKoqP93sFYRUV8fOcHjA9l+tD4fPzTTnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749558814; c=relaxed/relaxed;
	bh=qxLzYZOTSdUIwG/dDdz19oBo7jupe4wC7PnSCC6qO4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E7rbDWAleY/G3+ANfoKUoitQpjb6U+4ZsbbrS0MLO4COk04BEUnAeeh76Rq/OuP70qmCRzcA5hHyeztPRz7/YqoZVpm0Sn/KiuK5MhkJQQDOEJp3LcCNVSi3VUS53K28YXSOnIOGFF0ZIKetkP9hTVQHZl+bKy837ld8lHX2KUPSnf9ljZhBI+xgNXjNG9XRICWyT/hDKLCKX/ZxpmdPEmQm1xOn+tU2b1Se9piHG95IoNGc9lKFvajC1y7yeOwcc0LbsF7z4KukLaJtYMvzf5X/qVwnZj8ve6mQ3++CDbs/Q3NrtZ+ejQntVbpbJNAx1UFklkMIchC+rBp1CMxbWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=c2k+M3Jv; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=c2k+M3Jv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGp9n1PZsz30Sy
	for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 22:33:33 +1000 (AEST)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a4f78ebec8so3223093f8f.0
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 05:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558810; x=1750163610; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxLzYZOTSdUIwG/dDdz19oBo7jupe4wC7PnSCC6qO4k=;
        b=c2k+M3JvJm2JL2NQ1PJP0N5caJd8+TerUlwr5mfuFxu1VbpZUMs2fIPPpJVDLjk+yU
         iwpZ7zUUmQkzDNX4LjXrRmct1aC7hgrye3ICnoNKrvq6hzAOgYiOr5eQrFm8e7HHCkUP
         00xvHjgTTcp7CH0qlxWraxB4ew6/ccAO9UikjwEWFroNu7AtzTMAi8LpnW5ZxoY13hmo
         UY6PAtry0N2aQ1/+9AcqRshKMwi1maaGWie0V0e7rX4cmJC+RQQPhLZOWqr4mrXZwRAk
         37g5uj8kNofv1fO53yLX00JVf1j2QdOJ9ruanybBQavBefUEarZH0871MjmOKu4lMY/v
         ge3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558810; x=1750163610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxLzYZOTSdUIwG/dDdz19oBo7jupe4wC7PnSCC6qO4k=;
        b=udnMszaemhN2UZDOEY3dOH3jLhL3kDELA+N9StB8Ox9ohgYafv+8oyK2bQy0EuflEJ
         R7kyIkkpKPU8ixjqHDyEI158aeBQwKsQlD8QmDidxuDx9TtJqJppyyG9aC1tyLeTZyRl
         hvZgusZ3rKNLvbtsrW1l9DNXiZjuZ6G7h3Locs3up1SU7oUKplM9EZwwrsqCJKXr+MCX
         Cj22NEs40I9irkT8bBv7UECbhgYsVie5PSGNArXANgS1D2/bofV7T2lIGsefqH87TLcI
         kAEgHjt9qEpp6nR7IKGz4umc+znlbsnQ/BYFBwEkm5uK0aWR9KOl3cieEeqKPyfEWnvY
         REsA==
X-Forwarded-Encrypted: i=1; AJvYcCVYP7DmQLyidef8hDK8LQhQIuuNR5R5QQNBLc4KUZYODC+F22RtlWs9/MC3TfoJ0Dgzs2xsPJ/O@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxY4v0MOJe2zzjKBdfzV5WS8akPlwRVBocM9EqqXYOBLdAlN9/0
	128IJUZBipGYsS+/bmz/nKVj9aXJT3WmA5A5CH48Nb6GfyiUuAecFLErqh1LvGwzMJk=
X-Gm-Gg: ASbGncvh6VuhUSGspzasnBmUO/pejQoUtL8Iltp0SRY5K3saZYLDaDD0wZnsiO0CSjB
	/4jJlT8rCXtHLUJ3eTY84QyGJjjrqMBiakIpMDN4OTkPOC3Qz/r8pzFsQ87yp6CrBeyQvZPGRmL
	wcRmDovL4aisH3qeS4eYkLY0qt507n0eL/j8RW4OFdiaVn1Fykuxv6OccxfXsEhluUCu9/AWeOz
	h05AgEFgFOb5CiU8ZXFpMI7jsSKrjSv/iPculBVPZpXRJgvB8nhyBuG1T/zgxYIPwN9DA1OMDvD
	n2d3TrXQ2POvVUicyEopZruts32RWAeo3CXknJRd4WDvgO73Fz+DbQ==
X-Google-Smtp-Source: AGHT+IGf24xBNhS/K1ZbKglpgFrm46LA9T2wVtmfcyS7odITVr/pCroc70/4xTfamtgoFjylllZKEA==
X-Received: by 2002:a05:6000:4205:b0:3a3:7987:945f with SMTP id ffacd0b85a97d-3a531ced4e1mr13192942f8f.57.1749558810273;
        Tue, 10 Jun 2025 05:33:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:17 +0200
Subject: [PATCH 07/12] gpio: msc313: use new GPIO line value setter
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
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-7-3a9a3c1472ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1676;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ZmOs9Rn2Ofc7KtPnQgf3fHbIJejOw5G9OgMOgcVcOTU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYPS6rMr9JHakl/jEzS6gu3nnJM5OwNcNdkw
 pcSFpc7hKKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmDwAKCRARpy6gFHHX
 cvrUD/9GpMmudRkoErJ8Jc3wJWG5D7s/6ppxZ4bAKfLPHuIf3cullW2xXMdGEisXFnYba5VEHpt
 VlXc3SJRZDpOEvM0F3v/+jUIZiuOD6pvawQnW/qxtq/Ozv1UfpKrpuN1fRrh7pL2XMWCAwwRnUw
 aBDKVyyJlBxP2MtvGqRaa982whCS2SZd6kG22Dddodz3o3nAzrh2kTO1S+fWFysy1uyhRTTIlpQ
 cXCVQ1wQMGQQOX44beuLfNlLd9SEPnqHDgf0Lj3MudgUqT22IGiNR10kwDiB3wQ1raD/uYBJnzl
 8vxKAn3c0fCywJcvMFP6K8S2ZAHGytispiNwpf8Pa9l06WV5vZCyzZswFKsDYk8zO45sEPi2IYK
 skKkUVLEkgJycvjqe9Z0PM21t3y0NVWKx5KjMcH6+hefemyBEzaHcFyl5ARdxki12GE3lCixf8f
 RHBvPI0sed+6K74ffsqTELAk4EffI6LaNvWOSEG6F6OvP91+rEkaHy/kCIJFTo7DMnnu+SKtCLB
 ghIRIU0nZmltloZYikzkZfcgB8uYVjw5f42C9UGksap9z2d2juN4inFBf0R8psL7OAHQB7occ8w
 nuAi7PvG6Lmjmnv+Hq6TmLCI75PEi8A9HehvhBXXbFG1lUF0a3ELPJqeFHbc8O3ZLGrwJsZY5KR
 oWc3lgWCenglKuA==
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
 drivers/gpio/gpio-msc313.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-msc313.c b/drivers/gpio/gpio-msc313.c
index 6db9e469e0dc254e791d497b89a4c6d329d0add4..992339a89d19840fc03ccf849972a83cb86415ae 100644
--- a/drivers/gpio/gpio-msc313.c
+++ b/drivers/gpio/gpio-msc313.c
@@ -486,7 +486,7 @@ struct msc313_gpio {
 	u8 *saved;
 };
 
-static void msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct msc313_gpio *gpio = gpiochip_get_data(chip);
 	u8 gpioreg = readb_relaxed(gpio->base + gpio->gpio_data->offsets[offset]);
@@ -497,6 +497,8 @@ static void msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int val
 		gpioreg &= ~MSC313_GPIO_OUT;
 
 	writeb_relaxed(gpioreg, gpio->base + gpio->gpio_data->offsets[offset]);
+
+	return 0;
 }
 
 static int msc313_gpio_get(struct gpio_chip *chip, unsigned int offset)
@@ -656,7 +658,7 @@ static int msc313_gpio_probe(struct platform_device *pdev)
 	gpiochip->direction_input = msc313_gpio_direction_input;
 	gpiochip->direction_output = msc313_gpio_direction_output;
 	gpiochip->get = msc313_gpio_get;
-	gpiochip->set = msc313_gpio_set;
+	gpiochip->set_rv = msc313_gpio_set;
 	gpiochip->base = -1;
 	gpiochip->ngpio = gpio->gpio_data->num;
 	gpiochip->names = gpio->gpio_data->names;

-- 
2.48.1


