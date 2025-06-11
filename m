Return-Path: <openbmc+bounces-171-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9F8AD642E
	for <lists+openbmc@lfdr.de>; Thu, 12 Jun 2025 02:03:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHjNz61Lmz30Wg;
	Thu, 12 Jun 2025 10:01:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749622490;
	cv=none; b=nmeZiY1LJs3LwqwXMI+LRtVmROcYnbSXjvTfR6dn8lNQUGPVseknHl/RCvaAwkj7Oq5QxheYFktIkqfvjnTjxEFEDn96rE3iW8PoOfCM8NR4ap9EDJ9YFPL18fet3QvijVa8Ol15Sscm0jEi6ju1bKPRSQ8uvNSt5I8xdWQPcu+E6aStbKHnBpranjroSYP2A1XDBd2G0P+AzbWxQvWeJXJV5TE6+Ku/T6GVH2t3dQTr+lsOqnUk+tutKx8d2d4mCn7SOKgDQ98JdOdx1p8c/e23ICTvIPz9MLnQKGZBjWrMdS0wgZGz9vF5nBfimAp4CFwOKXvnzrjSzmw0hKl8JA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749622490; c=relaxed/relaxed;
	bh=xhuOXPN5pzbXggWWg9hnI9xTO7REs2psbwAuBBp5Ivw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZjVtmQxOIFmMQhOCx91rXo1A3Y5btfykTtglnZPi9g9ANB6OtgSFfyMa8USWusDTfx8GISs1nZW7kgMmgmBol4lBCXo8cuwk39AUIP3VIK2HajJXHla7BaLavOXq/EO4gFI1X2/bbOHnTVAO9Qm75HyfOLMWcIrS+vb4XnJgO6IWPmlhQUvvDTLwq3KEAvW6NwxEL1sqsljLq7vyWJA1dnaGql3LCcF19YwbP84oZ0pGPXcXDsjRTHcCP3NVBrv0+PFHKKUk9he0Wup9HV5n2P6jL/HXsgGSKMipVILShyhF64ac9FVJlwlwnKeR5bSw98eoez6oNdPIurcMlToPSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Tftl9uNf; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Tftl9uNf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHFkK2R6zz30DL
	for <openbmc@lists.ozlabs.org>; Wed, 11 Jun 2025 16:14:49 +1000 (AEST)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a528e301b0so26396f8f.1
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 23:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622486; x=1750227286; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhuOXPN5pzbXggWWg9hnI9xTO7REs2psbwAuBBp5Ivw=;
        b=Tftl9uNfWHaI1vU5G2mM7QFHE8EbJlkomRcP+siNcR7jb95ncCPDYy8XWg0AmwTPXf
         AvsZz0aG3QtOdPm5hSUo2iNefFLgSCnGfRb8igbv/iKJAejC4EQ9hHOm+sb6Gcu4NdDU
         JcfdaS5eDqBheMFSAZm3nB1cwoSzOUV/svqWCsP8tjZOT26BR3jCSK3mJnUoaSHym8zd
         GVes312isTAQCxDngTDN7dlfPOhhOAfbYz1pDUuaLoRApoNRJTut4ztD8j9FKkhqspuD
         01g0Xv+TEPpC9/+Lw88+I7v/jfN18M7Se46o8QDbAe98DJpMzprricILxKgRetZ880SP
         /YCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622486; x=1750227286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhuOXPN5pzbXggWWg9hnI9xTO7REs2psbwAuBBp5Ivw=;
        b=DT58UYPFj3chqUBdmcSTDm22TZeqCdRUphkBzpAGVmlC5+s22fTbY8Yfh/2r5sh4N0
         xmMA+LKhRtaqAyc/BXPTh2u6uBC7TT4hXdBLVUjqi5UXb6C6iAbdL3VN4s33GM5iIFVe
         rVkKz01YT0GFjvnyTYRS9OeZsCSoCIppvD9KLq2l9ID4Sf2886J1rKv3I/46tGrMGrEb
         8LTtRVlO6u4CW/FFApAhqqkoC/yIy+UnxZF/HLuZ/kFejvYTcCSmgLlBcU0ku1XSJBEt
         TYhMA96PuGfYHJFL/gP595ORBxkDRFKv1xS/hN74xTQm7cCjrV6p0qLjNarvHHcW/GMI
         EtZA==
X-Forwarded-Encrypted: i=1; AJvYcCUsSzPpznxb8eieF7eMlk6nuaLglUc0CmtdwMbY0oGeK3uuoZlmDLSmGdQR5fB3tHh+mdlyd8qK@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxyn00cy1gjH5UbIqLojI7ttRfHq/21qLnDyHo168kEArwGleNG
	c1/kk1Lb3OkaSuPtD7ihsdhyIs+dpsepbDXLR7Oxj0cR0onj278vJR4QXR2LUeRXTus=
X-Gm-Gg: ASbGncvY5bpKrPr6d0BYDPSnwoW868Nh8aW42Xov425ShCuIW+/U8eccmw8msNTvD0w
	Wg7I39IjlDRkdka9Jx5bUuO+M6qmuVaVufQkEFS8WdbVBGZO5dbWRqOuFqBIWILLsslTOa8H+Lz
	4ktlHAjNh2EMxn8Zo88BgEFnq7F3hYTpzHkjCzec+NEnbuXQWzTKYlLI0vX+JhVKXiep0eDJrIr
	Y1cYmEqzNcB1kDo8dTZ+lmim/qbPrJkIe81w3/ladddk15LnIJdn/NCf/GgeH0w9SWOsLmaiLZs
	iAy3MZZgHCUYrfaGH3Ha0xn1Jo5wQ1tE6iO/YdKUxb+RJdHNsqjSTGsnXZPJYsFKYJ79MPh4hfq
	2XXMWwps=
