Return-Path: <openbmc+bounces-89-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3000EAC7504
	for <lists+openbmc@lfdr.de>; Thu, 29 May 2025 02:19:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b76Np6FhFz2yrm;
	Thu, 29 May 2025 10:16:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748428937;
	cv=none; b=Gaquc7vK2KEjSDxCffDNfTXDrBe+4i8yF1W5ed5Gzzif58Cvq1JibQzJTSpnCsW9A/ls4Ro1gzMbB5QB3k0QBXrDa4nhulTDL0m1JgEWfJRfvZe4fCeBB0RLanTtKMsvTMusYsw1syqs975YHJzvkdtBvGzF1qxd/CqfSnM7WthH5cu/hJAPPJWSN+SGzoJSUyRmbCsF+qCZchGEu17xO//1UiUa8ovcRlxKcM+YjyWwwxktosrYcudGiWgRICN2B4eyKJbwkEDqXvldW3o2g+dAQA7WN46eOSu/GtVH1gOSChwE2F+VCZS9WcBYadVNaTeHhvCsX8gLtESNXcJmnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748428937; c=relaxed/relaxed;
	bh=sCzXGrMy4mrth9Y9XnnMqTwemBq/IlPbQZ3QBo3OiYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FNQug/jJXqMLUbCb6AHr0fyNJ5Yoo0Yoxw/dY1ue6HG3+oP/byaWVIQV1Z9EeNGUEfXXQpOEsPCVEj/ifs70rNJKOWr/UTMhZBsg26fjyA+4TMpSA37YscupPH8xmCMw8uaUsNeMpThPPjQrymXiNFyhgvqY8UryEJVjLO7+zHX4g8wZ3gv+2uNpp5L2hy//L7aYXEHwzzeXPyyKGi/F+RDdY3CE8XebDP5Wws7tP+VcshcH2lNCdiLDTrTiss75wD+KKaCp5LoLf8txTmCaw4Yp1sl9/XO75KwelBEEOdRiygAC1Er8CphF2abL3pkdbZKeIE6nIWNFybjGQJ76bQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Pgr8rXW2; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Pgr8rXW2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6mKN3Ddfz2ydN
	for <openbmc@lists.ozlabs.org>; Wed, 28 May 2025 20:42:16 +1000 (AEST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-442f4d40152so5987845e9.2
        for <openbmc@lists.ozlabs.org>; Wed, 28 May 2025 03:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428934; x=1749033734; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sCzXGrMy4mrth9Y9XnnMqTwemBq/IlPbQZ3QBo3OiYA=;
        b=Pgr8rXW2/NdHSV1j9eOT0VUOyDVaP4EGJPdHPGpzd2uoWswKx+0zJyjapvfi/E3Va3
         VydpibMwvP8dDnbZfohzmBnjaGNPNxtxHAsaLPiVD8aFegnLeI6oTDh+LlxhF8d9ffVg
         D1JcggwhfemlpWG6d752yvJHcNTOlSe4mXfmFOvUNiwFiOMcz7U5ZTBIQHqdEfSWo+f7
         /2OkB2RwW6J5ASOjoZNjL+X4/cHtDZc8ANnfbjf3XYR1WU3kROXCakc0IXrEyJ9qlw3p
         kKQ/u9dYgznL6sq6jBosuFk9qFJY4fcscFTMDtJ3T+yr3vl/PBB9xLvln2zIyFO09x5F
         8Tkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428934; x=1749033734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sCzXGrMy4mrth9Y9XnnMqTwemBq/IlPbQZ3QBo3OiYA=;
        b=douh5xGdjYBoXJ6Zbbvz2f9Xr4vj73OGaiFJBDgKMrKsglOG6ZCYAK/9ZqsM5IUHZ0
         6Q3j6S8wbhp6fsxs2lvtZ3A7wNII3yi9vFBs6bFRSj9S1IqL1f0xM08P/BibvqTpYAV7
         6XUGJ1o3t2bdpHxin5TDdzB0DBycjeIeqy+N0nZA/y2sNylp3c4NNKnF3eLDRUHYq1b4
         R3nC1Che2fdd1OTEbZIHV6qXl4QXOl7im8QWXVqbH9VmfD/VzHuXU1cwfFBh8TzBusfV
         OfrxLbcGAGnC4JU1LLaw/AIyEYSbP8BIEnbRCgpHvxcVY8zyH+cTVjgFtLuaCUE/tp24
         oM/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUTqSJ5At8+Jh1/zVFywc3JNWaRWBLQKifqKyp0+ulfXmlYfwUSVkHrDMYjxjNW3/GP7Pj+XLo@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzymDSMIZf2zFXp2LegI6AHKkce55J4xSQ/+XDBJjsH43W984gS
	hDH4TPaCqNUkZEDCJAk+JViSbd3cPagZd8eanaEdBTtty+RAbafZ0zWjC0iHcb7/8Y0=
X-Gm-Gg: ASbGncvCrpuOO6+5RsG8916kA+0zXTrg4wKRgMQC0IKoMr+LyHpOAxpp/I4LivL1FKu
	ilx7L3oqSBi6TvwlPs66QP0JP4mKBDaHIaGBeZoG1a5ebJg69NPXPWjj2+SoowMSNJfiTwKMRrR
	8gg8YCkqXrAV1uqZAzNfPdt28AuIBeOkCL3cqInkAkZRIGjEo1mdHE1j1HHOmQr2fgFYixrVKYT
	aVFHFIv3ZUHK3GYPtZRaiQFyShRkuJfj2cFstqAZiZitVP16JarX0rQ+Mq7G+RgG/pbFaPtlKSg
	2KB/jcUeC15YodRB3iOouswBhTYsPMT9/LzYKbIYBHtnATobPpdwKNm9SfcnKiJ8HgLxqQg=
X-Google-Smtp-Source: AGHT+IEezznZ4tc//+iyg9VgEejs2PqgHy+UHoiBZ9D2eixnIzEPRTC2rWF2EYyDVV6zOvpBJosC8Q==
X-Received: by 2002:a05:600c:1385:b0:43e:94fa:4aef with SMTP id 5b1f17b1804b1-44c93cae9acmr51123845e9.8.1748428933700;
        Wed, 28 May 2025 03:42:13 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:42:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:09 +0200
Subject: [PATCH 13/17] pinctrl: palmas: Move fixed assignments to
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
Message-Id: <20250528-pinctrl-const-desc-v1-13-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1235;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=dTmy1ylBupLBEHMWc/Z23V5px0USEJlmCJKSN1EAvfE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhUPwoRAjJQz5PFO5DfSHTMd24hsqTzRr2IB
 0jOv1r3k8mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboVAAKCRDBN2bmhouD
 1ynAD/49mYORosdid1df8HmR8x/OWiv0Zm6goccLiqpVflRmzsFrLN+cLFMbhxRMl34fM3yuPci
 b71Zx42gtn/VEKIdJ4nLISvF28thcNbAG/plhINy2OOwfUm060Kcfaafl/ZP4AiXH0q3u3BS5cs
 fRHQErxwUgQBlHIgCJL61LeQp1Whs8/m3ImG8NPjZwnPdezu9Oczth6hm/aG0Og6NB4QdZkVhtO
 5xyGBrnkXFjRo2HmrUPl2PTYkNrTEjBPv4EZH2uCaBsHPSd+ND4J/ajWESZ3Vh0wXEyzTcd3/jl
 dCsZE4KBxpy/+gWzMFnXBN0HYTkqwqwVnkosUS0jsWofWTu/7iijgYxr0xF9ikcr3aYdlxgxGE8
 kkh76EFKdrmG1NbdijJPiOC50b+vAChB+zRdWvfXUBnmWsm0/uJC0Z+ttf7Nxbq4uFdgZVfD95d
 z6ZimmSBL0cf2VB2RBfUdZPPyT2hWvFdDUyrrSsugiugcfo/m1MciUEAKpSK2bk6d7S6K/ZP+Ie
 ydztgCpY5oH2z4aXxETIgUcH2X5Zx4g5H+iwFhMME8VjfrLHe+T6xEeRsGvuWg4C7Ij2NMquouc
 skaEKK7orgbEC9jAJSV1kP4K0sFWd0Zdc431k7p0EaxblWY7N6iELiPx21AVf6/XJYBh9eoI0r1
 RBtd9sQPwZc6f+g==
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


