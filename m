Return-Path: <openbmc+bounces-184-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A93AD644A
	for <lists+openbmc@lfdr.de>; Thu, 12 Jun 2025 02:05:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHjP85ywbz3brR;
	Thu, 12 Jun 2025 10:01:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749622486;
	cv=none; b=crU3YJqe2nWPUxcwbivOZ+flvzCnikZ+7asIlzQ1hBQ58/9afkEcSWpyw4QzbEw/jenqGvVdZJKbYtx2ODgfNVTNMvZ5ofb4xMjz7moIA+DVK52PGa/XfRX8Evf++XFLgEiV4AWv7BOlLy2mLVg8E+JDgkyc1iWjUlUDFqmUvsEuzflj+swZ2sqKYTAgxMSXUDrgC5JkFQPwYeVdRRXlMvgj03nm5fTD8g3gSmuaUY6Gtc9ltP0iDFbLfvnmK6Cp9UmjxQCzhykHUDTgqOKTEZ5RUq0b/oquOPw/GYjRqblyu1KGrHMX9TMleiH/Smnx+C2/FVfdAIKsiCPNx87s9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749622486; c=relaxed/relaxed;
	bh=hsgXI4B2PtLxGVvjlo+6E+TN7UEoR/brseumFotN0IU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gccYuo0RAfHHudQVfx3nI7bAG123QvNQa3Tp5NSuXP+guZFiCkNrykzZmomYU5sKGPBtPpReekHD+OJlr/KnB45HWPqUwYd1Af362wudfLL9YDssrDVu+j5amTt0BLj4m+kUI12/UlfFxzF8HY3hTRUW84SXbyrL+AGoTYAA6+XcGvAogxmlnE9cEe5hyD3NqsyuatJtB2dJ7B5tucHUGGD84fDZUmyFCCgU/5XWpGTfr6zBdwCDTlAQl172eSR4woGD26SHv2i7DpPRT4L8qks67p0BRJGO5fT9zPwL/VmPa3RHOfvVtW93IW1nUq+t4ZjDFBLkKskC9Mj3dMQjiw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=E9qtTZQ4; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=E9qtTZQ4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHFkF6gzsz30GV
	for <openbmc@lists.ozlabs.org>; Wed, 11 Jun 2025 16:14:45 +1000 (AEST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a4ef05f631so25000f8f.3
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 23:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622483; x=1750227283; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsgXI4B2PtLxGVvjlo+6E+TN7UEoR/brseumFotN0IU=;
        b=E9qtTZQ44uGeF4eKS64P36Eo/6k7ECIEiy8FG8lEWFlMhS6abe4AQLJNle2f/I8BtJ
         DP8dhLw8maf+A38eM9I9IBfYsNT5AS0SF/ANitzTdm0+vRCKJKGuv0oDWc8WHZNx6bxq
         yObEprjqoNaAWQ7vsXWsk5Ok7rLNjnMO2DWt+N8AdBAxOKri7QKG88tyrxevElA1+97f
         4SstQF5GuZKLa/4LVhdZl77sjYABb95cYVYGjycPkdDGx/wWO5VaTM1qXWfMp9HLCkgY
         DD9z+X/wqzAJ9RrohmyJ00DzMESmAAlXlXK6WRpx1av19Dyd+P7ukwTDPuMc3fIKqi0z
         ppPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622483; x=1750227283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hsgXI4B2PtLxGVvjlo+6E+TN7UEoR/brseumFotN0IU=;
        b=ksYwEh7UV8kR0JuwwdRBZjLtGQwFUIs5azqzymCDaStxBCoFlWIqRvtCxygtKvHAIk
         x5tZjh/DXzWR7e7k4Ck/ghOGaTDDUeyEo0Z5LeeVedsdPf5ICQAB0NiosVDuJKCyfg1E
         ae/3x9+QtpicgnTRAJhJrOjnT6DcfZuHbNBELSqTsCYSVgmY72BkY3+Y0iHuoh5ZQw+X
         WBrU+UTXt9Xg2NV3KoJmO5pVCY4O3fWz+Mnf3IIm5w7Rf23J+wMQcea1VEXJsHeuGJJn
         /W+O8BHy8c1an41xtj/x1W8yQ4sSPxj17g9FE1VzlCJj1lG0ZJ1CIw94FP4QXj1ztN2f
         Kk9g==
X-Forwarded-Encrypted: i=1; AJvYcCWwoMrN/vDGxJNrJK25j2Bt7MO/xKhv0UThX9pelGDpzvyyQ1k/7OQuAAis50BRevytQavvqE1c@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzGcHymKJEhURIXKVWygdKHonMmfGlzUBBWwfIFZh1vFnc/pJoL
	ETv2vY5JWrBBv4SsW4tMlvkBK84qmQzs9+12eBfpYuNAS0i7Jcc/+Ty2/6OrqySmIhc=
X-Gm-Gg: ASbGncu4bLeSCIjjtC7MBcJSOyYeSIEmQrF2AKu/TWoCIvDYJdqKf0ws3iM0BLW9dYu
	MF/ccWzxXjB+13Ej9bZ+R/PxRhhIigdJh61d8XmbEHluis0iIgILnUnhMAkjmg3N/v0OlcnXxei
	xHO8nDRmxHHyQyPVpDldynAhCku9J26FYbE6ZWGyLtiRL9Xv32/Gj1eWgYBzL7vYVUConVcvYK+
	uwcvgH9I+zl4FPk3F8qA61MLF16VEmyCpuYdooepd4eeQQddukePz5/aWqGbdubCNbJ3BV0kyII
	LAN651hgZLGth3WZH6eKMXv3Nq7yG759HQPp3Zk6t7iLn2+ikWYI3U+8PosL/Ah7vk0YPDMFM/+
	eEWxZhyc=
X-Google-Smtp-Source: AGHT+IFLtmW6b7D9+O2NLZ8hADlUJWZ1Zra0CDRSmw1bBjFKMHIhCxju9chZEeLj/rRLY7C0uzCZNw==
X-Received: by 2002:a05:6000:40c9:b0:3a5:22bb:8b41 with SMTP id ffacd0b85a97d-3a5586c6283mr512971f8f.6.1749622482841;
        Tue, 10 Jun 2025 23:14:42 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:41 +0200
Subject: [PATCH v2 09/17] pinctrl: bcm: cygnus-ns2: Move fixed assignments
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
Message-Id: <20250611-pinctrl-const-desc-v2-9-b11c1d650384@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2076;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=oujbO0vd7z9+7S7Dumee/cfvfloJlAjLJrEg6CF9wFQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6mfuZb7tQiO77XcefLLGrVblzxwrSovVkXX
 cwivTfGRymJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkepgAKCRDBN2bmhouD
 11HiD/4xfmHoNJDh/S3CTGyURdVO6HJ20Md3oC9K4sMgDqvNeAzwsNayXPh8CQBqxZrfrPtfTEe
 EKJouf9bclFwhb6t7Z+x4Es2OUbtNyIKSqtw7R3vlMtw96fS+499jkyjprTViJtSFMpSo96VYuK
 BN5NaTb+P6TYsoop5UmihTuguxkVBH8jl/aasttq5TSupl67L3T67CDxwwZ42gZT8mImJvH94aJ
 OUaV/cRxEBTcOSurX9xTvFzKS6sSdilSEQHYvTDt05U1fZ7B4FRiNdQf0zYovRIT4FQopoXPh7l
 kMW3Mx8XWrjuWUb3v55s7eohdKrymxUnopB+/tTpjd1LwdZPdVR5yLrlO8CReZHJaJ3erKp+3Fk
 sEHN3AK4RtYIjlUM+o/3V/eGhwdUqSSml3pFKNEIePrZ5SZQGzTBbjQFfBroRKa0yrKKzRvKD7z
 0wgIMguwbM8Iz6ynYPcO7YB0Ao/ugOxLGbP0PYjn94OFTWxINL5wpl+0ly+zsGAhMRxcWhmKvWS
 2ziJK2Xd8WxHchwpTv1vk2Z71cDm6mQWuzLUHbDGcbsPuKrXblGw+ujIpW4FOo/8OrhQjAXpBz+
 MHBHNsoSYjVI+Nn9wm0liTIbSji44ugG2ZEZyX2gqMIDf6qzqfrXGE4SSBlOScO/SxFfdugKToh
 vqoClCRF0JCU/og==
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


