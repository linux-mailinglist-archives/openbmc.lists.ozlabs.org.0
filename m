Return-Path: <openbmc+bounces-182-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AC5AD6445
	for <lists+openbmc@lfdr.de>; Thu, 12 Jun 2025 02:05:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHjP75h7bz3br5;
	Thu, 12 Jun 2025 10:01:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749622512;
	cv=none; b=CjdosmdsYploGyc1NziPKpKvbMKmBhndagdTUpGA4zBxHi4HLdr3Gv3jLqYNY+OIinVvVRa7cEVEtpDDq0qSxvMoAX4tVey77Xwqnj+8p8qI10T0G6VSSaj3mAjBxUfCloZwGWZNIaGYaJpSFhlbfSyUKzAEOFa+jfFr+tGSgIqdiC0INu34EZpmZXtxUaRZk/g0QqvZvV29OFoU059HQweeT2q6aAnAMNv0BOgxEThorLOJX+jJzRQm7cGXzvhg1sl4QgsBf+t5FczrLoeYw/O9wTKi8nPumGObdjREoh//q0lTkCtbLHPpQacxxQJPC37QupMsxx+0hbe8hEpdzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749622512; c=relaxed/relaxed;
	bh=aNGt00qg7VwSs2+q3jw8T5TN27AreSOovDlc8CyaZ1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BgGbwPU2nDyXennMH8plavpXYhuvakSFzyDz/AyRZ/2cDUlpeF2psGLXhgKrs9jhUdniiZMB1hJw0ATa2vT36TJsggOxWfGm5X/YaxTf80/6Jebx5vlb64kMp/iEOa9IHEyW7gJiJhjotNhFJbA2xR5M16tWiUm5aAhEa5gTSB4KBv6oDKJNSwKZC0zldJpk4G2pEgo2PHIPxYQIOR2Y2Ly5UsaQUdKHPN/e0WH9j3+BvUJATa9ED6Z9mQ8/rpphhHp0hob2fO6kdMU5b5ZzpkAco1GFvOuza6yhiKgPyQNSTFhNPPUQKd+EXKCWBlfKOUrBxnd8rgvJzVB45knwXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oOeCJ8Gc; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oOeCJ8Gc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHFkk6PBBz30Lt
	for <openbmc@lists.ozlabs.org>; Wed, 11 Jun 2025 16:15:10 +1000 (AEST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-450d0526132so43605e9.0
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 23:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622506; x=1750227306; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aNGt00qg7VwSs2+q3jw8T5TN27AreSOovDlc8CyaZ1s=;
        b=oOeCJ8Gc8wJeWR0kdjjonfYdfLe9OzdNEEK2xAeLmbNrJ90joL8Q6dd/JPVxgj6jq1
         dtQvA4U2G9yn1N8D878NBMKqeGBQ3oUH2EowfkisNkzEEfhC5D9vB/eIYOHEQShBsPLG
         HTPd62f/liq2HGVLrj26EI9cEbC/Tma5DcKBcgqT511oMr/OlroOwZG8CH/83JKz+R5o
         pivOQkLWDVBECQMWrorwVjuSKwLMN2W39WUY+3l/PtwPI2iX4v6ExwPCPS1taXIw3Nmp
         tmbeOiOXocNP3ct3EoAtFTtRdWye2UXlYIFM3CXWWSYiD0bILOgjhCiJ4YOBMk/8YIe+
         tyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622506; x=1750227306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aNGt00qg7VwSs2+q3jw8T5TN27AreSOovDlc8CyaZ1s=;
        b=HrXsexwBxzFwBSrTP86OxoQQsVckrAXeGLd9R/7UlwMuvt9CIBxzrrW7yPMOXk5Rka
         RR5ZvW4FMa5RIPtDUaNpEjqPUR7MxH5scZ8cHYs0dtFnT193liLVUcO6PrYAwkj4GITv
         t2OoaOF7LwyvZbkZo9TMaLAcga2MMFwKJ9pXzxtsSZa1/qx2ux8DNrnr125ze9L5p4T3
         17koCPa6PK0S5+K/bsLSI1i1helhRaIXoECRwmldpcpLdF5Rru2AZXMKHflIEe2JBnPT
         G7vTQ9tV0l9IYCmsVtVJfnWkWxTbfDmw8JLvu41+tb0J6Ie3QRBjbWCiFcErrY4WNdBf
         rqwg==
X-Forwarded-Encrypted: i=1; AJvYcCUFqeTElmNFVPu9eQX3lO7atr7FSAGcMoRQ8gZPJOqEvmqLXUD1irJf418liUFAeV1GjgwR7dW/@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyUbKLbUMmbiHrMd8PHFVgmGYuxD9tg5B5A0NxVRlpra+n6MDXY
	PxZHgmS9g9at6x/gMqe/UB3tZmSLIFLOrkewBpFii6DYy4ycpOwqV9eSLqRvHNpkvSE=
X-Gm-Gg: ASbGncsmRJiUVSQZwBs3JamnYU3UunTzZhiDDd7v+xnd0XxR/VnNNqUPORAIMlJWZAW
	j+pYJ0QUczNJfT07/+ZYh+TrOLgCr+d+Q3B8D2A0n6yXx1d9m6R1CHvpwp5AtRdfqvQnPE4AgZi
	9Yr9hsVhUPa5rT4qJBUXgMCM30V4BeUuNN+GHPCqo8FRfRG+9Mo9KlTOwIm72sIhNwQdcPFZAty
	SQSCRUgf0SEJM1jQGG/PtJbbtzf3WAcTPIbA0QlXRLrltrwvb6RcDfAxQpfCXFR0/tBrWBoZjio
	IklXVUihzHvkQ/Iy8aWUzx1UY0DehOfey87Folt4gLs/mduwz7OyAAVZ6UHsIxrwcol7UU0AdeS
	oCRS/xeo=
X-Google-Smtp-Source: AGHT+IE9iZS2ogk7tJvE3rsCnY0wk29G93paez5PAAUjPtvkW7CHHsEWc6qFRUHnr1G7smpnBlKSHQ==
X-Received: by 2002:a05:600c:859c:b0:453:c39:d0b1 with SMTP id 5b1f17b1804b1-45324875832mr4048235e9.2.1749622506314;
        Tue, 10 Jun 2025 23:15:06 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:15:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:48 +0200
Subject: [PATCH v2 16/17] pinctrl: Constify static 'pinctrl_desc'
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
Message-Id: <20250611-pinctrl-const-desc-v2-16-b11c1d650384@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7477;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Yg+ckOrH0WLaxHkGgs1KteCaW8JIcss9g2Abd14ew30=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6shEIN/DUxc27nmKSxmuEsUQ1U0xEoqpgrx
 /T0IwSTLwCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkerAAKCRDBN2bmhouD
 17j+EACF9prxhUrQuEqt1EdqbYho5Qt8xy00eIHDjjk68M7IfneU+MytLVtXHc90NbhgLcT86mm
 vdCWelYNgNKA668j3/VA6xXTopwL1hlMy/jnTB8jh5rMJ2hlGxFDCqJ86j6MNWvW60HRFzApvm2
 6huEh4fnrAjg+R+g3yEdRW7Qe6MueHuz9QVcCqul2QrdmgoPV49FPMoD0PnR+pHwcyVvqZHKtJU
 1cLarE6mR7IN9rtq8VTY89MWghmWHcObWYCTjXh0TqMu0KkzSxtiCk0d94XSq6g/QjgdivQHC5u
 ADT9IDcY8pgR02EHdGcECrVO6CktxyWN+unzYizFvXVuK5EQB/YjHDw7E6DBnQQnOQCbkmfJxSN
 r6fhH9CqmgZc+cZ3FGhuYcV7tLm1+NT2FmFE8E5mAjma+8Pu6/anSWofW7rGt2FBrN5UNn1NE6C
 E2unp6xRnREFIFCwxDnPpgCl/OVIpEO5mWkjST0EzqM2KFyNghU6qsolX2yGMn2W+5pWxjZUlRc
 L+AAfic6Pv5S/kzwYI18kabcNT0oC2alEojFJoFx+gzSZBOkePVYApK1geqESaBkyQhIme9cn3u
 BFhDrCi2icxQZIxntSOVUajxKCVuR9iync3tfL+BFwkpSef/Ss5g73RCcYvg8Gi3R5Gm3Eu082P
 /bztidBtdBUhi6A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The local static 'struct pinctrl_desc' is not modified, so can be made
const for code safety.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/berlin/berlin.c                    | 2 +-
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c           | 2 +-
 drivers/pinctrl/mediatek/pinctrl-airoha.c          | 2 +-
 drivers/pinctrl/pinctrl-artpec6.c                  | 2 +-
 drivers/pinctrl/pinctrl-bm1880.c                   | 2 +-
 drivers/pinctrl/pinctrl-k210.c                     | 2 +-
 drivers/pinctrl/pinctrl-lpc18xx.c                  | 2 +-
 drivers/pinctrl/pinctrl-mlxbf3.c                   | 2 +-
 drivers/pinctrl/pinctrl-tb10x.c                    | 2 +-
 drivers/pinctrl/pinctrl-zynq.c                     | 2 +-
 drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/berlin.c
index c372a2a24be4bb80b1f2475ef8512171c8e1326f..e5a35b803ce66d247c5e5ad78e6677570a1add60 100644
--- a/drivers/pinctrl/berlin/berlin.c
+++ b/drivers/pinctrl/berlin/berlin.c
@@ -283,7 +283,7 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
 	return 0;
 }
 
