Return-Path: <openbmc+bounces-142-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C95BAD365C
	for <lists+openbmc@lfdr.de>; Tue, 10 Jun 2025 14:34:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGp9n4ZR3z30P3;
	Tue, 10 Jun 2025 22:33:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749558813;
	cv=none; b=WRP1kKsZrFCZdOeCXmmeRjFO8iBtObva9rEwoLFfyy+jMqWwpALk05a6ndwZvRXnuJkcOKeCWBoNU9wbKDvi3XXdcXRWDL2WB4nEDbdPmal8RZExYXVvXKLu8thaC7QIH4mIkMQj+pCxJCYepWM0LueQmHBOBTRFg22E4BQMKYw6CzmkWQFVJKFbQ9C/YGHk+fZw9szc0pNGzaEFy79E2A+vIOU7QIn3EMmxaceF+XxO5z5PUMPyptge9c0tleebk4CrjBRu2+bGqyYZbLr2z7e6it/eBijFq1FflaeNwdGNYXD3jGRatCUBNyK/YfHMza9BmoBLbiVCokwh7x/phw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749558813; c=relaxed/relaxed;
	bh=3F+4kh8HnzcTAXwMgO05FwI7b8fR5vWj+INTIOT0oXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V+O6s5MBKDgBo8SpVpx0sgIEwpaULKiovgL+1MX/eEA//pGMdd6WuzHRjZ5FQ8k+MzOzvIOPWgYOzRmP1LagW/npcaezm4PQUe0+sqAoX5vWCbWy92FG0mpY0/xidDLhjtCZ0SpeQuAHix+kga+q5BGJa8eWdHiO/X2gD4RwEQmTK+6qBQX+69Prk/nEgh0rCp1c23QkLHRVd6VTVP9w843C6M5NcfkIbhw2QpA4hhXdzQVTEm9T9MmQmhoE/t6w63w+Ag1r6fbLWOVLd5QpwZJ3CRSIJxmmhfYQk3lPGvM7OcauDHkeRCd8WY2DdY19tVSG1ZQIz1qD0WsTxjRChw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=QTj9964O; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=QTj9964O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGp9m0TW7z30QJ
	for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 22:33:32 +1000 (AEST)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so2076991f8f.0
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 05:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558809; x=1750163609; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3F+4kh8HnzcTAXwMgO05FwI7b8fR5vWj+INTIOT0oXg=;
        b=QTj9964Onk9Ip9X9K2aWVjMRs7Ypkc8VDkmJFS+RhAhJlPsHSVkuYW/hNcNYlmAdBG
         O+D0eu2Rbz7jB7eztWtVnnrsgopUfVE/fzIz7TxP93xhG5fvnO1Q6FgkIxR9u75HnNj1
         TlUGQRAeeDcXTC7o/21uJpZ8YcQTumeoV533fLWaEt7FVXDfe7TjvAiZpIYo3dG0G0w4
         GdWiSN9s+9VhaXUlKIDky0TNTq4umEfJkdK57ZknC0QWmQNXwoaBa8blmOZBCqZAdJtM
         1ty4sOo3gnqVgVMy10v1MZXS6zSPsaxXWXazHc4W+OMNPBGWwOVhcp2G83cdtiL50IDG
         xs5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558809; x=1750163609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3F+4kh8HnzcTAXwMgO05FwI7b8fR5vWj+INTIOT0oXg=;
        b=Mo1m/AupY9Pd9+wqZiRr5Xu4omhshukcrehcXUo2C44YWXrFQ631z+AzLPRb06Lt/g
         Kdr1y9U3mr/3ZsFQSu1z9wU3NwPLoRUNlXPkikVmShyQV2nxuGGiFu3WQyTBnhMQ84gD
         DTT5H/J87PK5QncvUMZMZ9fhhwhU/jJzXIs3XKb18RKFAV5QqVe1/1X4Y9g4pp2Rm1Qy
         pbaHFPey0BzZvDOOBTzFYR+z7Am1xKiL08HhOAA+SDJviZ5Ix4VT34KkzUplbmtLRea0
         Bx3GpCyaU8EXkYeH8OyZ8gIyyosf/WSrDhBkIw/szABLwVmkIJkalpWWP2HeImhO1L7M
         cs5w==
