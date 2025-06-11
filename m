Return-Path: <openbmc+bounces-170-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF10AAD642D
	for <lists+openbmc@lfdr.de>; Thu, 12 Jun 2025 02:03:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHjNz5qlqz30WY;
	Thu, 12 Jun 2025 10:01:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749622470;
	cv=none; b=jXcSknUnz6XoiVDk1gFQMGTG10odjlKRKdRLVwGGQebhreNRYWHktHu1OXgDDD3C5S8ZZLmb0wiUscQIZAvwCd02XtO/YxgiXZSuK/1d8C9qLSAo5vOgViaLQZRCfFkQILw9AWvaes548HbmOMIsir2Ep4zszbLccIji0jn0OfjuF6xumsIz96CYY4tN3qzZ2d8pW2DyOFqDLIfgIVPpgt1tBQl0jZjoLgXuDnxLrhRZYh7oNZK8deljc5aomQmB1vH4HWC7wL2QV14umQ5cuLy6CGP9Q4dP2evhosv4/b6+kd4oalM3n7hyz1npB+Eslakl7oqg4RTiWU99wXIy/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749622470; c=relaxed/relaxed;
	bh=TEB3joLDGNQ10Dxn2W6U+Wspv7QV9CHlEFicTB8VL5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EWiM31iFshAz/rZINx/E8s03/N6PctSaFwRarFaNkXvJHZSl85N/hCRuTvYuK4HdOsoC+3/8miwpJNCV5RmrODOuRHKcHJo/R/W48uDAnCJt5kVUjxV4jxwCQk/wk1mMPzAoOxVa15s7CCndIJWbGI5JGiZUlepLcvzbdzSXzXhflyhTjBHNz00/Q2hjDPkYQgXOKzay+xtO/4QQDMYQLPJNjOUIgL4Za0HK9OVcOWzET4rARh4qMQuYd3VvxvQY0XUbPL9rOnp3td7g8/IBaj/uiIWwF+GMV0258/ZpHlVfm+UYum+IfbcQvexYn27qNyKTyR4UOl8BZ5VWDZMFlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iSIbRCLI; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iSIbRCLI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHFjx5KPJz307q
	for <openbmc@lists.ozlabs.org>; Wed, 11 Jun 2025 16:14:29 +1000 (AEST)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a4e749d7b2so32806f8f.0
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 23:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622467; x=1750227267; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TEB3joLDGNQ10Dxn2W6U+Wspv7QV9CHlEFicTB8VL5c=;
        b=iSIbRCLIxTmFT2N18Vs8VkC1nyMp91WkYr/b6YcW4lsWVk7Mw3V73lwkmRQ2j0ExpT
         LmB1LN0fj04p5QJOo+liB9iC+rpGWNcGx564oJNWsiuBeTAdYefR/nlaicX/zpf5SE+7
         O0rMDxO7XPhpIKT3HVeOqnlEKn08/K/ZB7fZLBaTWm3iPrmRkKAbpaOsWVIgnMbYzWoQ
         pDzqb3ueGj3+wAKQv0kj0pMojVr2zsexeXWXJ8uGTt1GYOCPirpKXO113cD9MOLG3h9r
         dkiDJgqtro0UHGHp9gKWi5qCrRScPfXzW9M3EGBaMr0fN8DD+fGtz2KeyO+ZC1g33neZ
         euUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622467; x=1750227267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TEB3joLDGNQ10Dxn2W6U+Wspv7QV9CHlEFicTB8VL5c=;
        b=EVtNqga7/7qO6GFR7E1f4/ciOo2evuDfGQUJzOEVc78XcCrwcrakiAQHVdURwOhlve
         BGyw2rGaCQfNmCN/m8zl/N5E5Ul1TmBceED96E/+2g95K7klTFR/tZnBl5rUmMZwNKDz
         6vYAUBkpqRwKVkv7n4/NH0qktfjpgBB6WgECdrj8KhJm3K5kpUJivlNmTGnI4Zw0KM72
         gjAkDiHVwDcv6WSetkRkEHB2kIdUF/ERvW9GgbkmUxLeyQi6FAepqrbvlJ3E+CGpkdPa
         hA1raUbzsSnyevzVZouraT+CuH9vd4GP87EN0wmAHKFTKEuBhC2wEvpCcMFzMPKcbqgo
         VOxg==
