Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3200F806461
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 02:48:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=I2h6d9Ph;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlL0N50tpz3cW8
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 12:48:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=I2h6d9Ph;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=jim.t90615@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlKxw08PJz3cW7
	for <openbmc@lists.ozlabs.org>; Wed,  6 Dec 2023 12:46:27 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6cdea2f5918so4459963b3a.2
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 17:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701827185; x=1702431985; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cnQl6rrS5sD2qm7iZDbkr4tzTgzBdd00wWO4ndD9wA=;
        b=I2h6d9PhfSW3hIX5eqjeWyvANHWRSj3ZAQKJaKNl3Il4xOvEKF44mgHAMvwEc8i1LA
         pkEfYzTeazg2YYAvifmWWBx9RHHqyjD/iIahs+S1THkYWJ5hZTGHsZnj/vUfhcnuTmoA
         1xpY6cVqgYgJlHLo4MZ8lqMmvTxH4t8y5KiGtAMNRFce49xarDV3mhyquaoJWtT5O2en
         MY07xFiYhHEe9xiqA8BSOTx8O3DQxA1StVWRinMKsUxrFgVfEgCKLNetg0xobo8sZ3qW
         CZsL2gO07PNWYREIxeFFW0ePbqmSV6omsFi9XdnDP7JGcCqhZ/XeWdHrZf5fBiFVc1MB
         MvBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701827185; x=1702431985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6cnQl6rrS5sD2qm7iZDbkr4tzTgzBdd00wWO4ndD9wA=;
        b=CHSPejXrAtaAkvOOn/ceOjV9cJGbS18wfQfxWiWfQe+TcLjx93adnWS3vfR++FbcGx
         LtI+xyYgYElJhT+fiybGUWOcL/5la4yoECQ4yJFlC8SYjvO7QE53yHhb7RQSMc9AoU1f
         SYyE5VJXN18M9JEJ/dYwmKVXzewvqGsLk4AnuJJsUGPiiSdfUZx4eSGQOAUIEQ0ZU8pe
         eAMSRsh4Qxub2+3tBk9AeWTnU1EeMOhpL+yQI3qQE1DlzGgNlgMA4n6KtLezhy8x6Y4Q
         BZEyu6Yu1Xs+Cjl7Tb+dAQDXGrjt6DIcDPlCQiUmv+nMPBq2ofkg/q0XT+fHwLfOAMaW
         kDbA==
X-Gm-Message-State: AOJu0Yx6BqHAx0cvsRtvooxErImV9x+VmgKPv1qfF9TFi3ToBDZgStGP
	pFHDY+k1gdP0l4Q/2psyjPM=
X-Google-Smtp-Source: AGHT+IFqZIF0L0TdIRuIyFI+gFrBEpQshPZzrdrVeAEPVN7bKujNKkDJbF0q2wFqRT0+BZ2BX5T3tQ==
X-Received: by 2002:a05:6a00:22cc:b0:6ce:5b63:3017 with SMTP id f12-20020a056a0022cc00b006ce5b633017mr63296pfj.53.1701827185024;
        Tue, 05 Dec 2023 17:46:25 -0800 (PST)
Received: from localhost.localdomain ([112.78.94.69])
        by smtp.gmail.com with ESMTPSA id g24-20020aa78758000000b006ce781f6f85sm1250956pfo.43.2023.12.05.17.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 17:46:24 -0800 (PST)
From: Jim Liu <jim.t90615@gmail.com>
To: JJLIU0@nuvoton.com,
	krzysztof.kozlowski+dt@linaro.org,
	linus.walleij@linaro.org,
	andy@kernel.org,
	robh+dt@kernel.org,
	conor+dt@kernel.org,
	KWLIU@nuvoton.com,
	jim.t90615@gmail.com
Subject: [PATCH v8 2/3] arm: dts: nuvoton: npcm: Add sgpio feature
Date: Wed,  6 Dec 2023 09:45:29 +0800
Message-Id: <20231206014530.1600151-3-jim.t90615@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206014530.1600151-1-jim.t90615@gmail.com>
References: <20231206014530.1600151-1-jim.t90615@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Changes for v8:
   - no changed
Changes for v7:
   - no changed
Changes for v6:
   - remove bus-frequency
   - check with dtbs_check

---
 .../dts/nuvoton/nuvoton-common-npcm7xx.dtsi   | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index 868454ae6bde..df91517a4842 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -372,6 +372,30 @@ &fanin12_pins &fanin13_pins
 				status = "disabled";
 			};
 
+			gpio8: gpio@101000 {
+				compatible = "nuvoton,npcm750-sgpio";
+				reg = <0x101000 0x200>;
+				clocks = <&clk NPCM7XX_CLK_APB3>;
+				interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				nuvoton,input-ngpios = <64>;
+				nuvoton,output-ngpios = <64>;
+				status = "disabled";
+			};
+
+			gpio9: gpio@102000 {
+				compatible = "nuvoton,npcm750-sgpio";
+				reg = <0x102000 0x200>;
+				clocks = <&clk NPCM7XX_CLK_APB3>;
+				interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				nuvoton,input-ngpios = <64>;
+				nuvoton,output-ngpios = <64>;
+				status = "disabled";
+			};
+
 			i2c0: i2c@80000 {
 				reg = <0x80000 0x1000>;
 				compatible = "nuvoton,npcm750-i2c";
-- 
2.25.1

