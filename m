Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8066A8ADBB
	for <lists+openbmc@lfdr.de>; Wed, 16 Apr 2025 03:59:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZckjJ2DhCz3cQX
	for <lists+openbmc@lfdr.de>; Wed, 16 Apr 2025 11:59:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744768753;
	cv=none; b=QZcSUtlc/A6e8LS0wVyW0fHkiRjZD0z0xSjkrZJcHTBfmvto9vcjSEP9+PfzUllQocn+S9zOP+3MCt9D2Akj0rC1I1e0DAFQNcSwXSy+gS2tkjEDrQ+khCxxnYYb1963IvrE0qCfaH08i88pTr0hNIEdQdsx4Ln/vXxPkM3V3AAMy7NpSVUNGgQ3gNFF3wMSEL2dmCAEOWWjq5UXLW1Eiea6xWPNkEirzfT8c79th/y+X8LMWKfyuzbvXHGhy/ubmqmL/WT2ddWZqaQK1WMZGBR+DPab6LMpFZjGzoQfARQ1oXe0Ezy0IoHNI6wNPvQTRosVYot1dnnXeL4AqKm0Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744768753; c=relaxed/relaxed;
	bh=e82Zj2e4FwI3zvSpsxcQPHmRy7+tI4Kl1Q4Ap45I6sg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T5S7c/tJnbtrMXL8BLgbrhEQFlg1j/e3Vr96AZKG5L6GwytW+HmHIVP3KYtOp3sq6bltu9Ku5Ld6/DoHJSLv9Pwf9n0bFVcu/bBv6/NEotrWILNgPVYHwZA3dLB90V0T4RcPWSNfctgGUnXri04Su0S+Y/CHPUB1pgbk6x59S/VFc1Jx5j5oZG1jG8z++Pk8zyiEZt2OIA9plVmV176pEyiM/n1zidYie5XRlyU8XsJpG+s50Mo+k11K87Fw2BIYltdfxZxzfLe3Gmh5ffheqww0rjaH1vGOtLdAMLBEkUQRm2qxQ4j0yHkBWRCYBKMof0tIAvHjuVjDBokJ0TsGGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com; dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=kvN/xrwy; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org) smtp.mailfrom=wkennington.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=kvN/xrwy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=wkennington.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZckjC551Pz3blT
	for <openbmc@lists.ozlabs.org>; Wed, 16 Apr 2025 11:59:10 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2264aefc45dso93004445ad.0
        for <openbmc@lists.ozlabs.org>; Tue, 15 Apr 2025 18:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1744768748; x=1745373548; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e82Zj2e4FwI3zvSpsxcQPHmRy7+tI4Kl1Q4Ap45I6sg=;
        b=kvN/xrwy39zaK9vUtGwt0QTt8e/hsA9NF8iYKiBoCOERa3dYysUs8nFHPzzqHRLnZi
         mgrCzsJCysSKDfiyti2aGdnx9LbBA+/764v2GOUxBQdqcXrSyrsVHeJBY5TNLS7Hxl09
         GrV8QNVNu+BieRe+v8Sj6eN+5U1Jxt4fvdWCQ9OqMuCHzWZzA1ojN2ZXu2fYgA98NSTE
         4hQTyCusIpKkSw+PpPuneKS6rV0meTWPiIZykM9LAF30gqAwyxQUs5AwZFJQnghn/KZm
         iACAEp7swbyXL5vW+9rdltuss81D5vJnjZVs3sAHJooILYhIiw9CO36jP/Yf9mNtm2wZ
         XApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744768748; x=1745373548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e82Zj2e4FwI3zvSpsxcQPHmRy7+tI4Kl1Q4Ap45I6sg=;
        b=gBjxgNTxBuf1FjPU+FbsIHTokEUfXv5dtC7eKpat/r8CR5CTkm3/51AsvWRjKjr3Aw
         15em7dpuQqAM0+K82gC5GqapIQ40nzyQZqc1VxFTAkNECxO3ywJdlK6Q5W0ufQh6fSP0
         3bzvu3SJkpSSaWCif7lP8Zhv05ky2mJFQKEIyWvrczDP2aVtX2XqDma1NcAXGuw3hD1f
         1I01Kkdj/dNKNuzKxpRglO3aQpWxETBSwp+todEwFvVvQFh6lO6Rai/vZNwmRbtG7nib
         4GcQNkhokF4WZ3a06c2voak0XLa0jUj8ggjx0DvIkMtOoeyJ5HDNHFTZJ3d01UIKOU2C
         +ZnA==
