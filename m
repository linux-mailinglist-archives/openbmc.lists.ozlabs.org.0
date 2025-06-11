Return-Path: <openbmc+bounces-163-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8A5AD6419
	for <lists+openbmc@lfdr.de>; Thu, 12 Jun 2025 02:01:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHjNr26JDz2yfx;
	Thu, 12 Jun 2025 10:01:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749622500;
	cv=none; b=d/f8rgiXFNvibBX2eCp5Zh5B/dmAXFIFDYupbPdA3z6kQjxGN4D5TgfXp+TLtxFjAvJ3REcROS+pWqaxy/Od37XDw85NkWEjWmp2DV04dLNZfQFqph0sF6rkIOv9fRBNS/Na6y4OQz0nfnHu2zlFncTr007czk02J3Co7Gt61nFu6vFHFSh8Xn4oqIE3i58VDczpUBsyW6jUJufr2It7GcDLnHV3BYud5xwCyCXZBKCqhXeFcReWCOGXF1yERzB9PvTfwky0TuXFfyw5k6O/OORagE2KLk2pmH1teIq3Qcrgova+z5Z4f9BDw/pvXMHarQEzJiUC3jnr1ke3qlJ8ow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749622500; c=relaxed/relaxed;
	bh=sCzXGrMy4mrth9Y9XnnMqTwemBq/IlPbQZ3QBo3OiYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N8eEKwe9K+4jzfsD7q3epchQP8c4O+i6AhCbgW9OY5Oso4woxKpCGWkMjmKkmToyGw2VVAJPomO89LapVKjuiusbjUst1dC1ITitahfyh8xRcKJFMeTxmm3UYFh4Xo1ul4vBOCA5abi5zlH/7GvPw8AEL9TeV0uK1rXQQt6sGuDnhrdX0CaEHq0Gg4dncXmAVnlWA6FDRAFIV8kAXBPlkHVG8UqJv/dR4Br3+s7/F8l5idW8fbHo8Jd0DXbCKknFSo/94Q5tePL8HOmzLhcv2ZaZ7iMijlH+p3iPP09u+TzT+a8Xid8VukGL3w0jYoAnb+FVVn4w14bLa7TN+PjOfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=y0dS2ruZ; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=y0dS2ruZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHFkW5Mvyz307q
	for <openbmc@lists.ozlabs.org>; Wed, 11 Jun 2025 16:14:59 +1000 (AEST)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a4e749d7b2so32914f8f.0
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 23:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622497; x=1750227297; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sCzXGrMy4mrth9Y9XnnMqTwemBq/IlPbQZ3QBo3OiYA=;
        b=y0dS2ruZa9cZxQakhIVtaJljKycDWPKXpi2KmT95a35PJd0KIPs+I0nAAEMmrBcMcQ
         e7zOJHlKC87x96j1DTbFk9nl2Ziis192/gBpsB7VoVhsiQlXZFx3hQ2paS01/+aocd/I
         InqG8t/iAraHXXHQpUDdTQjrkZYezlfR81dSDXmSK3bllTlxGFNpOjOuaFXyhjMatwjx
         ydaH/BgoZUBxvWpv5FnUUg8a7O/lofvUr4CXFix9Of3lpwt0Tks5gaqaNXIwDAa2QeGL
         0+yNZzOJ/dgnzTpHMbtaM+66K+f/1FlLELlXmOxziAoTl5rvPCmW+0jZG7vMVTY4mHT9
         4AiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622497; x=1750227297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sCzXGrMy4mrth9Y9XnnMqTwemBq/IlPbQZ3QBo3OiYA=;
        b=DwJFDqPQTGhZbckTc3aN1ShRgsLGt59Axjufhq7RxuLM2PDLV2CzEvR6mEwPyMePTP
         yXotfLeJu/vzPvK9dXLZl36qW2cg/Mi+fbdC9W7tohg/CJB1ZiqrNzmrzPtGvZdjAu8v
         dKTM7y6GifZXpCLe+i88tZ0i98s9/PwRXjSxgvGBD876M7D8VX9wjxPh9Z0IHRDWW9z3
         E2Sa40SiJALBHGlfHpD66nTQJ0IgmMPj/pPdI3Kafe6IBgFGDUqZ+a0vus0SCGkVw6mH
         RabQaIWh1VM8vsWHPIGYlHOqlWMJBX5NFKBfNkUDbLJO7ZSNQyeRMoY4XdjDv/q36oS8
         gngQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGq8IDArLtIUoTiiXU1ZtZ4aniG2NdOqbyU9u21IZyhmvbwNjy0hlSZyfnItUZer4rlOuqrcrG@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzAONIhIDelyODFYpE4SVDlUulPG21vCbLm8JsaO1nzXx007fnL
	YOK/dEqKFN7ZfUxr/eJ2+DqStMXOACsRoa1pEGZeR2SkFx1AfTf/LoPjz1RBWXHgr8g=
