Return-Path: <openbmc+bounces-77-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 659F5AC74F5
	for <lists+openbmc@lfdr.de>; Thu, 29 May 2025 02:17:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b76Nf3JW4z2yf1;
	Thu, 29 May 2025 10:16:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748428940;
	cv=none; b=AsiKw2GuyJiWjEqdGHKz1PaMr6CtTWOQ7Rlp5EIAh2O8ltrHCwjaHHjBrLVhipDQKXMyhcNnav5IfUM84FiZkUBVcNI+ucTvXgSp3D3I3uARBgHTwfGwVLtzBF9qOOBgXU5Yj5tIfOf5qSJMg1uCj5Ytua7rdFZ2pU4DrNQckVmRitMPY126mjYf4ffQS0wRbJsnuB5YprwcmiODHelSfLCPkGP+SQYy/FcsfpnAax7TxRcT76CB4GItQNCQ1+yo+kobUSgguUtqb0dHpvU2qIvrtztK1/nmUm0kPpQdQXpgzCZUddASG9FOWM1DPWfzwG7NPfufklIbVUainplSfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748428940; c=relaxed/relaxed;
	bh=ubJ7uuc4KLABL05ikGhsnFP3O+LGDAGrddoVdCFQ7aE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JRtmx9tHKYdIx4u05eEWLsxx9qlnpt/7A5Iht4L3c7XIDcHmnvkXQjJlt4TyxM8Hp8wVoLhxzCWekc29JZHkAxEZbErTyyJpNQWqiAa8R9JlhxWP+b84nKRckhJXmVTymlYbEWHX3Nr4VuC8YOQsjnIHy9RwSHEKYtKVtil5hsSXlg8HTgIarvq3yRWlGKJ1x+GdHShEDvQwIpFDuhCsO0mpu/AW5YUFL4nXlZgk7PmeLUorlZ/fwbflMQYv4y9q+PX+pWKa/RgaXPcKr6GbuIf51PCnQobku5t3Rwm5mNyxxY1komrt2uR/Wm+6kb+zwa65lwzbMGTLHizvB3WMUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cSzML9nc; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cSzML9nc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6mKR55mLz2ybR
	for <openbmc@lists.ozlabs.org>; Wed, 28 May 2025 20:42:19 +1000 (AEST)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a4db4d1bd7so472363f8f.3
        for <openbmc@lists.ozlabs.org>; Wed, 28 May 2025 03:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428937; x=1749033737; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ubJ7uuc4KLABL05ikGhsnFP3O+LGDAGrddoVdCFQ7aE=;
        b=cSzML9ncibnszqI8hbr+MbbsZwcXE3bIM4QgmMU2zDFX1fVIJjyaoqpJvJm9gBNhFz
         LHKX9DMVzit1UyPku09RzTaEUwlRg4dOQVzOgjg6Z8gynHc4cRAP07Cfvklr+BiidtaJ
         aztPcnvDw5G34O2vLt719Bu9/FCu1HW4Qmw5UYUnUV/J2u669+dsAy3vM6mtnDMQfU07
         bARw1TKvdmb3XRrRi1Kzy+ExvRPy+Rv6RRfMcT1vNi1GtH3poovDR0z2JGtBHAsuXJCi
         5r8X/yPB9z8kI3oBcEKKm0hcx4ZQYdiJi7b15eX4Hfd08y6jr9lmvf54PVHOVlFUqjNe
         iUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428937; x=1749033737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ubJ7uuc4KLABL05ikGhsnFP3O+LGDAGrddoVdCFQ7aE=;
        b=eK1zS2H8Gg9yYxZyLY457B6FV0VH2vtcKyZ9Yen2H1ceatQcyBRbcis6/77pf8rey8
         HOQWOix7fN+DemUAitdWKeuiYkv1eqjUqPDot+jeDL9KgG4O31r5RU7BiiuARrymxxHt
         FyCJsKrfMe3VQG/3HX8VucqBQ2/YxBz8AZIDAEhjMuySZgn4WF59VLyUBFwfSTNZZ7fY
         +RoDvYRnxEOPq3zPKaAv4Zcz/guuxezBVnvCVqg4PIiyngZhI4R84PbCl9j8bAotsk0n
         M4W0indG+HBG4jXqIn8MJIW+VJDkJ1sLWpAx/jpYZ+tFRYt+66awaNViwOS9NYdxZ0jJ
         FLfw==
X-Forwarded-Encrypted: i=1; AJvYcCXJQFwzjBORvAasEZTyKz65bHEcnIrtIjfQC3cqZ4h8E7HoFV0CBFhThL62BPxi0W1hPrIQO+p1@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy/aMxbS59kK4PL9EdJkOPKN4l2sTo8W/Y9OBeNkZ8l5+OFSpyF
	TXLmZuRrqCq/nrx5bBvr+bKaZXUih/z2YyMYETLoQOho4GjddpZ7dLGYKckgbZ72+0w=