X-Gm-Message-State: AOJu0YyPcWLKic/dAC9wKcKajxbK08W1JOv/K7/zQfMTHprg63IhG3I1
	jL/x8m4rF43wGIfmRcTKzsyc3qjWzaKNYJvYLfZMR4ibWw8umaonsvXjH9JNPZ8=
X-Gm-Gg: ASbGncsv3iWU8+Q5isr16DRSxNHYz5jM7xLffLhSyy9VwBcMUx/qSaUqusTUPIQ+SU0
	+x/307EexTIEQTsC/vXM5ZUMInuKsfxTEC2srfEk8qCTHTJ3QHDwzCrvQUVaN9tx3YP6HzKQmE2
	prWXcQNXCOUqVcKeqs3k7wejpF2DfNuE7AccyZRstdIp6uayVaq/nqX17hS44n2jLS+gguQQRgp
	2SEgXXNxrUz1hdErHkaTsqvuuXhoOUmCer05NoMp+JeOljjYSceiywv9s719IajWjbLFgWmOvRh
	yr+qhyp/Tf8SB7FiAq4UFLiigmnoJEtbP3oFAUAcIOXQgSAULoNYRV40iUP0ruT8BWDfWg2hGVr
	zlUWtn/q07PYnVKiddO/CuUgcpHE=
X-Google-Smtp-Source: AGHT+IEbUxLXqkmN9eB9Y2TwjT0iKR4gtJC2qNjvOo3KGkymZjh0chvXTjMdxbdfvQ9cGDKgkpZyGA==
X-Received: by 2002:a17:903:2c9:b0:224:194c:6942 with SMTP id d9443c01a7336-22c35973f06mr387275ad.34.1744768748194;
        Tue, 15 Apr 2025 18:59:08 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2a00:79e0:2e5b:9:ef0:9d76:c8a5:f522])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33feb116sm2279845ad.253.2025.04.15.18.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:59:07 -0700 (PDT)
From: "William A. Kennington III" <william@wkennington.com>
To: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH] arm64: dts: nuvoton: Add pinctrl
Date: Tue, 15 Apr 2025 18:59:02 -0700
Message-ID: <20250416015902.2091251-1-william@wkennington.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, "William A. Kennington III" <william@wkennington.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is critical to support multifunction pins shared between devices as
well as generic GPIOs.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index b2595f5c146b..dd1351698e77 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -207,4 +207,69 @@ watchdog2: watchdog@a01c {
 			};
 		};
 	};
+
+	pinctrl: pinctrl@f0010000 {
+		compatible = "nuvoton,npcm845-pinctrl";
+		ranges = <0x0 0x0 0xf0010000 0x8000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		nuvoton,sysgcr = <&gcr>;
+		status = "okay";
+		gpio0: gpio@f0010000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x0 0xB0>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 0 32>;
+		};
+		gpio1: gpio@f0011000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x1000 0xB0>;
+			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 32 32>;
+		};
+		gpio2: gpio@f0012000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x2000 0xB0>;
+			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 64 32>;
+		};
+		gpio3: gpio@f0013000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x3000 0xB0>;
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 96 32>;
+		};
+		gpio4: gpio@f0014000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x4000 0xB0>;
+			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 128 32>;
+		};
+		gpio5: gpio@f0015000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x5000 0xB0>;
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 160 32>;
+		};
+		gpio6: gpio@f0016000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x6000 0xB0>;
+			interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 192 32>;
+		};
+		gpio7: gpio@f0017000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x7000 0xB0>;
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 224 32>;
+		};
+	};
 };
-- 
2.49.0.604.gff1f9ca942-goog

