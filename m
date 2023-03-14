Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 252576B8EA6
	for <lists+openbmc@lfdr.de>; Tue, 14 Mar 2023 10:26:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbSp06wmfz3cCL
	for <lists+openbmc@lfdr.de>; Tue, 14 Mar 2023 20:26:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qiPeyJns;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=jim.t90615@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qiPeyJns;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbSkv5yqJz3cfZ
	for <openbmc@lists.ozlabs.org>; Tue, 14 Mar 2023 20:23:51 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id cn6so2168065pjb.2
        for <openbmc@lists.ozlabs.org>; Tue, 14 Mar 2023 02:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678785829;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JeKGVI/WC03eOlEsJdjFv73hArgX9QnpUzvIn6G04v4=;
        b=qiPeyJnsv+K8pS31WF4x9qNz9Dlqtc6TdPYkmbUuD3aNglFVrK8MPt8LAXha7/CXSr
         dVQZEuZz+Eq3qSw5sRYjfSreGWxd4QOcA8HoZ00VPmOXcRlLKtKd0n937xOikElDbGDa
         6YS/qXgkRbsM16tz0qs3CgNUw0fe8QfRxqmiysRUG1ubBSmdfWcaX5SjaqMJsup3rYIN
         NdtoGVvbAJyDZcal5UNeiKTnecz4mvd+flBOXY0AbK5Zm9lsvUMUyF58dBNNkU6ge30h
         9oz/aU7QzSCTBaRiAkJg7ruqUiTGs4R90I9gmTWmtx1m5WVu1pOKzSpQi+8oUydX4pTu
         qBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678785829;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JeKGVI/WC03eOlEsJdjFv73hArgX9QnpUzvIn6G04v4=;
        b=njel5JCYqnqNf8Gdenb+5FAtHeAhzffk/WtIfriaMm0cKUVJPSDv2JPrOHc5G/g1t4
         p6L0bbgk6tC9AJ0r3doCo4VXF4kl/iYH3Ls+kZQwgkDhyuJMjT3FXpCRrguFfA6CkLWv
         opIikurS4TEzlWaOGn3JlHtCuIW97IvxJy/aHjphYLGiaWNeBiSJBAN3pWQCQ5uKvEAd
         P7aZpBlg0DIzbzTNUBD1KBiTIwSlta3/U+9xaSv3/keVtice9hKyitufNxyE3EOrYlqO
         QzZmxwg08iSUSZce6fNSottnNPGMVWanGZo4yG5PWBnM+pex9zVFMwLXwKsOhSxlWZbJ
         cjsw==
X-Gm-Message-State: AO0yUKXjOSuVNmRgOfGB0TXwP9cNtFyXJHTUwnvugYCoxFg02+gmFd06
	F58vfJTs7+Ugz5Jy3Kt3Wk0=
X-Google-Smtp-Source: AK7set+FoHFfxEBpFdnc+802scctAQgZN9haiL/SY42/nK47FPrdGr6/MGf4tMTpfuKyczxPhR3Q8Q==
X-Received: by 2002:a05:6a20:d49b:b0:bc:b9d2:f0f8 with SMTP id im27-20020a056a20d49b00b000bcb9d2f0f8mr34449267pzb.24.1678785829524;
        Tue, 14 Mar 2023 02:23:49 -0700 (PDT)
Received: from localhost.localdomain ([1.200.129.193])
        by smtp.gmail.com with ESMTPSA id f21-20020aa782d5000000b00592626fe48csm1120898pfn.122.2023.03.14.02.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 02:23:49 -0700 (PDT)
From: Jim Liu <jim.t90615@gmail.com>
To: JJLIU0@nuvoton.com,
	KWLIU@nuvoton.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	jim.t90615@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v5 2/3] arm: dts: nuvoton: npcm: Add sgpio feature
Date: Tue, 14 Mar 2023 17:23:10 +0800
Message-Id: <20230314092311.8924-3-jim.t90615@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230314092311.8924-1-jim.t90615@gmail.com>
References: <20230314092311.8924-1-jim.t90615@gmail.com>
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add the SGPIO controller to the NPCM7xx devicetree

Signed-off-by: Jim Liu <jim.t90615@gmail.com>
---
Changes for v5:
   - remove npcm8xx node
Changes for v4:
   - add npcm8xx gpio node
Changes for v3:
   - modify node name
   - modify in/out property name
Changes for v2:
   - modify dts node
---
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
index c7b5ef15b716..7f53774a01ec 100644
--- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
@@ -330,6 +330,36 @@
 				status = "disabled";
 			};
 
+			gpio8: gpio@101000 {
+				compatible = "nuvoton,npcm750-sgpio";
+				reg = <0x101000 0x200>;
+				clocks = <&clk NPCM7XX_CLK_APB3>;
+				interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+				bus-frequency = <8000000>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&iox1_pins>;
+				nuvoton,input-ngpios = <64>;
+				nuvoton,output-ngpios = <64>;
+				status = "disabled";
+			};
+
+			gpio9: gpio@102000 {
+				compatible = "nuvoton,npcm750-sgpio";
+				reg = <0x102000 0x200>;
+				clocks = <&clk NPCM7XX_CLK_APB3>;
+				interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+				bus-frequency = <8000000>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&iox2_pins>;
+				nuvoton,input-ngpios = <64>;
+				nuvoton,output-ngpios = <64>;
+				status = "disabled";
+			};
+
 			pwm_fan: pwm-fan-controller@103000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.17.1