X-Gm-Gg: ASbGncu1Bo45Yt89CPmqNUKZJD5KJKvAx1aKIjOHCxJt77NKWQiGbQo0IP4Fb7W8wvm
	UJrjPzK0ZjGBreJSz++CibwqOlrBjPqs0IcwKJDBl5omF2mBO9bn4UtCObBIl4T0n6PfdtXop3+
	0lPuSUUXB02O2mgYAJtRYcbawhmHZ3DQBi7ffDfpScIvxYuDx2Io/kDeJF2eJEaU2bWm4IBr6Jb
	UiHoXRG4ef02vjYAoQkckqGrg6lPmxSGAcsUIEEPvYpdJzD/Mn82dBiErME6zJ1aeTWxgdKac5A
	hh4cObzmFCAlN7uPuXmgOrO2Y2XmVShINAMwvM+Of3a7EGlvELOb/Q3UyX/R2bnIRUuqI+w=
X-Google-Smtp-Source: AGHT+IGUEkMw3AazYidVlvlcKxjjPcFl/fdYDePDntNbpwN9JsZRSDdk3Hds7gIIRpwHgP+c7VnBhQ==
X-Received: by 2002:a05:600c:511f:b0:442:e608:12a6 with SMTP id 5b1f17b1804b1-44c91dc9fd0mr51871135e9.1.1748428936730;
        Wed, 28 May 2025 03:42:16 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:42:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:10 +0200
Subject: [PATCH 14/17] pinctrl: renesas: Move fixed assignments to
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
Message-Id: <20250528-pinctrl-const-desc-v1-14-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1221;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wdAVjz1g2LnOLK8YIe+sx2i+Wtxy0b2lB+2wyeAsJM8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhVOUmo7glA0KmdvgZw8r0O4XKNab7bHjew6
 T+RsAWcuh+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboVQAKCRDBN2bmhouD
 12JBEACByGYIJrWmeVaNuGhfgErqLrs8juvgq1he1oiyCbsIYgTgEq+hkshpq5p167n8sAXxqs+
 6iBVk16DcEYvSI0f8eCwat8zII1LkA4/ev5fMWjxd2Z3FzJswscCWFRIcarUCeBg5Ed+JZ9ZJb/
 sN0DzMJHT590OM6XRyVM/p3h3tnUQvwdzoqV9s5W0m9+2com84VzLAOKGdwYycuo+JYsD5GJuCi
 ueDuDOOW04JWSbUxMO5jxxZLXltdZb9B+y09j/dA+vEAU4rLYngyjux8/zx7evW5JMkCosH02FQ
 s8fr+Qw8tSf0/SeZOU/aJeUXpYvGrvaQefJaFh4YdCEA+bAj6pyNvYMWsIfwWvWaE4uawUoQ5Gp
 TJAyZt161KRilFdsJdPhEEcLzR1oML7mLl8Rx6++k0mb7HwaPoSudr64ZzDrwr/2o40pTX2dALR
 xcX4+WF5UWmuN6JwMHP4Pe92IW5urSZ80lzzkkV0kNpzmkBRmr2RmLNe1hcbRvVAO3T7zQ1Ji2V
 2O21d5pDtSNiPIS3BtOOFEf6m5aKJyk3wg64Ze7CTiqUj3VPHlbpMT0VrAMdmrjlY/4h/Xo8axA
 Zo9kbbNMJl2+zQofVcJ2at2Y4TaN2qo9C6H5+FzFTRhJ9EQpHJdf8J7TMx2fib06ZHvXH+XMnBf
 rJwlspjRton9X2A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Assign 'struct pinctrl_desc' .pins and .npins members in definition to
make clear that number of pins is fixed and have less code in the probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/renesas/pinctrl-rzn1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzn1.c b/drivers/pinctrl/renesas/pinctrl-rzn1.c
index d442d4f9981c908389407275522b936dbce294d3..fb874867dbfb9877b012988543ecbfd1bfb11270 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c
@@ -680,6 +680,8 @@ static struct pinctrl_desc rzn1_pinctrl_desc = {
 	.pmxops = &rzn1_pmx_ops,
 	.confops = &rzn1_pinconf_ops,
 	.owner = THIS_MODULE,
+	.pins = rzn1_pins,
+	.npins = ARRAY_SIZE(rzn1_pins),
 };
 
 static int rzn1_pinctrl_parse_groups(struct device_node *np,
@@ -878,8 +880,6 @@ static int rzn1_pinctrl_probe(struct platform_device *pdev)
 
 	ipctl->dev = &pdev->dev;
 	rzn1_pinctrl_desc.name = dev_name(&pdev->dev);
-	rzn1_pinctrl_desc.pins = rzn1_pins;
-	rzn1_pinctrl_desc.npins = ARRAY_SIZE(rzn1_pins);
 
 	ret = rzn1_pinctrl_probe_dt(pdev, ipctl);
 	if (ret) {

-- 
2.45.2