X-Forwarded-Encrypted: i=1; AJvYcCULYkf1WSSz/2pZx0HmUKR7MGcqiM1lNu/DNdVToCGMc/AxxL9arwJL1GEFEjLjYWrupmB1S4eY@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwZwVIk0EvXpdoGEY1eWBhWE0d0CSnMP3lzdW972n7G88lFHEW2
	HyN5TNvwey6yf3GupeqkvwdJMKJHERBaVzRKqM2HhjpM8cE3a/W4x9bBVaxAeXpgs/MSHo/3V1U
	x2sXt
X-Gm-Gg: ASbGncvnAmv1WRRXr4AvZJ1CfcWpx6dwafSQVMd0wSamizpno+fsp4HOJ3Lrvp/NlHk
	I2DpSJ/j3wqst3DtvuXhxVDQKGCHxCPMbTulMVojCXJ+0lkwA+tzW5pNYiFxzdoRy8ennReogC/
	cw1V0zbeDfTxxtI8SXDxhOSzZLwy+J3EviH94Pkjz/Q31kfpN9v9n7fg6TdGnuf0UJrIpwada1Y
	7RqgBF9h2X4iRz7/9HHvBu31ksGfBaocqsw8gbFT8d6EcE4ScAjUlmNihAImkYTwzqUVcvGcjRt
	h3/aV+PYUFiDH7vfFaasW6mFRn3PkNGB1FzywbS5gbd9q3N7raqIGt3ZoNE8IzDH
X-Google-Smtp-Source: AGHT+IFTYvxx+yPM6Fsk1C7fqSFoF6VLwEGT1tv11cW8KGpzuidERKwWdXVAfe2jAdVBle4RMS66FA==
X-Received: by 2002:adf:a342:0:b0:3a5:5299:3ae2 with SMTP id ffacd0b85a97d-3a552993bbamr1564362f8f.3.1749558809156;
        Tue, 10 Jun 2025 05:33:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:16 +0200
Subject: [PATCH 06/12] gpio: mpsse: use new GPIO line value setter
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
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-6-3a9a3c1472ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2989;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=TMx8xoTgcbqz3Qqy5NSYm5JAQDdrcON6VQI7QNVNO/w=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYPCFfXkFBozviHjnoa/3QfnofqJwkCL0YGi
 UwKuobyQmyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmDwAKCRARpy6gFHHX
 cibjD/93BIE6A13TiKE9ysPDcrvPFrMv37iv7QXsvm0Lmv6wlgcG1+dairOOfUdjPMav8dlioDH
 8HTVlXxB0bqzKYrcS3mMMtkC0Q4qk+AhHImuFtNEKTIBl0+pBdYkrtisnh04673bsig5p6E+mlx
 JZijDEApCXAyE6O0CTrkgHRAb7i4AYOnDpnA1QohI0S/3WAQVPHJz09AmYsiqHLOcKbfT33n6lM
 tvD7LNztj6gvgddKar6MiiGD0Q/Ak+9crMBkju3I/FX2F7M2nOC8TKyVwk32eeIsvIczMIwnAnF
 v8O60v3shWlZ3IeiheyA7oiShU0F2/gUokAkpw9C5j/jY7mAB6zr8Fo21I6CMBjJgPG74UuyDlu
 GtGi5/jpDloLA8HOKSmNveS9WXC6IBcN6E5O1v8mXcjGTPr/1dbngoICJLlXXR5CPwEV2Cdb7aS
 +DYdfjcEIoA1olpZVfmqJtn+VC4VupcMQQnurxBHJa5cfDLRnKNvoJmSH+YnUXSxlnOo+8idA5e
 CMA8uth49bFCKuH+LjcK0+Atd2lYC8UDt+Zr9gOavzjr3DVEqp119wb0A+BOCHgtmO8KpHgr0nO
 0x/TjKxvqy6vM0e5hyVCvN7WbJSAsiw9m2LS+jMsU9hRHbm/PeAn7d8RD73HDqVCfA7JlvGSO8S
 vgw27DKUKWSkanw==
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
 drivers/gpio/gpio-mpsse.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-mpsse.c b/drivers/gpio/gpio-mpsse.c
