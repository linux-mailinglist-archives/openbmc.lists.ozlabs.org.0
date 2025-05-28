Return-Path: <openbmc+bounces-92-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3035AC7507
	for <lists+openbmc@lfdr.de>; Thu, 29 May 2025 02:19:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b76Nr21yFz2yvv;
	Thu, 29 May 2025 10:16:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748428898;
	cv=none; b=BBHA1n+QMv0tDMJngCBDjTW/5cz8v5RWxwVsLpQYgSa+ZMwKAleELixnbnzS3kfWFvbn3/b1jHZE7a2wB+BNG+UHMHvFJ764jvvON+/h3FQL4MjSsBJIPMZXV7/fzCg1ydCU0C+vV20Z2GQFM3i+LtMOMBtrwCE5dVt/hzqH+eqxSYQw6ljDiaeatIYEyzixgHZPeBWx3Op2OjF9Unl8SXGABgGxj8/ZLusbQNv9d8oma8+BOtTk7sKE6rCdJ7DnLds0OlUZEGv8P5wFEbo6gUAbNMsccBnbxcRXS/mdrk0JGMpcH7/VNS0QtNuJRE8wId2IjOw7xgwoIQO+aBjJnA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748428898; c=relaxed/relaxed;
	bh=WYGECA6tC+WcTnZvoeh8g+cRlyTZnil5/IN1N4S/06M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VluLVDpAx9NL1DNpEWDG08zTEjQedzf1mCORHEekkc4K+mHJ7CqfJB9nPp6detFVXTKAYeg5rXnQ2LpV/OWC3lwQmj4pL/6rzEfODinQKC9D/4wd9eCHK03sdUf283XCFWNE2xRdu5KJlmkErFXBUyKg294x9tuNvXjA3Zc/+aNf5c3OA/mGlvMjwNFxQBbrXrt0GS20lEomMOhir/IBH8COJhGdCpOZB1ZkgLVySFY8UQ+5p2Ar/EVd9fkEflZgM+74M1gF34F8Vy8WnYTz/Ni7YMevK5CWGEPOytQlgd0HNPveg3dzeyWJQzn+vmXYQfIGNFGtTpwIcM78UUC5Aw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xnnpBoxF; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xnnpBoxF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6mJc1d3sz2yWK
	for <openbmc@lists.ozlabs.org>; Wed, 28 May 2025 20:41:35 +1000 (AEST)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43d4ff56136so5472755e9.3
        for <openbmc@lists.ozlabs.org>; Wed, 28 May 2025 03:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428892; x=1749033692; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WYGECA6tC+WcTnZvoeh8g+cRlyTZnil5/IN1N4S/06M=;
        b=xnnpBoxFEh8HTfifP46vZNnUJZ727mEwNn4tCEkIS4QO2q3mKU4lRtLpk3t/iEu37U
         WkfkCbKGKltujj3mgAnzoYTfuibDB+RpddYnB9pwVNDBOwx58YABpWMNhkTJeVNeY82x
         V4nGCDwFBWSl0J1KyTxwGsMTECXovGWO+kt+ero4AYbr9d2uOhbAxZTLZWQ8Cs+l3vhn
         T1qjybp3fP41pF4WXP2PlPpiAcFo0D/zu0ns6wcv7ix5DSHgGjdxA0N41LVhGDm+qUvE
         tSEV0/YrRDG8iv6AnWRESZTTua/XdDsISN1aVK1uoApVTtKS3RoVWUyx8H5XqnfSBBhh
         nKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428892; x=1749033692;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WYGECA6tC+WcTnZvoeh8g+cRlyTZnil5/IN1N4S/06M=;
        b=pbyIxbbyHluYK14CDss+6EHgOlpKi1JgfMqOQB+So0wcA7HBPe4tz3mPXNhYgjefeW
         WfwDPfUZTWYMAi9fhwdHfIBPx+3EoFSReMmQc6eMznV5+Z1TYC5/u5Y0hqSOMQkhqlbW
         2bfhajMpnk0SoEv6P+6rUpEgcPB/2sx2rUjQ1g9Ud0RRwxKUumRZWW2sgllcPQsMhdES
         PCP2Im0S37lhaRRuf/khLx/gMM7b5Ulg3M4khIG08Yy8deWFyZvoylXfc+I8OevMM3oA
         uxovR9Ngc1k7vC0J2ZMWk/8dHcLXnIWdqplxmXEcoo5BO2gV7PMcoyliuLk+JoOzI3o0
         DCpQ==
