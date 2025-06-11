Return-Path: <openbmc+bounces-173-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 708AAAD6435
	for <lists+openbmc@lfdr.de>; Thu, 12 Jun 2025 02:03:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHjP116FQz3bgn;
	Thu, 12 Jun 2025 10:01:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749622467;
	cv=none; b=HNp0JGKVEsTfnuRgTK3DKUsJSTUnTPjV3x6Y8wd4lLlsgviM2JcVMYOFH0gycB8rHwSrZBQz3ft/yCbPC6dhpFVvuuqo+7HAwvCWKNCK3iGaczFnRVYINRElEkCUYGojWBSqN4VpJ5RAFK16fsBFC4DBfWqIe8xWWZlaijWEPFd9VsFHL5bbR4jj9Z2QFpuXRQMW7ZDSihpdESobCD5Pj1dH6nLphpe7qN1xKPdT4U9PmxAjYyocTW6VHEjVk9EnDebuwszd3KAQ52I7lfbLpJi3FjXTYthrSiJ6A7UjI2H5g+C/g5B45ilyrS0iwv8KTOQKUVZm363vzsuJ28JeTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749622467; c=relaxed/relaxed;
	bh=ecu8yupT+rCBH08RZ8e0dqpuzlN5xMN0SV7HkCMJ9k8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lu4xmTvGxH3gLOEbmPQyqhj1Pr89tyOrbSyJXhThKUiWteu3IaCo2oL0fe2hX3WaApTunCnBchJAHXevbQ5G0byc9MPRhTkKBCBSNymap0RmcRE0shhm+GkO4aj4VXl9MvipxXJHC7IyyNE4NnQZn1TG8B/MBi7PVtYJtDTRMY/2DfCm6jmU9kLYiGn+P4DoHFo+V270py12NrCzlNujNb23usk0u6jubfdk30EWRY9CfnZb/PtvZgLJFT4Es3lBDCkR4CQwMmpfJcYAmoAoLm1/8ysQ4zgna9V5KGdZgJKQ9gExKx1HlqDtcavV95t7h2KUdgh5fkxSnfz75+Dzsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=D4CcxYms; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=D4CcxYms;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHFjs6xQmz307q
	for <openbmc@lists.ozlabs.org>; Wed, 11 Jun 2025 16:14:25 +1000 (AEST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4519dd6523dso409505e9.1
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 23:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622463; x=1750227263; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ecu8yupT+rCBH08RZ8e0dqpuzlN5xMN0SV7HkCMJ9k8=;
        b=D4CcxYmsBkUOO2BeLw6oCDwFb39huS+xLadFWLMy6S7uXZtU7uU1/qOoSONpG/aDKw
         NI2yHVpYUzEohMm9edRB6MK15EkwnKXeI4NCcazCpLf6cN4L+X5Kak8efEkrh8gXf8He
         lBZoTtBWt93ihNWEnsVqcppCeU84g6CT9ziKSUrpIZnaqnZi7D1OY8bb6/TmdDo6zpqe
         nASYFsgTGNViCToPzkuoBywE/8D/rR/6O9+68wTNi9EGethdAZFirTK3UeKYPCTeC6P9
         mBB0jm/USLxoUtESd0WDcKk36NxMouVJDgurc1AVJf8ZiA32Cw7TC+HNxgoZOcMgwTkk
         dVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622463; x=1750227263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ecu8yupT+rCBH08RZ8e0dqpuzlN5xMN0SV7HkCMJ9k8=;
        b=Xioxb/vDW8G1sv8r/5UeL9IiGoJIT4TqWhiyc2DulY2f3/FmxcOppMSS2kNv9/2gsc
         bV/T9Vq7ydPUv1xGIX7ebssQp5JdDQqx5dq0xyWFuuBAHKxQJi5yuDl2fGsWfgJqtsTH
         WbuZJG/WdZagM3sCrTqHOwA1HJQDBEmrEuHYPRAy5LPJxT4upO2ADtrmBgGyodh2NEm1
         /x5PiIR+G4w3vSHCoXShYKNVrgg68/ifeKC6JsFgb/w7eUiwVP9wLLaG/DAM6DgIXZWS
         sxl8QJto3kuA/vzzPE6YnZjF66++XO++RVSa1DnsnGt5iUGM5vIp02llF1ej4X2/TDad
         D5hw==
X-Forwarded-Encrypted: i=1; AJvYcCUn+aA5XNBE2n4vKBbQcWilTfWbCSJnNsWuNS70shIddVOQPye8Qt4YnWgCnEdfYtVCF3JL7Mq+@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxGFTf8tBULpaGdNr3QW47ZOcTstukQ7NYOqs1m9kH3L710IZtJ
	dYcdBGa+ENZleDEk40tFfMtcbIgizbrMZopOHylI/m3W+ZB1qAmH3BlyVRCMnNBwYyo=
X-Gm-Gg: ASbGncv4i751w5EOKznprriE6yQhYVq+peknP3chjuJisPHmVeo6LIfg4cJtR60Z8L+
	E8AIQrE0+KbJX97qVqrytH/V9FMKVvGZ8lg+K6rU54W5IdYK2YnlXnUDACXK2PJItuDZQOypuYG
	berJ8lYbnZ+7cyfo/6Iy2EssIgVJ5dKzUTc/p2pTUuY7qWnIZm+IedEQZKBslCEBJHnywHvR069
	Kx3QwvUcUAKnABPFkJ/WCxlES92hg3EKicwPjMA2g71Ta166a0SgZje+IH2ExZrCYZaOtWzJJDv
	nmOsKakwrnKyCQ0b3s9Wyo2LG+DZ7XvZFsnjikWSy+Wt1MHq/o8MsYoTMr/MjTPC6bVq3qq/eNV
	zGA+v8s8=
X-Google-Smtp-Source: AGHT+IFfJgestylyWWTFhvNWZXRgEjP+auivw4jI2Dh1LfZu2fjTV+4EOE/BFvcRpTxAjjUQnLhlFQ==
X-Received: by 2002:a05:6000:2088:b0:3a4:d4a0:1315 with SMTP id ffacd0b85a97d-3a5586c59cfmr506452f8f.6.1749622462916;
        Tue, 10 Jun 2025 23:14:22 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:36 +0200
Subject: [PATCH v2 04/17] pinctrl: Constify pointers to 'pinctrl_desc'
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
Message-Id: <20250611-pinctrl-const-desc-v2-4-b11c1d650384@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5356;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nR+2FS8PYTwR5NQQoTqx9iHRdQvo+vV4Iua6AqxT5Nc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6ikhHWTfLaUx53ErHmCNvMDtuwZ6lVKR4RR
 0yG94URNwGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkeogAKCRDBN2bmhouD
 13d1D/0cTiL0nPIVc59aoSJVwhVV3NR69H2ygZw5k+q2RV7dSayB/i8dGfZgnZHJiG21q1xVLex
 vusrPMcisMsjokc7a7W0t0dTxxM8FS11ivjQfeWUutmL7xCo9FjTJC35TamPh/eTK3IbJyVpVEv
 DQ42DQ7ogisRRN8V0a7C5F62h9jU8rsNRdRWMfEAVoIWlaRQKdFms4jjazFWDVtLpIWq8WRZq9L
 gF5gELsOUj8CT8CYb8R+FoPrSvCtU+A4O4EXwm5TdHORWpbU95IfR20Av1HUyK7tad6COn3Jmwi
 3Qq8ZVpD0rdjEmlLZ+HIwdVO/CBSMjGTkQCcycSK4I47cc22MDLVQdsTesZpi6d1xdninpaaX7L
 PoOfudghYpHzaziiwHv7cgMyr7WARCnREfTLLqOYjgxbklA7EvXpIkQ9VmFmEedee/wp3Mq6sTT
 kyIhkCXj/eanf82v/IOnh9Fp6IThWVBU6RGuCWS0bepidD+XYDMj01M4a6petC2k2iNg8q331wq
 U0NPQBNuLmfidJTf/A0acOYAvSw33H2S1crIvjNMY3KJ4kfiWeNpLYeFPaCebi0ig6NZxukpRa1
 RiMOrWRAyJmV2ZuPSLFvbxxocjhYKp3U4q+/f5tMjHmqP5tB0i3qvrjO7khJC5XWUoZllIcX3lX
 wmRssquEAgIJxkw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Pin controller core code only stores the pointer to
'struct pinctrl_desc' and does not modify it anywhere.  The pointer can
be changed to pointer to const which makes the code safer, explicit and
later allows constifying 'pinctrl_desc' allocations in individual
drivers.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

This is the pre-requisite patch for all further patches.
---
 drivers/pinctrl/core.c          | 13 +++++++------
 drivers/pinctrl/core.h          |  2 +-
 include/linux/pinctrl/pinctrl.h |  8 ++++----
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 9046292d1360218bc70eff418fb8d1028c22b11a..73b78d6eac672095c8556763af1744be6f558501 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -2062,7 +2062,7 @@ static int pinctrl_check_ops(struct pinctrl_dev *pctldev)
  * @driver_data: private pin controller data for this pin controller
  */
 static struct pinctrl_dev *
-pinctrl_init_controller(struct pinctrl_desc *pctldesc, struct device *dev,
+pinctrl_init_controller(const struct pinctrl_desc *pctldesc, struct device *dev,
 			void *driver_data)
 {
 	struct pinctrl_dev *pctldev;
@@ -2132,7 +2132,8 @@ pinctrl_init_controller(struct pinctrl_desc *pctldesc, struct device *dev,
 	return ERR_PTR(ret);
 }
 
-static void pinctrl_uninit_controller(struct pinctrl_dev *pctldev, struct pinctrl_desc *pctldesc)
+static void pinctrl_uninit_controller(struct pinctrl_dev *pctldev,
+				      const struct pinctrl_desc *pctldesc)
 {
 	pinctrl_free_pindescs(pctldev, pctldesc->pins,
 			      pctldesc->npins);
@@ -2209,7 +2210,7 @@ EXPORT_SYMBOL_GPL(pinctrl_enable);
  * struct pinctrl_dev handle. To avoid issues later on, please use the
  * new pinctrl_register_and_init() below instead.
  */
-struct pinctrl_dev *pinctrl_register(struct pinctrl_desc *pctldesc,
+struct pinctrl_dev *pinctrl_register(const struct pinctrl_desc *pctldesc,
 				    struct device *dev, void *driver_data)
 {
 	struct pinctrl_dev *pctldev;
@@ -2239,7 +2240,7 @@ EXPORT_SYMBOL_GPL(pinctrl_register);
  * Note that pinctrl_enable() still needs to be manually called after
  * this once the driver is ready.
  */
-int pinctrl_register_and_init(struct pinctrl_desc *pctldesc,
+int pinctrl_register_and_init(const struct pinctrl_desc *pctldesc,
 			      struct device *dev, void *driver_data,
 			      struct pinctrl_dev **pctldev)
 {
@@ -2330,7 +2331,7 @@ static int devm_pinctrl_dev_match(struct device *dev, void *res, void *data)
  * The pinctrl device will be automatically released when the device is unbound.
  */
 struct pinctrl_dev *devm_pinctrl_register(struct device *dev,
-					  struct pinctrl_desc *pctldesc,
+					  const struct pinctrl_desc *pctldesc,
 					  void *driver_data)
 {
 	struct pinctrl_dev **ptr, *pctldev;
@@ -2364,7 +2365,7 @@ EXPORT_SYMBOL_GPL(devm_pinctrl_register);
  * The pinctrl device will be automatically released when the device is unbound.
  */
 int devm_pinctrl_register_and_init(struct device *dev,
-				   struct pinctrl_desc *pctldesc,
+				   const struct pinctrl_desc *pctldesc,
 				   void *driver_data,
 				   struct pinctrl_dev **pctldev)
 {
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index d6c24978e7081a663b8a0fa6cb9314670575b1bc..fc513a9cdd4f2f9dd4ec4a088eee53fdbd673285 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -51,7 +51,7 @@ struct pinctrl_state;
  */
 struct pinctrl_dev {
 	struct list_head node;
-	struct pinctrl_desc *desc;
+	const struct pinctrl_desc *desc;
 	struct radix_tree_root pin_desc_tree;
 #ifdef CONFIG_GENERIC_PINCTRL_GROUPS
 	struct radix_tree_root pin_group_tree;
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index 9a8189ffd0f2c28c88640280deee194d17d18400..d138e18156452e008f24ca06358fcab45135632f 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -165,25 +165,25 @@ struct pinctrl_desc {
 
 /* External interface to pin controller */
 
-extern int pinctrl_register_and_init(struct pinctrl_desc *pctldesc,
+extern int pinctrl_register_and_init(const struct pinctrl_desc *pctldesc,
 				     struct device *dev, void *driver_data,
 				     struct pinctrl_dev **pctldev);
 extern int pinctrl_enable(struct pinctrl_dev *pctldev);
 
 /* Please use pinctrl_register_and_init() and pinctrl_enable() instead */
-extern struct pinctrl_dev *pinctrl_register(struct pinctrl_desc *pctldesc,
+extern struct pinctrl_dev *pinctrl_register(const struct pinctrl_desc *pctldesc,
 				struct device *dev, void *driver_data);
 
 extern void pinctrl_unregister(struct pinctrl_dev *pctldev);
 
 extern int devm_pinctrl_register_and_init(struct device *dev,
-				struct pinctrl_desc *pctldesc,
+				const struct pinctrl_desc *pctldesc,
 				void *driver_data,
 				struct pinctrl_dev **pctldev);
 
 /* Please use devm_pinctrl_register_and_init() instead */
 extern struct pinctrl_dev *devm_pinctrl_register(struct device *dev,
-				struct pinctrl_desc *pctldesc,
+				const struct pinctrl_desc *pctldesc,
 				void *driver_data);
 
 extern void devm_pinctrl_unregister(struct device *dev,

-- 
2.45.2