X-Forwarded-Encrypted: i=1; AJvYcCXAChrfvmOCyXDfeHWXLyvobFDOENd5JEwGqOyF/7hxG7sgB7rIjdqf0lzOExpj16xDmRtZQzzE@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyX/cgrLpOK40QXNNdyfqMkdFxlfIrV9c9wFVNEJmKV9DLA8yAf
	K8oLU7yW4g758nGI8TGXgK/M2oeYmfuwE5kCC6/WGzPFBGzSI+gOu7teKXgQygRm9t8=
X-Gm-Gg: ASbGnctF8FHH3nGIctG06rG1Qcsw/pgpf7OibZ8QfnIt5qUjAsPPlQI2eqFC89t6Sal
	MUXfuQqae/zmE8GII4Jc/utzkxA6JNhlyporNLJo59XGjzVWX3O7K1aSjk7VBtGkkauVp8hMOEk
	B6ky9Yn3Om2kOpFgPO/Kc8JFEbwIw+wsBaLZMRt5CaEQuHUBkbacAMOQYDzwnPbvo9isxzC8Ik7
	B6OYZS9sFXl7IZXEoV9VLcsvFfj07d5llqVdOQp+OcqsD19nn4CHnE8GbtkdjKUC9pJT9KAl3sM
	vWwIuPh7SNRe4wOfej1ONzht1dfqIvWPBJE8WFgOYQztBJy5n8oj3KUSARDKjpicOyPOm1+5Qpn
	/2IV/L6c=
X-Google-Smtp-Source: AGHT+IGKArwmT43Jp39W/IH9DrAfebUf487r6XRBJJfTxXZ7wZrfvcgLM2/UusAKtEurR1Oql+1dkg==
X-Received: by 2002:a5d:64ca:0:b0:3a4:d30a:7633 with SMTP id ffacd0b85a97d-3a558a219bfmr553112f8f.15.1749622466767;
        Tue, 10 Jun 2025 23:14:26 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:37 +0200
Subject: [PATCH v2 05/17] pinctrl: aspeed: Constify static 'pinctrl_desc'
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
Message-Id: <20250611-pinctrl-const-desc-v2-5-b11c1d650384@linaro.org>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
In-Reply-To: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3815;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=MUWLp3Nt5eChdJhKGynTZdb05flOTAfJJ85UEeTcZlo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6iwlO2tQ/UpCj0vvsGMdn11hh5s2rcGYP+x
 QO7DZiy+8GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkeogAKCRDBN2bmhouD
 1xQ9EACNGt2WyM5b4AkDlzKbhuD6nAbgGjDViCR7KZyPgUO70TNbTmXSywc0SAXADggMLD36i9B
 /MyCOvxlkIQRYFBsGI5cjokf97+vpM45r3Ey8O0/VpJGYomDjOu9O8synMz+BccVLyNGtbrDIPY
 FgdWz/Z/vUq7vkSM6yT/yFMW652cUeZafnSLEFe4xPvyy3ib1Wevr5rm4tmM0hAQQhicljGiDVu
 QBQGPXd8y7HM/fXUA0S2wuyzWGG541W/oI75yde3jV9XqvGpRYQfyLdoQ4x9Uo5qe6Ao9aeNHgF
 Szpcr5DTsQIjtCvy+ObGvzDHXLF9TlEyAoyqS1b7NtI/FKFaJpL/0VDCDSqYYgqRHTSeRGvCfTH
 a4vfnXy21HJ2vCvNd5Py45HkrKi8ku/uWOQeeWlPAARoGdEgR8ZKbDxzX7bXKoIpDGLrS8jrkvs
 x1TX5MnTnEQ2FZvO/Ex0rqguCfQoZXWDxhg3TW/ChFXjQR3kWtxA146wVDmfCLjwPy+NIqHcRgg
 IVaaFfTXPbGGJRU1M8m/RGL3g62rPoFv/bWdPLFktxqifMdLnFY2a6SHq0m5eoqpYdX0wVV/iP9
 5PKUq9+nUx1UtfJIOma14ebdxYJa8wgkyllbcdXsD8JhnbaQ9h1CK4gOjI4AK5pP5TJOfxtwVkz
 JeKCJJV2+52S1Dg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The local static 'struct pinctrl_desc' is not modified, so can be made
