Return-Path: <openbmc+bounces-176-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9925FAD6439
	for <lists+openbmc@lfdr.de>; Thu, 12 Jun 2025 02:04:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHjP32fPjz30T3;
	Thu, 12 Jun 2025 10:01:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749622503;
	cv=none; b=kCxMxcyxY/54xvT8Ip9l5QHqjrb9GcUxli0J41k+2qi2AWc8HA0yRWCRFp+sIHBildm/VVgZHYfIqjuR/l6wSIBKKUQMkx4u95DebMAsL7fwWM+rwZ08DvODq0tmh/HeHKrN+fNySjHwEVucpHbvxZCPMkFYzyqSCqQwE9+J5XEnZdtjV83MF1Zfn1W5dnuKbNeCnSB0SZWbG2+sgL4oihwEn6TYY9rQy283PxQuda/xM7w1upio1wW63HxPrb6DAX8FS9QEKbr/NKXK/+SYTdawtHPVZxZ6DHHLSTCP91Q0LwJs2Eo9myA98yPNuFCClqmmdejBoqRSGydBAls2ow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749622503; c=relaxed/relaxed;
	bh=3dpZC43mjqQSL2n4C7kbwZXGNoboHrOdh0nn9Na/CTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RmcK/ExlWt5Jl/UMkkUnMOSQPApC4cb1EPfJLf8O042cwB5ZRzfzVlAvfdZ8kIzXc0aBA6mn3vyvzsq35QWQz8nPZEHIRmPtn6beHJT9/89IDFJYLXVjxzv/UaAE4bGm1A327zLgsvN1W2fZSm9HJCbLCWwA4c4UlitL9SSups9CAM7DvtyuXbZpj7nuJ39DIBXPVX7BKWoFbfR8U93EZEusf4WpZK3LrqtDVt/+T5nGYvrYMK4vZ0VFCOE56aBOPHa9GrKI8IFzXq6+osP6k/yInl0zpN+jBenxMbLjJnDy0LUy2fMIRa8qpsiqBguaSYH3nhU55StF3TF8yLqH9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=T/qRsNrE; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=T/qRsNrE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHFkZ5llfz307q
	for <openbmc@lists.ozlabs.org>; Wed, 11 Jun 2025 16:15:02 +1000 (AEST)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a4e57d018cso28438f8f.1
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 23:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622500; x=1750227300; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3dpZC43mjqQSL2n4C7kbwZXGNoboHrOdh0nn9Na/CTw=;
        b=T/qRsNrELg65IoNwsDOZspbJkcquO52a/uR/QUfr/yhwHBtwXz3qdIoyNYi01b35ha
         nPPq8cy8fo2hTONEdxWC3NIgNWGYU7FoEXmaoGSVpt8E40iiKlW4dREDI8nwXN8v+Nr1
         1BHgL8+hgHedzTa/I+JoY+HIutop4uyWuViLsVR18fqut3B0XfiMwu9fmfOdhvrx46rR
         3jJjRK9q2lYvQNqZdoS5lFPhmBOHY5xJ1FzE0SkCz0QsE78vk6ITHGLMAtJZsu4699Ny
         U3eBNoABf5wyzpwjTs4t3G7JY+sYmRyRJpqaII/7EMsky6+hYzWB0HnM0OjJn4bJwCNm
         eFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622500; x=1750227300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dpZC43mjqQSL2n4C7kbwZXGNoboHrOdh0nn9Na/CTw=;
        b=nmiBOLmslFjh/UAkxB6iA8GLHIhuZ/oZLhsH/77YnV/kYcSFuSHPFYlTLthWcRaI2y
         BAzkLJrTtAIVriPXH8HAHO8Oq5SuX7K9FcE4pYggjFD5P7uddUOgSXwDLbYDehYvUWRe
         RTj7fyHiZLRrprKZMhSZtrDu4IWTsctszuK7z10nKZwtFXZh1P7zSW3jRNLjZQ5tAICC
         IwVYPmOHJl92FWkRCgsKqyY73BzHSgkFfbpM9/qwNjksUcbxqJf/JuOYKiJD+6NdoeiX
         VLyIfwqqAZL7zEZm8i3OtdzymyOeEvAzVN6dgb1M5bq/m8f4+lKayJWNTJFch87sO7Jl
         tlsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6Qc8cfxeeRWvuiFPsSxtJYZ7UALPSQd8ZtvknTZpf//F61m2wtsGTWfe8JuBWvC86DV6yoqjW@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwQEKxcYOk7wMTBzjIUlo4g0WUqyL2hu+wwkaD/J4H1AmFqjndR
	UCE30oxi7bQmIow5ILSF+LI7INVQHMtL4H6WSGhQJ+1TJHP8AIRKijY4UYSIMo056IM=
