Return-Path: <openbmc+bounces-554-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3E1B3E4C5
	for <lists+openbmc@lfdr.de>; Mon,  1 Sep 2025 15:25:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFqNQ4bfSz2yqP;
	Mon,  1 Sep 2025 23:24:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756733078;
	cv=none; b=dg4knBiRJFzOToy6eyZDn2hvy7Wkzw7sZ2pqhm5ZR+JTE9hGOUMoRQ4/9pzs/B00W7xGb3s+yqTovXM4lxSoiS7LmYpK8zGYNS2KCMLshSzbrrZURHIVFIvXGG1CYDYRj1HMkfKOOctRZ4U2JQqoOSwDPmLun4s8MngyaXJLuxB0Kkt9sSK7Wq2Uy6Wk7QwXrstD8wxx7XEZm2vq8zqUNOBnjNp0/oPXKEexFVR3qkuaIJl3dJN5KGmUJwMrrsok73spNG2B4OWkKH1XMlcnjNiUBwHBYew+yzFFNG+P3IO748DcRWAnH1qNeGArDXjWW09jmZqwummxQyIjvRfPVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756733078; c=relaxed/relaxed;
	bh=iWlw5Ms5yTVtOwXxGv7Ts8LYQp05G0qkRwNzIO4qfS4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mOMz2W09zgR6KcSpyYK/2v7s1qKPShzm9tcImiB1I0cebOUmmx3jtBcVZCmPBAYVn4KG9YR+nIAyH0hA8tdOe1xX1xA11932LHiHlkk+c2hbieSUfs7slQCn9HfLR8duF37ii+qOyoE3/F1kU6EMJ+697mw6rFzY/7KDVkJiL07AD7Y3t+5fKhAiBWthQ+5y4CJyzFJAlixsIHAHLgqV6vEu3HGrdHTT1dNUG/9L2NGO12e63vJ+mkyTxWt5D7z8zVggaBQmTio8lldi3vMh+wkT1abDIiPxIVnZu1ZL44YQ4EQWeV7W21oqxy16sub7AjKIeMqof4/CF2WhMhBmZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WksZfg8b; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WksZfg8b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cFqNP4Q5Kz2ywC
	for <openbmc@lists.ozlabs.org>; Mon,  1 Sep 2025 23:24:37 +1000 (AEST)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3d48b45f9deso915506f8f.1
        for <openbmc@lists.ozlabs.org>; Mon, 01 Sep 2025 06:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756733075; x=1757337875; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iWlw5Ms5yTVtOwXxGv7Ts8LYQp05G0qkRwNzIO4qfS4=;
        b=WksZfg8blUchiXRZU1GBA9GlmZucULULdIMRRA379SBL1psEl+8pjWXjlpIour9DHh
         cmkuYP5ifrFiZlwNKM7VuehuhI3OiMAeFBijnedsqqf/+XhtCTwvYeAgZDl604OrTTXC
         GVsdANYwqW4fG6QLAud5fnfBoIK5djdS/P2tZfCYm7pnsXTOfHj6xBLdsKxAc2TjuUeY
         iQ8EIA50cSrMcfn8CdidWBqeXUtYyhqSYV3kuEQ4lrbV8FdEUlXCQjGQOdcd5deQo4JE
         RdoLMPq8SUheS3e3TeBrHmNiscGdO42baizNFeuf/x9qoGc6swmvISD6xiW+9XYDnpju
         8lUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756733075; x=1757337875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iWlw5Ms5yTVtOwXxGv7Ts8LYQp05G0qkRwNzIO4qfS4=;
        b=trpqcfJxEeG3OPZeGTAmStzXfFKiklaPYz6Av4Es6h9fjztyiz96b8YxGUeyKSARWo
         lKpDW4/7f/UdjNmVv2P58xPdZb+nYi/0oe93KyOLJTgAjB+ZtOeccsUeVRa7uQME2CZe
         wdwsNEj+fcicwgl/oKrdh1vxQgqnjrXoxzsgKi6g8MGloNcfLzgiTIUpb3mpGNsPKVsC
         Fxi4Y4i5SE5Mczz8lPE84NHDcDsHBiUboV6w4YsRJEoc2abaCdbAwYBddHmYsarRzFwq
         7LhlmLJQt2N9ygES/Qgija1MSeQbwUaYvtWWkIPc42Dfh8lrNqOlsrTu/MZy6tOyNO0Q
         loGg==
X-Gm-Message-State: AOJu0Yz37TNZqZWEyZQX1hhYBDRnrLhvQ5h6mB/Yhu7OzsCxLbN+7Hd9
	RIllGRaiIV+Ce+CDq7+7rtWxEgUkaQBMVy3TaN594mqxTQKdWJNlAZur
