Return-Path: <openbmc+bounces-91-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6E9AC7508
	for <lists+openbmc@lfdr.de>; Thu, 29 May 2025 02:20:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b76Nr0z5lz2ytV;
	Thu, 29 May 2025 10:16:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748428949;
	cv=none; b=MLvBqx5l1e1mLZkxlM5J2D0Z+N934lVOp2okrjMpcZJENoVsvHDBWw93B4CLqPps2Ig1Rpogn+a7yGrB4WSfve9zjrCX4MnRxUIgnlrcgk/6BkF7Ghxvx8v5IZcctfaaVVFU2xqmnkJNUUure9Qq7G8EQqln2bllfUgV35q2preFeOfwMt4VQEekLH6VBNp9HW3rLBVqPzZACOU7rXgWj0jXQiMOQRry0a0TMYWRnLXE/2BJbHcIKk3iLNa9TMZKkSW1/qjyz9H6iSaB/uoUBS8xqyoEABO1E5KwvnLKKLZ59LahjAF6xzqlMiYfickhVG4vNk/dxBV5CXprAhwQxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748428949; c=relaxed/relaxed;
	bh=wvIZrAnHYUbgegc3KzvI7IvlrGTu2jq1NObvCezVWR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oD86EAy7gtPocItR+SvjvlUvNEEf9mlaIA741HQk/dNTC7bB2ALhqGgW8bCDu6rvrYv60H7Y3Z2c1U6L7ZPYj/Yiy7XHxH4KYG6mrpxbVp/dkAlk2dR2gEszfvqjDFph+R09ITC5bwriEdMCa7Buo2YpebIJz1HrAPtVXOndBhb3nqWQk6+sksvCzaKk0WzSJywrEgyuxSzwOPUSUPDzotZQMxgX8qEeQBrAA9HiFSBHqxStUUf7ebBBYI+BY4Lre2r0TtuiVM+etaNfxfDoFjk3DSWU2+hJTPUDFcK+BFd8kgKx+s31fJGu0NhjcFl1RW3T6JUwEq22ASIi2bcAyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SC5QfHPe; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SC5QfHPe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6mKd0JjBz2yZ5
	for <openbmc@lists.ozlabs.org>; Wed, 28 May 2025 20:42:28 +1000 (AEST)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a362e099cfso733066f8f.2
        for <openbmc@lists.ozlabs.org>; Wed, 28 May 2025 03:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428946; x=1749033746; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wvIZrAnHYUbgegc3KzvI7IvlrGTu2jq1NObvCezVWR4=;
        b=SC5QfHPeZFe+ZVMIKc9gDOdiSfH8zPu4HjRImZojoIVxVtUKWsP9P4yOqZ9YtqiQhQ
         XvlAbGhgIUFdYSmmOedZD4JprqnJeJND+qlUdHBgy0fugewUZnkUMKEpj31fnMi0IxFt
         2uC47S6+WEqDmjhKNuHomSw1oA4F9B85pYavkgjUDLAGPnketzgAj6jzfl8N3trBIQNJ
         cppcipssIMeZmO7bxUfeV3PmM9rgvn1HRM7FQJdyaVEq4djvdDihexYRoEZtdcWAnKA5
         K+J1G225aDljr+PpubnR8pnE3yHLCRvyJpktBQG7ixCmcnFNZa8kKPxYtd5eDwFWyklo
         DGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428946; x=1749033746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wvIZrAnHYUbgegc3KzvI7IvlrGTu2jq1NObvCezVWR4=;
        b=FVbm4KymxXQ/qvCUTC0ztAZifSkQ6Mw+Ahbd65sj0oDZdtn/cOgjSIdK6Difbqp1lX
         76zZVUA/ICSEoLxz4b4aXcWj+i0EgeWRoBpOqayqB+czMRaGcWsYgav2qL3HE2AQeZK0
         6Srym61aFIqMV/Mfy3TWIlef+qCD0gy91K+OIF4BIYRbAUCRVMxE3puLuQ2wg1XefDs4
         lq4kW+nzIB/CPHPG7MZj25QAaIRAhEa/4M7jZA/3BnvGXRRx8PQmCbVCexSzxXqgFMlV
         BpQHLL+GusqN2QPyD4qdY9GCr+9xDOyW0o5nEcYh9U17XfYhVMGYnt1fRg2x+MvzwJUN
         8UNA==
X-Forwarded-Encrypted: i=1; AJvYcCWSr/em7K/OEy/CVnPDl++cPzoiT7AmV7ohrkeMJS87jVF1ovDWqVB+h1Ma2B1Svdsemx1K3QjT@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxFiXgTnEmRKXXtIoQ0qSPfq6wpmRD1siVTKcP8xkal2btUblAn
	NOCM25L9r4GEbrxtC+mLy/LdPB4trmZdN50oQkT873qFkmDdqWKwC3VyLvA/HmhEiGo=