X-Gm-Gg: ASbGnctH8c1XhlcDwaIfDbZw5PB8FSo4XajFjeBxUYYZ6KdbVz0rgrdlvd2qwBRn9GE
	A1mGvhWV9mZQeIQ5GoelFwmVK/6Ebjg5Vaj1PW872MQClO+p3vNH8gDnLucha1+UkzAbnEcVgaq
	rAUWVRf1De9WVcV/LgrFyxpv3di6k/16z5MqhBA/9lTn5Vuy/K7T0nxdTolx/sEKK5OJhW4WF+z
	ISnjGOuQTHidGgAPs1S7ZiYzxr2DKUUiHozqiJ0+wDs8NPIR8cBj1tdUE6A6eFRqYPcWhNth73E
	y5nPPnUpG0+LL6krzx8sml4vP5wzpEywbFuhOUH7P/3VMxEsapmpwtocl+YaER+xtWyL6kt4RaD
	KE4U19FY=
X-Google-Smtp-Source: AGHT+IF+8CuDuQ4kf6mSJfvCZWVF2nwaA+1YTCjzunNZUTEkAuuOsBPS39QliHzSk5Dki6Jz/oOC5g==
X-Received: by 2002:a05:6000:2303:b0:3a3:61ab:86c2 with SMTP id ffacd0b85a97d-3a5586cba07mr495450f8f.7.1749622499974;
        Tue, 10 Jun 2025 23:14:59 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:46 +0200
Subject: [PATCH v2 14/17] pinctrl: renesas: Move fixed assignments to
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
Message-Id: <20250611-pinctrl-const-desc-v2-14-b11c1d650384@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1336;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=+flFdO+wB1jUsuwdikr4oTVuYRRszXJESkvc2OSpc4Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6rDKvTnvN7uWrkaR38SoKZ0JyrYcQvhwNCm
 /Q2Dq83gq6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkeqwAKCRDBN2bmhouD
 14FeD/4ieFxDBp2aYLDtBNbnYfL2Cs+jpT6Ln8r5h8k7iHk7UFGxh34/qOVxHUd1z1j+6DSnp0k
 Ke/5Mro6a+xzalY4l7ACNl9imdQ2c1Gzag+tWv72+5bvxiGqP8bZqL0Jw0w0zL6sWtytvSfKqWO
 BGkf3r1wHCuVlIPAta/4/+GAbC20Gbc2yR+46ZTzVjBSbDxXW/1q9H0GZebt08ZazmjdzHE/iwQ
 yOIIz88jzvOLYWHjKSWOL9LVDAK3GfiN7ClK0jGoNFuFmO2a1M4sBDhcX1nN4xbAmki3aupM8VD
 Tbp64fJQ896BpCzX2DnW2WqwdYVIVxtQhOvao+W/kMTC/vQc7fZdCPminzsgcFpdUsZcDW2G926
 JLDEoqmjl02ySwXcMvRRMfWxQMIzssWYFwDj6Nh2J6pmtzUPPdgn9YfXzP3DVD+YWq0Pm/AM4yP
 dlmgwSbCV3chOEk9k2nb8UY+TUCRLUDb7xXTAxI+ozgWRWv1brSG/BEZtSHbO2rZA7payHinZB5
 KN6dtKpxFObljSM+pANXsnq2vMRtRUfm/WYw/vNvczM7tfhsCOgw9BUrYElrlhYMcw9LcmSOP7j
 iaQdnaIObg7tji/TYEvlN7XdOkUPn6SjarApXOtiu6bjHdimu695XgL8gl39wSEZZH7kmPQj7NA
 W7xp+qiZCZd9aTA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Assign 'struct pinctrl_desc' .pins and .npins members in definition to
make clear that number of pins is fixed and have less code in the probe.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/renesas/pinctrl-rzn1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzn1.c b/drivers/pinctrl/renesas/pinctrl-rzn1.c
index d442d4f9981c908389407275522b936dbce294d3..fb874867dbfb9877b012988543ecbfd1bfb11270 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c
@@ -680,6 +680,8 @@ static struct pinctrl_desc rzn1_pinctrl_desc = {
 	.pmxops = &rzn1_pmx_ops,
 	.confops = &rzn1_pinconf_ops,
 	.owner = THIS_MODULE,
+	.pins = rzn1_pins,
+	.npins = ARRAY_SIZE(rzn1_pins),
 };
 
 static int rzn1_pinctrl_parse_groups(struct device_node *np,
@@ -878,8 +880,6 @@ static int rzn1_pinctrl_probe(struct platform_device *pdev)
 
 	ipctl->dev = &pdev->dev;
 	rzn1_pinctrl_desc.name = dev_name(&pdev->dev);
-	rzn1_pinctrl_desc.pins = rzn1_pins;
-	rzn1_pinctrl_desc.npins = ARRAY_SIZE(rzn1_pins);
 
 	ret = rzn1_pinctrl_probe_dt(pdev, ipctl);
 	if (ret) {

-- 
2.45.2


