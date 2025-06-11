Return-Path: <openbmc+bounces-166-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E34A3AD6421
	for <lists+openbmc@lfdr.de>; Thu, 12 Jun 2025 02:02:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHjNv2Lpsz30Qk;
	Thu, 12 Jun 2025 10:01:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749622514;
	cv=none; b=bx3b4PV7RY770O/YJrsVYrJUfNEsOW5VNALNTLX+mpHrI3zCTnx8PmLer4m1xGDkNblyhmFE2DgFTFEymC+Fwy6nCcAk6MZ+ZAtayIipoy7kgH37OVLoE6Tf9ewdyvziMZL0m8sxVHjgH/uzsbiK8wvXkcVgFXglOVxq6/3AkZDa4YAf3uxU2Y8TDyhAnQwsAdIzHIA23Y49/Zf05zKqn9XXQH+IX078JrA7RzmvMwsjxc23UIMdwzkMZrATXygptIZrvUTk7t27ypVTPb2KvzUJdgps+bsGHRNuUrFOEGWMLTcnt76RmxUMgBt1J3xtOuYgYyEslBLJ3rvwu5XXbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749622514; c=relaxed/relaxed;
	bh=wvIZrAnHYUbgegc3KzvI7IvlrGTu2jq1NObvCezVWR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eFkLXhLMZ/oUUOlTrbNu+vLpZDDtjhp3BnyxF7V8/QwmBVPZU6tOoRzLeWN1kU8/mL2MUTIaklwptrmI+IiDizWR6JXvlr48O0bfZzRoU2XFbDxZQ5LpIUAyvTEGDyJy8UOrQWI2gidzpJMEAyAuNTDxAAEwfMf8k3o/DIckKf0I6vU1yMoxzGbqZJsYiO+1kMUiXI+2AE+qxBvz4F8fvj1C5NnRP9oYofevdHNWYfEB8ltrHtvjDQGR2WvjYsSkBVJrhLwqz+mO/zJN4fBN3tjFBP0sR6ymw7TmdcTSUaGLywMspKxJ4j4BpCswl8C7AFtmXiofWmeVQhc8w5nkzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QAvPqxhW; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QAvPqxhW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHFkn0zjXz30P3
	for <openbmc@lists.ozlabs.org>; Wed, 11 Jun 2025 16:15:13 +1000 (AEST)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a4e6a0c274so24927f8f.2
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 23:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622510; x=1750227310; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wvIZrAnHYUbgegc3KzvI7IvlrGTu2jq1NObvCezVWR4=;
        b=QAvPqxhWoV1TOBC5rfOBaChhp09Hqo5kjzlbf9PTRfXzxyuKYWkYcpgv7L14Yu6IsL
         RcuwgQ43gjsdZGmMCnF0S3k8nCIR3SiuMD88fB/aUGmPQNnKs8QqkW/iSGixd1V2F4W/
         AUdNnLCl9swtYwpdmc4VGFTKEna6F11Xzq00hmuaOF7Fz1oTt1O9z00GZocbj8Kr5VGl
         Nxa6of+uN9Xr77qO+AAACfZlMMbv9AGKX8W+4WVVxkGkNveKDthHxowsDJHdi/d+yzmX
         UL9HazwEkkHJV97Lw7wmLbFkjbfOCkr8zj2/nbpEIbn4wMTs8+BVJe8sD9Ucwjs+suUD
         HNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622510; x=1750227310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wvIZrAnHYUbgegc3KzvI7IvlrGTu2jq1NObvCezVWR4=;
        b=OZ1NGM3QuwKqV7uy2k0chrQbcvZDKv6xPFmalZdIgdAfDyAt5aXi4rRvla7oExWY4+
         MIWrK1n8y8z3RVMz+IYEgP9092jewpzTmKX6m91zAmQkIHANy2uwEbXp6JNpaJZ9dNHW
         5UotCJUN0C3pdJcYfy8J9qPhWkDT606KAHvEQNbNJfRi6s+iKxi1Mvdr2sYUGLB6O1BE
         1DtGNw//HqwfTHn93X2pXJiaKgY6NF8u/oSV7bCeyNKns1d60dxExYEAMlahR/7GY91W
         MZZWwRhRBTHRIUvuLavOUeAGCsIdm50brVWRcKvXTC5/JdRP4o/QnWrS6oaMfzFpNhir
         v/8g==