X-Gm-Gg: ASbGncue7X6l5bOEbK+aNve8zvx31mWY3oBNbQkIKwAl6/tuPmLt56r4a9KyUh1BwRP
	rknyhWRn08wYac6ELut3aw3leT+EeMbBG98j9iKZWFJSWaJsxjPTYNybRmJLvfScLFj0IDGj1Jq
	PDvYoW8g/NpEsGOa/u7IbpRh30ro9Mi5+QW7A0cNDn+0Z7Ra88+yTVXLBpvczSvWU74zLRNdqIX
	SUvLtBrpOxGsk6yCq3mnMDxrRta6gn5EB8lCz3hmDMPDrAwsWoZDfOZdqxuZfpISRgffFLbvrRr
	PJBp0alAw3LeKoUPanEGUaCZ3xoswvCTsA7FcS4U6sSl1fRzep/I4mfrx/1u1J9YpdBTifnpBA2
	oGdmrwA0=
X-Google-Smtp-Source: AGHT+IH0XZ1xTYWRRaO/KxoZgyHwo88VqXTdr3SM+3aZCDHpuiwknECFcoWGBMSsZB+S7AbudZJGmw==
X-Received: by 2002:a05:6000:40c9:b0:3a5:22bb:8b41 with SMTP id ffacd0b85a97d-3a5586c6283mr513239f8f.6.1749622496932;
        Tue, 10 Jun 2025 23:14:56 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:45 +0200
Subject: [PATCH v2 13/17] pinctrl: palmas: Move fixed assignments to
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
Message-Id: <20250611-pinctrl-const-desc-v2-13-b11c1d650384@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1235;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=dTmy1ylBupLBEHMWc/Z23V5px0USEJlmCJKSN1EAvfE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6q4AzpL6d1wSLiktMd45hf80LKncfJThmGJ
 j9tWAIcbRqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkeqgAKCRDBN2bmhouD
 1zW2D/9sgizTHa8UYpq5W08yfaWQQY5LIJPddSSvcnOBIPHSGldHl5KnuPm5CR7btgpemW+s5wk
 +B7d3ypQAREOql3KHh3KhN4AIXdCBqYRhiXPktlMuJullbPSpdfQwUDGPWbKkl5ZGYFsutt8LXO
 2oR/wII7OuWQyqXM+zszHSuArLZ91UWpjox09xD2BjvaZqbt4U7WBXnpdBM6EirqirObi7+Unmx
 vRD2aXkAFWnCt5fSmhwFsxQ87SO68h+yAaVnpgUVxzSeE5DSZaynVyvBTcjnMZ4pPo8j7uxX9ee
 Brc7ycoIJiDUuzzcHWIpF6ebtMZtGNyZWC79sMRgTW4btZZyj0A78+J7yoEX8MRDbdfBLYL+fv5
 SmdiydXrA1oaQHQbUJBiSlHx1gEFO4BiG4ZnAaNY5m3JU2P0un6OAzOE9a/dEOMpbHazykDXjD5
 jcyV8+Eh9nGCS8xrgB+uEOfLCMuG2/VXTxXBxhkRQj0uAjevYzMJm3kovLQh4nKH4talFCxMtLb
 aUDFOmzG/NXN1+jKrev2W+nylhYVoF2QCLptpuvwWkWS/XOJJ0xJpd0gJX+TtLSBwdgyXUDey9E
 CmgGts4sk2ZGmkIIwag50Rlholelm/UNtTVFHxIYfZjshyD22hdqRuS4j3hnI7uREsSTOniRjoR
 /5HfKm3NrrNXYxQ==
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
 drivers/pinctrl/pinctrl-palmas.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-palmas.c b/drivers/pinctrl/pinctrl-palmas.c
index 9e272f9deb4f8c49f91d2f09c2c100018a7617f8..d69f114e46426c345d9ffe7567a326eecdd91bb5 100644
--- a/drivers/pinctrl/pinctrl-palmas.c
+++ b/drivers/pinctrl/pinctrl-palmas.c
@@ -956,6 +956,8 @@ static struct pinctrl_desc palmas_pinctrl_desc = {
 	.pmxops = &palmas_pinmux_ops,
 	.confops = &palmas_pinconf_ops,
 	.owner = THIS_MODULE,
+	.pins = palmas_pins_desc,
+	.npins = ARRAY_SIZE(palmas_pins_desc),
 };
 
 struct palmas_pinctrl_data {
@@ -1023,8 +1025,6 @@ static int palmas_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	palmas_pinctrl_desc.name = dev_name(&pdev->dev);
-	palmas_pinctrl_desc.pins = palmas_pins_desc;
-	palmas_pinctrl_desc.npins = ARRAY_SIZE(palmas_pins_desc);
 	pci->pctl = devm_pinctrl_register(&pdev->dev, &palmas_pinctrl_desc,
 					  pci);
 	if (IS_ERR(pci->pctl)) {

-- 
2.45.2