X-Google-Smtp-Source: AGHT+IFoBfGugxgH7Y07c+Z7PgO6Vu533wPz1tMcs2kNav8PQm9ojUKm/KoAc5pG4XQWm3sCZWL/JA==
X-Received: by 2002:a05:6000:2313:b0:3a4:eeeb:7e79 with SMTP id ffacd0b85a97d-3a55881f23fmr555424f8f.12.1749622486357;
        Tue, 10 Jun 2025 23:14:46 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:42 +0200
Subject: [PATCH v2 10/17] pinctrl: bcm: cygnus-nsp: Move fixed assignments
 to 'pinctrl_desc' definition
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
Message-Id: <20250611-pinctrl-const-desc-v2-10-b11c1d650384@linaro.org>
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
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2083;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=AYNDWesc3V2AvRR7if8AbZFHcfpmPLseFxX/L5QzL90=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6nF3fg9hKfOe+Hbr9Tehw6sIfTcg/RPRBf+
 O4vW+xehwiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkepwAKCRDBN2bmhouD
 1/2lD/42/A7ac2PRGbwiBHKKG8B4x10B4zm84oj9tWoEWjIiNCrieIBnYPrCLjlrhWxBPvOs7vh
 Q+lrPGp0oUPIrfP1V9v1nbsikUqnMGkq/mMlW7Q8ed6lorVeDOnQKirV3EiRcQ32H0rW7hw9XV0
 EAuunpaOtZ2aQWFCsRIIOx9yNCEeluYhDhc8/FTu/ClVL42hwnYs1rT6agYiCKJU0S5qaiWH2gu
 dkuBiRRqX8NsoB4SnSOq8bFtFUyJI2nYBN0mN3kYMQ1TPpCeLty1DLRJZ0aYp7D292HAEPoIAQR
 8Kf9CyOMbUTu/l9PRBhbAq5DbZSxCYgy9Dp4kt2QCKfde38bfmcW0AWiirTSVrWKGxx5UtsJ3O/
 8rA5oBpKlaNI1+mVgQCnfLYKT+oYmTbPpR4BY6mvvkKuql/22PkuV0MyS/aDwaAqPU0svNbfCI+
 0XED91LrVnXbYLt8vWAPYfCuGGPHnG9tOCVRg/T60Rl65gbUXK9h+JVq7sJOhh6pmdSAvpP9P7z
 e5Gk0qCav+Rue6poBOqkCRWFVxO9RgxbxL5ETGIhR2Kmi51H5EBpXIV7rmaI/+6ZZ9Kad+v3rJu
 kCoBZ8gkIVyWqNjLG0L+3huLO43lOyPvxGJycogdWphLagnUoCjJ6JG/UmGNsifVdYPSrAjzJD4
 dcQEUA3glGNzmJg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Assign 'struct pinctrl_desc' .npins member in definition to make clear
that number of pins is fixed and have less code in the probe.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-nsp-mux.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-mux.c b/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
index eb6298507c1d1873f9d5a90ec724b36af6d4da48..9b716c0d2b9456b9e64ca1094375effefdf4817c 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
@@ -525,6 +525,7 @@ static struct pinctrl_desc nsp_pinctrl_desc = {
 	.name = "nsp-pinmux",
 	.pctlops = &nsp_pinctrl_ops,
 	.pmxops = &nsp_pinmux_ops,
+	.npins = ARRAY_SIZE(nsp_pins),
 };
 
 static int nsp_mux_log_init(struct nsp_pinctrl *pinctrl)
@@ -556,7 +557,6 @@ static int nsp_pinmux_probe(struct platform_device *pdev)
 	struct resource *res;
 	int i, ret;
 	struct pinctrl_pin_desc *pins;
-	unsigned int num_pins = ARRAY_SIZE(nsp_pins);
 
 	pinctrl = devm_kzalloc(&pdev->dev, sizeof(*pinctrl), GFP_KERNEL);
 	if (!pinctrl)
@@ -589,11 +589,12 @@ static int nsp_pinmux_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	pins = devm_kcalloc(&pdev->dev, num_pins, sizeof(*pins), GFP_KERNEL);
+	pins = devm_kcalloc(&pdev->dev, ARRAY_SIZE(nsp_pins), sizeof(*pins),
+			    GFP_KERNEL);
 	if (!pins)
 		return -ENOMEM;
 
-	for (i = 0; i < num_pins; i++) {
+	for (i = 0; i < ARRAY_SIZE(nsp_pins); i++) {
 		pins[i].number = nsp_pins[i].pin;
 		pins[i].name = nsp_pins[i].name;
 		pins[i].drv_data = &nsp_pins[i].gpio_select;
@@ -604,7 +605,6 @@ static int nsp_pinmux_probe(struct platform_device *pdev)
 	pinctrl->functions = nsp_pin_functions;
 	pinctrl->num_functions = ARRAY_SIZE(nsp_pin_functions);
 	nsp_pinctrl_desc.pins = pins;
-	nsp_pinctrl_desc.npins = num_pins;
 
 	pinctrl->pctl = devm_pinctrl_register(&pdev->dev, &nsp_pinctrl_desc,
 					 pinctrl);

-- 
2.45.2


