Return-Path: <openbmc+bounces-165-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F893AD6420
	for <lists+openbmc@lfdr.de>; Thu, 12 Jun 2025 02:02:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHjNt6h7Tz30Pn;
	Thu, 12 Jun 2025 10:01:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749622482;
	cv=none; b=LlEISIFubf/+oz1Jqan1MjKcWwNTmNStZlx0soU09ic0yMgm+GTNSR/Foni7iXNWk4SCuv7u75pebUi1NeXsRqWKyw04QML8uHc//KWPD+Qx0VuNnOheKy8q58YzCj1ndVRwiy4b5M+/PfwHFS4yLYTp5TF3JdyC4j/UuUfAeTbWkia0kHRZdJYK/cTcF71g8/I33AOsfKPP1tuKxYe9S5NJEArDL4kb5L+ABWVK1dGaBQ1edSa5yqmfp77emKcCH4t2Hf/nmVgXJPP6dZnU1ag2puZD1MaPWj6gzc9VT95a6hikup/3mbIgD4Q1Jv+zD271Fd3bvjtxnbIU+TWzGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749622482; c=relaxed/relaxed;
	bh=TE7gPFs8Np7Q/FF2lBSclyxd8XnUpnZDt9gHZQ7ecXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SJrGBoKdY3YWkl3GWrX2aOFe7Xygs3x0K1bHYFUwf767meS7rA1LYXxrXIXTB3MkNBshMoJn6a7BhlZdBxipBDAgY3XZgyWP7C3EAvhUOHYloKeHnazSwNlBKtmetZyl73fwom5ZQNT/Asp55Na8XiPBhDGFSQeTMSAnYhGNAiFviOwGoYvwltwnOqj48z8xMQl/N0zg1UmMEba8MWxyB9xCiNpVYOmH6SZiTR73SCzHn5P+uN2ABWv8EfV/Su3APkrtG0y3e8z84XMMJqOgvZCpmMA8/8RyfVEXvAm+xJ7UCmMGwyLxBRdOGVpMurCpL6QEyqmINp0MH7AJufdlJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=S5amG661; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=S5amG661;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHFk93NZCz307q
	for <openbmc@lists.ozlabs.org>; Wed, 11 Jun 2025 16:14:41 +1000 (AEST)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a4e62619afso22901f8f.1
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 23:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622479; x=1750227279; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TE7gPFs8Np7Q/FF2lBSclyxd8XnUpnZDt9gHZQ7ecXc=;
        b=S5amG661EvmFJzwxFNeQ80GI9R7AY30ompekx3WdbQzLuMNRkDNVPOoqKYPPCRtbjh
         /Vqpur1Ma8cptwUxEjDxFQbLkfKOrjf/7J61eR9WeSwE+Ln2k0JqMoNvFOHTbKJ3qvSB
         kzmY29eYL9BFOUrF72ip+HKIFGNWBj+T6+bpUyIWu/iHVz8C2zrOCE1DxLEDsedp5RYw
         OCYs5UeefD/0RcAC0sW/L8fPyHd+67NFGMRScISI5glXqng0XW3zUibS1t7bsFmBAk6g
         bNWGo4sAXUSgLJZbegz3IwTsJVxPYgd7Ik0/ZXi8LKZU50QoaE5P5NrW22CUHdvkxsvS
         bnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622479; x=1750227279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TE7gPFs8Np7Q/FF2lBSclyxd8XnUpnZDt9gHZQ7ecXc=;
        b=vjTYIt5YHErUk3jtXVJ/QYu/0rbD5AxYKGNc+2qCPkW1WGD5C9b2xllnBmHrm+S3aF
         mS6jXrKd4Y2ZmKe3Rw9rgT0Oof0b7CwvyZmqyxNtH1v9JAu5yxg7lqcPtViZh91/1fnE
         tKdYp26efWR6gGP8XJpaMt2QX8krnxlS9hSmDOPJwBtK8xM13AULFL5enl888CqPtfwT
         dCdA+n0kBCEbCry+zzCvCo4vau0J3qgp1Wkp+4HR75ua6EHFJxmsJAeMPuOjLbs8IRVf
         ylsxZWFdcy2ZrFn6F3N0K8lYlK5mJUEVmThVz48Xw1PROxPCRNaCawMpNMSYeUqLMRvO
         VpaQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7BIHin1R05WhQulA5b8OjEjQ0zwkGgVD3KIwh0rz8NsM1XiL/C7Vea+idgpv00uUkAoKueSSH@lists.ozlabs.org
X-Gm-Message-State: AOJu0YygBiHE0byqmWdGHPilYvhkv/AAyop7wd89RQZQ84Fz52zUMAFE
	GNOEV7ztwOr93hcyUkPL83IzHkd0OtV56fsplz0NSIIQOzAhN3XOPVAeC892hBPUz2E=
X-Gm-Gg: ASbGncu4F1AdHI/P2hJgmAfx090C/gktIR5romLSktQC2uCL6uKvwHkssJVpTaURANq
	PpDzzETiS9wCSGN5bNlmF3WWf/isjVVgwJ8SJBcSAPrBbfNxcMx4AL52U6HTzLAc1FraaXifiYR
	TtQj/glSOu/gFnMR5Vim+aiw/wblPnqPFG9KYbPC88nJEEKXPNyAFJoO9t2J314mbZYxoJXtIjl
	u+eIqirvrXrXqrbA3GzBg2njZsy4czJeFKtHunGV5bpA9Z3XWkF4wafIZOYXJKQTc1u7tWajq/r
	z/GUTVLANKGw0NQD3O66kQuILkz7YocG2RDQjix7AFn7PsjfGf9pROBrt2mMPyPNnER+gmk/S8U
	ot4xElao=
