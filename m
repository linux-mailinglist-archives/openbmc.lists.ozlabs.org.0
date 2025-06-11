Return-Path: <openbmc+bounces-172-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D0AAD6432
	for <lists+openbmc@lfdr.de>; Thu, 12 Jun 2025 02:03:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHjP05Ttdz2yhb;
	Thu, 12 Jun 2025 10:01:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::333"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749622463;
	cv=none; b=HCB5CcqcmkyOqFGdN3INBfB52F9Cy4EsiF/EzcAijr9EBaqpnOXKpk3IbiJOKW2eeIyfh/HYYotsmbldG3nSp9qGDQ0yVlu0CKFhbLWj5xO+jPecrvG96UchmVfNDp9xLJZ9Bgy8rAMsxazO5IqRkJY6ErT7tFmmdOr65EjfRPHG6UbGaLQ7EHlcB6O3cr6+UCo/LP184m8GSGzvnIU2aWcYPSXyt5R8h7QDvENNHhSNgY7E//lNn5XTf1hAemD+nckZ/tcIz9aAFNy5HGxU4/ylc8VOlWG5SY3OBqpfANNfqP6a7cF+Dg/cC55pDmXC0YZPfjtEsAjTlXYZLOAeZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749622463; c=relaxed/relaxed;
	bh=q86QDWzbyqUrHwy10F9ZLVZs4bIWtafdYZALzNzfzYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DAV6FsWEOng082N9WblhXRgAxpdUrf2Q45t1oQN9qmXpar/wWal8Rp94ShEp/X7QsFM69zws0JReKbwAzGJyI3midfRYwwyRD68t4r/sZeaTDEkeDhy7TANs8uA1ucdFustHJnp72ObHxvnFkLjkuvPjuxjUUOCn+Oy48+s91vQFjsNa4VQlTVRiGoAtAGcYIA0AGO4fPrC6Jp8zSLKSTiEiArOZ+b5r67v5a3noAPOzZqQolvnBsy0lP9Y979xyZdqtCiAHszBR3CgRfcO+3w0wtyy4/9Th6ortdF4DFETk4GURYDlifGIl8YEIa55fXc5HQab5RsVLiiT2mz2SgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UTXFGfRZ; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UTXFGfRZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHFjp3z9cz3089
	for <openbmc@lists.ozlabs.org>; Wed, 11 Jun 2025 16:14:22 +1000 (AEST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-450cfb8b335so287125e9.2
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 23:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622459; x=1750227259; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q86QDWzbyqUrHwy10F9ZLVZs4bIWtafdYZALzNzfzYA=;
        b=UTXFGfRZD/beQO79hCyKDKEMB2vOCSzA1gd8FHEnTj6F+XWpzp7xhg87UKr2QvZC9H
         AMaZjtIOCiX2+n3MJFpQtAScvrQgBnQTIyUSKiA6Y5B8/ZVaUyBDwSoA0k8oIX3hy5FS
         ji9fVxYy6QdnziAX4c477ivLKhb87mJ+Qd03CBIbpZDzIEZKOTlFob4jnI9CmOjUoX3u
         RngqxpPcRgGBUtBzyGJtpqct2ZXdhA5QB4zLGtJ/8sjR4fAE6y8XTtNuO7L0f/L4gm5m
         i+hIlsjLGEBHuSPENHOivLu17PlA40hFf63nE0ckS09hlFP4UdXVOKY0dvdkmEjtTI1c
         CyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622459; x=1750227259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q86QDWzbyqUrHwy10F9ZLVZs4bIWtafdYZALzNzfzYA=;
        b=L4UyjP6CK02fUD68nDMLGGrYbwHCO/p4zjiHPZ8RsI3X2lLE8msrFj6fmtYYae3vp+
         oEFkmizOHlfFpmX43eG8IpZn8uXYF79UCQgOjRGbu6LmPCjP6MCbZ/pe+Nz0fM4XxTuK
         Cw6wPFyF683YeS2T5i895PMpoAdUcGbCfX74m/eWmXIBnHxgxJ7+zOmKes7AbIJGsNU9
         4NJInDEgw0FfrdLFhxHbBPk1ORE9teCogjdO7R1FDrBn44jG2hVV8VgCk+vOWsLDskcg
         3Z2iZN8kRqzTs2tQ49ftN+v4DF/ZGhxXrAykwPcUOHKeZCDahqG5jSOeUBzvcbUBQhok
         BZQA==
X-Forwarded-Encrypted: i=1; AJvYcCV7h4LUpUtlFHZ9S1t2qK3VRfyrd598/+RxUQYWCc+7sywisMgOeUrkL9mLKggPTi8Dtk2xpJjA@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyp02MQ+7DwW2qxhgwImCh2SUceUJJjbiqPa3Nrh3MyoCHHonrr
	ndqgAs0lXMT+ZfYEfgwJg9WgGrQTOvPTcagbeRmSoZ+cRSUUJJAAqcZmbQo7qwG8BCU=
X-Gm-Gg: ASbGnctcKZ3HwhFv3Ix49xah4ZFSOjbYjbY6GZbOdb5TjSO7TUajEaU8gxDDZvih7NP
	OCZ2oI82pDRwhCZsJwTimBdCLXSwFBi7Q5PU7cbm1Qjuu0MbDiX670dyjS397IuJ+h+MZUv0iTp
	/DdZnIWlabgauDtGTGkygr5fzh0NIRYyIl3sXJvsmQTTpzc93ksomvsQsqIG5rsYZu8fDS1x2N8
	3p8dHtc4R8//Gb1JDb7QGDNmJ0chn5clJ/udCUl9jKOEW819qw4TZC5bBhRWqhKIQOGkLysz3LL
	9ffMSvWmatDP/VGdLP5I+qTi2TbdEFIpwlmomGRZiYg2dJOQ3XKAhly01UFiOfAA7v02poOvc03
	7BdfLp18=
X-Google-Smtp-Source: AGHT+IG0MrurMqwANRNDslKVkh3dKprU9y6IrTQpViebfAkp6mB1Umn/L5OKQlg735b88DTWJ/T9nQ==
X-Received: by 2002:a05:6000:288e:b0:3a5:2dae:970f with SMTP id ffacd0b85a97d-3a558821396mr547873f8f.13.1749622459437;
        Tue, 10 Jun 2025 23:14:19 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:35 +0200
Subject: [PATCH v2 03/17] pinctrl: amd: Constify pointers to 'pinctrl_desc'
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
Message-Id: <20250611-pinctrl-const-desc-v2-3-b11c1d650384@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2097;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NNpY2A6LBp263syvyG1Ecsfx8CioM309dnOrlcmWHKA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6hdhqC2eDe217cvGUZMEh1W/4vld1oNnYW+
 YkZbRVX0u6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkeoQAKCRDBN2bmhouD
 15CoD/4hfYjkCZdVyazNq2ibT7AGxKu+nI1YPoMthyyZMz5plU+l+nNgmymy2NyhFPLVlkvCK4A
 4FsvS1iJn3Dkr+y2bC4QBIUT6dXj23C/I9Y+3v2Xg6Hx56dWfC6oNqEvF+rYuLqoJpq7A4T3RPj
 11snIaP0e4JrVwiKZh0u+TcJM7WOVXMiQmX60PHyUR1rnzJ8HXuhCqTtE+RTBK6gIjHFzZGp5L9
 q8UgvNJTUf5z2aiIeb1m20vw8f+zaUsHEVTBA5pQfrzaP3VRCuXmtWb9nRDuE1Q5btLjbaAmtiG
 9eaROFIx5bFOf+Sg9Ok9Gj2Q10AZYnHmnkoy4IqVI6kGx30tO/SVz/T3rgjNol+hXAQHI1hLcmk
 XVGVC16NfQipwhxK+aPcl2ywGautuFcWgIHKgPcVZZENQIcSUvtYzB18VACNwO+5ipDcASefqro
 QFP3fiWL3DaMswdeQCBUr36ds+srNu1ED0hRChkBFVsv/mKeJCXpoy9aEwWCSVtFi89Zld0QFFX
 MVKlitmuZXfSPnxmXiQaGaYXstF+0Fj4VHKYg2U27Irx1aunnaZdNwgPgX5pSPhe9Y4xoUm0xrm
 2HtZbv19j2BQ7vx/8hkKMv2025M8QDoGlqAB55eUy1ppAZx8gZ1ZQyAOOBIcShwwTyUgeLGvELM
 hElg3VcQFmHOyDg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Internal functions obtaining pointers to 'struct pinctrl_desc' do not
modify the contents so they can be made pointers to const.  This makes
code safer, explicit and later allows constifying 'pinctrl_desc' in
pinctrl core code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/pinctrl-amd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 5cf3db6d78b79af9ac5e7226de239a0d2f9aaacc..85617cfed2299e131c110e9d4084370790106404 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -872,7 +872,7 @@ static const struct pinconf_ops amd_pinconf_ops = {
 
 static void amd_gpio_irq_init(struct amd_gpio *gpio_dev)
 {
-	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	const struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
 	unsigned long flags;
 	u32 pin_reg, mask;
 	int i;
@@ -901,7 +901,7 @@ static void amd_gpio_irq_init(struct amd_gpio *gpio_dev)
 static void amd_gpio_check_pending(void)
 {
 	struct amd_gpio *gpio_dev = pinctrl_dev;
-	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	const struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
 	int i;
 
 	if (!pm_debug_messages_on)
@@ -957,7 +957,7 @@ static bool amd_gpio_should_save(struct amd_gpio *gpio_dev, unsigned int pin)
 static int amd_gpio_suspend_hibernate_common(struct device *dev, bool is_suspend)
 {
 	struct amd_gpio *gpio_dev = dev_get_drvdata(dev);
-	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	const struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
 	unsigned long flags;
 	int i;
 	u32 wake_mask = is_suspend ? WAKE_SOURCE_SUSPEND : WAKE_SOURCE_HIBERNATE;
@@ -1001,7 +1001,7 @@ static int amd_gpio_hibernate(struct device *dev)
 static int amd_gpio_resume(struct device *dev)
 {
 	struct amd_gpio *gpio_dev = dev_get_drvdata(dev);
-	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	const struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
 	unsigned long flags;
 	int i;
 

-- 
2.45.2


