Return-Path: <openbmc+bounces-451-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C59ADB25F47
	for <lists+openbmc@lfdr.de>; Thu, 14 Aug 2025 10:43:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2dz96hCpz2yhD;
	Thu, 14 Aug 2025 18:42:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755160949;
	cv=none; b=b8oQaNNVNigIUIZ/pln3cAyU4kMuavpRbP5zIP9pcyrI+FgIiq8XjTwRQRyM9A8utgwcybreIDjt/t3lLX+RRPlsiBYel4tPXOHLddixMeAJA8TU3sNaj8OzGJdw2eOMVOgDiGAKhZhIupS7RPUBGH/rAlMPtBEJvosH+XTzQCbw5Ss63g7H5ZQ227Y8gVSElFXS23X/6PevfnIIcKE8WKHb6aP9nR2mB2BL6tuB8lFnbq0rnOHzPH8ALq3Nn2jcd0droIyd/65mapN9ADdmI+FDogYN0Rr4MO10tBjTsyS4zdX4unV7Svx0p28csCXhI4MeGohOfYI1obBOtuhYpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755160949; c=relaxed/relaxed;
	bh=qcztVxGVnrCnJstyxMe9QKMd8mGJlLFli+mnzkxgSgo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GtIodF19QhjpSCI7NkOcSv96tRyDpU06fKJhzjlg9I0uKIUjzgDLeoCmt6tM185kAe1uX89SMlD+uTm5ifDzJhlmSU5JYWn2NHvrxUOw+U4PCbV8bG1OnAJapaCPdFXx3zjPATCCxlTsN9+7dSMTImLJNCaugtw6CaDHxGfKsjhCv5/oEL2wmQT3bIGsMVnZJYSPRqp6K86asacuw9q4CmZOZXkjZ+fLKfgZDr7JdHKYJz3Gv+52BTT3zZBLYKAo4IdzCgVEQ7Z5kKE0vlblJEtIY8rd1NfQkMUcSj5Ohe81cfo5rq6UlQmrkmfOZnc1B61tYtcvZGyBH5vaSh2xew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Pj2l7rvY; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Pj2l7rvY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2dz91Lhfz3bkT
	for <openbmc@lists.ozlabs.org>; Thu, 14 Aug 2025 18:42:29 +1000 (AEST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3b9e413a219so454402f8f.3
        for <openbmc@lists.ozlabs.org>; Thu, 14 Aug 2025 01:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755160946; x=1755765746; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcztVxGVnrCnJstyxMe9QKMd8mGJlLFli+mnzkxgSgo=;
        b=Pj2l7rvYhIm0JowmAG28J03vspMYXRRYfKAsEKmTLAgqGDpe5yj4BGiUAq2FGdMXax
         UhgkRFdtNozi0i6i3kcLCQ8Df1hfQKdledUwFNFueoTySgZlP5pdo5vHrnW8GuSdCPW5
         Qr9eQ3fxUdGUJ6jI2LZ+CpixvbNYCwRhc9oLhqKfcFMxEZRQMHmMj9q77cWW2OJyV8cE
         eoZuAyUMI7g2XcPRx4NYs5emv299kQMRz92w+9HPFcDCrrfTgBWZZT7bNJurXF3zSmBw
         wzo258NhVIFXgwSSRIWmnF3/5oJITfjtvGhr91JSuq0SAMQNQZwDELO7izJYKUjrpKPe
         ZzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755160946; x=1755765746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcztVxGVnrCnJstyxMe9QKMd8mGJlLFli+mnzkxgSgo=;
        b=cr/uABf/TpPT/2cBluA/dAs73RMYLIcy8NjmW7imcoD9gHSGtQ+4qN7dZcXpqqxqHp
         Zu5HKULGwsy0HUeRTqgB90cytA+LaV0A4/FzH6TBWdLFOS1cI+IX5g3v4Dk10RYuyM+G
         W4h3vMaNpkcXl50H3I1OaWrr2ROylYY6VrphsRbsA/9X94rZrzrqndnzLRNZaOUbz3zu
         GMDk76bPSg6bPghEYFqwjDqNZ8p253zLMamWUnPPYgnzwwyylroAE/VIQp2B4mqoK/NG
         f/y+GLgsaU+2Mprmc4g22+HWiFvNb7GtPp/yyV/r+hc/nFHuG96PUnD7+yRISYU315bA
         nJfA==
X-Gm-Message-State: AOJu0Yzjvmy5Q/Wr5VSzhLaBcSMiosethzYEBrBz1AHGiAngFT9hM8qK
	aX6C2VorvCZrSQAWFIn89kL8BqeMINJsiSK6PnfSEk7T2c1axuhkQhhE
X-Gm-Gg: ASbGncveJgvk4Tt5CuBFcHIiONjRalviTcg0J8AzYGL3uw7LYDqqXCrLbTuTOFyAntS
	FgVdbOpWh8e4pZOr0YyYHwlL7NBMw+i+kvyXf81BJ7SdSbnDIn7AH8/qIubZaUG6fvzxlxMm7Cy
	FEnIBzGjLJ4sfyY98I2YK46z5E/EoZ7u/3z9ZhDVCEFosDhWzlazvDCaHbJMoG4yQxAPhcO2bEM
	KnK17/qHBFEs0ZVN/IHrartKvqQzmVebpDHiXyH0BSkTGDFIwjB5GpgpQ4Ahi8ER6B/n+NL6Ebj
	NIRvT9ztjdPkr7JGAZDed8u8v3HfyPEnpgNHtrDz1eWNy8t+U2HHL7ktS1BiDd9SIgTPEy0ft+A
	AbqhPhPEbnfpDsV8msbNpdBxPr9/12WqBKQ==
X-Google-Smtp-Source: AGHT+IGNGAaqjdrkR5ie7BopjeIbjP2Ysg5xIk245PoOvFZ/Zh/gK1jESvIEVcJ1jKZ9Cs2PCEoSNg==
X-Received: by 2002:a05:6000:2381:b0:3b7:9546:a0e8 with SMTP id ffacd0b85a97d-3b9edf648eemr1801871f8f.41.1755160945741;
        Thu, 14 Aug 2025 01:42:25 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6e336csm13114565e9.16.2025.08.14.01.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 01:42:25 -0700 (PDT)
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
Subject: [PATCH v2 1/2] arm64: dts: nuvoton: combine NPCM845 reset and clk nodes
Date: Thu, 14 Aug 2025 11:42:17 +0300
Message-Id: <20250814084218.1171386-2-tmaimon77@gmail.com>
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

Combine the NPCM845 reset and clock controller nodes into a single node
with compatible "nuvoton,npcm845-reset" in nuvoton-common-npcm8xx.dtsi,
using the auxiliary device framework to provide clock functionality.

Update the register range to 0xC4 to cover the shared reset and clock
registers at 0xf0801000.

Remove the separate nuvoton,npcm845-clk node, as the reset driver now
handles clocks via an auxiliary device.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi      | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index acd3137d2464..e4053ffefe90 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -42,17 +42,12 @@ ahb {
 		interrupt-parent = <&gic>;
 		ranges;
 
-		rstc: reset-controller@f0801000 {
+		clk: rstc: reset-controller@f0801000 {
 			compatible = "nuvoton,npcm845-reset";
-			reg = <0x0 0xf0801000 0x0 0x78>;
-			#reset-cells = <2>;
+			reg = <0x0 0xf0801000 0x0 0xC4>;
 			nuvoton,sysgcr = <&gcr>;
-		};
-
-		clk: clock-controller@f0801000 {
-			compatible = "nuvoton,npcm845-clk";
+			#reset-cells = <2>;
 			#clock-cells = <1>;
-			reg = <0x0 0xf0801000 0x0 0x1000>;
 		};
 
 		apb {
-- 
2.34.1


