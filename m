Return-Path: <openbmc+bounces-619-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B5FB50F3D
	for <lists+openbmc@lfdr.de>; Wed, 10 Sep 2025 09:26:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMC0R4z9Jz3cnZ;
	Wed, 10 Sep 2025 17:25:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757489159;
	cv=none; b=RSzGsQHaSq9ZOjXjqaIk5KQ2Ea+2ov/RgU6IMynB0e9uVIoKefygMAnVrakvn9glq8prXsxu5+BwsTmCBo8/y5HxK6maDglemJUx7bEApGWCCfn4RjDJynfw/DMQDoxqDmSEqdM7pB1ZxEwx6uaXr6CwIg2fDPS2zC0uQY30HA0c0Cz+jn3PxKo2TKbfjp/mC/Ie0ilHBL108aaTfYGaznOXA9qH+OfmiuCgyyPgmky6tMQL8MSTW1qNTHpAA/Rx+YP6roQRJ949Zwb2QSf8+S5WFLBokc+dyl6+o3OPGi9JjPLlEPiKJtxn7bFOq09Accy+AyYemzDMUGfXCfqSBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757489159; c=relaxed/relaxed;
	bh=FGe2kCYyrBIF4DaoEyXhe9vc0rRZs52BhYtoGcoY0gY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F+/WcVVYBEbxVQroLb15OUpBE6nqP2L6lxaMqzU+7tUYqiXOVQzpNif1FAR+4sDZ9dDduNjhDqVHMWkogNUxI19acvWBndymGs1GGyMGsCeoml9GWWgbHcbZnEKjk5AbAwtawXGZXTkx2jfybBormVS1thNvpsLgknCqFGnW/JH1boOngpGat/0uBI1LP9athg8JSLydoi7d/iCJjdypNYYsnxywPZzVg7Q9HLVnGLOJJ7zS3UB0fCSrFOlaryIdOkBwZPHQETg15uPR0JEoSCiUjjB21uaS6IwOXGGwDPSrZgNH75D/L2+TCUHylJiTTd7+K5fsvtNGbMy6US7+yw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=tWcN4Rmz; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=tWcN4Rmz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMC0Q6GWJz3cll
	for <openbmc@lists.ozlabs.org>; Wed, 10 Sep 2025 17:25:58 +1000 (AEST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45ded619608so14121315e9.3
        for <openbmc@lists.ozlabs.org>; Wed, 10 Sep 2025 00:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757489155; x=1758093955; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FGe2kCYyrBIF4DaoEyXhe9vc0rRZs52BhYtoGcoY0gY=;
        b=tWcN4RmzfXSfxPrqGPcYabqIKOWGOpkyqH7pesx06GeuDVjMXPXyYQwg/GC4LM/q0l
         T3ntDHJwnB/xZ8FyvwcVukBVxPamumorxXgXeR8I+C7EN2Uv1Yuwd42qxtUkAPsGftEk
         qeqllRqjGr/NzQay4k/Om0FD61EDqiCeS6jlvaQCa1C+5l/73mJ/NKRZfPD6kx78d8VD
         TLoG3L9ZDHAkGJPAwPrUOJilP1JM+dLFW34YbbnJrIHQE3eKxALwzxawdA9/DIqwzsZL
         IzxAx+c8Mi9M/I4rlfBkLwOLgQRWLa0nr1bEz2Oxyml2+WLWJngMR7IZ7JXnVI7iB5Bm
         9hIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757489155; x=1758093955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGe2kCYyrBIF4DaoEyXhe9vc0rRZs52BhYtoGcoY0gY=;
        b=V+IBCcc0SicoCDRQv3OX/iiyfk+EZlofvxCrJ1LVHysmYiLEXcIbdPFTgida61PaJF
         qFuYyXpVA/wnyTEdFH4m3lpI5qczcOo8n2KjinmbzcbAixIa8NqcYIjZS0qflw3Q2yoA
         kbciPXscNFPvqhwb2MR5htAoKW1fbJFGbBFT0g9KNoGpGnC151D8/2EulxgzLkBjSMQd
         m4tEWzkpb+8eqwbSltLRurmfVbDqLip9gssVHQD3yDAzntjlM4ddnYa4+Q3VVTI9U6VW
         MQfQpPaMUzP8GDMVy3D3qvzrF7GMPtJ9clYGv/2kXzCFIi2H4/I5U3bwre8Zqw1uN1Ne
         sFaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL849BM/L8H3KJr/Wz/ks6nf/GTWd+JrfQtgp+ylCdcLzFOA6vqydh53ZvSRZpr2Btpgk2QB9W@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwIU1mH9tJMPi1Lh4+DSPf+nx3TRlDv3HgiqUd9l312nbd98lok
	xTDq8IZfxHM12edVl4B68STk6c2Aj2LJDDWrF2yeFVZSaoA90MM7MUHF5i/U7KFPAZY=
X-Gm-Gg: ASbGncuWWkkeXiOW/R+PtfviY4HHdLxpWmiS/fCRJyxJjQ5gsLozGVBMh9Ajf5cz239
	57A6bAxQpoIL3imzeFyoikTFKLoZ0ryeGgXLKKX3gBhPvAkkw3ThjjP96cVL2tC90mpJQRcarAQ
	X7LRhHzly1kItu5LqElZiRe4W0b8RU7EwEg7r/XPcXtAZiQ7Moqy+AdtGdC4+K7YgNI+DFtWt9K
	kxn5+D4Fw/z9jngwt6unInifTofN+eDugHVK+kSbU600jq1KllVrocvrZ6qnQDjPnKGr0LQkCS8
	wBte8MYKqXOdXdClvoiqAPLYy7czlOskV9+TF9l0XOt6/EPf381tkOFDUYNCCDZrIIAnQBw+jZx
	ckNn0IgOKXlxJQyUJMeKKtCjTVzlh
X-Google-Smtp-Source: AGHT+IFKukxuWQbV3GQkjDT5tJO7ETqBsVAR9QXCb3Q6hoLg7Ipuas1CKAmh+SOgrGuDOECJ9CxThg==
X-Received: by 2002:a05:600c:4ba2:b0:45d:f650:376f with SMTP id 5b1f17b1804b1-45df65037a8mr16159965e9.23.1757489155474;
        Wed, 10 Sep 2025 00:25:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8236428sm16729825e9.24.2025.09.10.00.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:25:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:25:46 +0200
Subject: [PATCH 2/3] pinctrl: use more common syntax for compound literals
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
Message-Id: <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
In-Reply-To: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
To: Lee Jones <lee@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, 
 Hoan Tran <hoan@os.amperecomputing.com>, Yang Shen <shenyang39@huawei.com>, 
 Imre Kaloz <kaloz@openwrt.org>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev, 
 linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3691;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=tWDuSmRqjBxh4PCbBXZnSady6kuFU8Rp72hLJEvwTyY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSf8QZSyHCR/xAEwQhF3yXvsq3FFB2Sm0TpBi
 tTuwCsYkxeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEn/AAKCRARpy6gFHHX
 cjLEEADOrejKydnAO7p85xcuEBK/60vbBbndYaZrZm7VhXvcHChD6etGR9x/gUym2NKntRzIFsL
 hAXVhRuugK9dp6StaYPOv0NzNg2DHcw92GeNV1ULDNv/30mZ9sw+dy7U36UDGUF/KoiRIAm8iba
 +5A4dTlF2MpVWXQ2GwUyGaIareKlqy3x20YM/2GK9plb6g1DEexAqB49SWARBjv54DYfFP2IRu8
 2fwwsm62dpHpqSVvggXPlROV0Q8f7t4uHPGU2pXh+8o0BG1Ajkg/btvLzTMjCCcK/jRyQp9IbEK
 /JBENsMRS1/eBdlhuZJDv9okaKfAXrSadQlX2eGOZ7J5/9MjqLU8C6uO3xxT4NIP9H8H/Do7C/0
 5FskCXqtSsbFOlbGaDuFD3c5GBgoYSX4bzC45Ulqmdu/oBRgtjFtjalSE/oil8BkOnp0fNYY2L4
 alFoFFiKMyRYIv4AQN6JH5r+KVvxbCOLCQnjHkYs8E7KAYKIbd4YgSYOfqS5YMhNhcUyfU6RmqP
 KSBeRYlyoKiaeo7oU7kZid60qvH6K/JPXDowfDz6OhK8a7ptCBzSF5md7/9/z0huGOcZB7nimGk
 EdU2rJBoEaNl4MGY9Md2JqQEkgsF2omrEVhjvDKeAQKX0ALrzTW7a1k3U9SLIK/rulrTObN7XHB
 yIXBeQDJ0g933cg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The (typeof(foo)) construct is unusual in the kernel, use a more typical
syntax by explicitly spelling out the type.

Link: https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org/
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 2 +-
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 2 +-
 drivers/pinctrl/pinctrl-equilibrium.c     | 2 +-
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 7f45c2897c3f270430ef7ac34ef064b2e2c58abc..4e8b5e6d1e4d48acba85e8c14e79dfbff6e6f6d7 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -1836,7 +1836,7 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 		if (!pctrl->gpio_bank[id].base)
 			return -EINVAL;
 
-		config = (typeof(config)){
+		config = (struct gpio_generic_chip_config) {
 			.dev = dev,
 			.sz = 4,
 			.dat = pctrl->gpio_bank[id].base + NPCM7XX_GP_N_DIN,
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 920dd207792596055d6f6da9403a9b7516531277..fd4270a8fb734e1452b30dad390a80a50072fb61 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -2329,7 +2329,7 @@ static int npcm8xx_gpio_fw(struct npcm8xx_pinctrl *pctrl)
 		if (!pctrl->gpio_bank[id].base)
 			return dev_err_probe(dev, -ENXIO, "fwnode_iomap id %d failed\n", id);
 
-		config = (typeof(config)){
+		config = (struct gpio_generic_chip_config) {
 			.dev = dev,
 			.sz = 4,
 			.dat = pctrl->gpio_bank[id].base + NPCM8XX_GP_N_DIN,
diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
index 4dd8a3daa83e44b0e2780fedb03ab11fa46a4b7d..ef569525e9c6b00add773258f81b57db38411738 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -1064,7 +1064,7 @@ static int wpcm450_gpio_register(struct platform_device *pdev,
 			flags = BGPIOF_NO_OUTPUT;
 		}
 
-		config = (typeof(config)){
+		config = (struct gpio_generic_chip_config) {
 			.dev = dev,
 			.sz = 4,
 			.dat = dat,
diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index 7e655b0444b359906a6b62e38873d740e1ce26ea..2d04829b29c9976fdebbaa56e6c1407eafa121a9 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -241,7 +241,7 @@ static int gpiolib_reg(struct eqbr_pinctrl_drv_data *drvdata)
 		}
 		raw_spin_lock_init(&gctrl->lock);
 
-		config = (typeof(config)){
+		config = (struct gpio_generic_chip_config) {
 			.dev = dev,
 			.sz = gctrl->bank->nr_pins / 8,
 			.dat = gctrl->membase + GPIO_IN,
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
index a8a4c2eee837ad90581d35822d49ab8e4708a8e8..22d9104499af674c489a5d265c4d7b8ef0edb44e 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
@@ -642,7 +642,7 @@ static int stm32_hdp_probe(struct platform_device *pdev)
 	hdp->gpio_chip.gc.can_sleep     = true;
 	hdp->gpio_chip.gc.names	     = stm32_hdp_pins_group;
 
-	config = (typeof(config)){
+	config = (struct gpio_generic_chip_config) {
 		.dev = dev,
 		.sz = 4,
 		.dat = hdp->base + HDP_GPOVAL,

-- 
2.48.1