const for code safety.

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c    | 2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.h    | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
index 774f8d05142f2d90c238f8e6661eca4685601db7..cb295856dda1244f2205305cf4c505d4ea4a326f 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
@@ -2653,7 +2653,7 @@ static const struct pinconf_ops aspeed_g4_conf_ops = {
 	.pin_config_group_set = aspeed_pin_config_group_set,
 };
 
-static struct pinctrl_desc aspeed_g4_pinctrl_desc = {
+static const struct pinctrl_desc aspeed_g4_pinctrl_desc = {
 	.name = "aspeed-g4-pinctrl",
 	.pins = aspeed_g4_pins,
 	.npins = ARRAY_SIZE(aspeed_g4_pins),
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 5bb8fd0d1e41bda799119a67887ccbc277e0f9f4..792089628362a1ed1c3eccd4e46c41a3ac7a79f6 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -2845,7 +2845,7 @@ static const struct pinconf_ops aspeed_g5_conf_ops = {
 	.pin_config_group_set = aspeed_pin_config_group_set,
 };
 
-static struct pinctrl_desc aspeed_g5_pinctrl_desc = {
+static const struct pinctrl_desc aspeed_g5_pinctrl_desc = {
 	.name = "aspeed-g5-pinctrl",
 	.pins = aspeed_g5_pins,
 	.npins = ARRAY_SIZE(aspeed_g5_pins),
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 5a7cd0a8868764dc5e3dc70f325c25ba29d50a64..51a63cf92023f7dc7a27466331c77bb5dcbaa9bb 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -2763,7 +2763,7 @@ static const struct pinconf_ops aspeed_g6_conf_ops = {
 	.pin_config_group_set = aspeed_pin_config_group_set,
 };
 
-static struct pinctrl_desc aspeed_g6_pinctrl_desc = {
+static const struct pinctrl_desc aspeed_g6_pinctrl_desc = {
 	.name = "aspeed-g6-pinctrl",
 	.pins = aspeed_g6_pins,
 	.npins = ARRAY_SIZE(aspeed_g6_pins),
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 9c6ee46ac7a096ce693639d88d387b089ffe5239..7e0ebf11af163c90184231686b1e0d9920755d76 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -441,7 +441,7 @@ int aspeed_gpio_request_enable(struct pinctrl_dev *pctldev,
 }
 
 int aspeed_pinctrl_probe(struct platform_device *pdev,
-			 struct pinctrl_desc *pdesc,
+			 const struct pinctrl_desc *pdesc,
 			 struct aspeed_pinctrl_data *pdata)
 {
 	struct device *parent;
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
index 4dcde3bc29c825cbc6be954dae9a654a310b4cd8..28f3bde25081b2c8099977129acdcdfb3e4b1dd5 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
@@ -102,7 +102,7 @@ int aspeed_gpio_request_enable(struct pinctrl_dev *pctldev,
 		struct pinctrl_gpio_range *range,
 		unsigned int offset);
 int aspeed_pinctrl_probe(struct platform_device *pdev,
-		struct pinctrl_desc *pdesc,
+		const struct pinctrl_desc *pdesc,
 		struct aspeed_pinctrl_data *pdata);
 int aspeed_pin_config_get(struct pinctrl_dev *pctldev, unsigned int offset,
 		unsigned long *config);

-- 
2.45.2


