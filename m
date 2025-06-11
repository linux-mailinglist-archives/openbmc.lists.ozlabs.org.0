Return-Path: <openbmc+bounces-185-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBEEAD644C
	for <lists+openbmc@lfdr.de>; Thu, 12 Jun 2025 02:05:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHjP950ylz3bV6;
	Thu, 12 Jun 2025 10:01:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749622497;
	cv=none; b=ZMuifN9Iu5K0fao8u50BDXHwApcfyg5CnFJyZ2TyZp1lhBdNWIXSGZRXytbkPY3Xg/hP6EuCzDzRQAp0zv7tgpxqEja7ZxXnL2f8jhDWmTrAOdnoOEL0GS2NSDfZQA57KHoAzYfNMan03XOzY85/ClGS14E4AQqocuHbShya3AKah7rnkB2tngzNBcTMKWwwMOdRJHWLpbFHaEH8BEtKsovRo/vgKlZEeCzwne0YpTi5cPcXl08RgfWB8fimIAtjOIMfCkZxAFwDKvP1KKsAG8X5EgCjYLvz3qPJiit25PWUL4kfJKhA0JLhFn/C1CCxYTISA4yC1QkN3pCdV4TTMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749622497; c=relaxed/relaxed;
	bh=qdA/ig8nlywJbkEyEpBGSWcEGO8vU+oGS07oZJY25lE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GtPwvh3FmJKpEs1PseIQJs0ujgXekAtYcAxvsgA9DimMGjRO1lIu2SyB9Hfz87qXtZmgVrUAc+eMY3B2cm3Rx6uQ3QWD8qyKusl5nwArOb+p59JH6aOpzYgmkTmeAD60pabsqtguEEx0rjjP6oCJpwzWKfZe6nD9JXuo2JLioi+PiBfZDpGtNkBvjQlnmi4/GCxsN5Q4W8UK2kATsLTfnyweBl9NL+LK9FM1QsoJhAiq3jB6NxQc4c0Eg50x4s6uoPqfL0+EiNfxP7MaVlgiGTdTABUBMfRVhBeDUBYTtqZzlKBhlmo0ZYvVtRRhCTiHOW/aLvJ0o+MZAdDjHIfTSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QwvaegMi; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QwvaegMi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHFkS3D94z30CB
	for <openbmc@lists.ozlabs.org>; Wed, 11 Jun 2025 16:14:56 +1000 (AEST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a4e749d7b2so32892f8f.0
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 23:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622494; x=1750227294; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qdA/ig8nlywJbkEyEpBGSWcEGO8vU+oGS07oZJY25lE=;
        b=QwvaegMiY1Ij4EoUzAer2i0C9W3AbeSm8R6Fh7OEf/NI6IwStXwjDzXXF3qEma0kPv
         o3g5hFT/hUUyIPTPAqX34v9F7Btk/bDX82OtozH19TQhQDgbUiDOpGJoqmCr8+9DYB1F
         Qb8e7LxvJ4yFbH53+jUgmACpaBWFYWCqNBMbWELVAXjhw7Uc3/vloIYyyEmNd5DT9tET
         DWTkRaouvGv0+6lPVKp8S4YEP+GY2Aym+ThHST9e1jeznqtGDfRYzJBcXkOq+kib00Z7
         ZwWkEFqVmTwMiq19xPkSGn292VffCvq26OzWrMW2M4zhORZ3nNrTZYwXJv1dQveL8zSh
         oS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622494; x=1750227294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qdA/ig8nlywJbkEyEpBGSWcEGO8vU+oGS07oZJY25lE=;
        b=kapnOQsm0J2Nas3ee1vvhM/Nu1c6s7H/fmCydDFkpOESNnIEOgEkpsmrY/4HgYo66r
         Qmr+Mj7iXH3vVz1H2nDSHXy3FPc9Cz+sw8lOHMn0nyxrshGsj335CJ8TpY7ZCXgT+Y0t
         baR2a0alDBTEVO2wWdhg2UoL1YHjLh/Wv01A3Gj1vXLyteCBEGg94U6K8u2WFNHwae6u
         tFlRjv1UdP4i8PBnUFV6VWVfzSMYvsTr9ubTl1/zAlG2y3BXwWuaeNo6AuHG4/eRR65a
         ZQWepRCeRuxEZb+IKrmBQ5UZIBjuZzp+X/ijynLHAR5+/UtmUIcIM/UdHPR5igTx1NOi
         YMtg==
X-Forwarded-Encrypted: i=1; AJvYcCUIMKOUAzu/4u4LNMumBrRayLQp8ja8J+vAprkm3CgswU5qrH12vXaCPPA6zRRpGviggXW7sIRW@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzbHKAvq/drgP9B99TXps3poZ9vZK+TzbdiadpojkUOkqdzQfqV
	s3ECl9uXBYGR0VMWINNfALdtc/xmptlXUck/6hyCt+AEkMTqJFsYoImMmDsyjeV+TZo=
X-Gm-Gg: ASbGnct26BW47ILe1mTGMF0dRPnggqcUFzUSiEa27kMJjM5FIIY2urF1ni3/5tDNbq+
	TGeJsk3byGED4iIXU0uesR/vJuNRmFlD2tUZTxXy4/586RA6TZ8kKjEG3/3W53NNx6zNCNiWHqe
	Z0ofpC0qdxRVXzBLFD9kWiH2TYFUtyxVyerAVNTNouKPISL5LmzGsALLjrN+NGd2BlaP64m1Mfh
	PedqXhHeR4iV8hUOTyZq1H9TjXETeUsW1xmZ150uxJZbX2r0yvWshNWKuUZgj5wGlN6VXXgCxYb
	uY+0DpNnugo87nkBIy8EE6xJEG04XjbeDyDUn3Af7yCPmhTIx4TeLvzsdtNJ0Qp7+yIZwxe/DvQ
	xulqZrWA=
X-Google-Smtp-Source: AGHT+IENybnlsYED/rRUm4ZeUok81TSNdUCTJpLATCYwg6GXmHRKMfUyNXPeuvNv6VBY5hxJDw+sPQ==
X-Received: by 2002:a05:6000:26d3:b0:3a4:d7c7:89d1 with SMTP id ffacd0b85a97d-3a5586c5d88mr559699f8f.4.1749622493663;
        Tue, 10 Jun 2025 23:14:53 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:44 +0200
Subject: [PATCH v2 12/17] pinctrl: max77620: Move fixed assignments to
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
Message-Id: <20250611-pinctrl-const-desc-v2-12-b11c1d650384@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1581;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=vXeTXdr0B9QOQoZjEzmtipvrdS/pdMRjTxQFNr/h+bw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6p+iEceLfzESsCLmaF7f58gqtG4pEf1S04I
 US6TvwJJ1iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkeqQAKCRDBN2bmhouD
 1+VXEACLNTYtXHcSiimI4alyjbrbkDm6rHv4lUl4FJTdko8xkAkwphGqySFzctRNyJgI9touCTp
 VTuTb9XwzKvBv7Sz+PhDYKXWHIsu/mi6u3DQtaNf5mVdWT8Ci9eq/+0qUj6MXDgTbBNkGuWOcug
 W1RzzoY2lRp02okPqxXRdpS98elpEls0b5ltngYzUPV3D7ptB3GwD/w4KfWxqbPUw6MxHJmIIj8
 PMDrhhQxLJFw37f0hI/yWSAu85iF1aHaHs2tHxquwLzUUzZ7/+Gms5Zj21PPLjicsE7pcgtnWJk
 ssZ/fi62MsBkqreCcDTkSdnrqgpyFklT+gb+Trfwf02xAu8A8tQ/n6OEbE8tWZg8Pdu/ErxaNL1
 BUXZkKjhl1DGDjPQ5xA9nyNWyIoSHZERD/4iDV9AzInbpP7HBZEXnih1BdhaRH3Fg4uKyRkzYPY
 aha6uvVMscIWmHFwDoFIiFw4MUoXeBbT8sVDumREKH8sw96QTHnBkynPktbnQzvwQDVY6gqftFG
 o01FWQQhxZF3jkGZ0sZvaS4reNuF3D5sZ3nc3M7o85qgkCIaQN9KNG3HCbLcOWQeR5UOk5ePcpg
 6Kox4WMoTkg1O83iiImVLQssq+41bb6nolrcP48lT4q3yXb/tDPgmZdeDWExps/nYyadZXoKvlg
 Ia145EloLsO+3qQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Assign 'struct pinctrl_desc' .pins, .npins and other members in
definition to make clear that number of pins is fixed and have less code
in the probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/pinctrl-max77620.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-max77620.c b/drivers/pinctrl/pinctrl-max77620.c
index d236daa7c13ebbcaf7c4a8d1a8bed751aa111c0f..acb945a2574368b2e34659a902c34df8aad193d7 100644
--- a/drivers/pinctrl/pinctrl-max77620.c
+++ b/drivers/pinctrl/pinctrl-max77620.c
@@ -543,6 +543,10 @@ static struct pinctrl_desc max77620_pinctrl_desc = {
 	.pctlops = &max77620_pinctrl_ops,
 	.pmxops = &max77620_pinmux_ops,
 	.confops = &max77620_pinconf_ops,
+	.pins = max77620_pins_desc,
+	.npins = ARRAY_SIZE(max77620_pins_desc),
+	.num_custom_params = ARRAY_SIZE(max77620_cfg_params),
+	.custom_params = max77620_cfg_params,
 };
 
 static int max77620_pinctrl_probe(struct platform_device *pdev)
@@ -569,11 +573,6 @@ static int max77620_pinctrl_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, mpci);
 
 	max77620_pinctrl_desc.name = dev_name(&pdev->dev);
-	max77620_pinctrl_desc.pins = max77620_pins_desc;
-	max77620_pinctrl_desc.npins = ARRAY_SIZE(max77620_pins_desc);
-	max77620_pinctrl_desc.num_custom_params =
-				ARRAY_SIZE(max77620_cfg_params);
-	max77620_pinctrl_desc.custom_params = max77620_cfg_params;
 
 	for (i = 0; i < MAX77620_PIN_NUM; ++i) {
 		mpci->fps_config[i].active_fps_src = -1;

-- 
2.45.2