-static struct pinctrl_desc berlin_pctrl_desc = {
+static const struct pinctrl_desc berlin_pctrl_desc = {
 	.name		= "berlin-pinctrl",
 	.pctlops	= &berlin_pinctrl_ops,
 	.pmxops		= &berlin_pinmux_ops,
diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
index 628b60ccc2b07dc77e36da8919436fa348749e0c..a90beb986f5bb707c54552e1333802943a4b04bc 100644
--- a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
+++ b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
@@ -448,7 +448,7 @@ static const struct pinconf_ops cs42l43_pin_conf_ops = {
 	.pin_config_group_set	= cs42l43_pin_config_group_set,
 };
 
-static struct pinctrl_desc cs42l43_pin_desc = {
+static const struct pinctrl_desc cs42l43_pin_desc = {
 	.name		= "cs42l43-pinctrl",
 	.owner		= THIS_MODULE,
 
diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index b97b28ebb37a6ec092360f8ea404dd67e6c43eac..ccd2b512e8365b3a5af0bb223329f39119bc7078 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -2852,7 +2852,7 @@ static const struct pinctrl_ops airoha_pctlops = {
 	.dt_free_map = pinconf_generic_dt_free_map,
 };
 
-static struct pinctrl_desc airoha_pinctrl_desc = {
+static const struct pinctrl_desc airoha_pinctrl_desc = {
 	.name = KBUILD_MODNAME,
 	.owner = THIS_MODULE,
 	.pctlops = &airoha_pctlops,
diff --git a/drivers/pinctrl/pinctrl-artpec6.c b/drivers/pinctrl/pinctrl-artpec6.c
index 717f9592b28b51737e67aafc93664b1345511908..af67057128ff1e9e766b958fece9c71518c89081 100644
--- a/drivers/pinctrl/pinctrl-artpec6.c
+++ b/drivers/pinctrl/pinctrl-artpec6.c
@@ -907,7 +907,7 @@ static const struct pinconf_ops artpec6_pconf_ops = {
 	.pin_config_group_set	= artpec6_pconf_group_set,
 };
 
-static struct pinctrl_desc artpec6_desc = {
+static const struct pinctrl_desc artpec6_desc = {
 	.name	 = "artpec6-pinctrl",
 	.owner	 = THIS_MODULE,
 	.pins	 = artpec6_pins,
diff --git a/drivers/pinctrl/pinctrl-bm1880.c b/drivers/pinctrl/pinctrl-bm1880.c
index b0000fe5b31dfbcd6af6eaf0c01029f00cbd205b..387798fb09be51cabd5cb76e0d90a28b1d363050 100644
--- a/drivers/pinctrl/pinctrl-bm1880.c
+++ b/drivers/pinctrl/pinctrl-bm1880.c
@@ -1298,7 +1298,7 @@ static const struct pinmux_ops bm1880_pinmux_ops = {
 	.set_mux = bm1880_pinmux_set_mux,
 };
 
-static struct pinctrl_desc bm1880_desc = {
+static const struct pinctrl_desc bm1880_desc = {
 	.name = "bm1880_pinctrl",
 	.pins = bm1880_pins,
 	.npins = ARRAY_SIZE(bm1880_pins),
diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
index eddb01796a83eb86c8c5bcf6788c999e8bf2926a..66c04120c29deccf53b21cbf8705f1d10c74ace5 100644
--- a/drivers/pinctrl/pinctrl-k210.c
+++ b/drivers/pinctrl/pinctrl-k210.c
@@ -879,7 +879,7 @@ static const struct pinctrl_ops k210_pinctrl_ops = {
 	.dt_free_map = pinconf_generic_dt_free_map,
 };
 
-static struct pinctrl_desc k210_pinctrl_desc = {
+static const struct pinctrl_desc k210_pinctrl_desc = {
 	.name = "k210-pinctrl",
 	.pins = k210_pins,
 	.npins = K210_NPINS,
diff --git a/drivers/pinctrl/pinctrl-lpc18xx.c b/drivers/pinctrl/pinctrl-lpc18xx.c
index 0f5a7bed2f81b731714e3b65908df23f2ffdfd63..5e0201768323521754e7ecd27e878a81925c18a6 100644
--- a/drivers/pinctrl/pinctrl-lpc18xx.c
+++ b/drivers/pinctrl/pinctrl-lpc18xx.c
@@ -1257,7 +1257,7 @@ static const struct pinctrl_ops lpc18xx_pctl_ops = {
 	.dt_free_map		= pinctrl_utils_free_map,
 };
 
-static struct pinctrl_desc lpc18xx_scu_desc = {
+static const struct pinctrl_desc lpc18xx_scu_desc = {
 	.name = "lpc18xx/43xx-scu",
 	.pins = lpc18xx_pins,
 	.npins = ARRAY_SIZE(lpc18xx_pins),
diff --git a/drivers/pinctrl/pinctrl-mlxbf3.c b/drivers/pinctrl/pinctrl-mlxbf3.c
index ffb5dda364dc81808cfd5a168ce3f1e9f119357d..fcd9d46de89fb3e5215784109ba31b171fd15448 100644
--- a/drivers/pinctrl/pinctrl-mlxbf3.c
+++ b/drivers/pinctrl/pinctrl-mlxbf3.c
@@ -231,7 +231,7 @@ static const struct pinmux_ops mlxbf3_pmx_ops = {
 	.gpio_request_enable = mlxbf3_gpio_request_enable,
 };
 
-static struct pinctrl_desc mlxbf3_pin_desc = {
+static const struct pinctrl_desc mlxbf3_pin_desc = {
 	.name = "pinctrl-mlxbf3",
 	.pins = mlxbf3_pins,
 	.npins = ARRAY_SIZE(mlxbf3_pins),
diff --git a/drivers/pinctrl/pinctrl-tb10x.c b/drivers/pinctrl/pinctrl-tb10x.c
index 4edb20e619510b2f52c7cde41c2540328ec4e95d..129fa51d13b1e265b8145c87f19fba0e8f14f1aa 100644
--- a/drivers/pinctrl/pinctrl-tb10x.c
+++ b/drivers/pinctrl/pinctrl-tb10x.c
@@ -735,7 +735,7 @@ static const struct pinmux_ops tb10x_pinmux_ops = {
 	.set_mux = tb10x_pctl_set_mux,
 };
 
-static struct pinctrl_desc tb10x_pindesc = {
+static const struct pinctrl_desc tb10x_pindesc = {
 	.name = "TB10x",
 	.pins = tb10x_pins,
 	.npins = ARRAY_SIZE(tb10x_pins),
diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinctrl-zynq.c
index caa8a2ca3e681718fe213921deca8d130371b122..dcde86fed10db3e2dfebc19cb841ea7f63e74989 100644
--- a/drivers/pinctrl/pinctrl-zynq.c
+++ b/drivers/pinctrl/pinctrl-zynq.c
@@ -1143,7 +1143,7 @@ static const struct pinconf_ops zynq_pinconf_ops = {
 	.pin_config_group_set = zynq_pinconf_group_set,
 };
 
-static struct pinctrl_desc zynq_desc = {
+static const struct pinctrl_desc zynq_desc = {
 	.name = "zynq_pinctrl",
 	.pins = zynq_pins,
 	.npins = ARRAY_SIZE(zynq_pins),
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
index 27f99183d994dccb92aac81ca42228bdb9225e87..aeaa0ded7c1e5ee7f9c5e4113bfd208fb844ba7d 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
@@ -898,7 +898,7 @@ static const struct pinconf_ops starfive_pinconf_ops = {
 	.is_generic = true,
 };
 
-static struct pinctrl_desc starfive_desc = {
+static const struct pinctrl_desc starfive_desc = {
 	.name = DRIVER_NAME,
 	.pins = starfive_pins,
 	.npins = ARRAY_SIZE(starfive_pins),

-- 
2.45.2