X-Forwarded-Encrypted: i=1; AJvYcCXvIQyZ0MScJ8KS7SqOlaVlGvOCSU50uPVAAbseWd6mhunWPa/OGe6PECQUV+RtbcxEQ0MRXvvx@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxMWuvG3105g9Lr5voOlAS6JGXlKLrfmTcol1pGmXip9WHQjd5M
	CZ+ZNzeOMa2BSA5W//JsbGPOjzJqkvw6K4WBcorq9D3EkU5WPvnBewO/8bldO5uN+aU=
X-Gm-Gg: ASbGncvEkkMn0UUY8ZMHKSCMJRaGn/lOAAtDLO0/ZoVdHMHEH1W+y+MCOwpMWJiguwz
	k/sVR91CSmDBV0jGAVpmK9AgvAF6lEgtOpaU4lcYJn0xO9NbgpOp59Ik0lO7E9d4I6lG6NywoDj
	Ga4NMcaIBtXbM8GVsKkpV2xzCX3cPcAfCh60rXuURGjDKjWtuOYmTzmwsU9Lvi0pkpnuyeVbv3b
	FFGC0lp7DSQGLZ+7XvXzxS/OYvXFm2upLdgu1tWz8AVcQsCjPfFWlWSv0UBCpPyKM1rChGksi1F
	jw/G1gVngZV8RBRKcu5omoc3uqIk7lPXl+1IIVjE4dtWpHBMgqv+ChkC6OMoQADjJgCbYQFqgno
	M1UtH8etvnax5YUworw==
X-Google-Smtp-Source: AGHT+IE7ZMpyUDf4YrNSUvsjoRE3vjRVPb6bVXPGoeL9ls3/WZGat0okcbwks4ptZKut2a4VQEsADA==
X-Received: by 2002:a05:6000:18a5:b0:3a4:e667:923d with SMTP id ffacd0b85a97d-3a5586cbaafmr541720f8f.7.1749622510208;
        Tue, 10 Jun 2025 23:15:10 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:15:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:49 +0200
Subject: [PATCH v2 17/17] rtc: stm32: Constify static 'pinctrl_desc'
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
Message-Id: <20250611-pinctrl-const-desc-v2-17-b11c1d650384@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=923;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=aZiHVtAix4Bs7VFa47r9w+gaIOPFsTrPZZVeoeZFBbI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6t5SafcpPp5dX+SCVOeGb2hFRBkfuLb14pw
 s7c8HNmfV+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkerQAKCRDBN2bmhouD
 11knD/9M3DV/vwXFJpNByYjPAAfPbQYiYkwFNYQHUnPzXNhKs/vugtZWoOplA3JWYFVV83HKQP7
 uw3WamLIyTbIQRBTc1s5kYotDILFcXtEuSZn9ut+zGmEtrMVigSPDvqgokfS+ZQSs6dQPF5ZJv7
 +aqYtV+yIAgCJ5de6A8vYZsWp6UYmn51U4Y4R/OX8UM6fxzj+bbMuXr73AsweooW/WYTwxs0tGQ
 u8J/Ig7SVBkSMfYTdGAi2fabtexF7dXOeVyVlmbn9PdktSW/PsChHgaxt74g8YGyq8RAVS7G3oy
 Wb5YIe+nXI8oxp2pRHHcp/1xme8/Dq/OHlHDjYlqltkPGqKUpbDCTqOMbfwl+oqk832IU9YSTYE
 6qMWelzKCzuphqYOP+gk02SE2WKQ5xuQ3kLSCC2YtcSwoP3/V85G4qFLQm2dXZHHW1lAjFiMdL4
 k6iyeo+At8cXPMKvUYLbuCfzKzXpCJ1F45XL0v4mlYrRtXqlWYkAdPq93S3x5jij462AEvNwTz4
 G6DrpD8SbLh/EnkF2C3h7fpu++EsQsj3fXVaN5uHzzibtagMfWEF/xN9Li05E8PYsIhiqmrijA/
 blAWty+7bSqiSP1NbqhzH0zmIcCtAbAzmN9j6DHNVcQq5mzCAKwkNBKtxMNJ2suuFDzyHqWvfGI
 a63Jhr46asoT94w==
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


