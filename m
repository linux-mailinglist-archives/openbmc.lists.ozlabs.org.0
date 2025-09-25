Return-Path: <openbmc+bounces-689-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E573BA14C7
	for <lists+openbmc@lfdr.de>; Thu, 25 Sep 2025 22:06:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cXl984lbNz2yql;
	Fri, 26 Sep 2025 06:06:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758830796;
	cv=none; b=NZbaKyPBgI5WOgdtuCshxdsFaJO7I0Y0wivGjtceM1OmALE9UX40JGJyXewHHEoOifsHrnA7Tp6+ZL5aGbCjr1bAEFKF6f5gjhH+S9U3UMDoud7jhtQOgQzwbV8V0OPQwrW1tCkg+wetdcOy8rppGMPASP2LF5Q9iomdUEwS6MCgDStTjOolMvL7GVv66pqyp0KF9r4+cgkaWtJU+nXWsPj5UVtePwVkofrREb2WsMto1TdrH/TYK+b7RR7Ak/dssHkNjS5VCmUm6O6L8P3FkTii88RCe+ZG52L4QXQ5yCpqFrg0jqjjCarzACZUNX08XGW6pPuVZ5ZOtq+avajUoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758830796; c=relaxed/relaxed;
	bh=QAFYbKOCSpWWlldyOJtQlThCD39zJYVIpayPNRXRheQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dr7AIaHsrvKKVDT2PzxMuSjoXVWuv7oslpg73o067aw/LZ8QdWp6z0e5pYJxh5aj5JENaqPo3e1qTCXq+2v1b8d787QZp38A4xkukmCEsEehoaMtDXIneVXGEDmbddRfybAXmQzFORH8H4zDjkhYxRUktyb2yoKuIEmVpiWbeCbuIiOOrYACiogUVHaP+ZALhfvDOJHAhGIPEQTNaiM1s6EDo9PBtqXqO5IF3a6BjLYVesAIz89JGxXmU/QFTWrHS6XP9djUgSj91jT018+vescleu8GBsUKWF7n7MTCk5gwat76Q3aTtBtvbTDQCQhmiuyzwcPvORiWuQ9phUU5Jw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aGtgdTCv; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aGtgdTCv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cXl9728qYz2yqP
	for <openbmc@lists.ozlabs.org>; Fri, 26 Sep 2025 06:06:35 +1000 (AEST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-46b303f7469so9573295e9.1
        for <openbmc@lists.ozlabs.org>; Thu, 25 Sep 2025 13:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758830792; x=1759435592; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAFYbKOCSpWWlldyOJtQlThCD39zJYVIpayPNRXRheQ=;
        b=aGtgdTCvcYBaJjtjlevzAx9w+ID9oUPU2tAPO/YLD+fhcKKGqpBBz1P5JMUoi6iD8/
         Q+X5amOwvrz1Ehf7CcaDcbQjNzlP87KVLWBX5ABhJ2LaSjNqwPz1C50sZo2RxlTBRPpN
         Pf42+HNw3VDobMEH4/Pj4AJDND8RfLJSfstd2S1svKRGZStJsc2kwKAeobIfMAq+qNZz
         WE8BadZHcugOKLkg4B+1pfDDTfEwfnhHL9UY210tUisZp1at+SBaV9GhkBGGxddNSHxy
         Ll7HWVQzs+ZKq0KcVtFN97zJTSJfz+rGeytt3Rf8Q2m6JuEqnT4ewpxsSIc5LUcEkLhN
         0X1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758830792; x=1759435592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QAFYbKOCSpWWlldyOJtQlThCD39zJYVIpayPNRXRheQ=;
        b=t4do6L09ZFVyCoM/O9cNQkCOp8mIg5m3icaxwrQy1FiSZDVaYiuT7tVkZD27khFKX/
         M5pngNcpHNg9GOo2y2ZMKKjDiL8QwzDcfjJxDgYQc+vxFE/mcSaUp7PwDnbhva0fxqzy
         LXp+7LpTRyYveFULpYdQ3NGhIuW7BpVuI1REEusTvtV2oR+rOVZWd+mKaDCUHxK0UvOI
         zNqUCcBk6w+KDsiEXOqZziU51TcaJhgKZgzWXO4SdJxnohvOjssZEaBjAFWcyPUC5Rqf
         FanpaAMNL0kOe2OILb1NoQZ1nW5188CIXrQuDRVQTxurpPUrl3ulAULa/7CcL5H928Au
         G/jw==
X-Gm-Message-State: AOJu0YyFuKeOflBOYnVFwO1mYBRsPOSjK3Xt0bDoGPgucOAsPGCUHbck
	qnYBR4nFj4ZDYLCtKCY9XZFAZWnRl5oRFe3wvdiVbg5NqIsHP8Wubwbq
X-Gm-Gg: ASbGncsGhcq63uAQ0clHmjkfzBR5KmzKwk+1ktWcWHt+zu9ok2f+hOwxKxHp/JKu2fc
	CMZOVPO+mwKYmnCZGx70lARr+mV1UGK7G4VZ4JzrgcNm0grNLqFfAtQJFzynxApf2IIDkxSwa34
	4nOOuuyXf8omYNAkOW08kZAYEksRMA+Wj9CYM71zb7EY6y/FYHbZSoNRjF71cFEmyh521jfy8y7
	ajlUHbzM+7rgj9XCsQrJ64/fVb0xaW8MD8qH+az1cRy6FGX8SaIq7FYhBVGq9FENAQcsYexXsOI
	xacjrjPx2F/H01p7eItPR4QoT22YvQd6f+Nu29ogBS3yYOcuN8pCO/i78MYGNohqZ6GRAQGsPws
	TJJx4FZ4P7PbD0L8zS9FrKr8D69TXdE09DA==
X-Google-Smtp-Source: AGHT+IHXylFhn9UHizEh2nzghDwK4WxN/3xzMVvMOLLq2D6z7kkiJdJs7LTiV/hUeq3aaR+Brk67nQ==
X-Received: by 2002:a05:600c:3551:b0:46d:ba6d:65bb with SMTP id 5b1f17b1804b1-46e32a11b17mr52158175e9.31.1758830791663;
        Thu, 25 Sep 2025 13:06:31 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e34074983sm43901835e9.10.2025.09.25.13.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 13:06:31 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
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
Subject: [PATCH v3 1/3] arm64: dts: nuvoton: fix warning and nodes order
Date: Thu, 25 Sep 2025 23:06:23 +0300
Message-Id: <20250925200625.573902-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925200625.573902-1-tmaimon77@gmail.com>
References: <20250925200625.573902-1-tmaimon77@gmail.com>
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

Fix the warning in the gcr and timer nodes, and modify nodes order by
ascending unit address.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 35 +++++++++----------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index 24133528b8e9..a43514f624c0 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -18,7 +18,7 @@ soc {
 		ranges;
 
 		gcr: system-controller@f0800000 {
-			compatible = "nuvoton,npcm845-gcr", "syscon";
+			compatible = "nuvoton,npcm845-gcr", "syscon", "simple-mfd";
 			reg = <0x0 0xf0800000 0x0 0x1000>;
 		};
 
@@ -59,23 +59,6 @@ apb {
 			ranges = <0x0 0x0 0xf0000000 0x00300000>,
 				<0xfff00000 0x0 0xfff00000 0x00016000>;
 
-			peci: peci-controller@100000 {
-				compatible = "nuvoton,npcm845-peci";
-				reg = <0x100000 0x1000>;
-				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk NPCM8XX_CLK_APB3>;
-				cmd-timeout-ms = <1000>;
-				status = "disabled";
-			};
-
-			timer0: timer@8000 {
-				compatible = "nuvoton,npcm845-timer";
-				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x8000 0x1C>;
-				clocks = <&refclk>;
-				clock-names = "refclk";
-			};
-
 			serial0: serial@0 {
 				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
 				reg = <0x0 0x1000>;
@@ -139,6 +122,13 @@ serial6: serial@6000 {
 				status = "disabled";
 			};
 
+			timer0: timer@8000 {
+				compatible = "nuvoton,npcm845-timer";
+				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x8000 0x1C>;
+				clocks = <&refclk>;
+			};
+
 			watchdog0: watchdog@801c {
 				compatible = "nuvoton,npcm845-wdt", "nuvoton,npcm750-wdt";
 				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
@@ -165,6 +155,15 @@ watchdog2: watchdog@a01c {
 				clocks = <&refclk>;
 				syscon = <&gcr>;
 			};
+
+			peci: peci-controller@100000 {
+				compatible = "nuvoton,npcm845-peci";
+				reg = <0x100000 0x1000>;
+				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk NPCM8XX_CLK_APB3>;
+				cmd-timeout-ms = <1000>;
+				status = "disabled";
+			};
 		};
 	};
 
-- 
2.34.1


