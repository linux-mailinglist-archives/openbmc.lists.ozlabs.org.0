Return-Path: <openbmc+bounces-147-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16812AD3674
	for <lists+openbmc@lfdr.de>; Tue, 10 Jun 2025 14:35:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGp9t4Kjwz30Sy;
	Tue, 10 Jun 2025 22:33:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::430"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749558818;
	cv=none; b=mvCU6BXCa+dqx9v2ZB302xHBgmfexyCHHQskfbvspjhECx4pupoOg0kYp9y4FIF138hFKI39bzBx+u3MSVoaQYjmJjBaRUa1U4YD0bwQljamiB1AR+Di7MqQhUeBidfRJGeBy65ZfAHkM74khIXUeT3XBjqm3uv6xdT0sTN8lNn9kpBaJ2BHkqDgFEb2aBo/FOb0vIUq6f2NEfaMCNEwY6DOaCK/1JxJHR1uZ2w0ioQB4ZUuJo1EISPbeADqD7/hUHtDTffjxrFfeASgDMY5D5i8P4QTnCSOx2CLkZLpMt6w7O+w4LdMItqK5u/CjDmplg835uXvQAbnfPpwLFHVkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749558818; c=relaxed/relaxed;
	bh=gWwWjRL2sG1kaP1KpOhM8tb9lVTY5ImgVviMKu9J/kw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hohR+/50OnSJVjuSiBuYi5/hPfGS9946Af6HuvplT454vC4iSb6XlaLzgVR3G6A8V4QIQoLDr7mKzJqXkiAfsyKqrDkQzq11owNQVeh4HpTFhskkV4F+i+dt8h7fdddpjF+p5a1N00qpy1IAD7YpJ+1dzStaO+WmYb5z3dN/ERkBVKuRcudH5C0Msd5hSYbA/K8abxXfPiMokqVLRORUPR3PB0uCURBRxuVH64uou08s1jLRC2gW6a3Qvq5DIRmnj4eEtVAmHVqK3Dzun7++FWrno9loPxz6AOz7rhJdROUn8faUji0fIODrUs9TLIWi0Pg+i034ZRRRdtGvNOBIzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=og/qFbZB; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=og/qFbZB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGp9s5405z30WQ
	for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 22:33:37 +1000 (AEST)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a510432236so4224439f8f.0
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 05:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558815; x=1750163615; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWwWjRL2sG1kaP1KpOhM8tb9lVTY5ImgVviMKu9J/kw=;
        b=og/qFbZBWs6uKiSUFMJVg6meFKPQRtfBAzJaVdcAlWHexbvjK0xswxvqClMQTJb4Ko
         kZkSQ4388wcGnIBRgM9NFV31mxKOfS6ETQ0aCcLO4J8PYx7NgkYmQ3TtAKpqPRkLlOWS
         R+fPlz3xdswv6nbBcRfHPb8E1tCBonK8oo6ssWoa+jODfo95QAsvh81L80XwvhEnXmjA
         azsTEAeW9atMXdAECDg54N9Vzz9J6FWqbafBNTeaveDOHzyAs+67EPDa3otBLfUnZc9a
         xI9lpW2MqkUkfesBkRV5WiKkCwudhYLT/Iwe2fLyRdbSYNvQ7pFxukl9H6qymESrJ/ec
         skjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558815; x=1750163615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWwWjRL2sG1kaP1KpOhM8tb9lVTY5ImgVviMKu9J/kw=;
        b=RBzAfM6JTdAsad0X8FzuNw4PndrzsyEBar85tWe91yGTunZTqsQJZBe9TP2aZGS7oR
         qSv77WkwK3H7LNjTiX2CW7umeSLC3U+H3EDE320gflVHTZ/y3drn0+pmgyv5YtED9Atl
         4At9OpeT/syOOec+8mI8fUkmVbtvt8ifaKHTwFi1Ff1bXzY3/h7YYeMTE9wur55qm0nS
         GtYlY5ctUEOFQqWU27HPJXOQAdJAHXweA9oVFuWNLC3dJp2cP5YToeo2nVyXW4WpqBi7
         BzHv6SutPoSzZiPZtWJQSd0YMzrC1aaPMvE1ZUbr9fVqYxzncR9UrxKsACl53oSqyJeM
         hxyg==
X-Forwarded-Encrypted: i=1; AJvYcCXBV5pTePyeNovBG1jiANX2CjIroBHrRQB90yDYIyzW4CK33bM3tHD8rLqeVnLGBDFZR1084iLI@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxDMPa9I68mSmBREPg+GmcVZr0qITtOxjJrKIpsYT7SGu0uM2VV
	ObNsHcdGnPDBodc5ce4HsHybe7EB4xbDx6LQ71b//O89T57qH34bhbYLnLL47XQZs7o=
