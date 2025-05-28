Return-Path: <openbmc+bounces-86-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0349AAC7501
	for <lists+openbmc@lfdr.de>; Thu, 29 May 2025 02:18:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b76Nm3XT2z2yr4;
	Thu, 29 May 2025 10:16:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748428921;
	cv=none; b=HYV85hs5FYhW5wGK/NQOxyHYcFvDUuGsYdboembzAXuz45pJG/zjpAHtOybXn8WTOp6o8VTxy+6+ckqBXPsVsh3uGxCSslk/UqvomHzpqfcaD+BFGfwDwgeHohfhehbbz5TQic8CYjlqij4GL2deQQmoj+ZWnUUY3PpqBS2NVgyX1/Vgj8gFMKv3Fbhmy7BsVJTA8dtOWP6+3Z/dxepUZk9cCG8H+WCNozFs8kSczsPqJTIjrhsd7+DEuhcY/wM0y8hRYgu1ZOiPt6uZmjlZGFhs4wGqUK5HlMr1cjq8UvGqcP5IN2FRr/mlrj4f+L34uzUPuvjTiMKcljbjDbcMFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748428921; c=relaxed/relaxed;
	bh=pf1YR4gqV6lGcgRNt14+w6xZNohisJw9ukNkMtmqRYQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c5va80JfLrzhpGQC/TPSJWANJmBBpiaZ4t0aOc6KOo+E2YlZHusvumzf9INdgpHWqvDi0KnCyKgOzorapgZ3lvYfwc8g5+jdF55klCwmAw7IjSxz5pjvPNvBnWwVTR3vZB2eQVZpsjUkgyC7pQoP8CUVULTRpLwQZriCyPIBR+ARiVrjIRpW5ZetWkzj2ez/l54D8921vGUHAzscA/8Tm9T7m8rfi/BpKe5a5Vs/SGhVvJobodnaQZ5wkLewKaO6rFQRTC09XP4eGjWbIo8VOFRWORtweeM4G7VC8uBtQ+/Yly9XDo2sTB3qcazMJ2omZx1LFBiBwCQkYHRh3sykIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uKCo/HEU; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uKCo/HEU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6mK44P3qz2yds
	for <openbmc@lists.ozlabs.org>; Wed, 28 May 2025 20:42:00 +1000 (AEST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso5069765e9.2
        for <openbmc@lists.ozlabs.org>; Wed, 28 May 2025 03:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428918; x=1749033718; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pf1YR4gqV6lGcgRNt14+w6xZNohisJw9ukNkMtmqRYQ=;
        b=uKCo/HEU4nYbdS1YVrIy5/Ub/os05xiEZ/614RYkUOskJnBfeAiRgWg+qPjwVun8Ce
         jdUBSRqOZfj0G9DClkmlHtjTiPRD0vLwBQxYdgTog242pMBi4XYxG9EcAAHYkAJwNdr+
         wBTt2RsFzSRTzFIu0ALrr/RH69GgMWUTJQJeXHh4vMPQ8H4EbdLB55XehKgfuCPTXWNJ
         kJQoYSnI0MhR0/AAwipg94iDi/0+zI62AXtKOajWxIcB0rukEYkgxEuoM4oLzzj7eejH
         T1oHqHg7FvIQURq5asRgoHDANHOlYsoFW+naJwtA3oFMe//1zGzmsdiwysjRCDF7CFWc
         5ZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428918; x=1749033718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pf1YR4gqV6lGcgRNt14+w6xZNohisJw9ukNkMtmqRYQ=;
        b=uM9osZsGpgsiGlifFcFoAAHYjw9oLFpzJtDvVNl63AXK3FEZf+je9w2wC+X6hbvCF7
         NG40IIQWJQ1wUgHxf+JvYHrGLwL9dQTXXAb8Ixti0DH/aRxXBkp/ITRHa80smhiYUKnd
         EqaT7q0GSHWaLH/EGW1SjmV+8gSmnJJERRJwGXjA+mNT6CPU9wWl6jbpWfL3OJkMFO7C
         2SQOtgsfLA7yGAsZEJxvd3/m53LSLbsD3FBX+VhVXsqU0HtnBm7EqQM2VLBlTKzOHaFC
         dEtJ/SeO2dcmPjiMJpOwqgwf3zSzm9O4F5I8Eqlw07c4yH1F7SSMNK1dlNywIpxXac1Q
         nPUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI22EXGq22EY8LkQQb4LhYH2Cr4peWrOQTkLOg6yNJ6S0uDACV6iYMu4vbyVToR731lWsEHWkJ@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwIvnbnlbCz50tkHbeh4qyqG1qhxUpR0E8+R5MkZMTZz9sr4vjF
	jNLHucnsEt3Fc2jPx6f39ZUnE93AqlyVYwfacPyRDmT4TrgWmx6C+at27K5vwy8+5D0=
X-Gm-Gg: ASbGncv7J59gO+vcePSxsn5cIUSAv/WIgcUv3IBRznLO08lrL/32FjSfst5WErwaEAt
	hyx+Zq5/j6bDgEq55YUq3aXZcDiwJGelIowbr/5bXoe4cqBL3gqREPGUH6Pi7EJh42GI90f+hZr
	sN3K5UCEEobac3f3KIlGjaRHv2QEFGdI1S5C4VhfwqwlPh5LdRECH7d4/FsrP6DAKkynuh6yXw9
	M6ctKcpYQuLhbRTd2THSEGClQrqG7XAwF+63xhunDwPZNUSQt75a2Whzz29UWgcxIX50QHgeKz+
	eEela2DyJaj3YxD6ncl4SJMSK8rqq3a74BrfuKjheo7RUY5rAt9zCHGunLDJ0EBbt0gU7U0=
X-Google-Smtp-Source: AGHT+IH1zOEOLeCxje+RyhJLL9R7to4LG+S/YoypX4dofkpM8V4nOT+IYOSlqNv+mgg8x3vhGGPHiQ==
X-Received: by 2002:a05:6000:2303:b0:3a3:75ea:f9d3 with SMTP id ffacd0b85a97d-3a4cb4addbdmr5341295f8f.11.1748428917518;
        Wed, 28 May 2025 03:41:57 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:41:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:04 +0200
Subject: [PATCH 08/17] pinctrl: bcm: cygnus-mux: Move fixed assignments to
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
Message-Id: <20250528-pinctrl-const-desc-v1-8-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2098;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=8TSMAdNwJJ4cMP69sWF06naMdDsc0YKsL1F2ggY8MtU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhP4ba+/mFh+oFgO6EmJOLE0PvaD+UB1YrZI
 JEnxOp0UJOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboTwAKCRDBN2bmhouD
 1wZUD/9bA+sdZ/7ZzrhcN224T33+HyLau7J4D7YZ4cKaBQB0U8+Zw8EsZqd4MTQZ6emR9L2iOku
 vB4WqG5e+8Z9LIfvJznXFBRZIVYlQMVs4gKMA6n1IQK+b3fdbSKyrWYxGzgWg1qHRWfrn6gFq8V
 qwQ3u4tXG8zk+5W7WCD/WmhtFm8AjfVPdLdTzD6BTNO5/1O3UECTfd4bdy5uAlIjjeeaglJ6U9x
 TfGg4iHSiUave8A4vNsJKpd2jh/UHo31b0ZzfwImQA+f8HM2q+iJGrpHX3CyIV6W2b20CcjaITi
 BVPzXRwFn1atUdyNm687e7TwfcAjztLBlCv8F8SICMdzeIwhYxkIJwrnzyA/XJKL8VZDWTgHXCG
 K2DF/qGfjZ5NgbqxaZoqwf1DAfB+eqty4Xax4UbJTIBeoox4mmxjYZGajNOOihw9gH0KKvHsj26
 zBwOdZRN9WJjBF/BLwvfGx358OA0ejwj8JIbMzzv7XPnPz8YhtHemtM/2Q/BUcu49g7M9Zn+SBQ
 kXnJY427cgGJL4hSfheW6ucWUtyWdpu9qP9QkoTJviZEn3MuNR1TyXnZlNQPQziFWzqHoSJpgWa
 B1C0T6yk8njHeARq0LwxzSDnTjEtcAmRHwCS5FH+LfTz1zCNy8ZkWDkhOkDAGNbKgggkp4iOtAa
 Y4YpkDzEcJUCemQ==
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


