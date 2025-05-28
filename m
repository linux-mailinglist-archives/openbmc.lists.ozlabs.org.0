Return-Path: <openbmc+bounces-83-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A161AC74FC
	for <lists+openbmc@lfdr.de>; Thu, 29 May 2025 02:18:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b76Nl0Sbzz2yqd;
	Thu, 29 May 2025 10:16:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748428928;
	cv=none; b=OgV0O8ilIHE6bgw8pmxy2u4U5bLi4nMg5kTfkja4v9/3+PvXpBJdA0V8MQNAY+bQT0ds2SoM969KX2srtr1rekYrIt9Rel+FZSMkB1ULOXY9Lf0pX06rbD+I6v5czVnJOATL8GsTfxD49RTA6PfnXsczLJf6z3LT7VI/LpqNWcZfHfesyFl7VqmOjrDjHBJTQC4tsYP1WBt1BD8+Wg96w4t/uAP798K/EUjXdI9dEQm6WMCirFHgA2WV+VzpbDnkG23RFj9bzYVE0gDSRuhNMrffh/dOfESMx8hrJor7uaalcJb9b+IOp1VaOSZUi3hPjGC+ZNe4SwNFhQ6b/KZt0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748428928; c=relaxed/relaxed;
	bh=mUavy7B2LDMdwrM/5bMX/h9Rv/lKrrO3+mfX8hz6Iuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tay/nsQdund9+DQFWQunE+6qhE5MDc49U1dOiS/My0VjCyVa6inxLMJ3Vslr58gE1YI809e8NdvFNWfo5EFEMDn6SJ1exf/VVAR4vgHommGnKpBqu/TWzBOKRszy+ndAITNQz5MabU7bV29FH62Z4m6X8EbNmmDlh3UojuwUZE41+7O2p+Z1yX2M0C5rXlK3v1YXnYXFUUeDOrylYYtYgmampy9B3mvXwjRJDPel6mUHOK/+qK6E2Ya8Q56VYxquGOKg4rND8lGA9Hs8AFr8wHYNuXxRWsUlZwvseaJYKELIk9muNy89ld3hQQtEuwHnrRdE76QcluGJN32QC05FCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pVWwVNZH; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pVWwVNZH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6mKC2Ykgz2yZ8
	for <openbmc@lists.ozlabs.org>; Wed, 28 May 2025 20:42:07 +1000 (AEST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a4eb4dfd8eso29531f8f.2
        for <openbmc@lists.ozlabs.org>; Wed, 28 May 2025 03:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428924; x=1749033724; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mUavy7B2LDMdwrM/5bMX/h9Rv/lKrrO3+mfX8hz6Iuk=;
        b=pVWwVNZHrS0/6NkWeVSWEX4q99/dhCkkJP7yV7yxpXABuGLLkyI1jEVieQz78FJBgj
         DNr18ts5Q7ndc+1c9aHOth5H+5Yo3jWuyw8HCOmQV1p1kf4zc9LOCLv/EAGFAMGMr2RK
         PY2ZCXbCebaAQ2Y2MgJ3gageR7saKJEhE5LQnS5FfuXZIRYqroqJARFRa9DbdAlfmhHl
         0DxbwRuVmlPL1mu4XZFZ+G21rV0Xmelw/GPs4LZCqXrRGBkm8RNan+ts1q+cH5x7liZe
         htyA/PPEghaTkKIrLDaHYPlW0iWe8jYCJ0/53rwuq5/gFyJWoRMGcgGHJG5hV+enQHPx
         hkUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428924; x=1749033724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mUavy7B2LDMdwrM/5bMX/h9Rv/lKrrO3+mfX8hz6Iuk=;
        b=tguim31j5PPO1Ug2TeFkg/m2Roor3Xu8VQzeA8wf2KsAyBfuZ7w8nXcYFqN+7ka30L
         yYj0jeSl+x78/LWAHMKvz89av/sqABE+d+zbxe7CJc0xEBG1hYKt5MSbvf5Aj1gqRot1
         SSCYAh/HAc/8WjHTyzmNpfdZREmhiiwYS4vHcFMaBARypriUnT16OeiWr+I1VVU2fXB7
         VYR+qTomkf9mKDbMAx0/YRvZEy5v2NmD6PLoyiezKvEbubgbzx9mRTj5QEiJksarx+OO
         0aKmeQ6K4hOdP0gO10SsRCl7oAYoFsLwCGo4bmQ0tKDJUCD3u4aOXa1zFd9ULaPhDZ2P
         mUkw==
X-Forwarded-Encrypted: i=1; AJvYcCXFg9C/e/zxlVJbpXBbm4k3GdPm6NZhKWh6Z9gfH5C78kwzyMCo4kAf3S/2iMyhKFgjyJo3BaR1@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxfx3tb3l9erDuuvY17ISPNvDOQGh0oud9Hs+/BT1xutZDVOf+j
	82WgoGplyb+ywvQjPyv61Zkyqs+xQqXvq1XlMKgMy+poFCvaIBNup4wfAqtUMMf4WrU=
X-Gm-Gg: ASbGnctTMc1ib7BXUZfuXHtgoIvPQpTQxT46hWsmIVYjCxVKeUkMsUf/JrI0/NhUQN1
	wuggGE/FCncYJpGfoLmGkEdvg4D3ETuOJCu6MkDeu5h1xhOR0M5vSRd1iPxHT9GKRUVrjakLII8
	NRlH76fH6nQmNWJ2YLHHfRwJmBklz2xejE9aV2DCPgr8m84w2zbgnvoGz5TfMJHEl+QZRhZUElQ
	tj+eUv2da9kAa01rRywATBXP3to7cdTS+0JZOHozire4tc/7RmbiHiogWDD+eENLZlzV3dmpAE8
	dnQzQFnVv7nUuKA9Zu75dSCtp97d4eQ1aqe1QHA//V6Lp6k+IdLpvSwQ5CD++6wLhdpOfldH/6I
	7IgaxHQ==
X-Google-Smtp-Source: AGHT+IHLM1FIhtqqL05DozCCpKQWY7ameEkMInI+HoHz6qQ+L3KMHdThy3m2Nh51nEncLqfROzqPGg==
X-Received: by 2002:a05:6000:2481:b0:3a4:d4a0:1315 with SMTP id ffacd0b85a97d-3a4d4a01404mr4061984f8f.6.1748428924388;
        Wed, 28 May 2025 03:42:04 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:42:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:06 +0200
Subject: [PATCH 10/17] pinctrl: bcm: cygnus-nsp: Move fixed assignments to
 'pinctrl_desc' definition
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
Message-Id: <20250528-pinctrl-const-desc-v1-10-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2020;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=AZcW1cQpsVdpMlMJDu5jWEgQJ6HALLwy007zMLKEIYo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhRNPIvcbeE3O4oOSmCsEkL1h48gBgln+KJb
 OsiC6vomEaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboUQAKCRDBN2bmhouD
 16dvD/4+GqEjL6kp16pjaPce/8s4v6Ut3thCgUQUhMlVSN3KQ5BciDx6aymKzKDe6Y385QtYh6/
 TTbLcF7wMxIsiys8zs4Joov8pnnsJFMs89/RxAHCkv0jVyWz1R82g5U3UxeAzVHOSClfzkG1ssx
 rukU7ZnCn8leZIhYYtv1kPDJSN5TvvmrLMqPDoeXKp/lmIMXMAfV7gA+hzg2SonnOP8zFIU/Cgk
 Bsnu0o5djTismPPoU+dVEC8OOtOQs51mMYYsJ3bpo6w+8AXjqnqHArInHHG+DyKfsdfpU2p8NqJ
 CLciuXZuNgs3KdwBmhn+8j50u4rJxhfzbl96q5Ni+ucZpmPmB8YxYQLGCUBO4LZ8SJQopvZsb/M
 1D8cTgPoL8lL1WXelX1KC3g47FDzSwwJt3+NZAP2BKjEwfdLYApjYJv1SJm1HhO2ce5DwkkZVsS
 /ROWyFqUhckAQmPUVie/ZniAhKPP5NTi+3jDxP4DWLXZqnPD/cogYNuFscfAWmwOnNkRuuWvYaP
 ji598GViXmlJqT0LLbAldcUL4DyM0ovnfcXI8abCONH0ZZVFzuPQ3PrnsyUe2LKxqoq9kV1uqCt
 wrnlxC3wix5d5II5R2Z1TpjlzSjyFuBlPhYTuEv/7Pl/umwQK+v7ZNFofeJ7Q4gFZDAw7FZIXgE
 CEW4yw0hnhFONeA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Assign 'struct pinctrl_desc' .npins member in definition to make clear
that number of pins is fixed and have less code in the probe.

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