X-Gm-Gg: ASbGncuMivuiqVqjW8+63MxDLTZgbx+Y4xpXBor1ebgHt54Wc4+V7MW0FMsIFSOT97w
	pBY8pCnl8uY66ZVvM5baTlZcAFmarW/sNRbW9vkcvxutpFNcpCJvp8V2K0Yw0TQ8yS/0xwfP9Pb
	bFXV2Y8s2QlAVzkkatQm8J0gX0z9qnGVMUlQeOSUhmGfLP7MlnkO6BkjHTCo6pX74RC3lKW89UH
	RsTHbZCxcdqIppj0DC6a2PUAnsgwcJOgbTJ5KKZRgC3EsLf7ipZYARA0S+ZWJKiyVUq4Zd/aSh7
	eZbgWqPGgQRKg34ijvMiw20H1Flb4g3t+1gaaLtO0aKrQajV0hkQ8g==
X-Google-Smtp-Source: AGHT+IG1enS1XXO5MOMxHtGmC2A0TWdm1D38HYK+u7jLnOQJgSRjc8Tt9JvPkZ2QOIrOTK0nknN0Zg==
X-Received: by 2002:a05:6000:2389:b0:3a5:215a:39d7 with SMTP id ffacd0b85a97d-3a531ab525dmr12050338f8f.22.1749558814690;
        Tue, 10 Jun 2025 05:33:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:21 +0200
Subject: [PATCH 11/12] gpio: omap: use new GPIO line value setter callbacks
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
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-11-3a9a3c1472ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2332;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=yxpS9O8VyBwfb+1xhv8Bj1RrUY/8b3PCfbF1mQmw8vo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYQMAyZ2DFFK2uTaeqWWkqsZrltQtYiNFD+/
 MelCJUiekWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmEAAKCRARpy6gFHHX
 cvAID/0SZN2Wd89qaQKgmmxwQk154LwwnFEUma6TiDSVFl0DYCIyoSmt+4ywy6/N7uybzS3xzR8
 wryJoLAuEDE8ndyVqjxweeVzP7/rSL0157QD86uNoS9RgjehI6GFWJY7jqIc6nzQRqQfjd4fA3y
 X51hb1N2boKXviFHtrMXrT7QsCH1/kB48RoFDmsxczMlCRDLNmLHEIBMoB8uexb7RkNv+ez4VgT
 4NqTADOXTj5kyXLTw5qABxy+OwvryoTQ0Phb90w9APCydzyQczAe+9qHW3XRuLHAXxMBVbPU3Hx
 czk2B4JWmnEmFMRSA0SthrZJk6pkl2RKeEPPxYXLvKA66IX1VmySqrHMqjEIlkje8vMYXi6HKdc
 OJx9I2c1uADeWrv/LWfubC5dlHXIe/Yz1MXY7PhBRom/bSOw114vQPADo4f1w6P0VhrS+IJGhgF
 lP1JWjYKSlGAJOlR4Bdan7uk5QXtcrn3bltIR9x1vJCMlmuZYZrNQzl27offS1w06rUuUK9uvwx
 IZRnZ6UAUfXoIAB0gbyqa+sORMJ4MXo5x5NShZmGLERhonmyI39orc4HEcm7a9p/qtiuD17AJTf
 U4MrqzutczKRKwe3qRSf3UFrc5gGSxR4yPGEGthaKAg1WdSyA7jHkMNgTpemGF7psGH7iDZk02R
 AGAbHK/H1WBZtCg==
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
 drivers/gpio/gpio-omap.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 54c4bfdccf56812b5f79435a97b6eb90904ca59c..ed5c88a5c5207063e1269763e6239441a42e0c3d 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -953,7 +953,7 @@ static int omap_gpio_set_config(struct gpio_chip *chip, unsigned offset,
 	return ret;
 }
 
-static void omap_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int omap_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct gpio_bank *bank;
 	unsigned long flags;
@@ -962,10 +962,12 @@ static void omap_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	raw_spin_lock_irqsave(&bank->lock, flags);
 	bank->set_dataout(bank, offset, value);
 	raw_spin_unlock_irqrestore(&bank->lock, flags);
+
+	return 0;
 }
 
-static void omap_gpio_set_multiple(struct gpio_chip *chip, unsigned long *mask,
-				   unsigned long *bits)
+static int omap_gpio_set_multiple(struct gpio_chip *chip, unsigned long *mask,
+				  unsigned long *bits)
 {
 	struct gpio_bank *bank = gpiochip_get_data(chip);
 	void __iomem *reg = bank->base + bank->regs->dataout;
@@ -977,6 +979,8 @@ static void omap_gpio_set_multiple(struct gpio_chip *chip, unsigned long *mask,
 	writel_relaxed(l, reg);
 	bank->context.dataout = l;
 	raw_spin_unlock_irqrestore(&bank->lock, flags);
+
+	return 0;
 }
 
 /*---------------------------------------------------------------------*/
@@ -1042,8 +1046,8 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct device *pm_dev)
 	bank->chip.get_multiple = omap_gpio_get_multiple;
 	bank->chip.direction_output = omap_gpio_output;
 	bank->chip.set_config = omap_gpio_set_config;
-	bank->chip.set = omap_gpio_set;
-	bank->chip.set_multiple = omap_gpio_set_multiple;
+	bank->chip.set_rv = omap_gpio_set;
+	bank->chip.set_multiple_rv = omap_gpio_set_multiple;
 	if (bank->is_mpuio) {
 		bank->chip.label = "mpuio";
 		if (bank->regs->wkup_en)

-- 
2.48.1


