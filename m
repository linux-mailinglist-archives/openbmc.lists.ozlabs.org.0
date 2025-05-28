Return-Path: <openbmc+bounces-81-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE7AAC74F9
	for <lists+openbmc@lfdr.de>; Thu, 29 May 2025 02:18:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b76Nj18b9z2ySl;
	Thu, 29 May 2025 10:16:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::336"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748428931;
	cv=none; b=kGydIw4bYY+zeaFLwGDvKr7OCjTOXBK1NgTNrXndcubbE9xypaVSo2UYEZCZ24kTNznrcRV2wpjIwLX/LqAi/YAc1eYiJTiF45/IhpYRtTneoYF6HgaRqXUmzYK9mj84td6BvfMqVYsy2ahYw5CfmBr4xxC2P/LhjQQUnuWqc6aKBaptia7jarDClrnFW3pxe/EwWLGv6+9JCi599pRroP1A6IDnKTtFs5oQButqEo7Rfbw/XZ1/zgEYAhT1pTfIESh9Y4CNY7wia5EAdd2p0nDHDaNYVTB6MigWvsmqSZxe0HBHBvWF1ZDDqvhv+DVk71Mwc91+aSgh4bCukuh0qw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748428931; c=relaxed/relaxed;
	bh=1HiVP0QLPKsIA8n0UdjT0lSqiGDAH6vDC2S5+J4fhwA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bw+bOkvg81ou47JHQvXPXJnr5lbLOQMfLGZ6mZzN28153jF1FqbfHfqPAlSD2J2rce7sFcsuTA3wmaWVzTHPXToNwpy61vLts+jHEJe8dwNAkM2UZeIpj/cdFMEatBUsV+B8VeV9tcEPDGTdndWEcVrAaR8+aXQWW3JfiB9lmwkImaBLICuvVnvIg+Z2opWLAjsM5r8u3GJCM2QRV6BGmBqOQMFi5kxNW91CME6wu2IthIrROTSn1Cx1aIm3GJuFlUvktcPJzcw0rjgG+WtdOTQi1CEtp7EedhiTxpifKLImAhGVxsL91i4ryKKGqvSpmWaNokkFaTNx+v393rwFnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=F5wLzhuD; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=F5wLzhuD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6mKG2gNrz2ybQ
	for <openbmc@lists.ozlabs.org>; Wed, 28 May 2025 20:42:10 +1000 (AEST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-442f4d40152so5987535e9.2
        for <openbmc@lists.ozlabs.org>; Wed, 28 May 2025 03:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428928; x=1749033728; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1HiVP0QLPKsIA8n0UdjT0lSqiGDAH6vDC2S5+J4fhwA=;
        b=F5wLzhuDoaFg+EF3BELgt4uHERFImugLdL51/Zk99t62Y6ru3y3FFut9dVtJaGLlPd
         MWXQNCz/Gzra8uoWBKS5VFhB16UG7LXHsEF9F9jVvvLhUvB/Byx0B+EPIIepfkZS4P82
         XfukCoHREQcAqvxSMe0JNl/Mgo528SbmT6iVnhvON91P2kITjLSxH4vBl2UBEjJ/gpyu
         AteOZNbacYQtZOic4pbIG1cnUfP6qiftWP6FzIC0DgPBFiXHENlGuDwMvSw6D8HRX6kJ
         ugGDQsVhcRpeQSpDoycRpTKhdqK+hX3r5GGNTwPiHL3+152bQTGwOIgQt297fMBLJ7tE
         /MAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428928; x=1749033728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1HiVP0QLPKsIA8n0UdjT0lSqiGDAH6vDC2S5+J4fhwA=;
        b=SzzekwALiVU3kviIcBCq+t4ny2P1PO2eFtq+ALowQzKAZM4KxQEwJEpNRO3iv5KX6e
         X/FmytfMPS5LUUCVaIM0VUtEsXLZdu2XzVzI+AWuT+QJGa/+cOzWDQRmnT68ctnkAyhC
         aIk9mSPHCINZCNm0/wxhzPqm/SrFKPImutK9MRwlSWihcCTxZ+LLE5zHMyTgaCB8WaxX
         UfNjUzgYrOCsaPWhfl0TAO1Nqrw/xQCxOuepQavhH5Z2c0HLTqvEWZy/46Vk1hed7ngj
         4StNSADS9AYCQ9bfLPM/kgkBSzbD7/ySVK8Hd/PB9JSrwIH3WL/9JFGM4rRMDSZVwiRo
         QQ/g==
X-Forwarded-Encrypted: i=1; AJvYcCXZ+DRkDRWL8VcRrM+Zj1vPTKzDjNhDndx596RNs7IeJ01mJXCUUsjMSC04DrtuIRgdc48ICjAn@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx8S3wZKUjRYsQAndrYEmfmwaWC4qZNkUaxoFJYjQBCKCdyi+4y
	erMztag4tyEr4Ml5CfoxN6Gkx/EsyHhGYNqAiEgCUappRwh4xloqEPo3Nj331ExISdvDhAQZT/8
	TW2cL
X-Gm-Gg: ASbGncuJOrUsv2d2KV4w+kYiBskxVXn/RfpPctiPyCLpHu0tjXDxrtFR/HZpNUft0zA
	o8+CMdNQJtm5CP7KAv9nVzVrLkplgK2wm3XRNOWw+9ZTkJneZQRCbhwug7AYUBkB2nhwjB775Qx
	7GuhrKEnA1cTMBebvAqSa6i3YGxdDpPDgYVGVcUK2SxsxhiVZfJ66hwzkX4sq9W2vm2lNfsbfeS
	aDuR3O41YYL4vgXleiDaJU17Y1TxW5oF+3YTYruyi0l9x1HlQ954QtGu6NjTx2pK1dI/2xosrZe
	sDs9SCw7FGDxRnshpNDQJ8ni7swxouXPFf9bfFgsG8QJoVkJsisj44qcFjbf8zz/P64ZBDxOkiv
	PFxjW3Q==
X-Google-Smtp-Source: AGHT+IFXJEnneO4xSk8QHxW3M4MG6X2rUF/ijYk6/3E6ibOcv7/LTi5pTGoQU3pGtcmJJ43pDOy8uA==
X-Received: by 2002:a05:600c:474d:b0:439:9c0e:36e6 with SMTP id 5b1f17b1804b1-44c91fbb19cmr53499225e9.3.1748428927574;
        Wed, 28 May 2025 03:42:07 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:42:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:07 +0200
Subject: [PATCH 11/17] pinctrl: as3722: Move fixed assignments to
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
Message-Id: <20250528-pinctrl-const-desc-v1-11-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1376;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qi1eWzTJCENFCt5JAU6Fe0rVNJeWQChdweXO2MJK0eI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhSmo0CjMtoXcC2sHTGZq48JxTVj2z45DQTw
 MfdipuBb+mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboUgAKCRDBN2bmhouD
 11uhD/4gp5pseL4b42D5IrbEvXxuCr6fAiAGchUSH1EtuHVur/ZUNsA/puQb+u0ePsLEwBisB8N
 HkCZQy1wRLe47FK3rertUOcjzUira7hX1qKm0jhTZant8VKm9nCaQfuvyHxdpPhOoVCVJooM9Ad
 c50bsIAmLW6CrtUn7kwQQ3rbem/I/4JrlLZQ3V+T2HBOBa+wh/sf2x2tGfE/ilSmEXtZ9VCsdbQ
 VeEf7DbVnNsvDCjNCQtCxzEBdKpKKSvCkiKIJcFpEb2Szo35NLhJzj0aBmlXWzocpri70Ho42iN
 GPRpc/emYDOm+hq9iusYbHVvfypT9421VVBIJZ8npbZmUnTu39bKewgOaguan2CHrPsWa8yw3nt
 yw5e2VWBb/HSAChzlE86yqdW9+rkoB5jFUYD23+dUZ3eWK3NDUviqsT+/YmruwWE9exSwIoDVno
 3GCqUCo5TCQOgp0hLWvEbWq7L24O47InJOwlG/6ZNrPwi+mCdVERcA18YX8T5vAEdBBiOdTFHSC
 Ekwch4dUQYD6n5qRL1rRfPoiWhQKE9VTbMoVCm46WQx7XkVKJy35962yFBpybsElB8wY4ca2J9M
 vOA8pVv0owKcK1pBhmg42QqkBmJWh3CkNUY8E0To1kMPcNE6E/hWvW13iZ5xppI3+CQBocPYecS
 qfWXlWeL9QmpElQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Assign 'struct pinctrl_desc' .pins and .npins members in definition to
make clear that number of pins is fixed and have less code in the probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/pinctrl-as3722.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-as3722.c b/drivers/pinctrl/pinctrl-as3722.c
index 0d8c75ce20eda97627aef773342a0b63ff6114a1..ed7b2c482ff0bb6a546955c083ef7046701527b0 100644
--- a/drivers/pinctrl/pinctrl-as3722.c
+++ b/drivers/pinctrl/pinctrl-as3722.c
@@ -422,6 +422,8 @@ static struct pinctrl_desc as3722_pinctrl_desc = {
 	.pmxops = &as3722_pinmux_ops,
 	.confops = &as3722_pinconf_ops,
 	.owner = THIS_MODULE,
+	.pins = as3722_pins_desc,
+	.npins = ARRAY_SIZE(as3722_pins_desc),
 };
 
 static int as3722_gpio_get(struct gpio_chip *chip, unsigned offset)
@@ -550,8 +552,6 @@ static int as3722_pinctrl_probe(struct platform_device *pdev)
 	as_pci->pin_groups = as3722_pingroups;
 	as_pci->num_pin_groups = ARRAY_SIZE(as3722_pingroups);
 	as3722_pinctrl_desc.name = dev_name(&pdev->dev);
-	as3722_pinctrl_desc.pins = as3722_pins_desc;
-	as3722_pinctrl_desc.npins = ARRAY_SIZE(as3722_pins_desc);
 	as_pci->pctl = devm_pinctrl_register(&pdev->dev, &as3722_pinctrl_desc,
 					     as_pci);
 	if (IS_ERR(as_pci->pctl)) {

-- 
2.45.2


