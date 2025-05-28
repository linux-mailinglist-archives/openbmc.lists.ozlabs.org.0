Return-Path: <openbmc+bounces-73-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 623A6AC74ED
	for <lists+openbmc@lfdr.de>; Thu, 29 May 2025 02:16:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b76Nb2v4Pz2yNG;
	Thu, 29 May 2025 10:16:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748428908;
	cv=none; b=HVemYcMF1Hf+Zi3lI7KF3T3uyY5Ke/u7hgCn4wKA4FwU0O6eqcsUhb+nxEnfk1okqZY4C3YdW6nvMn11/eUDaN72JMt7FFc08Ldq6gg7lewn4nhMXiF4oZE40OqKiITT8mSWGs8rBURFcdZpUVnVPi63mOc7ALBKNTqS3WIJ0OnzYuDPaSuNglLqRdnqIRIE8E2qbN0mzda4JxlRvkaxfrzmT2V94wz3GN3cGv+74XV5JW9TsvrqNvYSCGY/oaL6lETIaLqRC+tYQKpnirnSDciAfAKXMvv/tOILwEBRcbudVtDgD+zXwxipYlwk5rLlWXlSYv8aBeHGY18VRR6u9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748428908; c=relaxed/relaxed;
	bh=nXTyYXfzhcaLBKxfXPlEyeZbv/5uabWWatfOoXzctws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kRWyfvV86OkDiO3tI2YJRFu8DxqrU4EVQRhGTythFyPVoIjML1TONxZYKTkoFdIJrFF2Aa7SV+Xgeir2zv7qfpMpdjSXmJLlz7bF9CT23tm/FdhjbJOmbe9TYdvS3/5UrDEH6G+umANHRPStwxsIEN54BE8zfzRzOBunST5qsJ5N9kRZZv+vzvq2b4TlH51e3aBjZXEMcV37t6dTRVz4Md5fhPQHaTJkrzy39FpIszaxsQd75xxHuPjbg9iTXfvFMST6cTEmFIuj3O3iCiK3iuQEsq/WTc/tWo6q07CmMGi5LhJHyzGj0/t3N/zsU57Uc3BT7BFBUjaMBtSx9CejSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xUNdNMr0; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xUNdNMr0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6mJq5p94z2yYy
	for <openbmc@lists.ozlabs.org>; Wed, 28 May 2025 20:41:47 +1000 (AEST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43f106a3591so5000615e9.3
        for <openbmc@lists.ozlabs.org>; Wed, 28 May 2025 03:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428905; x=1749033705; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nXTyYXfzhcaLBKxfXPlEyeZbv/5uabWWatfOoXzctws=;
        b=xUNdNMr0zJZZuVzpAd+YKmjXmFw+gbZMIqgzExpf05AShg5MVF9sWcl5e2bfK/Oroa
         VD0H5V5xkABdxRCMqTiH+jsqMWmuxj0FSZNYwo/K0Xb5rLAfVysYDMtx6lnV9XFLN4Di
         zUiHzsb0L5H0CUAZjt7ni3kGJdeF6yWQgGCn+eRnmW3Pl7TXodhna09WqxrYX8SFS2Ku
         LDdQ01wh5eXfXiv+NOgyOcC/qmgulzg4uIkgVHxyW232p3WVcOX7S7tIxDB9ap+EhqM6
         uHKefufPQ77fnSbXyT/hFkQ1OouFakw6TTRhpp9S4qDKg0xacdFTJCZCA3X+lvQfa8+s
         BIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428905; x=1749033705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nXTyYXfzhcaLBKxfXPlEyeZbv/5uabWWatfOoXzctws=;
        b=G/wKsGPCmwCANZuIJzN+H/DDENjNi4c6AI8avtICYNo0XX2ECRJYn6vc18ZA5RXDei
         oz/sP+7RQuhB39ViBZoRbwFllAjIJivVoCiwQQFOCK+ctjl5WKOo4DYUFUZcSfDjBRuI
         dZbU18s+36efP46WYN/HX1vXb5Dq0VyILrgf/RhgbDvOZk16kJmrlwowwyWyc/7fZlTC
         vJnYcbP6QO9H3olB3d17cK0eCckH4Gm/j9yiV+rGW0AS1o2P+SjgprI6zZ43DFTX+wXP
         y8494PZ13x8wd7MFc8QLYBiGt2tRDB8+eryDMxu9Fh/cup6CzsoPyxsR2YPo5jeQfoIV
         40Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXTWTICensRe9Ou8UXw8eXCzFp4OTryNjTXRVN9iE1mA6ieUYvuOGbqgxaSP6LFnJnsD+nm0mC9@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxu28AJVIKBwiHXdnirDoWkPJ7VO7UMhmdUN8HM/Em0UtJBP5lu
	kmOtxjL/A4Okfa5doY63Rj2ccgQWG3/Svpbjp29ehDr5EzC7UCewtSF4IwlMwYukqTQ=
X-Gm-Gg: ASbGncudBUmt7tKnr+AJNLTbOEnhxiD9dFoEKlAIQaPj60qr242LC+/uZIBKO9dgeH+
	24Pi8+xxAbHcqO9maCa3O6QkKhUfY5F0dnGefq02mkhbkzXvZeuZdXPS1PxQvi6RfJCAAHIGsNJ
	yfZGX3y0RH9GHcg69PMXb8AIEU59SJncnTEl/khYfnz3QPF219coPN+uAYPvuBNYARCV+H85M0B
	/JSOToUxfdwaAGlhp6klimSeNIZAgifjxfzc384uihIwcgzermbrFGgCcEOBwL9RsrO8R5/3jQU
	si2idcSrwjruDN0sfWmK4n2WmErpaQF4VWC8SF+LeytBNeXTkRKxx0M/aUnSn2cs8DT2iPA=
X-Google-Smtp-Source: AGHT+IEA4AZtTD+Q8/VZ37CChuwEWmOT9diS1X23uFatCSgyEJyQiHDJbW9CLfhnKvp4tXypbpndMw==
X-Received: by 2002:a05:600c:1ca3:b0:43b:bbb9:e25f with SMTP id 5b1f17b1804b1-44da83f6d0amr44456075e9.6.1748428904593;
        Wed, 28 May 2025 03:41:44 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:41:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:00 +0200
Subject: [PATCH 04/17] pinctrl: Constify pointers to 'pinctrl_desc'
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
Message-Id: <20250528-pinctrl-const-desc-v1-4-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5299;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=MF4Zmmi+u4TqsjCbXpvQp2nvOFecMjqOedfODYY8uy4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhM1rWln/nmJgYh2DZGvcDXJy96iRpwljs5a
 xaRjo1vRRiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboTAAKCRDBN2bmhouD
 1+kwD/4sLoK8DSjFqggVXP+fCLA7THgzjnyz01SNNQhU7wei18AGNJMIcztcrXxSfyqxOsE9m26
 3xg5l+2PdxSB/aq8DDcjAGUuJFfiBr3DwvtXD0R5kqT7fErKneCTZMHEKsRTA613sgxQPkSkGhH
 J/nz66172/T6EhiPm8ykbJpLrrLSP0bIpiw3gBRqdflxlVOp87//vr6xiRhNbUOUNl8PCfbw4/x
 rx6GcGsxg+Rvz6ZfnT+z8zCM0svA2OOEHA4083PN2qCPYPhBXwZFcfe3uZ1j6g8ffXzFqa38dxK
 ZjF68IuePkoK1d4gqwWgstkkZOM8nt1jmkeWXYEgArFoVEwhszCxEol5CUU92pK2+2OGXusBK4z
 yKgMiectIIR9hEKEqr8RNSIGh9O3Tq6jJbYzGMtEPquIlcMwffT+mMcJ9AR5rtDZ44ZYafzohoS
 gh0/zpM2FiR8p1YsHW/zv/yqhQlxrnLuGev7Lr1T6j3BBvWKyctkxVVEZN073tNnAGBN1LOkGMz
 CORCSWjImfC83kw3p6EIWSk/+DqNVIuiHgYGvVWVBuyvkC2Ub5q3jm++93XFBWuzqZvHsV2SeKi
 NQkNPhbiN+bdhnsEfdA+2Tw/GJwFn5p+4gQuKd0OMPkuSLxO7TcifBTRE2IZyXBfAzMnHvRFDjv
 KPmDdWC60XPnPvQ==
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


