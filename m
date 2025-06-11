Return-Path: <openbmc+bounces-169-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAF7AD642A
	for <lists+openbmc@lfdr.de>; Thu, 12 Jun 2025 02:02:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHjNy2mrjz30Vl;
	Thu, 12 Jun 2025 10:01:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749622474;
	cv=none; b=Kls5pHUzoOmwJysvfFOP4zOtakIouaOv3R2E7m4Lzl42r+xQZbbYPlFlUqne0y2J2CyhFpmxgWSd6HlCLMWdKN1dL2rwzfdUzBC0BHHMwdrQvaLrRvqxIqk/UsqWNOWxz3J8MWeJq0OtYmBbF0hezTl84knbxVeaFohIreRQUZhDE/YKXb++YDP3n3zoJ7zYTxkzXuLbFwGoyERDkfXs3vEQEIJ/25d4Fmcxp7zUpJQApnknsuk4tMuMLyMJMnnt28L0WYTvXnauMrU1DTmdQG6L5oHK9Xz+6XnR+wEGOThsmjRuRtA0WaCCZCSmQ1yUdVdrnJfoUhkrQ7IOVCGEcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749622474; c=relaxed/relaxed;
	bh=wLYPwIWcNIonGvSRDv3RvBARXdaS/NHzLx8nwSb9+Xc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fhwS0B9j6Q74x3V1hvvwMScTuwaTmxrZJon4VFbTiqfSxC7L7Zf9skfP6oNvDINLKLOTbnOaprRNYvOs680Hb9EOv1vwok2duJuSt3uuJW7xY5sQnrpP7d6w6NsiPIjbBL7uiQw6WEttKSIg3/mc5MEZO0/8WUDR9nLOj9wR6ihanEDe4VyYH1VUziPxU3YgeC7MkiqAgin3qS0ep5Pt+xHduxuekg9akSoKXnvL+Cotu1eAEaXtKd2KY8PEeZMFecLT5n0fcP/RtvK+pFgM7qp4lbSvsS5Ky9ZZXVCwZhcEru03/3r04VOK5Te7ZymNktOe/v8fQQUjtnUBjyt+GA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OE/QASGo; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OE/QASGo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHFk145Cwz30FR
	for <openbmc@lists.ozlabs.org>; Wed, 11 Jun 2025 16:14:33 +1000 (AEST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a4e749d7b2so32826f8f.0
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 23:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622470; x=1750227270; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wLYPwIWcNIonGvSRDv3RvBARXdaS/NHzLx8nwSb9+Xc=;
        b=OE/QASGodYC9rONLrAghr+hsiX3vHMK55+N+O6YUPi/4nOh7ADydYJJAQmvd8d6iPN
         DeUh80r1TwTtaDTlKHsGkq3yMU2mLUE9s18KlbIpf+Rhc9trKoBTSvdvW69RM2UcTl3o
         UQ68zpj4qX2Ej+aFLoTdBLT7lotNNOIE+J7BFfAzRdmTqKgrwBAsAuIa95vsRqQSpIYx
         gYVaqC65i33tUgp70NtZ2rGmTDqUKeDWoE9uD+byVqtux3CIm1toMGaPkAZmlT8yZp3W
         oiiBJE/s1e5HRNt46ojfhGiiNMUxBlxtsfCK3yhEa+ylRBNJj9nplljdl1rKhwfAXTFC
         LSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622470; x=1750227270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLYPwIWcNIonGvSRDv3RvBARXdaS/NHzLx8nwSb9+Xc=;
        b=v+3u6Vl8/TQ6ZqGRIijeTv5twiPdYfGz8kKH8BG11isNabv9n3roM4PPuSryfoWQ0s
         35OvOf9AG7JLWsMkqbUAfi3egPqAhfHsUVdM2nKGbCv7Hb42iJtSVQWR8zW+/OkXnD73
         C2OnoaGvARg4fKbcctWXXPvvR4XfnYV8cORhhPsYWWcZSH1Dlo9VebzWWbfiCAzCpkAF
         JqSnxjCl/ZrNp04/1D/vYZXcbxzyjtYZ6Vxy8R1KvddLp4VW+ZQ9O+UVT5QK/hCsVApP
         8GTNL5TOsdFXAz1EqwXwTgFh7pWn0rJ6CwB2MtZBtWemNBk0bS5V6w6jWiyFDqmAigG1
         HlQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGBnnN2/Xj8PJnN2g03RhQHch6ZtlgG6nvY83dgNNT+qwtKUi2krMEaNPEPv6Mc1ZDBV+bBUh8@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwGvdSmIugTGIH5m3lqtEmyD6uA7Ou0RAdE05SPnSCra3UjgEdy
	sfceKv5d7IxwvA1gOCt+5xqgZygVVGMGoyhR8VG3Bo83lfek5+JrCajuqXCnfF0L6P4=
X-Gm-Gg: ASbGncuzziW2HU0eVkPkojaWJXlEE6RRZTyUyOTQdJ7VTFLDv5g38IvfvnNPbWXK6KW
	zXcgS2UKfsC9zzrZ4pzr5rEiDHQd8sgJ/DdRlzsfzWpF0QaSWa2fgX5O0iMD6I4cO6decVfOEhy
	tgb0FFU9f56HBrIDOGcu1M4P1b2vwkdqz/+Mwu3Ydsfeb/lrg6XZdtQIyMI7LP0d6XU35J/SpTo
	v3Q2uWFuZvCXUnTaWJTsEzf9axx8CZacZXm6WbOMImqJBELha1Yq8lPZXFZ1RyhdpvxqTMWyQQR
	szSdavEqrYgXeLcVd1Ed6CRpt9ZFIgSo3vHIN7a/DBygVo3RhGxNENLQ5FTbZXt2zOBX1wRsTpP
	oi4YlOBLM8VnVsdkc/w==
X-Google-Smtp-Source: AGHT+IFZtxBFSjLuR6Ffe38My2u48aEsiQUnLVmgKKUP0ueXHo6YNiVvlCk4Ba8Qu3oZKGPSY/KEKw==
X-Received: by 2002:a05:600c:a413:b0:439:9a40:aa1a with SMTP id 5b1f17b1804b1-453248cd75dmr4600935e9.6.1749622470317;
        Tue, 10 Jun 2025 23:14:30 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:38 +0200
Subject: [PATCH v2 06/17] pinctrl: nuvoton: Constify static 'pinctrl_desc'
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
Message-Id: <20250611-pinctrl-const-desc-v2-6-b11c1d650384@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2241;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=8vGQpzjfE6u+giOJnSmjcfHXKBBVmk/PFMGclk6BN7Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6jcQ29NFFFK1Aw5C+7sI3DG40NeubIuVWQa
 M6tf00GyU2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkeowAKCRDBN2bmhouD
 15qaD/988iyCPoqH/pBfTs7tUsVVV8Mri+Af4YNRSY86TwdRTqSCMO+0wpaUw2BeuKynQCs8ZSd
 v6c7y93x4QoZGwxvtP95m0lKxE96njRQ+2yEWLJHOZ5p+C5mkjTvNblw1G7iInSJsP8rchVDl40
 r0DH5cTiR5PBxP7K186nP0Ksdm28krr1TsC3HQuDiVbji6eJfxvrXFshWVpM2vWQQyRAaSBHkDt
 E449wE4IWwnye3jEhdetRCPEH0vVCuxuckhvO5Vw1XIoFHAIl6iko4DqbVzJmGnHroj1mHJM2eK
 53tzMUWNPCBCWcfu/jCo575CcJe3R3/LZPdj1frXSS9kau5xnfvQIhVXK6f5KxCG0CUM0qtlDlD
 p2RKEt6nSfk1il1nM/A8aWjhbK5jTiATzFEcXpIXJd1N5WccFnzR48dAHp+va8BhnC5QLcRsP9q
 vxTxvgB8pURZn0/cfKX2f7Sv0lmKxzrl0eZuS7H0xldoBa/ROi9lYTpG1PeuveKpRsR9fXMOcXM
 Ceiw64wJn2c7ndksjN48oBkeKzcjljo3MU7m0OLpv4qwb4tbUYCfNQJuDAyGXt6/aEvJwIL166W
 py6Jh/QFYmArWu9ggfKh/De2c0G+LzrGQixxWZ833ZoF2WqmwpQcZLhiBUhmtqXEXnSepRVMt7k
 k1gji4LlRC8ocpw==
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
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 2 +-
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index dfd32feb34286b7a4d807e9033a11f507e277dce..b8872d8f5930ad931dad208afec4e08a23c3d653 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -1817,7 +1817,7 @@ static const struct pinconf_ops npcm7xx_pinconf_ops = {
 };
 
 /* pinctrl_desc */
-static struct pinctrl_desc npcm7xx_pinctrl_desc = {
+static const struct pinctrl_desc npcm7xx_pinctrl_desc = {
 	.name = "npcm7xx-pinctrl",
 	.pins = npcm7xx_pins,
 	.npins = ARRAY_SIZE(npcm7xx_pins),
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index be3db8ab406c416f0709d06eb864e33e3208541a..3c3b9d8d3681c64c21927615e1bb49f157f156b5 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -2299,7 +2299,7 @@ static const struct pinconf_ops npcm8xx_pinconf_ops = {
 };
 
 /* pinctrl_desc */
-static struct pinctrl_desc npcm8xx_pinctrl_desc = {
+static const struct pinctrl_desc npcm8xx_pinctrl_desc = {
 	.name = "npcm8xx-pinctrl",
 	.pins = npcm8xx_pins,
 	.npins = ARRAY_SIZE(npcm8xx_pins),
diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
index 4264ca749175a2ce0f3603c1d7aa271d98e6cd89..8d8314ba0e4cb55db2b1d3adf2de07e6fb93c279 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -989,7 +989,7 @@ static const struct pinconf_ops wpcm450_pinconf_ops = {
 	.pin_config_set = wpcm450_config_set,
 };
 
-static struct pinctrl_desc wpcm450_pinctrl_desc = {
+static const struct pinctrl_desc wpcm450_pinctrl_desc = {
 	.name = "wpcm450-pinctrl",
 	.pins = wpcm450_pins,
 	.npins = ARRAY_SIZE(wpcm450_pins),

-- 
2.45.2