X-Google-Smtp-Source: AGHT+IFn+w9wTXPGUJy/sPilC/NQmEX8xSLBnguhN63zZeVVN5Y9q/yoed/8bnPWbjxQrrKvoL0/ug==
X-Received: by 2002:a05:6000:290f:b0:3a4:dbdf:7152 with SMTP id ffacd0b85a97d-3a558827131mr509857f8f.14.1749622478587;
        Tue, 10 Jun 2025 23:14:38 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:40 +0200
Subject: [PATCH v2 08/17] pinctrl: bcm: cygnus-mux: Move fixed assignments
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
Message-Id: <20250611-pinctrl-const-desc-v2-8-b11c1d650384@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2161;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qxDFEG/2cjWrKLnKXwD75upSffPn/RaY6zrSF/H6Qbo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6lg4NYzThC3P0VBNILmPNpLI7cOGxxduFw2
 79gOSp38i6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkepQAKCRDBN2bmhouD
 154dEACOMm3Rp/o7Yal3hsY5lrUILoLJv/3YbR1poy/Hntcal7lfWiRxrgpOmbhNAJ4gxXsCS2v
 pQvdOFDdKXryzGo5sBlbzlSZ+llGXe7xIMFD3ccyG7miWv3FoqR39Ss09HtlDLb/iY7lCYUklFO
 X4CE6AJdiC+cVyMjst1ORlZHYvtSmj84z8M8Xw7fjQpmfx3jwpMn8Xk98GAvBj32k1bffAnVrdc
 0dQ73IYkIqj1S30dFyPVw8jVo1NWaH7C4LOHljvBFAS2RWUlzu6GViA0z3aLYJlleswzhWiXdqQ
 2uggpYru6C02B3JBYWRsXiE9lcHMWwJdL8C3KWshReL5zYhV8hRSeuIcHkZjviIb6d7qLHswZoq
 BBsTpZzFdVstw34OgcD5V/WAGmnWxNMppVq42YTfT61ZSZo/M23EkrRVSOAtgXoy2FMcc5QNhv0
 xSBOHIUMCmzDYd3Jdou3acpCxF89InjFKRURreHYhf6ZDMV6r+Jwq9UljYzaJZ4HR0QsZZRunEj
 bIE5rRF/VBlRukZG9fnFQwey+KBFAhAYMQij7w+xJpoqhxqpyvWoVmvYHH29AzUzEaag4F/cxdw
 HHEQfjUS0EaLxw4ayenSuMFm9PmgmKlxXXS++io2JONMtPpSTwwKvP3qPWz7NuuR8O+m9h0hb1i
 HbUKb6deG5dGoyA==
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
 drivers/pinctrl/bcm/pinctrl-cygnus-mux.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c b/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
index bf9597800954affd954e45a4baa01da4d5dbf420..e9aa99f85e05944a2a0cb9a3e6245c707dbc9b3a 100644
--- a/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
@@ -903,6 +903,7 @@ static struct pinctrl_desc cygnus_pinctrl_desc = {
 	.name = "cygnus-pinmux",
 	.pctlops = &cygnus_pinctrl_ops,
 	.pmxops = &cygnus_pinmux_ops,
+	.npins = ARRAY_SIZE(cygnus_pins),
 };
 
 static int cygnus_mux_log_init(struct cygnus_pinctrl *pinctrl)
@@ -935,7 +936,6 @@ static int cygnus_pinmux_probe(struct platform_device *pdev)
 	struct cygnus_pinctrl *pinctrl;
 	int i, ret;
 	struct pinctrl_pin_desc *pins;
-	unsigned num_pins = ARRAY_SIZE(cygnus_pins);
 
 	pinctrl = devm_kzalloc(&pdev->dev, sizeof(*pinctrl), GFP_KERNEL);
 	if (!pinctrl)
@@ -963,11 +963,12 @@ static int cygnus_pinmux_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	pins = devm_kcalloc(&pdev->dev, num_pins, sizeof(*pins), GFP_KERNEL);
+	pins = devm_kcalloc(&pdev->dev, ARRAY_SIZE(cygnus_pins), sizeof(*pins),
+			    GFP_KERNEL);
 	if (!pins)
 		return -ENOMEM;
 
-	for (i = 0; i < num_pins; i++) {
+	for (i = 0; i < ARRAY_SIZE(cygnus_pins); i++) {
 		pins[i].number = cygnus_pins[i].pin;
 		pins[i].name = cygnus_pins[i].name;
 		pins[i].drv_data = &cygnus_pins[i].gpio_mux;
@@ -978,7 +979,6 @@ static int cygnus_pinmux_probe(struct platform_device *pdev)
 	pinctrl->functions = cygnus_pin_functions;
 	pinctrl->num_functions = ARRAY_SIZE(cygnus_pin_functions);
 	cygnus_pinctrl_desc.pins = pins;
-	cygnus_pinctrl_desc.npins = num_pins;
 
 	pinctrl->pctl = devm_pinctrl_register(&pdev->dev, &cygnus_pinctrl_desc,
 			pinctrl);

-- 
2.45.2


