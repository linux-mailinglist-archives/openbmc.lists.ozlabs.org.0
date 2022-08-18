Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2F1597EBB
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 08:41:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7ZzB14Y6z3c6Q
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 16:41:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZKYkJK6p;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=stanley.chuys@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZKYkJK6p;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7Zy60nTVz2ynh
	for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 16:40:12 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id o5-20020a17090a3d4500b001ef76490983so921659pjf.2
        for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 23:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc;
        bh=FhPEFEWwYK1GjEk13QUfnVS9v5BMTvAnOb2FIFCnoPI=;
        b=ZKYkJK6pKzypuItKhvwysPnB2JElKhKEcxVKTRkDJQwMhXzhZDXmuyNuiPeLCVWsT/
         bmVBozgQ4WIwNVxizMqX3uQ33CA2wnd8RK7uJCOqHT198lb4ef7tV30+NW2hW6NyWbuI
         xBRiSwRAX2l2Qc8vIbtcJ3nHAk+bWQT5hNF+qAAdqk1cT8ToHoob9vfQNd9jHMRuPdUm
         Ho1A7flyokvNS0JBWkDlZjPp0+jCFDTXJRTtybkMrf8+auCQ36CE+95rnkhwEyPrzEjt
         YzVpo7LUA81gF7gP2ScSW0Om4MrlQLRL/IiQqEzqAzbwxar9+31583bEAR/H2aqeZ70Q
         G6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=FhPEFEWwYK1GjEk13QUfnVS9v5BMTvAnOb2FIFCnoPI=;
        b=by0AusfAG6rOHRl60D4uvzsH7pXVx1XY84TPRFS8jFLSqJpk6TCShCGRfoq9DYQGPA
         gKL2qza/VF06cMX3KXY1F95cYmaUUGM5cxFtWD/3YgH+r/DhrfZNR54hDLOdyKsC7bGq
         /mWmU+LTAuhKqo/nZk3g88hG9EZSpQ559U9rll/d5crjraX6MPg6noNqSgSHI7YrJqR3
         yIyzfYWf7bE2JzxUadDdvQaUq+z5nwVJ9N9lTRlTSh7tSG1T8mpnO+XTrSkziXTbAMUB
         SqstBglru6wI7mVlCy584tYsdvcVfhdBkbX3+0rOt1sZfED0/jU55rKfG4KSVptnXbsM
         +4SQ==
X-Gm-Message-State: ACgBeo1+p2YWfuuujR4ZI0zSDDzCfvmr5c0Hi1BRQ/rVAwOvcsvJReV5
	qEWFTi8KgFJsZSkOJJFMcxhwKDAW61XtVQ==
X-Google-Smtp-Source: AA6agR7wHlWjRquwDmPouO95QKVY1W7evVfVzghNPf4mJFzcB1T1FyA67lEnvLP/TX4jH1PxZUPOGA==
X-Received: by 2002:a17:902:d4c7:b0:172:9ac1:6e6 with SMTP id o7-20020a170902d4c700b001729ac106e6mr1392557plg.130.1660804810574;
        Wed, 17 Aug 2022 23:40:10 -0700 (PDT)
Received: from localhost.localdomain ([180.217.158.143])
        by smtp.gmail.com with ESMTPSA id a9-20020a170902ecc900b0016bf4428586sm553188plh.208.2022.08.17.23.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 23:40:10 -0700 (PDT)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15 v1 1/3] arm: dts: nuvoton: Add node for JTAG master controller
Date: Thu, 18 Aug 2022 14:39:49 +0800
Message-Id: <20220818063951.12629-2-yschu@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220818063951.12629-1-yschu@nuvoton.com>
References: <20220818063951.12629-1-yschu@nuvoton.com>
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
Cc: andrew@aj.id.au, yschu@nuvoton.com, joel@jms.id.au, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add node for JTAG master controller present on Nuvoton NPCM8xx SoCs

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index 1b55f5efbb80..6b1418df559b 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -226,6 +226,34 @@
 				status = "disabled";
 			};
 
+			jtm1: jtm@208000 {
+				compatible = "nuvoton,npcm845-jtm";
+				reg = <0x208000 0x1000>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&jm1_pins>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk NPCM8XX_CLK_APB5>;
+				clock-names = "clk_apb5";
+				resets = <&rstc 0x74 29>;
+				status = "disabled";
+			};
+
+			jtm2: jtm@209000 {
+				compatible = "nuvoton,npcm845-jtm";
+				reg = <0x209000 0x1000>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&jm2_pins>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk NPCM8XX_CLK_APB5>;
+				clock-names = "clk_apb5";
+				resets = <&rstc 0x74 30>;
+				status = "disabled";
+			};
+
 			timer0: timer@8000 {
 				compatible = "nuvoton,npcm845-timer";
 				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.17.1

