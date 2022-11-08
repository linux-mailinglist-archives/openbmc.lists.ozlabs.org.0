Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C0E62234F
	for <lists+openbmc@lfdr.de>; Wed,  9 Nov 2022 06:03:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6Xt352c5z3cRW
	for <lists+openbmc@lfdr.de>; Wed,  9 Nov 2022 16:03:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PucDMhDh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=jim.t90615@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PucDMhDh;
	dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N62qN3wpJz3cGD
	for <openbmc@lists.ozlabs.org>; Tue,  8 Nov 2022 20:29:20 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id y13so13284774pfp.7
        for <openbmc@lists.ozlabs.org>; Tue, 08 Nov 2022 01:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qcp59m/6g8ZeyzO1wSKvpKlbq0R7mKURt6i4dFcO8bA=;
        b=PucDMhDhbm1l7tehLVP1ERY4yKN4MhaOUebhgpIEblxD8QNLtG55cK57MA0hxo7SeC
         1CVXNcBFjpjv9Uqw9kHtZI7M5mbvvcWECuMy24EZt7yGwVGdjlCTk1kj1nnxEttGELoL
         Yhi/KcAaiNCGDcWP7+osPHQHWQRnnIdAvFztkU8fTEYECMave6ywX/TUITyUfghAF4m1
         eb5fifQGi5eRhwQiizRR/D4SS0QWZMz6ES+LfBEBc91C8WhLTA9VIOnOIXYYHFKscmtI
         oHjIF2VnEIhlUPJd2RAVh24ay+ahIvIOD8L9Q3Ng0B8SsrNnd/VDGLL8bdyWiIENFuYy
         UH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qcp59m/6g8ZeyzO1wSKvpKlbq0R7mKURt6i4dFcO8bA=;
        b=kTTJ24W6+kSw331F8vDWkIr/M+dIg07VI8pBqCJxOlN/QhG27hOUiddT9LvEY/rskq
         V+zdPUXZYgA4ysdt6BLf572/9yx3NIy0/akK/NKIvUdMT3k03RL9xGwClku0OeKFQQCw
         xpgOzTpB3c33BI47B/Ts/HDvaGXAn+m5PgVzoZCeDjQHnXWIQKfm1GbNkglAVkTYCa/0
         9z8K48+eWRjecHsMC5Rmug7hWwp+3q19LkHo55hNBOYOrTmet7Il9qdeQcKWpmUTS02O
         O3eUjTvl8/teloZtvBPKX2LGSiyy2bMDak9oPCD+teC+1Uz9j2yEWQq7MCZQDSvCwxEr
         7BUw==
X-Gm-Message-State: ACrzQf12lfA/gRTqH1Q+YdNrlffi8+6+iUos3SZbJOHUGf0B5OoWKrEA
	zGGdvvA6SRHq34anIyosxy0=
X-Google-Smtp-Source: AMsMyM49ZA+PNOeZNBTe9yyT3If6k61VbM6eeTHMYoVYhZcd/nOTQfeySZebJnjUmxdgGFe+j0EOuQ==
X-Received: by 2002:a05:6a00:15c3:b0:56c:e8d0:aaf1 with SMTP id o3-20020a056a0015c300b0056ce8d0aaf1mr55281575pfu.75.1667899758029;
        Tue, 08 Nov 2022 01:29:18 -0800 (PST)
Received: from localhost.localdomain ([180.217.157.203])
        by smtp.gmail.com with ESMTPSA id x17-20020a170902ec9100b00186727e5f5csm6467147plg.248.2022.11.08.01.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 01:29:17 -0800 (PST)
From: Jim Liu <jim.t90615@gmail.com>
X-Google-Original-From: Jim Liu <JJLIU0@nuvoton.com>
To: JJLIU0@nuvoton.com,
	jim.t90615@gmail.com,
	KWLIU@nuvoton.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v2 2/3] arm: dts: nuvoton: npcm7xx: add sgpio node
Date: Tue,  8 Nov 2022 17:28:39 +0800
Message-Id: <20221108092840.14945-3-JJLIU0@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221108092840.14945-1-JJLIU0@nuvoton.com>
References: <20221108092840.14945-1-JJLIU0@nuvoton.com>
X-Mailman-Approved-At: Wed, 09 Nov 2022 15:58:50 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add the SGPIO controller to the NPCM750 devicetree

Signed-off-by: Jim Liu <JJLIU0@nuvoton.com>
---
Changes for v2:
   - modify dts node 
---
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
index c7b5ef15b716..9cac60734b57 100644
--- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
@@ -330,6 +330,36 @@
 				status = "disabled";
 			};
 
+			sgpio1: sgpio@101000 {
+				compatible = "nuvoton,npcm750-sgpio";
+				reg = <0x101000 0x200>;
+				clocks = <&clk NPCM7XX_CLK_APB3>;
+				interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+				bus-frequency = <16000000>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&iox1_pins>;
+				nin_gpios = <64>;
+				nout_gpios = <64>;
+				status = "disabled";
+			};
+
+			sgpio2: sgpio@102000 {
+				compatible = "nuvoton,npcm750-sgpio";
+				reg = <0x102000 0x200>;
+				clocks = <&clk NPCM7XX_CLK_APB3>;
+				interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+				bus-frequency = <16000000>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&iox2_pins>;
+				nin_gpios = <64>;
+				nout_gpios = <64>;
+				status = "disabled";
+			};
+
 			pwm_fan: pwm-fan-controller@103000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.17.1

