Return-Path: <openbmc+bounces-177-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B24AD643A
	for <lists+openbmc@lfdr.de>; Thu, 12 Jun 2025 02:04:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHjP33N4Qz3bm3;
	Thu, 12 Jun 2025 10:01:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749622457;
	cv=none; b=bkYUsm94jSKEyB+rEs5wOUSZ6z3Ts1ifaNrOEDC/8Gz+9o5NSaoiUMBELbsOjD1rUb5AjjkNKTV+f/SHwKrdzYAlW6Rc1KikM0bmBfBOesmDDSoPWedl05QEyIM0DB3vYu+ofsrUcfhoYliVxlKo0MATj61K4Syw9XSLxi4g9XavcYhSW2ZlksgbUP8wE7ejtGzqvBa4L3zWCxYtF2Hzi5HikcMMTIaPpzUGdWjc7PntVo6B1VksQG7lzX+eSBnv9FFIt8UVpG4TxnWx47UvuCQ/fTON3pedgc9bh/z1obd6psGkP8ugB2gvl7mwU+lCjXaULSX99q8LNGAchtsymg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749622457; c=relaxed/relaxed;
	bh=cSwZ1HkGC0NCuxdiJr7YusfytJ75yXllA65meVJdMKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nMGoiM/KoXS7YzwVL9nMLwVuygtsSiznCt2o/rX6j99GmGPDQdngTZ8/R2KwhQ2COtApI5cZxcj+PNGxmVhXiNb3f2ZMDGJvyZkB06GrhaoRgpvcmE4hxnwNe1RXtSl9XzHBa4QMWI8cK/gVdMXvCB5d1s0pYJggQh4UjuviwJKhnPCaIjKVXZ7JCqmTktE9XJgAb+4fhRAyxx+fQQ52WCcHV+2PZqQi6WD3FpGqEteYQHpo8IfX5TFZXolA9cI6wrIAMh+2e0cWixXizbBgImbX5pGkdoIM09b1NGszvjHqIYBZlO9GFECPaTdO+MxY9CWClcDPDP0/TJvNS0YTJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yo/ZQCq3; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yo/ZQCq3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHFjh1YPlz307q
	for <openbmc@lists.ozlabs.org>; Wed, 11 Jun 2025 16:14:16 +1000 (AEST)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a4e57d018cso28354f8f.1
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 23:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622453; x=1750227253; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cSwZ1HkGC0NCuxdiJr7YusfytJ75yXllA65meVJdMKM=;
        b=yo/ZQCq3PRvta/I3k5XEfJhkHT3gAASODdH+71hsAlKfKaZg450i696/5QAuwuz0gk
         +leKARigEgy+HEfA7aQNmlwhytFYJAqVMgRrtp5CULk4yDL+l3+QrKnmdUKxkWbKNVFt
         lVLZSJiFWAksPK9LCx4LSufprDugr/TAJyVHYWq57c84dxQ27au2ff/GDP7B4PcMLXUC
         IdpprGMxwR/Oo8wu1SLFSIBA8lFAtNg6ZoTVZutu0HEo6ppE9VGWESbCVkeBD6mTpBYf
         ulGz5+c4Xh9MyEmquGPeuHfKlHlO+0uSo//H7vOg/KyAeBRoxkWQznpLNmbhCeiZmVTR
         HC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622453; x=1750227253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cSwZ1HkGC0NCuxdiJr7YusfytJ75yXllA65meVJdMKM=;
        b=dAt6pWdIExO46PwKmcHr9kg8ztpnLByeV93rIQugxkdNjKgoXcDnu6VD51soyq3vXR
         5UB3/G6yC7HXeybtTu4DO08JnMipVJsm0YjAh6/H59SHFznCQNrmgK2Sy0fd41god6ch
         xhyMmoRfmwbIxi3q3XOQnGqOGuC6avt4ncV3ruKwj8lKnuW+O0Ex65iODZu8F+R+Raxw
         5SOV876LZQZvW4Zpx3K3H/rnTfqNk1goWvzt2EbsQr3Fwil/p5Vq95E5kznld5EVFY1D
         vY6tgZMx6XKnd990XejrnUMYhy0Yqnmfx7DoOZAQk7gfKlZY1M0Bc4S06Cd8AbqNKlBl
         BpCg==
X-Forwarded-Encrypted: i=1; AJvYcCXXDLaT5lk7usCZX+03bSxoFHZsl6iMDcyKc+tBcticRvLRcSXqCbxn2Y1Cx2dLbgpSsLBr7zCb@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwiHbhzjZQ9SDqrUvJnDb3Sekh0ffv6wkFWU8bs5NRlmTBma+eF
	T9z1zN8bdiMvMbHtJkIzbt20Y97cq3k9NOKx05OUwg8n/auCNQdnYXS2qQdZKVIxibc=
