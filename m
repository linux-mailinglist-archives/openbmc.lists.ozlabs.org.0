Return-Path: <openbmc+bounces-164-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7623AD641B
	for <lists+openbmc@lfdr.de>; Thu, 12 Jun 2025 02:01:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHjNs5fqwz2yRD;
	Thu, 12 Jun 2025 10:01:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::435"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749622460;
	cv=none; b=NfSKcwkScfY8jyWWISey5RzKydPhyluKhUrIO0YR6thvHnnumH6jVbO1q9hg5XznPEZwgT5a0/ugHhyEVurQJB7cDx3hKUJjQ5Vo6Ul8pV7fnBuB6dPTxEwTGSp1EWSPOQghv/+1AnWKyQ1bnSOa50Cl4atvVtoRoPOmYYdiJm2b4YReMM/t8gEOWPBG6mnH/DpnB+LF6N8kON2eMXemPAH1BYXh1QcT91WuuTI3JBg0gbmsfDU0LbpN0TogOQFZWkLoVTGDs0J3ixgaTgiEWWMPqMZLSCMGnQutbrIi7YfVpw1IuEPHmopRXXzt7iolb1GCS6PzIaa9DkMsv6tA4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749622460; c=relaxed/relaxed;
	bh=LmGTr9Avtp+9E1jrxJpsP4+QY45B/matmjkDOASukCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Se05cg0NSt+fTLfGxIL4djh7b8fELsz4PSN6H+9sXizXmxJE5q63QaIql9ugidDMWgQ88qJO0NSTzILT5iOyU3Zoxvz7OjxcIAWuNUIxdYS1zLBudLrItpRDXFYIPHcNCveet8b2f1GySX8KZo9SdmIs1ZCwTjc7636EBLjRMaFSovoD5I5KVWniM5YIPinoDDEzZ8kTI6+Sp73wJ+VQxj8IUe0T39xzjNimUE1XXeckiPEAcagg9BlvwXKzFWPRtarF/z+UInR6wkDcmBfqyf+85IU4KJgZFMHwt0hXgq+cU60AipMMN79lMU0Re2F690LJRogH4jjvGjMUp4hx6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qsFH/z8H; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qsFH/z8H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHFjl1Sw9z3089
	for <openbmc@lists.ozlabs.org>; Wed, 11 Jun 2025 16:14:19 +1000 (AEST)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a528e301b0so26325f8f.1
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 23:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622456; x=1750227256; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LmGTr9Avtp+9E1jrxJpsP4+QY45B/matmjkDOASukCY=;
        b=qsFH/z8HQNfdCDRygEJhHmSCineVz+3MVts7gSU382cva1lvApXtZcS++N2XmrWQL2
         VX6QmMH9Kca5KRmkFdBM1tjrZlbVeSNoiKC6ts9F+WZjOtDW3d5vPco1Pb6XsBb/f16H
         2eW0ds+qAJgTXujsVEB8IUP69yHuM+P/LIrEO+8GK0lLXq/Vmd2d4D9hixsX26flsLpZ
         lYLO+rr9tOc4ewLD/9x5onKgwca75nmmpsAolFzrbERrIrHsZpmjZg1rdqdLLPaWCzQW
         JD80tR69f78aKWyqkz6Hh8GEGcw0wg1//Ma4Fb3gIMZ8QaRIZsMNy/ua3pPAMzvCbt1S
         9wIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622456; x=1750227256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LmGTr9Avtp+9E1jrxJpsP4+QY45B/matmjkDOASukCY=;
        b=gtKlEAGlPDxoEf0ySwt4JnWSrDUcNV0RJTZu8sH1ZJ2DGCDgpbPidOhNvAOOTTdupf
         mqONPvxvV1yhM4fpoxa8JReSUMpcVzyIceMfvBcT9SBjxv2vGgP0H+V7YVOxttkvl6e6
         C4MhpNbNd23s4RXHM1pxMVWHVyLPx1A/TQUHBMHB5u9FuGa56cP+EuagcNe/cSUk3a9d
         H7Ajhflybd3ZKEx3QQr1QnXVSUcsOqOZeBCrspxKi9pXnFJLH1Tv5Dzcz3xP7+mieMDf
         jpEfXuFe7qR7PAdiBWJYsv6a7VMc1wGsFypHeG9DkelxhGzqhy2Lp5iJlFRbkYWuBmgZ
         F0JQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0Mr2ABg3y28F1RYjjaKvEueztoULxIPs/As1a/evzZATOeFzqj9HcW8wEPjdIZPn+HVfxCxi5@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwPcQjcp1GNNRI/O0g6vj43LRuFk3USCAu0WLekEmc/U+2PEul6
	iCc1CTngvRWQrdD4dXWMSq6+bcC88Uy1Oio9Wo/EoXXYNO+RMzhVBNdoT06pEtUZJw4=
