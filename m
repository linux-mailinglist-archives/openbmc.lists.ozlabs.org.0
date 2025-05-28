Return-Path: <openbmc+bounces-88-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A980AC7505
	for <lists+openbmc@lfdr.de>; Thu, 29 May 2025 02:19:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b76Np21pbz2yrf;
	Thu, 29 May 2025 10:16:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748428943;
	cv=none; b=AdewWFOpAJSFC1Igdc1ZUFNI3EnaDESVp5elZc2JtKdSVBG+DW/UOvTokSNdxFYzZ1oqCZguizrQercpli0yxEHdU1qKV6aDTLejIhxNd8nt/U9NkhO1qrwUe4T9/QQlngfw1BJtXV+123vcftCxBD9X7slOQTcQOaWu6q02fSto3V+7wcy/LVXC6VtYiTlKO0h9bLkDpQXzFp3mlnuYVdLeTlT2/S8BY2cR2C7pUl2iDpHk8gJSTqeldnp9Tw+mk3SOcHeXG8ZivJzmH7fGqgUQcTV4Ou+No4QrTcSLiUkUmr65N2WhYJb/iWRg9/98eCC/PGB2R1AMD03bAhuWTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748428943; c=relaxed/relaxed;
	bh=k3Ze+vADApZQcXHHJvnQw5idboAhTO4ZZm7oXpqIyA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Biw2ZhBEnw0iDwJzVm0liJ/r/Vc2tBaRV/drXvAJeZpvERsV8IYzlqaXhWwePxe8SyaIYLC5gyKdUWssEaSFaKfWD/UITmX8tpknANAeympJ01MhEKzw3fwbt19eVKDQn+yt8myzrxOKjWmUFsEcQQaaXOiZ8wPo08YA6RUe++54cqLLXm7l4+P26/oU+EL+DLpSKJflfhqPeLB2CvlY7ifbg+HNEwGzBNti30DF7YAek6KKXqVZOaFRU4+UyhTHd1dXIQTitjkWEEmCbzvErNc/xOauz4hTkhrW+zYCcqvGHm8+u4bgUuL80S/7coxr59d/zd3Aj2THcrGOr6ZinQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xdIY0ksw; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xdIY0ksw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6mKV537Pz2ybR
	for <openbmc@lists.ozlabs.org>; Wed, 28 May 2025 20:42:22 +1000 (AEST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso5070295e9.2
        for <openbmc@lists.ozlabs.org>; Wed, 28 May 2025 03:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428940; x=1749033740; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3Ze+vADApZQcXHHJvnQw5idboAhTO4ZZm7oXpqIyA0=;
        b=xdIY0kswSN9wi+cQs171wrSqqqcj95VItG0eHQEofqp4drHZyA4h2xy2MuCdv4aUZ0
         66+rOrCUGA/phdq8anTE0uTWhH2FQs5I5uSxVg7Ic9FbddcU4576tt+Xo+RQmgltUXgX
         GdpGt9d9Uqbkf3lO8Kn5bdjJmkZpWTIczcD76D/pBTcguK9zHmvhtW87y1JACaTOQXDz
         44XoJtwzBi83kt0mQvuSt+p2b1wY+fl2WtElI1hual1p4w2/2xKnu5s5PQnEyBMUQQEU
         aaM9uFd2Avs3Nxsce29gFm+wyn7DyBVIpuRC4eD3BDjivPAuLZaiRYb5dprXlQfkAm9b
         Z1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428940; x=1749033740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k3Ze+vADApZQcXHHJvnQw5idboAhTO4ZZm7oXpqIyA0=;
        b=D98nnPsSfM3vp/8koPB+jiC8Q3P9QWQWIUY0xzTjFHV5pHK0h39AbRkzAS78TXH9gA
         kUQOrbUqo7XRiz9NgKLe1P0uRzIMLJOXxwUntwR2YAh+g010+B0jMeRc0SxAjnQ4hGDJ
         scnJh05DakOZJOMTbBfGSBJ/KJam2epygAHLjk9j4+Lv6TZpBMXMGWj6+PKfRyRMOXZo
         Dil0M3B0s76tm6RpDDADG5V+V5SMGHCLt2ZObzUWsaVVtfGpdMNhtV9yNdYJ3fY4YeIl
         j/fcvItnPlu5BXN4WBkk7ujDmiygMXyMKimGb/qdKq7krdfmbzUT938GE7by6gbF8L5L
         jH7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFqgXSPGIBcZXPX1AvANNb8f8knHt0LwUpOz8Fw4G4ZM38KKNfSLg/UHuTHyMeIb9TW1qfyRK+@lists.ozlabs.org
X-Gm-Message-State: AOJu0YydIgwM9XLln6wTOMtn+aLOTKuh8PLHh1ROOigKKp73r0CejR2z
	cJvj4tsk9lNl7vXPSJ6xQyh5OLiIMQJ31iBZKuLcRZQhcBKr9/TyaKM5zxVUa1LY9xE=
X-Gm-Gg: ASbGncscgEop095eBHl5PLVEHiXrdO8c6ISUKGg9EXqO4lw07VCDLjSg93st224MsV1
	tY4mwMndPrsziA18LdZkA4JTXEE5qjuTvlBkwZBLY9bzWeL72AZNiY7hoUECzSTNz4VQywRPtW2
	n7tfHgHL74PXxzhPdrgxeB5RlZwuMDxiD+kiuVqiUhgJjzpunBxQV4ATvHWMD2PCTlPvV+wra5D
	kiezwa/yQmYUweUVb7pMF4JqxdDN5OLZpPudDf87Doqu8hXKNMhZN5iutq04ljQUsGYTGBcmLkJ
	+WFCnOxj0NqHNnMMPeMFpx1PwJ0s0Hds9B5AFwFAUHEO2Fl7drE3VMXSBjizTMfMMnrUIDM=
X-Google-Smtp-Source: AGHT+IGOjiAalYWBzwElbSsmEX9f/2Y60O5w2k0gf1phaTpGJUJlpjPJvNra7B8bibqFA+SG8s+3FA==
X-Received: by 2002:a05:600c:1385:b0:43d:fa5d:2675 with SMTP id 5b1f17b1804b1-44c954e5abbmr50075875e9.9.1748428939845;
        Wed, 28 May 2025 03:42:19 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:42:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:11 +0200
Subject: [PATCH 15/17] pinctrl: pistachio: Constify static 'pinctrl_desc'
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
Message-Id: <20250528-pinctrl-const-desc-v1-15-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1566;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=UtgeU3dDjW57LMOT846YXV02Tw4GcYGErdMblZiJj2Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhWkTbDlacFgpFnf1vgJHMFlUPFeOl/ORR9m
 JSbFDyczmKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboVgAKCRDBN2bmhouD
 10W9D/9xIbBzH6McgFf7kxs3Wz0pkjTxc7iD6YAhHueVZZd1gP4kz2jdB6oiJdWYbdcvCTsO0Jb
 1M1uQI4Y+F5z9nhOIsSCZcbSEa8uYgf4mTdPeZejnHLZuN+XRE4q060VzMPM+0E5ffmjbSfdguv
 jUGo/ReQL/VbQR3GL3x3Sq+TYjMsUO9HwZ74ot0fnqvUDfwONwxm9Ia8eDAmZA5wOjtSqLldzqA
 nmcrMY8YYR++DoVRbPTLeb38zzchZ4+VQga+QK2Xjpm5Q2ybYvHN4lWRbyLvHLzodyGtm+9vfTG
 jar0yvgxFJxSt43uUsQQD2kiMQ5Wo/A7Gkl/g1mAoDL86kviDaDexYqAL6QM34oxF62djx6jTYo
 t1J67a9M34V59n3xE0FqQ/zITEuVNEP6mBzPXgRbusg8xO3mZGZyyCZFaz5TfC5GMy213jvzS2G
 /BQbvzGMIvKFcEJltkEesVBc3dhPn4j3T53KxDzwq0XR8/qrHK/24e3XCpaCpkP47HtU4IkGhtt
 LDzr6uOse1tliqhZHHOz+JMmqt+JgE2zu0h7xaqEXEV5JClvnbxo0LIz2LR0f7hnbRC//FKZpon
 bEVmb4R9Sw2nd4OuvK7aG4+5drtYGMTyYELEOHkaxIcGob6OxTK6E/vhm3q31u90R4Dyb3LEcPB
 i8N0zohII+TfZBA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The local static 'struct pinctrl_desc' is not modified, so can be made
const for code safety after moving .pins and .npins assignment to
definition.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/pinctrl-pistachio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-pistachio.c b/drivers/pinctrl/pinctrl-pistachio.c
index e7bf609609617d6af2f10a3df56c62e3bfe2dcd3..7f8b562c81c9cfd1ac3a0bd50018857450bdf609 100644
--- a/drivers/pinctrl/pinctrl-pistachio.c
+++ b/drivers/pinctrl/pinctrl-pistachio.c
@@ -1156,11 +1156,14 @@ static const struct pinconf_ops pistachio_pinconf_ops = {
 	.is_generic = true,
 };
 
-static struct pinctrl_desc pistachio_pinctrl_desc = {
+static const struct pinctrl_desc pistachio_pinctrl_desc = {
 	.name = "pistachio-pinctrl",
 	.pctlops = &pistachio_pinctrl_ops,
 	.pmxops = &pistachio_pinmux_ops,
 	.confops = &pistachio_pinconf_ops,
+	.pins = pistachio_pins,
+	.npins = ARRAY_SIZE(pistachio_pins),
+
 };
 
 static int pistachio_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
@@ -1474,9 +1477,6 @@ static int pistachio_pinctrl_probe(struct platform_device *pdev)
 	pctl->gpio_banks = pistachio_gpio_banks;
 	pctl->nbanks = ARRAY_SIZE(pistachio_gpio_banks);
 
-	pistachio_pinctrl_desc.pins = pctl->pins;
-	pistachio_pinctrl_desc.npins = pctl->npins;
-
 	pctl->pctldev = devm_pinctrl_register(&pdev->dev, &pistachio_pinctrl_desc,
 					      pctl);
 	if (IS_ERR(pctl->pctldev)) {

-- 
2.45.2