X-Gm-Gg: ASbGncvuP4kCgFuz9pR/FmVQsbySSwft/YQufE6vfK/Yyqeg96gerktNFEfOsghc2xw
	uHXK5Ko+fGcGT1XlaeU76r03cnxJGkM5Gt3v4BqzuaFA286JnHJKQ5MsYbigM84WCei39OeX4Se
	jNlM4feruXr8rPnNYSdbs9vgYYG/hBjqioEoef/qe+SAqp7Ssh/bHtOUL3yskDvMYrs/8w55zYg
	i92Y3BlW9bLGyROEEA/t93E+0CBNBDpaIOfLE+AvWQjKpe3Y3fJJKc5gKRvgwYve56EaoK8VUIb
	OBqE0vikiNbQTwCz1riud4X+lXb1Qtw0AckBuMAQoOUxfIBCIxCwdT+JjiFUegwZ5fKdN48Vw6T
	Dx7NzZFAi2wl1fZu1/HKHMJJKDPNMSilYUEg/VH5T1NpC
X-Google-Smtp-Source: AGHT+IGFXZ6qbwJ3kEV+0fxALLiC8wRzseV8lfDHfGg7Uz+h42PgAbXCYv+xNFrUtwJWgrqbFGpWjg==
X-Received: by 2002:a05:6000:400d:b0:3d7:94bb:cb9d with SMTP id ffacd0b85a97d-3d794bbceb5mr1508219f8f.3.1756733074684;
        Mon, 01 Sep 2025 06:24:34 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b8f2d3c88sm24359635e9.19.2025.09.01.06.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 06:24:34 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	avifishman70@gmail.com,
	tali.perry1@gmail.com,
	joel@jms.id.au,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH RESEND v2 2/2] arm64: dts: nuvoton: add refclk and update peripheral clocks for NPCM845
Date: Mon,  1 Sep 2025 16:24:26 +0300
Message-Id: <20250901132426.3081648-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250901132426.3081648-1-tmaimon77@gmail.com>
References: <20250901132426.3081648-1-tmaimon77@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add a 25 MHz fixed-clock node (refclk) in the NPCM845-EVB board device
tree to represent the external reference clock used by the NPCM845 reset
and clock controller.

Update peripherals (timer0, watchdog0-2) in the NPCM845 device tree to
reference this refclk directly instead of the previous clock controller
output (NPCM8XX_CLK_REFCLK).

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 9 +++++----
 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts     | 6 ++++++
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index e4053ffefe90..ee7da5e8f95b 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -47,6 +47,7 @@ clk: rstc: reset-controller@f0801000 {
 			reg = <0x0 0xf0801000 0x0 0xC4>;
 			nuvoton,sysgcr = <&gcr>;
 			#reset-cells = <2>;
+			clocks = <&refclk>;
 			#clock-cells = <1>;
 		};
 
@@ -71,7 +72,7 @@ timer0: timer@8000 {
 				compatible = "nuvoton,npcm845-timer";
 				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x8000 0x1C>;
-				clocks = <&clk NPCM8XX_CLK_REFCLK>;
+				clocks = <&refclk>;
 				clock-names = "refclk";
 			};
 
@@ -143,7 +144,7 @@ watchdog0: watchdog@801c {
 				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x801c 0x4>;
 				status = "disabled";
-				clocks = <&clk NPCM8XX_CLK_REFCLK>;
+				clocks = <&refclk>;
 				syscon = <&gcr>;
 			};
 
@@ -152,7 +153,7 @@ watchdog1: watchdog@901c {
 				interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x901c 0x4>;
 				status = "disabled";
-				clocks = <&clk NPCM8XX_CLK_REFCLK>;
+				clocks = <&refclk>;
 				syscon = <&gcr>;
 			};
 
@@ -161,7 +162,7 @@ watchdog2: watchdog@a01c {
 				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0xa01c 0x4>;
 				status = "disabled";
-				clocks = <&clk NPCM8XX_CLK_REFCLK>;
+				clocks = <&refclk>;
 				syscon = <&gcr>;
 			};
 		};
diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
index eeceb5b292a8..2638ee1c3846 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
@@ -19,6 +19,12 @@ chosen {
 	memory@0 {
 		reg = <0x0 0x0 0x0 0x40000000>;
 	};
+
+	refclk: refclk-25mhz {
+		compatible = "fixed-clock";
+		clock-frequency = <25000000>;
+		#clock-cells = <0>;
+	};
 };
 
 &serial0 {
-- 
2.34.1


