Return-Path: <openbmc+bounces-94-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1B9AC750C
	for <lists+openbmc@lfdr.de>; Thu, 29 May 2025 02:20:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b76Nt0vRNz301B;
	Thu, 29 May 2025 10:16:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748428911;
	cv=none; b=mdV88gWvC+FYcZ+8zxDgdJAkptCPjje0POB4aUiNyzOfRqLJvGRyB4bHO3A+v/J2hLPgd4d2XR2HzG7iqvew+t/u9fU1S9g3gpeJOpNtTYm01fz8FyTrxdGuX5mToi/7QssV7sHDRsEArxjXDMXonSzqmXNFUoNm9yr1EA9A3Q2dbdf7pyjk0KuDMWJGWzNcOUos3gtwR3bmRdLiYMal4jFUqZovewdxRCyoZcWAI/yEaCHGX74uX/klnswD7TK7oRArwWg+dxD/xXIZXqHxL0ZFW8DCFthALZe6yJE/pqlxX80RNW8OlB+WQZReqzv5Sibg19TT5zfLePeZhrpSmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748428911; c=relaxed/relaxed;
	bh=eCWZ95h3v8faxWII4r+ll4sOFmAUxo+1NhX1BBWmSo0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b3LfE9WIS4Q5dXyJH98tJicAag9HDicAk+2iBc/IUbEGtSFyJ5zAgn9RG2AEEMMm6nCeLgPH4WZHa7AvwSIQ/jhdSmd/B+00FR5gRu3mXc2cN4ckPtUtt6MG2JVEZyCNvQwjQPvWKa2sKoQ474ZbLKvAWtAau348TpNSqZHSEzMX6Z/ZufTzQ91noChOyjUIeTMvIPRaRreKXagvQTuhCno3OwlxyPBh+fJ0yTxZPpVrSiywND/A9HNjNziDXnQGyuBUiE/GtS8n1zKLuKdZMz0oLOyqUDN/+HuIKSo/BqnnPSwRLhBdPuS1JSGMkKVWgjRxFungJrhIgOxrdapg8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mN8xnqKo; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mN8xnqKo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6mJt64gxz2yWK
	for <openbmc@lists.ozlabs.org>; Wed, 28 May 2025 20:41:50 +1000 (AEST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-442cd12d28cso4688185e9.3
        for <openbmc@lists.ozlabs.org>; Wed, 28 May 2025 03:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428908; x=1749033708; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eCWZ95h3v8faxWII4r+ll4sOFmAUxo+1NhX1BBWmSo0=;
        b=mN8xnqKodebb+rhuFQnGZMA+sxlMS3tdkCY8QBdsEgRFG8ZnDfJnMI7s9zoR4SuNSg
         H51N7XLCyWsUCOpHi9fNd0xg6Q8Qip3U7HwWdVSWgKTeac419glH3xUuUXa15UERZw9e
         w6seLvbsQO6cE/khWXYokQVT7coBjrnTMN7lPWopprpkJbn3lZGKKv2l3VKd22dXrkEh
         2N0LinAjF5YP1ok5PY66tSVreoDNBIQnstymmzo6tYkZs4qMfu4D8e4DD6b6dpAtqDcJ
         +Jag0Ufwrd30S4WKJt4dGg1hsTC4k31GV4GEh0W6AuXAJImku4qX6v5GX5YLmZcxuN1u
         RYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428908; x=1749033708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eCWZ95h3v8faxWII4r+ll4sOFmAUxo+1NhX1BBWmSo0=;
        b=LRIcp7ommXx1bFBAi5M3yj22gW6dcDsN77Yej/Vo6lJ+uNMrLe8UKOgkGjTyYEcNjb
         GRbZy3C+ktvVwnFfq5WyelWPfObEHycnutuNElGZL48AUjDqxtK1gsnSPqVUjZl5tJbO
         Ck75JDVv9SQtK2VsSWBOUqOi++xmcd4GUUEMTa/ceHTq+rdcImkIYKSxVuZPwghzrlLJ
         9/7BBcn3BRksB2Gc8X7CR49Pu7Y2cIv9vi1FJIeU45nREiAK2tf75aNRp/dFeTn+IedN
         yHAi3BGTHyexYe8MQo+AehSyGYoXobkaJf3Kp/abZODXhTEv0wtX6ODLXBF/KTOSduhF
         1MAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjcLFZWeR058EorY8+f2A3JZDa+Q0muTidIVOvrn50euhspbWOOmz9pPW2yaK2YaeVB+puxXpb@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwVjOD3P7aIL/TnFrHeGHCuVcwx3VZakzvwuJtg5hA1VYeMYF7/
	kOhGG6hlKkTbUdnjwts9IC1vsS2uN7CoJcMGZqFBtweV1KPUhVo9ec0wZjzVeL8GXig=
X-Gm-Gg: ASbGncsRI4GzhxBlj8dCpxqPnKH6F6qMXlJkchVK/fOtUFhOnA8ulL452Vhc4tdZEmj
	wSbpfmkWgIhXqq/kp0xxKSHVZGw3TDj/ZV3MAkUtbEYzujMTsfGerf9rxzbc4YSl6XrCoQjwfZh
	kJnZ17Yr72dvVc0iadW2XMlDLM8Wa6A7TdYRL9zZsbEej2tjxf2umBaqh1dsJWMVA7thp0zuuth
	9qUA1lXzuFyK1BM/mvzzzQ/2pzyUHsRAyTNbeoKIAwLWBwY6VzXJEiOWQLJRiZO0SYyCznKG45t
	V9415wEj300c6awTteR2LKTFJ2lHPZFLFwOSRoxLWxJSGIY56xU9qU4V/CNpNNaFv1CjCdo=
X-Google-Smtp-Source: AGHT+IE/LJaHWTe9SYlHoYiKsnsZsaOAKKUrQJlJHOckCVYd00NuFwaRx6BpFbRuXnZ9itlqpT5fMg==
X-Received: by 2002:a05:600c:c0c3:10b0:439:94f8:fc7b with SMTP id 5b1f17b1804b1-44c90f4ccb1mr34271245e9.0.1748428907943;
        Wed, 28 May 2025 03:41:47 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:41:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:01 +0200
Subject: [PATCH 05/17] pinctrl: aspeed: Constify static 'pinctrl_desc'
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
Message-Id: <20250528-pinctrl-const-desc-v1-5-76fe97899945@linaro.org>
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
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
 Lars Persson <lars.persson@axis.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Damien Le Moal <dlemoal@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Michal Simek <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3756;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=bPCkHXtxmRdHSBbvdS8jXvx5ZcbYrMBVxN7TAPQmEWo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhN3yUYNRVGlDm5GKvUjHRKmpO0NkcKTivqS
 rQ9YFsZsAGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboTQAKCRDBN2bmhouD
 15PsD/wN1dSXzevKC2HHXVm7rrp8PsHK6/O5ksoH/BLBd4VXwlPyIgGgkZ8jbISY8fCS0s7jAvE
 JbaDoYx6YKMIDEZRd/TdeBOLU2GWPzSgWvdOYA4LPr5cATQfbPRHhZIyCpk6FC4PPnfW8vfFrYy
 LKqeFzOpOHKIxR7MrchXNRqtxM+664l1K8Tb3XnT6+ojdbePdy7aXcAe3l7OG76wwg7sTwksB9A
 XcirEY5EnVp9kjB0/fwjQn3HwmrmC5zVzpgyqLm0uNEeDVJmu3CY/KxoGLqtzBfo+0xfopGAmAC
 fZ5m5O68s0ez/Xt46UgSW5XjyxlPGZkkQFz7Ba3qhVhc7GJsBR2ivHY8liIYf+UypZN3cDDN42N
 MyixdpJwa5XFsJnT+SiJ14/2t6Vu20ObUTXCfeto3WTYA6uIFk3QEktZFxNV/MQtBjA7SW59alS
 UdvaEjwa5LNRjWATKwCsWjkKNjj2zvgXhPO/kWHSySyYkAqHCAMtzWuRpLirzgARamkkw7eWkSD
 XXllk4esE/ckh1ZPaVSD4+yZ74jjdqWrNQSmFdzA6C+EA6M3BHIKo/NcQJg6NPBSnex2IGipA08
 KABgrW8+YQC/zSQ7VoZ6RwXHfcNuIMQ0ri/JoENVnFPqdN5ZVSijqUw1jZoLhXuA5LwDkWd248s
 5NOQtmWzYeMwnKA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The local static 'struct pinctrl_desc' is not modified, so can be made
const for code safety.

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


