Return-Path: <openbmc+bounces-452-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE413B25F4B
	for <lists+openbmc@lfdr.de>; Thu, 14 Aug 2025 10:43:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2dzD3cPhz3cQx;
	Thu, 14 Aug 2025 18:42:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::333"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755160952;
	cv=none; b=YsNXpmNjSMsce8Aoqmwt+wWuzyzLOqqOI3P2U+niAY8dKrWjQVVav+1UrFAtFmNvqF/kLG7FYSGHJY9/xTvu11FP16W8ZCqp8bY2/hOvWaLB5I9/QmDdN6MZsd3B4YYET3A5Qj6yyJfJmqf30bQsE+fEdIHBYqF7WYgjSEtHwAf1ADyZCXdYhdh2H8JRvtIc952PUwq21fwEVKJs2OAo/cw7TRDOYOJr360fPPWKlWUCn+rkusx/VW0k5CyZpLzI3uzSEzyPTaeXVxGrbNgB8Kpue4SMJtcNXxP7wvMQXIu18Vs2vGSoBqiiXZq3rI/IVXbdlbuBYRlVzkOToMss+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755160952; c=relaxed/relaxed;
	bh=iWlw5Ms5yTVtOwXxGv7Ts8LYQp05G0qkRwNzIO4qfS4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QwX1DUJ48ubAji2+y6pBdnzgrUqcB6qSAtA5lLAs+MxbzGjBJ1UXBakBf5eH/iYRBFT29iwsGv3MiFtLeANqFXBbg93z6/xAqXPjzbiymDoSCSSRcOrUMpjlCFemlxOt5DD5NiNDEUJBRU3AthuEHXT0WqtvW8A6kBwU/Mj15tnTFlJ5KldsN8kGo56i1hV/lQIRtWP95jRwo/cZdwim2xLv6Vy5x/MSI8nEyDrC986vBsvXCLC8/e16gV1Gys9pnJMppMN6bpOHjRW4MCBfHATxKwhx9+GQFFi4wW1tWWaLNQROXooYYTZCeCjBe/Hm/F700GANGvmZjZDls2OwRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fmDlqGDo; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fmDlqGDo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2dzC49pVz3bkT
	for <openbmc@lists.ozlabs.org>; Thu, 14 Aug 2025 18:42:31 +1000 (AEST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45a1b0990b2so4325045e9.2
        for <openbmc@lists.ozlabs.org>; Thu, 14 Aug 2025 01:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755160948; x=1755765748; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iWlw5Ms5yTVtOwXxGv7Ts8LYQp05G0qkRwNzIO4qfS4=;
        b=fmDlqGDoRmqjqGu2g99iWFO+T9HJm+GEtGAakY/EGH9KzrQj/4b2gN/R8DNDvF68op
         CpfaC/hhBJU3XDAb37JruXet1dovsyuV2vv7OH/XZ1PGmGHOyV73JWyiLuDb47crikb+
         mSnH8X7vwSpgJDZX2EZrgAxdSL8sMQKUFiIHr74v5p+R+HEXzObjEMcZoXbrm6/kJoee
         6i470VhgJ0Q8sajLFOq+Gf9hYvY+aynCZauH+Sg41ztyMGUbpWaSwXeF27OuEaecUg99
         HoRSdH84hssVPUAm+CGH7qF/N7Qm+Sdlbmh41mHOz8R1+OGv/X6pI14acR0+OBvYFtH3
         NUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755160948; x=1755765748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iWlw5Ms5yTVtOwXxGv7Ts8LYQp05G0qkRwNzIO4qfS4=;
        b=nfMel2Hl9/S4+hBst97PiNNaWV/wFiC3/a3Y1JgydH8AJFpwTpL0znrZ+PfbJmUdIr
         N7EsslWQ3JFxHJ6oO3GwMuzNgbvA98LFxJGelR/kDuc5AqdAzZ6A3WQ7vCoNiG753qZ4
         e7fRtKoT5eUd6u7p8PkhKogFyYZY8PULns61TZjYALwnoYu6KE25w5zWlaC9NkwN+nln
         eWV83NtlFlqodN8w+GzYo4J5jtnMUjODz+lNl+v5whb75kXJfc7s7RUTXpQZVm2KJV3A
         TLxwKReHfMUjsoYUuzDeipDpb4DAc60Pek+JruDUMCEOK6emCqxLZacG5sQUbYEEsJ9j
         c6lQ==
X-Gm-Message-State: AOJu0YxE06E6R056PeMp2dMbmIuQ9v0vC6ik2zrcb7oD+c63xXxqhIul
	2HqrQpWKUNWmYI9vV+TZleERf19H+LzrlApJiNRBx8DFpYDue0Wz0q0f
X-Gm-Gg: ASbGncvajcBXj0OZSWJuS0WTL4tqE/pizMlt3gbT9j/RKO3ABU/6Bh0I598xuaueuzk
	2Cvaa077DFRK5Ft+GArQq8WvXMnsgBnYoaZbKBwDHy6YzXFFXN47AMWFPCRIC8oZahtbZiNtvFp
	zCEsX9JuoEJ7XVp4k/QeFgiIf1qndSrJx8d5mlkaQ2XGNVTwOn9iKjSLi8nqVbgJM9KvF8zcN1v
	1s2mQdUj32PSLke6WQnVj+eP/qLLAnzqv9cAQoUhxb4IxlTkj1Osz08tpoHFzCBb7s9//RPlqCi
	9vh/4dpBVtUFuXPS8ghZ+HXHPek66yNnzJa6sL9WdDN4dS/eozG+nI4NCmDhx+niNhNUyAXYs4G
	xr8CsNdS7tppBopnD1InmO5w6EvUCza8jxw==
X-Google-Smtp-Source: AGHT+IEU57fYybpMMX4gtzdy06CQx4fqP4lkitpYTPTwDLN7UudJOEyCJmNn9h6kaZbB3y6cb0LX6w==
X-Received: by 2002:a05:600c:3b93:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-45a1b605070mr13966415e9.2.1755160948068;
        Thu, 14 Aug 2025 01:42:28 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6e336csm13114565e9.16.2025.08.14.01.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 01:42:27 -0700 (PDT)
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
Subject: [PATCH v2 2/2] arm64: dts: nuvoton: add refclk and update peripheral clocks for NPCM845
Date: Thu, 14 Aug 2025 11:42:18 +0300
Message-Id: <20250814084218.1171386-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814084218.1171386-1-tmaimon77@gmail.com>
References: <20250814084218.1171386-1-tmaimon77@gmail.com>
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