X-Gm-Gg: ASbGnctdn1MAEXfV/sj0qPdpSBqdOv7IzooT7r21uXtZDiRsEBrASsmHhVUzcScwfDJ
	+mkxfBcM77fDcxySNCya1c9EXll9XcqYBFKo11+5ctEUSsXPixoByE/4S/7xyEycdILcpg70vQ5
	KjFknm7k3E5mq8sz8j/R3df9H7U4e03E5BdkDRrPrtYOclLEz74NXtTaM2RjYvsYvBbswKduj0+
	fUmRtsBFshoDQeIyawRCtdJ2dbD0RApuygi4i3V9ussGDqzhHvQMfJwKpqodYBQ9IDNsz/fT9kv
	YuMzs5daSCSayKb+wEgP3neDTwsd3E8omA8UHrggfEL+qq9yobytkEkwXZ1lnTINN5yamDXaNpQ
	7uEWF1A==
X-Google-Smtp-Source: AGHT+IFNlq9KlCXRCQr1+6Ymqq9Ne7A6NiNU48Hh7WmaFcskniRj1xewpQQJ+ro3UTKAzWuWhYjH7g==
X-Received: by 2002:a05:6000:2408:b0:3a4:d0dc:184b with SMTP id ffacd0b85a97d-3a4d0dc1c54mr4702445f8f.6.1748428946040;
        Wed, 28 May 2025 03:42:26 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:42:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:13 +0200
Subject: [PATCH 17/17] rtc: stm32: Constify static 'pinctrl_desc'
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
Message-Id: <20250528-pinctrl-const-desc-v1-17-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=923;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=aZiHVtAix4Bs7VFa47r9w+gaIOPFsTrPZZVeoeZFBbI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhXAXetqzUvjtim1sn5fQnWeOfKvyrbA0k7X
 0F7r4JYgYKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboVwAKCRDBN2bmhouD
 1y5gEACCSmP7bayECWKFTkwRKQ26DxhFqjfLlRRjLxFm5/ZteZr52oR68NuAqE5Oteaw0uuTlF0
 AY7psL9i9caogUFyGEHFJLQoNlWHJx87dbPtNhMZbGpsCLwXVf9MNN9NM5+baphXdCKj68+Ffud
 mc+WQUO8p0rqIbRViIvXBJ6gAx6Ilh7Q8yFzuoVIEAV6I9BDpcBgRtB0mqwZfNT1P01nvvfn/HK
 0/jT3G9Vdnpc9i1iTCLhpNp/FZupziVL6jPzDf47eWUlT3HFPpaJJ0tYcLLFl85Bsb82X73rnKM
 UBkCUre2kyXNDYjCNKOoZChLO04ZipNp38cUsCGyMOFi677HtzDsxz1RSX5Rbcbla1EOnS+6Zi6
 wES2PU+vUxe+LvEjmBnfAnsp4Vv47qY8+rU+v+N/7L2UAOT/N9w0X38a93OxUVi8HaJ071gheJB
 QCoBqlVg7+rjFK0nodd/1cYnU618gnyxlmtSWGKEOE1t7M+ApTiup2lOqvjt5YqTWangb8P6mI4
 91zeGot+yAXPL2gIH1Z6qaPZGgJ8qD+xTXRdP2qbVHh+EYSYcb3iCINKLCkSmeAA113O5CegW0f
 2YlveQzrIRHcqQzevdatgXRW8aDA6/KL/GFs07DAXEI2lUdBp+jh/3BAyA2S//my1rkpdfbhzcL
 ONXQAendt+UGD9Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The local static 'struct pinctrl_desc' is not modified, so can be made
const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Patch depends on this series - const in pinctrl core. Please ack and
this should go via pinctrl tree.
---
 drivers/rtc/rtc-stm32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index ef8fb88aab48a0edad19ae5872421815aa04fe46..d4ebf3eb54aa9e91c8e9f8254f571c53794192fd 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -393,7 +393,7 @@ static const struct pinmux_ops stm32_rtc_pinmux_ops = {
 	.strict			= true,
 };
 
-static struct pinctrl_desc stm32_rtc_pdesc = {
+static const struct pinctrl_desc stm32_rtc_pdesc = {
 	.name = DRIVER_NAME,
 	.pins = stm32_rtc_pinctrl_pins,
 	.npins = ARRAY_SIZE(stm32_rtc_pinctrl_pins),

-- 
2.45.2