index 3ea32c5e33d1a445dec02996744429f17ec61af7..b17de08e9e03c5ce05ca5c1bbbb8a0f83fc2ba03 100644
--- a/drivers/gpio/gpio-mpsse.c
+++ b/drivers/gpio/gpio-mpsse.c
@@ -160,8 +160,8 @@ static int gpio_mpsse_get_bank(struct mpsse_priv *priv, u8 bank)
 	return buf;
 }
 
-static void gpio_mpsse_set_multiple(struct gpio_chip *chip, unsigned long *mask,
-				    unsigned long *bits)
+static int gpio_mpsse_set_multiple(struct gpio_chip *chip, unsigned long *mask,
+				   unsigned long *bits)
 {
 	unsigned long i, bank, bank_mask, bank_bits;
 	int ret;
@@ -180,11 +180,11 @@ static void gpio_mpsse_set_multiple(struct gpio_chip *chip, unsigned long *mask,
 
 			ret = gpio_mpsse_set_bank(priv, bank);
 			if (ret)
-				dev_err(&priv->intf->dev,
-					"Couldn't set values for bank %ld!",
-					bank);
+				return ret;
 		}
 	}
+
+	return 0;
 }
 
 static int gpio_mpsse_get_multiple(struct gpio_chip *chip, unsigned long *mask,
@@ -227,7 +227,7 @@ static int gpio_mpsse_gpio_get(struct gpio_chip *chip, unsigned int offset)
 		return 0;
 }
 
-static void gpio_mpsse_gpio_set(struct gpio_chip *chip, unsigned int offset,
+static int gpio_mpsse_gpio_set(struct gpio_chip *chip, unsigned int offset,
 			       int value)
 {
 	unsigned long mask = 0, bits = 0;
@@ -236,7 +236,7 @@ static void gpio_mpsse_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	if (value)
 		__set_bit(offset, &bits);
 
-	gpio_mpsse_set_multiple(chip, &mask, &bits);
+	return gpio_mpsse_set_multiple(chip, &mask, &bits);
 }
 
 static int gpio_mpsse_direction_output(struct gpio_chip *chip,
@@ -249,9 +249,7 @@ static int gpio_mpsse_direction_output(struct gpio_chip *chip,
 	scoped_guard(mutex, &priv->io_mutex)
 		priv->gpio_dir[bank] |= BIT(bank_offset);
 
-	gpio_mpsse_gpio_set(chip, offset, value);
-
-	return 0;
+	return gpio_mpsse_gpio_set(chip, offset, value);
 }
 
 static int gpio_mpsse_direction_input(struct gpio_chip *chip,
@@ -450,9 +448,9 @@ static int gpio_mpsse_probe(struct usb_interface *interface,
 	priv->gpio.direction_input = gpio_mpsse_direction_input;
 	priv->gpio.direction_output = gpio_mpsse_direction_output;
 	priv->gpio.get = gpio_mpsse_gpio_get;
-	priv->gpio.set = gpio_mpsse_gpio_set;
+	priv->gpio.set_rv = gpio_mpsse_gpio_set;
 	priv->gpio.get_multiple = gpio_mpsse_get_multiple;
-	priv->gpio.set_multiple = gpio_mpsse_set_multiple;
+	priv->gpio.set_multiple_rv = gpio_mpsse_set_multiple;
 	priv->gpio.base = -1;
 	priv->gpio.ngpio = 16;
 	priv->gpio.offset = priv->intf_id * priv->gpio.ngpio;

-- 
2.48.1


