Return-Path: <openbmc+bounces-175-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF98AD6438
	for <lists+openbmc@lfdr.de>; Thu, 12 Jun 2025 02:03:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHjP32FMZz30RJ;
	Thu, 12 Jun 2025 10:01:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749622493;
	cv=none; b=i3UwNV1pKA4J4fNo3bSeAi6unUOk8bXP8SkhbStSYVChYz1NXn0u6wBTjgL/Y9iJghFyS93exg6iqNMOt2u1GsFU8qhJIctBqkKMEfNVWQtiRLLhaV1674cnu55Gz6EUHUdjFEy1Lv3aHYXRGeVxCh0oHVldxeAMlORSMFt3oQOViNZMN2XPYFbpbbjMppiVnHniNpdgd+xa/1P5ORz/DTe6xQyRPQ4WegHY0s0tIrnX43Jx/TcSWCmKbQpIaEMtDhVkJ+VDo08fU3ZreVpxXxbGEe4Fzh/1Y+Sin3iWqvuwUrJxs+vv4vjFLZ7B68PD8q8Q2uKuSdm1ND6I9Bg/ug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749622493; c=relaxed/relaxed;
	bh=1HiVP0QLPKsIA8n0UdjT0lSqiGDAH6vDC2S5+J4fhwA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=byRSCH1hI2XLPqXOPf0pNr/p+ilpXwegYwZEjM45kLeQgMWWlkq86PSVJcC/ZROaP9HaZz9V1p70LoAOoCSIyyBQCVwbYlZalLxlcC1tk6P9xJzFdiRt6r93b3RYG4lZw2PDG1QbABj9IUpvcBuvHSaKOkDyp/zktF4jtm1UC28ZEK1PTpOUY3NLwN7CosUUA0mQFzH95HdUZ/ljINi65VSPYJeC8Xu8lg0e7DtZ7/R6rwfzsiuc6b/LHTLIUMrb29H9266V0BbgqoZaaCMcjymYX1UKvE4CDUUa0BX4D/nDgIAHvWV1NM4UZmfcPG7GZg2olOrnHK1ywpPsDrt8ow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JT8z0DvU; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JT8z0DvU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHFkN3CSKz30GV
	for <openbmc@lists.ozlabs.org>; Wed, 11 Jun 2025 16:14:52 +1000 (AEST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4519dd6523dso410275e9.1
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 23:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622490; x=1750227290; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1HiVP0QLPKsIA8n0UdjT0lSqiGDAH6vDC2S5+J4fhwA=;
        b=JT8z0DvUJG4TaxtTutm2AB5+RKfS9N+OXDVULqZ8kXBSoB7x2bydgodFofO0f0wb6/
         e/ksC1GCA7EC0PZsZWjc9fQvcStc7BvrK+Mp/8AAEVwPDf26Xm37SglXTRK2Lcf4Aul3
         Pqp+wg8QAh3XKgnLRnbRKSCrHJQ63NawQ1ABmbSOaNhcj4tFoTlplxQLhQiL75T2wwu1
         m4qM0jSLalOJ1g++tWVxgx53BnCsH/XfuyBlGg9MpoydZRC9Vey2pU+WR7PxCYeOCk4X
         WUE8CjCjaNNBtMMxzcppaQxBYu28hBrqD/kTN8NrPhb/5wVSIZNGN3KMk59swshqYFe0
         W0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622490; x=1750227290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1HiVP0QLPKsIA8n0UdjT0lSqiGDAH6vDC2S5+J4fhwA=;
        b=XZhSKz2Iynci7OZbV0xfrryiG2eEQAWj6nur3Z7c6ZVtAMsVXAUp+h4Fzb4JupYsSd
         F/X6329J8JVo5Ph+gKZdYwfnDMlIp06D1f/1CrbppbtjUzFWViAJdHrhZsdGgHSnnppx
         bkmNRq5sD1cwbITPY281eGb9JoJzED/WXyDzmA6edXK4ox92tcp2RThewCODZwAgBgic
         dNZkqbsGPcBW14rZn3Lmll12QCZMDKVZtfX5aiHw6iug4e+JiqMOE8p0+m+S40CJR3uo
         8R/jtVrFvKRwXfy7ExPvauH5iFFMRurRao8LzX/aYkAO3I4OlIkNf7clhZ5oM4X7HAQq
         nirg==
X-Forwarded-Encrypted: i=1; AJvYcCWFp39S4P2RBa8z2G5DTB8wiJeE4BuYqAsIdbLWneMN1nC4TSFBvFg8h5Z+dMFiPWFc9QOse1H2@lists.ozlabs.org
X-Gm-Message-State: AOJu0YznkUJTIWhlKgJ7boJIVirkGnRBopuezWDUXeRlY7PaZzMEMSPS
	VXWDuixrpitb5ZEPtf2br5eVALhBg6htWPhlG81s2VmNIHBIGafGsfxyb44n+Osckcc=
X-Gm-Gg: ASbGnctvdo5z3fdNjAwrPzdTUUJiiMm4KRk7gMAd2CQEr2KEkBCXHjS2w9JafT6MFtO
	BSQ16UBDpUuAnFGqtKguMTp+Hlh9vZUfzGnaWoI7lkH1ehCWqOcXz/JbLlIIkEV1oqFcp7bVOAP
	lvh3yPPUnihJmQv9Wr9WaRRHV9nOTX3MwbNx7HW1tqjLOv6Geg7fs19KLYc6AdObK3hr+JY2qvf
	6CBN6xhICyS2KGkwNhn6E9QY79FWkiOJkhajROswB7KOlmVs/GEkXA2vyx+nn9axO8NL0NEUmcC
	dEF5zN7Sjdr/vr1WlIP+8gc8rdP0l3AyYC3UV8d7AdX13v++14lw2xqCxmaEiHaj65ALjiExN4E
	1DymtFfU=
X-Google-Smtp-Source: AGHT+IGAMOnxxwJh6k3dhRiX61q7MpOsBjEBq59fXcuOB6WHX3+BJjfe7T2i67oqLzVzIqJNLPxm7Q==
X-Received: by 2002:a05:6000:1788:b0:3a3:5c97:70c with SMTP id ffacd0b85a97d-3a558822cffmr480215f8f.14.1749622489659;
        Tue, 10 Jun 2025 23:14:49 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:43 +0200
Subject: [PATCH v2 11/17] pinctrl: as3722: Move fixed assignments to
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
Message-Id: <20250611-pinctrl-const-desc-v2-11-b11c1d650384@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1376;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qi1eWzTJCENFCt5JAU6Fe0rVNJeWQChdweXO2MJK0eI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6oRdItqT9sxon4qbZGkWGmSQh5LLhdyjslx
 Lrhu2XhwFqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkeqAAKCRDBN2bmhouD
 1zqVD/9ltJexCdYC0zqX0/CADjrrprRtZoxnsBy1fZlMCSHM//l6RgsH+zTI3L4z8D6hoXjSN7+
 kCqzJiEtHxlNkIPRSofpxJdMN4X7bnalI2zDd6X/0XwoGaFls+DBLvGym8L/PCBsw2XF6cR3Y/r
 vpnXKGcuteokGneH3wAP8Wpef9N8QOEKtMiJgtAGa7mfmPf62QTORx1Zkeyh+u+BcEHykALKzL/
 Noyc7nXEB+ywMlt91FmmpwdT0bGGf9FjGJmjXa8Hri/2a11cypStJu8pW9p0HkP0MylQcHwxAGf
 jgwyFEj9f563zIfknjjRmB07L+vhdZjrMHYuRBDARPoDCUZ/wAtWSzS013IH8KTY605CHDkDDXg
 W7tSAeJ8dfweOfmy/LVBOJVtADslkpV4zDk6Ou7cBz3IT1L3JWzytd49gj2sQZFwH8ptj+6LG/f
 hsGg4yTdoyR4r/xZyN/skZHugzysRD1LuBvV/hx+QjJaSJHmmMw9cwX8jnWFkrFO+jtWYrWNehF
 DXTusW4HtBT4feez8bRSM2jUI5kSqnYHNa4Er2ZlPLiOyqdLWrMd0AQMTP4SRLBmhsJQCbfTvHt
 GEjwdyXAIiLXyaogHeIulwyIiEw52cJ/3DShLuesPqxk/vnnajXOS+ikRv6n+kyLnyNEybCOgxA
 x214zblWxgJp17A==
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