X-Gm-Gg: ASbGncuJNrofyGzxYJtgdhQIQREkHqayhixBtOAKP//kh46lQg9MMA6JoVh5QgPi5wh
	TW52s5DkmCtDCXunii9hfednjQDSEh8q6IQwY7qY2fd1TKWlo0V1A0owsj/wIhljiXobvG32ZKy
	5kFK+lKRO7yreMijXit2z/mbkVI0BX0ku25JWOsK4Omt9rtvnNm3TPnJMf3pepnM/5FMq3CYYj8
	gcfeaAzbrqm+bXwRN4gmCngkXHj2eQmOOF4GT05Hx2DtcK2Sz35YQJQGVyzk0du85TiYsmXUdzV
	9JKYVE6Dj/sp52RZyElXZtOddj8SSZnniLFgbARHxbNU0/5DJJqDwVdTmnwhr62Nh+hu8/vSmnU
	4LkJZPjadc2ka0vaRLg==
X-Google-Smtp-Source: AGHT+IExi18Qcb4RFgAfHXzCB8Qf4+Yd31Q1eTA2g/Az2TI0+71W9MDaYsWsvrxBOzhlE7bYKU2y7Q==
X-Received: by 2002:a05:6000:2288:b0:3a4:dc42:a09e with SMTP id ffacd0b85a97d-3a5586c5d22mr478235f8f.5.1749622453083;
        Tue, 10 Jun 2025 23:14:13 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:33 +0200
Subject: [PATCH v2 01/17] pinctrl: starfive: Allow compile testing on other
 platforms
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
Message-Id: <20250611-pinctrl-const-desc-v2-1-b11c1d650384@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1030;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=mDmWzbKLnh1AZNQ67jxvi1k0hTLwQwfvsMjzAxX0Nyg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6fEB9xL/xFDTrWnWiu/Ruag7QKGjRyQb35k
 gOcnuOKB3OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkenwAKCRDBN2bmhouD
 15lkD/9Q4nMlgfW+gPfCACmH3SZySXOQg89b9kURhO8G5ijTWTIu7al/6DRaw7erQNXoNQBsyJC
 20tXphKrIKBg1BOFLkQpFJao++nW1TV9e6bfDgRKv6ZQhyy1v63uBc3P9AT/zNIhPWqRonlDGYD
 EwbTm0diXMR50Hwurgx2vAmMuTZbx2IlIgw8IJ2IaAzlhv2PsgLVapM2G9zgRKTicxGxfFRuLQr
 P6k8YVt7cEdYJxGH0Cxb556NE85eXpDfgJ2zdLU2JgzKOJmQjxftTgDmTZGM0jW6ZAskVG+syK9
 KMh7ipL4lMH9/jo2rRa4r1ftUUblu9FWLsSs5i+xNKBn8z7oxv3PsWV6SOStiSl856ZKSQPXGgK
 KOzmxl2/Tw8oM71vKQfInXGzcxN5DoFaJGVy/WJ43K85ys8epHls7Y3tTpBCOZUGciGaWkLzrVr
 zmghKNkyO5kNtwLrD17MNUGAbv/LJiD9EDIoVuQPPrG5ldyRzfZwWxd/urXqJuTU75evEvNGBy+
 r3SiO/e7iKbZ/Ox8FfkubNnLYl+H6VMsLJoGVZVNI20ZJLVR7Wt/Z1lmZJtOhnIbTFslWzCML93
 AskWsFtWWjVZzX5uKBXDeo98Q5fue2afsKkRAbfKOSphNl6HIPaNmbsLDXRqvTmuBPR6M5wN4Ad
 P6tSr4VsygCRo/Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Always descent to drivers/pinctrl/starfive/ because limiting it with
SOC_STARFIVE is redundant since its Makefile doesn't build anything if
no Starfive-specific pin control Kconfig options are enabled.  This
allows compile testing on other architectures with allyesconfig.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 65dac8e387985ac7f865d13325eb903f64645a2a..de80f3ee52c40f3a817f229a751909c590161594 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -83,7 +83,7 @@ obj-y				+= sophgo/
 obj-y				+= spacemit/
 obj-$(CONFIG_PINCTRL_SPEAR)	+= spear/
 obj-y				+= sprd/
-obj-$(CONFIG_SOC_STARFIVE)	+= starfive/
+obj-y				+= starfive/
 obj-$(CONFIG_PINCTRL_STM32)	+= stm32/
 obj-y				+= sunplus/
 obj-$(CONFIG_PINCTRL_SUNXI)	+= sunxi/

-- 
2.45.2


