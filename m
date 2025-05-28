Return-Path: <openbmc+bounces-93-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D26AC750A
	for <lists+openbmc@lfdr.de>; Thu, 29 May 2025 02:20:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b76Ns2kQ0z2yys;
	Thu, 29 May 2025 10:16:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748428902;
	cv=none; b=AfTlxb86k+wUGmxJcjnvLupnrLFvzqUba9XIBiP6yQj/8Y80FfeIwxZTcH0LQKzr8IyVZpVNjMxuku8uK50zL0sPmXW5yi5Wvkx8f1Dr5upJMxFmIQzuqgIMqVwRWicKKtaaD/ynUwyDDFIe2ih5KAk0ASUusD0ZXM86NR0BXFAtRZskyuPXmbCFUXBnU5Meibrq1GX1Ibu1hO1zoC+ggDxQ/x3ACwSQFo1ttuPeYkYZsELnl00XlVwmQ/y/BEWIBt/jm3JdpY0yD16qdnDks/1EHlF19CNrzAMmgekpsjhXvIQgMrl/bQELNe36ANqeDW090XtSIQxWNlW7yPvCeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748428902; c=relaxed/relaxed;
	bh=5o7kHuq5fh1nhgrBmbItAcmZQfVjyPSWaEBF50baGeo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gTZGOCG9xHPF7jkhKITgtELy1mzhKft5SJ/4B0bc+oUnJOkQN2eg8Grn8yc2px2F7xZSatci62lcy2NTVgM+C0A3/h9Qq7ZoStW3zDtdFF/Jfy6KJ9X0OkaXB77wu5A/imSPgsXGdwubisSCK/W/FPeZjxbcn8BO7tqIaoWQFBaT0nCKsq2LmeVWEqnyamgd5DrmL/y0kBFJZRcswizQJQVHp6NlCtZ+fKpLoVagSOBMZ59+5++AMMZ7tFMeKHadxCRaSaOo1xJXSdL5HPp7wW00rEZynd2cTRwwSdwRFdVfdE/LGyLbDKMf0e3qM7ll9Pb0EgKOmuBopO0OeW0uyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=s9OFVODd; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=s9OFVODd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6mJh6j01z2yWK
	for <openbmc@lists.ozlabs.org>; Wed, 28 May 2025 20:41:40 +1000 (AEST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso5069015e9.2
        for <openbmc@lists.ozlabs.org>; Wed, 28 May 2025 03:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428898; x=1749033698; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5o7kHuq5fh1nhgrBmbItAcmZQfVjyPSWaEBF50baGeo=;
        b=s9OFVODdnqKmToejciCXJc3zqH8frIHJoBVhWVEe/PAAQZIhB1/ZCcbq3MCMsWQ5Ia
         mBlgZboN/GeDJdyoEbX+fx65Yy8L74pA9Togxohy4erFHmXFLFnyu0C94myEM4dWe81j
         oJD9izo7kxJCmkHc8MpUetL+dRH+d7yCuATWi9zxlqMlRxowNTml7zaz7rsYESjEpCIq
         aSBzkEcrFSUEZPU414edQ8Eq+KRp1namnC2Xbr4ZVTCrYmgau0c2Tr2S6xApRqIFSDUS
         z2aXyPXv6OzOJk1+9BSePJQIwPBSTu0wN6ESEoB+dRx/UhC2EM5lBjT/e9BzwCT8mYwo
         LKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428898; x=1749033698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5o7kHuq5fh1nhgrBmbItAcmZQfVjyPSWaEBF50baGeo=;
        b=pnlBqnDH+1J7hinSoMi2Ci8jNKt7lcX9qX834CaqBL/7iY+fB3vjUTJnz7kUCHxdwo
         L0Pwg5z+iEgYlPtbZxXeQtiywLTbM0sOx67iC3tt/39jbL3yL3Z2dM64KhvFI2Tnu+0U
         Fk7jfJ0MSsI7mx1TapLz3z63dNePg9yLSETY+3gXEv4GHC6DxsScJ2sAiwiZ9kqd7RJ/
         c5LDUPxxBPwtLRyu7LJasOavu9LcFGbdqO7qr7/ItBC3gFnPOVYWKselV/C3PLlaToMT
         6r/Gp+XhZgS5KuVRNkCsfGDip77jlWSNd0iZs1QUVHZ4LY/yfuFMEWsy1UL2syNQZuUj
         qHuA==
X-Forwarded-Encrypted: i=1; AJvYcCVpDZwWfJpJlCxxct7yHxQEer/p3/8YArBrsii1jZnU4PN8HYFdV17wUG35mPUgM3y1cveCVyXL@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyZaRA+Zv/hyGj0KyR/laeEkc+lu97c/z6hqz68jF6iQUMlPN3V
	O1a62Shnytewx2PEwlvXzEHomPqg7+C0Wtphx/+AR4cXOguA55KcVZqtAjAhtGPA+bE=
X-Gm-Gg: ASbGnctV9MNJolLNEUoi57+MJx9vMrKpFqUkzcM6OWmqU4yAjVwcYS0R9XD4rHcgCgb
	LPr94F1q7uRGCnh6BtVNmzD9ChzNsghvDm3EUYzjuCoc/WH2Hsnv9rIDmvrfdH4DV6gpG/c13/a
	OFUdv9pNwcEjLiCwxRyJnIVPkH9bnUfp4IeGzKy42hKrtQ2uLaQn7lKJdWzFLABJvbbZWDHm5BU
	ZGzOR52hVAPp1GHp3xpVhKXMRn21RJG3OuNTSw4i21eip+yK0FJ8sM/qz+S+p1/jw9f0nK21IAt
	abnnd36+E/htOhIPK2PJ92y21Tr/lLd1qh2s131sMLiTlZfKk2QmdtOMuyI1H5eF3sw0NxM=
X-Google-Smtp-Source: AGHT+IEqdF3+R9PvjaaVFg6PDyOWyRZc3HR0H7gqLL2irDsUydaByqxkZ9IUn5cux0xSEgLuwczlgg==
X-Received: by 2002:a05:600c:45ce:b0:43b:c938:1d0e with SMTP id 5b1f17b1804b1-44fcb9e409dmr26120075e9.2.1748428898180;
        Wed, 28 May 2025 03:41:38 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:41:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:40:58 +0200
Subject: [PATCH 02/17] pinctrl: Allow compile testing for K210, TB10X and
 ZYNQ
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
Message-Id: <20250528-pinctrl-const-desc-v1-2-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ctLoeYbHiiEBT9tiXppJUMjUFh7QHQFzP0xX2rdTSyo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhKnpMXQJB0a7WYDcwZWwHu8C1P+bTuhMNNC
 +EXWDs6a8+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboSgAKCRDBN2bmhouD
 11VaD/9bw31tjR68bxVpvaTyp/6cSym928yjCV9vR7oyl3BoFzh4W/a+7D30PLrsKSbtBC0J/LD
 ZSkuCuQRCTdT/n3XZG0T+ABgncoGE8an/aWUK1QeNySdpFSaEb5IitD03FUnLNTrxbziwX2OSOt
 6Z8A1nYodGD43IqazDQ2Xa7koDf9waLjKZ4MmbB8/+UkbSkzvm0UwGsFauOIvDrdj5PPraBwoo0
 W1X4sxPqQbmIu/4DVRh6oGcHsCwbTyAArmCXRUGcCavGlYBMYD0sfBZ14yAoyXbd+TywqhMmceW
 Tgtkyg/cXJ8JinZQIyzaHGnbQKLMukCGj+sTXlEyYG54GXhLmH3szir1Zsww23gOCwDK/qdnObe
 c/31A7IEOIftcgkxejUbOr2hcAttBy7peOBZmeIe2iHS2xV/0B3z4DN69SNuH7YSD06YPSnBrgv
 BPRrGVkzC6QpojpzpZYG1rdP1Mov2N6Xb6lFueCWghnaWhmNte0hYDoOi3sHyHcLTY1RBqCyKVb
 ghPKA7ZSaMhuw3XFjrTUOHMhvO/Qxo44gHjL9XbyoHVDmw2vtEczKKN6madwPnMdoxroiO8Szan
 PthWKLwLidRlevSuV3zpMfPWxCO8gOal4o4jOif7BkNZmL0L1ELFxabGoZqrimpzXrW9si4MeWO
 jCjZimWjAIxLjVg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Pinctrl drivers for K210, TB10X and ZYNQ do not reference any machine
headers, thus can be compile tested for increased build coverage.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 33db9104df178e5a3148b60c3c6bd153113385d3..77a5d13e899f8c5251987c2c74df1d05dbd59128 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -269,7 +269,7 @@ config PINCTRL_INGENIC
 
 config PINCTRL_K210
 	bool "Pinctrl driver for the Canaan Kendryte K210 SoC"
-	depends on RISCV && SOC_CANAAN_K210 && OF
+	depends on RISCV && SOC_CANAAN_K210 && OF || COMPILE_TEST
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
 	select GPIOLIB
@@ -554,8 +554,8 @@ config PINCTRL_SX150X
 	  - 16 bits: sx1509q, sx1506q
 
 config PINCTRL_TB10X
-	bool
-	depends on OF && ARC_PLAT_TB10X
+	bool "Pinctrl for TB10X" if COMPILE_TEST
+	depends on OF && ARC_PLAT_TB10X || COMPILE_TEST
 	select GPIOLIB
 
 config PINCTRL_TPS6594
@@ -590,7 +590,7 @@ config PINCTRL_TH1520
 
 config PINCTRL_ZYNQ
 	bool "Pinctrl driver for Xilinx Zynq"
-	depends on ARCH_ZYNQ
+	depends on ARCH_ZYNQ || COMPILE_TEST
 	select PINMUX
 	select GENERIC_PINCONF
 	help

-- 
2.45.2