X-Gm-Gg: ASbGncu1Lxv/qy6ZiAo23x2kiVLCcSkD8Mjr5AhesZPOvQG1qzIbJAkmge+JWbvovWk
	e3zL1GCwaHeKWbE87HAX7Km0v40IsPnama7Qoou9ZGOYd3TLjqFXuhMZ7/azoaoGv1RdLbTuz6I
	CMMuPRfpOnEWei4JqvEWwQvcnAtxMMwjwFpmqyL/xdU33lxtsgBFCg3yzbuywFyMF94pG28S4Ka
	a8FUjNf2IallITfgrZtB6lu/su7SrhXWANGDbLSNJoZU26ZC3cMNBoFQ2qT2EcIJGRJYBYfrCeg
	im6GrwoHfHJ7IMGBJQfUMUAjgEO5DommTm7ihraAZp76Zla6uFwAMXv0YTKi00dNKMAXowVTvP6
	FZ1Yr9SA=
X-Google-Smtp-Source: AGHT+IGuARTYLyF3UiF9reCUirhd/Exv3gey0a/FHP4hXPUPwwAH7XeVaLmvzmzisoq7vXGGNYY6fw==
X-Received: by 2002:a05:6000:4205:b0:3a3:7be3:d0f3 with SMTP id ffacd0b85a97d-3a558820e34mr451650f8f.14.1749622456103;
        Tue, 10 Jun 2025 23:14:16 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:34 +0200
Subject: [PATCH v2 02/17] pinctrl: Allow compile testing for K210, TB10X
 and ZYNQ
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
Message-Id: <20250611-pinctrl-const-desc-v2-2-b11c1d650384@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1377;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=uGHDfIA31YKh5ahk8efaA6IVYuJLI6m+zDCouPPq644=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6g8xxyHU0HpiCDaPmzEcUGbG3i/Yo/YG0Wn
 7rcaYbUuOCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkeoAAKCRDBN2bmhouD
 15vZEACL9S/hnI46RCXgnSdsn6o+epweo7vg2Ve0a0tgPgDpJPr9sxin7UVOYpBd9VSMJJQoLLF
 aeqFMhIemW0RcumAWboyA4gfV7dVt4MPt/v++UUEhPUE9TwivxEkN5kMfkB1dRF4+MjSjHDuvGC
 ZPBUhFjQCXOgwCVHKydx8vmuJV0CXug08L0YllTPL8pXovkyewDPdTKqQaFhukVSfPcO9IOAgtx
 M5yXLQe29xMW0Qyyul/SVfUXoGYtMZqzVJ6W6dzSnw0YNlMlEQg2zyirVpJ5F+/OHhCzmyC/8hL
 vY3Rtcjw+MHY8cI42dcQDzeoAKALlg2/hy1crOMdKh8wSr6O6LFk7rAOTcWChL14XAoUvJpX+zd
 r0YhSuMLTab6mVHTRRgnXKL1v2XuGeY/7QwPQxo0jcTZpaoreoReVm+cJ1biQiLJhRB30IaCe1g
 tpwj/e5Occ6qRtXtGh73XlrINYyxw5OzGdzDUiTSx1Bd8fBfKqn1ojFrBZU6c0EfEOEodfM1L3V
 sIrLevCzW4HtOtGrGg1HFUXnHrJ5DdHAsk/NQrAi6Yy0jFf+hLnI1SRhJfuSoGrStvp5Z4M4RDJ
 lCsyjBjzLRgK6m8GXnTUqaoCeXd9zcxJxwOmrrtEsnEGDuREqGFpURGacr7KDtTH88JLMKCC9g1
 C5kgftvilxEQjiA==
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
 drivers/pinctrl/Kconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index eb1b37af81fb81175d22018cf4856bfafaea75db..9b93a11c5755d5e1b239b34d5d66d5717b281265 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -269,7 +269,8 @@ config PINCTRL_INGENIC
 
 config PINCTRL_K210
 	bool "Pinctrl driver for the Canaan Kendryte K210 SoC"
-	depends on RISCV && SOC_CANAAN_K210 && OF
+	depends on RISCV && SOC_CANAAN_K210 || COMPILE_TEST
+	depends on OF
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
 	select GPIOLIB
@@ -554,8 +555,8 @@ config PINCTRL_SX150X
 	  - 16 bits: sx1509q, sx1506q
 
 config PINCTRL_TB10X
-	bool
-	depends on OF && ARC_PLAT_TB10X
+	bool "Pinctrl for TB10X" if COMPILE_TEST
+	depends on OF && ARC_PLAT_TB10X || COMPILE_TEST
 	select GPIOLIB
 
 config PINCTRL_TPS6594
@@ -590,7 +591,7 @@ config PINCTRL_TH1520
 
 config PINCTRL_ZYNQ
 	bool "Pinctrl driver for Xilinx Zynq"
-	depends on ARCH_ZYNQ
+	depends on ARCH_ZYNQ || COMPILE_TEST
 	select PINMUX
 	select GENERIC_PINCONF
 	help

-- 
2.45.2


