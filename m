Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C056A80E490
	for <lists+openbmc@lfdr.de>; Tue, 12 Dec 2023 07:54:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ao3RC8mC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sq8W31qZTz30fh
	for <lists+openbmc@lfdr.de>; Tue, 12 Dec 2023 17:54:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ao3RC8mC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=jim.t90615@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sq8S94wMfz3bYc
	for <openbmc@lists.ozlabs.org>; Tue, 12 Dec 2023 17:52:25 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1d0c4d84bf6so30359325ad.1
        for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2023 22:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702363943; x=1702968743; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49MMQvIGuWmN6Zs24tkY7bheyel2kIquMFgVb7inNTI=;
        b=Ao3RC8mCIry9SGUSSHZqaFyFUbDZ5fUxLStHhgjmXFaToqKaa97DdMxDB95CbD3Or1
         p6et0DUJmKoAy55DbCucnYv0gZ/lm2NANkOOlZ0szrE8ZPvqIJj9dIuCE1sVJydvsPpO
         Ht8nk40YnsGui1Lp/5vjckH1U+1tpOjy0USWLaCQaOq+ooITlBSl2JRrgmuiqkpLQGuN
         L+B87AZeEL6n7nkz5ZCIU6Rey/gyewlrqOgG7lrkcmWyltrL+u2Qaei4niBjQy5FuNbI
         4XURf1ZUXPBo/w5MKM43DUIfsm0Et5gA4J50hdDe80ma3qMzdm/l7bksez5/fu/jDRjk
         oypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702363943; x=1702968743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49MMQvIGuWmN6Zs24tkY7bheyel2kIquMFgVb7inNTI=;
        b=L6KuMvVf8vzhBPQNPHzQPYY0oemriMQGT9Xm2VNAj2rV4r3Bq6nfAkER6kERQSsV9S
         QOn8HDvhtBb0DkUhlqaCMlOF3FP1h2rQRu8U+u+79UE9fS/N/qAKxrgu1Oy6KXf/TAcX
         fMrSBtJddiT/puyOb0YVL6hoCgqVx1wIq6qeRqVWS/dhHZJfC2xvCTPGi9K7UfkzO5jn
         CjafOxvnt4NRkiZWXO1AnQ4xK6tr0hFPGHmI1WppovUiPeDmd1a9z00q1r9AO4qeSbvV
         x5Y6A8VRiHR6kPQaRNwIY2ieQ9l3TOaThV3jlohwBZOtwWjKI4Y5ZaPFgIYkpwzXkmmo
         lnyA==
X-Gm-Message-State: AOJu0Yxd/qy/0eoTqDKdBGPjVUJmZMH0R/UaAsa8N5geIwuibHbNxmX/
	g/FMc/y8LZABIJGgwJ6xBVw=
X-Google-Smtp-Source: AGHT+IGYRrFjXla6CjqcDaj8aTMVVG8a7UoxmQ6AhBp32HQuaMsd5k2P5Hd8cz8Yz0Slu7jOwxhTVg==
X-Received: by 2002:a17:902:db0c:b0:1d0:69d9:f391 with SMTP id m12-20020a170902db0c00b001d069d9f391mr3161808plx.40.1702363942681;
        Mon, 11 Dec 2023 22:52:22 -0800 (PST)
Received: from localhost.localdomain ([1.200.151.130])
        by smtp.gmail.com with ESMTPSA id z3-20020a170903018300b001d0c4869725sm7855221plg.97.2023.12.11.22.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 22:52:22 -0800 (PST)
From: Jim Liu <jim.t90615@gmail.com>
To: jim.t90615@gmail.com,
	JJLIU0@nuvoton.com,
	KWLIU@nuvoton.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	andy@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Subject: [PATCH v9 2/3] arm: dts: nuvoton: npcm: Add sgpio feature
Date: Tue, 12 Dec 2023 14:51:46 +0800
Message-Id: <20231212065147.3475413-3-jim.t90615@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212065147.3475413-1-jim.t90615@gmail.com>
References: <20231212065147.3475413-1-jim.t90615@gmail.com>
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
Changes for v9:
   - no changed
Changes for v8:
   - no changed
Changes for v7:
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

