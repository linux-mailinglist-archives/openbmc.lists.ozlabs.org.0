Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A1F663B34
	for <lists+openbmc@lfdr.de>; Tue, 10 Jan 2023 09:35:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nrkdr4H8Sz3cBj
	for <lists+openbmc@lfdr.de>; Tue, 10 Jan 2023 19:35:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lL1hZzqM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=jim.t90615@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lL1hZzqM;
	dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrkbJ2VlBz3cYd
	for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2023 19:33:00 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id 141so7748021pgc.0
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2023 00:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9fhCnX2gnr8/sZl8KpSTepVKdqMVPv6vqBDtH8CyPJo=;
        b=lL1hZzqMfPOOwjovjKw5yOvbON6QEFggCGPT7Yf8MIcqf3lLUvXnU55iL+kBhnGZj3
         37XdmTEFW/JPRDYsxrS16npSC3Ae2YCj4XIb94MfJlE2e9p7dYaWpvQCdi/eEDUbRSZ7
         rCtgiYXGGduBEIfylO4nHQYeFIkfvU6/3bF1HGy3IzusmS8UXP9b78UwiMWPtQtfawKk
         Me816T5hVLj/TzKdh6p1AcKhf3/KyOSJW9gV7EqLpR/LF6HoCGs7JAINeYF44BabL/Ie
         z33lec9oUx5K/Zbs3kjg/mhO6mK/Lw91xZ09YqPxTritRIdsicug8+vldtljO4gE4WwI
         mppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9fhCnX2gnr8/sZl8KpSTepVKdqMVPv6vqBDtH8CyPJo=;
        b=i58wOCEoXskqSqS8cA3K65CDXBylp0uRK5iPh3Yum1hSO9vuFLMtXvunchJu0IXB6G
         InirOwyS8cvEDYEk9a5WQm3QxokwXO0hCBLXCSleEjp0o79thg38an6jZyvjhfUzlqYX
         rQuZo8EIG+cuQWi15dNpy2mGEh6t+7pQ6AWu9H5ozzlzQSs9dOXml3GklAH9oBQpJZBg
         vbzk+9diqM1YUMrTHj3RqcXw2thUJ2yQsdzn3QFuXqlh8KVFUQwaFHMh0OvTFzns/CLf
         qX3di6LuE6BiSwtk9XhcML3w5pQMeUjgQ43AzQQ1kJ6tNWJYESYuvZQjcHCYjPuaaSx1
         qNdQ==
X-Gm-Message-State: AFqh2kqZaUxgehFBZVoavFIoZ1qEGxZgOq4BRiVEpzQJuuD/HL1RYH7q
	U29AEX+QZL8fDujVkwVCyQc=
X-Google-Smtp-Source: AMrXdXt+1+KsiOyg8eXk6O2KdeaAVCpXoraY7fOygQlCKeLI78oms2NSLFtyNAa3d1lGyooUSCeS4A==
X-Received: by 2002:a62:5f03:0:b0:58a:fdc8:92bf with SMTP id t3-20020a625f03000000b0058afdc892bfmr259967pfb.2.1673339578027;
        Tue, 10 Jan 2023 00:32:58 -0800 (PST)
Received: from localhost.localdomain ([180.217.149.10])
        by smtp.gmail.com with ESMTPSA id z3-20020a626503000000b005871b73e27dsm5064950pfb.33.2023.01.10.00.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 00:32:57 -0800 (PST)
From: Jim Liu <jim.t90615@gmail.com>
To: JJLIU0@nuvoton.com,
	KWLIU@nuvoton.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v4 2/3] arm: dts: nuvoton: npcm: Add sgpio feature
Date: Tue, 10 Jan 2023 16:32:37 +0800
Message-Id: <20230110083238.19230-3-jim.t90615@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230110083238.19230-1-jim.t90615@gmail.com>
References: <20230110083238.19230-1-jim.t90615@gmail.com>
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, Jim Liu <jim.t90615@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add the SGPIO controller to the NPCM7xx and NPCM8xx devicetree

Signed-off-by: Jim Liu <jim.t90615@gmail.com>
---
Changes for v4:
   - add npcm8xx gpio node
Changes for v3:
   - modify node name
   - modify in/out property name
Changes for v2:
   - modify dts node
---
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 30 +++++++++++++++++++
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 30 +++++++++++++++++++
 2 files changed, 60 insertions(+)

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
diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index aa7aac8c3774..27462894b90a 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -165,6 +165,36 @@
 				clocks = <&clk NPCM8XX_CLK_REFCLK>;
 				syscon = <&gcr>;
 			};
+
+			gpio8: gpio@101000 {
+				compatible = "nuvoton,npcm845-sgpio";
+				reg = <0x101000 0x200>;
+				clocks = <&clk NPCM8XX_CLK_APB3>;
+				bus-frequency = <8000000>;
+				interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
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
+				compatible = "nuvoton,npcm845-sgpio";
+				reg = <0x102000 0x200>;
+				clocks = <&clk NPCM8XX_CLK_APB3>;
+				bus-frequency = <8000000>;
+				interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&iox2_pins>;
+				nuvoton,input-ngpios = <64>;
+				nuvoton,output-ngpios = <64>;
+				status = "disabled";
+			};
 		};
 	};
 };
-- 
2.17.1

