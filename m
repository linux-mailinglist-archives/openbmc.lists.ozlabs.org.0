Return-Path: <openbmc+bounces-80-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C2CAC74F8
	for <lists+openbmc@lfdr.de>; Thu, 29 May 2025 02:18:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b76Nj0Wnrz2yhv;
	Thu, 29 May 2025 10:16:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::336"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748428924;
	cv=none; b=I9XOhmqXdgs8ay0KuLKTiA17WYsLJuZQZ7/kbMyA5LzvYoNrIXiyJusOOLnUHkvQU+vwOtSORhEXu+L2WLabKhwcoK3jbh0Hequ8sIaso8EoPhTgqTTWCzUc1fpskBsOp783HkDonqX22xNObHZKCmiSQmPFDt5QNraSJnsDYcngxohq6Jcce+cIql/WaO0X71A3ALO0QvQJJbwT10kWEX1dyRe1y9WyuncUwrIWhScNDIwfeGEwU5HNXdEdzXMNj5QPQgykQ4xt6LBxNj0mvaZcAoPybpfbFiPrBTn+kPAVoGDvYBCN5UEJcikZ99oMIUuijevfOdenKFp9ouI+3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748428924; c=relaxed/relaxed;
	bh=eeKeqm7bgqIFmnFmWd/B2Kjnby6+4VCIwEM6NzXgjEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XHEDEsYKBF7qr2tg3R4BGww+pmutDHSj8Xs0Aw11y0SgWOOElkEoHmJ7FFSckc1BWsFraaky0Ke97unB5sjiZCPmCmyLZ1yP0L5INaT9Zy9GPTe4aN62x3RnLqlt0x5av9drVafr04IdW8BDl8RbLDUpXnS6MZs/bFZm4rdntPLoQQG3bYGr80SC6tQ8XwaDnyCxpK0e+uSxIz3KTNLTk9oAKxUXm4wD/iQwH+EO88GFttwH4NuXcACMUD/zc4GKm1SPBrWF6PeSFPy+ajwohGxICq/kWHXccjnhFxqf4ByZUBvaX+7l3tvrS/YAmjStUby9RYOzDit6LkyCNK0tog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KlKI+3zG; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KlKI+3zG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6mK75ZsTz2ydw
	for <openbmc@lists.ozlabs.org>; Wed, 28 May 2025 20:42:03 +1000 (AEST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-444582310e3so4550095e9.1
        for <openbmc@lists.ozlabs.org>; Wed, 28 May 2025 03:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428921; x=1749033721; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eeKeqm7bgqIFmnFmWd/B2Kjnby6+4VCIwEM6NzXgjEw=;
        b=KlKI+3zGlSwcklvRh0vYHvobgFsGfh1r98Rjx5o1eoCS66Znsh6g5r5IEdPYGCh9n3
         BL24/Qe0qJe0kbVgnSIL8cnxDMmF+oVfUX85nADfalfrqiZCM9uUpYyoLEiXy2X9Iv1x
         YlzUZ8CZKZ4ILi0/mDieT1LUVtfDFZ+bjwdwbiUdGBq0nHDeZ5xrUVvWKejlBEQmDogI
         elQb8bqWPyovGhDKchi4PzSD9EznkP1UAuHcKHXgTAoIlk2zihBSlRkS+XGh/lcoDJ9O
         dcGxTRZDz8BiqYeeV1lDj/HNajB3tL85iPx5CaR83+VBifDkpWEiRn5jVcELLmM7IfAg
         X6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428921; x=1749033721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eeKeqm7bgqIFmnFmWd/B2Kjnby6+4VCIwEM6NzXgjEw=;
        b=P0CSNAto7Cq27WNwI89NXG9CFYBDFLxQRmfsjiH5CRrqKW4JiN646W0aO/hhddeRuW
         wgCQp3+RS1dCj3h4yi41ImJVcDjNMrxCdiWAyf5XUYxd82YAIDCTqfLsRm1nyKmWDH3q
         xWYN5pjN6EmT6xBb9xhGnHtUGss9Oq/vV4cKntK4B57vy/WhKuPdC5ubJLmRix/MFb0e
         kphuyuguRcD6pNiMhjG92SC6pj0geyYLiCfJz3s4QsX1iNQA/zgFTDd5osb8YBZ7AyBw
         OLfA4kYbNNgRngUH+EuDyPXp6vIc/dOUJWqbVZYKUTTbEmnVD53cA+6p8h0flsMgyVP1
         osGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk9wdKqtbqyrTtwDbYnl+Exg6sjXtx2GUIqr9rlJjFrh1WpxFZDKrZ2sZDLCdOVX9VGztEzMP0@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwOFq7iGtSYDyM1cYS7uU1zdDhigQgoYd8Dy87ingUMcifq1klR
	sg1+M0jl1ppNQGe1rJv/mZxXZOANbL/Xi9kncPmn/jFqMY9KuIbw9CI0LFKv2fnunus=
X-Gm-Gg: ASbGncuo0Y2kUBIaKhsLlVIUyYdr/BDRSurAfvYGrCul5v9OSBKl8JTJPn2m0mQA77Y
	8Z5TwLJqzao15IA3DRj6u2HRO71uH3b1auSIvrs9HaSRcoktsQsa2Xt/sda7n58nII8+o1mLLNq
	mDAu1VAs/2htidnjAsYzAnGwymolM5ydgj54ge3/y2ecI9ed9e5oQpFtw4UuuRfPMcyICT0c0IH
	crcmoyZ4MAUBmY3JDgEndP8N+5ktqjT/2GafT4XWZCuosmo4l2zIuPCrxS0CsepqowzRLSRMeyi
	IclsaqwO4bBreF166/SbGuzFU1IeaicRXOSuOZ/7AmwDwc4aY1JJuxbVaviCMloz8LO0hq8=
X-Google-Smtp-Source: AGHT+IH2RvO3u2jIkhe2BH1+/yJAOhQA0UR42TzWyNNAEDpg/cdMhyD7e03ICGq58jet5YwmI1xsWg==
X-Received: by 2002:a05:600c:1d0d:b0:43b:cab3:1fd1 with SMTP id 5b1f17b1804b1-44c934e5f3cmr48727465e9.1.1748428920692;
        Wed, 28 May 2025 03:42:00 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:42:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:05 +0200
Subject: [PATCH 09/17] pinctrl: bcm: cygnus-ns2: Move fixed assignments to
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
Message-Id: <20250528-pinctrl-const-desc-v1-9-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2013;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=tMPOIoxmSYTBilMSijclMXxtNrW8WzkiypV3oMPeYrw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhQiRFuBZNM/PyHQB2QGJi215mgTKjmtl1J4
 6O38EUsvPyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboUAAKCRDBN2bmhouD
 192rD/98fy4M3wAq2lLrZI16iHbCWibHnzws9NPmcH5NdY6VM7xhLEq++95JNIwB0UKiqe2sWUi
 nR0jKaZVhxwjwEoHgfW3yXkchrYLT4HtbxPM2wXzHTIMNG7qDtvCJDN6RHCbsGZBoarDEQuCk2H
 ZSpG5J0mCHYGWzNcuUMYQPg8wInmjwrNaISZ2c3lFPKzal+YJqOE+78XA0oIU0qNoJX6sWXyufV
 u01win3xK0AMvzXktWiaB//8qOR8se9X8Q/kU83OohrexwKTewmqQGrKCqWvub2qfbqVJs9Lcf1
 g9HWX7C88+/pIBcjjWdDmWRa1DCLypL6Nb8lKQXaFrgAs9z63JSXsuobSuuFvtErz4Q4CQSePjF
 39ee9zzBsbsjRGSNjGTWVJ1RUoBRJI5WZbDvm8wmDGn6N09uesj2pWwa5OnDuM4Q7JzMKY3byGT
 d9cfJoT3IffCKay5oTbaTEipX1AxJL5Ka5JKkQdtV9Fd5SGfyFzzGW0zgMhoOLK8L9eaGOZmObm
 HlL037nJMCk37k2UYML60oXBFFsO5loJChx/GjpfwBoPXLjRPk8PdQnTbwF4gLyNP1zxMSZ/6Yy
 D7h9V/1hVNWGd0B1G9TGQH5qJt5+Nq9SQUlmoG/jyVioHYfTnjhR4QTiy2kMaZpNlU2URVKqZf5
 A3gbDHJkIDwlHMw==
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
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
index 04f4fca854cc05c6ccc75fbcb640b18fcfd37453..23ab3ab064b6f2b0aaa15afd6b9c582f1a1256b2 100644
--- a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
@@ -971,6 +971,7 @@ static struct pinctrl_desc ns2_pinctrl_desc = {
 	.pctlops = &ns2_pinctrl_ops,
 	.pmxops = &ns2_pinmux_ops,
 	.confops = &ns2_pinconf_ops,
+	.npins = ARRAY_SIZE(ns2_pins),
 };
 
 static int ns2_mux_log_init(struct ns2_pinctrl *pinctrl)
@@ -1026,7 +1027,6 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
 	struct resource *res;
 	int i, ret;
 	struct pinctrl_pin_desc *pins;
-	unsigned int num_pins = ARRAY_SIZE(ns2_pins);
 
 	pinctrl = devm_kzalloc(&pdev->dev, sizeof(*pinctrl), GFP_KERNEL);
 	if (!pinctrl)
@@ -1060,11 +1060,12 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	pins = devm_kcalloc(&pdev->dev, num_pins, sizeof(*pins), GFP_KERNEL);
+	pins = devm_kcalloc(&pdev->dev, ARRAY_SIZE(ns2_pins), sizeof(*pins),
+			    GFP_KERNEL);
 	if (!pins)
 		return -ENOMEM;
 
-	for (i = 0; i < num_pins; i++) {
+	for (i = 0; i < ARRAY_SIZE(ns2_pins); i++) {
 		pins[i].number = ns2_pins[i].pin;
 		pins[i].name = ns2_pins[i].name;
 		pins[i].drv_data = &ns2_pins[i];
@@ -1075,7 +1076,6 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
 	pinctrl->functions = ns2_pin_functions;
 	pinctrl->num_functions = ARRAY_SIZE(ns2_pin_functions);
 	ns2_pinctrl_desc.pins = pins;
-	ns2_pinctrl_desc.npins = num_pins;
 
 	pinctrl->pctl = pinctrl_register(&ns2_pinctrl_desc, &pdev->dev,
 			pinctrl);

-- 
2.45.2