X-Forwarded-Encrypted: i=1; AJvYcCULy0i6m4QUxhxkOQKspi81hv+4WRDCUplqaCNu0tzTA9VMm486eBEW1kEkCAUHt2XiuW3T9UAy@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwbguxonnXHuWQxZ5KzkM/7R59yA/IDUKI9np7yot9yqHqH+aIT
	GFiGlTUzuEpy0LH+94WxT5/rYe8FbKIioZvos1d/Wa7JxK8hcso1HtD8w8lj6cO2Uy4=
X-Gm-Gg: ASbGncuILiod9iK8Ii90RWXwTuEQDPfu49z58Wx8wjQNYJkgAmzkvnOCxUgTd5wVf+8
	b6ezBKhCwrJM1fSIgQ9SAXz6RGNNSDSKItnuoQnmIBn8oMCmsyeOQWZXe8Fd4GmdTOJokDTQwPm
	ruJ1dJInPeYUWfLDXoepeHoRhQP024cEN/Yx28MqrPiuK1LyBdRNvVDv2BgBicKjdOOyNOeEoRK
	VsLGntG6cJypocrZlPk9VF8gHEexRdciUvGHRaCk0vlA0wo5omzU3+TUOPvtZDuB8CgYlGwCz8C
	vWVWjOlw+NMRcZNKVTEkJ4VQ+45igF2cfVrSnDEcu/F/AkzEH4aEjE7tw4nhwGHrNNp06os=
X-Google-Smtp-Source: AGHT+IGEfOLQIkgSBlZ2iFouY1f/KgLVcIHYsjuV4CgQ8KecLfZQnSg2l0D8HirR5K2pryTmJCchcg==
X-Received: by 2002:a05:600c:3144:b0:43d:fa58:81d2 with SMTP id 5b1f17b1804b1-44ffbf6531fmr6551045e9.9.1748428891894;
        Wed, 28 May 2025 03:41:31 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:41:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/17] pinctrl: Constify pointers to 'pinctrl_desc' and
 more
Date: Wed, 28 May 2025 12:40:56 +0200
Message-Id: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIADjoNmgC/x3MMQqAMAxA0atIZgO1WlCvIg4lRg1IlUZEKL27x
 fEN/ydQjsIKY5Ug8iMqZyho6gpo92FjlKUYrLHOONvjJYHueCCdQW9cWAlb3xluBybfOCjhFXm
 V959Oc84fseaE1mQAAAA=
X-Change-ID: 20250528-pinctrl-const-desc-3a40e39eca15
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4130;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=31q5XaAMlBexIYczbpLSD3TpwdohBFMpqp6LWBCJyAo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhIG4ER1L7WtI9n7LAHBv7yR7/wd9Y62GAPM
 YOkBRMFzV2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboSAAKCRDBN2bmhouD
 1/WaD/9J3m4W4vBhw2XThuOyRYX1b6hv7wnFg0kwf/oG58B+tqan9UkROsMsYaftbalsBBZ5ZRN
 1M9nkKj1NYeRqNX8GD5zgdOlhg99/xoNAe4tKnXdHhemj/SZnMwRRpjoouoI5MZtU0Wyr3D/iRh
 apzqHY1Bktzyyz3i0o+EX3N6UGXKOyRFk/Nv4gpE89Tnp5pCpCtNpTewhTStIJo5v/+Zbe2YPrQ
 AnR+OeW0EPpY4/9GqX4FIXW/SBGtMEBrUl82vugNf3cxGgJTWmgAVoKYZNsVPsoZ7Cw5w9ZG7UJ
 nT+moUwF280v4jVOMoAy14NfrX3rj2HWST1PKwMiowU5NSmpEaJi+w6xE/2vB6qVh2QW7+3dAaA
 BpZVKNBQeFJMhZ8WdOg+Jh/qQ6uiZPxIFnUZRKqjwl44agPEeENckIbyD1wJJfAA+JkHuc8AiPh
 V9ANQmhknrtWhe7+PeFJI8GfxRXLnum00ByOaQGly2msm7YKUjNC5gshTcRyWaWNB5rCwL7LPa1
 0IdR7g9/Tt/4d5KIA6xWPHTzupJxtq1nsBEZwM9n0z2/82V8a2ByQNlhmzte2qCLPiweUR6oikT
 3AEpIeiINOC5++QtVlihhuU7o9fNUbOyMpEqQNMr5jj0m6eoELYBLii4S7gWJrXGzT0Ya3JNLAx
 mzmNbbD8leWapdw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

