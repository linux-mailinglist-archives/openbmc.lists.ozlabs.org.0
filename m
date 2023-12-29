Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB7D81FDDE
	for <lists+openbmc@lfdr.de>; Fri, 29 Dec 2023 08:47:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kYsDZ5J0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T1ctF6XYqz3cRk
	for <lists+openbmc@lfdr.de>; Fri, 29 Dec 2023 18:47:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kYsDZ5J0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com; envelope-from=jim.t90615@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T1cqk0bJBz3bcJ
	for <openbmc@lists.ozlabs.org>; Fri, 29 Dec 2023 18:45:37 +1100 (AEDT)
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6dbaf9b1674so3969158a34.2
        for <openbmc@lists.ozlabs.org>; Thu, 28 Dec 2023 23:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703835935; x=1704440735; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=raM42T0EIL2NcFESOuJEj10hSihrJvgpKQH+cdOXtTI=;
        b=kYsDZ5J05PqmE3eVu0JabMvjl4GHqSr7P4a0hC6znz3tNZcarZZyJvCPnBlXawG8vA
         E3oSMS+dK/ZGpP8r/v0nduC51PEF+HzbqDSSwL9K1o7NqW2/leXqDVL/Bvx7o7GZSS+H
         vXVpX0OA8X8Qo4K9bY/wM3UEEhJoyiaoZC5Uvn7y+Ga4Xd1rYot0oVecJGK0c3JT6v4G
         XVKcmMTN6VxZ6JLdf/j82w5niC96HwDJrRqbtVWXO6INmz/K15mtz9TUmZUADc1/pGhy
         Ky6w9J7XlLf7jU6TeZXfX3QlAt1h7tWhBjbiUwORE+uQopFbvoYKZpme8iMdE24ITiDJ
         CeHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703835935; x=1704440735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=raM42T0EIL2NcFESOuJEj10hSihrJvgpKQH+cdOXtTI=;
        b=uYISGUrNN4zgd52DhaW5NIYI4OYMhD73cGfsK1p2OmNgWwXeXGmJn17B1n0OzQXiip
         4rWHcRWc4Jp3EYo66km+iEmLj3Pf4iTxOtWUU0bJjizj5Us/PmgGY/B8QBs/ieEMaMm2
         fWhRBq4khtiximejGuuGUv6DhZarMTgu8dxgd0hXeJmDfmZ110BRniaoiGKLPXqSuEXD
         c119SY9kRllShJIaAQw1qPMb4Z0lbfskQYCvD3Qy5XiT/wPUWxpUngkJoitm0qyb+CUA
         khhwjGnvHuznDV2aoZrq/ttie/R18PmWQfzSA3Za4RZgKMbsHZDUrC+wBEOWawiPXZVe
         rbSQ==
X-Gm-Message-State: AOJu0YyvAeE5cd7j8GfIYSjovOWjIQO0YESz7xIK4NUp7YjT3vTf8d3D
	fkwXaZIRn9efl1luvvXAyh4zP3xTbDg=
X-Google-Smtp-Source: AGHT+IHVacEjDYDHAf1Is5qnuiqwZwRsVxajivxiR3T1XLsZA5D4sijpp84TGkK8RWO6nbh5MDsz7w==
X-Received: by 2002:a9d:6e8b:0:b0:6db:af74:dacb with SMTP id a11-20020a9d6e8b000000b006dbaf74dacbmr7602885otr.67.1703835935085;
        Thu, 28 Dec 2023 23:45:35 -0800 (PST)
Received: from localhost.localdomain ([1.200.140.173])
        by smtp.gmail.com with ESMTPSA id s188-20020a6377c5000000b005c683937cc5sm10305186pgc.44.2023.12.28.23.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 23:45:34 -0800 (PST)
From: jim.t90615@gmail.com
X-Google-Original-From: JJLIU0@nuvoton.com
To: JJLIU0@nuvoton.com,
	KWLIU@nuvoton.com,
	jim.t90615@gmail.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	andy@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Subject: [PATCH v10 2/3] arm: dts: nuvoton: npcm: Add sgpio feature
Date: Fri, 29 Dec 2023 15:45:07 +0800
Message-Id: <20231229074508.2709093-3-JJLIU0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231229074508.2709093-1-JJLIU0@nuvoton.com>
References: <20231229074508.2709093-1-JJLIU0@nuvoton.com>
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

From: Jim Liu <jim.t90615@gmail.com>

Add the SGPIO controller to the NPCM7xx devicetree

Signed-off-by: Jim Liu <jim.t90615@gmail.com>
---
Changes for v10:
   - no changed
Changes for v9:
   - no changed
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