In several drivers pointers to 'struct pinctrl_desc' is not modified, so
since core does not modify it, it can be made as const.

Dependencies/merging:
Patch #4 "pinctrl: Constify pointers to 'pinctrl_desc'" is a
prerequisite for all further patches, including RTC patch, therefore
probably everything should be via main pinctrl tree.

I split several patches, although not all, per SoC-submaintainers, so
reviewing will be easier.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (17):
      pinctrl: starfive: Allow compile testing on other platforms
      pinctrl: Allow compile testing for K210, TB10X and ZYNQ
      pinctrl: amd: Constify pointers to 'pinctrl_desc'
      pinctrl: Constify pointers to 'pinctrl_desc'
      pinctrl: aspeed: Constify static 'pinctrl_desc'
      pinctrl: nuvoton: Constify static 'pinctrl_desc'
      pinctrl: bcm: Constify static 'pinctrl_desc'
      pinctrl: bcm: cygnus-mux: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: bcm: cygnus-ns2: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: bcm: cygnus-nsp: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: as3722: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: max77620: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: palmas: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: renesas: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: pistachio: Constify static 'pinctrl_desc'
      pinctrl: Constify static 'pinctrl_desc'
      rtc: stm32: Constify static 'pinctrl_desc'

 drivers/pinctrl/Kconfig                            |  8 ++++----
 drivers/pinctrl/Makefile                           |  2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         |  2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         |  2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c         |  2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c            |  2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.h            |  2 +-
 drivers/pinctrl/bcm/pinctrl-bcm4908.c              |  2 +-
 drivers/pinctrl/bcm/pinctrl-cygnus-mux.c           |  8 ++++----
 drivers/pinctrl/bcm/pinctrl-ns.c                   |  2 +-
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c              |  8 ++++----
 drivers/pinctrl/bcm/pinctrl-nsp-mux.c              |  8 ++++----
 drivers/pinctrl/berlin/berlin.c                    |  2 +-
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c           |  2 +-
 drivers/pinctrl/core.c                             | 13 +++++++------
 drivers/pinctrl/core.h                             |  2 +-
 drivers/pinctrl/mediatek/pinctrl-airoha.c          |  2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c          |  2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c          |  2 +-
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c          |  2 +-
 drivers/pinctrl/pinctrl-amd.c                      |  8 ++++----
 drivers/pinctrl/pinctrl-artpec6.c                  |  2 +-
 drivers/pinctrl/pinctrl-as3722.c                   |  4 ++--
 drivers/pinctrl/pinctrl-bm1880.c                   |  2 +-
 drivers/pinctrl/pinctrl-k210.c                     |  2 +-
 drivers/pinctrl/pinctrl-lpc18xx.c                  |  2 +-
 drivers/pinctrl/pinctrl-max77620.c                 |  9 ++++-----
 drivers/pinctrl/pinctrl-mlxbf3.c                   |  2 +-
 drivers/pinctrl/pinctrl-palmas.c                   |  4 ++--
 drivers/pinctrl/pinctrl-pistachio.c                |  8 ++++----
 drivers/pinctrl/pinctrl-tb10x.c                    |  2 +-
 drivers/pinctrl/pinctrl-zynq.c                     |  2 +-
 drivers/pinctrl/renesas/pinctrl-rzn1.c             |  4 ++--
 drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c |  2 +-
 drivers/rtc/rtc-stm32.c                            |  2 +-
 include/linux/pinctrl/pinctrl.h                    |  8 ++++----
 36 files changed, 69 insertions(+), 69 deletions(-)
---
base-commit: 08ea0cc455fbf6f6719b7a4cdcd1d132ea34577b
change-id: 20250528-pinctrl-const-desc-3a40e39eca15

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


